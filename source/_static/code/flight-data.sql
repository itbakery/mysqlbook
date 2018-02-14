INSERT INTO locations
    (code,name)
    VALUES ('JFK','New York');
INSERT INTO locations
    (code,name)
    VALUES ('PVG','Shanghai');
INSERT INTO locations
    (code,name)
    VALUES ('IST','Istanbul');
INSERT INTO locations
    (code,name)
    VALUES ('LHR','London');
INSERT INTO locations
    (code,name)
    VALUES ('SVO','Moscow');
INSERT INTO locations
    (code,name)
    VALUES ('Lim','Lima');
INSERT INTO locations
    (code,name)
    VALUES ('CDG','Paris');
INSERT INTO locations
    (code,name)
    VALUES ('NRT','Tokyo');

INSERT INTO flights
    (origin_id, destination_id, duration)
    VALUES (1, 4, 415);
INSERT INTO flights
    (origin_id, destination_id, duration)
    VALUES (2, 7, 415);
INSERT INTO flights
    (origin_id, destination_id, duration)
    VALUES (3, 8, 415);
INSERT INTO flights
    (origin_id, destination_id, duration)
    VALUES (1, 7, 415);
INSERT INTO flights
    (origin_id, destination_id, duration)
    VALUES (5, 7, 415);
INSERT INTO flights
    (origin_id, destination_id, duration)
    VALUES ('6', '1', 415);

INSERT INTO passengers
    (name, flight_id)
    VALUES ('Alice',1);
INSERT INTO passengers
    (name, flight_id)
    VALUES ('Bob',1);
INSERT INTO passengers
    (name, flight_id)
    VALUES ('Charlie',2);
INSERT INTO passengers
    (name, flight_id)
    VALUES ('Dave',2);
INSERT INTO passengers
    (name, flight_id)
    VALUES ('Erin',4);
INSERT INTO passengers
    (name, flight_id)
    VALUES ('Frank',6);
INSERT INTO passengers
    (name, flight_id)
    VALUES ('Grace',6);
