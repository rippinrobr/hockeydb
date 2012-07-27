hockeydb
========

hockeydb contains code to load the Hockey Database CSV files into databases for multiple RDBMSs. Has the data-loader code and SCHEMA/Data .
I've included the Hockey Database README file with the addition of the id column I added to the master table so I could add a primary key to the table.

=============================
Hockey Database version 7.0, Jun. 23, 2012

This database is maintained through the hockey-databank Yahoo group,
http://sports.groups.yahoo.com/group/hockey-databank.

Post message:   hockey-databank@yahoogroups.com
Subscribe:      hockey-databank-subscribe@yahoogroups.com
Unsubscribe:    hockey-databank-unsubscribe@yahoogroups.com
List owner:     hockey-databank-owner@yahoogroups.com

---------------------------------------------------------------------------

Copyright Notice

The Hockey Databank project allows for free usage of its data, including the
production of a commercial product based upon the data, subject to the terms
outlined below. 

1) In exchange for any usage of data, in whole or in part, you agree to display
the following statement prominently and in its entirety on your end product:

"The information used herein was obtained free of charge from and is
copyrighted by the Hockey Databank project.  For more information about the
Hockey Databank project please visit
http://sports.groups.yahoo.com/group/hockey-databank"

2) Your usage of the data constitutes your acknowledgment, acceptance, and
agreement that the Hockey Databank project makes no guarantees regarding the
accuracy of the data supplied, and will not be held responsible for any
consequences arising from the use of the information presented. 

---------------------------------------------------------------------------

Contents

1.0   Leagues
1.1   References and acknowledgements
1.2   Revision history
2.0   Tables
2.1   Master table
2.2   Scoring table
2.3   ScoringSup table
2.4   ScoringSC table
2.5   ScoringShootout table
2.6   Goalies table
2.7   GoaliesSC table
2.8   GoaliesShootout table
2.9   AwardsPlayers table
2.10  AwardsCoaches table
2.11  AwardsMisc table
2.12  Coaches table
2.13  Teams table
2.14  TeamsPost table
2.15  TeamsSC table
2.16  TeamsHalf table
2.17  TeamSplits table
2.18  TeamVsTeam table
2.19  SeriesPost table
2.20  CombinedShutouts table
2.21  HOF table
3.0   NHL data availability

---------------------------------------------------------------------------

1.0 Leagues

This database includes the following leagues, generally recognized as "major":

National Hockey Association (NHA), 1909-10 - 1916-17
National Hockey League (NHL), 1917-18 through present
Pacific Coast Hockey Association (PCHA), 1911-12 - 1923-24
Western Canada Hockey League (WCHL), 1921-22 - 1925-26
World Hockey Association (WHA), 1972-73 through 1978-79

The WCHL was renamed the Western Hockey League for the 1925-26 season.
However, the league is identified as WCHL throughout the database for all
seasons.

---------------------------------------------------------------------------

1.1 References and acknowledgements

A variety of sources were consulted while constructing this database.  These
are listed below in no particular order.

Books:

  National Hockey League Guide (various years)
  National Hockey League Official Record Book (1982-83 and 1983-84)
  National Hockey League Official Guide & Record Book (1984-85 to present)
  The Stanley Cup Records and Statistics (various years)
  World Hockey Association Media Guide (various years)
  WHA Schedule & Statistics (1974-75)
  The Sporting News Hockey Guide (various years)
  Official NHL Record Book 1917-64
  The Complete Historical and Statistical Reference to the World Hockey
    Association 1972-1979, by Scott Surgent; Xaler Press (7th edition, 2004;
    8th edition, 2008)
  Total Hockey; Total Sports Publishing (1st edition, 1998; 2nd edition, 2000)
  The Encyclopedia of Hockey, by Robert A. Styer; A.S. Barnes (2nd edition,
    1973)
  The Hockey Encyclopedia, by Stan Fischler and Shirley Walton Fischler;
    Macmillan (1983)
  The Trail of the Stanley Cup (Vol. 1, 2, and 3), by Charles L. Coleman

Periodicals:

  The Sporting News

