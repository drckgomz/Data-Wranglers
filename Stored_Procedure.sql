USE SkyRunner_Airlines_db;

-- Stored Procedure: Get_Daily_Flight_Schedule
-- Purpose: Retrieves all flights scheduled for current day with their assigned crew, plane and flight status

DROP PROCEDURE IF EXISTS Get_Daily_Flight_Schedule;

CREATE PROCEDURE Get_Daily_Flight_Schedule()
BEGIN
    -- Select all flights scheduled for the current day with their details
    SELECT 
        f.flight_id,
        f.departure_time,
        f.arrival_time,
        f.origin_city,
        f.destination_city,
        f.flight_status,
        f.plane_id,
        p.operation_status AS plane_status
    FROM 
        flights f
    INNER JOIN 
        planes p ON f.plane_id = p.plane_id
    WHERE
        DATE(f.departure_time) = CURDATE()
    ORDER BY 
        f.departure_time;
END;

DROP PROCEDURE IF EXISTS Get_Weekly_Crew_Schedule;

CREATE PROCEDURE Get_Weekly_Crew_Schedule()
BEGIN
    SELECT
        cm.crew_member_id,
        CONCAT(cm.crew_member_first_name, ' ', cm.crew_member_last_name) AS crew_member_name,
        cm.crew_role,
        f.flight_id,
        f.departure_time,
        f.arrival_time,
        f.origin_city,
        f.destination_city,
        f.flight_status,
        p.plane_id,
        p.aircraft_type,
        p.operation_status AS plane_status
    FROM
        crew_members cm
    INNER JOIN
        crew_details cd ON cm.crew_member_id = cd.crew_member_id
    INNER JOIN
        flights f ON cd.flight_id = f.flight_id
    INNER JOIN
        planes p ON f.plane_id = p.plane_id
    WHERE
        f.departure_time BETWEEN CURDATE() AND DATE_ADD(CURDATE(), INTERVAL 7 DAY)
    ORDER BY
        cm.crew_member_id, f.departure_time;
END;

DELIMITER ;

-- Example usage:
CALL Get_Daily_Flight_Schedule();
CALL Get_Weekly_Crew_Schedule();
