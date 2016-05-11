#include "types.h"
#include "queue.h"

struct sema{
    int lock_t lock;
    int count;
    struct queue q;
};

void init_sema(struct sema *s);
void acuqire_sema(struct sema *s);
void signal_sema(struct sema *s);

