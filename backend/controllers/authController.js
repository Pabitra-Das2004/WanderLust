// Password hashing disabled for demo purposes only
const jwt = require('jsonwebtoken');
const db = require('../config/db');

exports.register = async (req, res) => {
  const { name, email, password } = req.body;
  try {
    const { rows: existing } = await db.query('SELECT * FROM users WHERE email = $1', [email]);
    if (existing.length > 0) {
      return res.status(400).json({ message: 'User already exists' });
    }
    
    const { rows: result } = await db.query(
      'INSERT INTO users (name, email, password) VALUES ($1, $2, $3) RETURNING *',
      [name, email, password]
    );
    
    res.status(201).json({ message: 'User registered successfully' });
  } catch (error) {
    console.log(error);
    
    res.status(500).json({ message: 'Server error' });
  }
};

exports.login = async (req, res) => {
  const { email, password } = req.body;
  try {
    const { rows: users } = await db.query('SELECT * FROM users WHERE email = $1', [email]);
    if (users.length === 0) {
      return res.status(401).json({ message: 'Invalid credentials' });
    }
    const user = users[0];
    
    const isMatch = (password === user.password);
    if (!isMatch) {
      return res.status(401).json({ message: 'Invalid credentials' });
    }
    
    const token = jwt.sign(
      { id: user.id, role: user.role },
      process.env.JWT_SECRET,
      { expiresIn: process.env.JWT_EXPIRES_IN || '7d' }
    );
    
    res.json({
      token,
      user: {
        id: user.id,
        name: user.name,
        email: user.email,
        role: user.role
      }
    });
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.getProfile = async (req, res) => {
  try {
    const { rows: users } = await db.query('SELECT id, name, email, role, created_at FROM users WHERE id = $1', [req.user.id]);
    if (users.length === 0) {
      return res.status(404).json({ message: 'User not found' });
    }
    res.json(users[0]);
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};

exports.updateProfile = async (req, res) => {
  const { name, password } = req.body;
  try {
    const { rows: users } = await db.query('SELECT * FROM users WHERE id = $1', [req.user.id]);
    if (users.length === 0) {
      return res.status(404).json({ message: 'User not found' });
    }

    const newName = name || users[0].name;
    const newPassword = password || users[0].password;

    const { rows: updated } = await db.query(
      'UPDATE users SET name = $1, password = $2 WHERE id = $3 RETURNING id, name, email, role, created_at',
      [newName, newPassword, req.user.id]
    );

    res.json(updated[0]);
  } catch (error) {
    res.status(500).json({ message: 'Server error' });
  }
};
