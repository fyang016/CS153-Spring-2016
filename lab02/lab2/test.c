#include "types.h"
#include "user.h"

int n = 1;

void test_func(void * arg_ptr);

int main(int argc, char *argv[]){

   printf(1,"thread_create test begin\n\n");

   printf(1,"before thread_create n = %d\n",n);

   int arg = 10;
   void *tid = thread_create(test_func, (void *)&arg);
   if(tid <= 0){
       printf(1,"wrong happen");
       exit();
   } 
   while(wait()>= 0)
   printf(1,"\nback to parent n = %d\n",n);
   
   exit();
}

//void test_func(void *arg_ptr){
void test_func(void *arg_ptr){
    int * num = (int *)arg_ptr;
    n = *num; 
    printf(1,"\n n is updated as %d\n",*num);
    texit();
}


