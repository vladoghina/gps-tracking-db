# GPS Vehicle Tracking Database

Relational database (MySQL) for monitoring a fleet of cars with GPS devices. University project, done in a team of 4.

## Requirements

- Track 500+ vehicles and 500+ drivers
- Multiple trips per vehicle per day
- GPS positions stored periodically (largest table)
- Separate handling of system alerts
- 10+ years of operation

## Data model

Relationships (1:N unless noted):

- `Utilizator` administers many `Autoturism`
- `Sofer` drives `Autoturism` (a driver may be unassigned)
- `Autoturism` has one `Dispozitiv_GPS`, makes many `Traseu` and triggers many `Alerta`
- `Traseu` contains many `Pozitie_GPS`

| Table | Purpose |
|---|---|
| `Utilizator` | Users of the system (admin, dispatcher, manager) |
| `Sofer` | Drivers |
| `Autoturism` | Vehicles, linked to a driver and an administrating user |
| `Dispozitiv_GPS` | GPS device installed on a vehicle (status: active / inactive / faulty) |
| `Traseu` | A trip made by a vehicle (start/end time and location) |
| `Pozitie_GPS` | Periodic GPS readings (latitude, longitude, speed, timestamp) |
| `Alerta` | Events such as speeding or GPS signal loss |

### Design decisions

- Integer types sized by expected volume: `SMALLINT UNSIGNED` for vehicles/drivers/users, `MEDIUMINT UNSIGNED` for trips and alerts, `INT UNSIGNED` for GPS positions.
- `DECIMAL` for coordinates and speed to keep fixed precision.
- `UNIQUE` on email, phone and license plate.
- Foreign keys with explicit rules, e.g. deleting a driver sets `Autoturism.id_sofer` to `NULL`, while deleting a vehicle cascades to its trips, devices and alerts.

## Files

| File | Content |
|---|---|
| `schema.sql` | `CREATE DATABASE` / `CREATE TABLE` statements |
| `data.sql` | Sample data |
| `queries.sql` | Example `JOIN` queries |

## Example queries

1. Vehicles with their driver and administrating user
2. Trips with vehicle and driver details
3. GPS positions with their trip and vehicle, ordered by time

## Run it

```bash
mysql -u <user> -p < schema.sql
mysql -u <user> -p monitorizare_gps < data.sql
mysql -u <user> -p monitorizare_gps < queries.sql
```

## Notes

- Sample passwords are test values only. A production system would store password hashes (e.g. bcrypt/argon2), not plain text.
- Team project (4 members).
