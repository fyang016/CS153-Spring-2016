
#include "types.h"
#include "user.h"
#include "semaphore.h"

struct semaphore wait_tree;
struct semaphore printer;
struct semaphore printer_mutex1;
struct semaphore printer_mutex2;
struct semaphore mutex;
struct semaphore monkey_lock;

int monkeys_on_tree = 0;
int number_of_monkeys = 10;
int dominant_monkey_position = 4; // witch monkey is dominant
int dominant_present = 0; // Tracks when dominant becomes present

void monkey();
void dominant_monkey();
void releaseMonkeys();
void printMessage(int, int, int);

int main(int argc, char *argv[])
{
	sem_init(&wait_tree, 3);
  sem_init(&printer, 1);
  sem_init(&printer_mutex1, 1);
  sem_init(&printer_mutex2, 1);
  sem_init(&mutex, 1);
  sem_init_full(&monkey_lock, (number_of_monkeys - 1));
	

  printf(1,"Creating %d Monkeys\n\n", number_of_monkeys);

	int i;
	for(i = 0; i < number_of_monkeys; i++){
    if(i != dominant_monkey_position) thread_create(monkey, 0);
    else thread_create(dominant_monkey, 0); //create dominant monkey
  }
  while(wait() > 0);
	printf(1,"All monkeys are full\n");
	exit();
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){

  int pid =  getpid();

  sem_aquire(&printer_mutex1);
  printMessage(pid, 1, 0);


  sem_signal(&printer_mutex1); 

  if(dominant_present) sem_aquire(&monkey_lock);

  sem_aquire(&printer_mutex1);
  sem_aquire(&wait_tree);

  sem_aquire(&mutex);
  monkeys_on_tree++;
  printMessage(pid, 2, 0); 
  sem_signal(&mutex); 

  sem_signal(&printer_mutex1); 

  sleep(100);   // Get coconut


  sem_aquire(&mutex);
  printMessage(pid, 6, 0); // Got a coconut
  sem_signal(&mutex); 

  //printMessage(pid, 3, 0); //Climbing down tree

  sem_aquire(&printer_mutex2);
  //printMessage(pid, 5, 0); // On the ground

  sem_signal(&wait_tree);


  sem_signal(&printer_mutex2); 

  sem_aquire(&mutex);
  monkeys_on_tree--;
  printMessage(pid, 3, 0); // Eating Banana
  sem_signal(&mutex); 
  

  texit();
}

//Oxyegn waits untill there are two hydrogens
void 
dominant_monkey(){

  int pid =  getpid();

  sem_aquire(&printer);
  dominant_present = 1; //Make his presence known
  printf(1,"Dominant monkey present!!!\n");
  sem_signal(&printer);

  //while(monkeys_on_tree);
  sem_aquire(&printer_mutex1);

  printMessage(pid, 1, 1);
  sem_aquire(&wait_tree);

  sem_aquire(&mutex);
  monkeys_on_tree++;
  sem_signal(&mutex); 

  printMessage(pid, 2, 1); 
  sem_signal(&printer_mutex1); 

  sleep(100);   // Get coconut

  sem_aquire(&mutex);
  printMessage(pid, 6, 1); // Got a coconut
  sem_signal(&mutex); 

  //printMessage(pid, 3, 1); //Climbing down tree

  sem_aquire(&printer_mutex2);
  //printMessage(pid, 5, 1); // On the ground

  sem_signal(&wait_tree);


  sem_signal(&printer_mutex2); 

  sem_aquire(&mutex);
  monkeys_on_tree--;
  printMessage(pid, 3, 1); // Eating Banana
  sem_signal(&mutex); 
  
  releaseMonkeys();

  texit();
}

void releaseMonkeys(){
  int i;
  for(i = 0; i < number_of_monkeys - 1; i++){
    sem_signal(&monkey_lock);
  }
}

void printMessage(int pid, int state, int dominance){
  sem_aquire(&printer);
  if(!dominance)  printf(1, "Monkey    (%d)",pid);
  else            printf(1, "Dominance (%d)",pid);

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

  printf(1, " - Monkeys on tree: %d\n", monkeys_on_tree); 
  sem_signal(&printer);
  
}