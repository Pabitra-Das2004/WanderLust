const db = require('../config/db');

exports.createService = async (req, res) => {
  const { title, type, price, description, image, from_place, to_place, travel_date, location, start_date, end_date } = req.body;
  const creator_id = req.user.id;

  try {
    await db.query('BEGIN');
    
    const { rows: serviceRows } = await db.query(
      'INSERT INTO services (title, type, creator_id, price, description, image) VALUES ($1, $2, $3, $4, $5, $6) RETURNING id',
      [title, type, creator_id, price, description, image]
    );
    const serviceId = serviceRows[0].id;

    if (type === 'flight') {
      await db.query('INSERT INTO flights (service_id, from_place, to_place, travel_date) VALUES ($1, $2, $3, $4)', [serviceId, from_place, to_place, travel_date]);
    } else if (type === 'train') {
      await db.query('INSERT INTO trains (service_id, from_place, to_place, travel_date) VALUES ($1, $2, $3, $4)', [serviceId, from_place, to_place, travel_date]);
    } else if (type === 'hotel') {
      await db.query('INSERT INTO hotels (service_id, location, start_date, end_date) VALUES ($1, $2, $3, $4)', [serviceId, location, start_date, end_date]);
    } else if (type === 'package') {
      await db.query('INSERT INTO packages (service_id, location, start_date, end_date) VALUES ($1, $2, $3, $4)', [serviceId, location, start_date, end_date]);
    }

    await db.query('COMMIT');
    res.status(201).json({ message: 'Service created successfully', id: serviceId });
  } catch (error) {
    await db.query('ROLLBACK');
    console.error('Service creation error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getServices = async (req, res) => {
  const { type, search } = req.query;
  try {
    let query = `
      SELECT s.*, 
        COALESCE(h.location, p.location) AS location,
        COALESCE(h.start_date, p.start_date) AS start_date,
        COALESCE(h.end_date, p.end_date) AS end_date,
        COALESCE(f.from_place, t.from_place) AS from_place,
        COALESCE(f.to_place, t.to_place) AS to_place,
        COALESCE(f.travel_date, t.travel_date) AS travel_date
      FROM services s
      LEFT JOIN hotels h ON s.id = h.service_id AND s.type = 'hotel'
      LEFT JOIN packages p ON s.id = p.service_id AND s.type = 'package'
      LEFT JOIN flights f ON s.id = f.service_id AND s.type = 'flight'
      LEFT JOIN trains t ON s.id = t.service_id AND s.type = 'train'
      WHERE 1=1
    `;
    const params = [];
    let paramIndex = 1;

    if (type && type !== 'all' && type !== '') {
      query += ` AND s.type = $${paramIndex}`;
      params.push(type);
      paramIndex++;
    }

    if (search && search.trim() !== '') {
      query += ` AND (
        s.title ILIKE $${paramIndex}
        OR h.location ILIKE $${paramIndex}
        OR p.location ILIKE $${paramIndex}
        OR f.from_place ILIKE $${paramIndex}
        OR f.to_place ILIKE $${paramIndex}
        OR t.from_place ILIKE $${paramIndex}
        OR t.to_place ILIKE $${paramIndex}
      )`;
      params.push(`%${search.trim()}%`);
      paramIndex++;
    }

    const { rows: services } = await db.query(query, params);
    res.json(services);
  } catch (error) {
    console.error('Service fetch error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getServiceById = async (req, res) => {
  try {
    const { rows: serviceRows } = await db.query('SELECT * FROM services WHERE id = $1', [req.params.id]);
    if (serviceRows.length === 0) {
      return res.status(404).json({ message: 'Service not found' });
    }
    const service = serviceRows[0];
    
    let specificRows = [];
    if (service.type === 'flight') {
      specificRows = (await db.query('SELECT from_place, to_place, travel_date FROM flights WHERE service_id = $1', [service.id])).rows;
    } else if (service.type === 'train') {
      specificRows = (await db.query('SELECT from_place, to_place, travel_date FROM trains WHERE service_id = $1', [service.id])).rows;
    } else if (service.type === 'hotel') {
      specificRows = (await db.query('SELECT location, start_date, end_date FROM hotels WHERE service_id = $1', [service.id])).rows;
    } else if (service.type === 'package') {
      specificRows = (await db.query('SELECT location, start_date, end_date FROM packages WHERE service_id = $1', [service.id])).rows;
    }

    if (specificRows.length > 0) {
      Object.assign(service, specificRows[0]);
    }

    res.json(service);
  } catch (error) {
    console.error('Get service by id error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};

exports.updateService = async (req, res) => {
  try {
    // Only creator or admin can update
    const { rows: serviceRows } = await db.query('SELECT * FROM services WHERE id = $1', [req.params.id]);
    if (serviceRows.length === 0) return res.status(404).json({ message: 'Service not found' });
    
    if (req.user.role !== 'admin' && serviceRows[0].creator_id !== req.user.id) {
      return res.status(403).json({ message: 'Not authorized to update this service' });
    }

    const { title, price, description, image } = req.body;
    await db.query(
      'UPDATE services SET title = $1, price = $2, description = $3, image = $4 WHERE id = $5',
      [title || serviceRows[0].title, price || serviceRows[0].price, description || serviceRows[0].description, image || serviceRows[0].image, req.params.id]
    );

    res.json({ message: 'Service updated successfully' });
  } catch (error) {
    console.error('Update service error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};

exports.deleteService = async (req, res) => {
  try {
    const { rows: serviceRows } = await db.query('SELECT * FROM services WHERE id = $1', [req.params.id]);
    if (serviceRows.length === 0) return res.status(404).json({ message: 'Service not found' });
    
    if (req.user.role !== 'admin' && serviceRows[0].creator_id !== req.user.id) {
      return res.status(403).json({ message: 'Not authorized to delete this service' });
    }

    await db.query('DELETE FROM services WHERE id = $1', [req.params.id]);
    res.json({ message: 'Service deleted successfully' });
  } catch (error) {
    console.error('Delete service error:', error);
    res.status(500).json({ message: 'Server error' });
  }
};
