
#include "types.h"
#include "user.h"
#include "semaphore.h"

struct semaphore wait_tree;
struct semaphore printer;
struct semaphore printer_mutex1;
struct semaphore printer_mutex2;
struct semaphore mutex;

int monkeys_on_tree = 0;

void monkey();
void printMessage(int, int);

int main(int argc, char *argv[])
{
	sem_init(&wait_tree, 3);
  sem_init(&printer, 1);
  sem_init(&printer_mutex1, 1);
  sem_init(&printer_mutex2, 1);
  sem_init(&mutex, 1);
	
	int i;
	for(i = 0; i < 5; i++) thread_create(monkey, 0);
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

  sem_aquire(&mutex);
  monkeys_on_tree++;
  sem_signal(&mutex); 

  printMessage(pid, 2); 
  sem_signal(&printer_mutex1); 

  sleep(100);   // Get coconut

  printMessage(pid, 6); // Got a coconut

  //printMessage(pid, 3); //Climbing down tree

  sem_aquire(&printer_mutex2);
  //printMessage(pid, 5); // On the ground

  sem_signal(&wait_tree);


  sem_signal(&printer_mutex2); 
  
  sem_aquire(&mutex);
  monkeys_on_tree--;
  sem_signal(&mutex); 
  
  printMessage(pid, 3); // Eating Banana

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
      printf(1, " Climbing the  tree", state); 
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
  printf(1, " - Monkeys on tree: %d\n", monkeys_on_tree);  
  sem_signal(&printer);
  
}