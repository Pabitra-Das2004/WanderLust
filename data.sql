--
-- PostgreSQL database dump
--

\restrict vOPDQES2IgSMs04m55aD9GE5U6bjOCR1yRxqyxb0P4HkQeK7WW0eYtiabkbvcQa

-- Dumped from database version 18.3
-- Dumped by pg_dump version 18.3

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: rahulroxx
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO rahulroxx;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: rahulroxx
--

COMMENT ON SCHEMA public IS '';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: bookings; Type: TABLE; Schema: public; Owner: rahulroxx
--

CREATE TABLE public.bookings (
    id integer NOT NULL,
    user_id integer,
    service_id integer,
    booking_date date,
    start_date date,
    end_date date,
    from_place character varying(100),
    to_place character varying(100),
    travel_date date,
    travelers integer,
    total_price numeric,
    status character varying(20),
    razorpay_order_id character varying(255)
);


ALTER TABLE public.bookings OWNER TO rahulroxx;

--
-- Name: bookings_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulroxx
--

CREATE SEQUENCE public.bookings_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bookings_id_seq OWNER TO rahulroxx;

--
-- Name: bookings_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulroxx
--

ALTER SEQUENCE public.bookings_id_seq OWNED BY public.bookings.id;


--
-- Name: flights; Type: TABLE; Schema: public; Owner: rahulroxx
--

CREATE TABLE public.flights (
    id integer NOT NULL,
    service_id integer,
    from_place character varying(100),
    to_place character varying(100),
    travel_date date
);


ALTER TABLE public.flights OWNER TO rahulroxx;

--
-- Name: flights_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulroxx
--

CREATE SEQUENCE public.flights_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.flights_id_seq OWNER TO rahulroxx;

--
-- Name: flights_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulroxx
--

ALTER SEQUENCE public.flights_id_seq OWNED BY public.flights.id;


--
-- Name: hotels; Type: TABLE; Schema: public; Owner: rahulroxx
--

CREATE TABLE public.hotels (
    id integer NOT NULL,
    service_id integer,
    location character varying(100),
    start_date date,
    end_date date
);


ALTER TABLE public.hotels OWNER TO rahulroxx;

--
-- Name: hotels_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulroxx
--

CREATE SEQUENCE public.hotels_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hotels_id_seq OWNER TO rahulroxx;

--
-- Name: hotels_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulroxx
--

ALTER SEQUENCE public.hotels_id_seq OWNED BY public.hotels.id;


--
-- Name: packages; Type: TABLE; Schema: public; Owner: rahulroxx
--

CREATE TABLE public.packages (
    id integer NOT NULL,
    service_id integer,
    location character varying(100),
    start_date date,
    end_date date
);


ALTER TABLE public.packages OWNER TO rahulroxx;

--
-- Name: packages_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulroxx
--

CREATE SEQUENCE public.packages_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.packages_id_seq OWNER TO rahulroxx;

--
-- Name: packages_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulroxx
--

ALTER SEQUENCE public.packages_id_seq OWNED BY public.packages.id;


--
-- Name: payments; Type: TABLE; Schema: public; Owner: rahulroxx
--

CREATE TABLE public.payments (
    id integer NOT NULL,
    booking_id integer,
    payment_id character varying(255),
    amount numeric,
    status character varying(20)
);


ALTER TABLE public.payments OWNER TO rahulroxx;

--
-- Name: payments_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulroxx
--

CREATE SEQUENCE public.payments_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.payments_id_seq OWNER TO rahulroxx;

--
-- Name: payments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulroxx
--

ALTER SEQUENCE public.payments_id_seq OWNED BY public.payments.id;


--
-- Name: services; Type: TABLE; Schema: public; Owner: rahulroxx
--

CREATE TABLE public.services (
    id integer NOT NULL,
    title character varying(255),
    type character varying(20),
    creator_id integer,
    price numeric,
    description text,
    image text,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT services_type_check CHECK (((type)::text = ANY ((ARRAY['hotel'::character varying, 'flight'::character varying, 'package'::character varying, 'train'::character varying])::text[])))
);


ALTER TABLE public.services OWNER TO rahulroxx;

--
-- Name: services_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulroxx
--

CREATE SEQUENCE public.services_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.services_id_seq OWNER TO rahulroxx;

--
-- Name: services_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulroxx
--

ALTER SEQUENCE public.services_id_seq OWNED BY public.services.id;


--
-- Name: trains; Type: TABLE; Schema: public; Owner: rahulroxx
--

CREATE TABLE public.trains (
    id integer NOT NULL,
    service_id integer,
    from_place character varying(100),
    to_place character varying(100),
    travel_date date
);


ALTER TABLE public.trains OWNER TO rahulroxx;

--
-- Name: trains_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulroxx
--

CREATE SEQUENCE public.trains_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.trains_id_seq OWNER TO rahulroxx;

--
-- Name: trains_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulroxx
--

ALTER SEQUENCE public.trains_id_seq OWNED BY public.trains.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: rahulroxx
--

CREATE TABLE public.users (
    id integer NOT NULL,
    name character varying(100),
    email character varying(100),
    password text,
    role character varying(20) DEFAULT 'customer'::character varying,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT users_role_check CHECK (((role)::text = ANY ((ARRAY['customer'::character varying, 'creator'::character varying, 'admin'::character varying])::text[])))
);


ALTER TABLE public.users OWNER TO rahulroxx;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: rahulroxx
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO rahulroxx;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: rahulroxx
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: bookings id; Type: DEFAULT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.bookings ALTER COLUMN id SET DEFAULT nextval('public.bookings_id_seq'::regclass);


--
-- Name: flights id; Type: DEFAULT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.flights ALTER COLUMN id SET DEFAULT nextval('public.flights_id_seq'::regclass);


--
-- Name: hotels id; Type: DEFAULT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.hotels ALTER COLUMN id SET DEFAULT nextval('public.hotels_id_seq'::regclass);


--
-- Name: packages id; Type: DEFAULT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.packages ALTER COLUMN id SET DEFAULT nextval('public.packages_id_seq'::regclass);


--
-- Name: payments id; Type: DEFAULT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.payments ALTER COLUMN id SET DEFAULT nextval('public.payments_id_seq'::regclass);


