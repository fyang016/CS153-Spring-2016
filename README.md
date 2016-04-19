# CS153
## How to commit to repo
git pull

git add *

git commit -m “message”

git remote set-url origin https://fyang016@github.com/fyang016/CS153-Spring-2016.git

unset SSH_ASKPASS

git push

Fix errors marco mentioned

##Potential errors?
defs.h: Line ~107 exit(int) 

##Need to Fix/Change (may or may not highlight actual problems with code)
-Invalid commands cause crashes
-Status variables don't have much significance

## gdb
gdb -q -iex "/home/csmajs/fyang016/CS153/CS153-Spring-2016/xv6-master"
