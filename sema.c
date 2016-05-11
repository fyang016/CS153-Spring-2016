#include "sema.h"
#include "user.h"

//struct sema{
//    int lock_t lock;
//    int count;
//    struct queue q;
//};

void init_sema(struct sema *s){
    lock_init(&s->lock);
    s->count = 0;
    init_q(&s->q);
}
void acuqire_sema(struct sema *s){
    lock_acquire(&(s->lock));
    if(s->count <= 0){
        add_q(&(s->q),getpid());
        lock_release(&s->lock);
        tsleep();
    }else{
        s->count--;
        lock_release(&s->lock);
    }
}
void signal_sema(struct sema *s){
    lock_acquire(&s->lock);
    if(empty_q(&s->q)){
        s->count++;
    }else{
        int tid = pop_q(&s->q);
        twakeup(tid);
    }
    lock_release(&s->lock);
}

