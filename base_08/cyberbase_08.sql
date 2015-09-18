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
-- Name: adresse; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE adresse (
    id_adresse integer NOT NULL,
    complement_adresse character varying(40),
    numero_rue character varying(30),
    code_postal character(55),
    ville character varying(40) NOT NULL
);


ALTER TABLE adresse OWNER TO postgres;

--
-- Name: adresse_id_adresse_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE adresse_id_adresse_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE adresse_id_adresse_seq OWNER TO postgres;

--
-- Name: adresse_id_adresse_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE adresse_id_adresse_seq OWNED BY adresse.id_adresse;


--
-- Name: connexion_ldap; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE connexion_ldap (
    id_connexion_ldap integer NOT NULL,
    date_heur_debut date NOT NULL,
    date_heur_fin date NOT NULL,
    ip_connexion character varying(25),
    id_usager integer,
    id_poste integer NOT NULL
);


ALTER TABLE connexion_ldap OWNER TO postgres;

--
-- Name: connexion_ldap_id_connexion_ldap_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE connexion_ldap_id_connexion_ldap_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE connexion_ldap_id_connexion_ldap_seq OWNER TO postgres;

--
-- Name: connexion_ldap_id_connexion_ldap_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE connexion_ldap_id_connexion_ldap_seq OWNED BY connexion_ldap.id_connexion_ldap;


--
-- Name: personne; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE personne (
    id_personne integer NOT NULL,
    civilite character varying(25) NOT NULL,
    nom character varying(20) NOT NULL,
    prenom character varying(20) NOT NULL
);


ALTER TABLE personne OWNER TO postgres;

--
-- Name: personne_id_personne_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE personne_id_personne_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE personne_id_personne_seq OWNER TO postgres;

--
-- Name: personne_id_personne_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE personne_id_personne_seq OWNED BY personne.id_personne;


--
-- Name: poste; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE poste (
    id_poste integer NOT NULL,
    nom character varying(25) NOT NULL,
    libre_service__ boolean NOT NULL,
    actif__ boolean NOT NULL,
    id_salle integer NOT NULL
);


ALTER TABLE poste OWNER TO postgres;

--
-- Name: poste_id_poste_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE poste_id_poste_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE poste_id_poste_seq OWNER TO postgres;

--
-- Name: poste_id_poste_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE poste_id_poste_seq OWNED BY poste.id_poste;


--
-- Name: quartier_prioritaire; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE quartier_prioritaire (
    id_quartier integer NOT NULL,
    nom character varying(30) NOT NULL
);


ALTER TABLE quartier_prioritaire OWNER TO postgres;

--
-- Name: quartier_prioritaire_id_quartier_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE quartier_prioritaire_id_quartier_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE quartier_prioritaire_id_quartier_seq OWNER TO postgres;

--
-- Name: quartier_prioritaire_id_quartier_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE quartier_prioritaire_id_quartier_seq OWNED BY quartier_prioritaire.id_quartier;


--
-- Name: reservation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE reservation (
    id_reservation integer NOT NULL,
    raison character varying(30) NOT NULL,
    date_heur_deb date NOT NULL,
    date_heur_fin date NOT NULL,
    id_poste integer NOT NULL,
    id_user integer NOT NULL,
    id_usager integer,
    id_type_reservation integer NOT NULL
);


ALTER TABLE reservation OWNER TO postgres;

--
-- Name: reservation_id_reservation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE reservation_id_reservation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE reservation_id_reservation_seq OWNER TO postgres;

--
-- Name: reservation_id_reservation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE reservation_id_reservation_seq OWNED BY reservation.id_reservation;


--
-- Name: salle; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE salle (
    id_salle integer NOT NULL,
    nom character varying(10),
    id_site integer NOT NULL
);


ALTER TABLE salle OWNER TO postgres;

--
-- Name: salle_id_salle_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE salle_id_salle_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE salle_id_salle_seq OWNER TO postgres;

--
-- Name: salle_id_salle_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE salle_id_salle_seq OWNED BY salle.id_salle;


