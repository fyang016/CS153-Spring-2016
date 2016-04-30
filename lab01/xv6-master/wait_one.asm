
_wait_one:     file format elf32-i386


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
   6:	83 ec 30             	sub    $0x30,%esp

    int begin = getpid();
   9:	e8 c6 04 00 00       	call   4d4 <getpid>
   e:	89 44 24 14          	mov    %eax,0x14(%esp)
    int pid = fork();
  12:	e8 2d 04 00 00       	call   444 <fork>
  17:	89 44 24 18          	mov    %eax,0x18(%esp)
    int i;
    int status;
    if(pid > 0){
  1b:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  20:	0f 8e 4a 01 00 00    	jle    170 <main+0x170>
        for(i = 0; i < 15 && pid > 0; i++){
  26:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  2d:	00 
  2e:	eb 29                	jmp    59 <main+0x59>
            pid = fork();
  30:	e8 0f 04 00 00       	call   444 <fork>
  35:	89 44 24 18          	mov    %eax,0x18(%esp)
            if(pid < 0)
  39:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  3e:	79 14                	jns    54 <main+0x54>
                printf(1,"errors occur!\n");
  40:	c7 44 24 04 a4 09 00 	movl   $0x9a4,0x4(%esp)
  47:	00 
  48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4f:	e8 89 05 00 00       	call   5dd <printf>
    int begin = getpid();
    int pid = fork();
    int i;
    int status;
    if(pid > 0){
        for(i = 0; i < 15 && pid > 0; i++){
  54:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  59:	83 7c 24 1c 0e       	cmpl   $0xe,0x1c(%esp)
  5e:	7f 07                	jg     67 <main+0x67>
  60:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  65:	7f c9                	jg     30 <main+0x30>
            pid = fork();
            if(pid < 0)
                printf(1,"errors occur!\n");
        }
        if (pid == 0){
  67:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  6c:	0f 85 2d 01 00 00    	jne    19f <main+0x19f>
            int j = 0;
  72:	c7 44 24 24 00 00 00 	movl   $0x0,0x24(%esp)
  79:	00 
            while(j++ < 1000);
  7a:	81 7c 24 24 e7 03 00 	cmpl   $0x3e7,0x24(%esp)
  81:	00 
  82:	0f 9e c0             	setle  %al
  85:	83 44 24 24 01       	addl   $0x1,0x24(%esp)
  8a:	84 c0                	test   %al,%al
  8c:	75 ec                	jne    7a <main+0x7a>
            if(getpid() == begin+5) sleep(30);
  8e:	e8 41 04 00 00       	call   4d4 <getpid>
  93:	8b 54 24 14          	mov    0x14(%esp),%edx
  97:	83 c2 05             	add    $0x5,%edx
  9a:	39 d0                	cmp    %edx,%eax
  9c:	75 0c                	jne    aa <main+0xaa>
  9e:	c7 04 24 1e 00 00 00 	movl   $0x1e,(%esp)
  a5:	e8 3a 04 00 00       	call   4e4 <sleep>
            
            printf(1,"pid = %d\n",getpid());
  aa:	e8 25 04 00 00       	call   4d4 <getpid>
  af:	89 44 24 08          	mov    %eax,0x8(%esp)
  b3:	c7 44 24 04 b3 09 00 	movl   $0x9b3,0x4(%esp)
  ba:	00 
  bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c2:	e8 16 05 00 00       	call   5dd <printf>
            if(getpid() == begin+10){
  c7:	e8 08 04 00 00       	call   4d4 <getpid>
  cc:	8b 54 24 14          	mov    0x14(%esp),%edx
  d0:	83 c2 0a             	add    $0xa,%edx
  d3:	39 d0                	cmp    %edx,%eax
  d5:	75 71                	jne    148 <main+0x148>
                printf(1,"pid %d waiting for %d\n",begin+10,begin+5);
  d7:	8b 44 24 14          	mov    0x14(%esp),%eax
  db:	8d 50 05             	lea    0x5(%eax),%edx
  de:	8b 44 24 14          	mov    0x14(%esp),%eax
  e2:	83 c0 0a             	add    $0xa,%eax
  e5:	89 54 24 0c          	mov    %edx,0xc(%esp)
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 bd 09 00 	movl   $0x9bd,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 dc 04 00 00       	call   5dd <printf>
                int wpid = waitpid(begin+5,&status,0);
 101:	8b 44 24 14          	mov    0x14(%esp),%eax
 105:	8d 50 05             	lea    0x5(%eax),%edx
 108:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
 10f:	00 
 110:	8d 44 24 10          	lea    0x10(%esp),%eax
 114:	89 44 24 04          	mov    %eax,0x4(%esp)
 118:	89 14 24             	mov    %edx,(%esp)
 11b:	e8 3c 03 00 00       	call   45c <waitpid>
 120:	89 44 24 28          	mov    %eax,0x28(%esp)
                printf(1,"success clean %d, status is %d\n",wpid,status);
 124:	8b 44 24 10          	mov    0x10(%esp),%eax
 128:	89 44 24 0c          	mov    %eax,0xc(%esp)
 12c:	8b 44 24 28          	mov    0x28(%esp),%eax
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	c7 44 24 04 d4 09 00 	movl   $0x9d4,0x4(%esp)
 13b:	00 
 13c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 143:	e8 95 04 00 00       	call   5dd <printf>
            }
            if(getpid() == begin+5){
 148:	e8 87 03 00 00       	call   4d4 <getpid>
 14d:	8b 54 24 14          	mov    0x14(%esp),%edx
 151:	83 c2 05             	add    $0x5,%edx
 154:	39 d0                	cmp    %edx,%eax
 156:	75 0c                	jne    164 <main+0x164>
                exit(5);
 158:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
 15f:	e8 e8 02 00 00       	call   44c <exit>
            }
            exit(0);
 164:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 16b:	e8 dc 02 00 00       	call   44c <exit>
        }
    }else if(pid == 0){
 170:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 175:	75 28                	jne    19f <main+0x19f>
        int j = 0;
 177:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 17e:	00 
        while(j++ < 1000);
 17f:	81 7c 24 2c e7 03 00 	cmpl   $0x3e7,0x2c(%esp)
 186:	00 
 187:	0f 9e c0             	setle  %al
 18a:	83 44 24 2c 01       	addl   $0x1,0x2c(%esp)
 18f:	84 c0                	test   %al,%al
 191:	75 ec                	jne    17f <main+0x17f>
        exit(0);
 193:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 19a:	e8 ad 02 00 00       	call   44c <exit>
    }
    int going = 1;
 19f:	c7 44 24 20 01 00 00 	movl   $0x1,0x20(%esp)
 1a6:	00 
    while(going >= 0){
 1a7:	eb 2c                	jmp    1d5 <main+0x1d5>
        going = wait(&status);
 1a9:	8d 44 24 10          	lea    0x10(%esp),%eax
 1ad:	89 04 24             	mov    %eax,(%esp)
 1b0:	e8 9f 02 00 00       	call   454 <wait>
 1b5:	89 44 24 20          	mov    %eax,0x20(%esp)
        printf(1,"kill %d\n",going);
 1b9:	8b 44 24 20          	mov    0x20(%esp),%eax
 1bd:	89 44 24 08          	mov    %eax,0x8(%esp)
 1c1:	c7 44 24 04 f4 09 00 	movl   $0x9f4,0x4(%esp)
 1c8:	00 
 1c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1d0:	e8 08 04 00 00       	call   5dd <printf>
        int j = 0;
        while(j++ < 1000);
        exit(0);
    }
    int going = 1;
    while(going >= 0){
 1d5:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
 1da:	79 cd                	jns    1a9 <main+0x1a9>
        going = wait(&status);
        printf(1,"kill %d\n",going);
    }
    exit(0);
 1dc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e3:	e8 64 02 00 00       	call   44c <exit>

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
 322:	e8 45 01 00 00       	call   46c <read>
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
 380:	e8 0f 01 00 00       	call   494 <open>
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
 3a2:	e8 05 01 00 00       	call   4ac <fstat>
 3a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 3aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 3ad:	89 04 24             	mov    %eax,(%esp)
 3b0:	e8 c7 00 00 00       	call   47c <close>
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

0000045c <waitpid>:
SYSCALL(waitpid)
 45c:	b8 17 00 00 00       	mov    $0x17,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <pipe>:
SYSCALL(pipe)
 464:	b8 04 00 00 00       	mov    $0x4,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <read>:
SYSCALL(read)
 46c:	b8 05 00 00 00       	mov    $0x5,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <write>:
SYSCALL(write)
 474:	b8 10 00 00 00       	mov    $0x10,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <close>:
SYSCALL(close)
 47c:	b8 15 00 00 00       	mov    $0x15,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <kill>:
SYSCALL(kill)
 484:	b8 06 00 00 00       	mov    $0x6,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <exec>:
SYSCALL(exec)
 48c:	b8 07 00 00 00       	mov    $0x7,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <open>:
SYSCALL(open)
 494:	b8 0f 00 00 00       	mov    $0xf,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <mknod>:
SYSCALL(mknod)
 49c:	b8 11 00 00 00       	mov    $0x11,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <unlink>:
SYSCALL(unlink)
 4a4:	b8 12 00 00 00       	mov    $0x12,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <fstat>:
SYSCALL(fstat)
 4ac:	b8 08 00 00 00       	mov    $0x8,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <link>:
SYSCALL(link)
 4b4:	b8 13 00 00 00       	mov    $0x13,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <mkdir>:
SYSCALL(mkdir)
 4bc:	b8 14 00 00 00       	mov    $0x14,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <chdir>:
SYSCALL(chdir)
 4c4:	b8 09 00 00 00       	mov    $0x9,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <dup>:
SYSCALL(dup)
 4cc:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <getpid>:
SYSCALL(getpid)
 4d4:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d9:	cd 40                	int    $0x40
 4db:	c3                   	ret    

000004dc <sbrk>:
SYSCALL(sbrk)
 4dc:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e1:	cd 40                	int    $0x40
 4e3:	c3                   	ret    

000004e4 <sleep>:
SYSCALL(sleep)
 4e4:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e9:	cd 40                	int    $0x40
 4eb:	c3                   	ret    

000004ec <uptime>:
SYSCALL(uptime)
 4ec:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <count>:
SYSCALL(count)
 4f4:	b8 16 00 00 00       	mov    $0x16,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <change_priority>:
SYSCALL(change_priority)
 4fc:	b8 18 00 00 00       	mov    $0x18,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 504:	55                   	push   %ebp
 505:	89 e5                	mov    %esp,%ebp
 507:	83 ec 28             	sub    $0x28,%esp
 50a:	8b 45 0c             	mov    0xc(%ebp),%eax
 50d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 510:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 517:	00 
 518:	8d 45 f4             	lea    -0xc(%ebp),%eax
 51b:	89 44 24 04          	mov    %eax,0x4(%esp)
 51f:	8b 45 08             	mov    0x8(%ebp),%eax
 522:	89 04 24             	mov    %eax,(%esp)
 525:	e8 4a ff ff ff       	call   474 <write>
}
 52a:	c9                   	leave  
 52b:	c3                   	ret    

0000052c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 52c:	55                   	push   %ebp
 52d:	89 e5                	mov    %esp,%ebp
 52f:	53                   	push   %ebx
 530:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 533:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 53a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 53e:	74 17                	je     557 <printint+0x2b>
 540:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 544:	79 11                	jns    557 <printint+0x2b>
    neg = 1;
 546:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 54d:	8b 45 0c             	mov    0xc(%ebp),%eax
 550:	f7 d8                	neg    %eax
 552:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 555:	eb 06                	jmp    55d <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 557:	8b 45 0c             	mov    0xc(%ebp),%eax
 55a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 55d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 564:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 567:	8b 5d 10             	mov    0x10(%ebp),%ebx
 56a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56d:	ba 00 00 00 00       	mov    $0x0,%edx
 572:	f7 f3                	div    %ebx
 574:	89 d0                	mov    %edx,%eax
 576:	0f b6 80 04 0a 00 00 	movzbl 0xa04(%eax),%eax
 57d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 581:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 585:	8b 45 10             	mov    0x10(%ebp),%eax
 588:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 58b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58e:	ba 00 00 00 00       	mov    $0x0,%edx
 593:	f7 75 d4             	divl   -0x2c(%ebp)
 596:	89 45 f4             	mov    %eax,-0xc(%ebp)
 599:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 59d:	75 c5                	jne    564 <printint+0x38>
  if(neg)
 59f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5a3:	74 28                	je     5cd <printint+0xa1>
    buf[i++] = '-';
 5a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5a8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 5ad:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 5b1:	eb 1a                	jmp    5cd <printint+0xa1>
    putc(fd, buf[i]);
 5b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5b6:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 5bb:	0f be c0             	movsbl %al,%eax
 5be:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c2:	8b 45 08             	mov    0x8(%ebp),%eax
 5c5:	89 04 24             	mov    %eax,(%esp)
 5c8:	e8 37 ff ff ff       	call   504 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5cd:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 5d1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5d5:	79 dc                	jns    5b3 <printint+0x87>
    putc(fd, buf[i]);
}
 5d7:	83 c4 44             	add    $0x44,%esp
 5da:	5b                   	pop    %ebx
 5db:	5d                   	pop    %ebp
 5dc:	c3                   	ret    

