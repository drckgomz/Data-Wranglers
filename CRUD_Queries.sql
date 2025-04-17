USE SkyRunner_Airlines_db;

SHOW TABLES;

INSERT INTO crew_members (crew_member_id, crew_member_last_name, crew_member_first_name, passport_number, crew_role, hire_date, crew_member_email, crew_member_phone_number)
VALUES (1, 'Turner', 'Paige', 987654321,
        5, '2013-04-14', 'pturner777@gmail.com', '(123)456-7890' );
        
-- Create 
CREATE VIEW passenger_and_booking AS
SELECT p.passenger_first_name, p.passenger_last_name, b.booking_id, b.booking_date
FROM passengers AS p
INNER JOIN bookings AS b
ON p.passenger_id = b.passenger_id;

-- Read
SELECT  crew_member_first_name, crew_member_last_name, passport_number
FROM crew_members;

-- Update
UPDATE crew_members
SET passport_number = 123456789, crew_member_email = 'paiget777@icloud.com'
WHERE crew_member_id = 1;

-- Delete
DELETE FROM crew_members 
WHERE crew_member_id = 1;

