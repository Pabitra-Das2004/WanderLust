const db = require('../config/db');

exports.getUsers = async (req, res) => {
  try {
    const { rows: users } = await db.query('SELECT id, name, email, role, created_at FROM users');
    res.json(users);
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.deleteUser = async (req, res) => {
  try {
    await db.query('DELETE FROM users WHERE id = $1', [req.params.id]);
    res.json({ message: 'User deleted' });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.createService = async (req, res) => {
  const { title, type, location, price, description, image, availability } = req.body;
  try {
    await db.query(
      'INSERT INTO services (title, type, location, price, description, image, availability) VALUES ($1, $2, $3, $4, $5, $6, $7) RETURNING *',
      [title, type.toLowerCase(), location, price, description, image, availability !== undefined ? availability : true]
    );
    res.status(201).json({ message: 'Service created successfully' });
  } catch (error) {
    console.log(error);
    
    res.status(500).json({ message: 'Server error' });
  }
};

exports.updateService = async (req, res) => {
  const { title, type, location, price, description, image, availability } = req.body;
  try {
    await db.query(
      'UPDATE services SET title=$1, type=$2, location=$3, price=$4, description=$5, image=$6, availability=$7 WHERE id=$8',
      [title, type, location, price, description, image, availability, req.params.id]
    );
    res.json({ message: 'Service updated successfully' });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.deleteService = async (req, res) => {
  try {
    await db.query('DELETE FROM services WHERE id = $1', [req.params.id]);
    res.json({ message: 'Service deleted' });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getReports = async (req, res) => {
  try {
    const { rows: userRows } = await db.query('SELECT COUNT(*) as "totalUsers" FROM users');
    const { rows: bookingRows } = await db.query('SELECT COUNT(*) as "totalBookings" FROM bookings');
    const { rows: revenueRows } = await db.query("SELECT COALESCE(SUM(amount), 0) as \"totalRevenue\" FROM payments WHERE status = 'SUCCESS'");
    
    res.json({ totalUsers: userRows[0].totalUsers, totalBookings: bookingRows[0].totalBookings, totalRevenue: revenueRows[0].totalRevenue });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getServices = async (req, res) => {
  try {
    const { rows: services } = await db.query(`
      SELECT s.*, 
      COALESCE(h.location, p.location, f.from_place || ' to ' || f.to_place, t.from_place || ' to ' || t.to_place) as location
      FROM services s
      LEFT JOIN hotels h ON s.id = h.service_id
      LEFT JOIN packages p ON s.id = p.service_id
      LEFT JOIN flights f ON s.id = f.service_id
      LEFT JOIN trains t ON s.id = t.service_id
    `);
    res.json(services);
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getBookings = async (req, res) => {
  try {
    const { rows: bookings } = await db.query(`
      SELECT 
        b.*, 
        u.name AS user_name, 
        u.email, 
        s.title AS service_title 
      FROM bookings b
      JOIN users u ON b.user_id = u.id
      JOIN services s ON b.service_id = s.id
    `);
    res.json(bookings);
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getPayments = async (req, res) => {
  try {
    const { rows: payments } = await db.query('SELECT * FROM payments');
    res.json(payments);
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getSummary = async (req, res) => {
  try {
    const { rows: userRows } = await db.query('SELECT COUNT(*) as "total_users" FROM users');
    const { rows: serviceRows } = await db.query('SELECT COUNT(*) as "total_services" FROM services');
    const { rows: bookingRows } = await db.query('SELECT COUNT(*) as "total_bookings" FROM bookings');
    const { rows: revenueRows } = await db.query("SELECT COALESCE(SUM(amount), 0) as \"total_revenue\" FROM payments WHERE status = 'SUCCESS'");
    
    res.json({
      total_users: parseInt(userRows[0].total_users),
      total_services: parseInt(serviceRows[0].total_services),
      total_bookings: parseInt(bookingRows[0].total_bookings),
      total_revenue: parseFloat(revenueRows[0].total_revenue)
    });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};
