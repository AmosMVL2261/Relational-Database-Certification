CREATE DATABASE universe;

\c universe;

CREATE TABLE galaxy();
CREATE TABLE star();
CREATE TABLE planet();
CREATE TABLE moon();

ALTER TABLE galaxy ADD COLUMN galaxy_id SERIAL PRIMARY KEY;
ALTER TABLE star ADD COLUMN star_id SERIAL PRIMARY KEY;
ALTER TABLE planet ADD COLUMN planet_id SERIAL PRIMARY KEY;
ALTER TABLE moon ADD COLUMN moon_id SERIAL PRIMARY KEY;

ALTER TABLE galaxy ADD COLUMN name VARCHAR(50) NOT NULL UNIQUE;
ALTER TABLE star ADD COLUMN name VARCHAR(50) NOT NULL UNIQUE;
ALTER TABLE planet ADD COLUMN name VARCHAR(50) NOT NULL UNIQUE;
ALTER TABLE moon ADD COLUMN name VARCHAR(50) NOT NULL UNIQUE;

ALTER TABLE galaxy ADD COLUMN age_in_millions_of_years INT;
ALTER TABLE galaxy ADD COLUMN number_of_stars_in_millions INT;
ALTER TABLE star ADD COLUMN age_in_millions_of_years INT;
ALTER TABLE star ADD COLUMN number_of_planets INT;
ALTER TABLE planet ADD COLUMN age_in_millions_of_years INT;
ALTER TABLE planet ADD COLUMN number_of_moons INT;
ALTER TABLE moon ADD COLUMN age_in_millions_of_years INT;
ALTER TABLE moon ADD COLUMN discovery_year INT;

ALTER TABLE galaxy ADD COLUMN radius_in_millions_of_km NUMERIC NOT NULL;
ALTER TABLE star ADD COLUMN radius_in_millions_of_km NUMERIC NOT NULL;
ALTER TABLE planet ADD COLUMN radius_in_millions_of_km NUMERIC NOT NULL;
ALTER TABLE moon ADD COLUMN radius_in_millions_of_km NUMERIC NOT NULL;

ALTER TABLE galaxy ADD COLUMN galaxy_type TEXT;
ALTER TABLE star ADD COLUMN star_type TEXT;
ALTER TABLE planet ADD COLUMN planet_type TEXT;
ALTER TABLE moon ADD COLUMN description TEXT;

ALTER TABLE galaxy ADD COLUMN is_visible BOOLEAN;
ALTER TABLE galaxy ADD COLUMN has_a_black_hole BOOLEAN;
ALTER TABLE star ADD COLUMN is_visible BOOLEAN;
ALTER TABLE star ADD COLUMN is_binary BOOLEAN;
ALTER TABLE planet ADD COLUMN is_visible BOOLEAN;
ALTER TABLE planet ADD COLUMN has_life BOOLEAN;
ALTER TABLE moon ADD COLUMN is_visible BOOLEAN;
ALTER TABLE moon ADD COLUMN is_spherical BOOLEAN;

CREATE TABLE galaxy_group(
	galaxy_group_id SERIAL PRIMARY KEY,
	name VARCHAR(50) NOT NULL UNIQUE,
	radius_in_millions_of_km NUMERIC NOT NULL
);

ALTER TABLE galaxy ADD COLUMN galaxy_group_id INT REFERENCES galaxy_group(galaxy_group_id);
ALTER TABLE star ADD COLUMN galaxy_id INT REFERENCES galaxy(galaxy_id);
ALTER TABLE planet ADD COLUMN star_id INT REFERENCES star(star_id);
ALTER TABLE moon ADD COLUMN planet_id INT REFERENCES planet(planet_id);


