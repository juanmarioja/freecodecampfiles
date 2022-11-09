--
-- PostgreSQL database dump
--
-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
SET
    statement_timeout = 0;

SET
    lock_timeout = 0;

SET
    idle_in_transaction_session_timeout = 0;

SET
    client_encoding = 'UTF8';

SET
    standard_conforming_strings = on;

SELECT
    pg_catalog.set_config('search_path', '', false);

SET
    check_function_bodies = false;

SET
    xmloption = content;

SET
    client_min_messages = warning;

SET
    row_security = off;

DROP DATABASE universe;

--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--
CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';

ALTER DATABASE universe OWNER TO freecodecamp;

\ connect universe
SET
    statement_timeout = 0;

SET
    lock_timeout = 0;

SET
    idle_in_transaction_session_timeout = 0;

SET
    client_encoding = 'UTF8';

SET
    standard_conforming_strings = on;

SELECT
    pg_catalog.set_config('search_path', '', false);

SET
    check_function_bodies = false;

SET
    xmloption = content;

SET
    client_min_messages = warning;

SET
    row_security = off;

SET
    default_tablespace = '';

SET
    default_table_access_method = heap;

--
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.constellation (
    constellation_id integer NOT NULL,
    name character varying(40) NOT NULL,
    modern_name character varying(40)
);

ALTER TABLE
    public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.constellation_constellation_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.constellation_constellation_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.constellation_constellation_id_seq OWNED BY public.constellation.constellation_id;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.galaxy (
    name character varying(40) NOT NULL,
    description text,
    galaxy_type character varying(40),
    galaxy_id integer NOT NULL,
    constellation_id integer
);

ALTER TABLE
    public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.galaxy_galaxy_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;

--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.moon (
    name character varying(40) NOT NULL,
    description text,
    was_explored boolean DEFAULT false,
    planet_id integer NOT NULL,
    moon_id integer NOT NULL
);

ALTER TABLE
    public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.moon_moon_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;

--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.planet (
    name character varying(40),
    satellites integer,
    inclination_to_ecliptic integer,
    description text,
    was_explored boolean DEFAULT false,
    star_id integer NOT NULL,
    planet_id integer NOT NULL
);

ALTER TABLE
    public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.planet_planet_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;

--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--
CREATE TABLE public.star (
    name character varying(40),
    distance_in_ly numeric(4, 1),
    description text,
    galaxy_id integer NOT NULL,
    star_id integer NOT NULL
);

ALTER TABLE
    public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--
CREATE SEQUENCE public.star_star_id_seq AS integer START WITH 1 INCREMENT BY 1 NO MINVALUE NO MAXVALUE CACHE 1;

ALTER TABLE
    public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--
ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;

--
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.constellation
ALTER COLUMN
    constellation_id
SET
    DEFAULT nextval(
        'public.constellation_constellation_id_seq' :: regclass
    );

--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.galaxy
ALTER COLUMN
    galaxy_id
SET
    DEFAULT nextval('public.galaxy_galaxy_id_seq' :: regclass);

--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.moon
ALTER COLUMN
    moon_id
SET
    DEFAULT nextval('public.moon_moon_id_seq' :: regclass);

--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.planet
ALTER COLUMN
    planet_id
SET
    DEFAULT nextval('public.planet_planet_id_seq' :: regclass);

--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.star
ALTER COLUMN
    star_id
SET
    DEFAULT nextval('public.star_star_id_seq' :: regclass);

--
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
    public.constellation
VALUES
    (1, 'Andromeda', NULL);

INSERT INTO
    public.constellation
VALUES
    (4, 'Sagittarius', NULL);

INSERT INTO
    public.constellation
VALUES
    (6, 'Ursa Major', NULL);

INSERT INTO
    public.constellation
VALUES
    (2, 'Corvus', 'Crow, Raven');

INSERT INTO
    public.constellation
VALUES
    (5, 'Coma Berenices', 'Berenice’s Hair');

INSERT INTO
    public.constellation
VALUES
    (3, 'Centaurus', 'The Centaur');

--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
    public.galaxy
VALUES
    (
        'Andromeda',
        'The Andromeda Galaxy, also known as Messier 31, M31, or NGC 224 and originally the Andromeda Nebula, is a barred spiral galaxy with diameter of about 46.56 kiloparsecs approximately 2.5 million light-years from Earth and the nearest large galaxy to the Milky Way.',
        'Barred spiral',
        1,
        1
    );

INSERT INTO
    public.galaxy
VALUES
    (
        'Antennae',
        'The Antennae Galaxies are undergoing a galactic collision. Located in the NGC 4038 group with five other galaxies, these two galaxies are known as the Antennae Galaxies because the two long tails of stars, gas and dust ejected from the galaxies as a result of the collision resemble an insect´s antennae.',
        'Ringtail',
        2,
        2
    );

