USE SkyRunner_Airlines_db
-- Stored Procedure: Get_Daily_Flight_Schedule
-- Purpose: Retrieves all flights scheduled for current day with their assigned crew, plane and flight status
DELIMITER //

CREATE PROCEDURE Get_Daily_Flight_Schedule()
BEGIN
    -- Select all flights scheduled for the current day with their details
    SELECT 
        f.flight_id,
		p.plane_id,
        f.departure_time,
        f.arrival_time,
        f.origin_city,
        f.destination_city,
        f.flight_status,
        p.operation_status AS plane_status,
        cd.crew_details_id
    FROM 
        flights f
    INNER JOIN 
        planes p ON f.plane_id = p.plane_id
    LEFT JOIN 
        crew_details cd ON f.flight_id = cd.flight_id
    WHERE 
        DATE(f.departure_time) = CURDATE()
    ORDER BY 
        f.departure_time;
END //

DELIMITER ;

-- Example usage:
CALL Get_Daily_Flight_Schedule();