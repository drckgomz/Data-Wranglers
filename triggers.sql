USE SkyRunner_Airlines_db;

-- Create maintenance log table
CREATE TABLE IF NOT EXISTS maintenance_log (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  plane_id INT,
  old_maintenance_date DATE,
  new_maintenance_date DATE,
  old_status VARCHAR(100),
  new_status VARCHAR(100),
  change_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger: Log plane maintenance updates
DELIMITER //
CREATE TRIGGER log_plane_maintenance_update
AFTER UPDATE ON planes
FOR EACH ROW
BEGIN
  IF OLD.last_maintenance <> NEW.last_maintenance OR OLD.operation_status <> NEW.operation_status THEN
    INSERT INTO maintenance_log (
      plane_id,
      old_maintenance_date,
      new_maintenance_date,
      old_status,
      new_status
    ) VALUES (
      OLD.plane_id,
      OLD.last_maintenance,
      NEW.last_maintenance,
      OLD.operation_status,
      NEW.operation_status
    );
  END IF;
END;
//
DELIMITER ;

-- Create passenger log table
CREATE TABLE IF NOT EXISTS passenger_log (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  passenger_id INT,
  full_name VARCHAR(100),
  email VARCHAR(100),
  registered_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger: Log new passenger registrations
DELIMITER //
CREATE TRIGGER log_new_passenger
AFTER INSERT ON passengers
FOR EACH ROW
BEGIN
  INSERT INTO passenger_log (
    passenger_id,
    full_name,
    email
  ) VALUES (
    NEW.passenger_id,
    CONCAT(NEW.passenger_first_name, ' ', NEW.passenger_last_name),
    NEW.passenger_email
  );
END;
//
DELIMITER ;

-- Create booking log table
CREATE TABLE IF NOT EXISTS booking_log (
  log_id INT AUTO_INCREMENT PRIMARY KEY,
  booking_id INT,
  passenger_id INT,
  flight_id INT,
  seat_number VARCHAR(4),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Trigger: Log new bookings
DELIMITER //
CREATE TRIGGER log_new_booking
AFTER INSERT ON bookings
FOR EACH ROW
BEGIN
  INSERT INTO booking_log (
    booking_id,
    passenger_id,
    flight_id,
    seat_number
  ) VALUES (
    NEW.booking_id,
    NEW.passenger_id,
    NEW.flight_id,
    NEW.seat_number
  );
END;
//
DELIMITER ;

-- Show tables
SHOW TABLES;

-- Show triggers
SHOW TRIGGERS FROM SkyRunner_Airlines_db;
