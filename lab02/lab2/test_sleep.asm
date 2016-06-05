
_test_sleep:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
    int total;
}ttable;

void func(void *arg_ptr);

int main(int argc, char *argv[]){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
    struct thread * t;
    int i;
    printf(1,"init ttable\n");
   9:	c7 44 24 04 48 0d 00 	movl   $0xd48,0x4(%esp)
  10:	00 
  11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  18:	e8 d0 05 00 00       	call   5ed <printf>
    lock_init(&ttable.lock);
  1d:	c7 04 24 60 0e 00 00 	movl   $0xe60,(%esp)
  24:	e8 a5 09 00 00       	call   9ce <lock_init>
    ttable.total = 0;
  29:	c7 05 64 0f 00 00 00 	movl   $0x0,0xf64
  30:	00 00 00 

    lock_acquire(&ttable.lock);
  33:	c7 04 24 60 0e 00 00 	movl   $0xe60,(%esp)
  3a:	e8 9d 09 00 00       	call   9dc <lock_acquire>
    for(t=ttable.threads;t < &ttable.threads[64];t++){
  3f:	c7 44 24 14 64 0e 00 	movl   $0xe64,0x14(%esp)
  46:	00 
  47:	eb 0f                	jmp    58 <main+0x58>
        t->tid = 0;
  49:	8b 44 24 14          	mov    0x14(%esp),%eax
  4d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    printf(1,"init ttable\n");
    lock_init(&ttable.lock);
    ttable.total = 0;

    lock_acquire(&ttable.lock);
    for(t=ttable.threads;t < &ttable.threads[64];t++){
  53:	83 44 24 14 04       	addl   $0x4,0x14(%esp)
  58:	b8 64 0f 00 00       	mov    $0xf64,%eax
  5d:	39 44 24 14          	cmp    %eax,0x14(%esp)
  61:	72 e6                	jb     49 <main+0x49>
        t->tid = 0;
    }
    lock_release(&ttable.lock);
  63:	c7 04 24 60 0e 00 00 	movl   $0xe60,(%esp)
  6a:	e8 8c 09 00 00       	call   9fb <lock_release>
    printf(1,"testing thread sleep and wakeup \n\n\n");
  6f:	c7 44 24 04 58 0d 00 	movl   $0xd58,0x4(%esp)
  76:	00 
  77:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7e:	e8 6a 05 00 00       	call   5ed <printf>
    void *stack = thread_create(func,0);
  83:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  8a:	00 
  8b:	c7 04 24 6c 01 00 00 	movl   $0x16c,(%esp)
  92:	e8 7f 09 00 00       	call   a16 <thread_create>
  97:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    thread_create(func,0);
  9b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  a2:	00 
  a3:	c7 04 24 6c 01 00 00 	movl   $0x16c,(%esp)
  aa:	e8 67 09 00 00       	call   a16 <thread_create>
    thread_create(func,0);
  af:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  b6:	00 
  b7:	c7 04 24 6c 01 00 00 	movl   $0x16c,(%esp)
  be:	e8 53 09 00 00       	call   a16 <thread_create>

    i=0;
  c3:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  ca:	00 
    while(i++ < 1000000);
  cb:	81 7c 24 18 3f 42 0f 	cmpl   $0xf423f,0x18(%esp)
  d2:	00 
  d3:	0f 9e c0             	setle  %al
  d6:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
  db:	84 c0                	test   %al,%al
  dd:	75 ec                	jne    cb <main+0xcb>
    //find that thread
    lock_acquire(&ttable.lock);
  df:	c7 04 24 60 0e 00 00 	movl   $0xe60,(%esp)
  e6:	e8 f1 08 00 00       	call   9dc <lock_acquire>
    for(t=ttable.threads;t < &ttable.threads[64];t++){
  eb:	c7 44 24 14 64 0e 00 	movl   $0xe64,0x14(%esp)
  f2:	00 
  f3:	eb 40                	jmp    135 <main+0x135>
        if(t->tid != 0){
  f5:	8b 44 24 14          	mov    0x14(%esp),%eax
  f9:	8b 00                	mov    (%eax),%eax
  fb:	85 c0                	test   %eax,%eax
  fd:	74 31                	je     130 <main+0x130>
            printf(1,"found one... %d,   wake up lazy boy !!!\n",t->tid);
  ff:	8b 44 24 14          	mov    0x14(%esp),%eax
 103:	8b 00                	mov    (%eax),%eax
 105:	89 44 24 08          	mov    %eax,0x8(%esp)
 109:	c7 44 24 04 7c 0d 00 	movl   $0xd7c,0x4(%esp)
 110:	00 
 111:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 118:	e8 d0 04 00 00       	call   5ed <printf>
            twakeup(t->tid);
 11d:	8b 44 24 14          	mov    0x14(%esp),%eax
 121:	8b 00                	mov    (%eax),%eax
 123:	89 04 24             	mov    %eax,(%esp)
 126:	e8 d9 03 00 00       	call   504 <twakeup>
            i++;
 12b:	83 44 24 18 01       	addl   $0x1,0x18(%esp)

    i=0;
    while(i++ < 1000000);
    //find that thread
    lock_acquire(&ttable.lock);
    for(t=ttable.threads;t < &ttable.threads[64];t++){
 130:	83 44 24 14 04       	addl   $0x4,0x14(%esp)
 135:	b8 64 0f 00 00       	mov    $0xf64,%eax
 13a:	39 44 24 14          	cmp    %eax,0x14(%esp)
 13e:	72 b5                	jb     f5 <main+0xf5>
            printf(1,"found one... %d,   wake up lazy boy !!!\n",t->tid);
            twakeup(t->tid);
            i++;
        }
    }
    lock_release(&ttable.lock);
 140:	c7 04 24 60 0e 00 00 	movl   $0xe60,(%esp)
 147:	e8 af 08 00 00       	call   9fb <lock_release>
    wait();
 14c:	e8 03 03 00 00       	call   454 <wait>
    wait();
 151:	e8 fe 02 00 00       	call   454 <wait>
    wait();
 156:	e8 f9 02 00 00       	call   454 <wait>
    free(stack);
 15b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 15f:	89 04 24             	mov    %eax,(%esp)
 162:	e8 3d 06 00 00       	call   7a4 <free>
    exit();
 167:	e8 e0 02 00 00       	call   44c <exit>

0000016c <func>:
}

void func(void *arg_ptr){
 16c:	55                   	push   %ebp
 16d:	89 e5                	mov    %esp,%ebp
 16f:	83 ec 28             	sub    $0x28,%esp
    int tid;
    tid = getpid();
 172:	e8 55 03 00 00       	call   4cc <getpid>
 177:	89 45 f4             	mov    %eax,-0xc(%ebp)
    lock_acquire(&ttable.lock);
 17a:	c7 04 24 60 0e 00 00 	movl   $0xe60,(%esp)
 181:	e8 56 08 00 00       	call   9dc <lock_acquire>
    (ttable.threads[ttable.total]).tid = tid;
 186:	a1 64 0f 00 00       	mov    0xf64,%eax
 18b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18e:	89 14 85 64 0e 00 00 	mov    %edx,0xe64(,%eax,4)
    ttable.total++;
 195:	a1 64 0f 00 00       	mov    0xf64,%eax
 19a:	83 c0 01             	add    $0x1,%eax
 19d:	a3 64 0f 00 00       	mov    %eax,0xf64
    lock_release(&ttable.lock);
 1a2:	c7 04 24 60 0e 00 00 	movl   $0xe60,(%esp)
 1a9:	e8 4d 08 00 00       	call   9fb <lock_release>

    printf(1,"I am thread %d, is about to sleep\n",tid);
 1ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b1:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b5:	c7 44 24 04 a8 0d 00 	movl   $0xda8,0x4(%esp)
 1bc:	00 
 1bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c4:	e8 24 04 00 00       	call   5ed <printf>
    tsleep();
 1c9:	e8 2e 03 00 00       	call   4fc <tsleep>
    printf(1,"I am wake up!\n");
 1ce:	c7 44 24 04 cb 0d 00 	movl   $0xdcb,0x4(%esp)
 1d5:	00 
 1d6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1dd:	e8 0b 04 00 00       	call   5ed <printf>
    texit();
 1e2:	e8 0d 03 00 00       	call   4f4 <texit>
 1e7:	90                   	nop

000001e8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1e8:	55                   	push   %ebp
 1e9:	89 e5                	mov    %esp,%ebp
 1eb:	57                   	push   %edi
 1ec:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1ed:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f0:	8b 55 10             	mov    0x10(%ebp),%edx
 1f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f6:	89 cb                	mov    %ecx,%ebx
 1f8:	89 df                	mov    %ebx,%edi
 1fa:	89 d1                	mov    %edx,%ecx
 1fc:	fc                   	cld    
 1fd:	f3 aa                	rep stos %al,%es:(%edi)
 1ff:	89 ca                	mov    %ecx,%edx
 201:	89 fb                	mov    %edi,%ebx
 203:	89 5d 08             	mov    %ebx,0x8(%ebp)
 206:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 209:	5b                   	pop    %ebx
 20a:	5f                   	pop    %edi
 20b:	5d                   	pop    %ebp
 20c:	c3                   	ret    

0000020d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 20d:	55                   	push   %ebp
 20e:	89 e5                	mov    %esp,%ebp
 210:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 219:	8b 45 0c             	mov    0xc(%ebp),%eax
 21c:	0f b6 10             	movzbl (%eax),%edx
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	88 10                	mov    %dl,(%eax)
 224:	8b 45 08             	mov    0x8(%ebp),%eax
 227:	0f b6 00             	movzbl (%eax),%eax
 22a:	84 c0                	test   %al,%al
 22c:	0f 95 c0             	setne  %al
 22f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 233:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 237:	84 c0                	test   %al,%al
 239:	75 de                	jne    219 <strcpy+0xc>
    ;
  return os;
 23b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 23e:	c9                   	leave  
 23f:	c3                   	ret    

00000240 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 240:	55                   	push   %ebp
 241:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 243:	eb 08                	jmp    24d <strcmp+0xd>
    p++, q++;
 245:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 249:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 24d:	8b 45 08             	mov    0x8(%ebp),%eax
 250:	0f b6 00             	movzbl (%eax),%eax
 253:	84 c0                	test   %al,%al
 255:	74 10                	je     267 <strcmp+0x27>
 257:	8b 45 08             	mov    0x8(%ebp),%eax
 25a:	0f b6 10             	movzbl (%eax),%edx
 25d:	8b 45 0c             	mov    0xc(%ebp),%eax
 260:	0f b6 00             	movzbl (%eax),%eax
 263:	38 c2                	cmp    %al,%dl
 265:	74 de                	je     245 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 267:	8b 45 08             	mov    0x8(%ebp),%eax
 26a:	0f b6 00             	movzbl (%eax),%eax
 26d:	0f b6 d0             	movzbl %al,%edx
 270:	8b 45 0c             	mov    0xc(%ebp),%eax
 273:	0f b6 00             	movzbl (%eax),%eax
 276:	0f b6 c0             	movzbl %al,%eax
 279:	89 d1                	mov    %edx,%ecx
 27b:	29 c1                	sub    %eax,%ecx
 27d:	89 c8                	mov    %ecx,%eax
}
 27f:	5d                   	pop    %ebp
 280:	c3                   	ret    

00000281 <strlen>:

uint
strlen(char *s)
{
 281:	55                   	push   %ebp
 282:	89 e5                	mov    %esp,%ebp
 284:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 287:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 28e:	eb 04                	jmp    294 <strlen+0x13>
 290:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 294:	8b 45 fc             	mov    -0x4(%ebp),%eax
 297:	03 45 08             	add    0x8(%ebp),%eax
 29a:	0f b6 00             	movzbl (%eax),%eax
 29d:	84 c0                	test   %al,%al
 29f:	75 ef                	jne    290 <strlen+0xf>
    ;
  return n;
 2a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    

000002a6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2ac:	8b 45 10             	mov    0x10(%ebp),%eax
 2af:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ba:	8b 45 08             	mov    0x8(%ebp),%eax
 2bd:	89 04 24             	mov    %eax,(%esp)
 2c0:	e8 23 ff ff ff       	call   1e8 <stosb>
  return dst;
 2c5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c8:	c9                   	leave  
 2c9:	c3                   	ret    

000002ca <strchr>:

char*
strchr(const char *s, char c)
{
 2ca:	55                   	push   %ebp
 2cb:	89 e5                	mov    %esp,%ebp
 2cd:	83 ec 04             	sub    $0x4,%esp
 2d0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d3:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2d6:	eb 14                	jmp    2ec <strchr+0x22>
    if(*s == c)
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
 2db:	0f b6 00             	movzbl (%eax),%eax
 2de:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2e1:	75 05                	jne    2e8 <strchr+0x1e>
      return (char*)s;
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	eb 13                	jmp    2fb <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2e8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2ec:	8b 45 08             	mov    0x8(%ebp),%eax
 2ef:	0f b6 00             	movzbl (%eax),%eax
 2f2:	84 c0                	test   %al,%al
 2f4:	75 e2                	jne    2d8 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2f6:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2fb:	c9                   	leave  
 2fc:	c3                   	ret    

000002fd <gets>:

char*
gets(char *buf, int max)
{
 2fd:	55                   	push   %ebp
 2fe:	89 e5                	mov    %esp,%ebp
 300:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 303:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 30a:	eb 44                	jmp    350 <gets+0x53>
    cc = read(0, &c, 1);
 30c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 313:	00 
 314:	8d 45 ef             	lea    -0x11(%ebp),%eax
 317:	89 44 24 04          	mov    %eax,0x4(%esp)
 31b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 322:	e8 3d 01 00 00       	call   464 <read>
 327:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 32a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 32e:	7e 2d                	jle    35d <gets+0x60>
      break;
    buf[i++] = c;
 330:	8b 45 f0             	mov    -0x10(%ebp),%eax
 333:	03 45 08             	add    0x8(%ebp),%eax
 336:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 33a:	88 10                	mov    %dl,(%eax)
 33c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 340:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 344:	3c 0a                	cmp    $0xa,%al
 346:	74 16                	je     35e <gets+0x61>
 348:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 34c:	3c 0d                	cmp    $0xd,%al
 34e:	74 0e                	je     35e <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 350:	8b 45 f0             	mov    -0x10(%ebp),%eax
 353:	83 c0 01             	add    $0x1,%eax
 356:	3b 45 0c             	cmp    0xc(%ebp),%eax
 359:	7c b1                	jl     30c <gets+0xf>
 35b:	eb 01                	jmp    35e <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 35d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 35e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 361:	03 45 08             	add    0x8(%ebp),%eax
 364:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 367:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36a:	c9                   	leave  
 36b:	c3                   	ret    

0000036c <stat>:

int
stat(char *n, struct stat *st)
{
 36c:	55                   	push   %ebp
 36d:	89 e5                	mov    %esp,%ebp
 36f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 372:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 379:	00 
 37a:	8b 45 08             	mov    0x8(%ebp),%eax
 37d:	89 04 24             	mov    %eax,(%esp)
 380:	e8 07 01 00 00       	call   48c <open>
 385:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 388:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 38c:	79 07                	jns    395 <stat+0x29>
    return -1;
 38e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 393:	eb 23                	jmp    3b8 <stat+0x4c>
  r = fstat(fd, st);
 395:	8b 45 0c             	mov    0xc(%ebp),%eax
 398:	89 44 24 04          	mov    %eax,0x4(%esp)
 39c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 39f:	89 04 24             	mov    %eax,(%esp)
 3a2:	e8 fd 00 00 00       	call   4a4 <fstat>
 3a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 3aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 3ad:	89 04 24             	mov    %eax,(%esp)
 3b0:	e8 bf 00 00 00       	call   474 <close>
  return r;
 3b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 3b8:	c9                   	leave  
 3b9:	c3                   	ret    

000003ba <atoi>:

int
atoi(const char *s)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3c0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3c7:	eb 24                	jmp    3ed <atoi+0x33>
    n = n*10 + *s++ - '0';
 3c9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3cc:	89 d0                	mov    %edx,%eax
 3ce:	c1 e0 02             	shl    $0x2,%eax
 3d1:	01 d0                	add    %edx,%eax
 3d3:	01 c0                	add    %eax,%eax
 3d5:	89 c2                	mov    %eax,%edx
 3d7:	8b 45 08             	mov    0x8(%ebp),%eax
 3da:	0f b6 00             	movzbl (%eax),%eax
 3dd:	0f be c0             	movsbl %al,%eax
 3e0:	8d 04 02             	lea    (%edx,%eax,1),%eax
 3e3:	83 e8 30             	sub    $0x30,%eax
 3e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 3e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	0f b6 00             	movzbl (%eax),%eax
 3f3:	3c 2f                	cmp    $0x2f,%al
 3f5:	7e 0a                	jle    401 <atoi+0x47>
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	0f b6 00             	movzbl (%eax),%eax
 3fd:	3c 39                	cmp    $0x39,%al
 3ff:	7e c8                	jle    3c9 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 401:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 404:	c9                   	leave  
 405:	c3                   	ret    

00000406 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 406:	55                   	push   %ebp
 407:	89 e5                	mov    %esp,%ebp
 409:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 40c:	8b 45 08             	mov    0x8(%ebp),%eax
 40f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 412:	8b 45 0c             	mov    0xc(%ebp),%eax
 415:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 418:	eb 13                	jmp    42d <memmove+0x27>
    *dst++ = *src++;
 41a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 41d:	0f b6 10             	movzbl (%eax),%edx
 420:	8b 45 f8             	mov    -0x8(%ebp),%eax
 423:	88 10                	mov    %dl,(%eax)
 425:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 429:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 42d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 431:	0f 9f c0             	setg   %al
 434:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 438:	84 c0                	test   %al,%al
 43a:	75 de                	jne    41a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 43c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 43f:	c9                   	leave  
 440:	c3                   	ret    
 441:	90                   	nop
 442:	90                   	nop
 443:	90                   	nop

00000444 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 444:	b8 01 00 00 00       	mov    $0x1,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <exit>:
SYSCALL(exit)
 44c:	b8 02 00 00 00       	mov    $0x2,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <wait>:
SYSCALL(wait)
 454:	b8 03 00 00 00       	mov    $0x3,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <pipe>:
SYSCALL(pipe)
 45c:	b8 04 00 00 00       	mov    $0x4,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <read>:
SYSCALL(read)
 464:	b8 05 00 00 00       	mov    $0x5,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <write>:
SYSCALL(write)
 46c:	b8 10 00 00 00       	mov    $0x10,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <close>:
SYSCALL(close)
 474:	b8 15 00 00 00       	mov    $0x15,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <kill>:
SYSCALL(kill)
 47c:	b8 06 00 00 00       	mov    $0x6,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <exec>:
SYSCALL(exec)
 484:	b8 07 00 00 00       	mov    $0x7,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <open>:
SYSCALL(open)
 48c:	b8 0f 00 00 00       	mov    $0xf,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <mknod>:
SYSCALL(mknod)
 494:	b8 11 00 00 00       	mov    $0x11,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <unlink>:
SYSCALL(unlink)
 49c:	b8 12 00 00 00       	mov    $0x12,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <fstat>:
SYSCALL(fstat)
 4a4:	b8 08 00 00 00       	mov    $0x8,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <link>:
SYSCALL(link)
 4ac:	b8 13 00 00 00       	mov    $0x13,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <mkdir>:
SYSCALL(mkdir)
 4b4:	b8 14 00 00 00       	mov    $0x14,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <chdir>:
SYSCALL(chdir)
 4bc:	b8 09 00 00 00       	mov    $0x9,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <dup>:
SYSCALL(dup)
 4c4:	b8 0a 00 00 00       	mov    $0xa,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <getpid>:
SYSCALL(getpid)
 4cc:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <sbrk>:
SYSCALL(sbrk)
 4d4:	b8 0c 00 00 00       	mov    $0xc,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <sleep>:
SYSCALL(sleep)
 4dc:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <uptime>:
SYSCALL(uptime)
 4e4:	b8 0e 00 00 00       	mov    $0xe,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <clone>:
SYSCALL(clone)
 4ec:	b8 16 00 00 00       	mov    $0x16,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <texit>:
SYSCALL(texit)
 4f4:	b8 17 00 00 00       	mov    $0x17,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <tsleep>:
SYSCALL(tsleep)
 4fc:	b8 18 00 00 00       	mov    $0x18,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <twakeup>:
SYSCALL(twakeup)
 504:	b8 19 00 00 00       	mov    $0x19,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <test>:
SYSCALL(test)
 50c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 514:	55                   	push   %ebp
 515:	89 e5                	mov    %esp,%ebp
 517:	83 ec 28             	sub    $0x28,%esp
 51a:	8b 45 0c             	mov    0xc(%ebp),%eax
 51d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 520:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 527:	00 
 528:	8d 45 f4             	lea    -0xc(%ebp),%eax
 52b:	89 44 24 04          	mov    %eax,0x4(%esp)
 52f:	8b 45 08             	mov    0x8(%ebp),%eax
 532:	89 04 24             	mov    %eax,(%esp)
 535:	e8 32 ff ff ff       	call   46c <write>
}
 53a:	c9                   	leave  
 53b:	c3                   	ret    

0000053c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 53c:	55                   	push   %ebp
 53d:	89 e5                	mov    %esp,%ebp
 53f:	53                   	push   %ebx
 540:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 543:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 54a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 54e:	74 17                	je     567 <printint+0x2b>
 550:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 554:	79 11                	jns    567 <printint+0x2b>
    neg = 1;
 556:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 55d:	8b 45 0c             	mov    0xc(%ebp),%eax
 560:	f7 d8                	neg    %eax
 562:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 565:	eb 06                	jmp    56d <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 567:	8b 45 0c             	mov    0xc(%ebp),%eax
 56a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 56d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 574:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 577:	8b 5d 10             	mov    0x10(%ebp),%ebx
 57a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57d:	ba 00 00 00 00       	mov    $0x0,%edx
 582:	f7 f3                	div    %ebx
 584:	89 d0                	mov    %edx,%eax
 586:	0f b6 80 24 0e 00 00 	movzbl 0xe24(%eax),%eax
 58d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 591:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 595:	8b 45 10             	mov    0x10(%ebp),%eax
 598:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 59b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59e:	ba 00 00 00 00       	mov    $0x0,%edx
 5a3:	f7 75 d4             	divl   -0x2c(%ebp)
 5a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 5a9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5ad:	75 c5                	jne    574 <printint+0x38>
  if(neg)
 5af:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5b3:	74 28                	je     5dd <printint+0xa1>
    buf[i++] = '-';
 5b5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5b8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 5bd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 5c1:	eb 1a                	jmp    5dd <printint+0xa1>
    putc(fd, buf[i]);
 5c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5c6:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 5cb:	0f be c0             	movsbl %al,%eax
 5ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d2:	8b 45 08             	mov    0x8(%ebp),%eax
 5d5:	89 04 24             	mov    %eax,(%esp)
 5d8:	e8 37 ff ff ff       	call   514 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5dd:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 5e1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5e5:	79 dc                	jns    5c3 <printint+0x87>
    putc(fd, buf[i]);
}
 5e7:	83 c4 44             	add    $0x44,%esp
 5ea:	5b                   	pop    %ebx
 5eb:	5d                   	pop    %ebp
 5ec:	c3                   	ret    

000005ed <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5ed:	55                   	push   %ebp
 5ee:	89 e5                	mov    %esp,%ebp
 5f0:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5f3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5fa:	8d 45 0c             	lea    0xc(%ebp),%eax
 5fd:	83 c0 04             	add    $0x4,%eax
 600:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 603:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 60a:	e9 7e 01 00 00       	jmp    78d <printf+0x1a0>
    c = fmt[i] & 0xff;
 60f:	8b 55 0c             	mov    0xc(%ebp),%edx
 612:	8b 45 ec             	mov    -0x14(%ebp),%eax
 615:	8d 04 02             	lea    (%edx,%eax,1),%eax
 618:	0f b6 00             	movzbl (%eax),%eax
 61b:	0f be c0             	movsbl %al,%eax
 61e:	25 ff 00 00 00       	and    $0xff,%eax
 623:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 626:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 62a:	75 2c                	jne    658 <printf+0x6b>
      if(c == '%'){
 62c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 630:	75 0c                	jne    63e <printf+0x51>
        state = '%';
 632:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 639:	e9 4b 01 00 00       	jmp    789 <printf+0x19c>
      } else {
        putc(fd, c);
 63e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 641:	0f be c0             	movsbl %al,%eax
 644:	89 44 24 04          	mov    %eax,0x4(%esp)
 648:	8b 45 08             	mov    0x8(%ebp),%eax
 64b:	89 04 24             	mov    %eax,(%esp)
 64e:	e8 c1 fe ff ff       	call   514 <putc>
 653:	e9 31 01 00 00       	jmp    789 <printf+0x19c>
      }
    } else if(state == '%'){
 658:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 65c:	0f 85 27 01 00 00    	jne    789 <printf+0x19c>
      if(c == 'd'){
 662:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 666:	75 2d                	jne    695 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 668:	8b 45 f4             	mov    -0xc(%ebp),%eax
 66b:	8b 00                	mov    (%eax),%eax
 66d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 674:	00 
 675:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 67c:	00 
 67d:	89 44 24 04          	mov    %eax,0x4(%esp)
 681:	8b 45 08             	mov    0x8(%ebp),%eax
 684:	89 04 24             	mov    %eax,(%esp)
 687:	e8 b0 fe ff ff       	call   53c <printint>
        ap++;
 68c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 690:	e9 ed 00 00 00       	jmp    782 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 695:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 699:	74 06                	je     6a1 <printf+0xb4>
 69b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 69f:	75 2d                	jne    6ce <printf+0xe1>
        printint(fd, *ap, 16, 0);
 6a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a4:	8b 00                	mov    (%eax),%eax
 6a6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6ad:	00 
 6ae:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6b5:	00 
 6b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ba:	8b 45 08             	mov    0x8(%ebp),%eax
 6bd:	89 04 24             	mov    %eax,(%esp)
 6c0:	e8 77 fe ff ff       	call   53c <printint>
        ap++;
 6c5:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6c9:	e9 b4 00 00 00       	jmp    782 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6ce:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 6d2:	75 46                	jne    71a <printf+0x12d>
        s = (char*)*ap;
 6d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d7:	8b 00                	mov    (%eax),%eax
 6d9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 6dc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 6e0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 6e4:	75 27                	jne    70d <printf+0x120>
          s = "(null)";
 6e6:	c7 45 e4 da 0d 00 00 	movl   $0xdda,-0x1c(%ebp)
        while(*s != 0){
 6ed:	eb 1f                	jmp    70e <printf+0x121>
          putc(fd, *s);
 6ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f2:	0f b6 00             	movzbl (%eax),%eax
 6f5:	0f be c0             	movsbl %al,%eax
 6f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fc:	8b 45 08             	mov    0x8(%ebp),%eax
 6ff:	89 04 24             	mov    %eax,(%esp)
 702:	e8 0d fe ff ff       	call   514 <putc>
          s++;
 707:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 70b:	eb 01                	jmp    70e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 70d:	90                   	nop
 70e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 711:	0f b6 00             	movzbl (%eax),%eax
 714:	84 c0                	test   %al,%al
 716:	75 d7                	jne    6ef <printf+0x102>
 718:	eb 68                	jmp    782 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 71a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 71e:	75 1d                	jne    73d <printf+0x150>
        putc(fd, *ap);
 720:	8b 45 f4             	mov    -0xc(%ebp),%eax
 723:	8b 00                	mov    (%eax),%eax
 725:	0f be c0             	movsbl %al,%eax
 728:	89 44 24 04          	mov    %eax,0x4(%esp)
 72c:	8b 45 08             	mov    0x8(%ebp),%eax
 72f:	89 04 24             	mov    %eax,(%esp)
 732:	e8 dd fd ff ff       	call   514 <putc>
        ap++;
 737:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 73b:	eb 45                	jmp    782 <printf+0x195>
      } else if(c == '%'){
 73d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 741:	75 17                	jne    75a <printf+0x16d>
        putc(fd, c);
 743:	8b 45 e8             	mov    -0x18(%ebp),%eax
 746:	0f be c0             	movsbl %al,%eax
 749:	89 44 24 04          	mov    %eax,0x4(%esp)
 74d:	8b 45 08             	mov    0x8(%ebp),%eax
 750:	89 04 24             	mov    %eax,(%esp)
 753:	e8 bc fd ff ff       	call   514 <putc>
 758:	eb 28                	jmp    782 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 75a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 761:	00 
 762:	8b 45 08             	mov    0x8(%ebp),%eax
 765:	89 04 24             	mov    %eax,(%esp)
 768:	e8 a7 fd ff ff       	call   514 <putc>
        putc(fd, c);
 76d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 770:	0f be c0             	movsbl %al,%eax
 773:	89 44 24 04          	mov    %eax,0x4(%esp)
 777:	8b 45 08             	mov    0x8(%ebp),%eax
 77a:	89 04 24             	mov    %eax,(%esp)
 77d:	e8 92 fd ff ff       	call   514 <putc>
      }
      state = 0;
 782:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 789:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 78d:	8b 55 0c             	mov    0xc(%ebp),%edx
 790:	8b 45 ec             	mov    -0x14(%ebp),%eax
 793:	8d 04 02             	lea    (%edx,%eax,1),%eax
 796:	0f b6 00             	movzbl (%eax),%eax
 799:	84 c0                	test   %al,%al
 79b:	0f 85 6e fe ff ff    	jne    60f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7a1:	c9                   	leave  
 7a2:	c3                   	ret    
 7a3:	90                   	nop

000007a4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a4:	55                   	push   %ebp
 7a5:	89 e5                	mov    %esp,%ebp
 7a7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7aa:	8b 45 08             	mov    0x8(%ebp),%eax
 7ad:	83 e8 08             	sub    $0x8,%eax
 7b0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b3:	a1 48 0e 00 00       	mov    0xe48,%eax
 7b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7bb:	eb 24                	jmp    7e1 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c0:	8b 00                	mov    (%eax),%eax
 7c2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c5:	77 12                	ja     7d9 <free+0x35>
 7c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ca:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7cd:	77 24                	ja     7f3 <free+0x4f>
 7cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d2:	8b 00                	mov    (%eax),%eax
 7d4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7d7:	77 1a                	ja     7f3 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7dc:	8b 00                	mov    (%eax),%eax
 7de:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7e7:	76 d4                	jbe    7bd <free+0x19>
 7e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ec:	8b 00                	mov    (%eax),%eax
 7ee:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7f1:	76 ca                	jbe    7bd <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f6:	8b 40 04             	mov    0x4(%eax),%eax
 7f9:	c1 e0 03             	shl    $0x3,%eax
 7fc:	89 c2                	mov    %eax,%edx
 7fe:	03 55 f8             	add    -0x8(%ebp),%edx
 801:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804:	8b 00                	mov    (%eax),%eax
 806:	39 c2                	cmp    %eax,%edx
 808:	75 24                	jne    82e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 80a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80d:	8b 50 04             	mov    0x4(%eax),%edx
 810:	8b 45 fc             	mov    -0x4(%ebp),%eax
 813:	8b 00                	mov    (%eax),%eax
 815:	8b 40 04             	mov    0x4(%eax),%eax
 818:	01 c2                	add    %eax,%edx
 81a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 820:	8b 45 fc             	mov    -0x4(%ebp),%eax
 823:	8b 00                	mov    (%eax),%eax
 825:	8b 10                	mov    (%eax),%edx
 827:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82a:	89 10                	mov    %edx,(%eax)
 82c:	eb 0a                	jmp    838 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 82e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 831:	8b 10                	mov    (%eax),%edx
 833:	8b 45 f8             	mov    -0x8(%ebp),%eax
 836:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 838:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83b:	8b 40 04             	mov    0x4(%eax),%eax
 83e:	c1 e0 03             	shl    $0x3,%eax
 841:	03 45 fc             	add    -0x4(%ebp),%eax
 844:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 847:	75 20                	jne    869 <free+0xc5>
    p->s.size += bp->s.size;
 849:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84c:	8b 50 04             	mov    0x4(%eax),%edx
 84f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 852:	8b 40 04             	mov    0x4(%eax),%eax
 855:	01 c2                	add    %eax,%edx
 857:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 85d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 860:	8b 10                	mov    (%eax),%edx
 862:	8b 45 fc             	mov    -0x4(%ebp),%eax
 865:	89 10                	mov    %edx,(%eax)
 867:	eb 08                	jmp    871 <free+0xcd>
  } else
    p->s.ptr = bp;
 869:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 86f:	89 10                	mov    %edx,(%eax)
  freep = p;
 871:	8b 45 fc             	mov    -0x4(%ebp),%eax
 874:	a3 48 0e 00 00       	mov    %eax,0xe48
}
 879:	c9                   	leave  
 87a:	c3                   	ret    

0000087b <morecore>:

static Header*
morecore(uint nu)
{
 87b:	55                   	push   %ebp
 87c:	89 e5                	mov    %esp,%ebp
 87e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 881:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 888:	77 07                	ja     891 <morecore+0x16>
    nu = 4096;
 88a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 891:	8b 45 08             	mov    0x8(%ebp),%eax
 894:	c1 e0 03             	shl    $0x3,%eax
 897:	89 04 24             	mov    %eax,(%esp)
 89a:	e8 35 fc ff ff       	call   4d4 <sbrk>
 89f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 8a2:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 8a6:	75 07                	jne    8af <morecore+0x34>
    return 0;
 8a8:	b8 00 00 00 00       	mov    $0x0,%eax
 8ad:	eb 22                	jmp    8d1 <morecore+0x56>
  hp = (Header*)p;
 8af:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 8b5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b8:	8b 55 08             	mov    0x8(%ebp),%edx
 8bb:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c1:	83 c0 08             	add    $0x8,%eax
 8c4:	89 04 24             	mov    %eax,(%esp)
 8c7:	e8 d8 fe ff ff       	call   7a4 <free>
  return freep;
 8cc:	a1 48 0e 00 00       	mov    0xe48,%eax
}
 8d1:	c9                   	leave  
 8d2:	c3                   	ret    

000008d3 <malloc>:

void*
malloc(uint nbytes)
{
 8d3:	55                   	push   %ebp
 8d4:	89 e5                	mov    %esp,%ebp
 8d6:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8d9:	8b 45 08             	mov    0x8(%ebp),%eax
 8dc:	83 c0 07             	add    $0x7,%eax
 8df:	c1 e8 03             	shr    $0x3,%eax
 8e2:	83 c0 01             	add    $0x1,%eax
 8e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 8e8:	a1 48 0e 00 00       	mov    0xe48,%eax
 8ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8f0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8f4:	75 23                	jne    919 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8f6:	c7 45 f0 40 0e 00 00 	movl   $0xe40,-0x10(%ebp)
 8fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 900:	a3 48 0e 00 00       	mov    %eax,0xe48
 905:	a1 48 0e 00 00       	mov    0xe48,%eax
 90a:	a3 40 0e 00 00       	mov    %eax,0xe40
    base.s.size = 0;
 90f:	c7 05 44 0e 00 00 00 	movl   $0x0,0xe44
 916:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 919:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91c:	8b 00                	mov    (%eax),%eax
 91e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 921:	8b 45 ec             	mov    -0x14(%ebp),%eax
 924:	8b 40 04             	mov    0x4(%eax),%eax
 927:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 92a:	72 4d                	jb     979 <malloc+0xa6>
      if(p->s.size == nunits)
 92c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 92f:	8b 40 04             	mov    0x4(%eax),%eax
 932:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 935:	75 0c                	jne    943 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 937:	8b 45 ec             	mov    -0x14(%ebp),%eax
 93a:	8b 10                	mov    (%eax),%edx
 93c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 93f:	89 10                	mov    %edx,(%eax)
 941:	eb 26                	jmp    969 <malloc+0x96>
      else {
        p->s.size -= nunits;
 943:	8b 45 ec             	mov    -0x14(%ebp),%eax
 946:	8b 40 04             	mov    0x4(%eax),%eax
 949:	89 c2                	mov    %eax,%edx
 94b:	2b 55 f4             	sub    -0xc(%ebp),%edx
 94e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 951:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 954:	8b 45 ec             	mov    -0x14(%ebp),%eax
 957:	8b 40 04             	mov    0x4(%eax),%eax
 95a:	c1 e0 03             	shl    $0x3,%eax
 95d:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 960:	8b 45 ec             	mov    -0x14(%ebp),%eax
 963:	8b 55 f4             	mov    -0xc(%ebp),%edx
 966:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 969:	8b 45 f0             	mov    -0x10(%ebp),%eax
 96c:	a3 48 0e 00 00       	mov    %eax,0xe48
      return (void*)(p + 1);
 971:	8b 45 ec             	mov    -0x14(%ebp),%eax
 974:	83 c0 08             	add    $0x8,%eax
 977:	eb 38                	jmp    9b1 <malloc+0xde>
    }
    if(p == freep)
 979:	a1 48 0e 00 00       	mov    0xe48,%eax
 97e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 981:	75 1b                	jne    99e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 983:	8b 45 f4             	mov    -0xc(%ebp),%eax
 986:	89 04 24             	mov    %eax,(%esp)
 989:	e8 ed fe ff ff       	call   87b <morecore>
 98e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 991:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 995:	75 07                	jne    99e <malloc+0xcb>
        return 0;
 997:	b8 00 00 00 00       	mov    $0x0,%eax
 99c:	eb 13                	jmp    9b1 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 99e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9a1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9a7:	8b 00                	mov    (%eax),%eax
 9a9:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9ac:	e9 70 ff ff ff       	jmp    921 <malloc+0x4e>
}
 9b1:	c9                   	leave  
 9b2:	c3                   	ret    
 9b3:	90                   	nop

000009b4 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 9b4:	55                   	push   %ebp
 9b5:	89 e5                	mov    %esp,%ebp
 9b7:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 9ba:	8b 55 08             	mov    0x8(%ebp),%edx
 9bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 9c0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 9c3:	f0 87 02             	lock xchg %eax,(%edx)
 9c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 9c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 9cc:	c9                   	leave  
 9cd:	c3                   	ret    

000009ce <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 9ce:	55                   	push   %ebp
 9cf:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 9d1:	8b 45 08             	mov    0x8(%ebp),%eax
 9d4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 9da:	5d                   	pop    %ebp
 9db:	c3                   	ret    

000009dc <lock_acquire>:
void lock_acquire(lock_t *lock){
 9dc:	55                   	push   %ebp
 9dd:	89 e5                	mov    %esp,%ebp
 9df:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 9e2:	8b 45 08             	mov    0x8(%ebp),%eax
 9e5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 9ec:	00 
 9ed:	89 04 24             	mov    %eax,(%esp)
 9f0:	e8 bf ff ff ff       	call   9b4 <xchg>
 9f5:	85 c0                	test   %eax,%eax
 9f7:	75 e9                	jne    9e2 <lock_acquire+0x6>
}
 9f9:	c9                   	leave  
 9fa:	c3                   	ret    

000009fb <lock_release>:
void lock_release(lock_t *lock){
 9fb:	55                   	push   %ebp
 9fc:	89 e5                	mov    %esp,%ebp
 9fe:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 a01:	8b 45 08             	mov    0x8(%ebp),%eax
 a04:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 a0b:	00 
 a0c:	89 04 24             	mov    %eax,(%esp)
 a0f:	e8 a0 ff ff ff       	call   9b4 <xchg>
}
 a14:	c9                   	leave  
 a15:	c3                   	ret    

00000a16 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 a16:	55                   	push   %ebp
 a17:	89 e5                	mov    %esp,%ebp
 a19:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 a1c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 a23:	e8 ab fe ff ff       	call   8d3 <malloc>
 a28:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 a2b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a2e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 a31:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a34:	25 ff 0f 00 00       	and    $0xfff,%eax
 a39:	85 c0                	test   %eax,%eax
 a3b:	74 15                	je     a52 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 a3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a40:	89 c2                	mov    %eax,%edx
 a42:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 a48:	b8 00 10 00 00       	mov    $0x1000,%eax
 a4d:	29 d0                	sub    %edx,%eax
 a4f:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 a52:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a56:	75 1b                	jne    a73 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 a58:	c7 44 24 04 e1 0d 00 	movl   $0xde1,0x4(%esp)
 a5f:	00 
 a60:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a67:	e8 81 fb ff ff       	call   5ed <printf>
        return 0;
 a6c:	b8 00 00 00 00       	mov    $0x0,%eax
 a71:	eb 6f                	jmp    ae2 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 a73:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 a76:	8b 55 08             	mov    0x8(%ebp),%edx
 a79:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a7c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 a80:	89 54 24 08          	mov    %edx,0x8(%esp)
 a84:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 a8b:	00 
 a8c:	89 04 24             	mov    %eax,(%esp)
 a8f:	e8 58 fa ff ff       	call   4ec <clone>
 a94:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 a97:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a9b:	79 1b                	jns    ab8 <thread_create+0xa2>
        printf(1,"clone fails\n");
 a9d:	c7 44 24 04 ef 0d 00 	movl   $0xdef,0x4(%esp)
 aa4:	00 
 aa5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 aac:	e8 3c fb ff ff       	call   5ed <printf>
        return 0;
 ab1:	b8 00 00 00 00       	mov    $0x0,%eax
 ab6:	eb 2a                	jmp    ae2 <thread_create+0xcc>
    }
    if(tid > 0){
 ab8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 abc:	7e 05                	jle    ac3 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 abe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac1:	eb 1f                	jmp    ae2 <thread_create+0xcc>
    }
    if(tid == 0){
 ac3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 ac7:	75 14                	jne    add <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 ac9:	c7 44 24 04 fc 0d 00 	movl   $0xdfc,0x4(%esp)
 ad0:	00 
 ad1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ad8:	e8 10 fb ff ff       	call   5ed <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 add:	b8 00 00 00 00       	mov    $0x0,%eax
}
 ae2:	c9                   	leave  
 ae3:	c3                   	ret    

00000ae4 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 ae4:	55                   	push   %ebp
 ae5:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 ae7:	8b 45 08             	mov    0x8(%ebp),%eax
 aea:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 af0:	8b 45 08             	mov    0x8(%ebp),%eax
 af3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 afa:	8b 45 08             	mov    0x8(%ebp),%eax
 afd:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 b04:	5d                   	pop    %ebp
 b05:	c3                   	ret    

00000b06 <add_q>:

void add_q(struct queue *q, int v){
 b06:	55                   	push   %ebp
 b07:	89 e5                	mov    %esp,%ebp
 b09:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 b0c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 b13:	e8 bb fd ff ff       	call   8d3 <malloc>
 b18:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 b1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b1e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 b25:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b28:	8b 55 0c             	mov    0xc(%ebp),%edx
 b2b:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 b2d:	8b 45 08             	mov    0x8(%ebp),%eax
 b30:	8b 40 04             	mov    0x4(%eax),%eax
 b33:	85 c0                	test   %eax,%eax
 b35:	75 0b                	jne    b42 <add_q+0x3c>
        q->head = n;
 b37:	8b 45 08             	mov    0x8(%ebp),%eax
 b3a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b3d:	89 50 04             	mov    %edx,0x4(%eax)
 b40:	eb 0c                	jmp    b4e <add_q+0x48>
    }else{
        q->tail->next = n;
 b42:	8b 45 08             	mov    0x8(%ebp),%eax
 b45:	8b 40 08             	mov    0x8(%eax),%eax
 b48:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b4b:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 b4e:	8b 45 08             	mov    0x8(%ebp),%eax
 b51:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b54:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 b57:	8b 45 08             	mov    0x8(%ebp),%eax
 b5a:	8b 00                	mov    (%eax),%eax
 b5c:	8d 50 01             	lea    0x1(%eax),%edx
 b5f:	8b 45 08             	mov    0x8(%ebp),%eax
 b62:	89 10                	mov    %edx,(%eax)
}
 b64:	c9                   	leave  
 b65:	c3                   	ret    

00000b66 <empty_q>:

int empty_q(struct queue *q){
 b66:	55                   	push   %ebp
 b67:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 b69:	8b 45 08             	mov    0x8(%ebp),%eax
 b6c:	8b 00                	mov    (%eax),%eax
 b6e:	85 c0                	test   %eax,%eax
 b70:	75 07                	jne    b79 <empty_q+0x13>
        return 1;
 b72:	b8 01 00 00 00       	mov    $0x1,%eax
 b77:	eb 05                	jmp    b7e <empty_q+0x18>
    else
        return 0;
 b79:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 b7e:	5d                   	pop    %ebp
 b7f:	c3                   	ret    

00000b80 <pop_q>:
int pop_q(struct queue *q){
 b80:	55                   	push   %ebp
 b81:	89 e5                	mov    %esp,%ebp
 b83:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 b86:	8b 45 08             	mov    0x8(%ebp),%eax
 b89:	89 04 24             	mov    %eax,(%esp)
 b8c:	e8 d5 ff ff ff       	call   b66 <empty_q>
 b91:	85 c0                	test   %eax,%eax
 b93:	75 5d                	jne    bf2 <pop_q+0x72>
       val = q->head->value; 
 b95:	8b 45 08             	mov    0x8(%ebp),%eax
 b98:	8b 40 04             	mov    0x4(%eax),%eax
 b9b:	8b 00                	mov    (%eax),%eax
 b9d:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 ba0:	8b 45 08             	mov    0x8(%ebp),%eax
 ba3:	8b 40 04             	mov    0x4(%eax),%eax
 ba6:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 ba9:	8b 45 08             	mov    0x8(%ebp),%eax
 bac:	8b 40 04             	mov    0x4(%eax),%eax
 baf:	8b 50 04             	mov    0x4(%eax),%edx
 bb2:	8b 45 08             	mov    0x8(%ebp),%eax
 bb5:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 bb8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bbb:	89 04 24             	mov    %eax,(%esp)
 bbe:	e8 e1 fb ff ff       	call   7a4 <free>
       q->size--;
 bc3:	8b 45 08             	mov    0x8(%ebp),%eax
 bc6:	8b 00                	mov    (%eax),%eax
 bc8:	8d 50 ff             	lea    -0x1(%eax),%edx
 bcb:	8b 45 08             	mov    0x8(%ebp),%eax
 bce:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 bd0:	8b 45 08             	mov    0x8(%ebp),%eax
 bd3:	8b 00                	mov    (%eax),%eax
 bd5:	85 c0                	test   %eax,%eax
 bd7:	75 14                	jne    bed <pop_q+0x6d>
            q->head = 0;
 bd9:	8b 45 08             	mov    0x8(%ebp),%eax
 bdc:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 be3:	8b 45 08             	mov    0x8(%ebp),%eax
 be6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 bed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bf0:	eb 05                	jmp    bf7 <pop_q+0x77>
    }
    return -1;
 bf2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 bf7:	c9                   	leave  
 bf8:	c3                   	ret    
 bf9:	90                   	nop
 bfa:	90                   	nop
 bfb:	90                   	nop

00000bfc <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 bfc:	55                   	push   %ebp
 bfd:	89 e5                	mov    %esp,%ebp
 bff:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 c02:	8b 45 08             	mov    0x8(%ebp),%eax
 c05:	8b 55 0c             	mov    0xc(%ebp),%edx
 c08:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 c0b:	8b 45 08             	mov    0x8(%ebp),%eax
 c0e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 c15:	8b 45 08             	mov    0x8(%ebp),%eax
 c18:	89 04 24             	mov    %eax,(%esp)
 c1b:	e8 ae fd ff ff       	call   9ce <lock_init>
}
 c20:	c9                   	leave  
 c21:	c3                   	ret    

00000c22 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 c22:	55                   	push   %ebp
 c23:	89 e5                	mov    %esp,%ebp
 c25:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 c28:	8b 45 08             	mov    0x8(%ebp),%eax
 c2b:	89 04 24             	mov    %eax,(%esp)
 c2e:	e8 a9 fd ff ff       	call   9dc <lock_acquire>
	if(s->count  == 0){
 c33:	8b 45 08             	mov    0x8(%ebp),%eax
 c36:	8b 40 04             	mov    0x4(%eax),%eax
 c39:	85 c0                	test   %eax,%eax
 c3b:	75 43                	jne    c80 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 c3d:	c7 44 24 04 0d 0e 00 	movl   $0xe0d,0x4(%esp)
 c44:	00 
 c45:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c4c:	e8 9c f9 ff ff       	call   5ed <printf>
		//add proc to waiters list
		int tid = getpid();
 c51:	e8 76 f8 ff ff       	call   4cc <getpid>
 c56:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 c59:	8b 45 08             	mov    0x8(%ebp),%eax
 c5c:	8d 50 0c             	lea    0xc(%eax),%edx
 c5f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c62:	89 44 24 04          	mov    %eax,0x4(%esp)
 c66:	89 14 24             	mov    %edx,(%esp)
 c69:	e8 98 fe ff ff       	call   b06 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 c6e:	8b 45 08             	mov    0x8(%ebp),%eax
 c71:	89 04 24             	mov    %eax,(%esp)
 c74:	e8 82 fd ff ff       	call   9fb <lock_release>
		tsleep(); 
 c79:	e8 7e f8 ff ff       	call   4fc <tsleep>
 c7e:	eb 2e                	jmp    cae <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 c80:	c7 44 24 04 14 0e 00 	movl   $0xe14,0x4(%esp)
 c87:	00 
 c88:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c8f:	e8 59 f9 ff ff       	call   5ed <printf>
		s->count--;	
 c94:	8b 45 08             	mov    0x8(%ebp),%eax
 c97:	8b 40 04             	mov    0x4(%eax),%eax
 c9a:	8d 50 ff             	lea    -0x1(%eax),%edx
 c9d:	8b 45 08             	mov    0x8(%ebp),%eax
 ca0:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 ca3:	8b 45 08             	mov    0x8(%ebp),%eax
 ca6:	89 04 24             	mov    %eax,(%esp)
 ca9:	e8 4d fd ff ff       	call   9fb <lock_release>
	}
}
 cae:	c9                   	leave  
 caf:	c3                   	ret    

00000cb0 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 cb0:	55                   	push   %ebp
 cb1:	89 e5                	mov    %esp,%ebp
 cb3:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 cb6:	c7 44 24 04 1b 0e 00 	movl   $0xe1b,0x4(%esp)
 cbd:	00 
 cbe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 cc5:	e8 23 f9 ff ff       	call   5ed <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 cca:	8b 45 08             	mov    0x8(%ebp),%eax
 ccd:	89 04 24             	mov    %eax,(%esp)
 cd0:	e8 07 fd ff ff       	call   9dc <lock_acquire>
	if(s->count < s->size){
 cd5:	8b 45 08             	mov    0x8(%ebp),%eax
 cd8:	8b 50 04             	mov    0x4(%eax),%edx
 cdb:	8b 45 08             	mov    0x8(%ebp),%eax
 cde:	8b 40 08             	mov    0x8(%eax),%eax
 ce1:	39 c2                	cmp    %eax,%edx
 ce3:	7d 0f                	jge    cf4 <sem_signal+0x44>
		s->count++;	
 ce5:	8b 45 08             	mov    0x8(%ebp),%eax
 ce8:	8b 40 04             	mov    0x4(%eax),%eax
 ceb:	8d 50 01             	lea    0x1(%eax),%edx
 cee:	8b 45 08             	mov    0x8(%ebp),%eax
 cf1:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 cf4:	8b 45 08             	mov    0x8(%ebp),%eax
 cf7:	83 c0 0c             	add    $0xc,%eax
 cfa:	89 04 24             	mov    %eax,(%esp)
 cfd:	e8 7e fe ff ff       	call   b80 <pop_q>
 d02:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 d05:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 d09:	74 2e                	je     d39 <sem_signal+0x89>
		printf(1, "Sem A\n");
 d0b:	c7 44 24 04 14 0e 00 	movl   $0xe14,0x4(%esp)
 d12:	00 
 d13:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d1a:	e8 ce f8 ff ff       	call   5ed <printf>
		twakeup(tid);
 d1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d22:	89 04 24             	mov    %eax,(%esp)
 d25:	e8 da f7 ff ff       	call   504 <twakeup>
		s->count--;
 d2a:	8b 45 08             	mov    0x8(%ebp),%eax
 d2d:	8b 40 04             	mov    0x4(%eax),%eax
 d30:	8d 50 ff             	lea    -0x1(%eax),%edx
 d33:	8b 45 08             	mov    0x8(%ebp),%eax
 d36:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 d39:	8b 45 08             	mov    0x8(%ebp),%eax
 d3c:	89 04 24             	mov    %eax,(%esp)
 d3f:	e8 b7 fc ff ff       	call   9fb <lock_release>

 d44:	c9                   	leave  
 d45:	c3                   	ret    
