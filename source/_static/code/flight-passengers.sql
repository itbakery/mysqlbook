DROP TABLE flights;

CREATE TABLE locations (
    id SERIAL PRIMARY KEY,
    code VARCHAR NOT NULL,
    name VARCHAR NOT NULL
);

CREATE TABLE flights (
    id SERIAL PRIMARY KEY,
    origin_id INTEGER REFERENCES locations,
    destination_id INTEGER REFERENCES locations,
    duration INTEGER NOT NULL
);

CREATE TABLE passengers (
    id SERIAL PRIMARY KEY,
    name VARCHAR NOT NULL,
    flight_id INTEGER REFERENCES flights
);
