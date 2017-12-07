CREATE TABLE locations
(
  id bigint NOT NULL PRIMARY KEY,
  country character(2) NOT NULL,
  region character(2),
  city character varying(75),
  postal_code character varying(15),
  latitude numeric(6,4) NOT NULL,
  longitude numeric(7,4),
  metro_code integer,
  area_code integer
);

CREATE TABLE blocks
(
  id serial primary key,
  start_ip bigint NOT NULL,
  end_ip bigint NOT NULL,
  location_id bigint NOT NULL
);

CREATE OR REPLACE FUNCTION ip2int(inet) RETURNS bigint AS $$
    SELECT $1 - inet '0.0.0.0'
$$ LANGUAGE SQL;

COPY locations (id, country, region, city, postal_code, latitude, longitude, metro_code, area_code)
FROM '/geo/GeoLiteCity-Location.csv' WITH CSV HEADER ENCODING 'latin1';

COPY blocks (start_ip, end_ip, location_id)
FROM '/geo/GeoLiteCity-Blocks.csv' WITH CSV HEADER;