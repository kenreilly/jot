-- FUNCTION: public.authenticate_user(text, text)

-- DROP FUNCTION public.authenticate_user(text, text);

CREATE OR REPLACE FUNCTION public.authenticate_user(
	username text,
	password_text text)
    RETURNS authenticated_user
    LANGUAGE 'plpgsql'

    COST 100
    VOLATILE 
AS $BODY$
DECLARE
	user authenticated_user;
BEGIN
	select into user.id, user.username, user.first_name, user.last_name, user.phone, user.is_active, user.last_active_timestamp 
		id, username, first_name, last_name, phone, is_active, current_timestamp from users 
		where users.username = $1
		and users.password_hash = crypt($2, password_hash);
	return user;
END;
$BODY$;

ALTER FUNCTION public.authenticate_user(text, text)
    OWNER TO jot_mvp_user;