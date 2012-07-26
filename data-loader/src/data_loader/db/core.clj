(ns data-loader.db.core
  (:require [clojure.java.jdbc :as sql]))

(def pg-conn {:subprotocol "postgresql" 
                   :classname "org.postgresql.Driver",
                   :subname "//localhost/hockeydb",
                   :user "rob", :password "itsmerob"})

(defn run-sql [sql-vector]
	(sql/with-connection pg-conn
        (sql/with-query-results rows
          sql-vector 
          (into [] rows))))

(defn run-insert [table columns values]
	(sql/with-connection pg-conn
		(sql/insert-values
			table
			columns
			values)))
			
(defn insert-abbrev [{:keys [Type Code Fullname]}]
	(run-insert :abbrev
		[:Type :Code :Fullname]
		[Type Code Fullname]))

(defn insert-coaches [{:keys [coachID year tmID lgID stint notes g w l t postg postw postl postt]}]
	(run-insert :coaches 
		 					[:coachID :year :tmID :lgID :stint :notes :g :w :l :t :postg :postw :postl :postt]
							[coachID (Integer. (if (clojure.string/blank? year) "0" year)) tmID lgID 
							(Integer. (if (clojure.string/blank? stint) "0" stint)) 
							notes
							(Integer. (if (clojure.string/blank? g) "0" g)) 
							(Integer. (if (clojure.string/blank? w) "0" w))
							(Integer. (if (clojure.string/blank? l) "0" l))
							(Integer. (if (clojure.string/blank? t) "0" t)) 
							(Integer. (if (clojure.string/blank? postg) "0" postg))
							(Integer. (if (clojure.string/blank? postw) "0" postw))
							(Integer. (if (clojure.string/blank? postl) "0" postl))
							(Integer. (if (clojure.string/blank? postt) "0" postt))]))

(defn insert-coaches-beta [{:keys [coachID year tmID lgID stint notes g w l t otl postg postw postl postt]}]
	(run-insert :coaches_beta 
		 					[:coachID :year :tmID :lgID :stint :notes :g :w :l :t :otl :postg :postw :postl :postt]
							[coachID 
							(Integer. (if (clojure.string/blank? year) "0" year)) 
							tmID lgID 
							(Integer. (if (clojure.string/blank? stint) "0" stint)) 
							notes
							(Integer. (if (clojure.string/blank? g) "0" g)) 
							(Integer. (if (clojure.string/blank? w) "0" w))
							(Integer. (if (clojure.string/blank? l) "0" l))
							(Integer. (if (clojure.string/blank? t) "0" t)) 
							(Integer. (if (clojure.string/blank? otl) "0" otl)) 
							(Integer. (if (clojure.string/blank? postg) "0" postg))
							(Integer. (if (clojure.string/blank? postw) "0" postw))
							(Integer. (if (clojure.string/blank? postl) "0" postl))
							(Integer. (if (clojure.string/blank? postt) "0" postt))]))

(defn insert-coaches-awards [{:keys [coachID award year lgID note]}]
	(run-insert :awardscoaches 
		 					[:coachID :award :year :lgID :note]
							[coachID award (Integer. (if (clojure.string/blank? year) "0" year)) lgID note]))

(defn insert-combined-shutouts [{:keys [year month date tmID oppID RP IDgoalie1 IDgoalie2]}]
	(run-insert :combinedshutouts 
		 					[:year :month :date :tmID :oppID :RP :IDgoalie1 :IDgoalie2]
							[(Integer. (if (clojure.string/blank? year) "0" year))
							 (Integer. (if (clojure.string/blank? month) "0" month))
							 (Integer. (if (clojure.string/blank? date) "0" date))
							tmID oppID RP IDgoalie1 IDgoalie2]))

