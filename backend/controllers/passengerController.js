const db = require('../config/db');

// GET /api/passenger/:id
const getPassengerDetails = async (req, res) => {
  try {
    const { id } = req.params;
    console.log('[ROUTE] GET /api/passenger/:id', { id });

    const [rows] = await db.query(`
      SELECT 
        p.passenger_id,
        p.passenger_first_name,
        p.passenger_last_name,
        p.passenger_email,
        p.passenger_phone_number,
        p.passport_number,
        b.booking_id,
        b.seat_number,
        b.check_in_status,
        f.flight_id,
        f.origin_city,
        f.destination_city,
        f.departure_time,
        f.arrival_time
      FROM passengers p
      LEFT JOIN bookings b ON p.passenger_id = b.passenger_id
      LEFT JOIN flights f ON b.flight_id = f.flight_id
      WHERE p.passenger_id = ?
    `, [id]);

    if (rows.length === 0) {
      return res.status(404).json({ success: false, message: "Passenger not found." });
    }

    // Reformat:
    const passengerInfo = {
      passenger_id: rows[0].passenger_id,
      passenger_first_name: rows[0].passenger_first_name,
      passenger_last_name: rows[0].passenger_last_name,
      passenger_email: rows[0].passenger_email,
      passenger_phone_number: rows[0].passenger_phone_number,
      passport_number: rows[0].passport_number,
      flights: rows.filter(r => r.flight_id !== null).map(r => ({
        booking_id: r.booking_id,
        seat_number: r.seat_number,
        check_in_status: r.check_in_status,
        flight_id: r.flight_id,
        origin_city: r.origin_city,
        destination_city: r.destination_city,
        departure_time: r.departure_time,
        arrival_time: r.arrival_time
      }))
    };

    res.json({ success: true, passenger: passengerInfo });
  } catch (error) {
    console.error('[ERROR] Fetching passenger details failed:', error);
    res.status(500).json({ success: false, message: 'Server error.' });
  }
};


// PUT /api/passenger/:id
const updatePassengerProfile = async (req, res) => {
  const { id } = req.params;
  const { passenger_first_name, passenger_last_name, passenger_email, passenger_phone_number, passport_number } = req.body;
  try {
    await db.query(
      'UPDATE passengers SET passenger_first_name = ?, passenger_last_name = ?, passenger_email = ?, passenger_phone_number = ?, passport_number = ? WHERE passenger_id = ?',
      [passenger_first_name, passenger_last_name, passenger_email, passenger_phone_number, passport_number, id]
    );
    res.json({ success: true, message: 'Profile updated successfully.' });
  } catch (error) {
    console.error('Error updating passenger:', error);
    res.status(500).json({ success: false, message: 'Failed to update profile.' });
  }
};

const getAllPassengers = async (req, res) => {
  try {
    const [passengers] = await db.query(`
      SELECT 
        p.passenger_id,
        p.passenger_first_name,
        p.passenger_last_name,
        p.passenger_email,
        p.passenger_phone_number,
        p.passport_number,
        b.booking_id,
        b.seat_number,
        b.check_in_status,
        f.flight_id,
        f.origin_city,
        f.destination_city,
        f.departure_time,
        f.arrival_time
      FROM passengers p
      LEFT JOIN bookings b ON p.passenger_id = b.passenger_id
      LEFT JOIN flights f ON b.flight_id = f.flight_id
    `);

    res.json(passengers);
  } catch (error) {
    console.error('[ERROR] Fetching all passengers:', error);
    res.status(500).json({ success: false, message: 'Failed to fetch passengers.' });
  }
};


// Create a booking for a passenger
const createBooking = async (req, res) => {
  const { id } = req.params;
  const { flightId } = req.body;

  console.log('[DEBUG] createBooking called with:', { passengerId: id, flightId });

  try {
    const [columns] = await db.query('SHOW COLUMNS FROM bookings');
    console.log('[DEBUG] bookings table columns:', columns.map(c => c.Field));

    const [result] = await db.execute(
      `INSERT INTO \`bookings\` (\`flight_id\`, \`seat_number\`, \`check_in_status\`, \`booking_date\`, \`passenger_id\`)
       VALUES (?, NULL, 0, CURDATE(), ?)`,
      [flightId, id]
    );
    
    

    console.log('[DEBUG] Insert Result:', result);
    res.status(201).json({ success: true, message: 'Booking created successfully.', bookingId: result.insertId });
  } catch (error) {
    console.error('[ERROR] createBooking failed:', error);
    res.status(500).json({ success: false, message: 'Failed to create booking.', error: error.message });
  }
};

// Passenger checks in
const passengerCheckIn = async (req, res) => {
  const { id, bookingId } = req.params;

  try {
    const [result] = await db.execute(
      `UPDATE bookings 
       SET check_in_status = 1    -- 👈 Set to true (1) now
       WHERE booking_id = ? AND passenger_id = ?`,
      [bookingId, id]
    );
    
    if (result.affectedRows === 0) {
      return res.status(404).json({ success: false, message: 'Booking not found or not owned by this passenger.' });
    }

    res.status(200).json({ success: true, message: 'Checked in successfully.' });
  } catch (error) {
    console.error('[ERROR] passengerCheckIn:', error);
    res.status(500).json({ success: false, message: 'Failed to check in.' });
  }
};

// DELETE /api/passenger/:id/bookings/:bookingId
const cancelBooking = async (req, res) => {
  const { id, bookingId } = req.params;
  try {
    const [result] = await db.execute(
      `DELETE FROM bookings WHERE booking_id = ? AND passenger_id = ?`,
      [bookingId, id]
    );

    if (result.affectedRows === 0) {
      return res.status(404).json({ success: false, message: 'Booking not found or not owned by this passenger.' });
    }

    res.status(200).json({ success: true, message: 'Booking cancelled successfully.' });
  } catch (error) {
    console.error('[ERROR] cancelBooking failed:', error);
    res.status(500).json({ success: false, message: 'Failed to cancel booking.' });
  }
};



module.exports = { 
  getPassengerDetails, 
  updatePassengerProfile,
  getAllPassengers,
  createBooking,
  passengerCheckIn,
  cancelBooking
};
