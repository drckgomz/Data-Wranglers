-- passenger population
INSERT INTO passengers VALUES (1, 'Dunn', 'Stacy', 'sdunn@gmail.com', '(712)653-2869', 906455661);
INSERT INTO passengers VALUES (2, 'Brown', 'Carlos', 'cbrown@gmail.com', '(486)927-7899', 186664624);
INSERT INTO passengers VALUES (3, 'Gilbert', 'Norman', 'ngilbert@gmail.com', '(572)996-8521', 263354174);
INSERT INTO passengers VALUES (4, 'Cummings', 'Lori', 'lcummings@gmail.com', '(873)737-8740', 498293094);
INSERT INTO passengers VALUES (5, 'Dennis', 'Michaela', 'mdennis@gmail.com', '(637)600-2748', 615558862);
INSERT INTO passengers VALUES (6, 'Contreras', 'Kevin', 'kcontreras@gmail.com', '(201)271-9364', 905789321);
INSERT INTO passengers VALUES (7, 'Garcia', 'Monica', 'mgarcia@gmail.com', '(894)951-6417', 122433539);
INSERT INTO passengers VALUES (8, 'Rowe', 'Stephanie', 'srowe@gmail.com', '(756)229-1299', 953725389);
INSERT INTO passengers VALUES (9, 'Smith', 'Jose', 'jsmith@gmail.com', '(449)541-4776', 392989190);
INSERT INTO passengers VALUES (10, 'Ward', 'Keith', 'kward@gmail.com', '(823)578-3979', 531311788);
INSERT INTO passengers VALUES (11, 'David', 'Kenneth', 'kdavid@gmail.com', '(660)473-7766', 577234641);
INSERT INTO passengers VALUES (12, 'Boyd', 'Tammy', 'tboyd@gmail.com', '(456)220-3779', 627934157);
INSERT INTO passengers VALUES (13, 'Hernandez', 'Christina', 'chernandez@gmail.com', '(475)572-5190', 295912112);
INSERT INTO passengers VALUES (14, 'Salinas', 'Karen', 'ksalinas@gmail.com', '(349)477-5020', 648745203);
INSERT INTO passengers VALUES (15, 'Sanchez', 'Megan', 'msanchez@gmail.com', '(446)297-7598', 897897041);

INSERT INTO planes VALUES (1, 'Boeing 737', 12345, 180, '2025-03-15', 'Operational');
INSERT INTO planes VALUES (2, 'Airbus A320', 12346, 160, '2025-03-10', 'Operational');
INSERT INTO planes VALUES (3, 'Boeing 777', 12347, 300, '2025-03-05', 'Maintenance');
INSERT INTO flights VALUES (101, 1, '2025-04-20', '2025-04-20', 'JFK', 'MIA', 'On Time');
INSERT INTO flights VALUES (102, 2, '2025-04-21', '2025-04-21', 'LAX', 'SEA', 'Delayed');
INSERT INTO flights VALUES (103, 3, '2025-04-22', '2025-04-22', 'ORD', 'DFW', 'Cancelled');
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
