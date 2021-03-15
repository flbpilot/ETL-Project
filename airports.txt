-- Table: public.airports

-- DROP TABLE public.airports;

CREATE TABLE public.airports
(
    icao text COLLATE pg_catalog."default" NOT NULL,
    airport_id bigint,
    airport_name text COLLATE pg_catalog."default",
    city text COLLATE pg_catalog."default",
    iata text COLLATE pg_catalog."default",
    timezone text COLLATE pg_catalog."default",
    CONSTRAINT airports_pkey PRIMARY KEY (icao)
)

TABLESPACE pg_default;

ALTER TABLE public.airports
    OWNER to postgres;
-- Index: ix_airports_icao

-- DROP INDEX public.ix_airports_icao;

CREATE INDEX ix_airports_icao
    ON public.airports USING btree
    (icao COLLATE pg_catalog."default" ASC NULLS LAST)
    TABLESPACE pg_default;