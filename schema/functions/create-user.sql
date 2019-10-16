-- FUNCTION: public.create_user(text, text, text, text, text)

-- DROP FUNCTION public.create_user(text, text, text, text, text);

CREATE OR REPLACE FUNCTION public.create_user(
	username text,
	password_text text,
	first_name text,
	last_name text,
	phone text)
    RETURNS text
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE
	user_id text;
BEGIN
	insert into users (username, password_hash, first_name, last_name, phone) 
	values ($1, hash($2), $3, $4) returning id into user_id;
	
	return user_id;
END;
$BODY$;

ALTER FUNCTION public.create_user(text, text, text, text, text)
    OWNER TO jot_mvp_user;