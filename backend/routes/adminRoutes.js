const express = require('express');
const router = express.Router();
const { getUsers, deleteUser, createService, updateService, deleteService, getReports, getServices, getBookings, getPayments, getSummary } = require('../controllers/adminController');
const { protect, checkRole } = require('../middleware/auth');

router.use(protect, checkRole('admin'));

router.get('/users', getUsers);
router.delete('/users/:id', deleteUser);

router.get('/services', getServices);
router.post('/services', createService);
router.put('/services/:id', updateService);
router.delete('/services/:id', deleteService);

router.get('/bookings', getBookings);
router.get('/payments', getPayments);
router.get('/summary', getSummary);

router.get('/reports', getReports);

module.exports = router;

