-- FUNCTION: public.hash(text)

-- DROP FUNCTION public.hash(text);

CREATE OR REPLACE FUNCTION public.hash(
	str text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
BEGIN
  RETURN crypt($1, gen_salt('bf', 8));
END;
$BODY$;

ALTER FUNCTION public.hash(text)
    OWNER TO jot_mvp_user;
