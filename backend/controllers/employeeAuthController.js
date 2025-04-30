const db = require('../config/db');

const EMPLOYEE_PASSCODE = 'root'; // hardcoded HQ passcode

// POST /api/auth/employee/register
const registerCrewMember = async (req, res) => {
    try {
      console.log('[CONTROLLER] Trying to register crew member:', req.body);
  
      const { crew_member_first_name, crew_member_last_name, crew_member_email, crew_member_phone_number, passport_number, crew_role, passcode, password } = req.body;
  
      if (passcode !== 'passcode') {
        return res.status(401).json({ success: false, message: 'Unauthorized. Invalid passcode.' });
      }
  
      const [result] = await db.query(
        `INSERT INTO crew_members (crew_member_first_name, crew_member_last_name, crew_member_email, crew_member_phone_number, passport_number, crew_role, crew_member_password)
         VALUES (?, ?, ?, ?, ?, ?, ?)`,
        [crew_member_first_name, crew_member_last_name, crew_member_email, crew_member_phone_number, passport_number, crew_role, password]
      );
  
      console.log('[CONTROLLER] Crew member registered with ID:', result.insertId);
  
      res.status(201).json({ success: true, message: 'Crew member registered successfully!', crew_member_id: result.insertId });
    } catch (error) {
      console.error('[ERROR] registerCrewMember:', error);
      res.status(500).json({ success: false, message: 'Crew member registration failed.' });
    }
  };

// POST /api/auth/employee/login
const loginCrewMember = async (req, res) => {
    try {
      console.log('[CONTROLLER] Crew member login attempt:', req.body);
  
      const { email, crew_member_password } = req.body;
  
      const [rows] = await db.query(
        `SELECT * FROM crew_members WHERE crew_member_email = ?`,
        [email]
      );
  
      if (rows.length > 0) {
        const crewMember = rows[0];

        if (crewMember.crew_member_password === crew_member_password) { // compare passwords
          console.log('[CONTROLLER] Crew member authenticated:', crewMember);
          res.json({ success: true, crew_member: crewMember });
        } else {
          console.log('[CONTROLLER] Incorrect password for:', email);
          res.status(401).json({ success: false, message: 'Invalid password.' });
        }
      } else {
        res.status(404).json({ success: false, message: 'Crew member not found.' });
      }
    } catch (error) {
      console.error('[ERROR] loginCrewMember:', error);
      res.status(500).json({ success: false, message: 'Crew member login failed.' });
    }
  };

  module.exports = { registerCrewMember, loginCrewMember };
