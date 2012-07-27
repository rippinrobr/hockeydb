/*
DROP TABLE abbrev;
CREATE TABLE abbrev(
  type varchar(16) NOT NULL,
  code varchar(6) NOT NULL,
  fullname varchar(128) NOT NULL,
  PRIMARY KEY (type, code)
);

DROP TABLE awardscoaches;
CREATE TABLE awardscoaches(
  coachid varchar(10) NOT NULL,
  award varchar(32) NOT NULL,
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  note varchar(32),
  PRIMARY KEY (coachid , year , award )
);

DROP TABLE awardsmisc;
CREATE TABLE awardsmisc(
  name varchar(48) NOT NULL,
  id varchar(10) NOT NULL,
  award varchar(32) NOT NULL,
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  note varchar(32),
  PRIMARY KEY (name , id , year , award )
);


-- DROP TABLE awardsplayers;
CREATE TABLE awardsplayers(
  playerid varchar(10) NOT NULL,
  award varchar(32) NOT NULL,
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  note varchar(32),
  pos varchar(2),
  PRIMARY KEY (playerid , year , award )
);

-- DROP TABLE coaches;
CREATE TABLE coaches(
  coachid varchar(10) NOT NULL,
  year integer NOT NULL,
  tmid varchar(3) NOT NULL,
  lgid varchar(4) NOT NULL,
  stint integer NOT NULL,
  notes varchar(32),
  g integer NOT NULL,
  w integer NOT NULL,
  l integer NOT NULL,
  t integer NOT NULL,
  postg integer,
  postw integer,
  postl integer,
  postt integer,
  PRIMARY KEY (coachid , year , tmid , stint )
);

-- DROP TABLE coaches_beta;
CREATE TABLE coaches_beta(
  coachid varchar(10) NOT NULL,
  year integer NOT NULL,
  tmid varchar(3) NOT NULL,
  lgid varchar(4) NOT NULL,
  stint integer NOT NULL,
  notes varchar(32),
  g integer NOT NULL,
  w integer NOT NULL,
  l integer NOT NULL,
  t integer NOT NULL,
  otl integer NOT NULL,
  postg integer,
  postw integer,
  postl integer,
  postt integer,
  PRIMARY KEY (coachid , year , tmid , stint )
);

-- DROP TABLE combinedshutouts;
CREATE TABLE combinedshutouts(
  year integer NOT NULL,
  month integer NOT NULL,
  date integer NOT NULL,
  tmid varchar(3) NOT NULL,
  oppid varchar(3),
  rp character(1) NOT NULL,
  idgoalie1 varchar(10) NOT NULL,
  idgoalie2 varchar(10) NOT NULL,
  PRIMARY KEY (year , month , date , tmid )
);

-- DROP TABLE goalies;
CREATE TABLE goalies(
  playerid varchar(10) NOT NULL,
  year integer NOT NULL,
  stint integer NOT NULL,
  tmid varchar(3) NOT NULL,
  lgid varchar(4) NOT NULL,
  gp integer NOT NULL DEFAULT 0,
  min integer NOT NULL DEFAULT 0,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  tol integer NOT NULL DEFAULT 0,
  eng integer NOT NULL DEFAULT 0,
  sho integer NOT NULL DEFAULT 0,
  ga integer NOT NULL DEFAULT 0,
  sa integer NOT NULL DEFAULT 0,
  postgp integer NOT NULL DEFAULT 0,
  postmin integer NOT NULL DEFAULT 0,
  postw integer NOT NULL DEFAULT 0,
  postl integer NOT NULL DEFAULT 0,
  postt integer NOT NULL DEFAULT 0,
  posteng integer NOT NULL DEFAULT 0,
  postsho integer NOT NULL DEFAULT 0,
  postga integer NOT NULL DEFAULT 0,
  postsa integer NOT NULL DEFAULT 0,
  PRIMARY KEY (playerid , year , stint , tmid )
);

-- DROP TABLE goaliessc;
CREATE TABLE goaliessc(
  playerid varchar(10) NOT NULL,
  year integer NOT NULL,
  tmid varchar(3) NOT NULL,
  lgid varchar(4) NOT NULL,
  gp integer NOT NULL DEFAULT 0,
  min integer NOT NULL DEFAULT 0,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  t integer NOT NULL DEFAULT 0,
  sho integer NOT NULL DEFAULT 0,
  ga integer NOT NULL DEFAULT 0,
  PRIMARY KEY (playerid , year , tmid )
);

-- DROP TABLE goaliesshoutout;
CREATE TABLE goaliesshootout(
  playerid varchar(10) NOT NULL,
  year integer NOT NULL,
  stint integer NOT NULL,
  tmid varchar(3) NOT NULL,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  sa integer NOT NULL DEFAULT 0,
  ga integer NOT NULL DEFAULT 0,
  PRIMARY KEY (playerid , year , stint , tmid )
);

-- DROP TABLE hof;
CREATE TABLE hof(
  year integer NOT NULL DEFAULT 0,
  hofid varchar(10) NOT NULL,
  name varchar(32) NOT NULL,
  category varchar(16) NOT NULL,
  PRIMARY KEY (year , hofid , category )
);

-- DROP TABLE master;
CREATE TABLE master(
  id integer NOT NULL,
  playerid varcha(10) NOT NULL,
  coachid varchar(10),
  hofid varchar(10),
  firstname varchar(32),
  lastname varchar(32),
  namenote varchar(64),
  namegiven varchar(64),
  height integer,
  weight integer,
  shootcatch character(1),
  hrefid varchar(10),
  legendsid varchar(10),
  ihdbid varchar(10),
  firstnhl integer NOT NULL DEFAULT 0,
  lastnhl integer NOT NULL DEFAULT 0,
  firstwha integer NOT NULL DEFAULT 0,
  lastwha integer NOT NULL DEFAULT 0,
  pos varchar(8),
  birthyear integer,
  birthmon integer,
  birthday integer,
  birthcountry varchar(32),
  birthstate varchar(32),
  birthcity varchar(32),
  deathyear integer,
  deathmon integer,
  deathday integer,
  deathcountry varchar(32),
  deathstate varchar(32),
  deathcity varchar(32),
  PRIMARY KEY (id )
);

-- DROP TABLE scoring;
CREATE TABLE scoring
(
  playerid varchar(10) NOT NULL,
  year integer NOT NULL,
  stint integer NOT NULL,
  tmid varchar(3) NOT NULL,
  lgid varchar(4) NOT NULL,
  pos varchar(4) NOT NULL,
  gp integer NOT NULL DEFAULT 0,
  g integer NOT NULL DEFAULT 0,
  a integer NOT NULL DEFAULT 0,
  pts integer NOT NULL DEFAULT 0,
  pim integer NOT NULL DEFAULT 0,
  plusminus integer NOT NULL DEFAULT 0,
  ppg integer NOT NULL DEFAULT 0,
  ppa integer NOT NULL DEFAULT 0,
  shg integer NOT NULL DEFAULT 0,
  sha integer NOT NULL DEFAULT 0,
  gwg integer NOT NULL DEFAULT 0,
  gtg integer NOT NULL DEFAULT 0,
  sog integer NOT NULL DEFAULT 0,
  postgp integer NOT NULL DEFAULT 0,
  postg integer NOT NULL DEFAULT 0,
  posta integer NOT NULL DEFAULT 0,
  postpts integer NOT NULL DEFAULT 0,
  postpim integer NOT NULL DEFAULT 0,
  postplusminus integer NOT NULL DEFAULT 0,
  postppg integer NOT NULL DEFAULT 0,
  postppa integer NOT NULL DEFAULT 0,
  postshg integer NOT NULL DEFAULT 0,
  postsha integer NOT NULL DEFAULT 0,
  postgwg integer NOT NULL DEFAULT 0,
  postsog integer NOT NULL DEFAULT 0,
  PRIMARY KEY (playerid , year , stint , tmid , pos )
);

-- DROP TABLE scoringsc;
CREATE TABLE scoringsc(
  playerid varchar(10) NOT NULL,
  year integer NOT NULL,
  stint integer NOT NULL,
  tmid varchar(3) NOT NULL,
  lgid varchar(4) NOT NULL,
  pos varchar(4) NOT NULL,
  gp integer NOT NULL DEFAULT 0,
  g integer NOT NULL DEFAULT 0,
  a integer NOT NULL DEFAULT 0,
  pts integer NOT NULL DEFAULT 0,
  pim integer NOT NULL DEFAULT 0,
  PRIMARY KEY (playerid , year , stint , tmid , pos )
);
*/

CREATE TABLE scoringshootout(
  playerid varchar(10) NOT NULL,
  year integer NOT NULL,
  stint integer NOT NULL,
  tmid varchar(3) NOT NULL,
  s integer NOT NULL DEFAULT 0,
  g integer NOT NULL DEFAULT 0,
  gdg integer NOT NULL DEFAULT 0,
  PRIMARY KEY (playerid , year , stint , tmid )
);

