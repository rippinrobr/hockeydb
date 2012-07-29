
DROP TABLE IF EXISTS abbrev;
CREATE TABLE abbrev
(
  type character varying(16) NOT NULL,
  code character varying(6) NOT NULL,
  fullname character varying NOT NULL,
  CONSTRAINT "abbrev_PK" PRIMARY KEY (type , code )
);

DROP TABLE IF EXISTS awardscoaches;
CREATE TABLE awardscoaches
(
  coachid character varying(10) NOT NULL,
  award character varying(32) NOT NULL,
  year integer NOT NULL,
  lgid character varying(4) NOT NULL,
  note character varying(32),
  CONSTRAINT "awardscoaches_PK" PRIMARY KEY (coachid , year , award )
);

DROP TABLE IF EXISTS awardsmisc;
CREATE TABLE awardsmisc
(
  name character varying(48) NOT NULL,
  id character varying(10) NOT NULL,
  award character varying(32) NOT NULL,
  year integer NOT NULL,
  lgid character varying(4) NOT NULL,
  note character varying(32),
  CONSTRAINT "awardsmisc_PK" PRIMARY KEY (name , id , year , award )
);

DROP TABLE IF EXISTS awardsplayers;
CREATE TABLE awardsplayers
(
  playerid character varying(10) NOT NULL,
  award character varying(32) NOT NULL,
  year integer NOT NULL,
  lgid character varying(4) NOT NULL,
  note character varying(32),
  pos character varying(2),
  CONSTRAINT "awardsplayers_PK" PRIMARY KEY (playerid , year , award )
);

DROP TABLE IF EXISTS coaches;
CREATE TABLE coaches
(
  coachid character varying(10) NOT NULL,
  year integer NOT NULL,
  tmid character varying(3) NOT NULL,
  lgid character varying(4) NOT NULL,
  stint integer NOT NULL,
  notes character varying(32),
  g integer NOT NULL,
  w integer NOT NULL,
  l integer NOT NULL,
  t integer NOT NULL,
  postg integer,
  postw integer,
  postl integer,
  postt integer,
  CONSTRAINT "coaches_PK" PRIMARY KEY (coachid , year , tmid , stint )
);

DROP TABLE IF EXISTS coaches_beta;
CREATE TABLE coaches_beta
(
  coachid character varying(10) NOT NULL,
  year integer NOT NULL,
  tmid character varying(3) NOT NULL,
  lgid character varying(4) NOT NULL,
  stint integer NOT NULL,
  notes character varying(32),
  g integer NOT NULL,
  w integer NOT NULL,
  l integer NOT NULL,
  t integer NOT NULL,
  otl integer NOT NULL,
  postg integer,
  postw integer,
  postl integer,
  postt integer,
  CONSTRAINT "coaches_beta_PK" PRIMARY KEY (coachid , year , tmid , stint )
);

DROP TABLE IF EXISTS combinedshutouts;
CREATE TABLE combinedshutouts
(
  year integer NOT NULL,
  month integer NOT NULL,
  date integer NOT NULL,
  tmid character varying(3) NOT NULL,
  oppid character varying(3),
  rp character(1) NOT NULL,
  idgoalie1 character varying(10) NOT NULL,
  idgoalie2 character varying(10) NOT NULL,
  CONSTRAINT "combinedshutouts_PK" PRIMARY KEY (year , month , date , tmid )
);

DROP TABLE IF EXISTS goalies;
CREATE TABLE goalies
(
  playerid character varying(10) NOT NULL,
  year integer NOT NULL,
  stint integer NOT NULL,
  tmid character varying(3) NOT NULL,
  lgid character varying(4) NOT NULL,
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
  CONSTRAINT "goalies_PK" PRIMARY KEY (playerid , year , stint , tmid )
);

