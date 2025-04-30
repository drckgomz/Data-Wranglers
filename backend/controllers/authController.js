const db = require('../config/db');

// POST /api/auth/register
const registerPassenger = async (req, res) => {
  console.log('[CONTROLLER] Handling passenger registration...', req.body);
  try {
    const { passenger_first_name, passenger_last_name, passenger_email, passenger_phone_number, passport_number, password } = req.body;
    const [result] = await db.query(
      'INSERT INTO passengers (passenger_first_name, passenger_last_name, passenger_email, passenger_phone_number, passport_number, passenger_password) VALUES (?, ?, ?, ?, ?, ?)',
      [passenger_first_name, passenger_last_name, passenger_email, passenger_phone_number, passport_number, password]
    );
    res.status(201).json({ success: true, message: 'Passenger registered!', passenger_id: result.insertId });
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Registration failed.' });
  }
};

// POST /api/auth/login
const loginPassenger = async (req, res) => {
  try {
    const { email, password } = req.body;
    const [rows] = await db.query('SELECT * FROM passengers WHERE passenger_email = ?', [email]);
    if (rows.length > 0) {
      const passenger = rows[0];
      if (passenger.passenger_password === password) {
        res.json({ success: true, user: passenger });
      } else {
        res.status(401).json({ success: false, message: 'Invalid password.' });
      }
    } else {
      res.status(404).json({ success: false, message: 'No account found.' });
    }
  } catch (error) {
    console.error(error);
    res.status(500).json({ success: false, message: 'Login failed.' });
  }
};

// PUT /api/passengers/:id/password
const changePassengerPassword = async (req, res) => {
  const { id } = req.params;
  const { currentPassword, newPassword } = req.body;
  try {
    const [rows] = await db.query('SELECT passenger_password FROM passengers WHERE passenger_id = ?', [id]);
    if (rows.length === 0) {
      return res.status(404).json({ success: false, message: 'Passenger not found.' });
    }
    const passenger = rows[0];
    if (passenger.passenger_password !== currentPassword) {
      return res.status(401).json({ success: false, message: 'Current password is incorrect.' });
    }
    await db.query('UPDATE passengers SET passenger_password = ? WHERE passenger_id = ?', [newPassword, id]);
    res.json({ success: true, message: 'Password updated successfully.' });
  } catch (error) {
    console.error('[ERROR] changePassengerPassword:', error);
    res.status(500).json({ success: false, message: 'Failed to change password.' });
  }
};

module.exports = { registerPassenger, loginPassenger, changePassengerPassword };
