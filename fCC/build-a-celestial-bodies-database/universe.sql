--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: asteroid; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.asteroid (
    asteroid_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    description text,
    haswater boolean,
    hasair boolean
);


ALTER TABLE public.asteroid OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.asteroid_asteroid_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asteroid_asteroid_id_seq OWNER TO freecodecamp;

--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.asteroid_asteroid_id_seq OWNED BY public.asteroid.asteroid_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(100) NOT NULL,
    type character varying(50) NOT NULL,
    distance_from_earth integer,
    number_of_stars integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    planet_id integer,
    type character varying(50) NOT NULL,
    mass numeric(20,10),
    radius numeric(20,10)
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(100) NOT NULL,
    star_id integer,
    type character varying(50) NOT NULL,
    mass numeric(20,10),
    radius numeric(20,10)
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    galaxy_id integer,
    type character varying(50) NOT NULL,
    mass numeric(20,10),
    radius numeric(20,10)
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: asteroid asteroid_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid ALTER COLUMN asteroid_id SET DEFAULT nextval('public.asteroid_asteroid_id_seq'::regclass);


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: asteroid; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.asteroid VALUES (1, 'Ceres', 'Dwarf planet', 'The largest object in the asteroid belt', true, true);
INSERT INTO public.asteroid VALUES (2, 'Vesta', 'Asteroid', 'The second-largest asteroid in the asteroid belt', false, false);
INSERT INTO public.asteroid VALUES (3, 'Pallas', 'Asteroid', 'The third-largest asteroid in the asteroid belt', false, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 1, 1000);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 2537000, 1000);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 'Spiral', 3000000, 4000);
INSERT INTO public.galaxy VALUES (4, 'Whirlpool', 'Spiral', 23000000, 10000);
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 'Spiral', 29000000, 8000);
INSERT INTO public.galaxy VALUES (6, 'Messier 81', 'Spiral', 12000000, 25000);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 1, 'Natural satellite', 7.3422200000, 1.7376000000);
INSERT INTO public.moon VALUES (2, 'Phobos', 2, 'Natural satellite', 1.0659160000, 1.1400000000);
INSERT INTO public.moon VALUES (3, 'Deimos', 2, 'Natural satellite', 1.4762150000, 6.2300000000);
INSERT INTO public.moon VALUES (4, 'Io', 3, 'Natural satellite', 8.9319220000, 1.8216600000);
INSERT INTO public.moon VALUES (5, 'Europa', 3, 'Natural satellite', 4.7998220000, 1.5608600000);
INSERT INTO public.moon VALUES (6, 'Ganymede', 3, 'Natural satellite', 1.4819230000, 2.6341600000);
INSERT INTO public.moon VALUES (7, 'Callisto', 3, 'Natural satellite', 1.0759230000, 2.4103600000);
INSERT INTO public.moon VALUES (8, 'Titan', 4, 'Natural satellite', 1.3452230000, 2.5756000000);
INSERT INTO public.moon VALUES (9, 'Rhea', 4, 'Natural satellite', 2.3065210000, 7.6450000000);
INSERT INTO public.moon VALUES (10, 'Oberon', 5, 'Natural satellite', 3.0149210000, 7.6150000000);
INSERT INTO public.moon VALUES (11, 'Triton', 6, 'Natural satellite', 2.1422000000, 1.3534600000);
INSERT INTO public.moon VALUES (12, 'Enceladus', 4, 'Natural satellite', 1.0802220000, 2.5250000000);
INSERT INTO public.moon VALUES (13, 'Mimas', 4, 'Natural satellite', 3.7493190000, 1.9850000000);
INSERT INTO public.moon VALUES (14, 'Dione', 4, 'Natural satellite', 1.0955210000, 5.1250000000);
INSERT INTO public.moon VALUES (15, 'Tethys', 4, 'Natural satellite', 6.1744920000, 5.3150000000);
INSERT INTO public.moon VALUES (16, 'Iapetus', 4, 'Natural satellite', 1.8056352100, 7.4050000000);
INSERT INTO public.moon VALUES (17, 'Hyperion', 4, 'Natural satellite', 5.6180000000, 1.2500000000);
INSERT INTO public.moon VALUES (18, 'Phoebe', 4, 'Natural satellite', 8.2921800000, 1.0650000000);
INSERT INTO public.moon VALUES (19, 'Janus', 4, 'Natural satellite', 1.9180000000, 8.0400000000);
INSERT INTO public.moon VALUES (20, 'Epimetheus', 4, 'Natural satellite', 5.3170000000, 6.0400000000);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 'Terrestrial', 5.9722400000, 6.3716000000);
INSERT INTO public.planet VALUES (2, 'Mars', 1, 'Terrestrial', 6.4172300000, 3.3896000000);
INSERT INTO public.planet VALUES (3, 'Jupiter', 1, 'Gas giant', 1.8982700000, 6.9911700000);
INSERT INTO public.planet VALUES (4, 'Saturn', 1, 'Gas giant', 5.6832600000, 5.8232700000);
INSERT INTO public.planet VALUES (5, 'Uranus', 1, 'Ice giant', 8.6812500000, 2.5362700000);
INSERT INTO public.planet VALUES (6, 'Neptune', 1, 'Ice giant', 1.0242600000, 2.4622700000);
INSERT INTO public.planet VALUES (7, 'Kepler-22b', 2, 'Exoplanet', 2.4250000000, 2.4700000000);
INSERT INTO public.planet VALUES (8, 'HD 209458 b', 3, 'Exoplanet', 1.3127000000, 1.3880000000);
INSERT INTO public.planet VALUES (9, 'Gliese 581 c', 4, 'Exoplanet', 5.5240000000, 1.5700000000);
INSERT INTO public.planet VALUES (10, 'Kepler-186f', 5, 'Exoplanet', 4.0240000000, 1.1700000000);
INSERT INTO public.planet VALUES (11, 'Proxima Centauri b', 6, 'Exoplanet', 1.2725000000, 1.1700000000);
INSERT INTO public.planet VALUES (12, 'TRAPPIST-1e', 6, 'Exoplanet', 4.0240000000, 1.1700000000);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 1, 'G-type main-sequence', 1.9893000000, 6.9634800000);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 1, 'Red dwarf', 2.4462900000, 1.0800000000);
INSERT INTO public.star VALUES (3, 'Sirius', 1, 'A-type main-sequence', 4.0183000000, 1.7119000000);
INSERT INTO public.star VALUES (4, 'Betelgeuse', 1, 'Red supergiant', 1.2310000000, 6.0110000000);
INSERT INTO public.star VALUES (5, 'Rigel', 1, 'Blue supergiant', 3.5310000000, 7.0110000000);
INSERT INTO public.star VALUES (6, 'Vega', 1, 'A-type main-sequence', 4.1300000000, 2.3629000000);


--
-- Name: asteroid_asteroid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.asteroid_asteroid_id_seq', 1, false);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: asteroid asteroid_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_name_key UNIQUE (name);


--
-- Name: asteroid asteroid_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.asteroid
    ADD CONSTRAINT asteroid_pkey PRIMARY KEY (asteroid_id);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

