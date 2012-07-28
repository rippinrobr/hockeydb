DROP TABLE IF EXISTS abbrev;
CREATE TABLE abbrev
(
  type varchar(16) NOT NULL,
  code varchar(6) NOT NULL,
  fullname varchar(128) NOT NULL,
  PRIMARY KEY (type, code)
);

DROP TABLE IF EXISTS awardscoaches;
CREATE TABLE awardscoaches(
  coachid varchar(10) NOT NULL,
  award varchar(32) NOT NULL,
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  note varchar(32),
  PRIMARY KEY (coachid , year , award )
);

DROP TABLE IF EXISTS awardsmisc;
CREATE TABLE awardsmisc(
  name varchar(48) NOT NULL,
  id varchar(10) NOT NULL,
  award varchar(32) NOT NULL,
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  note varchar(32),
  PRIMARY KEY (name , id , year , award )
);


DROP TABLE IF EXISTS  awardsplayers;
CREATE TABLE awardsplayers(
  playerid varchar(10) NOT NULL,
  award varchar(32) NOT NULL,
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  note varchar(32),
  pos varchar(2),
  PRIMARY KEY (playerid , year , award )
);

DROP TABLE IF EXISTS coaches;
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

DROP TABLE IF EXISTS coaches_beta;
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

DROP TABLE IF EXISTS combinedshutouts;
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

DROP TABLE IF EXISTS goalies;
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

DROP TABLE IF EXISTS goaliessc;
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

DROP TABLE IF EXISTS goaliesshootout;
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

DROP TABLE IF EXISTS hof;
CREATE TABLE hof(
  year integer NOT NULL DEFAULT 0,
  hofid varchar(10) NOT NULL,
  name varchar(32) NOT NULL,
  category varchar(16) NOT NULL,
  PRIMARY KEY (year , hofid , category )
);

DROP TABLE IF EXISTS master;
CREATE TABLE master(
  id integer NOT NULL AUTO_INCREMENT,
  playerid varchar(10) NOT NULL,
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

DROP TABLE IF EXISTS scoring;
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

DROP TABLE IF EXISTS scoringsc;
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

DROP TABLE IF EXISTS scoringshootout;
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

DROP TABLE IF EXISTS scoringsup;
CREATE TABLE scoringsup(
  playerid varchar(10) NOT NULL,
  year integer NOT NULL,
  ppa integer,
  sha integer,
  PRIMARY KEY (playerid , year )
);

DROP TABLE IF EXISTS seriespost;
CREATE TABLE seriespost(
  year integer NOT NULL,
  round varchar(4) NOT NULL,
  series varchar(4) NOT NULL DEFAULT '',
  tmidwinner varchar(10) NOT NULL,
  lgidwinner varchar(10) NOT NULL,
  tmidloser varchar(10) NOT NULL,
  lgidloser varchar(10) NOT NULL,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  t integer NOT NULL DEFAULT 0,
  goalswinner integer NOT NULL DEFAULT 0,
  goalsloser integer NOT NULL DEFAULT 0,
  note varchar(4),
  PRIMARY KEY (year , round , tmidwinner )
);

DROP TABLE IF EXISTS teamsplits;
CREATE TABLE teamsplits
(
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  tmid varchar(4) NOT NULL,
  hw integer NOT NULL,
  hl integer NOT NULL,
  ht integer NOT NULL DEFAULT 0,
  hotl integer,
  rw integer NOT NULL,
  rl integer NOT NULL,
  rt integer NOT NULL DEFAULT 0,
  rotl integer,
  sepw integer,
  sepl integer,
  sept integer,
  sepol integer,
  octw integer,
  octl integer,
  octt integer,
  octol integer,
  novw integer,
  novl integer,
  novt integer,
  novol integer,
  decw integer,
  decl integer,
  dect integer,
  decol integer,
  janw integer,
  janl integer,
  jant integer,
  janol integer,
  febw integer,
  febl integer,
  febt integer,
  febol integer,
  marw integer,
  marl integer,
  mart integer,
  marol integer,
  aprw integer,
  aprl integer,
  aprt integer,
  aprol integer,
  PRIMARY KEY (year , lgid , tmid )
);

DROP TABLE IF EXISTS teamvsteam;
CREATE TABLE teamvsteam
(
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  tmid varchar(3) NOT NULL,
  oppid varchar(3) NOT NULL,
  w integer NOT NULL,
  l integer NOT NULL,
  t integer NOT NULL DEFAULT 0,
  otl integer,
  PRIMARY KEY (year , lgid , tmid , oppid )
);

DROP TABLE IF EXISTS teams;
CREATE TABLE teams
(
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  tmid varchar(3) NOT NULL,
  franchid varchar(3) NOT NULL,
  confid varchar(2) NOT NULL DEFAULT '',
  divid varchar(2) NOT NULL DEFAULT '',
  rank integer NOT NULL,
  playoff varchar(6) NOT NULL DEFAULT '',
  g integer NOT NULL,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  t integer NOT NULL DEFAULT 0,
  otl integer,
  pts integer NOT NULL DEFAULT 0,
  sow integer,
  sol integer,
  gf integer NOT NULL DEFAULT 0,
  ga integer NOT NULL DEFAULT 0,
  name varchar(48) NOT NULL,
  pim integer,
  benchminor integer,
  ppg integer,
  ppc integer,
  sha integer,
  pkg integer,
  pkc integer,
  shf integer,
  PRIMARY KEY (year , lgid , tmid )
);

DROP TABLE IF EXISTS teamshalf;
CREATE TABLE teamshalf(
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  tmid varchar(3) NOT NULL,
  half integer NOT NULL,
  rank integer NOT NULL,
  g integer NOT NULL,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  t integer NOT NULL DEFAULT 0,
  gf integer NOT NULL,
  ga integer NOT NULL,
  PRIMARY KEY (year , lgid , tmid , half )
);

DROP TABLE IF EXISTS teamspost;
CREATE TABLE teamspost(
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  tmid varchar(3) NOT NULL,
  g integer NOT NULL,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  t integer NOT NULL DEFAULT 0,
  gf integer NOT NULL DEFAULT 0,
  ga integer NOT NULL DEFAULT 0,
  benchminor integer,
  ppg integer,
  ppc integer,
  sha integer,
  pkg integer,
  pkc integer,
  shf integer,
  PRIMARY KEY (year , lgid , tmid )
);

DROP TABLE IF EXISTS teamssc;
CREATE TABLE teamssc(
  year integer NOT NULL,
  lgid varchar(4) NOT NULL,
  tmid varchar(3) NOT NULL,
  g integer NOT NULL,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  t integer NOT NULL DEFAULT 0,
  gf integer NOT NULL DEFAULT 0,
  ga integer NOT NULL DEFAULT 0,
  pim integer,
  PRIMARY KEY (year , lgid , tmid )
);
