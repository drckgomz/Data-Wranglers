// routes/crewRoutes.js
const express = require('express');
const router = express.Router();
const { getAllCrewMembers, getAvailableCrew, getAssignedCrewForFlight, updateCrewMember } = require('../controllers/crewController');

router.get('/', getAllCrewMembers);

router.get('/available', getAvailableCrew);

router.get('/:flightId/assigned-crew', getAssignedCrewForFlight);

router.put('/:crewMemberId', updateCrewMember);

module.exports = router;
