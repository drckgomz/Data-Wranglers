DELETE FROM flights WHERE flight_id = 999;

INSERT INTO passengers VALUES (1, 'Smith', 'Alice', 'alice@example.com', '1234567890', 10001);
INSERT INTO passengers VALUES (2, 'Brown', 'Bob', 'bob@example.com', '0987654321', 10002);
INSERT INTO passengers VALUES (3, 'Davis', 'Charlie', 'charlie@example.com', '1122334455', 10003);
INSERT INTO planes VALUES (1, 'Boeing 737', 12345, 180, '2025-03-15', 'Operational');
INSERT INTO planes VALUES (2, 'Airbus A320', 12346, 160, '2025-03-10', 'Operational');
INSERT INTO planes VALUES (3, 'Boeing 777', 12347, 300, '2025-03-05', 'Maintenance');
INSERT INTO flights VALUES (101, 1, '2025-04-20', '2025-04-20', 'JFK', 'MIA', 'On Time');
INSERT INTO flights VALUES (102, 2, '2025-04-21', '2025-04-21', 'LAX', 'SEA', 'Delayed');
INSERT INTO flights VALUES (103, 3, '2025-04-22', '2025-04-22', 'ORD', 'DFW', 'Cancelled');
INSERT INTO flights VALUES (999, 1, CURDATE(), CURDATE(), 'SAT', 'AUS', 'On Time');
INSERT INTO crew_members VALUES (501, 'Lee', 'Amy', 55501, 'Pilot', '2020-01-01', 'amy.lee@example.com', '9991112222');
INSERT INTO crew_members VALUES (502, 'Jones', 'Tom', 55502, 'Co-Pilot', '2021-05-10', 'tom.jones@example.com', '8883334444');
INSERT INTO crew_members VALUES (503, 'Taylor', 'Sara', 55503, 'Attendant', '2022-07-15', 'sara.taylor@example.com', '7776665555');
INSERT INTO bookings VALUES (1001, 1, 101, '12A', 'Checked In', '2025-04-10');
INSERT INTO bookings VALUES (1002, 2, 102, '14B', 'Not Checked In', '2025-04-11');
INSERT INTO bookings VALUES (1003, 3, 103, '16C', 'Checked In', '2025-04-12');
INSERT INTO booking_details VALUES (2001, 1001, 101);
INSERT INTO booking_details VALUES (2002, 1002, 102);
INSERT INTO booking_details VALUES (2003, 1003, 103);
INSERT INTO crew_details VALUES (3001, 1001, 101);
INSERT INTO crew_details VALUES (3002, 1002, 102);
INSERT INTO crew_details VALUES (3003, 1003, 103);


-- Insert a flight scheduled for today to test the stored procedure
INSERT INTO flights (
  flight_id, plane_id, departure_time, arrival_time,
  origin_city, destination_city, flight_status
)
VALUES (999, 1, NOW(), DATE_ADD(NOW(), INTERVAL 3 HOUR 'SAT', 'AUS', 'On Time'
);
