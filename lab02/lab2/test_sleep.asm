
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
   9:	c7 44 24 04 50 0d 00 	movl   $0xd50,0x4(%esp)
  10:	00 
  11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  18:	e8 d7 05 00 00       	call   5f4 <printf>
    lock_init(&ttable.lock);
  1d:	c7 04 24 40 12 00 00 	movl   $0x1240,(%esp)
  24:	e8 b1 09 00 00       	call   9da <lock_init>
    ttable.total = 0;
  29:	c7 05 44 13 00 00 00 	movl   $0x0,0x1344
  30:	00 00 00 

    lock_acquire(&ttable.lock);
  33:	c7 04 24 40 12 00 00 	movl   $0x1240,(%esp)
  3a:	e8 a9 09 00 00       	call   9e8 <lock_acquire>
    for(t=ttable.threads;t < &ttable.threads[64];t++){
  3f:	c7 44 24 1c 44 12 00 	movl   $0x1244,0x1c(%esp)
  46:	00 
  47:	eb 0f                	jmp    58 <main+0x58>
        t->tid = 0;
  49:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  4d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    printf(1,"init ttable\n");
    lock_init(&ttable.lock);
    ttable.total = 0;

    lock_acquire(&ttable.lock);
    for(t=ttable.threads;t < &ttable.threads[64];t++){
  53:	83 44 24 1c 04       	addl   $0x4,0x1c(%esp)
  58:	81 7c 24 1c 44 13 00 	cmpl   $0x1344,0x1c(%esp)
  5f:	00 
  60:	72 e7                	jb     49 <main+0x49>
        t->tid = 0;
    }
    lock_release(&ttable.lock);
  62:	c7 04 24 40 12 00 00 	movl   $0x1240,(%esp)
  69:	e8 9a 09 00 00       	call   a08 <lock_release>
    printf(1,"testing thread sleep and wakeup \n\n\n");
  6e:	c7 44 24 04 60 0d 00 	movl   $0xd60,0x4(%esp)
  75:	00 
  76:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7d:	e8 72 05 00 00       	call   5f4 <printf>
    void *stack = thread_create(func,0);
  82:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  89:	00 
  8a:	c7 04 24 69 01 00 00 	movl   $0x169,(%esp)
  91:	e8 8d 09 00 00       	call   a23 <thread_create>
  96:	89 44 24 14          	mov    %eax,0x14(%esp)
    thread_create(func,0);
  9a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  a1:	00 
  a2:	c7 04 24 69 01 00 00 	movl   $0x169,(%esp)
  a9:	e8 75 09 00 00       	call   a23 <thread_create>
    thread_create(func,0);
  ae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  b5:	00 
  b6:	c7 04 24 69 01 00 00 	movl   $0x169,(%esp)
  bd:	e8 61 09 00 00       	call   a23 <thread_create>

    i=0;
  c2:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  c9:	00 
    while(i++ < 1000000);
  ca:	90                   	nop
  cb:	8b 44 24 18          	mov    0x18(%esp),%eax
  cf:	8d 50 01             	lea    0x1(%eax),%edx
  d2:	89 54 24 18          	mov    %edx,0x18(%esp)
  d6:	3d 3f 42 0f 00       	cmp    $0xf423f,%eax
  db:	7e ee                	jle    cb <main+0xcb>
    //find that thread
    lock_acquire(&ttable.lock);
  dd:	c7 04 24 40 12 00 00 	movl   $0x1240,(%esp)
  e4:	e8 ff 08 00 00       	call   9e8 <lock_acquire>
    for(t=ttable.threads;t < &ttable.threads[64];t++){
  e9:	c7 44 24 1c 44 12 00 	movl   $0x1244,0x1c(%esp)
  f0:	00 
  f1:	eb 40                	jmp    133 <main+0x133>
        if(t->tid != 0){
  f3:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  f7:	8b 00                	mov    (%eax),%eax
  f9:	85 c0                	test   %eax,%eax
  fb:	74 31                	je     12e <main+0x12e>
            printf(1,"found one... %d,   wake up lazy boy !!!\n",t->tid);
  fd:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 101:	8b 00                	mov    (%eax),%eax
 103:	89 44 24 08          	mov    %eax,0x8(%esp)
 107:	c7 44 24 04 84 0d 00 	movl   $0xd84,0x4(%esp)
 10e:	00 
 10f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 116:	e8 d9 04 00 00       	call   5f4 <printf>
            twakeup(t->tid);
 11b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 11f:	8b 00                	mov    (%eax),%eax
 121:	89 04 24             	mov    %eax,(%esp)
 124:	e8 db 03 00 00       	call   504 <twakeup>
            i++;
 129:	83 44 24 18 01       	addl   $0x1,0x18(%esp)

    i=0;
    while(i++ < 1000000);
    //find that thread
    lock_acquire(&ttable.lock);
    for(t=ttable.threads;t < &ttable.threads[64];t++){
 12e:	83 44 24 1c 04       	addl   $0x4,0x1c(%esp)
 133:	81 7c 24 1c 44 13 00 	cmpl   $0x1344,0x1c(%esp)
 13a:	00 
 13b:	72 b6                	jb     f3 <main+0xf3>
            printf(1,"found one... %d,   wake up lazy boy !!!\n",t->tid);
            twakeup(t->tid);
            i++;
        }
    }
    lock_release(&ttable.lock);
 13d:	c7 04 24 40 12 00 00 	movl   $0x1240,(%esp)
 144:	e8 bf 08 00 00       	call   a08 <lock_release>
    wait();
 149:	e8 06 03 00 00       	call   454 <wait>
    wait();
 14e:	e8 01 03 00 00       	call   454 <wait>
    wait();
 153:	e8 fc 02 00 00       	call   454 <wait>
    free(stack);
 158:	8b 44 24 14          	mov    0x14(%esp),%eax
 15c:	89 04 24             	mov    %eax,(%esp)
 15f:	e8 43 06 00 00       	call   7a7 <free>
    exit();
 164:	e8 e3 02 00 00       	call   44c <exit>

00000169 <func>:
}

void func(void *arg_ptr){
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	83 ec 28             	sub    $0x28,%esp
    int tid;
    tid = getpid();
 16f:	e8 58 03 00 00       	call   4cc <getpid>
 174:	89 45 f4             	mov    %eax,-0xc(%ebp)
    lock_acquire(&ttable.lock);
 177:	c7 04 24 40 12 00 00 	movl   $0x1240,(%esp)
 17e:	e8 65 08 00 00       	call   9e8 <lock_acquire>
    (ttable.threads[ttable.total]).tid = tid;
 183:	a1 44 13 00 00       	mov    0x1344,%eax
 188:	8b 55 f4             	mov    -0xc(%ebp),%edx
 18b:	89 14 85 44 12 00 00 	mov    %edx,0x1244(,%eax,4)
    ttable.total++;
 192:	a1 44 13 00 00       	mov    0x1344,%eax
 197:	83 c0 01             	add    $0x1,%eax
 19a:	a3 44 13 00 00       	mov    %eax,0x1344
    lock_release(&ttable.lock);
 19f:	c7 04 24 40 12 00 00 	movl   $0x1240,(%esp)
 1a6:	e8 5d 08 00 00       	call   a08 <lock_release>

    printf(1,"I am thread %d, is about to sleep\n",tid);
 1ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ae:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b2:	c7 44 24 04 b0 0d 00 	movl   $0xdb0,0x4(%esp)
 1b9:	00 
 1ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c1:	e8 2e 04 00 00       	call   5f4 <printf>
    tsleep();
 1c6:	e8 31 03 00 00       	call   4fc <tsleep>
    printf(1,"I am wake up!\n");
 1cb:	c7 44 24 04 d3 0d 00 	movl   $0xdd3,0x4(%esp)
 1d2:	00 
 1d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1da:	e8 15 04 00 00       	call   5f4 <printf>
    texit();
 1df:	e8 10 03 00 00       	call   4f4 <texit>

000001e4 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
 1e7:	57                   	push   %edi
 1e8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1ec:	8b 55 10             	mov    0x10(%ebp),%edx
 1ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f2:	89 cb                	mov    %ecx,%ebx
 1f4:	89 df                	mov    %ebx,%edi
 1f6:	89 d1                	mov    %edx,%ecx
 1f8:	fc                   	cld    
 1f9:	f3 aa                	rep stos %al,%es:(%edi)
 1fb:	89 ca                	mov    %ecx,%edx
 1fd:	89 fb                	mov    %edi,%ebx
 1ff:	89 5d 08             	mov    %ebx,0x8(%ebp)
 202:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 205:	5b                   	pop    %ebx
 206:	5f                   	pop    %edi
 207:	5d                   	pop    %ebp
 208:	c3                   	ret    

00000209 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 209:	55                   	push   %ebp
 20a:	89 e5                	mov    %esp,%ebp
 20c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 215:	90                   	nop
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	8d 50 01             	lea    0x1(%eax),%edx
 21c:	89 55 08             	mov    %edx,0x8(%ebp)
 21f:	8b 55 0c             	mov    0xc(%ebp),%edx
 222:	8d 4a 01             	lea    0x1(%edx),%ecx
 225:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 228:	0f b6 12             	movzbl (%edx),%edx
 22b:	88 10                	mov    %dl,(%eax)
 22d:	0f b6 00             	movzbl (%eax),%eax
 230:	84 c0                	test   %al,%al
 232:	75 e2                	jne    216 <strcpy+0xd>
    ;
  return os;
 234:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 237:	c9                   	leave  
 238:	c3                   	ret    

00000239 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 23c:	eb 08                	jmp    246 <strcmp+0xd>
    p++, q++;
 23e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 242:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 246:	8b 45 08             	mov    0x8(%ebp),%eax
 249:	0f b6 00             	movzbl (%eax),%eax
 24c:	84 c0                	test   %al,%al
 24e:	74 10                	je     260 <strcmp+0x27>
 250:	8b 45 08             	mov    0x8(%ebp),%eax
 253:	0f b6 10             	movzbl (%eax),%edx
 256:	8b 45 0c             	mov    0xc(%ebp),%eax
 259:	0f b6 00             	movzbl (%eax),%eax
 25c:	38 c2                	cmp    %al,%dl
 25e:	74 de                	je     23e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	0f b6 d0             	movzbl %al,%edx
 269:	8b 45 0c             	mov    0xc(%ebp),%eax
 26c:	0f b6 00             	movzbl (%eax),%eax
 26f:	0f b6 c0             	movzbl %al,%eax
 272:	29 c2                	sub    %eax,%edx
 274:	89 d0                	mov    %edx,%eax
}
 276:	5d                   	pop    %ebp
 277:	c3                   	ret    

00000278 <strlen>:

uint
strlen(char *s)
{
 278:	55                   	push   %ebp
 279:	89 e5                	mov    %esp,%ebp
 27b:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 27e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 285:	eb 04                	jmp    28b <strlen+0x13>
 287:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 28b:	8b 55 fc             	mov    -0x4(%ebp),%edx
 28e:	8b 45 08             	mov    0x8(%ebp),%eax
 291:	01 d0                	add    %edx,%eax
 293:	0f b6 00             	movzbl (%eax),%eax
 296:	84 c0                	test   %al,%al
 298:	75 ed                	jne    287 <strlen+0xf>
    ;
  return n;
 29a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 29d:	c9                   	leave  
 29e:	c3                   	ret    

0000029f <memset>:

void*
memset(void *dst, int c, uint n)
{
 29f:	55                   	push   %ebp
 2a0:	89 e5                	mov    %esp,%ebp
 2a2:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2a5:	8b 45 10             	mov    0x10(%ebp),%eax
 2a8:	89 44 24 08          	mov    %eax,0x8(%esp)
 2ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 2af:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	89 04 24             	mov    %eax,(%esp)
 2b9:	e8 26 ff ff ff       	call   1e4 <stosb>
  return dst;
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c1:	c9                   	leave  
 2c2:	c3                   	ret    

000002c3 <strchr>:

char*
strchr(const char *s, char c)
{
 2c3:	55                   	push   %ebp
 2c4:	89 e5                	mov    %esp,%ebp
 2c6:	83 ec 04             	sub    $0x4,%esp
 2c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cc:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2cf:	eb 14                	jmp    2e5 <strchr+0x22>
    if(*s == c)
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	0f b6 00             	movzbl (%eax),%eax
 2d7:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2da:	75 05                	jne    2e1 <strchr+0x1e>
      return (char*)s;
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
 2df:	eb 13                	jmp    2f4 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2e1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2e5:	8b 45 08             	mov    0x8(%ebp),%eax
 2e8:	0f b6 00             	movzbl (%eax),%eax
 2eb:	84 c0                	test   %al,%al
 2ed:	75 e2                	jne    2d1 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2ef:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2f4:	c9                   	leave  
 2f5:	c3                   	ret    

000002f6 <gets>:

char*
gets(char *buf, int max)
{
 2f6:	55                   	push   %ebp
 2f7:	89 e5                	mov    %esp,%ebp
 2f9:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2fc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 303:	eb 4c                	jmp    351 <gets+0x5b>
    cc = read(0, &c, 1);
 305:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 30c:	00 
 30d:	8d 45 ef             	lea    -0x11(%ebp),%eax
 310:	89 44 24 04          	mov    %eax,0x4(%esp)
 314:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 31b:	e8 44 01 00 00       	call   464 <read>
 320:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 323:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 327:	7f 02                	jg     32b <gets+0x35>
      break;
 329:	eb 31                	jmp    35c <gets+0x66>
    buf[i++] = c;
 32b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 32e:	8d 50 01             	lea    0x1(%eax),%edx
 331:	89 55 f4             	mov    %edx,-0xc(%ebp)
 334:	89 c2                	mov    %eax,%edx
 336:	8b 45 08             	mov    0x8(%ebp),%eax
 339:	01 c2                	add    %eax,%edx
 33b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 341:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 345:	3c 0a                	cmp    $0xa,%al
 347:	74 13                	je     35c <gets+0x66>
 349:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 34d:	3c 0d                	cmp    $0xd,%al
 34f:	74 0b                	je     35c <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 351:	8b 45 f4             	mov    -0xc(%ebp),%eax
 354:	83 c0 01             	add    $0x1,%eax
 357:	3b 45 0c             	cmp    0xc(%ebp),%eax
 35a:	7c a9                	jl     305 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 35c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 35f:	8b 45 08             	mov    0x8(%ebp),%eax
 362:	01 d0                	add    %edx,%eax
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
 385:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 388:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 38c:	79 07                	jns    395 <stat+0x29>
    return -1;
 38e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 393:	eb 23                	jmp    3b8 <stat+0x4c>
  r = fstat(fd, st);
 395:	8b 45 0c             	mov    0xc(%ebp),%eax
 398:	89 44 24 04          	mov    %eax,0x4(%esp)
 39c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 39f:	89 04 24             	mov    %eax,(%esp)
 3a2:	e8 fd 00 00 00       	call   4a4 <fstat>
 3a7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 3aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ad:	89 04 24             	mov    %eax,(%esp)
 3b0:	e8 bf 00 00 00       	call   474 <close>
  return r;
 3b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
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
 3c7:	eb 25                	jmp    3ee <atoi+0x34>
    n = n*10 + *s++ - '0';
 3c9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3cc:	89 d0                	mov    %edx,%eax
 3ce:	c1 e0 02             	shl    $0x2,%eax
 3d1:	01 d0                	add    %edx,%eax
 3d3:	01 c0                	add    %eax,%eax
 3d5:	89 c1                	mov    %eax,%ecx
 3d7:	8b 45 08             	mov    0x8(%ebp),%eax
 3da:	8d 50 01             	lea    0x1(%eax),%edx
 3dd:	89 55 08             	mov    %edx,0x8(%ebp)
 3e0:	0f b6 00             	movzbl (%eax),%eax
 3e3:	0f be c0             	movsbl %al,%eax
 3e6:	01 c8                	add    %ecx,%eax
 3e8:	83 e8 30             	sub    $0x30,%eax
 3eb:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ee:	8b 45 08             	mov    0x8(%ebp),%eax
 3f1:	0f b6 00             	movzbl (%eax),%eax
 3f4:	3c 2f                	cmp    $0x2f,%al
 3f6:	7e 0a                	jle    402 <atoi+0x48>
 3f8:	8b 45 08             	mov    0x8(%ebp),%eax
 3fb:	0f b6 00             	movzbl (%eax),%eax
 3fe:	3c 39                	cmp    $0x39,%al
 400:	7e c7                	jle    3c9 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 402:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 405:	c9                   	leave  
 406:	c3                   	ret    

00000407 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 407:	55                   	push   %ebp
 408:	89 e5                	mov    %esp,%ebp
 40a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 40d:	8b 45 08             	mov    0x8(%ebp),%eax
 410:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 413:	8b 45 0c             	mov    0xc(%ebp),%eax
 416:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 419:	eb 17                	jmp    432 <memmove+0x2b>
    *dst++ = *src++;
 41b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 41e:	8d 50 01             	lea    0x1(%eax),%edx
 421:	89 55 fc             	mov    %edx,-0x4(%ebp)
 424:	8b 55 f8             	mov    -0x8(%ebp),%edx
 427:	8d 4a 01             	lea    0x1(%edx),%ecx
 42a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 42d:	0f b6 12             	movzbl (%edx),%edx
 430:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 432:	8b 45 10             	mov    0x10(%ebp),%eax
 435:	8d 50 ff             	lea    -0x1(%eax),%edx
 438:	89 55 10             	mov    %edx,0x10(%ebp)
 43b:	85 c0                	test   %eax,%eax
 43d:	7f dc                	jg     41b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 43f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 442:	c9                   	leave  
 443:	c3                   	ret    

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
 517:	83 ec 18             	sub    $0x18,%esp
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
 53f:	56                   	push   %esi
 540:	53                   	push   %ebx
 541:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 544:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 54b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 54f:	74 17                	je     568 <printint+0x2c>
 551:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 555:	79 11                	jns    568 <printint+0x2c>
    neg = 1;
 557:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 55e:	8b 45 0c             	mov    0xc(%ebp),%eax
 561:	f7 d8                	neg    %eax
 563:	89 45 ec             	mov    %eax,-0x14(%ebp)
 566:	eb 06                	jmp    56e <printint+0x32>
  } else {
    x = xx;
 568:	8b 45 0c             	mov    0xc(%ebp),%eax
 56b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 56e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 575:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 578:	8d 41 01             	lea    0x1(%ecx),%eax
 57b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 57e:	8b 5d 10             	mov    0x10(%ebp),%ebx
 581:	8b 45 ec             	mov    -0x14(%ebp),%eax
 584:	ba 00 00 00 00       	mov    $0x0,%edx
 589:	f7 f3                	div    %ebx
 58b:	89 d0                	mov    %edx,%eax
 58d:	0f b6 80 0c 12 00 00 	movzbl 0x120c(%eax),%eax
 594:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 598:	8b 75 10             	mov    0x10(%ebp),%esi
 59b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 59e:	ba 00 00 00 00       	mov    $0x0,%edx
 5a3:	f7 f6                	div    %esi
 5a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5a8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5ac:	75 c7                	jne    575 <printint+0x39>
  if(neg)
 5ae:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5b2:	74 10                	je     5c4 <printint+0x88>
    buf[i++] = '-';
 5b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b7:	8d 50 01             	lea    0x1(%eax),%edx
 5ba:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5bd:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5c2:	eb 1f                	jmp    5e3 <printint+0xa7>
 5c4:	eb 1d                	jmp    5e3 <printint+0xa7>
    putc(fd, buf[i]);
 5c6:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5cc:	01 d0                	add    %edx,%eax
 5ce:	0f b6 00             	movzbl (%eax),%eax
 5d1:	0f be c0             	movsbl %al,%eax
 5d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d8:	8b 45 08             	mov    0x8(%ebp),%eax
 5db:	89 04 24             	mov    %eax,(%esp)
 5de:	e8 31 ff ff ff       	call   514 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5e3:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5e7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5eb:	79 d9                	jns    5c6 <printint+0x8a>
    putc(fd, buf[i]);
}
 5ed:	83 c4 30             	add    $0x30,%esp
 5f0:	5b                   	pop    %ebx
 5f1:	5e                   	pop    %esi
 5f2:	5d                   	pop    %ebp
 5f3:	c3                   	ret    

000005f4 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5f4:	55                   	push   %ebp
 5f5:	89 e5                	mov    %esp,%ebp
 5f7:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5fa:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 601:	8d 45 0c             	lea    0xc(%ebp),%eax
 604:	83 c0 04             	add    $0x4,%eax
 607:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 60a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 611:	e9 7c 01 00 00       	jmp    792 <printf+0x19e>
    c = fmt[i] & 0xff;
 616:	8b 55 0c             	mov    0xc(%ebp),%edx
 619:	8b 45 f0             	mov    -0x10(%ebp),%eax
 61c:	01 d0                	add    %edx,%eax
 61e:	0f b6 00             	movzbl (%eax),%eax
 621:	0f be c0             	movsbl %al,%eax
 624:	25 ff 00 00 00       	and    $0xff,%eax
 629:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 62c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 630:	75 2c                	jne    65e <printf+0x6a>
      if(c == '%'){
 632:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 636:	75 0c                	jne    644 <printf+0x50>
        state = '%';
 638:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 63f:	e9 4a 01 00 00       	jmp    78e <printf+0x19a>
      } else {
        putc(fd, c);
 644:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 647:	0f be c0             	movsbl %al,%eax
 64a:	89 44 24 04          	mov    %eax,0x4(%esp)
 64e:	8b 45 08             	mov    0x8(%ebp),%eax
 651:	89 04 24             	mov    %eax,(%esp)
 654:	e8 bb fe ff ff       	call   514 <putc>
 659:	e9 30 01 00 00       	jmp    78e <printf+0x19a>
      }
    } else if(state == '%'){
 65e:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 662:	0f 85 26 01 00 00    	jne    78e <printf+0x19a>
      if(c == 'd'){
 668:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 66c:	75 2d                	jne    69b <printf+0xa7>
        printint(fd, *ap, 10, 1);
 66e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 671:	8b 00                	mov    (%eax),%eax
 673:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 67a:	00 
 67b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 682:	00 
 683:	89 44 24 04          	mov    %eax,0x4(%esp)
 687:	8b 45 08             	mov    0x8(%ebp),%eax
 68a:	89 04 24             	mov    %eax,(%esp)
 68d:	e8 aa fe ff ff       	call   53c <printint>
        ap++;
 692:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 696:	e9 ec 00 00 00       	jmp    787 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 69b:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 69f:	74 06                	je     6a7 <printf+0xb3>
 6a1:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 6a5:	75 2d                	jne    6d4 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 6a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6aa:	8b 00                	mov    (%eax),%eax
 6ac:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6b3:	00 
 6b4:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6bb:	00 
 6bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c0:	8b 45 08             	mov    0x8(%ebp),%eax
 6c3:	89 04 24             	mov    %eax,(%esp)
 6c6:	e8 71 fe ff ff       	call   53c <printint>
        ap++;
 6cb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6cf:	e9 b3 00 00 00       	jmp    787 <printf+0x193>
      } else if(c == 's'){
 6d4:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6d8:	75 45                	jne    71f <printf+0x12b>
        s = (char*)*ap;
 6da:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6dd:	8b 00                	mov    (%eax),%eax
 6df:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6e2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6ea:	75 09                	jne    6f5 <printf+0x101>
          s = "(null)";
 6ec:	c7 45 f4 e2 0d 00 00 	movl   $0xde2,-0xc(%ebp)
        while(*s != 0){
 6f3:	eb 1e                	jmp    713 <printf+0x11f>
 6f5:	eb 1c                	jmp    713 <printf+0x11f>
          putc(fd, *s);
 6f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fa:	0f b6 00             	movzbl (%eax),%eax
 6fd:	0f be c0             	movsbl %al,%eax
 700:	89 44 24 04          	mov    %eax,0x4(%esp)
 704:	8b 45 08             	mov    0x8(%ebp),%eax
 707:	89 04 24             	mov    %eax,(%esp)
 70a:	e8 05 fe ff ff       	call   514 <putc>
          s++;
 70f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 713:	8b 45 f4             	mov    -0xc(%ebp),%eax
 716:	0f b6 00             	movzbl (%eax),%eax
 719:	84 c0                	test   %al,%al
 71b:	75 da                	jne    6f7 <printf+0x103>
 71d:	eb 68                	jmp    787 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 71f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 723:	75 1d                	jne    742 <printf+0x14e>
        putc(fd, *ap);
 725:	8b 45 e8             	mov    -0x18(%ebp),%eax
 728:	8b 00                	mov    (%eax),%eax
 72a:	0f be c0             	movsbl %al,%eax
 72d:	89 44 24 04          	mov    %eax,0x4(%esp)
 731:	8b 45 08             	mov    0x8(%ebp),%eax
 734:	89 04 24             	mov    %eax,(%esp)
 737:	e8 d8 fd ff ff       	call   514 <putc>
        ap++;
 73c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 740:	eb 45                	jmp    787 <printf+0x193>
      } else if(c == '%'){
 742:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 746:	75 17                	jne    75f <printf+0x16b>
        putc(fd, c);
 748:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 74b:	0f be c0             	movsbl %al,%eax
 74e:	89 44 24 04          	mov    %eax,0x4(%esp)
 752:	8b 45 08             	mov    0x8(%ebp),%eax
 755:	89 04 24             	mov    %eax,(%esp)
 758:	e8 b7 fd ff ff       	call   514 <putc>
 75d:	eb 28                	jmp    787 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 75f:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 766:	00 
 767:	8b 45 08             	mov    0x8(%ebp),%eax
 76a:	89 04 24             	mov    %eax,(%esp)
 76d:	e8 a2 fd ff ff       	call   514 <putc>
        putc(fd, c);
 772:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 775:	0f be c0             	movsbl %al,%eax
 778:	89 44 24 04          	mov    %eax,0x4(%esp)
 77c:	8b 45 08             	mov    0x8(%ebp),%eax
 77f:	89 04 24             	mov    %eax,(%esp)
 782:	e8 8d fd ff ff       	call   514 <putc>
      }
      state = 0;
 787:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 78e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 792:	8b 55 0c             	mov    0xc(%ebp),%edx
 795:	8b 45 f0             	mov    -0x10(%ebp),%eax
 798:	01 d0                	add    %edx,%eax
 79a:	0f b6 00             	movzbl (%eax),%eax
 79d:	84 c0                	test   %al,%al
 79f:	0f 85 71 fe ff ff    	jne    616 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 7a5:	c9                   	leave  
 7a6:	c3                   	ret    

000007a7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 7a7:	55                   	push   %ebp
 7a8:	89 e5                	mov    %esp,%ebp
 7aa:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7ad:	8b 45 08             	mov    0x8(%ebp),%eax
 7b0:	83 e8 08             	sub    $0x8,%eax
 7b3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b6:	a1 28 12 00 00       	mov    0x1228,%eax
 7bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7be:	eb 24                	jmp    7e4 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c3:	8b 00                	mov    (%eax),%eax
 7c5:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c8:	77 12                	ja     7dc <free+0x35>
 7ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d0:	77 24                	ja     7f6 <free+0x4f>
 7d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d5:	8b 00                	mov    (%eax),%eax
 7d7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7da:	77 1a                	ja     7f6 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7df:	8b 00                	mov    (%eax),%eax
 7e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7e4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e7:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ea:	76 d4                	jbe    7c0 <free+0x19>
 7ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ef:	8b 00                	mov    (%eax),%eax
 7f1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7f4:	76 ca                	jbe    7c0 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f9:	8b 40 04             	mov    0x4(%eax),%eax
 7fc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 803:	8b 45 f8             	mov    -0x8(%ebp),%eax
 806:	01 c2                	add    %eax,%edx
 808:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80b:	8b 00                	mov    (%eax),%eax
 80d:	39 c2                	cmp    %eax,%edx
 80f:	75 24                	jne    835 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 811:	8b 45 f8             	mov    -0x8(%ebp),%eax
 814:	8b 50 04             	mov    0x4(%eax),%edx
 817:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81a:	8b 00                	mov    (%eax),%eax
 81c:	8b 40 04             	mov    0x4(%eax),%eax
 81f:	01 c2                	add    %eax,%edx
 821:	8b 45 f8             	mov    -0x8(%ebp),%eax
 824:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 827:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82a:	8b 00                	mov    (%eax),%eax
 82c:	8b 10                	mov    (%eax),%edx
 82e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 831:	89 10                	mov    %edx,(%eax)
 833:	eb 0a                	jmp    83f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 835:	8b 45 fc             	mov    -0x4(%ebp),%eax
 838:	8b 10                	mov    (%eax),%edx
 83a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 83f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 842:	8b 40 04             	mov    0x4(%eax),%eax
 845:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 84c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84f:	01 d0                	add    %edx,%eax
 851:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 854:	75 20                	jne    876 <free+0xcf>
    p->s.size += bp->s.size;
 856:	8b 45 fc             	mov    -0x4(%ebp),%eax
 859:	8b 50 04             	mov    0x4(%eax),%edx
 85c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85f:	8b 40 04             	mov    0x4(%eax),%eax
 862:	01 c2                	add    %eax,%edx
 864:	8b 45 fc             	mov    -0x4(%ebp),%eax
 867:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 86a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 86d:	8b 10                	mov    (%eax),%edx
 86f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 872:	89 10                	mov    %edx,(%eax)
 874:	eb 08                	jmp    87e <free+0xd7>
  } else
    p->s.ptr = bp;
 876:	8b 45 fc             	mov    -0x4(%ebp),%eax
 879:	8b 55 f8             	mov    -0x8(%ebp),%edx
 87c:	89 10                	mov    %edx,(%eax)
  freep = p;
 87e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 881:	a3 28 12 00 00       	mov    %eax,0x1228
}
 886:	c9                   	leave  
 887:	c3                   	ret    

00000888 <morecore>:

static Header*
morecore(uint nu)
{
 888:	55                   	push   %ebp
 889:	89 e5                	mov    %esp,%ebp
 88b:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 88e:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 895:	77 07                	ja     89e <morecore+0x16>
    nu = 4096;
 897:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 89e:	8b 45 08             	mov    0x8(%ebp),%eax
 8a1:	c1 e0 03             	shl    $0x3,%eax
 8a4:	89 04 24             	mov    %eax,(%esp)
 8a7:	e8 28 fc ff ff       	call   4d4 <sbrk>
 8ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8af:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8b3:	75 07                	jne    8bc <morecore+0x34>
    return 0;
 8b5:	b8 00 00 00 00       	mov    $0x0,%eax
 8ba:	eb 22                	jmp    8de <morecore+0x56>
  hp = (Header*)p;
 8bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8bf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c5:	8b 55 08             	mov    0x8(%ebp),%edx
 8c8:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ce:	83 c0 08             	add    $0x8,%eax
 8d1:	89 04 24             	mov    %eax,(%esp)
 8d4:	e8 ce fe ff ff       	call   7a7 <free>
  return freep;
 8d9:	a1 28 12 00 00       	mov    0x1228,%eax
}
 8de:	c9                   	leave  
 8df:	c3                   	ret    

000008e0 <malloc>:

void*
malloc(uint nbytes)
{
 8e0:	55                   	push   %ebp
 8e1:	89 e5                	mov    %esp,%ebp
 8e3:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8e6:	8b 45 08             	mov    0x8(%ebp),%eax
 8e9:	83 c0 07             	add    $0x7,%eax
 8ec:	c1 e8 03             	shr    $0x3,%eax
 8ef:	83 c0 01             	add    $0x1,%eax
 8f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8f5:	a1 28 12 00 00       	mov    0x1228,%eax
 8fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8fd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 901:	75 23                	jne    926 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 903:	c7 45 f0 20 12 00 00 	movl   $0x1220,-0x10(%ebp)
 90a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90d:	a3 28 12 00 00       	mov    %eax,0x1228
 912:	a1 28 12 00 00       	mov    0x1228,%eax
 917:	a3 20 12 00 00       	mov    %eax,0x1220
    base.s.size = 0;
 91c:	c7 05 24 12 00 00 00 	movl   $0x0,0x1224
 923:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 926:	8b 45 f0             	mov    -0x10(%ebp),%eax
 929:	8b 00                	mov    (%eax),%eax
 92b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 92e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 931:	8b 40 04             	mov    0x4(%eax),%eax
 934:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 937:	72 4d                	jb     986 <malloc+0xa6>
      if(p->s.size == nunits)
 939:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93c:	8b 40 04             	mov    0x4(%eax),%eax
 93f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 942:	75 0c                	jne    950 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 944:	8b 45 f4             	mov    -0xc(%ebp),%eax
 947:	8b 10                	mov    (%eax),%edx
 949:	8b 45 f0             	mov    -0x10(%ebp),%eax
 94c:	89 10                	mov    %edx,(%eax)
 94e:	eb 26                	jmp    976 <malloc+0x96>
      else {
        p->s.size -= nunits;
 950:	8b 45 f4             	mov    -0xc(%ebp),%eax
 953:	8b 40 04             	mov    0x4(%eax),%eax
 956:	2b 45 ec             	sub    -0x14(%ebp),%eax
 959:	89 c2                	mov    %eax,%edx
 95b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95e:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 961:	8b 45 f4             	mov    -0xc(%ebp),%eax
 964:	8b 40 04             	mov    0x4(%eax),%eax
 967:	c1 e0 03             	shl    $0x3,%eax
 96a:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 96d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 970:	8b 55 ec             	mov    -0x14(%ebp),%edx
 973:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 976:	8b 45 f0             	mov    -0x10(%ebp),%eax
 979:	a3 28 12 00 00       	mov    %eax,0x1228
      return (void*)(p + 1);
 97e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 981:	83 c0 08             	add    $0x8,%eax
 984:	eb 38                	jmp    9be <malloc+0xde>
    }
    if(p == freep)
 986:	a1 28 12 00 00       	mov    0x1228,%eax
 98b:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 98e:	75 1b                	jne    9ab <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 990:	8b 45 ec             	mov    -0x14(%ebp),%eax
 993:	89 04 24             	mov    %eax,(%esp)
 996:	e8 ed fe ff ff       	call   888 <morecore>
 99b:	89 45 f4             	mov    %eax,-0xc(%ebp)
 99e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 9a2:	75 07                	jne    9ab <malloc+0xcb>
        return 0;
 9a4:	b8 00 00 00 00       	mov    $0x0,%eax
 9a9:	eb 13                	jmp    9be <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ae:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b4:	8b 00                	mov    (%eax),%eax
 9b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9b9:	e9 70 ff ff ff       	jmp    92e <malloc+0x4e>
}
 9be:	c9                   	leave  
 9bf:	c3                   	ret    

000009c0 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 9c6:	8b 55 08             	mov    0x8(%ebp),%edx
 9c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 9cc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 9cf:	f0 87 02             	lock xchg %eax,(%edx)
 9d2:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 9d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 9d8:	c9                   	leave  
 9d9:	c3                   	ret    

000009da <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 9da:	55                   	push   %ebp
 9db:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 9dd:	8b 45 08             	mov    0x8(%ebp),%eax
 9e0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 9e6:	5d                   	pop    %ebp
 9e7:	c3                   	ret    

000009e8 <lock_acquire>:
void lock_acquire(lock_t *lock){
 9e8:	55                   	push   %ebp
 9e9:	89 e5                	mov    %esp,%ebp
 9eb:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 9ee:	90                   	nop
 9ef:	8b 45 08             	mov    0x8(%ebp),%eax
 9f2:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 9f9:	00 
 9fa:	89 04 24             	mov    %eax,(%esp)
 9fd:	e8 be ff ff ff       	call   9c0 <xchg>
 a02:	85 c0                	test   %eax,%eax
 a04:	75 e9                	jne    9ef <lock_acquire+0x7>
}
 a06:	c9                   	leave  
 a07:	c3                   	ret    

00000a08 <lock_release>:
void lock_release(lock_t *lock){
 a08:	55                   	push   %ebp
 a09:	89 e5                	mov    %esp,%ebp
 a0b:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 a0e:	8b 45 08             	mov    0x8(%ebp),%eax
 a11:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 a18:	00 
 a19:	89 04 24             	mov    %eax,(%esp)
 a1c:	e8 9f ff ff ff       	call   9c0 <xchg>
}
 a21:	c9                   	leave  
 a22:	c3                   	ret    

00000a23 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 a23:	55                   	push   %ebp
 a24:	89 e5                	mov    %esp,%ebp
 a26:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 a29:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 a30:	e8 ab fe ff ff       	call   8e0 <malloc>
 a35:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 a38:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 a3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a41:	25 ff 0f 00 00       	and    $0xfff,%eax
 a46:	85 c0                	test   %eax,%eax
 a48:	74 14                	je     a5e <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 a4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4d:	25 ff 0f 00 00       	and    $0xfff,%eax
 a52:	89 c2                	mov    %eax,%edx
 a54:	b8 00 10 00 00       	mov    $0x1000,%eax
 a59:	29 d0                	sub    %edx,%eax
 a5b:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 a5e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a62:	75 1b                	jne    a7f <thread_create+0x5c>

        printf(1,"malloc fail \n");
 a64:	c7 44 24 04 e9 0d 00 	movl   $0xde9,0x4(%esp)
 a6b:	00 
 a6c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a73:	e8 7c fb ff ff       	call   5f4 <printf>
        return 0;
 a78:	b8 00 00 00 00       	mov    $0x0,%eax
 a7d:	eb 6f                	jmp    aee <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 a7f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 a82:	8b 55 08             	mov    0x8(%ebp),%edx
 a85:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a88:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 a8c:	89 54 24 08          	mov    %edx,0x8(%esp)
 a90:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 a97:	00 
 a98:	89 04 24             	mov    %eax,(%esp)
 a9b:	e8 4c fa ff ff       	call   4ec <clone>
 aa0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 aa3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 aa7:	79 1b                	jns    ac4 <thread_create+0xa1>
        printf(1,"clone fails\n");
 aa9:	c7 44 24 04 f7 0d 00 	movl   $0xdf7,0x4(%esp)
 ab0:	00 
 ab1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ab8:	e8 37 fb ff ff       	call   5f4 <printf>
        return 0;
 abd:	b8 00 00 00 00       	mov    $0x0,%eax
 ac2:	eb 2a                	jmp    aee <thread_create+0xcb>
    }
    if(tid > 0){
 ac4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 ac8:	7e 05                	jle    acf <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 aca:	8b 45 f0             	mov    -0x10(%ebp),%eax
 acd:	eb 1f                	jmp    aee <thread_create+0xcb>
    }
    if(tid == 0){
 acf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 ad3:	75 14                	jne    ae9 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 ad5:	c7 44 24 04 04 0e 00 	movl   $0xe04,0x4(%esp)
 adc:	00 
 add:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ae4:	e8 0b fb ff ff       	call   5f4 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 ae9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 aee:	c9                   	leave  
 aef:	c3                   	ret    

00000af0 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 af0:	55                   	push   %ebp
 af1:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 af3:	8b 45 08             	mov    0x8(%ebp),%eax
 af6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 afc:	8b 45 08             	mov    0x8(%ebp),%eax
 aff:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 b06:	8b 45 08             	mov    0x8(%ebp),%eax
 b09:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 b10:	5d                   	pop    %ebp
 b11:	c3                   	ret    

00000b12 <add_q>:

void add_q(struct queue *q, int v){
 b12:	55                   	push   %ebp
 b13:	89 e5                	mov    %esp,%ebp
 b15:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 b18:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 b1f:	e8 bc fd ff ff       	call   8e0 <malloc>
 b24:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 b27:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b2a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 b31:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b34:	8b 55 0c             	mov    0xc(%ebp),%edx
 b37:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 b39:	8b 45 08             	mov    0x8(%ebp),%eax
 b3c:	8b 40 04             	mov    0x4(%eax),%eax
 b3f:	85 c0                	test   %eax,%eax
 b41:	75 0b                	jne    b4e <add_q+0x3c>
        q->head = n;
 b43:	8b 45 08             	mov    0x8(%ebp),%eax
 b46:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b49:	89 50 04             	mov    %edx,0x4(%eax)
 b4c:	eb 0c                	jmp    b5a <add_q+0x48>
    }else{
        q->tail->next = n;
 b4e:	8b 45 08             	mov    0x8(%ebp),%eax
 b51:	8b 40 08             	mov    0x8(%eax),%eax
 b54:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b57:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 b5a:	8b 45 08             	mov    0x8(%ebp),%eax
 b5d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b60:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 b63:	8b 45 08             	mov    0x8(%ebp),%eax
 b66:	8b 00                	mov    (%eax),%eax
 b68:	8d 50 01             	lea    0x1(%eax),%edx
 b6b:	8b 45 08             	mov    0x8(%ebp),%eax
 b6e:	89 10                	mov    %edx,(%eax)
}
 b70:	c9                   	leave  
 b71:	c3                   	ret    

00000b72 <empty_q>:

int empty_q(struct queue *q){
 b72:	55                   	push   %ebp
 b73:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 b75:	8b 45 08             	mov    0x8(%ebp),%eax
 b78:	8b 00                	mov    (%eax),%eax
 b7a:	85 c0                	test   %eax,%eax
 b7c:	75 07                	jne    b85 <empty_q+0x13>
        return 1;
 b7e:	b8 01 00 00 00       	mov    $0x1,%eax
 b83:	eb 05                	jmp    b8a <empty_q+0x18>
    else
        return 0;
 b85:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 b8a:	5d                   	pop    %ebp
 b8b:	c3                   	ret    

00000b8c <pop_q>:
int pop_q(struct queue *q){
 b8c:	55                   	push   %ebp
 b8d:	89 e5                	mov    %esp,%ebp
 b8f:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 b92:	8b 45 08             	mov    0x8(%ebp),%eax
 b95:	89 04 24             	mov    %eax,(%esp)
 b98:	e8 d5 ff ff ff       	call   b72 <empty_q>
 b9d:	85 c0                	test   %eax,%eax
 b9f:	75 5d                	jne    bfe <pop_q+0x72>
       val = q->head->value; 
 ba1:	8b 45 08             	mov    0x8(%ebp),%eax
 ba4:	8b 40 04             	mov    0x4(%eax),%eax
 ba7:	8b 00                	mov    (%eax),%eax
 ba9:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 bac:	8b 45 08             	mov    0x8(%ebp),%eax
 baf:	8b 40 04             	mov    0x4(%eax),%eax
 bb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 bb5:	8b 45 08             	mov    0x8(%ebp),%eax
 bb8:	8b 40 04             	mov    0x4(%eax),%eax
 bbb:	8b 50 04             	mov    0x4(%eax),%edx
 bbe:	8b 45 08             	mov    0x8(%ebp),%eax
 bc1:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 bc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bc7:	89 04 24             	mov    %eax,(%esp)
 bca:	e8 d8 fb ff ff       	call   7a7 <free>
       q->size--;
 bcf:	8b 45 08             	mov    0x8(%ebp),%eax
 bd2:	8b 00                	mov    (%eax),%eax
 bd4:	8d 50 ff             	lea    -0x1(%eax),%edx
 bd7:	8b 45 08             	mov    0x8(%ebp),%eax
 bda:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 bdc:	8b 45 08             	mov    0x8(%ebp),%eax
 bdf:	8b 00                	mov    (%eax),%eax
 be1:	85 c0                	test   %eax,%eax
 be3:	75 14                	jne    bf9 <pop_q+0x6d>
            q->head = 0;
 be5:	8b 45 08             	mov    0x8(%ebp),%eax
 be8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 bef:	8b 45 08             	mov    0x8(%ebp),%eax
 bf2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 bf9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bfc:	eb 05                	jmp    c03 <pop_q+0x77>
    }
    return -1;
 bfe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 c03:	c9                   	leave  
 c04:	c3                   	ret    

00000c05 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 c05:	55                   	push   %ebp
 c06:	89 e5                	mov    %esp,%ebp
 c08:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 c0b:	8b 45 08             	mov    0x8(%ebp),%eax
 c0e:	8b 55 0c             	mov    0xc(%ebp),%edx
 c11:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 c14:	8b 45 08             	mov    0x8(%ebp),%eax
 c17:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 c1e:	8b 45 08             	mov    0x8(%ebp),%eax
 c21:	89 04 24             	mov    %eax,(%esp)
 c24:	e8 b1 fd ff ff       	call   9da <lock_init>
}
 c29:	c9                   	leave  
 c2a:	c3                   	ret    

00000c2b <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 c2b:	55                   	push   %ebp
 c2c:	89 e5                	mov    %esp,%ebp
 c2e:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 c31:	8b 45 08             	mov    0x8(%ebp),%eax
 c34:	89 04 24             	mov    %eax,(%esp)
 c37:	e8 ac fd ff ff       	call   9e8 <lock_acquire>
	if(s->count  == 0){
 c3c:	8b 45 08             	mov    0x8(%ebp),%eax
 c3f:	8b 40 04             	mov    0x4(%eax),%eax
 c42:	85 c0                	test   %eax,%eax
 c44:	75 43                	jne    c89 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 c46:	c7 44 24 04 15 0e 00 	movl   $0xe15,0x4(%esp)
 c4d:	00 
 c4e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c55:	e8 9a f9 ff ff       	call   5f4 <printf>
		//add proc to waiters list
		int tid = getpid();
 c5a:	e8 6d f8 ff ff       	call   4cc <getpid>
 c5f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 c62:	8b 45 08             	mov    0x8(%ebp),%eax
 c65:	8d 50 0c             	lea    0xc(%eax),%edx
 c68:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c6b:	89 44 24 04          	mov    %eax,0x4(%esp)
 c6f:	89 14 24             	mov    %edx,(%esp)
 c72:	e8 9b fe ff ff       	call   b12 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 c77:	8b 45 08             	mov    0x8(%ebp),%eax
 c7a:	89 04 24             	mov    %eax,(%esp)
 c7d:	e8 86 fd ff ff       	call   a08 <lock_release>
		tsleep(); 
 c82:	e8 75 f8 ff ff       	call   4fc <tsleep>
 c87:	eb 2e                	jmp    cb7 <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 c89:	c7 44 24 04 1c 0e 00 	movl   $0xe1c,0x4(%esp)
 c90:	00 
 c91:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c98:	e8 57 f9 ff ff       	call   5f4 <printf>
		s->count--;	
 c9d:	8b 45 08             	mov    0x8(%ebp),%eax
 ca0:	8b 40 04             	mov    0x4(%eax),%eax
 ca3:	8d 50 ff             	lea    -0x1(%eax),%edx
 ca6:	8b 45 08             	mov    0x8(%ebp),%eax
 ca9:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 cac:	8b 45 08             	mov    0x8(%ebp),%eax
 caf:	89 04 24             	mov    %eax,(%esp)
 cb2:	e8 51 fd ff ff       	call   a08 <lock_release>
	}
}
 cb7:	c9                   	leave  
 cb8:	c3                   	ret    

00000cb9 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 cb9:	55                   	push   %ebp
 cba:	89 e5                	mov    %esp,%ebp
 cbc:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 cbf:	c7 44 24 04 23 0e 00 	movl   $0xe23,0x4(%esp)
 cc6:	00 
 cc7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 cce:	e8 21 f9 ff ff       	call   5f4 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 cd3:	8b 45 08             	mov    0x8(%ebp),%eax
 cd6:	89 04 24             	mov    %eax,(%esp)
 cd9:	e8 0a fd ff ff       	call   9e8 <lock_acquire>
	if(s->count < s->size){
 cde:	8b 45 08             	mov    0x8(%ebp),%eax
 ce1:	8b 50 04             	mov    0x4(%eax),%edx
 ce4:	8b 45 08             	mov    0x8(%ebp),%eax
 ce7:	8b 40 08             	mov    0x8(%eax),%eax
 cea:	39 c2                	cmp    %eax,%edx
 cec:	7d 0f                	jge    cfd <sem_signal+0x44>
		s->count++;	
 cee:	8b 45 08             	mov    0x8(%ebp),%eax
 cf1:	8b 40 04             	mov    0x4(%eax),%eax
 cf4:	8d 50 01             	lea    0x1(%eax),%edx
 cf7:	8b 45 08             	mov    0x8(%ebp),%eax
 cfa:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 cfd:	8b 45 08             	mov    0x8(%ebp),%eax
 d00:	83 c0 0c             	add    $0xc,%eax
 d03:	89 04 24             	mov    %eax,(%esp)
 d06:	e8 81 fe ff ff       	call   b8c <pop_q>
 d0b:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 d0e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 d12:	74 2e                	je     d42 <sem_signal+0x89>
		printf(1, "Sem A\n");
 d14:	c7 44 24 04 1c 0e 00 	movl   $0xe1c,0x4(%esp)
 d1b:	00 
 d1c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d23:	e8 cc f8 ff ff       	call   5f4 <printf>
		twakeup(tid);
 d28:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d2b:	89 04 24             	mov    %eax,(%esp)
 d2e:	e8 d1 f7 ff ff       	call   504 <twakeup>
		s->count--;
 d33:	8b 45 08             	mov    0x8(%ebp),%eax
 d36:	8b 40 04             	mov    0x4(%eax),%eax
 d39:	8d 50 ff             	lea    -0x1(%eax),%edx
 d3c:	8b 45 08             	mov    0x8(%ebp),%eax
 d3f:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 d42:	8b 45 08             	mov    0x8(%ebp),%eax
 d45:	89 04 24             	mov    %eax,(%esp)
 d48:	e8 bb fc ff ff       	call   a08 <lock_release>

 d4d:	c9                   	leave  
 d4e:	c3                   	ret    
