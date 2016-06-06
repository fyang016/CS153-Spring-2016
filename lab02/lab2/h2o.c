#include "types.h"
#include "user.h"
#include "semaphore.h"

int oNum = 50;
int hNum = 50;
int molecules;

struct semaphore wait_o;
struct semaphore wait_h;
struct semaphore printer;

void hReady();
void oReady();

int
main(int argc, char *argv[])
{
	sem_init_full(&wait_o, oNum);  //Initialize semaphore with 5 slots
	sem_init_full(&wait_h, hNum); //Initialize semaphore with 10 slots
	sem_init(&printer, 1);
	

	int i;
	int molecule_length = 15;
	for(i = 0; i < molecule_length; i++){
		int r = random(2);
		if(r) thread_create(oReady, 0);
		else thread_create(hReady, 0);
	}

	//for(i = 0; i < 5; i++) thread_create(oReady, 0);
	//for(i = 0; i < 10; i++) thread_create(hReady, 0);
    while(wait()>0);
	printf(1,"Balanced Reaction\n");
	exit();
}

void hReady(){
	sem_aquire(&printer);
  	printf(1, "Hydrogen(%d) Ready\n", getpid());  	
  	sem_signal(&printer);

	sem_signal(&wait_h);
	sem_aquire(&wait_o);
	sem_aquire(&printer);
  	printf(1, "Hydrogen(%d) Bonded with Oxygen Ready\n", getpid());  	
  	sem_signal(&printer);
	texit();
}

//Oxyegn waits untill there are two hydrogens
void oReady(){
	sem_aquire(&printer);
	printf(1, "Oxygen(%d) Ready\n", getpid());  	
	sem_signal(&printer);

  	sem_aquire(&wait_h);
	sem_aquire(&printer);
  	printf(1, "Oxygen(%d) bonded with Hydrogen Ready\n", getpid());  	
  	sem_signal(&printer);
  	sem_aquire(&wait_h); 
	sem_aquire(&printer);
  	printf(1, "Oxygen(%d) bonded with Hydrogen Ready\n", getpid());  	
  	sem_signal(&printer);
  	sem_signal(&wait_o);
  	sem_signal(&wait_o);

	sem_aquire(&printer);
	molecules++;
	printf(1, "Water Molecule %d\n", molecules);  	
	sem_signal(&printer); 
  texit();
}
