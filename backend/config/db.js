const mysql = require('mysql2/promise');
require('dotenv').config();

console.log('[DEBUG] Initializing DB pool for:', process.env.DB_NAME);

const pool = mysql.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USER,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_NAME,
  waitForConnections: true,
  connectionLimit: 10,
  queueLimit: 0
});

// Define the `db` object
const db = {
  query: async (...args) => {
    return pool.query(...args);
  },
  execute: async (...args) => {
    return pool.execute(...args);
  },
  verifyConnection: async () => {
    try {
      const [rows] = await pool.query('SELECT DATABASE() as current_db');
      console.log('[DB] Connected to database:', rows[0].current_db);
      return rows[0].current_db;
    } catch (err) {
      console.error('[DB] Connection verification failed:', err);
      throw err;
    }
  }
};

module.exports = db;
