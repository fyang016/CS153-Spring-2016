#include "types.h"
#include "user.h"

int n = 1;

void test_func(void *arg_ptr);

int main(int argc, char *argv[]){

   printf(1,"thread_create test begin\n");
   
   void *tid = thread_create(test_func, (void *)0);
   if(tid ==0) 
       printf(1,"wrong happen");
   while(wait()>= 0)
   printf(1,"back to parent n = %d\n",n);
   
   exit();
}

void test_func(void *arg_ptr){
    printf(1,"\n n = %d\n",n);
    n = 2;
    printf(1,"after increase by 1 , n = %d\n\n",n);
    texit();
}