(defn insert-goalies [{:keys [playerID year stint tmID lgID GP Min W L TOL ENG SHO GA SA 
	                            PostGP PostMin PostW PostL PostT PostENG PostSHO PostGA PostSA]}]
	(run-insert :goalies 
						  [:playerID :year :stint :tmID :lgID :GP :Min :W :L :TOL :ENG :SHO :GA :SA 
								:PostGP :PostMin :PostW :PostL :PostT :PostENG :PostSHO :PostGA :PostSA]
							[playerID 	
							(Integer. (if (clojure.string/blank? year) "0" year)) 
							(Integer. (if (clojure.string/blank? stint) "0" stint)) 
							tmID lgID 
							(Integer. (if (clojure.string/blank? GP) "0" GP)) 
							(Integer. (if (clojure.string/blank? Min) "0" Min)) 
							(Integer. (if (clojure.string/blank? W) "0" W))
							(Integer. (if (clojure.string/blank? L) "0" L))
							(Integer. (if (clojure.string/blank? TOL) "0" TOL))
							(Integer. (if (clojure.string/blank? ENG) "0" ENG))
							(Integer. (if (clojure.string/blank? SHO) "0" SHO))
							(Integer. (if (clojure.string/blank? GA) "0" GA))
							(Integer. (if (clojure.string/blank? SA) "0" SA))
							(Integer. (if (clojure.string/blank? PostGP) "0" PostGP))
							(Integer. (if (clojure.string/blank? PostMin) "0" PostMin))
							(Integer. (if (clojure.string/blank? PostW) "0" PostW))
							(Integer. (if (clojure.string/blank? PostL) "0" PostL))
							(Integer. (if (clojure.string/blank? PostT) "0" PostT))
							(Integer. (if (clojure.string/blank? PostENG) "0" PostENG))
							(Integer. (if (clojure.string/blank? PostSHO) "0" PostSHO))
							(Integer. (if (clojure.string/blank? PostGA) "0" PostGA))
							(Integer. (if (clojure.string/blank? PostSA) "0" PostSA))]))

(defn insert-goaliessc [{:keys [playerID year tmID lgID GP Min W L T SHO GA]}]
	(run-insert :goaliessc 
						  [:playerID :year :tmID :lgID :GP :Min :W :L :T :SHO :GA]
							[playerID 
							 (Integer. (if (clojure.string/blank? year) "0" year)) 
								tmID lgID
								(Integer. (if (clojure.string/blank? GP) "0" GP)) 
								(Integer. (if (clojure.string/blank? Min) "0" Min)) 
								(Integer. (if (clojure.string/blank? W) "0" W))
								(Integer. (if (clojure.string/blank? L) "0" L))
								(Integer. (if (clojure.string/blank? T) "0" T))
								(Integer. (if (clojure.string/blank? SHO) "0" SHO))
								(Integer. (if (clojure.string/blank? GA) "0" GA))
								]))

(defn insert-goaliesshootouts [{:keys [playerID year stint tmID W L SA GA]}]
	(run-insert :goaliesshootout 
						  [:playerID :year :stint :tmID :W :L :SA :GA]
							[playerID 
							  (Integer. (if (clojure.string/blank? year) "0" year)) 
								(Integer. (if (clojure.string/blank? stint) "0" stint)) 
								tmID 
								(Integer. (if (clojure.string/blank? W) "0" W))
								(Integer. (if (clojure.string/blank? L) "0" L))
								(Integer. (if (clojure.string/blank? SA) "0" SA))
								(Integer. (if (clojure.string/blank? GA) "0" GA))
								]))

(defn insert-hof [{:keys [year hofID name category]}]
	(run-insert :hof
		[:year :hofID :name :category]
		[(Integer. (if (clojure.string/blank? year) "0" year)) 
		 hofID name category]))

(defn insert-players-awards [{:keys [playerID award year lgID note pos]}]
	(run-insert :awardsplayers 
		 					[:playerID :award :year :lgID :note :pos]
							[playerID award (Integer. (if (clojure.string/blank? year) "0" year)) lgID note pos]))
												
(defn insert-misc-awards [{:keys [name ID award year lgID note]}]
	(run-insert :awardsmisc 
		 					[:name :ID :award :year :lgID :note]
							[name ID award (Integer. (if (clojure.string/blank? year) "0" year)) lgID note]))


