#include "queue.h"

struct semaphore{
	// Initialize the counter with the semaphore size
	// Initialize the queues with init_q(queue)
    lock_t lock;
	int count; //Initialize with size
	int size;
	struct queue waiters; //How many waiters can we have (PID)
	struct queue holders; //How many holders can we have (PID)
};

void sem_init(struct semaphore *, int size);
void sem_aquire(struct semaphore *);
void sem_signal(struct semaphore *);

