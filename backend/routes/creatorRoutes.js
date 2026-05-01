const express = require('express');
const router = express.Router();
const { getSummary, getServices, getBookings } = require('../controllers/creatorController');
const { protect, checkRole } = require('../middleware/auth');

router.use(protect);
router.use(checkRole('creator'));

router.get('/summary', getSummary);
router.get('/services', getServices);
router.get('/bookings', getBookings);

module.exports = router;
