--
-- PostgreSQL database dump
--

-- Dumped from database version 14.2 (Ubuntu 14.2-1.pgdg20.04+1)
-- Dumped by pg_dump version 14.2

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

DROP DATABASE IF EXISTS pepepizza;
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

--
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA public;


ALTER SCHEMA public OWNER TO postgres;

--
-- Name: SCHEMA public; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA public IS 'standard public schema';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: drinks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.drinks (
    id integer NOT NULL,
    name character varying,
    product_id integer,
    image character varying,
    "imageL" character varying
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
-- Name: entrees; Type: TABLE; Schema: public; Owner: pepe
--

CREATE TABLE public.entrees (
    id integer NOT NULL,
    name character varying NOT NULL,
    product_id integer,
    image character varying
);


ALTER TABLE public.entrees OWNER TO pepe;

--
-- Name: entrees_id_seq; Type: SEQUENCE; Schema: public; Owner: pepe
--

CREATE SEQUENCE public.entrees_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.entrees_id_seq OWNER TO pepe;

--
-- Name: entrees_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pepe
--

ALTER SEQUENCE public.entrees_id_seq OWNED BY public.entrees.id;


--
-- Name: ingredients; Type: TABLE; Schema: public; Owner: pepe
--

CREATE TABLE public.ingredients (
    id integer NOT NULL,
    name character varying NOT NULL,
    price double precision NOT NULL,
    product_id integer
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
    description character varying DEFAULT 'Cette pizza est délicieuse'::character varying,
    product_id integer
);


ALTER TABLE public.pizzas OWNER TO pepe;

--
-- Name: pizzas_id_seq; Type: SEQUENCE; Schema: public; Owner: pepe
--

ALTER TABLE public.pizzas ALTER COLUMN id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public.pizzas_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: price; Type: TABLE; Schema: public; Owner: pepe
--

CREATE TABLE public.price (
    id integer NOT NULL,
    m double precision,
    l double precision,
    xl double precision,
    product_id integer
);


ALTER TABLE public.price OWNER TO pepe;

--
-- Name: price_id_seq; Type: SEQUENCE; Schema: public; Owner: pepe
--

CREATE SEQUENCE public.price_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.price_id_seq OWNER TO pepe;

--
-- Name: price_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: pepe
--

ALTER SEQUENCE public.price_id_seq OWNED BY public.price.id;


--
-- Name: product; Type: TABLE; Schema: public; Owner: pepe
--

CREATE TABLE public.product (
    id integer NOT NULL,
    name character varying(50)
);


ALTER TABLE public.product OWNER TO pepe;

--
-- Name: product_sequence_id; Type: SEQUENCE; Schema: public; Owner: pepe
--

CREATE SEQUENCE public.product_sequence_id
    AS integer
    START WITH 0
    INCREMENT BY 1
    MINVALUE 0
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_sequence_id OWNER TO pepe;

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
-- Name: entrees id; Type: DEFAULT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.entrees ALTER COLUMN id SET DEFAULT nextval('public.entrees_id_seq'::regclass);


--
-- Name: price id; Type: DEFAULT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.price ALTER COLUMN id SET DEFAULT nextval('public.price_id_seq'::regclass);


--
-- Name: shipping id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shipping ALTER COLUMN id SET DEFAULT nextval('public.shipping_id_seq'::regclass);


--
-- Data for Name: drinks; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO public.drinks (id, name, product_id, image, "imageL") VALUES (1, 'Coca-cola', 26, 'assets/boissons/coca33.png', 'assets/boissons/cocabottle.png');
INSERT INTO public.drinks (id, name, product_id, image, "imageL") VALUES (2, 'Fanta', 27, 'assets/boissons/fanta33.png', 'assets/boissons/fantabottle.png');
INSERT INTO public.drinks (id, name, product_id, image, "imageL") VALUES (3, 'Coca-cola Zero', 28, 'assets/boissons/cocazero33.png', 'assets/boissons/cocazerobottle.png');
INSERT INTO public.drinks (id, name, product_id, image, "imageL") VALUES (4, 'Sprite', 29, 'assets/boissons/sprite33.png', 'assets/boissons/spritebottle.png');


--
-- Data for Name: entrees; Type: TABLE DATA; Schema: public; Owner: pepe
--

INSERT INTO public.entrees (id, name, product_id, image) VALUES (4, 'Mozza Sticks', 33, 'assets/entrees/mozzasticks.png');
INSERT INTO public.entrees (id, name, product_id, image) VALUES (6, 'Tenders', 35, 'assets/entrees/tenders.png');
INSERT INTO public.entrees (id, name, product_id, image) VALUES (5, 'Chevre Sticks', 34, 'assets/entrees/chevresticks.png');
INSERT INTO public.entrees (id, name, product_id, image) VALUES (3, 'Wings', 32, 'assets/entrees/wings.png');
INSERT INTO public.entrees (id, name, product_id, image) VALUES (2, 'Nuggets', 31, 'assets/entrees/nuggets.png');


--
-- Data for Name: ingredients; Type: TABLE DATA; Schema: public; Owner: pepe
--

INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Poivron', 0.5, 12);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (9, 'Ananas', 0.5, 17);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Poulet', 2.5, 10);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Crème fraiche', 0.5, 9);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (16, 'Mozarella', 0, 24);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (8, 'Piment rouge', 0.5, 16);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (0, 'Viande hachée', 1.5, 8);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (17, 'Sauce curry', 0, 25);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (11, 'Anchois', 1.5, 19);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (10, 'Champignons', 0.5, 18);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (5, 'Chorizo', 1.5, 13);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (15, 'Oignons', 0.5, 23);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (7, 'Miel', 0.5, 15);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (14, 'Merguez', 3, 22);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (13, 'Dinde', 1.5, 21);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (6, 'Boursin', 0.5, 14);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (3, 'Poulet Tikka', 3, 11);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (12, 'Mais', 0.5, 20);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (38, 'Olives', 0, 30);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (41, 'Sauce Américaine', 0, 38);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (39, 'Sauce Chili Thaï', 0, 36);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (40, 'Sauce Columbo', 0, 37);
INSERT INTO public.ingredients (id, name, price, product_id) OVERRIDING SYSTEM VALUE VALUES (42, 'Sauce Barbecue', 0, 39);


