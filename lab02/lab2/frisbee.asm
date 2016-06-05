
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
  1b:	c7 44 24 04 c8 0f 00 	movl   $0xfc8,0x4(%esp)
  22:	00 
  23:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2a:	e8 3e 08 00 00       	call   86d <printf>
        exit();
  2f:	e8 98 06 00 00       	call   6cc <exit>
    }
    numthreads = atoi(argv[1]);
  34:	8b 43 04             	mov    0x4(%ebx),%eax
  37:	83 c0 04             	add    $0x4,%eax
  3a:	8b 00                	mov    (%eax),%eax
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 f6 05 00 00       	call   63a <atoi>
  44:	a3 20 11 00 00       	mov    %eax,0x1120
    numpass = atoi(argv[2]);
  49:	8b 43 04             	mov    0x4(%ebx),%eax
  4c:	83 c0 08             	add    $0x8,%eax
  4f:	8b 00                	mov    (%eax),%eax
  51:	89 04 24             	mov    %eax,(%esp)
  54:	e8 e1 05 00 00       	call   63a <atoi>
  59:	a3 24 11 00 00       	mov    %eax,0x1124

    void * slist[numthreads];
  5e:	8b 0d 20 11 00 00    	mov    0x1120,%ecx
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
  f9:	c7 04 24 40 11 00 00 	movl   $0x1140,(%esp)
 100:	e8 49 0b 00 00       	call   c4e <lock_init>
    ttable.total = 0;
 105:	c7 05 44 13 00 00 00 	movl   $0x0,0x1344
 10c:	00 00 00 
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 10f:	c7 45 dc 44 11 00 00 	movl   $0x1144,-0x24(%ebp)
 116:	eb 0d                	jmp    125 <main+0x125>
        t->tid = 0;
 118:	8b 45 dc             	mov    -0x24(%ebp),%eax
 11b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    void * slist[numthreads];

    //init ttable;
    lock_init(&ttable.lock);
    ttable.total = 0;
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 121:	83 45 dc 08          	addl   $0x8,-0x24(%ebp)
 125:	b8 44 13 00 00       	mov    $0x1344,%eax
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
 14f:	c7 04 24 48 13 00 00 	movl   $0x1348,(%esp)
 156:	e8 f3 0a 00 00       	call   c4e <lock_init>
    frisbee.pass = 0;
 15b:	c7 05 4c 13 00 00 00 	movl   $0x0,0x134c
 162:	00 00 00 
    frisbee.holding_thread = 0;
 165:	c7 05 50 13 00 00 00 	movl   $0x0,0x1350
 16c:	00 00 00 

    printf(1,"\nnum of threads %d \n",numthreads);
 16f:	a1 20 11 00 00       	mov    0x1120,%eax
 174:	89 44 24 08          	mov    %eax,0x8(%esp)
 178:	c7 44 24 04 dd 0f 00 	movl   $0xfdd,0x4(%esp)
 17f:	00 
 180:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 187:	e8 e1 06 00 00       	call   86d <printf>
    printf(1,"num of passes %d \n\n",numpass);
 18c:	a1 24 11 00 00       	mov    0x1124,%eax
 191:	89 44 24 08          	mov    %eax,0x8(%esp)
 195:	c7 44 24 04 f2 0f 00 	movl   $0xff2,0x4(%esp)
 19c:	00 
 19d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1a4:	e8 c4 06 00 00       	call   86d <printf>


    for(i=0; i<numthreads;i++){
 1a9:	c7 45 d8 00 00 00 00 	movl   $0x0,-0x28(%ebp)
 1b0:	eb 43                	jmp    1f5 <main+0x1f5>
        void *stack = thread_create(pass_next,(void *)0);      
 1b2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b9:	00 
 1ba:	c7 04 24 a0 02 00 00 	movl   $0x2a0,(%esp)
 1c1:	e8 d0 0a 00 00       	call   c96 <thread_create>
 1c6:	89 45 e0             	mov    %eax,-0x20(%ebp)
        if(stack == 0)
 1c9:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
 1cd:	75 16                	jne    1e5 <main+0x1e5>
            printf(1,"thread_create fail\n");
 1cf:	c7 44 24 04 06 10 00 	movl   $0x1006,0x4(%esp)
 1d6:	00 
 1d7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1de:	e8 8a 06 00 00       	call   86d <printf>
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
 1f5:	a1 20 11 00 00       	mov    0x1120,%eax
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
 216:	a1 20 11 00 00       	mov    0x1120,%eax
 21b:	39 45 d8             	cmp    %eax,-0x28(%ebp)
 21e:	7c e8                	jl     208 <main+0x208>
 220:	eb 01                	jmp    223 <main+0x223>
        if(wait() == -1)
            break;
 222:	90                   	nop
    }
   // add printf for tid look up.  
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 223:	c7 45 dc 44 11 00 00 	movl   $0x1144,-0x24(%ebp)
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
 23e:	c7 44 24 04 1c 10 00 	movl   $0x101c,0x4(%esp)
 245:	00 
 246:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 24d:	e8 1b 06 00 00       	call   86d <printf>
    for(i=0;i<numthreads;i++){
        if(wait() == -1)
            break;
    }
   // add printf for tid look up.  
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 252:	83 45 dc 08          	addl   $0x8,-0x24(%ebp)
 256:	b8 44 13 00 00       	mov    $0x1344,%eax
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
 288:	e8 97 07 00 00       	call   a24 <free>
        if(t->tid != 0)
            printf(1,"thread %d was killed! stack was freed.\n",t->tid);
    }

    //free stacks
    for(i=0;i<numthreads;i++){
 28d:	83 45 d8 01          	addl   $0x1,-0x28(%ebp)
 291:	a1 20 11 00 00       	mov    0x1120,%eax
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
 2ae:	c7 04 24 40 11 00 00 	movl   $0x1140,(%esp)
 2b5:	e8 a2 09 00 00       	call   c5c <lock_acquire>
    for(t=ttable.thread;t < &ttable.thread[64];t++){
 2ba:	c7 45 f0 44 11 00 00 	movl   $0x1144,-0x10(%ebp)
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
 2d6:	83 45 f0 08          	addl   $0x8,-0x10(%ebp)
 2da:	b8 44 13 00 00       	mov    $0x1344,%eax
 2df:	39 45 f0             	cmp    %eax,-0x10(%ebp)
 2e2:	72 df                	jb     2c3 <pass_next+0x23>
        if(t->tid == 0){
            t->tid = tid;
            break;
        } 
    }
    ttable.total++;
 2e4:	a1 44 13 00 00       	mov    0x1344,%eax
 2e9:	83 c0 01             	add    $0x1,%eax
 2ec:	a3 44 13 00 00       	mov    %eax,0x1344
    lock_release(&ttable.lock);
 2f1:	c7 04 24 40 11 00 00 	movl   $0x1140,(%esp)
 2f8:	e8 7e 09 00 00       	call   c7b <lock_release>

   for(;;){
        lock_acquire(&ttable.lock);
 2fd:	c7 04 24 40 11 00 00 	movl   $0x1140,(%esp)
 304:	e8 53 09 00 00       	call   c5c <lock_acquire>
        if(ttable.total == numthreads){
 309:	8b 15 44 13 00 00    	mov    0x1344,%edx
 30f:	a1 20 11 00 00       	mov    0x1120,%eax
 314:	39 c2                	cmp    %eax,%edx
 316:	75 39                	jne    351 <pass_next+0xb1>
            printf(1," tid %d ready to go\n",t->tid);
 318:	8b 45 f0             	mov    -0x10(%ebp),%eax
 31b:	8b 00                	mov    (%eax),%eax
 31d:	89 44 24 08          	mov    %eax,0x8(%esp)
 321:	c7 44 24 04 44 10 00 	movl   $0x1044,0x4(%esp)
 328:	00 
 329:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 330:	e8 38 05 00 00       	call   86d <printf>
            barrier++;
 335:	a1 28 11 00 00       	mov    0x1128,%eax
 33a:	83 c0 01             	add    $0x1,%eax
 33d:	a3 28 11 00 00       	mov    %eax,0x1128
            goto start;
 342:	90                   	nop
        lock_release(&ttable.lock);
    }
    
//barriar above
start:
     lock_release(&ttable.lock);
 343:	c7 04 24 40 11 00 00 	movl   $0x1140,(%esp)
 34a:	e8 2c 09 00 00       	call   c7b <lock_release>
 34f:	eb 0e                	jmp    35f <pass_next+0xbf>
        if(ttable.total == numthreads){
            printf(1," tid %d ready to go\n",t->tid);
            barrier++;
            goto start;
        }
        lock_release(&ttable.lock);
 351:	c7 04 24 40 11 00 00 	movl   $0x1140,(%esp)
 358:	e8 1e 09 00 00       	call   c7b <lock_release>
    }
 35d:	eb 9e                	jmp    2fd <pass_next+0x5d>
    
//barriar above
start:
     lock_release(&ttable.lock);
     while(barrier != numthreads);
 35f:	8b 15 28 11 00 00    	mov    0x1128,%edx
 365:	a1 20 11 00 00       	mov    0x1120,%eax
 36a:	39 c2                	cmp    %eax,%edx
 36c:	75 f1                	jne    35f <pass_next+0xbf>
    //throw frisbee
    do{
        lock_acquire(&frisbee.lock);
 36e:	c7 04 24 48 13 00 00 	movl   $0x1348,(%esp)
 375:	e8 e2 08 00 00       	call   c5c <lock_acquire>
        if(frisbee.pass > numpass){
 37a:	8b 15 4c 13 00 00    	mov    0x134c,%edx
 380:	a1 24 11 00 00       	mov    0x1124,%eax
 385:	39 c2                	cmp    %eax,%edx
 387:	7e 39                	jle    3c2 <pass_next+0x122>
            lock_release(&frisbee.lock);
 389:	c7 04 24 48 13 00 00 	movl   $0x1348,(%esp)
 390:	e8 e6 08 00 00       	call   c7b <lock_release>
            goto leaving;
 395:	90                   	nop
        frisbee.holding_thread = tid;
        lock_release(&frisbee.lock);
    }while(1);

leaving: 
    lock_release(&frisbee.lock);
 396:	c7 04 24 48 13 00 00 	movl   $0x1348,(%esp)
 39d:	e8 d9 08 00 00       	call   c7b <lock_release>
    printf(1,"thread %d out of game\n",tid);
 3a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a5:	89 44 24 08          	mov    %eax,0x8(%esp)
 3a9:	c7 44 24 04 90 10 00 	movl   $0x1090,0x4(%esp)
 3b0:	00 
 3b1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b8:	e8 b0 04 00 00       	call   86d <printf>
    texit();
 3bd:	e8 b2 03 00 00       	call   774 <texit>
        lock_acquire(&frisbee.lock);
        if(frisbee.pass > numpass){
            lock_release(&frisbee.lock);
            goto leaving;
        }
        if(frisbee.holding_thread == tid){
 3c2:	a1 50 13 00 00       	mov    0x1350,%eax
 3c7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 3ca:	75 1b                	jne    3e7 <pass_next+0x147>
            lock_release(&frisbee.lock);
 3cc:	c7 04 24 48 13 00 00 	movl   $0x1348,(%esp)
 3d3:	e8 a3 08 00 00       	call   c7b <lock_release>
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
 3e7:	a1 4c 13 00 00       	mov    0x134c,%eax
 3ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3ef:	89 54 24 0c          	mov    %edx,0xc(%esp)
 3f3:	89 44 24 08          	mov    %eax,0x8(%esp)
 3f7:	c7 44 24 04 5c 10 00 	movl   $0x105c,0x4(%esp)
 3fe:	00 
 3ff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 406:	e8 62 04 00 00       	call   86d <printf>
                frisbee.pass, tid);
        frisbee.pass++;
 40b:	a1 4c 13 00 00       	mov    0x134c,%eax
 410:	83 c0 01             	add    $0x1,%eax
 413:	a3 4c 13 00 00       	mov    %eax,0x134c
        frisbee.holding_thread = tid;
 418:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41b:	a3 50 13 00 00       	mov    %eax,0x1350
        lock_release(&frisbee.lock);
 420:	c7 04 24 48 13 00 00 	movl   $0x1348,(%esp)
 427:	e8 4f 08 00 00       	call   c7b <lock_release>
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
 43e:	c7 45 fc 44 11 00 00 	movl   $0x1144,-0x4(%ebp)
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
 454:	83 45 fc 08          	addl   $0x8,-0x4(%ebp)
 458:	b8 44 13 00 00       	mov    $0x1344,%eax
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

0000077c <tsleep>:
SYSCALL(tsleep)
 77c:	b8 18 00 00 00       	mov    $0x18,%eax
 781:	cd 40                	int    $0x40
 783:	c3                   	ret    

00000784 <twakeup>:
SYSCALL(twakeup)
 784:	b8 19 00 00 00       	mov    $0x19,%eax
 789:	cd 40                	int    $0x40
 78b:	c3                   	ret    

0000078c <test>:
SYSCALL(test)
 78c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 791:	cd 40                	int    $0x40
 793:	c3                   	ret    

00000794 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 794:	55                   	push   %ebp
 795:	89 e5                	mov    %esp,%ebp
 797:	83 ec 28             	sub    $0x28,%esp
 79a:	8b 45 0c             	mov    0xc(%ebp),%eax
 79d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 7a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 7a7:	00 
 7a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 7ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 7af:	8b 45 08             	mov    0x8(%ebp),%eax
 7b2:	89 04 24             	mov    %eax,(%esp)
 7b5:	e8 32 ff ff ff       	call   6ec <write>
}
 7ba:	c9                   	leave  
 7bb:	c3                   	ret    

000007bc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 7bc:	55                   	push   %ebp
 7bd:	89 e5                	mov    %esp,%ebp
 7bf:	53                   	push   %ebx
 7c0:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 7c3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 7ca:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 7ce:	74 17                	je     7e7 <printint+0x2b>
 7d0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7d4:	79 11                	jns    7e7 <printint+0x2b>
    neg = 1;
 7d6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e0:	f7 d8                	neg    %eax
 7e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 7e5:	eb 06                	jmp    7ed <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 7e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 7ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 7ed:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 7f4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 7f7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fd:	ba 00 00 00 00       	mov    $0x0,%edx
 802:	f7 f3                	div    %ebx
 804:	89 d0                	mov    %edx,%eax
 806:	0f b6 80 f0 10 00 00 	movzbl 0x10f0(%eax),%eax
 80d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 811:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 815:	8b 45 10             	mov    0x10(%ebp),%eax
 818:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 81b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81e:	ba 00 00 00 00       	mov    $0x0,%edx
 823:	f7 75 d4             	divl   -0x2c(%ebp)
 826:	89 45 f4             	mov    %eax,-0xc(%ebp)
 829:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 82d:	75 c5                	jne    7f4 <printint+0x38>
  if(neg)
 82f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 833:	74 28                	je     85d <printint+0xa1>
    buf[i++] = '-';
 835:	8b 45 ec             	mov    -0x14(%ebp),%eax
 838:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 83d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 841:	eb 1a                	jmp    85d <printint+0xa1>
    putc(fd, buf[i]);
 843:	8b 45 ec             	mov    -0x14(%ebp),%eax
 846:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 84b:	0f be c0             	movsbl %al,%eax
 84e:	89 44 24 04          	mov    %eax,0x4(%esp)
 852:	8b 45 08             	mov    0x8(%ebp),%eax
 855:	89 04 24             	mov    %eax,(%esp)
 858:	e8 37 ff ff ff       	call   794 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 85d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 861:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 865:	79 dc                	jns    843 <printint+0x87>
    putc(fd, buf[i]);
}
 867:	83 c4 44             	add    $0x44,%esp
 86a:	5b                   	pop    %ebx
 86b:	5d                   	pop    %ebp
 86c:	c3                   	ret    

