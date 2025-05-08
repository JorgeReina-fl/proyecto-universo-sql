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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text,
    galaxy_id integer
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    distance_in_ly numeric(10,0),
    brightness_class integer,
    diameter_in_kpc integer
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
    name character varying(30) NOT NULL,
    diameter_in_km numeric(10,1),
    planet_id integer,
    distance_from_planet_km numeric(10,1)
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
    description text,
    habitable boolean,
    name character varying(30) NOT NULL,
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
    name character varying(30) NOT NULL,
    bigger_than_sun boolean,
    galaxy_id integer,
    diameter_in_km integer
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellation_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (1, 'Ursa Major', 'El Carro Mayor (Norte).', NULL);
INSERT INTO public.constellation VALUES (2, 'Ursa Minor', 'Estrella Polar (Navegación).', NULL);
INSERT INTO public.constellation VALUES (3, 'Orion', 'Cinturón y nebulosa (Cazador).', NULL);
INSERT INTO public.constellation VALUES (4, 'Taurus', 'Toro (Aldebarán, Pléyades).', NULL);
INSERT INTO public.constellation VALUES (5, 'Gemini', 'Gemelos Cástor y Pólux.', NULL);
INSERT INTO public.constellation VALUES (6, 'Canis Major', 'Sirio, estrella más brillante.', NULL);
INSERT INTO public.constellation VALUES (7, 'Leo', 'León (Primavera Norte).', NULL);
INSERT INTO public.constellation VALUES (8, 'Virgo', 'La Virgen (Justicia, cosecha).', NULL);
INSERT INTO public.constellation VALUES (9, 'Libra', 'Balanza (Zodiacal no viva).', NULL);
INSERT INTO public.constellation VALUES (10, 'Scorpius', 'Escorpión (Antares).', NULL);
INSERT INTO public.constellation VALUES (11, 'Sagittarius', 'Arquero (Hacia centro Vía Láctea).', NULL);
INSERT INTO public.constellation VALUES (12, 'Capricornus', 'Cabra marina mitológica.', NULL);
INSERT INTO public.constellation VALUES (13, 'Aquarius', 'Aguador (Asociada a lluvias).', NULL);
INSERT INTO public.constellation VALUES (14, 'Pisces', 'Dos peces atados.', NULL);
INSERT INTO public.constellation VALUES (15, 'Aries', 'Carnero (Zodiacal).', NULL);
INSERT INTO public.constellation VALUES (16, 'Crux', 'Cruz del Sur (Navegación Sur).', NULL);
INSERT INTO public.constellation VALUES (17, 'Centaurus', 'Centauro (Sur, Próxima Centauri).', NULL);
INSERT INTO public.constellation VALUES (18, 'Cygnus', 'Cisne (Deneb, Triángulo Verano).', NULL);
INSERT INTO public.constellation VALUES (19, 'Lyra', 'Lira (Vega, Triángulo Verano).', NULL);
INSERT INTO public.constellation VALUES (20, 'Aquila', 'Águila (Altair, Triángulo Verano).', NULL);
INSERT INTO public.constellation VALUES (21, 'Andromeda', 'Princesa mitológica (Constelación).', NULL);
INSERT INTO public.constellation VALUES (22, 'Perseus', 'Héroe Perseo (Perseidas).', NULL);
INSERT INTO public.constellation VALUES (23, 'Cassiopeia', 'Forma de W o M.', NULL);
INSERT INTO public.constellation VALUES (24, 'Pegasus', 'Caballo alado (Gran Cuadrado).', NULL);
INSERT INTO public.constellation VALUES (25, 'Draco', 'Dragón (Serpentea Polo Norte).', NULL);
INSERT INTO public.constellation VALUES (26, 'Hercules', 'Héroe Hércules (Cúmulo M13).', NULL);
INSERT INTO public.constellation VALUES (27, 'Ophiuchus', 'Serpentario (13ª zodiacal?).', NULL);
INSERT INTO public.constellation VALUES (28, 'Bootes', 'Boyero (Estrella Arturo).', NULL);
INSERT INTO public.constellation VALUES (29, 'Canes Venatici', 'Perros de Caza (Pequeña).', NULL);
INSERT INTO public.constellation VALUES (30, 'Corona Borealis', 'Corona del Norte (Semicírculo).', NULL);
INSERT INTO public.constellation VALUES (31, 'Coma Berenices', 'Cabellera Berenice (Cúmulos galaxias).', NULL);
INSERT INTO public.constellation VALUES (32, 'Hydra', 'Serpiente acuática (Más grande).', NULL);
INSERT INTO public.constellation VALUES (33, 'Crater', 'La Copa (Pequeña).', NULL);
INSERT INTO public.constellation VALUES (34, 'Corvus', 'El Cuervo (Pequeña).', NULL);
INSERT INTO public.constellation VALUES (35, 'Lupus', 'El Lobo (Sur).', NULL);
INSERT INTO public.constellation VALUES (36, 'Ara', 'El Altar (Sur).', NULL);
INSERT INTO public.constellation VALUES (37, 'Triangulum Australe', 'Triángulo Austral (Sur).', NULL);
INSERT INTO public.constellation VALUES (38, 'Pavo', 'Pavo Real (Sur, estrellas brillantes).', NULL);
INSERT INTO public.constellation VALUES (39, 'Corazón de Andrómeda', 'Núcleo denso en Gal. Andrómeda.', 1);
INSERT INTO public.constellation VALUES (40, 'Espiral Menor del Triángulo', 'Patrón en brazo Gal. Triángulo.', 2);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Andrómeda', 2537000, 1, 67);
INSERT INTO public.galaxy VALUES (2, 'Galaxia del Triángulo', 3000000, 2, 18);
INSERT INTO public.galaxy VALUES (3, 'Galaxia del Sombrero', 29350000, 2, 15);
INSERT INTO public.galaxy VALUES (4, 'Expansión Xylosiana', 50000000, 3, 100);
INSERT INTO public.galaxy VALUES (5, 'Nebulosa Menor de Fornax', 7500000, 5, 2);
INSERT INTO public.galaxy VALUES (6, 'Centaurus A', 13000000, 1, 25);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3474.0, 1, 384400.0);
INSERT INTO public.moon VALUES (2, 'Minimus', 230.0, 1, 120000.0);
INSERT INTO public.moon VALUES (3, 'Fobos', 22.0, 2, 9377.0);
INSERT INTO public.moon VALUES (4, 'Deimos', 12.0, 2, 23460.0);
INSERT INTO public.moon VALUES (5, 'Europa II', 3122.0, 3, 670900.0);
INSERT INTO public.moon VALUES (6, 'Titanis', 5150.0, 3, 1221850.0);
INSERT INTO public.moon VALUES (7, 'Rhea Minor', 750.0, 3, 527000.0);
INSERT INTO public.moon VALUES (8, 'Xylos I', 150.0, 3, 180000.0);
INSERT INTO public.moon VALUES (9, 'Glacies', 400.0, 4, 65000.0);
INSERT INTO public.moon VALUES (10, 'Sylva', 800.0, 5, 150000.0);
INSERT INTO public.moon VALUES (11, 'Echo', 120.0, 5, 300000.0);
INSERT INTO public.moon VALUES (12, 'Kepler-186f I', 600.0, 6, 100000.0);
INSERT INTO public.moon VALUES (13, 'Ignis', 350.0, 7, 50000.0);
INSERT INTO public.moon VALUES (14, 'Thalassa Prime', 1100.0, 8, 220000.0);
INSERT INTO public.moon VALUES (15, 'Nereid Secundus', 340.0, 8, 450000.0);
INSERT INTO public.moon VALUES (16, 'Aura', 200.0, 9, 75000.0);
INSERT INTO public.moon VALUES (17, 'Banshee Rock', 80.0, 10, 40000.0);
INSERT INTO public.moon VALUES (18, 'Eywas Tear', 150.0, 10, 90000.0);
INSERT INTO public.moon VALUES (19, 'Chronos', 700.0, 11, 180000.0);
INSERT INTO public.moon VALUES (20, 'Umbra', 250.0, 12, 60000.0);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Planeta azul-verde con vida y océanos.', true, 'Tellus', 1);
INSERT INTO public.planet VALUES (5, 'Mundo selvático con atmósfera densa y flora brillante.', true, 'Veridia', 1);
INSERT INTO public.planet VALUES (2, 'Mundo desértico rocoso, cañones y ríos secos.', false, 'Ares Prime', 2);
INSERT INTO public.planet VALUES (3, 'Gigante gaseoso con anillos y grandes tormentas.', false, 'Xylos', 3);
INSERT INTO public.planet VALUES (8, 'Mundo oceánico con islas flotantes y vida submarina.', true, 'Aquaria', 3);
INSERT INTO public.planet VALUES (4, 'Planeta helado con glaciares y géiseres de N₂.', false, 'Cryonia', 4);
INSERT INTO public.planet VALUES (9, 'Atmósfera delgada, vientos supersónicos y dunas de cristal.', false, 'Zephyr', 4);
INSERT INTO public.planet VALUES (6, 'Exoplaneta en zona habitable de enana roja.', true, 'Kepler-186f', 5);
INSERT INTO public.planet VALUES (10, 'Luna de Avatar con rica biodiversidad y conexiones.', true, 'Pandora', 5);
INSERT INTO public.planet VALUES (7, 'Planeta volcánico activo con ríos de lava.', false, 'Magmor', 6);
INSERT INTO public.planet VALUES (11, 'Mundo antiguo con bibliotecas flotantes y guardianes.', true, 'Aethelgard', 6);
INSERT INTO public.planet VALUES (12, 'Planeta oscuro de roca volcánica y obsidiana.', false, 'Obsidius', 7);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Alpheratz', true, 1, 5300000);
INSERT INTO public.star VALUES (2, 'Mirach', true, 1, 139000000);
INSERT INTO public.star VALUES (3, 'Mothallah', true, 2, 2100000);
INSERT INTO public.star VALUES (4, 'Spica Sombrerii', false, 3, 1100000);
INSERT INTO public.star VALUES (5, 'Xylos Primus', true, 4, 14000000);
INSERT INTO public.star VALUES (6, 'Fornacis Lucida', false, 5, 420000);
INSERT INTO public.star VALUES (7, 'Centauri Gamma', true, 6, 28000000);


--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellation_id_seq', 40, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


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
-- Name: constellation constellation_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


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

