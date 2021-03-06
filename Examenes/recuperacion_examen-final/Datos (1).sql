ALTER SESSION SET NLS_DATE_FORMAT='DD/MM/YYYY';
SET SERVEROUTPUT ON
SET linesize	120
SET pagesize	40

DROP TABLE ESPECIALIDADES CASCADE CONSTRAINTS;
CREATE TABLE ESPECIALIDADES (
   Cod_es		NUMBER(3)	PRIMARY KEY, -- C�digo Especialidad 
   Nombre_es	VARCHAR2(40) --	Nombre de la especialidad
);

DROP TABLE CENTROS CASCADE CONSTRAINTS;
CREATE TABLE CENTROS (
  Cod_ce	NUMBER(5)	PRIMARY KEY, -- C�digo del centro
  Nombre_ce	VARCHAR2(30)	-- Nombre del centro
);

DROP TABLE PLAZAS CASCADE CONSTRAINTS;
CREATE TABLE PLAZAS (
   Cod_pl		NUMBER(5) REFERENCES CENTROS, -- C�digo del centro
   Esp_pl		NUMBER(3) REFERENCES ESPECIALIDADES, -- C�digo Especialidad 
   PlazVac_pl	NUMBER(2), -- N�mero de plazas vacantes
   PlazAdj_pl	NUMBER(2), -- N�mero de plazas adjudicadas
   PRIMARY KEY (Cod_pl, Esp_pl)
);

DROP TABLE PROFESORES CASCADE CONSTRAINTS;
CREATE TABLE PROFESORES (
  Cod_pr		NUMBER(4)	PRIMARY KEY, --	C�digo profesor
  Nombre_pr		VARCHAR2(35), -- Nombre del profesor
  Esp_pr		NUMBER(3) REFERENCES ESPECIALIDADES, -- C�digo Especialidad del profesor
  AntCuerpo_pr	NUMBER(2), -- Antig�edad en el cuerpo
  Horas_pr		NUMBER(3), -- N� de horas de cursos
  AntCentro_pr	NUMBER(2) -- Antig�edad en el �ltimo centro de destino
);

DROP TABLE PETICIONES CASCADE CONSTRAINTS;
CREATE TABLE PETICIONES (
  Cod_pe		NUMBER(4), --	C�digo profesor
  Orden_pe		NUMBER(3), -- N� de orden de la petici�n
  Cen_pe		NUMBER(5) REFERENCES CENTROS,-- C�digo del centro pedido
   PRIMARY KEY (Cod_pe, Orden_pe)
);

DROP TABLE ADJUDICACIONES CASCADE CONSTRAINTS;
CREATE TABLE ADJUDICACIONES (
  Cod_ad		NUMBER(4) REFERENCES PROFESORES, -- C�digo profesor
  Esp_ad		NUMBER(3) REFERENCES ESPECIALIDADES, -- C�digo Especialidad 
  Cen_ad		NUMBER(5) REFERENCES CENTROS, -- C�digo del centro pedido
  Orden_ad		NUMBER(3), -- N� de orden de la petici�n adjudicada
   PRIMARY KEY (Cod_ad, Esp_ad, Cen_ad)
);



