#!/bin/bash

# first survey question
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
# move csv file to /var/lib/mysqlfiles/
sudo cp ./data.csv /var/lib/mysql-files/
# write csv file to database
mysql -u root -p"root" -e "USE task4; LOAD DATA INFILE '/var/lib/mysql-files/data.csv' INTO TABLE tblsurvey FIELDS TERMINATED BY ',' "
# create sql file of database
mysqldump -u root -p"root" task4 > `date --iso`-task-4-data.sql