(defn insert-master [{:keys [playerID coachID hofID firstName lastName nameNote nameGiven nameNick height weight shootCatch legendsID ihdbID 
														 hrefID firstNHL lastNHL firstWHA lastWHA pos birthYear birthMon birthDay birthCountry birthState birthCity deathYear 
															deathMon deathDay deathCountry deathState deathCity]}] 
	(sql/with-connection pg-conn
		(sql/insert-values
		   :master
		   [:playerID :coachID :hofID :firstName :lastName :nameNote :nameGiven :height :weight :shootCatch :legendsID :ihdbID :hrefID
				:firstNHL :lastNHL :firstWHA :lastWHA :pos :birthYear :birthMon :birthDay :birthCountry :birthState :birthCity :deathYear 
				:deathMon :deathDay :deathCountry :deathState :deathCity]
   		 [playerID coachID hofID firstName lastName nameNote nameGiven 
					(Integer. (if (clojure.string/blank? height) "0" height)) 
					(Integer. (if (clojure.string/blank? weight) "0" weight)) 
					shootCatch legendsID 
					(Integer. (if (clojure.string/blank? ihdbID) "0" ihdbID))
					hrefID 
					(Integer. (if (clojure.string/blank? firstNHL) "0" firstNHL)) 
					(Integer. (if (clojure.string/blank? lastNHL) "0" lastNHL)) 
					(Integer. (if (clojure.string/blank? firstWHA) "0" firstWHA)) 
					(Integer. (if (clojure.string/blank? lastWHA) "0" lastWHA)) 
					pos
					(Integer. (if (clojure.string/blank? birthYear) "0" birthYear)) 
					(Integer. (if (clojure.string/blank? birthMon) "0" birthMon)) 
					(Integer. (if (clojure.string/blank? birthDay) "0" birthDay)) 
					birthCountry birthState birthCity
					(Integer. (if (clojure.string/blank? deathYear) "0" deathYear)) 
					(Integer. (if (clojure.string/blank? deathMon) "0" deathMon)) 
					(Integer. (if (clojure.string/blank? deathDay) "0" deathDay)) 
					deathCountry deathState deathCity
					])))

(defn insert-scoringsc [{:keys [playerID year stint tmID lgID pos GP G A Pts PIM]}]
	(run-insert :scoringsc
						  [:playerID :year :stint :tmID :lgID :pos :GP :G :A :Pts :PIM ]
							[playerID 	
							(Integer. (if (clojure.string/blank? year) "0" year)) 
							(Integer. (if (clojure.string/blank? stint) "0" stint)) 
							tmID lgID pos 
							(Integer. (if (clojure.string/blank? GP) "0" GP)) 
							(Integer. (if (clojure.string/blank? G) "0" G)) 
							(Integer. (if (clojure.string/blank? A) "0" A))
							(Integer. (if (clojure.string/blank? Pts) "0" Pts))
							(Integer. (if (clojure.string/blank? PIM) "0" PIM))]))

(defn insert-scoringshootout [{:keys [playerID year stint tmID S G GDG]}]
	(run-insert :scoringshootout
						  [:playerID :year :stint :tmID :S :G :GDG ]
							[playerID 	
							(Integer. (if (clojure.string/blank? year) "0" year)) 
							(Integer. (if (clojure.string/blank? stint) "0" stint)) 
							tmID  
							(Integer. (if (clojure.string/blank? S) "0" S)) 
							(Integer. (if (clojure.string/blank? G) "0" G)) 
							(Integer. (if (clojure.string/blank? GDG) "0" GDG))]))

(defn insert-scoringsup [{:keys [playerID year PPA SHA]}]
	(run-insert :scoringsup
						  [:playerID :year :PPA :SHA ]
							[playerID 	
							(Integer. (if (clojure.string/blank? year) "0" year)) 
							(Integer. (if (clojure.string/blank? PPA) "0" PPA)) 
							(Integer. (if (clojure.string/blank? SHA) "0" SHA))])) 

