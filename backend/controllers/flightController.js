const db = require('../config/db');

// Fetch all flights
const getAllFlights = async (req, res) => {
  try {
    const [flights] = await db.query('SELECT * FROM flights');
    res.json(flights);
  } catch (error) {
    console.error('[ERROR] getAllFlights:', error);
    res.status(500).json({ message: 'Server Error' });
  }
};

// Fetch flights under maintenance
const getFlightsUnderMaintenance = async (req, res) => {
  try {
    const [rows] = await db.query(`
      SELECT 
        f.flight_id,
        f.origin_city,
        f.destination_city,
        f.departure_time,
        f.arrival_time,
        f.flight_status,
        p.plane_id,
        p.aircraft_type,
        p.registration_number,
        p.operation_status,
        m.issue_description,
        m.maintenance_status
      FROM flights f
      JOIN planes p ON f.plane_id = p.plane_id
      JOIN maintenance_log m ON p.plane_id = m.plane_id
      WHERE p.operation_status = 'Maintenance'
    `);

    res.json(rows);
  } catch (err) {
    console.error('[ERROR] getFlightsUnderMaintenance:', err);
    res.status(500).json({ message: 'Failed to fetch maintenance flights.' });
  }
};



// Fetch passengers for a flight
const getFlightPassengers = async (req, res) => {
  const { id } = req.params;
  try {
    const [passengers] = await db.query(`
      SELECT 
        p.passenger_id,
        p.passenger_first_name,
        p.passenger_last_name,
        p.passenger_email,
        b.booking_id,
        b.seat_number,
        b.check_in_status
      FROM bookings b
      JOIN passengers p ON b.passenger_id = p.passenger_id
      WHERE b.flight_id = ?
    `, [id]);

    res.json(passengers);
  } catch (error) {
    console.error('[ERROR] getFlightPassengers:', error);
    res.status(500).json({ message: 'Server Error' });
  }
};



// Assign seat to a passenger
const assignSeat = async (req, res) => {
  const { flightId } = req.params;
  const { passengerId, seatNumber } = req.body;

  console.log('[DEBUG] Assign Seat Request Body:', req.body);

  try {
    const [result] = await db.execute(
      `
      UPDATE bookings 
      SET seat_number = ? 
      WHERE passenger_id = ? AND flight_id = ?
      `,
      [seatNumber, passengerId, flightId]
    );

    console.log('[DEBUG] Seat assignment result:', result);

    if (result.affectedRows === 0) {
      return res.status(404).json({ success: false, message: 'Booking not found for this passenger and flight.' });
    }

    res.status(200).json({ success: true, message: 'Seat assigned successfully.' });
  } catch (error) {
    console.error('[ERROR] assignSeat error object:', error);
    res.status(500).json({ success: false, message: 'Failed to assign seat.' });
  }
};



// GET /api/flights/:flightId/passengers/eligible
const getEligiblePassengers = async (req, res) => {
  const { flightId } = req.params;

  try {
    const [passengers] = await db.query(`
      SELECT 
        p.passenger_id, 
        p.passenger_first_name, 
        p.passenger_last_name, 
        p.passenger_email,
        b.seat_number
      FROM bookings b
      JOIN passengers p ON b.passenger_id = p.passenger_id
      WHERE b.flight_id = ? AND b.check_in_status = 1
    `, [flightId]);

    res.json(passengers);
  } catch (error) {
    console.error('[ERROR] getEligiblePassengers:', error);
    res.status(500).json({ success: false, message: 'Failed to fetch eligible passengers.' });
  }
};


const getAvailableFlights = async (req, res) => {
  try {
    const [flights] = await db.query(`
      SELECT * FROM flights
      WHERE flight_status = 'On Time' AND departure_time > NOW()
      ORDER BY departure_time ASC
    `);
    res.json(flights);
  } catch (error) {
    console.error('[ERROR] getAvailableFlights:', error);
    res.status(500).json({ message: 'Server Error fetching available flights' });
  }
};

const assignCrewToFlight = async (req, res) => {
  const { flightId } = req.params;
  const { crewIds } = req.body;

  if (!Array.isArray(crewIds) || crewIds.length === 0) {
    return res.status(400).json({ success: false, message: 'No crew IDs provided.' });
  }

  try {
    const placeholders = crewIds.map(() => '(?, ?)').join(', ');
    const values = crewIds.flatMap(id => [flightId, id]);

    const [result] = await db.query(
      `INSERT INTO flight_crew_assignments (flight_id, crew_member_id) VALUES ${placeholders}`,
      values
    );

    console.log('[DEBUG] Assigned crew to flight:', result);
    res.status(200).json({ success: true, message: 'Crew assigned successfully.' });
  } catch (error) {
    console.error('[ERROR] assignCrewToFlight:', error);
    res.status(500).json({ success: false, message: 'Failed to assign crew.' });
  }
};

const removeCrewFromFlight = async (req, res) => {
  const { flightId } = req.params; // not from body, from URL params

  try {
    const [result] = await db.query(
      'DELETE FROM flight_crew_assignments WHERE flight_id = ?',
      [flightId]
    );

    console.log('[DEBUG] Removed all crew from flight:', result);
    res.json({ success: true, message: 'All crew members removed from flight.' });
  } catch (error) {
    console.error('[ERROR] removeCrewFromFlight:', error);
    res.status(500).json({ success: false, message: 'Failed to remove crew from flight.' });
  }
};



module.exports = {
  getAllFlights,
  getFlightsUnderMaintenance,
  getFlightPassengers,
  assignSeat,
  getEligiblePassengers,
  getAvailableFlights,
  assignCrewToFlight,
  removeCrewFromFlight
};
