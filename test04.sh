#!/bin/dash

#By Jonathan Williams (z5162987) - July 2019

#test rm errors
#bring back removed file

./legit-init
echo 1a>a
./legit-add a
./legit-commit -m "first: a"
echo 2a>>a
#error 1
./legit-rm a

./legit-add a
#error 2
./legit-rm a

echo 3a>>a
#error 3
./legit-rm a
./legit-commit -a -m "second: changed a"
#success:
./legit-rm a
echo ""
./legit-status
echo ""
./legit-commit -m "third:removed a"
#a no longer here
echo ""
./legit-status
echo ""
#bring back a:
./legit-show 1:a > a
./legit-add a
./legit-commit -m "fourth a is back"
./legit-show :a
./legit status

rm -r ".legit"

