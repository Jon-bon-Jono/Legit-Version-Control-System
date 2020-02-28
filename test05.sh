#!/bin/dash

#By Jonathan Williams (z5162987) - July 2019

#rm cached errors

echo a1>a
./legit-init
./legit-add a
#no commits yet so error:
./legit-rm --cached a
./legit-commit -m "first: a"
echo a2>>a
./legit-add a
echo a3>>a
#diff to index and repo so error:
./legit-rm --cached a
./legit-rm --force --cached a
./legit-commit -m "second: removed a"
#changes made to a shouldn't be in repo
./legit-show 0:a
./legit-show 1:a


rm -r ".legit"