DROP TABLE IF EXISTS goaliessc;
CREATE TABLE goaliessc
(
  playerid character varying(10) NOT NULL,
  year integer NOT NULL,
  tmid character varying(3) NOT NULL,
  lgid character varying(4) NOT NULL,
  gp integer NOT NULL DEFAULT 0,
  min integer NOT NULL DEFAULT 0,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  t integer NOT NULL DEFAULT 0,
  sho integer NOT NULL DEFAULT 0,
  ga integer NOT NULL DEFAULT 0,
  CONSTRAINT "goaliessc_PK" PRIMARY KEY (playerid , year , tmid )
);

DROP TABLE IF EXISTS goaliesshootout;
CREATE TABLE goaliesshootout
(
  playerid character varying(10) NOT NULL,
  year integer NOT NULL,
  stint integer NOT NULL,
  tmid character varying(3) NOT NULL,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  sa integer NOT NULL DEFAULT 0,
  ga integer NOT NULL DEFAULT 0,
  CONSTRAINT "goaliesshootout_PK" PRIMARY KEY (playerid , year , stint , tmid )
);

DROP TABLE IF EXISTS hof;
CREATE TABLE hof
(
  year integer NOT NULL DEFAULT 0,
  hofid character varying(10) NOT NULL,
  name character varying(32) NOT NULL,
  category character varying(16) NOT NULL,
  CONSTRAINT "hof_PK" PRIMARY KEY (year , hofid , category )
);

DROP TABLE IF EXISTS master;
CREATE TABLE master
(
  id serial NOT NULL,
  playerid character varying(10) NOT NULL,
  coachid character varying(10),
  hofid character varying(10),
  firstname character varying(32),
  lastname character varying(32),
  namenote character varying(64),
  namegiven character varying(64),
  height integer,
  weight integer,
  shootcatch character(1),
  hrefid character varying(10),
  legendsid character varying(10),
  ihdbid character varying(10),
  firstnhl integer NOT NULL DEFAULT 0,
  lastnhl integer NOT NULL DEFAULT 0,
  firstwha integer NOT NULL DEFAULT 0,
  lastwha integer NOT NULL DEFAULT 0,
  pos character varying(8),
  birthyear integer,
  birthmon integer,
  birthday integer,
  birthcountry character varying(32),
  birthstate character varying(32),
  birthcity character varying(32),
  deathyear integer,
  deathmon integer,
  deathday integer,
  deathcountry character varying(32),
  deathstate character varying(32),
  deathcity character varying(32),
  CONSTRAINT "master_PK" PRIMARY KEY (id )
);

DROP TABLE IF EXISTS scoring;
CREATE TABLE scoring
(
  playerid character varying(10) NOT NULL,
  year integer NOT NULL,
  stint integer NOT NULL,
  tmid character varying(3) NOT NULL,
  lgid character varying(4) NOT NULL,
  pos character varying(4) NOT NULL,
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
  CONSTRAINT "scoring_PK" PRIMARY KEY (playerid , year , stint , tmid , pos )
);

DROP TABLE IF EXISTS scoringsc;
CREATE TABLE scoringsc
(
  playerid character varying(10) NOT NULL,
  year integer NOT NULL,
  stint integer NOT NULL,
  tmid character varying(3) NOT NULL,
  lgid character varying(4) NOT NULL,
  pos character varying(4) NOT NULL,
  gp integer NOT NULL DEFAULT 0,
  g integer NOT NULL DEFAULT 0,
  a integer NOT NULL DEFAULT 0,
  pts integer NOT NULL DEFAULT 0,
  pim integer NOT NULL DEFAULT 0,
  CONSTRAINT "scoringsc_PK" PRIMARY KEY (playerid , year , stint , tmid , pos )
);

DROP TABLE IF EXISTS scoringshootout;
CREATE TABLE scoringshootout
(
  playerid character varying(10) NOT NULL,
  year integer NOT NULL,
  stint integer NOT NULL,
  tmid character varying(3) NOT NULL,
  s integer NOT NULL DEFAULT 0,
  g integer NOT NULL DEFAULT 0,
  gdg integer NOT NULL DEFAULT 0,
  CONSTRAINT "scoringshootout_PK" PRIMARY KEY (playerid , year , stint , tmid )
);