INSERT INTO
    public.galaxy
VALUES
    (
        'Backward',
        'NGC 4622 is a face-on unbarred spiral galaxy with a very prominent ring structure located in the constellation Centaurus. The galaxy is a member of the Centaurus Cluster.',
        'Unbarred spiral',
        3,
        3
    );

INSERT INTO
    public.galaxy
VALUES
    (
        'Milky Way',
        'The Milky Way is the galaxy that includes our Solar System, with the name describing the galaxy´s appearance from Earth: a hazy band of light seen in the night sky formed from stars that cannot be individually distinguished by the naked eye.',
        'Barred spiral',
        4,
        4
    );

INSERT INTO
    public.galaxy
VALUES
    (
        'Black Eye',
        'The Black Eye Galaxy is a relatively isolated spiral galaxy 17 million light-years away in the mildly northern constellation of Coma Berenices. It was discovered by Edward Pigott in March 1779,',
        'Spiral',
        5,
        5
    );

INSERT INTO
    public.galaxy
VALUES
    (
        'Bode´s',
        'Messier 81 (also known as NGC 3031 or Bode´s Galaxy) is a grand design spiral galaxy about 12 million light-years away in the constellation Ursa Major.',
        'Unbarred spiral',
        6,
        6
    );

--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
    public.moon
VALUES
    (
        'Mimas',
        'Mimas, also designated Saturn I, is a moon of Saturn discovered in 1789 by William Herschel.',
        false,
        4,
        1
    );

INSERT INTO
    public.moon
VALUES
    (
        'Enceladus',
        'Enceladus is the sixth-largest moon of Saturn. It is about 500 kilometers in diameter, about a tenth of that of Saturn´s largest moon, Titan.',
        false,
        4,
        2
    );

INSERT INTO
    public.moon
VALUES
    (
        'Tethys',
        'Tethys, or Saturn III, is a mid-sized moon of Saturn about 1,060 km (660 mi) across.',
        false,
        4,
        3
    );

INSERT INTO
    public.moon
VALUES
    (
        'Dione',
        'Dione is a moon of Saturn. It was discovered by Italian astronomer Giovanni Domenico Cassini in 1684. It is named after the Titaness Dione of Greek mythology.',
        false,
        4,
        4
    );

INSERT INTO
    public.moon
VALUES
    (
        'Rhea',
        'Rhea is the second-largest moon of Saturn and the ninth-largest moon in the Solar System.',
        false,
        4,
        5
    );

INSERT INTO
    public.moon
VALUES
    (
        'Titan',
        'Titan is the largest moon of Saturn and the second-largest natural satellite in the Solar System. It is the only moon known to have a dense atmosphere, and is the only known object in space other than Earth on which clear evidence of stable bodies of surface liquid.',
        false,
        4,
        6
    );

INSERT INTO
    public.moon
VALUES
    (
        'Iapetus',
        'Iapetus is a moon of Saturn. It is the 24th of Saturn’s 83 known moons. With an estimated diameter of 1,469 km, it is the third-largest moon of Saturn and the eleventh-largest in the Solar System.',
        false,
        4,
        7
    );

INSERT INTO
    public.moon
VALUES
    (
        'Metis',
        'Metis, also known as Jupiter XVI, is the innermost known moon of Jupiter. It was discovered in 1979 in images taken by Voyager 1, and was named in 1983 after the first wife of Zeus, Metis.',
        false,
        7,
        8
    );

INSERT INTO
    public.moon
VALUES
    (
        'Adrastea',
        'Adrastea, also known as Jupiter XV, is the second by distance, and the smallest of the four inner moons of Jupiter. It was discovered in photographs taken by Voyager 2 in 1979.',
        false,
        7,
        9
    );

INSERT INTO
    public.moon
VALUES
    (
        'Amalthea',
        'Amalthea is a moon of Jupiter. It has the third closest orbit around Jupiter among known moons and was the fifth moon of Jupiter to be discovered, so it is also known as Jupiter V.',
        false,
        7,
        10
    );

INSERT INTO
    public.moon
VALUES
    (
        'Thebe',
        'Thebe, also known as Jupiter XIV, is the fourth of Jupiter´s moons by distance from the planet. It was discovered by Stephen P. Synnott in images from the Voyager 1 space probe taken on March 5, 1979, while making its flyby of Jupiter.',
        false,
        7,
        11
    );

INSERT INTO
    public.moon
VALUES
    (
        'Io',
        'Io, or Jupiter I, is the innermost and third-largest of the four Galilean moons of the planet Jupiter.',
        false,
        7,
        12
    );

INSERT INTO
    public.moon
