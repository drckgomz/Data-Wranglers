USE SkyRunner_Airlines_db;

-- Passengers Data
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
-- Additional Passenger Data
INSERT INTO passengers VALUES (116, 'Robinson', 'Patricia', 'patricia.robinson@example.com', '2105550116', 50016);
INSERT INTO passengers VALUES (117, 'Clark', 'Quinn', 'quinn.clark@example.com', '2105550117', 50017);
INSERT INTO passengers VALUES (118, 'Rodriguez', 'Ryan', 'ryan.rodriguez@example.com', '2105550118', 50018);
INSERT INTO passengers VALUES (119, 'Lewis', 'Sophia', 'sophia.lewis@example.com', '2105550119', 50019);
INSERT INTO passengers VALUES (120, 'Lee', 'Tyler', 'tyler.lee@example.com', '2105550120', 50020);
INSERT INTO passengers VALUES (121, 'Walker', 'Uma', 'uma.walker@example.com', '2105550121', 50021);
INSERT INTO passengers VALUES (122, 'Hall', 'Victor', 'victor.hall@example.com', '2105550122', 50022);
INSERT INTO passengers VALUES (123, 'Allen', 'Wendy', 'wendy.allen@example.com', '2105550123', 50023);
INSERT INTO passengers VALUES (124, 'Young', 'Xavier', 'xavier.young@example.com', '2105550124', 50024);
INSERT INTO passengers VALUES (125, 'Hernandez', 'Yara', 'yara.hernandez@example.com', '2105550125', 50025);
INSERT INTO passengers VALUES (126, 'King', 'Zach', 'zach.king@example.com', '2105550126', 50026);
INSERT INTO passengers VALUES (127, 'Wright', 'Abigail', 'abigail.wright@example.com', '2105550127', 50027);
INSERT INTO passengers VALUES (128, 'Lopez', 'Benjamin', 'benjamin.lopez@example.com', '2105550128', 50028);
INSERT INTO passengers VALUES (129, 'Hill', 'Chloe', 'chloe.hill@example.com', '2105550129', 50029);
INSERT INTO passengers VALUES (130, 'Scott', 'Daniel', 'daniel.scott@example.com', '2105550130', 50030);
INSERT INTO passengers VALUES (131, 'Green', 'Emma', 'emma.green@example.com', '2105550131', 50031);
INSERT INTO passengers VALUES (132, 'Adams', 'Finn', 'finn.adams@example.com', '2105550132', 50032);
INSERT INTO passengers VALUES (133, 'Baker', 'Grace', 'grace.baker@example.com', '2105550133', 50033);
INSERT INTO passengers VALUES (134, 'Gonzalez', 'Henry', 'henry.gonzalez@example.com', '2105550134', 50034);
INSERT INTO passengers VALUES (135, 'Nelson', 'Isabella', 'isabella.nelson@example.com', '2105550135', 50035);
INSERT INTO passengers VALUES (136, 'Carter', 'Jack', 'jack.carter@example.com', '2105550136', 50036);
INSERT INTO passengers VALUES (137, 'Mitchell', 'Kylie', 'kylie.mitchell@example.com', '2105550137', 50037);
INSERT INTO passengers VALUES (138, 'Perez', 'Liam', 'liam.perez@example.com', '2105550138', 50038);
INSERT INTO passengers VALUES (139, 'Roberts', 'Mia', 'mia.roberts@example.com', '2105550139', 50039);
INSERT INTO passengers VALUES (140, 'Turner', 'Noah', 'noah.turner@example.com', '2105550140', 50040);
INSERT INTO passengers VALUES (141, 'Phillips', 'Olivia', 'olivia.phillips@example.com', '2105550141', 50041);
INSERT INTO passengers VALUES (142, 'Campbell', 'Peter', 'peter.campbell@example.com', '2105550142', 50042);
INSERT INTO passengers VALUES (143, 'Parker', 'Ruby', 'ruby.parker@example.com', '2105550143', 50043);
INSERT INTO passengers VALUES (144, 'Evans', 'Samuel', 'samuel.evans@example.com', '2105550144', 50044);
INSERT INTO passengers VALUES (145, 'Edwards', 'Tara', 'tara.edwards@example.com', '2105550145', 50045);
INSERT INTO passengers VALUES (146, 'Collins', 'Ulysses', 'ulysses.collins@example.com', '2105550146', 50046);
INSERT INTO passengers VALUES (147, 'Stewart', 'Violet', 'violet.stewart@example.com', '2105550147', 50047);

