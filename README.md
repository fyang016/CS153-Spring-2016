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
RUN THIS FIRST

make qemu-nox-gdb

THEN RUN THIS ON A SEPARATE TERMINAL IN IDENTICAL FOLDER

gdb -q -iex "set auto-load safe-path /home/csmajs/fyang016/CS153/CS153-Spring-2016/xv6-master"

## If you are having issues connecting to GDB
make clean
make qemu-nox-gdb

## If you get the error:
## No symbol table is loaded. Use the "file" command.
##in GDB type the fallowing:
targer remote :26312
## check to make sure the port is correct. this is given by the output
## on the GDB Server your create

