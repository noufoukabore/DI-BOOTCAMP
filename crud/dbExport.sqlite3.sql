BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "django_migrations" (
	"id"	integer NOT NULL,
	"app"	varchar(255) NOT NULL,
	"name"	varchar(255) NOT NULL,
	"applied"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_group_permissions" (
	"id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_groups" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"group_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("group_id") REFERENCES "auth_group"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_user_user_permissions" (
	"id"	integer NOT NULL,
	"user_id"	integer NOT NULL,
	"permission_id"	integer NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("permission_id") REFERENCES "auth_permission"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_admin_log" (
	"id"	integer NOT NULL,
	"object_id"	text,
	"object_repr"	varchar(200) NOT NULL,
	"action_flag"	smallint unsigned NOT NULL CHECK("action_flag" >= 0),
	"change_message"	text NOT NULL,
	"content_type_id"	integer,
	"user_id"	integer NOT NULL,
	"action_time"	datetime NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("user_id") REFERENCES "auth_user"("id") DEFERRABLE INITIALLY DEFERRED,
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "django_content_type" (
	"id"	integer NOT NULL,
	"app_label"	varchar(100) NOT NULL,
	"model"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_permission" (
	"id"	integer NOT NULL,
	"content_type_id"	integer NOT NULL,
	"codename"	varchar(100) NOT NULL,
	"name"	varchar(255) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("content_type_id") REFERENCES "django_content_type"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "auth_group" (
	"id"	integer NOT NULL,
	"name"	varchar(150) NOT NULL UNIQUE,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "auth_user" (
	"id"	integer NOT NULL,
	"password"	varchar(128) NOT NULL,
	"last_login"	datetime,
	"is_superuser"	bool NOT NULL,
	"username"	varchar(150) NOT NULL UNIQUE,
	"last_name"	varchar(150) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"is_staff"	bool NOT NULL,
	"is_active"	bool NOT NULL,
	"date_joined"	datetime NOT NULL,
	"first_name"	varchar(150) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "entreprise_entreprise" (
	"id"	integer NOT NULL,
	"name"	varchar(250) NOT NULL,
	"description"	text NOT NULL,
	"address"	varchar(200) NOT NULL,
	"phone"	varchar(20) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"domaine"	varchar(200),
	"vision"	varchar(200),
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "django_session" (
	"session_key"	varchar(40) NOT NULL,
	"session_data"	text NOT NULL,
	"expire_date"	datetime NOT NULL,
	PRIMARY KEY("session_key")
);
CREATE TABLE IF NOT EXISTS "entreprise_contact" (
	"id"	integer NOT NULL,
	"name"	varchar(100) NOT NULL,
	"email"	varchar(254) NOT NULL,
	"message"	text NOT NULL,
	"created_at"	datetime NOT NULL,
	"entreprise_id"	bigint NOT NULL,
	FOREIGN KEY("entreprise_id") REFERENCES "entreprise_entreprise"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "faq_faq" (
	"id"	integer NOT NULL,
	"question"	text NOT NULL,
	"reponse"	text NOT NULL,
	"entreprise_id"	bigint NOT NULL,
	"mots_cles"	varchar(300),
	FOREIGN KEY("entreprise_id") REFERENCES "entreprise_entreprise"("id") DEFERRABLE INITIALLY DEFERRED,
	PRIMARY KEY("id" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "produit_produit" (
	"id"	integer NOT NULL,
	"name"	varchar(200) NOT NULL,
	"description"	text NOT NULL,
	"price"	real NOT NULL,
	"created"	datetime NOT NULL,
	"entreprise_id"	bigint NOT NULL,
	"image"	varchar(100) NOT NULL,
	"mots_cles"	varchar(300),
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("entreprise_id") REFERENCES "entreprise_entreprise"("id") DEFERRABLE INITIALLY DEFERRED
);
CREATE TABLE IF NOT EXISTS "service_service" (
	"id"	integer NOT NULL,
	"name"	varchar(200) NOT NULL,
	"description"	text NOT NULL,
	"price"	real NOT NULL,
	"created"	datetime NOT NULL,
	"entreprise_id"	bigint NOT NULL,
	"mots_cles"	varchar(300),
	"image"	varchar(100) NOT NULL,
	PRIMARY KEY("id" AUTOINCREMENT),
	FOREIGN KEY("entreprise_id") REFERENCES "entreprise_entreprise"("id") DEFERRABLE INITIALLY DEFERRED
);
INSERT INTO "django_migrations" ("id","app","name","applied") VALUES (1,'contenttypes','0001_initial','2023-08-30 12:34:23.625182'),
 (2,'auth','0001_initial','2023-08-30 12:34:24.390176'),
 (3,'admin','0001_initial','2023-08-30 12:34:24.950162'),
 (4,'admin','0002_logentry_remove_auto_add','2023-08-30 12:34:25.549150'),
 (5,'admin','0003_logentry_add_action_flag_choices','2023-08-30 12:34:25.892171'),
 (6,'contenttypes','0002_remove_content_type_name','2023-08-30 12:34:26.225136'),
 (7,'auth','0002_alter_permission_name_max_length','2023-08-30 12:34:26.530157'),
 (8,'auth','0003_alter_user_email_max_length','2023-08-30 12:34:27.169167'),
 (9,'auth','0004_alter_user_username_opts','2023-08-30 12:34:27.546116'),
 (10,'auth','0005_alter_user_last_login_null','2023-08-30 12:34:27.910108'),
 (11,'auth','0006_require_contenttypes_0002','2023-08-30 12:34:28.225101'),
 (12,'auth','0007_alter_validators_add_error_messages','2023-08-30 12:34:28.535096'),
 (13,'auth','0008_alter_user_username_max_length','2023-08-30 12:34:28.827089'),
 (14,'auth','0009_alter_user_last_name_max_length','2023-08-30 12:34:29.337084'),
 (15,'auth','0010_alter_group_name_max_length','2023-08-30 12:34:29.655073'),
 (16,'auth','0011_update_proxy_permissions','2023-08-30 12:34:30.123125'),
 (17,'auth','0012_alter_user_first_name_max_length','2023-08-30 12:34:30.779058'),
 (18,'entreprise','0001_initial','2023-08-30 12:34:31.157046'),
 (19,'faq','0001_initial','2023-08-30 12:34:31.623040'),
 (20,'produit','0001_initial','2023-08-30 12:34:31.910035'),
 (21,'service','0001_initial','2023-08-30 12:34:32.689019'),
 (22,'sessions','0001_initial','2023-08-30 12:34:34.071995'),
 (23,'entreprise','0002_contact_entreprise','2023-09-05 15:53:05.613278'),
 (24,'faq','0002_faq_entreprise','2023-09-05 15:53:05.802431'),
 (25,'produit','0002_produit_entreprise','2023-09-05 15:53:05.963800'),
 (26,'service','0002_service_entreprise_alter_service_image','2023-09-05 15:53:06.131152'),
 (27,'produit','0003_alter_produit_image','2023-10-30 12:55:46.124605'),
 (28,'faq','0003_faq_mots_cles','2023-12-20 11:29:38.282651'),
 (29,'produit','0004_produit_mots_cles','2023-12-20 11:29:38.392214'),
 (30,'service','0003_service_mots_cles_alter_service_image','2023-12-20 11:29:38.483042'),
 (31,'entreprise','0003_entreprise_domaine_entreprise_vision','2023-12-20 16:50:09.494822');
INSERT INTO "django_admin_log" ("id","object_id","object_repr","action_flag","change_message","content_type_id","user_id","action_time") VALUES (1,'1','Smart Touch',1,'[{"added": {}}]',8,1,'2023-09-05 18:28:39.141384'),
 (2,'2','',3,'',9,1,'2023-09-09 18:06:40.871824'),
 (3,'5','',3,'',9,1,'2023-09-09 18:14:42.747646'),
 (4,'4','',3,'',9,1,'2023-09-09 18:14:43.329062'),
 (5,'6','',3,'',9,1,'2023-09-09 18:24:03.458734'),
 (6,'5','Portail a ouverture automatique',2,'[{"changed": {"fields": ["Name", "Description", "Price"]}}]',10,1,'2023-10-01 12:58:36.683836'),
 (7,'4','Demarrage de voitures a distances',2,'[{"changed": {"fields": ["Name", "Description", "Price"]}}]',10,1,'2023-10-01 12:59:46.389459'),
 (8,'3','Camera de surveillance intelligente',2,'[{"changed": {"fields": ["Name", "Description", "Price"]}}]',10,1,'2023-10-01 13:00:51.034717'),
 (9,'2','Equipement solaire Growatt',2,'[{"changed": {"fields": ["Name", "Description", "Price"]}}]',10,1,'2023-10-01 13:01:49.420550'),
 (10,'1','Interphone connectes',2,'[{"changed": {"fields": ["Name", "Description", "Price"]}}]',10,1,'2023-10-01 13:03:09.513335'),
 (11,'1','Hebergement',2,'[{"changed": {"fields": ["Description", "Price"]}}]',11,1,'2023-10-01 13:04:00.588112'),
 (12,'2','Cybersecurite',1,'[{"added": {}}]',11,1,'2023-10-01 13:05:14.115977'),
 (13,'3','Mails professsionel et noms de domaine',1,'[{"added": {}}]',11,1,'2023-10-01 13:06:10.248416'),
 (14,'9','Iphone XR',3,'',10,1,'2023-12-21 14:46:18.730541'),
 (15,'8','Button',3,'',10,1,'2023-12-21 14:46:18.884681'),
 (16,'7','Juste ca',3,'',10,1,'2023-12-21 14:46:19.032188'),
 (17,'6','Camera Xx tentation',3,'',10,1,'2023-12-21 14:46:19.129991'),
 (18,'5','Portail a ouverture automatique',3,'',10,1,'2023-12-21 14:46:19.239061'),
 (19,'4','Demarrage de voitures a distances',3,'',10,1,'2023-12-21 14:46:19.362115'),
 (20,'3','Camera de surveillance intelligente',3,'',10,1,'2023-12-21 14:46:19.436944'),
 (21,'2','Equipement solaire Growatt',3,'',10,1,'2023-12-21 14:46:19.544960'),
 (22,'1','Interphone connecte',3,'',10,1,'2023-12-21 14:46:19.621797'),
 (23,'10','Portails a ouverture automatique et telecommandee',1,'[{"added": {}}]',10,1,'2023-12-21 14:48:21.352722'),
 (24,'11','Interphone video',1,'[{"added": {}}]',10,1,'2023-12-21 14:49:31.034559'),
 (25,'12','Pointeur biometrique',1,'[{"added": {}}]',10,1,'2023-12-21 14:50:36.168905'),
 (26,'13','Demarrage a distance des voitures',1,'[{"added": {}}]',10,1,'2023-12-21 14:52:06.209592'),
 (27,'14','Mini Serveurs pour PME',1,'[{"added": {}}]',10,1,'2023-12-21 14:53:35.068456'),
 (28,'15','Imprimante 3D',1,'[{"added": {}}]',10,1,'2023-12-21 14:54:30.468479'),
 (29,'16','Equipements Solaires marque Growatt',1,'[{"added": {}}]',10,1,'2023-12-21 14:55:50.171565'),
 (30,'17','Contrôle d’accès classique ou biométrique',1,'[{"added": {}}]',10,1,'2023-12-21 14:57:34.297693'),
 (31,'18','Serrures intelligentes',1,'[{"added": {}}]',10,1,'2023-12-21 14:59:14.985619'),
 (32,'19','Kit Camera sans fil haut de gamme',1,'[{"added": {}}]',10,1,'2023-12-21 15:23:06.327795'),
 (33,'20','Alarme GSM Professionnel 4G sans fil',1,'[{"added": {}}]',10,1,'2023-12-21 15:29:52.317008'),
 (34,'21','Video projecteurs interactifs',1,'[{"added": {}}]',10,1,'2023-12-21 15:33:49.646737'),
 (35,'5','Formation en développement web js',3,'',11,1,'2023-12-21 15:35:03.393714'),
 (36,'4','Licence Kaspersky',3,'',11,1,'2023-12-21 15:35:03.455336'),
 (37,'3','Mails professsionel et noms de domaine',3,'',11,1,'2023-12-21 15:35:03.525497'),
 (38,'2','Cybersecurite',3,'',11,1,'2023-12-21 15:35:03.607894'),
 (39,'1','Hebergement',3,'',11,1,'2023-12-21 15:35:03.673729'),
 (40,'6','L''intelligence artificielle',1,'[{"added": {}}]',11,1,'2023-12-21 15:36:37.456348'),
 (41,'7','La transformation digital',1,'[{"added": {}}]',11,1,'2023-12-21 15:38:14.003918'),
 (42,'8','Mails professionnels et domaine (Mails Pro)',1,'[{"added": {}}]',11,1,'2023-12-21 15:39:11.896872'),
 (43,'9','Automatisation et Maison intelligente',1,'[{"added": {}}]',11,1,'2023-12-21 15:40:00.115668'),
 (44,'10','Les energies renouvelables',1,'[{"added": {}}]',11,1,'2023-12-21 15:41:55.957157'),
 (45,'11','Cybersecurite',1,'[{"added": {}}]',11,1,'2023-12-21 15:43:21.911305'),
 (46,'12','Solution de paiement mobile',1,'[{"added": {}}]',11,1,'2023-12-21 15:44:35.437039'),
 (47,'13','Hebergement web',1,'[{"added": {}}]',11,1,'2023-12-21 15:45:51.820048'),
 (48,'1','Smart Touch',2,'[{"changed": {"fields": ["Description", "Address", "Phone", "Email", "Vision", "Domaine"]}}]',8,1,'2023-12-21 15:51:45.573732'),
 (49,'1','Smart Touch Group',2,'[{"changed": {"fields": ["Name"]}}]',8,1,'2023-12-21 15:51:55.390135'),
 (50,'9','Qu''est ce que l''IA?',3,'',9,1,'2023-12-21 15:52:05.115188'),
 (51,'8','salut',3,'',9,1,'2023-12-21 15:52:05.170278'),
 (52,'7','Justin',3,'',9,1,'2023-12-21 15:52:05.273689'),
 (53,'3','Juste',3,'',9,1,'2023-12-21 15:52:05.343700'),
 (54,'1','Qu''est ce que l''IA !',3,'',9,1,'2023-12-21 15:52:05.401350'),
 (55,'10','Quels sont vos horaires d''ouverture ?',1,'[{"added": {}}]',9,1,'2023-12-21 15:54:31.588722'),
 (56,'11','Quelle est votre politique de livraison ?',1,'[{"added": {}}]',9,1,'2023-12-21 15:55:43.470844'),
 (57,'12','Je n''arrive pas à me connecter à mon compte client, que faire ?',1,'[{"added": {}}]',9,1,'2023-12-21 15:56:29.833695');
INSERT INTO "django_content_type" ("id","app_label","model") VALUES (1,'admin','logentry'),
 (2,'auth','permission'),
 (3,'auth','group'),
 (4,'auth','user'),
 (5,'contenttypes','contenttype'),
 (6,'sessions','session'),
 (7,'entreprise','contact'),
 (8,'entreprise','entreprise'),
 (9,'faq','faq'),
 (10,'produit','produit'),
 (11,'service','service');
INSERT INTO "auth_permission" ("id","content_type_id","codename","name") VALUES (1,1,'add_logentry','Can add log entry'),
 (2,1,'change_logentry','Can change log entry'),
 (3,1,'delete_logentry','Can delete log entry'),
 (4,1,'view_logentry','Can view log entry'),
 (5,2,'add_permission','Can add permission'),
 (6,2,'change_permission','Can change permission'),
 (7,2,'delete_permission','Can delete permission'),
 (8,2,'view_permission','Can view permission'),
 (9,3,'add_group','Can add group'),
 (10,3,'change_group','Can change group'),
 (11,3,'delete_group','Can delete group'),
 (12,3,'view_group','Can view group'),
 (13,4,'add_user','Can add user'),
 (14,4,'change_user','Can change user'),
 (15,4,'delete_user','Can delete user'),
 (16,4,'view_user','Can view user'),
 (17,5,'add_contenttype','Can add content type'),
 (18,5,'change_contenttype','Can change content type'),
 (19,5,'delete_contenttype','Can delete content type'),
 (20,5,'view_contenttype','Can view content type'),
 (21,6,'add_session','Can add session'),
 (22,6,'change_session','Can change session'),
 (23,6,'delete_session','Can delete session'),
 (24,6,'view_session','Can view session'),
 (25,7,'add_contact','Can add contact'),
 (26,7,'change_contact','Can change contact'),
 (27,7,'delete_contact','Can delete contact'),
 (28,7,'view_contact','Can view contact'),
 (29,8,'add_entreprise','Can add entreprise'),
 (30,8,'change_entreprise','Can change entreprise'),
 (31,8,'delete_entreprise','Can delete entreprise'),
 (32,8,'view_entreprise','Can view entreprise'),
 (33,9,'add_faq','Can add faq'),
 (34,9,'change_faq','Can change faq'),
 (35,9,'delete_faq','Can delete faq'),
 (36,9,'view_faq','Can view faq'),
 (37,10,'add_produit','Can add produit'),
 (38,10,'change_produit','Can change produit'),
 (39,10,'delete_produit','Can delete produit'),
 (40,10,'view_produit','Can view produit'),
 (41,11,'add_service','Can add service'),
 (42,11,'change_service','Can change service'),
 (43,11,'delete_service','Can delete service'),
 (44,11,'view_service','Can view service');
INSERT INTO "auth_user" ("id","password","last_login","is_superuser","username","last_name","email","is_staff","is_active","date_joined","first_name") VALUES (1,'pbkdf2_sha256$600000$OH7k53TG8F0KwxukP7dbuk$yCTRMdjxhenx6ncDSYjadULY0kNcfInMg+enYAzx/1Q=','2023-12-20 11:43:50.708784',1,'admin','','',1,1,'2023-09-05 11:35:21.161270',''),
 (2,'pbkdf2_sha256$600000$pVjF9qQX4q7WgEV0iF0BzT$bsA8hjsbFye/8qzynb7tgTzrepxn+mtPjlffJ4IXBgk=','2023-09-05 14:23:53.500825',0,'Kuroko','','justeuntest@gmail.com',0,1,'2023-09-05 13:32:55.136892','');
INSERT INTO "entreprise_entreprise" ("id","name","description","address","phone","email","domaine","vision") VALUES (1,'Smart Touch Group','Smart Touch Group est une société informatique spécialisée dans les domaines de l''intelligence artificielle, la domotique, le développement web mobile et les solutions de paiement mobile. Smart Touch Group vous facilite la vie en vous proposant des objets connectés et commandés à distance','Rue 12.22, Secteur 12, Nemnin, Ouagadougou, Burkina Faso','+226 55026262','contact@smt-group.net','Nos services comprennent l’intelligence artificielle, la domotique, la transformation numérique, les énergies renouvelables et la cybersécurité.','demystifier la technologie avancée et permettre son accès à tous');
INSERT INTO "django_session" ("session_key","session_data","expire_date") VALUES ('8bzks39hkfdysgf3hg4uevlfbq650376','e30:1qdWwr:XBWABiRG1smMPpvlqk6tdx8vrup3nTLyvw9NEFUgK80','2023-09-19 14:22:33.722482'),
 ('wttvksvs1bq48eucm51wgbgmjzsvusqp','.eJxVjEEOwiAQRe_C2pAyUKbj0r1nIAODUjU0Ke3KeHfbpAvdvvf-f6vA61LC2vIcRlFnZdTpl0VOz1x3IQ-u90mnqS7zGPWe6MM2fZ0kvy5H-3dQuJVtzRYF0AINICYaYDLWdxG9UEakREIuuaEnJLa97-zNO-s8gQOzgaQ-X7G6Njo:1qdacP:mYBN3oogArhsefMlExJZXi6KL3KC5vwTd21dMCHCtaw','2023-09-19 18:17:41.894738'),
 ('koihpu2rjh99sms9h3qzv7yiqedg7vby','.eJxVjEEOwiAQRe_C2pAyUKbj0r1nIAODUjU0Ke3KeHfbpAvdvvf-f6vA61LC2vIcRlFnZdTpl0VOz1x3IQ-u90mnqS7zGPWe6MM2fZ0kvy5H-3dQuJVtzRYF0AINICYaYDLWdxG9UEakREIuuaEnJLa97-zNO-s8gQOzgaQ-X7G6Njo:1qmvxn:RtLnTqLNnTlJhn4sITO6lWXY4SUv3U6cQsu0T4wBdIQ','2023-10-15 12:54:23.852607'),
 ('xxd6oa5jxitgfh7tbgnbbe8g3nupa9dk','.eJxVjEEOwiAQRe_C2pAyUKbj0r1nIAODUjU0Ke3KeHfbpAvdvvf-f6vA61LC2vIcRlFnZdTpl0VOz1x3IQ-u90mnqS7zGPWe6MM2fZ0kvy5H-3dQuJVtzRYF0AINICYaYDLWdxG9UEakREIuuaEnJLa97-zNO-s8gQOzgaQ-X7G6Njo:1quvli:khzdt3Hr_G_PV117OYPampwN5eTqcRnpuewZ8RMuyNE','2023-11-06 14:18:58.416251'),
 ('0ch7jhhr1nm7n0rbopk7sj5s8eu5xxhi','.eJxVjEEOwiAQRe_C2pAyUKbj0r1nIAODUjU0Ke3KeHfbpAvdvvf-f6vA61LC2vIcRlFnZdTpl0VOz1x3IQ-u90mnqS7zGPWe6MM2fZ0kvy5H-3dQuJVtzRYF0AINICYaYDLWdxG9UEakREIuuaEnJLa97-zNO-s8gQOzgaQ-X7G6Njo:1rFuzO:F0dOk7FyqNOXLpLePqxwoftNWAcL1rvS3BEDNEYbCf8','2024-01-03 11:43:50.818512');
INSERT INTO "faq_faq" ("id","question","reponse","entreprise_id","mots_cles") VALUES (10,'Quels sont vos horaires d''ouverture ?','Nos magasins sont ouverts du lundi au vendredi de 08h00 à 18h, et le samedi de 8h00 a 12h00',1,'horaire,heure,ouverture,horaires,heures'),
 (11,'Quelle est votre politique de livraison ?','Nous proposons la livraison gratuite en point relais pour toute commande supérieure à 20000f. La livraison à domicile est possible à partir de 2000f. Les délais sont généralement de 2 à 3 jours ouvrés.',1,'livraison,livree,livre,domicile'),
 (12,'Je n''arrive pas à me connecter à mon compte client, que faire ?','Si vous rencontrez des difficultés pour vous connecter à votre compte, vous pouvez réinitialiser votre mot de passe via l''option "Mot de passe oublié" sur la page de connexion. Sinon contactez notre service client qui vous assistera',1,'compte,connecter,compte,connexion');
INSERT INTO "produit_produit" ("id","name","description","price","created","entreprise_id","image","mots_cles") VALUES (10,'Portails a ouverture automatique et telecommandee','Les details',150000.0,'2023-12-21 14:48:21.350724',1,'images/produit/montech_presentation_1.png','portails,portail a ouverture,portails a ouverture automatique,telecommandee'),
 (11,'Interphone video','Interphone',250000.0,'2023-12-21 14:49:31.032562',1,'images/produit/icons8-whatsapp-50.png','interphone,interphone video,interphone audio'),
 (12,'Pointeur biometrique','Pointeur biometrique',250000.0,'2023-12-21 14:50:36.165921',1,'images/produit/montech_presentation_1_DjrsQPJ.png','pointeur,pointeuse,pointeur biometrique,pointeuse biometrique'),
 (13,'Demarrage a distance des voitures','Demarrage a distance',150000.0,'2023-12-21 14:52:06.134153',1,'images/produit/icons8-whatsapp-96.png','demarrage,distance,voiture,voitures,demarrage a distance,demarrage a distance des voitures'),
 (14,'Mini Serveurs pour PME','Mini serveur pour PME',500000.0,'2023-12-21 14:53:35.047932',1,'images/produit/icons8-whatsapp-96_wYvctzD.png','mini serveur,serveur,pme,PME'),
 (15,'Imprimante 3D','Imprimante 3D',800000.0,'2023-12-21 14:54:30.465182',1,'images/produit/icons8-whatsapp-96_3Xhf1rO.png','imprimante,3d,3D,imprimante 3D,imprimante 3d'),
 (16,'Equipements Solaires marque Growatt','Equipement Solaires marque',450000.0,'2023-12-21 14:55:50.140785',1,'images/produit/MonTechnicien_fBVNEKK.png','solaire,solaires,equipement solaire,growatt'),
 (17,'Contrôle d’accès classique ou biométrique','Controle d''acces',250000.0,'2023-12-21 14:57:34.292270',1,'images/produit/MonTechnicien_B1uZsX3.png','contrôle,controle,acces,controle d''acces,controle d''acces biometrique'),
 (18,'Serrures intelligentes','Serrures intelligentes',450000.0,'2023-12-21 14:59:14.959858',1,'images/produit/MonTechnicien_1.png','serrure,serrures,serrure intelligente,porte,fenetre'),
 (19,'Kit Camera sans fil haut de gamme','* Camera Haut de gamme
* Model tablette portable avec écran 10 pouces (plus besoin de télé)
* Image 3MP ou 5MP (irréprochable)
* Enregistrement possible sur disque dur jusqu''à 6 Tera
* Détection humanoïde et détection de mouvement avec alerte sur le téléphone
* Accès aux images à distance',150000.0,'2023-12-21 15:23:06.320886',1,'images/produit/montech_presentation_1_UHbdfw4.png','camera,sans fil,camera sans fil,camera sans fil haut de gamme'),
 (20,'Alarme GSM Professionnel 4G sans fil','* Détecteur de mouvement
* Détecteur de présence
* Détecteur d''ouverture de porte 
* Détecteur de vibration de porte
* Détecteur de fuite d''eau, de gaz, de fumée
* Sirène
* Déverrouillage par Empreinte',150000.0,'2023-12-21 15:29:52.296360',1,'images/produit/icons8-whatsapp-50_ffaEMdG.png','alarme,gsm,alerte gsm'),
 (21,'Video projecteurs interactifs','Video projecteurs interactifs',150000.0,'2023-12-21 15:33:49.623939',1,'images/produit/MonTechnicien_xIcvVJK.png','video,projecteurs,projecteur,projecteur interactif,interactif');
INSERT INTO "service_service" ("id","name","description","price","created","entreprise_id","mots_cles","image") VALUES (6,'L''intelligence artificielle','Les solutions de chatbots et d’assistance off-line (IA et Automatisme)
* La sécurité via caméra thermique (détection de température) etc.
* Les applications intelligentes dans le but de soulager l’être humain dans sa tâche quotidienne
* Vidéoprojecteurs interactifs',0.0,'2023-12-21 15:36:37.439763',1,'ia,intelligence,artificielle,intelligence artificielle','images/service/MonTechnicien.png'),
 (7,'La transformation digital','Les concepts d’ERP, de client-serveur, de multipropriété, de mainframes, d’Internet, ou bien encore de cloud font en effet partie intégrante de nos vies, personnelles et/ou professionnelles
* La conception des sites Web dynamiques
* La mise en place des logiciels et progiciels adaptés à vos besoins (avec notre partenaire Odoo)
* Développement IOS et Android 
* Hébergement illimité 
* Les mini PC et Mini Serveurs de très grande performance avec ou sans ventilateur 
* Point de vente pour les boutiques, restaurants et supermarchés
* Les ordinateurs All In One (AIO)',0.0,'2023-12-21 15:38:13.975928',1,'transformation,digital,erp,site web,conception,iso,android','images/service/montech_presentation_1.png'),
 (8,'Mails professionnels et domaine (Mails Pro)','* domaine gratuit 
* Mails professionnels xxx@monentreprise.com
* Serveurs sécurisés 
* Simplification de la communication 
* Identité en ligne
* Visibilité sur Internet',0.0,'2023-12-21 15:39:11.883113',1,'domaine,mails,mails professionnels,domaine','images/service/montech_presentation.png'),
 (9,'Automatisation et Maison intelligente','* Intercom video connecté
* Serrure intelligente
* Contrôle à distance
* Porte electronique
* Prises et interrupteurs intelligente et connectée
* Automatisation des actions et aide à la prise de décision',0.0,'2023-12-21 15:40:00.113181',1,'intercom,maison intelligente,automatisation','images/service/montech_presentation_1_D03edSv.png'),
 (10,'Les energies renouvelables','L''étude et la mise en place de vos centrales photovoltaïques
* Le dimensionnement, la fourniture
* L’installation et la configuration de vos équipements solaires
* Le déploiement d’équipements et de solutions de protection électrique 
* L’accompagnement dans l’implémentation de stratégie d’efficacité énergétique 
* Conseils pour vous permettre de mieux gérer votre énergie solaire',0.0,'2023-12-21 15:41:55.948723',1,'energie,energies,renouvenable,energie renouvenable','images/service/montech_presentation_1_KSAur9y.png'),
 (11,'Cybersecurite','Solutions de pare feux de dernières génération NGFW
* Les solutions d’IPS intégré
* Les solutions de blocage par géolocalisation des IPs
* Gestion par réputation
* Contrôle applicatif, Portails captifs
* Bouclier Anti-DDOS
* Antivirus et détection APT
* Antispam, Fonction DLP (Data Leak Prevention), 
* Contrôle des accès mobile et VPN 
* Contrôle des utilisateurs
* Outils de visualisation temps-réel',0.0,'2023-12-21 15:43:21.901310',1,'cybersecurite,ddos,antivirus,detection,vpn,pare feux,ips','images/service/MonTechnicien_1.png'),
 (12,'Solution de paiement mobile','Paiements mobile',0.0,'2023-12-21 15:44:35.413325',1,'solution,paiement,mobile,paiement mobile,solution de paiement mobile','images/service/MonTechnicien_1_hT5rHNw.png'),
 (13,'Hebergement web','Hebergement web',0.0,'2023-12-21 15:45:51.811002',1,'hebergement,web,hebergement web','images/service/MonTechnicien_1_quWmK3d.png');
CREATE UNIQUE INDEX IF NOT EXISTS "auth_group_permissions_group_id_permission_id_0cd325b0_uniq" ON "auth_group_permissions" (
	"group_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_group_id_b120cbf9" ON "auth_group_permissions" (
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_group_permissions_permission_id_84c5c92e" ON "auth_group_permissions" (
	"permission_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_groups_user_id_group_id_94350c0c_uniq" ON "auth_user_groups" (
	"user_id",
	"group_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_user_id_6a12ed8b" ON "auth_user_groups" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_groups_group_id_97559544" ON "auth_user_groups" (
	"group_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_permission_id_14a6b632_uniq" ON "auth_user_user_permissions" (
	"user_id",
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_user_id_a95ead1b" ON "auth_user_user_permissions" (
	"user_id"
);
CREATE INDEX IF NOT EXISTS "auth_user_user_permissions_permission_id_1fbb5f2c" ON "auth_user_user_permissions" (
	"permission_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_content_type_id_c4bce8eb" ON "django_admin_log" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_admin_log_user_id_c564eba6" ON "django_admin_log" (
	"user_id"
);
CREATE UNIQUE INDEX IF NOT EXISTS "django_content_type_app_label_model_76bd3d3b_uniq" ON "django_content_type" (
	"app_label",
	"model"
);
CREATE UNIQUE INDEX IF NOT EXISTS "auth_permission_content_type_id_codename_01ab375a_uniq" ON "auth_permission" (
	"content_type_id",
	"codename"
);
CREATE INDEX IF NOT EXISTS "auth_permission_content_type_id_2f476e4b" ON "auth_permission" (
	"content_type_id"
);
CREATE INDEX IF NOT EXISTS "django_session_expire_date_a5c62663" ON "django_session" (
	"expire_date"
);
CREATE INDEX IF NOT EXISTS "entreprise_contact_entreprise_id_9d857758" ON "entreprise_contact" (
	"entreprise_id"
);
CREATE INDEX IF NOT EXISTS "faq_faq_entreprise_id_c4bcdac0" ON "faq_faq" (
	"entreprise_id"
);
CREATE INDEX IF NOT EXISTS "produit_produit_entreprise_id_412273a2" ON "produit_produit" (
	"entreprise_id"
);
CREATE INDEX IF NOT EXISTS "service_service_entreprise_id_54ec43e8" ON "service_service" (
	"entreprise_id"
);
COMMIT;
