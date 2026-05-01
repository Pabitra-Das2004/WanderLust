const express = require('express');
const router = express.Router();
const { createOrder, verifyPayment, paymentCallback, demoUpiSuccess } = require('../controllers/paymentController');
const { protect } = require('../middleware/auth');

// Razorpay callback doesn't have auth token
router.post('/callback', paymentCallback);

router.use(protect);
router.post('/create-order', createOrder);
router.post('/verify', verifyPayment);
router.post('/demo-upi-success', demoUpiSuccess);

module.exports = router;
