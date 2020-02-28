#!/bin/dash

#By Jonathan Williams (z5162987) - July 2019

#no legit repo errors
./legit-add
./legit-commit
./legit-commit -m msg
./legit-log
./legit-show 
./legit-show :c
./legit-status
./legit-rm

./legit-init
./legit-init

#no commits yet errors
./legit-log
./legit-commit
./legit-show 1:a
./legit-status
./legit-rm


