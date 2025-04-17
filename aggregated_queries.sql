USE SkyRunner_Airlines_db;

SELECT flight_id, COUNT(*) AS 'Flight Count'
FROM flights
GROUP BY flight_id;
-- flight count sorted by status 

SELECT flight_id, COUNT(booking_id) AS passenger_count
FROM bookings
GROUP BY flight_id
HAVING COUNT(booking_id) < 20
ORDER BY flight_id;
-- booking id count sorted by flight and showing flights with less than 20 passengers

SELECT crew_members.crew_member_first_name, crew_members.crew_member_last_name, crew_details.flight_id
FROM crew_members
INNER JOIN crew_details
ON crew_members.crew_member_id = crew_details.crew_details_id
ORDER BY crew_details.flight_id;
-- displays first and last crew member names with their flight_id

SELECT p.passenger_id, b.`check-in_status`
FROM passengers p
JOIN bookings b ON b.booking_id = b.booking_id;
-- combines the column of passenger id with check in status

SELECT SUM(passenger_id) 
FROM passengers;
-- total sum of passengers

SELECT AVG(capacity) AS Average_Capacity
FROM planes;
-- average capacity 

SELECT COUNT(*) AS Number_of_Flights
FROM flights;
-- count all instances of flights

SELECT MIN(capacity) AS 'minimum capacity'
FROM planes; 
