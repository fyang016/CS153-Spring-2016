#include "types.h"
#include "user.h"

int main(int argc, char *argv[])
{
	printf(1,"Hello my name is'%s'\n", argv[0]);
	printf(1,"Creating Child Process\n");
	int pid = fork(); //Create a child Process
	//int * status;
	if(pid == 0){
		printf(1, "I'm the child going to sleep\n");
		sleep(300);
		printf(1, "Child Process finished\n");
	}
	else{
		printf(1, "I'm the parent waiting on child\n");
		printf(1, "Result %d\n", wait(0));
		printf(1, "Parent Process Has finished\n");
	}
	exit(0);
}
