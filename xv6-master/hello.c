#include "types.h"
#include "user.h"

int main(int argc, char *argv[])
{
	printf(1,"Hello my name is'%s'\n", argv[0]);
	printf(1,"Creating Child Process");
	int pid = fork(); //Create a child Process
	if(pid == 0){
		printf(1, "Waiting on child");
		wait(0);
		printf(1, "Child Process finished");
	}
	else{
		printf(1, "I'm Child going to sleep for a little");
		sleep(3000);
		printf(1, "Done Sleeping goodbye");
	}
	exit(0);
}
