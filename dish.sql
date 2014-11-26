--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: locations; Type: TABLE; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    street_address character varying(255),
    zipcode integer,
    city character varying(255),
    restaurant_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    area character varying(255)
);


ALTER TABLE public.locations OWNER TO lveelmpsvfquhu;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: lveelmpsvfquhu
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.locations_id_seq OWNER TO lveelmpsvfquhu;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lveelmpsvfquhu
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: meals; Type: TABLE; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

CREATE TABLE meals (
    id integer NOT NULL,
    meal_name character varying(255),
    meal_price numeric,
    cuisine_type character varying(255),
    restaurant_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    meal_photo_file_name character varying(255),
    meal_photo_content_type character varying(255),
    meal_photo_file_size integer,
    meal_photo_updated_at timestamp without time zone
);


ALTER TABLE public.meals OWNER TO lveelmpsvfquhu;

--
-- Name: meals_id_seq; Type: SEQUENCE; Schema: public; Owner: lveelmpsvfquhu
--

CREATE SEQUENCE meals_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.meals_id_seq OWNER TO lveelmpsvfquhu;

--
-- Name: meals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lveelmpsvfquhu
--

ALTER SEQUENCE meals_id_seq OWNED BY meals.id;


--
-- Name: restaurants; Type: TABLE; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

CREATE TABLE restaurants (
    id integer NOT NULL,
    restaurant_name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    restaurant_logo_file_name character varying(255),
    restaurant_logo_content_type character varying(255),
    restaurant_logo_file_size integer,
    restaurant_logo_updated_at timestamp without time zone,
    email character varying(255),
    website character varying(255),
    facebook character varying(255),
    phone character varying(255)
);


ALTER TABLE public.restaurants OWNER TO lveelmpsvfquhu;

--
-- Name: restaurants_id_seq; Type: SEQUENCE; Schema: public; Owner: lveelmpsvfquhu
--

CREATE SEQUENCE restaurants_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.restaurants_id_seq OWNER TO lveelmpsvfquhu;

--
-- Name: restaurants_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lveelmpsvfquhu
--

ALTER SEQUENCE restaurants_id_seq OWNED BY restaurants.id;


--
-- Name: rests; Type: TABLE; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

CREATE TABLE rests (
    id integer NOT NULL,
    restaurant_name character varying(255),
    meal_name character varying(255),
    meal_price integer,
    restaurant_area character varying(255),
    restaurant_address character varying(255),
    cuisine_type character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    picture_file_name character varying(255),
    picture_content_type character varying(255),
    picture_file_size integer,
    picture_updated_at timestamp without time zone
);


ALTER TABLE public.rests OWNER TO lveelmpsvfquhu;

--
-- Name: rests_id_seq; Type: SEQUENCE; Schema: public; Owner: lveelmpsvfquhu
--

CREATE SEQUENCE rests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rests_id_seq OWNER TO lveelmpsvfquhu;

--
-- Name: rests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lveelmpsvfquhu
--

ALTER SEQUENCE rests_id_seq OWNED BY rests.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO lveelmpsvfquhu;

--
-- Name: users; Type: TABLE; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin boolean
);


ALTER TABLE public.users OWNER TO lveelmpsvfquhu;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: lveelmpsvfquhu
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO lveelmpsvfquhu;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: lveelmpsvfquhu
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lveelmpsvfquhu
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lveelmpsvfquhu
--