On-line sources:

  ESPN.com
        http://www.espn.com/nhl/statistics
  Find A Grave
        http://www.findagrave.com
  The Goaltender Home Page (Doug Norris)
        http://hockeygoalies.org
  History Of NHL Trades
        http://nhltradeshistory.blogspot.com
  Hockey Research Association
        http://www.hockeyresearch.com/stats
  Hockey-Reference.com (Justin Kubatko)
        http://www.hockey-reference.com
  Hockey Summary Project
        http://sports.groups.yahoo.com/group/hockey_summary_project/
        http://hsp.flyershistory.com
        (previously at http://www.shrpsports.com/hsp)
  Internet Hockey Database (Ralph Slate)
        http://www.hockeydb.com
  Legends of Hockey.net (Hockey Hall of Fame)
        http://www.legendsofhockey.net/html/search.htm
  LostHockey.com
        http://www.losthockey.com
  National Hockey League
        http://www.nhl.com
  NHL Hockey Shootout Statistics
        http://jeays.net/shootout/index.htm
  NHL Shootouts
        http://www.nhlshootouts.com
  North American Pro Hockey
        http://www.ottawavalleyonline.com/sites/tomking_01/index.html
  Puckerings
        http://www.puckerings.com
  Society for International Hockey Research
        http://www.sihrhockey.org
  The Sports Network
        http://www.sportsnetwork.com
  USA Today hockey stats archive
        http://www.usatoday.com/sports/hockey
        http://www.usatoday.com/sports/hockey/archive.htm
  Yahoo Sports
        http://sports.yahoo.com/nhl

Thanks to the following individuals:

* Ralph Dinger (NHL Publishing / Dan Diamond and Associates) has confirmed a
  number of corrections to errors found in the NHL's official statistics.
  Thanks also to Justin Kubatko of hockey-reference.com for a number of
  discussions in this area.

* Morey Holzman provided information on Lloyd Cook's 1921-22 goaltending
  appearance.

* Stu McMurray provided correct 1917-18 scoring statistics, including GWG.

* Doug Norris provided corrected 1984-85 statistics for Rick St. Croix.

* Paul Reeths created the Hall of Fame table, and provided updates for the Coaches
  table

Other contributors include Roger Brewer, Mike Burton, Eric Hornick, and
Claude Paradis.

An acknowledgement is also given to the team led by Sean Forman and Sean Lahman
that has developed and maintained the Lahman baseball database.  This database
follows the same general design.

---------------------------------------------------------------------------

1.2 Revision history

1.0   Jan. 4, 2007   Initial release
1.1   Feb. 1, 2007   Major revisions to early NHL data; separate tables for
                     early Stanley Cup finals, three separate awards tables;
                     added TeamsHalf table; expanded WHA stats
1.11  Feb. 5, 2007   Bug fix
2.0   Jun. 11, 2007  2006-07 update; added NHA, PCHA, and WCHL; added
                     TeamSplits and TeamVsTeam tables
2.01  Jun. 15, 2007  Added 2006-07 award winners
2.1   Oct. 10, 2007  Added PPA/SHA/GTG; SeriesPost and CombinedShutouts tables;
                     many corrections
2.2   Jan. 16, 2008  Added GoaliesShootout and ScoringShootout
3.0   Jun. 14, 2008  2007-08 update; expanded Master table
3.1   Jan. 15, 2009  Statistical corrections
4.0   Jun. 18, 2009  2008-09 update
5.0   Jun. 24, 2010  2009-10 update
6.0   Jun. 26, 2011  2010-11 update

---------------------------------------------------------------------------

2.0 Tables

Master              Names and biographical information
Scoring             Scoring statistics
ScoringSup          Supplemental scoring statistics
ScoringSC           Scoring for Stanley Cup finals, 1917-18 through 1925-26
ScoringShootout     Scoring statistics for shootouts
Goalies             Goaltending statistics
GoaliesSC           Goaltending for Stanley Cup finals, 1917-18 through 1925-26
GoaliesShootout     Goaltending statistics for shootouts
AwardsPlayers       Player awards, trophies, postseason all-star teams
AwardsCoaches       Coaches awards, trophies, postseason all-star teams
AwardsMisc          Miscellaneous awards
Coaches             Coaching statistics
Teams               Team regular season statistics
TeamsPost           Team postseason statistics
TeamsSC             Team Stanley Cup finals statistics, 1917-18 through 1925-26
TeamsHalf           First half / second half standings, 1917-18 through 1920-21
TeamSplits          Team home/road and monthly splits
TeamVsTeam          Team vs. team results
SeriesPost          Postseason series
CombinedShutouts    List of combined shutouts
abbrev              Abbreviations used in Teams and SeriesPost tables

---------------------------------------------------------------------------

2.1 Master table

id					Generated id for primary key value
playerID            Player ID
coachID             Coach ID
hofID               Hall of Fame ID
firstName           First name
lastName            Last name
nameNote            Note about player's name
nameGiven           Given name
nameNick            Nickname (multiple entries separated by "/")
height              Height in inches
weight              Weight in pounds
shootCatch          Shooting hand (catching hand for goalies)
legendsID           ID at Legends Of Hockey (www.legendsofhockey.net)
ihdbID              ID at the Internet Hockey Database
hrefID              ID at Hockey-Reference.com
firstNHL            First NHL season (2005-06 listed as "2005")
lastNHL             Last NHL season (2005-06 listed as "2005")
firstWHA            First WHA season (1975-76 listed as "1975")
lastWHA             Last WHA season (1975-76 listed as "1975")
pos                 Position
birthYear           Year of birth
birthMon            Month of birth
birthDay            Day of birth
birthCountry        Country of birth
birthState          State or province of birth
birthCity           City of birth
deathYear           Year of death (9999 indicates "deceased", with no specific
                    information known)
deathMon            Month of death
deathDay            Day of death
deathCountry        Country of death
deathState          State or province of death
deathCity           City of death

---------------------------------------------------------------------------

2.2 Scoring table

playerID            Player ID
year                Year (2005-06 listed as "2005")
stint               Stint (order of appearance in a season)
tmID                Team ID
lgID                League ID
pos                 Position
GP                  Games played
G                   Goals
A                   Assists
Pts                 Points
PIM                 Penalty minutes
+/-                 Plus / minus
PPG                 Power play goals
PPA                 Power play assists
SHG                 Shorthanded goals
SHA                 Shorthanded assists
GWG                 Game-winning goals
GTG                 Game-tying goals
SOG                 Shots on goal
PostGP              Postseason games played
PostG               Postseason goals
PostA               Postseason assists
PostPts             Postseason points
PostPIM             Postseason penalty minutes
Post+/-             Postseason plus / minus
PostPPG             Postseason power play goals
PostPPA             Postseason power play assists
PostSHG             Postseason shorthanded goals
PostSHA             Postseason shorthanded assists
PostGWG             Postseason game-winning goals
PostSOG             Postseason shots on goal

---------------------------------------------------------------------------

2.3 ScoringSup table

playerID            Player ID
year                Year (2005-06 listed as "2005")
PPA                 Power play assists
SHA                 Shorthanded assists

---------------------------------------------------------------------------

2.4 ScoringSC table

playerID            Player ID
year                Year (1920-21 listed as "1920")
tmID                Team ID
lgID                League ID
pos                 Position
GP                  Games played
G                   Goals
A                   Assists
Pts                 Points
PIM                 Penalty minutes

---------------------------------------------------------------------------

2.5 ScoringShootout table

playerID            Player ID
year                Year (2005-06 listed as "2005")
stint               Stint (order of appearance in a season)
tmID                Team ID
S                   Shots
G                   Goals
GDG                 Game-deciding goals

---------------------------------------------------------------------------

2.6 Goalies table

playerID            Player ID
year                Year (2005-06 listed as "2005")
stint               Stint (order of appearance in a season)
tmID                Team ID
lgID                League ID
GP                  Games played
Min                 Minutes
W                   Wins
L                   Losses
T/OL                Ties / overtime losses
ENG                 Empty net goals
SHO                 Shutouts
GA                  Goals against
SA                  Shots against
PostGP              Postseason games played
PostMin             Postseason minutes
PostW               Postseason wins
PostL               Postseason losses
PostT               Postseason ties
PostENG             Postseason empty net goals
PostSHO             Postseason shutouts
PostGA              Postseason goals against
PostSA              Postseason shots against

---------------------------------------------------------------------------

2.7 GoaliesSC table

playerID            Player ID
year                Year (1920-21 listed as "1920")
tmID                Team ID
lgID                League ID
GP                  Games played
Min                 Minutes
W                   Wins
L                   Losses
T                   Ties
SHO                 Shutouts
GA                  Goals against

---------------------------------------------------------------------------

2.8 GoaliesShootout table

playerID            Player ID
year                Year (2005-06 listed as "2005")
stint               Stint (order of appearance in a season)
tmID                Team ID
W                   Wins
L                   Losses
SA                  Shots against
GA                  Goals against

---------------------------------------------------------------------------

2.9 AwardsPlayers table

playerID            Player ID
award               Name of award or trophy
year                Year (2005-06 listed as "2005")
lgID                League ID
note                "shared" indicates an award shared with a teammate;
                    "tie" indicates a tie with another player
pos                 Position (for all-star teams)

---------------------------------------------------------------------------

2.10 AwardsCoaches table

coachID             Coach ID
award               Name of award or trophy
year                Year (2005-06 listed as "2005")
lgID                League ID
note                "tie" indicates a tie with another coach

---------------------------------------------------------------------------

2.11 AwardsMisc table

name                Name of recipient
ID                  Player ID, coach ID, or Hall of Fame ID, where available
award               Name of award or trophy
year                Year (2005-06 listed as "2005")
lgID                League ID
note                Miscellaneous comments

---------------------------------------------------------------------------

2.12 Coaches table

coachID             Coach ID
year                Year (2005-06 listed as "2005")
tmID                Team ID
lgID                League ID
stint               Coaching order (1 for first coach, 2 for second, etc.)
notes               Miscellaneous comments
G                   Games
W                   Wins
L                   Losses
T                   Ties
PostG               Postseason games
PostW               Postseason wins
PostL               Postseason losses
PostT               Postseason ties

---------------------------------------------------------------------------

2.13 Teams table

year                Year (2005-06 listed as "2005")
lgID                League ID
tmID                Team ID
franchID            Franchise ID
confID              Conference ID (see abbrev.csv for details)
divID               Division ID (see abbrev.csv for details)
rank                Final standing
playoff             Playoff result (see abbrev.csv for details)
G                   Games
W                   Wins
L                   Losses
T                   Ties
OTL                 Overtime losses
Pts                 Points
SoW                 Shootout wins
SoL                 Shootout losses
GF                  Goals for
GA                  Goals against
name                Full team name
PIM                 Penalty minutes
BenchMinor          Bench minors (minutes)
PPG                 Power play goals
PPC                 Power play chances
SHA                 Shorthanded goals against
PKG                 Power play goals against
PKC                 Penalty kill chances
SHF                 Shorthanded goals for

---------------------------------------------------------------------------

2.14 TeamsPost table

year                Year (2005-06 listed as "2005")
lgID                League ID
tmID                Team ID
G                   Games
W                   Wins
L                   Losses
T                   Ties
GF                  Goals for
GA                  Goals against
PIM                 Penalty minutes
BenchMinor          Bench minors (minutes)
PPG                 Power play goals
PPC                 Power play chances
SHA                 Shorthanded goals against
PKG                 Power play goals against
PKC                 Penalty kill chances
SHF                 Shorthanded goals for

---------------------------------------------------------------------------

2.15 TeamsSC table

year                Year (1920-21 listed as "1920")
lgID                League ID
tmID                Team ID
G                   Games
W                   Wins
L                   Losses
T                   Ties
GF                  Goals for
GA                  Goals against
PIM                 Penalty minutes

---------------------------------------------------------------------------

2.16 TeamsHalf table

year                Year (1920-21 listed as "1920")
lgID                League ID
tmID                Team ID
half                First or second half of season
rank                Final standing for the half
G                   Games
W                   Wins
L                   Losses
T                   Ties
GF                  Goals for
GA                  Goals against

---------------------------------------------------------------------------

2.17 TeamSplits table

year                Year (1920-21 listed as "1920")
lgID                League ID
tmID                Team ID
hW                  Home wins
hL                  Home losses
hT                  Home ties
hOTL                Home overtime losses
rW                  Road wins
rL                  Road losses
rT                  Road ties
rOTL                Road overtime losses
SepW                September wins
SepL                September losses
SepT                September ties
SepOL               September overtime losses
OctW                October wins
OctL                October losses
OctT                October ties
OctOL               October overtime losses
NovW                November wins
NovL                November losses
NovT                November ties
NovOL               November overtime losses
DecW                December wins
DecL                December losses
DecT                December ties
DecOL               December overtime losses
JanW                January wins
JanL                January losses
JanT                January ties
JanOL               January overtime losses
FebW                February wins
FebL                February losses
FebT                February ties
FebOL               February overtime losses
MarW                March wins
MarL                March losses
MarT                March ties
MarOL               March overtime losses
AprW                April wins
AprL                April losses
AprT                April ties
AprOL               April overtime losses

---------------------------------------------------------------------------

2.18 TeamVsTeam table

year                Year (1920-21 listed as "1920")
lgID                League ID
tmID                Team ID
oppID               Opponent ID
W                   Wins
L                   Losses
T                   Ties
OTL                 Overtime losses

---------------------------------------------------------------------------

2.19 SeriesPost table

year                Year (1920-21 listed as "1920")
round               Round (see abbrev.csv for details)
series              Series - used for the NHL designations (e.g., Series "A")
tmIDWinner          Team ID of winner
lgIDWinner          League ID of winner
tmIDLoser           Team ID of loser
lgIDLoser           League ID of loser
W                   Wins for winner
L                   Losses for winner
T                   Ties
GoalsWinner         Goals for winner
GoalsLoser          Goals for loser
note                Note:  EX = exhibition, ND = no decision, TG = total-goals
                    series

---------------------------------------------------------------------------

2.20 CombinedShutouts table

year                Year (actual calendar year, not a season ID)
month               Month
date                Date
tmID                Team ID
oppID               Team ID of opponent
R/P                 "R" for regular season, or "P" for postseason
IDgoalie1           ID of first goalie
IDgoalie2           ID of second goalie

---------------------------------------------------------------------------

2.21 HOF table

year                Year elected
hofID               Hall of Fame ID
name                Name
category            Category (Player, Builder, Referee/Linesman)

---------------------------------------------------------------------------

3.0 NHL data availability

* Regular season +/- was published in the NHL Guide starting for 1982-83.
  Total Hockey has regular season +/- starting for 1967-68.  Postseason +/- was
  published in the NHL Guide starting for 1983-84.

* PPG, SHG, GWG, and GTG were published in NHL Guide for the regular season
  starting for 1963-64, and in Total Hockey starting for 1967-68.  Postseason
  values for PPG, SHG, and GWG are available in Total Hockey starting for
  1967-68, but were not published in the NHL Guide until the 1976-77 season.
  Postseason game summaries indicating PPG and SHG were published in Stanley
  Cup Records and Statistics (1975-76 season and earlier).

  Also note that for 1983-84 and earlier, a GTG was credited to each team in
  tie games.  Starting in 1984-85, only one GTG was credited in tie games.

* Shots on goal for the regular season were published in the NHL Guide starting
  for 1967-68, and for the postseason starting for 1983-84.

* Goalies' shots against for the regular season were published in the NHL Guide
  starting for 1982-83, and for the postseason starting for 1983-84.

* ENG were recorded starting in 1963-64.  The 2nd edition of Total Hockey
  incorporates research on ENG from 1955-56 to 1962-63, and subtracted these
  goals from individual GA totals.  These revised values are NOT incorporated
  in this database.

* Team bench minors were first tabulated in the NHL Guide for the 1969-70
  season.

* Postseason special teams statistics published in the NHL Guide for 1987-88
  and 1988-89 do not include SHGF or SHGA.

* Postseason power play / penalty killing team statistics published in Stanley
  Cup Records & Statistics do not indicate the number of power play or penalty
  kill opportunities.  However, the game summaries in the 1976 and 1977
  editions include "ADV", and these have been tabulated in this database.
