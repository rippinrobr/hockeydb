(ns data-loader.core
	(:require [clojure.java.io :as io]
						[clojure-csv.core :as csv]
						[data-loader.db.core :as db]))

(defn process-data [data-file fn]
	(println (str "processing file " data-file))
	(with-open [rdr (io/reader data-file)]
	  (let [column-headers (into [] (map #(keyword (clojure.string/replace % #"/" "")) (first (csv/parse-csv rdr))))]
		  (println column-headers)
			(doseq [hrec (rest (csv/parse-csv rdr))]
				(fn (zipmap column-headers hrec))))))
				
(defn -main [& args]
	(println "Starting Data Loader")
	;(process-data "../hdb-2012-06-23/Master.csv" db/insert-master)
	;(process-data "../hdb-2012-06-23/AwardsCoaches.csv" db/insert-coaches-awards)
	;(process-data "../hdb-2012-06-23/AwardsMisc.csv" db/insert-misc-awards)
	;(process-data "../hdb-2012-06-23/AwardsPlayers.csv" db/insert-players-awards)
	;(process-data "../hdb-2012-06-23/Coaches.csv" db/insert-coaches)
	;(process-data "../hdb-2012-06-23/Coaches_beta.csv" db/insert-coaches-beta)
	;(process-data "../hdb-2012-06-23/CombinedShutouts.csv"  db/insert-combined-shutouts)
	;(process-data "../hdb-2012-06-23/Goalies.csv"  db/insert-goalies)
	;(process-data "../hdb-2012-06-23/GoaliesSC.csv"  db/insert-goaliessc)
	;(process-data "../hdb-2012-06-23/GoaliesShootout.csv"  db/insert-goaliesshootouts)
	;(process-data "../hdb-2012-06-23/HOF.csv"  db/insert-hof)
	;(process-data "../hdb-2012-06-23/Scoring.csv"  db/insert-scoring)
	;(process-data "../hdb-2012-06-23/ScoringSC.csv"  db/insert-scoringsc)
	;(process-data "../hdb-2012-06-23/ScoringShootout.csv"  db/insert-scoringshootout)
	;(process-data "../hdb-2012-06-23/ScoringSup.csv"  db/insert-scoringsup)
	;(process-data "../hdb-2012-06-23/SeriesPost.csv"  db/insert-seriespost)
	;(process-data "../hdb-2012-06-23/TeamSplits.csv"  db/insert-teamsplits)
	;(process-data "../hdb-2012-06-23/TeamVsTeam.csv"  db/insert-teamvsteam)
	;(process-data "../hdb-2012-06-23/Teams.csv"  db/insert-teams)
	;(process-data "../hdb-2012-06-23/TeamsHalf.csv"  db/insert-teamshalf)
	;(process-data "../hdb-2012-06-23/TeamsPost.csv"  db/insert-teamspost)
	;(process-data "../hdb-2012-06-23/TeamsSC.csv"  db/insert-teamssc)
	(process-data "../hdb-2012-06-23/abbrev.csv"  db/insert-abbrev)
)