ALTER TABLE ONLY meals ALTER COLUMN id SET DEFAULT nextval('meals_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lveelmpsvfquhu
--

ALTER TABLE ONLY restaurants ALTER COLUMN id SET DEFAULT nextval('restaurants_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lveelmpsvfquhu
--

ALTER TABLE ONLY rests ALTER COLUMN id SET DEFAULT nextval('rests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: lveelmpsvfquhu
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: lveelmpsvfquhu
--

COPY locations (id, street_address, zipcode, city, restaurant_id, created_at, updated_at, area) FROM stdin;
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lveelmpsvfquhu
--

SELECT pg_catalog.setval('locations_id_seq', 1, false);


--
-- Data for Name: meals; Type: TABLE DATA; Schema: public; Owner: lveelmpsvfquhu
--

COPY meals (id, meal_name, meal_price, cuisine_type, restaurant_id, created_at, updated_at, meal_photo_file_name, meal_photo_content_type, meal_photo_file_size, meal_photo_updated_at) FROM stdin;
1	As Good As it Gets	13	American	5	2014-10-17 04:00:56.950459	2014-10-17 04:00:56.950459	As_Good_AS_it_gets.jpg	image/jpeg	100280	2014-10-17 04:00:56.28338
2	Brisket Sliders	9	American	5	2014-10-17 04:15:27.674942	2014-10-17 04:15:27.674942	Brisket_Sliders.jpg	image/jpeg	87064	2014-10-17 04:15:27.039113
3	Chicken and Waffles	0	American/Soul	5	2014-10-17 04:16:57.064752	2014-10-17 04:16:57.064752	Chicken_and_Waffles.jpg	image/jpeg	105813	2014-10-17 04:16:56.066976
4	Brisket Flatbread Pizza	12	American	5	2014-10-17 04:17:54.564124	2014-10-17 04:17:54.564124	brisket_flatbread.JPG	image/jpeg	145297	2014-10-17 04:17:53.743519
5	Pretzel Bites	8	American	5	2014-10-17 04:19:10.726571	2014-10-17 04:19:10.726571	PretzelBites.jpg	image/jpeg	82061	2014-10-17 04:19:09.075256
6	Braised Beef Short Ribs	\N	American	6	2014-10-17 04:30:27.897604	2014-10-17 04:33:01.508846	Braised_Beef_Short_Ribs_495x277.jpg	image/jpeg	40155	2014-10-17 04:33:00.559987
7	Crispy Calamari	\N	American	6	2014-10-17 04:34:36.088096	2014-10-17 04:34:53.870858	CrispyCalamari_495x277.jpg	image/jpeg	47925	2014-10-17 04:34:52.811491
8	Double Cut Pork Chop	\N	American	6	2014-10-17 04:35:30.081153	2014-10-17 04:35:30.081153	Double_Cut_PorkChop-495x277.jpg	image/jpeg	40186	2014-10-17 04:35:28.150897
9	Grilled Chicken Wild Mushroom	\N	American	6	2014-10-17 04:36:23.004705	2014-10-17 04:36:23.004705	GrilledChickenWildMushroom_495x277.jpg	image/jpeg	43143	2014-10-17 04:36:22.267122
10	Redfish Pontchartrain 	\N	American	6	2014-10-17 04:37:45.278152	2014-10-17 04:37:45.278152	RedfishPontchartrain_495x277.jpg	image/jpeg	34116	2014-10-17 04:37:44.380823
11	Scallops	\N	American	6	2014-10-17 04:38:26.529621	2014-10-17 04:38:26.529621	Scallops_495x277.jpg	image/jpeg	36005	2014-10-17 04:38:25.796231
12	Scottish Salmon	\N	American	6	2014-10-17 04:38:53.61433	2014-10-17 04:38:53.61433	ScottishSalmon_495x277.jpg	image/jpeg	48241	2014-10-17 04:38:52.376096
13	Super Lump Crab Cake	\N	American	6	2014-10-17 04:39:21.21483	2014-10-17 04:39:21.21483	Super_Lump_CrabCake_495x277.jpg	image/jpeg	34196	2014-10-17 04:39:20.506469
15	Llano Poblano	8	American	7	2014-10-23 00:51:35.3185	2014-10-23 00:51:35.3185	llanopoblano_burger.jpg	image/jpeg	67141	2014-10-23 00:51:34.420067
16	Primetime	12	American	7	2014-10-23 00:52:01.402025	2014-10-23 00:52:01.402025	primetime_burger.jpg	image/jpeg	65501	2014-10-23 00:52:00.736754
14	Goodnight Burger	6.5	American	7	2014-10-23 00:50:46.707866	2014-10-23 01:07:55.983404	goodnight_burger.jpg	image/jpeg	56881	2014-10-23 00:50:45.782112
17	Terilingua	7.0	American	7	2014-10-23 01:09:19.074933	2014-10-23 01:09:33.346887	terlingua_burger.jpg	image/jpeg	59006	2014-10-23 01:09:18.284735
18	Greek	7.0	American/Greek	7	2014-10-23 01:10:18.556604	2014-10-23 01:10:18.556604	greek_burger.jpg	image/jpeg	50203	2014-10-23 01:10:17.857281
19	Ahi Tuna	10.0	American/Seafood	7	2014-10-23 01:11:28.463814	2014-10-23 01:11:28.463814	ahi_tuna.jpg	image/jpeg	48144	2014-10-23 01:11:27.857844
20	Thunderbird	\N	American	7	2014-10-23 01:12:27.999979	2014-10-23 01:12:27.999979	thunderbird_burger.jpg	image/jpeg	48368	2014-10-23 01:12:27.021557
21	Mussels	12.0	Seafood	9	2014-10-23 04:43:52.679758	2014-10-23 04:43:52.679758	Mussles.jpg	image/jpeg	62982	2014-10-23 04:43:52.058674
22	Skirt Steak	23.0	Mexican	9	2014-10-23 04:52:38.850067	2014-10-23 04:52:38.850067	Skirtsteak_w-dried_chilesgoldraisinsagave.jpg	image/jpeg	90280	2014-10-23 04:52:38.064586
23	Pescado Tacos 	14.0	Mexican	9	2014-10-23 05:10:42.43349	2014-10-23 05:10:42.43349	Pescado_Tacos.jpg	image/jpeg	108089	2014-10-23 05:10:41.608016
24	Barbacoa Tacos	13.0	Mexican	9	2014-10-23 05:11:58.482633	2014-10-23 05:11:58.482633	Barbacoa_Tacos.jpg	image/jpeg	83738	2014-10-23 05:11:57.760055
25	Cheesesteak Eggrolls	10.5	American/Asian	8	2014-10-23 05:15:05.322671	2014-10-23 05:15:05.322671	cheesesteak_eggrolls.jpg	image/jpeg	82379	2014-10-23 05:15:04.332521
26	Crabcake	16.5	Seafood	8	2014-10-23 05:16:38.455729	2014-10-23 05:16:38.455729	crabcake.jpg	image/jpeg	53406	2014-10-23 05:16:37.769746
27	Ahi Tuna Tacos	14.5	Mexican	8	2014-10-23 05:17:36.11257	2014-10-23 05:17:36.11257	ahi_tuna_tacos.jpg	image/jpeg	77433	2014-10-23 05:17:34.819168
28	Lollipop Chicken Wings	11.5	American	8	2014-10-23 05:18:12.010136	2014-10-23 05:18:12.010136	lollipop_chicken_wings.jpg	image/jpeg	78399	2014-10-23 05:18:11.104807
29	Seared Ahi Tuna Salad	18.5	American	8	2014-10-23 05:18:50.905829	2014-10-23 05:18:50.905829	seared_asian_tuna_salad.jpg	image/jpeg	136497	2014-10-23 05:18:50.185962
30	Prime NY Strip 16oz	39.0	American	8	2014-10-23 05:20:11.460995	2014-10-23 05:20:11.460995	prime_ny_strip.jpg	image/jpeg	87544	2014-10-23 05:20:10.470232
31	Shortrib Stroganoff	28.0	American	8	2014-10-23 05:21:01.842289	2014-10-23 05:21:01.842289	prime_beef_stronganoff.jpg	image/jpeg	67580	2014-10-23 05:21:01.147629
32	Bento Box	\N	Japanese	10	2014-10-23 05:44:32.560829	2014-10-23 05:44:32.560829	bento_box.jpg	image/jpeg	58629	2014-10-23 05:44:32.010414
33	California Roll	\N	Japanese	10	2014-10-23 05:44:53.250266	2014-10-23 05:44:53.250266	california_roll.jpg	image/jpeg	64120	2014-10-23 05:44:52.49542
34	Assorted Nigri	\N	Japanese	10	2014-10-23 05:45:39.386663	2014-10-23 05:45:39.386663	assorted_nigri.jpg	image/jpeg	41148	2014-10-23 05:45:38.762633
35	Crispy Onion Albacore	\N	Japanese	10	2014-10-23 05:46:05.903305	2014-10-23 05:46:05.903305	crispy_onion_albacore.jpg	image/jpeg	83687	2014-10-23 05:46:05.073501
36	Crunchy Calamari Roll	\N	Japanese	10	2014-10-23 05:46:25.412873	2014-10-23 05:46:25.412873	crunchy_calamari_roll.jpg	image/jpeg	63725	2014-10-23 05:46:24.620365
37	Drunken Black Mussels	\N	Asian	10	2014-10-23 05:47:06.840482	2014-10-23 05:47:06.840482	drunken_black_mussels.jpg	image/jpeg	90701	2014-10-23 05:47:06.157697
38	Mango Lobster Roll	\N	Japanese	10	2014-10-23 05:47:25.374134	2014-10-23 05:47:25.374134	mango_lobster_roll.jpg	image/jpeg	48901	2014-10-23 05:47:24.741262
40	Ra Llipop	\N	Japanese	10	2014-10-23 05:48:09.51589	2014-10-23 05:48:09.51589	Ra_llipop.jpg	image/jpeg	43027	2014-10-23 05:48:08.891884
41	Shishito Peppers	\N	Japanese	10	2014-10-23 05:48:44.219955	2014-10-23 05:48:44.219955	shashiato_peppers.jpg	image/jpeg	58523	2014-10-23 05:48:43.553173
39	Pacific Roll	\N	Japanese	10	2014-10-23 05:47:47.789673	2014-10-23 05:49:37.57122	pacific_roll.jpg	image/jpeg	64778	2014-10-23 05:47:47.160157
42	Tootsi Maki Roll	\N	Japanese	10	2014-10-23 05:49:08.3418	2014-10-23 05:49:58.227865	tootsi_maki_roll.jpg	image/jpeg	71394	2014-10-23 05:49:07.626102
43	Guacamole	7.0	Mexican	11	2014-10-23 06:08:57.072336	2014-10-23 06:08:57.072336	homemade_guacamole.jpg	image/jpeg	74261	2014-10-23 06:08:56.211501
44	Red Snapper Acapulco	18.0	Mexican	11	2014-10-23 06:09:48.034938	2014-10-23 06:09:48.034938	red_snapper_aculpuco.jpg	image/jpeg	56055	2014-10-23 06:09:47.279067
45	Pollo Con Mole Taco	2.95	Mexican	11	2014-10-23 06:10:26.224618	2014-10-23 06:10:26.224618	pollo_con_mole_taco.jpg	image/jpeg	70327	2014-10-23 06:10:25.32212
46	La Jolla French Toast	\N	Mexican	11	2014-10-23 06:11:23.202789	2014-10-23 06:11:23.202789	la_jolla_french_toast.jpg	image/jpeg	81668	2014-10-23 06:11:22.259823
47	Flatas De Pollo	16.0	Mexican	11	2014-10-23 06:12:14.049677	2014-10-23 06:12:14.049677	golden_crisp_flautas.jpg	image/jpeg	73819	2014-10-23 06:12:13.322112
48	Carnitas DF Taco	2.95	Mexican	11	2014-10-23 06:12:53.019241	2014-10-23 06:12:53.019241	carnitas_df_tacos.jpg	image/jpeg	95188	2014-10-23 06:12:52.345506
49	Chicken Tinga Taco	2.95	Mexican	11	2014-10-23 06:13:20.323641	2014-10-23 06:13:20.323641	chicken_tinga_tacos.jpg	image/jpeg	75377	2014-10-23 06:13:19.488023
50	Three Chili Crusted Ahi Tuna	18.0	Mexican	11	2014-10-23 06:14:51.308659	2014-10-23 06:14:51.308659	chili_crusted_ahi_tuna.jpg	image/jpeg	71689	2014-10-23 06:14:50.632873
51	Cheesesteak	10.0	American	13	2014-10-23 06:26:50.890513	2014-10-23 06:26:50.890513	cheesesteak.jpg	image/jpeg	98758	2014-10-23 06:26:50.025125
52	The Birdman	9.95	American	19	2014-10-23 11:22:22.880823	2014-10-23 11:22:22.880823	the_birdman.jpg	image/jpeg	54709	2014-10-23 11:22:21.888346
53	Green Gobbler	8.25	American	19	2014-10-23 11:22:54.69736	2014-10-23 11:22:54.69736	green_gobbler.jpg	image/jpeg	57097	2014-10-23 11:22:53.148553
54	Tuna Salad	8.45	American	19	2014-10-23 11:23:29.728034	2014-10-23 11:23:29.728034	tuna_salad.jpg	image/jpeg	133412	2014-10-23 11:23:28.760493
55	Zaza Rice Bowl	9.95	Asian	19	2014-10-23 11:24:15.173089	2014-10-23 11:24:15.173089	zaza_rice_bowl.jpg	image/jpeg	92141	2014-10-23 11:24:12.708994
56	Dr Luke on Romaine	8.25	American	19	2014-10-23 11:24:51.146234	2014-10-23 11:24:51.146234	dr_luke_romaine.jpg	image/jpeg	107882	2014-10-23 11:24:49.611988
57	Fruit and Granola Parfait	3.25	American	19	2014-10-23 11:25:45.699526	2014-10-23 11:25:45.699526	fruit_granola_parfait.jpg	image/jpeg	55584	2014-10-23 11:25:44.846953
58	Fish and Chips	\N	American	20	2014-10-23 11:31:34.229412	2014-10-23 11:31:34.229412	fish_and_chips.jpg	image/jpeg	87493	2014-10-23 11:31:33.140334
59	Hand Seasoned Waffle fries	10.95	American	20	2014-10-23 11:32:16.263496	2014-10-23 11:32:16.263496	fries.jpg	image/jpeg	102848	2014-10-23 11:32:14.893726
60	Prime Rib	12.95	American	20	2014-10-23 11:32:38.874081	2014-10-23 11:32:38.874081	prime_rib_1295.jpg	image/jpeg	65767	2014-10-23 11:32:37.54512
61	Crab and Avacado Sushi Roll	9.95	Japanese	20	2014-10-23 11:33:31.034102	2014-10-23 11:33:31.034102	sushi_roll.jpg	image/jpeg	58009	2014-10-23 11:33:30.108754
62	Sliders	\N	American	20	2014-10-23 11:35:02.903091	2014-10-23 11:35:02.903091	sliders.jpg	image/jpeg	72441	2014-10-23 11:35:01.024588
63	Buffalo Wings	11.95	American	20	2014-10-23 11:35:38.518766	2014-10-23 11:35:38.518766	wings.jpg	image/jpeg	96787	2014-10-23 11:35:37.204141
64	Pan Seared Halibut	\N	Asian	21	2014-10-23 11:44:18.200229	2014-10-23 11:44:18.200229	pan_seared_halibut.jpg	image/jpeg	75813	2014-10-23 11:44:17.357626
65	Ceasar Salad	11.0	American	21	2014-10-23 11:44:54.670131	2014-10-23 11:44:54.670131	ceasar_salad.jpg	image/jpeg	124793	2014-10-23 11:44:53.517235
66	Salmon	39.0	American	21	2014-10-23 11:45:26.14691	2014-10-23 11:45:26.14691	blackened_salmon.jpg	image/jpeg	94859	2014-10-23 11:45:24.954632
67	Chicken and Waffles	\N	American	21	2014-10-23 11:46:26.678215	2014-10-23 11:46:26.678215	chicken_and_waffles.jpg	image/jpeg	65937	2014-10-23 11:46:25.889749
69	Lobster Flatbread	14.95	Italian	22	2014-10-23 11:53:51.984326	2014-10-23 11:53:51.984326	lobster_flatbread.jpg	image/jpeg	59429	2014-10-23 11:53:50.947752
70	Oak Grilled Filet	26.95	American	22	2014-10-23 11:54:28.019202	2014-10-23 11:54:28.019202	oak_grilled_filet.jpg	image/jpeg	57764	2014-10-23 11:54:26.85594
71	Lemon Herb Crusted Branzino	27.5	Italian	22	2014-10-23 11:55:25.839844	2014-10-23 11:55:25.839844	lemon_herb_crusted_branzino.jpg	image/jpeg	64292	2014-10-23 11:55:25.06036
72	Pidmontese Beef Black Bean Chili	6.25	American	22	2014-10-23 11:56:18.541981	2014-10-23 11:56:18.541981	chili.jpg	image/jpeg	64449	2014-10-23 11:56:17.682869
73	Bahn Mi Sandwich	10.5	Vietnamese	22	2014-10-23 11:57:27.58566	2014-10-23 11:57:27.58566	Bahn_mi_sandwich.jpg	image/jpeg	61891	2014-10-23 11:57:26.749859
68	Spinich and Carmelized pear salad	8.5	American	22	2014-10-23 11:52:48.826932	2014-10-23 11:57:54.086272	spinich_and_carmelized_pear.jpg	image/jpeg	69001	2014-10-23 11:52:48.033807
74		\N	American	23	2014-10-23 12:03:38.695725	2014-10-23 12:03:38.695725	brunch.jpg	image/jpeg	168504	2014-10-23 12:03:37.440094
75		\N	American	23	2014-10-23 12:03:49.747473	2014-10-23 12:03:49.747473	food.jpg	image/jpeg	27156	2014-10-23 12:03:48.998076
76		\N	American	23	2014-10-23 12:04:10.472064	2014-10-23 12:04:10.472064	delicous.jpg	image/jpeg	96810	2014-10-23 12:04:09.437904
77	PEI Mussel Chowder	\N	Asian	23	2014-10-23 12:04:32.759697	2014-10-23 12:04:32.759697	PEI_mussel_chowder.jpg	image/jpeg	60611	2014-10-23 12:04:31.498353
78	Pork Belly	\N	Mexican	23	2014-10-23 12:04:51.602076	2014-10-23 12:04:51.602076	pork_belly.jpg	image/jpeg	63240	2014-10-23 12:04:50.668632
79		\N	American	23	2014-10-23 12:05:04.766744	2014-10-23 12:05:04.766744	yummy.jpg	image/jpeg	38104	2014-10-23 12:05:03.215156
80	Genovese Flatbread Pizza	14.0	Italian	14	2014-10-23 13:07:20.574357	2014-10-23 13:07:20.574357	Sausage__olives__sundried_tomato_pizza.jpg	image/jpeg	66175	2014-10-23 13:07:19.204048
81	Caprese Colorata	12.0	Italian	14	2014-10-23 13:11:22.252606	2014-10-23 13:11:22.252606	Tomato___mozzorella_appetizer.jpg	image/jpeg	59935	2014-10-23 13:11:19.329634
82	Insalata Pollo	0.0	Italian	14	2014-10-23 13:19:19.190341	2014-10-23 13:19:19.190341	Salad_with_grilled_chicken.jpg	image/jpeg	53831	2014-10-23 13:19:16.842508
83	Cioppino alla Livornese (verify)	0.0	Italian	14	2014-10-23 13:27:29.339174	2014-10-23 13:27:29.339174	Lobster__muscled__and_squid.jpg	image/jpeg	56605	2014-10-23 13:27:28.270837
84	Tabbouleh	\N	Mediterranean	16	2014-10-23 13:42:12.670589	2014-10-23 13:45:12.506348	tabbouleh.jpg	image/jpeg	93658	2014-10-23 13:45:10.078862
85	Baked Pita Chips	0.0	Mediterranean	16	2014-10-23 13:45:56.423817	2014-10-23 13:45:56.423817	Baked_pita_chips.jpg	image/jpeg	54422	2014-10-23 13:45:55.377253
86	Hunted (green apple & nutmeg cured duck confit, caramelized  parsnips & lemon & garlic roasted brussels sprouts)	0.0	American	18	2014-10-23 14:29:25.578481	2014-10-23 14:29:51.778239	duck_with_mushrooms_brusslesprouts.jpg	image/jpeg	1152030	2014-10-23 14:29:21.365173
87	Ginger Garlic Hummus	0.0	American	18	2014-10-23 14:34:34.005918	2014-10-23 14:34:34.005918	appetizer.jpg	image/jpeg	1250419	2014-10-23 14:34:31.043535
88	Windy Meadows Brick Chicken	0.0	American	18	2014-10-23 15:01:50.43855	2014-10-23 15:01:50.43855	Wind_meadow_chicken.jpg	image/jpeg	593733	2014-10-23 15:01:48.264733
103	Grandmaw Pizza	\N	Italian	28	2014-10-24 18:08:00.515725	2014-10-24 18:08:00.515725	grandmaw_pizza.jpg	image/jpeg	140499	2014-10-24 18:07:59.837747
104	Chicken Parm Pizza	\N	Italian	28	2014-10-24 18:08:20.122232	2014-10-24 18:08:20.122232	chicken_parm_pizza.jpg	image/jpeg	127701	2014-10-24 18:08:19.38149
105	Sicilian Pizza	\N	Italian	28	2014-10-24 18:08:46.868104	2014-10-24 18:08:46.868104	sicilian_pizza.jpg	image/jpeg	117022	2014-10-24 18:08:46.185344
89	Kofta Chalao	17.0	American	24	2014-10-23 15:11:02.465247	2014-10-23 15:15:28.535245	Meatballs.jpg	image/jpeg	5506249	2014-10-23 15:14:42.140877
90	Nora's Afghan Salad	0.0		24	2014-10-23 15:18:02.951319	2014-10-23 15:18:02.951319	18.jpg	image/jpeg	696492	2014-10-23 15:18:00.799826
91	Crab Benedict	\N	American	25	2014-10-23 15:35:34.445101	2014-10-23 15:35:34.445101	Crab_benedict.jpg	image/jpeg	63107	2014-10-23 15:35:33.413602
92	Alligator with Crumpet, Corn, and Kumato	\N	American	25	2014-10-23 15:36:32.253599	2014-10-23 15:36:32.253599	alligator_w-crumpet_corn_and_kumato.jpg	image/jpeg	43163	2014-10-23 15:36:31.292381
93	Pear Tart with Chocolate Toffee Crisp	\N	American	25	2014-10-23 15:59:31.98743	2014-10-23 15:59:31.98743	Pear_tart_w-chocolate_toffee_crisp.jpg	image/jpeg	74406	2014-10-23 15:59:30.788058
94	Seitan Tacos	\N	Mexican	25	2014-10-23 16:11:56.549932	2014-10-23 16:11:56.549932	Seitan_tacos.jpg	image/jpeg	109749	2014-10-23 16:11:54.847084
106	Pizza Pinwheel	\N	Italian	28	2014-10-24 18:09:03.646832	2014-10-24 18:09:03.646832	pizza_pinwheel.jpg	image/jpeg	118984	2014-10-24 18:09:02.916747
107	Meat Stromboli	\N	Italian	28	2014-10-24 18:09:19.950222	2014-10-24 18:09:19.950222	meat_stromboli.jpg	image/jpeg	108301	2014-10-24 18:09:19.289896
95	Buffalo-Style Quail Legs	15.0	American	26	2014-10-23 16:26:41.714172	2014-10-23 16:28:03.264887	Buffalo_Quail_Legs.jpg	image/jpeg	50042	2014-10-23 16:27:01.600658
96	Sweet Tea Smoked Pork Chop	28.0	American	26	2014-10-23 16:29:53.953183	2014-10-23 16:29:53.953183	Sweet_Tea_Smoked_Pork_chop.jpg	image/jpeg	114394	2014-10-23 16:29:53.076186
97	American Lamb Shoulder Chop	29.0	American	26	2014-10-23 16:30:54.679717	2014-10-23 16:30:54.679717	Lamb.jpg	image/jpeg	75333	2014-10-23 16:30:53.804734
98	Cajun BBQ Shrimp and Biscuits	26.0	American	26	2014-10-23 16:33:29.615218	2014-10-23 16:33:29.615218	cajun_shrimp___biscuts.jpg	image/jpeg	45832	2014-10-23 16:33:28.719525
99	Pumpkin Creme Brulee & Mini Smores	\N	American	26	2014-10-23 16:35:08.186597	2014-10-23 16:35:08.186597	pumkin_creme_brulee___mini_smores.jpg	image/jpeg	72624	2014-10-23 16:35:07.261962
100	Cru' Steak Stone Fire Pizza	15.0	American	27	2014-10-23 17:29:18.715853	2014-10-23 17:29:18.715853	Cru'_Steak_Pizza.jpg	image/jpeg	104339	2014-10-23 17:29:17.656092
101	Salsiccia Stone Fire Pizza	14.0	American	27	2014-10-23 17:30:37.915604	2014-10-23 17:30:37.915604	Salsiccia_Pizza.jpg	image/jpeg	105907	2014-10-23 17:30:36.990172
102	Lobster & Shrimp Potstickers	11.0	American	27	2014-10-23 17:31:04.660113	2014-10-23 17:31:04.660113	Lobster___Shrimp_Potstickers.jpg	image/jpeg	55655	2014-10-23 17:31:01.809066
108	Spicy Black Bean Burger	11.95	American	29	2014-10-24 18:20:24.39356	2014-10-24 18:20:24.39356	avacado_burger.jpg	image/jpeg	98551	2014-10-24 18:20:23.59998
109	Parm Oysters	12.95	Seafood	29	2014-10-24 18:21:43.822458	2014-10-24 18:21:43.822458	parm_oysters.jpg	image/jpeg	89906	2014-10-24 18:21:43.142025
110	Oysters on the Half	12.95	Seafood	29	2014-10-24 18:22:08.104271	2014-10-24 18:22:08.104271	oysters_on_the_half.jpg	image/jpeg	106490	2014-10-24 18:22:06.926229
111	Shrimp and Bacon Mac and Cheese	12.95	American/Soul	29	2014-10-24 18:23:19.973228	2014-10-24 18:23:19.973228	mac_and_cheese.jpg	image/jpeg	35929	2014-10-24 18:23:19.412188
112	Po Boy	10.95	Cajun	29	2014-10-24 18:24:57.079448	2014-10-24 18:24:57.079448	burger.jpg	image/jpeg	78504	2014-10-24 18:24:56.402343
113	Shrimp and Crawfish Nachos	13.95	American	29	2014-10-24 18:26:00.620725	2014-10-24 18:26:00.620725	seafood_nachos.jpg	image/jpeg	87336	2014-10-24 18:25:59.867019
114	Apricot Glazed BBQ Salmon	\N	American	30	2014-10-27 04:53:23.41835	2014-10-27 04:53:23.41835	Apricot_BBQ_Glazed_Salmon.jpg	image/jpeg	195988	2014-10-27 04:53:22.177399
115	Apricot Quail	\N	American	30	2014-10-27 04:54:01.482549	2014-10-27 04:54:01.482549	Apricot_Quail.jpg	image/jpeg	84176	2014-10-27 04:54:00.793207
116	Chicken Fried Quail	\N	American	30	2014-10-27 04:54:17.710646	2014-10-27 04:54:17.710646	chicken_fried_Quail.jpg	image/jpeg	137834	2014-10-27 04:54:16.54249
117	Dr Pepper Braised Short Ribs 	\N	American	30	2014-10-27 04:54:54.410345	2014-10-27 04:54:54.410345	Dr_Pepper_Braised_Short_Ribs.jpg	image/jpeg	49120	2014-10-27 04:54:53.788961
118	Vanilla Malt Ice Cream Sandwhich	\N	American	30	2014-10-27 04:55:41.447519	2014-10-27 04:55:41.447519	Vanilla_Malt_Ice_Cream_Sandwich.jpg	image/jpeg	55821	2014-10-27 04:55:40.749739
119		\N	American	30	2014-10-27 04:56:31.987459	2014-10-27 04:56:31.987459	fla-img-14.jpg	image/jpeg	82094	2014-10-27 04:56:31.335012
120	Uni and Chive Pancakes	\N	American	31	2014-10-27 04:58:23.454135	2014-10-27 04:58:23.454135	uni_and_chive_pancakes.jpg	image/jpeg	87392	2014-10-27 04:58:22.752102
121		\N	American	31	2014-10-27 04:59:12.388632	2014-10-27 04:59:12.388632	976120_527690870627583_505303712_o.jpg	image/jpeg	177565	2014-10-27 04:59:11.073619
122		\N	American	31	2014-10-27 05:00:17.245073	2014-10-27 05:00:17.245073	1013560_543217919074878_439815298_n.jpg	image/jpeg	77831	2014-10-27 05:00:16.41812
123	Angolotti	\N	Italian	32	2014-10-27 05:01:31.152648	2014-10-27 05:01:31.152648	Agnolotti.jpg	image/jpeg	58091	2014-10-27 05:01:30.622434
124		\N	Italian	32	2014-10-27 05:01:56.484413	2014-10-27 05:02:28.577184	pic1.jpg	image/jpeg	52036	2014-10-27 05:02:27.977811
125		\N	Italian	32	2014-10-27 05:03:13.7784	2014-10-27 05:03:13.7784	pic2.png	image/png	194037	2014-10-27 05:03:13.12015
126	Lobster	\N	Seafood	33	2014-10-27 05:06:50.480376	2014-10-27 05:06:50.480376	lobster.jpg	image/jpeg	45879	2014-10-27 05:06:49.599379
127	Blu Fin Tuna Tartare	\N	Seafood	33	2014-10-27 05:07:25.12934	2014-10-27 05:07:25.12934	blue_fin_tuna_tartare.jpg	image/jpeg	79058	2014-10-27 05:07:24.269704
128	Oysters	\N	Seafood	33	2014-10-27 05:07:58.224171	2014-10-27 05:07:58.224171	1157727_491058837683191_1963423287_n.jpg	image/jpeg	57744	2014-10-27 05:07:57.508652
129	Scallop Ceviche	\N	Seafood	33	2014-10-27 05:08:19.156995	2014-10-27 05:08:19.156995	scallop_ceviche.jpg	image/jpeg	25714	2014-10-27 05:08:18.46185
130		\N	American	34	2014-10-27 05:11:30.6321	2014-10-27 05:11:30.6321	meat-541afb7ead728_(1).jpg	image/jpeg	96999	2014-10-27 05:11:29.987245
131		\N	American	34	2014-10-27 05:11:40.367357	2014-10-27 05:11:40.367357	food-541af79e0ab38.jpg	image/jpeg	87998	2014-10-27 05:11:39.636107
132		\N	Southwestern	35	2014-10-27 05:17:53.201709	2014-10-27 05:17:53.201709	burger.jpg	image/jpeg	187416	2014-10-27 05:17:51.946461
134		\N	Southwestern	35	2014-10-27 05:18:46.341653	2014-10-27 05:18:46.341653	pic1.png	image/png	593807	2014-10-27 05:18:45.36583
133		\N	Southwestern	35	2014-10-27 05:18:31.372689	2014-10-27 05:19:01.812083	Crabcake.jpg	image/jpeg	182962	2014-10-27 05:18:29.848247
\.


--
-- Name: meals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lveelmpsvfquhu
--

SELECT pg_catalog.setval('meals_id_seq', 134, true);


--
-- Data for Name: restaurants; Type: TABLE DATA; Schema: public; Owner: lveelmpsvfquhu
--

COPY restaurants (id, restaurant_name, created_at, updated_at, restaurant_logo_file_name, restaurant_logo_content_type, restaurant_logo_file_size, restaurant_logo_updated_at, email, website, facebook, phone) FROM stdin;
4	Mi Cocina	2014-10-07 23:09:50.506791	2014-10-07 23:09:50.506791	mi-cocina-logo.png	image/png	302681	2014-10-07 23:09:49.60618	\N	\N	\N	\N
5	Dallas Beer Kitchen	2014-10-17 03:54:04.366853	2014-10-17 04:00:20.648104	Screen_Shot_2014-10-16_at_11.02.37_PM.png	image/png	51092	2014-10-17 04:00:19.986978	\N	\N	\N	\N
6	Artin's Grill	2014-10-17 04:29:41.58868	2014-10-17 04:29:41.58868	logo.jpg	image/jpeg	7269	2014-10-17 04:29:40.588324	\N	\N	\N	\N
7	Hopdoddy	2014-10-23 00:33:43.835795	2014-10-23 00:33:43.835795	Hopdoddy_Logo.jpg	image/jpeg	5584	2014-10-23 00:33:43.126405	\N	\N	\N	\N
8	Del Friscos Grille	2014-10-23 01:20:05.425472	2014-10-23 01:20:05.425472	logo.png	image/png	7173	2014-10-23 01:20:04.678056	\N	\N	\N	\N
9	Mexican Sugar	2014-10-23 03:27:17.393162	2014-10-23 03:27:17.393162	logo.png	image/png	139249	2014-10-23 03:27:16.83826	\N	\N	\N	\N
10	Ra Sushi	2014-10-23 05:30:43.546159	2014-10-23 05:30:43.546159	Ra_sushi_logo.jpg	image/jpeg	71510	2014-10-23 05:30:42.600759	\N	\N	\N	\N
11	Urban Taco	2014-10-23 06:06:46.658148	2014-10-23 06:06:46.658148	urban_taco_logo.jpg	image/jpeg	11095	2014-10-23 06:06:45.746675	\N	\N	\N	\N
12	Taco Diner	2014-10-23 06:18:30.474233	2014-10-23 06:18:30.474233	taco_diner.jpg	image/jpeg	8189	2014-10-23 06:18:29.845507	\N	\N	\N	\N
13	TruckYard	2014-10-23 06:26:24.715576	2014-10-23 06:26:24.715576	truckyard_logo.jpg	image/jpeg	71737	2014-10-23 06:26:23.956531	\N	\N	\N	\N
14	Nicola's Ristorante Italiano	2014-10-23 06:38:37.640777	2014-10-23 06:38:37.640777	Logo.jpg	image/jpeg	18528	2014-10-23 06:38:37.139092	\N	\N	\N	\N
15	Crisp Salad	2014-10-23 06:44:56.694027	2014-10-23 06:44:56.694027	logo.jpg	image/jpeg	6374	2014-10-23 06:44:56.123114	\N	\N	\N	\N
16	mama pita 	2014-10-23 06:58:51.957285	2014-10-23 06:58:51.957285	logo.jpg	image/jpeg	32768	2014-10-23 06:58:51.355948	\N	\N	\N	\N
17	Bob's Steak & Chop House	2014-10-23 07:02:01.366955	2014-10-23 07:02:01.366955	BobsLogo3.png	image/png	12302	2014-10-23 07:02:00.82296	\N	\N	\N	\N
18	HG Supply Co	2014-10-23 07:11:04.857936	2014-10-23 07:11:04.857936	logo.jpg	image/jpeg	6102	2014-10-23 07:11:04.304308	\N	\N	\N	\N
19	SouthPaws	2014-10-23 11:20:59.729666	2014-10-23 11:20:59.729666	southpaw_logo.jpg	image/jpeg	99309	2014-10-23 11:20:58.28475	\N	\N	\N	\N
20	Henrys Tavern	2014-10-23 11:29:53.773834	2014-10-23 11:29:53.773834	henrys_tavern_logo.jpg	image/jpeg	53799	2014-10-23 11:29:52.781628	\N	\N	\N	\N
21	Jaspers	2014-10-23 11:43:03.786572	2014-10-23 11:43:03.786572	jaspers_logo.jpg	image/jpeg	3916	2014-10-23 11:43:02.501188	\N	\N	\N	\N
22	Season 52	2014-10-23 11:51:33.399252	2014-10-23 11:51:33.399252	season_52_logo.jpg	image/jpeg	3500	2014-10-23 11:51:32.644778	\N	\N	\N	\N
24	Nora	2014-10-23 15:10:15.089875	2014-10-23 15:10:15.089875	logo.png	image/png	55248	2014-10-23 15:10:09.892962	\N	\N	\N	\N
25	The Libertine	2014-10-23 15:33:00.124968	2014-10-23 15:33:00.124968	logo.jpg	image/jpeg	33149	2014-10-23 15:32:59.23748	\N	\N	\N	\N
26	Barter	2014-10-23 16:22:47.32593	2014-10-23 16:22:47.32593	logo.png	image/png	52231	2014-10-23 16:22:46.259839	\N	\N	\N	\N
27	Cru' Food & Wine Bar	2014-10-23 17:28:48.545733	2014-10-23 17:28:48.545733	logo.png	image/png	1911	2014-10-23 17:28:47.062842	\N	\N	\N	\N
28	Zolis Pizza	2014-10-24 18:07:39.399229	2014-10-24 18:07:39.399229	zolis_logo.jpg	image/jpeg	115464	2014-10-24 18:07:38.760946	\N	\N	\N	\N
29	Pier 247	2014-10-24 18:18:13.033097	2014-10-24 18:18:13.033097	pier_247.jpg	image/jpeg	157905	2014-10-24 18:18:12.325779	\N	\N	\N	\N
23	Bolsa	2014-10-23 12:03:19.509068	2014-10-27 00:32:15.622991	Bolsalogo3.jpg	image/jpeg	18588	2014-10-27 00:32:15.110955	\N	\N	\N	\N
30	Fearing's	2014-10-27 04:52:02.655074	2014-10-27 04:52:02.655074	logo.jpg	image/jpeg	14626	2014-10-27 04:52:01.84031	\N	\N	\N	\N
31	FT33	2014-10-27 04:57:51.028905	2014-10-27 04:57:51.028905	logo.jpg	image/jpeg	12813	2014-10-27 04:57:49.651972	\N	\N	\N	\N
32	Lucia	2014-10-27 05:01:07.28286	2014-10-27 05:01:07.28286	logo.jpg	image/jpeg	9230	2014-10-27 05:01:06.793585	\N	\N	\N	\N
33	Spoon Bar & Kitchen	2014-10-27 05:06:08.658993	2014-10-27 05:06:08.658993	logo.jpg	image/jpeg	73575	2014-10-27 05:06:07.867896	\N	\N	\N	\N
34	Oak	2014-10-27 05:11:06.767081	2014-10-27 05:11:06.767081	logo.png	image/png	35014	2014-10-27 05:11:06.252374	\N	\N	\N	\N
35	Stephan Pyles	2014-10-27 05:17:25.883899	2014-10-27 05:17:25.883899	logo.jpg	image/jpeg	34292	2014-10-27 05:17:25.269156	\N	\N	\N	\N
36	Local	2014-11-04 19:10:42.752095	2014-11-04 19:10:42.752095	logo.jpg	image/jpeg	2178	2014-11-04 19:10:40.190477	tracy@localdallas.com	www.localdallas.com	https://www.facebook.com/pages/Local/116335235057739	\N
37	Mias Tex-Mex	2014-11-04 19:43:28.108793	2014-11-04 19:47:57.328958	logo.jpg	image/jpeg	11104	2014-11-04 19:43:27.641362	mia@miastexmex.com	http://Miastexmex.com	https://www.facebook.com/pages/Mias-Tex-Mex-Restaurant/122480384469446	2145261020
38	Neighborhood Services	2014-11-06 17:47:29.367157	2014-11-06 17:47:29.367157	Neighborhood_Services.png	image/png	93745	2014-11-06 17:47:27.956449		http://nhstheoriginal.com/		2143505027
39	Rosewood Mansion on Turtle Creek	2014-11-06 17:48:08.572933	2014-11-06 17:48:08.572933	Rosewood_Mansion_on_Turtle_Creek.jpg	image/jpeg	21633	2014-11-06 17:48:07.681812		http://www.rosewoodhotels.com/en/mansion-on-turtle-creek-dallas	https://www.facebook.com/RWTurtleCreek	2145592100
40	Tei-An 	2014-11-06 17:48:22.999584	2014-11-06 17:48:22.999584	Tei-An_.jpg	image/jpeg	20940	2014-11-06 17:48:21.723205		http://tei-an.com/	https://www.facebook.com/TeiAnDallas	2142202828
41	Oak	2014-11-06 17:48:39.640082	2014-11-06 17:48:39.640082	Oak.png	image/png	35014	2014-11-06 17:48:38.990178		http://oakdallas.com/	https://www.facebook.com/OakDallas	2147129700
42	Ft33	2014-11-06 17:48:57.200482	2014-11-06 17:48:57.200482	FT33.jpeg	image/jpeg	18136	2014-11-06 17:48:56.552197		http://ft33dallas.com/	https://www.facebook.com/FT33Dallas	2147412629
43	Spoon Bar & Kitchen	2014-11-06 17:49:10.584254	2014-11-06 17:50:21.870755	Spoon_Bar___Kitchen.jpg	image/jpeg	11666	2014-11-06 17:50:20.855646		http://www.spoonbarandkitchen.com/	https://www.facebook.com/spoonbarandkitchen	2143688220
44	Fearing’s	2014-11-06 17:51:16.74961	2014-11-06 17:51:16.74961	Fearing’s.jpg	image/jpeg	8565	2014-11-06 17:51:15.870694		http://www.fearingsrestaurant.com/	https://www.facebook.com/FearingsRestaurant	2149224848
45	Stephan Pyles	2014-11-06 17:51:42.065389	2014-11-06 17:51:42.065389	StephanPyles.jpg	image/jpeg	98669	2014-11-06 17:51:40.382915		http://stephanpylesrestaurant.com/	https://www.facebook.com/pages/Stephan-Pyles/112511692102101	2145807000
46	Pecan Lodge	2014-11-06 17:51:50.39263	2014-11-06 17:51:50.39263	Pecan_Lodge.png	image/png	4587	2014-11-06 17:51:49.834291		http://www.pecanlodge.com/	https://www.facebook.com/PecanLodge	2147488900
47	Lucia	2014-11-06 17:52:15.867594	2014-11-06 17:52:15.867594	Lucia.gif	image/gif	15290	2014-11-06 17:52:14.252494		http://luciadallas.com/	https://www.facebook.com/pages/Lucia-Dallas/118749384831092	2149484998
48	The Grape	2014-11-06 17:52:26.737541	2014-11-06 17:52:26.737541	The_Grape.png	image/png	11785	2014-11-06 17:52:25.997805		http://www.thegraperestaurant.com/	https://www.facebook.com/pages/The-Grape-Restaurant/152487631457066	2148281981
49	Nonna	2014-11-06 17:52:42.43632	2014-11-06 17:52:42.43632	Nonna.gif	image/gif	3533	2014-11-06 17:52:39.147361		http://nonnadallas.com/		2145211800
50	Driftwood	2014-11-06 17:53:02.545805	2014-11-06 17:53:02.545805	Driftwood.jpg	image/jpeg	4332	2014-11-06 17:53:00.617412		http://www.driftwood-dallas.com/	https://www.facebook.com/Driftwood.Dallas	2149422530
51	Hibiscus	2014-11-06 17:53:22.356695	2014-11-06 17:53:22.356695	Hibiscus.jpg	image/jpeg	3118	2014-11-06 17:53:20.801873		http://www.hibiscusdallas.com/	https://www.facebook.com/hibiscusdallas	2148272927
52	Bolsa	2014-11-06 17:53:39.873042	2014-11-06 17:53:39.873042	Bolsa.jpg	image/jpeg	18588	2014-11-06 17:53:39.096761		http://bolsadallas.com/	https://www.facebook.com/bolsadallas	2143679367
53	Cane Rosso	2014-11-06 17:53:52.650607	2014-11-06 17:53:52.650607	Cane_Rosso.png	image/png	22319	2014-11-06 17:53:51.817066		http://ilcanerosso.com/	https://www.facebook.com/canerossofairview	2147411188
54	The Mercury	2014-11-06 17:54:09.77328	2014-11-06 17:54:09.77328	The_Mercury.gif	image/gif	1943	2014-11-06 17:54:08.048321		http://www.themercurydallas.com/	https://www.facebook.com/TheMercuryInDallas	9729607774
55	Abacus	2014-11-06 17:54:29.272928	2014-11-06 17:54:29.272928	Abacus.png	image/png	15470	2014-11-06 17:54:27.205883		http://kentrathbun.com/	https://www.facebook.com/KentRathbun911	2145593111
56	Mughlai Fine Indian Cuisine	2014-11-06 17:55:06.329771	2014-11-06 17:55:06.329771	Mughlai_Fine_Indian_Cuisine.png	image/png	69149	2014-11-06 17:55:05.147823		http://mughlaidallas.com/	https://www.facebook.com/MughlaiDallas	9723927786
57	Yao Fuzi Cuisine	2014-11-06 17:55:17.283103	2014-11-06 17:55:17.283103	Yao_Fuzi_Cuisine.jpg	image/jpeg	22748	2014-11-06 17:55:16.217852		http://www.yaofuzi.com/	https://www.facebook.com/Yaofuzicuisine	2144739267
58	Al Biernat’s	2014-11-06 17:55:44.041537	2014-11-06 17:55:44.041537	Al_Biernat’s.gif	image/gif	4020	2014-11-06 17:55:39.907905		https://www.albiernats.com/	https://www.facebook.com/pages/Al-Biernats/331987416061	2142192201
59	Bijoux	2014-11-06 17:56:00.166416	2014-11-06 17:56:00.166416	Bijoux.png	image/png	5496	2014-11-06 17:55:59.379728		http://www.bijouxrestaurant.com/	https://www.facebook.com/Bijouxrestaurant	2143506100
60	Smoke	2014-11-06 17:56:13.978989	2014-11-06 17:56:13.978989	Smoke.jpg	image/jpeg	35700	2014-11-06 17:56:12.925524		http://smokerestaurant.com/	https://www.facebook.com/pages/Smoke-Restaurant-Dallas/236033283588	2143934141
61	Mr. Mesero	2014-11-06 17:56:29.361426	2014-11-06 17:56:29.361426	Mr._Mesero.png	image/png	32489	2014-11-06 17:56:28.063641		http://www.mrmesero.com/	https://www.facebook.com/MrMesero	2147801991
62	Stampede 66	2014-11-06 17:56:43.556344	2014-11-06 17:56:43.556344	Stampede_66.jpg	image/jpeg	54911	2014-11-06 17:56:42.43905		http://stampede66.com/	https://www.facebook.com/Stampede66	2145506966
63	Yutaka Sushi Bistro	2014-11-06 17:57:38.220754	2014-11-06 17:57:38.220754	Yutaka_Sushi_Bistro.jpg	image/jpeg	13378	2014-11-06 17:57:37.112241		http://yutakasushibistrodallas.com/		2149695533
64	Zio Cecio Cucina Italiana	2014-11-06 17:57:52.27947	2014-11-06 17:57:52.27947	Zio_Cecio_Cucina_Italiana.gif	image/gif	7731	2014-11-06 17:57:49.768644		http://www.ziocecio.com/	https://www.facebook.com/ZioCecioCucina	2143511100
65	Sissy’s Southern Kitchen & Bar	2014-11-06 17:58:05.34774	2014-11-06 17:58:05.34774	Sissy’s_Southern_Kitchen___Bar.jpg	image/jpeg	68493	2014-11-06 17:58:03.588048		http://sissyssouthernkitchen.com/	https://www.facebook.com/SissysKitchen	2148279900
66	Meddlesome Moth	2014-11-06 17:58:16.999501	2014-11-06 17:58:16.999501	Meddlesome_Moth.jpg	image/jpeg	49172	2014-11-06 17:58:16.35018		http://www.mothinthe.net/	https://www.facebook.com/MothDallas	2146287900
67	The French Room	2014-11-06 17:58:34.115972	2014-11-06 17:58:34.115972	The_French_Room.jpg	image/jpeg	6069	2014-11-06 17:58:31.728347		http://www.hoteladolphus.com/dining/the-french-room	https://www.facebook.com/TheAdolphusHotel	2147428200
68	Boulevardier	2014-11-06 17:59:30.934668	2014-11-06 17:59:30.934668	Boulevardier.png	image/png	70758	2014-11-06 17:59:30.17555		http://dallasboulevardier.com/	https://www.facebook.com/dallasboulevardier	2149421828
69	Mesa Veracruz	2014-11-06 17:59:49.206255	2014-11-06 17:59:49.206255	Mesa_Veracruz.png	image/png	71571	2014-11-06 17:59:48.402743		http://www.mesadallas.com/	https://www.facebook.com/MesaVeracruz	2149414246
70	Nosh Euro Bistro	2014-11-06 18:00:01.29344	2014-11-06 18:00:01.29344	Nosh_Euro_Bistro.jpg	image/jpeg	25449	2014-11-06 18:00:00.137299		http://www.nosheurobistro.com/		2145289400
71	Canary by Gorji	2014-11-06 18:00:14.560989	2014-11-06 18:00:14.560989	Canary_by_Gorji.jpg	image/jpeg	5163	2014-11-06 18:00:13.524776		http://www.chefgorji.com/canary-by-gorji.htm	https://www.facebook.com/ChefGorji	9725037080
72	Lockhart Smokehouse	2014-11-06 18:00:28.094993	2014-11-06 18:00:28.094993	Lockhart_Smokehouse.png	image/png	51213	2014-11-06 18:00:27.354112		http://www.lockhartsmokehouse.com/	https://www.facebook.com/lockhartsmokehouse	2149445521
73	Rise No. 1	2014-11-06 18:00:38.25392	2014-11-06 18:00:38.25392	Rise_No._1.jpg	image/jpeg	3700	2014-11-06 18:00:37.258648		http://www.risesouffle.com/	https://www.facebook.com/risedallas	2143669900
74	Royal Thai	2014-11-06 18:01:00.198627	2014-11-06 18:01:00.198627	Royal_Thai.jpg	image/jpeg	89756	2014-11-06 18:00:57.795849		http://www.royalthaitexas.com/	https://www.facebook.com/royalthaidallas	2146913555
75	Off-Site Kitchen	2014-11-06 18:01:17.012534	2014-11-06 18:01:17.012534	\N	\N	\N	\N				2147412226
76	Sushi Sake	2014-11-06 18:01:35.036594	2014-11-06 18:01:35.036594	Sushi_Sake.png	image/png	2012	2014-11-06 18:01:34.346046		http://sushi-sake.com/	https://www.facebook.com/pages/Sushi-Sake/306659077073	9724700722
77	Maple & Motor Burgers & Beer	2014-11-06 18:01:47.361784	2014-11-06 18:01:47.361784	Maple___Motor_Burgers___Beer.jpg	image/jpeg	10644	2014-11-06 18:01:46.355081		http://mapleandmotor.com/	https://www.facebook.com/mapleandmotor	2145224400
78	Fireside Pies	2014-11-06 18:02:16.10438	2014-11-06 18:02:16.10438	Fireside_Pies.png	image/png	881780	2014-11-06 18:02:14.337632		http://www.firesidepies.com/	https://www.facebook.com/firesidepies	2143703916
79	Samar by Stephan Pyles	2014-11-06 18:02:17.242824	2014-11-06 18:02:17.242824	Samar_by_Stephan_Pyles.png	image/png	19857	2014-11-06 18:02:16.484874		http://sansalvaje.com/		2149229922
80	Central 214	2014-11-06 18:02:31.074759	2014-11-06 18:02:31.074759	\N	\N	\N	\N				2144439339
81	Cafe on the Green	2014-11-06 18:02:51.145184	2014-11-06 18:02:51.145184	\N	\N	\N	\N		http://www.fourseasons.com/dallas/dining/restaurants/cafe_on_the_green/#		9727170700
82	Chamberlain’s Steak & Chop House	2014-11-06 18:03:06.192605	2014-11-06 18:03:06.192605	Chamberlain’s_Steak___Chop_House.jpg	image/jpeg	16710	2014-11-06 18:03:04.758246		http://www.chamberlainssteakhouse.com/		9729342467
83	The Zodiac	2014-11-06 18:03:19.01705	2014-11-06 18:03:19.01705	\N	\N	\N	\N				2145735800
84	Shinsei	2014-11-06 18:03:34.311325	2014-11-06 18:03:34.311325	Shinsei.jpg	image/jpeg	59382	2014-11-06 18:03:32.386319		http://shinseirestaurant.com/	https://www.facebook.com/ShinseiRestaurant	2143520005
85	Afghan Grill	2014-11-06 18:03:48.319739	2014-11-06 18:03:48.319739	Afghan_Grill.png	image/png	86499	2014-11-06 18:03:45.358896		http://www.afghangrilltx.com/		9728180300
86	Dallas Fish Market	2014-11-06 18:03:56.076266	2014-11-06 18:03:56.076266	Dallas_Fish_Market.png	image/png	13143	2014-11-06 18:03:55.00699		http://www.dallasfishmarket.com/	https://www.facebook.com/DallasFishMarket	2147443474
87	Five Sixty	2014-11-06 18:04:10.994893	2014-11-06 18:04:10.994893	Five_Sixty.gif	image/gif	8000	2014-11-06 18:04:08.930249		http://www.wolfgangpuck.com/restaurants/fine-dining/3917	https://www.facebook.com/wolfgangpuck	2147415560
88	Parigi	2014-11-06 18:07:03.879005	2014-11-06 18:07:03.879005	Parigi.jpg	image/jpeg	8483	2014-11-06 18:07:03.250963		http://www.parigidallas.com/	https://www.facebook.com/parigidallas	2145210295
89	Madras Pavilion	2014-11-06 18:07:15.293278	2014-11-06 18:07:15.293278	Madras_Pavilion.png	image/png	9582	2014-11-06 18:07:14.585151		http://themadraspavilion.com/	https://www.facebook.com/pages/Madras-Pavilion/113984198632645	9726713672
90	Cafe Pacific	2014-11-06 18:07:27.346729	2014-11-06 18:07:27.346729	Cafe_Pacific.jpg	image/jpeg	8648	2014-11-06 18:07:26.556881		http://www.cafepacificdallas.com/	https://www.facebook.com/cafepacificdallas	2145261170
91	Tei Tei Robata Bar	2014-11-06 18:07:42.785967	2014-11-06 18:07:42.785967	Tei_Tei_Robata_Bar.jpg	image/jpeg	56060	2014-11-06 18:07:41.734921		http://www.teiteirobata.com/	https://www.facebook.com/TeiTeiRobata	2148282400
92	Salum	2014-11-06 18:07:56.295108	2014-11-06 18:07:56.295108	Salum.png	image/png	5496	2014-11-06 18:07:55.010965		http://www.salumrestaurant.com/	https://www.facebook.com/pages/Salum-Restaurant/113961215286360	2142529604
93	Nick & Sam’s Steakhouse	2014-11-06 18:08:10.175021	2014-11-06 18:08:10.175021	Nick___Sam’s_Steakhouse.png	image/png	15519	2014-11-06 18:08:09.495059		http://www.nick-sams.com/	https://www.facebook.com/nickandsams	2148717444
94	Crossroads Diner	2014-11-06 18:08:32.467304	2014-11-06 18:08:32.467304	Crossroads_Diner.png	image/png	112088	2014-11-06 18:08:31.3014		http://www.crossroads-diner.com/	https://www.facebook.com/crossroadsdinerdallas	2143463491
95	Zen Sushi	2014-11-06 18:08:43.401029	2014-11-06 18:08:43.401029	Zen_Sushi.png	image/png	6083	2014-11-06 18:08:42.413112		http://www.zensushidallas.com/	https://www.facebook.com/ZENSushiDallas	2149469699
96	Victor Tangos	2014-11-06 18:08:56.683601	2014-11-06 18:08:56.683601	Victor_Tangos.png	image/png	55343	2014-11-06 18:08:55.307939		http://www.victortangos.com/	https://www.facebook.com/vtdallas	2142528595
97	Company Cafe	2014-11-06 18:09:14.776973	2014-11-06 18:09:14.776973	Company_Cafe.png	image/png	41709	2014-11-06 18:09:14.085255		http://companycafe.com/	https://www.facebook.com/companycafe	2148272233
98	La Duni	2014-11-06 18:09:29.268177	2014-11-06 18:09:29.268177	La_Duni.png	image/png	94015	2014-11-06 18:09:28.364583		http://laduni.com/	https://www.facebook.com/LaDuniLove	2145207300
99	Sevy’s Grill	2014-11-06 18:09:40.908213	2014-11-06 18:09:40.908213	Sevy’s_Grill.jpg	image/jpeg	50715	2014-11-06 18:09:39.54821		http://www.sevys.com/	https://www.facebook.com/pages/Sevys-Grill/108030515903804	2142657389
100	Royal China	2014-11-06 18:09:54.303066	2014-11-06 18:09:54.303066	Royal_China.gif	image/gif	7230	2014-11-06 18:09:51.54323		http://www.royalchinadallas.com/	https://www.facebook.com/Royalchinadallas	2143611771
101	The Porch	2014-11-06 18:10:07.86751	2014-11-06 18:10:07.86751	The_Porch.png	image/png	20340	2014-11-06 18:10:06.976053		http://www.theporchrestaurant.com/	https://www.facebook.com/porchrestaurantdallas	2148282916
102	Cadot	2014-11-06 18:10:18.599239	2014-11-06 18:10:18.599239	Cadot.jpg	image/jpeg	18596	2014-11-06 18:10:17.9439		http://www.cadotrestaurant.com/	https://www.facebook.com/cadotrestaurant	9722675700
103	Hattie’s	2014-11-06 18:10:31.55654	2014-11-06 18:10:31.55654	Hattie’s.png	image/png	2132	2014-11-06 18:10:30.98547		http://hatties.com/	https://www.facebook.com/pages/Hatties/121431434533554	2149427400
104	Lavendou Bistro Provencal	2014-11-06 18:10:47.00926	2014-11-06 18:10:47.00926	Lavendou_Bistro_Provencal.gif	image/gif	39735	2014-11-06 18:10:42.353989		http://www.lavendou.com/	https://www.facebook.com/lavendou	9722481911
105	Bob’s Steak and Chop House	2014-11-06 18:10:54.125233	2014-11-06 18:10:54.125233	Bob’s_Steak_and_Chop_House.jpg	image/jpeg	6568	2014-11-06 18:10:53.471571		http://www.bobs-steakandchop.com/dallas.html	https://www.facebook.com/pages/Bobs-Steak-Chop-House-Dallas/104207589611955	2145289446
106	Pho is for Lovers	2014-11-06 18:11:10.659874	2014-11-06 18:11:10.659874	Pho_is_for_Lovers.png	image/png	10836	2014-11-06 18:11:09.526888		http://www.phoisforlovers.com/	https://www.facebook.com/phoisforlovers	9727081028
107	Asian Mint	2014-11-06 18:11:20.569704	2014-11-06 18:11:20.569704	Asian_Mint.png	image/png	14613	2014-11-06 18:11:19.989463		http://www.asianmint.com/	https://www.facebook.com/AsianMintDallas	2143636655
108	Komali	2014-11-06 18:11:34.897621	2014-11-06 18:11:34.897621	Komali.png	image/png	5265	2014-11-06 18:11:33.95635		http://www.komalirestaurant.com/	http://www.facebook.com/pages/Komali-Restaurant/111079825635508	2142520200
109	Daddy Jack’s 	2014-11-06 18:11:47.48237	2014-11-06 18:11:47.48237	Daddy_Jack’s_.png	image/png	84077	2014-11-06 18:11:46.832686		http://daddyjacks.org/	https://www.facebook.com/pages/Daddy-Jacks-Lobster-and-Chowder-House/137394696314688	2148264910
110	Suze Restaurant	2014-11-06 18:12:06.837678	2014-11-06 18:12:06.837678	Suze_Restaurant.jpg	image/jpeg	30029	2014-11-06 18:12:04.47919		http://www.suzedallas.com/	https://www.facebook.com/pages/Suze/233814466688179	2143506135
111	Mr. Wok Asian Bistro	2014-11-06 18:12:18.160541	2014-11-06 18:12:18.160541	Mr._Wok_Asian_Bistro.jpg	image/jpeg	29928	2014-11-06 18:12:17.075925		http://www.mr-wok.com/	https://www.facebook.com/pages/Mr-Wok-Asian-Bistro/105859739436453	9728811888
112	Celebration	2014-11-06 18:12:28.322953	2014-11-06 18:12:28.322953	Celebration.jpg	image/jpeg	42983	2014-11-06 18:12:27.437713		http://www.celebrationrestaurant.com/	https://www.facebook.com/CelebrationRestaurant	2143515681
113	Deli-News	2014-11-06 18:12:52.416002	2014-11-06 18:12:52.416002	Deli-News.jpg	image/jpeg	49333	2014-11-06 18:12:51.332846		http://delinewsdallas.com/	https://www.facebook.com/DeliNewsDallas	9727333354
114	Babe’s Chicken Dinner House	2014-11-06 18:13:09.679348	2014-11-06 18:13:09.679348	Babe’s_Chicken_Dinner_House.jpg	image/jpeg	215818	2014-11-06 18:13:07.831027		http://www.babeschicken.com/	https://www.facebook.com/babeschicken	9724961041
115	Garden Cafe	2014-11-06 18:13:18.819561	2014-11-06 18:13:18.819561	Garden_Cafe.jpg	image/jpeg	27490	2014-11-06 18:13:18.10157		http://www.gardencafe.net/	https://www.facebook.com/gardencafedallas	2148878330
116	Sweet Georgia Brown	2014-11-06 18:13:33.135621	2014-11-06 18:13:33.135621	\N	\N	\N	\N				2143752020
117	Da Won	2014-11-06 18:13:50.382738	2014-11-06 18:13:50.382738	Da_Won.jpg	image/jpeg	27512	2014-11-06 18:13:48.572137				9725168948
118	Pepe’s & Mito’s Mexican Cafe	2014-11-06 18:14:02.575745	2014-11-06 18:14:02.575745	Pepe’s___Mito’s_Mexican_Cafe.jpg	image/jpeg	87616	2014-11-06 18:13:58.102589			https://www.facebook.com/pepesandmitos	2147411901
119	S&D Oyster Company	2014-11-06 18:14:14.935281	2014-11-06 18:14:14.935281	S_D_Oyster_Company.png	image/png	93069	2014-11-06 18:14:12.223544		http://sdoyster.com/		2148800111
120	Sundown at Granada	2014-11-06 18:14:25.566967	2014-11-06 18:14:25.566967	Sundown_at_Granada.jpg	image/jpeg	88093	2014-11-06 18:14:24.162006		http://sundownatgranada.com/	https://www.facebook.com/sundownatgranada	2148238305
121	Meshack’s Bar-B-Que Shack	2014-11-06 18:14:43.346543	2014-11-06 18:14:43.346543	Meshack’s_Bar-B-Que_Shack.jpg	image/jpeg	209373	2014-11-06 18:14:42.400837				2142274748
122	Goodfriend Beer Garden and Burger House	2014-11-06 18:14:50.656357	2014-11-06 18:14:50.656357	Goodfriend_Beer_Garden_and_Burger_House.jpg	image/jpeg	8553	2014-11-06 18:14:49.101596		http://goodfrienddallas.com/	https://www.facebook.com/pages/Goodfriend-beer-garden-and-burger-house/129762000426143	2143243335
124	Kuby’s Sausage House	2014-11-06 18:15:23.3883	2014-11-06 18:15:23.3883	Kuby’s_Sausage_House.gif	image/gif	6499	2014-11-06 18:15:18.454073		http://www.kubys.com/	https://www.facebook.com/KubysSausageHouse	2143632231
125	Urban Crust	2014-11-06 18:15:31.385775	2014-11-06 18:15:31.385775	Urban_Crust.png	image/png	36489	2014-11-06 18:15:29.940513		http://www.urbancrust.com/	https://www.facebook.com/UrbanCrust	9725091400
126	Cuquita’s	2014-11-06 18:15:44.427801	2014-11-06 18:15:44.427801	Cuquita’s.png	image/png	46495	2014-11-06 18:15:43.653809		http://cuquitasrestaurants.com/	https://www.facebook.com/cuquitasrestaurant	2145753188
127	Wingfield’s Breakfast & Burger	2014-11-06 18:15:57.024764	2014-11-06 18:15:57.024764	\N	\N	\N	\N		http://www.wingfieldsbreakfastandburgers.com/		2149435214
128	Good 2 Go Taco	2014-11-06 18:16:18.673148	2014-11-06 18:16:18.673148	Good_2_Go_Taco.png	image/png	419670	2014-11-06 18:16:17.697205		http://www.good2gotaco.com/	https://www.facebook.com/good2gotaco	2145199110
129	Wild Salsa	2014-11-06 18:16:25.568539	2014-11-06 18:16:25.568539	Wild_Salsa.png	image/png	74803	2014-11-06 18:16:24.743233		http://www.wildsalsarestaurant.com/	https://www.facebook.com/WildSalsa	2147419453
130	Urban Rio	2014-11-06 18:16:39.967088	2014-11-06 18:16:39.967088	Urban_Rio.png	image/png	31853	2014-11-06 18:16:39.112637		http://www.urbanrio.com/		9724224466
131	Mi Cocina	2014-11-06 18:16:49.536673	2014-11-06 18:16:49.536673	Mi_Cocina.png	image/png	4469	2014-11-06 18:16:48.765124		http://www.micocinarestaurants.com/locations/preston_forest.html	https://www.facebook.com/MiCocinaPrestonForest	2142657704
132	Kalachandji’s Palace and Restaurant	2014-11-06 18:17:02.987539	2014-11-06 18:17:02.987539	Kalachandji’s_Palace_and_Restaurant.png	image/png	81220	2014-11-06 18:17:01.981382		http://www.kalachandjis.com/	https://www.facebook.com/kalachandjis	2148211048
134	Veracruz Cafe	2014-11-06 18:17:27.552372	2014-11-06 18:17:27.552372	Veracruz_Cafe.jpg	image/jpeg	11361	2014-11-06 18:17:26.601959		http://veracruzcafedallas.com/	https://www.facebook.com/veracruzcafedallas	2149484746
135	Meso Maya	2014-11-06 18:17:38.947686	2014-11-06 18:17:38.947686	Meso_Maya.jpg	image/jpeg	46533	2014-11-06 18:17:37.896953		http://mesomaya.com/	https://www.facebook.com/MesoMayaDallas	4697264390
136	Mia’s Tex-Mex Restaurant	2014-11-06 18:17:54.797266	2014-11-06 18:17:54.797266	Mia’s_Tex-Mex_Restaurant.gif	image/gif	4407	2014-11-06 18:17:51.487625		http://www.miastexmex.com/	https://www.facebook.com/pages/Mias-Tex-Mex-Restaurant/122480384469446	2145261020
137	Local	2014-11-06 18:18:01.572179	2014-11-06 18:18:01.572179	Local.jpg	image/jpeg	2178	2014-11-06 18:18:00.832894		http://www.localdallas.com/		2147527500
123	Dish Restaurant and Lounge	2014-11-06 18:15:04.516105	2014-11-06 18:30:57.283204	Dish_Restaurant_and_Lounge.png	image/png	7248	2014-11-06 18:30:56.548926		http://www.dish-dallas.com/	https://www.facebook.com/dishdining	2145223474
133	AllGood Cafe	2014-11-06 18:17:14.502686	2014-11-06 18:33:00.579148	AllGood_Cafe.jpg	image/jpeg	10954	2014-11-06 18:32:58.583526		http://www.allgoodcafe.com/	https://www.facebook.com/pages/AllGood-Cafe/193211137408678	2147425362
\.


--
-- Name: restaurants_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lveelmpsvfquhu
--

SELECT pg_catalog.setval('restaurants_id_seq', 137, true);


--
-- Data for Name: rests; Type: TABLE DATA; Schema: public; Owner: lveelmpsvfquhu
--

COPY rests (id, restaurant_name, meal_name, meal_price, restaurant_area, restaurant_address, cuisine_type, created_at, updated_at, picture_file_name, picture_content_type, picture_file_size, picture_updated_at) FROM stdin;
\.


--
-- Name: rests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lveelmpsvfquhu
--

SELECT pg_catalog.setval('rests_id_seq', 5, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: lveelmpsvfquhu
--

COPY schema_migrations (version) FROM stdin;
20141004165358
20141004174850
20141007191311
20141007191424
20141007191546
20141007223054
20141007223127
20141023010340
20141103215704
20141104185833
20141104191808
20141104194055
20141124180608
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: lveelmpsvfquhu
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at, admin) FROM stdin;
2	rscappaticci.jr@gmail.com	$2a$10$4XFLIaN79HXxZeR37l.okuYwsH/pqvKd9ghpsiZXruGsFIu8kzB.q	\N	\N	\N	1	2014-11-04 18:38:29.632374	2014-11-04 18:38:29.632374	192.136.229.129	192.136.229.129	2014-11-04 18:38:29.620164	2014-11-04 18:38:29.635169	\N
1	colton@coltonseal.com	$2a$10$iPTMLCd4vSDHemq/kERaaeQjRY20GSsxAnaoH.KlPFmd5yxU.DudS	\N	\N	\N	8	2014-11-22 00:38:43.752688	2014-11-13 00:26:22.798314	192.136.229.129	192.136.229.129	2014-11-04 18:38:03.106543	2014-11-22 00:38:43.755659	\N
3	admin@dishflip.com	$2a$10$OgcunqWBmakKhv2vUzYMPOveEDSvklbw15CJmVkf/y/OI0hx5qc2q	\N	\N	\N	5	2014-11-24 21:36:07.856528	2014-11-24 21:34:47.636712	192.136.229.129	117.212.23.176	2014-11-05 15:30:25.454499	2014-11-24 21:36:59.833905	\N
4	root@dishflip.com	$2a$10$sivDR/WHV9MnjLiAIcS4LeH/InUXvDxv/hebOKjZy5dlA4QnySi6W	\N	\N	\N	1	2014-11-24 22:46:32.611053	2014-11-24 22:46:32.611053	192.136.229.129	192.136.229.129	2014-11-24 22:46:02.602304	2014-11-24 22:46:32.613585	t
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: lveelmpsvfquhu
--

SELECT pg_catalog.setval('users_id_seq', 4, true);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: meals_pkey; Type: CONSTRAINT; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

ALTER TABLE ONLY meals
    ADD CONSTRAINT meals_pkey PRIMARY KEY (id);


--
-- Name: restaurants_pkey; Type: CONSTRAINT; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

ALTER TABLE ONLY restaurants
    ADD CONSTRAINT restaurants_pkey PRIMARY KEY (id);


--
-- Name: rests_pkey; Type: CONSTRAINT; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

ALTER TABLE ONLY rests
    ADD CONSTRAINT rests_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: lveelmpsvfquhu; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- PostgreSQL database dump complete
--