0000086d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 86d:	55                   	push   %ebp
 86e:	89 e5                	mov    %esp,%ebp
 870:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 873:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 87a:	8d 45 0c             	lea    0xc(%ebp),%eax
 87d:	83 c0 04             	add    $0x4,%eax
 880:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 883:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 88a:	e9 7e 01 00 00       	jmp    a0d <printf+0x1a0>
    c = fmt[i] & 0xff;
 88f:	8b 55 0c             	mov    0xc(%ebp),%edx
 892:	8b 45 ec             	mov    -0x14(%ebp),%eax
 895:	8d 04 02             	lea    (%edx,%eax,1),%eax
 898:	0f b6 00             	movzbl (%eax),%eax
 89b:	0f be c0             	movsbl %al,%eax
 89e:	25 ff 00 00 00       	and    $0xff,%eax
 8a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 8a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8aa:	75 2c                	jne    8d8 <printf+0x6b>
      if(c == '%'){
 8ac:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 8b0:	75 0c                	jne    8be <printf+0x51>
        state = '%';
 8b2:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 8b9:	e9 4b 01 00 00       	jmp    a09 <printf+0x19c>
      } else {
        putc(fd, c);
 8be:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8c1:	0f be c0             	movsbl %al,%eax
 8c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8c8:	8b 45 08             	mov    0x8(%ebp),%eax
 8cb:	89 04 24             	mov    %eax,(%esp)
 8ce:	e8 c1 fe ff ff       	call   794 <putc>
 8d3:	e9 31 01 00 00       	jmp    a09 <printf+0x19c>
      }
    } else if(state == '%'){
 8d8:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 8dc:	0f 85 27 01 00 00    	jne    a09 <printf+0x19c>
      if(c == 'd'){
 8e2:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 8e6:	75 2d                	jne    915 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 8e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8eb:	8b 00                	mov    (%eax),%eax
 8ed:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8f4:	00 
 8f5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8fc:	00 
 8fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 901:	8b 45 08             	mov    0x8(%ebp),%eax
 904:	89 04 24             	mov    %eax,(%esp)
 907:	e8 b0 fe ff ff       	call   7bc <printint>
        ap++;
 90c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 910:	e9 ed 00 00 00       	jmp    a02 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 915:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 919:	74 06                	je     921 <printf+0xb4>
 91b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 91f:	75 2d                	jne    94e <printf+0xe1>
        printint(fd, *ap, 16, 0);
 921:	8b 45 f4             	mov    -0xc(%ebp),%eax
 924:	8b 00                	mov    (%eax),%eax
 926:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 92d:	00 
 92e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 935:	00 
 936:	89 44 24 04          	mov    %eax,0x4(%esp)
 93a:	8b 45 08             	mov    0x8(%ebp),%eax
 93d:	89 04 24             	mov    %eax,(%esp)
 940:	e8 77 fe ff ff       	call   7bc <printint>
        ap++;
 945:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 949:	e9 b4 00 00 00       	jmp    a02 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 94e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 952:	75 46                	jne    99a <printf+0x12d>
        s = (char*)*ap;
 954:	8b 45 f4             	mov    -0xc(%ebp),%eax
 957:	8b 00                	mov    (%eax),%eax
 959:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 95c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 960:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 964:	75 27                	jne    98d <printf+0x120>
          s = "(null)";
 966:	c7 45 e4 a7 10 00 00 	movl   $0x10a7,-0x1c(%ebp)
        while(*s != 0){
 96d:	eb 1f                	jmp    98e <printf+0x121>
          putc(fd, *s);
 96f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 972:	0f b6 00             	movzbl (%eax),%eax
 975:	0f be c0             	movsbl %al,%eax
 978:	89 44 24 04          	mov    %eax,0x4(%esp)
 97c:	8b 45 08             	mov    0x8(%ebp),%eax
 97f:	89 04 24             	mov    %eax,(%esp)
 982:	e8 0d fe ff ff       	call   794 <putc>
          s++;
 987:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 98b:	eb 01                	jmp    98e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 98d:	90                   	nop
 98e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 991:	0f b6 00             	movzbl (%eax),%eax
 994:	84 c0                	test   %al,%al
 996:	75 d7                	jne    96f <printf+0x102>
 998:	eb 68                	jmp    a02 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 99a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 99e:	75 1d                	jne    9bd <printf+0x150>
        putc(fd, *ap);
 9a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a3:	8b 00                	mov    (%eax),%eax
 9a5:	0f be c0             	movsbl %al,%eax
 9a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 9ac:	8b 45 08             	mov    0x8(%ebp),%eax
 9af:	89 04 24             	mov    %eax,(%esp)
 9b2:	e8 dd fd ff ff       	call   794 <putc>
        ap++;
 9b7:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 9bb:	eb 45                	jmp    a02 <printf+0x195>
      } else if(c == '%'){
 9bd:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 9c1:	75 17                	jne    9da <printf+0x16d>
        putc(fd, c);
 9c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9c6:	0f be c0             	movsbl %al,%eax
 9c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 9cd:	8b 45 08             	mov    0x8(%ebp),%eax
 9d0:	89 04 24             	mov    %eax,(%esp)
 9d3:	e8 bc fd ff ff       	call   794 <putc>
 9d8:	eb 28                	jmp    a02 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9da:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9e1:	00 
 9e2:	8b 45 08             	mov    0x8(%ebp),%eax
 9e5:	89 04 24             	mov    %eax,(%esp)
 9e8:	e8 a7 fd ff ff       	call   794 <putc>
        putc(fd, c);
 9ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
 9f0:	0f be c0             	movsbl %al,%eax
 9f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 9f7:	8b 45 08             	mov    0x8(%ebp),%eax
 9fa:	89 04 24             	mov    %eax,(%esp)
 9fd:	e8 92 fd ff ff       	call   794 <putc>
      }
      state = 0;
 a02:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 a09:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 a0d:	8b 55 0c             	mov    0xc(%ebp),%edx
 a10:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a13:	8d 04 02             	lea    (%edx,%eax,1),%eax
 a16:	0f b6 00             	movzbl (%eax),%eax
 a19:	84 c0                	test   %al,%al
 a1b:	0f 85 6e fe ff ff    	jne    88f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 a21:	c9                   	leave  
 a22:	c3                   	ret    
 a23:	90                   	nop

00000a24 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 a24:	55                   	push   %ebp
 a25:	89 e5                	mov    %esp,%ebp
 a27:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a2a:	8b 45 08             	mov    0x8(%ebp),%eax
 a2d:	83 e8 08             	sub    $0x8,%eax
 a30:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a33:	a1 34 11 00 00       	mov    0x1134,%eax
 a38:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a3b:	eb 24                	jmp    a61 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a40:	8b 00                	mov    (%eax),%eax
 a42:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a45:	77 12                	ja     a59 <free+0x35>
 a47:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a4a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a4d:	77 24                	ja     a73 <free+0x4f>
 a4f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a52:	8b 00                	mov    (%eax),%eax
 a54:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a57:	77 1a                	ja     a73 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a59:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a5c:	8b 00                	mov    (%eax),%eax
 a5e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a61:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a64:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a67:	76 d4                	jbe    a3d <free+0x19>
 a69:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a6c:	8b 00                	mov    (%eax),%eax
 a6e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a71:	76 ca                	jbe    a3d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a73:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a76:	8b 40 04             	mov    0x4(%eax),%eax
 a79:	c1 e0 03             	shl    $0x3,%eax
 a7c:	89 c2                	mov    %eax,%edx
 a7e:	03 55 f8             	add    -0x8(%ebp),%edx
 a81:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a84:	8b 00                	mov    (%eax),%eax
 a86:	39 c2                	cmp    %eax,%edx
 a88:	75 24                	jne    aae <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 a8a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a8d:	8b 50 04             	mov    0x4(%eax),%edx
 a90:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a93:	8b 00                	mov    (%eax),%eax
 a95:	8b 40 04             	mov    0x4(%eax),%eax
 a98:	01 c2                	add    %eax,%edx
 a9a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a9d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 aa0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa3:	8b 00                	mov    (%eax),%eax
 aa5:	8b 10                	mov    (%eax),%edx
 aa7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 aaa:	89 10                	mov    %edx,(%eax)
 aac:	eb 0a                	jmp    ab8 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 aae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ab1:	8b 10                	mov    (%eax),%edx
 ab3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ab6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 ab8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 abb:	8b 40 04             	mov    0x4(%eax),%eax
 abe:	c1 e0 03             	shl    $0x3,%eax
 ac1:	03 45 fc             	add    -0x4(%ebp),%eax
 ac4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 ac7:	75 20                	jne    ae9 <free+0xc5>
    p->s.size += bp->s.size;
 ac9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 acc:	8b 50 04             	mov    0x4(%eax),%edx
 acf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ad2:	8b 40 04             	mov    0x4(%eax),%eax
 ad5:	01 c2                	add    %eax,%edx
 ad7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ada:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 add:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ae0:	8b 10                	mov    (%eax),%edx
 ae2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ae5:	89 10                	mov    %edx,(%eax)
 ae7:	eb 08                	jmp    af1 <free+0xcd>
  } else
    p->s.ptr = bp;
 ae9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aec:	8b 55 f8             	mov    -0x8(%ebp),%edx
 aef:	89 10                	mov    %edx,(%eax)
  freep = p;
 af1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 af4:	a3 34 11 00 00       	mov    %eax,0x1134
}
 af9:	c9                   	leave  
 afa:	c3                   	ret    

