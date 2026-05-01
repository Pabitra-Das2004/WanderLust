const Razorpay = require('razorpay');
const crypto = require('crypto');
const db = require('../config/db');

const razorpay = new Razorpay({
  key_id: process.env.RAZORPAY_KEY_ID || 'test',
  key_secret: process.env.RAZORPAY_KEY_SECRET || 'test'
});

exports.createOrder = async (req, res) => {
  const { booking_id } = req.body;
  try {
    const bookingResult = await db.query('SELECT total_price FROM bookings WHERE id = $1', [booking_id]);
    if (bookingResult.rows.length === 0) {
      return res.status(404).json({ message: 'Booking not found' });
    }
    const amount = bookingResult.rows[0].total_price;

    const options = {
      amount: Math.round(amount * 100), // amount in smallest currency unit
      currency: "INR",
      receipt: `receipt_order_${booking_id}`
    };
    const order = await razorpay.orders.create(options);
    
    // Store razorpay_order_id in bookings table
    await db.query('UPDATE bookings SET razorpay_order_id = $1 WHERE id = $2', [order.id, booking_id]);

    res.json(order);
  } catch (error) {
    res.status(500).json({ message: 'Payment error' });
  }
};

exports.verifyPayment = async (req, res) => {
  const { razorpay_order_id, razorpay_payment_id, razorpay_signature, booking_id, amount } = req.body;
  try {
    // Skip Razorpay signature verification for demo purposes
    await db.query('UPDATE bookings SET status = $1 WHERE id = $2', ['CONFIRMED', booking_id]);
    
    const finalPaymentId = razorpay_payment_id || `demo_upi_${Date.now()}`;
    
    await db.query(
      'INSERT INTO payments (booking_id, payment_id, amount, status) VALUES ($1, $2, $3, $4) RETURNING *',
      [booking_id, finalPaymentId, amount, 'SUCCESS']
    );
    return res.status(200).json({ message: "Payment verified successfully (Demo)" });
  } catch (error) {
    console.error("Verify payment error", error);
    res.status(500).json({ message: 'Server error' });
  }
};

exports.paymentCallback = async (req, res) => {
  const { razorpay_payment_id, razorpay_order_id, razorpay_signature } = req.body;

  try {
    // Payment verification is skipped for demo purposes. In production, Razorpay signature must be verified.

    const bookingResult = await db.query('SELECT * FROM bookings WHERE razorpay_order_id = $1', [razorpay_order_id]);
    
    if (bookingResult.rows.length === 0) {
      return res.status(400).json({ message: "Booking not found for order" });
    }

    const booking = bookingResult.rows[0];

    // Update booking status
    await db.query("UPDATE bookings SET status = 'CONFIRMED' WHERE id = $1", [booking.id]);
    
    // Insert payment
    await db.query(
      'INSERT INTO payments (booking_id, payment_id, amount, status) VALUES ($1, $2, $3, $4)',
      [booking.id, razorpay_payment_id || `demo_upi_${Date.now()}`, booking.total_price, 'SUCCESS']
    );

    // Redirect to frontend success page
    res.redirect("http://localhost:5173/payment-success");
  } catch (error) {
    console.error("Callback error", error);
    res.status(500).send("Server error during callback");
  }
};

exports.demoUpiSuccess = async (req, res) => {
  const { booking_id, amount } = req.body;
  try {
    const payment_id = 'demo_upi_' + Date.now();
    
    // Update booking status
    await db.query("UPDATE bookings SET status = 'CONFIRMED' WHERE id = $1", [booking_id]);
    
    // Insert payment
    await db.query(
      'INSERT INTO payments (booking_id, payment_id, amount, status) VALUES ($1, $2, $3, $4)',
      [booking_id, payment_id, amount || 0, 'SUCCESS']
    );

    res.status(200).json({ message: 'Demo UPI payment successful', payment_id });
  } catch (error) {
    console.error("Demo UPI Error", error);
    res.status(500).json({ message: 'Server error' });
  }
};
