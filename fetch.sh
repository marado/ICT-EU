#!/bin/bash

rm -rf tmp ;
mkdir tmp ;
cd tmp ;
echo "Fetching projects:";

let pages=($(wget "http://cordis.europa.eu/projects/result_en?q=%28contenttype%3D%27project%27+OR+%2Fresult%2Frelations%2Fcategories%2FresultCategory%2Fcode%3D%27brief%27%2C%27report%27%29+AND+programme%2Fpga%3D%27FP7-ICT%27&p=$page&num=100&format=csv" -o /dev/null -O -|grep "Results 1 - 100 of"|cut -df -f2|sed 's/\ //g')+99)/100

echo "There are $pages pages to fetch.";
for page in $(seq 1 "$pages"); do
echo "Fetching page $page";
wget "http://cordis.europa.eu/projects/result_en?q=%28contenttype%3D%27project%27+OR+%2Fresult%2Frelations%2Fcategories%2FresultCategory%2Fcode%3D%27brief%27%2C%27report%27%29+AND+programme%2Fpga%3D%27FP7-ICT%27&p=$page&num=100&format=csv" -o /dev/null -O $page.csv ;
done

echo "All fetched."