-- Insertar datos de prueba para galaxy_group
INSERT INTO galaxy_group (name, radius_in_millions_of_km)
VALUES
    ('Local Group', 3.0),
    ('Virgo Cluster', 15.0),
    ('Coma Cluster', 20.0),
    ('Centaurus Cluster', 18.0),
    ('Perseus Cluster', 17.0),
    ('Hercules Cluster', 19.0),
    ('Fornax Cluster', 13.0),
    ('Antlia Cluster', 11.0),
    ('Hydra Cluster', 12.0),
    ('Leo Cluster', 14.0);

-- Insertar datos de prueba para galaxy
INSERT INTO galaxy (name, age_in_millions_of_years, number_of_stars_in_millions, radius_in_millions_of_km, galaxy_type, is_visible, has_a_black_hole, galaxy_group_id)
VALUES
    ('Milky Way', 13600, 250000, 0.526, 'Spiral', TRUE, TRUE, 1),
    ('Andromeda', 10000, 1000000, 0.22, 'Spiral', TRUE, TRUE, 1),
    ('Triangulum', 7300, 40000, 0.06, 'Spiral', TRUE, FALSE, 1),
    ('Virgo A', 12000, 150000, 0.7, 'Elliptical', TRUE, TRUE, 2),
    ('M87', 13000, 200000, 1.2, 'Elliptical', TRUE, TRUE, 2),
    ('NGC 4696', 13800, 180000, 0.98, 'Elliptical', TRUE, FALSE, 4),
    ('Centaurus A', 16000, 100000, 0.47, 'Elliptical', TRUE, TRUE, 4),
    ('NGC 4038', 4500, 3000, 0.065, 'Interacting', TRUE, FALSE, 8),
    ('NGC 4039', 4500, 3000, 0.065, 'Interacting', TRUE, FALSE, 8),
    ('Hydra A', 12000, 120000, 0.85, 'Elliptical', TRUE, TRUE, 9);

-- Insertar datos de prueba para star
INSERT INTO star (name, age_in_millions_of_years, number_of_planets, radius_in_millions_of_km, star_type, is_visible, is_binary, galaxy_id)
VALUES
    ('Sun', 4600, 8, 0.696, 'G-type', TRUE, FALSE, 1),
    ('Proxima Centauri', 4500, 1, 0.069, 'M-type', TRUE, FALSE, 1),
    ('Betelgeuse', 10000, 0, 0.887, 'M-type', TRUE, FALSE, 1),
    ('Sirius', 242, 2, 0.119, 'A-type', TRUE, TRUE, 1),
    ('Rigel', 8000, 3, 0.785, 'B-type', TRUE, FALSE, 1),
    ('Alpha Centauri', 4600, 1, 0.696, 'G-type', TRUE, TRUE, 1),
    ('Barnards Star', 7500, 2, 0.07, 'M-type', TRUE, FALSE, 1),
    ('Vega', 455, 0, 0.243, 'A-type', TRUE, FALSE, 1),
    ('Polaris', 70000, 0, 0.45, 'F-type', TRUE, TRUE, 1),
    ('Arcturus', 7300, 0, 0.267, 'K-type', TRUE, FALSE, 1);