(defn insert-scoring [{:keys [playerID year stint tmID lgID pos GP G A Pts PIM PlusMinus PPG PPA SHG 
	                            SHA GWG GTG SOG PostGP PostG PostA PostPts PostPIM PostPlusMinus PostPPG 
															PostPPA PostSHG PostSHA PostGWG PostSOG]}]
	(run-insert :scoring 
						  [:playerID :year :stint :tmID :lgID :pos :GP :G :A :Pts :PIM :PlusMinus :PPG :PPA :SHG 
							 :SHA :GWG :GTG :SOG :PostGP :PostG :PostA :PostPts :PostPIM :PostPlusMinus :PostPPG 
							 :PostPPA :PostSHG :PostSHA :PostGWG :PostSOG]
							[playerID 	
							(Integer. (if (clojure.string/blank? year) "0" year)) 
							(Integer. (if (clojure.string/blank? stint) "0" stint)) 
							tmID lgID pos 
							(Integer. (if (clojure.string/blank? GP) "0" GP)) 
							(Integer. (if (clojure.string/blank? G) "0" G)) 
							(Integer. (if (clojure.string/blank? A) "0" A))
							(Integer. (if (clojure.string/blank? Pts) "0" Pts))
							(Integer. (if (clojure.string/blank? PIM) "0" PIM))
							(Integer. (if (clojure.string/blank? PlusMinus) "0" PlusMinus))
							(Integer. (if (clojure.string/blank? PPG) "0" PPG))
							(Integer. (if (clojure.string/blank? PPA) "0" PPA))
							(Integer. (if (clojure.string/blank? SHG) "0" SHG))
							(Integer. (if (clojure.string/blank? SHA) "0" SHA))
							(Integer. (if (clojure.string/blank? GWG) "0" GWG))
							(Integer. (if (clojure.string/blank? GTG) "0" GTG))
							(Integer. (if (clojure.string/blank? SOG) "0" SOG))	
							(Integer. (if (clojure.string/blank? PostGP) "0" PostGP))
							(Integer. (if (clojure.string/blank? PostG) "0" PostG))
							(Integer. (if (clojure.string/blank? PostA) "0" PostA))
							(Integer. (if (clojure.string/blank? PostPts) "0" PostPts))
							(Integer. (if (clojure.string/blank? PostPIM) "0" PostPIM))
							(Integer. (if (clojure.string/blank? PostPlusMinus) "0" PostPlusMinus))
							(Integer. (if (clojure.string/blank? PostPPG) "0" PostPPG))
							(Integer. (if (clojure.string/blank? PostPPA) "0" PostPPA))
							(Integer. (if (clojure.string/blank? PostSHG) "0" PostSHG))
							(Integer. (if (clojure.string/blank? PostSHA) "0" PostSHA))
							(Integer. (if (clojure.string/blank? PostGWG) "0" PostGWG))
							(Integer. (if (clojure.string/blank? PostSOG) "0" PostSOG))]))
							
(defn insert-seriespost [{:keys [year round series tmIDWinner lgIDWinner tmIDLoser lgIDLoser W L T GoalsWinner GoalsLoser note]}]
	(run-insert :seriespost
		[:year :round :series :tmIDWinner :lgIDWinner :tmIDLoser :lgIDLoser :W :L :T :GoalsWinner :GoalsLoser :note]
		[(Integer. (if (clojure.string/blank? year) "0" year))  
		 round series tmIDWinner lgIDWinner tmIDLoser lgIDLoser 
			(Integer. (if (clojure.string/blank? W) "0" W))
			(Integer. (if (clojure.string/blank? L) "0" L))
			(Integer. (if (clojure.string/blank? T) "0" T))
		  (Integer. (if (clojure.string/blank? GoalsWinner) "0" GoalsWinner))
			(Integer. (if (clojure.string/blank? GoalsLoser) "0" GoalsLoser))
			note]))
			
