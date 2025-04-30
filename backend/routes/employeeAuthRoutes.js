const express = require('express');
const router = express.Router();
const { registerCrewMember, loginCrewMember } = require('../controllers/employeeAuthController');

// POST /api/auth/employee/register
router.post('/register', registerCrewMember);

// POST /api/auth/employee/login
router.post('/login', loginCrewMember);

module.exports = router;