--
-- Data for Name: pizzas; Type: TABLE DATA; Schema: public; Owner: pepe
--

INSERT INTO public.pizzas (id, name, image, description, product_id) OVERRIDING SYSTEM VALUE VALUES (5, 'Antillaise', 'assets/pizza/Antillaise.png', 'Cette pizza est délicieuse', 4);
INSERT INTO public.pizzas (id, name, image, description, product_id) OVERRIDING SYSTEM VALUE VALUES (0, 'Bollywood', 'assets/pizza/Bollywood.png', 'Cette pizza Bollywood est délicieuse incroyable wallah', 7);
INSERT INTO public.pizzas (id, name, image, description, product_id) OVERRIDING SYSTEM VALUE VALUES (2, 'Miel', 'assets/pizza/Miel.png', 'Jamais vu une pizza au miel sans chèvre mais c''est pas moi qui fait les recettes donc bon', 1);
INSERT INTO public.pizzas (id, name, image, description, product_id) OVERRIDING SYSTEM VALUE VALUES (6, 'Américaine', 'assets/pizza/Americaine.png', 'This pizza tastes like the American Dream and Freedom', 5);
INSERT INTO public.pizzas (id, name, image, description, product_id) OVERRIDING SYSTEM VALUE VALUES (1, 'Indienne', 'assets/pizza/Indienne.png', 'By Rayan for Rayan', 0);
INSERT INTO public.pizzas (id, name, image, description, product_id) OVERRIDING SYSTEM VALUE VALUES (7, 'Buffalo', 'assets/pizza/Buffalo.png', 'Alors cette pizza vous allez jamais y croire, en fait...', 6);
INSERT INTO public.pizzas (id, name, image, description, product_id) OVERRIDING SYSTEM VALUE VALUES (4, 'Pimento', 'assets/pizza/Pimento.png', 'Une pizza un peu piquante là hmm, trop bon', 3);
INSERT INTO public.pizzas (id, name, image, description, product_id) OVERRIDING SYSTEM VALUE VALUES (3, 'La Boursin', 'assets/pizza/Boursin.png', 'Un peu comme une margherita mais avec du boursin et du poulet, jsp frr', 2);


--
-- Data for Name: price; Type: TABLE DATA; Schema: public; Owner: pepe
--

