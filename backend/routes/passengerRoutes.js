const express = require('express');
const router = express.Router();
const { 
    getPassengerDetails, 
    updatePassengerProfile, 
    getAllPassengers,
    passengerCheckIn,
    createBooking,
    cancelBooking
} = require('../controllers/passengerController');
const { changePassengerPassword } = require('../controllers/authController');

router.get('/:id', getPassengerDetails);

router.put('/:id', updatePassengerProfile);

router.put('/:id/password', changePassengerPassword);

router.get('/', getAllPassengers);

router.post('/:id/bookings', createBooking);

router.post('/:id/bookings/:bookingId/checkin', passengerCheckIn);

router.delete('/:id/bookings/:bookingId', cancelBooking);


module.exports = router;
