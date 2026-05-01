const express = require('express');
const router = express.Router();
const { getServices, getServiceById, createService, updateService, deleteService } = require('../controllers/serviceController');
const { protect } = require('../middleware/auth');
const { checkRole } = require('../middleware/auth');

router.route('/')
  .get(getServices)
  .post(protect, checkRole('creator', 'admin'), createService);

router.route('/:id')
  .get(getServiceById)
  .put(protect, checkRole('creator', 'admin'), updateService)
  .delete(protect, checkRole('creator', 'admin'), deleteService);

module.exports = router;
