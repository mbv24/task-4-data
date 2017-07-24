#!/bin/bash

sudo cp ./data.csv /var/lib/mysql-files/
mysql -u root -p"root" -e "USE task4; LOAD DATA INFILE '/var/lib/mysql-files/data.csv' INTO TABLE tblsurvey FIELDS TERMINATED BY ',' "
mysqldump -u root -p"root" task4 > `date --iso`-task-4-data.sql
# CREATE TABLE tblsurvey (ID INT, Timestamp VARCHAR(255), BirthMonth VARCHAR(255), LanguagesSpoken INT, BirthCountry VARCHAR(255), MiddleInitial VARCHAR(255), DesiredLanguage VARCHAR(255));