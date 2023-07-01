--
-- PostgreSQL database dump
--

-- Dumped from database version 14.8
-- Dumped by pg_dump version 14.8

-- Started on 2023-07-01 00:46:08

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
-- TOC entry 214 (class 1259 OID 26123)
-- Name: ambientes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ambientes (
    idambiente integer NOT NULL,
    descripcion character varying(700),
    nombreambiente character varying(20)
);


ALTER TABLE public.ambientes OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 26122)
-- Name: ambientes_idambiente_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ambientes_idambiente_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ambientes_idambiente_seq OWNER TO postgres;

--
-- TOC entry 3335 (class 0 OID 0)
-- Dependencies: 213
-- Name: ambientes_idambiente_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ambientes_idambiente_seq OWNED BY public.ambientes.idambiente;


--
-- TOC entry 210 (class 1259 OID 26109)
-- Name: comensales; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.comensales (
    idcedula integer NOT NULL,
    nombre character varying(20),
    apellido character varying(20),
    telefono character varying(10),
    correo character varying(50),
    descripciondealergias character varying(200)
);


ALTER TABLE public.comensales OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 26108)
-- Name: comensales_idcedula_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.comensales_idcedula_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comensales_idcedula_seq OWNER TO postgres;

--
-- TOC entry 3336 (class 0 OID 0)
-- Dependencies: 209
-- Name: comensales_idcedula_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.comensales_idcedula_seq OWNED BY public.comensales.idcedula;


--
-- TOC entry 212 (class 1259 OID 26116)
-- Name: reservas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reservas (
    idreserva integer NOT NULL,
    fecha date,
    cantidadepersonas integer,
    idcedula integer,
    idambiente integer
);


ALTER TABLE public.reservas OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 26115)
-- Name: reservas_idreserva_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reservas_idreserva_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reservas_idreserva_seq OWNER TO postgres;

--
-- TOC entry 3337 (class 0 OID 0)
-- Dependencies: 211
-- Name: reservas_idreserva_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reservas_idreserva_seq OWNED BY public.reservas.idreserva;


--
-- TOC entry 3176 (class 2604 OID 26126)
-- Name: ambientes idambiente; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ambientes ALTER COLUMN idambiente SET DEFAULT nextval('public.ambientes_idambiente_seq'::regclass);


--
-- TOC entry 3174 (class 2604 OID 26112)
-- Name: comensales idcedula; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comensales ALTER COLUMN idcedula SET DEFAULT nextval('public.comensales_idcedula_seq'::regclass);


--
-- TOC entry 3175 (class 2604 OID 26119)
-- Name: reservas idreserva; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas ALTER COLUMN idreserva SET DEFAULT nextval('public.reservas_idreserva_seq'::regclass);


--
-- TOC entry 3329 (class 0 OID 26123)
-- Dependencies: 214
-- Data for Name: ambientes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ambientes (idambiente, descripcion, nombreambiente) FROM stdin;
1	Es un ambiente que te transporta directamente a una cocina italiana tradicional. Las paredes de ladrillo expuesto y los azulejos coloridos crean un ambiente cálido y acogedor. En las paredes, encontrarás estantes llenos de hierbas frescas, ollas de cobre relucientes y utensilios de cocina colgando, dándole a este espacio un ambiente auténtico. El aroma de los sabrosos platos italianos impregna el aire, mientras que una gran mesa comunal en el centro del ambiente permite a los comensales disfrutar de la experiencia de ver a los chefs preparar la comida frente a ellos. Con un ambiente animado y vibrante, "La Cucina" ofrece una experiencia gastronómica auténtica y emocionante.	La Cucina
2	Es un ambiente inspirado en las tradicionales bodegas italianas. Las paredes de ladrillo rústico y los tonos oscuros crean una atmósfera íntima y acogedora. Las estanterías de vino cuidadosamente organizadas exhiben una extensa selección de vinos italianos, desde tintos robustos hasta blancos refrescantes. Las barricas de madera añaden un toque auténtico, y las luces suaves y cálidas realzan la sensación de intimidad. Los comensales pueden disfrutar de una amplia variedad de platos italianos que maridan perfectamente con los vinos disponibles. "La Cantina" es el lugar ideal para los amantes del vino y aquellos que buscan una experiencia gastronómica sofisticada y elegante.	La cantina
3	Es un espacio en la azotea que te transporta directamente a la atmósfera mediterránea de Italia. Con vistas panorámicas que abarcan la ciudad y un paisaje encantador, este ambiente al aire libre te brinda la sensación de estar en una terraza italiana. La decoración está inspirada en la vida al aire libre, con muebles de mimbre cómodos, cojines brillantes y plantas colgantes que crean un ambiente fresco y relajante. Puedes disfrutar de una comida o una copa mientras contemplas el horizonte, sintiendo la brisa cálida y escuchando música italiana de fondo. La Terrazza es el lugar perfecto para disfrutar de una experiencia gastronómica al aire libre y vivir la esencia de Italia en cada momento.	La Terraza
\.


--
-- TOC entry 3325 (class 0 OID 26109)
-- Dependencies: 210
-- Data for Name: comensales; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.comensales (idcedula, nombre, apellido, telefono, correo, descripciondealergias) FROM stdin;
\.


--
-- TOC entry 3327 (class 0 OID 26116)
-- Dependencies: 212
-- Data for Name: reservas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reservas (idreserva, fecha, cantidadepersonas, idcedula, idambiente) FROM stdin;
\.


--
-- TOC entry 3338 (class 0 OID 0)
-- Dependencies: 213
-- Name: ambientes_idambiente_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ambientes_idambiente_seq', 1, false);


--
-- TOC entry 3339 (class 0 OID 0)
-- Dependencies: 209
-- Name: comensales_idcedula_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.comensales_idcedula_seq', 1, false);


--
-- TOC entry 3340 (class 0 OID 0)
-- Dependencies: 211
-- Name: reservas_idreserva_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reservas_idreserva_seq', 1, false);


--
-- TOC entry 3182 (class 2606 OID 26130)
-- Name: ambientes ambientes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ambientes
    ADD CONSTRAINT ambientes_pkey PRIMARY KEY (idambiente);


--
-- TOC entry 3178 (class 2606 OID 26114)
-- Name: comensales comensales_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.comensales
    ADD CONSTRAINT comensales_pkey PRIMARY KEY (idcedula);


--
-- TOC entry 3180 (class 2606 OID 26121)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (idreserva);


--
-- TOC entry 3184 (class 2606 OID 26136)
-- Name: reservas fk_idambiente; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fk_idambiente FOREIGN KEY (idambiente) REFERENCES public.ambientes(idambiente);


--
-- TOC entry 3183 (class 2606 OID 26131)
-- Name: reservas fk_idcedula; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reservas
    ADD CONSTRAINT fk_idcedula FOREIGN KEY (idcedula) REFERENCES public.comensales(idcedula);


-- Completed on 2023-07-01 00:46:08

--
-- PostgreSQL database dump complete
--

