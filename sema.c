#include "types.h"
#include "sema.h"
#include "user.h"

//struct sema{
//    int lock_t lock;
//    int count;
//    struct queue q;
//};

void init_sema(struct sema *s){
    lock_init(s->lock);
    s->count = 0;
    init_q(&q);
}
void acuqire_sema(struct sema *s){
    lock_acquire(&(s->lock));
    if(s->count <= 0){
        add_q(&(s->q),getpid());
    }

}
void signal_sema(struct sema *s){

}

