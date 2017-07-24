#!/bin/bash

# Survey questions

# first question
echo "In which month were you born?"
read BIRTHMONTH
# second question
echo "How many languages can you speak?"
read LANGNUMBER
# third question
echo "In which country were you born?"
read BIRTHCOUNTRY
# fourth question
echo "What is your middle initial? If not applicable, write 'N/A'"
read MIDINITIAL
# fifth question
echo "What language would you like to learn?"
read LANGWANT
# add a variable for the time
TIMESTAMP=`date --iso-8601=seconds`
# create unique identifier
IDENTIFIER=`echo "$RANDOM$RANDOM$RANDOM"`
# write data to csv file
echo "$IDENTIFIER,$TIMESTAMP,$BIRTHMONTH,$LANGNUMBER,$BIRTHCOUNTRY,$MIDINITIAL,$LANGWANT" >> ./data.csv
# read out data in csv file 
cat data.csv  
# write data to database--remove later
# bash ./write-to-db.sh
# write to database 
mysql -u root -p"root" -e "LOAD DATA INFILE 'task4-data/data.csv' INTO TABLE tblsurvey IN task4 FIELDS TERMINATED BY ',' OPTIONALLY ENCLOSED BY '"'"
# mysqldump -u root -p"root" task4 > task4.sql