--
-- Name: site; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE site (
    id_site integer NOT NULL,
    nom character varying(30) NOT NULL,
    h_ouverture time with time zone NOT NULL,
    h_fermeture time with time zone NOT NULL,
    id_adresse integer
);


ALTER TABLE site OWNER TO postgres;

--
-- Name: site_id_site_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE site_id_site_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE site_id_site_seq OWNER TO postgres;

--
-- Name: site_id_site_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE site_id_site_seq OWNED BY site.id_site;


--
-- Name: type_reservation; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE type_reservation (
    id_type_reservation integer NOT NULL,
    nom character varying(25) NOT NULL
);


ALTER TABLE type_reservation OWNER TO postgres;

--
-- Name: type_reservation_id_type_reservation_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE type_reservation_id_type_reservation_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE type_reservation_id_type_reservation_seq OWNER TO postgres;

--
-- Name: type_reservation_id_type_reservation_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE type_reservation_id_type_reservation_seq OWNED BY type_reservation.id_type_reservation;


--
-- Name: usager; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE usager (
    date_de_naissance date NOT NULL,
    niveau_de_formation character varying(25) NOT NULL,
    categorie_sp character varying(25) NOT NULL,
    accompagne_mission_locale boolean NOT NULL,
    exclu_service boolean NOT NULL,
    id_adresse integer,
    id_personne integer NOT NULL,
    id_user integer NOT NULL,
    id_site integer NOT NULL,
    id_quartier integer NOT NULL
);


ALTER TABLE usager OWNER TO postgres;

--
-- Name: utilisateur; Type: TABLE; Schema: public; Owner: postgres; Tablespace: 
--

CREATE TABLE utilisateur (
    login character varying(20) NOT NULL,
    m_d_p character varying(20) NOT NULL,
    est_adm boolean NOT NULL,
    id_site integer NOT NULL,
    id_personne integer NOT NULL
);


ALTER TABLE utilisateur OWNER TO postgres;

--
-- Name: id_adresse; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY adresse ALTER COLUMN id_adresse SET DEFAULT nextval('adresse_id_adresse_seq'::regclass);


--
-- Name: id_connexion_ldap; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY connexion_ldap ALTER COLUMN id_connexion_ldap SET DEFAULT nextval('connexion_ldap_id_connexion_ldap_seq'::regclass);


--
-- Name: id_personne; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY personne ALTER COLUMN id_personne SET DEFAULT nextval('personne_id_personne_seq'::regclass);


--
-- Name: id_poste; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY poste ALTER COLUMN id_poste SET DEFAULT nextval('poste_id_poste_seq'::regclass);


--
-- Name: id_quartier; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY quartier_prioritaire ALTER COLUMN id_quartier SET DEFAULT nextval('quartier_prioritaire_id_quartier_seq'::regclass);


--
-- Name: id_reservation; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation ALTER COLUMN id_reservation SET DEFAULT nextval('reservation_id_reservation_seq'::regclass);


--
-- Name: id_salle; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY salle ALTER COLUMN id_salle SET DEFAULT nextval('salle_id_salle_seq'::regclass);


--
-- Name: id_site; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY site ALTER COLUMN id_site SET DEFAULT nextval('site_id_site_seq'::regclass);


--
-- Name: id_type_reservation; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY type_reservation ALTER COLUMN id_type_reservation SET DEFAULT nextval('type_reservation_id_type_reservation_seq'::regclass);


--
-- Data for Name: adresse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY adresse (id_adresse, complement_adresse, numero_rue, code_postal, ville) FROM stdin;
1	\N	17 rue des rose	44200                                                  	Nantes
2	\N	47 rue verte 	44400                                                  	Reze
3	batment c	22 route des sables	44810                                                  	St herblain
\.


--
-- Name: adresse_id_adresse_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('adresse_id_adresse_seq', 3, true);


