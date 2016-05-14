

#include "types.h"
#include "defs.h"
#include "param.h"
#include "x86.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"
#include "semaphore.h"


//Attempts to aquire a lock. If counter is not
//full then we will add the process to the list of
//processes holding the lock.
void
sem_aquire(struct Semaphore * s){
	//Disable interrupts? nah
	//If counter is full then place proccess on waiting list
	if(s->counter <= 0){
		//add proc to waiting list
		yield();
		//thread_yield();
	}
	else{
		//decrement counter?
		s->counter--;	

		//Add proc to holders list
	}
}

//Removes a process from a lock and decreases counter
//to indicate that more process can hold the lock.
void
sem_signal(struct Semaphore * s){
	//If counter is full then place proccess on waiting list
	if(s->counter < s->size){
		s->counter++;	
	}
	else{
		//this area should nto be reached
		panic("sem_signal overaquired?")
	}

}