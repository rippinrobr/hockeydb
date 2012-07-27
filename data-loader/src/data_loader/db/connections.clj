(ns data-loader.db.connections)

(def conns {:postgres 
	 							{:subprotocol "postgresql" 
                   :classname "org.postgresql.Driver",
                   :subname "//localhost/hockeydb",
                   :user "rob", :password "itsmerob"}
						:sqlite 
								{:classname   "org.sqlite.JDBC"
   								:subprotocol "sqlite"
   								:subname     "../databases/sqlite/hockeydb.sqlite3" }})
