#include "types.h"
#include "user.h"
#include "semaphore.h"

int oNum = 50;
int hNum = 50;

struct semaphore wait_o;
struct semaphore wait_h;

void hReady();
void oReady();

int
main(int argc, char *argv[])
{
	sem_init(&wait_o, oNum);  //Initialize semaphore with 5 slots
	sem_init(&wait_h, hNum); //Initialize semaphore with 10 slots
	
	int i;
	for(i = 0; i < 5; i++) thread_create(oReady, 0);
	for(i = 0; i < 10; i++) thread_create(hReady, 0);
    while(wait()>0);
	printf(1,"Balanced Reaction\n");
	exit();
}

void hReady(){
  	printf(1, "H\n");  	
	sem_signal(&wait_h);
	sem_aquire(&wait_o);
	texit();
}

//Oxyegn waits untill there are two hydrogens
void oReady(){
  printf(1, "O\n");
  sem_aquire(&wait_h);
  	printf(1, "H-O %d %d\n", wait_h.count, wait_o.count);  
  sem_aquire(&wait_h);
  	printf(1, "H-O %d %d\n", wait_h.count, wait_o.count);  
  sem_signal(&wait_o);
  sem_signal(&wait_o);
  	printf(1, "H-O-H %d %d\n", wait_h.count, wait_o.count);  
  texit();
}
