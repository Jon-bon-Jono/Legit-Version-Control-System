#!/bin/dash

#By Jonathan Williams (z5162987) - July 2019
#testing commit usage
./legit-init
echo a>a
#add usage:
./legit-add
./legit-add a
#errors:
./legit-commit 
./legit-commit msg
./legit-commit -m
./legit-commit -m -m
./legit-commit msg -m
./legit-commit -a -m -a
./legit-commit -m -a msg
./legit-commit msg -a -m
#works:
./legit-commit -m msg
echo a>>a
./legit-add a
./legit-commit -a -m msg
echo a>>a
./legit-add a
./legit-commit -m msg -a
#testting show usage
./legit-show 123,123
#testing rm usage
./legit-rm
./legit-rm --force
#incorrect output, legit-rm treats the last argument as a filename:
./legit-rm --cached
./legit-rm --cached --force

rm -r .legit
