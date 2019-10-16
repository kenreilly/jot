-- Type: new_user

-- DROP TYPE public.new_user;

CREATE TYPE public.new_user AS
(
	id uuid,
	username character varying(16)
);

ALTER TYPE public.new_user
    OWNER TO jot_mvp_user;
