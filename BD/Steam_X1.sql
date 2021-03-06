USE teste;

DROP TABLE IF EXISTS GAME;
DROP TABLE IF EXISTS PLAYER;
DROP TABLE IF EXISTS DEVELOPER;
DROP TABLE IF EXISTS POSTS;
DROP TABLE IF EXISTS REVIEW;
DROP TABLE IF EXISTS GROUPS;
DROP TABLE IF EXISTS FRIENDS;
DROP TABLE IF EXISTS GAME_LIBRARY;
DROP TABLE IF EXISTS DEVELOPER_GAMES;
DROP TABLE IF EXISTS GROUP_MEMBERS;
DROP TABLE IF EXISTS REVIEWED_GAMES;
DROP TABLE IF EXISTS GROUP_POSTS;

/*****************Entidades***********************/

CREATE TABLE
GAMES(
	Id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	Name varchar(255) NOT NULL,
	Price decimal(5,2) NOT NULL,
	DeveloperName varchar(255) NOT NULL,
	Achievements varchar(255) DEFAULT NULL,
	ReleaseDate DATE NOT NULL,
	CONSTRAINT Game_developer FOREIGN KEY (DeveloperName) REFERENCES DEVELOPER(Name)
);

CREATE TABLE
PLAYERS(
	Id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	NickName varchar(255) NOT NULL,
	SignUpDate date NOT NULL,
	Wallet decimal(5,2) NOT NULL,
	Country varchar(255) NOT NULL
);

CREATE TABLE
DEVELOPERS(
	Name varchar(255) PRIMARY KEY NOT NULL,
	Country varchar(255) NOT NULL
);

CREATE TABLE
POSTS(
	Id bigint(20) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	PostDate DATE NOT NULL,
	GroupId int(11) NOT NULL,
	PostText varchar(1000) NOT NULL,
	UserId int(11) NOT NULL
);

CREATE TABLE
REVIEWS(
	Id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
    UserId int(11) NOT NULL,
	GameName varchar(255) NOT NULL,
	ReviewDate datetime NOT NULL,
	ReviewText varchar(255) DEFAULT NULL,
	Score decimal(3,1) NOT NULL,
	CONSTRAINT Score_Inv CHECK (Score BETWEEN 1 AND 5)
);

CREATE TABLE
GROUPS(
	Id int(11) PRIMARY KEY NOT NULL AUTO_INCREMENT,
	Name varchar(254) NOT NULL
);
/**********************************************/


/***************MULTIVALORES*******************/
CREATE TABLE
FRIENDS(
	PlayerId1 int(11) PRIMARY KEY NOT NULL,
	PlayerId2 int(11) PRIMARY KEY NOT NULL,
	/**/
	CONSTRAINT Friends_1 FOREIGN KEY (PlayerId1) REFERENCES PLAYER (Id) ON DELETE CASCADE,
	CONSTRAINT Friends_2 FOREIGN KEY (PlayerId2) REFERENCES PLAYER (Id) ON DELETE CASCADE
);

CREATE TABLE
GAME_LIBRARY(
	PlayerId int(11) PRIMARY KEY NOT NULL,
	GameId int(11) PRIMARY KEY NOT NULL
);

CREATE TABLE
DEVELOPER_GAMES(
	DeveloperName int(11) PRIMARY KEY NOT NULL,
	GameId int(11) PRIMARY KEY NOT NULL
);

CREATE TABLE
GROUP_MEMBERS(
	GroupId int(11) PRIMARY KEY NOT NULL,
	PlayerId int(11) PRIMARY KEY NOT NULL
);

CREATE TABLE
ASSOCIATED_GAMES(
	GroupId int(11) PRIMARY KEY NOT NULL,
	GameId int(11) PRIMARY KEY NOT NULL
);

CREATE TABLE
REVIEWED_GAMES(
	ReviewId int(11) PRIMARY KEY NOT NULL,
	GameId int(11) PRIMARY KEY NOT NULL
);

CREATE TABLE
GROUP_POSTS(
	GroupId int(11) PRIMARY KEY NOT NULL,
	PostId int(11) PRIMARY KEY NOT NULL
);

/******************************************************************/


/************************INSERT VALUES****************************/

