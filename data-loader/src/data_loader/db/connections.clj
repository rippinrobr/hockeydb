(ns data-loader.db.connections)

(def conns {
					:mysql
								{:classname "com.mysql.jdbc.Driver" 
								  :subprotocol "mysql" 
	                :subname "//localhost:3306/hockeydb" 
	                :user "hockey" :password "hockey"}
					:postgres 
	 							{:subprotocol "postgresql" 
                   :classname "org.postgresql.Driver",
                   :subname "//localhost/hockeydb",
                   :user "rob", :password "itsmerob"}
						:sqlite 
								{:classname   "org.sqlite.JDBC"
   								:subprotocol "sqlite"
   								:subname     "../databases/sqlite/hockeydb.sqlite3" }})