-- Insertar datos de prueba para planet
INSERT INTO planet (name, age_in_millions_of_years, number_of_moons, radius_in_millions_of_km, planet_type, is_visible, has_life, star_id)
VALUES
    ('Earth', 4500, 1, 0.006371, 'Terrestrial', TRUE, TRUE, 1),
    ('Mars', 4500, 2, 0.003389, 'Terrestrial', TRUE, FALSE, 1),
    ('Jupiter', 4500, 79, 0.069911, 'Gas Giant', TRUE, FALSE, 1),
    ('Saturn', 4500, 83, 0.058232, 'Gas Giant', TRUE, FALSE, 1),
    ('Venus', 4500, 0, 0.006052, 'Terrestrial', TRUE, FALSE, 1),
    ('Mercury', 4500, 0, 0.00244, 'Terrestrial', TRUE, FALSE, 1),
    ('Neptune', 4500, 14, 0.024622, 'Ice Giant', TRUE, FALSE, 1),
    ('Uranus', 4500, 27, 0.025362, 'Ice Giant', TRUE, FALSE, 1),
    ('Proxima b', 4500, 0, 0.00715, 'Terrestrial', TRUE, TRUE, 2),
    ('Kepler-22b', 6000, 0, 0.021, 'Exoplanet', TRUE, TRUE, 3),
    ('Gliese 581g', 7000, 0, 0.015, 'Exoplanet', TRUE, TRUE, 2),
    ('TRAPPIST-1d', 8000, 0, 0.006, 'Exoplanet', TRUE, FALSE, 3),
    ('HD 209458b', 6000, 0, 0.016, 'Gas Giant', TRUE, FALSE, 3),
    ('Kepler-452b', 8000, 0, 0.009, 'Exoplanet', TRUE, TRUE, 2),
    ('Tau Ceti f', 5000, 0, 0.008, 'Terrestrial', TRUE, FALSE, 3),
    ('Luyten b', 4000, 0, 0.007, 'Terrestrial', TRUE, TRUE, 2),
    ('Wolf 1061c', 6000, 0, 0.006, 'Terrestrial', TRUE, FALSE, 2),
    ('GJ 1214b', 9000, 0, 0.025, 'Mini-Neptune', TRUE, FALSE, 3),
    ('HD 189733b', 5500, 0, 0.013, 'Gas Giant', TRUE, FALSE, 3);

-- Insertar datos de prueba para moon
INSERT INTO moon (name, age_in_millions_of_years, discovery_year, radius_in_millions_of_km, description, is_visible, is_spherical, planet_id)
VALUES
    ('Moon', 4500, -4000, 0.001737, 'Earth''s only natural satellite', TRUE, TRUE, 1),
    ('Phobos', 4500, 1877, 0.000011, 'One of Mars'' moons', TRUE, FALSE, 2),
    ('Deimos', 4500, 1877, 0.000006, 'One of Mars'' moons', TRUE, FALSE, 2),
    ('Io', 4500, 1610, 0.001821, 'Moon of Jupiter', TRUE, TRUE, 3),
    ('Europa', 4500, 1610, 0.00156, 'Moon of Jupiter', TRUE, TRUE, 3),
    ('Ganymede', 4500, 1610, 0.002634, 'Moon of Jupiter', TRUE, TRUE, 3),
    ('Callisto', 4500, 1610, 0.00241, 'Moon of Jupiter', TRUE, TRUE, 3),
    ('Titan', 4500, 1655, 0.002575, 'Moon of Saturn', TRUE, TRUE, 4),
    ('Rhea', 4500, 1672, 0.000763, 'Moon of Saturn', TRUE, TRUE, 4),
    ('Triton', 4500, 1846, 0.001353, 'Moon of Neptune', TRUE, TRUE, 5),
    ('Oberon', 4500, 1787, 0.000761, 'Moon of Uranus', TRUE, TRUE, 8),
    ('Titania', 4500, 1787, 0.000788, 'Moon of Uranus', TRUE, TRUE, 8),
    ('Umbriel', 4500, 1851, 0.000584, 'Moon of Uranus', TRUE, TRUE, 8),
    ('Ariel', 4500, 1851, 0.000579, 'Moon of Uranus', TRUE, TRUE, 8),
    ('Miranda', 4500, 1948, 0.000235, 'Moon of Uranus', TRUE, TRUE, 8),
    ('Enceladus', 4500, 1789, 0.000252, 'Moon of Saturn', TRUE, TRUE, 4),
    ('Mimas', 4500, 1789, 0.000198, 'Moon of Saturn', TRUE, TRUE, 4),
    ('Hyperion', 4500, 1848, 0.000135, 'Moon of Saturn', TRUE, FALSE, 4),
    ('Iapetus', 4500, 1671, 0.000734, 'Moon of Saturn', TRUE, TRUE, 4),
    ('Charon', 4500, 1978, 0.000606, 'Moon of Pluto', TRUE, TRUE, 9),
    ('Nix', 4500, 2005, 0.000019, 'Moon of Pluto', TRUE, FALSE, 9),
    ('Hydra', 4500, 2005, 0.000023, 'Moon of Pluto', TRUE, FALSE, 9),
    ('Kerberos', 4500, 2011, 0.000012, 'Moon of Pluto', TRUE, FALSE, 9),
    ('Styx', 4500, 2012, 0.000016, 'Moon of Pluto', TRUE, FALSE, 9);
















