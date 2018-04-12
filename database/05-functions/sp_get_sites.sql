﻿CREATE OR REPLACE FUNCTION sp_get_sites(IN _site_id integer[] DEFAULT NULL::integer[])
  RETURNS TABLE(id smallint, name character varying, short_name character varying, enabled boolean) AS
$BODY$
BEGIN
   RETURN QUERY
        SELECT site.id,
               site.name,
               site.short_name,
               site.enabled
        FROM site
        WHERE _site_id IS NULL OR site.id = ANY(_site_id)
        ORDER BY site.name;
END
$BODY$
  LANGUAGE plpgsql;
