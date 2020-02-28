#!/bin/dash

#By Jonathan Williams (z5162987) - July 2019

#test all the different status

echo a1>a
echo b1>b
echo c1>c
echo d1>d

./legit-init
./legit-add a b c
./legit-commit -m msg
#status are all same as repo
./legit-status
#a will be file changed, changes not staged for commit
echo a2>>a
#b will be file changed, changes staged for commit
echo b2>>b
./legit-add b
#c will be file changed, different changes staged for commit
echo c2>>c
./legit-add c
echo c3>>c
#d will be added to index
./legit-add d
./legit-status
./legit-commit -m msg
echo ""
#a will be file deleted
rm a
#b will be deleted
./legit-rm b
#c will be untracked
./legit-rm --cached c
#e will be untracked
echo e1>e
./legit-status
echo ""
./legit-commit -m msg
#b will be omitted
./legit-status
rm -r ".legit"