VALUES
    (
        'Europa',
        'Europa, or Jupiter II, is the smallest of the four Galilean moons orbiting Jupiter, and the sixth-closest to the planet of all the 80 known moons of Jupiter.',
        false,
        7,
        13
    );

INSERT INTO
    public.moon
VALUES
    (
        'Ganymede',
        'Ganymede, a satellite of Jupiter, is the largest and most massive of the Solar System´s moons.',
        false,
        7,
        14
    );

INSERT INTO
    public.moon
VALUES
    (
        'Callisto',
        'Callisto, or Jupiter IV, is the second-largest moon of Jupiter, after Ganymede. It is the third-largest moon in the Solar System after Ganymede and Saturn´s largest moon Titan, and the largest object in the Solar System that may not be properly differentiated.',
        false,
        7,
        15
    );

INSERT INTO
    public.moon
VALUES
    (
        'Moon',
        'The Moon is Earth´s only natural satellite. Its diameter is about one-quarter the diameter of the Earth (comparable to the width of Australia).[16] The Moon is the fifth largest satellite in the Solar System',
        true,
        6,
        16
    );

INSERT INTO
    public.moon
VALUES
    (
        'Cordelia',
        'Cordelia is the innermost known moon of Uranus.',
        false,
        8,
        17
    );

INSERT INTO
    public.moon
VALUES
    (
        'Ophelia',
        'Ophelia is a moon of Uranus. It was discovered from the images taken by Voyager 2 on January 20, 1986, and was given the temporary designation S/1986 U 8.',
        false,
        8,
        18
    );

INSERT INTO
    public.moon
VALUES
    (
        'Bianca',
        'Bianca is an inner satellite of Uranus.',
        false,
        8,
        19
    );

INSERT INTO
    public.moon
VALUES
    (
        'Cressida',
        'Cressida is an inner satellite of Uranus. It was discovered from the images taken by Voyager 2 on 9 January 1986, and was given the temporary designation S/1986 U 3.',
        false,
        8,
        20
    );

INSERT INTO
    public.moon
VALUES
    (
        'Desdemona',
        'Desdemona is an inner satellite of Uranus. It was discovered from the images taken by Voyager 2 on 13 January 1986, and was given the temporary designation S/1986 U 6.',
        false,
        8,
        21
    );

--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
    public.planet
VALUES
    (
        'Mars',
        2,
        2,
        'Mars is the fourth planet from the Sun and the second-smallest planet in the Solar System, being larger than only Mercury.',
        true,
        4,
        1
    );

INSERT INTO
    public.planet
VALUES
    (
        'Venus',
        0,
        3,
        'Venus is the second planet from the Sun. It is sometimes called Earth´s "sister" or "twin" planet as it is almost as large and has a similar composition.',
        false,
        4,
        2
    );

INSERT INTO
    public.planet
VALUES
    (
        'Pluto',
        5,
        17,
        'Pluto (minor-planet designation: 134340 Pluto) is a dwarf planet in the Kuiper belt, a ring of bodies beyond the orbit of Neptune.',
        false,
        4,
        3
    );

INSERT INTO
    public.planet
VALUES
    (
        'Saturn',
        83,
        2,
        'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter.',
        false,
        4,
        4
    );

INSERT INTO
    public.planet
VALUES
    (
        'Mercury',
        0,
        7,
        'Mercury is the smallest planet in the Solar System and the closest to the Sun. Its orbit around the Sun takes 87.97 Earth days, the shortest of all the Sun´s planets.',
        false,
        4,
        5
    );

INSERT INTO
    public.planet
VALUES
    (
        'Earth',
        1,
        0,
        'Earth is the third planet from the Sun and the only astronomical object known to harbor life. While large volumes of water can be found throughout the Solar System, only Earth sustains liquid surface water. ',
        true,
        4,
        6
    );

INSERT INTO
    public.planet
VALUES
    (
        'Jupiter',
        80,
        1,
        'Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, but slightly less than one-thousandth the mass of the Sun.',
        false,
        4,
        7
    );

INSERT INTO
    public.planet
VALUES
    (
        'Neptune',
        14,
        2,
        'Neptune is the eighth planet from the Sun and the farthest known solar planet. In the Solar System, it is the fourth-largest planet by diameter, the third-most-massive planet, and the densest giant planet. ',
        false,
        4,
        9
    );

INSERT INTO
    public.planet
VALUES
    (
        'Ceres',
        0,
        11,
        'Ceres is a dwarf planet in the asteroid belt between the orbits of Mars and Jupiter. It was the first asteroid discovered, on 1 January 1801, by Giuseppe Piazzi at Palermo Astronomical Observatory in Sicily, and announced as a new planet.',
        false,
        4,
        10
    );

INSERT INTO
    public.planet
