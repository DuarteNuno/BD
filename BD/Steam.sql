CREATE TABLE 'GAME' (
	'Id' int(11) NOT NULL AUTO_INCREMENT,
	'Name' varchar(255) NOT NULL,
	'Reviews' smallint(6) NOT NULL,
	'Price' decimal(3,2) NOT NULL,
	'DeveloperId' int(11) NOT NULL,
	'Achievments' smallint(6) DEFAULT NULL,
	'ReleaseDate' datetime NOT NULL, 
	PRIMARY KEY ('Id'),
	CONSTRAINT 'Game_developer' FOREIGN KEY ('DeveloperId') REFERENCES 'DEVELOPER' ('Id')
)

CREATE TABLE 'PLAYER' (

	'Id' int(11) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY ('Id'),
	  
	'SignUpDate' datetime NOT NULL,
	'Wallet' decimal(5,2) NOT NULL,
	'NickName' varchar(255) NOT NULL,
	'Country' varchar(255) NOT NULL   
)

CREATE TABLE 'FRIENDS'(
	'UserId1' int(11) NOT NULL,
	'UserId2' int(11) NOT NULL,

	CONSTRAINT 'Friends_2->1' FOREIGN KEY ('UserId2') REFERENCES 'PLAYER' ('Id'),
	CONSTRAINT 'Friends_1->2' FOREIGN KEY ('UserId1') REFERENCES 'PLAYER' ('Id')
)

CREATE TABLE 'GAME_LIBRARY'(
	'UserId' int(11) NOT NULL,
	'GameId' int(11) NOT NULL
)

CREATE TABLE 'DEVELOPER'(
	'Id' int(11) NOT NULL AUTO_INCREMENT,
	'Name' varchar(255) NOT NULL,
	'Country' varchar(255) NOT NULL
)

CREATE TABLE 'DEVELOPER_GAMES'(
	'DeveloperId' int(11) NOT NULL,
	'GameId' int(11) NOT NULL
)

CREATE TABLE 'REVIEW'(
	'Id' int(11) NOT NULL AUTO_INCREMENT,
  	PRIMARY KEY ('Id'),
  	'UserId' int(11) NOT NULL,
  	'ReviewDate' datetime NOT NULL,
  	'Score' decimal(2,1) NOT NULL
)

CREATE TABLE 'GROUP'(
	'Id' int(11) NOT NULL AUTO_INCREMENT,
  	PRIMARY KEY ('Id'),
	'Name' varchar(255) NOT NULL
)

CREATE TABLE 'GROUP_MEMBERS'(
	'GroupId' int(11) NOT NULL,
	'PlayerId' int(11) NOT NULL
)

CREATE TABLE 'ASSOCIATED_GAMES'(
	'GroupId' int(11) NOT NULL,
	'GameId' int(11) NOT NULL
)

CREATE TABLE 'Post'(
	'Id' bigint(20) NOT NULL AUTO_INCREMENT,
	PRIMARY KEY ('PostId'),
	'GroupId' int(11) NOT NULL,
	'PostText' varchar(1000) NOT NULL,
	'UserId' int(11) NOT NULL
	)





Dota 2
The Elder Scrolls V: Skyrim
Divinity: Original Sin 2
The Witcher 3: Wild Hunt
Team Fortress 2
Borderlands 2
Rocket League
Grand Theft Auto V
FINAL FANTASY XIV Online
Garry's Mod
METAL GEAR SOLID V: THE PHANTOM PAIN
Middle-earth™: Shadow of Mordor™
DARK SOULS™ III
Saints Row: The Third
Starbound
VRChat
Counter-Strike: Global Offensive
The Elder Scrolls Online
Portal 2
Sid Meier's Civilization V
Total War: SHOGUN 2
Hades
Far Cry® 3
PLAYERUNKNOWN'S BATTLEGROUNDS