SELECT * FROM passengers;


-- Planes Data
INSERT INTO planes VALUES (1, 'Boeing 737', 12345, 180, '2025-03-15', 'Operational');
INSERT INTO planes VALUES (2, 'Airbus A320', 12346, 160, '2025-03-10', 'Operational');
INSERT INTO planes VALUES (3, 'Boeing 777', 12347, 300, '2025-03-05', 'Maintenance');
-- Additional Planes Data
INSERT INTO planes VALUES (4, 'Boeing 737', 12348, 180, '2025-04-02', 'Operational');
INSERT INTO planes VALUES (5, 'Airbus A320', 12349, 160, '2025-04-05', 'Operational');
INSERT INTO planes VALUES (6, 'Boeing 777', 12350, 300, '2025-03-28', 'Operational');
INSERT INTO planes VALUES (7, 'Boeing 737', 12351, 180, '2025-03-20', 'Operational');
INSERT INTO planes VALUES (8, 'Airbus A320', 12352, 160, '2025-04-10', 'Maintenance');
INSERT INTO planes VALUES (9, 'Boeing 777', 12353, 300, '2025-04-08', 'Operational');
INSERT INTO planes VALUES (10, 'Boeing 737', 12354, 180, '2025-03-25', 'Operational');
INSERT INTO planes VALUES (11, 'Airbus A320', 12355, 160, '2025-04-12', 'Operational');
INSERT INTO planes VALUES (12, 'Boeing 777', 12356, 300, '2025-04-15', 'Operational');
INSERT INTO planes VALUES (13, 'Boeing 737', 12357, 180, '2025-04-01', 'Maintenance');
INSERT INTO planes VALUES (14, 'Airbus A320', 12358, 160, '2025-03-18', 'Operational');
INSERT INTO planes VALUES (15, 'Boeing 777', 12359, 300, '2025-04-07', 'Operational');

SELECT * FROM planes;


-- Flights Data
INSERT INTO flights VALUES (101, 1, '2025-04-20', '2025-04-20', 'JFK', 'MIA', 'On Time');
INSERT INTO flights VALUES (102, 2, '2025-04-21', '2025-04-21', 'LAX', 'SEA', 'Delayed');
INSERT INTO flights VALUES (103, 3, '2025-04-22', '2025-04-22', 'ORD', 'DFW', 'Cancelled');
INSERT INTO flights VALUES (999, 1, CURDATE(), CURDATE(), 'SAT', 'AUS', 'On Time');
-- Additional Flights Data
INSERT INTO flights VALUES (104, 4, '2025-04-25', '2025-04-25', 'SAT', 'DFW', 'On Time');
INSERT INTO flights VALUES (105, 5, '2025-04-26', '2025-04-26', 'SAT', 'IAH', 'On Time');
INSERT INTO flights VALUES (106, 6, '2025-04-27', '2025-04-27', 'SAT', 'LAX', 'On Time');
INSERT INTO flights VALUES (107, 7, '2025-04-28', '2025-04-28', 'SAT', 'PHX', 'On Time');
INSERT INTO flights VALUES (108, 8, '2025-04-29', '2025-04-29', 'SAT', 'ORD', 'Delayed');
INSERT INTO flights VALUES (109, 9, '2025-04-30', '2025-04-30', 'SAT', 'ATL', 'On Time');
INSERT INTO flights VALUES (110, 10, '2025-05-01', '2025-05-01', 'SAT', 'DEN', 'On Time');
INSERT INTO flights VALUES (111, 11, '2025-05-01', '2025-05-01', 'DFW', 'SAT', 'On Time');
INSERT INTO flights VALUES (112, 12, '2025-05-02', '2025-05-02', 'IAH', 'SAT', 'On Time');
INSERT INTO flights VALUES (113, 13, '2025-04-26', '2025-04-26', 'ATL', 'SAT', 'Delayed');
INSERT INTO flights VALUES (114, 14, '2025-04-28', '2025-04-28', 'LAX', 'SAT', 'On Time');
INSERT INTO flights VALUES (115, 15, '2025-04-30', '2025-04-30', 'ORD', 'SAT', 'Cancelled');

SELECT * FROM flights;


