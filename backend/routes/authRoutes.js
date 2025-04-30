const express = require('express');
const router = express.Router();
const { 
  registerPassenger, 
  loginPassenger, 
  changePassengerPassword } = require('../controllers/authController');

// POST /api/auth/register
router.post('/register', (req, res, next) => {
    console.log('[ROUTE] POST /api/auth/register', req.body);
    next();
  }, registerPassenger);
  

// POST /api/auth/login
router.post('/login', loginPassenger);


module.exports = router;
