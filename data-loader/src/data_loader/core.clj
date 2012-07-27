(ns data-loader.core
	(:require [clojure.java.io :as io]
						[clojure-csv.core :as csv]
						[data-loader.db.core :as db]
						[data-loader.db.connections :as conns]))

(defn process-data [data-file fn db-conn]
	(println (str "processing file " data-file))
	(with-open [rdr (io/reader data-file)]
	  (let [column-headers (into [] (map #(keyword (clojure.string/replace % #"/" "")) (first (csv/parse-csv rdr))))]
			(doseq [hrec (rest (csv/parse-csv rdr))]
				(fn (merge {:db-conn db-conn} (zipmap column-headers hrec)))))))
				
(defn -main [& args]
	(println (str "Starting Data Loader for " (first args)))
	(let [base-data-dir (second args) ;"../../hockey/hdb-2012-06-23"
			 dbconn ((keyword (first args)) conns/conns)]
		;(process-data (str base-data-dir "/abbrev.csv")  db/insert-abbrev dbconn)
		;(process-data (str base-data-dir "/Master.csv") db/insert-master dbconn)
		;(process-data (str base-data-dir "/AwardsCoaches.csv") db/insert-coaches-awards dbconn)
		;(process-data (str base-data-dir "/AwardsMisc.csv") db/insert-misc-awards dbconn)
		;(process-data (str base-data-dir "/AwardsPlayers.csv") db/insert-players-awards dbconn)
		;(process-data (str base-data-dir "/Coaches.csv") db/insert-coaches dbconn)
		;(process-data  (str base-data-dir "/Coaches_beta.csv") db/insert-coaches-beta dbconn)
		;(process-data (str base-data-dir "/CombinedShutouts.csv")  db/insert-combined-shutouts dbconn)
		;(process-data (str base-data-dir "/Goalies.csv")  db/insert-goalies dbconn)
		;(process-data (str base-data-dir "/GoaliesSC.csv")  db/insert-goaliessc dbconn)
		;(process-data (str base-data-dir "/GoaliesShootout.csv")  db/insert-goaliesshootouts dbconn)
		;(process-data (str base-data-dir "/HOF.csv")  db/insert-hof dbconn)
		;(process-data (str base-data-dir "/Scoring.csv")  db/insert-scoring dbconn)
		;(process-data (str base-data-dir "/ScoringSC.csv")  db/insert-scoringsc dbconn)
		;(process-data (str base-data-dir "/ScoringShootout.csv") db/insert-scoringshootout dbconn)
		(process-data "../hdb-2012-06-23/ScoringSup.csv"  db/insert-scoringsup)
		;(process-data "../hdb-2012-06-23/SeriesPost.csv"  db/insert-seriespost)
		;(process-data "../hdb-2012-06-23/TeamSplits.csv"  db/insert-teamsplits)
		;(process-data "../hdb-2012-06-23/TeamVsTeam.csv"  db/insert-teamvsteam)
		;(process-data "../hdb-2012-06-23/Teams.csv"  db/insert-teams)
		;(process-data "../hdb-2012-06-23/TeamsHalf.csv"  db/insert-teamshalf)
		;(process-data "../hdb-2012-06-23/TeamsPost.csv"  db/insert-teamspost)
		;(process-data "../hdb-2012-06-23/TeamsSC.csv"  db/insert-teamssc)
))