(defn insert-teamsplits [{:keys [ year lgID tmID hW hL hT hOTL rW rL rT rOTL SepW SepL SepT SepOL OctW OctL OctT OctOL NovW 
																 NovL NovT NovOL DecW DecL DecT DecOL JanW JanL JanT JanOL FebW FebL FebT FebOL MarW MarL 
																 MarT MarOL AprW AprL AprT AprOL]}]
	(run-insert :teamsplits
		[:year :lgID :tmID :hW :hL :hT :hOTL :rW :rL :rT :rOTL :SepW :SepL :SepT :SepOL :OctW :OctL :OctT :OctOL :NovW
		 :NovL :NovT :NovOL :DecW :DecL :DecT :DecOL :JanW :JanL :JanT :JanOL :FebW :FebL :FebT :FebOL :MarW :MarL
		 :MarT :MarOL :AprW :AprL :AprT :AprOL]	
		[(Integer. (if (clojure.string/blank? year) "0" year))  
		lgID tmID 
		(Integer. (if (clojure.string/blank? hW) "0" hW))  
		(Integer. (if (clojure.string/blank? hL) "0" hL))  
		(Integer. (if (clojure.string/blank? hT) "0" hT))  
		(Integer. (if (clojure.string/blank? hOTL) "0" hOTL))  
		(Integer. (if (clojure.string/blank? rW) "0" rW))  
		(Integer. (if (clojure.string/blank? rL) "0" rL))  
		(Integer. (if (clojure.string/blank? rT) "0" rT))  
		(Integer. (if (clojure.string/blank? rOTL) "0" rOTL))  
		(Integer. (if (clojure.string/blank? SepW) "0" SepW))
		(Integer. (if (clojure.string/blank? SepL) "0" SepL))
		(Integer. (if (clojure.string/blank? SepT) "0" SepT))
		(Integer. (if (clojure.string/blank? SepOL) "0" SepOL))
		(Integer. (if (clojure.string/blank? OctW) "0" OctW))
		(Integer. (if (clojure.string/blank? OctL) "0" OctL))
		(Integer. (if (clojure.string/blank? OctT) "0" OctT))
		(Integer. (if (clojure.string/blank? OctOL) "0" OctOL))
		(Integer. (if (clojure.string/blank? NovW) "0" NovW))
		(Integer. (if (clojure.string/blank? NovL) "0" NovL))
		(Integer. (if (clojure.string/blank? NovT) "0" NovT))
		(Integer. (if (clojure.string/blank? NovOL) "0" NovOL))
		(Integer. (if (clojure.string/blank? DecW) "0" DecW))
		(Integer. (if (clojure.string/blank? DecL) "0" DecL))
		(Integer. (if (clojure.string/blank? DecT) "0" DecT))
		(Integer. (if (clojure.string/blank? DecOL) "0" DecOL))
		(Integer. (if (clojure.string/blank? JanW) "0" JanW))
		(Integer. (if (clojure.string/blank? JanL) "0" JanL))
		(Integer. (if (clojure.string/blank? JanT) "0" JanT))
		(Integer. (if (clojure.string/blank? JanOL) "0" JanOL))
		(Integer. (if (clojure.string/blank? FebW) "0" FebW))
		(Integer. (if (clojure.string/blank? FebL) "0" FebL))
		(Integer. (if (clojure.string/blank? FebT) "0" FebT))
		(Integer. (if (clojure.string/blank? FebOL) "0" FebOL))
		(Integer. (if (clojure.string/blank? MarW) "0" MarW))
		(Integer. (if (clojure.string/blank? MarL) "0" MarL))
		(Integer. (if (clojure.string/blank? MarT) "0" MarT))
		(Integer. (if (clojure.string/blank? MarOL) "0" MarOL))
		(Integer. (if (clojure.string/blank? AprW) "0" AprW))
		(Integer. (if (clojure.string/blank? AprL) "0" AprL))
		(Integer. (if (clojure.string/blank? AprT) "0" AprT))
		(Integer. (if (clojure.string/blank? AprOL) "0" AprOL))]))
		
(defn insert-teamvsteam [{:keys [year lgID tmID oppID W L T OTL]}]
	(run-insert :teamvsteam
		[:year :lgID :tmID :oppID :W :L :T :OTL]
		[(Integer. (if (clojure.string/blank? year) "0" year))
		 lgID tmID oppID 
		(Integer. (if (clojure.string/blank? W) "0" W))  
		(Integer. (if (clojure.string/blank? L) "0" L))  
		(Integer. (if (clojure.string/blank? T) "0" T))  
		(Integer. (if (clojure.string/blank? OTL) "0" OTL))]))
		