INSERT INTO
GAMES(Name,Price,DeveloperName,Achievements,ReleaseDate)
VALUES
/*1*/	('Witcher 3',8.99,'CD PROJEKT RED','Melhor RPG do Ano','2015-05-19'),
/*2*/	('Counter-Strike 1.6',8.99,'Valve Corporation',NULL,'2000-11-08'),
/*3*/	('Counter-Strike Global Offensive',0.00,'VALVE Corporation','Melhor FPS do Ano','2012-08-21'),
/*4*/	('DOTA 2',0.00,'Valve Corporation','Best MOBA','2013-07-09'),
/*5*/	('GTA V',8.99,'ROCKSTAR GAMES','Melhor Modo Multiplayer','2013-09-17'),
/*6*/	('The Last of Us',19.99,'Naughty Dog','Jogo do Ano','2013-06-14'),
/*7*/	('ARK: Survival Evolved',54.99,'Studio Wildcard',NULL,'2017-08-27'),
/*8*/	('Garry\'s Mod',9.99,'Valve Corporation',NULL,'2006-11-29'),
/*9*/	('The Elder Scrols V: Skyrim',4.99,'Bethesda Game Studio',NULL,'2011-11-11'),
/*10*/  ('Tomb Raider(2013)',4.99,'Crystal Dynamics','Best Action Game','2013-03-05'),
/*12*/  ('Divinity: Original Sin 2',44.99,'Larian Studios',NULL,'2017-09-14'),
/*13*/  ('Team Fortress 2',0.00,'Valve Corporation',NULL,'2007-09-10'),
/*14*/  ('Rocket League',19.99,'Psyonix LLC','Best independent game','2015-07-07'),
/*15*/  ('Borderlands 2',7.49,'Gearbox Software','Game of the Year','2012-09-20'),
/*16*/  ('FINAL FANTASY XIV Online',9.99,'Square Enix',NULL,'2014-02-18'),
/*17*/  ('METAL GEAR SOLID V: THE PHANTOM PAIN',8.99,'Konami Digital Entertainment',NULL,'2006-09-01'),
/*18*/  ('Middle-earth???: Shadow of Mordor???',39.99,'Monolith Productions',NULL,'2017-10-10'),
/*19*/  ('DARK SOULS??? III',14.99,'FromSoftware','Hardest Game of the Year','2016-04-11'),
/*20*/  ('Saints Row: The Third',9.99,'Volition',NULL,'2011-11-14'),
/*21*/  ('Starbound',13.99,'Chucklefish',NULL,'2016-07-22'),
/*24*/  ('The Elder Scrolls Online',19.99,'Zenimax Online Studios',NULL,'2014-04-04'),
/*25*/  ('Portal 2',8.19,'Valve Corporation','Mellhor jogo para Pc','2011-04-19'),
/*26*/  ('Sid Meier\'s Civilization V',39.99,'Firaxis Games',NULL,'2019-02-14'),
/*27*/  ('Total War: SHOGUN 2',7.49,'CREATIVE ASSEMBLY',NULL,'2011-03-15'),
/*28*/  ('Hades',20.99,'Supergiant Games',NULL,'2019-12-10'),
/*29*/  ('Far Cry?? 3',19.99,'Ubisoft Montreal','Melhor Jogo de A????o','2012-11-29'),
/*30*/  ('PLAYERUNKNOWN\'S BATTLEGROUNDS',19.99,'Ubisoft Montreal','Best Multiplayer Game','2017-12-21');

INSERT INTO
PLAYERS(Nickname,SignUpDate,Wallet,Country)
VALUES
/*1*/	('Dudas','2015-03-05',20.00,'Portugal'),
/*2*/	('SNH','2012-08-28',2.63,'Portugal'),
/*3*/	('Netcan','2012-04-21',23.00,'Portugal'),
/*4*/	('Roberto_A(l)berto','2003-06-09',99.99,'Portugal'),
/*5*/	('Marxum','2011-10-08',20.00,'Portugal'),
/*6*/	('Felix Berta','2003-06-10',99.98,'Fran??a'),
/*7*/	('Vladimir','2003-09-11',99.97,'Russia'),
/*8*/	('Petroski','2016-03-06',0.00,'Pol??nia'),
/*9*/	('Bolsonas','2019-01-01',9.99,'Brasil'),
/*10*/  ('Roger Kings','2003-04-22',25.39,'Portugal');

INSERT INTO
DEVELOPERS(Name,Country)
VALUES
/*1*/ ('Valve Corporation','Estados Unidos'),
/*2*/ ('CD PROJECKT RED','Pol??nia'),
/*3*/ ('ROCKSTAR GAMES','Estados Unidos'),
/*4*/ ('Naughty Dog','Estados Unidos'),
/*5*/ ('Studio Wildcard','Estados Unidos'),
/*6*/ ('Bethesda Game Studio','Estados Unidos'),
/*7*/ ('Crystal Dynamics','Estados Unidos'),
/*8*/ ('Larian Studios','B??lgica'),
/*9*/ ('Gearbox Software','Estados Unidos'),
/*10*/('Facepunch Studios','Reino Unido'),
/*11*/('Konami Digital Entertainment','Jap??o'),
/*12*/('Monolith Productions','Estados Unidos'),
/*13*/('FromSoftware','Jap??o'),
/*14*/('Volition','Estados Unidos'),
/*15*/('Zenimax Online Studios','Estados Unidos'),
/*15*/('Firaxis Games','Estados Unidos'),
/*16*/('CREATIVE ASSEMBLY','Reino Unido'),
/*17*/('Supergiant Games','Estados Unidos'),
/*18*/('Ubisoft Montreal','Fran??a');

INSERT INTO
REVIEWS(UserId,ReviewDate,ReviewText,Score)
VALUES
/*1*/(7,'2016-11-23','Jogo muito cansativo',1),/*GTA V*/
/*2*/(4,'2006-06-30','I love Lara Croft',5),/*CS 1.6*/
/*3*/(1,'2019-11-04',NULL,3),/*Skyrim*/
/*4*/(3,'2013-07-22','J\'aime Lara Croft',5),/*TOMB RAIDER*/
/*5*/(10,'2018-04-05','Bad FPS and optimization',1),/*ARK*/
/*6*/(5,'2015-06-11','Amazing story and characters but my pc can\'t handle well its graphics',4),/*WITCHER3*/
/*7*/(2,'2011-03-25',NULL,5),/*Skyrim*/
/*8*/(9,'2011-07-13',NULL,2);

INSERT INTO
GROUPS(Name)
VALUES
/*1*/ ('Zulmira Lovers'),
/*2*/ ('Framerate Police'),
/*3*/ ('Steam Trading Cards Group'),
/*4*/ ('Matosinhos'),
/*5*/ ('Programadores do Tetris'),
/*6*/ ('F??s do Tiagovski');
