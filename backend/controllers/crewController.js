const db = require('../config/db');

const getAllCrewMembers = async (req, res) => {
  try {
    const [crew] = await db.query('SELECT * FROM crew_members');
    res.json(crew);
  } catch (error) {
    console.error('[ERROR] getAllCrewMembers:', error);
    res.status(500).json({ message: 'Failed to fetch crew members.' });
  }
};

const getAvailableCrew = async (req, res) => {
    try {
      const [crew] = await db.query(`
        SELECT cm.*
        FROM crew_members cm
        LEFT JOIN flight_crew_assignments fca ON cm.crew_member_id = fca.crew_member_id
        WHERE fca.crew_member_id IS NULL
        AND LOWER(cm.crew_role) NOT LIKE '%engineer%'
      `);
  
      res.json(crew);
    } catch (error) {
      console.error('[ERROR] getAvailableCrew:', error);
      res.status(500).json({ success: false, message: 'Failed to fetch available crew members.' });
    }
  };

  const getAssignedCrewForFlight = async (req, res) => {
    const { flightId } = req.params;
    try {
      const [assigned] = await db.query(`
        SELECT cm.*
        FROM crew_members cm
        JOIN flight_crew_assignments fca ON cm.crew_member_id = fca.crew_member_id
        WHERE fca.flight_id = ?
      `, [flightId]);
  
      res.json(assigned);
    } catch (error) {
      console.error('[ERROR] getAssignedCrewForFlight:', error);
      res.status(500).json({ success: false, message: 'Failed to fetch assigned crew.' });
    }
  };

  const updateCrewMember = async (req, res) => {
    const { crewMemberId } = req.params;
    const { crew_member_first_name, crew_member_last_name, crew_member_email, crew_member_phone_number } = req.body;
  
    try {
      const [result] = await db.query(
        `UPDATE crew_members
         SET crew_member_first_name = ?, crew_member_last_name = ?, crew_member_email = ?, crew_member_phone_number = ?
         WHERE crew_member_id = ?`,
        [crew_member_first_name, crew_member_last_name, crew_member_email, crew_member_phone_number, crewMemberId]
      );
  
      if (result.affectedRows === 0) {
        return res.status(404).json({ success: false, message: 'Crew member not found.' });
      }
  
      const [updatedCrewMember] = await db.query('SELECT * FROM crew_members WHERE crew_member_id = ?', [crewMemberId]);
  
      res.json({ success: true, updatedCrewMember: updatedCrewMember[0] });
    } catch (error) {
      console.error('[ERROR] updateCrewMember:', error);
      res.status(500).json({ success: false, message: 'Failed to update crew member.' });
    }
  };

module.exports = { getAllCrewMembers, getAvailableCrew, getAssignedCrewForFlight, updateCrewMember };