00000afb <morecore>:

static Header*
morecore(uint nu)
{
 afb:	55                   	push   %ebp
 afc:	89 e5                	mov    %esp,%ebp
 afe:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 b01:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 b08:	77 07                	ja     b11 <morecore+0x16>
    nu = 4096;
 b0a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 b11:	8b 45 08             	mov    0x8(%ebp),%eax
 b14:	c1 e0 03             	shl    $0x3,%eax
 b17:	89 04 24             	mov    %eax,(%esp)
 b1a:	e8 35 fc ff ff       	call   754 <sbrk>
 b1f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 b22:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 b26:	75 07                	jne    b2f <morecore+0x34>
    return 0;
 b28:	b8 00 00 00 00       	mov    $0x0,%eax
 b2d:	eb 22                	jmp    b51 <morecore+0x56>
  hp = (Header*)p;
 b2f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b32:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 b35:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b38:	8b 55 08             	mov    0x8(%ebp),%edx
 b3b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b41:	83 c0 08             	add    $0x8,%eax
 b44:	89 04 24             	mov    %eax,(%esp)
 b47:	e8 d8 fe ff ff       	call   a24 <free>
  return freep;
 b4c:	a1 34 11 00 00       	mov    0x1134,%eax
}
 b51:	c9                   	leave  
 b52:	c3                   	ret    

