
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
   d:	57                   	push   %edi
   e:	56                   	push   %esi
   f:	53                   	push   %ebx
  10:	51                   	push   %ecx
  11:	83 ec 58             	sub    $0x58,%esp
  14:	89 cb                	mov    %ecx,%ebx

    int i;
    struct thread *t;
//    void * sp;

    if(argc != 3){
  16:	83 3b 03             	cmpl   $0x3,(%ebx)
  19:	74 19                	je     34 <main+0x34>
        printf(1,"argc is not match !\n");
  1b:	c7 44 24 04 50 0d 00 	movl   $0xd50,0x4(%esp)
  22:	00 
  23:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2a:	e8 26 08 00 00       	call   855 <printf>
        exit();
  2f:	e8 98 06 00 00       	call   6cc <exit>
    }
    numthreads = atoi(argv[1]);
  34:	8b 43 04             	mov    0x4(%ebx),%eax
  37:	83 c0 04             	add    $0x4,%eax
  3a:	8b 00                	mov    (%eax),%eax
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 f6 05 00 00       	call   63a <atoi>
  44:	a3 80 0e 00 00       	mov    %eax,0xe80
    numpass = atoi(argv[2]);
  49:	8b 43 04             	mov    0x4(%ebx),%eax
  4c:	83 c0 08             	add    $0x8,%eax
  4f:	8b 00                	mov    (%eax),%eax
  51:	89 04 24             	mov    %eax,(%esp)
  54:	e8 e1 05 00 00       	call   63a <atoi>
  59:	a3 84 0e 00 00       	mov    %eax,0xe84

    void * slist[numthreads];
  5e:	8b 0d 80 0e 00 00    	mov    0xe80,%ecx
  64:	8d 41 ff             	lea    -0x1(%ecx),%eax
  67:	89 45 d0             	mov    %eax,-0x30(%ebp)
  6a:	89 c8                	mov    %ecx,%eax
  6c:	ba 00 00 00 00       	mov    $0x0,%edx
  71:	89 c6                	mov    %eax,%esi
  73:	83 e6 ff             	and    $0xffffffff,%esi
  76:	89 d7                	mov    %edx,%edi
  78:	83 e7 0f             	and    $0xf,%edi
  7b:	89 f0                	mov    %esi,%eax
  7d:	89 fa                	mov    %edi,%edx
  7f:	0f a4 c2 05          	shld   $0x5,%eax,%edx
  83:	c1 e0 05             	shl    $0x5,%eax
  86:	89 c3                	mov    %eax,%ebx
  88:	80 e7 ff             	and    $0xff,%bh
  8b:	89 5d c0             	mov    %ebx,-0x40(%ebp)
  8e:	89 d3                	mov    %edx,%ebx
  90:	83 e3 0f             	and    $0xf,%ebx
  93:	89 5d c4             	mov    %ebx,-0x3c(%ebp)
  96:	8b 45 c0             	mov    -0x40(%ebp),%eax
  99:	8b 55 c4             	mov    -0x3c(%ebp),%edx
  9c:	89 c8                	mov    %ecx,%eax
  9e:	ba 00 00 00 00       	mov    $0x0,%edx
  a3:	89 c3                	mov    %eax,%ebx
  a5:	80 e7 ff             	and    $0xff,%bh
  a8:	89 5d b8             	mov    %ebx,-0x48(%ebp)
  ab:	89 d3                	mov    %edx,%ebx
  ad:	83 e3 0f             	and    $0xf,%ebx
  b0:	89 5d bc             	mov    %ebx,-0x44(%ebp)
  b3:	8b 45 b8             	mov    -0x48(%ebp),%eax
  b6:	8b 55 bc             	mov    -0x44(%ebp),%edx
  b9:	0f a4 c2 05          	shld   $0x5,%eax,%edx
  bd:	c1 e0 05             	shl    $0x5,%eax
  c0:	89 c3                	mov    %eax,%ebx
  c2:	80 e7 ff             	and    $0xff,%bh
  c5:	89 5d b0             	mov    %ebx,-0x50(%ebp)
  c8:	89 d3                	mov    %edx,%ebx
  ca:	83 e3 0f             	and    $0xf,%ebx
  cd:	89 5d b4             	mov    %ebx,-0x4c(%ebp)
  d0:	8b 45 b0             	mov    -0x50(%ebp),%eax
  d3:	8b 55 b4             	mov    -0x4c(%ebp),%edx
  d6:	89 c8                	mov    %ecx,%eax
  d8:	c1 e0 02             	shl    $0x2,%eax
  db:	83 c0 0f             	add    $0xf,%eax
  de:	83 c0 0f             	add    $0xf,%eax
  e1:	c1 e8 04             	shr    $0x4,%eax
  e4:	c1 e0 04             	shl    $0x4,%eax
  e7:	29 c4                	sub    %eax,%esp
  e9:	8d 44 24 0c          	lea    0xc(%esp),%eax
  ed:	83 c0 0f             	add    $0xf,%eax
  f0:	c1 e8 04             	shr    $0x4,%eax
  f3:	c1 e0 04             	shl    $0x4,%eax
  f6:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    //init ttable;
    lock_init(&ttable.lock);
  f9:	c7 04 24 a0 0e 00 00 	movl   $0xea0,(%esp)
 100:	e8 31 0b 00 00       	call   c36 <lock_init>
    ttable.total = 0;
 105:	c7 05 a4 11 00 00 00 	movl   $0x0,0x11a4
 10c:	00 00 00 
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 10f:	c7 45 dc a4 0e 00 00 	movl   $0xea4,-0x24(%ebp)
 116:	eb 0d                	jmp    125 <main+0x125>
        t->tid = 0;
 118:	8b 45 dc             	mov    -0x24(%ebp),%eax
 11b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    void * slist[numthreads];

    //init ttable;
    lock_init(&ttable.lock);
    ttable.total = 0;
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 121:	83 45 dc 0c          	addl   $0xc,-0x24(%ebp)
 125:	b8 a4 11 00 00       	mov    $0x11a4,%eax
 12a:	39 45 dc             	cmp    %eax,-0x24(%ebp)
 12d:	72 e9                	jb     118 <main+0x118>
        t->tid = 0;
    }
    //init stack list
    for(i = 0; i < 64;i++){
 12f:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 136:	eb 11                	jmp    149 <main+0x149>
        slist[i]=0;
 138:	8b 55 d8             	mov    -0x28(%ebp),%edx
 13b:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 13e:	c7 04 90 00 00 00 00 	movl   $0x0,(%eax,%edx,4)
    ttable.total = 0;
    for(t=ttable.thread;t < &ttable.thread[64];t++){
        t->tid = 0;
    }
    //init stack list
    for(i = 0; i < 64;i++){
 145:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
 149:	83 7d d8 3f          	cmpl   $0x3f,-0x28(%ebp)
 14d:	7e e9                	jle    138 <main+0x138>
        slist[i]=0;
    }
    //init frisbee
    lock_init(&frisbee.lock);
 14f:	c7 04 24 a8 11 00 00 	movl   $0x11a8,(%esp)
 156:	e8 db 0a 00 00       	call   c36 <lock_init>
    frisbee.pass = 0;
 15b:	c7 05 ac 11 00 00 00 	movl   $0x0,0x11ac
 162:	00 00 00 
    frisbee.holding_thread = 0;
 165:	c7 05 b0 11 00 00 00 	movl   $0x0,0x11b0
 16c:	00 00 00 

    printf(1,"\nnum of threads %d \n",numthreads);
 16f:	a1 80 0e 00 00       	mov    0xe80,%eax
 174:	89 44 24 08          	mov    %eax,0x8(%esp)
 178:	c7 44 24 04 65 0d 00 	movl   $0xd65,0x4(%esp)
 17f:	00 
 180:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 187:	e8 c9 06 00 00       	call   855 <printf>
    printf(1,"num of passes %d \n\n",numpass);
 18c:	a1 84 0e 00 00       	mov    0xe84,%eax
 191:	89 44 24 08          	mov    %eax,0x8(%esp)
 195:	c7 44 24 04 7a 0d 00 	movl   $0xd7a,0x4(%esp)
 19c:	00 
 19d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1a4:	e8 ac 06 00 00       	call   855 <printf>


    for(i=0; i<numthreads;i++){
 1a9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 1b0:	eb 43                	jmp    1f5 <main+0x1f5>
        void *stack = thread_create(pass_next,(void *)0);      
 1b2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b9:	00 
 1ba:	c7 04 24 a0 02 00 00 	movl   $0x2a0,(%esp)
 1c1:	e8 b8 0a 00 00       	call   c7e <thread_create>
 1c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
        if(stack == 0)
 1c9:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 1cd:	75 16                	jne    1e5 <main+0x1e5>
            printf(1,"thread_create fail\n");
 1cf:	c7 44 24 04 8e 0d 00 	movl   $0xd8e,0x4(%esp)
 1d6:	00 
 1d7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1de:	e8 72 06 00 00       	call   855 <printf>
 1e3:	eb 0c                	jmp    1f1 <main+0x1f1>
        else{
            slist[i] = stack;
 1e5:	8b 55 d8             	mov    -0x28(%ebp),%edx
 1e8:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 1eb:	8b 4d e0             	mov    -0x20(%ebp),%ecx
 1ee:	89 0c 90             	mov    %ecx,(%eax,%edx,4)

    printf(1,"\nnum of threads %d \n",numthreads);
    printf(1,"num of passes %d \n\n",numpass);


    for(i=0; i<numthreads;i++){
 1f1:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
 1f5:	a1 80 0e 00 00       	mov    0xe80,%eax
 1fa:	39 45 d8             	cmp    %eax,-0x28(%ebp)
 1fd:	7c b3                	jl     1b2 <main+0x1b2>
        else{
            slist[i] = stack;
        }
    }
//    sleep(5);
    for(i=0;i<numthreads;i++){
 1ff:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 206:	eb 0e                	jmp    216 <main+0x216>
        if(wait() == -1)
 208:	e8 c7 04 00 00       	call   6d4 <wait>
 20d:	83 f8 ff             	cmp    $0xffffffff,%eax
 210:	74 10                	je     222 <main+0x222>
        else{
            slist[i] = stack;
        }
    }
//    sleep(5);
    for(i=0;i<numthreads;i++){
 212:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
 216:	a1 80 0e 00 00       	mov    0xe80,%eax
 21b:	39 45 d8             	cmp    %eax,-0x28(%ebp)
 21e:	7c e8                	jl     208 <main+0x208>
 220:	eb 01                	jmp    223 <main+0x223>
        if(wait() == -1)
            break;
 222:	90                   	nop
    }
   // add printf for tid look up.  
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 223:	c7 45 dc a4 0e 00 00 	movl   $0xea4,-0x24(%ebp)
 22a:	eb 2a                	jmp    256 <main+0x256>
        if(t->tid != 0)
 22c:	8b 45 dc             	mov    -0x24(%ebp),%eax
 22f:	8b 00                	mov    (%eax),%eax
 231:	85 c0                	test   %eax,%eax
 233:	74 1d                	je     252 <main+0x252>
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
 235:	8b 45 dc             	mov    -0x24(%ebp),%eax
 238:	8b 00                	mov    (%eax),%eax
 23a:	89 44 24 08          	mov    %eax,0x8(%esp)
 23e:	c7 44 24 04 a4 0d 00 	movl   $0xda4,0x4(%esp)
 245:	00 
 246:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 24d:	e8 03 06 00 00       	call   855 <printf>
    for(i=0;i<numthreads;i++){
        if(wait() == -1)
            break;
    }
   // add printf for tid look up.  
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 252:	83 45 dc 0c          	addl   $0xc,-0x24(%ebp)
 256:	b8 a4 11 00 00       	mov    $0x11a4,%eax
 25b:	39 45 dc             	cmp    %eax,-0x24(%ebp)
 25e:	72 cc                	jb     22c <main+0x22c>
        if(t->tid != 0)
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
    }

    //free stacks
    for(i=0;i<numthreads;i++){
 260:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 267:	eb 28                	jmp    291 <main+0x291>
        if(slist[i] != 0){
 269:	8b 55 d8             	mov    -0x28(%ebp),%edx
 26c:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 26f:	8b 04 90             	mov    (%eax,%edx,4),%eax
 272:	85 c0                	test   %eax,%eax
 274:	74 17                	je     28d <main+0x28d>
            void * f = slist[i];
 276:	8b 55 d8             	mov    -0x28(%ebp),%edx
 279:	8b 45 d4             	mov    -0x2c(%ebp),%eax
 27c:	8b 04 90             	mov    (%eax,%edx,4),%eax
 27f:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            free(f);
 282:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 285:	89 04 24             	mov    %eax,(%esp)
 288:	e8 7f 07 00 00       	call   a0c <free>
        if(t->tid != 0)
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
    }

    //free stacks
    for(i=0;i<numthreads;i++){
 28d:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
 291:	a1 80 0e 00 00       	mov    0xe80,%eax
 296:	39 45 d8             	cmp    %eax,-0x28(%ebp)
 299:	7c ce                	jl     269 <main+0x269>
        if(slist[i] != 0){
            void * f = slist[i];
            free(f);
        }
    }
    exit();
 29b:	e8 2c 04 00 00       	call   6cc <exit>

000002a0 <pass_next>:
}

void pass_next(void *arg){
 2a0:	55                   	push   %ebp
 2a1:	89 e5                	mov    %esp,%ebp
 2a3:	83 ec 28             	sub    $0x28,%esp
    struct thread *t;
    int tid;

    tid = getpid();
 2a6:	e8 a1 04 00 00       	call   74c <getpid>
 2ab:	89 45 f4             	mov    %eax,-0xc(%ebp)

    lock_acquire(&ttable.lock);
 2ae:	c7 04 24 a0 0e 00 00 	movl   $0xea0,(%esp)
 2b5:	e8 8a 09 00 00       	call   c44 <lock_acquire>
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 2ba:	c7 45 f0 a4 0e 00 00 	movl   $0xea4,-0x10(%ebp)
 2c1:	eb 17                	jmp    2da <pass_next+0x3a>
        if(t->tid == 0){
 2c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2c6:	8b 00                	mov    (%eax),%eax
 2c8:	85 c0                	test   %eax,%eax
 2ca:	75 0a                	jne    2d6 <pass_next+0x36>
            t->tid = tid;
 2cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 2d2:	89 10                	mov    %edx,(%eax)
            break;
 2d4:	eb 0e                	jmp    2e4 <pass_next+0x44>
    int tid;

    tid = getpid();

    lock_acquire(&ttable.lock);
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 2d6:	83 45 f0 0c          	addl   $0xc,-0x10(%ebp)
 2da:	b8 a4 11 00 00       	mov    $0x11a4,%eax
 2df:	39 45 f0             	cmp    %eax,-0x10(%ebp)
 2e2:	72 df                	jb     2c3 <pass_next+0x23>
        if(t->tid == 0){
            t->tid = tid;
            break;
        } 
    }
    ttable.total++;
 2e4:	a1 a4 11 00 00       	mov    0x11a4,%eax
 2e9:	83 c0 01             	add    $0x1,%eax
 2ec:	a3 a4 11 00 00       	mov    %eax,0x11a4
    lock_release(&ttable.lock);
 2f1:	c7 04 24 a0 0e 00 00 	movl   $0xea0,(%esp)
 2f8:	e8 66 09 00 00       	call   c63 <lock_release>

   for(;;){
        lock_acquire(&ttable.lock);
 2fd:	c7 04 24 a0 0e 00 00 	movl   $0xea0,(%esp)
 304:	e8 3b 09 00 00       	call   c44 <lock_acquire>
        if(ttable.total == numthreads){
 309:	8b 15 a4 11 00 00    	mov    0x11a4,%edx
 30f:	a1 80 0e 00 00       	mov    0xe80,%eax
 314:	39 c2                	cmp    %eax,%edx
 316:	75 39                	jne    351 <pass_next+0xb1>
            printf(1," tid %d ready to go\n",t->tid);
 318:	8b 45 f0             	mov    -0x10(%ebp),%eax
 31b:	8b 00                	mov    (%eax),%eax
 31d:	89 44 24 08          	mov    %eax,0x8(%esp)
 321:	c7 44 24 04 cc 0d 00 	movl   $0xdcc,0x4(%esp)
 328:	00 
 329:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 330:	e8 20 05 00 00       	call   855 <printf>
            barrier++;
 335:	a1 88 0e 00 00       	mov    0xe88,%eax
 33a:	83 c0 01             	add    $0x1,%eax
 33d:	a3 88 0e 00 00       	mov    %eax,0xe88
            goto start;
 342:	90                   	nop
        lock_release(&ttable.lock);
    }
    
//barriar above
start:
     lock_release(&ttable.lock);
 343:	c7 04 24 a0 0e 00 00 	movl   $0xea0,(%esp)
 34a:	e8 14 09 00 00       	call   c63 <lock_release>
 34f:	eb 0e                	jmp    35f <pass_next+0xbf>
        if(ttable.total == numthreads){
            printf(1," tid %d ready to go\n",t->tid);
            barrier++;
            goto start;
        }
        lock_release(&ttable.lock);
 351:	c7 04 24 a0 0e 00 00 	movl   $0xea0,(%esp)
 358:	e8 06 09 00 00       	call   c63 <lock_release>
    }
 35d:	eb 9e                	jmp    2fd <pass_next+0x5d>
    
//barriar above
start:
     lock_release(&ttable.lock);
     while(barrier != numthreads);
 35f:	8b 15 88 0e 00 00    	mov    0xe88,%edx
 365:	a1 80 0e 00 00       	mov    0xe80,%eax
 36a:	39 c2                	cmp    %eax,%edx
 36c:	75 f1                	jne    35f <pass_next+0xbf>
    //throw frisbee
    do{
        lock_acquire(&frisbee.lock);
 36e:	c7 04 24 a8 11 00 00 	movl   $0x11a8,(%esp)
 375:	e8 ca 08 00 00       	call   c44 <lock_acquire>
        if(frisbee.pass > numpass){
 37a:	8b 15 ac 11 00 00    	mov    0x11ac,%edx
 380:	a1 84 0e 00 00       	mov    0xe84,%eax
 385:	39 c2                	cmp    %eax,%edx
 387:	7e 39                	jle    3c2 <pass_next+0x122>
            lock_release(&frisbee.lock);
 389:	c7 04 24 a8 11 00 00 	movl   $0x11a8,(%esp)
 390:	e8 ce 08 00 00       	call   c63 <lock_release>
            goto leaving;
 395:	90                   	nop
        frisbee.holding_thread = tid;
        lock_release(&frisbee.lock);
    }while(1);

leaving: 
    lock_release(&frisbee.lock);
 396:	c7 04 24 a8 11 00 00 	movl   $0x11a8,(%esp)
 39d:	e8 c1 08 00 00       	call   c63 <lock_release>
    printf(1,"thread %d out of game\n",tid);
 3a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a5:	89 44 24 08          	mov    %eax,0x8(%esp)
 3a9:	c7 44 24 04 18 0e 00 	movl   $0xe18,0x4(%esp)
 3b0:	00 
 3b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b8:	e8 98 04 00 00       	call   855 <printf>
    texit();
 3bd:	e8 b2 03 00 00       	call   774 <texit>
        lock_acquire(&frisbee.lock);
        if(frisbee.pass > numpass){
            lock_release(&frisbee.lock);
            goto leaving;
        }
        if(frisbee.holding_thread == tid){
 3c2:	a1 b0 11 00 00       	mov    0x11b0,%eax
 3c7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 3ca:	75 1b                	jne    3e7 <pass_next+0x147>
            lock_release(&frisbee.lock);
 3cc:	c7 04 24 a8 11 00 00 	movl   $0x11a8,(%esp)
 3d3:	e8 8b 08 00 00       	call   c63 <lock_release>
            sleep(5);
 3d8:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 3df:	e8 78 03 00 00       	call   75c <sleep>
            continue;
 3e4:	90                   	nop
        printf(1,"pass: %d, thread %d catch the frisbee. throwing...\n",
                frisbee.pass, tid);
        frisbee.pass++;
        frisbee.holding_thread = tid;
        lock_release(&frisbee.lock);
    }while(1);
 3e5:	eb 87                	jmp    36e <pass_next+0xce>
        if(frisbee.holding_thread == tid){
            lock_release(&frisbee.lock);
            sleep(5);
            continue;
        }
        printf(1,"pass: %d, thread %d catch the frisbee. throwing...\n",
 3e7:	a1 ac 11 00 00       	mov    0x11ac,%eax
 3ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3ef:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3f3:	89 44 24 08          	mov    %eax,0x8(%esp)
 3f7:	c7 44 24 04 e4 0d 00 	movl   $0xde4,0x4(%esp)
 3fe:	00 
 3ff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 406:	e8 4a 04 00 00       	call   855 <printf>
                frisbee.pass, tid);
        frisbee.pass++;
 40b:	a1 ac 11 00 00       	mov    0x11ac,%eax
 410:	83 c0 01             	add    $0x1,%eax
 413:	a3 ac 11 00 00       	mov    %eax,0x11ac
        frisbee.holding_thread = tid;
 418:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41b:	a3 b0 11 00 00       	mov    %eax,0x11b0
        lock_release(&frisbee.lock);
 420:	c7 04 24 a8 11 00 00 	movl   $0x11a8,(%esp)
 427:	e8 37 08 00 00       	call   c63 <lock_release>
    }while(1);
 42c:	e9 3d ff ff ff       	jmp    36e <pass_next+0xce>

00000431 <lookup>:
    lock_release(&frisbee.lock);
    printf(1,"thread %d out of game\n",tid);
    texit();
}

int lookup(int num_threads){
 431:	55                   	push   %ebp
 432:	89 e5                	mov    %esp,%ebp
 434:	83 ec 10             	sub    $0x10,%esp
    int i;
    struct thread *t;
    i = 0;
 437:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)
    for(t=ttable.thread;t<&ttable.thread[64];t++){
 43e:	c7 45 fc a4 0e 00 00 	movl   $0xea4,-0x4(%ebp)
 445:	eb 11                	jmp    458 <lookup+0x27>
        if(t->tid != 0){
 447:	8b 45 fc             	mov    -0x4(%ebp),%eax
 44a:	8b 00                	mov    (%eax),%eax
 44c:	85 c0                	test   %eax,%eax
 44e:	74 04                	je     454 <lookup+0x23>
            i++;
 450:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)

int lookup(int num_threads){
    int i;
    struct thread *t;
    i = 0;
    for(t=ttable.thread;t<&ttable.thread[64];t++){
 454:	83 45 fc 0c          	addl   $0xc,-0x4(%ebp)
 458:	b8 a4 11 00 00       	mov    $0x11a4,%eax
 45d:	39 45 fc             	cmp    %eax,-0x4(%ebp)
 460:	72 e5                	jb     447 <lookup+0x16>
        if(t->tid != 0){
            i++;
        }
    }
    return i;
 462:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
 465:	c9                   	leave  
 466:	c3                   	ret    
 467:	90                   	nop

00000468 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 468:	55                   	push   %ebp
 469:	89 e5                	mov    %esp,%ebp
 46b:	57                   	push   %edi
 46c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 46d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 470:	8b 55 10             	mov    0x10(%ebp),%edx
 473:	8b 45 0c             	mov    0xc(%ebp),%eax
 476:	89 cb                	mov    %ecx,%ebx
 478:	89 df                	mov    %ebx,%edi
 47a:	89 d1                	mov    %edx,%ecx
 47c:	fc                   	cld    
 47d:	f3 aa                	rep stos %al,%es:(%edi)
 47f:	89 ca                	mov    %ecx,%edx
 481:	89 fb                	mov    %edi,%ebx
 483:	89 5d 08             	mov    %ebx,0x8(%ebp)
 486:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 489:	5b                   	pop    %ebx
 48a:	5f                   	pop    %edi
 48b:	5d                   	pop    %ebp
 48c:	c3                   	ret    

0000048d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 48d:	55                   	push   %ebp
 48e:	89 e5                	mov    %esp,%ebp
 490:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 493:	8b 45 08             	mov    0x8(%ebp),%eax
 496:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 499:	8b 45 0c             	mov    0xc(%ebp),%eax
 49c:	0f b6 10             	movzbl (%eax),%edx
 49f:	8b 45 08             	mov    0x8(%ebp),%eax
 4a2:	88 10                	mov    %dl,(%eax)
 4a4:	8b 45 08             	mov    0x8(%ebp),%eax
 4a7:	0f b6 00             	movzbl (%eax),%eax
 4aa:	84 c0                	test   %al,%al
 4ac:	0f 95 c0             	setne  %al
 4af:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 4b3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 4b7:	84 c0                	test   %al,%al
 4b9:	75 de                	jne    499 <strcpy+0xc>
    ;
  return os;
 4bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4be:	c9                   	leave  
 4bf:	c3                   	ret    

000004c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 4c0:	55                   	push   %ebp
 4c1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 4c3:	eb 08                	jmp    4cd <strcmp+0xd>
    p++, q++;
 4c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 4c9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
 4d0:	0f b6 00             	movzbl (%eax),%eax
 4d3:	84 c0                	test   %al,%al
 4d5:	74 10                	je     4e7 <strcmp+0x27>
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
 4da:	0f b6 10             	movzbl (%eax),%edx
 4dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e0:	0f b6 00             	movzbl (%eax),%eax
 4e3:	38 c2                	cmp    %al,%dl
 4e5:	74 de                	je     4c5 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 4e7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ea:	0f b6 00             	movzbl (%eax),%eax
 4ed:	0f b6 d0             	movzbl %al,%edx
 4f0:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f3:	0f b6 00             	movzbl (%eax),%eax
 4f6:	0f b6 c0             	movzbl %al,%eax
 4f9:	89 d1                	mov    %edx,%ecx
 4fb:	29 c1                	sub    %eax,%ecx
 4fd:	89 c8                	mov    %ecx,%eax
}
 4ff:	5d                   	pop    %ebp
 500:	c3                   	ret    

00000501 <strlen>:

uint
strlen(char *s)
{
 501:	55                   	push   %ebp
 502:	89 e5                	mov    %esp,%ebp
 504:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 507:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 50e:	eb 04                	jmp    514 <strlen+0x13>
 510:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 514:	8b 45 fc             	mov    -0x4(%ebp),%eax
 517:	03 45 08             	add    0x8(%ebp),%eax
 51a:	0f b6 00             	movzbl (%eax),%eax
 51d:	84 c0                	test   %al,%al
 51f:	75 ef                	jne    510 <strlen+0xf>
    ;
  return n;
 521:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 524:	c9                   	leave  
 525:	c3                   	ret    

00000526 <memset>:

void*
memset(void *dst, int c, uint n)
{
 526:	55                   	push   %ebp
 527:	89 e5                	mov    %esp,%ebp
 529:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 52c:	8b 45 10             	mov    0x10(%ebp),%eax
 52f:	89 44 24 08          	mov    %eax,0x8(%esp)
 533:	8b 45 0c             	mov    0xc(%ebp),%eax
 536:	89 44 24 04          	mov    %eax,0x4(%esp)
 53a:	8b 45 08             	mov    0x8(%ebp),%eax
 53d:	89 04 24             	mov    %eax,(%esp)
 540:	e8 23 ff ff ff       	call   468 <stosb>
  return dst;
 545:	8b 45 08             	mov    0x8(%ebp),%eax
}
 548:	c9                   	leave  
 549:	c3                   	ret    

0000054a <strchr>:

char*
strchr(const char *s, char c)
{
 54a:	55                   	push   %ebp
 54b:	89 e5                	mov    %esp,%ebp
 54d:	83 ec 04             	sub    $0x4,%esp
 550:	8b 45 0c             	mov    0xc(%ebp),%eax
 553:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 556:	eb 14                	jmp    56c <strchr+0x22>
    if(*s == c)
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	0f b6 00             	movzbl (%eax),%eax
 55e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 561:	75 05                	jne    568 <strchr+0x1e>
      return (char*)s;
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	eb 13                	jmp    57b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 568:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 56c:	8b 45 08             	mov    0x8(%ebp),%eax
 56f:	0f b6 00             	movzbl (%eax),%eax
 572:	84 c0                	test   %al,%al
 574:	75 e2                	jne    558 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 576:	b8 00 00 00 00       	mov    $0x0,%eax
}
 57b:	c9                   	leave  
 57c:	c3                   	ret    

0000057d <gets>:

char*
gets(char *buf, int max)
{
 57d:	55                   	push   %ebp
 57e:	89 e5                	mov    %esp,%ebp
 580:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 583:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 58a:	eb 44                	jmp    5d0 <gets+0x53>
    cc = read(0, &c, 1);
 58c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 593:	00 
 594:	8d 45 ef             	lea    -0x11(%ebp),%eax
 597:	89 44 24 04          	mov    %eax,0x4(%esp)
 59b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 5a2:	e8 3d 01 00 00       	call   6e4 <read>
 5a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 5aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5ae:	7e 2d                	jle    5dd <gets+0x60>
      break;
    buf[i++] = c;
 5b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5b3:	03 45 08             	add    0x8(%ebp),%eax
 5b6:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 5ba:	88 10                	mov    %dl,(%eax)
 5bc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 5c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 5c4:	3c 0a                	cmp    $0xa,%al
 5c6:	74 16                	je     5de <gets+0x61>
 5c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 5cc:	3c 0d                	cmp    $0xd,%al
 5ce:	74 0e                	je     5de <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5d3:	83 c0 01             	add    $0x1,%eax
 5d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 5d9:	7c b1                	jl     58c <gets+0xf>
 5db:	eb 01                	jmp    5de <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 5dd:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 5de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5e1:	03 45 08             	add    0x8(%ebp),%eax
 5e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 5e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5ea:	c9                   	leave  
 5eb:	c3                   	ret    

000005ec <stat>:

int
stat(char *n, struct stat *st)
{
 5ec:	55                   	push   %ebp
 5ed:	89 e5                	mov    %esp,%ebp
 5ef:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5f2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 5f9:	00 
 5fa:	8b 45 08             	mov    0x8(%ebp),%eax
 5fd:	89 04 24             	mov    %eax,(%esp)
 600:	e8 07 01 00 00       	call   70c <open>
 605:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 608:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 60c:	79 07                	jns    615 <stat+0x29>
    return -1;
 60e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 613:	eb 23                	jmp    638 <stat+0x4c>
  r = fstat(fd, st);
 615:	8b 45 0c             	mov    0xc(%ebp),%eax
 618:	89 44 24 04          	mov    %eax,0x4(%esp)
 61c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 61f:	89 04 24             	mov    %eax,(%esp)
 622:	e8 fd 00 00 00       	call   724 <fstat>
 627:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 62a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 62d:	89 04 24             	mov    %eax,(%esp)
 630:	e8 bf 00 00 00       	call   6f4 <close>
  return r;
 635:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 638:	c9                   	leave  
 639:	c3                   	ret    

0000063a <atoi>:

int
atoi(const char *s)
{
 63a:	55                   	push   %ebp
 63b:	89 e5                	mov    %esp,%ebp
 63d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 640:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 647:	eb 24                	jmp    66d <atoi+0x33>
    n = n*10 + *s++ - '0';
 649:	8b 55 fc             	mov    -0x4(%ebp),%edx
 64c:	89 d0                	mov    %edx,%eax
 64e:	c1 e0 02             	shl    $0x2,%eax
 651:	01 d0                	add    %edx,%eax
 653:	01 c0                	add    %eax,%eax
 655:	89 c2                	mov    %eax,%edx
 657:	8b 45 08             	mov    0x8(%ebp),%eax
 65a:	0f b6 00             	movzbl (%eax),%eax
 65d:	0f be c0             	movsbl %al,%eax
 660:	8d 04 02             	lea    (%edx,%eax,1),%eax
 663:	83 e8 30             	sub    $0x30,%eax
 666:	89 45 fc             	mov    %eax,-0x4(%ebp)
 669:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	0f b6 00             	movzbl (%eax),%eax
 673:	3c 2f                	cmp    $0x2f,%al
 675:	7e 0a                	jle    681 <atoi+0x47>
 677:	8b 45 08             	mov    0x8(%ebp),%eax
 67a:	0f b6 00             	movzbl (%eax),%eax
 67d:	3c 39                	cmp    $0x39,%al
 67f:	7e c8                	jle    649 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 681:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 684:	c9                   	leave  
 685:	c3                   	ret    

00000686 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 686:	55                   	push   %ebp
 687:	89 e5                	mov    %esp,%ebp
 689:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 68c:	8b 45 08             	mov    0x8(%ebp),%eax
 68f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 692:	8b 45 0c             	mov    0xc(%ebp),%eax
 695:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 698:	eb 13                	jmp    6ad <memmove+0x27>
    *dst++ = *src++;
 69a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69d:	0f b6 10             	movzbl (%eax),%edx
 6a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a3:	88 10                	mov    %dl,(%eax)
 6a5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 6a9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 6ad:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 6b1:	0f 9f c0             	setg   %al
 6b4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 6b8:	84 c0                	test   %al,%al
 6ba:	75 de                	jne    69a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 6bc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 6bf:	c9                   	leave  
 6c0:	c3                   	ret    
 6c1:	90                   	nop
 6c2:	90                   	nop
 6c3:	90                   	nop

000006c4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 6c4:	b8 01 00 00 00       	mov    $0x1,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <exit>:
SYSCALL(exit)
 6cc:	b8 02 00 00 00       	mov    $0x2,%eax
 6d1:	cd 40                	int    $0x40
 6d3:	c3                   	ret    

000006d4 <wait>:
SYSCALL(wait)
 6d4:	b8 03 00 00 00       	mov    $0x3,%eax
 6d9:	cd 40                	int    $0x40
 6db:	c3                   	ret    

000006dc <pipe>:
SYSCALL(pipe)
 6dc:	b8 04 00 00 00       	mov    $0x4,%eax
 6e1:	cd 40                	int    $0x40
 6e3:	c3                   	ret    

000006e4 <read>:
SYSCALL(read)
 6e4:	b8 05 00 00 00       	mov    $0x5,%eax
 6e9:	cd 40                	int    $0x40
 6eb:	c3                   	ret    

000006ec <write>:
SYSCALL(write)
 6ec:	b8 10 00 00 00       	mov    $0x10,%eax
 6f1:	cd 40                	int    $0x40
 6f3:	c3                   	ret    

000006f4 <close>:
SYSCALL(close)
 6f4:	b8 15 00 00 00       	mov    $0x15,%eax
 6f9:	cd 40                	int    $0x40
 6fb:	c3                   	ret    

000006fc <kill>:
SYSCALL(kill)
 6fc:	b8 06 00 00 00       	mov    $0x6,%eax
 701:	cd 40                	int    $0x40
 703:	c3                   	ret    

00000704 <exec>:
SYSCALL(exec)
 704:	b8 07 00 00 00       	mov    $0x7,%eax
 709:	cd 40                	int    $0x40
 70b:	c3                   	ret    

0000070c <open>:
SYSCALL(open)
 70c:	b8 0f 00 00 00       	mov    $0xf,%eax
 711:	cd 40                	int    $0x40
 713:	c3                   	ret    

00000714 <mknod>:
SYSCALL(mknod)
 714:	b8 11 00 00 00       	mov    $0x11,%eax
 719:	cd 40                	int    $0x40
 71b:	c3                   	ret    

0000071c <unlink>:
SYSCALL(unlink)
 71c:	b8 12 00 00 00       	mov    $0x12,%eax
 721:	cd 40                	int    $0x40
 723:	c3                   	ret    

00000724 <fstat>:
SYSCALL(fstat)
 724:	b8 08 00 00 00       	mov    $0x8,%eax
 729:	cd 40                	int    $0x40
 72b:	c3                   	ret    

0000072c <link>:
SYSCALL(link)
 72c:	b8 13 00 00 00       	mov    $0x13,%eax
 731:	cd 40                	int    $0x40
 733:	c3                   	ret    

00000734 <mkdir>:
SYSCALL(mkdir)
 734:	b8 14 00 00 00       	mov    $0x14,%eax
 739:	cd 40                	int    $0x40
 73b:	c3                   	ret    

0000073c <chdir>:
SYSCALL(chdir)
 73c:	b8 09 00 00 00       	mov    $0x9,%eax
 741:	cd 40                	int    $0x40
 743:	c3                   	ret    

00000744 <dup>:
SYSCALL(dup)
 744:	b8 0a 00 00 00       	mov    $0xa,%eax
 749:	cd 40                	int    $0x40
 74b:	c3                   	ret    

0000074c <getpid>:
SYSCALL(getpid)
 74c:	b8 0b 00 00 00       	mov    $0xb,%eax
 751:	cd 40                	int    $0x40
 753:	c3                   	ret    

00000754 <sbrk>:
SYSCALL(sbrk)
 754:	b8 0c 00 00 00       	mov    $0xc,%eax
 759:	cd 40                	int    $0x40
 75b:	c3                   	ret    

0000075c <sleep>:
SYSCALL(sleep)
 75c:	b8 0d 00 00 00       	mov    $0xd,%eax
 761:	cd 40                	int    $0x40
 763:	c3                   	ret    

00000764 <uptime>:
SYSCALL(uptime)
 764:	b8 0e 00 00 00       	mov    $0xe,%eax
 769:	cd 40                	int    $0x40
 76b:	c3                   	ret    

0000076c <clone>:
SYSCALL(clone)
 76c:	b8 16 00 00 00       	mov    $0x16,%eax
 771:	cd 40                	int    $0x40
 773:	c3                   	ret    

00000774 <texit>:
SYSCALL(texit)
 774:	b8 17 00 00 00       	mov    $0x17,%eax
 779:	cd 40                	int    $0x40
 77b:	c3                   	ret    

0000077c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 77c:	55                   	push   %ebp
 77d:	89 e5                	mov    %esp,%ebp
 77f:	83 ec 28             	sub    $0x28,%esp
 782:	8b 45 0c             	mov    0xc(%ebp),%eax
 785:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 788:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 78f:	00 
 790:	8d 45 f4             	lea    -0xc(%ebp),%eax
 793:	89 44 24 04          	mov    %eax,0x4(%esp)
 797:	8b 45 08             	mov    0x8(%ebp),%eax
 79a:	89 04 24             	mov    %eax,(%esp)
 79d:	e8 4a ff ff ff       	call   6ec <write>
}
 7a2:	c9                   	leave  
 7a3:	c3                   	ret    

000007a4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7a4:	55                   	push   %ebp
 7a5:	89 e5                	mov    %esp,%ebp
 7a7:	53                   	push   %ebx
 7a8:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7ab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 7b2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 7b6:	74 17                	je     7cf <printint+0x2b>
 7b8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7bc:	79 11                	jns    7cf <printint+0x2b>
    neg = 1;
 7be:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 7c8:	f7 d8                	neg    %eax
 7ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7cd:	eb 06                	jmp    7d5 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 7cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 7d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 7d5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 7dc:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 7df:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e5:	ba 00 00 00 00       	mov    $0x0,%edx
 7ea:	f7 f3                	div    %ebx
 7ec:	89 d0                	mov    %edx,%eax
 7ee:	0f b6 80 64 0e 00 00 	movzbl 0xe64(%eax),%eax
 7f5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 7f9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 7fd:	8b 45 10             	mov    0x10(%ebp),%eax
 800:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 803:	8b 45 f4             	mov    -0xc(%ebp),%eax
 806:	ba 00 00 00 00       	mov    $0x0,%edx
 80b:	f7 75 d4             	divl   -0x2c(%ebp)
 80e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 811:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 815:	75 c5                	jne    7dc <printint+0x38>
  if(neg)
 817:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 81b:	74 28                	je     845 <printint+0xa1>
    buf[i++] = '-';
 81d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 820:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 825:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 829:	eb 1a                	jmp    845 <printint+0xa1>
    putc(fd, buf[i]);
 82b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 82e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 833:	0f be c0             	movsbl %al,%eax
 836:	89 44 24 04          	mov    %eax,0x4(%esp)
 83a:	8b 45 08             	mov    0x8(%ebp),%eax
 83d:	89 04 24             	mov    %eax,(%esp)
 840:	e8 37 ff ff ff       	call   77c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 845:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 849:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 84d:	79 dc                	jns    82b <printint+0x87>
    putc(fd, buf[i]);
}
 84f:	83 c4 44             	add    $0x44,%esp
 852:	5b                   	pop    %ebx
 853:	5d                   	pop    %ebp
 854:	c3                   	ret    

00000855 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 855:	55                   	push   %ebp
 856:	89 e5                	mov    %esp,%ebp
 858:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 85b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 862:	8d 45 0c             	lea    0xc(%ebp),%eax
 865:	83 c0 04             	add    $0x4,%eax
 868:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 86b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 872:	e9 7e 01 00 00       	jmp    9f5 <printf+0x1a0>
    c = fmt[i] & 0xff;
 877:	8b 55 0c             	mov    0xc(%ebp),%edx
 87a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 87d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 880:	0f b6 00             	movzbl (%eax),%eax
 883:	0f be c0             	movsbl %al,%eax
 886:	25 ff 00 00 00       	and    $0xff,%eax
 88b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 88e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 892:	75 2c                	jne    8c0 <printf+0x6b>
      if(c == '%'){
 894:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 898:	75 0c                	jne    8a6 <printf+0x51>
        state = '%';
 89a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 8a1:	e9 4b 01 00 00       	jmp    9f1 <printf+0x19c>
      } else {
        putc(fd, c);
 8a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8a9:	0f be c0             	movsbl %al,%eax
 8ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 8b0:	8b 45 08             	mov    0x8(%ebp),%eax
 8b3:	89 04 24             	mov    %eax,(%esp)
 8b6:	e8 c1 fe ff ff       	call   77c <putc>
 8bb:	e9 31 01 00 00       	jmp    9f1 <printf+0x19c>
      }
    } else if(state == '%'){
 8c0:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 8c4:	0f 85 27 01 00 00    	jne    9f1 <printf+0x19c>
      if(c == 'd'){
 8ca:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 8ce:	75 2d                	jne    8fd <printf+0xa8>
        printint(fd, *ap, 10, 1);
 8d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d3:	8b 00                	mov    (%eax),%eax
 8d5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8dc:	00 
 8dd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8e4:	00 
 8e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8e9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ec:	89 04 24             	mov    %eax,(%esp)
 8ef:	e8 b0 fe ff ff       	call   7a4 <printint>
        ap++;
 8f4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 8f8:	e9 ed 00 00 00       	jmp    9ea <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 8fd:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 901:	74 06                	je     909 <printf+0xb4>
 903:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 907:	75 2d                	jne    936 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 909:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90c:	8b 00                	mov    (%eax),%eax
 90e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 915:	00 
 916:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 91d:	00 
 91e:	89 44 24 04          	mov    %eax,0x4(%esp)
 922:	8b 45 08             	mov    0x8(%ebp),%eax
 925:	89 04 24             	mov    %eax,(%esp)
 928:	e8 77 fe ff ff       	call   7a4 <printint>
        ap++;
 92d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 931:	e9 b4 00 00 00       	jmp    9ea <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 936:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 93a:	75 46                	jne    982 <printf+0x12d>
        s = (char*)*ap;
 93c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93f:	8b 00                	mov    (%eax),%eax
 941:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 944:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 948:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 94c:	75 27                	jne    975 <printf+0x120>
          s = "(null)";
 94e:	c7 45 e4 2f 0e 00 00 	movl   $0xe2f,-0x1c(%ebp)
        while(*s != 0){
 955:	eb 1f                	jmp    976 <printf+0x121>
          putc(fd, *s);
 957:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 95a:	0f b6 00             	movzbl (%eax),%eax
 95d:	0f be c0             	movsbl %al,%eax
 960:	89 44 24 04          	mov    %eax,0x4(%esp)
 964:	8b 45 08             	mov    0x8(%ebp),%eax
 967:	89 04 24             	mov    %eax,(%esp)
 96a:	e8 0d fe ff ff       	call   77c <putc>
          s++;
 96f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 973:	eb 01                	jmp    976 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 975:	90                   	nop
 976:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 979:	0f b6 00             	movzbl (%eax),%eax
 97c:	84 c0                	test   %al,%al
 97e:	75 d7                	jne    957 <printf+0x102>
 980:	eb 68                	jmp    9ea <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 982:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 986:	75 1d                	jne    9a5 <printf+0x150>
        putc(fd, *ap);
 988:	8b 45 f4             	mov    -0xc(%ebp),%eax
 98b:	8b 00                	mov    (%eax),%eax
 98d:	0f be c0             	movsbl %al,%eax
 990:	89 44 24 04          	mov    %eax,0x4(%esp)
 994:	8b 45 08             	mov    0x8(%ebp),%eax
 997:	89 04 24             	mov    %eax,(%esp)
 99a:	e8 dd fd ff ff       	call   77c <putc>
        ap++;
 99f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 9a3:	eb 45                	jmp    9ea <printf+0x195>
      } else if(c == '%'){
 9a5:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 9a9:	75 17                	jne    9c2 <printf+0x16d>
        putc(fd, c);
 9ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9ae:	0f be c0             	movsbl %al,%eax
 9b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 9b5:	8b 45 08             	mov    0x8(%ebp),%eax
 9b8:	89 04 24             	mov    %eax,(%esp)
 9bb:	e8 bc fd ff ff       	call   77c <putc>
 9c0:	eb 28                	jmp    9ea <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9c2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9c9:	00 
 9ca:	8b 45 08             	mov    0x8(%ebp),%eax
 9cd:	89 04 24             	mov    %eax,(%esp)
 9d0:	e8 a7 fd ff ff       	call   77c <putc>
        putc(fd, c);
 9d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9d8:	0f be c0             	movsbl %al,%eax
 9db:	89 44 24 04          	mov    %eax,0x4(%esp)
 9df:	8b 45 08             	mov    0x8(%ebp),%eax
 9e2:	89 04 24             	mov    %eax,(%esp)
 9e5:	e8 92 fd ff ff       	call   77c <putc>
      }
      state = 0;
 9ea:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9f1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 9f5:	8b 55 0c             	mov    0xc(%ebp),%edx
 9f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9fb:	8d 04 02             	lea    (%edx,%eax,1),%eax
 9fe:	0f b6 00             	movzbl (%eax),%eax
 a01:	84 c0                	test   %al,%al
 a03:	0f 85 6e fe ff ff    	jne    877 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 a09:	c9                   	leave  
 a0a:	c3                   	ret    
 a0b:	90                   	nop

00000a0c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a0c:	55                   	push   %ebp
 a0d:	89 e5                	mov    %esp,%ebp
 a0f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a12:	8b 45 08             	mov    0x8(%ebp),%eax
 a15:	83 e8 08             	sub    $0x8,%eax
 a18:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a1b:	a1 94 0e 00 00       	mov    0xe94,%eax
 a20:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a23:	eb 24                	jmp    a49 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a25:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a28:	8b 00                	mov    (%eax),%eax
 a2a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a2d:	77 12                	ja     a41 <free+0x35>
 a2f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a32:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a35:	77 24                	ja     a5b <free+0x4f>
 a37:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a3a:	8b 00                	mov    (%eax),%eax
 a3c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a3f:	77 1a                	ja     a5b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a41:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a44:	8b 00                	mov    (%eax),%eax
 a46:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a49:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a4c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a4f:	76 d4                	jbe    a25 <free+0x19>
 a51:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a54:	8b 00                	mov    (%eax),%eax
 a56:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a59:	76 ca                	jbe    a25 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a5b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a5e:	8b 40 04             	mov    0x4(%eax),%eax
 a61:	c1 e0 03             	shl    $0x3,%eax
 a64:	89 c2                	mov    %eax,%edx
 a66:	03 55 f8             	add    -0x8(%ebp),%edx
 a69:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a6c:	8b 00                	mov    (%eax),%eax
 a6e:	39 c2                	cmp    %eax,%edx
 a70:	75 24                	jne    a96 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 a72:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a75:	8b 50 04             	mov    0x4(%eax),%edx
 a78:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a7b:	8b 00                	mov    (%eax),%eax
 a7d:	8b 40 04             	mov    0x4(%eax),%eax
 a80:	01 c2                	add    %eax,%edx
 a82:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a85:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 a88:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a8b:	8b 00                	mov    (%eax),%eax
 a8d:	8b 10                	mov    (%eax),%edx
 a8f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a92:	89 10                	mov    %edx,(%eax)
 a94:	eb 0a                	jmp    aa0 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 a96:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a99:	8b 10                	mov    (%eax),%edx
 a9b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a9e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 aa0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa3:	8b 40 04             	mov    0x4(%eax),%eax
 aa6:	c1 e0 03             	shl    $0x3,%eax
 aa9:	03 45 fc             	add    -0x4(%ebp),%eax
 aac:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 aaf:	75 20                	jne    ad1 <free+0xc5>
    p->s.size += bp->s.size;
 ab1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab4:	8b 50 04             	mov    0x4(%eax),%edx
 ab7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aba:	8b 40 04             	mov    0x4(%eax),%eax
 abd:	01 c2                	add    %eax,%edx
 abf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 ac5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ac8:	8b 10                	mov    (%eax),%edx
 aca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 acd:	89 10                	mov    %edx,(%eax)
 acf:	eb 08                	jmp    ad9 <free+0xcd>
  } else
    p->s.ptr = bp;
 ad1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 ad7:	89 10                	mov    %edx,(%eax)
  freep = p;
 ad9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 adc:	a3 94 0e 00 00       	mov    %eax,0xe94
}
 ae1:	c9                   	leave  
 ae2:	c3                   	ret    

00000ae3 <morecore>:

static Header*
morecore(uint nu)
{
 ae3:	55                   	push   %ebp
 ae4:	89 e5                	mov    %esp,%ebp
 ae6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 ae9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 af0:	77 07                	ja     af9 <morecore+0x16>
    nu = 4096;
 af2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 af9:	8b 45 08             	mov    0x8(%ebp),%eax
 afc:	c1 e0 03             	shl    $0x3,%eax
 aff:	89 04 24             	mov    %eax,(%esp)
 b02:	e8 4d fc ff ff       	call   754 <sbrk>
 b07:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 b0a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 b0e:	75 07                	jne    b17 <morecore+0x34>
    return 0;
 b10:	b8 00 00 00 00       	mov    $0x0,%eax
 b15:	eb 22                	jmp    b39 <morecore+0x56>
  hp = (Header*)p;
 b17:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 b1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b20:	8b 55 08             	mov    0x8(%ebp),%edx
 b23:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b26:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b29:	83 c0 08             	add    $0x8,%eax
 b2c:	89 04 24             	mov    %eax,(%esp)
 b2f:	e8 d8 fe ff ff       	call   a0c <free>
  return freep;
 b34:	a1 94 0e 00 00       	mov    0xe94,%eax
}
 b39:	c9                   	leave  
 b3a:	c3                   	ret    

00000b3b <malloc>:

void*
malloc(uint nbytes)
{
 b3b:	55                   	push   %ebp
 b3c:	89 e5                	mov    %esp,%ebp
 b3e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b41:	8b 45 08             	mov    0x8(%ebp),%eax
 b44:	83 c0 07             	add    $0x7,%eax
 b47:	c1 e8 03             	shr    $0x3,%eax
 b4a:	83 c0 01             	add    $0x1,%eax
 b4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 b50:	a1 94 0e 00 00       	mov    0xe94,%eax
 b55:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b58:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b5c:	75 23                	jne    b81 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b5e:	c7 45 f0 8c 0e 00 00 	movl   $0xe8c,-0x10(%ebp)
 b65:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b68:	a3 94 0e 00 00       	mov    %eax,0xe94
 b6d:	a1 94 0e 00 00       	mov    0xe94,%eax
 b72:	a3 8c 0e 00 00       	mov    %eax,0xe8c
    base.s.size = 0;
 b77:	c7 05 90 0e 00 00 00 	movl   $0x0,0xe90
 b7e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b81:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b84:	8b 00                	mov    (%eax),%eax
 b86:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 b89:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b8c:	8b 40 04             	mov    0x4(%eax),%eax
 b8f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 b92:	72 4d                	jb     be1 <malloc+0xa6>
      if(p->s.size == nunits)
 b94:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b97:	8b 40 04             	mov    0x4(%eax),%eax
 b9a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 b9d:	75 0c                	jne    bab <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 b9f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ba2:	8b 10                	mov    (%eax),%edx
 ba4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ba7:	89 10                	mov    %edx,(%eax)
 ba9:	eb 26                	jmp    bd1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 bab:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bae:	8b 40 04             	mov    0x4(%eax),%eax
 bb1:	89 c2                	mov    %eax,%edx
 bb3:	2b 55 f4             	sub    -0xc(%ebp),%edx
 bb6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bb9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 bbc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bbf:	8b 40 04             	mov    0x4(%eax),%eax
 bc2:	c1 e0 03             	shl    $0x3,%eax
 bc5:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 bc8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bcb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 bce:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 bd1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bd4:	a3 94 0e 00 00       	mov    %eax,0xe94
      return (void*)(p + 1);
 bd9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bdc:	83 c0 08             	add    $0x8,%eax
 bdf:	eb 38                	jmp    c19 <malloc+0xde>
    }
    if(p == freep)
 be1:	a1 94 0e 00 00       	mov    0xe94,%eax
 be6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 be9:	75 1b                	jne    c06 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 beb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bee:	89 04 24             	mov    %eax,(%esp)
 bf1:	e8 ed fe ff ff       	call   ae3 <morecore>
 bf6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 bf9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bfd:	75 07                	jne    c06 <malloc+0xcb>
        return 0;
 bff:	b8 00 00 00 00       	mov    $0x0,%eax
 c04:	eb 13                	jmp    c19 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c06:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c09:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c0c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c0f:	8b 00                	mov    (%eax),%eax
 c11:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 c14:	e9 70 ff ff ff       	jmp    b89 <malloc+0x4e>
}
 c19:	c9                   	leave  
 c1a:	c3                   	ret    
 c1b:	90                   	nop

00000c1c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 c1c:	55                   	push   %ebp
 c1d:	89 e5                	mov    %esp,%ebp
 c1f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 c22:	8b 55 08             	mov    0x8(%ebp),%edx
 c25:	8b 45 0c             	mov    0xc(%ebp),%eax
 c28:	8b 4d 08             	mov    0x8(%ebp),%ecx
 c2b:	f0 87 02             	lock xchg %eax,(%edx)
 c2e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 c31:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 c34:	c9                   	leave  
 c35:	c3                   	ret    

00000c36 <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 c36:	55                   	push   %ebp
 c37:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 c39:	8b 45 08             	mov    0x8(%ebp),%eax
 c3c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 c42:	5d                   	pop    %ebp
 c43:	c3                   	ret    

00000c44 <lock_acquire>:
void lock_acquire(lock_t *lock){
 c44:	55                   	push   %ebp
 c45:	89 e5                	mov    %esp,%ebp
 c47:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 c4a:	8b 45 08             	mov    0x8(%ebp),%eax
 c4d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 c54:	00 
 c55:	89 04 24             	mov    %eax,(%esp)
 c58:	e8 bf ff ff ff       	call   c1c <xchg>
 c5d:	85 c0                	test   %eax,%eax
 c5f:	75 e9                	jne    c4a <lock_acquire+0x6>
}
 c61:	c9                   	leave  
 c62:	c3                   	ret    

00000c63 <lock_release>:
void lock_release(lock_t *lock){
 c63:	55                   	push   %ebp
 c64:	89 e5                	mov    %esp,%ebp
 c66:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 c69:	8b 45 08             	mov    0x8(%ebp),%eax
 c6c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 c73:	00 
 c74:	89 04 24             	mov    %eax,(%esp)
 c77:	e8 a0 ff ff ff       	call   c1c <xchg>
}
 c7c:	c9                   	leave  
 c7d:	c3                   	ret    

00000c7e <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 c7e:	55                   	push   %ebp
 c7f:	89 e5                	mov    %esp,%ebp
 c81:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 c84:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 c8b:	e8 ab fe ff ff       	call   b3b <malloc>
 c90:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 c93:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c96:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 c99:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c9c:	25 ff 0f 00 00       	and    $0xfff,%eax
 ca1:	85 c0                	test   %eax,%eax
 ca3:	74 15                	je     cba <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 ca5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ca8:	89 c2                	mov    %eax,%edx
 caa:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 cb0:	b8 00 10 00 00       	mov    $0x1000,%eax
 cb5:	29 d0                	sub    %edx,%eax
 cb7:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 cba:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 cbe:	75 1b                	jne    cdb <thread_create+0x5d>

        printf(1,"malloc fail \n");
 cc0:	c7 44 24 04 36 0e 00 	movl   $0xe36,0x4(%esp)
 cc7:	00 
 cc8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ccf:	e8 81 fb ff ff       	call   855 <printf>
        return 0;
 cd4:	b8 00 00 00 00       	mov    $0x0,%eax
 cd9:	eb 70                	jmp    d4b <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 cdb:	8b 55 08             	mov    0x8(%ebp),%edx
 cde:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ce1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 ce8:	00 
 ce9:	89 54 24 08          	mov    %edx,0x8(%esp)
 ced:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 cf4:	00 
 cf5:	89 04 24             	mov    %eax,(%esp)
 cf8:	e8 6f fa ff ff       	call   76c <clone>
 cfd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 d00:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 d04:	79 1b                	jns    d21 <thread_create+0xa3>
        printf(1,"clone fails\n");
 d06:	c7 44 24 04 44 0e 00 	movl   $0xe44,0x4(%esp)
 d0d:	00 
 d0e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d15:	e8 3b fb ff ff       	call   855 <printf>
        return 0;
 d1a:	b8 00 00 00 00       	mov    $0x0,%eax
 d1f:	eb 2a                	jmp    d4b <thread_create+0xcd>
    }
    if(tid > 0){
 d21:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 d25:	7e 05                	jle    d2c <thread_create+0xae>
        return garbage_stack;
 d27:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d2a:	eb 1f                	jmp    d4b <thread_create+0xcd>
    }
    if(tid == 0){
 d2c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 d30:	75 14                	jne    d46 <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 d32:	c7 44 24 04 51 0e 00 	movl   $0xe51,0x4(%esp)
 d39:	00 
 d3a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d41:	e8 0f fb ff ff       	call   855 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 d46:	b8 00 00 00 00       	mov    $0x0,%eax
}
 d4b:	c9                   	leave  
 d4c:	c3                   	ret    