****************************************************************************************************



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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    number_of_stars_in_millions integer,
    radius_in_millions_of_km numeric NOT NULL,
    galaxy_type text,
    is_visible boolean,
    has_a_black_hole boolean,
    galaxy_group_id integer
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
-- Name: galaxy_group; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_group (
    galaxy_group_id integer NOT NULL,
    name character varying(50) NOT NULL,
    radius_in_millions_of_km numeric NOT NULL
);


ALTER TABLE public.galaxy_group OWNER TO freecodecamp;

--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_group_galaxy_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_group_galaxy_group_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_group_galaxy_group_id_seq OWNED BY public.galaxy_group.galaxy_group_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    discovery_year integer,
    radius_in_millions_of_km numeric NOT NULL,
    description text,
    is_visible boolean,
    is_spherical boolean,
    planet_id integer
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
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    number_of_moons integer,
    radius_in_millions_of_km numeric NOT NULL,
    planet_type text,
    is_visible boolean,
    has_life boolean,
    star_id integer
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
    name character varying(50) NOT NULL,
    age_in_millions_of_years integer,
    number_of_planets integer,
    radius_in_millions_of_km numeric NOT NULL,
    star_type text,
    is_visible boolean,
    is_binary boolean,
    galaxy_id integer
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
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_group galaxy_group_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group ALTER COLUMN galaxy_group_id SET DEFAULT nextval('public.galaxy_group_galaxy_group_id_seq'::regclass);


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
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 250000, 0.526, 'Spiral', true, true, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 1000000, 0.22, 'Spiral', true, true, 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 7300, 40000, 0.06, 'Spiral', true, false, 1);
INSERT INTO public.galaxy VALUES (4, 'Virgo A', 12000, 150000, 0.7, 'Elliptical', true, true, 2);
INSERT INTO public.galaxy VALUES (5, 'M87', 13000, 200000, 1.2, 'Elliptical', true, true, 2);
INSERT INTO public.galaxy VALUES (6, 'NGC 4696', 13800, 180000, 0.98, 'Elliptical', true, false, 4);
INSERT INTO public.galaxy VALUES (7, 'Centaurus A', 16000, 100000, 0.47, 'Elliptical', true, true, 4);
INSERT INTO public.galaxy VALUES (8, 'NGC 4038', 4500, 3000, 0.065, 'Interacting', true, false, 8);
INSERT INTO public.galaxy VALUES (9, 'NGC 4039', 4500, 3000, 0.065, 'Interacting', true, false, 8);
INSERT INTO public.galaxy VALUES (10, 'Hydra A', 12000, 120000, 0.85, 'Elliptical', true, true, 9);