--
-- Data for Name: connexion_ldap; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY connexion_ldap (id_connexion_ldap, date_heur_debut, date_heur_fin, ip_connexion, id_usager, id_poste) FROM stdin;
\.


--
-- Name: connexion_ldap_id_connexion_ldap_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('connexion_ldap_id_connexion_ldap_seq', 1, false);


--
-- Data for Name: personne; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY personne (id_personne, civilite, nom, prenom) FROM stdin;
1	m	Lebastard	Martial
2	m	Valjean	Jean
3	m	Hergaibelle	Octave
4	mme	Sonpheque	Sophie
5	M	David	Be
6	mme	Pretol	Anne
7	M	Surpivot	Adam
8	M	Labagnole	Ygor
\.


--
-- Name: personne_id_personne_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personne_id_personne_seq', 8, true);


--
-- Data for Name: poste; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY poste (id_poste, nom, libre_service__, actif__, id_salle) FROM stdin;
\.


--
-- Name: poste_id_poste_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('poste_id_poste_seq', 1, false);


--
-- Data for Name: quartier_prioritaire; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY quartier_prioritaire (id_quartier, nom) FROM stdin;
1	depomme
2	padeu
3	Jacques
\.


--
-- Name: quartier_prioritaire_id_quartier_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('quartier_prioritaire_id_quartier_seq', 3, true);


--
-- Data for Name: reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY reservation (id_reservation, raison, date_heur_deb, date_heur_fin, id_poste, id_user, id_usager, id_type_reservation) FROM stdin;
\.


--
-- Name: reservation_id_reservation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('reservation_id_reservation_seq', 1, false);


--
-- Data for Name: salle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY salle (id_salle, nom, id_site) FROM stdin;
\.


--
-- Name: salle_id_salle_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('salle_id_salle_seq', 1, false);


--
-- Data for Name: site; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY site (id_site, nom, h_ouverture, h_fermeture, id_adresse) FROM stdin;
1	Malakiif	12:00:00+02	14:00:00+02	2
2	Lahaut	17:00:00+02	18:00:00+02	3
\.


--
-- Name: site_id_site_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('site_id_site_seq', 2, true);


--
-- Data for Name: type_reservation; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY type_reservation (id_type_reservation, nom) FROM stdin;
\.


--
-- Name: type_reservation_id_type_reservation_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('type_reservation_id_type_reservation_seq', 1, false);


--
-- Data for Name: usager; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY usager (date_de_naissance, niveau_de_formation, categorie_sp, accompagne_mission_locale, exclu_service, id_adresse, id_personne, id_user, id_site, id_quartier) FROM stdin;
1964-01-18	BAC	1456	f	t	1	2	5	1	1
1975-08-15	cap	4878	f	f	2	3	1	1	1
\.


--
-- Data for Name: utilisateur; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY utilisateur (login, m_d_p, est_adm, id_site, id_personne) FROM stdin;
martial	martial	t	1	1
David	david	t	2	5
Jean	jean	f	1	2
\.


--
-- Name: poste_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY poste
    ADD CONSTRAINT poste_nom_key UNIQUE (nom);


--
-- Name: prk_constraint_adresse; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY adresse
    ADD CONSTRAINT prk_constraint_adresse PRIMARY KEY (id_adresse);


--
-- Name: prk_constraint_connexion_ldap; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY connexion_ldap
    ADD CONSTRAINT prk_constraint_connexion_ldap PRIMARY KEY (id_connexion_ldap);


--
-- Name: prk_constraint_personne; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY personne
    ADD CONSTRAINT prk_constraint_personne PRIMARY KEY (id_personne);


--
-- Name: prk_constraint_poste; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY poste
    ADD CONSTRAINT prk_constraint_poste PRIMARY KEY (id_poste);


--
-- Name: prk_constraint_quartier_prioritaire; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY quartier_prioritaire
    ADD CONSTRAINT prk_constraint_quartier_prioritaire PRIMARY KEY (id_quartier);


