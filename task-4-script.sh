#!/bin/bash

touch survey.csv
echo "Question 1"
read VAR1
echo "Question 2"
read VAR2
echo "Question 3"
read VAR3
echo "Question 4"
read VAR4
echo "Question 5"
read VAR5
TIMESTAMP='date --iso-8601=seconds'
echo "$TIMESTAMP,$VAR1,$VAR2,$VAR3,$VAR4,$VAR5"
