(defproject data-loader "1.0.0-SNAPSHOT"
  :description "FIXME: write description"
  :dependencies [[org.clojure/clojure "1.4.0"]
									[clojure-csv "2.0.0-alpha2"]
									 [postgresql/postgresql "9.1-901.jdbc4"]
									 [mysql/mysql-connector-java "5.1.6"]
									 [sqlitejdbc "0.5.6"]
	                 [korma "0.3.0-beta10"]]
	:main data-loader.core)