INSERT INTO public.price (id, m, l, xl, product_id) VALUES (1, 6.9, 8.9, 10.9, 7);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (2, 7.4, 9.9, 11.4, 0);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (3, 7.4, 9.4, 11.4, 1);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (4, 6.9, 8.9, 10.9, 2);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (5, 7.9, 9.9, 11.9, 3);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (6, 7.9, 9.9, 11.9, 4);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (7, 6.4, 8.4, 10.4, 5);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (8, 6.4, 8.4, 10.4, 6);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (9, 1.5, NULL, NULL, 8);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (10, 0.5, NULL, NULL, 9);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (11, 1.5, NULL, NULL, 10);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (12, 1.5, NULL, NULL, 11);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (13, 0.5, NULL, NULL, 12);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (14, 1.5, NULL, NULL, 13);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (15, 0.5, NULL, NULL, 14);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (16, 0.5, NULL, NULL, 15);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (17, 0.5, NULL, NULL, 16);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (18, 0.5, NULL, NULL, 17);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (19, 0.5, NULL, NULL, 18);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (20, 1.5, NULL, NULL, 19);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (21, 0.5, NULL, NULL, 20);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (22, 1.5, NULL, NULL, 21);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (23, 1.5, NULL, NULL, 22);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (24, 0.5, NULL, NULL, 23);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (25, 0, NULL, NULL, 24);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (26, 0, NULL, NULL, 25);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (28, 2, 2.5, 3, 27);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (30, 2, 2.5, 3, 29);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (29, 2, 2.5, 3, 28);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (27, 2, 2.5, 3, 26);
INSERT INTO public.price (id, m, l, xl, product_id) VALUES (31, 0.5, NULL, NULL, 30);


--
-- Data for Name: product; Type: TABLE DATA; Schema: public; Owner: pepe
--

INSERT INTO public.product (id, name) VALUES (26, 'Coca-cola');
INSERT INTO public.product (id, name) VALUES (27, 'Fanta');
INSERT INTO public.product (id, name) VALUES (28, 'Coca-cola Zero');
INSERT INTO public.product (id, name) VALUES (29, 'Sprite');
INSERT INTO public.product (id, name) VALUES (30, 'Olives');
INSERT INTO public.product (id, name) VALUES (31, 'Nuggets');
INSERT INTO public.product (id, name) VALUES (32, 'Wings');
INSERT INTO public.product (id, name) VALUES (33, 'Mozza Sticks');
INSERT INTO public.product (id, name) VALUES (34, 'Chevre Sticks');
INSERT INTO public.product (id, name) VALUES (35, 'Tenders');
INSERT INTO public.product (id, name) VALUES (36, 'Sauce Chili Thaï');
INSERT INTO public.product (id, name) VALUES (37, 'Sauce Columbo');
INSERT INTO public.product (id, name) VALUES (38, 'Sauce Américaine');
INSERT INTO public.product (id, name) VALUES (39, 'Sauce Barbecue');
INSERT INTO public.product (id, name) VALUES (0, 'Indienne');
INSERT INTO public.product (id, name) VALUES (1, 'Miel');
INSERT INTO public.product (id, name) VALUES (2, 'La Boursin');
INSERT INTO public.product (id, name) VALUES (3, 'Pimento');
INSERT INTO public.product (id, name) VALUES (4, 'Antillaise');
INSERT INTO public.product (id, name) VALUES (5, 'Américaine');
INSERT INTO public.product (id, name) VALUES (6, 'Buffalo');
INSERT INTO public.product (id, name) VALUES (7, 'Bollywood');
INSERT INTO public.product (id, name) VALUES (8, 'Viande hachée');
INSERT INTO public.product (id, name) VALUES (9, 'Crème fraiche');
INSERT INTO public.product (id, name) VALUES (10, 'Poulet');
INSERT INTO public.product (id, name) VALUES (11, 'Poulet Tikka');
INSERT INTO public.product (id, name) VALUES (12, 'Poivron');
INSERT INTO public.product (id, name) VALUES (13, 'Chorizo');
INSERT INTO public.product (id, name) VALUES (14, 'Boursin');
INSERT INTO public.product (id, name) VALUES (15, 'Miel');
INSERT INTO public.product (id, name) VALUES (16, 'Piment rouge');
INSERT INTO public.product (id, name) VALUES (17, 'Ananas');
INSERT INTO public.product (id, name) VALUES (18, 'Champignons');
INSERT INTO public.product (id, name) VALUES (19, 'Anchois');
INSERT INTO public.product (id, name) VALUES (20, 'Mais');
INSERT INTO public.product (id, name) VALUES (21, 'Dinde');
INSERT INTO public.product (id, name) VALUES (22, 'Merguez');
INSERT INTO public.product (id, name) VALUES (23, 'Oignons');
INSERT INTO public.product (id, name) VALUES (24, 'Mozarella');
INSERT INTO public.product (id, name) VALUES (25, 'Sauce curry');


--
-- Data for Name: recipes; Type: TABLE DATA; Schema: public; Owner: pepe
--

INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (0, 0, 17);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (1, 0, 16);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (2, 0, 1);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (3, 0, 2);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (4, 0, 15);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (5, 0, 4);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (6, 1, 17);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (7, 1, 16);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (8, 1, 0);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (9, 1, 3);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (10, 1, 12);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (11, 2, 7);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (12, 2, 16);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (13, 2, 1);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (14, 2, 13);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (15, 2, 14);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (16, 2, 4);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (17, 3, 6);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (18, 3, 16);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (19, 3, 1);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (20, 3, 2);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (21, 3, 10);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (22, 4, 39);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (23, 4, 16);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (24, 4, 2);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (25, 4, 5);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (26, 4, 8);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (27, 4, 38);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (28, 5, 40);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (29, 5, 16);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (30, 5, 0);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (31, 5, 2);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (32, 5, 10);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (33, 5, 38);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (34, 6, 41);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (35, 6, 16);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (36, 6, 0);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (37, 6, 6);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (38, 6, 4);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (39, 7, 42);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (40, 7, 16);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (41, 7, 4);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (42, 7, 0);
INSERT INTO public.recipes (id, pizza_id, ingredient_id) OVERRIDING SYSTEM VALUE VALUES (43, 7, 15);


--
-- Data for Name: shipping; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: pepe
--

INSERT INTO public.users (id, email, password, slices, address, postal_code, credit_card, exp_date, cvv, phone) OVERRIDING SYSTEM VALUE VALUES (0, 'qsdhsqdqs@gmail.com', 'rayan', 0, '9 rue du iolpai', 83293, NULL, NULL, NULL, '02331233');
INSERT INTO public.users (id, email, password, slices, address, postal_code, credit_card, exp_date, cvv, phone) OVERRIDING SYSTEM VALUE VALUES (1, 'bah.awaa@gmail.com', '11111', 0, 'Square Georges Contenot', 75012, NULL, NULL, NULL, '0626228591');
INSERT INTO public.users (id, email, password, slices, address, postal_code, credit_card, exp_date, cvv, phone) OVERRIDING SYSTEM VALUE VALUES (2, 'bah.awaa@gmail.com', '1111', 0, 'Square Georges Contenot', 75012, NULL, NULL, NULL, '0626228591');
INSERT INTO public.users (id, email, password, slices, address, postal_code, credit_card, exp_date, cvv, phone) OVERRIDING SYSTEM VALUE VALUES (3, 'bah.awaa@gmail.com', '111', 0, 'Square Georges Contenot', 75012, NULL, NULL, NULL, '0626228591');


--
-- Name: drinks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.drinks_id_seq', 17, true);


--
-- Name: entrees_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepe
--

SELECT pg_catalog.setval('public.entrees_id_seq', 6, true);


--
-- Name: ingredients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepe
--

SELECT pg_catalog.setval('public.ingredients_id_seq', 42, true);


--
-- Name: login_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepe
--

SELECT pg_catalog.setval('public.login_id_seq', 0, true);


--
-- Name: pizzas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepe
--

SELECT pg_catalog.setval('public.pizzas_id_seq', 36, true);


--
-- Name: price_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepe
--

SELECT pg_catalog.setval('public.price_id_seq', 31, true);


--
-- Name: product_sequence_id; Type: SEQUENCE SET; Schema: public; Owner: pepe
--

SELECT pg_catalog.setval('public.product_sequence_id', 29, true);


--
-- Name: recipes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: pepe
--

SELECT pg_catalog.setval('public.recipes_id_seq', 43, true);


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
-- Name: entrees entrees_pk; Type: CONSTRAINT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.entrees
    ADD CONSTRAINT entrees_pk PRIMARY KEY (id);


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
-- Name: price price_pk; Type: CONSTRAINT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_pk PRIMARY KEY (id);


--
-- Name: product product_pkey; Type: CONSTRAINT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.product
    ADD CONSTRAINT product_pkey PRIMARY KEY (id);


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
-- Name: price_id_uindex; Type: INDEX; Schema: public; Owner: pepe
--

CREATE UNIQUE INDEX price_id_uindex ON public.price USING btree (id);


--
-- Name: drinks drinks_drink_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.drinks
    ADD CONSTRAINT drinks_drink_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: entrees entrees_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.entrees
    ADD CONSTRAINT entrees_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: ingredients ingredients_product_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.ingredients
    ADD CONSTRAINT ingredients_product_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: pizzas pizzas_pizzas_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.pizzas
    ADD CONSTRAINT pizzas_pizzas_id_fkey FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- Name: price price_product_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: pepe
--

ALTER TABLE ONLY public.price
    ADD CONSTRAINT price_product_id_fk FOREIGN KEY (product_id) REFERENCES public.product(id);


--
-- PostgreSQL database dump complete
--

