#!/bin/bash

# Survey questions

#
echo "Question 1"
read VAR1
#
echo "Question 2"
read VAR2
#
echo "Question 3"
read VAR3
#
echo "Question 4"
read VAR4
# 
echo "Question 5"
read VAR5
# add a variable for the time
TIMESTAMP=`date --iso-8601=seconds`
# create unique identifier
UID="$RANDOM-$RANDOM"
# write data to csv file
echo "$UID,$TIMESTAMP,$VAR1,$VAR2,$VAR3,$VAR4,$VAR5" >> ./data.csv
# read out data in csv file 
cat data.csv  
# write data to database--remove later
bash ./write-to-db.sh
# after 
mysql -u root -p"root" "LOAD DATA INFILE './data.csv INTO TABLE Data FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"';"