000005dd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5dd:	55                   	push   %ebp
 5de:	89 e5                	mov    %esp,%ebp
 5e0:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5e3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5ea:	8d 45 0c             	lea    0xc(%ebp),%eax
 5ed:	83 c0 04             	add    $0x4,%eax
 5f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 5f3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 5fa:	e9 7e 01 00 00       	jmp    77d <printf+0x1a0>
    c = fmt[i] & 0xff;
 5ff:	8b 55 0c             	mov    0xc(%ebp),%edx
 602:	8b 45 ec             	mov    -0x14(%ebp),%eax
 605:	8d 04 02             	lea    (%edx,%eax,1),%eax
 608:	0f b6 00             	movzbl (%eax),%eax
 60b:	0f be c0             	movsbl %al,%eax
 60e:	25 ff 00 00 00       	and    $0xff,%eax
 613:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 616:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 61a:	75 2c                	jne    648 <printf+0x6b>
      if(c == '%'){
 61c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 620:	75 0c                	jne    62e <printf+0x51>
        state = '%';
 622:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 629:	e9 4b 01 00 00       	jmp    779 <printf+0x19c>
      } else {
        putc(fd, c);
 62e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 631:	0f be c0             	movsbl %al,%eax
 634:	89 44 24 04          	mov    %eax,0x4(%esp)
 638:	8b 45 08             	mov    0x8(%ebp),%eax
 63b:	89 04 24             	mov    %eax,(%esp)
 63e:	e8 c1 fe ff ff       	call   504 <putc>
 643:	e9 31 01 00 00       	jmp    779 <printf+0x19c>
      }
    } else if(state == '%'){
 648:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 64c:	0f 85 27 01 00 00    	jne    779 <printf+0x19c>
      if(c == 'd'){
 652:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 656:	75 2d                	jne    685 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 658:	8b 45 f4             	mov    -0xc(%ebp),%eax
 65b:	8b 00                	mov    (%eax),%eax
 65d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 664:	00 
 665:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 66c:	00 
 66d:	89 44 24 04          	mov    %eax,0x4(%esp)
 671:	8b 45 08             	mov    0x8(%ebp),%eax
 674:	89 04 24             	mov    %eax,(%esp)
 677:	e8 b0 fe ff ff       	call   52c <printint>
        ap++;
 67c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 680:	e9 ed 00 00 00       	jmp    772 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 685:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 689:	74 06                	je     691 <printf+0xb4>
 68b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 68f:	75 2d                	jne    6be <printf+0xe1>
        printint(fd, *ap, 16, 0);
 691:	8b 45 f4             	mov    -0xc(%ebp),%eax
 694:	8b 00                	mov    (%eax),%eax
 696:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 69d:	00 
 69e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6a5:	00 
 6a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6aa:	8b 45 08             	mov    0x8(%ebp),%eax
 6ad:	89 04 24             	mov    %eax,(%esp)
 6b0:	e8 77 fe ff ff       	call   52c <printint>
        ap++;
 6b5:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6b9:	e9 b4 00 00 00       	jmp    772 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6be:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 6c2:	75 46                	jne    70a <printf+0x12d>
        s = (char*)*ap;
 6c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c7:	8b 00                	mov    (%eax),%eax
 6c9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 6cc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 6d0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 6d4:	75 27                	jne    6fd <printf+0x120>
          s = "(null)";
 6d6:	c7 45 e4 fd 09 00 00 	movl   $0x9fd,-0x1c(%ebp)
        while(*s != 0){
 6dd:	eb 1f                	jmp    6fe <printf+0x121>
          putc(fd, *s);
 6df:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e2:	0f b6 00             	movzbl (%eax),%eax
 6e5:	0f be c0             	movsbl %al,%eax
 6e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	89 04 24             	mov    %eax,(%esp)
 6f2:	e8 0d fe ff ff       	call   504 <putc>
          s++;
 6f7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 6fb:	eb 01                	jmp    6fe <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6fd:	90                   	nop
 6fe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 701:	0f b6 00             	movzbl (%eax),%eax
 704:	84 c0                	test   %al,%al
 706:	75 d7                	jne    6df <printf+0x102>
 708:	eb 68                	jmp    772 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 70a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 70e:	75 1d                	jne    72d <printf+0x150>
        putc(fd, *ap);
 710:	8b 45 f4             	mov    -0xc(%ebp),%eax
 713:	8b 00                	mov    (%eax),%eax
 715:	0f be c0             	movsbl %al,%eax
 718:	89 44 24 04          	mov    %eax,0x4(%esp)
 71c:	8b 45 08             	mov    0x8(%ebp),%eax
 71f:	89 04 24             	mov    %eax,(%esp)
 722:	e8 dd fd ff ff       	call   504 <putc>
        ap++;
 727:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 72b:	eb 45                	jmp    772 <printf+0x195>
      } else if(c == '%'){
 72d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 731:	75 17                	jne    74a <printf+0x16d>
        putc(fd, c);
 733:	8b 45 e8             	mov    -0x18(%ebp),%eax
 736:	0f be c0             	movsbl %al,%eax
 739:	89 44 24 04          	mov    %eax,0x4(%esp)
 73d:	8b 45 08             	mov    0x8(%ebp),%eax
 740:	89 04 24             	mov    %eax,(%esp)
 743:	e8 bc fd ff ff       	call   504 <putc>
 748:	eb 28                	jmp    772 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 74a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 751:	00 
 752:	8b 45 08             	mov    0x8(%ebp),%eax
 755:	89 04 24             	mov    %eax,(%esp)
 758:	e8 a7 fd ff ff       	call   504 <putc>
        putc(fd, c);
 75d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 760:	0f be c0             	movsbl %al,%eax
 763:	89 44 24 04          	mov    %eax,0x4(%esp)
 767:	8b 45 08             	mov    0x8(%ebp),%eax
 76a:	89 04 24             	mov    %eax,(%esp)
 76d:	e8 92 fd ff ff       	call   504 <putc>
      }
      state = 0;
 772:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 779:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 77d:	8b 55 0c             	mov    0xc(%ebp),%edx
 780:	8b 45 ec             	mov    -0x14(%ebp),%eax
 783:	8d 04 02             	lea    (%edx,%eax,1),%eax
 786:	0f b6 00             	movzbl (%eax),%eax
 789:	84 c0                	test   %al,%al
 78b:	0f 85 6e fe ff ff    	jne    5ff <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 791:	c9                   	leave  
 792:	c3                   	ret    
 793:	90                   	nop

00000794 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 794:	55                   	push   %ebp
 795:	89 e5                	mov    %esp,%ebp
 797:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 79a:	8b 45 08             	mov    0x8(%ebp),%eax
 79d:	83 e8 08             	sub    $0x8,%eax
 7a0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a3:	a1 20 0a 00 00       	mov    0xa20,%eax
 7a8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7ab:	eb 24                	jmp    7d1 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b0:	8b 00                	mov    (%eax),%eax
 7b2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b5:	77 12                	ja     7c9 <free+0x35>
 7b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ba:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7bd:	77 24                	ja     7e3 <free+0x4f>
 7bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c2:	8b 00                	mov    (%eax),%eax
 7c4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7c7:	77 1a                	ja     7e3 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cc:	8b 00                	mov    (%eax),%eax
 7ce:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7d1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d7:	76 d4                	jbe    7ad <free+0x19>
 7d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7dc:	8b 00                	mov    (%eax),%eax
 7de:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e1:	76 ca                	jbe    7ad <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e6:	8b 40 04             	mov    0x4(%eax),%eax
 7e9:	c1 e0 03             	shl    $0x3,%eax
 7ec:	89 c2                	mov    %eax,%edx
 7ee:	03 55 f8             	add    -0x8(%ebp),%edx
 7f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f4:	8b 00                	mov    (%eax),%eax
 7f6:	39 c2                	cmp    %eax,%edx
 7f8:	75 24                	jne    81e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 7fa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fd:	8b 50 04             	mov    0x4(%eax),%edx
 800:	8b 45 fc             	mov    -0x4(%ebp),%eax
 803:	8b 00                	mov    (%eax),%eax
 805:	8b 40 04             	mov    0x4(%eax),%eax
 808:	01 c2                	add    %eax,%edx
 80a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 810:	8b 45 fc             	mov    -0x4(%ebp),%eax
 813:	8b 00                	mov    (%eax),%eax
 815:	8b 10                	mov    (%eax),%edx
 817:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81a:	89 10                	mov    %edx,(%eax)
 81c:	eb 0a                	jmp    828 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 81e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 821:	8b 10                	mov    (%eax),%edx
 823:	8b 45 f8             	mov    -0x8(%ebp),%eax
 826:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 828:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82b:	8b 40 04             	mov    0x4(%eax),%eax
 82e:	c1 e0 03             	shl    $0x3,%eax
 831:	03 45 fc             	add    -0x4(%ebp),%eax
 834:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 837:	75 20                	jne    859 <free+0xc5>
    p->s.size += bp->s.size;
 839:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83c:	8b 50 04             	mov    0x4(%eax),%edx
 83f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 842:	8b 40 04             	mov    0x4(%eax),%eax
 845:	01 c2                	add    %eax,%edx
 847:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 84d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 850:	8b 10                	mov    (%eax),%edx
 852:	8b 45 fc             	mov    -0x4(%ebp),%eax
 855:	89 10                	mov    %edx,(%eax)
 857:	eb 08                	jmp    861 <free+0xcd>
  } else
    p->s.ptr = bp;
 859:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 85f:	89 10                	mov    %edx,(%eax)
  freep = p;
 861:	8b 45 fc             	mov    -0x4(%ebp),%eax
 864:	a3 20 0a 00 00       	mov    %eax,0xa20
}
 869:	c9                   	leave  
 86a:	c3                   	ret    

