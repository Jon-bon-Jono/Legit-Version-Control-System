#!/bin/dash

#By Jonathan Williams (z5162987) - July 2019

echo a>a
echo b>b
echo c>c
./legit-init
./legit-add a
./legit-commit -m "first: a"
./legit-add b
./legit-commit -m "second: b"
echo "commit 0 a:"
./legit-show 0:a
echo "commit 1 a:"
./legit-show 1:a
echo "commit 0 b, fails:"
./legit-show 0:b
echo "commit 1 b"
./legit-show 1:b
echo "most recent version of b"
./legit-show :b
echo b>>b
echo "still shows b from commit 1"
./legit-show :b
./legit-add a b
echo "should show the indexed changed b"
./legit-show :b
echo a>>a
./legit-add a
echo "shows the indexed changed a"
./legit-show :a
./legit-commit -m "third: a and b changed"
echo "commiting with -a after no changes made:"
./legit-commit -a -m "commit 2: nothing changed"
./legit-log

rm -r .legit

