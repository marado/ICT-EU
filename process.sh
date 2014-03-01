#!/bin/bash

cd tmp ;

rm -f ../final.csv ;
echo "\"Reference ID\";\"Title\";\"Description\";\"ID Card\";\"Partners\"" > ../final.csv ;

# 03 -- for each project, grab info and process it
for project in `ls project-*`; do 
	echo "Processing $project";
	
	# We're looking for:
	
	# * title
	title=$(grep \<h1 $project|cut -d\> -f2|cut -d \< -f1|sed 's/\"//g');
	
	# * description
	description=$(grep \<h1 $project -A30|grep "<div" -B30|grep -v \<h1|grep -v \<div|sed ':a;N;$!ba;s/\n/ /g'|sed 's/\"//g');
	# TODO: html2txt description

	# * each of the "Project ID card" fields
	idcard=$(grep "Project ID card" $project -A30|grep -v "Project ID card"|grep class=\"rightlabel -B30|grep -v \<div|grep -v \<\/div|grep -v ul\>|sed ':a;N;$!ba;s/\n/ /g'|sed 's/\"//g');
	# TODO: parse idcard
	
	# * Participating partners table
	partners=$(grep partTable $project -A100|grep \<\/table -B100|grep -v \<table|grep -v \<\/table|sed ':a;N;$!ba;s/\n/ /g'|sed 's/\"//g');
	# TODO: parse partners

	# 04 -- generate final CSV
	echo ": Generating CSV entry for $project";
	echo "\"$project\";\"$title\";\"$description\";\"$idcard\";\"$partners\"" >> ../final.csv ;

done

echo "CSV generated: see final.csv";