VALUES
    (
        'Uranus',
        27,
        1,
        'Uranus is the seventh planet from the Sun. Its name is a reference to the Greek god of the sky, Uranus (Caelus), who, according to Greek mythology, was the great-grandfather of Ares (Mars), grandfather of Zeus (Jupiter) and father of Cronus (Saturn).',
        false,
        4,
        8
    );

INSERT INTO
    public.planet
VALUES
    (
        'Proxima Centauri b',
        NULL,
        NULL,
        'Proxima Centauri b, sometimes referred to as Alpha Centauri Cb, is an exoplanet orbiting in the habitable zone of the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of the triple star system Alpha Centauri.',
        false,
        7,
        12
    );

INSERT INTO
    public.planet
VALUES
    (
        'Proxima Centauri c',
        NULL,
        NULL,
        'Proxima Centauri c is a controversial exoplanet candidate claimed to be orbiting the red dwarf star Proxima Centauri, which is the closest star to the Sun and part of a triple star system. ',
        false,
        7,
        13
    );

INSERT INTO
    public.planet
VALUES
    (
        'Proxima Centauri d',
        NULL,
        NULL,
        'Proxima Centauri d is a candidate exoplanet orbiting the red dwarf star Proxima Centauri, the closest star to the Sun and part of the Alpha Centauri triple star system.',
        false,
        7,
        14
    );

--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--
INSERT INTO
    public.star
VALUES
    (
        'Alpheratz',
        97.0,
        'Alpha Andromedae (α Andromedae, abbreviated Alpha And or α And), officially named Alpheratz /æl`fɪəræts/,[12][13] is 97 light-years from the Sun and is the brightest star in the constellation of Andromeda when Beta Andromedae undergoes its periodical dimming. Immediately northeast of the constellation of Pegasus, it is the upper left star of the Great Square of Pegasus.',
        1,
        1
    );

INSERT INTO
    public.star
VALUES
    (
        'Sun',
        1.6,
        'The Sun is the star at the center of the Solar System. It is a nearly perfect ball of hot plasma, heated to incandescence by nuclear fusion reactions in its core.',
        4,
        2
    );

INSERT INTO
    public.star
VALUES
    (
        'Mirach',
        197.4,
        'Beta Andromedae, Latinized from β Andromedae, and officially named Mirach , is a prominent star in the northern constellation of Andromeda.',
        1,
        3
    );

INSERT INTO
    public.star
VALUES
    (
        'HD 104456',
        500.3,
        'High proper-motion Star',
        2,
        4
    );

INSERT INTO
    public.star
VALUES
    (
        'Gamma Centauri',
        130.2,
        'Gamma Centauri, Latinized from γ Centauri, is a binary star system in the southern constellation of Centaurus.',
        3,
        5
    );

INSERT INTO
    public.star
VALUES
    (
        '35 Comae Berenices B',
        324.1,
        'High proper-motion Star',
        5,
        6
    );

INSERT INTO
    public.star
VALUES
    (
        'Proxima Centauri',
        4.2,
        'Proxima Centauri is a small, low-mass star located 4.2465 light-years (1.3020 pc) away from the Sun in the southern constellation of Centaurus. ',
        3,
        7
    );

--
-- Name: constellation_constellation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
    pg_catalog.setval(
        'public.constellation_constellation_id_seq',
        6,
        true
    );

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
    pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);

--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
    pg_catalog.setval('public.moon_moon_id_seq', 21, true);

--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
    pg_catalog.setval('public.planet_planet_id_seq', 14, true);

--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--
SELECT
    pg_catalog.setval('public.star_star_id_seq', 7, true);

--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.constellation
ADD
    CONSTRAINT constellation_name_key UNIQUE (name);

--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.constellation
ADD
    CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);

--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.galaxy
ADD
    CONSTRAINT galaxy_name_key UNIQUE (name);

--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.galaxy
ADD
    CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);

--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.moon
ADD
    CONSTRAINT moon_name_key UNIQUE (name);

--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.moon
ADD
    CONSTRAINT moon_pkey PRIMARY KEY (moon_id);

--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.planet
ADD
    CONSTRAINT planet_name_key UNIQUE (name);

--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.planet
ADD
    CONSTRAINT planet_pkey PRIMARY KEY (planet_id);

--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.star
ADD
    CONSTRAINT star_name_key UNIQUE (name);

--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.star
ADD
    CONSTRAINT star_pkey PRIMARY KEY (star_id);

--
-- Name: galaxy galaxy_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.galaxy
ADD
    CONSTRAINT galaxy_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);

--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.moon
ADD
    CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);

--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.planet
ADD
    CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);

--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--
ALTER TABLE
    ONLY public.star
ADD
    CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);

--
-- PostgreSQL database dump complete
--