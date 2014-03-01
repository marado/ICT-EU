#!/bin/bash

cd tmp ;

rm -f ../final.csv ;
# echo "\"Reference ID\";\"Title\";\"Description\";\"ID Card\";\"Partners\"" > ../final.csv ;
echo "\"Reference ID\";\"Title\";\"Description\";\"Funded Under\";\"Area\";\"Cost\";\"Contribution\";\"Reference\";\"Execution\";\"Project Status\";\"Contract Type\";\"Partners\"" > ../final.csv ;

# 03 -- for each project, grab info and process it
for project in `ls project-*`; do 
	echo "Processing $project";
	
	# We're looking for:
	
	# * title
	title=$(grep \<h1 $project|cut -d\> -f2|cut -d \< -f1|sed 's/\"//g'|sed 's///g');
	
	# * description
	description=$(grep \<h1 $project -A60|grep "<div" -B60|grep -v \<h1|grep -v \<div|sed ':a;N;$!ba;s/\n/ /g'|sed 's/\"//g'|sed 's///g');
	# TODO: html2txt description

	# * each of the "Project ID card" fields
	rawidcard=$(grep "Project ID card" $project -A30|grep -v "Project ID card"|grep class=\"rightlabel -B30|grep -v \<div|grep -v \<\/div|grep -v ul\>|sed ':a;N;$!ba;s/\n/ /g'|sed 's/\"//g'|sed 's///g'|sed 's/&#8364;/€/g');
	# parse idcard
	idcard=$(for i in `echo $rawidcard`; do echo -n "$i "; done|sed 's/<\/li>/\r\n/g');
	funded=$(echo "$idcard"|grep "Funded under"|cut -d: -f2-|cut -d\> -f2-|cut -d\< -f1);
	area=$(echo "$idcard"|grep "Area"|cut -d: -f2-);
	cost=$(echo "$idcard"|grep "Total cost"|cut -d: -f2-);
	contribution=$(echo "$idcard"|grep "EU contribution"|cut -d: -f2-);
	reference=$(echo "$idcard"|grep "Project reference"|cut -d: -f2-);
	execution=$(echo "$idcard"|grep "Execution"|cut -d: -f2-);
	pstatus=$(echo "$idcard"|grep "Project"|grep "status:"|cut -d: -f2-);
	ctype=$(echo "$idcard"|grep "Contract type"|cut -d: -f2-);
	
	# * Participating partners table
	partners=$(grep partTable $project -A600|grep \<\/table -B600|grep -v \<table|grep -v \<\/table|sed ':a;N;$!ba;s/\n/ /g'|sed 's/\"//g'|sed 's///g');
	# TODO: parse partners

	# 04 -- generate final CSV
	echo ": Generating CSV entry for $project";
	# echo "\"$project\";\"$title\";\"$description\";\"$idcard\";\"$partners\"" >> ../final.csv ;
	echo "\"$project\";\"$title\";\"$description\";\"$funded\";\"$area\";\"$cost\";\"$contribution\";\"$reference\";\"$execution\";\"$pstatus\";\"$ctype\";\"$partners\"" >> ../final.csv ;

done

echo "CSV generated: see final.csv";
echo -n "Number of projects with empty fields: "; grep \"\" ../final.csv |wc -l;