--
-- Name: prk_constraint_reservation; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT prk_constraint_reservation PRIMARY KEY (id_reservation);


--
-- Name: prk_constraint_salle; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY salle
    ADD CONSTRAINT prk_constraint_salle PRIMARY KEY (id_salle);


--
-- Name: prk_constraint_site; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY site
    ADD CONSTRAINT prk_constraint_site PRIMARY KEY (id_site);


--
-- Name: prk_constraint_type_reservation; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY type_reservation
    ADD CONSTRAINT prk_constraint_type_reservation PRIMARY KEY (id_type_reservation);


--
-- Name: prk_usager; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY usager
    ADD CONSTRAINT prk_usager PRIMARY KEY (id_personne);


--
-- Name: prk_utilisateur_id; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT prk_utilisateur_id PRIMARY KEY (id_personne);


--
-- Name: reservation_date_heur_deb_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_date_heur_deb_key UNIQUE (date_heur_deb);


--
-- Name: reservation_date_heur_fin_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT reservation_date_heur_fin_key UNIQUE (date_heur_fin);


--
-- Name: type_reservation_nom_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY type_reservation
    ADD CONSTRAINT type_reservation_nom_key UNIQUE (nom);


--
-- Name: utilisateur_login_key; Type: CONSTRAINT; Schema: public; Owner: postgres; Tablespace: 
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT utilisateur_login_key UNIQUE (login);


--
-- Name: fk_connexion_ldap_id_poste; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY connexion_ldap
    ADD CONSTRAINT fk_connexion_ldap_id_poste FOREIGN KEY (id_poste) REFERENCES poste(id_poste);


--
-- Name: fk_connexion_ldap_id_usager; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY connexion_ldap
    ADD CONSTRAINT fk_connexion_ldap_id_usager FOREIGN KEY (id_usager) REFERENCES usager(id_personne);


--
-- Name: fk_poste_id_salle; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY poste
    ADD CONSTRAINT fk_poste_id_salle FOREIGN KEY (id_salle) REFERENCES salle(id_salle);


--
-- Name: fk_reservation_id_poste; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT fk_reservation_id_poste FOREIGN KEY (id_poste) REFERENCES poste(id_poste);


--
-- Name: fk_reservation_id_type_reservation; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY reservation
    ADD CONSTRAINT fk_reservation_id_type_reservation FOREIGN KEY (id_type_reservation) REFERENCES type_reservation(id_type_reservation);


--
-- Name: fk_salle_id_site; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY salle
    ADD CONSTRAINT fk_salle_id_site FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- Name: fk_site_id_adresse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY site
    ADD CONSTRAINT fk_site_id_adresse FOREIGN KEY (id_adresse) REFERENCES adresse(id_adresse);


--
-- Name: fk_usager_id_adresse; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usager
    ADD CONSTRAINT fk_usager_id_adresse FOREIGN KEY (id_adresse) REFERENCES adresse(id_adresse);


--
-- Name: fk_usager_id_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usager
    ADD CONSTRAINT fk_usager_id_personne FOREIGN KEY (id_personne) REFERENCES personne(id_personne);


--
-- Name: fk_usager_id_quartier; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usager
    ADD CONSTRAINT fk_usager_id_quartier FOREIGN KEY (id_quartier) REFERENCES quartier_prioritaire(id_quartier);


--
-- Name: fk_usager_id_site; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usager
    ADD CONSTRAINT fk_usager_id_site FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- Name: fk_usager_id_utilisateur; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY usager
    ADD CONSTRAINT fk_usager_id_utilisateur FOREIGN KEY (id_user) REFERENCES utilisateur(id_personne);


--
-- Name: fk_utilisateur_id_personne; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT fk_utilisateur_id_personne FOREIGN KEY (id_personne) REFERENCES personne(id_personne);


--
-- Name: fk_utilisateur_id_site; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY utilisateur
    ADD CONSTRAINT fk_utilisateur_id_site FOREIGN KEY (id_site) REFERENCES site(id_site);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

