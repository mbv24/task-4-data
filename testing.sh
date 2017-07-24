#!/bin/bash

sudo cp ./data.csv /var/lib/mysql-files/
mysql -u root -p"root" -e "USE task4; LOAD DATA INFILE '/var/lib/mysql-files/data.csv' INTO TABLE tblsurvey FIELDS TERMINATED BY ',' "
mysqldump -u root -p"root" task4 > `date --iso`-task-4-data.sql