00000b53 <malloc>:

void*
malloc(uint nbytes)
{
 b53:	55                   	push   %ebp
 b54:	89 e5                	mov    %esp,%ebp
 b56:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b59:	8b 45 08             	mov    0x8(%ebp),%eax
 b5c:	83 c0 07             	add    $0x7,%eax
 b5f:	c1 e8 03             	shr    $0x3,%eax
 b62:	83 c0 01             	add    $0x1,%eax
 b65:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 b68:	a1 34 11 00 00       	mov    0x1134,%eax
 b6d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b70:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b74:	75 23                	jne    b99 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b76:	c7 45 f0 2c 11 00 00 	movl   $0x112c,-0x10(%ebp)
 b7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b80:	a3 34 11 00 00       	mov    %eax,0x1134
 b85:	a1 34 11 00 00       	mov    0x1134,%eax
 b8a:	a3 2c 11 00 00       	mov    %eax,0x112c
    base.s.size = 0;
 b8f:	c7 05 30 11 00 00 00 	movl   $0x0,0x1130
 b96:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b99:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b9c:	8b 00                	mov    (%eax),%eax
 b9e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 ba1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ba4:	8b 40 04             	mov    0x4(%eax),%eax
 ba7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 baa:	72 4d                	jb     bf9 <malloc+0xa6>
      if(p->s.size == nunits)
 bac:	8b 45 ec             	mov    -0x14(%ebp),%eax
 baf:	8b 40 04             	mov    0x4(%eax),%eax
 bb2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 bb5:	75 0c                	jne    bc3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 bb7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bba:	8b 10                	mov    (%eax),%edx
 bbc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bbf:	89 10                	mov    %edx,(%eax)
 bc1:	eb 26                	jmp    be9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 bc3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bc6:	8b 40 04             	mov    0x4(%eax),%eax
 bc9:	89 c2                	mov    %eax,%edx
 bcb:	2b 55 f4             	sub    -0xc(%ebp),%edx
 bce:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bd1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 bd4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bd7:	8b 40 04             	mov    0x4(%eax),%eax
 bda:	c1 e0 03             	shl    $0x3,%eax
 bdd:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 be0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 be3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 be6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 be9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bec:	a3 34 11 00 00       	mov    %eax,0x1134
      return (void*)(p + 1);
 bf1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 bf4:	83 c0 08             	add    $0x8,%eax
 bf7:	eb 38                	jmp    c31 <malloc+0xde>
    }
    if(p == freep)
 bf9:	a1 34 11 00 00       	mov    0x1134,%eax
 bfe:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 c01:	75 1b                	jne    c1e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 c03:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c06:	89 04 24             	mov    %eax,(%esp)
 c09:	e8 ed fe ff ff       	call   afb <morecore>
 c0e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 c11:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c15:	75 07                	jne    c1e <malloc+0xcb>
        return 0;
 c17:	b8 00 00 00 00       	mov    $0x0,%eax
 c1c:	eb 13                	jmp    c31 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 c1e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c21:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c24:	8b 45 ec             	mov    -0x14(%ebp),%eax
 c27:	8b 00                	mov    (%eax),%eax
 c29:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 c2c:	e9 70 ff ff ff       	jmp    ba1 <malloc+0x4e>
}
 c31:	c9                   	leave  
 c32:	c3                   	ret    
 c33:	90                   	nop

