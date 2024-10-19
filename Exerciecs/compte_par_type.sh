#!/bin/bash
read -p "enter year from 2016 to 2018: " YEAR
read -p "enter the type annotation u want to count: " TYPE
path=$HOME/Desktop/Exercice1/ann/$YEAR
grep $TYPE $path/*.ann | wc -l
