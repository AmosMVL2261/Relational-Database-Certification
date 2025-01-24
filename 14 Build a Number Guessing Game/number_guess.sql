--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(100) NOT NULL,
    games_played integer DEFAULT 0,
    best_game_tries integer DEFAULT 9999
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('user_1737679437634', 2, 849);
INSERT INTO public.users VALUES ('user_1737678808611', 1, 439);
INSERT INTO public.users VALUES ('user_1737678808612', 1, 237);
INSERT INTO public.users VALUES ('user_1737679437635', 5, 216);
INSERT INTO public.users VALUES ('Amos', 2, 1);
INSERT INTO public.users VALUES ('user_1737679157668', 2, 515);
INSERT INTO public.users VALUES ('user_1737679157669', 5, 228);
INSERT INTO public.users VALUES ('user_1737679442381', 2, 91);
INSERT INTO public.users VALUES ('user_1737679298948', 2, 80);
INSERT INTO public.users VALUES ('user_1737679442382', 5, 195);
INSERT INTO public.users VALUES ('user_1737679298949', 5, 38);
INSERT INTO public.users VALUES ('user_1737679351335', 2, 249);
INSERT INTO public.users VALUES ('user_1737679486196', 2, 389);
INSERT INTO public.users VALUES ('user_1737679351336', 5, 69);
INSERT INTO public.users VALUES ('user_1737679486197', 5, 164);
INSERT INTO public.users VALUES ('user_1737679365536', 2, 615);
INSERT INTO public.users VALUES ('user_1737679365537', 5, 152);
INSERT INTO public.users VALUES ('user_1737679392418', 2, 663);
INSERT INTO public.users VALUES ('user_1737679498076', 2, 274);
INSERT INTO public.users VALUES ('user_1737679392419', 5, 20);
INSERT INTO public.users VALUES ('user_1737679498077', 5, 68);
INSERT INTO public.users VALUES ('user_1737679397359', 2, 499);
INSERT INTO public.users VALUES ('user_1737679397360', 5, 4);
INSERT INTO public.users VALUES ('user_1737679560883', 2, 178);
INSERT INTO public.users VALUES ('user_1737679422902', 2, 767);
INSERT INTO public.users VALUES ('user_1737679422903', 5, 300);
INSERT INTO public.users VALUES ('user_1737679560884', 5, 158);
INSERT INTO public.users VALUES ('user_1737679568694', 2, 272);
INSERT INTO public.users VALUES ('user_1737679568695', 5, 291);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (username);


--
-- PostgreSQL database dump complete
--

