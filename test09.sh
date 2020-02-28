#!/bin/dash

#By Jonathan Williams (z5162987) - July 2019

#exploiting issues with show :filename after a file has been rm --cached 

echo a1>a
echo b1>b
./legit-init
./legit-add a b
./legit-commit -m msg

echo a2>>a
./legit-commit -a -m msg

echo "important change">>a
./legit-add a
./legit-show :a
echo ""
echo "another important change">>a
#incorrect out, should show a with another important change:
./legit-show :a
echo ""
#wont lose these important changes
./legit-rm --cached a
#unless we use force
./legit-rm --cached --force a
./legit-commit -m ":("
#bring back latest version in repo
#incorrect out, gives us an error
./legit-show :a
./legit-show 0:a > a
echo b1>b
./legit-add b
./legit-commit -m msg
./legit-add a
./legit-commit -m msg
./legit-status

rm -r ".legit"
