INSERT INTO passengers VALUES (1, 'Smith', 'Alice', 'alice@example.com', '1234567890', 10001);
INSERT INTO passengers VALUES (2, 'Brown', 'Bob', 'bob@example.com', '0987654321', 10002);
INSERT INTO passengers VALUES (3, 'Davis', 'Charlie', 'charlie@example.com', '1122334455', 10003);
INSERT INTO passengers VALUES (101, 'Smith', 'Alice', 'alice.smith@example.com', '2105550101', 50001);
INSERT INTO passengers VALUES (102, 'Brown', 'Bob', 'bob.brown@example.com', '2105550102', 50002);
INSERT INTO passengers VALUES (103, 'Davis', 'Charlie', 'charlie.davis@example.com', '2105550103', 50003);
INSERT INTO passengers VALUES (104, 'Miller', 'Diana', 'diana.miller@example.com', '2105550104', 50004);
INSERT INTO passengers VALUES (105, 'Wilson', 'Eli', 'eli.wilson@example.com', '2105550105', 50005);
INSERT INTO passengers VALUES (106, 'Taylor', 'Fiona', 'fiona.taylor@example.com', '2105550106', 50006);
INSERT INTO passengers VALUES (107, 'Anderson', 'George', 'george.anderson@example.com', '2105550107', 50007);
INSERT INTO passengers VALUES (108, 'Thomas', 'Hannah', 'hannah.thomas@example.com', '2105550108', 50008);
INSERT INTO passengers VALUES (109, 'Jackson', 'Ian', 'ian.jackson@example.com', '2105550109', 50009);
INSERT INTO passengers VALUES (110, 'White', 'Julia', 'julia.white@example.com', '2105550110', 50010);
INSERT INTO passengers VALUES (111, 'Harris', 'Kevin', 'kevin.harris@example.com', '2105550111', 50011);
INSERT INTO passengers VALUES (112, 'Martin', 'Laura', 'laura.martin@example.com', '2105550112', 50012);
INSERT INTO passengers VALUES (113, 'Thompson', 'Mike', 'mike.thompson@example.com', '2105550113', 50013);
INSERT INTO passengers VALUES (114, 'Garcia', 'Nina', 'nina.garcia@example.com', '2105550114', 50014);
INSERT INTO passengers VALUES (115, 'Martinez', 'Oscar', 'oscar.martinez@example.com', '2105550115', 50015);
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
INSERT INTO bookings VALUES (2001, 101, 101, '24B', 'Not Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2002, 102, 101, '29A', 'Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2003, 103, 102, '12A', 'Not Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2004, 104, 103, '14C', 'Not Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2005, 105, 101, '24A', 'Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2006, 106, 102, '10A', 'Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2007, 107, 101, '13B', 'Not Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2008, 108, 102, '16B', 'Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2009, 109, 103, '21C', 'Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2010, 110, 103, '28C', 'Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2011, 111, 103, '22B', 'Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2012, 112, 102, '10A', 'Not Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2013, 113, 101, '11A', 'Not Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2014, 114, 103, '16B', 'Checked In', '2025-04-10');
INSERT INTO bookings VALUES (2015, 115, 101, '15A', 'Not Checked In', '2025-04-10');
INSERT INTO booking_details VALUES (2001, 1001, 101);
INSERT INTO booking_details VALUES (2002, 1002, 102);
INSERT INTO booking_details VALUES (2003, 1003, 103);
INSERT INTO crew_details VALUES (3001, 1001, 101);
INSERT INTO crew_details VALUES (3002, 1002, 102);
INSERT INTO crew_details VALUES (3003, 1003, 103);