const express = require('express');
const cors = require('cors');
require('dotenv').config();

const authRoutes = require('./routes/authRoutes');
const passengerRoutes = require('./routes/passengerRoutes');
const employeeAuthRoutes = require('./routes/employeeAuthRoutes');
const flightRoutes = require('./routes/flightRoutes');
const crewRoutes = require('./routes/crewRoutes');

const db = require('./config/db');

const app = express();
const PORT = process.env.PORT || 3000;

(async () => {
  try {
    await db.verifyConnection();
    console.log('[ENV] DB_NAME:', process.env.DB_NAME);

    // Middleware
    console.log('[INIT] Applying CORS middleware...');
    app.use(cors({
      origin: 'http://localhost:3001',
      credentials: true
    }));

    console.log('[INIT] Applying JSON parser middleware...');
    app.use(express.json());

    // Routes
    console.log('[INIT] Setting up /api/auth routes...');
    app.use('/api/auth', authRoutes);

    app.use('/api/passenger', passengerRoutes);

    console.log('[INIT] Setting up /api/auth/employee routes...');
    app.use('/api/auth/employee', employeeAuthRoutes);

    console.log('[INIT] Setting up /api/flights routes...');
    app.use('/api/flights', flightRoutes);

    app.use('/api/crew', crewRoutes);


    app.get('/', (req, res) => {
      res.send('SkyRunner Airlines Backend is Running! ✈️');
    });

    app.listen(PORT, () => {
      console.log(`[READY] Server is running on http://localhost:${PORT}`);
    });

  } catch (error) {
    console.error('[FATAL] Could not verify DB connection:', error);
    process.exit(1);
  }
})();
