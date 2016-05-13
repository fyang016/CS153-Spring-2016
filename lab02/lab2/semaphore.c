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
sem_aquire(semaphore * s){

}

//Removes a process from a lock and decreases counter
//to indicate that more process can hold the lock.
void
sem_signal(semaphore * s){

}