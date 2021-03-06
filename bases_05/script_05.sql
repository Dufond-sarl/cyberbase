------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------



------------------------------------------------------------
-- Table: personne
------------------------------------------------------------
CREATE TABLE public.personne(
	id_personne SERIAL NOT NULL ,
	nom         VARCHAR (20) NOT NULL ,
	prenom      VARCHAR (20) NOT NULL ,
	civilite    VARCHAR (25) NOT NULL ,
	idf         SERIAL NOT NULL UNIQUE,
	id_usager   INT   ,
	id_user     INT  NOT NULL ,
	CONSTRAINT prk_constraint_personne PRIMARY KEY (id_personne)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: site
------------------------------------------------------------
CREATE TABLE public.site(
	id_site     SERIAL NOT NULL ,
	idf         SERIAL NOT NULL UNIQUE,
	nom         VARCHAR (30) NOT NULL ,
	h_ouverture TIMETZ  NOT NULL ,
	h_fermeture TIMETZ  NOT NULL ,
	id_adresse  INT   ,
	CONSTRAINT prk_constraint_site PRIMARY KEY (id_site)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: adresse
------------------------------------------------------------
CREATE TABLE public.adresse(
	id_adresse  SERIAL NOT NULL ,
	adresse_1   VARCHAR (40) NOT NULL ,
	adresse_2   VARCHAR (30)  ,
	code_postal CHAR (55)   ,
	ville       VARCHAR (40) NOT NULL UNIQUE,
	idf         SERIAL NOT NULL UNIQUE,
	id_site     INT  NOT NULL ,
	CONSTRAINT prk_constraint_adresse PRIMARY KEY (id_adresse)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: quartier_prioritaire
------------------------------------------------------------
CREATE TABLE public.quartier_prioritaire(
	id_quartier SERIAL NOT NULL ,
	idf         SERIAL NOT NULL UNIQUE,
	nom         VARCHAR (30) NOT NULL ,
	CONSTRAINT prk_constraint_quartier_prioritaire PRIMARY KEY (id_quartier)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: salle
------------------------------------------------------------
CREATE TABLE public.salle(
	id_salle SERIAL NOT NULL ,
	idf      SERIAL NOT NULL UNIQUE,
	nom      VARCHAR (10)  ,
	id_site  INT  NOT NULL ,
	CONSTRAINT prk_constraint_salle PRIMARY KEY (id_salle)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: poste
------------------------------------------------------------
CREATE TABLE public.poste(
	id_poste        SERIAL NOT NULL ,
	nom             VARCHAR (25) NOT NULL UNIQUE,
	libre_service__ BOOL  NOT NULL ,
	Actif__         BOOL  NOT NULL ,
	id_salle        INT  NOT NULL ,
	CONSTRAINT prk_constraint_poste PRIMARY KEY (id_poste)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: usager
------------------------------------------------------------
CREATE TABLE public.usager(
	id_usager                 SERIAL NOT NULL ,
	idf                       SERIAL NOT NULL UNIQUE,
	date_de_naissance         DATE  NOT NULL ,
	niveau_de_formation       VARCHAR (25) NOT NULL ,
	categorie_sp              VARCHAR (25) NOT NULL ,
	accompagne_mission_locale BOOL  NOT NULL ,
	exclu_service             BOOL  NOT NULL ,
	id_adresse                INT   ,
	id_personne               INT  NOT NULL ,
	id_user                   INT  NOT NULL ,
	id_site                   INT  NOT NULL ,
	id_quartier               INT  NOT NULL ,
	CONSTRAINT prk_constraint_usager PRIMARY KEY (id_usager)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: utilisateur
------------------------------------------------------------
CREATE TABLE public.utilisateur(
	id_user     SERIAL NOT NULL ,
	idf         SERIAL NOT NULL UNIQUE,
	login       VARCHAR (30)  ,
	m_d_p       VARCHAR (30) NOT NULL UNIQUE,
	est_adm     BOOL  NOT NULL ,
	id_site     INT  NOT NULL ,
	id_personne INT  NOT NULL ,
	CONSTRAINT prk_constraint_utilisateur PRIMARY KEY (id_user)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: reservation
------------------------------------------------------------
CREATE TABLE public.reservation(
	id_reservation      SERIAL NOT NULL ,
	idf                 SERIAL NOT NULL UNIQUE,
	raison              VARCHAR (30) NOT NULL ,
	date_deb            DATE  NOT NULL UNIQUE,
	date_fin            DATE  NOT NULL UNIQUE,
	categorie           VARCHAR (25)  ,
	id_poste            INT  NOT NULL ,
	id_user             INT  NOT NULL ,
	id_site             INT  NOT NULL ,
	id_usager           INT   ,
	id_type_reservation INT  NOT NULL ,
	CONSTRAINT prk_constraint_reservation PRIMARY KEY (id_reservation)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_reservation
------------------------------------------------------------
CREATE TABLE public.type_reservation(
	id_type_reservation SERIAL NOT NULL ,
	idf                 SERIAL NOT NULL UNIQUE,
	nom                 VARCHAR (25) NOT NULL UNIQUE,
	CONSTRAINT prk_constraint_type_reservation PRIMARY KEY (id_type_reservation)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: date_fermeture
------------------------------------------------------------
CREATE TABLE public.date_fermeture(
	id_date_fermeture SERIAL NOT NULL ,
	idf               SERIAL NOT NULL UNIQUE,
	date_debut        DATE  NOT NULL UNIQUE,
	date_fin          DATE  NOT NULL UNIQUE,
	CONSTRAINT prk_constraint_date_fermeture PRIMARY KEY (id_date_fermeture)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: fermeture_site
------------------------------------------------------------
CREATE TABLE public.fermeture_site(
	id_site           INT  NOT NULL ,
	id_date_fermeture INT  NOT NULL ,
	CONSTRAINT prk_constraint_fermeture_site PRIMARY KEY (id_site,id_date_fermeture)
)WITHOUT OIDS;



ALTER TABLE public.personne ADD CONSTRAINT FK_personne_id_usager FOREIGN KEY (id_usager) REFERENCES public.usager(id_usager);
ALTER TABLE public.personne ADD CONSTRAINT FK_personne_id_user FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);
ALTER TABLE public.site ADD CONSTRAINT FK_site_id_adresse FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);
ALTER TABLE public.adresse ADD CONSTRAINT FK_adresse_id_site FOREIGN KEY (id_site) REFERENCES public.site(id_site);
ALTER TABLE public.salle ADD CONSTRAINT FK_salle_id_site FOREIGN KEY (id_site) REFERENCES public.site(id_site);
ALTER TABLE public.poste ADD CONSTRAINT FK_poste_id_salle FOREIGN KEY (id_salle) REFERENCES public.salle(id_salle);
ALTER TABLE public.usager ADD CONSTRAINT FK_usager_id_adresse FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);
ALTER TABLE public.usager ADD CONSTRAINT FK_usager_id_personne FOREIGN KEY (id_personne) REFERENCES public.personne(id_personne);
ALTER TABLE public.usager ADD CONSTRAINT FK_usager_id_user FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);
ALTER TABLE public.usager ADD CONSTRAINT FK_usager_id_site FOREIGN KEY (id_site) REFERENCES public.site(id_site);
ALTER TABLE public.usager ADD CONSTRAINT FK_usager_id_quartier FOREIGN KEY (id_quartier) REFERENCES public.quartier_prioritaire(id_quartier);
ALTER TABLE public.utilisateur ADD CONSTRAINT FK_utilisateur_id_site FOREIGN KEY (id_site) REFERENCES public.site(id_site);
ALTER TABLE public.utilisateur ADD CONSTRAINT FK_utilisateur_id_personne FOREIGN KEY (id_personne) REFERENCES public.personne(id_personne);
ALTER TABLE public.reservation ADD CONSTRAINT FK_reservation_id_poste FOREIGN KEY (id_poste) REFERENCES public.poste(id_poste);
ALTER TABLE public.reservation ADD CONSTRAINT FK_reservation_id_user FOREIGN KEY (id_user) REFERENCES public.utilisateur(id_user);
ALTER TABLE public.reservation ADD CONSTRAINT FK_reservation_id_site FOREIGN KEY (id_site) REFERENCES public.site(id_site);
ALTER TABLE public.reservation ADD CONSTRAINT FK_reservation_id_usager FOREIGN KEY (id_usager) REFERENCES public.usager(id_usager);
ALTER TABLE public.reservation ADD CONSTRAINT FK_reservation_id_type_reservation FOREIGN KEY (id_type_reservation) REFERENCES public.type_reservation(id_type_reservation);
ALTER TABLE public.fermeture_site ADD CONSTRAINT FK_fermeture_site_id_site FOREIGN KEY (id_site) REFERENCES public.site(id_site);
ALTER TABLE public.fermeture_site ADD CONSTRAINT FK_fermeture_site_id_date_fermeture FOREIGN KEY (id_date_fermeture) REFERENCES public.date_fermeture(id_date_fermeture);