--------------------------- DATOS ESPECIALIDADES -------------------------------------------------
INSERT INTO ESPECIALIDADES VALUES (107, 'INFORMATICA');
INSERT INTO ESPECIALIDADES VALUES (101, 'ADMINISTRACION DE EMPRESA');
INSERT INTO ESPECIALIDADES VALUES ( 61, 'ECONOMIA');
INSERT INTO ESPECIALIDADES VALUES (227, 'SISTEMAS Y APLIC. INFORMATICOS');
--------------------------- DATOS CENTROS -------------------------------------------------
INSERT INTO CENTROS VALUES (41001, 'IES VELAZQUEZ');
INSERT INTO CENTROS VALUES (41002, 'IES POLIGONO SUR');
INSERT INTO CENTROS VALUES (41003, 'IES EL MAJUELO');
INSERT INTO CENTROS VALUES (41004, 'IES ALIXAR');
--------------------------- DATOS PLAZAS -------------------------------------------------
INSERT INTO PLAZAS VALUES (41001, 107, 1, 0);
INSERT INTO PLAZAS VALUES (41001, 101, 0, 0);
INSERT INTO PLAZAS VALUES (41001,  61, 1, 0);
INSERT INTO PLAZAS VALUES (41001, 227, 3, 0);
INSERT INTO PLAZAS VALUES (41002, 107, 1, 0);
INSERT INTO PLAZAS VALUES (41002, 101, 0, 0);
INSERT INTO PLAZAS VALUES (41002,  61, 1, 0);
INSERT INTO PLAZAS VALUES (41002, 227, 3, 0);
INSERT INTO PLAZAS VALUES (41003, 107, 1, 0);
INSERT INTO PLAZAS VALUES (41003, 101, 2, 0);
INSERT INTO PLAZAS VALUES (41003,  61, 1, 0);
INSERT INTO PLAZAS VALUES (41003, 227, 0, 0);
INSERT INTO PLAZAS VALUES (41004, 107, 1, 0);
INSERT INTO PLAZAS VALUES (41004, 101, 2, 0);
INSERT INTO PLAZAS VALUES (41004,  61, 1, 0);
INSERT INTO PLAZAS VALUES (41004, 227, 0, 0);
--------------------------- DATOS PROFESORES -------------------------------------------------
INSERT INTO PROFESORES VALUES (11,'GARCIA RODRIGUEZ, FRANCISCO JAVIER',	107,12,483,10);
INSERT INTO PROFESORES VALUES (12,'JEREZ CALERO, EZEQUIEL',				107, 2,150, 0);
INSERT INTO PROFESORES VALUES (13,'AVILES MAYO, RAQUEL',				107, 3,939, 0);
INSERT INTO PROFESORES VALUES (14,'JIMENEZ CAZALILLA, ENRIQUE FCO.',	107,11,315, 5);
INSERT INTO PROFESORES VALUES (15,'FERNANDEZ HERNANDEZ, GONZALO',		107,23,239,12);
INSERT INTO PROFESORES VALUES (16,'MARTIN CASTILLO, ANTONIO',			107, 5,515, 0);
INSERT INTO PROFESORES VALUES (17,'GOMEZ ARGUDO, JOSE ANGEL',			107, 3,670, 0);
INSERT INTO PROFESORES VALUES (18,'HIDALGO GALERA, MANUEL',				107, 6,215, 0);
INSERT INTO PROFESORES VALUES (19,'MU�OZ MARTIN, ESTEFANIA',			107, 7,127, 5);
INSERT INTO PROFESORES VALUES (20,'SIERRA FERNANDEZ, MARIA JOSE',		107,16,127,10);

INSERT INTO PROFESORES VALUES (31,'PEREZ CHICO, MARIA JOSE',			101,24,115,18);
INSERT INTO PROFESORES VALUES (32,'GARCIA ESCOBEDO, FRANCISCO JAVIER',	101, 2,227, 0);
INSERT INTO PROFESORES VALUES (33,'SORIA MARTINEZ, FRANCISCO JAVIER',	101, 9,315, 5);
INSERT INTO PROFESORES VALUES (34,'DELGADO SILVA, INMACULADA',			101, 3,427, 0);
INSERT INTO PROFESORES VALUES (35,'RENGEL HERNANDEZ, MARINA',			101, 2,539, 0);
INSERT INTO PROFESORES VALUES (36,'TRILLO SAEZ, BIENVENIDO',			101,15,140,11);
INSERT INTO PROFESORES VALUES (37,'BERNAL BRAVO, JOSUE',				101, 6,750, 0);
INSERT INTO PROFESORES VALUES (38,'POZO MADRO�AL, NICOLAS JOSE',		101,12,183,10);
INSERT INTO PROFESORES VALUES (39,'SERRANO QUEVEDO, FRANCISCO JOSE',	101,21,290,12);
INSERT INTO PROFESORES VALUES (40,'CABRERA ALONSO, ANTONIA ADELA',		101, 3,200, 0);

INSERT INTO PROFESORES VALUES (61,'AGUILERA GONZALEZ, FRANCISCO',		 61,11,815,10);
INSERT INTO PROFESORES VALUES (62,'JIMENEZ GARCIA, ISABEL MARIA',		 61, 3,539, 0);
INSERT INTO PROFESORES VALUES (63,'THOMAS BARROS, SILVIA',		 		 61,21,315,18);
INSERT INTO PROFESORES VALUES (64,'CIFUENTES IBA�EZ, ALEJANDRO',		 61, 2,127, 0);
INSERT INTO PROFESORES VALUES (65,'RIO CASTRO, ESTEBAN DEL',			 61,21,315,19);
INSERT INTO PROFESORES VALUES (66,'CARRION GARCIA, JESUS',				 61, 2,127, 0);
INSERT INTO PROFESORES VALUES (67,'VIDAL LUANCES, JOSE LUIS',			 61,12,727,12);
INSERT INTO PROFESORES VALUES (68,'ROLDAN MICHININA, CESAR JUAN',		 61, 8,183, 0);
INSERT INTO PROFESORES VALUES (69,'ROMAN HIDALGO, BEATRIZ',			 	 61, 3,239, 0);
INSERT INTO PROFESORES VALUES (70,'MOLLINEDO ARANDA, FERNANDO',		 	 61, 2,215, 0);

