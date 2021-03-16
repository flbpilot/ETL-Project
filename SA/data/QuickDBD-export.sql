-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.

-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.
-- Delete tables if exists

-- Create tables
CREATE TABLE "airports" (
    "airport_id" VARCHAR(5)   NOT NULL,
    "name" VARCHAR(100)   NOT NULL,
    "city" VARCHAR(50)   NOT NULL,
    "icao" VARCHAR(4)   NOT NULL,
    "timezone" INT   NOT NULL,
    CONSTRAINT "pk_airports" PRIMARY KEY (
        "airport_id"
     )
);

CREATE TABLE "airlines" (
    "airline_id" INTEGER   NOT NULL,
    "airline_name" VARCHAR(100)   NOT NULL,
    "icao" VARCHAR(4)   NOT NULL,
    "iata" VARCHAR(4)   NOT NULL,
    "active" VARCHAR(1)   NOT NULL,
    CONSTRAINT "pk_airlines" PRIMARY KEY (
        "airline_id"
     )
);

CREATE TABLE "routes" (
    "route_id" SERIAL   NOT NULL,
    "airline_id" INTEGER   NOT NULL,
    "source_iata" VARCHAR(4)   NOT NULL,
    "sour_airp_id" VARCHAR(5)   NOT NULL,
    "destination_iata" VARCHAR(4)   NOT NULL,
    "dest_airp_id" VARCHAR(5)   NOT NULL,
    CONSTRAINT "pk_routes" PRIMARY KEY (
        "route_id"
     )
);

ALTER TABLE "airports" ADD CONSTRAINT "fk_airports_airport_id" FOREIGN KEY("airport_id")
REFERENCES "routes" ("airline_id");

ALTER TABLE "routes" ADD CONSTRAINT "fk_routes_airline_id" FOREIGN KEY("airline_id")
REFERENCES "airlines" ("airline_id");

ALTER TABLE "routes" ADD CONSTRAINT "fk_routes_sour_airp_id" FOREIGN KEY("sour_airp_id")
REFERENCES "airports" ("airport_id");

