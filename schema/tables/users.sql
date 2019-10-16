-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
    id uuid NOT NULL DEFAULT gen_random_uuid(),
    username character varying(16) COLLATE pg_catalog."default" NOT NULL,
    password_hash character varying(256) COLLATE pg_catalog."default" NOT NULL,
    first_name character varying(16) COLLATE pg_catalog."default" NOT NULL,
    last_name character varying(16) COLLATE pg_catalog."default",
    phone character varying(12) COLLATE pg_catalog."default" NOT NULL,
    is_active boolean NOT NULL,
    last_active_timestamp timestamp without time zone,
    create_timestamp timestamp without time zone NOT NULL DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_pkey PRIMARY KEY (id)
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE public.users
    OWNER to jot_mvp_user;