INSERT INTO PROFESORES VALUES (81,'GARCIA VACAS, IGNACIO',				227, 8,140, 0);
INSERT INTO PROFESORES VALUES (82,'SALIDO GOMEZ, FRANCISCO JAVIER',		227,15,315, 0);
INSERT INTO PROFESORES VALUES (83,'OLIAS ALVAREZ, INMACULADA',			227,13,190, 0);
INSERT INTO PROFESORES VALUES (84,'CARBAJO AVILA, MARIN',				227,11,239,10);
INSERT INTO PROFESORES VALUES (85,'MARTINEZ VARO, PEDRO JOSE',			227,13,127,11);
INSERT INTO PROFESORES VALUES (86,'RUIZ RUBIO, RAFAEL',					227,11,250, 9);
INSERT INTO PROFESORES VALUES (87,'GONZALEZ LOPEZ, LUIS',				227,17,260,15);
INSERT INTO PROFESORES VALUES (88,'POSTIGO PALACIOS, ANTONIO',			227,11,827, 0);
INSERT INTO PROFESORES VALUES (89,'POMARES MAS, MARIA ASUNCION',		227, 2,315, 2);
INSERT INTO PROFESORES VALUES (90,'SAINZ PULIDO, ALFREDO',				227,12,115, 6);
--------------------------- DATOS PETICIONES -------------------------------------------------
INSERT INTO PETICIONES VALUES (11, 1, 41001);
INSERT INTO PETICIONES VALUES (12, 1, 41001);
INSERT INTO PETICIONES VALUES (13, 1, 41001);
INSERT INTO PETICIONES VALUES (14, 1, 41001);
INSERT INTO PETICIONES VALUES (15, 1, 41001);
INSERT INTO PETICIONES VALUES (16, 1, 41001);
INSERT INTO PETICIONES VALUES (17, 1, 41001);
INSERT INTO PETICIONES VALUES (18, 1, 41001);
INSERT INTO PETICIONES VALUES (19, 1, 41001);
INSERT INTO PETICIONES VALUES (20, 1, 41001);

INSERT INTO PETICIONES VALUES (31, 1, 41001);
INSERT INTO PETICIONES VALUES (32, 1, 41001);
INSERT INTO PETICIONES VALUES (33, 1, 41001);
INSERT INTO PETICIONES VALUES (34, 1, 41001);
INSERT INTO PETICIONES VALUES (35, 1, 41001);
INSERT INTO PETICIONES VALUES (36, 1, 41001);
INSERT INTO PETICIONES VALUES (37, 1, 41001);
INSERT INTO PETICIONES VALUES (38, 1, 41001);
INSERT INTO PETICIONES VALUES (39, 1, 41001);
INSERT INTO PETICIONES VALUES (40, 1, 41001);
                                 
INSERT INTO PETICIONES VALUES (61, 1, 41001);
INSERT INTO PETICIONES VALUES (62, 1, 41001);
INSERT INTO PETICIONES VALUES (63, 1, 41001);
INSERT INTO PETICIONES VALUES (64, 1, 41001);
INSERT INTO PETICIONES VALUES (65, 1, 41001);
INSERT INTO PETICIONES VALUES (66, 1, 41001);
INSERT INTO PETICIONES VALUES (67, 1, 41001);
INSERT INTO PETICIONES VALUES (68, 1, 41001);
INSERT INTO PETICIONES VALUES (69, 1, 41001);
INSERT INTO PETICIONES VALUES (70, 1, 41001);
                                 
INSERT INTO PETICIONES VALUES (81, 1, 41001);
INSERT INTO PETICIONES VALUES (82, 1, 41001);
INSERT INTO PETICIONES VALUES (83, 1, 41001);
INSERT INTO PETICIONES VALUES (84, 1, 41001);
INSERT INTO PETICIONES VALUES (85, 1, 41001);
INSERT INTO PETICIONES VALUES (86, 1, 41001);
INSERT INTO PETICIONES VALUES (87, 1, 41001);
INSERT INTO PETICIONES VALUES (88, 1, 41001);
INSERT INTO PETICIONES VALUES (89, 1, 41001);
INSERT INTO PETICIONES VALUES (90, 1, 41001);

