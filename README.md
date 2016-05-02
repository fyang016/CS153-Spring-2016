# [CS153](http://www.cs.ucr.edu/~nael/cs153/index.html) - [Links](https://docs.google.com/document/d/18VAV-ve-HDO7JwX-s9P8zsvN0U2BrPcgXWFgazupUTk/edit?usp=sharing) - [JSW](https://github.com/jinsongwei/xv6-public)

#[Lab 0](http://www.cs.ucr.edu/~nael/cs153/labs/lab0.html) - [Lab 1](http://www.cs.ucr.edu/~nael/cs153/labs/lab1.html) - [Lab 2](http://www.cs.ucr.edu/~nael/cs153/labs/lab2.html)

#[HW1](http://www.cs.ucr.edu/~nael/cs153/resources/hw1.pdf) - [HW1K](http://www.cs.ucr.edu/~nael/cs153/resources/hw1-key.txt)  - [HW2](http://www.cs.ucr.edu/~nael/cs153/resources/hw2.pdf) - [HW3](http://www.cs.ucr.edu/~nael/cs153/resources/hw3.pdf)
Welcome!
## How to commit to repo
git pull

git add *

git commit -m “message”

git remote set-url origin https://fyang016@github.com/fyang016/CS153-Spring-2016.git

unset SSH_ASKPASS

git push

Fix errors marco mentioned

##Need to Fix/Change (may or may not highlight actual problems with code)
-wait_one

##Troubleshooting
### Running gdb with xv6
RUN THIS FIRST

make qemu-nox-gdb

THEN RUN THIS ON A SEPARATE TERMINAL IN IDENTICAL FOLDER

gdb -q -iex "set auto-load safe-path /home/csmajs/fyang016/CS153/CS153-Spring-2016/xv6-master"

### If you are having issues connecting to GDB
make clean

make qemu-nox-gdb

### If you get the error:
No symbol table is loaded. Use the "file" command.

in GDB type the following:
target remote :26312

check to make sure the port is correct. this is given by the output on the GDB Server you create

## Important things to note
Dealing with “non-fast-forward” errors

From time to time you may encounter this error while pushing:
$ git push origin master
To ../remote/
 ! [rejected]        master -> master (non-fast forward)
error: failed to push some refs to '../remote/'
To prevent you from losing history, non-fast-forward updates were rejected
Merge the remote changes before pushing again.  See the 'non-fast forward'
section of 'git push --help' for details.
This error can be a bit overwhelming at first, do not fear.
Simply put, git cannot make the change on the remote without losing commits, so it refuses the push. Usually this is caused by another user pushing to the same branch.
You can remedy this by fetching and merging the remote branch, or using pull to perform both at once.

In other cases this error is a result of destructive changes made locally by using commands like git commit --amend or git rebase.

=======
While you can override the remote by adding --force to the push command, you should only do so if you are absolutely certain this is what you want to do. Force-pushes can cause issues for other users that have fetched the remote branch, and is considered bad practice. When in doubt, don’t force-push.
>>>>>>> wait


##Pulling from another branch
"git checkout \<commit_hash\> \<relative_path_to_file_r_dir\>"

"git checkout \<remote_name\> \<file_or_dir\>"