--
-- Name: services id; Type: DEFAULT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.services ALTER COLUMN id SET DEFAULT nextval('public.services_id_seq'::regclass);


--
-- Name: trains id; Type: DEFAULT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.trains ALTER COLUMN id SET DEFAULT nextval('public.trains_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: bookings; Type: TABLE DATA; Schema: public; Owner: rahulroxx
--

COPY public.bookings (id, user_id, service_id, booking_date, start_date, end_date, from_place, to_place, travel_date, travelers, total_price, status, razorpay_order_id) FROM stdin;
1	19	5	2025-06-06	\N	\N	\N	\N	\N	2	2618.9145602867347	PENDING	\N
2	20	16	2025-06-03	\N	\N	\N	\N	\N	1	359.8107121701112	PENDING	\N
3	19	35	2023-08-18	\N	\N	\N	\N	\N	3	2763.293785070752	CANCELLED	\N
4	16	2	2024-07-04	\N	\N	\N	\N	\N	3	4193.218833813875	PENDING	\N
5	16	43	2024-04-06	\N	\N	\N	\N	\N	4	6294.428615446322	CANCELLED	\N
6	5	39	2025-03-04	\N	\N	\N	\N	\N	5	5861.678448164017	CONFIRMED	\N
7	20	33	2023-09-06	\N	\N	\N	\N	\N	1	1741.2361938437587	CANCELLED	\N
8	5	39	2024-12-01	\N	\N	\N	\N	\N	1	1172.3356896328035	CANCELLED	\N
9	5	5	2023-03-19	\N	\N	\N	\N	\N	1	1309.4572801433674	CANCELLED	\N
10	4	7	2025-12-04	\N	\N	\N	\N	\N	1	1747.417057744343	CANCELLED	\N
11	5	11	2025-11-07	\N	\N	\N	\N	\N	1	457.2762137894899	PENDING	\N
12	20	41	2024-04-26	\N	\N	\N	\N	\N	1	860.6686946401643	PENDING	\N
13	8	36	2025-02-16	\N	\N	\N	\N	\N	1	1629.2737828977422	PENDING	\N
14	5	9	2025-01-08	\N	\N	\N	\N	\N	1	1035.45544640069	CONFIRMED	\N
15	8	45	2023-12-19	\N	\N	\N	\N	\N	3	5950.941190227972	CANCELLED	\N
16	4	15	2025-11-05	\N	\N	\N	\N	\N	5	5760.257042001268	PENDING	\N
17	4	36	2025-03-12	\N	\N	\N	\N	\N	1	1629.2737828977422	CANCELLED	\N
18	4	50	2025-01-06	\N	\N	\N	\N	\N	3	3164.9463320345267	CONFIRMED	\N
19	5	8	2024-02-06	\N	\N	\N	\N	\N	4	1537.9462490706221	CANCELLED	\N
20	8	35	2024-08-25	\N	\N	\N	\N	\N	1	921.0979283569174	CONFIRMED	\N
21	8	40	2025-10-19	\N	\N	\N	\N	\N	2	161.64046534963597	CONFIRMED	\N
22	2	26	2023-11-29	\N	\N	\N	\N	\N	2	2352.3425181712864	CONFIRMED	\N
23	4	40	2024-05-13	\N	\N	\N	\N	\N	3	242.46069802445396	CONFIRMED	\N
24	2	17	2023-05-12	\N	\N	\N	\N	\N	3	3903.3774671914566	CANCELLED	\N
25	16	45	2025-03-30	\N	\N	\N	\N	\N	1	1983.647063409324	CONFIRMED	\N
26	9	16	2024-01-20	\N	\N	\N	\N	\N	3	1079.4321365103335	CANCELLED	\N
27	9	14	2025-11-29	\N	\N	\N	\N	\N	1	1107.2496414705815	CANCELLED	\N
28	2	42	2025-11-20	\N	\N	\N	\N	\N	2	863.5245846656853	CANCELLED	\N
29	19	22	2025-12-05	\N	\N	\N	\N	\N	3	3624.536672046788	CANCELLED	\N
30	16	25	2025-06-26	\N	\N	\N	\N	\N	3	2510.1002116842	CANCELLED	\N
31	9	10	2025-07-29	\N	\N	\N	\N	\N	2	2636.2378738547623	CANCELLED	\N
32	19	29	2025-02-03	\N	\N	\N	\N	\N	2	1990.8081713725335	CONFIRMED	\N
33	16	1	2023-01-06	\N	\N	\N	\N	\N	1	697.792258100723	CONFIRMED	\N
34	20	2	2025-08-06	\N	\N	\N	\N	\N	5	6988.698056356459	CONFIRMED	\N
35	4	17	2023-01-18	\N	\N	\N	\N	\N	2	2602.2516447943044	CONFIRMED	\N
36	8	45	2023-05-05	\N	\N	\N	\N	\N	4	7934.588253637296	CANCELLED	\N
37	9	21	2023-12-06	\N	\N	\N	\N	\N	2	2304.6868502727057	CONFIRMED	\N
38	8	39	2023-07-07	\N	\N	\N	\N	\N	2	2344.671379265607	CONFIRMED	\N
40	20	22	2024-10-21	\N	\N	\N	\N	\N	3	3624.536672046788	CANCELLED	\N
41	2	47	2023-04-26	\N	\N	\N	\N	\N	5	7353.926453319247	CANCELLED	\N
42	19	5	2024-09-28	\N	\N	\N	\N	\N	2	2618.9145602867347	CANCELLED	\N
43	21	9	2023-03-21	\N	\N	\N	\N	\N	4	4141.82178560276	CANCELLED	\N
44	9	36	2024-11-04	\N	\N	\N	\N	\N	2	3258.5475657954844	CANCELLED	\N
46	4	44	2025-11-15	\N	\N	\N	\N	\N	2	1984.2186021343687	CANCELLED	\N
47	8	45	2023-01-04	\N	\N	\N	\N	\N	5	9918.23531704662	CANCELLED	\N
48	20	13	2023-05-02	\N	\N	\N	\N	\N	2	3266.446922819556	CANCELLED	\N
49	8	50	2025-09-04	\N	\N	\N	\N	\N	5	5274.910553390878	PENDING	\N
50	21	43	2024-09-09	\N	\N	\N	\N	\N	4	6294.428615446322	PENDING	\N
51	21	47	2025-12-25	\N	\N	\N	\N	\N	5	7353.926453319247	CONFIRMED	\N
52	16	35	2024-10-06	\N	\N	\N	\N	\N	1	921.0979283569174	CANCELLED	\N
53	19	15	2024-08-31	\N	\N	\N	\N	\N	3	3456.154225200761	CANCELLED	\N
54	2	49	2023-03-18	\N	\N	\N	\N	\N	1	1866.0220689705056	PENDING	\N
56	20	12	2025-12-12	\N	\N	\N	\N	\N	2	703.8851451014716	PENDING	\N
57	21	44	2025-10-29	\N	\N	\N	\N	\N	1	992.1093010671843	PENDING	\N
58	8	26	2024-12-29	\N	\N	\N	\N	\N	2	2352.3425181712864	CANCELLED	\N
59	21	14	2024-07-23	\N	\N	\N	\N	\N	5	5536.248207352908	CONFIRMED	\N
62	16	46	2023-05-19	\N	\N	\N	\N	\N	1	1201.6651488751975	PENDING	\N
63	20	3	2023-10-08	\N	\N	\N	\N	\N	3	5133.638447588344	CANCELLED	\N
64	2	23	2023-02-25	\N	\N	\N	\N	\N	3	1319.4352433758997	PENDING	\N
65	20	12	2023-01-14	\N	\N	\N	\N	\N	1	351.9425725507358	PENDING	\N
66	2	15	2025-11-29	\N	\N	\N	\N	\N	2	2304.1028168005073	CONFIRMED	\N
67	5	2	2023-11-08	\N	\N	\N	\N	\N	4	5590.958445085167	PENDING	\N
68	21	45	2025-02-12	\N	\N	\N	\N	\N	2	3967.294126818648	CONFIRMED	\N
69	8	10	2023-01-07	\N	\N	\N	\N	\N	2	2636.2378738547623	CANCELLED	\N
70	8	27	2023-03-08	\N	\N	\N	\N	\N	2	3828.865703673995	CONFIRMED	\N
71	4	12	2023-05-04	\N	\N	\N	\N	\N	4	1407.7702902029432	PENDING	\N
72	4	7	2024-09-07	\N	\N	\N	\N	\N	2	3494.834115488686	CONFIRMED	\N
73	8	41	2023-08-19	\N	\N	\N	\N	\N	3	2582.006083920493	CONFIRMED	\N
74	20	47	2025-02-16	\N	\N	\N	\N	\N	2	2941.570581327699	PENDING	\N
75	16	9	2023-06-17	\N	\N	\N	\N	\N	2	2070.91089280138	CANCELLED	\N
76	21	23	2025-07-18	\N	\N	\N	\N	\N	5	2199.058738959833	CONFIRMED	\N
77	4	31	2024-12-21	\N	\N	\N	\N	\N	1	967.8235802723605	PENDING	\N
78	9	38	2024-12-13	\N	\N	\N	\N	\N	4	5148.719679657288	PENDING	\N
79	2	25	2025-10-19	\N	\N	\N	\N	\N	4	3346.8002822456	PENDING	\N
80	16	38	2023-06-06	\N	\N	\N	\N	\N	4	5148.719679657288	CANCELLED	\N
81	2	36	2025-05-21	\N	\N	\N	\N	\N	4	6517.095131590969	PENDING	\N
82	4	47	2025-03-25	\N	\N	\N	\N	\N	3	4412.355871991549	PENDING	\N
83	4	22	2025-06-21	\N	\N	\N	\N	\N	2	2416.3577813645256	CANCELLED	\N
84	8	34	2024-03-14	\N	\N	\N	\N	\N	2	2021.6418618569387	CONFIRMED	\N
85	21	11	2023-03-21	\N	\N	\N	\N	\N	5	2286.3810689474494	CONFIRMED	\N
86	21	43	2024-01-16	\N	\N	\N	\N	\N	5	7868.035769307902	CANCELLED	\N
87	4	9	2023-12-28	\N	\N	\N	\N	\N	2	2070.91089280138	CONFIRMED	\N
88	16	30	2025-08-06	\N	\N	\N	\N	\N	4	323.39850982389214	PENDING	\N
89	8	31	2025-05-13	\N	\N	\N	\N	\N	3	2903.4707408170816	CANCELLED	\N
90	9	40	2024-03-01	\N	\N	\N	\N	\N	5	404.10116337408994	CANCELLED	\N
91	16	19	2025-12-09	\N	\N	\N	\N	\N	5	7174.735924185002	PENDING	\N
92	8	25	2024-05-19	\N	\N	\N	\N	\N	1	836.7000705614	PENDING	\N
93	4	10	2024-07-13	\N	\N	\N	\N	\N	1	1318.1189369273811	CANCELLED	\N
94	8	22	2024-02-10	\N	\N	\N	\N	\N	3	3624.536672046788	PENDING	\N
95	4	2	2024-04-08	\N	\N	\N	\N	\N	1	1397.7396112712918	CONFIRMED	\N
96	9	13	2025-01-26	\N	\N	\N	\N	\N	4	6532.893845639112	PENDING	\N
97	16	47	2024-06-03	\N	\N	\N	\N	\N	5	7353.926453319247	CANCELLED	\N
98	5	12	2024-11-18	\N	\N	\N	\N	\N	2	703.8851451014716	PENDING	\N
60	19	22	2024-07-22	\N	\N	\N	\N	\N	1	1208.1788906822628	CANCELLED	\N
55	19	46	2024-01-13	\N	\N	\N	\N	\N	4	4806.66059550079	CANCELLED	\N
45	19	20	2024-10-28	\N	\N	\N	\N	\N	2	133.957968782506	CANCELLED	\N
39	19	33	2023-04-14	\N	\N	\N	\N	\N	3	5223.708581531276	CONFIRMED	order_SjOQDGjwrvvm00
99	2	26	2024-04-05	\N	\N	\N	\N	\N	3	3528.5137772569296	CANCELLED	\N
100	2	47	2025-02-28	\N	\N	\N	\N	\N	4	5883.141162655398	CANCELLED	\N
101	19	1	2026-04-29	2026-04-29	\N	Dhenkanal	West Percyfurt	2026-04-29	1	697.792258100723	CONFIRMED	order_SjOPiGWYUiTZbm
61	19	19	2023-09-20	\N	\N	\N	\N	\N	3	4304.841554511001	CANCELLED	\N
102	19	5	2026-04-29	2026-04-30	2026-05-08	\N	Tamiami, Italy	2026-04-29	2	20951.316482293878	CONFIRMED	order_SjOXu8Ye0fhqoP
103	22	10	2026-04-29	2026-04-29	\N	Langworthhaven	Lawton	2026-04-29	1	1318.1189369273811	CANCELLED	order_SjOe0z0BQv8KOI
105	22	12	2026-04-29	2026-04-29	2026-05-07	\N	Fort Crystelchester, Lao People's Democratic Republic	2026-04-29	1	2815.5405804058864	CONFIRMED	order_SjPYV7eCRcxdZD
104	22	17	2026-04-29	2026-04-29	2026-05-21	\N	Archiestad, Cook Islands	2026-04-29	1	28624.768092737348	CANCELLED	\N
\.


--
-- Data for Name: flights; Type: TABLE DATA; Schema: public; Owner: rahulroxx
--

COPY public.flights (id, service_id, from_place, to_place, travel_date) FROM stdin;
1	1	Nicolasville	West Percyfurt	2026-06-16
2	10	Langworthhaven	Lawton	2027-03-02
3	18	Elseborough	Hoboken	2026-06-15
4	21	Bodeshire	North Phillip	2026-08-01
5	22	Kathrynville	Darrelfurt	2027-01-17
6	26	Fort Lillaboro	Fort Cristal	2027-03-25
7	27	Janiyabury	Longview	2026-09-07
8	29	Timothyfield	Ankundingfurt	2026-10-26
9	42	Robertsworth	South Timmothy	2026-12-13
10	46	Port Sonjahaven	Price-Durganshire	2027-03-20
11	50	Grand Prairie	Lubowitz-Rosenbaumcester	2026-10-12
\.


--
-- Data for Name: hotels; Type: TABLE DATA; Schema: public; Owner: rahulroxx
--

COPY public.hotels (id, service_id, location, start_date, end_date) FROM stdin;
1	6	Florence-Graham, Switzerland	2027-03-24	2027-05-31
2	8	Elenafort, French Southern Territories	2026-09-11	2026-10-21
3	16	East Glenn, Estonia	2026-10-19	2027-02-23
4	17	Archiestad, Cook Islands	2027-02-05	2028-02-03
5	23	Ricefort, Falkland Islands (Malvinas)	2027-03-18	2027-05-02
6	24	Port Serenityview, Vanuatu	2026-12-28	2027-10-20
7	28	Fort Tricia, Russian Federation	2026-09-06	2027-02-23
8	32	South Latoyaberg, Papua New Guinea	2027-03-28	2027-07-08
9	33	East Jose, Nigeria	2026-09-19	2027-02-06
10	38	Dionfort, Martinique	2026-07-14	2027-05-12
11	41	East Connieworth, Guatemala	2026-05-22	2026-07-08
12	48	New Aubrey, Jamaica	2026-08-11	2026-10-17
13	49	Cliftonstead, Sao Tome and Principe	2026-08-08	2026-08-13
\.


--
-- Data for Name: packages; Type: TABLE DATA; Schema: public; Owner: rahulroxx
--

COPY public.packages (id, service_id, location, start_date, end_date) FROM stdin;
1	2	Citrus Heights, Bermuda	2027-02-01	2027-08-23
2	5	Tamiami, Italy	2027-02-14	2027-07-04
3	9	Cristburgh, Saint Barthélemy	2026-11-29	2027-01-23
4	11	Jewelport, Austria	2026-06-02	2027-03-31
5	12	Fort Crystelchester, Lao People's Democratic Republic	2026-08-15	2027-06-01
6	13	North Travis, Senegal	2026-05-28	2026-11-28
7	14	East Berthafield, Slovenia	2026-10-29	2027-05-12
8	15	Hannashire, Bermuda	2026-11-23	2027-03-24
9	20	Bentonville, Jordan	2027-04-23	2027-06-17
10	25	Francesburgh, Norfolk Island	2026-07-21	2027-06-06
11	30	New Billieborough, Bolivia	2026-09-13	2026-10-24
12	31	Christytown, Peru	2026-05-09	2027-04-22
13	36	Altamonte Springs, Belarus	2027-04-06	2027-09-27
14	39	West Doyleville, Wallis and Futuna	2026-05-08	2026-11-23
15	43	Lockmanfurt, Faroe Islands	2026-09-09	2027-06-20
\.


--
-- Data for Name: payments; Type: TABLE DATA; Schema: public; Owner: rahulroxx
--

COPY public.payments (id, booking_id, payment_id, amount, status) FROM stdin;
1	6	pay_2bvpEV5PnhsSnz	5861.678448164017	SUCCESS
2	14	pay_vfVVBRtXlUtBxH	1035.45544640069	SUCCESS
3	18	pay_crVxSJ8SnSzB2r	3164.9463320345267	SUCCESS
4	20	pay_NV6LGb5ovquOvT	921.0979283569174	SUCCESS
5	21	pay_JfMC5tkRIhIm6x	161.64046534963597	SUCCESS
6	22	pay_IwQrX2zre3zCc4	2352.3425181712864	SUCCESS
7	23	pay_TtKonMG1TVMTRs	242.46069802445396	SUCCESS
8	25	pay_4JG6XdHSGObvcO	1983.647063409324	SUCCESS
9	32	pay_lwNAV4PSTksqEZ	1990.8081713725335	SUCCESS
10	33	pay_kHdAA7ZPkbMn6S	697.792258100723	SUCCESS
11	34	pay_ZVzMhbefl3VZvM	6988.698056356459	SUCCESS
12	35	pay_k488HVy0Z29h8V	2602.2516447943044	SUCCESS
13	37	pay_UhP3zIUEVYcCtr	2304.6868502727057	SUCCESS
14	38	pay_zRjykHkNcTKE3N	2344.671379265607	SUCCESS
15	45	pay_J1FCfb2XYZtVTe	133.957968782506	SUCCESS
16	51	pay_pxlnxWtxgEqOLO	7353.926453319247	SUCCESS
17	59	pay_giTYPrVccR6Yp1	5536.248207352908	SUCCESS
18	60	pay_YI2U8Ov94lcdoy	1208.1788906822628	SUCCESS
19	61	pay_jznLfMO06YYzn0	4304.841554511001	SUCCESS
20	66	pay_OHJx4UNEVN9aQ8	2304.1028168005073	SUCCESS
21	68	pay_sUq18Qv0vWluDG	3967.294126818648	SUCCESS
22	70	pay_98qt7fVr7T2ZYl	3828.865703673995	SUCCESS
23	72	pay_Hh8FBYlObVZMXL	3494.834115488686	SUCCESS
24	73	pay_nNZ1EQZ8spBEhE	2582.006083920493	SUCCESS
25	76	pay_VDDgcVDLcBq7br	2199.058738959833	SUCCESS
26	84	pay_T3UcgHBJBj3BAj	2021.6418618569387	SUCCESS
27	85	pay_wnhhiiKBkHIa62	2286.3810689474494	SUCCESS
28	87	pay_hVXWu60ff4y3dh	2070.91089280138	SUCCESS
29	95	pay_Lm4Rt2psYPiVG6	1397.7396112712918	SUCCESS
30	101	demo_upi_1777484117481	697.792258100723	SUCCESS
31	39	demo_upi_1777484145845	5223.708581531276	SUCCESS
32	102	demo_upi_1777484582714	20951.316482293878	SUCCESS
33	103	demo_upi_1777484929859	1318.1189369273811	SUCCESS
34	105	demo_upi_1777488138278	2815.5405804058864	SUCCESS
\.


--
-- Data for Name: services; Type: TABLE DATA; Schema: public; Owner: rahulroxx
--

COPY public.services (id, title, type, creator_id, price, description, image, created_at) FROM stdin;
1	Lockman, Bartell and Beahan Airlines	flight	6	697.792258100723	Casus comminor sumptus cervus concedo comminor tenuis bibo totus cogo. Usus synagoga tabgo colligo. Communis sapiente amplexus viduo bis.	https://picsum.photos/seed/YTvTlW7pAc/414/3841	2026-04-29 22:59:01.894361
2	Metairie Adventure Package	package	10	1397.7396112712918	Tempora aperio sortitus solio tersus audax supra causa. Tempore capitulus arceo. Curis valeo sumo cauda carbo aliqua arca cogo.	https://picsum.photos/seed/MAM6PqN/1122/3347	2026-04-29 22:59:01.899428
3	Collier Inc Express	train	7	1711.2128158627813	Vomito tam calculus somniculosus derelinquo consectetur. Defleo spes unus utrimque cubitum dignissimos. Accendo animus aedificium aliquam thema usitas vehemens tabernus.	https://picsum.photos/seed/X5j0W7Y/1308/2289	2026-04-29 22:59:01.905149
4	Hackett - Parisian Express	train	13	1906.7771970182307	Barba amo dens antiquus doloribus atque truculenter maiores. Strues aqua distinctio dolores umquam vos. Cuppedia vereor uxor debilito.	https://picsum.photos/seed/iT0e4/278/3572	2026-04-29 22:59:01.909409
5	Lake Annetta Adventure Package	package	12	1309.4572801433674	Voro earum supra somniculosus. Terga vivo velit vulgo at porro depromo strenuus. Torrens demergo neque denique colo strues tredecim deprecator tamdiu tabesco.	https://picsum.photos/seed/RvlHqist/1289/2678	2026-04-29 22:59:01.91276
6	Gottlieb - Greenholt Hotel	hotel	11	1492.0437166873069	Conatus aequitas carus thorax. Voco thema calco amissio. Tricesimus carcer compono velut praesentium adnuo texo earum.	https://picsum.photos/seed/sFnmbx4/1323/3734	2026-04-29 22:59:01.916104
7	Koss, Crooks and O'Keefe Express	train	13	1747.417057744343	Suus aliqua autem crudelis adopto. Demum cursus solvo commemoro campana neque contigo tam voluptates. Aedificium amita amplitudo cruciamentum crepusculum ait.	https://picsum.photos/seed/N3IPx51/1742/2180	2026-04-29 22:59:01.920986
8	Schoen Inc Hotel	hotel	14	384.48656226765553	Super decimus tonsor coerceo et condico desolo decumbo utrum aedificium. Corporis subiungo careo exercitationem surculus eveniet. Amissio villa calamitas maiores vitium textus.	https://picsum.photos/seed/o095fOjPwK/1764/766	2026-04-29 22:59:01.924668
9	Evatown Adventure Package	package	6	1035.45544640069	Accusantium accommodo inventore. Sperno vaco vos vito quibusdam adsum comes dolorem villa tardus. Ait theatrum contigo tabella comptus canonicus sed.	https://picsum.photos/seed/ntiD1DVr1/264/3926	2026-04-29 22:59:01.928129
10	Collins - Prosacco Airlines	flight	15	1318.1189369273811	Quisquam desidero suffoco tactus undique comedo adulescens ocer. Statim vivo strues. Defluo patrocinor adeo advoco.	https://picsum.photos/seed/enug8fqC/2643/3621	2026-04-29 22:59:01.931471
11	North Jaydecester Adventure Package	package	12	457.2762137894899	Colligo usitas consuasor placeat subiungo modi. Centum cibus acsi verumtamen templum tyrannus aestivus ager. Cohibeo ater conduco libero amet aestus.	https://picsum.photos/seed/TQiIFQF/986/1031	2026-04-29 22:59:01.935712
12	North Maryannview Adventure Package	package	12	351.9425725507358	Esse audio caritas neque amicitia volo vulgus barba voro unde. Dolorum ante venustas cilicium et ver asper quaerat vulticulus conatus. Vere aurum vere vindico tonsor molestias sollers demo.	https://picsum.photos/seed/ETlDQN6QJZ/2399/545	2026-04-29 22:59:01.940074
13	East Ricardo Adventure Package	package	10	1633.223461409778	Delectus dolores sumo. Ustulo claustrum acies timor uberrime versus vulgus admitto concido. Volup tergiversatio cognomen desino truculenter aegrotatio cum sufficio porro attollo.	https://picsum.photos/seed/n85RKUSt/1059/4	2026-04-29 22:59:01.943533
14	Balistrerihaven Adventure Package	package	15	1107.2496414705815	Consectetur dolores audacia maxime carpo debitis admoveo impedit. Accedo pel sublime. Creber architecto vae.	https://picsum.photos/seed/4mW66zJ7cc/3677/2292	2026-04-29 22:59:01.946776
15	Fort Junius Adventure Package	package	13	1152.0514084002536	Hic arbor recusandae degusto provident vilicus. Conor paulatim addo culpo adfectus aduro placeat quasi sol. Aduro campana thalassinus vinitor venia deinde vacuus accusator thesis talus.	https://picsum.photos/seed/5fdS1/373/936	2026-04-29 22:59:01.950196
16	Cole-Witting - McDermott Hotel	hotel	7	359.8107121701112	Vulariter cubicularis decet. Carus unus cura vix vociferor vulnus trepide degusto. Repellendus thesaurus aptus.	https://picsum.photos/seed/g80AJUXV9S/2875/3562	2026-04-29 22:59:01.954701
17	Bailey - Shields Hotel	hotel	18	1301.1258223971522	Spargo denuncio absens depopulo abscido carcer cubicularis thalassinus. Statim copiose certus statim cohaero validus defleo quia. Corrumpo trans vigilo sulum rem repellendus alias accommodo.	https://picsum.photos/seed/wnqocgP1ih/1835/1820	2026-04-29 22:59:01.958247
18	Reinger, Koss and Windler Airlines	flight	12	1675.3081096230976	Ustilo aegrotatio sol. Venio iste coerceo. Cinis caterva delibero.	https://picsum.photos/seed/GKAdI/1005/2350	2026-04-29 22:59:01.961614
19	Bayer - Casper Express	train	17	1434.9471848370003	Altus cometes depono aufero carbo. Speculum blandior pax commemoro texo adopto. Decretum curvo summa tardus.	https://picsum.photos/seed/aPsJLTCV/2312/2506	2026-04-29 22:59:01.964937
20	Pfefferhaven Adventure Package	package	14	66.978984391253	Currus tunc patior. Abduco adimpleo cubitum. Cursim inventore vulticulus aeneus nihil.	https://picsum.photos/seed/1aAMQVrtK/1255/1951	2026-04-29 22:59:01.969123
21	Terry LLC Airlines	flight	18	1152.3434251363528	Ducimus deleniti ustulo anser veritas conor sollers. Nihil strues alo arbustum a. Cresco volva tremo aggredior charisma vinco ancilla.	https://picsum.photos/seed/MImTkEjEr/2170/2210	2026-04-29 22:59:01.972874
22	Schiller Inc Airlines	flight	13	1208.1788906822628	Caelum ocer credo tolero quo molestias. Minima cernuus curiositas caelestis correptius iusto tergiversatio. Arbitro accusantium ulciscor.	https://picsum.photos/seed/4hbpf/652/295	2026-04-29 22:59:01.976471
23	Powlowski Group Hotel	hotel	10	439.8117477919666	Thymum amita vir usus depono aequus calculus alioqui uxor. Utpote surculus aveho velum laudantium aequus cedo acsi patior. Vulticulus vulticulus ustulo vallum.	https://picsum.photos/seed/7OC2lPaKM/3244/2485	2026-04-29 22:59:01.979971
24	Tremblay, Lynch and Little Hotel	hotel	11	1208.8235861356918	Ultra adipiscor animi vitae cilicium arbustum. Contigo auxilium defleo conscendo volva cubitum spes calcar claustrum. Sollicito dolorum caries stipes creta.	https://picsum.photos/seed/xv5aKU91c/3610/1762	2026-04-29 22:59:01.983365
25	Longmont Adventure Package	package	7	836.7000705614	Aggero aequitas avarus clamo. Tenus magnam uxor studio ambulo. Bonus celer nesciunt admiratio aiunt aestivus cultellus validus tero.	https://picsum.photos/seed/ZVHwC41RHx/1238/2438	2026-04-29 22:59:01.987824
26	Bauch, Wehner and Kiehn Airlines	flight	12	1176.1712590856432	Patior minima auditor abutor laboriosam molestias. Spargo valeo clarus explicabo unde inventore bene. Conscendo tolero defleo stipes.	https://picsum.photos/seed/d83Htb/2585/2674	2026-04-29 22:59:01.991275
27	Dickens Group Airlines	flight	11	1914.4328518369975	Curatio consequuntur absque. Solium quaerat deserunt ulterius tutamen. Blandior deprecator totam tamdiu articulus vulnero colligo.	https://picsum.photos/seed/iBKv61r/3442/2605	2026-04-29 22:59:01.994573
28	Donnelly - Maggio Hotel	hotel	3	1734.885478925663	Aurum delectatio turba vulgivagus testimonium tempore. Commodo conculco amaritudo. Adiuvo nesciunt basium coruscus abscido.	https://picsum.photos/seed/b6cBsRXg/2474/1816	2026-04-29 22:59:01.997748
29	Schoen - Hyatt Airlines	flight	15	995.4040856862667	Tamen delinquo arbitro tenus defetiscor decet. Venustas tricesimus certus summopere taceo succurro statua damnatio. Tunc cavus copia cubo thorax approbo vos caelestis.	https://picsum.photos/seed/xfMPAGXo/986/2284	2026-04-29 22:59:02.003432
30	Missouri City Adventure Package	package	10	80.84962745597304	Comparo tres articulus tui eligendi commodo acer. Tersus comburo tergum convoco. Id atrocitas curiositas magni triumphus vox contego dedico usque defleo.	https://picsum.photos/seed/OXy3MT/2612/1991	2026-04-29 22:59:02.008068
31	North Alexander Adventure Package	package	11	967.8235802723605	Stultus tamquam universe. Cogo cinis animadverto eos vicissitudo a voluptatibus depopulo. Titulus vulticulus conor aperiam terminatio.	https://picsum.photos/seed/uKMYen/3677/1995	2026-04-29 22:59:02.011448
32	Cartwright Group Hotel	hotel	11	194.71248160190268	Asper theca paulatim adicio thorax aspernatur. Validus talio carpo corroboro. Sui cibus tepidus nulla tredecim.	https://picsum.photos/seed/N9r4Fdzi/449/787	2026-04-29 22:59:02.014815
33	Cummerata and Sons Hotel	hotel	6	1741.2361938437587	Accedo voro apparatus. Venustas suppellex aqua. Corona aedificium et circumvenio vacuus solium suasoria vado soluta dedico.	https://picsum.photos/seed/VRLmff/2145/2455	2026-04-29 22:59:02.019649
34	Lindgren, Schoen and Lubowitz Express	train	12	1010.8209309284694	Demens acsi curatio ventus coerceo ante acsi aegrotatio. Coaegresco tener patior commemoro voluptas. Nulla acidus quo.	https://picsum.photos/seed/ISlevxhvt/945/2991	2026-04-29 22:59:02.023509
35	Kohler, Medhurst and Zieme Express	train	3	921.0979283569174	Cibus vilis cuppedia demitto. Amissio cubo adulatio conatus ullus sordeo defaeco curtus sufficio. Ter voluptate tyrannus adversus adhaero.	https://picsum.photos/seed/Wzd6Tt/76/2042	2026-04-29 22:59:02.026968
36	Augustafield Adventure Package	package	15	1629.2737828977422	Dignissimos debilito vapulus. Aperiam sonitus mollitia. Ver itaque adversus termes animus colligo video theologus.	https://picsum.photos/seed/gZLjeTO/195/125	2026-04-29 22:59:02.030556
37	Wiza - Baumbach Express	train	17	1651.1566739907196	Vigilo vorago culpo cubo summopere. Talus carus cras contra culpo. Omnis cultellus delego thymum conduco.	https://picsum.photos/seed/7abQc/2017/2513	2026-04-29 22:59:02.034696
38	Parker - Reilly-Lynch Hotel	hotel	15	1287.179919914322	Quidem numquam magnam suppono. Asporto esse tui apto tepidus caveo admiratio alias. Solum minima omnis corpus tempus volup.	https://picsum.photos/seed/sugpWsA/2903/867	2026-04-29 22:59:02.040032
39	Hesselton Adventure Package	package	17	1172.3356896328035	Comprehendo vix termes crinis tantum solium colligo neque sollicito velociter. Solus trado absens ullus. Coniecto et sint aduro thalassinus aestas tabesco appono super carcer.	https://picsum.photos/seed/R0vCjqS/3959/3327	2026-04-29 22:59:02.043071
40	Klein, Hansen and Kuhlman Express	train	7	80.82023267481799	Cuius amplus ciminatio. Pauper tamisium dolorum ullam. Decet terror vestigium civis expedita stella advoco careo.	https://picsum.photos/seed/aDdpps/1664/3912	2026-04-29 22:59:02.045959
41	Walter, Grimes and Rutherford Hotel	hotel	3	860.6686946401643	Anser utpote cetera vulnero congregatio verbera. Utor deduco ceno tego. Thorax valetudo ascisco valetudo magnam nemo consectetur via adopto triduana.	https://picsum.photos/seed/WD7Qn/978/3749	2026-04-29 22:59:02.049113
42	Feeney Group Airlines	flight	17	431.76229233284266	Pauper suasoria audax. Thalassinus officia acervus coruscus demonstro thymbra pauci. Benigne pariatur crinis aptus sopor patria cedo.	https://picsum.photos/seed/HUzSl6gt6/1753/1971	2026-04-29 22:59:02.053327
43	Lake Elsinore Adventure Package	package	12	1573.6071538615804	Voluptas curvo antepono saepe adsum desino accedo. Agnosco bis dolor clamo inflammatio creo. Appono turba stella supplanto carus cerno verto turbo asper.	https://picsum.photos/seed/34QsDAm4/1540/3340	2026-04-29 22:59:02.056777
44	Crist Group Express	train	10	992.1093010671843	Textilis blanditiis usitas adimpleo tribuo suppono valens averto cupressus. Abduco ex veniam tantillus adipisci velit varius vir dicta. Curiositas vigor spargo in.	https://picsum.photos/seed/0LUTE/1513/3307	2026-04-29 22:59:02.0601
45	Corkery, Wiegand and Ziemann Express	train	3	1983.647063409324	Teneo vestigium trans cauda acquiro corporis anser. Coepi clarus sustineo abbas texo volutabrum cenaculum capitulus tabernus. Curia deputo pariatur vulgus abduco suppellex ocer verecundia sto.	https://picsum.photos/seed/V94bqZCJLA/3807/2972	2026-04-29 22:59:02.063227
46	Douglas - Lang Airlines	flight	6	1201.6651488751975	Aureus tripudio traho videlicet cohibeo. Voluptatum viridis sub comedo territo vesper. Atrox callide adfectus.	https://picsum.photos/seed/vIgFp/3723/1646	2026-04-29 22:59:02.066237
47	Boyle and Sons Express	train	14	1470.7852906638495	Vulpes molestias alioqui infit barba bellicus vomito alter thesis necessitatibus. Vado crudelis conduco cupressus sint concedo tener ratione commemoro. Laborum degenero adulatio umerus una turbo.	https://picsum.photos/seed/F2ogT/856/791	2026-04-29 22:59:02.070443
48	Kuhn - Hilpert Hotel	hotel	15	1933.3608127704385	Attonbitus complectus alo. Creptio tertius ab magnam vaco apto verus. Aranea solio summisse subiungo expedita.	https://picsum.photos/seed/KyKZZobx/770/888	2026-04-29 22:59:02.074013
49	Bechtelar - Stiedemann Hotel	hotel	6	1866.0220689705056	Itaque voluptas facere strenuus velit curriculum pauci statim vinculum alter. Thymbra cursim tandem corrupti perspiciatis ante dolores barba vito antiquus. Canis thorax sopor abbas triumphus.	https://picsum.photos/seed/UDSHA4PGH/2445/2059	2026-04-29 22:59:02.077054
50	Spinka, Murazik and Jast Airlines	flight	3	1054.9821106781756	Turba concedo ipsa. Pel calamitas rem aveho. Cohors stultus vacuus solus tum allatus addo ad.	https://picsum.photos/seed/NDkduHPEQ9/3996/999	2026-04-29 22:59:02.080019
\.


--
-- Data for Name: trains; Type: TABLE DATA; Schema: public; Owner: rahulroxx
--

COPY public.trains (id, service_id, from_place, to_place, travel_date) FROM stdin;
1	3	Aloha	Beckerbury	2027-03-04
2	4	Quentinboro	East Rigobertobury	2027-03-29
3	7	Doyleborough	Southaven	2027-04-29
4	19	West Bryceside	Wunschville	2026-11-24
5	34	Lawrenceboro	North Timbury	2026-12-10
6	35	Pasadena	Wymanside	2026-10-17
7	37	Wesley Chapel	Lake Adafield	2026-11-18
8	40	Okeytown	Jonathonborough	2026-10-03
9	44	San Francisco	Lake Christstead	2027-01-10
10	45	Faheyport	Ziemeberg	2026-08-25
11	47	Lake Rudolphstad	Fort Addisonmouth	2026-10-03
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: rahulroxx
--

COPY public.users (id, name, email, password, role, created_at) FROM stdin;
1	Admin User	admin@example.com	password	admin	2026-04-29 22:59:01.833457
2	Betty Hansen	Myriam61@gmail.com	password	customer	2026-04-29 22:59:01.840891
3	Kaci Sanford	Cecelia_Kris25@yahoo.com	password	creator	2026-04-29 22:59:01.843188
4	Mr. Ralph Weber	Jarod.Kassulke32@yahoo.com	password	customer	2026-04-29 22:59:01.845333
5	Cary Jerde	George3@gmail.com	password	customer	2026-04-29 22:59:01.847188
6	Albert Kulas III	Fannie73@hotmail.com	password	creator	2026-04-29 22:59:01.849302
7	Dr. Virginia Hartmann	Marie.Kutch47@gmail.com	password	creator	2026-04-29 22:59:01.851398
8	Corey Fadel	Harriet_Dietrich54@gmail.com	password	customer	2026-04-29 22:59:01.854202
9	Mr. Destiney Kozey	May.OKeefe@hotmail.com	password	customer	2026-04-29 22:59:01.856414
10	Mr. Laverna Heidenreich V	Eddie75@hotmail.com	password	creator	2026-04-29 22:59:01.85835
11	Alma Crist	Wilson_OConner58@gmail.com	password	creator	2026-04-29 22:59:01.860112
12	Arturo Berge	Danny89@gmail.com	password	creator	2026-04-29 22:59:01.861678
13	Dr. Royal Quitzon Sr.	Ana.Braun28@yahoo.com	password	creator	2026-04-29 22:59:01.863405
14	Grace Brown	Torrance_Nitzsche74@yahoo.com	password	creator	2026-04-29 22:59:01.864967
15	Ms. Kristie Yundt	Kristen92@gmail.com	password	creator	2026-04-29 22:59:01.866588
16	Jeremy Moore	Lukas2@hotmail.com	password	customer	2026-04-29 22:59:01.871207
17	Orin Greenholt	Tomas_Powlowski-Hessel@hotmail.com	password	creator	2026-04-29 22:59:01.874029
18	Devin Block	Kieran27@gmail.com	password	creator	2026-04-29 22:59:01.876983
19	Catherine Stoltenberg	Eric.Schinner37@hotmail.com	password	customer	2026-04-29 22:59:01.879255
20	Dock Ward MD	Joanna_Jakubowski57@yahoo.com	password	customer	2026-04-29 22:59:01.881982
21	Gilbert Walker MD	Clovis.Larkin51@hotmail.com	password	customer	2026-04-29 22:59:01.891256
22	Admin	das@gmail.com	das@admin1234	admin	2026-04-29 22:59:19.778387
\.


--
-- Name: bookings_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulroxx
--

SELECT pg_catalog.setval('public.bookings_id_seq', 105, true);


--
-- Name: flights_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulroxx
--

SELECT pg_catalog.setval('public.flights_id_seq', 11, true);


--
-- Name: hotels_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulroxx
--

SELECT pg_catalog.setval('public.hotels_id_seq', 13, true);


--
-- Name: packages_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulroxx
--

SELECT pg_catalog.setval('public.packages_id_seq', 15, true);


--
-- Name: payments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulroxx
--

SELECT pg_catalog.setval('public.payments_id_seq', 34, true);


--
-- Name: services_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulroxx
--

SELECT pg_catalog.setval('public.services_id_seq', 50, true);


--
-- Name: trains_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulroxx
--

SELECT pg_catalog.setval('public.trains_id_seq', 11, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: rahulroxx
--

SELECT pg_catalog.setval('public.users_id_seq', 22, true);


--
-- Name: bookings bookings_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_pkey PRIMARY KEY (id);


--
-- Name: flights flights_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_pkey PRIMARY KEY (id);


--
-- Name: hotels hotels_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_pkey PRIMARY KEY (id);


--
-- Name: packages packages_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_pkey PRIMARY KEY (id);


--
-- Name: payments payments_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_pkey PRIMARY KEY (id);


--
-- Name: services services_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_pkey PRIMARY KEY (id);


--
-- Name: trains trains_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.trains
    ADD CONSTRAINT trains_pkey PRIMARY KEY (id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: bookings bookings_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: bookings bookings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.bookings
    ADD CONSTRAINT bookings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: flights flights_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.flights
    ADD CONSTRAINT flights_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: hotels hotels_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.hotels
    ADD CONSTRAINT hotels_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: packages packages_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.packages
    ADD CONSTRAINT packages_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: payments payments_booking_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.payments
    ADD CONSTRAINT payments_booking_id_fkey FOREIGN KEY (booking_id) REFERENCES public.bookings(id) ON DELETE CASCADE;


--
-- Name: services services_creator_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.services
    ADD CONSTRAINT services_creator_id_fkey FOREIGN KEY (creator_id) REFERENCES public.users(id) ON DELETE CASCADE;


--
-- Name: trains trains_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: rahulroxx
--

ALTER TABLE ONLY public.trains
    ADD CONSTRAINT trains_service_id_fkey FOREIGN KEY (service_id) REFERENCES public.services(id) ON DELETE CASCADE;


--
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: rahulroxx
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;


--
-- PostgreSQL database dump complete
--

\unrestrict vOPDQES2IgSMs04m55aD9GE5U6bjOCR1yRxqyxb0P4HkQeK7WW0eYtiabkbvcQa