--
-- Data for Name: galaxy_group; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_group VALUES (1, 'Local Group', 3.0);
INSERT INTO public.galaxy_group VALUES (2, 'Virgo Cluster', 15.0);
INSERT INTO public.galaxy_group VALUES (3, 'Coma Cluster', 20.0);
INSERT INTO public.galaxy_group VALUES (4, 'Centaurus Cluster', 18.0);
INSERT INTO public.galaxy_group VALUES (5, 'Perseus Cluster', 17.0);
INSERT INTO public.galaxy_group VALUES (6, 'Hercules Cluster', 19.0);
INSERT INTO public.galaxy_group VALUES (7, 'Fornax Cluster', 13.0);
INSERT INTO public.galaxy_group VALUES (8, 'Antlia Cluster', 11.0);
INSERT INTO public.galaxy_group VALUES (9, 'Hydra Cluster', 12.0);
INSERT INTO public.galaxy_group VALUES (10, 'Leo Cluster', 14.0);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (10, 'Moon', 4500, -4000, 0.001737, 'Earth''s only natural satellite', true, true, 1);
INSERT INTO public.moon VALUES (11, 'Phobos', 4500, 1877, 0.000011, 'One of Mars'' moons', true, false, 2);
INSERT INTO public.moon VALUES (12, 'Deimos', 4500, 1877, 0.000006, 'One of Mars'' moons', true, false, 2);
INSERT INTO public.moon VALUES (13, 'Io', 4500, 1610, 0.001821, 'Moon of Jupiter', true, true, 3);
INSERT INTO public.moon VALUES (14, 'Europa', 4500, 1610, 0.00156, 'Moon of Jupiter', true, true, 3);
INSERT INTO public.moon VALUES (15, 'Ganymede', 4500, 1610, 0.002634, 'Moon of Jupiter', true, true, 3);
INSERT INTO public.moon VALUES (16, 'Callisto', 4500, 1610, 0.00241, 'Moon of Jupiter', true, true, 3);
INSERT INTO public.moon VALUES (17, 'Titan', 4500, 1655, 0.002575, 'Moon of Saturn', true, true, 4);
INSERT INTO public.moon VALUES (18, 'Rhea', 4500, 1672, 0.000763, 'Moon of Saturn', true, true, 4);
INSERT INTO public.moon VALUES (19, 'Triton', 4500, 1846, 0.001353, 'Moon of Neptune', true, true, 5);
INSERT INTO public.moon VALUES (20, 'Oberon', 4500, 1787, 0.000761, 'Moon of Uranus', true, true, 8);
INSERT INTO public.moon VALUES (21, 'Titania', 4500, 1787, 0.000788, 'Moon of Uranus', true, true, 8);
INSERT INTO public.moon VALUES (22, 'Umbriel', 4500, 1851, 0.000584, 'Moon of Uranus', true, true, 8);
INSERT INTO public.moon VALUES (23, 'Ariel', 4500, 1851, 0.000579, 'Moon of Uranus', true, true, 8);
INSERT INTO public.moon VALUES (24, 'Miranda', 4500, 1948, 0.000235, 'Moon of Uranus', true, true, 8);
INSERT INTO public.moon VALUES (25, 'Enceladus', 4500, 1789, 0.000252, 'Moon of Saturn', true, true, 4);
INSERT INTO public.moon VALUES (26, 'Mimas', 4500, 1789, 0.000198, 'Moon of Saturn', true, true, 4);
INSERT INTO public.moon VALUES (27, 'Hyperion', 4500, 1848, 0.000135, 'Moon of Saturn', true, false, 4);
INSERT INTO public.moon VALUES (28, 'Iapetus', 4500, 1671, 0.000734, 'Moon of Saturn', true, true, 4);
INSERT INTO public.moon VALUES (29, 'Charon', 4500, 1978, 0.000606, 'Moon of Pluto', true, true, 9);
INSERT INTO public.moon VALUES (30, 'Nix', 4500, 2005, 0.000019, 'Moon of Pluto', true, false, 9);
INSERT INTO public.moon VALUES (31, 'Hydra', 4500, 2005, 0.000023, 'Moon of Pluto', true, false, 9);
INSERT INTO public.moon VALUES (32, 'Kerberos', 4500, 2011, 0.000012, 'Moon of Pluto', true, false, 9);
INSERT INTO public.moon VALUES (33, 'Styx', 4500, 2012, 0.000016, 'Moon of Pluto', true, false, 9);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4500, 1, 0.006371, 'Terrestrial', true, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4500, 2, 0.003389, 'Terrestrial', true, false, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4500, 79, 0.069911, 'Gas Giant', true, false, 1);
INSERT INTO public.planet VALUES (4, 'Saturn', 4500, 83, 0.058232, 'Gas Giant', true, false, 1);
INSERT INTO public.planet VALUES (5, 'Venus', 4500, 0, 0.006052, 'Terrestrial', true, false, 1);
INSERT INTO public.planet VALUES (6, 'Mercury', 4500, 0, 0.00244, 'Terrestrial', true, false, 1);
INSERT INTO public.planet VALUES (7, 'Neptune', 4500, 14, 0.024622, 'Ice Giant', true, false, 1);
INSERT INTO public.planet VALUES (8, 'Uranus', 4500, 27, 0.025362, 'Ice Giant', true, false, 1);
INSERT INTO public.planet VALUES (9, 'Proxima b', 4500, 0, 0.00715, 'Terrestrial', true, true, 2);
INSERT INTO public.planet VALUES (10, 'Kepler-22b', 6000, 0, 0.021, 'Exoplanet', true, true, 3);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 7000, 0, 0.015, 'Exoplanet', true, true, 2);
INSERT INTO public.planet VALUES (13, 'TRAPPIST-1d', 8000, 0, 0.006, 'Exoplanet', true, false, 3);
INSERT INTO public.planet VALUES (14, 'HD 209458b', 6000, 0, 0.016, 'Gas Giant', true, false, 3);
INSERT INTO public.planet VALUES (15, 'Kepler-452b', 8000, 0, 0.009, 'Exoplanet', true, true, 2);
INSERT INTO public.planet VALUES (16, 'Tau Ceti f', 5000, 0, 0.008, 'Terrestrial', true, false, 3);
INSERT INTO public.planet VALUES (17, 'Luyten b', 4000, 0, 0.007, 'Terrestrial', true, true, 2);
INSERT INTO public.planet VALUES (18, 'Wolf 1061c', 6000, 0, 0.006, 'Terrestrial', true, false, 2);
INSERT INTO public.planet VALUES (19, 'GJ 1214b', 9000, 0, 0.025, 'Mini-Neptune', true, false, 3);
INSERT INTO public.planet VALUES (20, 'HD 189733b', 5500, 0, 0.013, 'Gas Giant', true, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600, 8, 0.696, 'G-type', true, false, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4500, 1, 0.069, 'M-type', true, false, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 10000, 0, 0.887, 'M-type', true, false, 1);
INSERT INTO public.star VALUES (4, 'Sirius', 242, 2, 0.119, 'A-type', true, true, 1);
INSERT INTO public.star VALUES (5, 'Rigel', 8000, 3, 0.785, 'B-type', true, false, 1);
INSERT INTO public.star VALUES (6, 'Alpha Centauri', 4600, 1, 0.696, 'G-type', true, true, 1);
INSERT INTO public.star VALUES (7, 'Barnards Star', 7500, 2, 0.07, 'M-type', true, false, 1);
INSERT INTO public.star VALUES (8, 'Vega', 455, 0, 0.243, 'A-type', true, false, 1);
INSERT INTO public.star VALUES (9, 'Polaris', 70000, 0, 0.45, 'F-type', true, true, 1);
INSERT INTO public.star VALUES (10, 'Arcturus', 7300, 0, 0.267, 'K-type', true, false, 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 10, true);


--
-- Name: galaxy_group_galaxy_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_group_galaxy_group_id_seq', 10, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 33, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 20, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 10, true);


--
-- Name: galaxy_group galaxy_group_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_name_key UNIQUE (name);


--
-- Name: galaxy_group galaxy_group_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_group
    ADD CONSTRAINT galaxy_group_pkey PRIMARY KEY (galaxy_group_id);


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
-- Name: galaxy galaxy_galaxy_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_group_id_fkey FOREIGN KEY (galaxy_group_id) REFERENCES public.galaxy_group(galaxy_group_id);


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

