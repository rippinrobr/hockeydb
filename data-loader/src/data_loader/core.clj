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
		;(process-data (str base-data-dir "/ScoringSup.csv")  db/insert-scoringsup dbconn)
		;(process-data (str base-data-dir "/SeriesPost.csv")  db/insert-seriespost dbconn)
		;(process-data (str base-data-dir "/TeamSplits.csv")  db/insert-teamsplits dbconn)
		;(process-data (str base-data-dir "/TeamVsTeam.csv")  db/insert-teamvsteam dbconn)
		;(process-data (str base-data-dir "/Teams.csv")  db/insert-teams dbconn)
		;(process-data (str base-data-dir "/TeamsHalf.csv")  db/insert-teamshalf dbconn)
		;(process-data (str base-data-dir "/TeamsPost.csv")  db/insert-teamspost dbconn)
		(process-data (str base-data-dir "/TeamsSC.csv")  db/insert-teamssc dbconn)
))