-- Bookings Data
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
-- Additional bookings Data
INSERT INTO bookings VALUES (2016, 116, 104, '14A', 'Checked In', '2025-04-20');
INSERT INTO bookings VALUES (2017, 117, 104, '14B', 'Checked In', '2025-04-21');
INSERT INTO bookings VALUES (2018, 118, 104, '14C', 'Not Checked In', '2025-04-22');
INSERT INTO bookings VALUES (2019, 119, 105, '15A', 'Checked In', '2025-04-20');
INSERT INTO bookings VALUES (2020, 120, 105, '15B', 'Checked In', '2025-04-19');
INSERT INTO bookings VALUES (2021, 121, 105, '15C', 'Checked In', '2025-04-21');
INSERT INTO bookings VALUES (2022, 122, 106, '16A', 'Checked In', '2025-04-22');
INSERT INTO bookings VALUES (2023, 123, 106, '16B', 'Checked In', '2025-04-23');
INSERT INTO bookings VALUES (2024, 124, 106, '16C', 'Not Checked In', '2025-04-20');
INSERT INTO bookings VALUES (2025, 125, 107, '17A', 'Checked In', '2025-04-23');
INSERT INTO bookings VALUES (2026, 126, 107, '17B', 'Checked In', '2025-04-24');
INSERT INTO bookings VALUES (2027, 127, 107, '17C', 'Checked In', '2025-04-22');
INSERT INTO bookings VALUES (2028, 128, 108, '18A', 'Checked In', '2025-04-25');
INSERT INTO bookings VALUES (2029, 129, 108, '18B', 'Not Checked In', '2025-04-24');
INSERT INTO bookings VALUES (2030, 130, 108, '18C', 'Checked In', '2025-04-23');
INSERT INTO bookings VALUES (2031, 131, 109, '19A', 'Checked In', '2025-04-25');
INSERT INTO bookings VALUES (2032, 132, 109, '19B', 'Checked In', '2025-04-24');
INSERT INTO bookings VALUES (2033, 133, 109, '19C', 'Checked In', '2025-04-26');
INSERT INTO bookings VALUES (2034, 134, 110, '20A', 'Checked In', '2025-04-27');
INSERT INTO bookings VALUES (2035, 135, 110, '20B', 'Not Checked In', '2025-04-26');
INSERT INTO bookings VALUES (2036, 136, 110, '20C', 'Checked In', '2025-04-25');
INSERT INTO bookings VALUES (2037, 137, 111, '21A', 'Checked In', '2025-04-28');
INSERT INTO bookings VALUES (2038, 138, 111, '21B', 'Checked In', '2025-04-27');
INSERT INTO bookings VALUES (2039, 139, 111, '21C', 'Not Checked In', '2025-04-26');
INSERT INTO bookings VALUES (2040, 140, 112, '22A', 'Checked In', '2025-04-29');
INSERT INTO bookings VALUES (2041, 141, 112, '22B', 'Checked In', '2025-04-28');
INSERT INTO bookings VALUES (2042, 142, 112, '22C', 'Checked In', '2025-04-27');
INSERT INTO bookings VALUES (2043, 143, 113, '23A', 'Not Checked In', '2025-04-20');
INSERT INTO bookings VALUES (2044, 144, 113, '23B', 'Checked In', '2025-04-21');
INSERT INTO bookings VALUES (2045, 145, 113, '23C', 'Checked In', '2025-04-22');
INSERT INTO bookings VALUES (2046, 146, 114, '24A', 'Checked In', '2025-04-24');
INSERT INTO bookings VALUES (2047, 147, 114, '24B', 'Checked In', '2025-04-23');

-- Booking Details Data
INSERT INTO booking_details VALUES (2001, 1001, 101);
INSERT INTO booking_details VALUES (2002, 1002, 102);
INSERT INTO booking_details VALUES (2003, 1003, 103);


