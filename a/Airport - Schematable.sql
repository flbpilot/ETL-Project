-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE "airport" (
    "airport_id" INT   NOT NULL,
    "icao" TEXT   NOT NULL,
    "airport_name" TEXT   NOT NULL,
    "country" TEXT   NOT NULL,
    "city" TEXT   NOT NULL,
    "latitude" FLOAT   NOT NULL,
    "longitude" FLOAT   NOT NULL,
    CONSTRAINT "pk_airport" PRIMARY KEY (
        "airport_id"
     )
);

CREATE TABLE "routes" (
    "route_id" INT   NOT NULL,
    "destination_airport" TEXT   NOT NULL,
    "airline_id" INT   NOT NULL,
    CONSTRAINT "pk_routes" PRIMARY KEY (
        "route_id"
     )
);

CREATE TABLE "airlines" (
    "airline_id" INT   NOT NULL,
    "airline_name" TEXT   NOT NULL,
    "icao" TEXT   NOT NULL,
    CONSTRAINT "pk_airlines" PRIMARY KEY (
        "airline_id"
     )
);

ALTER TABLE "routes" ADD CONSTRAINT "fk_routes_airline_id" FOREIGN KEY("airline_id")
REFERENCES "airlines" ("airline_id");

ALTER TABLE "airlines" ADD CONSTRAINT "fk_airlines_icao" FOREIGN KEY("icao")
REFERENCES "airport" ("icao");

