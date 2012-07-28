#!/bin/bash
executable=`which lein`
dbtype='mysql'
datadir='../../hockey/hdb-2012-06-23'

$executable 'run' $dbtype $datadir