(defn insert-teams [{:keys [ year lgID tmID franchID confID divID rank playoff G W L T 
														OTL Pts SoW SoL GF GA name PIM BenchMinor PPG PPC SHA PKG 
														PKC SHF]}]
	(run-insert :teams
		[:year :lgID :tmID :franchID :confID :divID :rank :playoff :G :W :L :T 
		 :OTL :Pts :SoW :SoL :GF :GA :name :PIM :BenchMinor :PPG :PPC :SHA :PKG :PKC :SHF]
		[(Integer. (if (clojure.string/blank? year) "0" year))
		 lgID tmID franchID confID divID 
		 (Integer. (if (clojure.string/blank? rank) "0" rank))
		 playoff 
		 (Integer. (if (clojure.string/blank? G) "0" G))
		 (Integer. (if (clojure.string/blank? W) "0" W))  
		 (Integer. (if (clojure.string/blank? L) "0" L))  
		 (Integer. (if (clojure.string/blank? T) "0" T))  
		 (Integer. (if (clojure.string/blank? OTL) "0" OTL))
		 (Integer. (if (clojure.string/blank? Pts) "0" Pts))
		 (Integer. (if (clojure.string/blank? SoW) "0" SoW))  
		 (Integer. (if (clojure.string/blank? SoL) "0" SoL))  
		 (Integer. (if (clojure.string/blank? GF) "0" GF))  
		 (Integer. (if (clojure.string/blank? GA) "0" GA))
		 name 
		 (Integer. (if (clojure.string/blank? PIM) "0" PIM))
		 (Integer. (if (clojure.string/blank? BenchMinor) "0" BenchMinor))  
		 (Integer. (if (clojure.string/blank? PPG) "0" PPG))  
		 (Integer. (if (clojure.string/blank? PPC) "0" PPC))  
		 (Integer. (if (clojure.string/blank? SHA) "0" SHA))
		 (Integer. (if (clojure.string/blank? PKG) "0" PKG))  
		 (Integer. (if (clojure.string/blank? PKC) "0" PKC))  
		 (Integer. (if (clojure.string/blank? SHF) "0" SHF))]))

(defn insert-teamshalf [{:keys [ year lgID tmID half rank G W L T GF GA]}]
	(run-insert :teamshalf
		[:year :lgID :tmID :half :rank :G :W :L :T :GF :GA]
		[ (Integer. (if (clojure.string/blank? year) "0" year))
		  lgID tmID  
 		  (Integer. (if (clojure.string/blank? half) "0" half))
		  (Integer. (if (clojure.string/blank? rank) "0" rank))
		  (Integer. (if (clojure.string/blank? G) "0" G))
		  (Integer. (if (clojure.string/blank? W) "0" W))  
		  (Integer. (if (clojure.string/blank? L) "0" L))  
		  (Integer. (if (clojure.string/blank? T) "0" T))  
		  (Integer. (if (clojure.string/blank? GF) "0" GF))
		  (Integer. (if (clojure.string/blank? GA) "0" GA))
		 ]))

(defn insert-teamspost [{:keys [ year lgID tmID G W L T 
														GF GA BenchMinor PPG PPC SHA PKG 
														PKC SHF]}]
	(run-insert :teamspost
		[:year :lgID :tmID :G :W :L :T 
		 :GF :GA :BenchMinor :PPG :PPC :SHA :PKG :PKC :SHF]
		[(Integer. (if (clojure.string/blank? year) "0" year))
		 lgID tmID 
		 (Integer. (if (clojure.string/blank? G) "0" G))
		 (Integer. (if (clojure.string/blank? W) "0" W))  
		 (Integer. (if (clojure.string/blank? L) "0" L))  
		 (Integer. (if (clojure.string/blank? T) "0" T))  
		 (Integer. (if (clojure.string/blank? GF) "0" GF))  
		 (Integer. (if (clojure.string/blank? GA) "0" GA))
		 (Integer. (if (clojure.string/blank? BenchMinor) "0" BenchMinor))  
		 (Integer. (if (clojure.string/blank? PPG) "0" PPG))  
		 (Integer. (if (clojure.string/blank? PPC) "0" PPC))  
		 (Integer. (if (clojure.string/blank? SHA) "0" SHA))
		 (Integer. (if (clojure.string/blank? PKG) "0" PKG))  
		 (Integer. (if (clojure.string/blank? PKC) "0" PKC))  
		 (Integer. (if (clojure.string/blank? SHF) "0" SHF))]))


(defn insert-teamssc [{:keys [ year lgID tmID G W L T 
														GF GA PIM]}]
	(run-insert :teamssc
		[:year :lgID :tmID :G :W :L :T 
		 :GF :GA :PIM]
		[(Integer. (if (clojure.string/blank? year) "0" year))
		 lgID tmID 
		 (Integer. (if (clojure.string/blank? G) "0" G))
		 (Integer. (if (clojure.string/blank? W) "0" W))  
		 (Integer. (if (clojure.string/blank? L) "0" L))  
		 (Integer. (if (clojure.string/blank? T) "0" T))  
		 (Integer. (if (clojure.string/blank? GF) "0" GF))  
		 (Integer. (if (clojure.string/blank? GA) "0" GA))
		 (Integer. (if (clojure.string/blank? PIM) "0" PIM))]))

