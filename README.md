# Data-Wranglers Data Population, Queries and Automation

## Stored Procedure Get_Daily_Flight_Schedule
### Purpose
Retrieves all flights scheduled for the current day along with details such as departure/arrival times, cities, flight status, plane status, and assigned crew.

### Usage 
CALL Get_Daily_Flight_Schedule();

### Explanation
This procedure performs the following actions:
- Joins `flights` with `planes` to get each plane's operational status.
- Optionally joins `crew_details` to show which crew members are assigned to the flight.
- Filters the results to **only include flights scheduled for the current date** using `CURDATE()`.
- Sorts the output by departure time.

## Trigger: `log_plane_maintenance_update`

### Table Planes
### Event `AFTER UPDATE`

### Purpose
Automatically logs maintenance activity any time a plane's last maintenance date or operational status changes.

### Explanation
This trigger:
- Activates when an `UPDATE` happens on the `planes` table.
- Checks if `last_maintenance` or `operation_status` has changed.
- If yes, inserts a new record into the `maintenance_log` table with both the **old and new values

## Trigger: `log_new_passenger`

### Table `passengers`
### Event: `AFTER INSERT`

### Purpose
Logs every new passenger registration.

### Explanation
This trigger:
- Fires after a new record is inserted into `passengers`.
- Inserts a new record into the `passenger_log` table that includes:
  - Passenger ID
  - Full name (first + last)
  - Email
  - Timestamp of registration (defaulted)

## Trigger: `log_new_booking`

### Table `bookings`
### Event: `AFTER INSERT`

### Purpose
Tracks new bookings in the system

### Explanation
Whenever a new booking is made:
- This trigger creates a record in `booking_log` showing:
  - The booking ID
  - Passenger ID
  - Flight ID
  - Seat number
  - Timestamp (auto-generated)
