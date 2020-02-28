#!/bin/dash

#By Jonathan Williams (z5162987) - July 2019


echo 1a>a
echo 1b>b
echo 1c>c
./legit-init
./legit-add a b c
./legit-commit -m "first: a,b,c"
echo 2a>>a
./legit-add a b
#should commit new changes made to a, do nothing about b, and c should still be in the new commit file
./legit-commit -m "second: a changed"
./legit-show 1:c

#nothing to commit:
./legit-commit -a -m "wont work"
#a is same as repo:
./legit-status
rm a
#nothing to commit after manually removing a file
./legit-commit -m "wont work"
#will work if we make changes to tracked files
echo 2b>>b
./legit-add b
./legit-commit -m "third: b changed, a deleted"
#a is deleted
echo ""
./legit-status
#a si gone, can't rm --cached it
./legit-rm --cached a
#incorrect behaviour: can't rm it either
./legit-rm a
./legit-commit -m "wont work"
#but we can recover a:
./legit-show 2:a > a
echo 3b>>b
./legit-add a b
./legit-commit -m "fifth: yay a is back"
./legit-show :a
echo ""
./legit-status

rm -r ".legit"
