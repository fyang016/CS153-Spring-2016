#include "types.h"
#include "user.h"
#include "semaphore.h"

int missionaries = 5;
int cannibals = 6;
int bp = 0;
int total = 0;
int con = 0;

struct semaphore boat;
struct semaphore display;
struct semaphore cann;
struct semaphore loading;
struct semaphore mutex;
struct semaphore mutex2;
struct semaphore prevention;

void MissionaryArrives();
void CannibalArrives();
void RowBoat();

int
main(int argc, char *argv[])
{
	sem_init(&boat, 3);
	
	sem_init(&display, 1);
	sem_init(&cann, 3);
	sem_init_full(&loading, 3);
	
	sem_signal(&loading);
	sem_signal(&loading);
	sem_signal(&loading);
	
	sem_init(&mutex, 1);
	sem_init(&mutex2, 1);
	sem_init_full(&prevention, 1);

	int i;
	int population = 12;
	 
	
	for(i = 0; i < population; i++)
	{
		if(random(3)) thread_create(MissionaryArrives, 0);
		else thread_create(CannibalArrives, 0);
	
	}
	// for(i = 0; i < 3; i++) thread_create(MissionaryArrives, 0);
	// for(i = 0; i < 4; i++) thread_create(CannibalArrives, 0);
	
	while(wait() > 0);
	printf(1, "done moving\n");


	exit();
}

void MissionaryArrives()
{
	sem_aquire(&boat);
	
	sem_aquire(&display);
	printf(1, "1: (%d) missionary arrived, %d, %d\n", getpid(), total, con);
	sem_signal(&display);


	sem_aquire(&mutex2);	
	while(total + 1 == 5){ con++;
	sem_signal(&mutex2);
	sem_signal(&boat);

	sem_aquire(&display);
	printf(1, "1: (%d) missionary denied boarding, %d, %d\n", getpid(), total, con);
	sem_signal(&display);

	sem_aquire(&prevention);

	sem_aquire(&display);
	printf(1, "1: (%d) missionary prevented death, %d, %d\n", getpid(), total, con);
	sem_signal(&display);
	
	sem_aquire(&boat);
	sem_aquire(&mutex2);
	}
	sem_signal(&mutex2);
	sem_aquire(&mutex2);
	total += 1;
	sem_signal(&mutex2);
	
	sem_aquire(&display);
	printf(1, "2: (%d) missionary enters boat, %d, %d\n", getpid(), total, con);
	sem_signal(&display);

	sem_aquire(&mutex);
	bp++;
	sem_signal(&mutex);
	if (bp < 3)	sem_aquire(&loading);

	// sem_aquire(&display);
	// printf(1, "bp missionary: %d\n", bp);
	// sem_signal(&display);
	
	RowBoat();
	sem_signal(&loading);
	
	
	texit();
}

void CannibalArrives()
{
	sem_aquire(&boat);
	
	sem_aquire(&display);
	printf(1, "1: (%d) cannibal arrived, %d, %d\n", getpid(), total, con);
	sem_signal(&display);	


	sem_aquire(&mutex2);
	while(total + 2 == 5) { con++;
	sem_signal(&mutex2);
	sem_signal(&boat);
	
	sem_aquire(&display);
	printf(1, "1: (%d) cannibal denied boarding, %d, %d\n", getpid(), total, con);
	sem_signal(&display);

	sem_aquire(&prevention);

	sem_aquire(&display);
	printf(1, "1: (%d) cannibal prevented meal, %d, %d\n", getpid(), total, con);
	sem_signal(&display);

	
	sem_aquire(&boat);
	sem_aquire(&mutex2);
	}
	sem_signal(&mutex2);
	sem_aquire(&mutex2);
	total += 2;
	sem_signal(&mutex2);
	
	sem_aquire(&display);
	printf(1, "2: (%d) cannibal enters boat, %d, %d\n", getpid(), total, con);
	sem_signal(&display);	
	
	sem_aquire(&mutex);
	bp++;
	sem_signal(&mutex);
	if (bp < 3)	sem_aquire(&loading);
	
	
	
	// sem_aquire(&display);
	// printf(1, "bp cannibal: %d\n", bp);
	// sem_signal(&display);
	
	RowBoat();
	sem_signal(&loading);

	
	texit();
}

void RowBoat()
{

	// sending boat off
	sem_aquire(&mutex);
	
	if(bp == 3){
	sem_aquire(&display);
	printf(1, "(%d) RowBoat\n", getpid());
	sem_signal(&display);
	sem_signal(&boat);
	sem_signal(&boat);
	sem_signal(&boat);
	bp = 0;
	sem_aquire(&display);
	printf(1, "(%d) sending boat off. bon voyage! %d, %d\n", getpid(), total, con);	
	sem_signal(&display);
	int j = 0;
	for (j = 0; j < con; ++j) sem_signal(&prevention);
	con = 0;
	total = 0;
	}
	sem_signal(&mutex);
}