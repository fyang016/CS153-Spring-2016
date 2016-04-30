
_wait_more:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

int main(int argc, char ** argv){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 40             	sub    $0x40,%esp
    
    int begin = getpid();
   9:	e8 42 05 00 00       	call   550 <getpid>
   e:	89 44 24 20          	mov    %eax,0x20(%esp)
    int pid = fork();
  12:	e8 a9 04 00 00       	call   4c0 <fork>
  17:	89 44 24 24          	mov    %eax,0x24(%esp)
    int i;
    int status;
    if(pid > 0){
  1b:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
  20:	0f 8e c5 01 00 00    	jle    1eb <main+0x1eb>
        for(i = 0; i < 15 && pid > 0; i++){
  26:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  2d:	00 
  2e:	eb 29                	jmp    59 <main+0x59>
            pid = fork();
  30:	e8 8b 04 00 00       	call   4c0 <fork>
  35:	89 44 24 24          	mov    %eax,0x24(%esp)
            if(pid < 0)
  39:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
  3e:	79 14                	jns    54 <main+0x54>
                printf(1,"errors occur!\n");
  40:	c7 44 24 04 1f 0a 00 	movl   $0xa1f,0x4(%esp)
  47:	00 
  48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4f:	e8 05 06 00 00       	call   659 <printf>
    int begin = getpid();
    int pid = fork();
    int i;
    int status;
    if(pid > 0){
        for(i = 0; i < 15 && pid > 0; i++){
  54:	83 44 24 28 01       	addl   $0x1,0x28(%esp)
  59:	83 7c 24 28 0e       	cmpl   $0xe,0x28(%esp)
  5e:	7f 07                	jg     67 <main+0x67>
  60:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
  65:	7f c9                	jg     30 <main+0x30>
            pid = fork();
            if(pid < 0)
                printf(1,"errors occur!\n");
        }
        if (pid == 0){
  67:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
  6c:	0f 85 a8 01 00 00    	jne    21a <main+0x21a>
            int j = 0;
  72:	c7 44 24 30 00 00 00 	movl   $0x0,0x30(%esp)
  79:	00 
            while(j++ < 1000);
  7a:	81 7c 24 30 e7 03 00 	cmpl   $0x3e7,0x30(%esp)
  81:	00 
  82:	0f 9e c0             	setle  %al
  85:	83 44 24 30 01       	addl   $0x1,0x30(%esp)
  8a:	84 c0                	test   %al,%al
  8c:	75 ec                	jne    7a <main+0x7a>
            if(getpid() == begin+5) sleep(300);
  8e:	e8 bd 04 00 00       	call   550 <getpid>
  93:	8b 54 24 20          	mov    0x20(%esp),%edx
  97:	83 c2 05             	add    $0x5,%edx
  9a:	39 d0                	cmp    %edx,%eax
  9c:	75 0c                	jne    aa <main+0xaa>
  9e:	c7 04 24 2c 01 00 00 	movl   $0x12c,(%esp)
  a5:	e8 b6 04 00 00       	call   560 <sleep>
            
            printf(1,"pid = %d\n",getpid());
  aa:	e8 a1 04 00 00       	call   550 <getpid>
  af:	89 44 24 08          	mov    %eax,0x8(%esp)
  b3:	c7 44 24 04 2e 0a 00 	movl   $0xa2e,0x4(%esp)
  ba:	00 
  bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c2:	e8 92 05 00 00       	call   659 <printf>
            if(getpid() == begin+10){
  c7:	e8 84 04 00 00       	call   550 <getpid>
  cc:	8b 54 24 20          	mov    0x20(%esp),%edx
  d0:	83 c2 0a             	add    $0xa,%edx
  d3:	39 d0                	cmp    %edx,%eax
  d5:	75 69                	jne    140 <main+0x140>
                printf(1,"pid %d waiting for %d\n",begin+10,begin+5);
  d7:	8b 44 24 20          	mov    0x20(%esp),%eax
  db:	8d 50 05             	lea    0x5(%eax),%edx
  de:	8b 44 24 20          	mov    0x20(%esp),%eax
  e2:	83 c0 0a             	add    $0xa,%eax
  e5:	89 54 24 0c          	mov    %edx,0xc(%esp)
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 38 0a 00 	movl   $0xa38,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 58 05 00 00       	call   659 <printf>
                int wpid = waitpid(begin+5,&status,0);
 101:	8b 44 24 20          	mov    0x20(%esp),%eax
 105:	8d 50 05             	lea    0x5(%eax),%edx
 108:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 10f:	00 
 110:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 114:	89 44 24 04          	mov    %eax,0x4(%esp)
 118:	89 14 24             	mov    %edx,(%esp)
 11b:	e8 b8 03 00 00       	call   4d8 <waitpid>
 120:	89 44 24 34          	mov    %eax,0x34(%esp)
                printf(1,"success clean %d\n",wpid);
 124:	8b 44 24 34          	mov    0x34(%esp),%eax
 128:	89 44 24 08          	mov    %eax,0x8(%esp)
 12c:	c7 44 24 04 4f 0a 00 	movl   $0xa4f,0x4(%esp)
 133:	00 
 134:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 13b:	e8 19 05 00 00       	call   659 <printf>
            }
            if(getpid() == begin+12){
 140:	e8 0b 04 00 00       	call   550 <getpid>
 145:	8b 54 24 20          	mov    0x20(%esp),%edx
 149:	83 c2 0c             	add    $0xc,%edx
 14c:	39 d0                	cmp    %edx,%eax
 14e:	75 73                	jne    1c3 <main+0x1c3>
                printf(1,"pid %d waiting for %d\n",begin+12,begin+5);
 150:	8b 44 24 20          	mov    0x20(%esp),%eax
 154:	8d 50 05             	lea    0x5(%eax),%edx
 157:	8b 44 24 20          	mov    0x20(%esp),%eax
 15b:	83 c0 0c             	add    $0xc,%eax
 15e:	89 54 24 0c          	mov    %edx,0xc(%esp)
 162:	89 44 24 08          	mov    %eax,0x8(%esp)
 166:	c7 44 24 04 38 0a 00 	movl   $0xa38,0x4(%esp)
 16d:	00 
 16e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 175:	e8 df 04 00 00       	call   659 <printf>
                int wpid = waitpid(begin+5,&status,0);
 17a:	8b 44 24 20          	mov    0x20(%esp),%eax
 17e:	8d 50 05             	lea    0x5(%eax),%edx
 181:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 188:	00 
 189:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 18d:	89 44 24 04          	mov    %eax,0x4(%esp)
 191:	89 14 24             	mov    %edx,(%esp)
 194:	e8 3f 03 00 00       	call   4d8 <waitpid>
 199:	89 44 24 38          	mov    %eax,0x38(%esp)
                if(wpid == -1)
 19d:	83 7c 24 38 ff       	cmpl   $0xffffffff,0x38(%esp)
 1a2:	75 1f                	jne    1c3 <main+0x1c3>
                    printf(1,"no more waiting for %d\n",begin+5);
 1a4:	8b 44 24 20          	mov    0x20(%esp),%eax
 1a8:	83 c0 05             	add    $0x5,%eax
 1ab:	89 44 24 08          	mov    %eax,0x8(%esp)
 1af:	c7 44 24 04 61 0a 00 	movl   $0xa61,0x4(%esp)
 1b6:	00 
 1b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1be:	e8 96 04 00 00       	call   659 <printf>
            }
            if(getpid() == begin+5)
 1c3:	e8 88 03 00 00       	call   550 <getpid>
 1c8:	8b 54 24 20          	mov    0x20(%esp),%edx
 1cc:	83 c2 05             	add    $0x5,%edx
 1cf:	39 d0                	cmp    %edx,%eax
 1d1:	75 0c                	jne    1df <main+0x1df>
                exit(5);
 1d3:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 1da:	e8 e9 02 00 00       	call   4c8 <exit>
            exit(0);
 1df:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e6:	e8 dd 02 00 00       	call   4c8 <exit>
        }
    }else if(pid == 0){
 1eb:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
 1f0:	75 28                	jne    21a <main+0x21a>
        int j = 0;
 1f2:	c7 44 24 3c 00 00 00 	movl   $0x0,0x3c(%esp)
 1f9:	00 
        while(j++ < 1000);
 1fa:	81 7c 24 3c e7 03 00 	cmpl   $0x3e7,0x3c(%esp)
 201:	00 
 202:	0f 9e c0             	setle  %al
 205:	83 44 24 3c 01       	addl   $0x1,0x3c(%esp)
 20a:	84 c0                	test   %al,%al
 20c:	75 ec                	jne    1fa <main+0x1fa>
        exit(0);
 20e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 215:	e8 ae 02 00 00       	call   4c8 <exit>
    }
    int going = 1;
 21a:	c7 44 24 2c 01 00 00 	movl   $0x1,0x2c(%esp)
 221:	00 
    while(going >= 0){
 222:	eb 2c                	jmp    250 <main+0x250>
        going = wait(&status);
 224:	8d 44 24 1c          	lea    0x1c(%esp),%eax
 228:	89 04 24             	mov    %eax,(%esp)
 22b:	e8 a0 02 00 00       	call   4d0 <wait>
 230:	89 44 24 2c          	mov    %eax,0x2c(%esp)
        printf(1,"kill %d process\n",going);
 234:	8b 44 24 2c          	mov    0x2c(%esp),%eax
 238:	89 44 24 08          	mov    %eax,0x8(%esp)
 23c:	c7 44 24 04 79 0a 00 	movl   $0xa79,0x4(%esp)
 243:	00 
 244:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 24b:	e8 09 04 00 00       	call   659 <printf>
        int j = 0;
        while(j++ < 1000);
        exit(0);
    }
    int going = 1;
    while(going >= 0){
 250:	83 7c 24 2c 00       	cmpl   $0x0,0x2c(%esp)
 255:	79 cd                	jns    224 <main+0x224>
        going = wait(&status);
        printf(1,"kill %d process\n",going);
    };
    exit(0);
 257:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 25e:	e8 65 02 00 00       	call   4c8 <exit>
 263:	90                   	nop

00000264 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	57                   	push   %edi
 268:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 269:	8b 4d 08             	mov    0x8(%ebp),%ecx
 26c:	8b 55 10             	mov    0x10(%ebp),%edx
 26f:	8b 45 0c             	mov    0xc(%ebp),%eax
 272:	89 cb                	mov    %ecx,%ebx
 274:	89 df                	mov    %ebx,%edi
 276:	89 d1                	mov    %edx,%ecx
 278:	fc                   	cld    
 279:	f3 aa                	rep stos %al,%es:(%edi)
 27b:	89 ca                	mov    %ecx,%edx
 27d:	89 fb                	mov    %edi,%ebx
 27f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 282:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 285:	5b                   	pop    %ebx
 286:	5f                   	pop    %edi
 287:	5d                   	pop    %ebp
 288:	c3                   	ret    

00000289 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 289:	55                   	push   %ebp
 28a:	89 e5                	mov    %esp,%ebp
 28c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 28f:	8b 45 08             	mov    0x8(%ebp),%eax
 292:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 295:	8b 45 0c             	mov    0xc(%ebp),%eax
 298:	0f b6 10             	movzbl (%eax),%edx
 29b:	8b 45 08             	mov    0x8(%ebp),%eax
 29e:	88 10                	mov    %dl,(%eax)
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	0f b6 00             	movzbl (%eax),%eax
 2a6:	84 c0                	test   %al,%al
 2a8:	0f 95 c0             	setne  %al
 2ab:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2af:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 2b3:	84 c0                	test   %al,%al
 2b5:	75 de                	jne    295 <strcpy+0xc>
    ;
  return os;
 2b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2ba:	c9                   	leave  
 2bb:	c3                   	ret    

000002bc <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 2bf:	eb 08                	jmp    2c9 <strcmp+0xd>
    p++, q++;
 2c1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2c5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2c9:	8b 45 08             	mov    0x8(%ebp),%eax
 2cc:	0f b6 00             	movzbl (%eax),%eax
 2cf:	84 c0                	test   %al,%al
 2d1:	74 10                	je     2e3 <strcmp+0x27>
 2d3:	8b 45 08             	mov    0x8(%ebp),%eax
 2d6:	0f b6 10             	movzbl (%eax),%edx
 2d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dc:	0f b6 00             	movzbl (%eax),%eax
 2df:	38 c2                	cmp    %al,%dl
 2e1:	74 de                	je     2c1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 2e3:	8b 45 08             	mov    0x8(%ebp),%eax
 2e6:	0f b6 00             	movzbl (%eax),%eax
 2e9:	0f b6 d0             	movzbl %al,%edx
 2ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ef:	0f b6 00             	movzbl (%eax),%eax
 2f2:	0f b6 c0             	movzbl %al,%eax
 2f5:	89 d1                	mov    %edx,%ecx
 2f7:	29 c1                	sub    %eax,%ecx
 2f9:	89 c8                	mov    %ecx,%eax
}
 2fb:	5d                   	pop    %ebp
 2fc:	c3                   	ret    

000002fd <strlen>:

uint
strlen(char *s)
{
 2fd:	55                   	push   %ebp
 2fe:	89 e5                	mov    %esp,%ebp
 300:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 303:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 30a:	eb 04                	jmp    310 <strlen+0x13>
 30c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 310:	8b 45 fc             	mov    -0x4(%ebp),%eax
 313:	03 45 08             	add    0x8(%ebp),%eax
 316:	0f b6 00             	movzbl (%eax),%eax
 319:	84 c0                	test   %al,%al
 31b:	75 ef                	jne    30c <strlen+0xf>
    ;
  return n;
 31d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 320:	c9                   	leave  
 321:	c3                   	ret    

00000322 <memset>:

void*
memset(void *dst, int c, uint n)
{
 322:	55                   	push   %ebp
 323:	89 e5                	mov    %esp,%ebp
 325:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 328:	8b 45 10             	mov    0x10(%ebp),%eax
 32b:	89 44 24 08          	mov    %eax,0x8(%esp)
 32f:	8b 45 0c             	mov    0xc(%ebp),%eax
 332:	89 44 24 04          	mov    %eax,0x4(%esp)
 336:	8b 45 08             	mov    0x8(%ebp),%eax
 339:	89 04 24             	mov    %eax,(%esp)
 33c:	e8 23 ff ff ff       	call   264 <stosb>
  return dst;
 341:	8b 45 08             	mov    0x8(%ebp),%eax
}
 344:	c9                   	leave  
 345:	c3                   	ret    

00000346 <strchr>:

char*
strchr(const char *s, char c)
{
 346:	55                   	push   %ebp
 347:	89 e5                	mov    %esp,%ebp
 349:	83 ec 04             	sub    $0x4,%esp
 34c:	8b 45 0c             	mov    0xc(%ebp),%eax
 34f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 352:	eb 14                	jmp    368 <strchr+0x22>
    if(*s == c)
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	0f b6 00             	movzbl (%eax),%eax
 35a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 35d:	75 05                	jne    364 <strchr+0x1e>
      return (char*)s;
 35f:	8b 45 08             	mov    0x8(%ebp),%eax
 362:	eb 13                	jmp    377 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 364:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 368:	8b 45 08             	mov    0x8(%ebp),%eax
 36b:	0f b6 00             	movzbl (%eax),%eax
 36e:	84 c0                	test   %al,%al
 370:	75 e2                	jne    354 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 372:	b8 00 00 00 00       	mov    $0x0,%eax
}
 377:	c9                   	leave  
 378:	c3                   	ret    

00000379 <gets>:

char*
gets(char *buf, int max)
{
 379:	55                   	push   %ebp
 37a:	89 e5                	mov    %esp,%ebp
 37c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 37f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 386:	eb 44                	jmp    3cc <gets+0x53>
    cc = read(0, &c, 1);
 388:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 38f:	00 
 390:	8d 45 ef             	lea    -0x11(%ebp),%eax
 393:	89 44 24 04          	mov    %eax,0x4(%esp)
 397:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 39e:	e8 45 01 00 00       	call   4e8 <read>
 3a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 3a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3aa:	7e 2d                	jle    3d9 <gets+0x60>
      break;
    buf[i++] = c;
 3ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 3af:	03 45 08             	add    0x8(%ebp),%eax
 3b2:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 3b6:	88 10                	mov    %dl,(%eax)
 3b8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 3bc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3c0:	3c 0a                	cmp    $0xa,%al
 3c2:	74 16                	je     3da <gets+0x61>
 3c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3c8:	3c 0d                	cmp    $0xd,%al
 3ca:	74 0e                	je     3da <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 3cf:	83 c0 01             	add    $0x1,%eax
 3d2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 3d5:	7c b1                	jl     388 <gets+0xf>
 3d7:	eb 01                	jmp    3da <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 3d9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 3da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 3dd:	03 45 08             	add    0x8(%ebp),%eax
 3e0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3e6:	c9                   	leave  
 3e7:	c3                   	ret    

000003e8 <stat>:

int
stat(char *n, struct stat *st)
{
 3e8:	55                   	push   %ebp
 3e9:	89 e5                	mov    %esp,%ebp
 3eb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 3ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 3f5:	00 
 3f6:	8b 45 08             	mov    0x8(%ebp),%eax
 3f9:	89 04 24             	mov    %eax,(%esp)
 3fc:	e8 0f 01 00 00       	call   510 <open>
 401:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 404:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 408:	79 07                	jns    411 <stat+0x29>
    return -1;
 40a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 40f:	eb 23                	jmp    434 <stat+0x4c>
  r = fstat(fd, st);
 411:	8b 45 0c             	mov    0xc(%ebp),%eax
 414:	89 44 24 04          	mov    %eax,0x4(%esp)
 418:	8b 45 f0             	mov    -0x10(%ebp),%eax
 41b:	89 04 24             	mov    %eax,(%esp)
 41e:	e8 05 01 00 00       	call   528 <fstat>
 423:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 426:	8b 45 f0             	mov    -0x10(%ebp),%eax
 429:	89 04 24             	mov    %eax,(%esp)
 42c:	e8 c7 00 00 00       	call   4f8 <close>
  return r;
 431:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 434:	c9                   	leave  
 435:	c3                   	ret    

00000436 <atoi>:

int
atoi(const char *s)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 43c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 443:	eb 24                	jmp    469 <atoi+0x33>
    n = n*10 + *s++ - '0';
 445:	8b 55 fc             	mov    -0x4(%ebp),%edx
 448:	89 d0                	mov    %edx,%eax
 44a:	c1 e0 02             	shl    $0x2,%eax
 44d:	01 d0                	add    %edx,%eax
 44f:	01 c0                	add    %eax,%eax
 451:	89 c2                	mov    %eax,%edx
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	0f b6 00             	movzbl (%eax),%eax
 459:	0f be c0             	movsbl %al,%eax
 45c:	8d 04 02             	lea    (%edx,%eax,1),%eax
 45f:	83 e8 30             	sub    $0x30,%eax
 462:	89 45 fc             	mov    %eax,-0x4(%ebp)
 465:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 469:	8b 45 08             	mov    0x8(%ebp),%eax
 46c:	0f b6 00             	movzbl (%eax),%eax
 46f:	3c 2f                	cmp    $0x2f,%al
 471:	7e 0a                	jle    47d <atoi+0x47>
 473:	8b 45 08             	mov    0x8(%ebp),%eax
 476:	0f b6 00             	movzbl (%eax),%eax
 479:	3c 39                	cmp    $0x39,%al
 47b:	7e c8                	jle    445 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 47d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 480:	c9                   	leave  
 481:	c3                   	ret    

00000482 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 482:	55                   	push   %ebp
 483:	89 e5                	mov    %esp,%ebp
 485:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 48e:	8b 45 0c             	mov    0xc(%ebp),%eax
 491:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 494:	eb 13                	jmp    4a9 <memmove+0x27>
    *dst++ = *src++;
 496:	8b 45 fc             	mov    -0x4(%ebp),%eax
 499:	0f b6 10             	movzbl (%eax),%edx
 49c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 49f:	88 10                	mov    %dl,(%eax)
 4a1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 4a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4a9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 4ad:	0f 9f c0             	setg   %al
 4b0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 4b4:	84 c0                	test   %al,%al
 4b6:	75 de                	jne    496 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 4b8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4bb:	c9                   	leave  
 4bc:	c3                   	ret    
 4bd:	90                   	nop
 4be:	90                   	nop
 4bf:	90                   	nop

000004c0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4c0:	b8 01 00 00 00       	mov    $0x1,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <exit>:
SYSCALL(exit)
 4c8:	b8 02 00 00 00       	mov    $0x2,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <wait>:
SYSCALL(wait)
 4d0:	b8 03 00 00 00       	mov    $0x3,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <waitpid>:
SYSCALL(waitpid)
 4d8:	b8 17 00 00 00       	mov    $0x17,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <pipe>:
SYSCALL(pipe)
 4e0:	b8 04 00 00 00       	mov    $0x4,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <read>:
SYSCALL(read)
 4e8:	b8 05 00 00 00       	mov    $0x5,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <write>:
SYSCALL(write)
 4f0:	b8 10 00 00 00       	mov    $0x10,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <close>:
SYSCALL(close)
 4f8:	b8 15 00 00 00       	mov    $0x15,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <kill>:
SYSCALL(kill)
 500:	b8 06 00 00 00       	mov    $0x6,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <exec>:
SYSCALL(exec)
 508:	b8 07 00 00 00       	mov    $0x7,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <open>:
SYSCALL(open)
 510:	b8 0f 00 00 00       	mov    $0xf,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <mknod>:
SYSCALL(mknod)
 518:	b8 11 00 00 00       	mov    $0x11,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <unlink>:
SYSCALL(unlink)
 520:	b8 12 00 00 00       	mov    $0x12,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <fstat>:
SYSCALL(fstat)
 528:	b8 08 00 00 00       	mov    $0x8,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <link>:
SYSCALL(link)
 530:	b8 13 00 00 00       	mov    $0x13,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <mkdir>:
SYSCALL(mkdir)
 538:	b8 14 00 00 00       	mov    $0x14,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <chdir>:
SYSCALL(chdir)
 540:	b8 09 00 00 00       	mov    $0x9,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <dup>:
SYSCALL(dup)
 548:	b8 0a 00 00 00       	mov    $0xa,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <getpid>:
SYSCALL(getpid)
 550:	b8 0b 00 00 00       	mov    $0xb,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <sbrk>:
SYSCALL(sbrk)
 558:	b8 0c 00 00 00       	mov    $0xc,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <sleep>:
SYSCALL(sleep)
 560:	b8 0d 00 00 00       	mov    $0xd,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <uptime>:
SYSCALL(uptime)
 568:	b8 0e 00 00 00       	mov    $0xe,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <count>:
SYSCALL(count)
 570:	b8 16 00 00 00       	mov    $0x16,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <change_priority>:
SYSCALL(change_priority)
 578:	b8 18 00 00 00       	mov    $0x18,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 580:	55                   	push   %ebp
 581:	89 e5                	mov    %esp,%ebp
 583:	83 ec 28             	sub    $0x28,%esp
 586:	8b 45 0c             	mov    0xc(%ebp),%eax
 589:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 58c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 593:	00 
 594:	8d 45 f4             	lea    -0xc(%ebp),%eax
 597:	89 44 24 04          	mov    %eax,0x4(%esp)
 59b:	8b 45 08             	mov    0x8(%ebp),%eax
 59e:	89 04 24             	mov    %eax,(%esp)
 5a1:	e8 4a ff ff ff       	call   4f0 <write>
}
 5a6:	c9                   	leave  
 5a7:	c3                   	ret    

000005a8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5a8:	55                   	push   %ebp
 5a9:	89 e5                	mov    %esp,%ebp
 5ab:	53                   	push   %ebx
 5ac:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5b6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5ba:	74 17                	je     5d3 <printint+0x2b>
 5bc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5c0:	79 11                	jns    5d3 <printint+0x2b>
    neg = 1;
 5c2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 5cc:	f7 d8                	neg    %eax
 5ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 5d1:	eb 06                	jmp    5d9 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 5d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 5d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 5d9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 5e0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 5e3:	8b 5d 10             	mov    0x10(%ebp),%ebx
 5e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5e9:	ba 00 00 00 00       	mov    $0x0,%edx
 5ee:	f7 f3                	div    %ebx
 5f0:	89 d0                	mov    %edx,%eax
 5f2:	0f b6 80 94 0a 00 00 	movzbl 0xa94(%eax),%eax
 5f9:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 5fd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 601:	8b 45 10             	mov    0x10(%ebp),%eax
 604:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 607:	8b 45 f4             	mov    -0xc(%ebp),%eax
 60a:	ba 00 00 00 00       	mov    $0x0,%edx
 60f:	f7 75 d4             	divl   -0x2c(%ebp)
 612:	89 45 f4             	mov    %eax,-0xc(%ebp)
 615:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 619:	75 c5                	jne    5e0 <printint+0x38>
  if(neg)
 61b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 61f:	74 28                	je     649 <printint+0xa1>
    buf[i++] = '-';
 621:	8b 45 ec             	mov    -0x14(%ebp),%eax
 624:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 629:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 62d:	eb 1a                	jmp    649 <printint+0xa1>
    putc(fd, buf[i]);
 62f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 632:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 637:	0f be c0             	movsbl %al,%eax
 63a:	89 44 24 04          	mov    %eax,0x4(%esp)
 63e:	8b 45 08             	mov    0x8(%ebp),%eax
 641:	89 04 24             	mov    %eax,(%esp)
 644:	e8 37 ff ff ff       	call   580 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 649:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 64d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 651:	79 dc                	jns    62f <printint+0x87>
    putc(fd, buf[i]);
}
 653:	83 c4 44             	add    $0x44,%esp
 656:	5b                   	pop    %ebx
 657:	5d                   	pop    %ebp
 658:	c3                   	ret    

00000659 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 659:	55                   	push   %ebp
 65a:	89 e5                	mov    %esp,%ebp
 65c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 65f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 666:	8d 45 0c             	lea    0xc(%ebp),%eax
 669:	83 c0 04             	add    $0x4,%eax
 66c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 66f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 676:	e9 7e 01 00 00       	jmp    7f9 <printf+0x1a0>
    c = fmt[i] & 0xff;
 67b:	8b 55 0c             	mov    0xc(%ebp),%edx
 67e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 681:	8d 04 02             	lea    (%edx,%eax,1),%eax
 684:	0f b6 00             	movzbl (%eax),%eax
 687:	0f be c0             	movsbl %al,%eax
 68a:	25 ff 00 00 00       	and    $0xff,%eax
 68f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 692:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 696:	75 2c                	jne    6c4 <printf+0x6b>
      if(c == '%'){
 698:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 69c:	75 0c                	jne    6aa <printf+0x51>
        state = '%';
 69e:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 6a5:	e9 4b 01 00 00       	jmp    7f5 <printf+0x19c>
      } else {
        putc(fd, c);
 6aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ad:	0f be c0             	movsbl %al,%eax
 6b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b4:	8b 45 08             	mov    0x8(%ebp),%eax
 6b7:	89 04 24             	mov    %eax,(%esp)
 6ba:	e8 c1 fe ff ff       	call   580 <putc>
 6bf:	e9 31 01 00 00       	jmp    7f5 <printf+0x19c>
      }
    } else if(state == '%'){
 6c4:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 6c8:	0f 85 27 01 00 00    	jne    7f5 <printf+0x19c>
      if(c == 'd'){
 6ce:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 6d2:	75 2d                	jne    701 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 6d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d7:	8b 00                	mov    (%eax),%eax
 6d9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 6e0:	00 
 6e1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 6e8:	00 
 6e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ed:	8b 45 08             	mov    0x8(%ebp),%eax
 6f0:	89 04 24             	mov    %eax,(%esp)
 6f3:	e8 b0 fe ff ff       	call   5a8 <printint>
        ap++;
 6f8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 6fc:	e9 ed 00 00 00       	jmp    7ee <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 701:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 705:	74 06                	je     70d <printf+0xb4>
 707:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 70b:	75 2d                	jne    73a <printf+0xe1>
        printint(fd, *ap, 16, 0);
 70d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 710:	8b 00                	mov    (%eax),%eax
 712:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 719:	00 
 71a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 721:	00 
 722:	89 44 24 04          	mov    %eax,0x4(%esp)
 726:	8b 45 08             	mov    0x8(%ebp),%eax
 729:	89 04 24             	mov    %eax,(%esp)
 72c:	e8 77 fe ff ff       	call   5a8 <printint>
        ap++;
 731:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 735:	e9 b4 00 00 00       	jmp    7ee <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 73a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 73e:	75 46                	jne    786 <printf+0x12d>
        s = (char*)*ap;
 740:	8b 45 f4             	mov    -0xc(%ebp),%eax
 743:	8b 00                	mov    (%eax),%eax
 745:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 748:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 74c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 750:	75 27                	jne    779 <printf+0x120>
          s = "(null)";
 752:	c7 45 e4 8a 0a 00 00 	movl   $0xa8a,-0x1c(%ebp)
        while(*s != 0){
 759:	eb 1f                	jmp    77a <printf+0x121>
          putc(fd, *s);
 75b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 75e:	0f b6 00             	movzbl (%eax),%eax
 761:	0f be c0             	movsbl %al,%eax
 764:	89 44 24 04          	mov    %eax,0x4(%esp)
 768:	8b 45 08             	mov    0x8(%ebp),%eax
 76b:	89 04 24             	mov    %eax,(%esp)
 76e:	e8 0d fe ff ff       	call   580 <putc>
          s++;
 773:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 777:	eb 01                	jmp    77a <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 779:	90                   	nop
 77a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 77d:	0f b6 00             	movzbl (%eax),%eax
 780:	84 c0                	test   %al,%al
 782:	75 d7                	jne    75b <printf+0x102>
 784:	eb 68                	jmp    7ee <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 786:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 78a:	75 1d                	jne    7a9 <printf+0x150>
        putc(fd, *ap);
 78c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78f:	8b 00                	mov    (%eax),%eax
 791:	0f be c0             	movsbl %al,%eax
 794:	89 44 24 04          	mov    %eax,0x4(%esp)
 798:	8b 45 08             	mov    0x8(%ebp),%eax
 79b:	89 04 24             	mov    %eax,(%esp)
 79e:	e8 dd fd ff ff       	call   580 <putc>
        ap++;
 7a3:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 7a7:	eb 45                	jmp    7ee <printf+0x195>
      } else if(c == '%'){
 7a9:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 7ad:	75 17                	jne    7c6 <printf+0x16d>
        putc(fd, c);
 7af:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b2:	0f be c0             	movsbl %al,%eax
 7b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
 7bc:	89 04 24             	mov    %eax,(%esp)
 7bf:	e8 bc fd ff ff       	call   580 <putc>
 7c4:	eb 28                	jmp    7ee <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7c6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7cd:	00 
 7ce:	8b 45 08             	mov    0x8(%ebp),%eax
 7d1:	89 04 24             	mov    %eax,(%esp)
 7d4:	e8 a7 fd ff ff       	call   580 <putc>
        putc(fd, c);
 7d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7dc:	0f be c0             	movsbl %al,%eax
 7df:	89 44 24 04          	mov    %eax,0x4(%esp)
 7e3:	8b 45 08             	mov    0x8(%ebp),%eax
 7e6:	89 04 24             	mov    %eax,(%esp)
 7e9:	e8 92 fd ff ff       	call   580 <putc>
      }
      state = 0;
 7ee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 7f5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 7f9:	8b 55 0c             	mov    0xc(%ebp),%edx
 7fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ff:	8d 04 02             	lea    (%edx,%eax,1),%eax
 802:	0f b6 00             	movzbl (%eax),%eax
 805:	84 c0                	test   %al,%al
 807:	0f 85 6e fe ff ff    	jne    67b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 80d:	c9                   	leave  
 80e:	c3                   	ret    
 80f:	90                   	nop

00000810 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 816:	8b 45 08             	mov    0x8(%ebp),%eax
 819:	83 e8 08             	sub    $0x8,%eax
 81c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 81f:	a1 b0 0a 00 00       	mov    0xab0,%eax
 824:	89 45 fc             	mov    %eax,-0x4(%ebp)
 827:	eb 24                	jmp    84d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 829:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82c:	8b 00                	mov    (%eax),%eax
 82e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 831:	77 12                	ja     845 <free+0x35>
 833:	8b 45 f8             	mov    -0x8(%ebp),%eax
 836:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 839:	77 24                	ja     85f <free+0x4f>
 83b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83e:	8b 00                	mov    (%eax),%eax
 840:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 843:	77 1a                	ja     85f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 845:	8b 45 fc             	mov    -0x4(%ebp),%eax
 848:	8b 00                	mov    (%eax),%eax
 84a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 84d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 850:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 853:	76 d4                	jbe    829 <free+0x19>
 855:	8b 45 fc             	mov    -0x4(%ebp),%eax
 858:	8b 00                	mov    (%eax),%eax
 85a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 85d:	76 ca                	jbe    829 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 85f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 862:	8b 40 04             	mov    0x4(%eax),%eax
 865:	c1 e0 03             	shl    $0x3,%eax
 868:	89 c2                	mov    %eax,%edx
 86a:	03 55 f8             	add    -0x8(%ebp),%edx
 86d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 870:	8b 00                	mov    (%eax),%eax
 872:	39 c2                	cmp    %eax,%edx
 874:	75 24                	jne    89a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 876:	8b 45 f8             	mov    -0x8(%ebp),%eax
 879:	8b 50 04             	mov    0x4(%eax),%edx
 87c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87f:	8b 00                	mov    (%eax),%eax
 881:	8b 40 04             	mov    0x4(%eax),%eax
 884:	01 c2                	add    %eax,%edx
 886:	8b 45 f8             	mov    -0x8(%ebp),%eax
 889:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 88c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88f:	8b 00                	mov    (%eax),%eax
 891:	8b 10                	mov    (%eax),%edx
 893:	8b 45 f8             	mov    -0x8(%ebp),%eax
 896:	89 10                	mov    %edx,(%eax)
 898:	eb 0a                	jmp    8a4 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 89a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89d:	8b 10                	mov    (%eax),%edx
 89f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8a7:	8b 40 04             	mov    0x4(%eax),%eax
 8aa:	c1 e0 03             	shl    $0x3,%eax
 8ad:	03 45 fc             	add    -0x4(%ebp),%eax
 8b0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8b3:	75 20                	jne    8d5 <free+0xc5>
    p->s.size += bp->s.size;
 8b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b8:	8b 50 04             	mov    0x4(%eax),%edx
 8bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8be:	8b 40 04             	mov    0x4(%eax),%eax
 8c1:	01 c2                	add    %eax,%edx
 8c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8cc:	8b 10                	mov    (%eax),%edx
 8ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d1:	89 10                	mov    %edx,(%eax)
 8d3:	eb 08                	jmp    8dd <free+0xcd>
  } else
    p->s.ptr = bp;
 8d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 8db:	89 10                	mov    %edx,(%eax)
  freep = p;
 8dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e0:	a3 b0 0a 00 00       	mov    %eax,0xab0
}
 8e5:	c9                   	leave  
 8e6:	c3                   	ret    

000008e7 <morecore>:

static Header*
morecore(uint nu)
{
 8e7:	55                   	push   %ebp
 8e8:	89 e5                	mov    %esp,%ebp
 8ea:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 8ed:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 8f4:	77 07                	ja     8fd <morecore+0x16>
    nu = 4096;
 8f6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 8fd:	8b 45 08             	mov    0x8(%ebp),%eax
 900:	c1 e0 03             	shl    $0x3,%eax
 903:	89 04 24             	mov    %eax,(%esp)
 906:	e8 4d fc ff ff       	call   558 <sbrk>
 90b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 90e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 912:	75 07                	jne    91b <morecore+0x34>
    return 0;
 914:	b8 00 00 00 00       	mov    $0x0,%eax
 919:	eb 22                	jmp    93d <morecore+0x56>
  hp = (Header*)p;
 91b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 921:	8b 45 f4             	mov    -0xc(%ebp),%eax
 924:	8b 55 08             	mov    0x8(%ebp),%edx
 927:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 92a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92d:	83 c0 08             	add    $0x8,%eax
 930:	89 04 24             	mov    %eax,(%esp)
 933:	e8 d8 fe ff ff       	call   810 <free>
  return freep;
 938:	a1 b0 0a 00 00       	mov    0xab0,%eax
}
 93d:	c9                   	leave  
 93e:	c3                   	ret    

0000093f <malloc>:

void*
malloc(uint nbytes)
{
 93f:	55                   	push   %ebp
 940:	89 e5                	mov    %esp,%ebp
 942:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 945:	8b 45 08             	mov    0x8(%ebp),%eax
 948:	83 c0 07             	add    $0x7,%eax
 94b:	c1 e8 03             	shr    $0x3,%eax
 94e:	83 c0 01             	add    $0x1,%eax
 951:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 954:	a1 b0 0a 00 00       	mov    0xab0,%eax
 959:	89 45 f0             	mov    %eax,-0x10(%ebp)
 95c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 960:	75 23                	jne    985 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 962:	c7 45 f0 a8 0a 00 00 	movl   $0xaa8,-0x10(%ebp)
 969:	8b 45 f0             	mov    -0x10(%ebp),%eax
 96c:	a3 b0 0a 00 00       	mov    %eax,0xab0
 971:	a1 b0 0a 00 00       	mov    0xab0,%eax
 976:	a3 a8 0a 00 00       	mov    %eax,0xaa8
    base.s.size = 0;
 97b:	c7 05 ac 0a 00 00 00 	movl   $0x0,0xaac
 982:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 985:	8b 45 f0             	mov    -0x10(%ebp),%eax
 988:	8b 00                	mov    (%eax),%eax
 98a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 98d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 990:	8b 40 04             	mov    0x4(%eax),%eax
 993:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 996:	72 4d                	jb     9e5 <malloc+0xa6>
      if(p->s.size == nunits)
 998:	8b 45 ec             	mov    -0x14(%ebp),%eax
 99b:	8b 40 04             	mov    0x4(%eax),%eax
 99e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 9a1:	75 0c                	jne    9af <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9a3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9a6:	8b 10                	mov    (%eax),%edx
 9a8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ab:	89 10                	mov    %edx,(%eax)
 9ad:	eb 26                	jmp    9d5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9af:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9b2:	8b 40 04             	mov    0x4(%eax),%eax
 9b5:	89 c2                	mov    %eax,%edx
 9b7:	2b 55 f4             	sub    -0xc(%ebp),%edx
 9ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9bd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9c3:	8b 40 04             	mov    0x4(%eax),%eax
 9c6:	c1 e0 03             	shl    $0x3,%eax
 9c9:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 9cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9d2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 9d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d8:	a3 b0 0a 00 00       	mov    %eax,0xab0
      return (void*)(p + 1);
 9dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9e0:	83 c0 08             	add    $0x8,%eax
 9e3:	eb 38                	jmp    a1d <malloc+0xde>
    }
    if(p == freep)
 9e5:	a1 b0 0a 00 00       	mov    0xab0,%eax
 9ea:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 9ed:	75 1b                	jne    a0a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 9ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f2:	89 04 24             	mov    %eax,(%esp)
 9f5:	e8 ed fe ff ff       	call   8e7 <morecore>
 9fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
 9fd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a01:	75 07                	jne    a0a <malloc+0xcb>
        return 0;
 a03:	b8 00 00 00 00       	mov    $0x0,%eax
 a08:	eb 13                	jmp    a1d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a10:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a13:	8b 00                	mov    (%eax),%eax
 a15:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a18:	e9 70 ff ff ff       	jmp    98d <malloc+0x4e>
}
 a1d:	c9                   	leave  
 a1e:	c3                   	ret    
