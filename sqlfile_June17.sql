--
-- PostgreSQL database dump
--

-- Dumped from database version 10.11 (Ubuntu 10.11-1.pgdg16.04+1)
-- Dumped by pg_dump version 12.1 (Ubuntu 12.1-1.pgdg16.04+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: postgis; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS postgis WITH SCHEMA public;


--
-- Name: EXTENSION postgis; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION postgis IS 'PostGIS geometry, geography, and raster spatial types and functions';


SET default_tablespace = '';

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO papli;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: papli
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO papli;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: papli
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO papli;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: papli
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO papli;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: papli
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO papli;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: papli
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO papli;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: papli
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO papli;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO papli;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: papli
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO papli;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: papli
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: papli
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO papli;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: papli
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO papli;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: papli
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO papli;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: papli
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO papli;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: papli
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO papli;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: papli
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO papli;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: papli
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO papli;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: papli
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO papli;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: papli
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO papli;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: papli
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO papli;

--
-- Name: reciever_conversiontable; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.reciever_conversiontable (
    name character varying(100) NOT NULL
);


ALTER TABLE public.reciever_conversiontable OWNER TO papli;

--
-- Name: reciever_potholeupdationimages; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.reciever_potholeupdationimages (
    id integer NOT NULL,
    updated_image character varying(100) NOT NULL,
    "cordinate_X" double precision NOT NULL,
    "cordinate_Y" double precision NOT NULL,
    created_date timestamp with time zone NOT NULL,
    is_filled boolean NOT NULL,
    checked boolean NOT NULL,
    distance integer NOT NULL,
    point public.geography(Point,4326) NOT NULL,
    premise character varying(100),
    park character varying(100),
    airport character varying(100),
    natural_feature character varying(100),
    postal_code character varying(100),
    plus_code character varying(100),
    subpremise character varying(100),
    neighborhood character varying(100),
    sublocality_level_1 character varying(100),
    sublocality_level_2 character varying(100),
    sublocality_level_3 character varying(100),
    sublocality_level_4 character varying(100),
    sublocality_level_5 character varying(100),
    locality character varying(100),
    colloquial_area character varying(100),
    administrative_area_level_1 character varying(100),
    administrative_area_level_2 character varying(100),
    administrative_area_level_3 character varying(100),
    administrative_area_level_4 character varying(100),
    administrative_area_level_5 character varying(100),
    country character varying(100),
    intersection character varying(100),
    route character varying(100),
    street_address character varying(100),
    formatted_address text,
    name_id character varying(100) NOT NULL
);


ALTER TABLE public.reciever_potholeupdationimages OWNER TO papli;

--
-- Name: reciever_potholeupdationimages_id_seq; Type: SEQUENCE; Schema: public; Owner: papli
--

CREATE SEQUENCE public.reciever_potholeupdationimages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reciever_potholeupdationimages_id_seq OWNER TO papli;

--
-- Name: reciever_potholeupdationimages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: papli
--

ALTER SEQUENCE public.reciever_potholeupdationimages_id_seq OWNED BY public.reciever_potholeupdationimages.id;


--
-- Name: reciever_recievingpotholeimages; Type: TABLE; Schema: public; Owner: papli
--

CREATE TABLE public.reciever_recievingpotholeimages (
    name character varying(100) NOT NULL,
    area integer NOT NULL,
    number integer NOT NULL,
    "cordinate_X" double precision NOT NULL,
    "cordinate_Y" double precision NOT NULL,
    "RCreated_date" timestamp with time zone NOT NULL,
    "ROwner" character varying(100) NOT NULL,
    agency_name character varying(100) NOT NULL,
    "rawImage" character varying(100) NOT NULL,
    "maskedImage" character varying(100) NOT NULL,
    point public.geography(Point,4326) NOT NULL,
    premise character varying(100),
    park character varying(100),
    airport character varying(100),
    natural_feature character varying(100),
    postal_code character varying(100),
    plus_code character varying(100),
    subpremise character varying(100),
    neighborhood character varying(100),
    sublocality_level_1 character varying(100),
    sublocality_level_2 character varying(100),
    sublocality_level_3 character varying(100),
    sublocality_level_4 character varying(100),
    sublocality_level_5 character varying(100),
    locality character varying(100),
    colloquial_area character varying(100),
    administrative_area_level_1 character varying(100),
    administrative_area_level_2 character varying(100),
    administrative_area_level_3 character varying(100),
    administrative_area_level_4 character varying(100),
    administrative_area_level_5 character varying(100),
    country character varying(100),
    intersection character varying(100),
    route character varying(100),
    street_address character varying(100),
    formatted_address text,
    "maskedImageUrl" text NOT NULL,
    "rawImageUrl" text NOT NULL
);


ALTER TABLE public.reciever_recievingpotholeimages OWNER TO papli;

--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: reciever_potholeupdationimages id; Type: DEFAULT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.reciever_potholeupdationimages ALTER COLUMN id SET DEFAULT nextval('public.reciever_potholeupdationimages_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	3	add_permission
6	Can change permission	3	change_permission
7	Can delete permission	3	delete_permission
8	Can view permission	3	view_permission
9	Can add user	4	add_user
10	Can change user	4	change_user
11	Can delete user	4	delete_user
12	Can view user	4	view_user
13	Can add group	2	add_group
14	Can change group	2	change_group
15	Can delete group	2	delete_group
16	Can view group	2	view_group
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add recieving pothole images	8	add_recievingpotholeimages
26	Can change recieving pothole images	8	change_recievingpotholeimages
27	Can delete recieving pothole images	8	delete_recievingpotholeimages
28	Can view recieving pothole images	8	view_recievingpotholeimages
29	Can add conversion table	9	add_conversiontable
30	Can change conversion table	9	change_conversiontable
31	Can delete conversion table	9	delete_conversiontable
32	Can view conversion table	9	view_conversiontable
33	Can add pothole updation images	7	add_potholeupdationimages
34	Can change pothole updation images	7	change_potholeupdationimages
35	Can delete pothole updation images	7	delete_potholeupdationimages
36	Can view pothole updation images	7	view_potholeupdationimages
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$150000$E8F4MrPUyvY9$EgWEgn8ShNCl7PfBXkipNpUbIqOoVNyV6zPtwUR/ftI=	2020-06-14 08:07:16.498977+05:30	t	test			pradyumg@gmail.com	t	t	2020-06-08 21:46:54.194233+05:30
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2020-06-14 10:40:39.531183+05:30	14	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
2	2020-06-14 10:40:39.535549+05:30	13	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
3	2020-06-14 10:40:39.538003+05:30	12	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
4	2020-06-14 10:40:39.540629+05:30	11	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
5	2020-06-14 10:40:39.543024+05:30	10	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
6	2020-06-14 10:40:39.545209+05:30	9	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
7	2020-06-14 10:40:39.547625+05:30	8	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
8	2020-06-14 10:40:39.549851+05:30	7	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
9	2020-06-14 10:40:39.552139+05:30	6	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
10	2020-06-14 10:40:39.554027+05:30	5	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
11	2020-06-14 10:40:39.556076+05:30	4	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
12	2020-06-14 10:40:39.558162+05:30	3	ffc4eb91-8630-4615-8099-0f50099fc2ea	3		7	1
13	2020-06-14 10:40:39.560186+05:30	2	ffc4eb91-8630-4615-8099-0f50099fc2ea	3		7	1
14	2020-06-14 10:40:39.562304+05:30	1	ffc4eb91-8630-4615-8099-0f50099fc2ea	3		7	1
15	2020-06-14 10:42:11.042765+05:30	16	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
16	2020-06-14 10:42:11.045764+05:30	15	fee7e0ae-247f-4b69-b726-9a9340f7ff1d	3		7	1
17	2020-06-16 12:41:25.650303+05:30	359115c4-4be2-4991-9cdd-35c660fc20e3	359115c4-4be2-4991-9cdd-35c660fc20e3	3		8	1
18	2020-06-16 12:41:40.812179+05:30	bbadcf7e-4224-41b2-a26d-0173a2445702	bbadcf7e-4224-41b2-a26d-0173a2445702	3		8	1
19	2020-06-16 12:41:54.77913+05:30	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	3		8	1
20	2020-06-16 12:42:08.012161+05:30	9404ee40-8499-4975-96fa-714b906949ad	9404ee40-8499-4975-96fa-714b906949ad	3		8	1
21	2020-06-16 12:45:04.876483+05:30	359115c4-4be2-4991-9cdd-35c660fc20e3	359115c4-4be2-4991-9cdd-35c660fc20e3	3		8	1
22	2020-06-16 12:45:22.733046+05:30	bbadcf7e-4224-41b2-a26d-0173a2445702	bbadcf7e-4224-41b2-a26d-0173a2445702	3		8	1
23	2020-06-16 12:45:40.686973+05:30	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	3		8	1
24	2020-06-16 12:45:54.223016+05:30	9404ee40-8499-4975-96fa-714b906949ad	9404ee40-8499-4975-96fa-714b906949ad	3		8	1
25	2020-06-17 19:49:19.280553+05:30	bbadcf7e-4224-41b2-a26d-0173a2445702	bbadcf7e-4224-41b2-a26d-0173a2445702	3		8	1
26	2020-06-17 19:49:19.283299+05:30	9404ee40-8499-4975-96fa-714b906949ad	9404ee40-8499-4975-96fa-714b906949ad	3		8	1
27	2020-06-17 19:49:19.284801+05:30	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	3		8	1
28	2020-06-17 19:49:19.286426+05:30	359115c4-4be2-4991-9cdd-35c660fc20e3	359115c4-4be2-4991-9cdd-35c660fc20e3	3		8	1
29	2020-06-17 19:59:25.238983+05:30	bbadcf7e-4224-41b2-a26d-0173a2445702	bbadcf7e-4224-41b2-a26d-0173a2445702	3		8	1
30	2020-06-17 19:59:25.241698+05:30	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	3		8	1
31	2020-06-17 19:59:25.24324+05:30	359115c4-4be2-4991-9cdd-35c660fc20e3	359115c4-4be2-4991-9cdd-35c660fc20e3	3		8	1
32	2020-06-17 20:07:54.305756+05:30	bbadcf7e-4224-41b2-a26d-0173a2445702	bbadcf7e-4224-41b2-a26d-0173a2445702	3		8	1
33	2020-06-17 20:07:54.308436+05:30	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	3		8	1
34	2020-06-17 20:07:54.309965+05:30	359115c4-4be2-4991-9cdd-35c660fc20e3	359115c4-4be2-4991-9cdd-35c660fc20e3	3		8	1
35	2020-06-17 20:13:17.510532+05:30	bbadcf7e-4224-41b2-a26d-0173a2445702	bbadcf7e-4224-41b2-a26d-0173a2445702	3		8	1
36	2020-06-17 20:13:17.513104+05:30	9404ee40-8499-4975-96fa-714b906949ad	9404ee40-8499-4975-96fa-714b906949ad	3		8	1
37	2020-06-17 20:13:17.514706+05:30	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	3		8	1
38	2020-06-17 20:13:17.516167+05:30	359115c4-4be2-4991-9cdd-35c660fc20e3	359115c4-4be2-4991-9cdd-35c660fc20e3	3		8	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	group
3	auth	permission
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	reciever	potholeupdationimages
8	reciever	recievingpotholeimages
9	reciever	conversiontable
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2020-06-08 19:51:06.221071+05:30
2	auth	0001_initial	2020-06-08 19:51:06.32968+05:30
3	admin	0001_initial	2020-06-08 19:51:06.409643+05:30
4	admin	0002_logentry_remove_auto_add	2020-06-08 19:51:06.433648+05:30
5	admin	0003_logentry_add_action_flag_choices	2020-06-08 19:51:06.446203+05:30
6	contenttypes	0002_remove_content_type_name	2020-06-08 19:51:06.470762+05:30
7	auth	0002_alter_permission_name_max_length	2020-06-08 19:51:06.478909+05:30
8	auth	0003_alter_user_email_max_length	2020-06-08 19:51:06.492611+05:30
9	auth	0004_alter_user_username_opts	2020-06-08 19:51:06.504063+05:30
10	auth	0005_alter_user_last_login_null	2020-06-08 19:51:06.516345+05:30
11	auth	0006_require_contenttypes_0002	2020-06-08 19:51:06.519583+05:30
12	auth	0007_alter_validators_add_error_messages	2020-06-08 19:51:06.531149+05:30
13	auth	0008_alter_user_username_max_length	2020-06-08 19:51:06.549101+05:30
14	auth	0009_alter_user_last_name_max_length	2020-06-08 19:51:06.562512+05:30
15	auth	0010_alter_group_name_max_length	2020-06-08 19:51:06.574958+05:30
16	auth	0011_update_proxy_permissions	2020-06-08 19:51:06.588566+05:30
17	reciever	0001_initial	2020-06-08 19:51:06.631159+05:30
18	sessions	0001_initial	2020-06-08 19:51:06.661595+05:30
19	reciever	0002_potholeupdationimages_distance	2020-06-13 15:34:05.432585+05:30
20	reciever	0002_remove_potholeupdationimages_road_name	2020-06-14 08:01:04.138527+05:30
21	reciever	0002_potholeupdationimages	2020-06-14 08:46:45.737117+05:30
22	reciever	0003_auto_20200614_0922	2020-06-14 09:22:12.863875+05:30
23	reciever	0004_auto_20200614_0928	2020-06-14 09:28:23.498554+05:30
24	reciever	0005_auto_20200616_1800	2020-06-16 18:00:08.304505+05:30
25	reciever	0006_auto_20200616_1802	2020-06-16 18:02:14.492378+05:30
26	reciever	0007_auto_20200616_1806	2020-06-16 18:06:57.726508+05:30
27	reciever	0008_auto_20200617_1918	2020-06-17 19:18:46.835639+05:30
28	reciever	0009_auto_20200617_1925	2020-06-17 19:25:25.355726+05:30
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
r3u2krwwyjvtvvhpflxr0qd0v04by3ui	NWI2NGI3MGY1ZjE0OTZmYWE0YTAyMWE0NWI3NzU1YjA2MTFlZTAxMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImFhNmFkMjhlYmJiMzYxZDg0YjljODNjNWQxNTBkMzk2YTQwY2M2MzMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2020-06-22 21:48:01.881851+05:30
1i0abafh6capg44qm94bq53c4xsykozu	NWI2NGI3MGY1ZjE0OTZmYWE0YTAyMWE0NWI3NzU1YjA2MTFlZTAxMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImFhNmFkMjhlYmJiMzYxZDg0YjljODNjNWQxNTBkMzk2YTQwY2M2MzMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2020-06-27 09:23:02.036299+05:30
dga14bhm8co7nvwy26zu3hcm3tb8a6ko	NWI2NGI3MGY1ZjE0OTZmYWE0YTAyMWE0NWI3NzU1YjA2MTFlZTAxMTp7Il9hdXRoX3VzZXJfaGFzaCI6ImFhNmFkMjhlYmJiMzYxZDg0YjljODNjNWQxNTBkMzk2YTQwY2M2MzMiLCJfYXV0aF91c2VyX2lkIjoiMSIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2020-06-27 10:50:41.122518+05:30
4tpad5i3v9gfhkzfmsm404jntnqjhd6h	ZDg0YzliYjdmMjk0MWNjNTU1MDFhNjNkZjJlNjcwNDYzNDE0MDQ0Mjp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9oYXNoIjoiYWE2YWQyOGViYmIzNjFkODRiOWM4M2M1ZDE1MGQzOTZhNDBjYzYzMyIsIl9hdXRoX3VzZXJfYmFja2VuZCI6ImRqYW5nby5jb250cmliLmF1dGguYmFja2VuZHMuTW9kZWxCYWNrZW5kIn0=	2020-06-28 08:07:16.503308+05:30
\.


--
-- Data for Name: reciever_conversiontable; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.reciever_conversiontable (name) FROM stdin;
33e425e1-453a-457c-a117-4eb1ef28b6a4
e48d9574-7412-46aa-8bf4-124c7fd972a1
359115c4-4be2-4991-9cdd-35c660fc20e3
bbadcf7e-4224-41b2-a26d-0173a2445702
6474600f-9ba6-4e35-bc4f-b5c76aa6f01e
9404ee40-8499-4975-96fa-714b906949ad
30664ceb-a458-418c-8ed8-496c572dfa60
9f9650ba-0344-40ac-b156-3b4f6fc307d1
583eb81e-5e6b-49bb-a87f-766a80d247bc
5919572b-0165-47c8-936d-858c93cc061f
d037d661-7354-4a27-a30f-8fdb351d590b
8ee6a283-e578-4e40-b4e8-ece85e3cf512
f2fc5f9a-5a01-4ada-8704-8a1132f9ba0b
d0c2c390-321e-4ad0-894b-ced6e42bc654
6efd3efb-f1c8-4d4b-bae7-e55e6bfe87ae
07573e02-4220-4cdc-9b5b-70bf3a8c72ad
9a2603e7-1253-499b-80ca-ee2deaba2b45
04d51e39-72ec-41e0-8274-18dc2ac70714
ad4c7427-9c09-4f8c-8ad5-1e88b8538792
b7aeec6f-da78-47ab-aa63-9f2ec8994d86
e98292fa-b0ec-4621-a3a6-391b8cb3dac0
7e26f74e-5713-4961-b71f-896d1f682d54
1f243018-703f-4b4c-a801-a72f17b4cd8d
bd3b0cd0-7cec-4f2b-a4d1-c3ad55956b45
b501ae97-c129-4176-931e-8cf01dd88353
f38cc84a-1479-4adc-a7d4-33bf4a4e5762
92ed0760-cf4d-4c7d-bc97-205c3040025f
96f1ef44-3490-464d-a184-3427564ada04
3fa1043a-3ef4-4593-b6ed-3e3c304eb6d1
25b1fb18-572f-44fb-84a1-f30604bbb4cc
7ef3f399-61d3-467a-a3d8-a00fccb3b751
1ade3640-8f61-40cd-9ea6-b57fd10cfff3
eea13337-9424-4039-8047-3a049b787779
726bc4b7-5847-4f9c-a7ba-14f989e3aee2
34213bd4-2c6e-469e-83de-b89977aecdc3
1a397e08-3995-4e39-b40c-04dfed6f1654
ca0fddfe-92c5-487f-8124-c69c66a715e6
64fac82f-8700-47d9-8168-d1d72499af44
db413f27-bce1-476e-98c4-016869cea434
0d9d21a9-0233-418c-9296-5ed467d27a75
72d51798-87b1-4288-b87a-46b36778d7c3
36bb792d-13d9-4ff6-9f04-807f20ad84f5
0d996448-1a60-4042-8f74-659c463bac8a
d7b6d561-2371-4378-9889-1fd051ddc15d
c3b7f054-fe7d-4fed-845e-c337a3295bea
7c126c3b-d06e-4f9b-84ce-96a557c8799e
eb67e1ad-7060-41eb-bb48-2d1c3dcf22a4
b4bb2451-2b4a-4dfd-b2d5-03520a2c803d
5e7b7914-a715-43e1-8f0c-b9b3ba19758c
0752c900-f838-412b-9872-245b8c6759d0
3a75eeb5-8d2c-4d28-b460-9bea720f7f9b
1ae6264e-0309-481c-a381-096559632f4e
56ae1bc6-e1f4-42c6-8ff6-d172ed677922
ea74466e-c144-4413-a076-4d6da19f51fd
f7c5ac6f-a0bd-4d8e-8fa8-ce97df465731
459d5e01-5cff-4e3b-831b-3a0e6d03f88a
35d3f1b3-6c27-423a-9da8-4258d72e8cef
528fd9b8-83ba-47aa-b828-89f644b82d6f
7f551789-bbeb-4d05-beea-591621cc840a
01fc5a27-2863-4818-a3dc-2263c81c2102
631f4a87-0d27-46ff-8e41-ee23468230e6
0a041ba1-7901-450d-8c6f-5adc935508d4
94fd26d5-534a-4bd5-b8d5-a6f4e9215e23
d5393c90-6b3a-418d-9a8f-ed7bd11df67b
e604dd98-87a4-44eb-8cc9-1a2b946ec6ac
99f36fb4-d383-4141-9dfb-5bba8af139c2
5b5c92a3-7042-40c2-bad9-6cdacef7fd72
2ab79879-bdd4-478e-9c77-83e7a7b8b38c
9bab4009-7581-4fcf-a62e-76e95fec6153
f488ace7-ee9d-43a0-8893-42427613612f
00e7f049-271f-4ab1-9bc0-5d7774549b49
91620987-c562-4911-969c-13cc48845899
ce60f76a-8083-4333-b247-6dfe8886a493
6c79175a-f94a-4a26-ad5e-f8b3aaa3dd16
c8e44baa-e35e-4f9b-b955-600ec4af8f9b
27fee9f9-02f0-4390-b5a0-27aeaa82644a
a4232a89-8586-4d4c-a4af-e16d7520e97b
7d4e90e2-d9cc-454f-99a8-3364d6301ade
cadee7d3-d2e4-4580-b58e-7a31679e3f7f
4c18841d-f787-42e2-8daf-f62a5c92a889
0034b66f-d1d8-4d36-968f-dff1192febbf
2784e4da-df0a-46ad-ba6f-f9da1f11e5c8
039e3f73-affa-4223-9d34-82456409b2aa
a110b2d6-c5fb-4f50-b92d-3cef45d82456
fbeb9f52-fd98-4092-860e-867fddfb6827
84b4fa67-0f64-4af0-b10d-e79d094d3f15
35e6882d-5c72-4083-b781-ceb4112f5d6c
26e93fa9-734d-491d-8ad0-0b252190b31d
7b4111c2-2bcc-47d7-bee8-53c222974973
e7dbde14-2ac5-4b49-ad09-e84cf29eda76
b4c7d2de-4b50-40a7-86b8-468bb0fda2e4
deb639dd-e1d7-4dde-9f5e-d90a9425344a
a1ab9e5b-245c-4ec1-a908-05f8c9d5ac48
9896a2bd-5ec5-45f6-83e1-a6dffca3f784
9d30e27e-6b35-48f7-93a6-10ef54309566
fc401a74-1c18-42be-9327-fe921cc71cc1
fdacb6a6-9118-4979-9d7e-aaac4a418715
b829ecf2-8dc8-40b0-8b66-43f019dc16fd
8ca843e8-ba62-47de-98a8-9eccb01c3ca9
9d0d2dec-80e1-440e-8854-a4fb7a766140
7fa3a71b-4e73-4e13-8f86-0039ca2f1b5a
e0e12eac-5874-477a-9fd8-c323c53c8e52
60a0f3cc-6286-4e7b-93a4-1b85df4a0d46
843a0f4d-c86b-471e-be73-9b7161286071
c69a97cb-a785-46de-8380-5036311c6cf7
fe6f211b-43dd-4b40-9ca9-d88d4a9eea06
9de84310-12ba-4e25-9e8b-0aa1772cca05
33b94be0-2451-47ca-a1ff-054bb4fa7eba
2b30675c-2998-42c8-8bdd-6514419ddc9c
55d04d1d-392b-4e1f-b51e-2b283e235e4d
389ee0d1-0bbc-49f4-b77f-163ed33e40ad
c5e09330-607a-4f94-87cc-908078778227
21ef6b50-4a65-4eb5-8ccd-6b66882aadab
2df64d37-fa3a-48ae-86c6-9b140c6449bf
b985f780-2d5c-45f0-a3f0-15bf3a4e93bf
f7707980-5cbd-4b19-8a00-9cb727ee9a03
70ba2409-aef3-45c9-8847-a58cc55d7eae
3156a5bb-0492-4da6-868c-cf3e0cdba4f6
1c489727-b0ca-421a-9092-ca4c66db7c50
1747159c-1468-4064-92af-286aa8cff58f
d7fdd29d-188f-487c-8881-0adce349c3d9
35eeab45-344f-451b-bf74-dd324261a4d4
d752a0a7-f29d-4bf1-b68f-6e2ed70bf93a
8624e57d-5614-42f9-b164-9e796e8afdd0
6513bafc-d95e-496e-be64-c92776dcb6ca
a4b4a4e8-7c38-4390-88d2-131a6ec824a6
1f9c758c-6bb2-4a0a-9343-515a3fae1946
08150a2a-20fc-45d6-8880-ed7a09d56684
b770f5fd-4e40-46bc-b0d5-8819b37d96f0
8e3325d4-20ef-47d6-919a-2d30742e92cb
417f9814-81e2-40f7-a306-84a4868433a3
0d512751-dc1f-42e2-a23d-88a62903e501
e98eef88-18d0-4dd6-8049-53774d77332c
379c45bb-3d03-46fd-88f8-ab5b36c449c8
1273ba41-d693-4d4a-b266-d6b02b615b18
2bd43c8c-3902-4569-ba89-8deb67ec52a8
f8c2e75a-0f6f-47bc-8974-ca958b419214
29f3f7ad-693f-46b4-a451-5024cf157156
805a4358-b422-4042-ba60-e8c1ac307379
20a0743b-4a78-4d41-a364-c105abaae8c6
267c4bce-593f-4516-9687-c9870f381c54
5d12dee7-e2e8-407f-869e-73de8bc802e3
0706d428-1675-4b3b-9b3d-22a664b949b6
52c84546-dd64-41a7-815f-cc61626ed4a5
918285ca-5d29-490e-a7ed-d9fa3eee0d65
a18a7ac3-5039-4a85-a92d-100375a8208c
758b1e72-8b58-4a28-8452-c64179b4a4d6
a9a5a660-6d02-4761-aa0b-dc70d592e85c
2b530537-aac6-45bd-b367-5da96d0da200
56c4e8ab-6c01-4d53-a812-334fea529f68
64c83b6a-460d-4242-aea2-6b0b57538c23
60b7934a-a1d0-4ccb-b7d9-65536ff8566b
ca4c56ab-eedc-4340-8db8-80e03e80fc2c
89ebbb9a-e4df-4637-b6e9-7e71b2f1b7b5
a3bf54e0-9abb-4a0e-b629-d0a87ba82db9
d4f6f153-6da4-45d7-80e8-7698cce891d2
6fcf6291-8cd7-4b8b-bb32-cc74a4f59269
945434ce-c7de-4319-96c6-087cd99051f7
1ace4b16-b799-4ab3-ab8b-94b9257df63f
956e8632-718d-47d9-a2f4-57d76591cda7
df115294-d3d5-415a-b7dd-02a7d8528393
07581d3f-cc3e-4ddd-9584-99e538dfa00a
74832c5f-c859-4117-9c69-8ec1f68d08ca
8c18965a-3507-4573-b75f-918183f84274
69ba59fe-efcd-48e6-9596-8b58e1aaa425
e48e4410-eded-4108-b43f-9e23f90d3af5
b949deac-36b2-43c4-bb63-918ba62ffb99
b9abd949-20e2-42ad-aa9f-e69aa6840e16
c01a6517-796a-4ae1-8ce1-ac55796bcc11
ed027c7e-2ebe-4546-a110-1e6234064efd
11a7da36-9102-4fba-a237-51695c4ee37b
2cb63be4-fda4-471f-adaa-c3a8bd476e10
90a3be4e-aa0a-49cf-b7e6-4685155d1773
0376dea6-c4a6-46d0-aa75-30ac77a8e2cd
de58c7bc-c480-45ac-8d7e-f52c20bf8639
3050adf5-cba6-435f-b846-86f6ece1f6ee
03c76d51-b789-4e08-90af-b4792ab6d30e
591726bf-2644-43e8-8c83-3fc93bcef163
aa6cbf02-b5bf-49c7-a547-3f0eb2dd57fc
92743408-0998-476e-a40e-5dea909f9c4c
6eddd33c-3813-4138-be76-72d5801e99bb
394021fb-3326-466b-aaeb-551e42ccba3f
4e07d6e4-cccd-43c7-b716-34505fb87684
6f74296e-407d-4475-9dec-1ab614af043a
277e8baf-8c2f-49d7-82c1-90d18983a959
0564e4f5-72a1-42ad-83fa-baef9801880f
a68c73d6-974c-46f0-9321-a4292fe81ffe
9765a3f0-423c-4a49-aba3-29210c3ed50b
e5d9f3da-755f-478a-807d-58365d0bd212
e5558771-99f6-4afd-946e-08bc6288c185
831333bf-b6fc-41e9-8b10-303413ad4de4
c152ead7-4b24-4057-b995-2317a065c9fe
9df8f5d5-82ad-4c0d-82e7-6ce6e5a27295
ab21e1b8-a94f-4c4f-82c3-2299b31c4377
ffc4eb91-8630-4615-8099-0f50099fc2ea
805cda26-732d-4e83-817b-b338159aa04f
17ddf9c8-0f8d-4b58-a8cb-298970c4411d
19c344e5-0cbd-48db-b96b-735189719274
e71e6c02-6d97-482e-ac31-eb63bdc0fbdf
5c8aaf68-426b-491a-8f81-82f3de7e9d9e
c344a8f5-ef0c-414d-be6e-553dd1c0aa57
bdc71c7e-30fb-482d-a349-ec390e83a646
c3b0e1c8-7bcc-4aaa-b09c-0df81f01aaaa
72e9b864-ad1d-442c-801e-599234298d10
b080b459-86ad-47a1-862f-d3adf0d7871d
d3fca6b9-c59b-4b66-b8d2-6441dde0ea87
d2fad21c-e3eb-48eb-ad40-bdd2b0e460ad
1baedafd-f551-4ff5-8259-76916a5fbc10
6e62a0ee-a97b-4385-b4c7-d30506978588
aec69a60-d398-406e-ba03-201b0f77d929
0a3316f9-fd21-45a5-96b4-5b8716400b84
ecc9f47b-ced5-4fdf-84ff-4e7eba6dc1f8
1d4b5cb3-456f-4349-9223-fb5ab11279d6
b6d9878f-7edc-4d48-9c41-4b91f0c6ad8e
3864ec04-886e-49e9-a4a8-2bf18043676a
576ebb3f-2ec5-40b8-ae45-760052fefa9f
924d766a-9fb6-41da-adf4-cbba65963861
d91c7dc9-e483-4af7-acf2-e811cc8c5f64
371323ed-2d68-47d2-9b10-6b8a1c049f2f
4d490c40-49d8-4b8d-aaa2-a240d22d4594
154b4e19-5dd3-4aa6-b092-eb27d69d084f
678f412a-69be-4cc2-b64e-c0aec5c85965
44ee325c-b5b2-435f-9887-cf653bbf6022
98247a70-7d1b-49f5-b5f0-5211fb7f29d9
6f31a4ee-e9ae-42a0-81bd-f60b2d3355a5
256cc685-10fc-4b38-b155-32155cad0400
049ff5b7-fabd-4fdf-b445-d39ebd7d6e6f
e06a903c-a7cf-406a-a07b-2c31293787b3
93e9a62c-285d-45f5-8677-02c6902cf366
b56d42a1-d90c-4063-bd80-3da8dc121ada
f5984d86-076e-47f1-9ac8-e642f226f2f9
fcaa7993-b20c-4ded-abf6-0b07fb8f9262
2d00d653-3aae-469f-a52a-3735532ca679
2a0bc639-572e-4b6f-a7c1-19fd35f38564
9d0e0be2-216f-4bf0-94d9-d339223c9996
d1395b91-db1d-4e4d-bd3f-c9309c82997a
36c9e9be-e97c-49ca-8e0f-396c265b5d9c
387025ee-fe52-4814-a5bb-ac5ac27afdd2
e233193d-8c26-4fb6-a160-c05b85f6322f
d2ff9520-a4e5-47e3-b67e-ac4d90d3389f
fd379e32-0525-4142-a720-b99fe716595e
c3cb2667-e03f-46dc-9aba-68b3690fc00d
006855b2-e0aa-4059-81f0-a70e03cf6753
e2314849-0b90-488f-a86f-4dcce61974c0
bf65db24-6989-4bf5-b30b-70c3f7dff969
76c392ec-0c4c-465a-a682-af976cb4598a
f39604b5-fb2e-441a-a53e-956e7c9115d5
8c482c46-a26d-4aee-b964-b2cfe5b0fce7
7e16829e-825a-4bc4-b701-22636709b1e5
b0fd5441-a109-4bfc-ab99-5d8501684eec
d40d0fe5-a540-424f-8632-01e53c47abe8
9cebee29-8feb-460c-8b70-32b115f470cd
f3d10d5b-b19c-4f2c-bc16-02d544138891
818b102c-d31e-4038-935f-d7071c25ac78
f7c121e1-15c0-4305-ac7f-b5423521bcdc
617a1733-0537-4d2d-a085-230df6a6af16
70663b18-c06b-4f13-abed-c84b72431e49
b1c3582f-dee9-465c-986e-ba7d61fa0e57
f7e9b932-dbe8-42bb-877b-3e5f47164cc5
06523ad3-9dcf-4738-a00c-5f574b7e8a06
d2280f9e-2164-492d-9422-64276f72ed84
16f95e83-6b66-469c-a0df-43560cb42dc5
cfe4c25b-d7db-4db0-bd57-2c5fb44d4102
714571e4-30cb-49a3-b34c-930dd1d98172
2e9f2a0a-a637-480e-90ae-333b6d4742b6
655beb60-4786-4478-a585-ff745eeb5a35
3f948f73-6a1d-4684-a185-78f87def5afe
50fe73b3-b9e4-4d97-b9ae-c04ca3094a22
181b7593-abff-4f70-b509-03a7b2c17bc0
0813a544-2476-465d-a61c-eb4ce89930b8
6ba513b1-9be6-4d0b-85ec-35e0e92d7a63
0687d25c-8394-40fc-968e-490969abc318
00c0a4de-8454-40da-ad6f-2f3c815eff7e
54f7a94c-3612-4c67-8d09-0fc9e223b6fb
75eff82a-fcff-4d75-8724-9d9a3ba7a369
36c20c72-713b-4883-918a-19e9662d8885
b2e52ab4-22ab-4398-b38c-7ca8a9dc3f8f
cd3e042d-7d26-4051-9d04-b6da0086a3a2
20934976-4233-4490-9480-e42d117fb75f
eb79158b-1ec3-4b76-b090-00364408a515
f125fa7f-f7c8-4a80-818d-53c1c32fbfb6
1d5ac2cf-bf6e-452e-a07b-4525d0a004ce
946e77ca-8a70-4e28-9e2c-3453cf249bbb
2f6a4467-fab4-484a-96a9-5e718395a26e
b9a2c724-8810-4ead-944f-6ef19969cf02
d92b22e3-68fa-4f9e-b15d-adea4f4c04c6
af4aff17-90a6-432b-9888-eaac99ebb91c
6a2f3bc9-ab36-4079-9173-058c57555644
d4bedc51-2634-40db-b2c0-464c303d2db1
4745da3f-cb12-48f1-bf63-205bc91fc939
97991be1-d571-4635-b512-38d9972b90a9
a99d4f93-9dec-49b0-87bd-344c167157b8
71de27c4-d8f8-49a7-818c-d26d2e5d32b8
4fcccd57-ff85-409e-9eb1-288ef7870225
c5b1ae84-a890-4d1c-ab97-2670c344304c
8f0c6627-9815-4fc0-8570-9c8eb8907ff4
5aa10d6e-802c-40f9-919d-5a927be2d424
3c34c3d2-9b13-4afe-bf56-913a6fb52b78
1395e8f1-fbc9-47b5-bfa1-a4227179d5fb
834503b5-cf58-4e8c-9d5e-067d1c34b9ec
0efbdc0c-4182-42bd-bc73-099a89dfcbff
4d255154-5545-4b79-b195-39d344f08fe5
a6741e8a-8a58-4fc3-a5cd-0c007cd9293b
9368683c-aada-4c49-afbf-0b01f7a07a85
0940d677-26fb-4275-b769-28c2507a77de
1b0035b2-4ef7-4ce1-a4f8-12f03ec2f86e
1198c768-32d1-4cf9-8079-18ce3545aeed
188e7aba-2ba6-42bb-9719-8d3de5ebd82c
6d57cedd-9f47-4a42-b65a-25e1d5a43691
6069a9b0-bc1e-4e93-9655-22d0f4e3309e
02e2480f-d77d-4dca-9bf0-820ae92190ec
8e90ad20-96d7-4b39-bc1c-192c0ecbb2de
ed32f081-3d8e-4ec3-873f-6438e77c8f3a
e95ef4c0-b995-4c66-a02f-99f4d83574d0
b72cf7a6-f08c-42a1-8828-6bac93d9d026
9012e6b3-a4d0-4ddc-9f93-1ac611ee4b5a
6124c1fd-f25e-43b3-a469-035a083c6ab6
9f87a4db-1b72-4845-90ff-556a3b24fc3d
75ef14b0-3dca-4ae4-b3ad-3604e19325e8
f9cba81c-1822-4890-b957-eb043e395f18
83215179-4ac8-4b3f-aae3-f636d30f9406
067bbc8b-9cd2-41be-aa88-61a72c07b89b
0c218036-fe48-4883-ac12-01361b47a1fb
63cee5e9-93d6-4140-bfe9-2589719917d6
48657e17-35a4-432b-b202-f32d872dfe89
a0bb6776-0b96-469b-aa7b-0b9a7b11cb12
4d617240-0481-46d0-bff7-7a119dd30ad9
b9fdba1f-a425-4780-b5c2-4e27267821c4
a64112f1-2c47-4536-b442-7bc8a36ba05c
4c429d29-163a-45e3-a93c-f2b0ea2b062c
103b3dc1-18da-403b-9c90-f74ea054c30c
7317695c-7316-48f6-af76-64ac5c241207
3536ca48-484b-4b81-80de-1d8c7c67ea5e
c9437474-527c-4afc-b2cd-474bb55c543f
6386c0eb-d5be-45a6-8fff-b4b33332c807
c17003f8-98f3-49c8-992b-660599b0b3cd
17ea2848-fceb-466d-af6c-78606925db8a
306ba2b6-9fe9-4aaf-a941-11fd0b14a389
94a7430d-b2a6-4723-a03f-bf1bff0c392c
f78d6feb-d916-46ff-9faf-d6c338922386
29fdeba3-1e01-40e4-a61e-201092c3cb6b
20066e6e-c66e-4bf0-b3fd-e31c52082912
f0971be2-4415-4d10-a077-4aecf8f3342e
97ef6e9a-ef59-4e22-89e7-91c35d0d7d43
b3a930ad-7e5f-4fac-891b-bc1bd6123e83
0569773b-c061-4622-8a6d-275816ad1d35
227adbc1-f0b8-436b-9067-18a87a733d06
126329ee-fe38-41dc-8e87-57099cc7ffd9
fe4c66ef-ace1-4007-b870-5bacb70f0245
0498db86-3f5f-41f1-9dac-47672906ef84
94c8998d-3071-498c-8bbc-b181dc5b62b5
639eb03b-d1df-4447-a1ac-c86712f3e727
ae5b245b-bbd8-4f5a-90ce-2af2d73985ee
f7f3d731-463b-4349-b1ce-acc9647f4fc0
0e798edf-0099-45dd-9a80-d8ad4bb21ea1
12c89a4d-159a-404d-bd32-48fa898d250b
85403f0e-3b90-4eae-a39a-c9249425f047
dcd571ec-8f2c-466c-b7c9-6947aaffe1a8
cb23d6c6-99ad-4f93-b925-10ed89f2ffe8
3ea6431d-efd6-4016-a3e2-08c809d45d07
2b29ba0a-0c15-4306-9639-ae23e338d096
9a5be963-f9b8-4917-b38d-caa0325e0584
a64d9d6c-f8cf-43b4-9e6d-ce0e18f67218
cc2132ec-49db-499c-aa88-6d6cfc90eddd
f492071c-f334-45e9-9522-fc73cb02d48b
31b7a7b3-76fd-4e9f-badc-489b1685e581
366764c5-1217-41ee-b13a-f17c8ac12a75
7e1a1407-5645-499a-9366-1fb741d5caa5
6e255f38-c70a-4817-9a19-31144c91b8ff
deb3aef3-9ca5-48cd-855e-bcf77ec2797b
f6f379c7-dbb1-4ce2-8d86-912a6bf7b87d
f5dac51e-e8fa-4813-aac0-bf2c7629058b
3a5aa2a7-3f19-4356-8e9c-8a358b0a56dd
a666f484-b107-4112-bfb6-8357adeb8976
fa71d413-3545-4ca6-b78b-c86ac81a0bf7
5988bc8a-6b91-4b96-ad30-5fc38459e35d
0e06377f-fcdf-4ee0-9c82-b80bd72ea784
d6e736a6-ed7f-4bd1-9ba4-f4f0f06328e5
0eb72561-2280-446e-988c-d2091a9def18
6bdc2f0c-12ec-47ee-8045-c53b7d6a5cf3
4ef81026-e9dc-4967-a91f-07bda5f9621a
3666d26f-641e-4f54-b6cd-f0779826cca4
f71da49c-64dd-43bf-a4b1-38be0fd9c499
cfcc68a3-8690-426e-a438-454f5ac50946
1d5e876f-36b2-40b7-88b8-4cc62cb74f02
007c40ed-0832-4106-ae9e-d8f81cb549cd
1569ec8e-aed7-4980-9680-a185490895e7
3aa96e7a-28e7-4b10-b567-3e7e39f6deea
666434de-cbc6-4afd-8c25-f5f05629b2d2
c5d9277d-2c2e-400f-a17a-88005bb4ab6b
539a56f2-b766-4f99-821b-af6fb50bd09c
f32af092-f039-4f62-a6f6-2b9efdb698f3
efb17495-dd0c-4e17-a6f2-3b44738f1720
761c598f-0b50-40bd-9a6d-a79d06cff71b
60ee6230-6f28-4c7c-9aa6-7efb0c7944e4
e71a0415-b802-496a-acb3-15a727b8a7e8
65b667b3-9ba8-405c-a85c-beee9753a6b6
c2ef5ff9-ce29-4790-9379-81e75eebf0d2
7567a703-8b85-4466-b5fe-ba6e480a10fe
cf5cc588-c2f1-4dca-9a5c-d92ab7fd374d
0c4239e0-7a6f-4da9-88a2-315da2a3f1dd
b295599e-f051-42cd-92df-46d4aa925494
80d5b442-4105-411a-a21d-2b6dcd3b6aad
0baaf0be-963c-49bb-a765-52abd8f93b05
8a34354b-3d04-45f5-a375-c20583eeb97c
1f79d52f-5ef6-40d4-a6ca-7fea24e97756
5d1fac07-6785-40cb-bbe2-3d915bb311c2
48af503c-0af5-4238-9492-ea82a67e656c
5ea05f76-76be-4682-bda8-439da832f7b5
f786e5c4-a5dd-4a21-b18a-01a67da46867
6859ffe0-5e4a-4939-a39d-a31b5dcc8497
b18e4dd6-dfa2-4a20-aea5-b125a2d00169
1362cf6c-a493-4bff-a329-87b60b7e39d2
f9491465-1cf5-4650-9f0c-0b394578827d
946d0331-1ae6-44d8-af3c-d03526aad20c
270964e7-5393-4c03-9663-a18283235a4b
c9c7bdd2-2e23-4b3a-967f-13dacfee2b66
a695b8b7-e691-4d34-bc9a-2e454e66b2fa
b28c0a73-ebd2-4ce7-99c6-8acbc78e8000
f49bde15-77c3-4bb1-964f-8991bb7b3d11
2ed5e6b0-32c1-4fa1-9954-a028b9432350
90a9c007-9ca9-485f-a90b-2bb4c7d80a7f
9cf665f4-af8b-4825-aa4c-279b6dd6031b
2a996d16-136c-4422-a92d-75e8cf2c35dc
89240fe9-409e-4cb9-9aa4-abb62ec576c4
8c851437-8791-49ba-9e43-bc6ed22f7288
02da1e1d-b037-4683-9a20-6db5db2c164b
77312f91-bad5-4401-af6d-4fb954bada54
984fa6df-779c-4541-8c93-b155b563aca5
de60af57-72ae-4279-9dc8-bda400a0b7ab
e1d82312-a844-4a1b-8a06-386c63877337
687c78ee-3ac3-4587-9c02-01433433d6d1
e90afb0c-7a96-4cf7-b520-9bf6ad6f31e6
bfdf381f-e7d4-4e74-80b5-c6c11924fd1f
fd878c19-3a28-4d46-a9a3-9532597425b6
c2f4852f-84ae-4c85-89e6-b6ad805a9852
eda256ac-0875-4307-8c0b-e25cdf24ed1e
bde324ce-aa02-46c1-8567-9c9b1640be83
c50dd786-6608-4917-aa1e-6a8f6b09dde5
cb890ffe-9ed8-4f6f-af74-381f4ba890a0
e9843afd-eab4-42ea-8cb4-13d8a8d1539d
6d88d5a8-f123-409e-a9dd-9b32656910a9
05e4fb90-9706-4c6a-a942-7d0676cf452b
10c810e8-f19c-41c3-ac5d-ad3ee988b5bd
42de68ac-480c-436d-a53b-b109a8de2e64
e01a607a-3779-4d79-9507-8fb83c8d55bc
885e041a-29d2-420a-953f-5a9fd2b22341
77caf6cf-b939-4131-b2c9-68f93f973860
c7112585-07a7-446f-a58a-b7c38f6cbd50
d5d17def-fbe3-4e22-8acf-2b4a8939ed4c
0d49c9d8-693b-4c72-abfe-9d452c51cdde
4a5e46f9-62b0-474a-a079-f514f75bb0c7
e1a0cf0a-d285-40e7-9a04-45b1f908550d
76cd6ca3-aa5a-4258-b79b-ed2f7e4d47e7
4b0f4615-b821-4e94-9dbe-851a370fd1b7
46c1f7d4-395d-439d-8fff-3e425767d1b4
47c53f02-eaa5-4c71-a589-0494ba7884e4
f1de2ca0-2444-4e35-ad27-ca8a4262ec6a
5ab69caa-b977-47f7-90b8-ecd41656a622
ad80d473-f09d-4927-939c-76ef4314a9ef
6cd6598b-c63d-47bf-9761-6449aadc811c
f88a9f49-62cb-4bcd-8cd6-39034b8b808b
8bfff105-0ea4-42b5-b269-058071daf6a3
f1d32049-1684-429e-aed5-0d6c42b41718
b9524fa8-90a4-4388-8545-7c884e3aae91
73ae8aec-e9f6-482f-951f-c532bdd5f643
7aa98b2f-0808-4f7b-a01a-3831df0e8e74
069bc185-8a2e-438b-b34b-b3b43dc3c36d
fad4353a-661f-48b5-8b80-2fe9b0ae0713
33cf21d9-04c0-435e-8098-3d5696428ba2
98ee80f3-4873-4e5e-80bf-b18ca5b11b25
ca75c564-1e21-40dd-a031-f8edc8ee3f39
3fcb75d3-3cac-41b8-9fe3-a73e6061bb82
0f93ac2f-f28e-4db7-b73d-06820f9c7693
9ecf4886-4228-4b11-8221-2b3bba3756a6
344b905e-9551-477a-a8c0-9373f1c4da4b
23559f78-2572-49ce-b0e9-b6bdeea6d346
e5fefd58-2aeb-4eb2-9f12-775362bf9228
d68bad78-7fb9-49dd-b32c-0ed64bc2e22e
6121c219-da8f-438e-a9b6-b1f603c080cf
049d98a5-833d-43c8-9862-8b37f068d856
d1fee99f-5917-4153-8285-d83d10a84ea5
d1eea755-8b81-4753-883a-3eb8af112909
d8f42c6c-1b32-4ece-ac5c-fff6da603d36
52cefd2e-9fe3-476b-9e66-cecebee7240a
dd1aa845-0cb7-4bf4-abd6-025310d5b160
7a9d0ee5-9643-4779-b188-63ff97cd5708
de0f9e2d-e989-4b28-84a2-4c5d9e451cf3
38693962-27ad-4c23-82d4-729eb9684f80
80bb80da-293b-4664-a826-44712fa7cd09
801cddc5-e14b-40c8-b3ff-87f3f24d2787
db812704-2803-4d03-934f-7d4506559068
47eb492f-0571-42bd-a1a1-0f2ac7d74d0b
6bfad0be-455f-47d2-bcba-95fbad3c7670
66afad86-6ce2-432f-bd96-b4b6187f64b1
66abdbf3-f5af-4d21-8e53-35de1c8f253e
21e3cd73-0f9d-4f12-aead-d2ddcd3e4f8f
8253226b-dbc6-4b8e-b8e9-946476df4585
591346db-0b8c-47aa-8195-eca8d12241e3
49b44d9a-e7ae-4ed2-9581-85b92c3be53d
9022239a-9815-495c-9c3a-354e40cdd03d
8b08cff3-54a4-4ca2-8bed-8b657b5148ec
04078b50-32a2-46d6-b8dc-ab0f4e5e0cd6
11061dee-a6a6-4708-af5f-b0a1e8ce30fa
af8143b2-a558-4cc8-a492-d317a00f02e2
90f568e8-fc10-4314-a588-c998d61389ad
7ec6bfdb-60ab-4ca1-9128-1b9a9d6c476f
288d554e-f276-47cc-bcce-a75b8ea5b693
e83d55ca-3db0-473b-ada9-8e6512c6f9d4
2cd83600-81cf-4812-be67-d5a1a0e1b576
16deae9e-6097-43dd-825b-6d5d0c220f4a
b81f51fe-98fb-4356-9b03-538e439280bc
cd6e8cdc-1c6c-4727-b0b8-62ec9ccf7c04
5706801d-ee66-42b7-a3ba-ad160d90f0ff
2340df31-054e-4045-a041-57d47096dd4b
b04f3324-4f44-4524-b309-45515ab32880
161f15f9-f723-433e-8c61-5bf429f31d68
bfbcb5f2-29e9-4efb-b7c8-36fdf42d946f
e7211624-f959-4cfe-bb42-5620667c78f9
cc518539-5a81-4583-9430-c952460bf95f
133698a0-07d4-4bcc-8dee-6bfaff4fbcd7
b76631f9-a83f-43d0-a3ea-52bf9425fa29
25710999-73e1-4511-bd16-301ef2824bb1
5ea390d6-0dc8-4466-aeda-c38a420447dc
5864063c-2f26-489f-b7c1-21505e050e91
b3e33a68-0aeb-4208-9245-8e783c91257a
646a3399-468e-4f52-bd09-c0dcf781125d
c76128e6-b623-4fe2-91a6-14f9600f1b69
0554769f-1203-4c6f-83fc-e87b19638941
6f5dbbfb-b7e7-471c-97db-25bb392ae296
28893081-923e-455d-a0ae-96657482a555
bf42589b-bb65-4d15-ae0c-6714c50c831f
75e650e6-3656-4db9-971b-9e69bb18720e
179bf513-a86a-48f5-bcdc-3f17f1f87a9e
fb6380dd-0673-404a-9512-d9ba7851d88a
5be94248-5e84-4ffb-9477-a021efcf6bfc
7e0e1dfd-0741-4d74-97dc-b13c7bbd5680
c6e474e6-6e24-4075-90c8-4b1bd17aa2d8
64cb784f-9da9-468a-ac94-3fb9db8669f1
f76509cb-0c48-4e5a-b066-12e794437008
b658d86e-caf8-469b-94f7-cd1cfe48167b
e536a726-da80-43e0-8c6f-83d886a5705a
272059df-d1e8-4593-a776-4c3827dcbc0d
e1e8c9d4-d880-4243-8ff5-0464353247a3
846ba9ec-0bf2-47b5-b7e9-4aad0326ff40
2c674434-af0b-4d45-9610-6f1026ead718
e592491a-f6d0-418c-ac7d-ff146534aad4
88f36e42-b398-45ee-93cd-b73d6b5286c2
c65c99db-4fa5-426d-8de6-ef385301ca78
f48d3a3c-b825-46ef-be70-15deb3928d72
a90f26d4-e684-464f-ac0c-fd3fc144967e
7d3e8d4a-2425-456d-9a30-ef98f5b995c8
f305f1b4-5687-4f19-96bc-cef17a0af6bb
85ff6314-65d1-4f63-8f91-414ce2a4f956
55d48273-b790-4f2c-a29c-38e7684df981
05135454-dba7-4969-89ad-39111610d4fa
a3f15337-8556-4c33-89b5-1b781a6460ac
cec264ca-4065-4bda-a9c2-f739f73dd7bc
cf279a88-c93a-4855-b093-3cb9bdd148d1
e30922e7-2c32-49dc-8148-cdcf90b8c675
12c50eb1-5ce3-4bf9-97a8-c5da5babf779
f22d9da6-0bd4-4c2d-a7f9-53b6e8ced337
98e8b424-0dc9-4128-9a52-21520972881b
b1cdd408-9b9e-4def-b15c-2323f586ef51
d787e1e7-efb2-4995-ac9c-b7245848c83d
db4bd727-470e-4caf-989a-4bc4403ed853
b03135ed-db97-4f94-ac07-543d71bea822
fa7feba2-1f12-4055-b5c7-049aa8263b62
e398cc2f-0bc6-46fe-9aae-cebb4416f88d
fee7e0ae-247f-4b69-b726-9a9340f7ff1d
0a883919-bf02-4237-8481-4a138dd0e2fa
3c73b05d-3d58-41e7-ae09-109a39b52478
22a47566-191e-4783-85b7-79d81950ca49
c690dd30-bd44-40a8-9919-07acfd6d489f
97303cfc-d530-4dc8-a5bb-7fbf5e2e45a4
9058febb-5576-440f-bd32-370f182e8199
304f01f0-3c6e-49e1-9876-2bbb216cd79c
dd29babf-181d-42e4-bb76-9524ca044fff
a3f8d0bd-cf6c-4131-a10d-05d74827fc9c
249480c5-204f-44e7-88d4-53b66fccc5fc
97e65b33-79a4-44d1-a49d-07cba56f5b50
eff964ae-7049-4816-9d37-3d231e9c6b4e
14b90045-077e-4691-a65a-e4f1a8609d12
ef3feafd-3376-4ea2-b61d-3f99144bb9b8
00995b78-f480-4f2c-991c-e477c0195bf7
3395daee-5fd6-40d0-9d6d-facd859c1bbd
ad420aa6-5245-4481-aac7-7e9b73cda210
8baafd0e-ee3a-4ea5-b458-7dee86ac78aa
a45f61fd-9fd5-4a12-84eb-76dbd917dede
9f714265-c076-4648-8fff-5572ab24265c
fa82aab2-7114-4c9e-aa0f-b6a1768b72fe
ea27f7d1-81ff-4324-8174-4a9a25943d95
e744c701-da41-4443-aaeb-d8f49836dedd
fd7134ec-f072-4f6f-a91c-67c7d18f3b7a
110ec637-675a-46f1-bd5c-4616c79351dc
60394682-5331-4da8-839c-c2d68143a1fc
d64a24a7-c69d-4804-9675-5ac6c44954ce
77aee01e-ebcc-47e0-b1ac-1024b6b196dc
1f37bfec-0661-4e5d-972d-7a4de22fad8c
9d5d1769-6c01-40bf-b5be-8522e7e3208e
b508a7c2-6363-4004-b5c0-e0de419ac192
0745ff97-024b-4eb5-813a-77f5c8011aa3
38851c89-f83e-492e-9256-6b04f2eebfdb
f4ef0c09-c76d-4bc2-a389-ebdd84a87647
eeffed38-6442-44cd-be3b-86157b373081
d2c397ef-c180-45cc-a805-4dbb3e2ec4b3
71cd548d-74d0-4eb4-9d87-a7630c0243e8
2ea188f4-2c95-4f71-b20c-7b1e8f5efe17
8bc24797-1d0d-46ff-8778-8c82413c3aba
48c8c3f1-dbdd-45a8-a9a2-26b6d9831523
936aec33-9c2a-44e5-9140-9dc7aeea0490
89cc43f5-9728-430b-9ef6-ea3a656a5e7d
f1dcf6d3-d53f-4b4c-9bcb-451285960d9f
283be71b-653f-403b-adb6-dccd8b8a1f91
94ec8710-1aff-44d5-8ad0-b1107b175951
28cbba89-70cc-4c38-8d99-e39783a4f973
82e37ec4-0814-4175-9166-de875109501c
c01179ec-1549-4827-8ddd-a7ad8a29cf3e
7545cae3-1766-42c1-92f3-d3b148dee61d
6fb48d3c-f7c5-4a06-a89b-6b40fb8404c8
86da57ed-fde4-4693-96e9-b2dfa2b284bf
\.


--
-- Data for Name: reciever_potholeupdationimages; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.reciever_potholeupdationimages (id, updated_image, "cordinate_X", "cordinate_Y", created_date, is_filled, checked, distance, point, premise, park, airport, natural_feature, postal_code, plus_code, subpremise, neighborhood, sublocality_level_1, sublocality_level_2, sublocality_level_3, sublocality_level_4, sublocality_level_5, locality, colloquial_area, administrative_area_level_1, administrative_area_level_2, administrative_area_level_3, administrative_area_level_4, administrative_area_level_5, country, intersection, route, street_address, formatted_address, name_id) FROM stdin;
17	GIS/Updated/2020-06-14/df7383ac-0871-4612-933e-e8012fdd0dcd.jpeg	77.2105779999999982	28.6905773000000011	2020-06-14 10:52:34.870573+05:30	f	f	0	0101000020E610000000000000000000000000000000000000	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	fee7e0ae-247f-4b69-b726-9a9340f7ff1d
19	GIS/Updated/2020-06-14/af11ddf2-2f2e-453e-b871-9c661bb859bf.jpg	13.6448166999999998	74.8224383000000017	2020-06-14 12:27:06.531202+05:30	f	f	7865	0101000020E610000000000000000000000000000000000000	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	b7aeec6f-da78-47ab-aa63-9f2ec8994d86
20	GIS/Updated/2020-06-14/662684d5-44ad-4106-a32b-21a9d5289a10.jpg	13.6383299000000004	74.8271356000000054	2020-06-14 12:36:39.442501+05:30	f	f	7866	0101000020E610000000000000000000000000000000000000	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	417f9814-81e2-40f7-a306-84a4868433a3
21	GIS/Updated/2020-06-14/8e1649ec-4cf6-4e01-b609-044344fb983e.jpg	13.6383299000000004	74.8271356000000054	2020-06-14 12:39:07.483417+05:30	f	f	7866	0101000020E610000000000000000000000000000000000000	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	7d4e90e2-d9cc-454f-99a8-3364d6301ade
22	GIS/Updated/2020-06-14/e922632c-4e06-40f9-a1f4-03878d493103.jpg	13.6447295999999998	74.8168993999999969	2020-06-14 12:47:34.436635+05:30	f	f	7863	0101000020E610000000000000000000000000000000000000	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	0940d677-26fb-4275-b769-28c2507a77de
23	GIS/Updated/2020-06-15/80adc958-0849-490a-a2f4-f3f1a1e9eba1.jpg	13.6448032999999995	74.8224217000000067	2020-06-15 09:18:27.56825+05:30	f	f	7864	0101000020E610000000000000000000000000000000000000	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	161f15f9-f723-433e-8c61-5bf429f31d68
18	GIS/Updated/2020-06-15/554663b5-71f7-4271-a43c-bf2595e2af35.jpeg	77.2105779999999982	28.6905773000000011	2020-06-14 10:55:12.985965+05:30	f	f	15	0101000020E610000000000000000000000000000000000000	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	fe6f211b-43dd-4b40-9ca9-d88d4a9eea06
24	GIS/Updated/2020-06-16/c75de0ba-793c-47a6-9c54-5f1f6a29af05.jpg	13.6448917999999999	74.8223368000000022	2020-06-16 10:53:14.601289+05:30	f	f	7865	0101000020E610000000000000000000000000000000000000	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	0706d428-1675-4b3b-9b3d-22a664b949b6
25	GIS/Updated/2020-06-17/754f68e2-4cdb-48e4-8e10-41fef8c2e349.jpg	13.6449017000000001	74.8225400000000036	2020-06-17 11:00:40.517876+05:30	f	f	7863	0101000020E610000000000000000000000000000000000000	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	2b530537-aac6-45bd-b367-5da96d0da200
26	GIS/Updated/2020-06-17/de6261da-0bbc-43b8-80fb-e45f627d1868.jpg	13.6444484999999993	74.8223234000000019	2020-06-17 11:07:55.823843+05:30	f	f	7865	0101000020E610000000000000000000000000000000000000	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	None	d0c2c390-321e-4ad0-894b-ced6e42bc654
\.


--
-- Data for Name: reciever_recievingpotholeimages; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.reciever_recievingpotholeimages (name, area, number, "cordinate_X", "cordinate_Y", "RCreated_date", "ROwner", agency_name, "rawImage", "maskedImage", point, premise, park, airport, natural_feature, postal_code, plus_code, subpremise, neighborhood, sublocality_level_1, sublocality_level_2, sublocality_level_3, sublocality_level_4, sublocality_level_5, locality, colloquial_area, administrative_area_level_1, administrative_area_level_2, administrative_area_level_3, administrative_area_level_4, administrative_area_level_5, country, intersection, route, street_address, formatted_address, "maskedImageUrl", "rawImageUrl") FROM stdin;
33e425e1-453a-457c-a117-4eb1ef28b6a4	100	7100	28.6751870000000011	77.0685560000000009	2020-06-08 21:57:03.348902+05:30	testworld	NDMC	GIS/Raw/2020-06-08/3908e007-9b15-4ed4-b26b-e5e0c722a4c3.jpg	GIS/Processed/2020-06-08/66eb43a1-24ab-4f6c-a192-1ebadf9b511d.jpg	0101000020E6100000747CB4386344534032AF230ED9AC3C40	None	None	None	None	110041	None	None	Saini Mohalla	Nangloi	Vandana Vihar	Laxmi Park, Block B	None	None	Delhi	None	Delhi	West Delhi	None	None	None	India	None	Unnamed Road	None	Unnamed Road, Saini Mohalla, Laxmi Park, Block B, Vandana Vihar, Nangloi, Delhi, 110041, India	None	None
e48d9574-7412-46aa-8bf4-124c7fd972a1	100	7100	28.6751870000000011	77.0685560000000009	2020-06-08 21:57:07.723231+05:30	testworld	NDMC	GIS/Raw/2020-06-08/54a49a4b-421b-495b-81b3-5ffe3db54fb6.jpg	GIS/Processed/2020-06-08/1364c7f6-f606-4d57-a8f0-54f34c62d5e4.jpg	0101000020E6100000747CB4386344534032AF230ED9AC3C40	None	None	None	None	110041	None	None	Saini Mohalla	Nangloi	Vandana Vihar	Laxmi Park, Block B	None	None	Delhi	None	Delhi	West Delhi	None	None	None	India	None	Unnamed Road	None	Unnamed Road, Saini Mohalla, Laxmi Park, Block B, Vandana Vihar, Nangloi, Delhi, 110041, India	None	None
30664ceb-a458-418c-8ed8-496c572dfa60	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:00:02.484482+05:30	testworld	NDMC	GIS/Raw/2020-06-13/20085b69-ef24-4114-b9b7-71f0b7b331bb.jpg	GIS/Processed/2020-06-13/dc262ba8-5dce-47bf-a039-dda2eb4fc0d6.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
9f9650ba-0344-40ac-b156-3b4f6fc307d1	558	1	28.5535241000000006	77.2688576999999981	2020-06-13 09:00:03.646746+05:30	testworld	NDMC	GIS/Raw/2020-06-13/72bf97c1-abc4-4359-bf8e-8e032cddac89.jpg	GIS/Processed/2020-06-13/65c7b141-ccb0-4fdd-9837-62c539d9cde2.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
583eb81e-5e6b-49bb-a87f-766a80d247bc	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:00:04.864968+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2d391144-6473-4ddd-b011-fc65baf5e85d.jpg	GIS/Processed/2020-06-13/773a7b83-bdf3-4e1f-9c76-ac5931dba43c.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
5919572b-0165-47c8-936d-858c93cc061f	1393	1	28.551081700000001	77.2704736999999966	2020-06-13 09:00:06.124058+05:30	testworld	NDMC	GIS/Raw/2020-06-13/405054e4-2aba-4ba7-aae8-e07859ec56fa.jpg	GIS/Processed/2020-06-13/8446c187-2223-42b5-804b-19e60a5c6c7d.jpg	0101000020E610000066FBEB704F51534091ECB6B0138D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d037d661-7354-4a27-a30f-8fdb351d590b	11400	3	28.6908683999999994	77.2106553999999932	2020-06-13 09:00:07.72339+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e3a98cf8-9429-4c74-ae6e-71024bfabaef.jpg	GIS/Processed/2020-06-13/124be45c-780f-43d5-b5f0-0d6aa0d6226f.jpg	0101000020E6100000736EC9607B4D534000D75FC0DCB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Faculty of Science	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Faculty of Science, University Enclave, Delhi, 110007, India	None	None
8ee6a283-e578-4e40-b4e8-ece85e3cf512	6575	1	28.5587996000000004	77.2570563000000021	2020-06-13 09:00:09.31079+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a49570f9-0f71-48f5-aec7-21b060f243a6.jpg	GIS/Processed/2020-06-13/7005673d-07c3-4bd1-be7f-c39667b1ae43.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
f2fc5f9a-5a01-4ada-8704-8a1132f9ba0b	8001	1	28.5619052999999994	77.254072800000003	2020-06-13 09:00:10.810309+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d30d5da4-1fc4-46c1-8053-a0f5451bc5c9.jpg	GIS/Processed/2020-06-13/f44c1a3f-a553-40fc-9bd4-3009d8d9f29b.jpg	0101000020E610000067B38FBA42505340F6F29606D98F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Captain Gaur Marg	None	B 1, Captain Gaur Marg, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
d0c2c390-321e-4ad0-894b-ced6e42bc654	7672	2	28.5593746999999993	77.2564191000000022	2020-06-13 09:00:11.943551+05:30	testworld	NDMC	GIS/Raw/2020-06-13/27447b81-5608-4d4e-a724-b975a4df8dd2.jpg	GIS/Processed/2020-06-13/51c533ab-e767-40c3-ba1b-567bb31c7f37.jpg	0101000020E61000007724A82B69505340B6B52A2E338F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
6efd3efb-f1c8-4d4b-bae7-e55e6bfe87ae	14893	2	28.5532858000000012	77.2690819999999974	2020-06-13 09:00:13.114836+05:30	testworld	NDMC	GIS/Raw/2020-06-13/21453447-0ccd-43b3-82c7-89762935b47a.jpg	GIS/Processed/2020-06-13/61bc0baa-f134-4766-b9c2-7fdc6dd8fecc.jpg	0101000020E61000004E7CB5A33851534059576023A48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
07573e02-4220-4cdc-9b5b-70bf3a8c72ad	8353	3	28.6887523999999985	77.209666900000002	2020-06-13 09:00:14.285347+05:30	testworld	NDMC	GIS/Raw/2020-06-13/277f93d9-9078-4cce-8581-879afa253c27.jpg	GIS/Processed/2020-06-13/21d2cb4c-7bff-40e2-b3c6-b77b93971456.jpg	0101000020E610000070A3B72E6B4D5340A00AC91352B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
9a2603e7-1253-499b-80ca-ee2deaba2b45	950	1	28.6994927000000004	77.2179416999999972	2020-06-13 09:00:15.577341+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bcd52c15-e195-4f27-9cb4-2989f8ad785e.jpg	GIS/Processed/2020-06-13/f3ed0775-49f5-40d5-8d08-ebb1af77837f.jpg	0101000020E6100000D17BBEC1F24D53406E4A1EF411B33C40	None	None	None	None	110054	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Lucknow Road	None	16, Lucknow Rd, Banarsi Das Estate, Timarpur, Delhi, 110054, India	None	None
04d51e39-72ec-41e0-8274-18dc2ac70714	1359	1	28.5515849000000017	77.2703551999999974	2020-06-13 09:00:16.811356+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bbab7ed1-afe1-41e4-a437-1c35718afe62.jpg	GIS/Processed/2020-06-13/e93b804c-3179-4fcc-a5ca-94f370d5f050.jpg	0101000020E61000006D93E57F4D515340AA7702AB348D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
ad4c7427-9c09-4f8c-8ad5-1e88b8538792	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:00:17.944754+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fb646494-24be-4960-93c3-7f2b5cfd498e.jpg	GIS/Processed/2020-06-13/9b6a98a1-04ed-4e73-a5e2-c885d9b26dfc.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b7aeec6f-da78-47ab-aa63-9f2ec8994d86	30595	1	28.5592345999999999	77.2564517999999936	2020-06-13 09:00:19.099848+05:30	testworld	NDMC	GIS/Raw/2020-06-13/539c6573-b248-4308-a662-789623b64837.jpg	GIS/Processed/2020-06-13/a6cf682d-c08e-44c7-99ff-9dff69401572.jpg	0101000020E61000000580CFB469505340A9CAADFF298F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
e98292fa-b0ec-4621-a3a6-391b8cb3dac0	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:00:20.664041+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c8883a74-66c3-4f11-a709-21699dbb2c3f.jpg	GIS/Processed/2020-06-13/139a994a-2d33-491d-963a-3e246204ba76.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
7e26f74e-5713-4961-b71f-896d1f682d54	8353	3	28.6887523999999985	77.209666900000002	2020-06-13 09:00:21.914354+05:30	testworld	NDMC	GIS/Raw/2020-06-13/18f1dd10-c25e-47c4-9265-9c2db625b20e.jpg	GIS/Processed/2020-06-13/817eae55-a61e-4e60-971d-e8dece9ab758.jpg	0101000020E610000070A3B72E6B4D5340A00AC91352B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
1f243018-703f-4b4c-a801-a72f17b4cd8d	660	1	28.5534028000000006	77.2689687000000021	2020-06-13 09:00:23.150043+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6d37b515-8c01-4261-8d9b-4a4009ed5e08.jpg	GIS/Processed/2020-06-13/1a20e110-f5b7-49c0-9d03-9571dddbc5a6.jpg	0101000020E610000073897EC836515340CC834FCEAB8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
bd3b0cd0-7cec-4f2b-a4d1-c3ad55956b45	16388	1	28.5514362000000013	77.2703975000000014	2020-06-13 09:00:24.316298+05:30	testworld	NDMC	GIS/Raw/2020-06-13/20ff0769-019b-482e-9fdd-f46425d8516a.jpg	GIS/Processed/2020-06-13/e5801340-14c1-4fe3-a8b8-bbd577cc7af6.jpg	0101000020E6100000E4DA50314E5153409DD43CEC2A8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b501ae97-c129-4176-931e-8cf01dd88353	24033	1	28.5546787000000002	77.2677402000000058	2020-06-13 09:00:25.863236+05:30	testworld	NDMC	GIS/Raw/2020-06-13/43c90bd9-8771-492e-9269-5808585bbf3a.jpg	GIS/Processed/2020-06-13/a2e734c5-b22d-459b-8197-a0d2564d5df5.jpg	0101000020E6100000C5B4CAA722515340AD495C6CFF8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f38cc84a-1479-4adc-a7d4-33bf4a4e5762	106546	1	28.6954485000000012	77.2129584999999992	2020-06-13 09:00:27.0452+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f73da2a4-533b-4caa-aecb-dc36ec39e285.jpg	GIS/Processed/2020-06-13/b3ec07e9-51f6-4f06-af28-60e999fec607.jpg	0101000020E6100000EF39B01CA14D5340618DB3E908B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
92ed0760-cf4d-4c7d-bc97-205c3040025f	24431	4	28.5528951000000006	77.2694204000000013	2020-06-13 09:00:28.24185+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4c724a87-6ea0-41aa-a00a-0f3fe1263682.jpg	GIS/Processed/2020-06-13/711e41b7-9e64-43f8-b2df-7125d22dc06b.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
96f1ef44-3490-464d-a184-3427564ada04	10038	1	28.5592362999999985	77.2564471999999967	2020-06-13 09:00:29.808946+05:30	testworld	NDMC	GIS/Raw/2020-06-13/81a6d077-7f74-4f80-ab1e-0dd6666765d9.jpg	GIS/Processed/2020-06-13/f79e748f-caf6-4964-9132-4b25c7d02021.jpg	0101000020E6100000A64984A1695053406D3C331C2A8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
3fa1043a-3ef4-4593-b6ed-3e3c304eb6d1	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:00:30.998534+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1fa8d512-d256-48b2-8930-44f6541afcdd.jpg	GIS/Processed/2020-06-13/ede19dd1-b84f-410f-8c30-90439ed3ea2c.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
25b1fb18-572f-44fb-84a1-f30604bbb4cc	7465	1	28.5497747000000004	77.2630639000000059	2020-06-13 09:00:32.129476+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b80f5552-e623-4ebb-963d-97bf766764db.jpg	GIS/Processed/2020-06-13/82b51c2b-7407-4054-98fd-b99aba476835.jpg	0101000020E610000087D0F709D650534010ABE408BE8C3C40	None	None	None	None	110048	None	None	None	Kalkaji	Block 9	NSIC Estate	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Outer Ring Road	None	Outer Ring Rd, NSIC Estate, Block 9, Kalkaji, New Delhi, Delhi 110048, India	None	None
7ef3f399-61d3-467a-a3d8-a00fccb3b751	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:00:33.309962+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c567bc26-eef2-4a96-993a-14940ce635eb.jpg	GIS/Processed/2020-06-13/9eb139dd-47ea-4f64-a89e-d7cd6ad61418.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1ade3640-8f61-40cd-9ea6-b57fd10cfff3	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:00:34.555752+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8446933a-28b8-4416-a349-80439c736c32.jpg	GIS/Processed/2020-06-13/0ae32a4a-9f83-4b51-86a4-a9a8d2f68974.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
eea13337-9424-4039-8047-3a049b787779	6575	1	28.5587996000000004	77.2570563000000021	2020-06-13 09:00:35.731999+05:30	testworld	NDMC	GIS/Raw/2020-06-13/abb56ce0-e1d4-42f9-a22c-3e21ee59f254.jpg	GIS/Processed/2020-06-13/eed76054-dc9f-4061-9834-1acc78e30325.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
726bc4b7-5847-4f9c-a7ba-14f989e3aee2	803	1	28.5511669999999995	77.270471900000004	2020-06-13 09:00:36.823491+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f2a1d970-1585-4065-ba16-3b904a97b661.jpg	GIS/Processed/2020-06-13/348aab33-5ae0-4468-8578-a907b29e635a.jpg	0101000020E61000002B3F5F694F5153406AA2CF47198D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
34213bd4-2c6e-469e-83de-b89977aecdc3	1393	1	28.551081700000001	77.2704736999999966	2020-06-13 09:00:37.948442+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5de20f2a-367a-4e94-81b6-95717d944524.jpg	GIS/Processed/2020-06-13/49a5bbc5-ca79-4000-9c8f-ebb45856cd63.jpg	0101000020E610000066FBEB704F51534091ECB6B0138D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1a397e08-3995-4e39-b40c-04dfed6f1654	1272	1	28.5540516999999987	77.264998300000002	2020-06-13 09:00:39.142447+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3fdf3019-b82d-463e-a3f5-e8c55fff636d.jpg	GIS/Processed/2020-06-13/b7170938-0958-48ed-bbbd-190bcb10e333.jpg	0101000020E6100000B8FF6DBBF55053400FCB0B55D68D3C40	None	None	None	None	110065	None	None	None	Kalkaji	Block 9	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Block 9, Kalkaji, New Delhi, Delhi 110065, India	None	None
ca0fddfe-92c5-487f-8124-c69c66a715e6	14611	2	28.5527408999999999	77.2695341999999954	2020-06-13 09:00:40.257456+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c2fc93e6-4432-42c6-924a-0ee1b0bf0f60.jpg	GIS/Processed/2020-06-13/ab580cdd-140c-45d7-8f35-abe66ac37ac9.jpg	0101000020E6100000D3895F0C405153405FA9786D808D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Okhla Industrial Estate Phase 3 Road	None	42, Okhla Industrial Estate Phase 3 Rd, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
64fac82f-8700-47d9-8168-d1d72499af44	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:00:41.442038+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5cb7f5d1-ebb3-42b9-9d21-afcafe8be329.jpg	GIS/Processed/2020-06-13/483a52c8-428e-4e13-9c98-17fce07a61a5.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
db413f27-bce1-476e-98c4-016869cea434	22145	1	28.5574751000000013	77.2588379999999972	2020-06-13 09:00:42.64903+05:30	testworld	NDMC	GIS/Raw/2020-06-13/da677600-17fa-4206-8a67-a1e1ffacda8b.jpg	GIS/Processed/2020-06-13/f0f7c052-44ed-4fa7-a41e-9cbb264c651c.jpg	0101000020E6100000923D42CD9050534097D52AB0B68E3C40	224	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	224, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
0d9d21a9-0233-418c-9296-5ed467d27a75	8330	1	28.5530350999999989	77.2693114000000065	2020-06-13 09:00:44.113312+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bda5210e-0d7c-4e37-b068-b1e10e65c541.jpg	GIS/Processed/2020-06-13/15364d8f-4579-43f4-8cd3-85809d5f9014.jpg	0101000020E610000029DCE1653C515340430A54B5938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
72d51798-87b1-4288-b87a-46b36778d7c3	1555	1	28.5516417000000011	77.2703802000000053	2020-06-13 09:00:45.375579+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6ffdeae8-9df9-4d35-a74d-390d69307a47.jpg	GIS/Processed/2020-06-13/a111c679-f85d-4569-a15c-d265b84e07d2.jpg	0101000020E61000001A1FC1E84D5153401F9CF463388D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
36bb792d-13d9-4ff6-9f04-807f20ad84f5	4111	1	28.6921438000000002	77.2113099000000034	2020-06-13 09:00:46.511705+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6615061a-b1ab-4614-bfb7-72473d8b965e.jpg	GIS/Processed/2020-06-13/069b0b87-406a-4887-961a-4bbfe840f387.jpg	0101000020E61000008C74F519864D53401121095630B13C40	None	None	None	None	110007	None	None	None	Delhi University	None	None	None	None	New Delhi	None	Delhi	Central Delhi	None	None	None	India	None	Chhatra Marg	None	7, Chhatra Marg, Near Marinda House, Delhi University, New Delhi, Delhi 110007, India	None	None
0d996448-1a60-4042-8f74-659c463bac8a	9475	2	28.5494826999999987	77.2629435999999998	2020-06-13 09:00:47.678022+05:30	testworld	NDMC	GIS/Raw/2020-06-13/92ba1bd6-4b12-4579-afef-2a8ea954ac93.jpg	GIS/Processed/2020-06-13/84a35968-6f6f-418d-bc9a-fab51eacf089.jpg	0101000020E610000052AC6411D4505340C037F2E5AA8C3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	NSIC Estate	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Service Rd	None	Service Rd, NSIC Estate, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d7b6d561-2371-4378-9889-1fd051ddc15d	2206	1	28.6954463000000004	77.2129616999999939	2020-06-13 09:00:48.830089+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4ca9ec26-a700-4296-b4d8-17eb2a3dbacd.jpg	GIS/Processed/2020-06-13/6f5d09b4-0fba-4a4f-8648-605d93b6737f.jpg	0101000020E61000003C331C2AA14D5340CC9FCAC408B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
c3b7f054-fe7d-4fed-845e-c337a3295bea	517	2	28.688948700000001	77.2098069000000038	2020-06-13 09:00:50.059603+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9a80e996-77ea-467b-825a-c674fed28a35.jpg	GIS/Processed/2020-06-13/126a8a1d-b92d-4ca0-a7ca-653ba37eec4f.jpg	0101000020E6100000697EEB796D4D5340291F27F15EB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
7c126c3b-d06e-4f9b-84ce-96a557c8799e	19219	2	28.5551583999999998	77.2673513999999955	2020-06-13 09:00:51.247012+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fe70d256-56f7-4da7-b962-fbb746dd6f24.jpg	GIS/Processed/2020-06-13/23cf6b5f-d823-416f-b8e9-a6128c6f66f9.jpg	0101000020E61000008CE20B491C515340851964DC1E8E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
eb67e1ad-7060-41eb-bb48-2d1c3dcf22a4	8218	2	28.5543142000000003	77.2678903999999989	2020-06-13 09:00:52.401209+05:30	testworld	NDMC	GIS/Raw/2020-06-13/550ae381-585d-44c8-a33a-3fa6a6f8f728.jpg	GIS/Processed/2020-06-13/daeb8132-c076-4a2b-ad9f-9cbb7882d24a.jpg	0101000020E610000064BAC61D255153405AB51089E78D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b4bb2451-2b4a-4dfd-b2d5-03520a2c803d	24033	1	28.5546787000000002	77.2677402000000058	2020-06-13 09:00:53.514283+05:30	testworld	NDMC	GIS/Raw/2020-06-13/30815ccc-1e89-461e-a380-b7d4127f84ac.jpg	GIS/Processed/2020-06-13/91209f48-8d0b-4916-ba7b-746412eb4fa0.jpg	0101000020E6100000C5B4CAA722515340AD495C6CFF8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
5e7b7914-a715-43e1-8f0c-b9b3ba19758c	10970	2	28.5542605999999992	77.2682403000000022	2020-06-13 09:00:54.619916+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9b11bf88-d568-4a95-817e-4074e5febb5c.jpg	GIS/Processed/2020-06-13/40812bbe-8c3e-4e5f-bf12-82d192a0fa34.jpg	0101000020E610000008FE5CD92A5153401A76CE05E48D3C40	15	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	15, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
0752c900-f838-412b-9872-245b8c6759d0	2328	1	28.5653694999999992	77.2346940999999987	2020-06-13 09:00:55.698482+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f586fa66-017b-4a20-a2c0-2e3cce2c4ccb.jpg	GIS/Processed/2020-06-13/66aff579-3382-4c07-b331-cb26f5b95f86.jpg	0101000020E61000001B04673A054F5340E7A7380EBC903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Mahatma Gandhi Marg	None	A5, Mahatma Gandhi Marg, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
3a75eeb5-8d2c-4d28-b460-9bea720f7f9b	6624	1	28.6741327000000013	77.2168448999999981	2020-06-13 09:00:56.818594+05:30	testworld	NDMC	GIS/Raw/2020-06-13/def4f7c8-c5e4-479f-8c8e-1c792e8cdb7b.jpg	GIS/Processed/2020-06-13/8c84d735-eee3-484b-a7d7-c3442a7df438.jpg	0101000020E61000007B736EC9E04D534008AAEBF593AC3C40	None	None	None	None	110054	None	None	None	Civil Lines	Ludlow Castle	None	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Rajpur Road	None	17, Rajpur Rd, Ludlow Castle, Civil Lines, Delhi, 110054, India	None	None
1ae6264e-0309-481c-a381-096559632f4e	19219	2	28.5551583999999998	77.2673513999999955	2020-06-13 09:00:58.006973+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ec1d6c0b-9183-4b2d-9511-1dfaadff8dc4.jpg	GIS/Processed/2020-06-13/ea5f7c12-f737-4038-b107-b620c6929802.jpg	0101000020E61000008CE20B491C515340851964DC1E8E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
56ae1bc6-e1f4-42c6-8ff6-d172ed677922	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:00:59.59064+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8783c9f8-4fb9-4480-86a3-ce23702b2986.jpg	GIS/Processed/2020-06-13/633f3ac5-d571-4422-bb9f-f588e1d77a7e.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
ea74466e-c144-4413-a076-4d6da19f51fd	735	1	28.6907683999999996	77.2160472000000055	2020-06-13 09:01:00.750474+05:30	testworld	NDMC	GIS/Raw/2020-06-13/26609c12-3112-410f-b849-3a1c4ae8043e.jpg	GIS/Processed/2020-06-13/20e1b3a2-ba8b-460f-a990-e22639e50594.jpg	0101000020E61000001D99A2B7D34D5340391CA732D6B03C40	15	None	None	None	110007	None	None	None	Civil Lines	Kamla Nehru Ridge	None	None	None	Delhi	None	Delhi	East Delhi	None	None	None	India	None	None	None	15, Kamla Nehru Ridge, Civil Lines, Delhi, 110007, India	None	None
f7c5ac6f-a0bd-4d8e-8fa8-ce97df465731	2287	1	28.6954461999999992	77.2129616999999939	2020-06-13 09:01:01.990661+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4bac4c1c-adf2-4072-a4f7-ff448feeebd1.jpg	GIS/Processed/2020-06-13/6894a47b-4cbb-4780-9a73-dd331845a4cd.jpg	0101000020E61000003C331C2AA14D5340A2201DC308B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
459d5e01-5cff-4e3b-831b-3a0e6d03f88a	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:01:03.255558+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9f4398cc-4e03-41eb-ab0c-73bb29d9c277.jpg	GIS/Processed/2020-06-13/8c0d7851-44ff-4dab-a863-90e691b37ec0.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
35d3f1b3-6c27-423a-9da8-4258d72e8cef	492	1	28.6954458000000017	77.2129594000000026	2020-06-13 09:01:04.438901+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5cde8eca-3428-4e71-a357-cab2e4f5c873.jpg	GIS/Processed/2020-06-13/bfed2679-279c-4b19-b394-67099d767b7d.jpg	0101000020E61000000D987620A14D5340FC2367BC08B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
528fd9b8-83ba-47aa-b828-89f644b82d6f	15605	1	28.551081700000001	77.2704736999999966	2020-06-13 09:01:05.663242+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8f7e87e0-4ea9-4882-a269-fe6ea6947294.jpg	GIS/Processed/2020-06-13/0f41cadd-ae54-4dd6-a31f-dfa951861061.jpg	0101000020E610000066FBEB704F51534091ECB6B0138D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
7f551789-bbeb-4d05-beea-591621cc840a	16388	1	28.5514362000000013	77.2703975000000014	2020-06-13 09:01:06.816422+05:30	testworld	NDMC	GIS/Raw/2020-06-13/179c3b1d-4bf1-4232-bf5f-f85548bb2a05.jpg	GIS/Processed/2020-06-13/e8e0d7ce-49f9-472b-8945-3bd18f8adb57.jpg	0101000020E6100000E4DA50314E5153409DD43CEC2A8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
01fc5a27-2863-4818-a3dc-2263c81c2102	18524	2	28.5510306999999983	77.2705847999999946	2020-06-13 09:01:07.98857+05:30	testworld	NDMC	GIS/Raw/2020-06-13/66fd4729-f4f3-4c0c-89f0-5a49cc49ede9.jpg	GIS/Processed/2020-06-13/4ea25b89-4211-419e-b001-ba52c34030e7.jpg	0101000020E6100000DCB2E842515153408C971359108D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
631f4a87-0d27-46ff-8e41-ee23468230e6	2621	1	28.5528022999999997	77.2695606999999995	2020-06-13 09:01:09.110426+05:30	testworld	NDMC	GIS/Raw/2020-06-13/dd4a9d50-d2f2-4c1e-a098-66a03ae78db8.jpg	GIS/Processed/2020-06-13/bfa14a2d-4934-47ff-9885-b7dc021f3e39.jpg	0101000020E61000005CB2857B4051534051A79773848D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Okhla Industrial Estate Phase 3 Road	None	42, Okhla Industrial Estate Phase 3 Rd, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
0a041ba1-7901-450d-8c6f-5adc935508d4	955	1	28.5613001000000004	77.2567616999999984	2020-06-13 09:01:10.312305+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c6675867-7525-4174-a8cd-ac27a52e9d1f.jpg	GIS/Processed/2020-06-13/de15baca-6ae4-4bef-843b-4d9ffa6f00d0.jpg	0101000020E61000006217A0C86E505340D5BD045DB18F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsen Marg	None	C 24, Raja Dhirsen Marg, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
94fd26d5-534a-4bd5-b8d5-a6f4e9215e23	803	1	28.5511669999999995	77.270471900000004	2020-06-13 09:01:11.560887+05:30	testworld	NDMC	GIS/Raw/2020-06-13/003461e9-63a4-4274-9fa7-a3006c2459b2.jpg	GIS/Processed/2020-06-13/0afff68a-7173-494e-b0d0-a686c6e75c88.jpg	0101000020E61000002B3F5F694F5153406AA2CF47198D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d5393c90-6b3a-418d-9a8f-ed7bd11df67b	15403	4	28.5550135000000012	77.267458199999993	2020-06-13 09:01:12.753325+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0297e5b1-e965-4e3f-a0ed-b2acc07fdcb2.jpg	GIS/Processed/2020-06-13/faa1f278-5d87-4364-8da4-20820193cdb4.jpg	0101000020E61000000283FF081E515340A8565F5D158E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e604dd98-87a4-44eb-8cc9-1a2b946ec6ac	24033	1	28.5546787000000002	77.2677402000000058	2020-06-13 09:01:14.337892+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b403f350-cb77-4a66-a0a3-ee5987fb7068.jpg	GIS/Processed/2020-06-13/4a7b8141-8864-49d1-8b32-9b4e9e920a51.jpg	0101000020E6100000C5B4CAA722515340AD495C6CFF8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
99f36fb4-d383-4141-9dfb-5bba8af139c2	2247	1	28.5529407000000006	77.2647000999999989	2020-06-13 09:01:15.523125+05:30	testworld	NDMC	GIS/Raw/2020-06-13/659714a2-c8f5-4487-9e3e-c06984743cde.jpg	GIS/Processed/2020-06-13/343351e5-0e75-4bdc-976e-ec597df76e8f.jpg	0101000020E6100000DE2FB0D8F05053409A208F858D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NTSC, 3rd Floor, E- Block, NSIC, Okhla Industrial Estate-III, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
5b5c92a3-7042-40c2-bad9-6cdacef7fd72	1359	1	28.5515849000000017	77.2703551999999974	2020-06-13 09:01:16.699917+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ed63813f-cfec-4e2a-a665-8004a68c6f83.jpg	GIS/Processed/2020-06-13/eb650bb7-039d-4b04-a16a-b6ed168c59be.jpg	0101000020E61000006D93E57F4D515340AA7702AB348D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2ab79879-bdd4-478e-9c77-83e7a7b8b38c	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:01:17.800306+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9fd9a5a9-5990-414a-a6df-98a892b0613a.jpg	GIS/Processed/2020-06-13/982a4896-1948-4025-aef8-293e6d50cf3f.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
9bab4009-7581-4fcf-a62e-76e95fec6153	1199	3	28.6754518000000012	77.2164202000000017	2020-06-13 09:01:18.983811+05:30	testworld	NDMC	GIS/Raw/2020-06-13/067f1863-772c-4115-a404-3af25dc032a5.jpg	GIS/Processed/2020-06-13/d7cbaba0-a493-494c-bdc5-230c84e56b9d.jpg	0101000020E6100000674C1CD4D94D53403B06BF68EAAC3C40	None	None	None	None	110054	None	None	None	Civil Lines	Ludlow Castle	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	Rajpur Road	None	16, Rajpur Rd, Ludlow Castle, Civil Lines, Delhi, 110054, India	None	None
f488ace7-ee9d-43a0-8893-42427613612f	11400	3	28.6908683999999994	77.2106553999999932	2020-06-13 09:01:20.317013+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7cb5bff8-61c6-4d1c-a204-41149518259a.jpg	GIS/Processed/2020-06-13/c01b39c0-3630-4d47-b389-fc0c9d2a04a7.jpg	0101000020E6100000736EC9607B4D534000D75FC0DCB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Faculty of Science	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Faculty of Science, University Enclave, Delhi, 110007, India	None	None
00e7f049-271f-4ab1-9bc0-5d7774549b49	517	2	28.688948700000001	77.2098069000000038	2020-06-13 09:01:21.554479+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9cda6862-3238-4928-b0fd-3f38ecc51cd9.jpg	GIS/Processed/2020-06-13/dd5b4d74-796e-417f-8614-89973b4ce860.jpg	0101000020E6100000697EEB796D4D5340291F27F15EB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
91620987-c562-4911-969c-13cc48845899	24431	4	28.5528951000000006	77.2694204000000013	2020-06-13 09:01:22.711494+05:30	testworld	NDMC	GIS/Raw/2020-06-13/333a4e6e-0565-4d1c-a325-cadd1ecf9980.jpg	GIS/Processed/2020-06-13/aa164f68-4dc1-4383-9605-e2f43726ae67.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
ce60f76a-8083-4333-b247-6dfe8886a493	1024	1	28.5548476999999998	77.2656843000000038	2020-06-13 09:01:23.828927+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1aaa1026-ed14-4ea8-8cda-230c642e426b.jpg	GIS/Processed/2020-06-13/622d99cb-2c1f-48ad-b473-edf05df6251a.jpg	0101000020E6100000E2E3B8F800515340C5C2B57F0A8E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
6c79175a-f94a-4a26-ad5e-f8b3aaa3dd16	803	1	28.5511669999999995	77.270471900000004	2020-06-13 09:01:24.980329+05:30	testworld	NDMC	GIS/Raw/2020-06-13/540bfc93-dbe5-40e4-b091-a47f90db961a.jpg	GIS/Processed/2020-06-13/c94a164b-8cf5-4e9d-89ad-56c1d63a199f.jpg	0101000020E61000002B3F5F694F5153406AA2CF47198D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
c8e44baa-e35e-4f9b-b955-600ec4af8f9b	2475	1	28.5521546999999991	77.2701636999999977	2020-06-13 09:01:26.165669+05:30	testworld	NDMC	GIS/Raw/2020-06-13/cb6b76a4-8c89-4a76-bf11-05d3d93f14b4.jpg	GIS/Processed/2020-06-13/85faa89e-f72b-436f-8205-27566bde3eef.jpg	0101000020E61000003F04B05C4A5153402BD5AA025A8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase 3 Road	None	422, Okhla Phase 3 Rd, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
27fee9f9-02f0-4390-b5a0-27aeaa82644a	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:01:27.36882+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c4a40f63-1aa9-4212-b8f5-ad143e6ef379.jpg	GIS/Processed/2020-06-13/3dc55cf2-5b17-4d33-a380-f765be0face6.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
a4232a89-8586-4d4c-a4af-e16d7520e97b	8001	1	28.5619052999999994	77.254072800000003	2020-06-13 09:01:28.496729+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bbdfb350-8187-4412-a192-c408eca948ba.jpg	GIS/Processed/2020-06-13/a1d63b6f-b140-4580-8600-3fb84dbbbc7f.jpg	0101000020E610000067B38FBA42505340F6F29606D98F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Captain Gaur Marg	None	B 1, Captain Gaur Marg, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
7d4e90e2-d9cc-454f-99a8-3364d6301ade	955	1	28.5613001000000004	77.2567616999999984	2020-06-13 09:01:29.55932+05:30	testworld	NDMC	GIS/Raw/2020-06-13/14d6fd77-4896-42c7-b4bb-031869e10b1f.jpg	GIS/Processed/2020-06-13/9a6784bb-7cdf-411e-8701-488ffe5c0f34.jpg	0101000020E61000006217A0C86E505340D5BD045DB18F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsen Marg	None	C 24, Raja Dhirsen Marg, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
cadee7d3-d2e4-4580-b58e-7a31679e3f7f	850	1	28.5590742000000013	77.256635799999998	2020-06-13 09:01:30.677676+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b968bda1-9e23-4670-a0c5-b6f1ee93430f.jpg	GIS/Processed/2020-06-13/4bd06ce1-612a-4547-9d13-27b49e53437b.jpg	0101000020E6100000E6FE8FB86C50534091099D7C1F8F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Hills Road	None	163, Hills Rd, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
4c18841d-f787-42e2-8daf-f62a5c92a889	15605	1	28.551081700000001	77.2704736999999966	2020-06-13 09:01:31.777611+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e70d04e7-e903-4670-a12b-e7bec6d40acf.jpg	GIS/Processed/2020-06-13/08f4e528-0102-4b1d-801c-be5c5d7c57e2.jpg	0101000020E610000066FBEB704F51534091ECB6B0138D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
0034b66f-d1d8-4d36-968f-dff1192febbf	6575	1	28.5587996000000004	77.2570563000000021	2020-06-13 09:01:32.908135+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c8b1dfe9-a5c9-4fab-a2c8-e69871052bc9.jpg	GIS/Processed/2020-06-13/318c9478-3ff0-4123-9190-1eeeed0acc6e.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
2784e4da-df0a-46ad-ba6f-f9da1f11e5c8	8218	2	28.5543142000000003	77.2678903999999989	2020-06-13 09:01:34.010916+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9e3bffba-ab49-4509-96d3-7c9a80bf1b10.jpg	GIS/Processed/2020-06-13/a68392f5-177f-4279-aa44-cd08cdd69fc7.jpg	0101000020E610000064BAC61D255153405AB51089E78D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
039e3f73-affa-4223-9d34-82456409b2aa	5705	1	28.5509704999999983	77.2706055999999961	2020-06-13 09:01:35.111786+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2e7cbb9d-c06c-478a-be89-382547c2e1df.jpg	GIS/Processed/2020-06-13/17b3efd9-80e0-4020-96f8-13363a3c73b1.jpg	0101000020E61000005387269A515153408E8F16670C8D3C40	77	None	None	None	110020	None	None	None	Modimill	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	77, Okhla Phase III, Modimill, New Delhi, Delhi 110020, India	None	None
a110b2d6-c5fb-4f50-b92d-3cef45d82456	1907	1	28.6954557000000001	77.2129579000000064	2020-06-13 09:01:36.393108+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2829d30a-f292-4fae-b1b9-abd083c8ea8e.jpg	GIS/Processed/2020-06-13/9dfc20b9-f54c-402f-ae7f-34216e740404.jpg	0101000020E610000031FB2B1AA14D534019517F6209B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
fbeb9f52-fd98-4092-860e-867fddfb6827	14611	2	28.5527408999999999	77.2695341999999954	2020-06-13 09:01:37.487409+05:30	testworld	NDMC	GIS/Raw/2020-06-13/44c0baa9-1296-4a64-9e72-8037285429f4.jpg	GIS/Processed/2020-06-13/255ebc35-7921-49e6-b257-fd28206159ec.jpg	0101000020E6100000D3895F0C405153405FA9786D808D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Okhla Industrial Estate Phase 3 Road	None	42, Okhla Industrial Estate Phase 3 Rd, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
84b4fa67-0f64-4af0-b10d-e79d094d3f15	5952	1	28.5528951000000006	77.2694204000000013	2020-06-13 09:01:38.603376+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0dd25bcd-74ad-400b-97ff-37b9f2f8885d.jpg	GIS/Processed/2020-06-13/ada0c289-a320-4716-9320-eb8002d6ef03.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
35e6882d-5c72-4083-b781-ceb4112f5d6c	2131	1	28.5562107999999988	77.2648970000000048	2020-06-13 09:01:39.709738+05:30	testworld	NDMC	GIS/Raw/2020-06-13/262c0b6b-cc30-45d3-8a1b-604b0655c9cd.jpg	GIS/Processed/2020-06-13/da8fe590-3d8c-4742-ab56-6bd6fbb760e6.jpg	0101000020E6100000BFF38B12F450534097AEBBD4638E3C40	None	None	None	None	110020	None	None	None	Bahapur	Okhla Sabzi Mandi	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Small Industries Service Institute / Modi Mill, Okhla Sabzi Mandi, Bahapur, New Delhi, Delhi 110020, India	None	None
26e93fa9-734d-491d-8ad0-0b252190b31d	8218	2	28.5543142000000003	77.2678903999999989	2020-06-13 09:01:40.81759+05:30	testworld	NDMC	GIS/Raw/2020-06-13/106f2adc-5be2-4ede-b4cc-a27969aa460c.jpg	GIS/Processed/2020-06-13/1cdc0772-6582-4191-a882-8910e84d6446.jpg	0101000020E610000064BAC61D255153405AB51089E78D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
7b4111c2-2bcc-47d7-bee8-53c222974973	30595	1	28.5592345999999999	77.2564517999999936	2020-06-13 09:01:41.995954+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7996335f-c429-4318-a17a-500f4742b02a.jpg	GIS/Processed/2020-06-13/5c6bd883-cedd-4e0f-97f4-887e3b3ca443.jpg	0101000020E61000000580CFB469505340A9CAADFF298F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
e7dbde14-2ac5-4b49-ad09-e84cf29eda76	1738	1	28.6836549000000005	77.2139839999999964	2020-06-13 09:01:43.156477+05:30	testworld	NDMC	GIS/Raw/2020-06-13/338ab2ce-e7c7-4219-b727-646d456e4e8e.jpg	GIS/Processed/2020-06-13/dce29c95-4d2c-4a09-8f2c-6f4ed326a05e.jpg	0101000020E61000008177F2E9B14D53400A40ED0104AF3C40	None	None	None	None	110007	None	None	None	Civil Lines	Kamla Nehru Ridge	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	725 main babarpur road rohtash nagar shahdara delhi-110032, Kamla Nehru Ridge, Civil Lines, Delhi, 110007, India	None	None
b4c7d2de-4b50-40a7-86b8-468bb0fda2e4	3304	1	28.5544098999999996	77.2652704999999997	2020-06-13 09:01:44.320527+05:30	testworld	NDMC	GIS/Raw/2020-06-13/992f4058-03b8-4d3a-8b15-d3ac3fd0e666.jpg	GIS/Processed/2020-06-13/03879f39-3754-4255-8058-7fe59225f233.jpg	0101000020E6100000FD851E31FA5053402114A5CEED8D3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
deb639dd-e1d7-4dde-9f5e-d90a9425344a	3287	4	28.6962906000000011	77.2134216999999978	2020-06-13 09:01:45.517637+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fa9d7fc3-3a51-4b3a-8a29-a454b7868eca.jpg	GIS/Processed/2020-06-13/9514146c-569a-4473-aaa2-68b34029292d.jpg	0101000020E61000006E707DB3A84D53402183CB1940B23C40	None	None	None	None	110054	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	New Delhi	None	Delhi	Central Delhi	None	None	None	India	None	The Mall Road	None	45, The Mall Rd, Banarsi Das Estate, Timarpur, New Delhi, Delhi 110054, India	None	None
a1ab9e5b-245c-4ec1-a908-05f8c9d5ac48	21070	2	28.6954463000000004	77.2129616999999939	2020-06-13 09:01:46.740386+05:30	testworld	NDMC	GIS/Raw/2020-06-13/acb90ddf-3bda-4f14-9784-b0265a919e71.jpg	GIS/Processed/2020-06-13/13cb0f4f-7c99-4995-b355-acbed5b17483.jpg	0101000020E61000003C331C2AA14D5340CC9FCAC408B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
9896a2bd-5ec5-45f6-83e1-a6dffca3f784	1120	1	28.5525857000000016	77.2696487000000047	2020-06-13 09:01:47.91853+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2b81d9e7-b91d-44cd-a69f-5deb13cbdb0b.jpg	GIS/Processed/2020-06-13/ac2d0f7f-3d54-41b3-9596-5a588d31d6bd.jpg	0101000020E61000002CFA9EEC41515340BEBCA541768D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	208, Okhla, Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
9d30e27e-6b35-48f7-93a6-10ef54309566	4239	2	28.6887676999999996	77.2096820999999949	2020-06-13 09:01:49.098275+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b672730a-b7d0-4f1a-9429-df0e19d1628d.jpg	GIS/Processed/2020-06-13/650f35d3-c90a-487b-8f1d-8a29aaca592c.jpg	0101000020E61000009F83786E6B4D5340880A7A1453B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
fc401a74-1c18-42be-9327-fe921cc71cc1	1359	1	28.5515849000000017	77.2703551999999974	2020-06-13 09:01:50.220625+05:30	testworld	NDMC	GIS/Raw/2020-06-13/00ff60b3-d24a-4f30-be5a-f7505a21db7e.jpg	GIS/Processed/2020-06-13/a66e2494-9907-42ac-a8fd-8f1d9a6c21da.jpg	0101000020E61000006D93E57F4D515340AA7702AB348D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
fdacb6a6-9118-4979-9d7e-aaac4a418715	15403	4	28.5550135000000012	77.267458199999993	2020-06-13 09:01:51.283444+05:30	testworld	NDMC	GIS/Raw/2020-06-13/962c50b1-4ceb-41a5-8e46-0d9dda0e934f.jpg	GIS/Processed/2020-06-13/6962b725-4b1f-4ac0-989a-22445a1e366c.jpg	0101000020E61000000283FF081E515340A8565F5D158E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b829ecf2-8dc8-40b0-8b66-43f019dc16fd	24033	1	28.5546787000000002	77.2677402000000058	2020-06-13 09:01:52.467103+05:30	testworld	NDMC	GIS/Raw/2020-06-13/251096e5-a2c6-4a5f-99c5-6c659168bc4a.jpg	GIS/Processed/2020-06-13/6de37860-137d-4397-bae7-e6005843e31e.jpg	0101000020E6100000C5B4CAA722515340AD495C6CFF8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
8ca843e8-ba62-47de-98a8-9eccb01c3ca9	9265	1	28.5540708000000016	77.2683877000000052	2020-06-13 09:01:53.637655+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f4c6fd57-f8ba-4905-8213-84591f4731e0.jpg	GIS/Processed/2020-06-13/2db3b9f4-da6f-4160-8fe6-98f6cb7f91bc.jpg	0101000020E610000084899A432D51534027AB7D95D78D3C40	15	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	15, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
9d0d2dec-80e1-440e-8854-a4fb7a766140	5588	1	28.5519664999999989	77.2700648000000001	2020-06-13 09:01:54.783932+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3cedf964-46d9-4a56-95c6-8205f59f39af.jpg	GIS/Processed/2020-06-13/e0438e8d-b3a4-4dc6-a425-9bce591a007e.jpg	0101000020E610000040F3DEBD48515340D2FC31AD4D8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
7fa3a71b-4e73-4e13-8f86-0039ca2f1b5a	24431	4	28.5528951000000006	77.2694204000000013	2020-06-13 09:01:55.910671+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5cefabb4-525b-4045-bbcb-7c625c041d69.jpg	GIS/Processed/2020-06-13/4bd97c46-3384-4acb-8bb9-222577a0aa16.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e0e12eac-5874-477a-9fd8-c323c53c8e52	55007	1	28.5555003999999997	77.2670537999999993	2020-06-13 09:01:56.952887+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ae5a5984-9cd5-436e-8d07-f677d27b2cab.jpg	GIS/Processed/2020-06-13/851a3a9d-ae67-4108-a5c4-43f7f4dc4dfc.jpg	0101000020E61000007151D2681751534038EA3246358E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
60a0f3cc-6286-4e7b-93a4-1b85df4a0d46	1713	1	28.553746799999999	77.2687501000000054	2020-06-13 09:01:58.112692+05:30	testworld	NDMC	GIS/Raw/2020-06-13/43d3c0fc-7fcc-4bc7-8b3f-0ecc1a43b1db.jpg	GIS/Processed/2020-06-13/e4b1a23f-31d8-48b2-aad7-30c9dac2c950.jpg	0101000020E6100000FE929E3333515340C043AC59C28D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
843a0f4d-c86b-471e-be73-9b7161286071	1393	1	28.551081700000001	77.2704736999999966	2020-06-13 09:01:59.216003+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8948616a-813d-4565-af91-37a428f17c4f.jpg	GIS/Processed/2020-06-13/039998a1-5b4b-4a09-ba79-df56746e51af.jpg	0101000020E610000066FBEB704F51534091ECB6B0138D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
c69a97cb-a785-46de-8380-5036311c6cf7	850	1	28.5590742000000013	77.256635799999998	2020-06-13 09:02:00.406968+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3786ca33-556e-4e62-83fc-d2168d69d829.jpg	GIS/Processed/2020-06-13/d22d897e-00eb-4042-9110-31c1b03bf481.jpg	0101000020E6100000E6FE8FB86C50534091099D7C1F8F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Hills Road	None	163, Hills Rd, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
fe6f211b-43dd-4b40-9ca9-d88d4a9eea06	16388	1	28.5514362000000013	77.2703975000000014	2020-06-13 09:02:01.563709+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9e10c189-9cf6-45b3-b863-6a6c852f642c.jpg	GIS/Processed/2020-06-13/38fe77ed-f827-424e-9f70-b1058034c615.jpg	0101000020E6100000E4DA50314E5153409DD43CEC2A8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
9de84310-12ba-4e25-9e8b-0aa1772cca05	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:02:02.673435+05:30	testworld	NDMC	GIS/Raw/2020-06-13/60efc020-a312-4fc1-9446-e2220c42448f.jpg	GIS/Processed/2020-06-13/398db17a-ae12-4d21-8e4f-4e97ecbe8c5d.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
33b94be0-2451-47ca-a1ff-054bb4fa7eba	18524	2	28.5510306999999983	77.2705847999999946	2020-06-13 09:02:03.852706+05:30	testworld	NDMC	GIS/Raw/2020-06-13/703b7a3d-9f32-4a58-9982-4585b725d0bf.jpg	GIS/Processed/2020-06-13/5b899ba2-f342-43ed-b929-987676390aee.jpg	0101000020E6100000DCB2E842515153408C971359108D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2b30675c-2998-42c8-8bdd-6514419ddc9c	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:02:05.030563+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7a52123c-e76a-46f2-a82a-629cc3065a00.jpg	GIS/Processed/2020-06-13/74431521-d58f-4f07-9275-50f962297902.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
55d04d1d-392b-4e1f-b51e-2b283e235e4d	10970	2	28.5542605999999992	77.2682403000000022	2020-06-13 09:02:06.27626+05:30	testworld	NDMC	GIS/Raw/2020-06-13/96889506-a451-4ee1-8e7d-1c81a851b0dc.jpg	GIS/Processed/2020-06-13/452057fd-9d26-4435-97b7-1aad230d64f7.jpg	0101000020E610000008FE5CD92A5153401A76CE05E48D3C40	15	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	15, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
389ee0d1-0bbc-49f4-b77f-163ed33e40ad	3094	1	28.6930595000000004	77.2117647999999974	2020-06-13 09:02:07.44249+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4fe08bb4-35cd-40d2-abbc-8b3e3332f036.jpg	GIS/Processed/2020-06-13/386823ee-ff80-40d4-8d3d-e37225468189.jpg	0101000020E61000006A9CF28D8D4D53409FAEEE586CB13C40	None	None	None	None	110007	None	None	None	None	University Enclave	Faculty of Science	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Faculty of Science, University Enclave, Delhi, 110007, India	None	None
c5e09330-607a-4f94-87cc-908078778227	13935	1	28.6893308000000005	77.2099678999999952	2020-06-13 09:02:08.672847+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bfa3bb8e-87c6-40ff-a79e-d4674ae69bf8.jpg	GIS/Processed/2020-06-13/acfc8d9b-c8f4-46bd-b6dc-57526fdc12e9.jpg	0101000020E61000006DED331D704D53402220BAFB77B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
21ef6b50-4a65-4eb5-8ccd-6b66882aadab	1958	1	28.5595256000000006	77.2618808999999942	2020-06-13 09:02:09.800585+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ec3895c0-9fdc-4eee-87f4-2d9d4c0d310a.jpg	GIS/Processed/2020-06-13/ff06e141-1440-48c0-a84f-aa6e986e77f8.jpg	0101000020E61000009C3C1BA8C25053405846D9113D8F3C40	None	None	None	None	110048	None	None	None	Bahapur	Shambhu Dayal Bagh	G Block	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Captain Gaur Marg	None	Captain Gaur Marg, G Block, Shambhu Dayal Bagh, Bahapur, New Delhi, Delhi 110048, India	None	None
2df64d37-fa3a-48ae-86c6-9b140c6449bf	517	2	28.688948700000001	77.2098069000000038	2020-06-13 09:02:10.922029+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a3445c67-ee08-45a2-ac30-5bcfbf18b9cc.jpg	GIS/Processed/2020-06-13/ef9af368-3cf8-487e-864f-afc09bf52079.jpg	0101000020E6100000697EEB796D4D5340291F27F15EB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
b985f780-2d5c-45f0-a3f0-15bf3a4e93bf	1266	1	28.5537834000000004	77.268541600000006	2020-06-13 09:02:12.039504+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1aebf1fb-abcc-4f43-b5e6-747280db5246.jpg	GIS/Processed/2020-06-13/325b8913-9d16-44e6-8b73-b43769afe530.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f7707980-5cbd-4b19-8a00-9cb727ee9a03	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:02:13.162739+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c4291822-00eb-4369-9882-689ee70b1f36.jpg	GIS/Processed/2020-06-13/19224550-c6b1-47f6-9f2d-11f6215ac4c3.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
70ba2409-aef3-45c9-8847-a58cc55d7eae	1120	1	28.5525857000000016	77.2696487000000047	2020-06-13 09:02:14.294448+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9440efa2-3fb6-473e-bcdf-e709f4e02d72.jpg	GIS/Processed/2020-06-13/3fef89c3-867d-4883-8b1e-ddf9f1f177b0.jpg	0101000020E61000002CFA9EEC41515340BEBCA541768D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	208, Okhla, Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
3156a5bb-0492-4da6-868c-cf3e0cdba4f6	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:02:15.40233+05:30	testworld	NDMC	GIS/Raw/2020-06-13/695c8a2b-4688-435b-9360-b54181c937bb.jpg	GIS/Processed/2020-06-13/c142cc63-360c-4618-aeb2-cce1be3efc2c.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1c489727-b0ca-421a-9092-ca4c66db7c50	24431	4	28.5528951000000006	77.2694204000000013	2020-06-13 09:02:16.464028+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d6dc80ba-3d50-4db3-9598-55e5d69dc886.jpg	GIS/Processed/2020-06-13/04c9c768-3858-4dbe-bb51-f795a89f60c9.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1747159c-1468-4064-92af-286aa8cff58f	48313	2	28.6911583000000014	77.2161899999999974	2020-06-13 09:02:17.62872+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c711739d-1ca3-45c9-b68e-9ce7011c363d.jpg	GIS/Processed/2020-06-13/42e3816d-7a31-4104-a4bb-521f2a96fb8c.jpg	0101000020E610000039EE940ED64D5340E5DB16C0EFB03C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	New Delhi	None	None	None	India	None	Vishvavidalaya Marg	None	7/4, Vishvavidalaya Marg, Delhi, 110007, India	None	None
d7fdd29d-188f-487c-8881-0adce349c3d9	875	1	28.5515849000000017	77.2703551999999974	2020-06-13 09:02:18.845731+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6396919b-a469-4c03-962a-ce40e5084bfa.jpg	GIS/Processed/2020-06-13/ba5a737d-2fc6-4be7-82fe-5ceead2d0441.jpg	0101000020E61000006D93E57F4D515340AA7702AB348D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
35eeab45-344f-451b-bf74-dd324261a4d4	2798	1	28.5537834000000004	77.268541600000006	2020-06-13 09:02:19.994457+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e056c9f8-1ab1-4442-8b34-d4c159947e06.jpg	GIS/Processed/2020-06-13/7b20acc1-e6ec-47d2-a3ed-c1b748f31581.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d752a0a7-f29d-4bf1-b68f-6e2ed70bf93a	14558	1	28.5536373999999995	77.2688334000000054	2020-06-13 09:02:21.118042+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2819f0d3-9852-4247-9faa-5b3c2f6a41e4.jpg	GIS/Processed/2020-06-13/9c371e03-a538-4df7-bb8a-7668b94c7fa4.jpg	0101000020E6100000A444019134515340ACD73E2EBB8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
8624e57d-5614-42f9-b164-9e796e8afdd0	5723	1	28.6907266000000014	77.2106009000000029	2020-06-13 09:02:22.307362+05:30	testworld	NDMC	GIS/Raw/2020-06-13/11f7e7f4-ce50-4879-99c5-5890f24a4389.jpg	GIS/Processed/2020-06-13/65755e16-4943-4427-8f5c-0721c479b662.jpg	0101000020E61000008680327C7A4D53402F7A5D75D3B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
6513bafc-d95e-496e-be64-c92776dcb6ca	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:02:23.513667+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d8260943-b46d-4817-9cfa-0a642efccf6b.jpg	GIS/Processed/2020-06-13/e9230114-da9d-4e3a-9328-89cd91006f86.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
a4b4a4e8-7c38-4390-88d2-131a6ec824a6	2634	1	28.6941868000000007	77.2174092999999999	2020-06-13 09:02:24.664329+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a8e169fb-3ae1-41d5-a151-01a41f8a9aaf.jpg	GIS/Processed/2020-06-13/1c4cf80e-8c29-4807-87cd-8c31938c8a67.jpg	0101000020E61000002956B208EA4D53409D50E339B6B13C40	None	None	None	None	110009	None	None	None	Mukherjee Nagar	Hakikat Nagar	None	None	None	Delhi	None	Delhi	North West Delhi	None	None	None	India	None	The Mall Road	None	21/31, The Mall Rd, Hakikat Nagar, Mukherjee Nagar, Delhi, 110009, India	None	None
1f9c758c-6bb2-4a0a-9343-515a3fae1946	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:02:25.768618+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3ec2747f-2d8b-40d8-b396-21beebea6e18.jpg	GIS/Processed/2020-06-13/90c0d04a-3ce0-49a6-b901-955a46a3ea8f.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
08150a2a-20fc-45d6-8880-ed7a09d56684	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:02:26.872558+05:30	testworld	NDMC	GIS/Raw/2020-06-13/db0edd78-6ccd-4c9f-b394-f3c3b67f5f45.jpg	GIS/Processed/2020-06-13/31af4013-5540-48b9-bea9-a514bf4f7cd3.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b770f5fd-4e40-46bc-b0d5-8819b37d96f0	2017	1	28.5602829999999983	77.2567971	2020-06-13 09:02:27.927302+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a47f3414-d1c9-4723-ba99-7e79bc746538.jpg	GIS/Processed/2020-06-13/ac3e7a50-148a-4362-9df8-a59f0ceb20ba.jpg	0101000020E61000004A8D1A5D6F5053403881E9B46E8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	8-A C, Block Market, East Of Kailash, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
8e3325d4-20ef-47d6-919a-2d30742e92cb	14971	1	28.5596899999999998	77.256674799999999	2020-06-13 09:02:29.073008+05:30	testworld	NDMC	GIS/Raw/2020-06-13/88b111bc-d12c-4fb7-8967-16138688dba9.jpg	GIS/Processed/2020-06-13/25b84ea6-6b7f-45d8-937e-29330250b6b9.jpg	0101000020E610000045ED235C6D505340F3E505D8478F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B 167, Raja Dhirsain Marg, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
417f9814-81e2-40f7-a306-84a4868433a3	14971	1	28.5596899999999998	77.256674799999999	2020-06-13 09:02:30.244003+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c8737273-bf45-4331-95fd-9adb7a3d9c98.jpg	GIS/Processed/2020-06-13/c1d13767-96bc-41bd-adec-d56c8a7c8e42.jpg	0101000020E610000045ED235C6D505340F3E505D8478F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B 167, Raja Dhirsain Marg, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
0d512751-dc1f-42e2-a23d-88a62903e501	8330	1	28.5530350999999989	77.2693114000000065	2020-06-13 09:02:31.34006+05:30	testworld	NDMC	GIS/Raw/2020-06-13/df76c198-fc54-4ea9-ba58-9ca8889e1db2.jpg	GIS/Processed/2020-06-13/682500a1-0942-487a-ad65-56fe77d4b9b1.jpg	0101000020E610000029DCE1653C515340430A54B5938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e98eef88-18d0-4dd6-8049-53774d77332c	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:02:32.442344+05:30	testworld	NDMC	GIS/Raw/2020-06-13/556a7f6f-e0f7-4b3c-ac19-10badf80e63d.jpg	GIS/Processed/2020-06-13/88cb70df-611f-45de-b28c-62ebe4fe58e3.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
379c45bb-3d03-46fd-88f8-ab5b36c449c8	8330	1	28.5530350999999989	77.2693114000000065	2020-06-13 09:02:33.566841+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3421c061-e71b-46f4-b3eb-f13d7613d618.jpg	GIS/Processed/2020-06-13/47331273-d39d-435e-8080-c75e85df4a99.jpg	0101000020E610000029DCE1653C515340430A54B5938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1273ba41-d693-4d4a-b266-d6b02b615b18	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:02:34.644602+05:30	testworld	NDMC	GIS/Raw/2020-06-13/62764d99-392a-4804-8cf9-e9645bdd4b89.jpg	GIS/Processed/2020-06-13/25aea4b9-7044-4612-a31f-943fcfcb10fe.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2bd43c8c-3902-4569-ba89-8deb67ec52a8	24033	1	28.5546787000000002	77.2677402000000058	2020-06-13 09:02:35.741891+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ed53dc34-48e5-42ab-81a5-821bfe85cc0e.jpg	GIS/Processed/2020-06-13/30bacc41-07cb-4907-a128-bb6626f02fee.jpg	0101000020E6100000C5B4CAA722515340AD495C6CFF8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f8c2e75a-0f6f-47bc-8974-ca958b419214	6345	2	28.5519497000000015	77.2703360999999944	2020-06-13 09:02:36.832458+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ed2e7927-b023-4069-ad63-2ee7e3de1052.jpg	GIS/Processed/2020-06-13/96461a53-15e2-404a-9980-8b2b1eff3579.jpg	0101000020E6100000671BC92F4D5153407A8956934C8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
29f3f7ad-693f-46b4-a451-5024cf157156	26871	1	28.5687139999999999	77.2161676000000057	2020-06-13 09:02:37.963445+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1e1b73f5-62ce-402a-b73f-958f6592c449.jpg	GIS/Processed/2020-06-13/6062a096-72cc-49e8-be0e-f38dee2888fd.jpg	0101000020E61000001C1DA1B0D54D534000C79E3D97913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
805a4358-b422-4042-ba60-e8c1ac307379	5588	1	28.5519664999999989	77.2700648000000001	2020-06-13 09:02:39.158646+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2b3d2ea5-586b-4677-ab10-bce519cec2e3.jpg	GIS/Processed/2020-06-13/3bcbe004-2b78-4761-b6e6-4a4a96e72efe.jpg	0101000020E610000040F3DEBD48515340D2FC31AD4D8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
20a0743b-4a78-4d41-a364-c105abaae8c6	1958	1	28.5595256000000006	77.2618808999999942	2020-06-13 09:02:40.256063+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c2ae9f6f-e1dc-442c-bbe9-b11d2b7e1385.jpg	GIS/Processed/2020-06-13/a6a953c3-6fe1-4095-8374-dab70c58c72e.jpg	0101000020E61000009C3C1BA8C25053405846D9113D8F3C40	None	None	None	None	110048	None	None	None	Bahapur	Shambhu Dayal Bagh	G Block	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Captain Gaur Marg	None	Captain Gaur Marg, G Block, Shambhu Dayal Bagh, Bahapur, New Delhi, Delhi 110048, India	None	None
267c4bce-593f-4516-9687-c9870f381c54	2964	2	28.6730835999999982	77.2168446000000017	2020-06-13 09:02:41.452196+05:30	testworld	NDMC	GIS/Raw/2020-06-13/81f456c4-84fa-47d7-bfcf-2bdfef425bbd.jpg	GIS/Processed/2020-06-13/a4ef29b3-18a6-4885-b242-cfb0e75a9e31.jpg	0101000020E61000001C542CC8E04D53405479F1344FAC3C40	None	None	None	None	110054	None	None	None	Civil Lines	Kamla Nehru Ridge	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	MCD Store (Rajpur Road), Kamla Nehru Ridge, Civil Lines, Delhi, 110054, India	None	None
5d12dee7-e2e8-407f-869e-73de8bc802e3	2131	1	28.5562107999999988	77.2648970000000048	2020-06-13 09:02:42.670508+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5bf49815-9aa8-48dc-b407-bac013df0999.jpg	GIS/Processed/2020-06-13/c1bec0cf-fe2e-458f-be4b-eabc34a56ff4.jpg	0101000020E6100000BFF38B12F450534097AEBBD4638E3C40	None	None	None	None	110020	None	None	None	Bahapur	Okhla Sabzi Mandi	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Small Industries Service Institute / Modi Mill, Okhla Sabzi Mandi, Bahapur, New Delhi, Delhi 110020, India	None	None
0706d428-1675-4b3b-9b3d-22a664b949b6	955	1	28.5613001000000004	77.2567616999999984	2020-06-13 09:02:43.87511+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d8a0ace0-32ef-4728-9c33-4f23226c20b2.jpg	GIS/Processed/2020-06-13/a28c8c75-b154-4605-8f68-e42f1948cfa6.jpg	0101000020E61000006217A0C86E505340D5BD045DB18F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsen Marg	None	C 24, Raja Dhirsen Marg, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
52c84546-dd64-41a7-815f-cc61626ed4a5	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:02:45.057762+05:30	testworld	NDMC	GIS/Raw/2020-06-13/201ee8a9-cbf6-4ba2-874d-d9807bd39733.jpg	GIS/Processed/2020-06-13/727e83dc-8267-46d7-93b5-1c29c22c1e49.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
918285ca-5d29-490e-a7ed-d9fa3eee0d65	5952	1	28.5528951000000006	77.2694204000000013	2020-06-13 09:02:46.207807+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4d40f7fb-a115-4a7b-9f7a-b6dd1cac2c60.jpg	GIS/Processed/2020-06-13/f453eb75-965c-441f-b92a-5582f1adcd51.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
a18a7ac3-5039-4a85-a92d-100375a8208c	803	1	28.5511669999999995	77.270471900000004	2020-06-13 09:02:47.358131+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ed90480b-3e1b-40a1-b6a3-d49695d519b2.jpg	GIS/Processed/2020-06-13/b8a92ec5-1078-486b-94f2-d3f65138c5f9.jpg	0101000020E61000002B3F5F694F5153406AA2CF47198D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
758b1e72-8b58-4a28-8452-c64179b4a4d6	850	1	28.5590742000000013	77.256635799999998	2020-06-13 09:02:48.479009+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ff93ebcd-4021-4f58-9b37-d9a470b1c06f.jpg	GIS/Processed/2020-06-13/f7fee676-8499-4c4c-bcb6-a2d54e08da39.jpg	0101000020E6100000E6FE8FB86C50534091099D7C1F8F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Hills Road	None	163, Hills Rd, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
a9a5a660-6d02-4761-aa0b-dc70d592e85c	1101	1	28.5614008000000013	77.2597168000000067	2020-06-13 09:02:49.591955+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f9d6f092-40fd-48fc-99ed-18db1149a969.jpg	GIS/Processed/2020-06-13/47d5f626-3b07-417d-aa7c-2b30c9d2e834.jpg	0101000020E6100000328E36339F505340C0F27BF6B78F3C40	None	None	None	None	110065	None	None	None	Sri Niwaspuri	None	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	SNP Depot, Sri Niwaspuri, New Delhi, Delhi 110065, India	None	None
2b530537-aac6-45bd-b367-5da96d0da200	2328	1	28.5653694999999992	77.2346940999999987	2020-06-13 09:02:50.710835+05:30	testworld	NDMC	GIS/Raw/2020-06-13/05bee464-3023-41e1-96fa-cf5fbbd5e758.jpg	GIS/Processed/2020-06-13/1be0ece4-e1b0-4837-b67f-d2776a9ba3e3.jpg	0101000020E61000001B04673A054F5340E7A7380EBC903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Mahatma Gandhi Marg	None	A5, Mahatma Gandhi Marg, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
56c4e8ab-6c01-4d53-a812-334fea529f68	73894	1	28.5552880000000009	77.2672706000000034	2020-06-13 09:02:51.761176+05:30	testworld	NDMC	GIS/Raw/2020-06-13/cb6f4d91-c541-428e-9a4f-97eba9a0a988.jpg	GIS/Processed/2020-06-13/344e68b9-ba3a-4315-8f0d-ad38b4133969.jpg	0101000020E6100000AB8B25F61A5153407BDCB75A278E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
64c83b6a-460d-4242-aea2-6b0b57538c23	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:02:52.909586+05:30	testworld	NDMC	GIS/Raw/2020-06-13/74c6219d-c060-438d-9e9d-4ff0840fe009.jpg	GIS/Processed/2020-06-13/8a4085b9-20a5-4e64-87d6-f19c96a9a9ed.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
60b7934a-a1d0-4ccb-b7d9-65536ff8566b	251	1	28.6954722000000011	77.2129745999999955	2020-06-13 09:02:54.091519+05:30	testworld	NDMC	GIS/Raw/2020-06-13/65ac5f82-6445-477b-8815-312d358a1e19.jpg	GIS/Processed/2020-06-13/133924b2-7737-470d-8273-3fae385d65fa.jpg	0101000020E61000003C783760A14D5340F54652770AB23C40	None	None	None	None	110007	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	Mahatma Gandhi Marg, Near GTB NAGAR, Banarsi Das Estate, Timarpur, Delhi, 110007, India	None	None
ca4c56ab-eedc-4340-8db8-80e03e80fc2c	24431	4	28.5528951000000006	77.2694204000000013	2020-06-13 09:02:55.263415+05:30	testworld	NDMC	GIS/Raw/2020-06-13/450d5bbe-fd98-4aed-b8f6-a80b356b2b55.jpg	GIS/Processed/2020-06-13/169e748b-e929-4b12-85ed-b0c6beb91438.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
89ebbb9a-e4df-4637-b6e9-7e71b2f1b7b5	16812	1	28.5544569999999993	77.2680718999999954	2020-06-13 09:02:56.408262+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5cc581a8-e263-46ae-9f23-2c370d8394c8.jpg	GIS/Processed/2020-06-13/abd9211e-273a-48d8-96e1-927e666f33f3.jpg	0101000020E610000080DE0A1728515340CC09DAE4F08D3C40	15	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	15, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
a3bf54e0-9abb-4a0e-b629-d0a87ba82db9	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:02:57.544832+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8e7fcd0b-d479-465e-8707-450b36b22048.jpg	GIS/Processed/2020-06-13/a1f8487b-a35c-4852-a577-3f0961efb3e9.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d4f6f153-6da4-45d7-80e8-7698cce891d2	8001	1	28.5619052999999994	77.254072800000003	2020-06-13 09:02:58.696631+05:30	testworld	NDMC	GIS/Raw/2020-06-13/724dd185-778f-4014-b7c0-3d035d11b470.jpg	GIS/Processed/2020-06-13/3799dab3-9361-4196-a2e0-b4dbd4545bfd.jpg	0101000020E610000067B38FBA42505340F6F29606D98F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Captain Gaur Marg	None	B 1, Captain Gaur Marg, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
6fcf6291-8cd7-4b8b-bb32-cc74a4f59269	1701	2	28.5591326999999993	77.2565472	2020-06-13 09:02:59.872149+05:30	testworld	NDMC	GIS/Raw/2020-06-13/62bdbc9d-57d2-4d9c-965a-e5cc4e619b19.jpg	GIS/Processed/2020-06-13/0a284ea4-9489-4571-a954-5783e814f4e6.jpg	0101000020E61000005878F2446B505340CA9F1452238F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	C Block Market, Esst of Kailash, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
945434ce-c7de-4319-96c6-087cd99051f7	3852	1	28.5543979000000014	77.2681177000000048	2020-06-13 09:03:00.983978+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fa1d8b96-3f59-4213-b9d5-19f4620d6b7c.jpg	GIS/Processed/2020-06-13/d64c6eee-d5a8-45d5-bb44-2ed72f2a0988.jpg	0101000020E6100000A43E24D72851534099785105ED8D3C40	15	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	15, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1ace4b16-b799-4ab3-ab8b-94b9257df63f	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:03:02.096906+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c7aec3f0-76cc-4ad0-b066-2dbaf2df91f4.jpg	GIS/Processed/2020-06-13/b7eb1da4-92b9-48ee-a37f-f5cfca4587a4.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
956e8632-718d-47d9-a2f4-57d76591cda7	1252	1	28.5539950000000005	77.2684727999999978	2020-06-13 09:03:03.245525+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ae18bb16-09a9-49bc-8b98-45dca43ca483.jpg	GIS/Processed/2020-06-13/4e5b845c-1dc4-4a57-95d7-f1a3974b110b.jpg	0101000020E610000065F789A82E515340C425C79DD28D3C40	15	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	15, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
df115294-d3d5-415a-b7dd-02a7d8528393	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:03:04.350205+05:30	testworld	NDMC	GIS/Raw/2020-06-13/000fbb13-94c6-4545-be87-898dff947fab.jpg	GIS/Processed/2020-06-13/f58226ed-5bf4-41db-8ffe-2313974e3097.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
07581d3f-cc3e-4ddd-9584-99e538dfa00a	10038	1	28.5592362999999985	77.2564471999999967	2020-06-13 09:03:05.480107+05:30	testworld	NDMC	GIS/Raw/2020-06-13/43fa21ef-6634-40c8-82e7-e6fb6403ac9b.jpg	GIS/Processed/2020-06-13/fe2a8524-f7e7-4803-b6a6-7932cb0c1e7c.jpg	0101000020E6100000A64984A1695053406D3C331C2A8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
74832c5f-c859-4117-9c69-8ec1f68d08ca	2414	1	28.6941865000000007	77.2174104000000057	2020-06-13 09:03:06.621672+05:30	testworld	NDMC	GIS/Raw/2020-06-13/64947b42-ff00-432e-87bc-29eefd391de4.jpg	GIS/Processed/2020-06-13/dd359be8-c146-488f-8bab-00a19772132a.jpg	0101000020E6100000DC734F0DEA4D534020D3DA34B6B13C40	None	None	None	None	110009	None	None	None	Mukherjee Nagar	Hakikat Nagar	None	None	None	Delhi	None	Delhi	North West Delhi	None	None	None	India	None	The Mall Road	None	21/31, The Mall Rd, Hakikat Nagar, Mukherjee Nagar, Delhi, 110009, India	None	None
8c18965a-3507-4573-b75f-918183f84274	2017	1	28.5602829999999983	77.2567971	2020-06-13 09:03:07.689773+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e3d011ae-6044-4429-8385-c4fbbcb0dffe.jpg	GIS/Processed/2020-06-13/a1d1e608-e23c-459f-b5da-51decba1f740.jpg	0101000020E61000004A8D1A5D6F5053403881E9B46E8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	8-A C, Block Market, East Of Kailash, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
69ba59fe-efcd-48e6-9596-8b58e1aaa425	544	1	28.553028900000001	77.2693723000000006	2020-06-13 09:03:08.924699+05:30	testworld	NDMC	GIS/Raw/2020-06-13/608fabe4-f2cf-405a-8cd2-3bc4f7810e38.jpg	GIS/Processed/2020-06-13/68e47470-8006-4246-b410-1f2218b14a33.jpg	0101000020E6100000B1BC50653D5153402C3E4F4D938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e48e4410-eded-4108-b43f-9e23f90d3af5	5952	1	28.5528951000000006	77.2694204000000013	2020-06-13 09:03:10.09456+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b5f045e5-232c-42f6-8e13-d6689138fdcc.jpg	GIS/Processed/2020-06-13/968e0fce-3f32-404d-85e9-7ab836960260.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b949deac-36b2-43c4-bb63-918ba62ffb99	25694	4	28.6905773000000011	77.2105779999999982	2020-06-13 09:03:11.258739+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a819ea84-e25d-4d66-b4ab-e7ae99a41846.jpg	GIS/Processed/2020-06-13/80a15321-aab1-46c8-be64-71988331cb80.jpg	0101000020E610000074D0251C7A4D534028DC86ACC9B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
b9abd949-20e2-42ad-aa9f-e69aa6840e16	1625	1	28.551708099999999	77.2703376999999989	2020-06-13 09:03:12.47302+05:30	testworld	NDMC	GIS/Raw/2020-06-13/222eae53-3903-46c8-b478-62b35ac882c4.jpg	GIS/Processed/2020-06-13/28656e60-069a-4038-bc64-0283a3f8c379.jpg	0101000020E61000000E187F364D5153403470F6BD3C8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
c01a6517-796a-4ae1-8ce1-ac55796bcc11	23827	2	28.6961858999999997	77.2133469999999988	2020-06-13 09:03:13.631949+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9f5c3094-d956-4c2d-bfe9-449ab68013b5.jpg	GIS/Processed/2020-06-13/6b355a32-fd70-42a2-87d0-eb7e670699fa.jpg	0101000020E6100000C8EC2C7AA74D5340B36F383D39B23C40	None	None	None	None	110054	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	New Delhi	None	Delhi	Central Delhi	None	None	None	India	None	The Mall Road	None	45, The Mall Rd, Banarsi Das Estate, Timarpur, New Delhi, Delhi 110054, India	None	None
ed027c7e-2ebe-4546-a110-1e6234064efd	8330	1	28.5530350999999989	77.2693114000000065	2020-06-13 09:03:14.774245+05:30	testworld	NDMC	GIS/Raw/2020-06-13/33d551b6-43ec-4f33-8d32-c9233abf8061.jpg	GIS/Processed/2020-06-13/31bc691e-c4fa-4da0-afd9-229349879376.jpg	0101000020E610000029DCE1653C515340430A54B5938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
11a7da36-9102-4fba-a237-51695c4ee37b	8330	1	28.5530350999999989	77.2693114000000065	2020-06-13 09:03:15.869284+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0492a3e1-4f6f-491c-bfb1-fb4bd5d13925.jpg	GIS/Processed/2020-06-13/c2b46d4d-2f30-49b3-964c-07760f6505ba.jpg	0101000020E610000029DCE1653C515340430A54B5938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2cb63be4-fda4-471f-adaa-c3a8bd476e10	808	1	28.6896410999999993	77.2101147999999995	2020-06-13 09:03:17.008794+05:30	testworld	NDMC	GIS/Raw/2020-06-13/995a2f9d-7568-4fcb-b485-a97869944b19.jpg	GIS/Processed/2020-06-13/58e5974c-5b5c-4af6-8184-b9c27cdd0f03.jpg	0101000020E6100000F5995885724D53403B7AB2518CB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
90a3be4e-aa0a-49cf-b7e6-4685155d1773	1120	1	28.5525857000000016	77.2696487000000047	2020-06-13 09:03:18.164318+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c7014253-4a53-4233-918d-3c1b953c7c2b.jpg	GIS/Processed/2020-06-13/ec756a1f-6d32-41d7-add2-3ed0f20da36c.jpg	0101000020E61000002CFA9EEC41515340BEBCA541768D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	208, Okhla, Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
0376dea6-c4a6-46d0-aa75-30ac77a8e2cd	2328	1	28.5653694999999992	77.2346940999999987	2020-06-13 09:03:19.21194+05:30	testworld	NDMC	GIS/Raw/2020-06-13/57eed62b-4551-4da3-b792-3e18e204c03d.jpg	GIS/Processed/2020-06-13/860972c2-7720-4f23-97f4-ed9407033df3.jpg	0101000020E61000001B04673A054F5340E7A7380EBC903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Mahatma Gandhi Marg	None	A5, Mahatma Gandhi Marg, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
de58c7bc-c480-45ac-8d7e-f52c20bf8639	2798	1	28.5537834000000004	77.268541600000006	2020-06-13 09:03:20.376315+05:30	testworld	NDMC	GIS/Raw/2020-06-13/89f6404c-ad5c-40cf-8967-eba2548afa9e.jpg	GIS/Processed/2020-06-13/f105c29a-7cae-4a6d-97fc-4833d6648eba.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
3050adf5-cba6-435f-b846-86f6ece1f6ee	5326	1	28.6941713000000007	77.2174373000000003	2020-06-13 09:03:21.468905+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e22bacb8-7b48-4a72-84fb-feb21a0fc10b.jpg	GIS/Processed/2020-06-13/d45ae4c7-f4a2-4a18-be1b-4745162786f0.jpg	0101000020E61000008E1B237EEA4D53406252D735B5B13C40	None	None	None	None	110009	None	None	None	Mukherjee Nagar	Hakikat Nagar	None	None	None	Delhi	None	Delhi	North West Delhi	None	None	None	India	None	The Mall Road	None	21/31, The Mall Rd, Hakikat Nagar, Mukherjee Nagar, Delhi, 110009, India	None	None
03c76d51-b789-4e08-90af-b4792ab6d30e	1014	1	28.5650702999999986	77.2401416999999952	2020-06-13 09:03:22.580616+05:30	testworld	NDMC	GIS/Raw/2020-06-13/68030b63-5121-47aa-b11b-fbaa9abb9c05.jpg	GIS/Processed/2020-06-13/4681728f-0358-4b41-8e24-3567c29a03a5.jpg	0101000020E6100000F9F94A7B5E4F5340DF707A72A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	12, Ring Road, Lajpat Nagar IV, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
591726bf-2644-43e8-8c83-3fc93bcef163	1359	1	28.5515849000000017	77.2703551999999974	2020-06-13 09:03:23.689388+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0444261d-6ff2-4532-aceb-224285b4a796.jpg	GIS/Processed/2020-06-13/807699fa-360f-4663-9176-87e4690bfa03.jpg	0101000020E61000006D93E57F4D515340AA7702AB348D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
aa6cbf02-b5bf-49c7-a547-3f0eb2dd57fc	2703	1	28.6915912999999989	77.2164073000000002	2020-06-13 09:03:24.891779+05:30	testworld	NDMC	GIS/Raw/2020-06-13/67cd66dc-c9db-4807-b062-b1025d97ec4a.jpg	GIS/Processed/2020-06-13/e796b97f-a3fb-477b-b83b-d2c7b042e571.jpg	0101000020E61000006707019ED94D5340B8B29F200CB13C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	New Delhi	None	None	None	India	None	Vishvavidalaya Marg	None	7/4, Vishvavidalaya Marg, Delhi, 110007, India	None	None
92743408-0998-476e-a40e-5dea909f9c4c	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:03:26.050686+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1a63366b-fa04-48c9-b2e1-975d6942ad1b.jpg	GIS/Processed/2020-06-13/f27ff840-15fc-4c2a-8046-2f74f5d0b7dc.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
6eddd33c-3813-4138-be76-72d5801e99bb	1625	1	28.551708099999999	77.2703376999999989	2020-06-13 09:03:27.222788+05:30	testworld	NDMC	GIS/Raw/2020-06-13/48340892-0153-4b96-9480-aaf4e72d06cf.jpg	GIS/Processed/2020-06-13/dbfba91a-1f36-413d-b04c-8b9eede33777.jpg	0101000020E61000000E187F364D5153403470F6BD3C8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
394021fb-3326-466b-aaeb-551e42ccba3f	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:03:28.318685+05:30	testworld	NDMC	GIS/Raw/2020-06-13/059bca21-b4ed-4d9c-ba0e-0272eea401fa.jpg	GIS/Processed/2020-06-13/7ec301ea-3bde-4e25-9bcb-9901078a43c4.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
4e07d6e4-cccd-43c7-b716-34505fb87684	1266	1	28.5537834000000004	77.268541600000006	2020-06-13 09:03:29.499807+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4a905e87-4d04-4efd-b683-86eeb3620e06.jpg	GIS/Processed/2020-06-13/7add0b1c-b33d-4190-8c1e-9e589cb5f14a.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
6f74296e-407d-4475-9dec-1ab614af043a	26871	1	28.5687139999999999	77.2161676000000057	2020-06-13 09:03:30.585735+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b070a4ad-a1c8-42a3-ad2c-b31113c3b88f.jpg	GIS/Processed/2020-06-13/164aba2a-e353-463b-9513-e402ccf04a00.jpg	0101000020E61000001C1DA1B0D54D534000C79E3D97913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
277e8baf-8c2f-49d7-82c1-90d18983a959	3430	4	28.6969735999999997	77.2167967000000033	2020-06-13 09:03:31.83204+05:30	testworld	NDMC	GIS/Raw/2020-06-13/77783c6a-5fbb-4257-8b5f-7ea1cf2543bc.jpg	GIS/Processed/2020-06-13/d6a99ad4-dfec-4034-867b-5d79bd92e755.jpg	0101000020E61000005E1844FFDF4D5340E62CA2DC6CB23C40	None	None	None	None	110054	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	Lucknow Road	None	5, Lucknow Rd, Opp. Allahabad Bank, Banarsi Das Estate, Timarpur, Delhi, 110054, India	None	None
0564e4f5-72a1-42ad-83fa-baef9801880f	55007	1	28.5555003999999997	77.2670537999999993	2020-06-13 09:03:32.914285+05:30	testworld	NDMC	GIS/Raw/2020-06-13/aaaa0cb9-547e-4e85-95c4-4df3b59d7834.jpg	GIS/Processed/2020-06-13/596b96d5-5f86-462f-8252-0e2921b0d3ec.jpg	0101000020E61000007151D2681751534038EA3246358E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
a68c73d6-974c-46f0-9321-a4292fe81ffe	1101	1	28.5614008000000013	77.2597168000000067	2020-06-13 09:03:34.014521+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d65ee5db-bcc1-4584-ae44-d0e7498bce61.jpg	GIS/Processed/2020-06-13/9e56b992-e95c-431f-a824-72708eb4798d.jpg	0101000020E6100000328E36339F505340C0F27BF6B78F3C40	None	None	None	None	110065	None	None	None	Sri Niwaspuri	None	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	SNP Depot, Sri Niwaspuri, New Delhi, Delhi 110065, India	None	None
9765a3f0-423c-4a49-aba3-29210c3ed50b	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:03:35.082402+05:30	testworld	NDMC	GIS/Raw/2020-06-13/02e04c62-ec63-47e5-86ca-eac85b036ec1.jpg	GIS/Processed/2020-06-13/adf59f19-1dcb-43dd-8e4f-00f3a6b56c9b.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e5d9f3da-755f-478a-807d-58365d0bd212	558	1	28.5535241000000006	77.2688576999999981	2020-06-13 09:03:36.140269+05:30	testworld	NDMC	GIS/Raw/2020-06-13/216834c4-0ec6-47c1-a79d-f0e03a153532.jpg	GIS/Processed/2020-06-13/73ef5725-6dc6-489d-a8c0-b70374701f09.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e5558771-99f6-4afd-946e-08bc6288c185	2210	1	28.6945833000000015	77.2162299000000019	2020-06-13 09:03:37.3279+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b6170d68-5ff5-410f-84df-0b4dc4e317ed.jpg	GIS/Processed/2020-06-13/3b461535-fdc6-47bf-aef8-e796cab4bdc9.jpg	0101000020E6100000B63AEFB5D64D534007D90D36D0B13C40	None	None	None	None	110007	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	The Mall Road	None	24/1, The Mall Rd, Banarsi Das Estate, Timarpur, Delhi, 110007, India	None	None
831333bf-b6fc-41e9-8b10-303413ad4de4	4239	2	28.6887676999999996	77.2096820999999949	2020-06-13 09:03:38.514406+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e0ec7e9e-77f4-4226-a9a6-75df374e8bb9.jpg	GIS/Processed/2020-06-13/6c6adf3e-83e6-4267-a445-38b1e89038ce.jpg	0101000020E61000009F83786E6B4D5340880A7A1453B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
c152ead7-4b24-4057-b995-2317a065c9fe	24431	4	28.5528951000000006	77.2694204000000013	2020-06-13 09:03:39.688505+05:30	testworld	NDMC	GIS/Raw/2020-06-13/64c35413-f658-4fd7-ae05-292010c58d5d.jpg	GIS/Processed/2020-06-13/8b1c8a33-9d9b-4f4d-b14b-20bd95f480bc.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
9df8f5d5-82ad-4c0d-82e7-6ce6e5a27295	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:03:40.851553+05:30	testworld	NDMC	GIS/Raw/2020-06-13/98a8ea72-d829-4cd0-ae6f-0f1357e4f8a1.jpg	GIS/Processed/2020-06-13/0426a7cf-2472-47b0-98dc-3810d3e5f478.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
ab21e1b8-a94f-4c4f-82c3-2299b31c4377	2328	1	28.5653694999999992	77.2346940999999987	2020-06-13 09:03:41.956921+05:30	testworld	NDMC	GIS/Raw/2020-06-13/03164e13-a993-48f4-98f0-674660b02f3b.jpg	GIS/Processed/2020-06-13/2b309150-a5d9-4f2a-9554-2a556927708c.jpg	0101000020E61000001B04673A054F5340E7A7380EBC903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Mahatma Gandhi Marg	None	A5, Mahatma Gandhi Marg, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
ffc4eb91-8630-4615-8099-0f50099fc2ea	19219	2	28.5551583999999998	77.2673513999999955	2020-06-13 09:03:43.115632+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fb8c145d-c63c-4602-81f8-17dced31753b.jpg	GIS/Processed/2020-06-13/34573bf3-85b0-4273-bedf-a456836b85db.jpg	0101000020E61000008CE20B491C515340851964DC1E8E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
805cda26-732d-4e83-817b-b338159aa04f	7672	2	28.5593746999999993	77.2564191000000022	2020-06-13 09:03:44.253365+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0ede9bae-1592-4b27-b366-bad06d4b682b.jpg	GIS/Processed/2020-06-13/49266458-9e2a-4a53-a8a3-947665b48906.jpg	0101000020E61000007724A82B69505340B6B52A2E338F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
17ddf9c8-0f8d-4b58-a8cb-298970c4411d	1266	1	28.5537834000000004	77.268541600000006	2020-06-13 09:03:45.41291+05:30	testworld	NDMC	GIS/Raw/2020-06-13/34ac4f38-44f6-446c-9d3e-70893f0af1da.jpg	GIS/Processed/2020-06-13/173f23ac-668b-4bb7-9cc5-091468fcf174.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
19c344e5-0cbd-48db-b96b-735189719274	24431	4	28.5528951000000006	77.2694204000000013	2020-06-13 09:03:46.53023+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9eef7ca4-fb11-4be2-a9e7-0df2bdea2a8a.jpg	GIS/Processed/2020-06-13/e4dd6d15-33be-4170-886f-dcdb5870f0f5.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e71e6c02-6d97-482e-ac31-eb63bdc0fbdf	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:03:47.683959+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ba089b97-3e90-4fc5-bbca-782e79485faa.jpg	GIS/Processed/2020-06-13/63e1554c-0b38-4f70-bd0c-aab9b8c28cfc.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
5c8aaf68-426b-491a-8f81-82f3de7e9d9e	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:03:48.75833+05:30	testworld	NDMC	GIS/Raw/2020-06-13/83f23c39-3529-4711-a94f-3280f4ecaaa5.jpg	GIS/Processed/2020-06-13/f09d7bbe-6e66-42fe-a7ce-113399e5dd4d.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
c344a8f5-ef0c-414d-be6e-553dd1c0aa57	5952	1	28.5528951000000006	77.2694204000000013	2020-06-13 09:03:49.859258+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3ee90054-8d75-4560-b2c3-6d15d85f3b82.jpg	GIS/Processed/2020-06-13/ab4bca9f-e878-46bf-abe6-5791f62ddce4.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
bdc71c7e-30fb-482d-a349-ec390e83a646	2596	2	28.6905490000000007	77.2105667999999952	2020-06-13 09:03:51.014645+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c216ae39-5cd2-4c48-82ec-59502102aa92.jpg	GIS/Processed/2020-06-13/27be3234-dd31-4c28-871e-32a2c64f1f1a.jpg	0101000020E6100000E5E72BED794D53401749BBD1C7B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
c3b0e1c8-7bcc-4aaa-b09c-0df81f01aaaa	3386	1	28.6926522999999989	77.2115629000000041	2020-06-13 09:03:52.211985+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8c4f12a3-bc4d-46a6-a34b-d59d212c0c98.jpg	GIS/Processed/2020-06-13/be10e864-7630-47bb-b5f6-1f47212d20a3.jpg	0101000020E610000001231E3F8A4D5340CAFF3FA951B13C40	None	None	None	None	110007	None	None	None	Delhi University	None	None	None	None	New Delhi	None	Delhi	Central Delhi	None	None	None	India	None	Chhatra Marg	None	7, Chhatra Marg, Near Marinda House, Delhi University, New Delhi, Delhi 110007, India	None	None
72e9b864-ad1d-442c-801e-599234298d10	558	1	28.5535241000000006	77.2688576999999981	2020-06-13 09:03:53.393574+05:30	testworld	NDMC	GIS/Raw/2020-06-13/61cf0ccb-d969-4aba-b734-e728483cb935.jpg	GIS/Processed/2020-06-13/e150fa0c-b22f-437b-8c5c-83545d084424.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b080b459-86ad-47a1-862f-d3adf0d7871d	73894	1	28.5552880000000009	77.2672706000000034	2020-06-13 09:03:54.476528+05:30	testworld	NDMC	GIS/Raw/2020-06-13/09b41a4d-ca4d-4978-98ea-773e04c30cf2.jpg	GIS/Processed/2020-06-13/ea8c7e48-0928-4548-bdd0-14aceeefc81c.jpg	0101000020E6100000AB8B25F61A5153407BDCB75A278E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d3fca6b9-c59b-4b66-b8d2-6441dde0ea87	8001	1	28.5619052999999994	77.254072800000003	2020-06-13 09:03:55.556884+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c1264a2c-45b3-4040-8669-155b2a42fd9d.jpg	GIS/Processed/2020-06-13/b13c9d27-4478-4191-bd3d-297ce5877329.jpg	0101000020E610000067B38FBA42505340F6F29606D98F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Captain Gaur Marg	None	B 1, Captain Gaur Marg, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
d2fad21c-e3eb-48eb-ad40-bdd2b0e460ad	8218	2	28.5543142000000003	77.2678903999999989	2020-06-13 09:03:56.626766+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9fcd8b2c-630e-4bea-b372-f0d8977529b6.jpg	GIS/Processed/2020-06-13/4c7f6787-1780-496e-b138-971112ea7278.jpg	0101000020E610000064BAC61D255153405AB51089E78D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1baedafd-f551-4ff5-8259-76916a5fbc10	14893	2	28.5532858000000012	77.2690819999999974	2020-06-13 09:03:57.731343+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a4386305-ebc1-4283-8087-2e26973f855a.jpg	GIS/Processed/2020-06-13/54b2625b-5fc1-4571-80b2-ab23e2a92d21.jpg	0101000020E61000004E7CB5A33851534059576023A48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
6e62a0ee-a97b-4385-b4c7-d30506978588	1066	2	28.5587996000000004	77.2570563000000021	2020-06-13 09:03:58.820448+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f1e661bc-a89c-4f99-9cc2-104001716a65.jpg	GIS/Processed/2020-06-13/738ce080-dda9-46ff-ad17-5f6353d4b046.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
aec69a60-d398-406e-ba03-201b0f77d929	20412	1	28.6949816999999996	77.2127138000000031	2020-06-13 09:04:00.003657+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c2215529-0f88-4241-9244-18660e2c1333.jpg	GIS/Processed/2020-06-13/64d12096-6945-4e17-bafe-4883cb6c8c13.jpg	0101000020E61000001B9A571A9D4D534088D11852EAB13C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	chatra marg ke pass, NCR Delhi, Delhi, 110007, India	None	None
0a3316f9-fd21-45a5-96b4-5b8716400b84	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:04:01.209273+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bdeda96e-2588-4ec4-82f2-9dc8f729007e.jpg	GIS/Processed/2020-06-13/140722bf-8c62-4260-b28b-4321709d4c57.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
ecc9f47b-ced5-4fdf-84ff-4e7eba6dc1f8	11464	1	28.557732699999999	77.2590213999999946	2020-06-13 09:04:02.333643+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2f2667d1-2c21-4832-af6f-86bb085f6697.jpg	GIS/Processed/2020-06-13/4bf3eb3f-588a-4f07-a40f-1dfc15406e87.jpg	0101000020E6100000B47D7ECE93505340E768FA91C78E3C40	189	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	G Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	189, G Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
1d4b5cb3-456f-4349-9223-fb5ab11279d6	30595	1	28.5592345999999999	77.2564517999999936	2020-06-13 09:04:03.541603+05:30	testworld	NDMC	GIS/Raw/2020-06-13/279adf76-b8b8-4fd0-a1c5-88028c817f5a.jpg	GIS/Processed/2020-06-13/444fd968-a1b9-4ecc-86ae-47b7557e319a.jpg	0101000020E61000000580CFB469505340A9CAADFF298F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
b6d9878f-7edc-4d48-9c41-4b91f0c6ad8e	1319	1	28.5585225999999999	77.2578445999999985	2020-06-13 09:04:04.608947+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6b592695-70e2-473c-ac13-8fec88f03357.jpg	GIS/Processed/2020-06-13/2f721a7b-8e9d-4d5a-a4bf-408741ec99f0.jpg	0101000020E6100000D01CA38680505340AF134D56FB8E3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 161, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
3864ec04-886e-49e9-a4a8-2bf18043676a	1429	1	28.6954461999999992	77.2129618000000022	2020-06-13 09:04:05.783766+05:30	testworld	NDMC	GIS/Raw/2020-06-13/93b0cf5c-56e5-4c14-9d20-c0459c7add27.jpg	GIS/Processed/2020-06-13/d587b173-7cba-48c0-a07e-ae6c4a9b923b.jpg	0101000020E61000000793872AA14D5340A2201DC308B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
576ebb3f-2ec5-40b8-ae45-760052fefa9f	875	1	28.5515849000000017	77.2703551999999974	2020-06-13 09:04:06.98091+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a45551e3-b2b8-45d7-91b4-5caf0f77d9c1.jpg	GIS/Processed/2020-06-13/f4a583d1-0e81-43d1-a5e8-1b466617706d.jpg	0101000020E61000006D93E57F4D515340AA7702AB348D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
924d766a-9fb6-41da-adf4-cbba65963861	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:04:08.126447+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1d1d64d9-685a-4a8c-a282-9fd7becf210f.jpg	GIS/Processed/2020-06-13/f76e8bdb-3090-47fc-9b4e-9c9783d382e6.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d91c7dc9-e483-4af7-acf2-e811cc8c5f64	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:04:09.306349+05:30	testworld	NDMC	GIS/Raw/2020-06-13/989c3e5d-fabd-4476-8f20-5e61995ca4f0.jpg	GIS/Processed/2020-06-13/93e3474e-c139-4d44-85f6-43fbf61b01cc.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
371323ed-2d68-47d2-9b10-6b8a1c049f2f	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:04:10.480898+05:30	testworld	NDMC	GIS/Raw/2020-06-13/21ad1827-8dde-4b86-b8c0-e5f37a2221cb.jpg	GIS/Processed/2020-06-13/0cd28645-083b-4788-90ff-40ba963babcd.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
4d490c40-49d8-4b8d-aaa2-a240d22d4594	8218	2	28.5543142000000003	77.2678903999999989	2020-06-13 09:04:11.707726+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7680b833-f549-4815-9d42-d72028147d97.jpg	GIS/Processed/2020-06-13/7f0a1b44-03e3-4537-8950-85e2f69c2526.jpg	0101000020E610000064BAC61D255153405AB51089E78D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
154b4e19-5dd3-4aa6-b092-eb27d69d084f	4175	1	28.5549657000000003	77.2655261000000024	2020-06-13 09:04:12.825994+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2089369e-7353-4c58-a4e3-d78eb1dec7e3.jpg	GIS/Processed/2020-06-13/10fd5d77-fc3a-4aa5-95eb-37ee2c5bb556.jpg	0101000020E610000001EF2E61FE505340D9E66B3B128E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
678f412a-69be-4cc2-b64e-c0aec5c85965	8353	3	28.6887523999999985	77.209666900000002	2020-06-13 09:04:14.023558+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a8588065-4c05-41b3-8c6f-e1288800811a.jpg	GIS/Processed/2020-06-13/e50a5fbb-e687-447f-ac11-23f149e05b20.jpg	0101000020E610000070A3B72E6B4D5340A00AC91352B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
44ee325c-b5b2-435f-9887-cf653bbf6022	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:04:15.226302+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8b7cbbae-433f-4098-a0ff-bcbe025e5f63.jpg	GIS/Processed/2020-06-13/c7f06ddf-e954-4958-92c7-d97177b245af.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
98247a70-7d1b-49f5-b5f0-5211fb7f29d9	850	1	28.5590742000000013	77.256635799999998	2020-06-13 09:04:16.366804+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b0c1fb3d-9de7-49bc-8e7e-a8c37f2bcb67.jpg	GIS/Processed/2020-06-13/787e7033-25d0-4276-9fe1-408025414651.jpg	0101000020E6100000E6FE8FB86C50534091099D7C1F8F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Hills Road	None	163, Hills Rd, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
6f31a4ee-e9ae-42a0-81bd-f60b2d3355a5	24033	1	28.5546787000000002	77.2677402000000058	2020-06-13 09:04:17.424984+05:30	testworld	NDMC	GIS/Raw/2020-06-13/da8770ea-3ae0-4275-8b30-f3ecad2b5458.jpg	GIS/Processed/2020-06-13/0d4b9aa8-751a-4717-857a-09066238e6a3.jpg	0101000020E6100000C5B4CAA722515340AD495C6CFF8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
256cc685-10fc-4b38-b155-32155cad0400	955	1	28.5613001000000004	77.2567616999999984	2020-06-13 09:04:18.529779+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2df0d533-a7e6-443e-928e-e1b7f9fb1753.jpg	GIS/Processed/2020-06-13/ec097808-00fb-430a-a200-d7075bedbed3.jpg	0101000020E61000006217A0C86E505340D5BD045DB18F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsen Marg	None	C 24, Raja Dhirsen Marg, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
049ff5b7-fabd-4fdf-b445-d39ebd7d6e6f	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:04:19.656385+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2ac87d25-2503-41e8-a9c5-3599433d280f.jpg	GIS/Processed/2020-06-13/a5c90d46-317c-4e78-b49d-9d74e9650daa.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e06a903c-a7cf-406a-a07b-2c31293787b3	7672	2	28.5593746999999993	77.2564191000000022	2020-06-13 09:04:20.773168+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a43cb971-4249-4f85-a151-f1b665ad1c2e.jpg	GIS/Processed/2020-06-13/68a488eb-af8a-490d-983a-0f9597547c2c.jpg	0101000020E61000007724A82B69505340B6B52A2E338F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
93e9a62c-285d-45f5-8677-02c6902cf366	14878	1	28.5509234999999997	77.2706040000000058	2020-06-13 09:04:21.893485+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e6a95cdc-5ed2-4ad7-8fd3-8b24927836c2.jpg	GIS/Processed/2020-06-13/8873d4b0-328f-4a69-bbb5-011c84bdfc61.jpg	0101000020E6100000AD8A7093515153400D198F52098D3C40	77	None	None	None	110020	None	None	None	Modimill	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	77, Okhla Phase III, Modimill, New Delhi, Delhi 110020, India	None	None
b56d42a1-d90c-4063-bd80-3da8dc121ada	2039	1	28.6954463000000004	77.2129616999999939	2020-06-13 09:04:23.116507+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c4756d0b-8a91-4c33-8388-ef6f2175851b.jpg	GIS/Processed/2020-06-13/3672786e-c1b2-4a00-ae78-28a9101e05f9.jpg	0101000020E61000003C331C2AA14D5340CC9FCAC408B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
f5984d86-076e-47f1-9ac8-e642f226f2f9	558	1	28.5535241000000006	77.2688576999999981	2020-06-13 09:04:24.33316+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bee8b8ba-fa9f-43e2-aafb-b4e05fe01e07.jpg	GIS/Processed/2020-06-13/46934c2b-7c39-484a-b063-88d2f6e1f1b9.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
fcaa7993-b20c-4ded-abf6-0b07fb8f9262	1625	1	28.551708099999999	77.2703376999999989	2020-06-13 09:04:25.439797+05:30	testworld	NDMC	GIS/Raw/2020-06-13/aa9631df-b49f-4869-aaae-138311668295.jpg	GIS/Processed/2020-06-13/0118f3f8-940a-4a11-a181-75d7ab09d60b.jpg	0101000020E61000000E187F364D5153403470F6BD3C8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2d00d653-3aae-469f-a52a-3735532ca679	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:04:26.694659+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8a31ec4d-53e5-42b1-8281-31f6dbd29e2c.jpg	GIS/Processed/2020-06-13/cf17fe9b-9345-45bb-9b0a-da9a4f2f5df0.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2a0bc639-572e-4b6f-a7c1-19fd35f38564	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:04:27.786131+05:30	testworld	NDMC	GIS/Raw/2020-06-13/be4ceb42-d2b6-4ace-a645-1570507f9144.jpg	GIS/Processed/2020-06-13/53c4a996-f29a-407e-9a20-c46f26fdeab1.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
9d0e0be2-216f-4bf0-94d9-d339223c9996	15403	4	28.5550135000000012	77.267458199999993	2020-06-13 09:04:28.942127+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f4442738-77d0-44f8-8b93-d0b6b2b1de2e.jpg	GIS/Processed/2020-06-13/9a83e416-b510-4392-b778-103ecaddb9ba.jpg	0101000020E61000000283FF081E515340A8565F5D158E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d1395b91-db1d-4e4d-bd3f-c9309c82997a	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:04:30.09746+05:30	testworld	NDMC	GIS/Raw/2020-06-13/cceb31d2-d0ff-441c-b468-9fd3957cebc3.jpg	GIS/Processed/2020-06-13/351d50d3-8e6b-45ee-b2d6-6a056838ddbc.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
36c9e9be-e97c-49ca-8e0f-396c265b5d9c	5588	1	28.5519664999999989	77.2700648000000001	2020-06-13 09:04:31.24968+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0c84047a-4ca4-405b-bcb5-e8f06f31b26c.jpg	GIS/Processed/2020-06-13/a7a22e26-d4b5-4b6f-8851-10fbef517a29.jpg	0101000020E610000040F3DEBD48515340D2FC31AD4D8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
387025ee-fe52-4814-a5bb-ac5ac27afdd2	10038	1	28.5592362999999985	77.2564471999999967	2020-06-13 09:04:32.410475+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c459ae15-f539-47a0-802e-6f83c4106946.jpg	GIS/Processed/2020-06-13/7820954f-12bc-4d51-804a-03727f5a65f6.jpg	0101000020E6100000A64984A1695053406D3C331C2A8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
e233193d-8c26-4fb6-a160-c05b85f6322f	1024	1	28.5548476999999998	77.2656843000000038	2020-06-13 09:04:33.521884+05:30	testworld	NDMC	GIS/Raw/2020-06-13/21862f1e-4582-4440-8fca-bf7a07a76357.jpg	GIS/Processed/2020-06-13/33cd2809-e3bf-4752-9d3e-c406e1f8fc27.jpg	0101000020E6100000E2E3B8F800515340C5C2B57F0A8E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
d2ff9520-a4e5-47e3-b67e-ac4d90d3389f	448	1	28.6955556999999999	77.2160851999999949	2020-06-13 09:04:34.682218+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b5412ece-b6c5-4a7b-a2e7-d78cd5e438e2.jpg	GIS/Processed/2020-06-13/3827a468-db5a-4bfb-a691-7685041f7b10.jpg	0101000020E610000093C90457D44D5340E00B38F00FB23C40	None	None	None	None	110054	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	Lucknow Road Government School, Banarsi Das Estate, Timarpur, Delhi, 110054, India	None	None
fd379e32-0525-4142-a720-b99fe716595e	15403	4	28.5550135000000012	77.267458199999993	2020-06-13 09:04:35.783495+05:30	testworld	NDMC	GIS/Raw/2020-06-13/863dee61-16a9-4ce9-9f1a-d2d8aa70916b.jpg	GIS/Processed/2020-06-13/90ff1c93-d34b-4f40-a51b-a41d233ddeeb.jpg	0101000020E61000000283FF081E515340A8565F5D158E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
c3cb2667-e03f-46dc-9aba-68b3690fc00d	1266	1	28.5537834000000004	77.268541600000006	2020-06-13 09:04:36.860223+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fd846fd1-7186-4557-a524-74c30172e4de.jpg	GIS/Processed/2020-06-13/cf696faf-2691-45fd-abd8-4b24ab3291df.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
006855b2-e0aa-4059-81f0-a70e03cf6753	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:04:37.999088+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8ced19ff-fd12-4a18-901f-01b5fcafbc1e.jpg	GIS/Processed/2020-06-13/39714a9b-dee6-4af4-b8c0-1e18366dd889.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e2314849-0b90-488f-a86f-4dcce61974c0	1359	1	28.5515849000000017	77.2703551999999974	2020-06-13 09:04:39.170757+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6329b631-0b72-4704-9414-97389c3dce34.jpg	GIS/Processed/2020-06-13/9e25fe4c-3d2e-459d-b94f-3c5646037328.jpg	0101000020E61000006D93E57F4D515340AA7702AB348D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
bf65db24-6989-4bf5-b30b-70c3f7dff969	2017	1	28.5602829999999983	77.2567971	2020-06-13 09:04:40.336257+05:30	testworld	NDMC	GIS/Raw/2020-06-13/674dfaac-7b35-4d28-bf00-1ec48793a239.jpg	GIS/Processed/2020-06-13/d1f1bce6-bdcc-47d6-8b4a-cd90a6a11aa0.jpg	0101000020E61000004A8D1A5D6F5053403881E9B46E8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	8-A C, Block Market, East Of Kailash, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
76c392ec-0c4c-465a-a682-af976cb4598a	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:04:41.448309+05:30	testworld	NDMC	GIS/Raw/2020-06-13/41c55b5b-b1a7-4063-8b17-4512ddb1eaa7.jpg	GIS/Processed/2020-06-13/06c824a4-b89f-4c84-a6dc-5d879dea9458.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f39604b5-fb2e-441a-a53e-956e7c9115d5	6456	1	28.5654408999999987	77.2460082999999997	2020-06-13 09:04:42.538416+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3da0472e-90be-4a3f-8131-7e645b6fe6fd.jpg	GIS/Processed/2020-06-13/a63ef4e1-742f-4a16-812c-047971e1f89b.jpg	0101000020E6100000DAC29899BE4F534020521DBCC0903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar III	Block L	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Lajpat Nagar Ring Road / Vinoba Puri, Lajpat Nagar, Block L, Lajpat Nagar III, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
8c482c46-a26d-4aee-b964-b2cfe5b0fce7	2328	1	28.5653694999999992	77.2346940999999987	2020-06-13 09:04:43.728585+05:30	testworld	NDMC	GIS/Raw/2020-06-13/da3c250a-672d-4410-9631-1adf5fefdd81.jpg	GIS/Processed/2020-06-13/d7f16d59-463e-4650-9f6f-ed0c590f249b.jpg	0101000020E61000001B04673A054F5340E7A7380EBC903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Mahatma Gandhi Marg	None	A5, Mahatma Gandhi Marg, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
7e16829e-825a-4bc4-b701-22636709b1e5	13507	2	28.5547035999999999	77.2655280999999974	2020-06-13 09:04:44.791081+05:30	testworld	NDMC	GIS/Raw/2020-06-13/138306f5-e3c6-4a4e-a120-988d957c2f4b.jpg	GIS/Processed/2020-06-13/113afd63-7288-4c4a-9ca7-6c253f22a9d0.jpg	0101000020E6100000D16A9269FE50534035F91C0E018E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
b0fd5441-a109-4bfc-ab99-5d8501684eec	69347	2	28.5541626000000015	77.2683057999999932	2020-06-13 09:04:45.949781+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7c4105f0-6332-4a3f-a535-cb14f09f8d15.jpg	GIS/Processed/2020-06-13/8543f826-d45a-4fdb-bd9e-264e658c38a1.jpg	0101000020E6100000EF1417EC2B51534095AAA399DD8D3C40	15	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	15, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d40d0fe5-a540-424f-8632-01e53c47abe8	13507	2	28.5547035999999999	77.2655280999999974	2020-06-13 09:04:47.014736+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7173a653-bff2-4de1-a996-15ec595986db.jpg	GIS/Processed/2020-06-13/4b502767-a246-48f8-b643-37d3f4f6d57c.jpg	0101000020E6100000D16A9269FE50534035F91C0E018E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
9cebee29-8feb-460c-8b70-32b115f470cd	1024	1	28.5548476999999998	77.2656843000000038	2020-06-13 09:04:48.117349+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f3fa5379-67a1-4792-9f5c-28cfff2b0384.jpg	GIS/Processed/2020-06-13/e99afb7d-643c-4e34-a443-e7f6c7b8f51f.jpg	0101000020E6100000E2E3B8F800515340C5C2B57F0A8E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
f3d10d5b-b19c-4f2c-bc16-02d544138891	11929	2	28.6954460000000005	77.2129596000000049	2020-06-13 09:04:49.267632+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ae20de69-5a90-4783-838c-a3a2f7567f78.jpg	GIS/Processed/2020-06-13/b38d9011-9dc7-4bfe-8be7-170dbbf34e8d.jpg	0101000020E6100000A2574D21A14D53404F22C2BF08B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
818b102c-d31e-4038-935f-d7071c25ac78	517	2	28.688948700000001	77.2098069000000038	2020-06-13 09:04:50.425581+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c2151293-fea2-47d9-9c5d-44c061d5bad1.jpg	GIS/Processed/2020-06-13/b5d6ce62-b948-4c58-b1ad-abb543bc9816.jpg	0101000020E6100000697EEB796D4D5340291F27F15EB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
f7c121e1-15c0-4305-ac7f-b5423521bcdc	10089	1	28.5517302999999991	77.2641107000000034	2020-06-13 09:04:51.563223+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5e94fe83-ae39-4d2a-a894-7782d6cb2647.jpg	GIS/Processed/2020-06-13/5b0b452b-44b5-44fa-baba-354b6f58aa61.jpg	0101000020E610000084C19030E750534057B66A323E8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	NSIC Estate	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Kalkaji Temple, NSIC Estate, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
617a1733-0537-4d2d-a085-230df6a6af16	7672	2	28.5593746999999993	77.2564191000000022	2020-06-13 09:04:52.747685+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d34962c5-3684-4293-8847-57a2915efb21.jpg	GIS/Processed/2020-06-13/291723d5-e976-4876-9d92-85e346b22437.jpg	0101000020E61000007724A82B69505340B6B52A2E338F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
70663b18-c06b-4f13-abed-c84b72431e49	14893	2	28.5532858000000012	77.2690819999999974	2020-06-13 09:04:53.815183+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c5c11504-5f50-449c-8f9e-972219fa10de.jpg	GIS/Processed/2020-06-13/5c745e17-242a-4dc7-988e-d4390f0bf5ee.jpg	0101000020E61000004E7CB5A33851534059576023A48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b1c3582f-dee9-465c-986e-ba7d61fa0e57	1625	1	28.551708099999999	77.2703376999999989	2020-06-13 09:04:54.940722+05:30	testworld	NDMC	GIS/Raw/2020-06-13/978d0021-47cc-4d27-9c1c-e794e4885f86.jpg	GIS/Processed/2020-06-13/ce75622f-68eb-49c5-a83c-f830a1810fc3.jpg	0101000020E61000000E187F364D5153403470F6BD3C8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f7e9b932-dbe8-42bb-877b-3e5f47164cc5	5000	2	28.6954461999999992	77.2129616999999939	2020-06-13 09:04:56.106782+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f6033223-6661-4e83-b03a-dcb35442a763.jpg	GIS/Processed/2020-06-13/cb4f9060-4f1e-4d8d-8920-9c53564e741d.jpg	0101000020E61000003C331C2AA14D5340A2201DC308B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
06523ad3-9dcf-4738-a00c-5f574b7e8a06	5588	1	28.5519664999999989	77.2700648000000001	2020-06-13 09:04:57.220667+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a6b58909-fbcc-4ac1-a7cc-ecd21e2bb6bb.jpg	GIS/Processed/2020-06-13/efcf79c7-acc9-4bd6-a89e-5a02f3aabe25.jpg	0101000020E610000040F3DEBD48515340D2FC31AD4D8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d2280f9e-2164-492d-9422-64276f72ed84	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:04:58.333611+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1419fbed-bea2-4fd2-9124-d3f85e6e65d2.jpg	GIS/Processed/2020-06-13/ec47b0fb-96dc-453b-aeb7-99c6e6f8c524.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
16f95e83-6b66-469c-a0df-43560cb42dc5	26871	1	28.5687139999999999	77.2161676000000057	2020-06-13 09:04:59.386539+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5f6bed72-0574-4e66-aee6-e9596777d4d9.jpg	GIS/Processed/2020-06-13/d3e5c777-7c2c-4242-9685-b1dc8bbe4738.jpg	0101000020E61000001C1DA1B0D54D534000C79E3D97913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
cfe4c25b-d7db-4db0-bd57-2c5fb44d4102	1120	1	28.5525857000000016	77.2696487000000047	2020-06-13 09:05:00.488497+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5a02773f-c394-4219-b3e5-dbf3d2866e9a.jpg	GIS/Processed/2020-06-13/f9066ad3-4d12-463a-bfe0-e21895dc3ac3.jpg	0101000020E61000002CFA9EEC41515340BEBCA541768D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	208, Okhla, Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
714571e4-30cb-49a3-b34c-930dd1d98172	14893	2	28.5532858000000012	77.2690819999999974	2020-06-13 09:05:01.60324+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c226e2e1-0491-48dc-9e79-f356e09ecdd1.jpg	GIS/Processed/2020-06-13/13d522bd-199c-4c62-b4fb-6e60e2218d0c.jpg	0101000020E61000004E7CB5A33851534059576023A48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2e9f2a0a-a637-480e-90ae-333b6d4742b6	24033	1	28.5546787000000002	77.2677402000000058	2020-06-13 09:05:02.706352+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5571bb76-5800-467b-8725-84801fe69c7c.jpg	GIS/Processed/2020-06-13/2d217cbf-93b9-48eb-8f52-8e6ace3a25e7.jpg	0101000020E6100000C5B4CAA722515340AD495C6CFF8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
655beb60-4786-4478-a585-ff745eeb5a35	10038	1	28.5592362999999985	77.2564471999999967	2020-06-13 09:05:03.750473+05:30	testworld	NDMC	GIS/Raw/2020-06-13/815a27d6-a907-4099-bb28-8c1b25de3310.jpg	GIS/Processed/2020-06-13/b5a60cc9-350f-4c9c-911f-70abf3298d24.jpg	0101000020E6100000A64984A1695053406D3C331C2A8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
3f948f73-6a1d-4684-a185-78f87def5afe	1757	1	28.5536376999999995	77.2649966000000035	2020-06-13 09:05:04.842286+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ac71679c-ad68-4a65-a70b-14ff86856222.jpg	GIS/Processed/2020-06-13/b35548db-a129-43fd-9cd6-75ebccbeed4b.jpg	0101000020E610000047A34CB4F550534029554733BB8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
50fe73b3-b9e4-4d97-b9ae-c04ca3094a22	8353	3	28.6887523999999985	77.209666900000002	2020-06-13 09:05:06.022442+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2a1906ac-c325-434a-bdc6-7c3e0bfb80f6.jpg	GIS/Processed/2020-06-13/c01abb6f-3482-4764-9b4c-bb42b94b5073.jpg	0101000020E610000070A3B72E6B4D5340A00AC91352B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
181b7593-abff-4f70-b509-03a7b2c17bc0	631	1	28.6954485000000012	77.2129584999999992	2020-06-13 09:05:07.258716+05:30	testworld	NDMC	GIS/Raw/2020-06-13/94897235-0f5d-486b-89ed-0e1ebe7d6c95.jpg	GIS/Processed/2020-06-13/3da564b2-5b58-4285-b583-c2712fad6239.jpg	0101000020E6100000EF39B01CA14D5340618DB3E908B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
0813a544-2476-465d-a61c-eb4ce89930b8	558	1	28.5535241000000006	77.2688576999999981	2020-06-13 09:05:08.394603+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d65ec887-0b0c-4cdf-8bee-e4a223131a58.jpg	GIS/Processed/2020-06-13/b3ebc55a-dfe2-44e4-9701-ca365363f43d.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
6ba513b1-9be6-4d0b-85ec-35e0e92d7a63	955	1	28.5613001000000004	77.2567616999999984	2020-06-13 09:05:09.589043+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8d5a2b86-9c59-4fca-a81c-4aa735715f94.jpg	GIS/Processed/2020-06-13/cadf94c8-0758-4ef5-a6a4-59d79988f453.jpg	0101000020E61000006217A0C86E505340D5BD045DB18F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsen Marg	None	C 24, Raja Dhirsen Marg, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
0687d25c-8394-40fc-968e-490969abc318	5588	1	28.5519664999999989	77.2700648000000001	2020-06-13 09:05:10.801367+05:30	testworld	NDMC	GIS/Raw/2020-06-13/95b74b9e-1993-49b5-a315-402e076441d2.jpg	GIS/Processed/2020-06-13/fea234b7-bb62-4f1f-89c8-144eac172543.jpg	0101000020E610000040F3DEBD48515340D2FC31AD4D8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
00c0a4de-8454-40da-ad6f-2f3c815eff7e	4239	2	28.6887676999999996	77.2096820999999949	2020-06-13 09:05:11.970932+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4b3ba8f9-2435-4cd4-9bcc-bc577e410dc1.jpg	GIS/Processed/2020-06-13/078c9578-01a9-4e81-92af-f1daf9e7b832.jpg	0101000020E61000009F83786E6B4D5340880A7A1453B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
54f7a94c-3612-4c67-8d09-0fc9e223b6fb	3304	1	28.5544098999999996	77.2652704999999997	2020-06-13 09:05:13.140768+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a7f895d4-422e-4cc1-8302-be2f2dd9b477.jpg	GIS/Processed/2020-06-13/42b7c72a-1071-4c28-b649-7749235d7f1d.jpg	0101000020E6100000FD851E31FA5053402114A5CEED8D3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
75eff82a-fcff-4d75-8724-9d9a3ba7a369	660	1	28.5534028000000006	77.2689687000000021	2020-06-13 09:05:14.202841+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9244f4df-927b-400d-aa54-357ae2f034c5.jpg	GIS/Processed/2020-06-13/62cbaa30-01ab-4129-bb27-c670ceab0bbf.jpg	0101000020E610000073897EC836515340CC834FCEAB8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
36c20c72-713b-4883-918a-19e9662d8885	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:05:15.439304+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9903a181-7a1e-451f-aa1e-24391f3ce023.jpg	GIS/Processed/2020-06-13/8b287079-ae1c-4950-8cb4-9bbacc6b9ba7.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b2e52ab4-22ab-4398-b38c-7ca8a9dc3f8f	1120	1	28.5525857000000016	77.2696487000000047	2020-06-13 09:05:16.568582+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8f599185-201f-4208-bae5-702bb32a2cd8.jpg	GIS/Processed/2020-06-13/817ef28f-9968-4dfb-a690-1d81fa7df6c5.jpg	0101000020E61000002CFA9EEC41515340BEBCA541768D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	208, Okhla, Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
cd3e042d-7d26-4051-9d04-b6da0086a3a2	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:05:17.71517+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c394eb91-85c0-4526-b712-bea3bcfe5179.jpg	GIS/Processed/2020-06-13/7b786d51-0ed9-4c6e-9a85-4d0d2634ce37.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
20934976-4233-4490-9480-e42d117fb75f	8218	2	28.5543142000000003	77.2678903999999989	2020-06-13 09:05:18.913172+05:30	testworld	NDMC	GIS/Raw/2020-06-13/40cc5f63-8119-4b13-9088-be9391a5dd3a.jpg	GIS/Processed/2020-06-13/5cbad1f5-969d-49c3-b444-32a73892dc32.jpg	0101000020E610000064BAC61D255153405AB51089E78D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
eb79158b-1ec3-4b76-b090-00364408a515	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:05:20.03559+05:30	testworld	NDMC	GIS/Raw/2020-06-13/18e16789-85c7-460c-9e3f-790a082b1f58.jpg	GIS/Processed/2020-06-13/c379f508-4ae9-4eb2-ac1f-26ee61165b83.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f125fa7f-f7c8-4a80-818d-53c1c32fbfb6	10038	1	28.5592362999999985	77.2564471999999967	2020-06-13 09:05:21.116399+05:30	testworld	NDMC	GIS/Raw/2020-06-13/275340b9-997f-4270-87dd-1f4a9d364636.jpg	GIS/Processed/2020-06-13/8fa29950-dd47-4907-925a-b5cc6c38d7de.jpg	0101000020E6100000A64984A1695053406D3C331C2A8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
1d5ac2cf-bf6e-452e-a07b-4525d0a004ce	1120	1	28.5525857000000016	77.2696487000000047	2020-06-13 09:05:22.260319+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b287a2fb-a132-4f96-89bd-ba0a375ed07d.jpg	GIS/Processed/2020-06-13/c5b1822f-4429-471f-8faf-d37c04bc0ec4.jpg	0101000020E61000002CFA9EEC41515340BEBCA541768D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	208, Okhla, Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
946e77ca-8a70-4e28-9e2c-3453cf249bbb	558	1	28.5535241000000006	77.2688576999999981	2020-06-13 09:05:23.432466+05:30	testworld	NDMC	GIS/Raw/2020-06-13/34a8e046-ec29-49c1-b58d-6ab1656b0b60.jpg	GIS/Processed/2020-06-13/781786cb-db02-4fee-9851-30760fc7e628.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2f6a4467-fab4-484a-96a9-5e718395a26e	6014	2	28.5512863999999986	77.2704427999999979	2020-06-13 09:05:24.499151+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bf728894-d4ae-44b1-9a40-9fd70b1e4ac3.jpg	GIS/Processed/2020-06-13/f47e0eed-fdd7-402d-8df5-9980fe8a961c.jpg	0101000020E6100000135C51EF4E515340C5BA021B218D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b9a2c724-8810-4ead-944f-6ef19969cf02	2328	1	28.5653694999999992	77.2346940999999987	2020-06-13 09:05:25.573334+05:30	testworld	NDMC	GIS/Raw/2020-06-13/715cef08-c6e4-465d-8e72-0c9f883d779b.jpg	GIS/Processed/2020-06-13/83f5e6b4-d997-4df9-8f3b-8c95e87d5d77.jpg	0101000020E61000001B04673A054F5340E7A7380EBC903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Mahatma Gandhi Marg	None	A5, Mahatma Gandhi Marg, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
d92b22e3-68fa-4f9e-b15d-adea4f4c04c6	2596	2	28.6905490000000007	77.2105667999999952	2020-06-13 09:05:26.760896+05:30	testworld	NDMC	GIS/Raw/2020-06-13/78e77f2a-0ac1-47a0-b615-86b4db3488e6.jpg	GIS/Processed/2020-06-13/0fdf340d-ea4a-461d-94f7-086c11a4766c.jpg	0101000020E6100000E5E72BED794D53401749BBD1C7B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
af4aff17-90a6-432b-9888-eaac99ebb91c	14893	2	28.5532858000000012	77.2690819999999974	2020-06-13 09:05:27.883628+05:30	testworld	NDMC	GIS/Raw/2020-06-13/119fd09c-b064-4968-952d-92b99d7ed709.jpg	GIS/Processed/2020-06-13/69101904-6551-481d-92d6-530f108a3eb2.jpg	0101000020E61000004E7CB5A33851534059576023A48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
6a2f3bc9-ab36-4079-9173-058c57555644	8218	2	28.5543142000000003	77.2678903999999989	2020-06-13 09:05:29.00773+05:30	testworld	NDMC	GIS/Raw/2020-06-13/191138bc-3ebd-4ead-b50e-2ef2e53c80ac.jpg	GIS/Processed/2020-06-13/a35e83cd-9b0d-4238-8167-95adba5e4677.jpg	0101000020E610000064BAC61D255153405AB51089E78D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d4bedc51-2634-40db-b2c0-464c303d2db1	11494	1	28.5510084000000006	77.2704793999999993	2020-06-13 09:05:30.119926+05:30	testworld	NDMC	GIS/Raw/2020-06-13/71a770fa-3b2e-4cbb-a773-30427e6c2fd1.jpg	GIS/Processed/2020-06-13/24b141d8-a4c1-419e-b6f0-ae72285b23d2.jpg	0101000020E6100000784FD4884F51534040D2F1E20E8D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
4745da3f-cb12-48f1-bf63-205bc91fc939	978	1	28.5650744000000003	77.2406931999999955	2020-06-13 09:05:31.160565+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ca1d06ae-0fe5-4fe7-8ad4-3fe9d5f6aaf0.jpg	GIS/Processed/2020-06-13/623342b5-15ba-4da5-8d82-67e94ce5683c.jpg	0101000020E6100000A7977384674F53408CCE43B7A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	None	Block O	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Gupta Market, Block O, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
97991be1-d571-4635-b512-38d9972b90a9	978	1	28.5650744000000003	77.2406931999999955	2020-06-13 09:05:32.204817+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b5eb9895-13d2-48fb-8b7f-77661c59d93f.jpg	GIS/Processed/2020-06-13/bd8ce9f2-bb3c-4580-9a2c-9777daed4ded.jpg	0101000020E6100000A7977384674F53408CCE43B7A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	None	Block O	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Gupta Market, Block O, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
a99d4f93-9dec-49b0-87bd-344c167157b8	850	1	28.5590742000000013	77.256635799999998	2020-06-13 09:05:33.311227+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b557abf7-1800-405a-8e1c-bcd8e6429461.jpg	GIS/Processed/2020-06-13/6936bbb7-5e13-4e5e-a1b0-e1f394614f6a.jpg	0101000020E6100000E6FE8FB86C50534091099D7C1F8F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Hills Road	None	163, Hills Rd, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
71de27c4-d8f8-49a7-818c-d26d2e5d32b8	6905	1	28.5551652000000011	77.2659764999999936	2020-06-13 09:05:34.426112+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7955d1de-f112-4037-95ed-fa8c1f150411.jpg	GIS/Processed/2020-06-13/c13c8c60-368a-4099-b27a-7ac16cb1f38a.jpg	0101000020E61000004A404CC20551534097E0794E1F8E3C40	None	None	None	None	110048	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Modi Mill Footover Bridge	None	Modi Mill Footover Bridge, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110048, India	None	None
4fcccd57-ff85-409e-9eb1-288ef7870225	1120	1	28.5525857000000016	77.2696487000000047	2020-06-13 09:05:35.518854+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b8c81ebc-d698-4b32-8cc8-e9cfcaf7e696.jpg	GIS/Processed/2020-06-13/c09b840d-5379-4a2f-8126-6bd3d41f3ec2.jpg	0101000020E61000002CFA9EEC41515340BEBCA541768D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	208, Okhla, Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
c5b1ae84-a890-4d1c-ab97-2670c344304c	1120	1	28.5525857000000016	77.2696487000000047	2020-06-13 09:05:36.671335+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ceee610a-43b5-400d-91af-8e831509ad06.jpg	GIS/Processed/2020-06-13/f9314b0d-11bd-4f58-91f5-118b61325253.jpg	0101000020E61000002CFA9EEC41515340BEBCA541768D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	208, Okhla, Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
8f0c6627-9815-4fc0-8570-9c8eb8907ff4	8001	1	28.5619052999999994	77.254072800000003	2020-06-13 09:05:37.880788+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1acab14a-e710-4080-ba83-fbc3ddb071c4.jpg	GIS/Processed/2020-06-13/a1cf0156-4c8f-48b7-a0a7-7955d2717b9a.jpg	0101000020E610000067B38FBA42505340F6F29606D98F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Captain Gaur Marg	None	B 1, Captain Gaur Marg, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
5aa10d6e-802c-40f9-919d-5a927be2d424	5723	1	28.6907266000000014	77.2106009000000029	2020-06-13 09:05:39.059349+05:30	testworld	NDMC	GIS/Raw/2020-06-13/026f8797-47d8-4a77-aa2c-9cd19a28dfec.jpg	GIS/Processed/2020-06-13/efddfe2a-8fa4-4fc6-b9a7-b64ff7f4509e.jpg	0101000020E61000008680327C7A4D53402F7A5D75D3B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
3c34c3d2-9b13-4afe-bf56-913a6fb52b78	15403	4	28.5550135000000012	77.267458199999993	2020-06-13 09:05:40.262807+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7b3d6d26-bdd8-40cd-89d0-0ac26aa1150e.jpg	GIS/Processed/2020-06-13/dbef6895-4b8e-4ab2-a311-273ec4554a31.jpg	0101000020E61000000283FF081E515340A8565F5D158E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1395e8f1-fbc9-47b5-bfa1-a4227179d5fb	13935	1	28.6893308000000005	77.2099678999999952	2020-06-13 09:05:41.417762+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3d9e4517-a7d2-4382-8930-163413ce12ef.jpg	GIS/Processed/2020-06-13/38ca9fdc-b283-42be-a718-5099f5465a75.jpg	0101000020E61000006DED331D704D53402220BAFB77B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
834503b5-cf58-4e8c-9d5e-067d1c34b9ec	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:05:42.52255+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c78f4d7e-81ad-49f4-8b44-aa3a5a37476d.jpg	GIS/Processed/2020-06-13/993694a0-6f3c-4514-9737-ee68c9551cc6.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
0efbdc0c-4182-42bd-bc73-099a89dfcbff	13935	1	28.6893308000000005	77.2099678999999952	2020-06-13 09:05:43.691495+05:30	testworld	NDMC	GIS/Raw/2020-06-13/db91421c-36a8-4d66-bb0d-4ae557efaecf.jpg	GIS/Processed/2020-06-13/5c7f9393-5c42-44e1-897d-29d4a1e8b4c7.jpg	0101000020E61000006DED331D704D53402220BAFB77B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
4d255154-5545-4b79-b195-39d344f08fe5	26871	1	28.5687139999999999	77.2161676000000057	2020-06-13 09:05:44.891015+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e4bfec10-8d14-43da-a8f7-a6ebf1599c11.jpg	GIS/Processed/2020-06-13/f4a43ee1-1810-488e-9813-cb2593f06793.jpg	0101000020E61000001C1DA1B0D54D534000C79E3D97913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
a6741e8a-8a58-4fc3-a5cd-0c007cd9293b	25268	1	28.6890897000000002	77.209867200000005	2020-06-13 09:05:46.06865+05:30	testworld	NDMC	GIS/Raw/2020-06-13/392b32e2-3abd-432c-87e1-bb3238718603.jpg	GIS/Processed/2020-06-13/b70e5e64-90e3-47e1-b11c-4cc3436ba6e3.jpg	0101000020E61000003320D6766E4D5340AD82BD2E68B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
9368683c-aada-4c49-afbf-0b01f7a07a85	1701	2	28.5591326999999993	77.2565472	2020-06-13 09:05:47.2239+05:30	testworld	NDMC	GIS/Raw/2020-06-13/208368e5-8536-44f2-848a-3bbb3aaae0f2.jpg	GIS/Processed/2020-06-13/d29f70cc-26bc-4229-8a78-34f1e8c06fba.jpg	0101000020E61000005878F2446B505340CA9F1452238F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	C Block Market, Esst of Kailash, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
0940d677-26fb-4275-b769-28c2507a77de	1014	1	28.5650702999999986	77.2401416999999952	2020-06-13 09:05:48.328929+05:30	testworld	NDMC	GIS/Raw/2020-06-13/26c7220a-d1ce-4c24-9336-f016d12447af.jpg	GIS/Processed/2020-06-13/924894e4-8943-41c8-aa6f-c0a685ffafc2.jpg	0101000020E6100000F9F94A7B5E4F5340DF707A72A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	12, Ring Road, Lajpat Nagar IV, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
1b0035b2-4ef7-4ce1-a4f8-12f03ec2f86e	16388	1	28.5514362000000013	77.2703975000000014	2020-06-13 09:05:49.391829+05:30	testworld	NDMC	GIS/Raw/2020-06-13/646158fd-03ca-4833-8ae1-e4c8cd96e090.jpg	GIS/Processed/2020-06-13/f703ba4b-7d71-42b2-9c54-731fbebb596c.jpg	0101000020E6100000E4DA50314E5153409DD43CEC2A8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1198c768-32d1-4cf9-8079-18ce3545aeed	19219	2	28.5551583999999998	77.2673513999999955	2020-06-13 09:05:50.514048+05:30	testworld	NDMC	GIS/Raw/2020-06-13/15699f87-24e6-48fa-84ae-3ba529e78af9.jpg	GIS/Processed/2020-06-13/43d84c98-4e63-49cb-859d-03e0279eefc4.jpg	0101000020E61000008CE20B491C515340851964DC1E8E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
188e7aba-2ba6-42bb-9719-8d3de5ebd82c	1266	1	28.5537834000000004	77.268541600000006	2020-06-13 09:05:51.670631+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2e5f074d-2cdc-432d-900e-5784fa5693a2.jpg	GIS/Processed/2020-06-13/05fa6783-c255-4053-b5bf-827be7fed676.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
6d57cedd-9f47-4a42-b65a-25e1d5a43691	25694	4	28.6905773000000011	77.2105779999999982	2020-06-13 09:05:52.895399+05:30	testworld	NDMC	GIS/Raw/2020-06-13/934ca330-aefb-4b41-a1be-86ff1ad4cd4f.jpg	GIS/Processed/2020-06-13/0329088a-ef13-443c-8404-a6af804cbd41.jpg	0101000020E610000074D0251C7A4D534028DC86ACC9B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
6069a9b0-bc1e-4e93-9655-22d0f4e3309e	1014	1	28.5650702999999986	77.2401416999999952	2020-06-13 09:05:54.013921+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f26f5fb1-5a69-468e-8df1-b976bafb3150.jpg	GIS/Processed/2020-06-13/a4b90843-afd1-4e03-b22f-1f5b1df301ed.jpg	0101000020E6100000F9F94A7B5E4F5340DF707A72A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	12, Ring Road, Lajpat Nagar IV, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
02e2480f-d77d-4dca-9bf0-820ae92190ec	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:05:55.209864+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ca769112-0fc0-411d-8897-1d2d449ad3b8.jpg	GIS/Processed/2020-06-13/37afcd53-053c-44e6-87b5-51dafeae2ee2.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
8e90ad20-96d7-4b39-bc1c-192c0ecbb2de	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:05:56.267674+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f38c47d9-a1ed-46c2-a786-28c5b1c864c4.jpg	GIS/Processed/2020-06-13/f1459d37-a192-41d4-92e8-7fdf46a4ae8f.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
ed32f081-3d8e-4ec3-873f-6438e77c8f3a	3183	1	28.5620830999999988	77.2571489999999983	2020-06-13 09:05:57.423322+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6bbdce39-d733-4139-a743-376444afd0a6.jpg	GIS/Processed/2020-06-13/40d53524-f0ed-4dbd-a90a-18ba154f05da.jpg	0101000020E6100000BE4C142175505340612294ADE48F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Captain Gaur Marg	None	C 3 Ground Floor, Main Road, Captain Gaur Marg, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
e95ef4c0-b995-4c66-a02f-99f4d83574d0	8218	2	28.5543142000000003	77.2678903999999989	2020-06-13 09:05:58.564178+05:30	testworld	NDMC	GIS/Raw/2020-06-13/00828804-2a2b-4739-9d77-e018902fd16f.jpg	GIS/Processed/2020-06-13/fcc7b008-1292-4ad2-a744-d661a8cc7e37.jpg	0101000020E610000064BAC61D255153405AB51089E78D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b72cf7a6-f08c-42a1-8828-6bac93d9d026	5859	1	28.5511130999999985	77.2705480999999992	2020-06-13 09:05:59.674697+05:30	testworld	NDMC	GIS/Raw/2020-06-13/abadd1dd-8c10-484d-ab3f-477343d1d426.jpg	GIS/Processed/2020-06-13/3a5381a4-8200-4a79-bff7-ee7459dac646.jpg	0101000020E6100000AD5FFAA850515340ADE584BF158D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
9012e6b3-a4d0-4ddc-9f93-1ac611ee4b5a	2328	1	28.5653694999999992	77.2346940999999987	2020-06-13 09:06:00.824947+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e414d019-a962-4474-883f-ccd6964e167d.jpg	GIS/Processed/2020-06-13/f047e042-b882-4e70-b92d-51e13e79882a.jpg	0101000020E61000001B04673A054F5340E7A7380EBC903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Mahatma Gandhi Marg	None	A5, Mahatma Gandhi Marg, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
6124c1fd-f25e-43b3-a469-035a083c6ab6	5588	1	28.5519664999999989	77.2700648000000001	2020-06-13 09:06:01.932175+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2604313d-ec3b-403b-a6b4-cbfe49cc4c0f.jpg	GIS/Processed/2020-06-13/a9ffa118-4d09-4579-a109-f0d116e0348d.jpg	0101000020E610000040F3DEBD48515340D2FC31AD4D8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
9f87a4db-1b72-4845-90ff-556a3b24fc3d	26871	1	28.5687139999999999	77.2161676000000057	2020-06-13 09:06:03.037321+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a9722774-6402-487c-82c2-9b0c1481a4c3.jpg	GIS/Processed/2020-06-13/b29ebd55-a2bd-4b5a-9ecc-9823d671af6b.jpg	0101000020E61000001C1DA1B0D54D534000C79E3D97913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
75ef14b0-3dca-4ae4-b3ad-3604e19325e8	14971	1	28.5596899999999998	77.256674799999999	2020-06-13 09:06:04.196223+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d59b50ff-1b10-4d07-993e-8378e2793cf6.jpg	GIS/Processed/2020-06-13/1878a061-b89f-48d6-82cf-86e97dc62870.jpg	0101000020E610000045ED235C6D505340F3E505D8478F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B 167, Raja Dhirsain Marg, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
f9cba81c-1822-4890-b957-eb043e395f18	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:06:05.323775+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0b8d4af7-73e7-4bf8-9149-41a9160dbea5.jpg	GIS/Processed/2020-06-13/f8cabc89-3638-492a-b0b7-9ebc395545ea.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
83215179-4ac8-4b3f-aae3-f636d30f9406	2475	1	28.5521546999999991	77.2701636999999977	2020-06-13 09:06:06.444762+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bf4634b5-366b-4d57-b74d-39d553040e80.jpg	GIS/Processed/2020-06-13/4c47ca18-94e3-4e66-9677-e36d39a7ce04.jpg	0101000020E61000003F04B05C4A5153402BD5AA025A8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase 3 Road	None	422, Okhla Phase 3 Rd, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
067bbc8b-9cd2-41be-aa88-61a72c07b89b	1024	1	28.5548476999999998	77.2656843000000038	2020-06-13 09:06:07.515164+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d2712055-1a0b-4384-bcc4-049db608c031.jpg	GIS/Processed/2020-06-13/f9dcb47f-81e9-41e0-ad68-80a57d771ff3.jpg	0101000020E6100000E2E3B8F800515340C5C2B57F0A8E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
0c218036-fe48-4883-ac12-01361b47a1fb	14611	2	28.5527408999999999	77.2695341999999954	2020-06-13 09:06:08.56123+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9cac6d2d-2f0e-45b6-a019-e590aee9e29e.jpg	GIS/Processed/2020-06-13/1edcf897-e41e-44fa-b677-9b45be2ad1de.jpg	0101000020E6100000D3895F0C405153405FA9786D808D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Okhla Industrial Estate Phase 3 Road	None	42, Okhla Industrial Estate Phase 3 Rd, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
63cee5e9-93d6-4140-bfe9-2589719917d6	13935	1	28.6893308000000005	77.2099678999999952	2020-06-13 09:06:09.749998+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bba02752-b4c2-4221-ac90-96028ad92cab.jpg	GIS/Processed/2020-06-13/74bd6802-f246-498e-b43c-7fbe6b6ec837.jpg	0101000020E61000006DED331D704D53402220BAFB77B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
48657e17-35a4-432b-b202-f32d872dfe89	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:06:10.940541+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ce85bb5e-1560-481b-aae3-4f6db175f334.jpg	GIS/Processed/2020-06-13/278e9db8-aee5-44d6-af4c-1ac0a51d2175.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
a0bb6776-0b96-469b-aa7b-0b9a7b11cb12	517	2	28.688948700000001	77.2098069000000038	2020-06-13 09:06:12.160532+05:30	testworld	NDMC	GIS/Raw/2020-06-13/87daf4c7-f3e4-4abc-bf10-6236eaaf640b.jpg	GIS/Processed/2020-06-13/55a29bfc-478a-4b23-9ec5-2b1da733142b.jpg	0101000020E6100000697EEB796D4D5340291F27F15EB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
4d617240-0481-46d0-bff7-7a119dd30ad9	8330	1	28.5530350999999989	77.2693114000000065	2020-06-13 09:06:13.32881+05:30	testworld	NDMC	GIS/Raw/2020-06-13/49b26aba-a4d1-4a65-be39-3ccf0792194b.jpg	GIS/Processed/2020-06-13/5afac32d-809b-4899-9469-3f9bf0aee046.jpg	0101000020E610000029DCE1653C515340430A54B5938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b9fdba1f-a425-4780-b5c2-4e27267821c4	13507	2	28.5547035999999999	77.2655280999999974	2020-06-13 09:06:14.441122+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c31428fc-9066-43b7-a270-febdc2ad0e84.jpg	GIS/Processed/2020-06-13/7ce86e97-940b-4375-a8d9-012b37054287.jpg	0101000020E6100000D16A9269FE50534035F91C0E018E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
a64112f1-2c47-4536-b442-7bc8a36ba05c	25268	1	28.6890897000000002	77.209867200000005	2020-06-13 09:06:15.588484+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b0d4bcee-c05c-4b6c-9c2b-1ee491261a41.jpg	GIS/Processed/2020-06-13/5d904aff-3add-43bb-a989-8c61fbe7588d.jpg	0101000020E61000003320D6766E4D5340AD82BD2E68B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
4c429d29-163a-45e3-a93c-f2b0ea2b062c	558	1	28.5535241000000006	77.2688576999999981	2020-06-13 09:06:16.828653+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bc5915f7-8894-47dd-8aab-37abbd5b36c7.jpg	GIS/Processed/2020-06-13/61340dc8-b352-4926-b12f-b3918ddecf74.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
103b3dc1-18da-403b-9c90-f74ea054c30c	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:06:17.96835+05:30	testworld	NDMC	GIS/Raw/2020-06-13/daffaca5-de8a-405b-8deb-58335f53be6e.jpg	GIS/Processed/2020-06-13/cb91cae4-71c4-4508-b692-2c661d352000.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
7317695c-7316-48f6-af76-64ac5c241207	11830	1	28.5607542999999993	77.260734400000004	2020-06-13 09:06:19.239407+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e0e72e52-eec4-468d-94b4-25b4bd4a50f2.jpg	GIS/Processed/2020-06-13/1b1b5ad8-868e-4f57-8a84-f16c1f74ec10.jpg	0101000020E61000004D3C56DFAF505340649703988D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	G Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	S.N.P. Depot, G Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
3536ca48-484b-4b81-80de-1d8c7c67ea5e	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:06:20.30554+05:30	testworld	NDMC	GIS/Raw/2020-06-13/cc702ab9-1ffe-4a86-bfb9-bb5b5e451a65.jpg	GIS/Processed/2020-06-13/7c21cea8-fc69-4b39-a3ff-e99668b2da7a.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
c9437474-527c-4afc-b2cd-474bb55c543f	20412	1	28.6949816999999996	77.2127138000000031	2020-06-13 09:06:21.461595+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6e9c0bae-c896-41a6-86e9-65afce5dc629.jpg	GIS/Processed/2020-06-13/8196f0dc-6683-4ea4-a915-bf278e77d3b0.jpg	0101000020E61000001B9A571A9D4D534088D11852EAB13C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	chatra marg ke pass, NCR Delhi, Delhi, 110007, India	None	None
6386c0eb-d5be-45a6-8fff-b4b33332c807	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:06:22.695522+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8e533dda-f881-4113-9d03-002b5592f417.jpg	GIS/Processed/2020-06-13/7e84def5-f911-4cb1-9333-82cf0c96d26d.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
c17003f8-98f3-49c8-992b-660599b0b3cd	1460	1	28.5524440000000013	77.2698757000000001	2020-06-13 09:06:23.813917+05:30	testworld	NDMC	GIS/Raw/2020-06-13/79a02265-3e7e-49a2-9a7c-1b1e8b9e2cfe.jpg	GIS/Processed/2020-06-13/50fa4072-615e-41e8-8eb9-812ab72c239b.jpg	0101000020E61000000C5FBAA44551534016DF50F86C8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
17ea2848-fceb-466d-af6c-78606925db8a	24033	1	28.5546787000000002	77.2677402000000058	2020-06-13 09:06:24.93857+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e5cfefed-d3d7-4f17-8f26-77a1608d75c8.jpg	GIS/Processed/2020-06-13/5a7785c7-1854-4f3d-9c6e-43df96f802b9.jpg	0101000020E6100000C5B4CAA722515340AD495C6CFF8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
306ba2b6-9fe9-4aaf-a941-11fd0b14a389	1266	1	28.5537834000000004	77.268541600000006	2020-06-13 09:06:26.050195+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c94de948-f5e4-4d24-bd78-5d1e39b949fa.jpg	GIS/Processed/2020-06-13/e2d1f6f8-d3ee-4b44-b1f3-16095c65ea30.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
94a7430d-b2a6-4723-a03f-bf1bff0c392c	10223	1	28.6914087000000002	77.2109190999999981	2020-06-13 09:06:27.203634+05:30	testworld	NDMC	GIS/Raw/2020-06-13/32e30899-ebac-466c-813f-050d7d83cdd9.jpg	GIS/Processed/2020-06-13/b1db8561-de7b-4e5a-b6bd-db69405cc058.jpg	0101000020E61000008326D3B27F4D53407DAB1A2900B13C40	None	None	None	None	110007	None	None	None	Delhi University	None	None	None	None	New Delhi	None	Delhi	Central Delhi	None	None	None	India	None	Chhatra Marg	None	7, Chhatra Marg, Near Marinda House, Delhi University, New Delhi, Delhi 110007, India	None	None
f78d6feb-d916-46ff-9faf-d6c338922386	2017	1	28.5602829999999983	77.2567971	2020-06-13 09:06:28.468465+05:30	testworld	NDMC	GIS/Raw/2020-06-13/235f5144-3987-42b6-8b3e-9bc7c7be715f.jpg	GIS/Processed/2020-06-13/4548bba3-6c64-4c84-be4e-811bb51f33db.jpg	0101000020E61000004A8D1A5D6F5053403881E9B46E8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	8-A C, Block Market, East Of Kailash, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
29fdeba3-1e01-40e4-a61e-201092c3cb6b	544	1	28.553028900000001	77.2693723000000006	2020-06-13 09:06:29.644155+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5908ebd6-4800-4082-a2c1-02d081278438.jpg	GIS/Processed/2020-06-13/4ed6e82e-0f09-49e5-bc7b-adedae36d5e5.jpg	0101000020E6100000B1BC50653D5153402C3E4F4D938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
20066e6e-c66e-4bf0-b3fd-e31c52082912	23962	1	28.5667894000000011	77.2283816999999999	2020-06-13 09:06:30.728388+05:30	testworld	NDMC	GIS/Raw/2020-06-13/422baf11-939a-4c17-90da-c6962ae1b47b.jpg	GIS/Processed/2020-06-13/1dd461d2-1d92-41ec-a4d1-e0858b2670a5.jpg	0101000020E6100000502047CE9D4E53402FB8301C19913C40	None	None	None	None	110049	None	None	None	Defence Colony	Block E	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Chauhan Vithi Road	None	E-16, Chauhan Vithi Rd, Block E, Defence Colony, New Delhi, Delhi 110049, India	None	None
f0971be2-4415-4d10-a077-4aecf8f3342e	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:06:31.777832+05:30	testworld	NDMC	GIS/Raw/2020-06-13/458e3693-1468-4f45-b2ad-5aece4140db7.jpg	GIS/Processed/2020-06-13/880f7bd1-eef5-41e6-81d5-9fa53533ea9b.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
97ef6e9a-ef59-4e22-89e7-91c35d0d7d43	13507	2	28.5547035999999999	77.2655280999999974	2020-06-13 09:06:32.871353+05:30	testworld	NDMC	GIS/Raw/2020-06-13/83de624d-e807-4b0f-8bf9-d0369f83391f.jpg	GIS/Processed/2020-06-13/d4efedea-8710-4bb2-ba1e-10bb0ff2d89c.jpg	0101000020E6100000D16A9269FE50534035F91C0E018E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
b3a930ad-7e5f-4fac-891b-bc1bd6123e83	8330	1	28.5530350999999989	77.2693114000000065	2020-06-13 09:06:33.972549+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f54a518d-e814-4c8f-966a-cfe231b2b365.jpg	GIS/Processed/2020-06-13/c93c54bc-e36d-40af-8570-2a5372f4e5dd.jpg	0101000020E610000029DCE1653C515340430A54B5938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
0569773b-c061-4622-8a6d-275816ad1d35	2391	1	28.6962335000000017	77.2164259000000044	2020-06-13 09:06:35.059487+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c2b9f32b-2a39-457c-818a-be937ebdeab5.jpg	GIS/Processed/2020-06-13/ac155663-cccb-4a2b-94aa-ff84d5e0a978.jpg	0101000020E610000079A004ECD94D53402FE1D05B3CB23C40	None	None	None	None	110054	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	Lucknow Road Government School, Banarsi Das Estate, Timarpur, Delhi, 110054, India	None	None
227adbc1-f0b8-436b-9067-18a87a733d06	4512	2	28.6954463000000004	77.2129616999999939	2020-06-13 09:06:36.217817+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1341ee7a-2c09-4243-b690-af5223e3cdfc.jpg	GIS/Processed/2020-06-13/40151ea6-a7d1-47f5-901c-c442d0a32b88.jpg	0101000020E61000003C331C2AA14D5340CC9FCAC408B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
126329ee-fe38-41dc-8e87-57099cc7ffd9	15403	4	28.5550135000000012	77.267458199999993	2020-06-13 09:06:37.448112+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4df2db36-182b-4acb-859a-514a6d70fdcc.jpg	GIS/Processed/2020-06-13/f212e6df-8b09-4624-a741-fc52eeb9fd4b.jpg	0101000020E61000000283FF081E515340A8565F5D158E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
fe4c66ef-ace1-4007-b870-5bacb70f0245	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:06:38.617076+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4d2a5cfb-5e59-458e-89f4-7324aa310ef6.jpg	GIS/Processed/2020-06-13/894fe76d-06cb-4c9f-ad7a-293d1762bac7.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
0498db86-3f5f-41f1-9dac-47672906ef84	8906	1	28.5657662999999999	77.2494403999999975	2020-06-13 09:06:39.719031+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0acdf0ba-1fbf-4835-84bc-21f61a7dc6cc.jpg	GIS/Processed/2020-06-13/5075838d-a55f-4047-8d69-1d518cba1ed7.jpg	0101000020E61000004613DED4F64F5340CEAD6B0FD6903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar II	Vinoba Puri	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Mahatma Gandhi Rd	None	Mahatma Gandhi Rd, Vinoba Puri, Lajpat Nagar II, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
94c8998d-3071-498c-8bbc-b181dc5b62b5	14971	1	28.5596899999999998	77.256674799999999	2020-06-13 09:06:40.823158+05:30	testworld	NDMC	GIS/Raw/2020-06-13/63e15740-4f20-4b12-ab43-058e318c375a.jpg	GIS/Processed/2020-06-13/b539f864-b730-4980-85bd-bf4e21bde437.jpg	0101000020E610000045ED235C6D505340F3E505D8478F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B 167, Raja Dhirsain Marg, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
639eb03b-d1df-4447-a1ac-c86712f3e727	1014	1	28.5650702999999986	77.2401416999999952	2020-06-13 09:06:41.904898+05:30	testworld	NDMC	GIS/Raw/2020-06-13/18dc4199-9c62-48a1-98a9-d49c7638acec.jpg	GIS/Processed/2020-06-13/8bbf283c-073e-44b3-bdaa-690d23425905.jpg	0101000020E6100000F9F94A7B5E4F5340DF707A72A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	12, Ring Road, Lajpat Nagar IV, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
ae5b245b-bbd8-4f5a-90ce-2af2d73985ee	14893	2	28.5532858000000012	77.2690819999999974	2020-06-13 09:06:43.066395+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5039ee3f-3a29-4788-9d8e-e40a75a8c915.jpg	GIS/Processed/2020-06-13/c4f18a41-d277-4cd1-8ef9-baccbb8a9e4a.jpg	0101000020E61000004E7CB5A33851534059576023A48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f7f3d731-463b-4349-b1ce-acc9647f4fc0	2328	1	28.5653694999999992	77.2346940999999987	2020-06-13 09:06:44.291007+05:30	testworld	NDMC	GIS/Raw/2020-06-13/befb75b6-ee82-4c74-abeb-5779e853ee0a.jpg	GIS/Processed/2020-06-13/038058da-ef54-45b5-a8b7-8d19aabf34f5.jpg	0101000020E61000001B04673A054F5340E7A7380EBC903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Mahatma Gandhi Marg	None	A5, Mahatma Gandhi Marg, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
0e798edf-0099-45dd-9a80-d8ad4bb21ea1	2210	1	28.6945833000000015	77.2162299000000019	2020-06-13 09:06:45.474572+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c9f38df7-8fdb-49ca-81bd-420f502999d6.jpg	GIS/Processed/2020-06-13/14c9fdd4-01c7-4a96-b5f0-8ba8f78d15ca.jpg	0101000020E6100000B63AEFB5D64D534007D90D36D0B13C40	None	None	None	None	110007	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	The Mall Road	None	24/1, The Mall Rd, Banarsi Das Estate, Timarpur, Delhi, 110007, India	None	None
12c89a4d-159a-404d-bd32-48fa898d250b	2596	2	28.6905490000000007	77.2105667999999952	2020-06-13 09:06:46.644617+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9ecea886-ebf4-40b5-948d-decb7447b713.jpg	GIS/Processed/2020-06-13/6f62bcec-d275-4caf-a5ad-c9b31226180e.jpg	0101000020E6100000E5E72BED794D53401749BBD1C7B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
85403f0e-3b90-4eae-a39a-c9249425f047	8353	3	28.6887523999999985	77.209666900000002	2020-06-13 09:06:47.866878+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d7e9b15d-648b-4cc6-9d5e-3d600731fed8.jpg	GIS/Processed/2020-06-13/7745e093-1977-4c75-b011-1dec819bb24a.jpg	0101000020E610000070A3B72E6B4D5340A00AC91352B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
dcd571ec-8f2c-466c-b7c9-6947aaffe1a8	7672	2	28.5593746999999993	77.2564191000000022	2020-06-13 09:06:49.054335+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a7ac2769-b2ad-430f-889e-43115e4e56f4.jpg	GIS/Processed/2020-06-13/b031b3af-717d-4e99-a979-56c6de9ca0a0.jpg	0101000020E61000007724A82B69505340B6B52A2E338F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
cb23d6c6-99ad-4f93-b925-10ed89f2ffe8	16388	1	28.5514362000000013	77.2703975000000014	2020-06-13 09:06:50.168261+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f6fc9921-fbf9-4ea7-8c01-5014fb0fa3f8.jpg	GIS/Processed/2020-06-13/f06fbc5e-c15a-4244-9036-6d2ccd16cd35.jpg	0101000020E6100000E4DA50314E5153409DD43CEC2A8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
3ea6431d-efd6-4016-a3e2-08c809d45d07	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:06:51.269231+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e99d063f-ad7f-4bf8-ae40-931c5b39dbbd.jpg	GIS/Processed/2020-06-13/d84e935f-0182-4a9f-a1fe-547aa9b7004d.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2b29ba0a-0c15-4306-9639-ae23e338d096	15403	4	28.5550135000000012	77.267458199999993	2020-06-13 09:06:52.357273+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3e2dfb4b-d5ef-470e-a06f-24c0c31e740f.jpg	GIS/Processed/2020-06-13/d75f4015-2d58-4647-9526-ec957d87a347.jpg	0101000020E61000000283FF081E515340A8565F5D158E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
9a5be963-f9b8-4917-b38d-caa0325e0584	4181	2	28.5552491999999987	77.2654950000000014	2020-06-13 09:06:53.677861+05:30	testworld	NDMC	GIS/Raw/2020-06-13/eb26cbe8-4ec2-4f5d-be33-316496bf4207.jpg	GIS/Processed/2020-06-13/74e700ac-2a2b-4534-a504-f4722923bd2b.jpg	0101000020E61000001990BDDEFD5053405221C3CF248E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
a64d9d6c-f8cf-43b4-9e6d-ce0e18f67218	850	1	28.5590742000000013	77.256635799999998	2020-06-13 09:06:54.75441+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9bb23c4b-1769-4003-8b87-49af729bd5a8.jpg	GIS/Processed/2020-06-13/7e33fcfe-6bc7-471c-b4cf-55ffb1e901d2.jpg	0101000020E6100000E6FE8FB86C50534091099D7C1F8F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Hills Road	None	163, Hills Rd, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
cc2132ec-49db-499c-aa88-6d6cfc90eddd	1120	1	28.5525857000000016	77.2696487000000047	2020-06-13 09:06:55.933449+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c2a1fa4c-67bf-4700-819c-2ca3e6622dab.jpg	GIS/Processed/2020-06-13/98ca4f91-8c31-49f2-b6f9-1064fbbeaa98.jpg	0101000020E61000002CFA9EEC41515340BEBCA541768D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	208, Okhla, Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f492071c-f334-45e9-9522-fc73cb02d48b	221	1	28.6954463000000004	77.2129616999999939	2020-06-13 09:06:57.099379+05:30	testworld	NDMC	GIS/Raw/2020-06-13/691aed76-2d43-4f42-a26c-8942ded18b2d.jpg	GIS/Processed/2020-06-13/299b9967-1961-441d-a003-ae59394f9413.jpg	0101000020E61000003C331C2AA14D5340CC9FCAC408B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
31b7a7b3-76fd-4e9f-badc-489b1685e581	2798	1	28.5537834000000004	77.268541600000006	2020-06-13 09:06:58.200701+05:30	testworld	NDMC	GIS/Raw/2020-06-13/89fc06fe-93ed-4b91-bfa1-191e368daf65.jpg	GIS/Processed/2020-06-13/ff0f62aa-6466-4327-b80d-75b470a0182a.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
366764c5-1217-41ee-b13a-f17c8ac12a75	6575	1	28.5587996000000004	77.2570563000000021	2020-06-13 09:06:59.295298+05:30	testworld	NDMC	GIS/Raw/2020-06-13/19ef67a5-3d24-4e77-8295-c3707326106e.jpg	GIS/Processed/2020-06-13/bc499cbc-b84e-445c-a11a-b2f0f422c7d5.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
7e1a1407-5645-499a-9366-1fb741d5caa5	978	1	28.5650744000000003	77.2406931999999955	2020-06-13 09:07:00.397045+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b9764717-18c8-4b7d-9ca8-2533efe6fa24.jpg	GIS/Processed/2020-06-13/656dd088-7758-4c07-a2a6-359945febf8c.jpg	0101000020E6100000A7977384674F53408CCE43B7A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	None	Block O	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Gupta Market, Block O, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
6e255f38-c70a-4817-9a19-31144c91b8ff	1701	2	28.5591326999999993	77.2565472	2020-06-13 09:07:01.614933+05:30	testworld	NDMC	GIS/Raw/2020-06-13/91dc5a3b-8a5f-46ff-a3b5-2c5d1aae4035.jpg	GIS/Processed/2020-06-13/3fb335ec-3b3f-4f25-864f-a3a557916e65.jpg	0101000020E61000005878F2446B505340CA9F1452238F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	C Block Market, Esst of Kailash, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
deb3aef3-9ca5-48cd-855e-bcf77ec2797b	14611	2	28.5527408999999999	77.2695341999999954	2020-06-13 09:07:02.744279+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6a60e74e-3c88-4b87-9d2f-b77512262f3e.jpg	GIS/Processed/2020-06-13/42e79113-52de-4ea0-a25d-e9e796af22b8.jpg	0101000020E6100000D3895F0C405153405FA9786D808D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Okhla Industrial Estate Phase 3 Road	None	42, Okhla Industrial Estate Phase 3 Rd, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f6f379c7-dbb1-4ce2-8d86-912a6bf7b87d	875	1	28.5515849000000017	77.2703551999999974	2020-06-13 09:07:03.878739+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f6f973f3-b6f3-4f10-91ac-0b2f0f02a2d0.jpg	GIS/Processed/2020-06-13/da87b08f-b561-425c-aedd-9654ebff5f85.jpg	0101000020E61000006D93E57F4D515340AA7702AB348D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f5dac51e-e8fa-4813-aac0-bf2c7629058b	7465	1	28.5497747000000004	77.2630639000000059	2020-06-13 09:07:04.956341+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b8ab1dfe-54b3-434f-a1c0-0c666ddac7b4.jpg	GIS/Processed/2020-06-13/d6d67a40-5b8a-4eae-8d21-eec927721292.jpg	0101000020E610000087D0F709D650534010ABE408BE8C3C40	None	None	None	None	110048	None	None	None	Kalkaji	Block 9	NSIC Estate	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Outer Ring Road	None	Outer Ring Rd, NSIC Estate, Block 9, Kalkaji, New Delhi, Delhi 110048, India	None	None
3a5aa2a7-3f19-4356-8e9c-8a358b0a56dd	5952	1	28.5528951000000006	77.2694204000000013	2020-06-13 09:07:06.076047+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d3df0e85-e127-4b2e-8a55-891b12c63a13.jpg	GIS/Processed/2020-06-13/013e1785-3b82-4385-ab76-8a38e6f288c3.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
a666f484-b107-4112-bfb6-8357adeb8976	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:07:07.242648+05:30	testworld	NDMC	GIS/Raw/2020-06-13/338b6ae4-a179-430e-a829-058edee0da85.jpg	GIS/Processed/2020-06-13/43acae30-241f-4441-8ea0-e898f72a22cd.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
fa71d413-3545-4ca6-b78b-c86ac81a0bf7	803	1	28.5511669999999995	77.270471900000004	2020-06-13 09:07:08.413812+05:30	testworld	NDMC	GIS/Raw/2020-06-13/185ecf7a-336f-445c-91c2-9c499d570660.jpg	GIS/Processed/2020-06-13/c74d5737-cb83-4f53-8827-e68f27d44a38.jpg	0101000020E61000002B3F5F694F5153406AA2CF47198D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
5988bc8a-6b91-4b96-ad30-5fc38459e35d	660	1	28.5534028000000006	77.2689687000000021	2020-06-13 09:07:09.489124+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b3da2eec-2303-4576-9ac3-29d976154405.jpg	GIS/Processed/2020-06-13/1450cfae-fe6b-462f-8639-6d7013f60db6.jpg	0101000020E610000073897EC836515340CC834FCEAB8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
0e06377f-fcdf-4ee0-9c82-b80bd72ea784	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:07:10.628804+05:30	testworld	NDMC	GIS/Raw/2020-06-13/30657017-31da-416b-8716-22671fc33d9f.jpg	GIS/Processed/2020-06-13/2c89e8f3-8014-416c-ab60-018a668fe0da.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d6e736a6-ed7f-4bd1-9ba4-f4f0f06328e5	7672	2	28.5593746999999993	77.2564191000000022	2020-06-13 09:07:11.742363+05:30	testworld	NDMC	GIS/Raw/2020-06-13/18aa46b5-fc1f-4b3a-9e0b-9359ba2cebfb.jpg	GIS/Processed/2020-06-13/18dfcdb9-ec6a-4a53-9c3a-e14dccfdcdaa.jpg	0101000020E61000007724A82B69505340B6B52A2E338F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
0eb72561-2280-446e-988c-d2091a9def18	25268	1	28.6890897000000002	77.209867200000005	2020-06-13 09:07:12.913038+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8e87d4aa-f253-4419-abcb-0c11f15711da.jpg	GIS/Processed/2020-06-13/d20cc0f0-c2cf-4904-bf2e-9c93102c928a.jpg	0101000020E61000003320D6766E4D5340AD82BD2E68B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
6bdc2f0c-12ec-47ee-8045-c53b7d6a5cf3	6905	1	28.5551652000000011	77.2659764999999936	2020-06-13 09:07:14.09036+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e7f56480-8c71-4c8a-9556-2b0bbb3d5e74.jpg	GIS/Processed/2020-06-13/2acbea0d-8cec-47cc-956c-a328cce570f2.jpg	0101000020E61000004A404CC20551534097E0794E1F8E3C40	None	None	None	None	110048	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Modi Mill Footover Bridge	None	Modi Mill Footover Bridge, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110048, India	None	None
4ef81026-e9dc-4967-a91f-07bda5f9621a	69347	2	28.5541626000000015	77.2683057999999932	2020-06-13 09:07:15.211898+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c44dac73-6e54-44b9-ba9e-092143a2967e.jpg	GIS/Processed/2020-06-13/81fd6a33-a906-482e-8f25-b73dfe033221.jpg	0101000020E6100000EF1417EC2B51534095AAA399DD8D3C40	15	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	15, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
3666d26f-641e-4f54-b6cd-f0779826cca4	10038	1	28.5592362999999985	77.2564471999999967	2020-06-13 09:07:16.315195+05:30	testworld	NDMC	GIS/Raw/2020-06-13/44336ec6-9770-428d-a373-a4332b942dae.jpg	GIS/Processed/2020-06-13/4a2c69da-3c25-40ef-bc51-d2802610bbce.jpg	0101000020E6100000A64984A1695053406D3C331C2A8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
f71da49c-64dd-43bf-a4b1-38be0fd9c499	1701	2	28.5591326999999993	77.2565472	2020-06-13 09:07:17.474017+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0061ea02-9003-472e-810c-c99b6f29da97.jpg	GIS/Processed/2020-06-13/db74a1cd-3c26-40e2-884a-623ebe167c5e.jpg	0101000020E61000005878F2446B505340CA9F1452238F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	C Block Market, Esst of Kailash, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
cfcc68a3-8690-426e-a438-454f5ac50946	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:07:18.619864+05:30	testworld	NDMC	GIS/Raw/2020-06-13/47c19710-2db9-4748-89d4-6d0c869027b1.jpg	GIS/Processed/2020-06-13/4405ab5e-51ee-42f0-9545-08fe9c4e3e0e.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1d5e876f-36b2-40b7-88b8-4cc62cb74f02	5588	1	28.5519664999999989	77.2700648000000001	2020-06-13 09:07:19.701381+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ca1738f9-a901-432d-a878-c2c94c6034e6.jpg	GIS/Processed/2020-06-13/10073f6b-c45d-4070-9539-17963f96f665.jpg	0101000020E610000040F3DEBD48515340D2FC31AD4D8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
007c40ed-0832-4106-ae9e-d8f81cb549cd	808	1	28.6896410999999993	77.2101147999999995	2020-06-13 09:07:20.865526+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4a811207-7012-43c2-af85-4da4bf4fd9c1.jpg	GIS/Processed/2020-06-13/14415704-4dbe-4679-a261-397eaae17319.jpg	0101000020E6100000F5995885724D53403B7AB2518CB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
1569ec8e-aed7-4980-9680-a185490895e7	1014	1	28.5650702999999986	77.2401416999999952	2020-06-13 09:07:22.037434+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d076d8b9-04f9-4102-b53e-b0176f48bd80.jpg	GIS/Processed/2020-06-13/2b271993-0d8a-40a1-9246-3c6d5980c8f9.jpg	0101000020E6100000F9F94A7B5E4F5340DF707A72A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	12, Ring Road, Lajpat Nagar IV, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
3aa96e7a-28e7-4b10-b567-3e7e39f6deea	1779	1	28.6949286000000008	77.2157595000000043	2020-06-13 09:07:23.184953+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c774c84e-ba13-413e-b76f-d7e176df31d9.jpg	GIS/Processed/2020-06-13/68e21254-582e-4ac4-850d-3d8aa1959b85.jpg	0101000020E61000004913EF00CF4D5340190E3AD7E6B13C40	None	None	None	None	110007	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	The Mall Road	None	24/1, The Mall Rd, Banarsi Das Estate, Timarpur, Delhi, 110007, India	None	None
666434de-cbc6-4afd-8c25-f5f05629b2d2	2131	1	28.5562107999999988	77.2648970000000048	2020-06-13 09:07:24.312564+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8908165a-39d3-4faf-8350-e9a519a9cb9d.jpg	GIS/Processed/2020-06-13/c929b009-581c-4de7-aeb6-79eba1993eed.jpg	0101000020E6100000BFF38B12F450534097AEBBD4638E3C40	None	None	None	None	110020	None	None	None	Bahapur	Okhla Sabzi Mandi	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Small Industries Service Institute / Modi Mill, Okhla Sabzi Mandi, Bahapur, New Delhi, Delhi 110020, India	None	None
c5d9277d-2c2e-400f-a17a-88005bb4ab6b	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:07:25.420238+05:30	testworld	NDMC	GIS/Raw/2020-06-13/af10f31c-97c5-4bf8-bab6-14187eb638b8.jpg	GIS/Processed/2020-06-13/892e67dd-6c74-4567-bfe9-e7456a8d2b48.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
539a56f2-b766-4f99-821b-af6fb50bd09c	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:07:26.636498+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d1dbf7c4-525c-4913-add2-6143f8c38031.jpg	GIS/Processed/2020-06-13/49e84538-6795-4f69-a4f7-03938681f760.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f32af092-f039-4f62-a6f6-2b9efdb698f3	12613	1	28.6905099999999997	77.2105430000000013	2020-06-13 09:07:27.789055+05:30	testworld	NDMC	GIS/Raw/2020-06-13/61dd68a6-b451-42e2-8a42-041620f7a8a5.jpg	GIS/Processed/2020-06-13/ccb31bb0-7175-4486-ac52-7b4ed2bc03ac.jpg	0101000020E6100000B6D95889794D53409B8F6B43C5B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
efb17495-dd0c-4e17-a6f2-3b44738f1720	1066	2	28.5587996000000004	77.2570563000000021	2020-06-13 09:07:28.946717+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1d216b23-6a1f-4f84-a062-3b1f71f1dd32.jpg	GIS/Processed/2020-06-13/bfdb5df7-7fcb-4486-b0e2-3d189f8eb804.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
761c598f-0b50-40bd-9a6d-a79d06cff71b	24431	4	28.5528951000000006	77.2694204000000013	2020-06-13 09:07:30.039874+05:30	testworld	NDMC	GIS/Raw/2020-06-13/10b68308-bfe9-45b7-8205-d9315cbc25a9.jpg	GIS/Processed/2020-06-13/112b2e70-358d-448a-88bb-e0614b5a79cd.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
60ee6230-6f28-4c7c-9aa6-7efb0c7944e4	803	1	28.5511669999999995	77.270471900000004	2020-06-13 09:07:31.178691+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d7116acf-6880-4dcc-80a1-a53774b2d174.jpg	GIS/Processed/2020-06-13/704b9ed0-d547-4618-bbd5-d145c631a973.jpg	0101000020E61000002B3F5F694F5153406AA2CF47198D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e71a0415-b802-496a-acb3-15a727b8a7e8	7672	2	28.5593746999999993	77.2564191000000022	2020-06-13 09:07:32.239482+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f1673681-cd3d-46a8-95ae-8e3087861ad3.jpg	GIS/Processed/2020-06-13/805d0dc1-62ba-44a0-be3f-585868f7fc7c.jpg	0101000020E61000007724A82B69505340B6B52A2E338F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
65b667b3-9ba8-405c-a85c-beee9753a6b6	4239	2	28.6887676999999996	77.2096820999999949	2020-06-13 09:07:33.424941+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5ec86728-c25c-480d-9ca8-de0d2a3029a8.jpg	GIS/Processed/2020-06-13/288fa6fb-8cba-41b5-8b1b-0c73b1709090.jpg	0101000020E61000009F83786E6B4D5340880A7A1453B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
c2ef5ff9-ce29-4790-9379-81e75eebf0d2	850	1	28.5590742000000013	77.256635799999998	2020-06-13 09:07:34.694397+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f4a763e1-0b0b-4017-9f6b-8f20c7112ba0.jpg	GIS/Processed/2020-06-13/60f5c51a-60cd-41ad-8310-4acbadb67114.jpg	0101000020E6100000E6FE8FB86C50534091099D7C1F8F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Hills Road	None	163, Hills Rd, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
7567a703-8b85-4466-b5fe-ba6e480a10fe	2798	1	28.5537834000000004	77.268541600000006	2020-06-13 09:07:35.854439+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6005ab43-d25a-4fda-b1f0-2b6f6bb37bc4.jpg	GIS/Processed/2020-06-13/e63537ef-2c96-4959-b425-a468d9f4804a.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
cf5cc588-c2f1-4dca-9a5c-d92ab7fd374d	24431	4	28.5528951000000006	77.2694204000000013	2020-06-13 09:07:36.962409+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c7af4199-5164-447c-b6d8-938f2c7d3f12.jpg	GIS/Processed/2020-06-13/a55dc009-1d27-4166-abdd-f87ea9b45195.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
0c4239e0-7a6f-4da9-88a2-315da2a3f1dd	7045	1	28.5592559000000001	77.2563219999999973	2020-06-13 09:07:38.052832+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b06c0017-3354-4422-90f8-6b0091ba028a.jpg	GIS/Processed/2020-06-13/5b029b3f-2ba4-47c5-b33b-3ff897afd2f6.jpg	0101000020E6100000B3CF639467505340559808652B8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
b295599e-f051-42cd-92df-46d4aa925494	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:07:39.140385+05:30	testworld	NDMC	GIS/Raw/2020-06-13/67b302d4-09b3-4358-b17d-fa65a0948e7a.jpg	GIS/Processed/2020-06-13/d9695bf3-308c-4cea-b021-50013e46763e.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
80d5b442-4105-411a-a21d-2b6dcd3b6aad	6456	1	28.5654408999999987	77.2460082999999997	2020-06-13 09:07:40.243372+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bdbd45b6-7229-46c9-b0f0-f4dbca97f340.jpg	GIS/Processed/2020-06-13/0cb7aab4-223e-466b-83f9-a921be426320.jpg	0101000020E6100000DAC29899BE4F534020521DBCC0903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar III	Block L	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Lajpat Nagar Ring Road / Vinoba Puri, Lajpat Nagar, Block L, Lajpat Nagar III, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
0baaf0be-963c-49bb-a765-52abd8f93b05	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:07:41.326621+05:30	testworld	NDMC	GIS/Raw/2020-06-13/28f66a01-71b9-46ac-9694-7febd0748617.jpg	GIS/Processed/2020-06-13/1b541228-293e-40f0-ab4d-c3e0fdf38a6e.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
8a34354b-3d04-45f5-a375-c20583eeb97c	11400	3	28.6908683999999994	77.2106553999999932	2020-06-13 09:07:42.562377+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e5d6bc3f-996c-4884-9a7d-1f1440a9dfed.jpg	GIS/Processed/2020-06-13/5ad419ac-cef4-4ead-9c50-07b354c326d9.jpg	0101000020E6100000736EC9607B4D534000D75FC0DCB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Faculty of Science	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Faculty of Science, University Enclave, Delhi, 110007, India	None	None
1f79d52f-5ef6-40d4-a6ca-7fea24e97756	2017	1	28.5602829999999983	77.2567971	2020-06-13 09:07:43.729647+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ae8d2523-64ed-4ee6-8d6c-9c5453cd30b4.jpg	GIS/Processed/2020-06-13/5a6876f0-7b26-47a1-b241-4e9b94469aec.jpg	0101000020E61000004A8D1A5D6F5053403881E9B46E8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	8-A C, Block Market, East Of Kailash, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
5d1fac07-6785-40cb-bbe2-3d915bb311c2	1319	1	28.5585225999999999	77.2578445999999985	2020-06-13 09:07:44.867295+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e4007224-cc4a-4ee9-82fe-6e51b7e86a6d.jpg	GIS/Processed/2020-06-13/e16df0be-537f-47b8-9f42-212bca08e2b8.jpg	0101000020E6100000D01CA38680505340AF134D56FB8E3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 161, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
48af503c-0af5-4238-9492-ea82a67e656c	7045	1	28.5592559000000001	77.2563219999999973	2020-06-13 09:07:45.95423+05:30	testworld	NDMC	GIS/Raw/2020-06-13/51addc38-256b-4b4e-92a0-48cdea6a3ec4.jpg	GIS/Processed/2020-06-13/b0c9141d-7a09-4ba1-86c1-5cd42740d483.jpg	0101000020E6100000B3CF639467505340559808652B8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
5ea05f76-76be-4682-bda8-439da832f7b5	2364	1	28.6911750999999988	77.2108060000000052	2020-06-13 09:07:47.09714+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bc2da12e-8ebd-42c2-9112-3e056f279706.jpg	GIS/Processed/2020-06-13/86111241-405b-4735-bc1f-265dffd507b8.jpg	0101000020E61000003DF372D87D4D53403D4FF2D9F0B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Faculty of Science	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Faculty of Science, University Enclave, Delhi, 110007, India	None	None
f786e5c4-a5dd-4a21-b18a-01a67da46867	5952	1	28.5528951000000006	77.2694204000000013	2020-06-13 09:07:48.22929+05:30	testworld	NDMC	GIS/Raw/2020-06-13/801db56c-fa8f-4f11-bd8f-990a2b2d2428.jpg	GIS/Processed/2020-06-13/d965d3cb-e802-4c4c-aca7-e76f3f015431.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
6859ffe0-5e4a-4939-a39d-a31b5dcc8497	14893	2	28.5532858000000012	77.2690819999999974	2020-06-13 09:07:50.040587+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4000a5de-0e5b-4b43-9abd-81fbf01076c6.jpg	GIS/Processed/2020-06-13/814fab62-d4c2-4eaf-b29e-83503a48d04f.jpg	0101000020E61000004E7CB5A33851534059576023A48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b18e4dd6-dfa2-4a20-aea5-b125a2d00169	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:07:51.185057+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bae0470b-54ee-4c45-b4ec-15f9cb08e2aa.jpg	GIS/Processed/2020-06-13/922d80db-e2b9-404b-b4ac-91e338083380.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1362cf6c-a493-4bff-a329-87b60b7e39d2	13935	1	28.6893308000000005	77.2099678999999952	2020-06-13 09:07:52.365603+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6cb17891-71c1-4b8f-8641-8c8346230822.jpg	GIS/Processed/2020-06-13/90f08968-508f-40c8-8f26-881ef3092a76.jpg	0101000020E61000006DED331D704D53402220BAFB77B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
f9491465-1cf5-4650-9f0c-0b394578827d	2328	1	28.5653694999999992	77.2346940999999987	2020-06-13 09:07:53.502343+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6da3f557-44cc-4e68-a274-f5100115dfa4.jpg	GIS/Processed/2020-06-13/ae2a6c77-0072-41bd-a4d2-4b2e7ef034b5.jpg	0101000020E61000001B04673A054F5340E7A7380EBC903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Mahatma Gandhi Marg	None	A5, Mahatma Gandhi Marg, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
946d0331-1ae6-44d8-af3c-d03526aad20c	12613	1	28.6905099999999997	77.2105430000000013	2020-06-13 09:07:54.74022+05:30	testworld	NDMC	GIS/Raw/2020-06-13/27e94bb6-8bc5-4f65-b616-e2d7e0c57b36.jpg	GIS/Processed/2020-06-13/8172d2fc-68bc-449a-866e-d6ecad1cfdd3.jpg	0101000020E6100000B6D95889794D53409B8F6B43C5B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
270964e7-5393-4c03-9663-a18283235a4b	2607	1	28.562968699999999	77.2504545999999976	2020-06-13 09:07:55.919907+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c4aec230-0acd-4673-ab84-db28341cdbbd.jpg	GIS/Processed/2020-06-13/b2eeae52-df3a-4850-a908-d844fb87ab07.jpg	0101000020E61000007F08BB7207505340F02B7BB71E903C40	None	None	None	None	110048	None	None	None	Sri Niwaspuri	Dayanand Colony	Block A	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Captain Gaur Marg	None	Captain Gaur Marg, Block A, Dayanand Colony, Sri Niwaspuri, New Delhi, Delhi 110048, India	None	None
c9c7bdd2-2e23-4b3a-967f-13dacfee2b66	14971	1	28.5596899999999998	77.256674799999999	2020-06-13 09:07:57.007083+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a72c3a02-706f-403a-b6c5-a4924b5a5611.jpg	GIS/Processed/2020-06-13/7c4fd0d0-8f0b-49a4-a621-a832520eff5d.jpg	0101000020E610000045ED235C6D505340F3E505D8478F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B 167, Raja Dhirsain Marg, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
a695b8b7-e691-4d34-bc9a-2e454e66b2fa	4181	2	28.5552491999999987	77.2654950000000014	2020-06-13 09:07:58.119802+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fc300dc3-dc68-41f5-a730-687029a90133.jpg	GIS/Processed/2020-06-13/4bc679cc-cf3a-4299-acbf-bb1dee459364.jpg	0101000020E61000001990BDDEFD5053405221C3CF248E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
b28c0a73-ebd2-4ce7-99c6-8acbc78e8000	2206	1	28.6954463000000004	77.2129616999999939	2020-06-13 09:07:59.359449+05:30	testworld	NDMC	GIS/Raw/2020-06-13/223cd27f-9ced-49e7-9cb6-0316645fa18f.jpg	GIS/Processed/2020-06-13/4a7343c4-080a-43f2-89be-3547d4069868.jpg	0101000020E61000003C331C2AA14D5340CC9FCAC408B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
f49bde15-77c3-4bb1-964f-8991bb7b3d11	5952	1	28.5528951000000006	77.2694204000000013	2020-06-13 09:08:00.509921+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fde42658-51f7-4425-8293-b5c72abd50cc.jpg	GIS/Processed/2020-06-13/0b4323ff-aab9-474f-8605-d31bec473355.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2ed5e6b0-32c1-4fa1-9954-a028b9432350	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:08:01.605004+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ea4c63c0-3b13-4735-a5ae-e456352b7a23.jpg	GIS/Processed/2020-06-13/820d950b-543b-46bb-a04c-67ff08263e3d.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
90a9c007-9ca9-485f-a90b-2bb4c7d80a7f	955	1	28.5613001000000004	77.2567616999999984	2020-06-13 09:08:02.699472+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9fee5d03-c75f-4e64-8c7f-9cc27811bffa.jpg	GIS/Processed/2020-06-13/82d6eb13-a7dd-447e-9880-a24d5f4c84e8.jpg	0101000020E61000006217A0C86E505340D5BD045DB18F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsen Marg	None	C 24, Raja Dhirsen Marg, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
9cf665f4-af8b-4825-aa4c-279b6dd6031b	1393	1	28.551081700000001	77.2704736999999966	2020-06-13 09:08:03.864304+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0bcf267e-0180-4d6e-805c-57cff7068cf4.jpg	GIS/Processed/2020-06-13/31acc60c-fb01-4f98-ae3f-c638fe2c37f1.jpg	0101000020E610000066FBEB704F51534091ECB6B0138D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2a996d16-136c-4422-a92d-75e8cf2c35dc	1285	1	28.5516417000000011	77.2703802000000053	2020-06-13 09:08:05.02091+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e1852353-baa9-4245-adc7-5f7c170c4059.jpg	GIS/Processed/2020-06-13/5da982d6-d602-4e37-ba19-6471d7208264.jpg	0101000020E61000001A1FC1E84D5153401F9CF463388D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
89240fe9-409e-4cb9-9aa4-abb62ec576c4	30595	1	28.5592345999999999	77.2564517999999936	2020-06-13 09:08:06.120265+05:30	testworld	NDMC	GIS/Raw/2020-06-13/aa01052b-07ba-4f5e-bb98-4612bb77ed10.jpg	GIS/Processed/2020-06-13/f7912fa8-a150-48be-a5eb-e63799304d77.jpg	0101000020E61000000580CFB469505340A9CAADFF298F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
8c851437-8791-49ba-9e43-bc6ed22f7288	3328	1	28.6917110999999991	77.2110715000000027	2020-06-13 09:08:07.220504+05:30	testworld	NDMC	GIS/Raw/2020-06-13/67365983-25a8-4603-8d34-1ab442aa5abc.jpg	GIS/Processed/2020-06-13/cf646f77-0bc4-4b86-b39e-7e34c52b4a64.jpg	0101000020E610000088670932824D5340BAC788FA13B13C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	Chhatra Marg	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
02da1e1d-b037-4683-9a20-6db5db2c164b	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:08:08.397466+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b2324f9e-3bc8-44ea-ae42-91f68e4a1355.jpg	GIS/Processed/2020-06-13/9f496760-951b-416e-ab77-a71e51d90ce8.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
77312f91-bad5-4401-af6d-4fb954bada54	6014	2	28.5512863999999986	77.2704427999999979	2020-06-13 09:08:09.554419+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5f04c902-b01b-4143-bbc8-b8a3d38c776f.jpg	GIS/Processed/2020-06-13/52e38e8b-de66-49c5-9fd1-390195f1290d.jpg	0101000020E6100000135C51EF4E515340C5BA021B218D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
984fa6df-779c-4541-8c93-b155b563aca5	9837	4	28.672979999999999	77.216873899999996	2020-06-13 09:08:10.718271+05:30	testworld	NDMC	GIS/Raw/2020-06-13/398ad795-53a1-4bbd-b7c8-cbd63a0fe7b3.jpg	GIS/Processed/2020-06-13/a1bf4e73-dc04-439f-9723-a0ae99a41a3e.jpg	0101000020E6100000C8F61043E14D5340B1DCD26A48AC3C40	None	None	None	None	110054	None	None	None	Civil Lines	Kamla Nehru Ridge	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	MCD Store (Rajpur Road), Kamla Nehru Ridge, Civil Lines, Delhi, 110054, India	None	None
de60af57-72ae-4279-9dc8-bda400a0b7ab	55007	1	28.5555003999999997	77.2670537999999993	2020-06-13 09:08:11.92221+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6815b04b-acfd-419f-8580-3bfb60fcac84.jpg	GIS/Processed/2020-06-13/c8bfafbd-104b-4b04-9ddc-7f1b9888e24d.jpg	0101000020E61000007151D2681751534038EA3246358E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e1d82312-a844-4a1b-8a06-386c63877337	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:08:13.159412+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1825281b-3df0-41ff-8aec-c59a9d87a055.jpg	GIS/Processed/2020-06-13/36b62d56-bc4f-463c-901b-867a9f890b03.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
687c78ee-3ac3-4587-9c02-01433433d6d1	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:08:14.254967+05:30	testworld	NDMC	GIS/Raw/2020-06-13/91ae3bb6-09cd-47ba-ad5c-1c07109c979a.jpg	GIS/Processed/2020-06-13/013cb75c-ce06-4a59-8ed6-1b04e72d874c.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e90afb0c-7a96-4cf7-b520-9bf6ad6f31e6	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:08:15.361914+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f4310d08-7bd2-4d97-8cb6-80d43b8feab8.jpg	GIS/Processed/2020-06-13/e8fe8e4a-9e9b-436b-adb7-75799c647846.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
bfdf381f-e7d4-4e74-80b5-c6c11924fd1f	14893	2	28.5532858000000012	77.2690819999999974	2020-06-13 09:08:16.48489+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f4721ea8-ce21-489f-88d4-38401310dbd7.jpg	GIS/Processed/2020-06-13/a0c9a9a6-1281-4ca7-beb0-2d5f431c301b.jpg	0101000020E61000004E7CB5A33851534059576023A48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
fd878c19-3a28-4d46-a9a3-9532597425b6	6456	1	28.5654408999999987	77.2460082999999997	2020-06-13 09:08:17.568773+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d07f1e0a-2526-4ff1-bd51-47180c42f7a5.jpg	GIS/Processed/2020-06-13/deaea44f-aa42-4905-844d-9885212d7e36.jpg	0101000020E6100000DAC29899BE4F534020521DBCC0903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar III	Block L	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Lajpat Nagar Ring Road / Vinoba Puri, Lajpat Nagar, Block L, Lajpat Nagar III, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
c2f4852f-84ae-4c85-89e6-b6ad805a9852	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:08:18.70936+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7eabedb8-b0d2-4c34-bcab-e2a63c1ee332.jpg	GIS/Processed/2020-06-13/93b3112f-988d-4042-a79c-6f27365d8681.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
eda256ac-0875-4307-8c0b-e25cdf24ed1e	8330	1	28.5530350999999989	77.2693114000000065	2020-06-13 09:08:19.887933+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1a02f81e-4597-415e-82bc-32e366ad796a.jpg	GIS/Processed/2020-06-13/9b70bf6a-ac81-4034-b69e-4d33e7c7b3d5.jpg	0101000020E610000029DCE1653C515340430A54B5938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
bde324ce-aa02-46c1-8567-9c9b1640be83	2596	2	28.6905490000000007	77.2105667999999952	2020-06-13 09:08:21.087736+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bb04cd14-ce6a-4a35-8212-a4f98bd7615b.jpg	GIS/Processed/2020-06-13/aa5411c6-f4c8-4008-a230-eaf1dd4dbf62.jpg	0101000020E6100000E5E72BED794D53401749BBD1C7B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
c50dd786-6608-4917-aa1e-6a8f6b09dde5	63640	1	28.6954558999999989	77.212962399999995	2020-06-13 09:08:22.299091+05:30	testworld	NDMC	GIS/Raw/2020-06-13/97b473d9-9610-41a2-b085-a1c1cb64fd5b.jpg	GIS/Processed/2020-06-13/31c7638c-2891-4e2e-adee-c64138c9ab1c.jpg	0101000020E6100000C5D10B2DA14D53406C4FDA6509B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
cb890ffe-9ed8-4f6f-af74-381f4ba890a0	1266	1	28.5537834000000004	77.268541600000006	2020-06-13 09:08:23.475662+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1fa38ce5-c2ff-4415-ab65-472e38050dc7.jpg	GIS/Processed/2020-06-13/96848906-a564-40e2-9768-1d9417303b09.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e9843afd-eab4-42ea-8cb4-13d8a8d1539d	266	1	28.6989783000000003	77.2178004999999956	2020-06-13 09:08:24.601666+05:30	testworld	NDMC	GIS/Raw/2020-06-13/58f5c1be-410e-40c4-9aca-ed42b56746ad.jpg	GIS/Processed/2020-06-13/c4958158-7f25-4f67-8820-ceecb321b150.jpg	0101000020E61000005B238271F04D53401A1DEB3DF0B23C40	None	None	None	None	110054	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	Lucknow Road	None	69, Lucknow Rd, Banarsi Das Estate, Timarpur, Delhi, 110054, India	None	None
6d88d5a8-f123-409e-a9dd-9b32656910a9	6231	1	28.5687220000000011	77.216097199999993	2020-06-13 09:08:25.772453+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9c77c29f-ceea-4401-8571-839c32f2e11a.jpg	GIS/Processed/2020-06-13/579f955b-933d-4bfe-a1ad-1f1df5be1121.jpg	0101000020E610000075B05989D44D53400684D6C397913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
05e4fb90-9706-4c6a-a942-7d0676cf452b	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:08:26.834598+05:30	testworld	NDMC	GIS/Raw/2020-06-13/04b9bf61-8669-4672-a322-ebfc4b842ebe.jpg	GIS/Processed/2020-06-13/caeaa224-9641-463f-9cea-386514148dc4.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
10c810e8-f19c-41c3-ac5d-ad3ee988b5bd	2328	1	28.5653694999999992	77.2346940999999987	2020-06-13 09:08:28.058324+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c03ca8d7-cb5b-46f8-8a1c-75a156fc288b.jpg	GIS/Processed/2020-06-13/ac34f461-966d-4c71-8ee3-0ce45e513d2f.jpg	0101000020E61000001B04673A054F5340E7A7380EBC903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Mahatma Gandhi Marg	None	A5, Mahatma Gandhi Marg, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
42de68ac-480c-436d-a53b-b109a8de2e64	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:08:29.174568+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3b5271b7-c1df-40a0-9533-cedae689ed70.jpg	GIS/Processed/2020-06-13/a04c2e63-6a8c-460d-9071-471691506489.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e01a607a-3779-4d79-9507-8fb83c8d55bc	6905	1	28.5551652000000011	77.2659764999999936	2020-06-13 09:08:30.249705+05:30	testworld	NDMC	GIS/Raw/2020-06-13/12aba645-07ec-4e26-ab53-e12a893f9acb.jpg	GIS/Processed/2020-06-13/83d86fe2-2e3b-4f2c-ba26-bf19dbb78d88.jpg	0101000020E61000004A404CC20551534097E0794E1F8E3C40	None	None	None	None	110048	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Modi Mill Footover Bridge	None	Modi Mill Footover Bridge, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110048, India	None	None
885e041a-29d2-420a-953f-5a9fd2b22341	875	1	28.5515849000000017	77.2703551999999974	2020-06-13 09:08:31.383388+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b3447d54-c2f7-4bbf-822e-60d82027ef0e.jpg	GIS/Processed/2020-06-13/e83802f4-e697-492c-8e59-1c3b2f2e63bb.jpg	0101000020E61000006D93E57F4D515340AA7702AB348D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
77caf6cf-b939-4131-b2c9-68f93f973860	4512	2	28.6954463000000004	77.2129616999999939	2020-06-13 09:08:32.538674+05:30	testworld	NDMC	GIS/Raw/2020-06-13/40d3ab90-6873-4426-9a82-1a70fad66cf0.jpg	GIS/Processed/2020-06-13/4df4441c-870f-46bd-a619-d47f5a582844.jpg	0101000020E61000003C331C2AA14D5340CC9FCAC408B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
c7112585-07a7-446f-a58a-b7c38f6cbd50	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:08:33.702842+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6067b203-9f87-4a05-b006-9c4ff44e6ee4.jpg	GIS/Processed/2020-06-13/27a163ba-a86f-4400-b00f-8184019bbc6f.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d5d17def-fbe3-4e22-8acf-2b4a8939ed4c	14611	2	28.5527408999999999	77.2695341999999954	2020-06-13 09:08:34.846353+05:30	testworld	NDMC	GIS/Raw/2020-06-13/39cc6339-98fe-4ff1-8bab-391b0bd94acc.jpg	GIS/Processed/2020-06-13/427a150a-cd64-4b3b-929e-4d7f7c4f1188.jpg	0101000020E6100000D3895F0C405153405FA9786D808D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Okhla Industrial Estate Phase 3 Road	None	42, Okhla Industrial Estate Phase 3 Rd, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
0d49c9d8-693b-4c72-abfe-9d452c51cdde	1252	1	28.6745620000000017	77.2132318999999967	2020-06-13 09:08:36.045193+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f632000a-117a-4c04-aeeb-6c9f5a5a49e6.jpg	GIS/Processed/2020-06-13/0d707ba9-950b-4db4-a312-4c0b9c5e5292.jpg	0101000020E6100000B13D6997A54D5340D61F6118B0AC3C40	None	None	None	None	110007	None	None	None	Civil Lines	Kamla Nehru Ridge	None	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Hindu Rao Marg	None	Hindu Rao Marg, Kamla Nehru Ridge, Civil Lines, Delhi, 110007, India	None	None
4a5e46f9-62b0-474a-a079-f514f75bb0c7	26871	1	28.5687139999999999	77.2161676000000057	2020-06-13 09:08:37.193249+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ea7c7d75-8162-4942-9ea5-bdc76e971d41.jpg	GIS/Processed/2020-06-13/e58ae2a6-1617-41b6-845c-4d9d9a12d8ba.jpg	0101000020E61000001C1DA1B0D54D534000C79E3D97913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
e1a0cf0a-d285-40e7-9a04-45b1f908550d	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:08:38.312711+05:30	testworld	NDMC	GIS/Raw/2020-06-13/28fcb73b-7666-4ed4-bcda-2bb406cb78a4.jpg	GIS/Processed/2020-06-13/6a7eb275-29ce-460f-89fb-57299b7fbac3.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
76cd6ca3-aa5a-4258-b79b-ed2f7e4d47e7	5705	1	28.5509704999999983	77.2706055999999961	2020-06-13 09:08:39.432301+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4f94a1a0-ac3f-4fba-85f8-de52b1c2b07c.jpg	GIS/Processed/2020-06-13/909d8999-8189-427f-bc8b-583b7e207041.jpg	0101000020E61000005387269A515153408E8F16670C8D3C40	77	None	None	None	110020	None	None	None	Modimill	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	77, Okhla Phase III, Modimill, New Delhi, Delhi 110020, India	None	None
4b0f4615-b821-4e94-9dbe-851a370fd1b7	6905	1	28.5551652000000011	77.2659764999999936	2020-06-13 09:08:40.490205+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fc9755dd-7557-4e5c-bae2-c292220bafa2.jpg	GIS/Processed/2020-06-13/c044d684-6b33-4d16-8670-156c71d2ee30.jpg	0101000020E61000004A404CC20551534097E0794E1F8E3C40	None	None	None	None	110048	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Modi Mill Footover Bridge	None	Modi Mill Footover Bridge, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110048, India	None	None
46c1f7d4-395d-439d-8fff-3e425767d1b4	875	1	28.5515849000000017	77.2703551999999974	2020-06-13 09:08:41.635576+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e0cee460-129f-4504-bf82-fe3dc5298be5.jpg	GIS/Processed/2020-06-13/f0d9827e-4b75-441a-bad3-ed9f230ce1c6.jpg	0101000020E61000006D93E57F4D515340AA7702AB348D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
47c53f02-eaa5-4c71-a589-0494ba7884e4	3881	2	28.6931668000000002	77.2173781999999989	2020-06-13 09:08:42.772743+05:30	testworld	NDMC	GIS/Raw/2020-06-13/89988fac-c51f-49f9-bec6-6a002d928407.jpg	GIS/Processed/2020-06-13/1001765f-c861-40b3-86d0-e90e75c9ba09.jpg	0101000020E610000041F74086E94D534048AC206173B13C40	None	None	None	None	110007	None	None	None	Civil Lines	Kamla Nehru Ridge	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	Social Work School, Kamla Nehru Ridge, Civil Lines, Delhi, 110007, India	None	None
f1de2ca0-2444-4e35-ad27-ca8a4262ec6a	6231	1	28.5687220000000011	77.216097199999993	2020-06-13 09:08:43.958076+05:30	testworld	NDMC	GIS/Raw/2020-06-13/03b9ed5f-3f5b-44e7-a96d-8c67c6ca0f44.jpg	GIS/Processed/2020-06-13/8daea14d-c10a-4fed-8040-d72a7fe0802c.jpg	0101000020E610000075B05989D44D53400684D6C397913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
5ab69caa-b977-47f7-90b8-ecd41656a622	14611	2	28.5527408999999999	77.2695341999999954	2020-06-13 09:08:45.067088+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c9a3301f-f8fe-469a-a271-6564f60d0edb.jpg	GIS/Processed/2020-06-13/dc9e33fd-5097-48e3-bb5d-fcd09f73b57c.jpg	0101000020E6100000D3895F0C405153405FA9786D808D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Okhla Industrial Estate Phase 3 Road	None	42, Okhla Industrial Estate Phase 3 Rd, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
ad80d473-f09d-4927-939c-76ef4314a9ef	1066	2	28.5587996000000004	77.2570563000000021	2020-06-13 09:08:46.205732+05:30	testworld	NDMC	GIS/Raw/2020-06-13/dffd4f1b-8e94-4a48-9cda-a0159a6bec1f.jpg	GIS/Processed/2020-06-13/9f1bbc06-e26e-4230-9e3a-2893d006cccc.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
6cd6598b-c63d-47bf-9761-6449aadc811c	11464	1	28.557732699999999	77.2590213999999946	2020-06-13 09:08:47.313075+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7998a7ce-c103-4fa3-a672-1e439d434ec5.jpg	GIS/Processed/2020-06-13/2ed3e5a5-9bd4-47b0-a771-6ee4688ca046.jpg	0101000020E6100000B47D7ECE93505340E768FA91C78E3C40	189	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	G Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	189, G Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
f88a9f49-62cb-4bcd-8cd6-39034b8b808b	1779	1	28.6949286000000008	77.2157595000000043	2020-06-13 09:08:48.408213+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c3c1514d-15ab-4b39-b719-aa6b02e51843.jpg	GIS/Processed/2020-06-13/1141448a-7380-49b3-b248-45dbac7f5382.jpg	0101000020E61000004913EF00CF4D5340190E3AD7E6B13C40	None	None	None	None	110007	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	The Mall Road	None	24/1, The Mall Rd, Banarsi Das Estate, Timarpur, Delhi, 110007, India	None	None
8bfff105-0ea4-42b5-b269-058071daf6a3	7910	2	28.553746799999999	77.2687501000000054	2020-06-13 09:08:49.539783+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b097d8e7-3a03-47cc-8a68-1dfcfeef4801.jpg	GIS/Processed/2020-06-13/f6d4c249-a282-4c50-989e-5bdd1b1739cd.jpg	0101000020E6100000FE929E3333515340C043AC59C28D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f1d32049-1684-429e-aed5-0d6c42b41718	850	1	28.5590742000000013	77.256635799999998	2020-06-13 09:08:50.682951+05:30	testworld	NDMC	GIS/Raw/2020-06-13/db2b5ffb-f0ee-4365-8e80-0c7c0d3e5724.jpg	GIS/Processed/2020-06-13/a3a01411-6834-40eb-aad1-1d8bf905fd24.jpg	0101000020E6100000E6FE8FB86C50534091099D7C1F8F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Hills Road	None	163, Hills Rd, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
b9524fa8-90a4-4388-8545-7c884e3aae91	266	1	28.6989783000000003	77.2178004999999956	2020-06-13 09:08:51.799685+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3dd999bc-6928-44eb-9500-e28060fb8e44.jpg	GIS/Processed/2020-06-13/5ef3c28d-b05f-4f6c-818a-26b2911aec1f.jpg	0101000020E61000005B238271F04D53401A1DEB3DF0B23C40	None	None	None	None	110054	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	Lucknow Road	None	69, Lucknow Rd, Banarsi Das Estate, Timarpur, Delhi, 110054, India	None	None
73ae8aec-e9f6-482f-951f-c532bdd5f643	5952	1	28.5528951000000006	77.2694204000000013	2020-06-13 09:08:52.950015+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c2e3c477-422c-4d0a-a91e-ba79af53c8b7.jpg	GIS/Processed/2020-06-13/41f16275-f6ca-4fc4-9414-6ed95101a28e.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
7aa98b2f-0808-4f7b-a01a-3831df0e8e74	4111	1	28.6921438000000002	77.2113099000000034	2020-06-13 09:08:54.104925+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e672920e-3bf7-4779-b6f2-2933d0de83a9.jpg	GIS/Processed/2020-06-13/2670ecc8-8f8a-4527-8686-5b00ee241eff.jpg	0101000020E61000008C74F519864D53401121095630B13C40	None	None	None	None	110007	None	None	None	Delhi University	None	None	None	None	New Delhi	None	Delhi	Central Delhi	None	None	None	India	None	Chhatra Marg	None	7, Chhatra Marg, Near Marinda House, Delhi University, New Delhi, Delhi 110007, India	None	None
069bc185-8a2e-438b-b34b-b3b43dc3c36d	5588	1	28.5519664999999989	77.2700648000000001	2020-06-13 09:08:55.186293+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6e3c55f7-9daf-4247-82c5-3739c1f0d525.jpg	GIS/Processed/2020-06-13/adda95df-ea50-4cef-87e0-4d156edd1e3d.jpg	0101000020E610000040F3DEBD48515340D2FC31AD4D8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
fad4353a-661f-48b5-8b80-2fe9b0ae0713	808	1	28.6896410999999993	77.2101147999999995	2020-06-13 09:08:56.320237+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bfe7f6e0-2b75-4abe-b15c-3694fb953f51.jpg	GIS/Processed/2020-06-13/3f10af08-f879-40a0-9ea7-3824061ef438.jpg	0101000020E6100000F5995885724D53403B7AB2518CB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
33cf21d9-04c0-435e-8098-3d5696428ba2	2017	1	28.5602829999999983	77.2567971	2020-06-13 09:08:57.426985+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8f2c25b0-ea10-4315-9167-8fe9a6e67b90.jpg	GIS/Processed/2020-06-13/0621070c-7489-4289-b341-8d6aa7fc6c63.jpg	0101000020E61000004A8D1A5D6F5053403881E9B46E8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	8-A C, Block Market, East Of Kailash, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
98ee80f3-4873-4e5e-80bf-b18ca5b11b25	10223	1	28.6914087000000002	77.2109190999999981	2020-06-13 09:08:58.540583+05:30	testworld	NDMC	GIS/Raw/2020-06-13/373c1b71-72d6-4c64-a755-98a7ff7b8efc.jpg	GIS/Processed/2020-06-13/94a8c467-e95f-4261-b514-f4f43904f479.jpg	0101000020E61000008326D3B27F4D53407DAB1A2900B13C40	None	None	None	None	110007	None	None	None	Delhi University	None	None	None	None	New Delhi	None	Delhi	Central Delhi	None	None	None	India	None	Chhatra Marg	None	7, Chhatra Marg, Near Marinda House, Delhi University, New Delhi, Delhi 110007, India	None	None
ca75c564-1e21-40dd-a031-f8edc8ee3f39	4175	1	28.5549657000000003	77.2655261000000024	2020-06-13 09:08:59.716877+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ffa8eb80-5d50-431c-8234-9180c3f07858.jpg	GIS/Processed/2020-06-13/bc7cd9f5-05d9-4d06-af82-37a15a0626ab.jpg	0101000020E610000001EF2E61FE505340D9E66B3B128E3C40	None	None	None	None	110065	None	None	None	Kalkaji	Shambhu Dayal Bagh	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	NSIC Okhla, Shambhu Dayal Bagh, Kalkaji, New Delhi, Delhi 110065, India	None	None
3fcb75d3-3cac-41b8-9fe3-a73e6061bb82	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:09:00.866308+05:30	testworld	NDMC	GIS/Raw/2020-06-13/82e01ec7-614f-4626-b876-234d82a69ef4.jpg	GIS/Processed/2020-06-13/78ba2968-fe79-4191-8294-a8da009f5280.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
0f93ac2f-f28e-4db7-b73d-06820f9c7693	14971	1	28.5596899999999998	77.256674799999999	2020-06-13 09:09:01.958617+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4b3a0d82-e0c2-480f-8b93-3353d1781d64.jpg	GIS/Processed/2020-06-13/2deef569-30c1-4ca9-a409-262bdf6be286.jpg	0101000020E610000045ED235C6D505340F3E505D8478F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B 167, Raja Dhirsain Marg, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
9ecf4886-4228-4b11-8221-2b3bba3756a6	1298	1	28.6954557000000001	77.2129579000000064	2020-06-13 09:09:03.119892+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7eec9ea5-4dc0-45f9-8481-7b9231fb1473.jpg	GIS/Processed/2020-06-13/596ec7b9-305d-4cf1-9098-9929ee470b5f.jpg	0101000020E610000031FB2B1AA14D534019517F6209B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
344b905e-9551-477a-a8c0-9373f1c4da4b	6231	1	28.5687220000000011	77.216097199999993	2020-06-13 09:09:04.302579+05:30	testworld	NDMC	GIS/Raw/2020-06-13/66060cbe-1e53-4e7c-8bda-d937c5a0e223.jpg	GIS/Processed/2020-06-13/2008ccbb-0bf5-4dab-acd0-27f164895722.jpg	0101000020E610000075B05989D44D53400684D6C397913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
23559f78-2572-49ce-b0e9-b6bdeea6d346	14971	1	28.5596899999999998	77.256674799999999	2020-06-13 09:09:05.465739+05:30	testworld	NDMC	GIS/Raw/2020-06-13/74fb2d41-7896-497c-b52c-153e16f6bb8b.jpg	GIS/Processed/2020-06-13/70930900-06e4-4c19-a7fe-3faa5c40e0e0.jpg	0101000020E610000045ED235C6D505340F3E505D8478F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B 167, Raja Dhirsain Marg, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
e5fefd58-2aeb-4eb2-9f12-775362bf9228	7672	2	28.5593746999999993	77.2564191000000022	2020-06-13 09:09:06.639837+05:30	testworld	NDMC	GIS/Raw/2020-06-13/93d33ff7-3e01-44dd-917d-a17aa9f8c205.jpg	GIS/Processed/2020-06-13/5ad36762-337d-4384-a843-991605c51914.jpg	0101000020E61000007724A82B69505340B6B52A2E338F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
d68bad78-7fb9-49dd-b32c-0ed64bc2e22e	1266	1	28.5537834000000004	77.268541600000006	2020-06-13 09:09:07.760998+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b746191c-066d-4769-98d1-be29b97702bf.jpg	GIS/Processed/2020-06-13/d1f2735d-1044-41ab-8ff3-a14011b3cc56.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
6121c219-da8f-438e-a9b6-b1f603c080cf	14971	1	28.5596899999999998	77.256674799999999	2020-06-13 09:09:08.864971+05:30	testworld	NDMC	GIS/Raw/2020-06-13/74965373-0059-4c5d-90a4-63dee6870c98.jpg	GIS/Processed/2020-06-13/53814fcb-d7c6-408d-a17e-8311860fcd46.jpg	0101000020E610000045ED235C6D505340F3E505D8478F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B 167, Raja Dhirsain Marg, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
049d98a5-833d-43c8-9862-8b37f068d856	14893	2	28.5532858000000012	77.2690819999999974	2020-06-13 09:09:09.938065+05:30	testworld	NDMC	GIS/Raw/2020-06-13/74ed71d7-5ecc-437c-bd0a-37d0f2ecaadf.jpg	GIS/Processed/2020-06-13/d9cb2971-69c2-4773-8a93-cf659d16e51c.jpg	0101000020E61000004E7CB5A33851534059576023A48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d1fee99f-5917-4153-8285-d83d10a84ea5	12523	1	28.6698896999999988	77.2101239999999933	2020-06-13 09:09:11.116442+05:30	testworld	NDMC	GIS/Raw/2020-06-13/97d41ef8-a337-4bf4-8bd0-d450ddbeb820.jpg	GIS/Processed/2020-06-13/bc89e543-326d-4a15-8aa4-f83a66cfcf5d.jpg	0101000020E6100000B306EFAB724D5340606D31E47DAB3C40	None	None	None	None	110007	None	None	None	Civil Lines	Kabir Basti	None	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Doctor Karnwal Road	None	Dr Karnwal Rd, Kabir Basti, Civil Lines, Delhi, 110007, India	None	None
d1eea755-8b81-4753-883a-3eb8af112909	10038	1	28.5592362999999985	77.2564471999999967	2020-06-13 09:09:12.31244+05:30	testworld	NDMC	GIS/Raw/2020-06-13/566ca310-84ec-4c56-87a7-b443e2289f28.jpg	GIS/Processed/2020-06-13/295603db-5427-4f70-8f3a-36cf3f326cdd.jpg	0101000020E6100000A64984A1695053406D3C331C2A8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
d8f42c6c-1b32-4ece-ac5c-fff6da603d36	850	1	28.5590742000000013	77.256635799999998	2020-06-13 09:09:13.42341+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c17770be-b59c-4770-b878-da2dc2bb2c81.jpg	GIS/Processed/2020-06-13/dba75213-182c-43bb-bac1-7edd27eee339.jpg	0101000020E6100000E6FE8FB86C50534091099D7C1F8F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Hills Road	None	163, Hills Rd, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
52cefd2e-9fe3-476b-9e66-cecebee7240a	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:09:14.553818+05:30	testworld	NDMC	GIS/Raw/2020-06-13/12001bcb-420b-4916-a7ec-f23bc3df27d5.jpg	GIS/Processed/2020-06-13/4f98efb7-5f75-48f2-8227-22dcf24ca69b.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
dd1aa845-0cb7-4bf4-abd6-025310d5b160	561	1	28.5575717000000004	77.2589052000000009	2020-06-13 09:09:15.686166+05:30	testworld	NDMC	GIS/Raw/2020-06-13/237fb55d-2b9d-4ef8-bd56-d30fdb9ad002.jpg	GIS/Processed/2020-06-13/087e5ded-c8a9-41a1-8fa4-511626b47380.jpg	0101000020E6100000EBB01DE791505340D5ACD804BD8E3C40	224	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	224, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
7a9d0ee5-9643-4779-b188-63ff97cd5708	10038	1	28.5592362999999985	77.2564471999999967	2020-06-13 09:09:16.838368+05:30	testworld	NDMC	GIS/Raw/2020-06-13/295b6c14-355a-4883-b536-687c46f142bb.jpg	GIS/Processed/2020-06-13/772949dd-df8f-4cff-9c1a-39066f6d554c.jpg	0101000020E6100000A64984A1695053406D3C331C2A8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
de0f9e2d-e989-4b28-84a2-4c5d9e451cf3	15403	4	28.5550135000000012	77.267458199999993	2020-06-13 09:09:17.963967+05:30	testworld	NDMC	GIS/Raw/2020-06-13/78ba0482-7d49-4596-89f0-e77546e502c2.jpg	GIS/Processed/2020-06-13/df296c6c-1f53-4f08-b586-c609e0834285.jpg	0101000020E61000000283FF081E515340A8565F5D158E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
38693962-27ad-4c23-82d4-729eb9684f80	19219	2	28.5551583999999998	77.2673513999999955	2020-06-13 09:09:19.045808+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0561281f-f6ef-4c9b-bdd0-7d6ac6c8f004.jpg	GIS/Processed/2020-06-13/caa632f0-f330-4c75-ad77-3ad5b2c12c93.jpg	0101000020E61000008CE20B491C515340851964DC1E8E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
80bb80da-293b-4664-a826-44712fa7cd09	6231	1	28.5687220000000011	77.216097199999993	2020-06-13 09:09:20.16027+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b3a1431e-97cd-4f0d-998f-100dd7a82ad4.jpg	GIS/Processed/2020-06-13/96d3c220-1fc4-4c98-b6c9-53215b3de2e3.jpg	0101000020E610000075B05989D44D53400684D6C397913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
801cddc5-e14b-40c8-b3ff-87f3f24d2787	850	1	28.5590742000000013	77.256635799999998	2020-06-13 09:09:21.324679+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0e5cb1c6-2eb7-47bd-85b7-308bff3636b1.jpg	GIS/Processed/2020-06-13/6616d08d-4f2b-4881-a4db-96d53e3b23fa.jpg	0101000020E6100000E6FE8FB86C50534091099D7C1F8F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Hills Road	None	163, Hills Rd, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
db812704-2803-4d03-934f-7d4506559068	14971	1	28.5596899999999998	77.256674799999999	2020-06-13 09:09:22.383857+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1a3476e6-8706-4996-a6d0-8fdee159472e.jpg	GIS/Processed/2020-06-13/74882e29-b407-47b2-85f4-a7f1d9f30dcd.jpg	0101000020E610000045ED235C6D505340F3E505D8478F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B 167, Raja Dhirsain Marg, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
47eb492f-0571-42bd-a1a1-0f2ac7d74d0b	1701	2	28.5591326999999993	77.2565472	2020-06-13 09:09:23.548826+05:30	testworld	NDMC	GIS/Raw/2020-06-13/860fc8b9-40f8-4fb1-b9d0-c2f987ecffec.jpg	GIS/Processed/2020-06-13/5a4fd31a-ab07-4076-a4f4-e48b302f7db5.jpg	0101000020E61000005878F2446B505340CA9F1452238F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	C Block Market, Esst of Kailash, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
6bfad0be-455f-47d2-bcba-95fbad3c7670	10038	1	28.5592362999999985	77.2564471999999967	2020-06-13 09:09:24.66125+05:30	testworld	NDMC	GIS/Raw/2020-06-13/31450d66-ab70-4bb8-a0b6-baf791f3ca5c.jpg	GIS/Processed/2020-06-13/512d1bdb-2a6f-4d0c-a518-306ddf5e0629.jpg	0101000020E6100000A64984A1695053406D3C331C2A8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
66afad86-6ce2-432f-bd96-b4b6187f64b1	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:09:25.778229+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d0fb4eed-1ca0-4ed7-a5d8-df407952c87e.jpg	GIS/Processed/2020-06-13/cd61fdf7-73ec-400f-81e4-f83d2f696672.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
66abdbf3-f5af-4d21-8e53-35de1c8f253e	6014	2	28.5512863999999986	77.2704427999999979	2020-06-13 09:09:26.873449+05:30	testworld	NDMC	GIS/Raw/2020-06-13/acb10b5a-d7a1-433f-8735-18e58bc53879.jpg	GIS/Processed/2020-06-13/e57c422a-d48f-442b-a984-093584447c9f.jpg	0101000020E6100000135C51EF4E515340C5BA021B218D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
21e3cd73-0f9d-4f12-aead-d2ddcd3e4f8f	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:09:27.963517+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a0ae74ce-dc03-4479-89ca-256e5e1ff79b.jpg	GIS/Processed/2020-06-13/98fa1d88-875f-4217-88ce-8a97b026f4d2.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
8253226b-dbc6-4b8e-b8e9-946476df4585	54332	1	28.6751512999999996	77.2171007999999972	2020-06-13 09:09:29.159183+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2766a749-270b-42e0-928f-888c74d5541a.jpg	GIS/Processed/2020-06-13/dcd330d1-22f1-42df-ab62-90829e4956d9.jpg	0101000020E6100000DEFBC0FAE44D5340155A31B7D6AC3C40	None	None	None	None	110054	None	None	None	Civil Lines	Ludlow Castle	None	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Bhiku Ram Jain Marg - Rajpur Road	None	16, Bhiku Ram Jain Marg - Rajpur Rd, Ludlow Castle, Civil Lines, Delhi, 110054, India	None	None
591346db-0b8c-47aa-8195-eca8d12241e3	1014	1	28.5650702999999986	77.2401416999999952	2020-06-13 09:09:30.247618+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7843df2a-2ce2-4f6e-902f-d667c6cdb49a.jpg	GIS/Processed/2020-06-13/f3e17744-2dfb-4cf9-985b-84b9a9ec6fc4.jpg	0101000020E6100000F9F94A7B5E4F5340DF707A72A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	12, Ring Road, Lajpat Nagar IV, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
49b44d9a-e7ae-4ed2-9581-85b92c3be53d	26871	1	28.5687139999999999	77.2161676000000057	2020-06-13 09:09:31.386898+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3e86a8ac-c727-4c0c-a966-f2b0b25fa82e.jpg	GIS/Processed/2020-06-13/9ddfc237-fae8-43c6-a35d-9b163b4951b1.jpg	0101000020E61000001C1DA1B0D54D534000C79E3D97913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
9022239a-9815-495c-9c3a-354e40cdd03d	14611	2	28.5527408999999999	77.2695341999999954	2020-06-13 09:09:32.478128+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e03a3e8e-dc0e-4db1-be19-9f966523cb6d.jpg	GIS/Processed/2020-06-13/ae7b8a2a-7589-4cfb-b794-12d4847eae5f.jpg	0101000020E6100000D3895F0C405153405FA9786D808D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Okhla Industrial Estate Phase 3 Road	None	42, Okhla Industrial Estate Phase 3 Rd, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
8b08cff3-54a4-4ca2-8bed-8b657b5148ec	7672	2	28.5593746999999993	77.2564191000000022	2020-06-13 09:09:33.596496+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0db97c36-d17d-4497-a896-005971646ec5.jpg	GIS/Processed/2020-06-13/4efe2799-8b38-4678-b5a0-299f61d0960c.jpg	0101000020E61000007724A82B69505340B6B52A2E338F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
04078b50-32a2-46d6-b8dc-ab0f4e5e0cd6	30595	1	28.5592345999999999	77.2564517999999936	2020-06-13 09:09:34.732595+05:30	testworld	NDMC	GIS/Raw/2020-06-13/11c057fe-89eb-44c4-af0a-309817bab1b6.jpg	GIS/Processed/2020-06-13/e3baa228-cd7d-4249-a8d1-93590ff336f9.jpg	0101000020E61000000580CFB469505340A9CAADFF298F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
11061dee-a6a6-4708-af5f-b0a1e8ce30fa	4312	1	28.5541742999999997	77.2681673000000018	2020-06-13 09:09:35.850408+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d45cb7b3-b7b2-43af-a91c-773703bc13bc.jpg	GIS/Processed/2020-06-13/c64e92b3-a761-47b9-9ba5-00d79d0b90fc.jpg	0101000020E6100000D3D62DA729515340A0C8EE5DDE8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
af8143b2-a558-4cc8-a492-d317a00f02e2	15403	4	28.5550135000000012	77.267458199999993	2020-06-13 09:09:36.959363+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2ba9a20d-3556-4fae-a88d-e08a0bd6b006.jpg	GIS/Processed/2020-06-13/99c68bca-0d60-4411-a517-a79d2d19071f.jpg	0101000020E61000000283FF081E515340A8565F5D158E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
90f568e8-fc10-4314-a588-c998d61389ad	3386	1	28.6926522999999989	77.2115629000000041	2020-06-13 09:09:38.127962+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e78a8992-1568-4dad-b0bf-3ef6fde79ab8.jpg	GIS/Processed/2020-06-13/a0a79450-1c1b-464d-9686-46104059d82b.jpg	0101000020E610000001231E3F8A4D5340CAFF3FA951B13C40	None	None	None	None	110007	None	None	None	Delhi University	None	None	None	None	New Delhi	None	Delhi	Central Delhi	None	None	None	India	None	Chhatra Marg	None	7, Chhatra Marg, Near Marinda House, Delhi University, New Delhi, Delhi 110007, India	None	None
7ec6bfdb-60ab-4ca1-9128-1b9a9d6c476f	15572	1	28.5544569999999993	77.2680718999999954	2020-06-13 09:09:39.32094+05:30	testworld	NDMC	GIS/Raw/2020-06-13/aafe837f-378d-4dbb-b9df-c69744ce6407.jpg	GIS/Processed/2020-06-13/39d8901c-72b2-4b6c-a50c-4daee136ddaa.jpg	0101000020E610000080DE0A1728515340CC09DAE4F08D3C40	15	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	15, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
288d554e-f276-47cc-bcce-a75b8ea5b693	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:09:40.448136+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d5280c92-730f-4704-abca-a00c945d835d.jpg	GIS/Processed/2020-06-13/d00a3dfb-6f19-42c9-ac1e-de1a8172662c.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e83d55ca-3db0-473b-ada9-8e6512c6f9d4	8330	1	28.5530350999999989	77.2693114000000065	2020-06-13 09:09:41.543463+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9b61404f-300a-4016-a0bb-2635f76c6436.jpg	GIS/Processed/2020-06-13/628ab048-6958-4de5-972d-b1fbaa87b7b3.jpg	0101000020E610000029DCE1653C515340430A54B5938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2cd83600-81cf-4812-be67-d5a1a0e1b576	23297	1	28.5526938000000001	77.2696562999999941	2020-06-13 09:09:42.671429+05:30	testworld	NDMC	GIS/Raw/2020-06-13/685b130c-73c2-4cbb-b159-992a82e61a24.jpg	GIS/Processed/2020-06-13/fc4b53c7-0893-45bd-96c0-8434edc4237c.jpg	0101000020E6100000436A7F0C42515340B4B343577D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
16deae9e-6097-43dd-825b-6d5d0c220f4a	1014	1	28.5650702999999986	77.2401416999999952	2020-06-13 09:09:43.765809+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4889bd31-d0ff-41df-bccf-8228749981f3.jpg	GIS/Processed/2020-06-13/bddcb990-bbf2-4291-896f-8dc2bc53ebd5.jpg	0101000020E6100000F9F94A7B5E4F5340DF707A72A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	12, Ring Road, Lajpat Nagar IV, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
b81f51fe-98fb-4356-9b03-538e439280bc	978	1	28.5650744000000003	77.2406931999999955	2020-06-13 09:09:44.817548+05:30	testworld	NDMC	GIS/Raw/2020-06-13/432c522a-10e7-4924-8a33-4b91eb553c9c.jpg	GIS/Processed/2020-06-13/65fa9c4b-6773-49e2-adcd-5aa42e230ecd.jpg	0101000020E6100000A7977384674F53408CCE43B7A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	None	Block O	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Gupta Market, Block O, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
cd6e8cdc-1c6c-4727-b0b8-62ec9ccf7c04	955	1	28.5613001000000004	77.2567616999999984	2020-06-13 09:09:45.923982+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5713ea9a-e779-44ad-954b-b4526000265a.jpg	GIS/Processed/2020-06-13/c9e211f4-0841-4269-b721-f5728e70bfdd.jpg	0101000020E61000006217A0C86E505340D5BD045DB18F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsen Marg	None	C 24, Raja Dhirsen Marg, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
5706801d-ee66-42b7-a3ba-ad160d90f0ff	1120	1	28.5525857000000016	77.2696487000000047	2020-06-13 09:09:46.983905+05:30	testworld	NDMC	GIS/Raw/2020-06-13/95a69f13-d711-4ddd-b421-1009b799d0de.jpg	GIS/Processed/2020-06-13/7f09675b-7cc3-41e0-a515-702384903dc0.jpg	0101000020E61000002CFA9EEC41515340BEBCA541768D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	208, Okhla, Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
2340df31-054e-4045-a041-57d47096dd4b	1066	2	28.5587996000000004	77.2570563000000021	2020-06-13 09:09:48.195658+05:30	testworld	NDMC	GIS/Raw/2020-06-13/85f302ed-1571-4103-aa73-ef969f41de9e.jpg	GIS/Processed/2020-06-13/3cb76300-fadb-499a-9cf5-1a78ae5b120a.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
b04f3324-4f44-4524-b309-45515ab32880	2798	1	28.5537834000000004	77.268541600000006	2020-06-13 09:09:49.305946+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f86c4dd4-327e-48f6-8d7a-6931d95f1181.jpg	GIS/Processed/2020-06-13/a45a96ce-502b-4910-910b-fb0f34d5d84b.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
161f15f9-f723-433e-8c61-5bf429f31d68	2607	1	28.562968699999999	77.2504545999999976	2020-06-13 09:09:50.389987+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b1684ebc-06eb-4e77-90e5-e862fb4624b7.jpg	GIS/Processed/2020-06-13/4335c0ff-fbbf-4d72-8d0b-141d4980aaac.jpg	0101000020E61000007F08BB7207505340F02B7BB71E903C40	None	None	None	None	110048	None	None	None	Sri Niwaspuri	Dayanand Colony	Block A	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Captain Gaur Marg	None	Captain Gaur Marg, Block A, Dayanand Colony, Sri Niwaspuri, New Delhi, Delhi 110048, India	None	None
bfbcb5f2-29e9-4efb-b7c8-36fdf42d946f	2798	1	28.5537834000000004	77.268541600000006	2020-06-13 09:09:51.507621+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fc55026a-1386-4cc9-97f3-35ec58be62a9.jpg	GIS/Processed/2020-06-13/6dd58fa0-db7d-4448-bdc3-afa65071170d.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e7211624-f959-4cfe-bb42-5620667c78f9	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:09:52.605085+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9d1d2cea-49f9-438b-b695-1f00e04f0371.jpg	GIS/Processed/2020-06-13/8d03eb00-69d0-4281-8147-55cc8f455444.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
cc518539-5a81-4583-9430-c952460bf95f	106546	1	28.6954485000000012	77.2129584999999992	2020-06-13 09:09:53.716458+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a366e6e6-1e44-4a34-9098-84f2dac41971.jpg	GIS/Processed/2020-06-13/a66d53f2-b35f-4f27-ac46-a90c34f302ba.jpg	0101000020E6100000EF39B01CA14D5340618DB3E908B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
133698a0-07d4-4bcc-8dee-6bfaff4fbcd7	15403	4	28.5550135000000012	77.267458199999993	2020-06-13 09:09:54.846548+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fa1c4e23-6131-41c9-9dfa-bf83f920341d.jpg	GIS/Processed/2020-06-13/377f53f3-4304-4ffd-afdb-e04f4a84eb82.jpg	0101000020E61000000283FF081E515340A8565F5D158E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b76631f9-a83f-43d0-a3ea-52bf9425fa29	1958	1	28.5595256000000006	77.2618808999999942	2020-06-13 09:09:55.929909+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5bbc7c5d-0d5e-411f-ac41-a7a363d1a0e3.jpg	GIS/Processed/2020-06-13/8c06416c-98f9-42c7-9e0c-af2d9405cb5c.jpg	0101000020E61000009C3C1BA8C25053405846D9113D8F3C40	None	None	None	None	110048	None	None	None	Bahapur	Shambhu Dayal Bagh	G Block	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Captain Gaur Marg	None	Captain Gaur Marg, G Block, Shambhu Dayal Bagh, Bahapur, New Delhi, Delhi 110048, India	None	None
25710999-73e1-4511-bd16-301ef2824bb1	24033	1	28.5546787000000002	77.2677402000000058	2020-06-13 09:09:57.035523+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4c99af18-f932-47b0-a85a-8a01926407b2.jpg	GIS/Processed/2020-06-13/285803cd-dc0d-4658-b7df-ed107bba3c82.jpg	0101000020E6100000C5B4CAA722515340AD495C6CFF8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
5ea390d6-0dc8-4466-aeda-c38a420447dc	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:09:58.196577+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b52c5b28-27f3-4937-a770-cc4a709e56d3.jpg	GIS/Processed/2020-06-13/26d2ca46-9375-4a06-93d8-38125fbadf4a.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
5864063c-2f26-489f-b7c1-21505e050e91	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:09:59.361247+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d1284ab7-ad79-4cd1-8879-62e82cd3035f.jpg	GIS/Processed/2020-06-13/ac66a15d-3e7d-44b6-93b1-fd13135fa273.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b3e33a68-0aeb-4208-9245-8e783c91257a	16388	1	28.5514362000000013	77.2703975000000014	2020-06-13 09:10:00.484736+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a6ff11a8-1d1c-4c15-9739-7d49f6824e00.jpg	GIS/Processed/2020-06-13/35cc1047-ee68-47c2-892e-d3294e743a33.jpg	0101000020E6100000E4DA50314E5153409DD43CEC2A8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
646a3399-468e-4f52-bd09-c0dcf781125d	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:10:01.609463+05:30	testworld	NDMC	GIS/Raw/2020-06-13/29e5d92d-e941-4d8f-9d4e-0b9c0258f56e.jpg	GIS/Processed/2020-06-13/70857168-ba00-40be-a606-b638d4acf75c.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
c76128e6-b623-4fe2-91a6-14f9600f1b69	6575	1	28.5587996000000004	77.2570563000000021	2020-06-13 09:10:02.724948+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ed2d5e80-e73c-485d-bc92-81a4649e6e6c.jpg	GIS/Processed/2020-06-13/f9fc1e97-21f6-4263-a53f-8b859a4c0173.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
0554769f-1203-4c6f-83fc-e87b19638941	978	1	28.5650744000000003	77.2406931999999955	2020-06-13 09:10:03.787454+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1fe16489-1c04-4993-bb3b-73541c4dd7c8.jpg	GIS/Processed/2020-06-13/32316b50-87c3-4ac2-a145-f0b4b4b51277.jpg	0101000020E6100000A7977384674F53408CCE43B7A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	None	Block O	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Gupta Market, Block O, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
6f5dbbfb-b7e7-471c-97db-25bb392ae296	5755	1	28.6730835999999982	77.2168446000000017	2020-06-13 09:10:04.944605+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1cad9cc2-f8f2-48a7-9716-d8222c04492e.jpg	GIS/Processed/2020-06-13/ed30aeb9-17d4-4b0c-b543-f4b5e7c989ef.jpg	0101000020E61000001C542CC8E04D53405479F1344FAC3C40	None	None	None	None	110054	None	None	None	Civil Lines	Kamla Nehru Ridge	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	MCD Store (Rajpur Road), Kamla Nehru Ridge, Civil Lines, Delhi, 110054, India	None	None
28893081-923e-455d-a0ae-96657482a555	1701	2	28.5591326999999993	77.2565472	2020-06-13 09:10:06.6202+05:30	testworld	NDMC	GIS/Raw/2020-06-13/98caa151-1a2f-40da-a91d-b743e4dcc52f.jpg	GIS/Processed/2020-06-13/d93d33d6-488c-403d-b592-b678e7d9a345.jpg	0101000020E61000005878F2446B505340CA9F1452238F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	C Block Market, Esst of Kailash, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
bf42589b-bb65-4d15-ae0c-6714c50c831f	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:10:07.780082+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b64b9de5-fb17-42f0-b937-f2a9cc3fb1e9.jpg	GIS/Processed/2020-06-13/b2dbab74-4ca7-437f-8f11-8dbc9492d1b2.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
75e650e6-3656-4db9-971b-9e69bb18720e	808	1	28.6896410999999993	77.2101147999999995	2020-06-13 09:10:08.970056+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2163298b-08a9-444f-8478-d859530807df.jpg	GIS/Processed/2020-06-13/57170281-32f9-416a-8396-a53bd0369abb.jpg	0101000020E6100000F5995885724D53403B7AB2518CB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
179bf513-a86a-48f5-bcdc-3f17f1f87a9e	73894	1	28.5552880000000009	77.2672706000000034	2020-06-13 09:10:10.071618+05:30	testworld	NDMC	GIS/Raw/2020-06-13/15516177-b378-465e-93c5-b4659e91c91a.jpg	GIS/Processed/2020-06-13/9e7cff2b-fc19-4013-bc9a-0e2a6073413f.jpg	0101000020E6100000AB8B25F61A5153407BDCB75A278E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
fb6380dd-0673-404a-9512-d9ba7851d88a	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:10:11.203357+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e2f0c38d-6db2-4c0a-a431-db7ddd6e3e79.jpg	GIS/Processed/2020-06-13/d6852c99-aec5-4cda-b6dd-5cdce8872b63.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
5be94248-5e84-4ffb-9477-a021efcf6bfc	2798	1	28.5537834000000004	77.268541600000006	2020-06-13 09:10:12.358686+05:30	testworld	NDMC	GIS/Raw/2020-06-13/841d7202-2e6e-4c82-a01e-e2d4b991e53d.jpg	GIS/Processed/2020-06-13/d58ffe96-c2b8-4e76-8bbe-56c8f6e32ee1.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
7e0e1dfd-0741-4d74-97dc-b13c7bbd5680	1014	1	28.5650702999999986	77.2401416999999952	2020-06-13 09:10:13.456441+05:30	testworld	NDMC	GIS/Raw/2020-06-13/78a54594-5cf1-43c8-99f4-0f276e4657b8.jpg	GIS/Processed/2020-06-13/7f34b378-b395-4d25-a99c-f9abbf64a3b4.jpg	0101000020E6100000F9F94A7B5E4F5340DF707A72A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	12, Ring Road, Lajpat Nagar IV, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
c6e474e6-6e24-4075-90c8-4b1bd17aa2d8	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:10:14.516995+05:30	testworld	NDMC	GIS/Raw/2020-06-13/cc36a657-b3d5-47f1-b517-e725a871c026.jpg	GIS/Processed/2020-06-13/9ed6da85-6c02-46c1-b24c-ebd140353b91.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
64cb784f-9da9-468a-ac94-3fb9db8669f1	6575	1	28.5587996000000004	77.2570563000000021	2020-06-13 09:10:15.580459+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e2764dea-c195-4860-908d-59c1cca742f4.jpg	GIS/Processed/2020-06-13/cc3edec7-e29c-4ce5-8ed8-55a987a74f07.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
f76509cb-0c48-4e5a-b066-12e794437008	978	1	28.5650744000000003	77.2406931999999955	2020-06-13 09:10:16.711189+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d4d94ad8-4666-4c87-9882-07c66d6512ce.jpg	GIS/Processed/2020-06-13/9e5672fe-85c6-4ea2-8a40-ca1c1c1d2c81.jpg	0101000020E6100000A7977384674F53408CCE43B7A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	None	Block O	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Gupta Market, Block O, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
b658d86e-caf8-469b-94f7-cd1cfe48167b	32384	1	28.565461599999999	77.2341555	2020-06-13 09:10:17.823665+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7bedeca4-213a-4489-a629-a521d27a254d.jpg	GIS/Processed/2020-06-13/e5e260c8-0c5f-4abe-8e75-e1d101209b54.jpg	0101000020E61000006DAB5967FC4E5340D2246717C2903C40	None	None	None	None	110049	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Mahatma Gandhi Marg	None	Mahatma Gandhi Marg, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110049, India	None	None
e536a726-da80-43e0-8c6f-83d886a5705a	15780	2	28.6954461000000016	77.2129616999999939	2020-06-13 09:10:18.899757+05:30	testworld	NDMC	GIS/Raw/2020-06-13/785c9aff-5d1c-49e9-9da1-dbb3f0784aeb.jpg	GIS/Processed/2020-06-13/d1f8530c-5a76-42e9-9bba-a0ce09c99a01.jpg	0101000020E61000003C331C2AA14D534079A16FC108B23C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	29/31, Chhatra Marg, Delhi, 110007, India	None	None
272059df-d1e8-4593-a776-4c3827dcbc0d	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:10:20.021364+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0a8b1b3a-b04c-49cb-a429-e7b7f99829b5.jpg	GIS/Processed/2020-06-13/cc8a98cf-1e9c-4da0-8335-882e97c879bc.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e1e8c9d4-d880-4243-8ff5-0464353247a3	11830	1	28.5607542999999993	77.260734400000004	2020-06-13 09:10:21.156628+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ea2e742f-ba52-44c5-bcf5-aa6a16bdaee2.jpg	GIS/Processed/2020-06-13/e7b7187e-6fe0-4ee5-8174-ad0149392bfa.jpg	0101000020E61000004D3C56DFAF505340649703988D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	G Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	S.N.P. Depot, G Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
846ba9ec-0bf2-47b5-b7e9-4aad0326ff40	8353	3	28.6887523999999985	77.209666900000002	2020-06-13 09:10:22.233076+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2ea80e89-50bc-4955-b4e5-2b43ca32789f.jpg	GIS/Processed/2020-06-13/3f1a215a-b6da-4a98-873e-aa6159a19781.jpg	0101000020E610000070A3B72E6B4D5340A00AC91352B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
2c674434-af0b-4d45-9610-6f1026ead718	8353	3	28.6887523999999985	77.209666900000002	2020-06-13 09:10:23.474238+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ccb9d4c1-413f-400a-9a00-c468b2ebcf37.jpg	GIS/Processed/2020-06-13/b6772c56-a77e-453f-ab93-71ae4de258b4.jpg	0101000020E610000070A3B72E6B4D5340A00AC91352B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
e592491a-f6d0-418c-ac7d-ff146534aad4	506	1	28.5542651999999997	77.2680239999999969	2020-06-13 09:10:24.6387+05:30	testworld	NDMC	GIS/Raw/2020-06-13/db6412b5-e367-4f3c-9668-6e403f9fb083.jpg	GIS/Processed/2020-06-13/d7c3bdda-0ac4-4c7f-b20e-13e2d33238d4.jpg	0101000020E6100000C2A2224E27515340974FFB52E48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
88f36e42-b398-45ee-93cd-b73d6b5286c2	2798	1	28.5537834000000004	77.268541600000006	2020-06-13 09:10:25.752258+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a2f4c41a-724f-4d21-b701-625352db28e8.jpg	GIS/Processed/2020-06-13/8ad9ca79-8064-497f-802a-b04a7b5f34b9.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
c65c99db-4fa5-426d-8de6-ef385301ca78	20412	1	28.6949816999999996	77.2127138000000031	2020-06-13 09:10:26.862458+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9dfd2fa4-8533-465b-ac51-ee2f9de9fa04.jpg	GIS/Processed/2020-06-13/6ea6e544-0b37-4083-9ee1-cd731532bc0d.jpg	0101000020E61000001B9A571A9D4D534088D11852EAB13C40	None	None	None	None	110007	None	None	None	None	None	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	chatra marg ke pass, NCR Delhi, Delhi, 110007, India	None	None
f48d3a3c-b825-46ef-be70-15deb3928d72	5745	3	28.5523272000000006	77.2699638999999934	2020-06-13 09:10:28.036809+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7f1ad014-8e7d-436d-8c3f-a3d02e721747.jpg	GIS/Processed/2020-06-13/851bb209-46fa-439f-ba06-9bb4edb8f762.jpg	0101000020E61000007066AA1647515340F6B0BC50658D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
a90f26d4-e684-464f-ac0c-fd3fc144967e	1101	1	28.5614008000000013	77.2597168000000067	2020-06-13 09:10:29.183628+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ab140fb3-483c-4b9c-9f32-784aa99a7955.jpg	GIS/Processed/2020-06-13/2d663113-545f-4ac8-a953-2f4caf64a7a7.jpg	0101000020E6100000328E36339F505340C0F27BF6B78F3C40	None	None	None	None	110065	None	None	None	Sri Niwaspuri	None	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	SNP Depot, Sri Niwaspuri, New Delhi, Delhi 110065, India	None	None
7d3e8d4a-2425-456d-9a30-ef98f5b995c8	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:10:30.311107+05:30	testworld	NDMC	GIS/Raw/2020-06-13/411f8683-819d-4b50-9b6d-0676e8588a63.jpg	GIS/Processed/2020-06-13/d65acd9c-ac2c-4af2-bbea-a3eac5a0f060.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f305f1b4-5687-4f19-96bc-cef17a0af6bb	16926	2	28.6941865999999983	77.2174124000000006	2020-06-13 09:10:31.431436+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5a50ef0e-4008-4a34-bc10-30ead1254343.jpg	GIS/Processed/2020-06-13/3739bb21-e5d8-4917-9098-ae94c3027976.jpg	0101000020E6100000ACEFB215EA4D534049528836B6B13C40	None	None	None	None	110009	None	None	None	Mukherjee Nagar	Hakikat Nagar	None	None	None	Delhi	None	Delhi	North West Delhi	None	None	None	India	None	The Mall Road	None	21/31, The Mall Rd, Hakikat Nagar, Mukherjee Nagar, Delhi, 110009, India	None	None
85ff6314-65d1-4f63-8f91-414ce2a4f956	1120	1	28.5525857000000016	77.2696487000000047	2020-06-13 09:10:32.662252+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a5304f66-c308-42d1-815d-bb89059e8cd2.jpg	GIS/Processed/2020-06-13/19188bcc-b066-4319-8e5a-148556f63ef0.jpg	0101000020E61000002CFA9EEC41515340BEBCA541768D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	208, Okhla, Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
55d48273-b790-4f2c-a29c-38e7684df981	1403	1	28.6941868000000007	77.2174088999999952	2020-06-13 09:10:33.927914+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9083f3f4-a13d-4fa0-8add-77e211ee1149.jpg	GIS/Processed/2020-06-13/4dff0de6-b114-4ae3-a5de-e46ee5032b11.jpg	0101000020E6100000FFD60407EA4D53409D50E339B6B13C40	None	None	None	None	110009	None	None	None	Mukherjee Nagar	Hakikat Nagar	None	None	None	Delhi	None	Delhi	North West Delhi	None	None	None	India	None	The Mall Road	None	21/31, The Mall Rd, Hakikat Nagar, Mukherjee Nagar, Delhi, 110009, India	None	None
05135454-dba7-4969-89ad-39111610d4fa	25268	1	28.6890897000000002	77.209867200000005	2020-06-13 09:10:35.085331+05:30	testworld	NDMC	GIS/Raw/2020-06-13/627ea5b7-f3d0-464b-8060-ed4ed6753647.jpg	GIS/Processed/2020-06-13/67a627c5-56e6-4f32-b776-f8dffbca1539.jpg	0101000020E61000003320D6766E4D5340AD82BD2E68B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
a3f15337-8556-4c33-89b5-1b781a6460ac	73894	1	28.5552880000000009	77.2672706000000034	2020-06-13 09:10:36.217159+05:30	testworld	NDMC	GIS/Raw/2020-06-13/17712f2d-3fd2-4f7c-a373-7f8ae3d4b209.jpg	GIS/Processed/2020-06-13/667beef1-024a-47d9-8484-e7a0084ddc0f.jpg	0101000020E6100000AB8B25F61A5153407BDCB75A278E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
cec264ca-4065-4bda-a9c2-f739f73dd7bc	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:10:37.360247+05:30	testworld	NDMC	GIS/Raw/2020-06-13/c29a078c-c232-4c3a-bd64-19e0ea5e6f21.jpg	GIS/Processed/2020-06-13/805a3ba7-8f61-4abd-aa36-49b6f19b952a.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
cf279a88-c93a-4855-b093-3cb9bdd148d1	8330	1	28.5530350999999989	77.2693114000000065	2020-06-13 09:10:38.465195+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ee4fe440-79cb-40b5-afec-3f6046c15806.jpg	GIS/Processed/2020-06-13/946a2e8a-d182-46e3-a2be-25ba73b5410e.jpg	0101000020E610000029DCE1653C515340430A54B5938D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e30922e7-2c32-49dc-8148-cdcf90b8c675	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:10:39.598736+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e9053983-2f52-4e50-ac6d-65ec4ae342ef.jpg	GIS/Processed/2020-06-13/0e7c5951-233c-4fdc-9587-a9a3f7d2a029.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
12c50eb1-5ce3-4bf9-97a8-c5da5babf779	11494	1	28.5510084000000006	77.2704793999999993	2020-06-13 09:10:40.741528+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a4d1837c-fd37-4bd9-b0e8-b9f31c527322.jpg	GIS/Processed/2020-06-13/d2f43fe3-8113-42fa-96dd-5369b82050c5.jpg	0101000020E6100000784FD4884F51534040D2F1E20E8D3C40	153	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	153, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f22d9da6-0bd4-4c2d-a7f9-53b6e8ced337	6197	2	28.6957163999999985	77.2130678999999986	2020-06-13 09:10:41.916469+05:30	testworld	NDMC	GIS/Raw/2020-06-13/64aaac00-66eb-4e2f-aee1-a33c81fa9cc5.jpg	GIS/Processed/2020-06-13/7041fc67-cfae-468f-830a-06269fd597da.jpg	0101000020E6100000F4948BE7A24D5340754A51781AB23C40	None	None	None	None	110007	None	None	None	Timarpur	Banarsi Das Estate	None	None	None	Delhi	None	Delhi	Central Delhi	None	None	None	India	None	None	None	Mahatma Gandhi Marg, Near GTB NAGAR, Banarsi Das Estate, Timarpur, Delhi, 110007, India	None	None
98e8b424-0dc9-4128-9a52-21520972881b	1014	1	28.5650702999999986	77.2401416999999952	2020-06-13 09:10:43.061375+05:30	testworld	NDMC	GIS/Raw/2020-06-13/900bfaa8-f2c0-472e-ac6a-99ff66f976ca.jpg	GIS/Processed/2020-06-13/29737e24-f48d-434e-b847-1104ace422a7.jpg	0101000020E6100000F9F94A7B5E4F5340DF707A72A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	12, Ring Road, Lajpat Nagar IV, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
b1cdd408-9b9e-4def-b15c-2323f586ef51	558	1	28.5535241000000006	77.2688576999999981	2020-06-13 09:10:44.171397+05:30	testworld	NDMC	GIS/Raw/2020-06-13/458dbfb7-5be0-42cd-ab51-b47113e09acb.jpg	GIS/Processed/2020-06-13/35bbd5d0-b1a1-42a4-ba67-7ae09688eb82.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d787e1e7-efb2-4995-ac9c-b7245848c83d	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:10:45.278083+05:30	testworld	NDMC	GIS/Raw/2020-06-13/bc11f3e3-2f77-436e-a397-125db99e1f88.jpg	GIS/Processed/2020-06-13/f21124a3-9da1-437d-93f0-3dde761e3ad2.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
db4bd727-470e-4caf-989a-4bc4403ed853	1014	1	28.5650702999999986	77.2401416999999952	2020-06-13 09:10:46.432034+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8e98219b-f47c-44ea-b8ec-c2793cfaefd7.jpg	GIS/Processed/2020-06-13/13a34f82-4839-4bb7-9b28-54b4db12fca2.jpg	0101000020E6100000F9F94A7B5E4F5340DF707A72A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	12, Ring Road, Lajpat Nagar IV, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
b03135ed-db97-4f94-ac07-543d71bea822	25694	4	28.6905773000000011	77.2105779999999982	2020-06-13 09:10:47.582603+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7dbde773-6a79-46b8-90f0-e0856184f4e0.jpg	GIS/Processed/2020-06-13/4c388c61-e532-48dc-abe5-91d365726950.jpg	0101000020E610000074D0251C7A4D534028DC86ACC9B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
fa7feba2-1f12-4055-b5c7-049aa8263b62	660	1	28.5534028000000006	77.2689687000000021	2020-06-13 09:10:48.69245+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2a4b8107-dd69-462b-ba8e-da7292db6774.jpg	GIS/Processed/2020-06-13/2e67da73-6417-41c7-9906-143c5fd5ec13.jpg	0101000020E610000073897EC836515340CC834FCEAB8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e398cc2f-0bc6-46fe-9aae-cebb4416f88d	1066	2	28.5587996000000004	77.2570563000000021	2020-06-13 09:10:49.823909+05:30	testworld	NDMC	GIS/Raw/2020-06-13/50cb3acc-913e-42b5-9009-2b5b0f50b2a8.jpg	GIS/Processed/2020-06-13/14b28c1f-0779-405f-8f42-c482bef05196.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
fee7e0ae-247f-4b69-b726-9a9340f7ff1d	25694	4	28.6905773000000011	77.2105779999999982	2020-06-13 09:10:51.004228+05:30	testworld	NDMC	GIS/Raw/2020-06-13/6c329cbe-9ace-4015-bfd2-a972c983d6b9.jpg	GIS/Processed/2020-06-13/7a4b1175-bce1-415c-b0dc-d450d161afe3.jpg	0101000020E610000074D0251C7A4D534028DC86ACC9B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
0a883919-bf02-4237-8481-4a138dd0e2fa	808	1	28.6896410999999993	77.2101147999999995	2020-06-13 09:10:52.298008+05:30	testworld	NDMC	GIS/Raw/2020-06-13/fb45379b-571e-4fc8-be89-a617e332d8e8.jpg	GIS/Processed/2020-06-13/0d7a7bc9-38a7-4a12-aaed-9f42d6703550.jpg	0101000020E6100000F5995885724D53403B7AB2518CB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
3c73b05d-3d58-41e7-ae09-109a39b52478	8218	2	28.5543142000000003	77.2678903999999989	2020-06-13 09:10:53.441701+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4df7c668-087c-401f-9097-89ce7fe3ad54.jpg	GIS/Processed/2020-06-13/fe76202b-0bf3-4f51-a3ee-7f48cedcd29c.jpg	0101000020E610000064BAC61D255153405AB51089E78D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
22a47566-191e-4783-85b7-79d81950ca49	517	2	28.688948700000001	77.2098069000000038	2020-06-13 09:10:54.642304+05:30	testworld	NDMC	GIS/Raw/2020-06-13/08dec895-8fd1-4555-a0fa-867a03eec47f.jpg	GIS/Processed/2020-06-13/9c6b4b2e-0577-4d7d-845b-1f44840aae06.jpg	0101000020E6100000697EEB796D4D5340291F27F15EB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
c690dd30-bd44-40a8-9919-07acfd6d489f	1066	2	28.5587996000000004	77.2570563000000021	2020-06-13 09:10:55.796693+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8305e4f0-ab74-4e01-9c90-dff6aad3238b.jpg	GIS/Processed/2020-06-13/40cbdd19-b27b-4bb9-aac4-d057ab39b0fb.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
97303cfc-d530-4dc8-a5bb-7fbf5e2e45a4	7045	1	28.5592559000000001	77.2563219999999973	2020-06-13 09:10:56.906758+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4b2f07bf-6f9f-4fb6-9b21-0064fec25e6d.jpg	GIS/Processed/2020-06-13/3c02743e-593d-46d9-b900-e7643a8fd456.jpg	0101000020E6100000B3CF639467505340559808652B8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
9058febb-5576-440f-bd32-370f182e8199	25268	1	28.6890897000000002	77.209867200000005	2020-06-13 09:10:58.002599+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3ebd204a-4606-4f25-811a-d1b5376f34dd.jpg	GIS/Processed/2020-06-13/f75a59bf-56c8-4eb1-8fe5-2052af41e2f1.jpg	0101000020E61000003320D6766E4D5340AD82BD2E68B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
304f01f0-3c6e-49e1-9876-2bbb216cd79c	8353	3	28.6887523999999985	77.209666900000002	2020-06-13 09:10:59.252098+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b7b08002-6df4-48a4-b113-ea6da1e29e73.jpg	GIS/Processed/2020-06-13/4191b804-ea74-4028-96b1-b178646b425a.jpg	0101000020E610000070A3B72E6B4D5340A00AC91352B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
dd29babf-181d-42e4-bb76-9524ca044fff	6575	1	28.5587996000000004	77.2570563000000021	2020-06-13 09:11:00.385982+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3add506a-cbce-4cb6-9bda-4157857b98ad.jpg	GIS/Processed/2020-06-13/7cc1930a-6a33-4706-ad00-33a0a5cd16de.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
a3f8d0bd-cf6c-4131-a10d-05d74827fc9c	30595	1	28.5592345999999999	77.2564517999999936	2020-06-13 09:11:01.511022+05:30	testworld	NDMC	GIS/Raw/2020-06-13/931be489-8ee7-4164-b9af-7dc313697020.jpg	GIS/Processed/2020-06-13/de18e082-3d1d-49c0-ad56-202df48b046b.jpg	0101000020E61000000580CFB469505340A9CAADFF298F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
249480c5-204f-44e7-88d4-53b66fccc5fc	660	1	28.5534028000000006	77.2689687000000021	2020-06-13 09:11:02.57836+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8e07411f-1b5a-415e-8ae0-93e8eb4fc07d.jpg	GIS/Processed/2020-06-13/839fd6e2-0b7a-4458-a963-46350cb635aa.jpg	0101000020E610000073897EC836515340CC834FCEAB8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
97e65b33-79a4-44d1-a49d-07cba56f5b50	872	1	28.5524486999999993	77.2697663000000006	2020-06-13 09:11:03.688719+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8a329038-3397-4656-bbbd-36bda4fbd45a.jpg	GIS/Processed/2020-06-13/be111215-4841-42d3-bfdf-09baf9b5ccce.jpg	0101000020E61000000704DFD943515340BC372B476D8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
eff964ae-7049-4816-9d37-3d231e9c6b4e	81021	3	28.5543951999999983	77.2677213000000052	2020-06-13 09:11:04.775375+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3dc6f883-8716-42fc-b610-5ab9301ffc26.jpg	GIS/Processed/2020-06-13/6cd7bc67-3b30-4245-8052-dcc860fb1333.jpg	0101000020E610000054FC845822515340330F05D8EC8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane B	None	Okhla Phase III Lane B, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
14b90045-077e-4691-a65a-e4f1a8609d12	26871	1	28.5687139999999999	77.2161676000000057	2020-06-13 09:11:05.871857+05:30	testworld	NDMC	GIS/Raw/2020-06-13/589e8131-84f3-4b25-83b5-7f3a325f8e3a.jpg	GIS/Processed/2020-06-13/e75a90cb-c98e-48bc-9dbf-f9714d03e42f.jpg	0101000020E61000001C1DA1B0D54D534000C79E3D97913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
ef3feafd-3376-4ea2-b61d-3f99144bb9b8	978	1	28.5650744000000003	77.2406931999999955	2020-06-13 09:11:06.944894+05:30	testworld	NDMC	GIS/Raw/2020-06-13/8eec0792-ae1f-4dfa-959a-cc946dad757c.jpg	GIS/Processed/2020-06-13/b837e246-0852-4833-aed3-967527743ac1.jpg	0101000020E6100000A7977384674F53408CCE43B7A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	None	Block O	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Gupta Market, Block O, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
00995b78-f480-4f2c-991c-e477c0195bf7	24033	1	28.5546787000000002	77.2677402000000058	2020-06-13 09:11:08.01592+05:30	testworld	NDMC	GIS/Raw/2020-06-13/41dd0d11-4394-4738-b006-eacefce79b09.jpg	GIS/Processed/2020-06-13/cd2b7684-5d39-4555-8b33-18aa8f106ba3.jpg	0101000020E6100000C5B4CAA722515340AD495C6CFF8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
3395daee-5fd6-40d0-9d6d-facd859c1bbd	735	1	28.6907683999999996	77.2160472000000055	2020-06-13 09:11:09.158822+05:30	testworld	NDMC	GIS/Raw/2020-06-13/90ac7c82-a882-4618-babb-bc8546b783f3.jpg	GIS/Processed/2020-06-13/b3c6334b-b43e-4e18-9c24-33d222b32fc5.jpg	0101000020E61000001D99A2B7D34D5340391CA732D6B03C40	15	None	None	None	110007	None	None	None	Civil Lines	Kamla Nehru Ridge	None	None	None	Delhi	None	Delhi	East Delhi	None	None	None	India	None	None	None	15, Kamla Nehru Ridge, Civil Lines, Delhi, 110007, India	None	None
ad420aa6-5245-4481-aac7-7e9b73cda210	14971	1	28.5596899999999998	77.256674799999999	2020-06-13 09:11:10.220381+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7024eff4-e0ca-4d89-a219-56d58e77d8f8.jpg	GIS/Processed/2020-06-13/37f0053c-4e54-4347-b26f-4a193f40ccac.jpg	0101000020E610000045ED235C6D505340F3E505D8478F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B 167, Raja Dhirsain Marg, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
8baafd0e-ee3a-4ea5-b458-7dee86ac78aa	24431	4	28.5528951000000006	77.2694204000000013	2020-06-13 09:11:11.357509+05:30	testworld	NDMC	GIS/Raw/2020-06-13/cac836ca-ebe3-4676-86cf-f9b3d302bb5f.jpg	GIS/Processed/2020-06-13/d0b61352-f1a5-4791-9df8-a42f95fdc7bb.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
a45f61fd-9fd5-4a12-84eb-76dbd917dede	955	1	28.5613001000000004	77.2567616999999984	2020-06-13 09:11:12.481079+05:30	testworld	NDMC	GIS/Raw/2020-06-13/5aece6f4-35e1-476a-bdf0-7dbac214498e.jpg	GIS/Processed/2020-06-13/c3400681-c80d-4adb-8004-10b3a0c0beec.jpg	0101000020E61000006217A0C86E505340D5BD045DB18F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsen Marg	None	C 24, Raja Dhirsen Marg, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
9f714265-c076-4648-8fff-5572ab24265c	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:11:13.588613+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ff089b37-3e5d-4ffd-8ef7-ccac019f0344.jpg	GIS/Processed/2020-06-13/295bccfd-8505-4c22-8986-27f6883200a8.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
fa82aab2-7114-4c9e-aa0f-b6a1768b72fe	98013	2	28.699966400000001	77.2167795000000012	2020-06-13 09:11:14.707352+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1e7732fd-ce5b-443e-b3a5-6db5b14badef.jpg	GIS/Processed/2020-06-13/060a46c2-52a0-40da-a541-7cb190c64691.jpg	0101000020E61000005EBC1FB7DF4D5340824C7CFF30B33C40	None	None	None	None	110007	None	None	None	Timarpur	None	None	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Unnamed Road	None	Unnamed Road, Timarpur, Delhi, 110007, India	None	None
ea27f7d1-81ff-4324-8174-4a9a25943d95	7910	2	28.553746799999999	77.2687501000000054	2020-06-13 09:11:15.883757+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ee2812f6-bbd8-48e2-a66e-d1f7e0ec0e71.jpg	GIS/Processed/2020-06-13/5c372135-8a64-4cd2-912b-8f8135317a6a.jpg	0101000020E6100000FE929E3333515340C043AC59C28D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
e744c701-da41-4443-aaeb-d8f49836dedd	68931	1	28.5547713999999999	77.2676708999999988	2020-06-13 09:11:17.042417+05:30	testworld	NDMC	GIS/Raw/2020-06-13/f4d0e858-fe3a-4a0c-85f6-ae1f2fcdb6cb.jpg	GIS/Processed/2020-06-13/7b257d8c-71f9-4f5a-9e09-f9c311b825be.jpg	0101000020E6100000D16520852151534092C19B7F058E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
fd7134ec-f072-4f6f-a91c-67c7d18f3b7a	1363	1	28.6692372000000013	77.2098594999999932	2020-06-13 09:11:18.228363+05:30	testworld	NDMC	GIS/Raw/2020-06-13/d119a57f-f8a9-479d-b73a-c68804ba70f5.jpg	GIS/Processed/2020-06-13/ef021da6-1f19-4a44-abac-351eda356f4c.jpg	0101000020E610000050508A566E4D534041440F2153AB3C40	None	None	None	None	110007	None	None	None	Civil Lines	Kabir Basti	None	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Doctor Karnwal Road	None	Dr Karnwal Rd, Kabir Basti, Civil Lines, Delhi, 110007, India	None	None
110ec637-675a-46f1-bd5c-4616c79351dc	8353	3	28.6887523999999985	77.209666900000002	2020-06-13 09:11:19.476938+05:30	testworld	NDMC	GIS/Raw/2020-06-13/0907e41b-d045-4866-8f73-a66d2c423abb.jpg	GIS/Processed/2020-06-13/645eec4e-895d-406c-bde7-4616068b9d31.jpg	0101000020E610000070A3B72E6B4D5340A00AC91352B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
60394682-5331-4da8-839c-c2d68143a1fc	5723	1	28.6907266000000014	77.2106009000000029	2020-06-13 09:11:20.735285+05:30	testworld	NDMC	GIS/Raw/2020-06-13/9c2b61ef-9acd-4a56-b154-9ff619dc7260.jpg	GIS/Processed/2020-06-13/8c61eb9b-a24d-4799-b7b5-996abe0421a5.jpg	0101000020E61000008680327C7A4D53402F7A5D75D3B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
d64a24a7-c69d-4804-9675-5ac6c44954ce	5588	1	28.5519664999999989	77.2700648000000001	2020-06-13 09:11:21.872729+05:30	testworld	NDMC	GIS/Raw/2020-06-13/91e7859e-23ac-4342-bb85-35fa9aca85d5.jpg	GIS/Processed/2020-06-13/262d4dc6-c0a5-402d-ba59-51d982fbe53f.jpg	0101000020E610000040F3DEBD48515340D2FC31AD4D8D3C40	249/A	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	249/A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
77aee01e-ebcc-47e0-b1ac-1024b6b196dc	558	1	28.5535241000000006	77.2688576999999981	2020-06-13 09:11:22.96671+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1ba42bd4-154c-4428-92e4-4678cfde3e98.jpg	GIS/Processed/2020-06-13/a77ed8d6-9a83-448b-8126-69a9daaa32b3.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
1f37bfec-0661-4e5d-972d-7a4de22fad8c	6231	1	28.5687220000000011	77.216097199999993	2020-06-13 09:11:24.032956+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2a1d6d4c-5acb-4f06-89c6-e3687126019e.jpg	GIS/Processed/2020-06-13/2ec6e4ef-75ae-4809-adaa-914c337d5d60.jpg	0101000020E610000075B05989D44D53400684D6C397913C40	None	None	None	None	110023	None	None	None	Kidwai Nagar	East Kidwai Nagar	Block B	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	South Extension Bus Stop(ICICI Bank), Block B, East Kidwai Nagar, Kidwai Nagar, New Delhi, Delhi 110023, India	None	None
9d5d1769-6c01-40bf-b5be-8522e7e3208e	16083	2	28.5535241000000006	77.2688576999999981	2020-06-13 09:11:25.167001+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4ffb225a-8e7f-48da-aeea-166729a6d8a1.jpg	GIS/Processed/2020-06-13/ae01d21c-da02-492c-8d62-1ad98dae51c6.jpg	0101000020E6100000C731EDF6345153403F0C63C1B38D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
b508a7c2-6363-4004-b5c0-e0de419ac192	6575	1	28.5587996000000004	77.2570563000000021	2020-06-13 09:11:26.306375+05:30	testworld	NDMC	GIS/Raw/2020-06-13/a2dd715f-ff0f-43f7-aec9-e3639c6f4e4c.jpg	GIS/Processed/2020-06-13/7a0f705b-66d9-4abd-93af-cc8fddbaca8b.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
0745ff97-024b-4eb5-813a-77f5c8011aa3	7160	1	28.5531581999999986	77.269192799999999	2020-06-13 09:11:27.35331+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1ab079ca-3878-4386-9d9f-74dbef280249.jpg	GIS/Processed/2020-06-13/2c2ce562-fa9b-432f-9422-739873b07f68.jpg	0101000020E6100000651470743A515340A4839AC69B8D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	35, Okhla Phase III, Okhla Industrial Area, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
38851c89-f83e-492e-9256-6b04f2eebfdb	517	2	28.688948700000001	77.2098069000000038	2020-06-13 09:11:28.586967+05:30	testworld	NDMC	GIS/Raw/2020-06-13/29bc70bc-862a-4605-b3a3-0d2b52b5e30f.jpg	GIS/Processed/2020-06-13/cfb5a010-1af1-4850-bdbe-00f24cb88d6b.jpg	0101000020E6100000697EEB796D4D5340291F27F15EB03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
f4ef0c09-c76d-4bc2-a389-ebdd84a87647	850	1	28.5590742000000013	77.256635799999998	2020-06-13 09:11:29.769171+05:30	testworld	NDMC	GIS/Raw/2020-06-13/68e1244a-b7f2-4f37-a6ce-720dc5ccdbba.jpg	GIS/Processed/2020-06-13/5ca65fda-2545-4363-9ad0-82a386e37794.jpg	0101000020E6100000E6FE8FB86C50534091099D7C1F8F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Hills Road	None	163, Hills Rd, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
eeffed38-6442-44cd-be3b-86157b373081	8218	2	28.5543142000000003	77.2678903999999989	2020-06-13 09:11:30.897966+05:30	testworld	NDMC	GIS/Raw/2020-06-13/1f90aa9f-1752-4a6f-90c4-047560ccffba.jpg	GIS/Processed/2020-06-13/af71a3a1-35cb-4810-ac8d-563e4ee0b10e.jpg	0101000020E610000064BAC61D255153405AB51089E78D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
d2c397ef-c180-45cc-a805-4dbb3e2ec4b3	1066	2	28.5587996000000004	77.2570563000000021	2020-06-13 09:11:31.935393+05:30	testworld	NDMC	GIS/Raw/2020-06-13/2b2f8215-a1ca-4093-96f9-3d404e2bc8db.jpg	GIS/Processed/2020-06-13/6d3be9ab-84d6-4720-8d4c-a907f4338387.jpg	0101000020E6100000C56E449C735053409404977D0D8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	C Block	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Hills Road	None	C 154, Hills Rd, C Block, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
71cd548d-74d0-4eb4-9d87-a7630c0243e8	978	1	28.5650744000000003	77.2406931999999955	2020-06-13 09:11:32.976708+05:30	testworld	NDMC	GIS/Raw/2020-06-13/e2a2fa24-3cf9-49d1-8de3-fbda2db2429c.jpg	GIS/Processed/2020-06-13/c7300a5d-c7cd-4508-a233-dc2e5c614c3e.jpg	0101000020E6100000A7977384674F53408CCE43B7A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	None	Block O	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Gupta Market, Block O, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
2ea188f4-2c95-4f71-b20c-7b1e8f5efe17	10038	1	28.5592362999999985	77.2564471999999967	2020-06-13 09:11:34.101207+05:30	testworld	NDMC	GIS/Raw/2020-06-13/3b84fae6-417e-4bff-b969-140acb65ca01.jpg	GIS/Processed/2020-06-13/8a13aed8-b54f-4c6e-a6f3-d17bd73d6e8a.jpg	0101000020E6100000A64984A1695053406D3C331C2A8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
8bc24797-1d0d-46ff-8778-8c82413c3aba	1014	1	28.5650702999999986	77.2401416999999952	2020-06-13 09:11:35.190382+05:30	testworld	NDMC	GIS/Raw/2020-06-13/25504975-5b9c-4c2c-924b-017198d3924d.jpg	GIS/Processed/2020-06-13/131134a8-704d-4650-9953-315be09cf5ea.jpg	0101000020E6100000F9F94A7B5E4F5340DF707A72A8903C40	None	None	None	None	110024	None	None	None	Lajpat Nagar	Lajpat Nagar IV	Vikram Vihar	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	12, Ring Road, Lajpat Nagar IV, Vikram Vihar, Lajpat Nagar IV, Lajpat Nagar, New Delhi, Delhi 110024, India	None	None
48c8c3f1-dbdd-45a8-a9a2-26b6d9831523	5952	1	28.5528951000000006	77.2694204000000013	2020-06-13 09:11:36.248931+05:30	testworld	NDMC	GIS/Raw/2020-06-13/4a7b64b0-8916-4033-b7a5-d5beaf3506ce.jpg	GIS/Processed/2020-06-13/89b50f08-5496-4ae2-9a05-4ace73a5a32a.jpg	0101000020E610000004B80F2F3E515340609E84888A8D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
936aec33-9c2a-44e5-9140-9dc7aeea0490	2569	1	28.6941865000000007	77.2174102999999974	2020-06-13 09:11:37.382069+05:30	testworld	NDMC	GIS/Raw/2020-06-13/993774ce-ea68-4bf0-8546-30cbc2dea48d.jpg	GIS/Processed/2020-06-13/4746f593-35d1-4363-967f-18d08051c5a8.jpg	0101000020E61000001114E40CEA4D534020D3DA34B6B13C40	None	None	None	None	110009	None	None	None	Mukherjee Nagar	Hakikat Nagar	None	None	None	Delhi	None	Delhi	North West Delhi	None	None	None	India	None	The Mall Road	None	21/31, The Mall Rd, Hakikat Nagar, Mukherjee Nagar, Delhi, 110009, India	None	None
89cc43f5-9728-430b-9ef6-ea3a656a5e7d	15403	4	28.5550135000000012	77.267458199999993	2020-06-13 09:11:38.502543+05:30	testworld	NDMC	GIS/Raw/2020-06-13/35af4b26-25ff-45e8-b9b4-23f084490b74.jpg	GIS/Processed/2020-06-13/c774dfc5-f4b7-4745-978c-d32d90f26b6f.jpg	0101000020E61000000283FF081E515340A8565F5D158E3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
f1dcf6d3-d53f-4b4c-9bcb-451285960d9f	10038	1	28.5592362999999985	77.2564471999999967	2020-06-13 09:11:39.61383+05:30	testworld	NDMC	GIS/Raw/2020-06-13/ca9a2c6b-0d1b-4ead-b86a-3f10db33ca9b.jpg	GIS/Processed/2020-06-13/bdba46ab-65d7-44cc-bf2f-0ae1aab242ee.jpg	0101000020E6100000A64984A1695053406D3C331C2A8F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	None	None
283be71b-653f-403b-adb6-dccd8b8a1f91	4239	2	28.6887676999999996	77.2096820999999949	2020-06-13 09:11:40.792274+05:30	testworld	NDMC	GIS/Raw/2020-06-13/7c8eff6e-1a17-4ac3-9dc0-ef318e0c4a05.jpg	GIS/Processed/2020-06-13/4f48b9f6-85ac-45f2-a607-4c7d0c389c83.jpg	0101000020E61000009F83786E6B4D5340880A7A1453B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
94ec8710-1aff-44d5-8ad0-b1107b175951	14971	1	28.5596899999999998	77.256674799999999	2020-06-13 09:11:41.911271+05:30	testworld	NDMC	GIS/Raw/2020-06-13/eb9770f7-a561-4103-9584-cb5129abff46.jpg	GIS/Processed/2020-06-13/6bdd58c0-52e2-426f-9dc4-c1c431da34bc.jpg	0101000020E610000045ED235C6D505340F3E505D8478F3C40	None	None	None	None	110048	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B 167, Raja Dhirsain Marg, B Block, East of Kailash, New Delhi, Delhi 110048, India	None	None
28cbba89-70cc-4c38-8d99-e39783a4f973	4239	2	28.6887676999999996	77.2096820999999949	2020-06-13 09:11:43.066151+05:30	testworld	NDMC	GIS/Raw/2020-06-13/b7ab7827-8574-405e-b969-c631eddc7906.jpg	GIS/Processed/2020-06-13/426bdadb-a9a7-43f1-8be4-0697d7c5d231.jpg	0101000020E61000009F83786E6B4D5340880A7A1453B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
82e37ec4-0814-4175-9166-de875109501c	8218	2	28.5543142000000003	77.2678903999999989	2020-06-13 09:11:44.210456+05:30	testworld	NDMC	GIS/Raw/2020-06-13/12e65ee6-00bc-4433-b48c-705fab8141fc.jpg	GIS/Processed/2020-06-13/94b56cfb-bb1c-4cda-bdff-d238fed0e44a.jpg	0101000020E610000064BAC61D255153405AB51089E78D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South Delhi	None	None	None	India	None	Okhla Phase III Lane A	None	Okhla Phase III Lane A, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
c01179ec-1549-4827-8ddd-a7ad8a29cf3e	14893	2	28.5532858000000012	77.2690819999999974	2020-06-13 09:11:45.350597+05:30	testworld	NDMC	GIS/Raw/2020-06-13/00900c75-0266-4d11-8997-1b3e109822d8.jpg	GIS/Processed/2020-06-13/d5ce7b4a-cff0-465c-9475-dd030345cdf8.jpg	0101000020E61000004E7CB5A33851534059576023A48D3C40	None	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	Plot No.29 front of Jhpiego India, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	None	None
7545cae3-1766-42c1-92f3-d3b148dee61d	1701	2	28.5591326999999993	77.2565472	2020-06-13 09:11:46.539214+05:30	testworld	NDMC	GIS/Raw/2020-06-13/21db199c-0c91-4199-890a-0ada2363efea.jpg	GIS/Processed/2020-06-13/68599967-5e90-4365-a65c-b0123c478127.jpg	0101000020E61000005878F2446B505340CA9F1452238F3C40	None	None	None	None	110065	None	None	None	East of Kailash	Kailash Hills	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	C Block Market, Esst of Kailash, Kailash Hills, East of Kailash, New Delhi, Delhi 110065, India	None	None
6fb48d3c-f7c5-4a06-a89b-6b40fb8404c8	4239	2	28.6887676999999996	77.2096820999999949	2020-06-13 09:11:47.657384+05:30	testworld	NDMC	GIS/Raw/2020-06-13/72f5cd9c-907f-492e-b381-f1108f02141a.jpg	GIS/Processed/2020-06-13/7c7778ad-0511-45dd-9866-3f629d0968d4.jpg	0101000020E61000009F83786E6B4D5340880A7A1453B03C40	None	None	None	None	110007	None	None	None	None	University Enclave	Art Faculty	None	None	Delhi	None	Delhi	North Delhi	None	None	None	India	None	Chhatra Marg	None	Chhatra Marg, Art Faculty, University Enclave, Delhi, 110007, India	None	None
86da57ed-fde4-4693-96e9-b2dfa2b284bf	5326	1	28.6941713000000007	77.2174373000000003	2020-06-13 09:11:48.853435+05:30	testworld	NDMC	GIS/Raw/2020-06-13/93df8025-4aa4-45d8-894c-a4135131c2eb.jpg	GIS/Processed/2020-06-13/69cd4f73-7117-42b1-9e50-d7cd6b065cf9.jpg	0101000020E61000008E1B237EEA4D53406252D735B5B13C40	None	None	None	None	110009	None	None	None	Mukherjee Nagar	Hakikat Nagar	None	None	None	Delhi	None	Delhi	North West Delhi	None	None	None	India	None	The Mall Road	None	21/31, The Mall Rd, Hakikat Nagar, Mukherjee Nagar, Delhi, 110009, India	None	None
bbadcf7e-4224-41b2-a26d-0173a2445702	7672	2	28.5593746999999993	77.2564191000000022	2020-06-17 20:13:45.963062+05:30	testworld	NDMC	GIS/Raw/2020-06-17/6f3c60ff-4187-4ef9-af32-cb68951cb2d4.jpg	GIS/Processed/2020-06-17/bef62b22-60a7-45ec-b3e2-21225a93b503.jpg	0101000020E61000007724A82B69505340B6B52A2E338F3C40	None	None	None	None	110065	None	None	None	East of Kailash	B Block	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	Raja Dhirsain Marg	None	B-162,At Eden Hospital first floor, Raja Dhirsain Marg, opposite Co-living Space - Kailash Hills, B Block, East of Kailash, New Delhi, Delhi 110065, India	https://storage.googleapis.com/gis_receiving_pothole_image_bucket/GIS/Processed/2020-06-17/bef62b22-60a7-45ec-b3e2-21225a93b503.jpg?Expires=3169205026&GoogleAccessId=dudic-inventory%40youslyrd.iam.gserviceaccount.com&Signature=KziiG%2FuAuqrJB6RFlBIuMQtaA2RMZvpjaAXVzaGZHE%2FkBNhSMsnZYagnabgGaa1hE30y6yJMeNBXzxUXNuhGfVhlNptonaq37VY5Btotz%2BDoJ3baROtFRL53ce9%2FxnyoSoU4qs5eYMp9tB%2BrirpuBdG69vIR%2BK%2FzBmM5SlWRZjk%2FO1V%2Bxvjil%2BS%2FHBxy8jUxl5FZ4MFEh15Hq%2FwYEBpnlLNcStXgLYSI78XTLVVmv3K3RlumBmqKSqSac5DMSz1cUyL51W0vFgGjlG8CuzF4rgLkDkx6M%2FsB%2Fc%2FgaOg47l7DPnE%2FM38in%2BaapMPnp1GBq3i1j7j5A1hspTHpag%2Ffzw%3D%3D	https://storage.googleapis.com/gis_receiving_pothole_image_bucket/GIS/Raw/2020-06-17/6f3c60ff-4187-4ef9-af32-cb68951cb2d4.jpg?Expires=3169205026&GoogleAccessId=dudic-inventory%40youslyrd.iam.gserviceaccount.com&Signature=Dy2RZD6vYK4V5zgAfSCbnLDnYLDlZ21pctYIKETNGClEFvzmKJLF8q%2F3A2KGZXN0akMMIU5HBT7DSNC8O1a1amrRKSDBgIgLSp61t%2FkTu9KTvWX4FDJcc4d3X3IJot2I%2B7DIbkr1axkLFKvWvGtyFQsG660sXLdEmDhBWVBOZzyA%2FXhtzX0A58tP7PQ7q3V3QPlv%2BD6O1oII0ranfT4P1rFvAW70j2k06MHMuatleg66VZMTuOW86Ege8ZgdFXEIriG3Ore0r3bNbHKAha%2FtXeMOLYdcQNeXetLdrjfWleQRYLlH4nWBTQoouXdpaiT5f9nzZqzjzg%2F6T42DO59fvQ%3D%3D
359115c4-4be2-4991-9cdd-35c660fc20e3	15572	1	28.5544569999999993	77.2680718999999954	2020-06-17 20:13:44.551531+05:30	testworld	NDMC	GIS/Raw/2020-06-17/ac56402a-7b84-4ccd-8d81-0074e64ac6b9.jpg	GIS/Processed/2020-06-17/0ab71c8b-a629-4f52-bfb2-60ca3420c16b.jpg	0101000020E610000080DE0A1728515340CC09DAE4F08D3C40	15	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	15, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	https://storage.googleapis.com/gis_receiving_pothole_image_bucket/GIS/Processed/2020-06-17/0ab71c8b-a629-4f52-bfb2-60ca3420c16b.jpg?Expires=3169205025&GoogleAccessId=dudic-inventory%40youslyrd.iam.gserviceaccount.com&Signature=MMGDnp13JJNkJHzcF2Ook4tWMete0mo5pIcLUwcuqbjSuLdcwVZVQFzRP70dkz9DDza0Mpyf2%2BgHOyYyF7wjGXKN7VV48oxRqim3uhFzYinNpKiUZwc5pCRA%2BjrRkIZKRlamOIA48Lqh19KIcmX1BM3gFD3cRrFUlpon267aey%2F6uIDxagoSH6w4CgoDx%2BXNRulbHtcaKZ2sZhhIBv1Id9c7VlsBvJTR6QvW6%2F077NyA2QPDf4yE9COUhtyLA2LuHtSR94NtTOpebK8mvjSVyCotTmkOKzJ89icXFGLkzFqDiRv3e912cTDG5DyOax5rAXLf8J4q%2FZkE2mQDvehbmA%3D%3D	https://storage.googleapis.com/gis_receiving_pothole_image_bucket/GIS/Raw/2020-06-17/ac56402a-7b84-4ccd-8d81-0074e64ac6b9.jpg?Expires=3169205025&GoogleAccessId=dudic-inventory%40youslyrd.iam.gserviceaccount.com&Signature=hvFtM%2FGp3tsDURpnPWthakiUtRvQkQfutJc0r88VE8mlHuj8pcPt1mEd3rGUnWiQFobbmschO9M4w%2FAPCV6Fj05af8MVZJjIHX5qjcA%2B6CRJB%2BhhFD4RToaoySP45s%2Fg1mj1srYBqlqVMoqyEhTpNEryKjhVqC%2FXKZwxkwPpLr2LgPhyFhi17xSfwsYxWg6SNVCi92TGDQZkDIFTF9py0vdOJjsC%2F%2BGS5R26iAiyILYRKSLx7b%2FoQZ%2FMzVhpm8meE1SVsEiwejNLaKT1gXCSwNmpKdA71DIomFtnit4ngqTn%2Bdkc9iyGLcW%2Bb1DC5rIy5Cu9Or%2BYZWysuNNwsyBCzw%3D%3D
6474600f-9ba6-4e35-bc4f-b5c76aa6f01e	1266	1	28.5537834000000004	77.268541600000006	2020-06-17 20:13:47.041369+05:30	testworld	NDMC	GIS/Raw/2020-06-17/fd703208-d3b2-422d-9087-6903f2bd1697.jpg	GIS/Processed/2020-06-17/c2914bea-667e-4fcb-9f45-0991fd96906f.jpg	0101000020E610000065671BC92F5153405411B8BFC48D3C40	29	None	None	None	110020	None	None	None	Okhla Industrial Area	Okhla Phase III	None	None	None	New Delhi	None	Delhi	South East Delhi	None	None	None	India	None	None	None	29, Okhla Phase III, Okhla Industrial Area, New Delhi, Delhi 110020, India	https://storage.googleapis.com/gis_receiving_pothole_image_bucket/GIS/Processed/2020-06-17/c2914bea-667e-4fcb-9f45-0991fd96906f.jpg?Expires=3169205027&GoogleAccessId=dudic-inventory%40youslyrd.iam.gserviceaccount.com&Signature=ei%2Bq9tKkADAtwVpMPCztQU%2BKuPfMdQboRHXK7pdsWe5d2xGYfEupjHxMvYEkoJb0ywMzmB3UXFkRCn7jzWsicZ9fxsdcZLS7%2F39izrWwkJRT3DisIuh7zEh960F50HI7P9rrWvi74DTSagGWmoD53Tcfg9u%2B6LAKeMspt6XuQlVQqqkrfgVTuz0pB0vdGvm%2FOCjwMLeAweRzURthPTpFapHR%2B7hmO7w4lpYRM2vUgBp3f3kptTGM2%2BbVnbJmVduzDdRUYMZNcTD4NSjgCcvf99Mxa9JL9VsdO4mtxxFzdAnjFX9GO0Pfl1zbL%2BrDny2L6ir5Z8WgU%2BgSaKl9Qv%2B%2Byg%3D%3D	https://storage.googleapis.com/gis_receiving_pothole_image_bucket/GIS/Raw/2020-06-17/fd703208-d3b2-422d-9087-6903f2bd1697.jpg?Expires=3169205027&GoogleAccessId=dudic-inventory%40youslyrd.iam.gserviceaccount.com&Signature=Bdm%2FR6EUIPjLf74wIwu7R9Peg2mO9waiZimA0a6SLFtizSCdS%2FufJucns%2BxqlkUDsoMiZ6umMRkrmv%2BvjZsKNmFL1cKigCWv8dD3HQbTbs0PQeSm37sImYooITKrlVziK9NK3bRPi0LNPQa9EOjvD5hjxAPkYofJLTbmZwN0H0EF185P%2FVBaTU%2Fy8bxRENi24h1Wbkib4%2BVUd9N8BoRjdPlsXLhv685MaZzZGvC9zagfONtgMlUAm0wGkCKHeEK11dGpY%2FgyGYAyquJMzfp6AL4FegHLCkplKn8YZsNYegawIL5i9zcUY8TSlUjWMnBQJMium5OpIW873wLWQqaWqw%3D%3D
\.


--
-- Data for Name: spatial_ref_sys; Type: TABLE DATA; Schema: public; Owner: papli
--

COPY public.spatial_ref_sys (srid, auth_name, auth_srid, srtext, proj4text) FROM stdin;
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: papli
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: papli
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: papli
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 36, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: papli
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: papli
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 1, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: papli
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: papli
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 38, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: papli
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 9, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: papli
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 28, true);


--
-- Name: reciever_potholeupdationimages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: papli
--

SELECT pg_catalog.setval('public.reciever_potholeupdationimages_id_seq', 26, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: reciever_conversiontable reciever_conversiontable_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.reciever_conversiontable
    ADD CONSTRAINT reciever_conversiontable_pkey PRIMARY KEY (name);


--
-- Name: reciever_potholeupdationimages reciever_potholeupdationimages_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.reciever_potholeupdationimages
    ADD CONSTRAINT reciever_potholeupdationimages_pkey PRIMARY KEY (id);


--
-- Name: reciever_recievingpotholeimages reciever_recievingpotholeimages_pkey; Type: CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.reciever_recievingpotholeimages
    ADD CONSTRAINT reciever_recievingpotholeimages_pkey PRIMARY KEY (name);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: reciever_conversiontable_name_32625bfe_like; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX reciever_conversiontable_name_32625bfe_like ON public.reciever_conversiontable USING btree (name varchar_pattern_ops);


--
-- Name: reciever_potholeupdationimages_name_id_817769c8; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX reciever_potholeupdationimages_name_id_817769c8 ON public.reciever_potholeupdationimages USING btree (name_id);


--
-- Name: reciever_potholeupdationimages_name_id_817769c8_like; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX reciever_potholeupdationimages_name_id_817769c8_like ON public.reciever_potholeupdationimages USING btree (name_id varchar_pattern_ops);


--
-- Name: reciever_potholeupdationimages_point_id; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX reciever_potholeupdationimages_point_id ON public.reciever_potholeupdationimages USING gist (point);


--
-- Name: reciever_recievingpotholeimages_name_be97f29e_like; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX reciever_recievingpotholeimages_name_be97f29e_like ON public.reciever_recievingpotholeimages USING btree (name varchar_pattern_ops);


--
-- Name: reciever_recievingpotholeimages_point_id; Type: INDEX; Schema: public; Owner: papli
--

CREATE INDEX reciever_recievingpotholeimages_point_id ON public.reciever_recievingpotholeimages USING gist (point);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reciever_potholeupdationimages reciever_potholeupda_name_id_817769c8_fk_reciever_; Type: FK CONSTRAINT; Schema: public; Owner: papli
--

ALTER TABLE ONLY public.reciever_potholeupdationimages
    ADD CONSTRAINT reciever_potholeupda_name_id_817769c8_fk_reciever_ FOREIGN KEY (name_id) REFERENCES public.reciever_recievingpotholeimages(name) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