00000c34 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 c34:	55                   	push   %ebp
 c35:	89 e5                	mov    %esp,%ebp
 c37:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 c3a:	8b 55 08             	mov    0x8(%ebp),%edx
 c3d:	8b 45 0c             	mov    0xc(%ebp),%eax
 c40:	8b 4d 08             	mov    0x8(%ebp),%ecx
 c43:	f0 87 02             	lock xchg %eax,(%edx)
 c46:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 c49:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 c4c:	c9                   	leave  
 c4d:	c3                   	ret    

00000c4e <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 c4e:	55                   	push   %ebp
 c4f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 c51:	8b 45 08             	mov    0x8(%ebp),%eax
 c54:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 c5a:	5d                   	pop    %ebp
 c5b:	c3                   	ret    

00000c5c <lock_acquire>:
void lock_acquire(lock_t *lock){
 c5c:	55                   	push   %ebp
 c5d:	89 e5                	mov    %esp,%ebp
 c5f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 c62:	8b 45 08             	mov    0x8(%ebp),%eax
 c65:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 c6c:	00 
 c6d:	89 04 24             	mov    %eax,(%esp)
 c70:	e8 bf ff ff ff       	call   c34 <xchg>
 c75:	85 c0                	test   %eax,%eax
 c77:	75 e9                	jne    c62 <lock_acquire+0x6>
}
 c79:	c9                   	leave  
 c7a:	c3                   	ret    

