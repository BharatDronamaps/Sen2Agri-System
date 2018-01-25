﻿-- Table: datasource

-- DROP TABLE datasource;

CREATE TABLE datasource
(
  id smallserial NOT NULL,
  satellite_id smallint NOT NULL,
  name character varying(50) NOT NULL,
  scope smallint NOT NULL DEFAULT 3,
  username character varying(100),
  passwrd character varying(100),
  fetch_mode smallint NOT NULL DEFAULT 1,
  max_retries integer NOT NULL DEFAULT 3,
  retry_interval_minutes integer NOT NULL DEFAULT 3600,
  download_path character varying(255),
  specific_params json,
  max_connections integer NOT NULL DEFAULT 1,
  local_root character varying(255),
  enabled boolean NOT NULL DEFAULT false,
  CONSTRAINT pk_datasource PRIMARY KEY (id),
  CONSTRAINT datasource_satellite_id_fkey FOREIGN KEY (satellite_id)
      REFERENCES satellite (id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
)
WITH (
  OIDS=FALSE
);
ALTER TABLE datasource
  OWNER TO admin;
