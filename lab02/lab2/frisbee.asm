
_frisbee:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
void pass_next(void *arg);
int lookup();



int main(int argc, char *argv[]){
   0:	8d 4c 24 04          	lea    0x4(%esp),%ecx
   4:	83 e4 f0             	and    $0xfffffff0,%esp
   7:	ff 71 fc             	pushl  -0x4(%ecx)
   a:	55                   	push   %ebp
   b:	89 e5                	mov    %esp,%ebp
   d:	56                   	push   %esi
   e:	53                   	push   %ebx
   f:	51                   	push   %ecx
  10:	83 ec 3c             	sub    $0x3c,%esp
  13:	89 cb                	mov    %ecx,%ebx

    int i;
    struct thread *t;
//    void * sp;

    if(argc != 3){
  15:	83 3b 03             	cmpl   $0x3,(%ebx)
  18:	74 19                	je     33 <main+0x33>
        printf(1,"argc is not match !\n");
  1a:	c7 44 24 04 34 0f 00 	movl   $0xf34,0x4(%esp)
  21:	00 
  22:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  29:	e8 e4 07 00 00       	call   812 <printf>
        exit();
  2e:	e8 37 06 00 00       	call   66a <exit>
    }
    numthreads = atoi(argv[1]);
  33:	8b 43 04             	mov    0x4(%ebx),%eax
  36:	83 c0 04             	add    $0x4,%eax
  39:	8b 00                	mov    (%eax),%eax
  3b:	89 04 24             	mov    %eax,(%esp)
  3e:	e8 95 05 00 00       	call   5d8 <atoi>
  43:	a3 80 14 00 00       	mov    %eax,0x1480
    numpass = atoi(argv[2]);
  48:	8b 43 04             	mov    0x4(%ebx),%eax
  4b:	83 c0 08             	add    $0x8,%eax
  4e:	8b 00                	mov    (%eax),%eax
  50:	89 04 24             	mov    %eax,(%esp)
  53:	e8 80 05 00 00       	call   5d8 <atoi>
  58:	a3 84 14 00 00       	mov    %eax,0x1484

    void * slist[numthreads];
  5d:	a1 80 14 00 00       	mov    0x1480,%eax
  62:	8d 50 ff             	lea    -0x1(%eax),%edx
  65:	89 55 dc             	mov    %edx,-0x24(%ebp)
  68:	c1 e0 02             	shl    $0x2,%eax
  6b:	8d 50 03             	lea    0x3(%eax),%edx
  6e:	b8 10 00 00 00       	mov    $0x10,%eax
  73:	83 e8 01             	sub    $0x1,%eax
  76:	01 d0                	add    %edx,%eax
  78:	be 10 00 00 00       	mov    $0x10,%esi
  7d:	ba 00 00 00 00       	mov    $0x0,%edx
  82:	f7 f6                	div    %esi
  84:	6b c0 10             	imul   $0x10,%eax,%eax
  87:	29 c4                	sub    %eax,%esp
  89:	8d 44 24 0c          	lea    0xc(%esp),%eax
  8d:	83 c0 03             	add    $0x3,%eax
  90:	c1 e8 02             	shr    $0x2,%eax
  93:	c1 e0 02             	shl    $0x2,%eax
  96:	89 45 d8             	mov    %eax,-0x28(%ebp)

    //init ttable;
    lock_init(&ttable.lock);
  99:	c7 04 24 a0 14 00 00 	movl   $0x14a0,(%esp)
  a0:	e8 53 0b 00 00       	call   bf8 <lock_init>
    ttable.total = 0;
  a5:	c7 05 a4 16 00 00 00 	movl   $0x0,0x16a4
  ac:	00 00 00 
    for(t=ttable.thread;t < &ttable.thread[64];t++){
  af:	c7 45 e0 a4 14 00 00 	movl   $0x14a4,-0x20(%ebp)
  b6:	eb 0d                	jmp    c5 <main+0xc5>
        t->tid = 0;
  b8:	8b 45 e0             	mov    -0x20(%ebp),%eax
  bb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    void * slist[numthreads];

    //init ttable;
    lock_init(&ttable.lock);
    ttable.total = 0;
    for(t=ttable.thread;t < &ttable.thread[64];t++){
  c1:	83 45 e0 08          	addl   $0x8,-0x20(%ebp)
  c5:	81 7d e0 a4 16 00 00 	cmpl   $0x16a4,-0x20(%ebp)
  cc:	72 ea                	jb     b8 <main+0xb8>
        t->tid = 0;
    }
    //init stack list
    for(i = 0; i < 64;i++){
  ce:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  d5:	eb 11                	jmp    e8 <main+0xe8>
        slist[i]=0;
  d7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  da:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  dd:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
    ttable.total = 0;
    for(t=ttable.thread;t < &ttable.thread[64];t++){
        t->tid = 0;
    }
    //init stack list
    for(i = 0; i < 64;i++){
  e4:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  e8:	83 7d e4 3f          	cmpl   $0x3f,-0x1c(%ebp)
  ec:	7e e9                	jle    d7 <main+0xd7>
        slist[i]=0;
    }
    //init frisbee
    lock_init(&frisbee.lock);
  ee:	c7 04 24 a8 16 00 00 	movl   $0x16a8,(%esp)
  f5:	e8 fe 0a 00 00       	call   bf8 <lock_init>
    frisbee.pass = 0;
  fa:	c7 05 ac 16 00 00 00 	movl   $0x0,0x16ac
 101:	00 00 00 
    frisbee.holding_thread = 0;
 104:	c7 05 b0 16 00 00 00 	movl   $0x0,0x16b0
 10b:	00 00 00 

    printf(1,"\nnum of threads %d \n",numthreads);
 10e:	a1 80 14 00 00       	mov    0x1480,%eax
 113:	89 44 24 08          	mov    %eax,0x8(%esp)
 117:	c7 44 24 04 49 0f 00 	movl   $0xf49,0x4(%esp)
 11e:	00 
 11f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 126:	e8 e7 06 00 00       	call   812 <printf>
    printf(1,"num of passes %d \n\n",numpass);
 12b:	a1 84 14 00 00       	mov    0x1484,%eax
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	c7 44 24 04 5e 0f 00 	movl   $0xf5e,0x4(%esp)
 13b:	00 
 13c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 143:	e8 ca 06 00 00       	call   812 <printf>


    for(i=0; i<numthreads;i++){
 148:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 14f:	eb 43                	jmp    194 <main+0x194>
        void *stack = thread_create(pass_next,(void *)0);      
 151:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 158:	00 
 159:	c7 04 24 3d 02 00 00 	movl   $0x23d,(%esp)
 160:	e8 dc 0a 00 00       	call   c41 <thread_create>
 165:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        if(stack == 0)
 168:	83 7d d4 00          	cmpl   $0x0,-0x2c(%ebp)
 16c:	75 16                	jne    184 <main+0x184>
            printf(1,"thread_create fail\n");
 16e:	c7 44 24 04 72 0f 00 	movl   $0xf72,0x4(%esp)
 175:	00 
 176:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 17d:	e8 90 06 00 00       	call   812 <printf>
 182:	eb 0c                	jmp    190 <main+0x190>
        else{
            slist[i] = stack;
 184:	8b 45 d8             	mov    -0x28(%ebp),%eax
 187:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 18a:	8b 4d d4             	mov    -0x2c(%ebp),%ecx
 18d:	89 0c 90             	mov    %ecx,(%eax,%edx,4)

    printf(1,"\nnum of threads %d \n",numthreads);
    printf(1,"num of passes %d \n\n",numpass);


    for(i=0; i<numthreads;i++){
 190:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 194:	a1 80 14 00 00       	mov    0x1480,%eax
 199:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 19c:	7c b3                	jl     151 <main+0x151>
        else{
            slist[i] = stack;
        }
    }
//    sleep(5);
    for(i=0;i<numthreads;i++){
 19e:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 1a5:	eb 10                	jmp    1b7 <main+0x1b7>
        if(wait() == -1)
 1a7:	e8 c6 04 00 00       	call   672 <wait>
 1ac:	83 f8 ff             	cmp    $0xffffffff,%eax
 1af:	75 02                	jne    1b3 <main+0x1b3>
            break;
 1b1:	eb 0e                	jmp    1c1 <main+0x1c1>
        else{
            slist[i] = stack;
        }
    }
//    sleep(5);
    for(i=0;i<numthreads;i++){
 1b3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 1b7:	a1 80 14 00 00       	mov    0x1480,%eax
 1bc:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 1bf:	7c e6                	jl     1a7 <main+0x1a7>
        if(wait() == -1)
            break;
    }
   // add printf for tid look up.  
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 1c1:	c7 45 e0 a4 14 00 00 	movl   $0x14a4,-0x20(%ebp)
 1c8:	eb 2a                	jmp    1f4 <main+0x1f4>
        if(t->tid != 0)
 1ca:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1cd:	8b 00                	mov    (%eax),%eax
 1cf:	85 c0                	test   %eax,%eax
 1d1:	74 1d                	je     1f0 <main+0x1f0>
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
 1d3:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1d6:	8b 00                	mov    (%eax),%eax
 1d8:	89 44 24 08          	mov    %eax,0x8(%esp)
 1dc:	c7 44 24 04 88 0f 00 	movl   $0xf88,0x4(%esp)
 1e3:	00 
 1e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1eb:	e8 22 06 00 00       	call   812 <printf>
    for(i=0;i<numthreads;i++){
        if(wait() == -1)
            break;
    }
   // add printf for tid look up.  
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 1f0:	83 45 e0 08          	addl   $0x8,-0x20(%ebp)
 1f4:	81 7d e0 a4 16 00 00 	cmpl   $0x16a4,-0x20(%ebp)
 1fb:	72 cd                	jb     1ca <main+0x1ca>
        if(t->tid != 0)
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
    }

    //free stacks
    for(i=0;i<numthreads;i++){
 1fd:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
 204:	eb 28                	jmp    22e <main+0x22e>
        if(slist[i] != 0){
 206:	8b 45 d8             	mov    -0x28(%ebp),%eax
 209:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 20c:	8b 04 90             	mov    (%eax,%edx,4),%eax
 20f:	85 c0                	test   %eax,%eax
 211:	74 17                	je     22a <main+0x22a>
            void * f = slist[i];
 213:	8b 45 d8             	mov    -0x28(%ebp),%eax
 216:	8b 55 e4             	mov    -0x1c(%ebp),%edx
 219:	8b 04 90             	mov    (%eax,%edx,4),%eax
 21c:	89 45 d0             	mov    %eax,-0x30(%ebp)
            free(f);
 21f:	8b 45 d0             	mov    -0x30(%ebp),%eax
 222:	89 04 24             	mov    %eax,(%esp)
 225:	e8 9b 07 00 00       	call   9c5 <free>
        if(t->tid != 0)
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
    }

    //free stacks
    for(i=0;i<numthreads;i++){
 22a:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 22e:	a1 80 14 00 00       	mov    0x1480,%eax
 233:	39 45 e4             	cmp    %eax,-0x1c(%ebp)
 236:	7c ce                	jl     206 <main+0x206>
        if(slist[i] != 0){
            void * f = slist[i];
            free(f);
        }
    }
    exit();
 238:	e8 2d 04 00 00       	call   66a <exit>

0000023d <pass_next>:
}

void pass_next(void *arg){
 23d:	55                   	push   %ebp
 23e:	89 e5                	mov    %esp,%ebp
 240:	83 ec 28             	sub    $0x28,%esp
    struct thread *t;
    int tid;

    tid = getpid();
 243:	e8 a2 04 00 00       	call   6ea <getpid>
 248:	89 45 f0             	mov    %eax,-0x10(%ebp)

    lock_acquire(&ttable.lock);
 24b:	c7 04 24 a0 14 00 00 	movl   $0x14a0,(%esp)
 252:	e8 af 09 00 00       	call   c06 <lock_acquire>
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 257:	c7 45 f4 a4 14 00 00 	movl   $0x14a4,-0xc(%ebp)
 25e:	eb 17                	jmp    277 <pass_next+0x3a>
        if(t->tid == 0){
 260:	8b 45 f4             	mov    -0xc(%ebp),%eax
 263:	8b 00                	mov    (%eax),%eax
 265:	85 c0                	test   %eax,%eax
 267:	75 0a                	jne    273 <pass_next+0x36>
            t->tid = tid;
 269:	8b 45 f4             	mov    -0xc(%ebp),%eax
 26c:	8b 55 f0             	mov    -0x10(%ebp),%edx
 26f:	89 10                	mov    %edx,(%eax)
            break;
 271:	eb 0d                	jmp    280 <pass_next+0x43>
    int tid;

    tid = getpid();

    lock_acquire(&ttable.lock);
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 273:	83 45 f4 08          	addl   $0x8,-0xc(%ebp)
 277:	81 7d f4 a4 16 00 00 	cmpl   $0x16a4,-0xc(%ebp)
 27e:	72 e0                	jb     260 <pass_next+0x23>
        if(t->tid == 0){
            t->tid = tid;
            break;
        } 
    }
    ttable.total++;
 280:	a1 a4 16 00 00       	mov    0x16a4,%eax
 285:	83 c0 01             	add    $0x1,%eax
 288:	a3 a4 16 00 00       	mov    %eax,0x16a4
    lock_release(&ttable.lock);
 28d:	c7 04 24 a0 14 00 00 	movl   $0x14a0,(%esp)
 294:	e8 8d 09 00 00       	call   c26 <lock_release>

   for(;;){
        lock_acquire(&ttable.lock);
 299:	c7 04 24 a0 14 00 00 	movl   $0x14a0,(%esp)
 2a0:	e8 61 09 00 00       	call   c06 <lock_acquire>
        if(ttable.total == numthreads){
 2a5:	8b 15 a4 16 00 00    	mov    0x16a4,%edx
 2ab:	a1 80 14 00 00       	mov    0x1480,%eax
 2b0:	39 c2                	cmp    %eax,%edx
 2b2:	75 39                	jne    2ed <pass_next+0xb0>
            printf(1," tid %d ready to go\n",t->tid);
 2b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b7:	8b 00                	mov    (%eax),%eax
 2b9:	89 44 24 08          	mov    %eax,0x8(%esp)
 2bd:	c7 44 24 04 b0 0f 00 	movl   $0xfb0,0x4(%esp)
 2c4:	00 
 2c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2cc:	e8 41 05 00 00       	call   812 <printf>
            barrier++;
 2d1:	a1 88 14 00 00       	mov    0x1488,%eax
 2d6:	83 c0 01             	add    $0x1,%eax
 2d9:	a3 88 14 00 00       	mov    %eax,0x1488
            goto start;
 2de:	90                   	nop
        lock_release(&ttable.lock);
    }
    
//barriar above
start:
     lock_release(&ttable.lock);
 2df:	c7 04 24 a0 14 00 00 	movl   $0x14a0,(%esp)
 2e6:	e8 3b 09 00 00       	call   c26 <lock_release>
     while(barrier != numthreads);
 2eb:	eb 0e                	jmp    2fb <pass_next+0xbe>
        if(ttable.total == numthreads){
            printf(1," tid %d ready to go\n",t->tid);
            barrier++;
            goto start;
        }
        lock_release(&ttable.lock);
 2ed:	c7 04 24 a0 14 00 00 	movl   $0x14a0,(%esp)
 2f4:	e8 2d 09 00 00       	call   c26 <lock_release>
    }
 2f9:	eb 9e                	jmp    299 <pass_next+0x5c>
    
//barriar above
start:
     lock_release(&ttable.lock);
     while(barrier != numthreads);
 2fb:	8b 15 88 14 00 00    	mov    0x1488,%edx
 301:	a1 80 14 00 00       	mov    0x1480,%eax
 306:	39 c2                	cmp    %eax,%edx
 308:	75 f1                	jne    2fb <pass_next+0xbe>
    //throw frisbee
    do{
        lock_acquire(&frisbee.lock);
 30a:	c7 04 24 a8 16 00 00 	movl   $0x16a8,(%esp)
 311:	e8 f0 08 00 00       	call   c06 <lock_acquire>
        if(frisbee.pass > numpass){
 316:	8b 15 ac 16 00 00    	mov    0x16ac,%edx
 31c:	a1 84 14 00 00       	mov    0x1484,%eax
 321:	39 c2                	cmp    %eax,%edx
 323:	7e 39                	jle    35e <pass_next+0x121>
            lock_release(&frisbee.lock);
 325:	c7 04 24 a8 16 00 00 	movl   $0x16a8,(%esp)
 32c:	e8 f5 08 00 00       	call   c26 <lock_release>
            goto leaving;
 331:	90                   	nop
        frisbee.holding_thread = tid;
        lock_release(&frisbee.lock);
    }while(1);

leaving: 
    lock_release(&frisbee.lock);
 332:	c7 04 24 a8 16 00 00 	movl   $0x16a8,(%esp)
 339:	e8 e8 08 00 00       	call   c26 <lock_release>
    printf(1,"thread %d out of game\n",tid);
 33e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 341:	89 44 24 08          	mov    %eax,0x8(%esp)
 345:	c7 44 24 04 fc 0f 00 	movl   $0xffc,0x4(%esp)
 34c:	00 
 34d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 354:	e8 b9 04 00 00       	call   812 <printf>
    texit();
 359:	e8 b4 03 00 00       	call   712 <texit>
        lock_acquire(&frisbee.lock);
        if(frisbee.pass > numpass){
            lock_release(&frisbee.lock);
            goto leaving;
        }
        if(frisbee.holding_thread == tid){
 35e:	a1 b0 16 00 00       	mov    0x16b0,%eax
 363:	3b 45 f0             	cmp    -0x10(%ebp),%eax
 366:	75 1b                	jne    383 <pass_next+0x146>
            lock_release(&frisbee.lock);
 368:	c7 04 24 a8 16 00 00 	movl   $0x16a8,(%esp)
 36f:	e8 b2 08 00 00       	call   c26 <lock_release>
            sleep(5);
 374:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 37b:	e8 7a 03 00 00       	call   6fa <sleep>
            continue;
 380:	90                   	nop
        printf(1,"pass: %d, thread %d catch the frisbee. throwing...\n",
                frisbee.pass, tid);
        frisbee.pass++;
        frisbee.holding_thread = tid;
        lock_release(&frisbee.lock);
    }while(1);
 381:	eb 87                	jmp    30a <pass_next+0xcd>
        if(frisbee.holding_thread == tid){
            lock_release(&frisbee.lock);
            sleep(5);
            continue;
        }
        printf(1,"pass: %d, thread %d catch the frisbee. throwing...\n",
 383:	a1 ac 16 00 00       	mov    0x16ac,%eax
 388:	8b 55 f0             	mov    -0x10(%ebp),%edx
 38b:	89 54 24 0c          	mov    %edx,0xc(%esp)
 38f:	89 44 24 08          	mov    %eax,0x8(%esp)
 393:	c7 44 24 04 c8 0f 00 	movl   $0xfc8,0x4(%esp)
 39a:	00 
 39b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3a2:	e8 6b 04 00 00       	call   812 <printf>
                frisbee.pass, tid);
        frisbee.pass++;
 3a7:	a1 ac 16 00 00       	mov    0x16ac,%eax
 3ac:	83 c0 01             	add    $0x1,%eax
 3af:	a3 ac 16 00 00       	mov    %eax,0x16ac
        frisbee.holding_thread = tid;
 3b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 3b7:	a3 b0 16 00 00       	mov    %eax,0x16b0
        lock_release(&frisbee.lock);
 3bc:	c7 04 24 a8 16 00 00 	movl   $0x16a8,(%esp)
 3c3:	e8 5e 08 00 00       	call   c26 <lock_release>
    }while(1);
 3c8:	e9 3d ff ff ff       	jmp    30a <pass_next+0xcd>

000003cd <lookup>:
    lock_release(&frisbee.lock);
    printf(1,"thread %d out of game\n",tid);
    texit();
}

int lookup(int num_threads){
 3cd:	55                   	push   %ebp
 3ce:	89 e5                	mov    %esp,%ebp
 3d0:	83 ec 10             	sub    $0x10,%esp
    int i;
    struct thread *t;
    i = 0;
 3d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    for(t=ttable.thread;t<&ttable.thread[64];t++){
 3da:	c7 45 f8 a4 14 00 00 	movl   $0x14a4,-0x8(%ebp)
 3e1:	eb 11                	jmp    3f4 <lookup+0x27>
        if(t->tid != 0){
 3e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3e6:	8b 00                	mov    (%eax),%eax
 3e8:	85 c0                	test   %eax,%eax
 3ea:	74 04                	je     3f0 <lookup+0x23>
            i++;
 3ec:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)

int lookup(int num_threads){
    int i;
    struct thread *t;
    i = 0;
    for(t=ttable.thread;t<&ttable.thread[64];t++){
 3f0:	83 45 f8 08          	addl   $0x8,-0x8(%ebp)
 3f4:	81 7d f8 a4 16 00 00 	cmpl   $0x16a4,-0x8(%ebp)
 3fb:	72 e6                	jb     3e3 <lookup+0x16>
        if(t->tid != 0){
            i++;
        }
    }
    return i;
 3fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 400:	c9                   	leave  
 401:	c3                   	ret    

00000402 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 402:	55                   	push   %ebp
 403:	89 e5                	mov    %esp,%ebp
 405:	57                   	push   %edi
 406:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 407:	8b 4d 08             	mov    0x8(%ebp),%ecx
 40a:	8b 55 10             	mov    0x10(%ebp),%edx
 40d:	8b 45 0c             	mov    0xc(%ebp),%eax
 410:	89 cb                	mov    %ecx,%ebx
 412:	89 df                	mov    %ebx,%edi
 414:	89 d1                	mov    %edx,%ecx
 416:	fc                   	cld    
 417:	f3 aa                	rep stos %al,%es:(%edi)
 419:	89 ca                	mov    %ecx,%edx
 41b:	89 fb                	mov    %edi,%ebx
 41d:	89 5d 08             	mov    %ebx,0x8(%ebp)
 420:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 423:	5b                   	pop    %ebx
 424:	5f                   	pop    %edi
 425:	5d                   	pop    %ebp
 426:	c3                   	ret    

00000427 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 427:	55                   	push   %ebp
 428:	89 e5                	mov    %esp,%ebp
 42a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 42d:	8b 45 08             	mov    0x8(%ebp),%eax
 430:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 433:	90                   	nop
 434:	8b 45 08             	mov    0x8(%ebp),%eax
 437:	8d 50 01             	lea    0x1(%eax),%edx
 43a:	89 55 08             	mov    %edx,0x8(%ebp)
 43d:	8b 55 0c             	mov    0xc(%ebp),%edx
 440:	8d 4a 01             	lea    0x1(%edx),%ecx
 443:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 446:	0f b6 12             	movzbl (%edx),%edx
 449:	88 10                	mov    %dl,(%eax)
 44b:	0f b6 00             	movzbl (%eax),%eax
 44e:	84 c0                	test   %al,%al
 450:	75 e2                	jne    434 <strcpy+0xd>
    ;
  return os;
 452:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 455:	c9                   	leave  
 456:	c3                   	ret    

00000457 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 457:	55                   	push   %ebp
 458:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 45a:	eb 08                	jmp    464 <strcmp+0xd>
    p++, q++;
 45c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 460:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 464:	8b 45 08             	mov    0x8(%ebp),%eax
 467:	0f b6 00             	movzbl (%eax),%eax
 46a:	84 c0                	test   %al,%al
 46c:	74 10                	je     47e <strcmp+0x27>
 46e:	8b 45 08             	mov    0x8(%ebp),%eax
 471:	0f b6 10             	movzbl (%eax),%edx
 474:	8b 45 0c             	mov    0xc(%ebp),%eax
 477:	0f b6 00             	movzbl (%eax),%eax
 47a:	38 c2                	cmp    %al,%dl
 47c:	74 de                	je     45c <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 47e:	8b 45 08             	mov    0x8(%ebp),%eax
 481:	0f b6 00             	movzbl (%eax),%eax
 484:	0f b6 d0             	movzbl %al,%edx
 487:	8b 45 0c             	mov    0xc(%ebp),%eax
 48a:	0f b6 00             	movzbl (%eax),%eax
 48d:	0f b6 c0             	movzbl %al,%eax
 490:	29 c2                	sub    %eax,%edx
 492:	89 d0                	mov    %edx,%eax
}
 494:	5d                   	pop    %ebp
 495:	c3                   	ret    

00000496 <strlen>:

uint
strlen(char *s)
{
 496:	55                   	push   %ebp
 497:	89 e5                	mov    %esp,%ebp
 499:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 49c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 4a3:	eb 04                	jmp    4a9 <strlen+0x13>
 4a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 4a9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4ac:	8b 45 08             	mov    0x8(%ebp),%eax
 4af:	01 d0                	add    %edx,%eax
 4b1:	0f b6 00             	movzbl (%eax),%eax
 4b4:	84 c0                	test   %al,%al
 4b6:	75 ed                	jne    4a5 <strlen+0xf>
    ;
  return n;
 4b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4bb:	c9                   	leave  
 4bc:	c3                   	ret    

000004bd <memset>:

void*
memset(void *dst, int c, uint n)
{
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
 4c0:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 4c3:	8b 45 10             	mov    0x10(%ebp),%eax
 4c6:	89 44 24 08          	mov    %eax,0x8(%esp)
 4ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 4cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d1:	8b 45 08             	mov    0x8(%ebp),%eax
 4d4:	89 04 24             	mov    %eax,(%esp)
 4d7:	e8 26 ff ff ff       	call   402 <stosb>
  return dst;
 4dc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4df:	c9                   	leave  
 4e0:	c3                   	ret    

000004e1 <strchr>:

char*
strchr(const char *s, char c)
{
 4e1:	55                   	push   %ebp
 4e2:	89 e5                	mov    %esp,%ebp
 4e4:	83 ec 04             	sub    $0x4,%esp
 4e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ea:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 4ed:	eb 14                	jmp    503 <strchr+0x22>
    if(*s == c)
 4ef:	8b 45 08             	mov    0x8(%ebp),%eax
 4f2:	0f b6 00             	movzbl (%eax),%eax
 4f5:	3a 45 fc             	cmp    -0x4(%ebp),%al
 4f8:	75 05                	jne    4ff <strchr+0x1e>
      return (char*)s;
 4fa:	8b 45 08             	mov    0x8(%ebp),%eax
 4fd:	eb 13                	jmp    512 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 4ff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	0f b6 00             	movzbl (%eax),%eax
 509:	84 c0                	test   %al,%al
 50b:	75 e2                	jne    4ef <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 50d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 512:	c9                   	leave  
 513:	c3                   	ret    

00000514 <gets>:

char*
gets(char *buf, int max)
{
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 51a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 521:	eb 4c                	jmp    56f <gets+0x5b>
    cc = read(0, &c, 1);
 523:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 52a:	00 
 52b:	8d 45 ef             	lea    -0x11(%ebp),%eax
 52e:	89 44 24 04          	mov    %eax,0x4(%esp)
 532:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 539:	e8 44 01 00 00       	call   682 <read>
 53e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 541:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 545:	7f 02                	jg     549 <gets+0x35>
      break;
 547:	eb 31                	jmp    57a <gets+0x66>
    buf[i++] = c;
 549:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54c:	8d 50 01             	lea    0x1(%eax),%edx
 54f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 552:	89 c2                	mov    %eax,%edx
 554:	8b 45 08             	mov    0x8(%ebp),%eax
 557:	01 c2                	add    %eax,%edx
 559:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 55d:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 55f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 563:	3c 0a                	cmp    $0xa,%al
 565:	74 13                	je     57a <gets+0x66>
 567:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 56b:	3c 0d                	cmp    $0xd,%al
 56d:	74 0b                	je     57a <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 56f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 572:	83 c0 01             	add    $0x1,%eax
 575:	3b 45 0c             	cmp    0xc(%ebp),%eax
 578:	7c a9                	jl     523 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 57a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 57d:	8b 45 08             	mov    0x8(%ebp),%eax
 580:	01 d0                	add    %edx,%eax
 582:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 585:	8b 45 08             	mov    0x8(%ebp),%eax
}
 588:	c9                   	leave  
 589:	c3                   	ret    

0000058a <stat>:

int
stat(char *n, struct stat *st)
{
 58a:	55                   	push   %ebp
 58b:	89 e5                	mov    %esp,%ebp
 58d:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 590:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 597:	00 
 598:	8b 45 08             	mov    0x8(%ebp),%eax
 59b:	89 04 24             	mov    %eax,(%esp)
 59e:	e8 07 01 00 00       	call   6aa <open>
 5a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 5a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5aa:	79 07                	jns    5b3 <stat+0x29>
    return -1;
 5ac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 5b1:	eb 23                	jmp    5d6 <stat+0x4c>
  r = fstat(fd, st);
 5b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 5b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5bd:	89 04 24             	mov    %eax,(%esp)
 5c0:	e8 fd 00 00 00       	call   6c2 <fstat>
 5c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 5c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5cb:	89 04 24             	mov    %eax,(%esp)
 5ce:	e8 bf 00 00 00       	call   692 <close>
  return r;
 5d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 5d6:	c9                   	leave  
 5d7:	c3                   	ret    

000005d8 <atoi>:

int
atoi(const char *s)
{
 5d8:	55                   	push   %ebp
 5d9:	89 e5                	mov    %esp,%ebp
 5db:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 5de:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 5e5:	eb 25                	jmp    60c <atoi+0x34>
    n = n*10 + *s++ - '0';
 5e7:	8b 55 fc             	mov    -0x4(%ebp),%edx
 5ea:	89 d0                	mov    %edx,%eax
 5ec:	c1 e0 02             	shl    $0x2,%eax
 5ef:	01 d0                	add    %edx,%eax
 5f1:	01 c0                	add    %eax,%eax
 5f3:	89 c1                	mov    %eax,%ecx
 5f5:	8b 45 08             	mov    0x8(%ebp),%eax
 5f8:	8d 50 01             	lea    0x1(%eax),%edx
 5fb:	89 55 08             	mov    %edx,0x8(%ebp)
 5fe:	0f b6 00             	movzbl (%eax),%eax
 601:	0f be c0             	movsbl %al,%eax
 604:	01 c8                	add    %ecx,%eax
 606:	83 e8 30             	sub    $0x30,%eax
 609:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 60c:	8b 45 08             	mov    0x8(%ebp),%eax
 60f:	0f b6 00             	movzbl (%eax),%eax
 612:	3c 2f                	cmp    $0x2f,%al
 614:	7e 0a                	jle    620 <atoi+0x48>
 616:	8b 45 08             	mov    0x8(%ebp),%eax
 619:	0f b6 00             	movzbl (%eax),%eax
 61c:	3c 39                	cmp    $0x39,%al
 61e:	7e c7                	jle    5e7 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 620:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 623:	c9                   	leave  
 624:	c3                   	ret    

00000625 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 625:	55                   	push   %ebp
 626:	89 e5                	mov    %esp,%ebp
 628:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 62b:	8b 45 08             	mov    0x8(%ebp),%eax
 62e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 631:	8b 45 0c             	mov    0xc(%ebp),%eax
 634:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 637:	eb 17                	jmp    650 <memmove+0x2b>
    *dst++ = *src++;
 639:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63c:	8d 50 01             	lea    0x1(%eax),%edx
 63f:	89 55 fc             	mov    %edx,-0x4(%ebp)
 642:	8b 55 f8             	mov    -0x8(%ebp),%edx
 645:	8d 4a 01             	lea    0x1(%edx),%ecx
 648:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 64b:	0f b6 12             	movzbl (%edx),%edx
 64e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 650:	8b 45 10             	mov    0x10(%ebp),%eax
 653:	8d 50 ff             	lea    -0x1(%eax),%edx
 656:	89 55 10             	mov    %edx,0x10(%ebp)
 659:	85 c0                	test   %eax,%eax
 65b:	7f dc                	jg     639 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 65d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 660:	c9                   	leave  
 661:	c3                   	ret    

00000662 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 662:	b8 01 00 00 00       	mov    $0x1,%eax
 667:	cd 40                	int    $0x40
 669:	c3                   	ret    

0000066a <exit>:
SYSCALL(exit)
 66a:	b8 02 00 00 00       	mov    $0x2,%eax
 66f:	cd 40                	int    $0x40
 671:	c3                   	ret    

00000672 <wait>:
SYSCALL(wait)
 672:	b8 03 00 00 00       	mov    $0x3,%eax
 677:	cd 40                	int    $0x40
 679:	c3                   	ret    

0000067a <pipe>:
SYSCALL(pipe)
 67a:	b8 04 00 00 00       	mov    $0x4,%eax
 67f:	cd 40                	int    $0x40
 681:	c3                   	ret    

00000682 <read>:
SYSCALL(read)
 682:	b8 05 00 00 00       	mov    $0x5,%eax
 687:	cd 40                	int    $0x40
 689:	c3                   	ret    

0000068a <write>:
SYSCALL(write)
 68a:	b8 10 00 00 00       	mov    $0x10,%eax
 68f:	cd 40                	int    $0x40
 691:	c3                   	ret    

00000692 <close>:
SYSCALL(close)
 692:	b8 15 00 00 00       	mov    $0x15,%eax
 697:	cd 40                	int    $0x40
 699:	c3                   	ret    

0000069a <kill>:
SYSCALL(kill)
 69a:	b8 06 00 00 00       	mov    $0x6,%eax
 69f:	cd 40                	int    $0x40
 6a1:	c3                   	ret    

000006a2 <exec>:
SYSCALL(exec)
 6a2:	b8 07 00 00 00       	mov    $0x7,%eax
 6a7:	cd 40                	int    $0x40
 6a9:	c3                   	ret    

000006aa <open>:
SYSCALL(open)
 6aa:	b8 0f 00 00 00       	mov    $0xf,%eax
 6af:	cd 40                	int    $0x40
 6b1:	c3                   	ret    

000006b2 <mknod>:
SYSCALL(mknod)
 6b2:	b8 11 00 00 00       	mov    $0x11,%eax
 6b7:	cd 40                	int    $0x40
 6b9:	c3                   	ret    

000006ba <unlink>:
SYSCALL(unlink)
 6ba:	b8 12 00 00 00       	mov    $0x12,%eax
 6bf:	cd 40                	int    $0x40
 6c1:	c3                   	ret    

000006c2 <fstat>:
SYSCALL(fstat)
 6c2:	b8 08 00 00 00       	mov    $0x8,%eax
 6c7:	cd 40                	int    $0x40
 6c9:	c3                   	ret    

000006ca <link>:
SYSCALL(link)
 6ca:	b8 13 00 00 00       	mov    $0x13,%eax
 6cf:	cd 40                	int    $0x40
 6d1:	c3                   	ret    

000006d2 <mkdir>:
SYSCALL(mkdir)
 6d2:	b8 14 00 00 00       	mov    $0x14,%eax
 6d7:	cd 40                	int    $0x40
 6d9:	c3                   	ret    

000006da <chdir>:
SYSCALL(chdir)
 6da:	b8 09 00 00 00       	mov    $0x9,%eax
 6df:	cd 40                	int    $0x40
 6e1:	c3                   	ret    

000006e2 <dup>:
SYSCALL(dup)
 6e2:	b8 0a 00 00 00       	mov    $0xa,%eax
 6e7:	cd 40                	int    $0x40
 6e9:	c3                   	ret    

000006ea <getpid>:
SYSCALL(getpid)
 6ea:	b8 0b 00 00 00       	mov    $0xb,%eax
 6ef:	cd 40                	int    $0x40
 6f1:	c3                   	ret    

000006f2 <sbrk>:
SYSCALL(sbrk)
 6f2:	b8 0c 00 00 00       	mov    $0xc,%eax
 6f7:	cd 40                	int    $0x40
 6f9:	c3                   	ret    

000006fa <sleep>:
SYSCALL(sleep)
 6fa:	b8 0d 00 00 00       	mov    $0xd,%eax
 6ff:	cd 40                	int    $0x40
 701:	c3                   	ret    

00000702 <uptime>:
SYSCALL(uptime)
 702:	b8 0e 00 00 00       	mov    $0xe,%eax
 707:	cd 40                	int    $0x40
 709:	c3                   	ret    

0000070a <clone>:
SYSCALL(clone)
 70a:	b8 16 00 00 00       	mov    $0x16,%eax
 70f:	cd 40                	int    $0x40
 711:	c3                   	ret    

00000712 <texit>:
SYSCALL(texit)
 712:	b8 17 00 00 00       	mov    $0x17,%eax
 717:	cd 40                	int    $0x40
 719:	c3                   	ret    

0000071a <tsleep>:
SYSCALL(tsleep)
 71a:	b8 18 00 00 00       	mov    $0x18,%eax
 71f:	cd 40                	int    $0x40
 721:	c3                   	ret    

00000722 <twakeup>:
SYSCALL(twakeup)
 722:	b8 19 00 00 00       	mov    $0x19,%eax
 727:	cd 40                	int    $0x40
 729:	c3                   	ret    

0000072a <test>:
SYSCALL(test)
 72a:	b8 1a 00 00 00       	mov    $0x1a,%eax
 72f:	cd 40                	int    $0x40
 731:	c3                   	ret    

00000732 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 732:	55                   	push   %ebp
 733:	89 e5                	mov    %esp,%ebp
 735:	83 ec 18             	sub    $0x18,%esp
 738:	8b 45 0c             	mov    0xc(%ebp),%eax
 73b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 73e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 745:	00 
 746:	8d 45 f4             	lea    -0xc(%ebp),%eax
 749:	89 44 24 04          	mov    %eax,0x4(%esp)
 74d:	8b 45 08             	mov    0x8(%ebp),%eax
 750:	89 04 24             	mov    %eax,(%esp)
 753:	e8 32 ff ff ff       	call   68a <write>
}
 758:	c9                   	leave  
 759:	c3                   	ret    

0000075a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 75a:	55                   	push   %ebp
 75b:	89 e5                	mov    %esp,%ebp
 75d:	56                   	push   %esi
 75e:	53                   	push   %ebx
 75f:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 762:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 769:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 76d:	74 17                	je     786 <printint+0x2c>
 76f:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 773:	79 11                	jns    786 <printint+0x2c>
    neg = 1;
 775:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 77c:	8b 45 0c             	mov    0xc(%ebp),%eax
 77f:	f7 d8                	neg    %eax
 781:	89 45 ec             	mov    %eax,-0x14(%ebp)
 784:	eb 06                	jmp    78c <printint+0x32>
  } else {
    x = xx;
 786:	8b 45 0c             	mov    0xc(%ebp),%eax
 789:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 78c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 793:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 796:	8d 41 01             	lea    0x1(%ecx),%eax
 799:	89 45 f4             	mov    %eax,-0xc(%ebp)
 79c:	8b 5d 10             	mov    0x10(%ebp),%ebx
 79f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a2:	ba 00 00 00 00       	mov    $0x0,%edx
 7a7:	f7 f3                	div    %ebx
 7a9:	89 d0                	mov    %edx,%eax
 7ab:	0f b6 80 58 14 00 00 	movzbl 0x1458(%eax),%eax
 7b2:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 7b6:	8b 75 10             	mov    0x10(%ebp),%esi
 7b9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7bc:	ba 00 00 00 00       	mov    $0x0,%edx
 7c1:	f7 f6                	div    %esi
 7c3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7c6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7ca:	75 c7                	jne    793 <printint+0x39>
  if(neg)
 7cc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7d0:	74 10                	je     7e2 <printint+0x88>
    buf[i++] = '-';
 7d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d5:	8d 50 01             	lea    0x1(%eax),%edx
 7d8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 7db:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 7e0:	eb 1f                	jmp    801 <printint+0xa7>
 7e2:	eb 1d                	jmp    801 <printint+0xa7>
    putc(fd, buf[i]);
 7e4:	8d 55 dc             	lea    -0x24(%ebp),%edx
 7e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ea:	01 d0                	add    %edx,%eax
 7ec:	0f b6 00             	movzbl (%eax),%eax
 7ef:	0f be c0             	movsbl %al,%eax
 7f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 7f6:	8b 45 08             	mov    0x8(%ebp),%eax
 7f9:	89 04 24             	mov    %eax,(%esp)
 7fc:	e8 31 ff ff ff       	call   732 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 801:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 805:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 809:	79 d9                	jns    7e4 <printint+0x8a>
    putc(fd, buf[i]);
}
 80b:	83 c4 30             	add    $0x30,%esp
 80e:	5b                   	pop    %ebx
 80f:	5e                   	pop    %esi
 810:	5d                   	pop    %ebp
 811:	c3                   	ret    

00000812 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 812:	55                   	push   %ebp
 813:	89 e5                	mov    %esp,%ebp
 815:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 818:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 81f:	8d 45 0c             	lea    0xc(%ebp),%eax
 822:	83 c0 04             	add    $0x4,%eax
 825:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 828:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 82f:	e9 7c 01 00 00       	jmp    9b0 <printf+0x19e>
    c = fmt[i] & 0xff;
 834:	8b 55 0c             	mov    0xc(%ebp),%edx
 837:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83a:	01 d0                	add    %edx,%eax
 83c:	0f b6 00             	movzbl (%eax),%eax
 83f:	0f be c0             	movsbl %al,%eax
 842:	25 ff 00 00 00       	and    $0xff,%eax
 847:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 84a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 84e:	75 2c                	jne    87c <printf+0x6a>
      if(c == '%'){
 850:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 854:	75 0c                	jne    862 <printf+0x50>
        state = '%';
 856:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 85d:	e9 4a 01 00 00       	jmp    9ac <printf+0x19a>
      } else {
        putc(fd, c);
 862:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 865:	0f be c0             	movsbl %al,%eax
 868:	89 44 24 04          	mov    %eax,0x4(%esp)
 86c:	8b 45 08             	mov    0x8(%ebp),%eax
 86f:	89 04 24             	mov    %eax,(%esp)
 872:	e8 bb fe ff ff       	call   732 <putc>
 877:	e9 30 01 00 00       	jmp    9ac <printf+0x19a>
      }
    } else if(state == '%'){
 87c:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 880:	0f 85 26 01 00 00    	jne    9ac <printf+0x19a>
      if(c == 'd'){
 886:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 88a:	75 2d                	jne    8b9 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 88c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 88f:	8b 00                	mov    (%eax),%eax
 891:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 898:	00 
 899:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8a0:	00 
 8a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a5:	8b 45 08             	mov    0x8(%ebp),%eax
 8a8:	89 04 24             	mov    %eax,(%esp)
 8ab:	e8 aa fe ff ff       	call   75a <printint>
        ap++;
 8b0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8b4:	e9 ec 00 00 00       	jmp    9a5 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 8b9:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 8bd:	74 06                	je     8c5 <printf+0xb3>
 8bf:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 8c3:	75 2d                	jne    8f2 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 8c5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8c8:	8b 00                	mov    (%eax),%eax
 8ca:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 8d1:	00 
 8d2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 8d9:	00 
 8da:	89 44 24 04          	mov    %eax,0x4(%esp)
 8de:	8b 45 08             	mov    0x8(%ebp),%eax
 8e1:	89 04 24             	mov    %eax,(%esp)
 8e4:	e8 71 fe ff ff       	call   75a <printint>
        ap++;
 8e9:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8ed:	e9 b3 00 00 00       	jmp    9a5 <printf+0x193>
      } else if(c == 's'){
 8f2:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 8f6:	75 45                	jne    93d <printf+0x12b>
        s = (char*)*ap;
 8f8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8fb:	8b 00                	mov    (%eax),%eax
 8fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 900:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 904:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 908:	75 09                	jne    913 <printf+0x101>
          s = "(null)";
 90a:	c7 45 f4 13 10 00 00 	movl   $0x1013,-0xc(%ebp)
        while(*s != 0){
 911:	eb 1e                	jmp    931 <printf+0x11f>
 913:	eb 1c                	jmp    931 <printf+0x11f>
          putc(fd, *s);
 915:	8b 45 f4             	mov    -0xc(%ebp),%eax
 918:	0f b6 00             	movzbl (%eax),%eax
 91b:	0f be c0             	movsbl %al,%eax
 91e:	89 44 24 04          	mov    %eax,0x4(%esp)
 922:	8b 45 08             	mov    0x8(%ebp),%eax
 925:	89 04 24             	mov    %eax,(%esp)
 928:	e8 05 fe ff ff       	call   732 <putc>
          s++;
 92d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 931:	8b 45 f4             	mov    -0xc(%ebp),%eax
 934:	0f b6 00             	movzbl (%eax),%eax
 937:	84 c0                	test   %al,%al
 939:	75 da                	jne    915 <printf+0x103>
 93b:	eb 68                	jmp    9a5 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 93d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 941:	75 1d                	jne    960 <printf+0x14e>
        putc(fd, *ap);
 943:	8b 45 e8             	mov    -0x18(%ebp),%eax
 946:	8b 00                	mov    (%eax),%eax
 948:	0f be c0             	movsbl %al,%eax
 94b:	89 44 24 04          	mov    %eax,0x4(%esp)
 94f:	8b 45 08             	mov    0x8(%ebp),%eax
 952:	89 04 24             	mov    %eax,(%esp)
 955:	e8 d8 fd ff ff       	call   732 <putc>
        ap++;
 95a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 95e:	eb 45                	jmp    9a5 <printf+0x193>
      } else if(c == '%'){
 960:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 964:	75 17                	jne    97d <printf+0x16b>
        putc(fd, c);
 966:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 969:	0f be c0             	movsbl %al,%eax
 96c:	89 44 24 04          	mov    %eax,0x4(%esp)
 970:	8b 45 08             	mov    0x8(%ebp),%eax
 973:	89 04 24             	mov    %eax,(%esp)
 976:	e8 b7 fd ff ff       	call   732 <putc>
 97b:	eb 28                	jmp    9a5 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 97d:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 984:	00 
 985:	8b 45 08             	mov    0x8(%ebp),%eax
 988:	89 04 24             	mov    %eax,(%esp)
 98b:	e8 a2 fd ff ff       	call   732 <putc>
        putc(fd, c);
 990:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 993:	0f be c0             	movsbl %al,%eax
 996:	89 44 24 04          	mov    %eax,0x4(%esp)
 99a:	8b 45 08             	mov    0x8(%ebp),%eax
 99d:	89 04 24             	mov    %eax,(%esp)
 9a0:	e8 8d fd ff ff       	call   732 <putc>
      }
      state = 0;
 9a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9ac:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 9b0:	8b 55 0c             	mov    0xc(%ebp),%edx
 9b3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b6:	01 d0                	add    %edx,%eax
 9b8:	0f b6 00             	movzbl (%eax),%eax
 9bb:	84 c0                	test   %al,%al
 9bd:	0f 85 71 fe ff ff    	jne    834 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 9c3:	c9                   	leave  
 9c4:	c3                   	ret    

000009c5 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9c5:	55                   	push   %ebp
 9c6:	89 e5                	mov    %esp,%ebp
 9c8:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 9cb:	8b 45 08             	mov    0x8(%ebp),%eax
 9ce:	83 e8 08             	sub    $0x8,%eax
 9d1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9d4:	a1 94 14 00 00       	mov    0x1494,%eax
 9d9:	89 45 fc             	mov    %eax,-0x4(%ebp)
 9dc:	eb 24                	jmp    a02 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 9de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e1:	8b 00                	mov    (%eax),%eax
 9e3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 9e6:	77 12                	ja     9fa <free+0x35>
 9e8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9eb:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 9ee:	77 24                	ja     a14 <free+0x4f>
 9f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9f3:	8b 00                	mov    (%eax),%eax
 9f5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9f8:	77 1a                	ja     a14 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 9fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9fd:	8b 00                	mov    (%eax),%eax
 9ff:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a02:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a05:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a08:	76 d4                	jbe    9de <free+0x19>
 a0a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a0d:	8b 00                	mov    (%eax),%eax
 a0f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a12:	76 ca                	jbe    9de <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a14:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a17:	8b 40 04             	mov    0x4(%eax),%eax
 a1a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a21:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a24:	01 c2                	add    %eax,%edx
 a26:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a29:	8b 00                	mov    (%eax),%eax
 a2b:	39 c2                	cmp    %eax,%edx
 a2d:	75 24                	jne    a53 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 a2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a32:	8b 50 04             	mov    0x4(%eax),%edx
 a35:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a38:	8b 00                	mov    (%eax),%eax
 a3a:	8b 40 04             	mov    0x4(%eax),%eax
 a3d:	01 c2                	add    %eax,%edx
 a3f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a42:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 a45:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a48:	8b 00                	mov    (%eax),%eax
 a4a:	8b 10                	mov    (%eax),%edx
 a4c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a4f:	89 10                	mov    %edx,(%eax)
 a51:	eb 0a                	jmp    a5d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 a53:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a56:	8b 10                	mov    (%eax),%edx
 a58:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a5b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 a5d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a60:	8b 40 04             	mov    0x4(%eax),%eax
 a63:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a6d:	01 d0                	add    %edx,%eax
 a6f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a72:	75 20                	jne    a94 <free+0xcf>
    p->s.size += bp->s.size;
 a74:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a77:	8b 50 04             	mov    0x4(%eax),%edx
 a7a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a7d:	8b 40 04             	mov    0x4(%eax),%eax
 a80:	01 c2                	add    %eax,%edx
 a82:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a85:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a88:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a8b:	8b 10                	mov    (%eax),%edx
 a8d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a90:	89 10                	mov    %edx,(%eax)
 a92:	eb 08                	jmp    a9c <free+0xd7>
  } else
    p->s.ptr = bp;
 a94:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a97:	8b 55 f8             	mov    -0x8(%ebp),%edx
 a9a:	89 10                	mov    %edx,(%eax)
  freep = p;
 a9c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a9f:	a3 94 14 00 00       	mov    %eax,0x1494
}
 aa4:	c9                   	leave  
 aa5:	c3                   	ret    

00000aa6 <morecore>:

static Header*
morecore(uint nu)
{
 aa6:	55                   	push   %ebp
 aa7:	89 e5                	mov    %esp,%ebp
 aa9:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 aac:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 ab3:	77 07                	ja     abc <morecore+0x16>
    nu = 4096;
 ab5:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 abc:	8b 45 08             	mov    0x8(%ebp),%eax
 abf:	c1 e0 03             	shl    $0x3,%eax
 ac2:	89 04 24             	mov    %eax,(%esp)
 ac5:	e8 28 fc ff ff       	call   6f2 <sbrk>
 aca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 acd:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 ad1:	75 07                	jne    ada <morecore+0x34>
    return 0;
 ad3:	b8 00 00 00 00       	mov    $0x0,%eax
 ad8:	eb 22                	jmp    afc <morecore+0x56>
  hp = (Header*)p;
 ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
 add:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 ae0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ae3:	8b 55 08             	mov    0x8(%ebp),%edx
 ae6:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 ae9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aec:	83 c0 08             	add    $0x8,%eax
 aef:	89 04 24             	mov    %eax,(%esp)
 af2:	e8 ce fe ff ff       	call   9c5 <free>
  return freep;
 af7:	a1 94 14 00 00       	mov    0x1494,%eax
}
 afc:	c9                   	leave  
 afd:	c3                   	ret    

00000afe <malloc>:

void*
malloc(uint nbytes)
{
 afe:	55                   	push   %ebp
 aff:	89 e5                	mov    %esp,%ebp
 b01:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b04:	8b 45 08             	mov    0x8(%ebp),%eax
 b07:	83 c0 07             	add    $0x7,%eax
 b0a:	c1 e8 03             	shr    $0x3,%eax
 b0d:	83 c0 01             	add    $0x1,%eax
 b10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b13:	a1 94 14 00 00       	mov    0x1494,%eax
 b18:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b1b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b1f:	75 23                	jne    b44 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b21:	c7 45 f0 8c 14 00 00 	movl   $0x148c,-0x10(%ebp)
 b28:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b2b:	a3 94 14 00 00       	mov    %eax,0x1494
 b30:	a1 94 14 00 00       	mov    0x1494,%eax
 b35:	a3 8c 14 00 00       	mov    %eax,0x148c
    base.s.size = 0;
 b3a:	c7 05 90 14 00 00 00 	movl   $0x0,0x1490
 b41:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b44:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b47:	8b 00                	mov    (%eax),%eax
 b49:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 b4c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b4f:	8b 40 04             	mov    0x4(%eax),%eax
 b52:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 b55:	72 4d                	jb     ba4 <malloc+0xa6>
      if(p->s.size == nunits)
 b57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b5a:	8b 40 04             	mov    0x4(%eax),%eax
 b5d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 b60:	75 0c                	jne    b6e <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 b62:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b65:	8b 10                	mov    (%eax),%edx
 b67:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b6a:	89 10                	mov    %edx,(%eax)
 b6c:	eb 26                	jmp    b94 <malloc+0x96>
      else {
        p->s.size -= nunits;
 b6e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b71:	8b 40 04             	mov    0x4(%eax),%eax
 b74:	2b 45 ec             	sub    -0x14(%ebp),%eax
 b77:	89 c2                	mov    %eax,%edx
 b79:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b7c:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 b7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b82:	8b 40 04             	mov    0x4(%eax),%eax
 b85:	c1 e0 03             	shl    $0x3,%eax
 b88:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 b8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b8e:	8b 55 ec             	mov    -0x14(%ebp),%edx
 b91:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 b94:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b97:	a3 94 14 00 00       	mov    %eax,0x1494
      return (void*)(p + 1);
 b9c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b9f:	83 c0 08             	add    $0x8,%eax
 ba2:	eb 38                	jmp    bdc <malloc+0xde>
    }
    if(p == freep)
 ba4:	a1 94 14 00 00       	mov    0x1494,%eax
 ba9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 bac:	75 1b                	jne    bc9 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 bae:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bb1:	89 04 24             	mov    %eax,(%esp)
 bb4:	e8 ed fe ff ff       	call   aa6 <morecore>
 bb9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 bbc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 bc0:	75 07                	jne    bc9 <malloc+0xcb>
        return 0;
 bc2:	b8 00 00 00 00       	mov    $0x0,%eax
 bc7:	eb 13                	jmp    bdc <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bcc:	89 45 f0             	mov    %eax,-0x10(%ebp)
 bcf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd2:	8b 00                	mov    (%eax),%eax
 bd4:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 bd7:	e9 70 ff ff ff       	jmp    b4c <malloc+0x4e>
}
 bdc:	c9                   	leave  
 bdd:	c3                   	ret    

00000bde <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 bde:	55                   	push   %ebp
 bdf:	89 e5                	mov    %esp,%ebp
 be1:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 be4:	8b 55 08             	mov    0x8(%ebp),%edx
 be7:	8b 45 0c             	mov    0xc(%ebp),%eax
 bea:	8b 4d 08             	mov    0x8(%ebp),%ecx
 bed:	f0 87 02             	lock xchg %eax,(%edx)
 bf0:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 bf3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 bf6:	c9                   	leave  
 bf7:	c3                   	ret    

00000bf8 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 bf8:	55                   	push   %ebp
 bf9:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 bfb:	8b 45 08             	mov    0x8(%ebp),%eax
 bfe:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 c04:	5d                   	pop    %ebp
 c05:	c3                   	ret    

00000c06 <lock_acquire>:
void lock_acquire(lock_t *lock){
 c06:	55                   	push   %ebp
 c07:	89 e5                	mov    %esp,%ebp
 c09:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 c0c:	90                   	nop
 c0d:	8b 45 08             	mov    0x8(%ebp),%eax
 c10:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 c17:	00 
 c18:	89 04 24             	mov    %eax,(%esp)
 c1b:	e8 be ff ff ff       	call   bde <xchg>
 c20:	85 c0                	test   %eax,%eax
 c22:	75 e9                	jne    c0d <lock_acquire+0x7>
}
 c24:	c9                   	leave  
 c25:	c3                   	ret    

00000c26 <lock_release>:
void lock_release(lock_t *lock){
 c26:	55                   	push   %ebp
 c27:	89 e5                	mov    %esp,%ebp
 c29:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 c2c:	8b 45 08             	mov    0x8(%ebp),%eax
 c2f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 c36:	00 
 c37:	89 04 24             	mov    %eax,(%esp)
 c3a:	e8 9f ff ff ff       	call   bde <xchg>
}
 c3f:	c9                   	leave  
 c40:	c3                   	ret    

00000c41 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 c41:	55                   	push   %ebp
 c42:	89 e5                	mov    %esp,%ebp
 c44:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 c47:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 c4e:	e8 ab fe ff ff       	call   afe <malloc>
 c53:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 c56:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c59:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 c5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c5f:	25 ff 0f 00 00       	and    $0xfff,%eax
 c64:	85 c0                	test   %eax,%eax
 c66:	74 14                	je     c7c <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 c68:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c6b:	25 ff 0f 00 00       	and    $0xfff,%eax
 c70:	89 c2                	mov    %eax,%edx
 c72:	b8 00 10 00 00       	mov    $0x1000,%eax
 c77:	29 d0                	sub    %edx,%eax
 c79:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 c7c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c80:	75 1b                	jne    c9d <thread_create+0x5c>

        printf(1,"malloc fail \n");
 c82:	c7 44 24 04 1a 10 00 	movl   $0x101a,0x4(%esp)
 c89:	00 
 c8a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c91:	e8 7c fb ff ff       	call   812 <printf>
        return 0;
 c96:	b8 00 00 00 00       	mov    $0x0,%eax
 c9b:	eb 6f                	jmp    d0c <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 c9d:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 ca0:	8b 55 08             	mov    0x8(%ebp),%edx
 ca3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ca6:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 caa:	89 54 24 08          	mov    %edx,0x8(%esp)
 cae:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 cb5:	00 
 cb6:	89 04 24             	mov    %eax,(%esp)
 cb9:	e8 4c fa ff ff       	call   70a <clone>
 cbe:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 cc1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 cc5:	79 1b                	jns    ce2 <thread_create+0xa1>
        printf(1,"clone fails\n");
 cc7:	c7 44 24 04 28 10 00 	movl   $0x1028,0x4(%esp)
 cce:	00 
 ccf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 cd6:	e8 37 fb ff ff       	call   812 <printf>
        return 0;
 cdb:	b8 00 00 00 00       	mov    $0x0,%eax
 ce0:	eb 2a                	jmp    d0c <thread_create+0xcb>
    }
    if(tid > 0){
 ce2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 ce6:	7e 05                	jle    ced <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 ce8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ceb:	eb 1f                	jmp    d0c <thread_create+0xcb>
    }
    if(tid == 0){
 ced:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 cf1:	75 14                	jne    d07 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 cf3:	c7 44 24 04 35 10 00 	movl   $0x1035,0x4(%esp)
 cfa:	00 
 cfb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d02:	e8 0b fb ff ff       	call   812 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 d07:	b8 00 00 00 00       	mov    $0x0,%eax
}
 d0c:	c9                   	leave  
 d0d:	c3                   	ret    

00000d0e <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 d0e:	55                   	push   %ebp
 d0f:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 d11:	8b 45 08             	mov    0x8(%ebp),%eax
 d14:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 d1a:	8b 45 08             	mov    0x8(%ebp),%eax
 d1d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 d24:	8b 45 08             	mov    0x8(%ebp),%eax
 d27:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 d2e:	5d                   	pop    %ebp
 d2f:	c3                   	ret    

00000d30 <add_q>:

void add_q(struct queue *q, int v){
 d30:	55                   	push   %ebp
 d31:	89 e5                	mov    %esp,%ebp
 d33:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 d36:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 d3d:	e8 bc fd ff ff       	call   afe <malloc>
 d42:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 d45:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d48:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 d4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d52:	8b 55 0c             	mov    0xc(%ebp),%edx
 d55:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 d57:	8b 45 08             	mov    0x8(%ebp),%eax
 d5a:	8b 40 04             	mov    0x4(%eax),%eax
 d5d:	85 c0                	test   %eax,%eax
 d5f:	75 0b                	jne    d6c <add_q+0x3c>
        q->head = n;
 d61:	8b 45 08             	mov    0x8(%ebp),%eax
 d64:	8b 55 f4             	mov    -0xc(%ebp),%edx
 d67:	89 50 04             	mov    %edx,0x4(%eax)
 d6a:	eb 0c                	jmp    d78 <add_q+0x48>
    }else{
        q->tail->next = n;
 d6c:	8b 45 08             	mov    0x8(%ebp),%eax
 d6f:	8b 40 08             	mov    0x8(%eax),%eax
 d72:	8b 55 f4             	mov    -0xc(%ebp),%edx
 d75:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 d78:	8b 45 08             	mov    0x8(%ebp),%eax
 d7b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 d7e:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 d81:	8b 45 08             	mov    0x8(%ebp),%eax
 d84:	8b 00                	mov    (%eax),%eax
 d86:	8d 50 01             	lea    0x1(%eax),%edx
 d89:	8b 45 08             	mov    0x8(%ebp),%eax
 d8c:	89 10                	mov    %edx,(%eax)
}
 d8e:	c9                   	leave  
 d8f:	c3                   	ret    

00000d90 <empty_q>:

int empty_q(struct queue *q){
 d90:	55                   	push   %ebp
 d91:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 d93:	8b 45 08             	mov    0x8(%ebp),%eax
 d96:	8b 00                	mov    (%eax),%eax
 d98:	85 c0                	test   %eax,%eax
 d9a:	75 07                	jne    da3 <empty_q+0x13>
        return 1;
 d9c:	b8 01 00 00 00       	mov    $0x1,%eax
 da1:	eb 05                	jmp    da8 <empty_q+0x18>
    else
        return 0;
 da3:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 da8:	5d                   	pop    %ebp
 da9:	c3                   	ret    

00000daa <pop_q>:
int pop_q(struct queue *q){
 daa:	55                   	push   %ebp
 dab:	89 e5                	mov    %esp,%ebp
 dad:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 db0:	8b 45 08             	mov    0x8(%ebp),%eax
 db3:	89 04 24             	mov    %eax,(%esp)
 db6:	e8 d5 ff ff ff       	call   d90 <empty_q>
 dbb:	85 c0                	test   %eax,%eax
 dbd:	75 5d                	jne    e1c <pop_q+0x72>
       val = q->head->value; 
 dbf:	8b 45 08             	mov    0x8(%ebp),%eax
 dc2:	8b 40 04             	mov    0x4(%eax),%eax
 dc5:	8b 00                	mov    (%eax),%eax
 dc7:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 dca:	8b 45 08             	mov    0x8(%ebp),%eax
 dcd:	8b 40 04             	mov    0x4(%eax),%eax
 dd0:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 dd3:	8b 45 08             	mov    0x8(%ebp),%eax
 dd6:	8b 40 04             	mov    0x4(%eax),%eax
 dd9:	8b 50 04             	mov    0x4(%eax),%edx
 ddc:	8b 45 08             	mov    0x8(%ebp),%eax
 ddf:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 de2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 de5:	89 04 24             	mov    %eax,(%esp)
 de8:	e8 d8 fb ff ff       	call   9c5 <free>
       q->size--;
 ded:	8b 45 08             	mov    0x8(%ebp),%eax
 df0:	8b 00                	mov    (%eax),%eax
 df2:	8d 50 ff             	lea    -0x1(%eax),%edx
 df5:	8b 45 08             	mov    0x8(%ebp),%eax
 df8:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 dfa:	8b 45 08             	mov    0x8(%ebp),%eax
 dfd:	8b 00                	mov    (%eax),%eax
 dff:	85 c0                	test   %eax,%eax
 e01:	75 14                	jne    e17 <pop_q+0x6d>
            q->head = 0;
 e03:	8b 45 08             	mov    0x8(%ebp),%eax
 e06:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 e0d:	8b 45 08             	mov    0x8(%ebp),%eax
 e10:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 e17:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e1a:	eb 05                	jmp    e21 <pop_q+0x77>
    }
    return -1;
 e1c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 e21:	c9                   	leave  
 e22:	c3                   	ret    

00000e23 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 e23:	55                   	push   %ebp
 e24:	89 e5                	mov    %esp,%ebp
 e26:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 e29:	8b 45 08             	mov    0x8(%ebp),%eax
 e2c:	8b 55 0c             	mov    0xc(%ebp),%edx
 e2f:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 e32:	8b 45 08             	mov    0x8(%ebp),%eax
 e35:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 e3c:	8b 45 08             	mov    0x8(%ebp),%eax
 e3f:	89 04 24             	mov    %eax,(%esp)
 e42:	e8 b1 fd ff ff       	call   bf8 <lock_init>
}
 e47:	c9                   	leave  
 e48:	c3                   	ret    

00000e49 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 e49:	55                   	push   %ebp
 e4a:	89 e5                	mov    %esp,%ebp
 e4c:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 e4f:	8b 45 08             	mov    0x8(%ebp),%eax
 e52:	89 04 24             	mov    %eax,(%esp)
 e55:	e8 ac fd ff ff       	call   c06 <lock_acquire>
	if(s->count  == 0){
 e5a:	8b 45 08             	mov    0x8(%ebp),%eax
 e5d:	8b 40 04             	mov    0x4(%eax),%eax
 e60:	85 c0                	test   %eax,%eax
 e62:	75 2f                	jne    e93 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 e64:	e8 81 f8 ff ff       	call   6ea <getpid>
 e69:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 e6c:	8b 45 08             	mov    0x8(%ebp),%eax
 e6f:	8d 50 0c             	lea    0xc(%eax),%edx
 e72:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e75:	89 44 24 04          	mov    %eax,0x4(%esp)
 e79:	89 14 24             	mov    %edx,(%esp)
 e7c:	e8 af fe ff ff       	call   d30 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 e81:	8b 45 08             	mov    0x8(%ebp),%eax
 e84:	89 04 24             	mov    %eax,(%esp)
 e87:	e8 9a fd ff ff       	call   c26 <lock_release>
		tsleep(); 
 e8c:	e8 89 f8 ff ff       	call   71a <tsleep>
 e91:	eb 1a                	jmp    ead <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 e93:	8b 45 08             	mov    0x8(%ebp),%eax
 e96:	8b 40 04             	mov    0x4(%eax),%eax
 e99:	8d 50 ff             	lea    -0x1(%eax),%edx
 e9c:	8b 45 08             	mov    0x8(%ebp),%eax
 e9f:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 ea2:	8b 45 08             	mov    0x8(%ebp),%eax
 ea5:	89 04 24             	mov    %eax,(%esp)
 ea8:	e8 79 fd ff ff       	call   c26 <lock_release>
	}
}
 ead:	c9                   	leave  
 eae:	c3                   	ret    

00000eaf <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 eaf:	55                   	push   %ebp
 eb0:	89 e5                	mov    %esp,%ebp
 eb2:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 eb5:	8b 45 08             	mov    0x8(%ebp),%eax
 eb8:	89 04 24             	mov    %eax,(%esp)
 ebb:	e8 46 fd ff ff       	call   c06 <lock_acquire>
	if(s->count < s->size){
 ec0:	8b 45 08             	mov    0x8(%ebp),%eax
 ec3:	8b 50 04             	mov    0x4(%eax),%edx
 ec6:	8b 45 08             	mov    0x8(%ebp),%eax
 ec9:	8b 40 08             	mov    0x8(%eax),%eax
 ecc:	39 c2                	cmp    %eax,%edx
 ece:	7d 0f                	jge    edf <sem_signal+0x30>
		s->count++;	
 ed0:	8b 45 08             	mov    0x8(%ebp),%eax
 ed3:	8b 40 04             	mov    0x4(%eax),%eax
 ed6:	8d 50 01             	lea    0x1(%eax),%edx
 ed9:	8b 45 08             	mov    0x8(%ebp),%eax
 edc:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 edf:	8b 45 08             	mov    0x8(%ebp),%eax
 ee2:	83 c0 0c             	add    $0xc,%eax
 ee5:	89 04 24             	mov    %eax,(%esp)
 ee8:	e8 bd fe ff ff       	call   daa <pop_q>
 eed:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 ef0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 ef4:	74 2e                	je     f24 <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 ef6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ef9:	89 04 24             	mov    %eax,(%esp)
 efc:	e8 21 f8 ff ff       	call   722 <twakeup>
		s->count--;
 f01:	8b 45 08             	mov    0x8(%ebp),%eax
 f04:	8b 40 04             	mov    0x4(%eax),%eax
 f07:	8d 50 ff             	lea    -0x1(%eax),%edx
 f0a:	8b 45 08             	mov    0x8(%ebp),%eax
 f0d:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 f10:	8b 45 08             	mov    0x8(%ebp),%eax
 f13:	8b 40 04             	mov    0x4(%eax),%eax
 f16:	85 c0                	test   %eax,%eax
 f18:	79 0a                	jns    f24 <sem_signal+0x75>
 f1a:	8b 45 08             	mov    0x8(%ebp),%eax
 f1d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 f24:	8b 45 08             	mov    0x8(%ebp),%eax
 f27:	89 04 24             	mov    %eax,(%esp)
 f2a:	e8 f7 fc ff ff       	call   c26 <lock_release>

 f2f:	c9                   	leave  
 f30:	c3                   	ret    
