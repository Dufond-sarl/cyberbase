------------------------------------------------------------
--        Script Postgre 
------------------------------------------------------------



------------------------------------------------------------
-- Table: personne
------------------------------------------------------------
CREATE TABLE public.personne(
	id_personne SERIAL NOT NULL ,
	civilite    VARCHAR (25) NOT NULL ,
	nom         VARCHAR (20) NOT NULL ,
	prenom      VARCHAR (20) NOT NULL ,
	CONSTRAINT prk_constraint_personne PRIMARY KEY (id_personne)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: site
------------------------------------------------------------
CREATE TABLE public.site(
	id_site     SERIAL NOT NULL ,
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
	id_adresse         SERIAL NOT NULL ,
	complement_adresse VARCHAR (40)  ,
	numero_rue         VARCHAR (30)  ,
	code_postal        CHAR (55)   ,
	ville              VARCHAR (40) NOT NULL ,
	CONSTRAINT prk_constraint_adresse PRIMARY KEY (id_adresse)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: quartier_prioritaire
------------------------------------------------------------
CREATE TABLE public.quartier_prioritaire(
	id_quartier SERIAL NOT NULL ,
	nom         VARCHAR (30) NOT NULL ,
	CONSTRAINT prk_constraint_quartier_prioritaire PRIMARY KEY (id_quartier)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: salle
------------------------------------------------------------
CREATE TABLE public.salle(
	id_salle SERIAL NOT NULL ,
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
	login       VARCHAR (20) NOT NULL UNIQUE,
	m_d_p       VARCHAR (20) NOT NULL ,
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
	raison              VARCHAR (30) NOT NULL ,
	date_heur_deb       DATE  NOT NULL UNIQUE,
	date_heur_fin       DATE  NOT NULL UNIQUE,
	id_poste            INT  NOT NULL ,
	id_user             INT  NOT NULL ,
	id_usager           INT   ,
	id_type_reservation INT  NOT NULL ,
	CONSTRAINT prk_constraint_reservation PRIMARY KEY (id_reservation)
)WITHOUT OIDS;


------------------------------------------------------------
-- Table: type_reservation
------------------------------------------------------------
CREATE TABLE public.type_reservation(
	id_type_reservation SERIAL NOT NULL ,
	nom                 VARCHAR (25) NOT NULL UNIQUE,
	CONSTRAINT prk_constraint_type_reservation PRIMARY KEY (id_type_reservation)
)WITHOUT OIDS;



ALTER TABLE public.site ADD CONSTRAINT FK_site_id_adresse FOREIGN KEY (id_adresse) REFERENCES public.adresse(id_adresse);
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
ALTER TABLE public.reservation ADD CONSTRAINT FK_reservation_id_usager FOREIGN KEY (id_usager) REFERENCES public.usager(id_usager);
ALTER TABLE public.reservation ADD CONSTRAINT FK_reservation_id_type_reservation FOREIGN KEY (id_type_reservation) REFERENCES public.type_reservation(id_type_reservation);

