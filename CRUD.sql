USE SkyRunner_Airlines_db;

-- 1. Creates  adds a new crew member by the name of Paige turner to the “crew_members” table 
-- while appending her ID number, Passport Number, her role as a pilot, the date she was hired, 
-- her email address as well as her phone number 
INSERT INTO crew_members ( crew_member_id, crew_member_last_name, crew_member_first_name, passport_number,
  crew_role, hire_date, crew_member_email, crew_member_phone_number )
VALUES (777, 'Turner', 'Paige', 987654321, 'Pilot', '2013-04-14',
  'pturner777@gmail.com', '1234567890');
SELECT * FROM crew_members;


-- 2. Updates the crew member with the id of 777 and changes the “passport_number” as well as the “crew_member_email”. 
-- This query allows for corrections and updates to the personal information of a specific crew member. 
UPDATE crew_members
SET
  passport_number = 123456789,
  crew_member_email = 'paiget777@icloud.com'
WHERE
  crew_member_id = 777;
SELECT * FROM crew_members;


-- 3. This Create query makes a new or updates an existing view named “passenger_and_booking” 
-- that conjoins the passengers’ and bookings’ table based on the “passenger_id”. 
CREATE OR REPLACE VIEW passenger_and_booking AS
SELECT
  p.passenger_first_name,
  p.passenger_last_name,
  b.booking_id,
  b.booking_date
FROM
  passengers AS p
INNER JOIN
  bookings AS b ON p.passenger_id = b.passenger_id;
SELECT * FROM passenger_and_booking;


-- 4. This query reads bookings that have connecting flights. This can be useful when deciphering from one-way, roundtrip, or connecting flights 
SELECT 
    bd.booking_id, 
    b.passenger_id,
    GROUP_CONCAT(f.flight_id ORDER BY f.departure_time SEPARATOR ', ') AS flight_ids,
    GROUP_CONCAT(
        CONCAT(f.origin_city, ' → ', f.destination_city) 
        ORDER BY f.departure_time 
        SEPARATOR ' → '
    ) AS journey_path
FROM 
    booking_details AS bd
INNER JOIN 
    bookings AS b ON bd.booking_id = b.booking_id
INNER JOIN
    flights AS f ON bd.flight_id = f.flight_id
GROUP BY 
    bd.booking_id, b.passenger_id
HAVING 
    COUNT(*) > 1
ORDER BY
    bd.booking_id;

-- 5. This query selects all flights that meet the condition in the subquery
SELECT *
FROM flights
WHERE plane_id IN (
    SELECT plane_id
    FROM planes
    WHERE operation_status = 'Operational'
);
  

-- The stored procedure Get_Daily_Flight_schedule() makes simple use of retrieving all of the necessary 
-- flight information for the current day. This procedure will display the flight_ids their departure and arrival dates, 
-- origin and destination, as well as the status of the flight and plane. 

CALL Get_Daily_Flight_Schedule();

-- Get_Weekly_Crew_schedule() creates a weekly digest of crew_members and their assigned flights. 
-- Attendants, Pilots, and Co-pilots will have a detailed view of their weekly schedule including useful information 
-- about their upcoming assignments. 

CALL Get_Weekly_Crew_Schedule();