0000086b <morecore>:

static Header*
morecore(uint nu)
{
 86b:	55                   	push   %ebp
 86c:	89 e5                	mov    %esp,%ebp
 86e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 871:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 878:	77 07                	ja     881 <morecore+0x16>
    nu = 4096;
 87a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 881:	8b 45 08             	mov    0x8(%ebp),%eax
 884:	c1 e0 03             	shl    $0x3,%eax
 887:	89 04 24             	mov    %eax,(%esp)
 88a:	e8 4d fc ff ff       	call   4dc <sbrk>
 88f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 892:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 896:	75 07                	jne    89f <morecore+0x34>
    return 0;
 898:	b8 00 00 00 00       	mov    $0x0,%eax
 89d:	eb 22                	jmp    8c1 <morecore+0x56>
  hp = (Header*)p;
 89f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 8a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a8:	8b 55 08             	mov    0x8(%ebp),%edx
 8ab:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b1:	83 c0 08             	add    $0x8,%eax
 8b4:	89 04 24             	mov    %eax,(%esp)
 8b7:	e8 d8 fe ff ff       	call   794 <free>
  return freep;
 8bc:	a1 20 0a 00 00       	mov    0xa20,%eax
}
 8c1:	c9                   	leave  
 8c2:	c3                   	ret    

