const express = require('express');
const router = express.Router();
const {
  getAllFlights,
  getFlightsUnderMaintenance,
  getFlightPassengers,
  assignSeat,
  getAvailableFlights,
  getEligiblePassengers,
  assignCrewToFlight,
  removeCrewFromFlight
} = require('../controllers/flightController');

// Routes
router.get('/', getAllFlights);
router.get('/maintenance', getFlightsUnderMaintenance);
router.get('/:id/passengers', getFlightPassengers);
router.post('/:flightId/assign-seat', assignSeat);
router.get('/:flightId/passengers/eligible', getEligiblePassengers);
router.get('/available', getAvailableFlights);
router.post('/:flightId/assign-crew', assignCrewToFlight);
router.post('/:flightId/remove-crew', removeCrewFromFlight);




module.exports = router;
