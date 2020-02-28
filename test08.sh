#!/bin/dash

#By Jonathan Williams (z5162987) - July 2019

#test rm force on files in the repo

echo a1>a
echo b1>b
echo c1>c
./legit-init
./legit-add a b c
./legit-commit -m msg

#a: error "repository is different to working file"
echo a2>>a
./legit-rm a
#b: error "has changes staged in the index"
echo b2>>b
./legit-add b
./legit-rm b
#c: error "in index is different to both working file and repository"
echo c2>>c
./legit-add c
echo c3>>c
./legit-rm c
#force remove files
./legit-rm --force a b c
#a,b,c should be deleted
./legit-status
echo ""
#force remove them again wont work
./legit-rm --force a b c
#a,b,c should be gone after commit
./legit-commit -m msg
./legit-status

rm -r ".legit"
