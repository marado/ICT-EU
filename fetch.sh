#!/bin/bash

# 01 -- fetch list
rm -rf tmp ;
mkdir tmp ;
cd tmp ;
echo "Fetching projects list";
wget "http://ec.europa.eu/information_society/apps/projects/index.cfm?menu=secondary" -O list.html -o /dev/null ;

# 02 -- fetch projects
for purl in `grep factsheet\/index list.html |cut -d\" -f2`; do 
	pname=$(echo $purl|cut -d= -f2);
	echo "Fetching project: $pname";
	wget "http://ec.europa.eu/information_society/apps/projects/$purl" -O project-$pname -o /dev/null ;
done


