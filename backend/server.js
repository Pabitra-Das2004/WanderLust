const express = require('express');
const cors = require('cors');
const dotenv = require('dotenv');

dotenv.config();

const app = express();
const db = require('./config/db');

// Initialize database tables/columns and default admin user
const initAdmin = async () => {
  try {
    // Ensure razorpay_order_id column exists
    try {
      await db.query('ALTER TABLE bookings ADD COLUMN razorpay_order_id VARCHAR(255)');
      console.log('Added razorpay_order_id column to bookings.');
    } catch (e) {
      // Column might already exist, ignore error
    }

    const { rows } = await db.query('SELECT * FROM users WHERE email = $1', ['das@gmail.com']);
    if (rows.length === 0) {
      // Password hashing disabled for demo purposes only
      await db.query(
        "INSERT INTO users (name, email, password, role) VALUES ($1, $2, $3, 'admin')",
        ['Admin', 'das@gmail.com', 'das@admin1234']
      );
      console.log('Default admin user created.');
    }
  } catch (err) {
    console.error('Error in initAdmin:', err);
  }
};
initAdmin();


app.use(cors({ origin: process.env.CLIENT_URL || 'http://localhost:5173', credentials: true }));
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Route files
const authRoutes = require('./routes/authRoutes');
const serviceRoutes = require('./routes/serviceRoutes');
const bookingRoutes = require('./routes/bookingRoutes');
const paymentRoutes = require('./routes/paymentRoutes');
const adminRoutes = require('./routes/adminRoutes');
const creatorRoutes = require('./routes/creatorRoutes');

// Mount routes
app.use('/api/auth', authRoutes);
app.use('/api/services', serviceRoutes);
app.use('/api/bookings', bookingRoutes);
app.use('/api/payment', paymentRoutes);
app.use('/api/admin', adminRoutes);
app.use('/api/creator', creatorRoutes);

app.get('/', (req, res) => {
  res.send('Wanderlust Escapes API is running');
});

const PORT = process.env.PORT || 5000;
app.listen(PORT, () => {
  console.log(`Server running on port ${PORT}`);
});
