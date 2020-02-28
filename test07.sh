#!/bin/dash

#By Jonathan Williams (z5162987) - July 2019

#test rm force on files not committed to repo
echo a1>a
echo b1>b
echo c1>c
./legit-init
./legit-add c
./legit-commit -m msg

./legit-add a b
#a is "in index is different to both working file and repository"
echo a2>>a
./legit-rm a
#b "has changes staged in the index"
./legit-rm b
./legit-status
echo ""
#rm a and b by force
./legit-rm --force a
./legit-rm --force b
#force remmoving twice should cause error:
./legit-rm --force b
./legit-status
#nothing to commit since no changes made to tracked files
./legit-commit -m msg

rm -r ".legit"
