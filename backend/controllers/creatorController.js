const db = require('../config/db');

exports.getSummary = async (req, res) => {
  try {
    const creatorId = req.user.id;
    const { rows: services } = await db.query('SELECT id FROM services WHERE creator_id = $1', [creatorId]);
    const serviceIds = services.map(s => s.id);
    
    if (serviceIds.length === 0) {
      return res.json({ total_services: 0, total_bookings: 0, total_revenue: 0 });
    }
    
    const { rows: bookings } = await db.query('SELECT COUNT(*) as total FROM bookings WHERE service_id = ANY($1)', [serviceIds]);
    const { rows: revenue } = await db.query("SELECT COALESCE(SUM(total_price), 0) as total FROM bookings WHERE service_id = ANY($1) AND status != 'CANCELLED'", [serviceIds]);
    
    res.json({
      total_services: services.length,
      total_bookings: parseInt(bookings[0].total),
      total_revenue: parseFloat(revenue[0].total)
    });
  } catch (error) {
    console.error('Creator summary error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getServices = async (req, res) => {
  try {
    const creatorId = req.user.id;
    const query = `
      SELECT s.*, 
        COALESCE(h.location, p.location) AS location,
        COALESCE(f.from_place, t.from_place) AS from_place,
        COALESCE(f.to_place, t.to_place) AS to_place
      FROM services s
      LEFT JOIN hotels h ON s.id = h.service_id AND s.type = 'hotel'
      LEFT JOIN packages p ON s.id = p.service_id AND s.type = 'package'
      LEFT JOIN flights f ON s.id = f.service_id AND s.type = 'flight'
      LEFT JOIN trains t ON s.id = t.service_id AND s.type = 'train'
      WHERE s.creator_id = $1
    `;
    const { rows: services } = await db.query(query, [creatorId]);
    res.json(services);
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getBookings = async (req, res) => {
  try {
    const creatorId = req.user.id;
    const query = `
      SELECT b.*, u.name as user_name, u.email, s.title as service_title
      FROM bookings b
      JOIN users u ON b.user_id = u.id
      JOIN services s ON b.service_id = s.id
      WHERE s.creator_id = $1
      ORDER BY b.id DESC
    `;
    const { rows: bookings } = await db.query(query, [creatorId]);
    res.json(bookings);
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};
