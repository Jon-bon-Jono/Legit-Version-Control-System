# Legit-Version-Control-System
Implementing a subset of the version control system Git, written in Shell Script

Usage:
1. legit-init -- creates an empty Legit repository
1. legit-add filenames -- adds the contents of one or more files to the "index"
1. legit-commit -m message -- saves a copy of all files in the index to the repository  
1. legit-commit [-a] -m message -- option which causes all files already in the index to have their contents from the current directory added to the index before the commit
1. legit-log -- prints one line for every commit that has been made to the repository (commit number & commit message)
1. legit-show commit:filename -- print the contents of the specified file as of the specified commit, if the commit is omitted the contents of the file in the index should be printed
1. legit-status -- shows the status of files in the current directory, index, and repository
