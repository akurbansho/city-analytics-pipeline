-- -------------------------------------------------
-- Table definition for city‑level analytics data
-- -------------------------------------------------
CREATE TABLE IF NOT EXISTS city_data (
    city_id      SERIAL PRIMARY KEY,                     -- auto‑incrementing integer
    city_name    TEXT NOT NULL,                         -- name of the city
    population   BIGINT,                                 -- total inhabitants
    area_km2     NUMERIC,                               -- surface area in km²
    density      NUMERIC GENERATED ALWAYS AS
                 (population / NULLIF(area_km2,0)) STORED -- derived column (people per km²)
);
