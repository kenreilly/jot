-- Type: authenticated_user

-- DROP TYPE public.authenticated_user;

CREATE TYPE public.authenticated_user AS
(
	id uuid,
	username character varying,
	first_name character varying,
	last_name character varying,
	phone character varying,
	is_active boolean,
	last_active_timestamp timestamp without time zone
);

ALTER TYPE public.authenticated_user
    OWNER TO jot_mvp_user;