-- Crew Members Data
INSERT INTO crew_members VALUES (501, 'Lee', 'Amy', 55501, 'Pilot', '2020-01-01', 'amy.lee@example.com', '9991112222');
INSERT INTO crew_members VALUES (502, 'Jones', 'Tom', 55502, 'Co-Pilot', '2021-05-10', 'tom.jones@example.com', '8883334444');
INSERT INTO crew_members VALUES (503, 'Taylor', 'Sara', 55503, 'Attendant', '2022-07-15', 'sara.taylor@example.com', '7776665555');
-- Additional Crew Members Data
INSERT INTO crew_members VALUES (504, 'Johnson', 'Michael', 55504, 'Pilot', '2019-06-12', 'michael.johnson@example.com', '9991112223');
INSERT INTO crew_members VALUES (505, 'Williams', 'Jennifer', 55505, 'Co-Pilot', '2020-03-15', 'jennifer.williams@example.com', '9991112224');
INSERT INTO crew_members VALUES (506, 'Brown', 'David', 55506, 'Attendant', '2021-08-22', 'david.brown@example.com', '9991112225');
INSERT INTO crew_members VALUES (507, 'Davis', 'Lisa', 55507, 'Attendant', '2022-01-30', 'lisa.davis@example.com', '9991112226');
INSERT INTO crew_members VALUES (508, 'Miller', 'James', 55508, 'Pilot', '2018-11-05', 'james.miller@example.com', '9991112227');
INSERT INTO crew_members VALUES (509, 'Wilson', 'Elizabeth', 55509, 'Co-Pilot', '2020-07-19', 'elizabeth.wilson@example.com', '9991112228');
INSERT INTO crew_members VALUES (510, 'Moore', 'Robert', 55510, 'Attendant', '2021-04-03', 'robert.moore@example.com', '9991112229');
INSERT INTO crew_members VALUES (511, 'Taylor', 'Patricia', 55511, 'Pilot', '2019-02-14', 'patricia.taylor@example.com', '9991112230');
INSERT INTO crew_members VALUES (512, 'Anderson', 'John', 55512, 'Co-Pilot', '2020-09-28', 'john.anderson@example.com', '9991112231');
INSERT INTO crew_members VALUES (513, 'Thomas', 'Barbara', 55513, 'Attendant', '2022-05-16', 'barbara.thomas@example.com', '9991112232');
INSERT INTO crew_members VALUES (514, 'Jackson', 'William', 55514, 'Attendant', '2021-12-08', 'william.jackson@example.com', '9991112233');
INSERT INTO crew_members VALUES (515, 'White', 'Susan', 55515, 'Pilot', '2018-08-27', 'susan.white@example.com', '9991112234');
INSERT INTO crew_members VALUES (516, 'Harris', 'Richard', 55516, 'Co-Pilot', '2019-11-11', 'richard.harris@example.com', '9991112235');
INSERT INTO crew_members VALUES (517, 'Martin', 'Jessica', 55517, 'Attendant', '2022-03-05', 'jessica.martin@example.com', '9991112236');
INSERT INTO crew_members VALUES (518, 'Thompson', 'Charles', 55518, 'Pilot', '2019-05-22', 'charles.thompson@example.com', '9991112237');
INSERT INTO crew_members VALUES (519, 'Garcia', 'Sarah', 55519, 'Co-Pilot', '2020-10-14', 'sarah.garcia@example.com', '9991112238');
INSERT INTO crew_members VALUES (520, 'Martinez', 'Thomas', 55520, 'Attendant', '2021-07-31', 'thomas.martinez@example.com', '9991112239');
INSERT INTO crew_members VALUES (521, 'Robinson', 'Karen', 55521, 'Attendant', '2022-02-19', 'karen.robinson@example.com', '9991112240');
INSERT INTO crew_members VALUES (522, 'Clark', 'Daniel', 55522, 'Pilot', '2018-12-04', 'daniel.clark@example.com', '9991112241');
INSERT INTO crew_members VALUES (523, 'Rodriguez', 'Linda', 55523, 'Co-Pilot', '2019-09-26', 'linda.rodriguez@example.com', '9991112242');
INSERT INTO crew_members VALUES (524, 'Lewis', 'Paul', 55524, 'Attendant', '2021-03-17', 'paul.lewis@example.com', '9991112243');
INSERT INTO crew_members VALUES (525, 'Lee', 'Nancy', 55525, 'Pilot', '2019-01-08', 'nancy.lee@example.com', '9991112244');
INSERT INTO crew_members VALUES (526, 'Walker', 'Mark', 55526, 'Co-Pilot', '2020-05-30', 'mark.walker@example.com', '9991112245');
INSERT INTO crew_members VALUES (527, 'Hall', 'Sandra', 55527, 'Attendant', '2022-04-22', 'sandra.hall@example.com', '9991112246');
INSERT INTO crew_members VALUES (528, 'Allen', 'Joseph', 55528, 'Attendant', '2021-11-15', 'joseph.allen@example.com', '9991112247');
INSERT INTO crew_members VALUES (529, 'Young', 'Helen', 55529, 'Pilot', '2018-10-03', 'helen.young@example.com', '9991112248');
INSERT INTO crew_members VALUES (530, 'Hernandez', 'George', 55530, 'Co-Pilot', '2020-02-25', 'george.hernandez@example.com', '9991112249');
INSERT INTO crew_members VALUES (531, 'King', 'Donna', 55531, 'Attendant', '2021-06-18', 'donna.king@example.com', '9991112250');
INSERT INTO crew_members VALUES (532, 'Wright', 'Steven', 55532, 'Pilot', '2019-04-09', 'steven.wright@example.com', '9991112251');
INSERT INTO crew_members VALUES (533, 'Lopez', 'Carol', 55533, 'Co-Pilot', '2020-08-21', 'carol.lopez@example.com', '9991112252');
INSERT INTO crew_members VALUES (534, 'Hill', 'Edward', 55534, 'Attendant', '2022-01-13', 'edward.hill@example.com', '9991112253');
INSERT INTO crew_members VALUES (535, 'Scott', 'Ruth', 55535, 'Attendant', '2021-10-07', 'ruth.scott@example.com', '9991112254');

