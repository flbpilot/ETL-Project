-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

--Delete tables if exists
DROP TABLE IF EXISTS routes;
DROP TABLE IF EXISTS airlines;
DROP TABLE IF EXISTS airports;

--Create tables 
CREATE TABLE airports (
    airport_id VARCHAR(5) PRIMARY KEY NOT NULL,
    name VARCHAR(100),
    city VARCHAR(50),
    iaco VARCHAR(4),
	iata VARCHAR(4),
	timezone INT
);

CREATE TABLE airlines (
    airline_id INTEGER PRIMARY KEY  NOT NULL,
    airline_name VARCHAR(100),
    icao VARCHAR(4),
    iata VARCHAR(4),
	active VARCHAR(1)
     
);

CREATE TABLE routes (
    route_id SERIAL PRIMARY KEY NOT NULL,
    airline_id INTEGER,
    source_iata VARCHAR(4),
	sour_airp_id VARCHAR(5),                                
    destination_iata VARCHAR(4),
	dest_airp_id VARCHAR(5),
    FOREIGN KEY (airline_id) REFERENCES airlines(airline_id)
);


