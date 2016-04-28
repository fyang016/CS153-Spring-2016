#include "types.h"
#include "x86.h"
#include "defs.h"
#include "param.h"
#include "memlayout.h"
#include "mmu.h"
#include "proc.h"

int
sys_fork(void)
{
  return fork();
}

int
sys_exit(void)
{
  int tmp;
  argint(0, &tmp);
  exit(tmp);
  return 0;  // not reached
}

int
sys_wait(void)
{
  int size = 4;
  int val;
  int * value = &val;
  //char ** aChar;
  //if(argptr(0, aChar, size) < 0 )
  if(argptr(0, (char**) value, size) < 0)
    return -1;
  //int* status = (int*)(&aChar);
  int* status = (int*)(&value);
  return wait(status);

}

int
sys_waitpid(void)
{
	int pid;
	argptr(0,(char**) &pid, 4); //Read PID variable from stack 4 bytes = int
	int *status;
	argptr(1,(char**) &status, 4); //Get reference to Status 
	int options;
	argptr(2, (char**) &options, 4);

	return waitpid(pid, status, options);

	//int stuff;
	//return waitpid(0, &stuff, 0);
}


int
sys_kill(void)
{
  int pid;

  if(argint(0, &pid) < 0)
    return -1;
  return kill(pid);
}

int
sys_getpid(void)
{
  return proc->pid;
}

int
sys_sbrk(void)
{
  int addr;
  int n;

  if(argint(0, &n) < 0)
    return -1;
  addr = proc->sz;
  if(growproc(n) < 0)
    return -1;
  return addr;
}

int
sys_sleep(void)
{
  int n;
  uint ticks0;
  
  if(argint(0, &n) < 0)
    return -1;
  acquire(&tickslock);
  ticks0 = ticks;
  while(ticks - ticks0 < n){
    if(proc->killed){
      release(&tickslock);
      return -1;
    }
    sleep(&ticks, &tickslock);
  }
  release(&tickslock);
  return 0;
}

// return how many clock tick interrupts have occurred
// since start.
int
sys_uptime(void)
{
  uint xticks;
  
  acquire(&tickslock);
  xticks = ticks;
  release(&tickslock);
  return xticks;
}