INSERT INTO PETICIONES VALUES (11, 2, 41002);
INSERT INTO PETICIONES VALUES (12, 2, 41002);
INSERT INTO PETICIONES VALUES (13, 2, 41002);
INSERT INTO PETICIONES VALUES (14, 2, 41002);
INSERT INTO PETICIONES VALUES (15, 2, 41002);
INSERT INTO PETICIONES VALUES (16, 2, 41002);
INSERT INTO PETICIONES VALUES (17, 2, 41002);
INSERT INTO PETICIONES VALUES (18, 2, 41002);
INSERT INTO PETICIONES VALUES (19, 2, 41002);
INSERT INTO PETICIONES VALUES (20, 2, 41002);

INSERT INTO PETICIONES VALUES (31, 2, 41002);
INSERT INTO PETICIONES VALUES (32, 2, 41002);
INSERT INTO PETICIONES VALUES (33, 2, 41002);
INSERT INTO PETICIONES VALUES (34, 2, 41002);
INSERT INTO PETICIONES VALUES (35, 2, 41002);
INSERT INTO PETICIONES VALUES (36, 2, 41002);
INSERT INTO PETICIONES VALUES (37, 2, 41002);
INSERT INTO PETICIONES VALUES (38, 2, 41002);
INSERT INTO PETICIONES VALUES (39, 2, 41002);
INSERT INTO PETICIONES VALUES (40, 2, 41002);
                                 
INSERT INTO PETICIONES VALUES (61, 2, 41002);
INSERT INTO PETICIONES VALUES (62, 2, 41002);
INSERT INTO PETICIONES VALUES (63, 2, 41002);
INSERT INTO PETICIONES VALUES (64, 2, 41002);
INSERT INTO PETICIONES VALUES (65, 2, 41002);
INSERT INTO PETICIONES VALUES (66, 2, 41002);
INSERT INTO PETICIONES VALUES (67, 2, 41002);
INSERT INTO PETICIONES VALUES (68, 2, 41002);
INSERT INTO PETICIONES VALUES (69, 2, 41002);
INSERT INTO PETICIONES VALUES (70, 2, 41002);
                                 
INSERT INTO PETICIONES VALUES (81, 2, 41002);
INSERT INTO PETICIONES VALUES (82, 2, 41002);
INSERT INTO PETICIONES VALUES (83, 2, 41002);
INSERT INTO PETICIONES VALUES (84, 2, 41002);
INSERT INTO PETICIONES VALUES (85, 2, 41002);
INSERT INTO PETICIONES VALUES (86, 2, 41002);
INSERT INTO PETICIONES VALUES (87, 2, 41002);
INSERT INTO PETICIONES VALUES (88, 2, 41002);
INSERT INTO PETICIONES VALUES (89, 2, 41002);
INSERT INTO PETICIONES VALUES (90, 2, 41002);

INSERT INTO PETICIONES VALUES (11, 3, 41003);
INSERT INTO PETICIONES VALUES (12, 3, 41003);
INSERT INTO PETICIONES VALUES (13, 3, 41003);
INSERT INTO PETICIONES VALUES (14, 3, 41003);
INSERT INTO PETICIONES VALUES (15, 3, 41003);
INSERT INTO PETICIONES VALUES (16, 3, 41003);
INSERT INTO PETICIONES VALUES (17, 3, 41003);
INSERT INTO PETICIONES VALUES (18, 3, 41003);
INSERT INTO PETICIONES VALUES (19, 3, 41003);
INSERT INTO PETICIONES VALUES (20, 3, 41003);

INSERT INTO PETICIONES VALUES (31, 3, 41003);
INSERT INTO PETICIONES VALUES (32, 3, 41003);
INSERT INTO PETICIONES VALUES (33, 3, 41003);
INSERT INTO PETICIONES VALUES (34, 3, 41003);
INSERT INTO PETICIONES VALUES (35, 3, 41003);
INSERT INTO PETICIONES VALUES (36, 3, 41003);
INSERT INTO PETICIONES VALUES (37, 3, 41003);
INSERT INTO PETICIONES VALUES (38, 3, 41003);
INSERT INTO PETICIONES VALUES (39, 3, 41003);
INSERT INTO PETICIONES VALUES (40, 3, 41003);
                                 
