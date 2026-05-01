const db = require('../config/db');

exports.createBooking = async (req, res) => {
  const { service_id, date, travelers, total_price, start_date, end_date, from_place, to_place, travel_date } = req.body;
  try {
    // Backend validation
    const today = new Date();
    today.setHours(0, 0, 0, 0);

    if (end_date && start_date && new Date(end_date) < new Date(start_date)) {
      return res.status(400).json({ message: 'End date must be after start date' });
    }

    
    const { rows: result } = await db.query(
      'INSERT INTO bookings (user_id, service_id, booking_date, start_date, end_date, from_place, to_place, travel_date, travelers, total_price, status) VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9, $10, $11) RETURNING *',
      [req.user.id, service_id, date, start_date || null, end_date || null, from_place || null, to_place || null, travel_date || null, travelers, total_price, 'PENDING']
    );
    res.status(201).json({ id: result[0].id, message: 'Booking created successfully', status: 'PENDING' });
  } catch (error) {
    console.error('Create booking error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getUserBookings = async (req, res) => {
  try {
    const { rows: bookings } = await db.query(
      `SELECT b.*, s.title, s.type, s.image,
       COALESCE(h.location, p.location, f.from_place || ' to ' || f.to_place, t.from_place || ' to ' || t.to_place) as location
       FROM bookings b 
       JOIN services s ON b.service_id = s.id 
       LEFT JOIN hotels h ON s.id = h.service_id
       LEFT JOIN packages p ON s.id = p.service_id
       LEFT JOIN flights f ON s.id = f.service_id
       LEFT JOIN trains t ON s.id = t.service_id
       WHERE b.user_id = $1
       ORDER BY b.booking_date DESC`,
      [req.user.id]
    );

    res.json(bookings);
  } catch (error) {
    console.error('getUserBookings error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};

exports.cancelBooking = async (req, res) => {
  try {
    const { rows: booking } = await db.query('SELECT * FROM bookings WHERE id = $1 AND user_id = $2', [req.params.id, req.user.id]);
    if (booking.length === 0) {
      return res.status(404).json({ message: 'Booking not found or unauthorized' });
    }
    
    await db.query('UPDATE bookings SET status = $1 WHERE id = $2', ['CANCELLED', req.params.id]);
    res.json({ message: 'Booking cancelled successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};


