--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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

DROP DATABASE pepepizza;
--
-- Name: pepepizza; Type: DATABASE; Schema: -; Owner: pepe
--

CREATE DATABASE pepepizza WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'C';


ALTER DATABASE pepepizza OWNER TO pepe;

\connect pepepizza

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

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: drinks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drinks (
    id integer NOT NULL,
    name character varying NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.drinks OWNER TO postgres;

--
-- Name: drinks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.drinks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.drinks_id_seq OWNER TO postgres;

--
-- Name: drinks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.drinks_id_seq OWNED BY public.drinks.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: pepe
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name character varying NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.ingredients OWNER TO pepe;

--
-- Name: ingredients_id_seq; Type: SEQUENCE; Schema: public; Owner: pepe
--

ALTER TABLE public.ingredients ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.ingredients_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: users; Type: TABLE; Schema: public; Owner: pepe
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    password character varying NOT NULL,
    slices integer DEFAULT 0 NOT NULL,
    address character varying,
    postal_code integer,
    credit_card integer,
    exp_date integer,
    cvv integer,
    phone character varying
);


ALTER TABLE public.users OWNER TO pepe;

--
-- Name: login_id_seq; Type: SEQUENCE; Schema: public; Owner: pepe
--

ALTER TABLE public.users ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.login_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: pizzas; Type: TABLE; Schema: public; Owner: pepe
--

CREATE TABLE public.pizzas (
    id integer NOT NULL,
    name character varying NOT NULL,
    image character varying,
    description character varying DEFAULT 'Cette pizza est délicieuse'::character varying
);


ALTER TABLE public.pizzas OWNER TO pepe;

--
-- Name: pizzas_id_seq; Type: SEQUENCE; Schema: public; Owner: pepe
--

ALTER TABLE public.pizzas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pizzas_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: recipes; Type: TABLE; Schema: public; Owner: pepe
--

CREATE TABLE public.recipes (
    id integer NOT NULL,
    pizza_id integer NOT NULL,
    ingredient_id integer NOT NULL
);


ALTER TABLE public.recipes OWNER TO pepe;

--
-- Name: recipes_id_seq; Type: SEQUENCE; Schema: public; Owner: pepe
--

ALTER TABLE public.recipes ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.recipes_id_seq
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1
);


--
-- Name: shipping; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shipping (
    id integer NOT NULL,
    city character varying NOT NULL,
    price double precision NOT NULL
);


ALTER TABLE public.shipping OWNER TO postgres;

--
-- Name: shipping_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.shipping_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.shipping_id_seq OWNER TO postgres;

--
-- Name: shipping_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.shipping_id_seq OWNED BY public.shipping.id;


--
-- Name: drinks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drinks ALTER COLUMN id SET DEFAULT nextval('public.drinks_id_seq'::regclass);


--
-- Name: shipping id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping ALTER COLUMN id SET DEFAULT nextval('public.shipping_id_seq'::regclass);


--
-- Data for Name: drinks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.drinks VALUES (1, 'Coca-Cola', 2);
INSERT INTO public.drinks VALUES (2, 'Minute Maid', 1.5);
INSERT INTO public.drinks VALUES (3, 'Tropico', 2.5);
INSERT INTO public.drinks VALUES (4, 'Evian', 4);


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: pepe
--

INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (0, 'Viande hachée', 1.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (1, 'Crème fraiche', 0.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (2, 'Poulet', 2.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (3, 'Poulet Tikka', 3);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (4, 'Poivron', 0.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (5, 'Chorizo', 1.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (6, 'Boursin', 0.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (7, 'Miel', 0.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (8, 'Piment rouge', 0.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (9, 'Ananas', 0.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (10, 'Champignons', 0.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (11, 'Anchois', 1.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (12, 'Mais', 0.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (13, 'Dinde', 1.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (14, 'Merguez', 3);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (15, 'Oignons', 0.5);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (16, 'Mozarella', 0);
INSERT INTO public.ingredients OVERRIDING SYSTEM VALUE VALUES (17, 'Sauce curry', 0);


--
-- Data for Name: pizzas; Type: TABLE DATA; Schema: public; Owner: pepe
--

INSERT INTO public.pizzas OVERRIDING SYSTEM VALUE VALUES (1, 'Indienne', 'assets/pizza/Indienne.png', 'Cette pizza est délicieuse');
INSERT INTO public.pizzas OVERRIDING SYSTEM VALUE VALUES (2, 'Miel', 'assets/pizza/Miel.png', 'Cette pizza est délicieuse');
INSERT INTO public.pizzas OVERRIDING SYSTEM VALUE VALUES (3, 'La Boursin', 'assets/pizza/Boursin.png', 'Cette pizza est délicieuse');
INSERT INTO public.pizzas OVERRIDING SYSTEM VALUE VALUES (4, 'Pimento', 'assets/pizza/Pimento.png', 'Cette pizza est délicieuse');
INSERT INTO public.pizzas OVERRIDING SYSTEM VALUE VALUES (5, 'Antillaise', 'assets/pizza/Antillaise.png', 'Cette pizza est délicieuse');
INSERT INTO public.pizzas OVERRIDING SYSTEM VALUE VALUES (6, 'Américaine', 'assets/pizza/Americaine.png', 'Cette pizza est délicieuse');
INSERT INTO public.pizzas OVERRIDING SYSTEM VALUE VALUES (7, 'Buffalo', 'assets/pizza/Buffalo.png', 'Cette pizza est délicieuse');
INSERT INTO public.pizzas OVERRIDING SYSTEM VALUE VALUES (0, 'Bollywood', 'assets/pizza/Bollywood.png', 'Cette pizza Bollywood est délicieuse incroyable wallah');


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: pepe
--

INSERT INTO public.recipes OVERRIDING SYSTEM VALUE VALUES (0, 0, 17);
INSERT INTO public.recipes OVERRIDING SYSTEM VALUE VALUES (1, 0, 16);
INSERT INTO public.recipes OVERRIDING SYSTEM VALUE VALUES (2, 0, 1);
INSERT INTO public.recipes OVERRIDING SYSTEM VALUE VALUES (3, 0, 2);
INSERT INTO public.recipes OVERRIDING SYSTEM VALUE VALUES (4, 0, 15);
INSERT INTO public.recipes OVERRIDING SYSTEM VALUE VALUES (5, 0, 4);


--
-- Data for Name: shipping; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.shipping VALUES (1, 'Paris', 0);
INSERT INTO public.shipping VALUES (2, 'Montreuil', 3.5);
INSERT INTO public.shipping VALUES (3, 'Kremlin-Bicêtre', 4.5);
INSERT INTO public.shipping VALUES (4, 'Créteil', 4);
INSERT INTO public.shipping VALUES (5, 'Villejuif', 6);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pepe
--

INSERT INTO public.users OVERRIDING SYSTEM VALUE VALUES (0, 'qsdhsqdqs@gmail.com', 'rayan', 0, '9 rue du iolpai', 83293, NULL, NULL, NULL, '02331233');


--
-- Name: drinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drinks_id_seq', 4, true);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepe
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 17, true);


--
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepe
--

SELECT pg_catalog.setval('public.login_id_seq', 0, true);


--
-- Name: pizzas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepe
--

SELECT pg_catalog.setval('public.pizzas_id_seq', 7, true);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepe
--

SELECT pg_catalog.setval('public.recipes_id_seq', 5, true);


--
-- Name: shipping_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.shipping_id_seq', 5, true);


--
-- Name: drinks drinks_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_pk PRIMARY KEY (id);


--
-- Name: ingredients ingredients_pkey; Type: CONSTRAINT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_pkey PRIMARY KEY (id);


--
-- Name: users login_pkey; Type: CONSTRAINT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT login_pkey PRIMARY KEY (id);


--
-- Name: pizzas pizzas_pkey; Type: CONSTRAINT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_pkey PRIMARY KEY (id);


--
-- Name: recipes recipes_pkey; Type: CONSTRAINT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.recipes
    ADD CONSTRAINT recipes_pkey PRIMARY KEY (id);


--
-- Name: shipping shipping_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping
    ADD CONSTRAINT shipping_pk PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