00000c7b <lock_release>:
void lock_release(lock_t *lock){
 c7b:	55                   	push   %ebp
 c7c:	89 e5                	mov    %esp,%ebp
 c7e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 c81:	8b 45 08             	mov    0x8(%ebp),%eax
 c84:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 c8b:	00 
 c8c:	89 04 24             	mov    %eax,(%esp)
 c8f:	e8 a0 ff ff ff       	call   c34 <xchg>
}
 c94:	c9                   	leave  
 c95:	c3                   	ret    

00000c96 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 c96:	55                   	push   %ebp
 c97:	89 e5                	mov    %esp,%ebp
 c99:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 c9c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 ca3:	e8 ab fe ff ff       	call   b53 <malloc>
 ca8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 cab:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cae:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 cb1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cb4:	25 ff 0f 00 00       	and    $0xfff,%eax
 cb9:	85 c0                	test   %eax,%eax
 cbb:	74 15                	je     cd2 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 cbd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cc0:	89 c2                	mov    %eax,%edx
 cc2:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 cc8:	b8 00 10 00 00       	mov    $0x1000,%eax
 ccd:	29 d0                	sub    %edx,%eax
 ccf:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 cd2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 cd6:	75 1b                	jne    cf3 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 cd8:	c7 44 24 04 ae 10 00 	movl   $0x10ae,0x4(%esp)
 cdf:	00 
 ce0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ce7:	e8 81 fb ff ff       	call   86d <printf>
        return 0;
 cec:	b8 00 00 00 00       	mov    $0x0,%eax
 cf1:	eb 6f                	jmp    d62 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 cf3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 cf6:	8b 55 08             	mov    0x8(%ebp),%edx
 cf9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cfc:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 d00:	89 54 24 08          	mov    %edx,0x8(%esp)
 d04:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 d0b:	00 
 d0c:	89 04 24             	mov    %eax,(%esp)
 d0f:	e8 58 fa ff ff       	call   76c <clone>
 d14:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 d17:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 d1b:	79 1b                	jns    d38 <thread_create+0xa2>
        printf(1,"clone fails\n");
 d1d:	c7 44 24 04 bc 10 00 	movl   $0x10bc,0x4(%esp)
 d24:	00 
 d25:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d2c:	e8 3c fb ff ff       	call   86d <printf>
        return 0;
 d31:	b8 00 00 00 00       	mov    $0x0,%eax
 d36:	eb 2a                	jmp    d62 <thread_create+0xcc>
    }
    if(tid > 0){
 d38:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 d3c:	7e 05                	jle    d43 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 d3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d41:	eb 1f                	jmp    d62 <thread_create+0xcc>
    }
    if(tid == 0){
 d43:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 d47:	75 14                	jne    d5d <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 d49:	c7 44 24 04 c9 10 00 	movl   $0x10c9,0x4(%esp)
 d50:	00 
 d51:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d58:	e8 10 fb ff ff       	call   86d <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 d5d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 d62:	c9                   	leave  
 d63:	c3                   	ret    

00000d64 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 d64:	55                   	push   %ebp
 d65:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 d67:	8b 45 08             	mov    0x8(%ebp),%eax
 d6a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 d70:	8b 45 08             	mov    0x8(%ebp),%eax
 d73:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 d7a:	8b 45 08             	mov    0x8(%ebp),%eax
 d7d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 d84:	5d                   	pop    %ebp
 d85:	c3                   	ret    

00000d86 <add_q>:

void add_q(struct queue *q, int v){
 d86:	55                   	push   %ebp
 d87:	89 e5                	mov    %esp,%ebp
 d89:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 d8c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 d93:	e8 bb fd ff ff       	call   b53 <malloc>
 d98:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 d9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d9e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 da5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 da8:	8b 55 0c             	mov    0xc(%ebp),%edx
 dab:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 dad:	8b 45 08             	mov    0x8(%ebp),%eax
 db0:	8b 40 04             	mov    0x4(%eax),%eax
 db3:	85 c0                	test   %eax,%eax
 db5:	75 0b                	jne    dc2 <add_q+0x3c>
        q->head = n;
 db7:	8b 45 08             	mov    0x8(%ebp),%eax
 dba:	8b 55 f4             	mov    -0xc(%ebp),%edx
 dbd:	89 50 04             	mov    %edx,0x4(%eax)
 dc0:	eb 0c                	jmp    dce <add_q+0x48>
    }else{
        q->tail->next = n;
 dc2:	8b 45 08             	mov    0x8(%ebp),%eax
 dc5:	8b 40 08             	mov    0x8(%eax),%eax
 dc8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 dcb:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 dce:	8b 45 08             	mov    0x8(%ebp),%eax
 dd1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 dd4:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 dd7:	8b 45 08             	mov    0x8(%ebp),%eax
 dda:	8b 00                	mov    (%eax),%eax
 ddc:	8d 50 01             	lea    0x1(%eax),%edx
 ddf:	8b 45 08             	mov    0x8(%ebp),%eax
 de2:	89 10                	mov    %edx,(%eax)
}
 de4:	c9                   	leave  
 de5:	c3                   	ret    

00000de6 <empty_q>:

int empty_q(struct queue *q){
 de6:	55                   	push   %ebp
 de7:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 de9:	8b 45 08             	mov    0x8(%ebp),%eax
 dec:	8b 00                	mov    (%eax),%eax
 dee:	85 c0                	test   %eax,%eax
 df0:	75 07                	jne    df9 <empty_q+0x13>
        return 1;
 df2:	b8 01 00 00 00       	mov    $0x1,%eax
 df7:	eb 05                	jmp    dfe <empty_q+0x18>
    else
        return 0;
 df9:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 dfe:	5d                   	pop    %ebp
 dff:	c3                   	ret    

00000e00 <pop_q>:
int pop_q(struct queue *q){
 e00:	55                   	push   %ebp
 e01:	89 e5                	mov    %esp,%ebp
 e03:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 e06:	8b 45 08             	mov    0x8(%ebp),%eax
 e09:	89 04 24             	mov    %eax,(%esp)
 e0c:	e8 d5 ff ff ff       	call   de6 <empty_q>
 e11:	85 c0                	test   %eax,%eax
 e13:	75 5d                	jne    e72 <pop_q+0x72>
       val = q->head->value; 
 e15:	8b 45 08             	mov    0x8(%ebp),%eax
 e18:	8b 40 04             	mov    0x4(%eax),%eax
 e1b:	8b 00                	mov    (%eax),%eax
 e1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 e20:	8b 45 08             	mov    0x8(%ebp),%eax
 e23:	8b 40 04             	mov    0x4(%eax),%eax
 e26:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 e29:	8b 45 08             	mov    0x8(%ebp),%eax
 e2c:	8b 40 04             	mov    0x4(%eax),%eax
 e2f:	8b 50 04             	mov    0x4(%eax),%edx
 e32:	8b 45 08             	mov    0x8(%ebp),%eax
 e35:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 e38:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e3b:	89 04 24             	mov    %eax,(%esp)
 e3e:	e8 e1 fb ff ff       	call   a24 <free>
       q->size--;
 e43:	8b 45 08             	mov    0x8(%ebp),%eax
 e46:	8b 00                	mov    (%eax),%eax
 e48:	8d 50 ff             	lea    -0x1(%eax),%edx
 e4b:	8b 45 08             	mov    0x8(%ebp),%eax
 e4e:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 e50:	8b 45 08             	mov    0x8(%ebp),%eax
 e53:	8b 00                	mov    (%eax),%eax
 e55:	85 c0                	test   %eax,%eax
 e57:	75 14                	jne    e6d <pop_q+0x6d>
            q->head = 0;
 e59:	8b 45 08             	mov    0x8(%ebp),%eax
 e5c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 e63:	8b 45 08             	mov    0x8(%ebp),%eax
 e66:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 e6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e70:	eb 05                	jmp    e77 <pop_q+0x77>
    }
    return -1;
 e72:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 e77:	c9                   	leave  
 e78:	c3                   	ret    
 e79:	90                   	nop
 e7a:	90                   	nop
 e7b:	90                   	nop

00000e7c <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 e7c:	55                   	push   %ebp
 e7d:	89 e5                	mov    %esp,%ebp
 e7f:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 e82:	8b 45 08             	mov    0x8(%ebp),%eax
 e85:	8b 55 0c             	mov    0xc(%ebp),%edx
 e88:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 e8b:	8b 45 08             	mov    0x8(%ebp),%eax
 e8e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 e95:	8b 45 08             	mov    0x8(%ebp),%eax
 e98:	89 04 24             	mov    %eax,(%esp)
 e9b:	e8 ae fd ff ff       	call   c4e <lock_init>
}
 ea0:	c9                   	leave  
 ea1:	c3                   	ret    

00000ea2 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 ea2:	55                   	push   %ebp
 ea3:	89 e5                	mov    %esp,%ebp
 ea5:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 ea8:	8b 45 08             	mov    0x8(%ebp),%eax
 eab:	89 04 24             	mov    %eax,(%esp)
 eae:	e8 a9 fd ff ff       	call   c5c <lock_acquire>
	if(s->count  == 0){
 eb3:	8b 45 08             	mov    0x8(%ebp),%eax
 eb6:	8b 40 04             	mov    0x4(%eax),%eax
 eb9:	85 c0                	test   %eax,%eax
 ebb:	75 43                	jne    f00 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 ebd:	c7 44 24 04 da 10 00 	movl   $0x10da,0x4(%esp)
 ec4:	00 
 ec5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ecc:	e8 9c f9 ff ff       	call   86d <printf>
		//add proc to waiters list
		int tid = getpid();
 ed1:	e8 76 f8 ff ff       	call   74c <getpid>
 ed6:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 ed9:	8b 45 08             	mov    0x8(%ebp),%eax
 edc:	8d 50 0c             	lea    0xc(%eax),%edx
 edf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ee2:	89 44 24 04          	mov    %eax,0x4(%esp)
 ee6:	89 14 24             	mov    %edx,(%esp)
 ee9:	e8 98 fe ff ff       	call   d86 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 eee:	8b 45 08             	mov    0x8(%ebp),%eax
 ef1:	89 04 24             	mov    %eax,(%esp)
 ef4:	e8 82 fd ff ff       	call   c7b <lock_release>
		tsleep(); 
 ef9:	e8 7e f8 ff ff       	call   77c <tsleep>
 efe:	eb 2e                	jmp    f2e <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 f00:	c7 44 24 04 e1 10 00 	movl   $0x10e1,0x4(%esp)
 f07:	00 
 f08:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 f0f:	e8 59 f9 ff ff       	call   86d <printf>
		s->count--;	
 f14:	8b 45 08             	mov    0x8(%ebp),%eax
 f17:	8b 40 04             	mov    0x4(%eax),%eax
 f1a:	8d 50 ff             	lea    -0x1(%eax),%edx
 f1d:	8b 45 08             	mov    0x8(%ebp),%eax
 f20:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 f23:	8b 45 08             	mov    0x8(%ebp),%eax
 f26:	89 04 24             	mov    %eax,(%esp)
 f29:	e8 4d fd ff ff       	call   c7b <lock_release>
	}
}
 f2e:	c9                   	leave  
 f2f:	c3                   	ret    

