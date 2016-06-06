
#include "types.h"
#include "user.h"
#include "semaphore.h"

struct semaphore wait_tree;
struct semaphore mutex1;
struct semaphore mutex2;
struct semaphore mutex3;
struct semaphore climb;
struct semaphore printer;
struct semaphore printer_mutex1;
struct semaphore printer_mutex2;

int movingup = 0;
int movingdown = 0;
int monkeys_on_tree = 0;

void monkey();
void printMessage(int, int);

int main(int argc, char *argv[])
{
	sem_init(&wait_tree, 3);
	sem_init(&mutex1, 1);
  sem_init(&mutex2, 1);
  sem_init(&mutex3, 1);
  sem_init(&climb, 1);
  sem_init(&printer, 1);
  sem_init(&printer_mutex1, 1);
  sem_init(&printer_mutex2, 1);
	
	int i;

	for(i = 0; i < 10; i++) thread_create(monkey, 0);
    while(wait() > 0);
	printf(1,"All monkeys are full\n");
	exit();
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
  int pid =  getpid();

  sem_aquire(&printer_mutex1);
  printMessage(pid, 1);
  sem_aquire(&wait_tree);

  //climb_tree
  sem_aquire(&mutex1);
  movingup++;
  if(movingup==1)	sem_aquire(&climb);
  sem_signal(&mutex1);

  sem_aquire(&mutex3);
  monkeys_on_tree++;
  sem_signal(&mutex3); 

  printMessage(pid, 2); 
  sem_signal(&printer_mutex1); 

  // Get coconut
  sleep(100); 

  printMessage(pid, 6); // Got a coconut

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

  //printMessage(pid, 3); //Climbing down tree
  // Climb Down


  sem_aquire(&printer_mutex2);
  //printMessage(pid, 5); // On the ground


  sem_aquire(&mutex2);
  movingdown--;

  sem_aquire(&mutex3);
  monkeys_on_tree--;
  sem_signal(&mutex3); 

  printMessage(pid, 3); // Eating Banana
  if(movingdown == 0) sem_signal(&climb);
  sem_signal(&mutex2);

  sem_signal(&wait_tree);
  sem_signal(&printer_mutex2); 
  texit();
}

void printMessage(int pid, int state){
  sem_aquire(&printer);
  printf(1, "Monkey(%d)",pid);
  //printf(1, " - %d", state); 
  switch(state){
    case(1):
      printf(1, " Waiting  to  climb", state); 
      break;
    case(2):
      printf(1, " Climbing  up  tree", state); 
      break;
    case(3):
      printf(1, " Climbing down tree", state); 
      break;
    case(4):
      printf(1, " Eating the  banana", state); 
      break;
    case(5):
      printf(1, " On the ground safe", state); 
      break;
    case(6):
      printf(1, " Alright a  coconut", state); 
      break;
  }
  printf(1, " - Monkeys on tree: %d", monkeys_on_tree);  
  printf(1, " - movingup: %d", movingup);   
  printf(1, " - movingdown: %d\n", movingdown);  
  sem_signal(&printer);
  
}