000008c3 <malloc>:

void*
malloc(uint nbytes)
{
 8c3:	55                   	push   %ebp
 8c4:	89 e5                	mov    %esp,%ebp
 8c6:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c9:	8b 45 08             	mov    0x8(%ebp),%eax
 8cc:	83 c0 07             	add    $0x7,%eax
 8cf:	c1 e8 03             	shr    $0x3,%eax
 8d2:	83 c0 01             	add    $0x1,%eax
 8d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 8d8:	a1 20 0a 00 00       	mov    0xa20,%eax
 8dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8e0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8e4:	75 23                	jne    909 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8e6:	c7 45 f0 18 0a 00 00 	movl   $0xa18,-0x10(%ebp)
 8ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f0:	a3 20 0a 00 00       	mov    %eax,0xa20
 8f5:	a1 20 0a 00 00       	mov    0xa20,%eax
 8fa:	a3 18 0a 00 00       	mov    %eax,0xa18
    base.s.size = 0;
 8ff:	c7 05 1c 0a 00 00 00 	movl   $0x0,0xa1c
 906:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 909:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90c:	8b 00                	mov    (%eax),%eax
 90e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 911:	8b 45 ec             	mov    -0x14(%ebp),%eax
 914:	8b 40 04             	mov    0x4(%eax),%eax
 917:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 91a:	72 4d                	jb     969 <malloc+0xa6>
      if(p->s.size == nunits)
 91c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 91f:	8b 40 04             	mov    0x4(%eax),%eax
 922:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 925:	75 0c                	jne    933 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 927:	8b 45 ec             	mov    -0x14(%ebp),%eax
 92a:	8b 10                	mov    (%eax),%edx
 92c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92f:	89 10                	mov    %edx,(%eax)
 931:	eb 26                	jmp    959 <malloc+0x96>
      else {
        p->s.size -= nunits;
 933:	8b 45 ec             	mov    -0x14(%ebp),%eax
 936:	8b 40 04             	mov    0x4(%eax),%eax
 939:	89 c2                	mov    %eax,%edx
 93b:	2b 55 f4             	sub    -0xc(%ebp),%edx
 93e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 941:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 944:	8b 45 ec             	mov    -0x14(%ebp),%eax
 947:	8b 40 04             	mov    0x4(%eax),%eax
 94a:	c1 e0 03             	shl    $0x3,%eax
 94d:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 950:	8b 45 ec             	mov    -0x14(%ebp),%eax
 953:	8b 55 f4             	mov    -0xc(%ebp),%edx
 956:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 959:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95c:	a3 20 0a 00 00       	mov    %eax,0xa20
      return (void*)(p + 1);
 961:	8b 45 ec             	mov    -0x14(%ebp),%eax
 964:	83 c0 08             	add    $0x8,%eax
 967:	eb 38                	jmp    9a1 <malloc+0xde>
    }
    if(p == freep)
 969:	a1 20 0a 00 00       	mov    0xa20,%eax
 96e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 971:	75 1b                	jne    98e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 973:	8b 45 f4             	mov    -0xc(%ebp),%eax
 976:	89 04 24             	mov    %eax,(%esp)
 979:	e8 ed fe ff ff       	call   86b <morecore>
 97e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 981:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 985:	75 07                	jne    98e <malloc+0xcb>
        return 0;
 987:	b8 00 00 00 00       	mov    $0x0,%eax
 98c:	eb 13                	jmp    9a1 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 991:	89 45 f0             	mov    %eax,-0x10(%ebp)
 994:	8b 45 ec             	mov    -0x14(%ebp),%eax
 997:	8b 00                	mov    (%eax),%eax
 999:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 99c:	e9 70 ff ff ff       	jmp    911 <malloc+0x4e>
}
 9a1:	c9                   	leave  
 9a2:	c3                   	ret    
