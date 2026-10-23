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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: guesses; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.guesses (
    guess_id integer NOT NULL,
    random_number integer NOT NULL,
    tries integer NOT NULL,
    user_id integer,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.guesses OWNER TO freecodecamp;

--
-- Name: guesses_guess_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.guesses_guess_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guesses_guess_id_seq OWNER TO freecodecamp;

--
-- Name: guesses_guess_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.guesses_guess_id_seq OWNED BY public.guesses.guess_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(50) NOT NULL,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: guesses guess_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses ALTER COLUMN guess_id SET DEFAULT nextval('public.guesses_guess_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: guesses; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.guesses VALUES (1, 510, 3, 1, '2026-10-23 09:15:38.665306');
INSERT INTO public.guesses VALUES (2, 318, 4, 1, '2026-10-23 09:20:18.927569');
INSERT INTO public.guesses VALUES (3, 996, 2, 2, '2026-10-23 09:23:49.118544');
INSERT INTO public.guesses VALUES (4, 10, 11, 3, '2026-10-23 09:25:56.667533');
INSERT INTO public.guesses VALUES (5, 732, 733, 4, '2026-10-23 09:25:57.164052');
INSERT INTO public.guesses VALUES (6, 295, 298, 3, '2026-10-23 09:25:57.392457');
INSERT INTO public.guesses VALUES (7, 803, 805, 3, '2026-10-23 09:25:57.661099');
INSERT INTO public.guesses VALUES (8, 58, 59, 3, '2026-10-23 09:25:57.859159');
INSERT INTO public.guesses VALUES (9, 281, 1, 2, '2026-10-23 09:30:04.769623');
INSERT INTO public.guesses VALUES (10, 726, 4, 2, '2026-10-23 09:31:58.976428');
INSERT INTO public.guesses VALUES (11, 572, 573, 5, '2026-10-23 09:32:22.721864');
INSERT INTO public.guesses VALUES (12, 59, 60, 6, '2026-10-23 09:32:23.152339');
INSERT INTO public.guesses VALUES (13, 222, 225, 5, '2026-10-23 09:32:23.37351');
INSERT INTO public.guesses VALUES (14, 698, 700, 5, '2026-10-23 09:32:23.649601');
INSERT INTO public.guesses VALUES (15, 46, 47, 5, '2026-10-23 09:32:23.854081');
INSERT INTO public.guesses VALUES (16, 734, 735, 7, '2026-10-23 09:33:19.251146');
INSERT INTO public.guesses VALUES (17, 560, 561, 8, '2026-10-23 09:33:19.745585');
INSERT INTO public.guesses VALUES (18, 151, 154, 7, '2026-10-23 09:33:19.983855');
INSERT INTO public.guesses VALUES (19, 411, 413, 7, '2026-10-23 09:33:20.212003');
INSERT INTO public.guesses VALUES (20, 452, 453, 7, '2026-10-23 09:33:20.484334');
INSERT INTO public.guesses VALUES (21, 584, 585, 9, '2026-10-23 09:34:55.496578');
INSERT INTO public.guesses VALUES (22, 243, 244, 10, '2026-10-23 09:34:55.904939');
INSERT INTO public.guesses VALUES (23, 702, 705, 9, '2026-10-23 09:34:56.167009');
INSERT INTO public.guesses VALUES (24, 585, 587, 9, '2026-10-23 09:34:56.413461');
INSERT INTO public.guesses VALUES (25, 741, 742, 9, '2026-10-23 09:34:56.686699');
INSERT INTO public.guesses VALUES (26, 443, 444, 11, '2026-10-23 09:39:21.714071');
INSERT INTO public.guesses VALUES (27, 572, 573, 12, '2026-10-23 09:39:22.21294');
INSERT INTO public.guesses VALUES (28, 14, 17, 11, '2026-10-23 09:39:22.407368');
INSERT INTO public.guesses VALUES (29, 298, 300, 11, '2026-10-23 09:39:22.633395');
INSERT INTO public.guesses VALUES (30, 104, 105, 11, '2026-10-23 09:39:22.839047');
INSERT INTO public.guesses VALUES (31, 139, 15, 1, '2026-10-23 09:43:03.618247');


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'test1', '2026-10-23 09:09:39.892282');
INSERT INTO public.users VALUES (2, 'test2', '2026-10-23 09:20:54.334136');
INSERT INTO public.users VALUES (3, 'user_1792761956237', '2026-10-23 09:25:56.399709');
INSERT INTO public.users VALUES (4, 'user_1792761956236', '2026-10-23 09:25:56.775441');
INSERT INTO public.users VALUES (5, 'user_1792762342285', '2026-10-23 09:32:22.41249');
INSERT INTO public.users VALUES (6, 'user_1792762342284', '2026-10-23 09:32:22.826545');
INSERT INTO public.users VALUES (7, 'user_1792762398761', '2026-10-23 09:33:18.927396');
INSERT INTO public.users VALUES (8, 'user_1792762398760', '2026-10-23 09:33:19.360188');
INSERT INTO public.users VALUES (9, 'user_1792762495037', '2026-10-23 09:34:55.172071');
INSERT INTO public.users VALUES (10, 'user_1792762495036', '2026-10-23 09:34:55.605878');
INSERT INTO public.users VALUES (11, 'user_1792762761252', '2026-10-23 09:39:21.367649');
INSERT INTO public.users VALUES (12, 'user_1792762761251', '2026-10-23 09:39:21.848162');


--
-- Name: guesses_guess_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.guesses_guess_id_seq', 31, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 12, true);


--
-- Name: guesses guesses_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_pkey PRIMARY KEY (guess_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: guesses guesses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.guesses
    ADD CONSTRAINT guesses_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

