
_priority_test2:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fcntl.h"
#include "syscall.h"
#include "traps.h"
#include "memlayout.h"

int main(){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 30             	sub    $0x30,%esp
    int i;
    int begin = getpid();
   9:	e8 ca 04 00 00       	call   4d8 <getpid>
   e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    int pid = fork();
  12:	e8 31 04 00 00       	call   448 <fork>
  17:	89 44 24 20          	mov    %eax,0x20(%esp)
    if(pid > 0){
  1b:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
  20:	0f 8e f0 00 00 00    	jle    116 <main+0x116>
        for(i = 0; i < 10 && pid > 0; i++){
  26:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  2d:	00 
  2e:	eb 30                	jmp    60 <main+0x60>
            pid = fork();
  30:	e8 13 04 00 00       	call   448 <fork>
  35:	89 44 24 20          	mov    %eax,0x20(%esp)
            if(pid == 0){
  39:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
  3e:	74 30                	je     70 <main+0x70>
                break;
            }
            if(pid < 0)
  40:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
  45:	79 14                	jns    5b <main+0x5b>
                printf(1,"errors occur!\n");
  47:	c7 44 24 04 a8 09 00 	movl   $0x9a8,0x4(%esp)
  4e:	00 
  4f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  56:	e8 86 05 00 00       	call   5e1 <printf>
int main(){
    int i;
    int begin = getpid();
    int pid = fork();
    if(pid > 0){
        for(i = 0; i < 10 && pid > 0; i++){
  5b:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
  60:	83 7c 24 18 09       	cmpl   $0x9,0x18(%esp)
  65:	7f 0a                	jg     71 <main+0x71>
  67:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
  6c:	7f c2                	jg     30 <main+0x30>
  6e:	eb 01                	jmp    71 <main+0x71>
            pid = fork();
            if(pid == 0){
                break;
  70:	90                   	nop
            }
            if(pid < 0)
                printf(1,"errors occur!\n");
        }
        if (pid == 0){
  71:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
  76:	0f 85 c9 00 00 00    	jne    145 <main+0x145>
            int j = 0;
  7c:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  83:	00 
            if(getpid() == begin + 5){
  84:	e8 4f 04 00 00       	call   4d8 <getpid>
  89:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  8d:	83 c2 05             	add    $0x5,%edx
  90:	39 d0                	cmp    %edx,%eax
  92:	75 29                	jne    bd <main+0xbd>
                printf(1," pid = %d, get higher priority\n\n",getpid());
  94:	e8 3f 04 00 00       	call   4d8 <getpid>
  99:	89 44 24 08          	mov    %eax,0x8(%esp)
  9d:	c7 44 24 04 b8 09 00 	movl   $0x9b8,0x4(%esp)
  a4:	00 
  a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ac:	e8 30 05 00 00       	call   5e1 <printf>
                change_priority(33);
  b1:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
  b8:	e8 43 04 00 00       	call   500 <change_priority>
            }
            if(getpid() == begin + 8){
  bd:	e8 16 04 00 00       	call   4d8 <getpid>
  c2:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  c6:	83 c2 08             	add    $0x8,%edx
  c9:	39 d0                	cmp    %edx,%eax
  cb:	75 29                	jne    f6 <main+0xf6>
                printf(1," pid = %d, get higher priority\n\n",getpid());
  cd:	e8 06 04 00 00       	call   4d8 <getpid>
  d2:	89 44 24 08          	mov    %eax,0x8(%esp)
  d6:	c7 44 24 04 b8 09 00 	movl   $0x9b8,0x4(%esp)
  dd:	00 
  de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e5:	e8 f7 04 00 00       	call   5e1 <printf>
                change_priority(33);
  ea:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
  f1:	e8 0a 04 00 00       	call   500 <change_priority>
            }
            while(j++ < 30000000);
  f6:	81 7c 24 28 7f c3 c9 	cmpl   $0x1c9c37f,0x28(%esp)
  fd:	01 
  fe:	0f 9e c0             	setle  %al
 101:	83 44 24 28 01       	addl   $0x1,0x28(%esp)
 106:	84 c0                	test   %al,%al
 108:	75 ec                	jne    f6 <main+0xf6>
            exit(0);
 10a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 111:	e8 3a 03 00 00       	call   450 <exit>
        }
    }else if(pid == 0){
 116:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
 11b:	75 28                	jne    145 <main+0x145>
       // sleep(100);
        int j = 0;
 11d:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
 124:	00 
        while(j++ < 30000000);
 125:	81 7c 24 2c 7f c3 c9 	cmpl   $0x1c9c37f,0x2c(%esp)
 12c:	01 
 12d:	0f 9e c0             	setle  %al
 130:	83 44 24 2c 01       	addl   $0x1,0x2c(%esp)
 135:	84 c0                	test   %al,%al
 137:	75 ec                	jne    125 <main+0x125>
        exit(0);
 139:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 140:	e8 0b 03 00 00       	call   450 <exit>
    }
    int ki = 1;
 145:	c7 44 24 24 01 00 00 	movl   $0x1,0x24(%esp)
 14c:	00 
    int status;
    while(ki >= 0){
 14d:	e9 82 00 00 00       	jmp    1d4 <main+0x1d4>
        ki = wait(&status);
 152:	8d 44 24 14          	lea    0x14(%esp),%eax
 156:	89 04 24             	mov    %eax,(%esp)
 159:	e8 fa 02 00 00       	call   458 <wait>
 15e:	89 44 24 24          	mov    %eax,0x24(%esp)
        if(ki == begin+5)
 162:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 166:	83 c0 05             	add    $0x5,%eax
 169:	3b 44 24 24          	cmp    0x24(%esp),%eax
 16d:	75 1e                	jne    18d <main+0x18d>
            printf(1," [%d] I should be done first two\n",ki);
 16f:	8b 44 24 24          	mov    0x24(%esp),%eax
 173:	89 44 24 08          	mov    %eax,0x8(%esp)
 177:	c7 44 24 04 dc 09 00 	movl   $0x9dc,0x4(%esp)
 17e:	00 
 17f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 186:	e8 56 04 00 00       	call   5e1 <printf>
 18b:	eb 47                	jmp    1d4 <main+0x1d4>
        else if(ki == begin+8)
 18d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 191:	83 c0 08             	add    $0x8,%eax
 194:	3b 44 24 24          	cmp    0x24(%esp),%eax
 198:	75 1e                	jne    1b8 <main+0x1b8>
            printf(1," [%d] I should be done first two\n",ki);
 19a:	8b 44 24 24          	mov    0x24(%esp),%eax
 19e:	89 44 24 08          	mov    %eax,0x8(%esp)
 1a2:	c7 44 24 04 dc 09 00 	movl   $0x9dc,0x4(%esp)
 1a9:	00 
 1aa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1b1:	e8 2b 04 00 00       	call   5e1 <printf>
 1b6:	eb 1c                	jmp    1d4 <main+0x1d4>
        else
            printf(1," [%d] done runing\n",ki);
 1b8:	8b 44 24 24          	mov    0x24(%esp),%eax
 1bc:	89 44 24 08          	mov    %eax,0x8(%esp)
 1c0:	c7 44 24 04 fe 09 00 	movl   $0x9fe,0x4(%esp)
 1c7:	00 
 1c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1cf:	e8 0d 04 00 00       	call   5e1 <printf>
        while(j++ < 30000000);
        exit(0);
    }
    int ki = 1;
    int status;
    while(ki >= 0){
 1d4:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
 1d9:	0f 89 73 ff ff ff    	jns    152 <main+0x152>
            printf(1," [%d] I should be done first two\n",ki);
        else
            printf(1," [%d] done runing\n",ki);

    }
    exit(0);
 1df:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1e6:	e8 65 02 00 00       	call   450 <exit>
 1eb:	90                   	nop

000001ec <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	57                   	push   %edi
 1f0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1f1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1f4:	8b 55 10             	mov    0x10(%ebp),%edx
 1f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fa:	89 cb                	mov    %ecx,%ebx
 1fc:	89 df                	mov    %ebx,%edi
 1fe:	89 d1                	mov    %edx,%ecx
 200:	fc                   	cld    
 201:	f3 aa                	rep stos %al,%es:(%edi)
 203:	89 ca                	mov    %ecx,%edx
 205:	89 fb                	mov    %edi,%ebx
 207:	89 5d 08             	mov    %ebx,0x8(%ebp)
 20a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 20d:	5b                   	pop    %ebx
 20e:	5f                   	pop    %edi
 20f:	5d                   	pop    %ebp
 210:	c3                   	ret    

00000211 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 211:	55                   	push   %ebp
 212:	89 e5                	mov    %esp,%ebp
 214:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 217:	8b 45 08             	mov    0x8(%ebp),%eax
 21a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	0f b6 10             	movzbl (%eax),%edx
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	88 10                	mov    %dl,(%eax)
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	0f b6 00             	movzbl (%eax),%eax
 22e:	84 c0                	test   %al,%al
 230:	0f 95 c0             	setne  %al
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 237:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 23b:	84 c0                	test   %al,%al
 23d:	75 de                	jne    21d <strcpy+0xc>
    ;
  return os;
 23f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 242:	c9                   	leave  
 243:	c3                   	ret    

00000244 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 244:	55                   	push   %ebp
 245:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 247:	eb 08                	jmp    251 <strcmp+0xd>
    p++, q++;
 249:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 24d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 251:	8b 45 08             	mov    0x8(%ebp),%eax
 254:	0f b6 00             	movzbl (%eax),%eax
 257:	84 c0                	test   %al,%al
 259:	74 10                	je     26b <strcmp+0x27>
 25b:	8b 45 08             	mov    0x8(%ebp),%eax
 25e:	0f b6 10             	movzbl (%eax),%edx
 261:	8b 45 0c             	mov    0xc(%ebp),%eax
 264:	0f b6 00             	movzbl (%eax),%eax
 267:	38 c2                	cmp    %al,%dl
 269:	74 de                	je     249 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
 26e:	0f b6 00             	movzbl (%eax),%eax
 271:	0f b6 d0             	movzbl %al,%edx
 274:	8b 45 0c             	mov    0xc(%ebp),%eax
 277:	0f b6 00             	movzbl (%eax),%eax
 27a:	0f b6 c0             	movzbl %al,%eax
 27d:	89 d1                	mov    %edx,%ecx
 27f:	29 c1                	sub    %eax,%ecx
 281:	89 c8                	mov    %ecx,%eax
}
 283:	5d                   	pop    %ebp
 284:	c3                   	ret    

00000285 <strlen>:

uint
strlen(char *s)
{
 285:	55                   	push   %ebp
 286:	89 e5                	mov    %esp,%ebp
 288:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 28b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 292:	eb 04                	jmp    298 <strlen+0x13>
 294:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 298:	8b 45 fc             	mov    -0x4(%ebp),%eax
 29b:	03 45 08             	add    0x8(%ebp),%eax
 29e:	0f b6 00             	movzbl (%eax),%eax
 2a1:	84 c0                	test   %al,%al
 2a3:	75 ef                	jne    294 <strlen+0xf>
    ;
  return n;
 2a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a8:	c9                   	leave  
 2a9:	c3                   	ret    

000002aa <memset>:

void*
memset(void *dst, int c, uint n)
{
 2aa:	55                   	push   %ebp
 2ab:	89 e5                	mov    %esp,%ebp
 2ad:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2b0:	8b 45 10             	mov    0x10(%ebp),%eax
 2b3:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
 2c1:	89 04 24             	mov    %eax,(%esp)
 2c4:	e8 23 ff ff ff       	call   1ec <stosb>
  return dst;
 2c9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2cc:	c9                   	leave  
 2cd:	c3                   	ret    

000002ce <strchr>:

char*
strchr(const char *s, char c)
{
 2ce:	55                   	push   %ebp
 2cf:	89 e5                	mov    %esp,%ebp
 2d1:	83 ec 04             	sub    $0x4,%esp
 2d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2da:	eb 14                	jmp    2f0 <strchr+0x22>
    if(*s == c)
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
 2df:	0f b6 00             	movzbl (%eax),%eax
 2e2:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2e5:	75 05                	jne    2ec <strchr+0x1e>
      return (char*)s;
 2e7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ea:	eb 13                	jmp    2ff <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2ec:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2f0:	8b 45 08             	mov    0x8(%ebp),%eax
 2f3:	0f b6 00             	movzbl (%eax),%eax
 2f6:	84 c0                	test   %al,%al
 2f8:	75 e2                	jne    2dc <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2fa:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2ff:	c9                   	leave  
 300:	c3                   	ret    

00000301 <gets>:

char*
gets(char *buf, int max)
{
 301:	55                   	push   %ebp
 302:	89 e5                	mov    %esp,%ebp
 304:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 307:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 30e:	eb 44                	jmp    354 <gets+0x53>
    cc = read(0, &c, 1);
 310:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 317:	00 
 318:	8d 45 ef             	lea    -0x11(%ebp),%eax
 31b:	89 44 24 04          	mov    %eax,0x4(%esp)
 31f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 326:	e8 45 01 00 00       	call   470 <read>
 32b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 32e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 332:	7e 2d                	jle    361 <gets+0x60>
      break;
    buf[i++] = c;
 334:	8b 45 f0             	mov    -0x10(%ebp),%eax
 337:	03 45 08             	add    0x8(%ebp),%eax
 33a:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 33e:	88 10                	mov    %dl,(%eax)
 340:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 344:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 348:	3c 0a                	cmp    $0xa,%al
 34a:	74 16                	je     362 <gets+0x61>
 34c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 350:	3c 0d                	cmp    $0xd,%al
 352:	74 0e                	je     362 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 354:	8b 45 f0             	mov    -0x10(%ebp),%eax
 357:	83 c0 01             	add    $0x1,%eax
 35a:	3b 45 0c             	cmp    0xc(%ebp),%eax
 35d:	7c b1                	jl     310 <gets+0xf>
 35f:	eb 01                	jmp    362 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 361:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 362:	8b 45 f0             	mov    -0x10(%ebp),%eax
 365:	03 45 08             	add    0x8(%ebp),%eax
 368:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 36b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36e:	c9                   	leave  
 36f:	c3                   	ret    

00000370 <stat>:

int
stat(char *n, struct stat *st)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 376:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 37d:	00 
 37e:	8b 45 08             	mov    0x8(%ebp),%eax
 381:	89 04 24             	mov    %eax,(%esp)
 384:	e8 0f 01 00 00       	call   498 <open>
 389:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 38c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 390:	79 07                	jns    399 <stat+0x29>
    return -1;
 392:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 397:	eb 23                	jmp    3bc <stat+0x4c>
  r = fstat(fd, st);
 399:	8b 45 0c             	mov    0xc(%ebp),%eax
 39c:	89 44 24 04          	mov    %eax,0x4(%esp)
 3a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 3a3:	89 04 24             	mov    %eax,(%esp)
 3a6:	e8 05 01 00 00       	call   4b0 <fstat>
 3ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 3ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 3b1:	89 04 24             	mov    %eax,(%esp)
 3b4:	e8 c7 00 00 00       	call   480 <close>
  return r;
 3b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 3bc:	c9                   	leave  
 3bd:	c3                   	ret    

000003be <atoi>:

int
atoi(const char *s)
{
 3be:	55                   	push   %ebp
 3bf:	89 e5                	mov    %esp,%ebp
 3c1:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3cb:	eb 24                	jmp    3f1 <atoi+0x33>
    n = n*10 + *s++ - '0';
 3cd:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3d0:	89 d0                	mov    %edx,%eax
 3d2:	c1 e0 02             	shl    $0x2,%eax
 3d5:	01 d0                	add    %edx,%eax
 3d7:	01 c0                	add    %eax,%eax
 3d9:	89 c2                	mov    %eax,%edx
 3db:	8b 45 08             	mov    0x8(%ebp),%eax
 3de:	0f b6 00             	movzbl (%eax),%eax
 3e1:	0f be c0             	movsbl %al,%eax
 3e4:	8d 04 02             	lea    (%edx,%eax,1),%eax
 3e7:	83 e8 30             	sub    $0x30,%eax
 3ea:	89 45 fc             	mov    %eax,-0x4(%ebp)
 3ed:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3f1:	8b 45 08             	mov    0x8(%ebp),%eax
 3f4:	0f b6 00             	movzbl (%eax),%eax
 3f7:	3c 2f                	cmp    $0x2f,%al
 3f9:	7e 0a                	jle    405 <atoi+0x47>
 3fb:	8b 45 08             	mov    0x8(%ebp),%eax
 3fe:	0f b6 00             	movzbl (%eax),%eax
 401:	3c 39                	cmp    $0x39,%al
 403:	7e c8                	jle    3cd <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 405:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 408:	c9                   	leave  
 409:	c3                   	ret    

0000040a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 40a:	55                   	push   %ebp
 40b:	89 e5                	mov    %esp,%ebp
 40d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 410:	8b 45 08             	mov    0x8(%ebp),%eax
 413:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 416:	8b 45 0c             	mov    0xc(%ebp),%eax
 419:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 41c:	eb 13                	jmp    431 <memmove+0x27>
    *dst++ = *src++;
 41e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 421:	0f b6 10             	movzbl (%eax),%edx
 424:	8b 45 f8             	mov    -0x8(%ebp),%eax
 427:	88 10                	mov    %dl,(%eax)
 429:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 42d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 431:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 435:	0f 9f c0             	setg   %al
 438:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 43c:	84 c0                	test   %al,%al
 43e:	75 de                	jne    41e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 440:	8b 45 08             	mov    0x8(%ebp),%eax
}
 443:	c9                   	leave  
 444:	c3                   	ret    
 445:	90                   	nop
 446:	90                   	nop
 447:	90                   	nop

00000448 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 448:	b8 01 00 00 00       	mov    $0x1,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <exit>:
SYSCALL(exit)
 450:	b8 02 00 00 00       	mov    $0x2,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <wait>:
SYSCALL(wait)
 458:	b8 03 00 00 00       	mov    $0x3,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <waitpid>:
SYSCALL(waitpid)
 460:	b8 17 00 00 00       	mov    $0x17,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <pipe>:
SYSCALL(pipe)
 468:	b8 04 00 00 00       	mov    $0x4,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <read>:
SYSCALL(read)
 470:	b8 05 00 00 00       	mov    $0x5,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <write>:
SYSCALL(write)
 478:	b8 10 00 00 00       	mov    $0x10,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <close>:
SYSCALL(close)
 480:	b8 15 00 00 00       	mov    $0x15,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <kill>:
SYSCALL(kill)
 488:	b8 06 00 00 00       	mov    $0x6,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <exec>:
SYSCALL(exec)
 490:	b8 07 00 00 00       	mov    $0x7,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <open>:
SYSCALL(open)
 498:	b8 0f 00 00 00       	mov    $0xf,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <mknod>:
SYSCALL(mknod)
 4a0:	b8 11 00 00 00       	mov    $0x11,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <unlink>:
SYSCALL(unlink)
 4a8:	b8 12 00 00 00       	mov    $0x12,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <fstat>:
SYSCALL(fstat)
 4b0:	b8 08 00 00 00       	mov    $0x8,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <link>:
SYSCALL(link)
 4b8:	b8 13 00 00 00       	mov    $0x13,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <mkdir>:
SYSCALL(mkdir)
 4c0:	b8 14 00 00 00       	mov    $0x14,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <chdir>:
SYSCALL(chdir)
 4c8:	b8 09 00 00 00       	mov    $0x9,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <dup>:
SYSCALL(dup)
 4d0:	b8 0a 00 00 00       	mov    $0xa,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <getpid>:
SYSCALL(getpid)
 4d8:	b8 0b 00 00 00       	mov    $0xb,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <sbrk>:
SYSCALL(sbrk)
 4e0:	b8 0c 00 00 00       	mov    $0xc,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <sleep>:
SYSCALL(sleep)
 4e8:	b8 0d 00 00 00       	mov    $0xd,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <uptime>:
SYSCALL(uptime)
 4f0:	b8 0e 00 00 00       	mov    $0xe,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <count>:
SYSCALL(count)
 4f8:	b8 16 00 00 00       	mov    $0x16,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <change_priority>:
SYSCALL(change_priority)
 500:	b8 18 00 00 00       	mov    $0x18,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 508:	55                   	push   %ebp
 509:	89 e5                	mov    %esp,%ebp
 50b:	83 ec 28             	sub    $0x28,%esp
 50e:	8b 45 0c             	mov    0xc(%ebp),%eax
 511:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 514:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 51b:	00 
 51c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 51f:	89 44 24 04          	mov    %eax,0x4(%esp)
 523:	8b 45 08             	mov    0x8(%ebp),%eax
 526:	89 04 24             	mov    %eax,(%esp)
 529:	e8 4a ff ff ff       	call   478 <write>
}
 52e:	c9                   	leave  
 52f:	c3                   	ret    

00000530 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 530:	55                   	push   %ebp
 531:	89 e5                	mov    %esp,%ebp
 533:	53                   	push   %ebx
 534:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 537:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 53e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 542:	74 17                	je     55b <printint+0x2b>
 544:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 548:	79 11                	jns    55b <printint+0x2b>
    neg = 1;
 54a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 551:	8b 45 0c             	mov    0xc(%ebp),%eax
 554:	f7 d8                	neg    %eax
 556:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 559:	eb 06                	jmp    561 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 55b:	8b 45 0c             	mov    0xc(%ebp),%eax
 55e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 561:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 568:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 56b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 56e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 571:	ba 00 00 00 00       	mov    $0x0,%edx
 576:	f7 f3                	div    %ebx
 578:	89 d0                	mov    %edx,%eax
 57a:	0f b6 80 18 0a 00 00 	movzbl 0xa18(%eax),%eax
 581:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 585:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 589:	8b 45 10             	mov    0x10(%ebp),%eax
 58c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 58f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 592:	ba 00 00 00 00       	mov    $0x0,%edx
 597:	f7 75 d4             	divl   -0x2c(%ebp)
 59a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 59d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5a1:	75 c5                	jne    568 <printint+0x38>
  if(neg)
 5a3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5a7:	74 28                	je     5d1 <printint+0xa1>
    buf[i++] = '-';
 5a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5ac:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 5b1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 5b5:	eb 1a                	jmp    5d1 <printint+0xa1>
    putc(fd, buf[i]);
 5b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5ba:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 5bf:	0f be c0             	movsbl %al,%eax
 5c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c6:	8b 45 08             	mov    0x8(%ebp),%eax
 5c9:	89 04 24             	mov    %eax,(%esp)
 5cc:	e8 37 ff ff ff       	call   508 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5d1:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 5d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5d9:	79 dc                	jns    5b7 <printint+0x87>
    putc(fd, buf[i]);
}
 5db:	83 c4 44             	add    $0x44,%esp
 5de:	5b                   	pop    %ebx
 5df:	5d                   	pop    %ebp
 5e0:	c3                   	ret    

000005e1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5e1:	55                   	push   %ebp
 5e2:	89 e5                	mov    %esp,%ebp
 5e4:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5e7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5ee:	8d 45 0c             	lea    0xc(%ebp),%eax
 5f1:	83 c0 04             	add    $0x4,%eax
 5f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 5f7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 5fe:	e9 7e 01 00 00       	jmp    781 <printf+0x1a0>
    c = fmt[i] & 0xff;
 603:	8b 55 0c             	mov    0xc(%ebp),%edx
 606:	8b 45 ec             	mov    -0x14(%ebp),%eax
 609:	8d 04 02             	lea    (%edx,%eax,1),%eax
 60c:	0f b6 00             	movzbl (%eax),%eax
 60f:	0f be c0             	movsbl %al,%eax
 612:	25 ff 00 00 00       	and    $0xff,%eax
 617:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 61a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 61e:	75 2c                	jne    64c <printf+0x6b>
      if(c == '%'){
 620:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 624:	75 0c                	jne    632 <printf+0x51>
        state = '%';
 626:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 62d:	e9 4b 01 00 00       	jmp    77d <printf+0x19c>
      } else {
        putc(fd, c);
 632:	8b 45 e8             	mov    -0x18(%ebp),%eax
 635:	0f be c0             	movsbl %al,%eax
 638:	89 44 24 04          	mov    %eax,0x4(%esp)
 63c:	8b 45 08             	mov    0x8(%ebp),%eax
 63f:	89 04 24             	mov    %eax,(%esp)
 642:	e8 c1 fe ff ff       	call   508 <putc>
 647:	e9 31 01 00 00       	jmp    77d <printf+0x19c>
      }
    } else if(state == '%'){
 64c:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 650:	0f 85 27 01 00 00    	jne    77d <printf+0x19c>
      if(c == 'd'){
 656:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 65a:	75 2d                	jne    689 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 65c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 65f:	8b 00                	mov    (%eax),%eax
 661:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 668:	00 
 669:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 670:	00 
 671:	89 44 24 04          	mov    %eax,0x4(%esp)
 675:	8b 45 08             	mov    0x8(%ebp),%eax
 678:	89 04 24             	mov    %eax,(%esp)
 67b:	e8 b0 fe ff ff       	call   530 <printint>
        ap++;
 680:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 684:	e9 ed 00 00 00       	jmp    776 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 689:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 68d:	74 06                	je     695 <printf+0xb4>
 68f:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 693:	75 2d                	jne    6c2 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 695:	8b 45 f4             	mov    -0xc(%ebp),%eax
 698:	8b 00                	mov    (%eax),%eax
 69a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6a1:	00 
 6a2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6a9:	00 
 6aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ae:	8b 45 08             	mov    0x8(%ebp),%eax
 6b1:	89 04 24             	mov    %eax,(%esp)
 6b4:	e8 77 fe ff ff       	call   530 <printint>
        ap++;
 6b9:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6bd:	e9 b4 00 00 00       	jmp    776 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6c2:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 6c6:	75 46                	jne    70e <printf+0x12d>
        s = (char*)*ap;
 6c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6cb:	8b 00                	mov    (%eax),%eax
 6cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 6d0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 6d4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 6d8:	75 27                	jne    701 <printf+0x120>
          s = "(null)";
 6da:	c7 45 e4 11 0a 00 00 	movl   $0xa11,-0x1c(%ebp)
        while(*s != 0){
 6e1:	eb 1f                	jmp    702 <printf+0x121>
          putc(fd, *s);
 6e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6e6:	0f b6 00             	movzbl (%eax),%eax
 6e9:	0f be c0             	movsbl %al,%eax
 6ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f0:	8b 45 08             	mov    0x8(%ebp),%eax
 6f3:	89 04 24             	mov    %eax,(%esp)
 6f6:	e8 0d fe ff ff       	call   508 <putc>
          s++;
 6fb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 6ff:	eb 01                	jmp    702 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 701:	90                   	nop
 702:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 705:	0f b6 00             	movzbl (%eax),%eax
 708:	84 c0                	test   %al,%al
 70a:	75 d7                	jne    6e3 <printf+0x102>
 70c:	eb 68                	jmp    776 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 70e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 712:	75 1d                	jne    731 <printf+0x150>
        putc(fd, *ap);
 714:	8b 45 f4             	mov    -0xc(%ebp),%eax
 717:	8b 00                	mov    (%eax),%eax
 719:	0f be c0             	movsbl %al,%eax
 71c:	89 44 24 04          	mov    %eax,0x4(%esp)
 720:	8b 45 08             	mov    0x8(%ebp),%eax
 723:	89 04 24             	mov    %eax,(%esp)
 726:	e8 dd fd ff ff       	call   508 <putc>
        ap++;
 72b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 72f:	eb 45                	jmp    776 <printf+0x195>
      } else if(c == '%'){
 731:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 735:	75 17                	jne    74e <printf+0x16d>
        putc(fd, c);
 737:	8b 45 e8             	mov    -0x18(%ebp),%eax
 73a:	0f be c0             	movsbl %al,%eax
 73d:	89 44 24 04          	mov    %eax,0x4(%esp)
 741:	8b 45 08             	mov    0x8(%ebp),%eax
 744:	89 04 24             	mov    %eax,(%esp)
 747:	e8 bc fd ff ff       	call   508 <putc>
 74c:	eb 28                	jmp    776 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 74e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 755:	00 
 756:	8b 45 08             	mov    0x8(%ebp),%eax
 759:	89 04 24             	mov    %eax,(%esp)
 75c:	e8 a7 fd ff ff       	call   508 <putc>
        putc(fd, c);
 761:	8b 45 e8             	mov    -0x18(%ebp),%eax
 764:	0f be c0             	movsbl %al,%eax
 767:	89 44 24 04          	mov    %eax,0x4(%esp)
 76b:	8b 45 08             	mov    0x8(%ebp),%eax
 76e:	89 04 24             	mov    %eax,(%esp)
 771:	e8 92 fd ff ff       	call   508 <putc>
      }
      state = 0;
 776:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 77d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 781:	8b 55 0c             	mov    0xc(%ebp),%edx
 784:	8b 45 ec             	mov    -0x14(%ebp),%eax
 787:	8d 04 02             	lea    (%edx,%eax,1),%eax
 78a:	0f b6 00             	movzbl (%eax),%eax
 78d:	84 c0                	test   %al,%al
 78f:	0f 85 6e fe ff ff    	jne    603 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 795:	c9                   	leave  
 796:	c3                   	ret    
 797:	90                   	nop

00000798 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 798:	55                   	push   %ebp
 799:	89 e5                	mov    %esp,%ebp
 79b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 79e:	8b 45 08             	mov    0x8(%ebp),%eax
 7a1:	83 e8 08             	sub    $0x8,%eax
 7a4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a7:	a1 34 0a 00 00       	mov    0xa34,%eax
 7ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7af:	eb 24                	jmp    7d5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b4:	8b 00                	mov    (%eax),%eax
 7b6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b9:	77 12                	ja     7cd <free+0x35>
 7bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7be:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c1:	77 24                	ja     7e7 <free+0x4f>
 7c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c6:	8b 00                	mov    (%eax),%eax
 7c8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cb:	77 1a                	ja     7e7 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d0:	8b 00                	mov    (%eax),%eax
 7d2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7db:	76 d4                	jbe    7b1 <free+0x19>
 7dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e0:	8b 00                	mov    (%eax),%eax
 7e2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e5:	76 ca                	jbe    7b1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ea:	8b 40 04             	mov    0x4(%eax),%eax
 7ed:	c1 e0 03             	shl    $0x3,%eax
 7f0:	89 c2                	mov    %eax,%edx
 7f2:	03 55 f8             	add    -0x8(%ebp),%edx
 7f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f8:	8b 00                	mov    (%eax),%eax
 7fa:	39 c2                	cmp    %eax,%edx
 7fc:	75 24                	jne    822 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 7fe:	8b 45 f8             	mov    -0x8(%ebp),%eax
 801:	8b 50 04             	mov    0x4(%eax),%edx
 804:	8b 45 fc             	mov    -0x4(%ebp),%eax
 807:	8b 00                	mov    (%eax),%eax
 809:	8b 40 04             	mov    0x4(%eax),%eax
 80c:	01 c2                	add    %eax,%edx
 80e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 811:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 814:	8b 45 fc             	mov    -0x4(%ebp),%eax
 817:	8b 00                	mov    (%eax),%eax
 819:	8b 10                	mov    (%eax),%edx
 81b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81e:	89 10                	mov    %edx,(%eax)
 820:	eb 0a                	jmp    82c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 822:	8b 45 fc             	mov    -0x4(%ebp),%eax
 825:	8b 10                	mov    (%eax),%edx
 827:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 82c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82f:	8b 40 04             	mov    0x4(%eax),%eax
 832:	c1 e0 03             	shl    $0x3,%eax
 835:	03 45 fc             	add    -0x4(%ebp),%eax
 838:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 83b:	75 20                	jne    85d <free+0xc5>
    p->s.size += bp->s.size;
 83d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 840:	8b 50 04             	mov    0x4(%eax),%edx
 843:	8b 45 f8             	mov    -0x8(%ebp),%eax
 846:	8b 40 04             	mov    0x4(%eax),%eax
 849:	01 c2                	add    %eax,%edx
 84b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 851:	8b 45 f8             	mov    -0x8(%ebp),%eax
 854:	8b 10                	mov    (%eax),%edx
 856:	8b 45 fc             	mov    -0x4(%ebp),%eax
 859:	89 10                	mov    %edx,(%eax)
 85b:	eb 08                	jmp    865 <free+0xcd>
  } else
    p->s.ptr = bp;
 85d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 860:	8b 55 f8             	mov    -0x8(%ebp),%edx
 863:	89 10                	mov    %edx,(%eax)
  freep = p;
 865:	8b 45 fc             	mov    -0x4(%ebp),%eax
 868:	a3 34 0a 00 00       	mov    %eax,0xa34
}
 86d:	c9                   	leave  
 86e:	c3                   	ret    

0000086f <morecore>:

static Header*
morecore(uint nu)
{
 86f:	55                   	push   %ebp
 870:	89 e5                	mov    %esp,%ebp
 872:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 875:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 87c:	77 07                	ja     885 <morecore+0x16>
    nu = 4096;
 87e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 885:	8b 45 08             	mov    0x8(%ebp),%eax
 888:	c1 e0 03             	shl    $0x3,%eax
 88b:	89 04 24             	mov    %eax,(%esp)
 88e:	e8 4d fc ff ff       	call   4e0 <sbrk>
 893:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 896:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 89a:	75 07                	jne    8a3 <morecore+0x34>
    return 0;
 89c:	b8 00 00 00 00       	mov    $0x0,%eax
 8a1:	eb 22                	jmp    8c5 <morecore+0x56>
  hp = (Header*)p;
 8a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 8a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ac:	8b 55 08             	mov    0x8(%ebp),%edx
 8af:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b5:	83 c0 08             	add    $0x8,%eax
 8b8:	89 04 24             	mov    %eax,(%esp)
 8bb:	e8 d8 fe ff ff       	call   798 <free>
  return freep;
 8c0:	a1 34 0a 00 00       	mov    0xa34,%eax
}
 8c5:	c9                   	leave  
 8c6:	c3                   	ret    

000008c7 <malloc>:

void*
malloc(uint nbytes)
{
 8c7:	55                   	push   %ebp
 8c8:	89 e5                	mov    %esp,%ebp
 8ca:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8cd:	8b 45 08             	mov    0x8(%ebp),%eax
 8d0:	83 c0 07             	add    $0x7,%eax
 8d3:	c1 e8 03             	shr    $0x3,%eax
 8d6:	83 c0 01             	add    $0x1,%eax
 8d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 8dc:	a1 34 0a 00 00       	mov    0xa34,%eax
 8e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8e4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8e8:	75 23                	jne    90d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8ea:	c7 45 f0 2c 0a 00 00 	movl   $0xa2c,-0x10(%ebp)
 8f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f4:	a3 34 0a 00 00       	mov    %eax,0xa34
 8f9:	a1 34 0a 00 00       	mov    0xa34,%eax
 8fe:	a3 2c 0a 00 00       	mov    %eax,0xa2c
    base.s.size = 0;
 903:	c7 05 30 0a 00 00 00 	movl   $0x0,0xa30
 90a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 90d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 910:	8b 00                	mov    (%eax),%eax
 912:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 915:	8b 45 ec             	mov    -0x14(%ebp),%eax
 918:	8b 40 04             	mov    0x4(%eax),%eax
 91b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 91e:	72 4d                	jb     96d <malloc+0xa6>
      if(p->s.size == nunits)
 920:	8b 45 ec             	mov    -0x14(%ebp),%eax
 923:	8b 40 04             	mov    0x4(%eax),%eax
 926:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 929:	75 0c                	jne    937 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 92b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 92e:	8b 10                	mov    (%eax),%edx
 930:	8b 45 f0             	mov    -0x10(%ebp),%eax
 933:	89 10                	mov    %edx,(%eax)
 935:	eb 26                	jmp    95d <malloc+0x96>
      else {
        p->s.size -= nunits;
 937:	8b 45 ec             	mov    -0x14(%ebp),%eax
 93a:	8b 40 04             	mov    0x4(%eax),%eax
 93d:	89 c2                	mov    %eax,%edx
 93f:	2b 55 f4             	sub    -0xc(%ebp),%edx
 942:	8b 45 ec             	mov    -0x14(%ebp),%eax
 945:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 948:	8b 45 ec             	mov    -0x14(%ebp),%eax
 94b:	8b 40 04             	mov    0x4(%eax),%eax
 94e:	c1 e0 03             	shl    $0x3,%eax
 951:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 954:	8b 45 ec             	mov    -0x14(%ebp),%eax
 957:	8b 55 f4             	mov    -0xc(%ebp),%edx
 95a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 95d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 960:	a3 34 0a 00 00       	mov    %eax,0xa34
      return (void*)(p + 1);
 965:	8b 45 ec             	mov    -0x14(%ebp),%eax
 968:	83 c0 08             	add    $0x8,%eax
 96b:	eb 38                	jmp    9a5 <malloc+0xde>
    }
    if(p == freep)
 96d:	a1 34 0a 00 00       	mov    0xa34,%eax
 972:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 975:	75 1b                	jne    992 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 977:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97a:	89 04 24             	mov    %eax,(%esp)
 97d:	e8 ed fe ff ff       	call   86f <morecore>
 982:	89 45 ec             	mov    %eax,-0x14(%ebp)
 985:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 989:	75 07                	jne    992 <malloc+0xcb>
        return 0;
 98b:	b8 00 00 00 00       	mov    $0x0,%eax
 990:	eb 13                	jmp    9a5 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 992:	8b 45 ec             	mov    -0x14(%ebp),%eax
 995:	89 45 f0             	mov    %eax,-0x10(%ebp)
 998:	8b 45 ec             	mov    -0x14(%ebp),%eax
 99b:	8b 00                	mov    (%eax),%eax
 99d:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9a0:	e9 70 ff ff ff       	jmp    915 <malloc+0x4e>
}
 9a5:	c9                   	leave  
 9a6:	c3                   	ret    