SELECT * FROM crew_members;

-- Updated Crew Details Data + new Data
INSERT INTO crew_details VALUES (3001, 501, 101);
INSERT INTO crew_details VALUES (3002, 502, 101);
INSERT INTO crew_details VALUES (3003, 503, 101);
INSERT INTO crew_details VALUES (3004, 506, 101);

INSERT INTO crew_details VALUES (3005, 504, 102);
INSERT INTO crew_details VALUES (3006, 505, 102);
INSERT INTO crew_details VALUES (3007, 507, 102);
INSERT INTO crew_details VALUES (3008, 510, 102);

INSERT INTO crew_details VALUES (3009, 508, 103);
INSERT INTO crew_details VALUES (3010, 509, 103);
INSERT INTO crew_details VALUES (3011, 513, 103);
INSERT INTO crew_details VALUES (3012, 514, 103);

INSERT INTO crew_details VALUES (3013, 511, 104);
INSERT INTO crew_details VALUES (3014, 512, 104);
INSERT INTO crew_details VALUES (3015, 517, 104);
INSERT INTO crew_details VALUES (3016, 520, 104);

INSERT INTO crew_details VALUES (3017, 515, 105);
INSERT INTO crew_details VALUES (3018, 516, 105);
INSERT INTO crew_details VALUES (3019, 521, 105);
INSERT INTO crew_details VALUES (3020, 524, 105);

INSERT INTO crew_details VALUES (3021, 518, 106);
INSERT INTO crew_details VALUES (3022, 519, 106);
INSERT INTO crew_details VALUES (3023, 527, 106);
INSERT INTO crew_details VALUES (3024, 528, 106);

INSERT INTO crew_details VALUES (3025, 522, 107);
INSERT INTO crew_details VALUES (3026, 523, 107);
INSERT INTO crew_details VALUES (3027, 531, 107);
INSERT INTO crew_details VALUES (3028, 534, 107);

INSERT INTO crew_details VALUES (3029, 525, 108);
INSERT INTO crew_details VALUES (3030, 526, 108);
INSERT INTO crew_details VALUES (3031, 535, 108);

INSERT INTO crew_details VALUES (3032, 529, 109);
INSERT INTO crew_details VALUES (3033, 530, 109);
INSERT INTO crew_details VALUES (3034, 503, 109);
INSERT INTO crew_details VALUES (3035, 506, 109);

INSERT INTO crew_details VALUES (3036, 532, 110);
INSERT INTO crew_details VALUES (3037, 533, 110);
INSERT INTO crew_details VALUES (3038, 510, 110);
INSERT INTO crew_details VALUES (3039, 517, 110);

INSERT INTO crew_details VALUES (3040, 504, 111);
INSERT INTO crew_details VALUES (3041, 509, 111);
INSERT INTO crew_details VALUES (3042, 513, 111);
INSERT INTO crew_details VALUES (3043, 524, 111);

INSERT INTO crew_details VALUES (3044, 508, 112);
INSERT INTO crew_details VALUES (3045, 512, 112);
INSERT INTO crew_details VALUES (3046, 521, 112);
INSERT INTO crew_details VALUES (3047, 528, 112);

INSERT INTO crew_details VALUES (3048, 511, 113);
INSERT INTO crew_details VALUES (3049, 516, 113);
INSERT INTO crew_details VALUES (3050, 531, 113);

INSERT INTO crew_details VALUES (3051, 515, 114);
INSERT INTO crew_details VALUES (3052, 519, 114);
INSERT INTO crew_details VALUES (3053, 534, 114);
INSERT INTO crew_details VALUES (3054, 535, 114);

SELECT * FROM crew_details;