INSERT INTO PETICIONES VALUES (61, 3, 41003);
INSERT INTO PETICIONES VALUES (62, 3, 41003);
INSERT INTO PETICIONES VALUES (63, 3, 41003);
INSERT INTO PETICIONES VALUES (64, 3, 41003);
INSERT INTO PETICIONES VALUES (65, 3, 41003);
INSERT INTO PETICIONES VALUES (66, 3, 41003);
INSERT INTO PETICIONES VALUES (67, 3, 41003);
INSERT INTO PETICIONES VALUES (68, 3, 41003);
INSERT INTO PETICIONES VALUES (69, 3, 41003);
INSERT INTO PETICIONES VALUES (70, 3, 41003);
                                 
INSERT INTO PETICIONES VALUES (81, 3, 41003);
INSERT INTO PETICIONES VALUES (82, 3, 41003);
INSERT INTO PETICIONES VALUES (83, 3, 41003);
INSERT INTO PETICIONES VALUES (84, 3, 41003);
INSERT INTO PETICIONES VALUES (85, 3, 41003);
INSERT INTO PETICIONES VALUES (86, 3, 41003);
INSERT INTO PETICIONES VALUES (87, 3, 41003);
INSERT INTO PETICIONES VALUES (88, 3, 41003);
INSERT INTO PETICIONES VALUES (89, 3, 41003);
INSERT INTO PETICIONES VALUES (90, 3, 41003);

INSERT INTO PETICIONES VALUES (11, 4, 41004);
INSERT INTO PETICIONES VALUES (12, 4, 41004);
INSERT INTO PETICIONES VALUES (13, 4, 41004);
INSERT INTO PETICIONES VALUES (14, 4, 41004);
INSERT INTO PETICIONES VALUES (15, 4, 41004);
INSERT INTO PETICIONES VALUES (16, 4, 41004);
INSERT INTO PETICIONES VALUES (17, 4, 41004);
INSERT INTO PETICIONES VALUES (18, 4, 41004);
INSERT INTO PETICIONES VALUES (19, 4, 41004);
INSERT INTO PETICIONES VALUES (20, 4, 41004);

INSERT INTO PETICIONES VALUES (31, 4, 41004);
INSERT INTO PETICIONES VALUES (32, 4, 41004);
INSERT INTO PETICIONES VALUES (33, 4, 41004);
INSERT INTO PETICIONES VALUES (34, 4, 41004);
INSERT INTO PETICIONES VALUES (35, 4, 41004);
INSERT INTO PETICIONES VALUES (36, 4, 41004);
INSERT INTO PETICIONES VALUES (37, 4, 41004);
INSERT INTO PETICIONES VALUES (38, 4, 41004);
INSERT INTO PETICIONES VALUES (39, 4, 41004);
INSERT INTO PETICIONES VALUES (40, 4, 41004);
                                 
INSERT INTO PETICIONES VALUES (61, 4, 41004);
INSERT INTO PETICIONES VALUES (62, 4, 41004);
INSERT INTO PETICIONES VALUES (63, 4, 41004);
INSERT INTO PETICIONES VALUES (64, 4, 41004);
INSERT INTO PETICIONES VALUES (65, 4, 41004);
INSERT INTO PETICIONES VALUES (66, 4, 41004);
INSERT INTO PETICIONES VALUES (67, 4, 41004);
INSERT INTO PETICIONES VALUES (68, 4, 41004);
INSERT INTO PETICIONES VALUES (69, 4, 41004);
INSERT INTO PETICIONES VALUES (70, 4, 41004);
                                           
INSERT INTO PETICIONES VALUES (81, 4, 41004);
INSERT INTO PETICIONES VALUES (82, 4, 41004);
INSERT INTO PETICIONES VALUES (83, 4, 41004);
INSERT INTO PETICIONES VALUES (84, 4, 41004);
INSERT INTO PETICIONES VALUES (85, 4, 41004);
INSERT INTO PETICIONES VALUES (86, 4, 41004);
INSERT INTO PETICIONES VALUES (87, 4, 41004);
INSERT INTO PETICIONES VALUES (88, 4, 41004);
INSERT INTO PETICIONES VALUES (89, 4, 41004);
INSERT INTO PETICIONES VALUES (90, 4, 41004);

--------------------------- VALIDACION -------------------------------------------------
COMMIT;
--------------------------- CONSULTAS -------------------------------------------------
SELECT * FROM ESPECIALIDADES;
SELECT * FROM CENTROS;
SELECT * FROM PLAZAS;
SELECT * FROM PROFESORES;
SELECT * FROM PETICIONES;
SELECT * FROM ADJUDICACIONES;
