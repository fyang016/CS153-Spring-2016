
#include "types.h"
#include "user.h"
#include "semaphore.h"

struct semaphore wait_tree;
struct semaphore mutex1;
struct semaphore mutex2;
struct semaphore climb;

int movingup = 0;
int movingdown = 0;

void monkey();
void printMessage(int, int);

int main(int argc, char *argv[])
{
	sem_init(&wait_tree, 3);  //Initialize semaphore with 5
	sem_init(&mutex1, 1);  //Initialize semaphore with 5
	sem_init(&mutex2, 1);  //Initialize semaphore with 5
	sem_init(&climb, 1);  //Initialize semaphore with 5 slots
	
	int i;
	sem_signal(&wait_tree);
	sem_signal(&wait_tree);
	sem_signal(&wait_tree);

	sem_signal(&mutex1);
	sem_signal(&mutex2);
	sem_signal(&climb);

  	printf(1, "\n\nFirst # is the PID\n");
  	printf(1, "\nSecond # is waiting state\n");
  	printf(1, "1 - waiting to climb tree\n");
  	printf(1, "2 - climbing tree\n");
  	printf(1, "3 - Found a banana climbing down\n");
  	printf(1, "4 - Eating banana\n\n");
  	printf(1, "Third # is monkeys on tree\n");
  	printf(1, "*abreviations\n");
  	printf(1, "Sem A - Semaphore Aquired\n");
  	printf(1, "Sem R - Sempahore Released\n");
  	printf(1, "Sem F - Sempahore Full\n\n");
	for(i = 0; i < 5; i++) thread_create(monkey, 0);
    while(wait() > 0);
	printf(1,"All monkeys are full\n");
	exit();
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
  int pid =  getpid();

  printMessage(pid, 1);
  sem_aquire(&wait_tree);

  printMessage(pid, 2);  
  //climb_tree
  sem_aquire(&mutex1);
  movingup++;
  if(movingup==1)	sem_aquire(&climb);
  sem_signal(&mutex1);

  // Get coconut
  sleep(3); 

  //got coconut
  sem_aquire(&mutex1);
  movingup--;
  if(movingup==0)	sem_signal(&climb);
  sem_signal(&mutex1);

  // Climb Down
  sem_aquire(&mutex2);
  movingdown++;
  if(movingdown == 1)	sem_aquire(&climb);
  sem_signal(&mutex2);

  printMessage(pid, 3);
  // Climb Down
  sem_aquire(&mutex2);
  movingdown--;
  if(movingdown == 0)	sem_signal(&climb);
  sem_signal(&mutex2);

  sem_signal(&wait_tree);
  printMessage(pid, 4);
  texit();
}

void printMessage(int pid, int state){
  printf(1, "%d",pid);
  printf(1, " - %d", state); 
  printf(1, " - %d\n", 3 - wait_tree.count);  
  
}