00000f30 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 f30:	55                   	push   %ebp
 f31:	89 e5                	mov    %esp,%ebp
 f33:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 f36:	c7 44 24 04 e8 10 00 	movl   $0x10e8,0x4(%esp)
 f3d:	00 
 f3e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 f45:	e8 23 f9 ff ff       	call   86d <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 f4a:	8b 45 08             	mov    0x8(%ebp),%eax
 f4d:	89 04 24             	mov    %eax,(%esp)
 f50:	e8 07 fd ff ff       	call   c5c <lock_acquire>
	if(s->count < s->size){
 f55:	8b 45 08             	mov    0x8(%ebp),%eax
 f58:	8b 50 04             	mov    0x4(%eax),%edx
 f5b:	8b 45 08             	mov    0x8(%ebp),%eax
 f5e:	8b 40 08             	mov    0x8(%eax),%eax
 f61:	39 c2                	cmp    %eax,%edx
 f63:	7d 0f                	jge    f74 <sem_signal+0x44>
		s->count++;	
 f65:	8b 45 08             	mov    0x8(%ebp),%eax
 f68:	8b 40 04             	mov    0x4(%eax),%eax
 f6b:	8d 50 01             	lea    0x1(%eax),%edx
 f6e:	8b 45 08             	mov    0x8(%ebp),%eax
 f71:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 f74:	8b 45 08             	mov    0x8(%ebp),%eax
 f77:	83 c0 0c             	add    $0xc,%eax
 f7a:	89 04 24             	mov    %eax,(%esp)
 f7d:	e8 7e fe ff ff       	call   e00 <pop_q>
 f82:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 f85:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 f89:	74 2e                	je     fb9 <sem_signal+0x89>
		printf(1, "Sem A\n");
 f8b:	c7 44 24 04 e1 10 00 	movl   $0x10e1,0x4(%esp)
 f92:	00 
 f93:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 f9a:	e8 ce f8 ff ff       	call   86d <printf>
		twakeup(tid);
 f9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 fa2:	89 04 24             	mov    %eax,(%esp)
 fa5:	e8 da f7 ff ff       	call   784 <twakeup>
		s->count--;
 faa:	8b 45 08             	mov    0x8(%ebp),%eax
 fad:	8b 40 04             	mov    0x4(%eax),%eax
 fb0:	8d 50 ff             	lea    -0x1(%eax),%edx
 fb3:	8b 45 08             	mov    0x8(%ebp),%eax
 fb6:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 fb9:	8b 45 08             	mov    0x8(%ebp),%eax
 fbc:	89 04 24             	mov    %eax,(%esp)
 fbf:	e8 b7 fc ff ff       	call   c7b <lock_release>

 fc4:	c9                   	leave  
 fc5:	c3                   	ret    