DROP TABLE IF EXISTS scoringsup;
CREATE TABLE scoringsup
(
  playerid character varying(10) NOT NULL,
  year integer NOT NULL,
  ppa integer,
  sha integer,
  CONSTRAINT "scoringsup_PK" PRIMARY KEY (playerid , year )
);

DROP TABLE IF EXISTS seriespost;
CREATE TABLE seriespost
(
  year integer NOT NULL,
  round character varying(4) NOT NULL,
  series character varying(4) NOT NULL DEFAULT ''::character varying,
  tmidwinner character varying(10) NOT NULL,
  lgidwinner character varying(10) NOT NULL,
  tmidloser character varying(10) NOT NULL,
  lgidloser character varying(10) NOT NULL,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  t integer NOT NULL DEFAULT 0,
  goalswinner integer NOT NULL DEFAULT 0,
  goalsloser integer NOT NULL DEFAULT 0,
  note character varying(4),
  CONSTRAINT "seriespost_PK" PRIMARY KEY (year , round , tmidwinner )
);

DROP TABLE IF EXISTS teams;
CREATE TABLE teams
(
  year integer NOT NULL,
  lgid character varying(4) NOT NULL,
  tmid character varying(3) NOT NULL,
  franchid character varying(3) NOT NULL,
  confid character varying(2) NOT NULL DEFAULT ''::character varying,
  divid character varying(2) NOT NULL DEFAULT ''::character varying,
  rank integer NOT NULL,
  playoff character varying(6) NOT NULL DEFAULT ''::character varying,
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
  name character varying(48) NOT NULL,
  pim integer,
  benchminor integer,
  ppg integer,
  ppc integer,
  sha integer,
  pkg integer,
  pkc integer,
  shf integer,
  CONSTRAINT "teams_PK" PRIMARY KEY (year , lgid , tmid )
);

DROP TABLE IF EXISTS teamshalf;
CREATE TABLE teamshalf
(
  year integer NOT NULL,
  lgid character varying(4) NOT NULL,
  tmid character varying(3) NOT NULL,
  half integer NOT NULL,
  rank integer NOT NULL,
  g integer NOT NULL,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  t integer NOT NULL DEFAULT 0,
  gf integer NOT NULL,
  ga integer NOT NULL,
  CONSTRAINT "teamshalf_PK" PRIMARY KEY (year , lgid , tmid , half )
);

DROP TABLE IF EXISTS teamsplits;
CREATE TABLE teamsplits
(
  year integer NOT NULL,
  lgid character varying(4) NOT NULL,
  tmid character varying(4) NOT NULL,
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
  CONSTRAINT "teamsplits_PK" PRIMARY KEY (year , lgid , tmid )
);

DROP TABLE IF EXISTS teamspost;
CREATE TABLE teamspost
(
  year integer NOT NULL,
  lgid character varying(4) NOT NULL,
  tmid character varying(3) NOT NULL,
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
  CONSTRAINT "teamspost_PK" PRIMARY KEY (year , lgid , tmid )
);

DROP TABLE IF EXISTS teamssc;
CREATE TABLE teamssc
(
  year integer NOT NULL,
  lgid character varying(4) NOT NULL,
  tmid character varying(3) NOT NULL,
  g integer NOT NULL,
  w integer NOT NULL DEFAULT 0,
  l integer NOT NULL DEFAULT 0,
  t integer NOT NULL DEFAULT 0,
  gf integer NOT NULL DEFAULT 0,
  ga integer NOT NULL DEFAULT 0,
  pim integer,
  CONSTRAINT "teamssc_PK" PRIMARY KEY (year , lgid , tmid )
);

DROP TABLE IF EXISTS teamvsteam;
CREATE TABLE teamvsteam
(
  year integer NOT NULL,
  lgid character varying(4) NOT NULL,
  tmid character varying(3) NOT NULL,
  oppid character varying(3) NOT NULL,
  w integer NOT NULL,
  l integer NOT NULL,
  t integer NOT NULL DEFAULT 0,
  otl integer,
  CONSTRAINT "teamvsteam_PK" PRIMARY KEY (year , lgid , tmid , oppid )
);