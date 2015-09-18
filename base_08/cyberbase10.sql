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
9	H	Gamble	Axel
10	H	Kane	Quentin
11	H	Day	Austin
12	H	Oliver	Tanner
13	H	Ashley	Rooney
14	H	Castaneda	Arden
15	H	Schroeder	Abbot
16	H	Wiggins	Uriah
17	H	Moses	Eric
18	H	Gay	Julian
19	H	Campos	Carter
20	H	Stokes	Cain
21	H	Shepard	Drew
22	H	Gordon	Grady
23	H	Carson	Chester
24	H	Scott	Arden
25	H	Owens	Graiden
26	H	Gomez	Hiram
27	H	Ferguson	Kevin
28	H	Reed	Lance
29	H	Trujillo	Michael
30	H	Combs	Herrod
31	H	Stanton	Raymond
32	H	Holden	Garth
33	H	Stout	Lev
34	H	Mccray	Brian
35	H	Stafford	Dane
36	H	Sheppard	Amal
37	H	Cabrera	Hamish
38	H	Hart	Travis
39	H	Calderon	Dexter
40	H	Parrish	Blake
41	H	Jarvis	Akeem
42	H	Montgomery	Hop
43	H	Craft	Erasmus
44	H	Fitzpatrick	Nathaniel
45	H	Haney	Garth
46	H	Gutierrez	Lance
47	H	Jacobson	Malik
48	H	Joseph	Cole
49	H	Holder	Tobias
50	H	Delacruz	Reed
51	H	Wood	Wang
52	H	Byers	Joseph
53	H	Henderson	Nissim
54	H	Reyes	Moses
55	H	Deleon	Jack
56	H	Higgins	Rogan
57	H	Johnson	Maxwell
58	H	Stuart	Tate
59	H	Howe	Baker
60	H	Conner	Quinlan
61	H	Moses	Nolan
62	H	Moses	Carl
63	H	Wiley	Brett
64	H	Bowers	Felix
65	H	Reid	Roth
66	H	Small	Tanner
67	H	Jordan	Abbot
68	H	Whitaker	Arthur
69	H	Randall	Armand
70	H	Spencer	Tobias
71	H	Andrews	Jasper
72	H	Saunders	Denton
73	H	Moore	Richard
74	H	Austin	Emery
75	H	Berger	Francis
76	H	Washington	Jonas
77	H	Saunders	Odysseus
78	H	Puckett	Barclay
79	H	Raymond	Knox
80	H	Mcguire	Wing
81	H	Madden	Mufutau
82	H	Sargent	Abraham
83	H	Finley	Zane
84	H	Gibbs	Eric
85	H	Robbins	Hiram
86	H	Stevens	Driscoll
87	H	Levy	Dale
88	H	Bailey	Mannix
89	H	Harding	Bernard
90	H	Hicks	Garrett
91	H	Hahn	Hakeem
92	H	Riley	Amir
93	H	Salazar	Devin
94	H	Sosa	Amos
95	H	Hansen	Amery
96	H	Morales	Caldwell
97	H	Weiss	Jin
98	H	Wright	Elton
99	H	Fuentes	Orlando
100	H	Shields	Louis
101	H	Oconnor	Salvador
102	H	Hoover	Barry
103	H	Wagner	Burton
104	H	Justice	Seth
105	H	Bowen	Julian
106	H	Rutledge	Damon
107	H	Reed	Leo
108	H	Mcconnell	Jordan
109	H	Cline	Ciaran
110	H	Perez	Bruce
111	H	Ashley	Ahmed
112	H	Hammond	Rigel
113	H	Casey	Keegan
114	H	Cain	Rajah
115	H	Bell	Jonah
116	H	Mayo	Abdul
117	H	Quinn	Francis
118	H	Flores	Caldwell
119	H	Briggs	Burton
120	H	Juarez	Gage
121	H	Vaughn	Boris
122	H	Porter	Hakeem
123	H	Strong	Alden
124	H	Price	Arsenio
125	H	Conrad	Curran
126	H	Fernandez	Damian
127	H	Burnett	Rigel
128	H	Jarvis	Addison
129	H	Matthews	Elliott
130	H	Buckner	Harlan
131	H	Hooper	Brandon
132	H	Owen	Leonard
133	H	Morse	Malachi
134	H	Hubbard	Calvin
135	H	Mendoza	Alan
136	H	Oneil	Len
137	H	Blair	Ulric
138	H	Carey	Aquila
139	H	Clarke	Rudyard
140	H	Peters	Damian
141	H	Hanson	Emery
142	H	Nguyen	Scott
143	H	Potts	Aquila
144	H	Townsend	Kaseem
145	H	Castro	Cadman
146	H	Forbes	Hall
147	H	Daniel	Rudyard
148	H	Hull	Sylvester
149	H	Hyde	Dane
150	H	Townsend	Carl
151	H	Stafford	Knox
152	H	Gibbs	Philip
153	H	Shaffer	Jasper
154	H	Chavez	Len
155	H	Waters	Fitzgerald
156	H	Kirk	Armando
157	H	Davenport	Mark
158	H	Shields	Yoshio
159	H	Best	Abdul
160	H	Marshall	Elvis
161	H	Bridges	Isaiah
162	H	Harrington	Andrew
163	H	Compton	Edan
164	H	Stuart	Kane
165	H	Conway	Rahim
166	H	Patton	Daniel
167	H	Mullen	Forrest
168	H	Casey	Quinn
169	H	Valdez	Odysseus
170	H	Morris	Macon
171	H	Kim	Keane
172	H	Pugh	Tarik
173	H	Maxwell	Xanthus
174	H	Simon	Nigel
175	H	Harding	Boris
176	H	Cortez	Dane
177	H	Harrell	Rogan
178	H	Castaneda	Xenos
179	H	Gould	Howard
180	H	Mcdowell	Lionel
181	H	Adkins	Amal
182	H	Eaton	Timothy
183	H	Dickson	Kelly
184	H	Shelton	Cody
185	H	Langley	Wallace
186	H	Ramirez	Daquan
187	H	Vaughn	Adam
188	H	Christian	Russell
189	H	Delaney	Wylie
190	H	Padilla	Christian
191	H	Haynes	Phelan
192	H	Tucker	Alexander
193	H	Ellison	Dominic
194	H	Murray	Jasper
195	H	Reyes	Lee
196	H	Roth	Alfonso
197	H	Herring	Oscar
198	H	Odom	Kadeem
199	H	Pate	Chaim
200	H	Cote	Vincent
201	H	Waller	Jordan
202	H	Albert	Zachery
203	H	Jensen	Dorian
204	H	West	Linus
205	H	Cohen	Benjamin
206	H	Rich	Dorian
207	H	Soto	August
208	H	Travis	Preston
209	H	Horn	Jarrod
210	H	Raymond	August
211	H	Clay	Shad
212	H	Lang	Stuart
213	H	Richards	Bernard
214	H	Humphrey	Hop
215	H	Castillo	Kasper
216	H	Bradford	Abbot
217	H	Johns	Salvador
218	H	Bean	Hedley
219	H	Bonner	Nigel
220	H	Franklin	Paul
221	H	Moody	Ashton
222	H	Gates	Zeph
223	H	Davenport	Vaughan
224	H	Austin	Dale
225	H	Byers	Malik
226	H	Ashley	Steven
227	H	Dejesus	Bert
228	H	Pierce	Chase
229	H	Savage	Jesse
230	H	Briggs	Vernon
231	H	Pittman	Barclay
232	H	Wilkerson	Norman
233	H	Watkins	Macon
234	H	Benson	Colt
235	H	Spencer	Cullen
236	H	Chase	Raja
237	H	Hodge	Murphy
238	H	Heath	Arthur
239	H	Soto	Xavier
240	H	Fox	Drew
241	H	Sweeney	Zeph
242	H	Lewis	Brendan
243	H	Morse	Xander
244	H	Rich	Thomas
245	H	Clemons	Elliott
246	H	Barnes	Cairo
247	H	Little	Cooper
248	H	Kelly	Samson
249	H	Bradford	Damian
250	H	Hood	Barrett
251	H	Duffy	Daniel
252	H	Lyons	Connor
253	H	Vincent	Baxter
254	H	Cooley	Nero
255	H	Ashley	Branden
256	H	Schroeder	Travis
257	H	Roman	Alden
258	H	Hess	Grady
259	H	Kidd	Dexter
260	H	Gallagher	Reece
261	H	Hardin	Lee
262	H	Carter	Tyrone
263	H	Lowery	Keaton
264	H	Odom	Lester
265	H	Carney	Oscar
266	H	Bowers	Brent
267	H	Blackburn	Demetrius
268	H	Mcguire	Byron
269	H	Ayers	Jermaine
270	H	Keller	Vladimir
271	H	Fulton	Luke
272	H	Marquez	Stewart
273	H	Sutton	Hedley
274	H	Moon	Dane
275	H	Weaver	Xanthus
276	H	Sharpe	Brenden
277	H	Garrett	Brett
278	H	Barry	Kibo
279	H	Wright	Zachery
280	H	Landry	Griffin
281	H	Alford	Kermit
282	H	Good	Vaughan
283	H	Copeland	Kyle
284	H	Morris	Silas
285	H	Battle	Isaiah
286	H	Brooks	Darius
287	H	Davidson	Elton
288	H	Gentry	Tate
289	H	Wong	Amos
290	H	William	Bevis
291	H	Stevenson	Channing
292	H	Conway	Reece
293	H	Knowles	Hedley
294	H	Cardenas	Amos
295	H	Morris	Chase
296	H	Mejia	Jacob
297	H	Harmon	Drew
298	H	Watkins	Barrett
299	H	Acosta	Zephania
300	H	Norman	Griffin
301	H	Hanson	Clarke
302	H	Kane	Cyrus
303	H	Little	Chadwick
304	H	Rojas	Stephen
305	H	Montgomery	Alvin
306	H	Cochran	Devin
307	H	Morales	Phelan
308	H	Lyons	Alfonso
309	H	Hutchinson	Jacob
310	H	Byers	Tiger
311	H	Hines	Dalton
312	H	Ellison	Julian
313	H	Lott	Benedict
314	H	Grimes	Erich
315	H	Fleming	Lane
316	H	Knight	Davis
317	H	Zimmerman	Garrett
318	H	Johnston	Ulysses
319	H	Dejesus	Hamilton
320	H	Mendoza	Hakeem
321	H	Christian	Barclay
322	H	Cortez	Price
323	H	Hawkins	Tarik
324	H	Brady	Devin
325	H	Waller	Thor
326	H	West	Zane
327	H	Alvarado	Kevin
328	H	Martinez	Arden
329	H	Clemons	Sebastian
330	H	Sargent	Linus
331	H	Jefferson	Perry
332	H	Collier	Prescott
333	H	Horne	Amal
334	H	Terrell	Colton
335	H	Odom	Drake
336	H	Fitzgerald	Herman
337	H	Sykes	Alvin
338	H	Mcknight	Channing
339	H	Kirby	Aristotle
340	H	Strong	Beck
341	H	Farrell	Ashton
342	H	Byers	Omar
343	H	Velez	Bradley
344	H	Kelley	Ulric
345	H	Dickerson	Melvin
346	H	Estes	Ivor
347	H	Mayer	Lars
348	H	Dickerson	Nero
349	H	Lawson	Dane
350	H	Bray	Silas
351	H	Riggs	Steven
352	H	Washington	Malik
353	H	Campbell	Brendan
354	H	Garner	Tucker
355	H	Massey	Baker
356	H	Dale	Plato
357	H	Dunn	Fitzgerald
358	H	Wade	Forrest
359	H	Gutierrez	Dalton
360	H	Wiggins	Raphael
361	H	English	Carson
362	H	Mcconnell	Russell
363	H	Morrow	Amal
364	H	Barker	Branden
365	H	Becker	Kaseem
366	H	Hopper	Edan
367	H	Cabrera	Xenos
368	H	Mclaughlin	Samuel
369	H	Blankenship	Kato
370	H	Cooley	Colby
371	H	Wiggins	Cody
372	H	Michael	Harper
373	H	Monroe	Graham
374	H	Jordan	Jesse
375	H	Summers	Joel
376	H	Ramos	Louis
377	H	Hays	Chandler
378	H	Aguirre	Joshua
379	H	Benson	Christian
380	H	Pollard	Quinn
381	H	Christian	Gannon
382	H	Mclean	Thomas
383	H	Hayden	Jakeem
384	H	Watson	Blaze
385	H	Morrison	Gregory
386	H	Le	Ivan
387	H	Mccormick	Francis
388	H	Buchanan	Chadwick
389	H	Carpenter	Derek
390	H	Mosley	Gareth
391	H	Sims	Colton
392	H	Hodges	Herman
393	H	Becker	Walker
394	H	Bender	Beau
395	H	Ortega	Henry
396	H	Lynn	Rudyard
397	H	Wolfe	Odysseus
398	H	Morin	Gary
399	H	Gallagher	James
400	H	Strickland	Neville
401	H	Cooke	Kennan
402	H	Cash	Cullen
403	H	Leonard	Simon
404	H	Gilliam	Lewis
405	H	Alston	Vladimir
406	H	Bowman	Jarrod
407	H	Franco	Jerome
408	H	Schwartz	Steel
409	H	Donovan	Uriel
410	H	Head	Maxwell
411	H	Tate	Allistair
412	H	Wolf	Preston
413	H	Potts	Dexter
414	H	Lee	Colt
415	H	Hamilton	Chadwick
416	H	Cantu	Yasir
417	H	Davenport	Logan
418	H	Nelson	Vance
419	H	Bennett	Graham
420	H	Marsh	Alden
421	H	Kaufman	Colin
422	H	Moses	Isaiah
423	H	Rosales	Drew
424	H	Mooney	Palmer
425	H	Stevens	Kamal
426	H	Bernard	Jonas
427	H	Newman	Kermit
428	H	Cabrera	Bevis
429	H	Strong	Palmer
430	H	Shaw	Tarik
431	H	Deleon	Salvador
432	H	Cummings	Hammett
433	H	Hodge	Harding
434	H	Gillespie	Cameron
435	H	Dixon	Eaton
436	H	Dalton	Ryder
437	H	Raymond	Cole
438	H	Haynes	Tyler
439	H	Deleon	Eaton
440	H	Wells	Dorian
441	H	Sharpe	Duncan
442	H	Richard	Brady
443	H	Vaughn	Ferris
444	H	Grimes	Shad
445	H	Berger	Gareth
446	H	Cantu	Aaron
447	H	Anthony	Nasim
448	H	Barr	Baxter
449	H	Contreras	Samuel
450	H	Wilcox	Grant
451	H	Sandoval	Porter
452	H	Wall	Fitzgerald
453	H	Lewis	Akeem
454	H	Beck	Joseph
455	H	Garrison	Abbot
456	H	Forbes	Seth
457	H	Holland	Francis
458	H	Welch	Sean
459	H	Lopez	Dillon
460	H	Cole	Jacob
461	H	Berg	Joshua
462	H	Long	Alvin
463	H	Gaines	Gregory
464	H	Pennington	Drew
465	H	Berry	Arsenio
466	H	Anderson	Hop
467	H	Atkinson	Mason
468	H	Stafford	Caldwell
469	H	Houston	Reese
470	H	Giles	Fritz
471	H	Peters	Ira
472	H	Malone	Brock
473	H	Trevino	Mohammad
474	H	Pena	Arsenio
475	H	Ramos	Coby
476	H	Talley	Lamar
477	H	Rowe	Lev
478	H	Dyer	Timon
479	H	Delacruz	Tiger
480	H	Zimmerman	Jeremy
481	H	Bryant	Finn
482	H	Olson	Drake
483	H	Perkins	Otto
484	H	Kelley	Allen
485	H	Waller	Thaddeus
486	H	Pickett	Felix
487	H	Mccray	Francis
488	H	Morton	Lance
489	H	Baker	Brett
490	H	Dixon	Berk
491	H	Kim	Colt
492	H	Klein	Guy
493	H	Fernandez	Hyatt
494	H	Stanley	Ashton
495	H	Foster	Basil
496	H	Cross	Elliott
497	H	Jordan	Herrod
498	H	Spence	Jin
499	H	Huff	Valentine
500	H	Edwards	Julian
501	H	Dominguez	Micah
502	H	Curry	Ralph
503	H	Hartman	Rashad
504	H	Carey	Ross
505	H	Fernandez	Davis
506	H	Saunders	Denton
507	H	Garza	Neville
508	H	Taylor	Barrett
509	F	Dalton	Unity
510	F	Grimes	Jeanette
511	F	Lynch	Fredericka
512	F	Carson	Claudia
513	F	Hess	Sloane
514	F	Horn	Kaye
515	F	Travis	Kaye
516	F	Maynard	Blossom
517	F	Zimmerman	Astra
518	F	Waller	Hedy
519	F	Bradford	Alana
520	F	Stevenson	Emma
521	F	Floyd	Ingrid
522	F	Holder	Nevada
523	F	Jones	Ivy
524	F	Yates	Jorden
525	F	Ellison	Justine
526	F	Rosa	Heidi
527	F	Alvarado	Vivian
528	F	Vance	Kathleen
529	F	Ray	Selma
530	F	Maddox	Minerva
531	F	Mcgee	Molly
532	F	Tyson	Imelda
533	F	William	Fleur
534	F	Bailey	Rhiannon
535	F	Morin	Cassidy
536	F	Acevedo	Adria
537	F	Scott	Wanda
538	F	Leach	Vera
539	F	Short	Ingrid
540	F	Maldonado	Rhoda
541	F	Gaines	Holly
542	F	Rosa	Astra
543	F	Mckenzie	Madaline
544	F	Ray	Hanae
545	F	Petersen	Helen
546	F	Merritt	Astra
547	F	Mccarthy	Elizabeth
548	F	Neal	Lisandra
549	F	Flynn	Willa
550	F	Lindsay	Shaine
551	F	Vazquez	Jaime
552	F	Calhoun	Cailin
553	F	Martinez	Roanna
554	F	Simpson	Risa
555	F	Langley	Shelly
556	F	Burch	Sasha
557	F	Maddox	Virginia
558	F	Horn	Karleigh
559	F	Rutledge	Mara
560	F	Finley	Alika
561	F	Stafford	Quyn
562	F	Mcdonald	Harriet
563	F	Oneil	Eliana
564	F	Brown	Jillian
565	F	Small	Winifred
566	F	Palmer	Zephr
567	F	Gray	Belle
568	F	Weber	Nevada
569	F	Wolf	Zelenia
570	F	Garrett	Denise
571	F	Rodriguez	Carolyn
572	F	Stewart	Fatima
573	F	Calderon	Remedios
574	F	Arnold	Aphrodite
575	F	Pratt	Azalia
576	F	Guzman	Leigh
577	F	Bauer	Nyssa
578	F	Johnston	Nichole
579	F	Banks	Brenda
580	F	Haley	Idona
581	F	Mack	Hayfa
582	F	Reyes	Martena
583	F	Lee	Laura
584	F	Mays	Kyla
585	F	Morrison	Reagan
586	F	Glover	Bell
587	F	Roy	Ava
588	F	Powers	Amanda
589	F	Bender	Cailin
590	F	Morrow	Beatrice
591	F	Mullen	Sasha
592	F	Pearson	Jayme
593	F	Stein	Germane
594	F	Cobb	Rhiannon
595	F	Cannon	Nevada
596	F	Delgado	Adena
597	F	Best	Zelda
598	F	Wheeler	Laurel
599	F	Head	Belle
600	F	Rush	Fatima
601	F	Wilkinson	Aline
602	F	Salinas	Clio
603	F	Carpenter	Orla
604	F	Gardner	Shay
605	F	Flowers	MacKenzie
606	F	Sanford	Fatima
607	F	Nielsen	Alexa
608	F	Hancock	Anjolie
609	F	Carr	Ruby
610	F	Berger	Tashya
611	F	Fisher	Mia
612	F	Mann	Vivien
613	F	Hurst	Adrienne
614	F	Reeves	Kimberley
615	F	Rocha	Patience
616	F	Mcfarland	Blaine
617	F	Sawyer	Nina
618	F	Ellis	Bianca
619	F	Goodwin	Irma
620	F	Carpenter	Quyn
621	F	Marks	Maile
622	F	Mccormick	Zelenia
623	F	Gonzales	Brenna
624	F	Munoz	Shaeleigh
625	F	Johnston	Roanna
626	F	Spencer	Mari
627	F	Ballard	Dominique
628	F	Castillo	Maggie
629	F	Richmond	Cynthia
630	F	Sloan	Tashya
631	F	Cannon	Grace
632	F	Benjamin	Ulla
633	F	Reyes	Wynter
634	F	Sellers	Ursula
635	F	Burton	Ila
636	F	Palmer	Leah
637	F	Copeland	Maile
638	F	Chen	Joy
639	F	Harrison	Rylee
640	F	Nielsen	Ori
641	F	Decker	Claudia
642	F	Burt	Madison
643	F	Edwards	Demetria
644	F	Velez	Virginia
645	F	Patrick	Kiona
646	F	Pittman	Amena
647	F	Rocha	Jolie
648	F	Kemp	Hadassah
649	F	Ramos	Nadine
650	F	Hodges	Azalia
651	F	Giles	Latifah
652	F	Roberts	Macy
653	F	Booker	Mariko
654	F	Buckner	Shay
655	F	Owens	Ciara
656	F	Johns	Aretha
657	F	Page	Alea
658	F	Levine	Idola
659	F	Hogan	Lani
660	F	Guthrie	Diana
661	F	Delaney	Sharon
662	F	Haney	Juliet
663	F	Dudley	Delilah
664	F	Mcclure	Sade
665	F	Slater	Melanie
666	F	Horn	Kelsey
667	F	Mcconnell	Lesley
668	F	Olson	Tanya
669	F	Patrick	Quincy
670	F	Kane	Cherokee
671	F	Petersen	Tatiana
672	F	Dillon	Yoko
673	F	Walsh	Olivia
674	F	Ball	Ella
675	F	Booth	Rhea
676	F	Morin	Giselle
677	F	Colon	Galena
678	F	Hurley	Yoshi
679	F	Ochoa	Kirestin
680	F	Hayden	Kevyn
681	F	Roberts	Cynthia
682	F	Rollins	Macey
683	F	Hooper	Priscilla
684	F	Cantrell	Xerxes
685	F	Bridges	Lysandra
686	F	Olsen	Michelle
687	F	Harvey	Iliana
688	F	Preston	Scarlet
689	F	Hickman	Rosalyn
690	F	Key	Jenna
691	F	Medina	Serina
692	F	Madden	Amity
693	F	Tillman	Noel
694	F	Curry	Deanna
695	F	Henson	Erica
696	F	Mills	Brenna
697	F	Miller	Ingrid
698	F	Oliver	Camille
699	F	Cervantes	Sage
700	F	Cooke	Amanda
701	F	Brooks	Gail
702	F	Fernandez	Yetta
703	F	French	Tatiana
704	F	Morrison	Lesley
705	F	Rivas	Velma
706	F	Craig	Roanna
707	F	Good	Olivia
708	F	Koch	Casey
709	F	Chan	Bethany
710	F	Castaneda	Taylor
711	F	Romero	Linda
712	F	Irwin	Blair
713	F	Riddle	Celeste
714	F	Mayer	Larissa
715	F	Sandoval	Scarlett
716	F	Shepherd	Penelope
717	F	Rogers	Shana
718	F	Farrell	Leandra
719	F	Nielsen	Ella
720	F	Daugherty	Chloe
721	F	Smith	Abra
722	F	Sheppard	Buffy
723	F	Brown	Chava
724	F	Park	Carla
725	F	Estrada	Leilani
726	F	Compton	Breanna
727	F	Petersen	Justina
728	F	Mayer	Kathleen
729	F	Howard	Latifah
730	F	Merrill	Alfreda
731	F	Johnston	Tatyana
732	F	English	Mollie
733	F	Duffy	Ruby
734	F	Sullivan	Pearl
735	F	Espinoza	Lucy
736	F	Burke	Kylee
737	F	Morris	Montana
738	F	Figueroa	Amy
739	F	Chaney	Pandora
740	F	Whitley	Willa
741	F	Newton	Denise
742	F	Stanton	Ingrid
743	F	Beard	Mona
744	F	Avery	Ivy
745	F	Alston	Yvonne
746	F	Fernandez	Mechelle
747	F	Cooper	Melinda
748	F	Conley	Sylvia
749	F	Levy	Penelope
750	F	Henson	Hermione
751	F	Petty	Macey
752	F	Schmidt	Yoko
753	F	Fernandez	Chloe
754	F	Sherman	Risa
755	F	Middleton	Jessamine
756	F	Shepherd	Rose
757	F	Shields	Adele
758	F	Joyce	Mariko
759	F	Ayala	Xantha
760	F	Adams	Charity
761	F	Berger	Kirsten
762	F	Bender	Cheyenne
763	F	Ford	Sybill
764	F	Griffin	Elizabeth
765	F	Weiss	Germaine
766	F	Rios	Colette
767	F	Sharpe	Oprah
768	F	Cochran	Gay
769	F	Roman	Danielle
770	F	Ashley	Tamara
771	F	Collier	Chelsea
772	F	Ford	Virginia
773	F	Strong	Jade
774	F	Logan	Leilani
775	F	Wood	Amena
776	F	Workman	Lois
777	F	Bentley	Pearl
778	F	Gates	Aretha
779	F	Brady	Yoko
780	F	Travis	Shaine
781	F	Joseph	Jennifer
782	F	White	Shoshana
783	F	Knox	Hermione
784	F	Poole	Ann
785	F	Glenn	Eugenia
786	F	Knox	Kerry
787	F	Ray	Gretchen
788	F	Stuart	Shelby
789	F	Lambert	Virginia
790	F	Simon	Beverly
791	F	Camacho	Jorden
792	F	Mills	Velma
793	F	Young	Camille
794	F	Fernandez	Jemima
795	F	Velazquez	Lisandra
796	F	Knox	Anne
797	F	Albert	Keiko
798	F	Hayes	Yoko
799	F	Estes	Chelsea
800	F	Melendez	Regina
801	F	Riley	Donna
802	F	Harrell	India
803	F	Lara	Germaine
804	F	Day	Lilah
805	F	Farrell	Jael
806	F	Dorsey	Chava
807	F	Pratt	Karyn
808	F	Conway	Velma
809	F	Mcleod	Callie
810	F	Fulton	Hiroko
811	F	Odonnell	Aiko
812	F	Roman	Justine
813	F	King	Frances
814	F	Holder	Ramona
815	F	Kinney	Madonna
816	F	Gould	Angela
817	F	Morton	Amena
818	F	Meyer	Guinevere
819	F	Noel	Vanna
820	F	Ortiz	Jolie
821	F	Blanchard	Kendall
822	F	Abbott	Bell
823	F	Mcknight	Donna
824	F	Solomon	Adrienne
825	F	Herring	Moana
826	F	Noel	Sara
827	F	Stokes	Raven
828	F	Stevens	Yvonne
829	F	Chase	Samantha
830	F	Briggs	Xena
831	F	Strickland	Farrah
832	F	Parsons	Mara
833	F	Mcpherson	Xandra
834	F	Bradshaw	Geraldine
835	F	Booth	Caryn
836	F	Lindsay	Olympia
837	F	Blackwell	Jessica
838	F	Hogan	Quinn
839	F	Elliott	Colleen
840	F	Ortega	Angelica
841	F	Blanchard	Robin
842	F	Langley	Briar
843	F	Holland	Sylvia
844	F	Gillespie	Fleur
845	F	Clarke	Amber
846	F	Gardner	Shaine
847	F	Dejesus	Lucy
848	F	Schroeder	Audra
849	F	Mullen	Meghan
850	F	Reilly	Ulla
851	F	Bryant	April
852	F	Coleman	Carolyn
853	F	Waters	Jescie
854	F	Riggs	Camille
855	F	Sears	Rachel
856	F	Hartman	Teegan
857	F	Good	Patience
858	F	Pitts	Ima
859	F	Woodward	Ava
860	F	Bailey	Yuri
861	F	Witt	Laurel
862	F	Carver	Irene
863	F	Anthony	Evelyn
864	F	Carroll	Blaine
865	F	Steele	Hermione
866	F	Pitts	Daria
867	F	Webster	Buffy
868	F	Macias	Lucy
869	F	Riggs	Jaquelyn
870	F	Ford	Karina
871	F	Stephenson	MacKensie
872	F	Sherman	Aimee
873	F	Jacobs	Sage
874	F	Murphy	Joy
875	F	Porter	Freya
876	F	Salinas	Paula
877	F	Bullock	Phyllis
878	F	George	Ayanna
879	F	Mccarty	Latifah
880	F	Hogan	Buffy
881	F	Silva	Noelle
882	F	Hawkins	Linda
883	F	Noble	Kameko
884	F	Farrell	Kylynn
885	F	Mays	Sydney
886	F	Emerson	Cara
887	F	Ortiz	Katell
888	F	Adkins	Charity
889	F	Hebert	Amelia
890	F	Boyd	Jescie
891	F	Bird	Quincy
892	F	Browning	Quemby
893	F	Merritt	Wynter
894	F	Mcleod	Cassidy
895	F	Mercado	Wyoming
896	F	Merritt	Minerva
897	F	Porter	Alexandra
898	F	Todd	Francesca
899	F	Briggs	Kirby
900	F	Bartlett	Whilemina
901	F	Mclean	Yuri
902	F	Price	Desiree
903	F	Tate	Helen
904	F	Chang	Shoshana
905	F	Garcia	Daphne
906	F	Hurst	Helen
907	F	Morton	Georgia
908	F	Moon	Ivy
909	F	Park	Yuri
910	F	Sherman	Marny
911	F	Mosley	Skyler
912	F	Sloan	Xyla
913	F	Rodriquez	Kimberly
914	F	Bullock	Alexis
915	F	Burton	Iliana
916	F	Levy	Hiroko
917	F	Lang	Zelda
918	F	Justice	Kimberly
919	F	Vasquez	Olivia
920	F	Willis	Cheyenne
921	F	Buchanan	Dara
922	F	Mcclure	Idona
923	F	Wyatt	Miranda
924	F	Wong	Jamalia
925	F	Frederick	Stella
926	F	Tate	Lesley
927	F	Cherry	Deirdre
928	F	Holman	Faith
929	F	Horton	Rina
930	F	Bass	Keely
931	F	Davis	Callie
932	F	Lott	Indira
933	F	Burris	Urielle
934	F	Walton	Desiree
935	F	Alston	Cheryl
936	F	Doyle	Sigourney
937	F	Sears	Xaviera
938	F	Ross	Madeline
939	F	Mullen	Quail
940	F	Jacobson	Adara
941	F	Pruitt	Wanda
942	F	Wilcox	Mona
943	F	Vaughn	Colleen
944	F	Warren	Chiquita
945	F	Roach	Denise
946	F	Cleveland	Kathleen
947	F	Hicks	Irene
948	F	Mcgee	Karen
949	F	Adams	Hadley
950	F	Odonnell	Ima
951	F	Huff	Hanae
952	F	Morris	Emi
953	F	Acevedo	September
954	F	Mcdowell	Tamara
955	F	Delacruz	Patience
956	F	Puckett	Aurelia
957	F	Cantu	Angela
958	F	Sims	Angela
959	F	Acevedo	Sacha
960	F	Little	Karly
961	F	Acevedo	Idona
962	F	Zimmerman	Cecilia
963	F	Ramirez	Debra
964	F	Odonnell	India
965	F	Santana	Frances
966	F	Giles	Mechelle
967	F	Blackburn	Mariam
968	F	Downs	Quin
969	F	Hughes	Zoe
970	F	Hebert	Amaya
971	F	Miranda	Alyssa
972	F	Lloyd	Adrienne
973	F	Hooper	Megan
974	F	Morgan	Indigo
975	F	Cantrell	Rhiannon
976	F	Gilbert	Jaden
977	F	Mathis	Amela
978	F	Ford	Ashely
979	F	Rich	Amelia
980	F	Haynes	Aiko
981	F	Martinez	Yetta
982	F	Lancaster	Elizabeth
983	F	Ratliff	Shelby
984	F	Noel	Rachel
985	F	Shelton	Denise
986	F	Lindsey	Yvette
987	F	Lindsay	Ayanna
988	F	Walter	Jena
989	F	Williams	Courtney
990	F	Mcguire	Robin
991	F	Fitzgerald	Nomlanga
992	F	Kline	Kiona
993	F	Cline	Laurel
994	F	Bond	Ariana
995	F	Rhodes	Robin
996	F	Graves	Briar
997	F	Bryan	Beverly
998	F	Welch	Aretha
999	F	Lara	Myra
1000	F	Burt	Kim
1001	F	Strickland	Avye
1002	F	Riddle	Buffy
1003	F	Gould	Maile
1004	F	Meyers	Jane
1005	F	Howe	Mona
1006	F	Finley	Quon
1007	F	Woodard	Shafira
1008	F	Mills	Shelby
\.


--
-- Name: personne_id_personne_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('personne_id_personne_seq', 1008, true);


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

