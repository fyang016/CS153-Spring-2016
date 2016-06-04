#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
	s->size = size;
	s->count= 0;
	lock_init(&s->lock); //implicid declaration???
}

//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
	if(s->count  == 0){
		//add proc to waiters list
		int tid = getpid();
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
		tsleep(); 
	}
	else{
		s->count--;	
		lock_release(&s->lock);
	}
}

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
	if(s->count < s->size){
		int tid;
		tid = pop_q(&s->waiters);
		if(tid != -1) twakeup(tid);
		else s->count++;	
		lock_release(&s->lock);
	}
	else{
		int tid;
		tid = pop_q(&s->waiters);
		twakeup(tid);
		lock_release(&s->lock);
	}

}