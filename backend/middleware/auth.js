const jwt = require('jsonwebtoken');

exports.protect = (req, res, next) => {
  let token;
  if (req.headers.authorization && req.headers.authorization.startsWith('Bearer')) {
    token = req.headers.authorization.split(' ')[1];
  }
  if (!token) {
    return res.status(401).json({ message: 'Not authorized, no token' });
  }
  try {
    const decoded = jwt.verify(token, process.env.JWT_SECRET);
    req.user = decoded; // { id, role }
    next();
  } catch (error) {
    res.status(401).json({ message: 'Not authorized, token failed' });
  }
};

exports.checkRole = (...roles) => {
  return (req, res, next) => {
    if (!req.user) {
      return res.status(401).json({ message: 'Not authorized' });
    }
    if (req.user.role === 'admin') {
      return next(); // admin bypasses all checks
    }
    if (roles.includes(req.user.role)) {
      next();
    } else {
      res.status(403).json({ message: `Role ${req.user.role} is not authorized to access this route` });
    }
  };
};

