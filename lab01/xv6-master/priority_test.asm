
_priority_test:     file format elf32-i386


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
   9:	e8 5e 04 00 00       	call   46c <getpid>
   e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    int pid = fork();
  12:	e8 c5 03 00 00       	call   3dc <fork>
  17:	89 44 24 20          	mov    %eax,0x20(%esp)
    if(pid > 0){
  1b:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
  20:	0f 8e b7 00 00 00    	jle    dd <main+0xdd>
        for(i = 0; i < 10 && pid > 0; i++){
  26:	c7 44 24 18 00 00 00 	movl   $0x0,0x18(%esp)
  2d:	00 
  2e:	eb 30                	jmp    60 <main+0x60>
            pid = fork();
  30:	e8 a7 03 00 00       	call   3dc <fork>
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
  47:	c7 44 24 04 3c 09 00 	movl   $0x93c,0x4(%esp)
  4e:	00 
  4f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  56:	e8 1a 05 00 00       	call   575 <printf>
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
  76:	0f 85 90 00 00 00    	jne    10c <main+0x10c>
            int j = 0;
  7c:	c7 44 24 28 00 00 00 	movl   $0x0,0x28(%esp)
  83:	00 
            if(getpid() == begin+8){
  84:	e8 e3 03 00 00       	call   46c <getpid>
  89:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  8d:	83 c2 08             	add    $0x8,%edx
  90:	39 d0                	cmp    %edx,%eax
  92:	75 29                	jne    bd <main+0xbd>
                printf(1," pid = %d, get higher priority\n\n",getpid());
  94:	e8 d3 03 00 00       	call   46c <getpid>
  99:	89 44 24 08          	mov    %eax,0x8(%esp)
  9d:	c7 44 24 04 4c 09 00 	movl   $0x94c,0x4(%esp)
  a4:	00 
  a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ac:	e8 c4 04 00 00       	call   575 <printf>
                change_priority(33);
  b1:	c7 04 24 21 00 00 00 	movl   $0x21,(%esp)
  b8:	e8 d7 03 00 00       	call   494 <change_priority>
            }
            while(j++ < 30000000);
  bd:	81 7c 24 28 7f c3 c9 	cmpl   $0x1c9c37f,0x28(%esp)
  c4:	01 
  c5:	0f 9e c0             	setle  %al
  c8:	83 44 24 28 01       	addl   $0x1,0x28(%esp)
  cd:	84 c0                	test   %al,%al
  cf:	75 ec                	jne    bd <main+0xbd>
            exit(0);
  d1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  d8:	e8 07 03 00 00       	call   3e4 <exit>
        }
    }else if(pid == 0){
  dd:	83 7c 24 20 00       	cmpl   $0x0,0x20(%esp)
  e2:	75 28                	jne    10c <main+0x10c>
       // sleep(100);
        int j = 0;
  e4:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%esp)
  eb:	00 
        while(j++ < 30000000);
  ec:	81 7c 24 2c 7f c3 c9 	cmpl   $0x1c9c37f,0x2c(%esp)
  f3:	01 
  f4:	0f 9e c0             	setle  %al
  f7:	83 44 24 2c 01       	addl   $0x1,0x2c(%esp)
  fc:	84 c0                	test   %al,%al
  fe:	75 ec                	jne    ec <main+0xec>
        exit(0);
 100:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 107:	e8 d8 02 00 00       	call   3e4 <exit>
    }
    int ki = 1;
 10c:	c7 44 24 24 01 00 00 	movl   $0x1,0x24(%esp)
 113:	00 
    int status;
    while(ki >= 0){
 114:	eb 57                	jmp    16d <main+0x16d>
        ki = wait(&status);
 116:	8d 44 24 14          	lea    0x14(%esp),%eax
 11a:	89 04 24             	mov    %eax,(%esp)
 11d:	e8 ca 02 00 00       	call   3ec <wait>
 122:	89 44 24 24          	mov    %eax,0x24(%esp)
        if(ki == begin+8)
 126:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 12a:	83 c0 08             	add    $0x8,%eax
 12d:	3b 44 24 24          	cmp    0x24(%esp),%eax
 131:	75 1e                	jne    151 <main+0x151>
            printf(1," [%d] I should be done first\n",ki);
 133:	8b 44 24 24          	mov    0x24(%esp),%eax
 137:	89 44 24 08          	mov    %eax,0x8(%esp)
 13b:	c7 44 24 04 6d 09 00 	movl   $0x96d,0x4(%esp)
 142:	00 
 143:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 14a:	e8 26 04 00 00       	call   575 <printf>
 14f:	eb 1c                	jmp    16d <main+0x16d>
        else
            printf(1," [%d] done runing\n",ki);
 151:	8b 44 24 24          	mov    0x24(%esp),%eax
 155:	89 44 24 08          	mov    %eax,0x8(%esp)
 159:	c7 44 24 04 8b 09 00 	movl   $0x98b,0x4(%esp)
 160:	00 
 161:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 168:	e8 08 04 00 00       	call   575 <printf>
        while(j++ < 30000000);
        exit(0);
    }
    int ki = 1;
    int status;
    while(ki >= 0){
 16d:	83 7c 24 24 00       	cmpl   $0x0,0x24(%esp)
 172:	79 a2                	jns    116 <main+0x116>
        if(ki == begin+8)
            printf(1," [%d] I should be done first\n",ki);
        else
            printf(1," [%d] done runing\n",ki);
    }
    exit(0);
 174:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 17b:	e8 64 02 00 00       	call   3e4 <exit>

00000180 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 180:	55                   	push   %ebp
 181:	89 e5                	mov    %esp,%ebp
 183:	57                   	push   %edi
 184:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 185:	8b 4d 08             	mov    0x8(%ebp),%ecx
 188:	8b 55 10             	mov    0x10(%ebp),%edx
 18b:	8b 45 0c             	mov    0xc(%ebp),%eax
 18e:	89 cb                	mov    %ecx,%ebx
 190:	89 df                	mov    %ebx,%edi
 192:	89 d1                	mov    %edx,%ecx
 194:	fc                   	cld    
 195:	f3 aa                	rep stos %al,%es:(%edi)
 197:	89 ca                	mov    %ecx,%edx
 199:	89 fb                	mov    %edi,%ebx
 19b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 19e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1a1:	5b                   	pop    %ebx
 1a2:	5f                   	pop    %edi
 1a3:	5d                   	pop    %ebp
 1a4:	c3                   	ret    

000001a5 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1a5:	55                   	push   %ebp
 1a6:	89 e5                	mov    %esp,%ebp
 1a8:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1ab:	8b 45 08             	mov    0x8(%ebp),%eax
 1ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b4:	0f b6 10             	movzbl (%eax),%edx
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	88 10                	mov    %dl,(%eax)
 1bc:	8b 45 08             	mov    0x8(%ebp),%eax
 1bf:	0f b6 00             	movzbl (%eax),%eax
 1c2:	84 c0                	test   %al,%al
 1c4:	0f 95 c0             	setne  %al
 1c7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1cb:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 1cf:	84 c0                	test   %al,%al
 1d1:	75 de                	jne    1b1 <strcpy+0xc>
    ;
  return os;
 1d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1d6:	c9                   	leave  
 1d7:	c3                   	ret    

000001d8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1db:	eb 08                	jmp    1e5 <strcmp+0xd>
    p++, q++;
 1dd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1e1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	0f b6 00             	movzbl (%eax),%eax
 1eb:	84 c0                	test   %al,%al
 1ed:	74 10                	je     1ff <strcmp+0x27>
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
 1f2:	0f b6 10             	movzbl (%eax),%edx
 1f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f8:	0f b6 00             	movzbl (%eax),%eax
 1fb:	38 c2                	cmp    %al,%dl
 1fd:	74 de                	je     1dd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1ff:	8b 45 08             	mov    0x8(%ebp),%eax
 202:	0f b6 00             	movzbl (%eax),%eax
 205:	0f b6 d0             	movzbl %al,%edx
 208:	8b 45 0c             	mov    0xc(%ebp),%eax
 20b:	0f b6 00             	movzbl (%eax),%eax
 20e:	0f b6 c0             	movzbl %al,%eax
 211:	89 d1                	mov    %edx,%ecx
 213:	29 c1                	sub    %eax,%ecx
 215:	89 c8                	mov    %ecx,%eax
}
 217:	5d                   	pop    %ebp
 218:	c3                   	ret    

00000219 <strlen>:

uint
strlen(char *s)
{
 219:	55                   	push   %ebp
 21a:	89 e5                	mov    %esp,%ebp
 21c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 21f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 226:	eb 04                	jmp    22c <strlen+0x13>
 228:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 22c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 22f:	03 45 08             	add    0x8(%ebp),%eax
 232:	0f b6 00             	movzbl (%eax),%eax
 235:	84 c0                	test   %al,%al
 237:	75 ef                	jne    228 <strlen+0xf>
    ;
  return n;
 239:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 23c:	c9                   	leave  
 23d:	c3                   	ret    

0000023e <memset>:

void*
memset(void *dst, int c, uint n)
{
 23e:	55                   	push   %ebp
 23f:	89 e5                	mov    %esp,%ebp
 241:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 244:	8b 45 10             	mov    0x10(%ebp),%eax
 247:	89 44 24 08          	mov    %eax,0x8(%esp)
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	89 44 24 04          	mov    %eax,0x4(%esp)
 252:	8b 45 08             	mov    0x8(%ebp),%eax
 255:	89 04 24             	mov    %eax,(%esp)
 258:	e8 23 ff ff ff       	call   180 <stosb>
  return dst;
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 260:	c9                   	leave  
 261:	c3                   	ret    

00000262 <strchr>:

char*
strchr(const char *s, char c)
{
 262:	55                   	push   %ebp
 263:	89 e5                	mov    %esp,%ebp
 265:	83 ec 04             	sub    $0x4,%esp
 268:	8b 45 0c             	mov    0xc(%ebp),%eax
 26b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 26e:	eb 14                	jmp    284 <strchr+0x22>
    if(*s == c)
 270:	8b 45 08             	mov    0x8(%ebp),%eax
 273:	0f b6 00             	movzbl (%eax),%eax
 276:	3a 45 fc             	cmp    -0x4(%ebp),%al
 279:	75 05                	jne    280 <strchr+0x1e>
      return (char*)s;
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	eb 13                	jmp    293 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 280:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 284:	8b 45 08             	mov    0x8(%ebp),%eax
 287:	0f b6 00             	movzbl (%eax),%eax
 28a:	84 c0                	test   %al,%al
 28c:	75 e2                	jne    270 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 28e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 293:	c9                   	leave  
 294:	c3                   	ret    

00000295 <gets>:

char*
gets(char *buf, int max)
{
 295:	55                   	push   %ebp
 296:	89 e5                	mov    %esp,%ebp
 298:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 29b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 2a2:	eb 44                	jmp    2e8 <gets+0x53>
    cc = read(0, &c, 1);
 2a4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2ab:	00 
 2ac:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2af:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2ba:	e8 45 01 00 00       	call   404 <read>
 2bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 2c2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2c6:	7e 2d                	jle    2f5 <gets+0x60>
      break;
    buf[i++] = c;
 2c8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2cb:	03 45 08             	add    0x8(%ebp),%eax
 2ce:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 2d2:	88 10                	mov    %dl,(%eax)
 2d4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 2d8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2dc:	3c 0a                	cmp    $0xa,%al
 2de:	74 16                	je     2f6 <gets+0x61>
 2e0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2e4:	3c 0d                	cmp    $0xd,%al
 2e6:	74 0e                	je     2f6 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2eb:	83 c0 01             	add    $0x1,%eax
 2ee:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2f1:	7c b1                	jl     2a4 <gets+0xf>
 2f3:	eb 01                	jmp    2f6 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 2f5:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2f9:	03 45 08             	add    0x8(%ebp),%eax
 2fc:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2ff:	8b 45 08             	mov    0x8(%ebp),%eax
}
 302:	c9                   	leave  
 303:	c3                   	ret    

00000304 <stat>:

int
stat(char *n, struct stat *st)
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 30a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 311:	00 
 312:	8b 45 08             	mov    0x8(%ebp),%eax
 315:	89 04 24             	mov    %eax,(%esp)
 318:	e8 0f 01 00 00       	call   42c <open>
 31d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 320:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 324:	79 07                	jns    32d <stat+0x29>
    return -1;
 326:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 32b:	eb 23                	jmp    350 <stat+0x4c>
  r = fstat(fd, st);
 32d:	8b 45 0c             	mov    0xc(%ebp),%eax
 330:	89 44 24 04          	mov    %eax,0x4(%esp)
 334:	8b 45 f0             	mov    -0x10(%ebp),%eax
 337:	89 04 24             	mov    %eax,(%esp)
 33a:	e8 05 01 00 00       	call   444 <fstat>
 33f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 342:	8b 45 f0             	mov    -0x10(%ebp),%eax
 345:	89 04 24             	mov    %eax,(%esp)
 348:	e8 c7 00 00 00       	call   414 <close>
  return r;
 34d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 350:	c9                   	leave  
 351:	c3                   	ret    

00000352 <atoi>:

int
atoi(const char *s)
{
 352:	55                   	push   %ebp
 353:	89 e5                	mov    %esp,%ebp
 355:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 358:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 35f:	eb 24                	jmp    385 <atoi+0x33>
    n = n*10 + *s++ - '0';
 361:	8b 55 fc             	mov    -0x4(%ebp),%edx
 364:	89 d0                	mov    %edx,%eax
 366:	c1 e0 02             	shl    $0x2,%eax
 369:	01 d0                	add    %edx,%eax
 36b:	01 c0                	add    %eax,%eax
 36d:	89 c2                	mov    %eax,%edx
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	0f b6 00             	movzbl (%eax),%eax
 375:	0f be c0             	movsbl %al,%eax
 378:	8d 04 02             	lea    (%edx,%eax,1),%eax
 37b:	83 e8 30             	sub    $0x30,%eax
 37e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 381:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 385:	8b 45 08             	mov    0x8(%ebp),%eax
 388:	0f b6 00             	movzbl (%eax),%eax
 38b:	3c 2f                	cmp    $0x2f,%al
 38d:	7e 0a                	jle    399 <atoi+0x47>
 38f:	8b 45 08             	mov    0x8(%ebp),%eax
 392:	0f b6 00             	movzbl (%eax),%eax
 395:	3c 39                	cmp    $0x39,%al
 397:	7e c8                	jle    361 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 399:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 39c:	c9                   	leave  
 39d:	c3                   	ret    

0000039e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 39e:	55                   	push   %ebp
 39f:	89 e5                	mov    %esp,%ebp
 3a1:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3a4:	8b 45 08             	mov    0x8(%ebp),%eax
 3a7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 3aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ad:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 3b0:	eb 13                	jmp    3c5 <memmove+0x27>
    *dst++ = *src++;
 3b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3b5:	0f b6 10             	movzbl (%eax),%edx
 3b8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3bb:	88 10                	mov    %dl,(%eax)
 3bd:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 3c1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3c5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 3c9:	0f 9f c0             	setg   %al
 3cc:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 3d0:	84 c0                	test   %al,%al
 3d2:	75 de                	jne    3b2 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 3d4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3d7:	c9                   	leave  
 3d8:	c3                   	ret    
 3d9:	90                   	nop
 3da:	90                   	nop
 3db:	90                   	nop

000003dc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3dc:	b8 01 00 00 00       	mov    $0x1,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <exit>:
SYSCALL(exit)
 3e4:	b8 02 00 00 00       	mov    $0x2,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <wait>:
SYSCALL(wait)
 3ec:	b8 03 00 00 00       	mov    $0x3,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <waitpid>:
SYSCALL(waitpid)
 3f4:	b8 17 00 00 00       	mov    $0x17,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <pipe>:
SYSCALL(pipe)
 3fc:	b8 04 00 00 00       	mov    $0x4,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <read>:
SYSCALL(read)
 404:	b8 05 00 00 00       	mov    $0x5,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <write>:
SYSCALL(write)
 40c:	b8 10 00 00 00       	mov    $0x10,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <close>:
SYSCALL(close)
 414:	b8 15 00 00 00       	mov    $0x15,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <kill>:
SYSCALL(kill)
 41c:	b8 06 00 00 00       	mov    $0x6,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <exec>:
SYSCALL(exec)
 424:	b8 07 00 00 00       	mov    $0x7,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <open>:
SYSCALL(open)
 42c:	b8 0f 00 00 00       	mov    $0xf,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <mknod>:
SYSCALL(mknod)
 434:	b8 11 00 00 00       	mov    $0x11,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <unlink>:
SYSCALL(unlink)
 43c:	b8 12 00 00 00       	mov    $0x12,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <fstat>:
SYSCALL(fstat)
 444:	b8 08 00 00 00       	mov    $0x8,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <link>:
SYSCALL(link)
 44c:	b8 13 00 00 00       	mov    $0x13,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <mkdir>:
SYSCALL(mkdir)
 454:	b8 14 00 00 00       	mov    $0x14,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <chdir>:
SYSCALL(chdir)
 45c:	b8 09 00 00 00       	mov    $0x9,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <dup>:
SYSCALL(dup)
 464:	b8 0a 00 00 00       	mov    $0xa,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <getpid>:
SYSCALL(getpid)
 46c:	b8 0b 00 00 00       	mov    $0xb,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <sbrk>:
SYSCALL(sbrk)
 474:	b8 0c 00 00 00       	mov    $0xc,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <sleep>:
SYSCALL(sleep)
 47c:	b8 0d 00 00 00       	mov    $0xd,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <uptime>:
SYSCALL(uptime)
 484:	b8 0e 00 00 00       	mov    $0xe,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <count>:
SYSCALL(count)
 48c:	b8 16 00 00 00       	mov    $0x16,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <change_priority>:
SYSCALL(change_priority)
 494:	b8 18 00 00 00       	mov    $0x18,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 49c:	55                   	push   %ebp
 49d:	89 e5                	mov    %esp,%ebp
 49f:	83 ec 28             	sub    $0x28,%esp
 4a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4af:	00 
 4b0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ba:	89 04 24             	mov    %eax,(%esp)
 4bd:	e8 4a ff ff ff       	call   40c <write>
}
 4c2:	c9                   	leave  
 4c3:	c3                   	ret    

000004c4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4c4:	55                   	push   %ebp
 4c5:	89 e5                	mov    %esp,%ebp
 4c7:	53                   	push   %ebx
 4c8:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4d2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4d6:	74 17                	je     4ef <printint+0x2b>
 4d8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4dc:	79 11                	jns    4ef <printint+0x2b>
    neg = 1;
 4de:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e8:	f7 d8                	neg    %eax
 4ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4ed:	eb 06                	jmp    4f5 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 4f5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 4fc:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 4ff:	8b 5d 10             	mov    0x10(%ebp),%ebx
 502:	8b 45 f4             	mov    -0xc(%ebp),%eax
 505:	ba 00 00 00 00       	mov    $0x0,%edx
 50a:	f7 f3                	div    %ebx
 50c:	89 d0                	mov    %edx,%eax
 50e:	0f b6 80 a8 09 00 00 	movzbl 0x9a8(%eax),%eax
 515:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 519:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 51d:	8b 45 10             	mov    0x10(%ebp),%eax
 520:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 523:	8b 45 f4             	mov    -0xc(%ebp),%eax
 526:	ba 00 00 00 00       	mov    $0x0,%edx
 52b:	f7 75 d4             	divl   -0x2c(%ebp)
 52e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 531:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 535:	75 c5                	jne    4fc <printint+0x38>
  if(neg)
 537:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 53b:	74 28                	je     565 <printint+0xa1>
    buf[i++] = '-';
 53d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 540:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 545:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 549:	eb 1a                	jmp    565 <printint+0xa1>
    putc(fd, buf[i]);
 54b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 54e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 553:	0f be c0             	movsbl %al,%eax
 556:	89 44 24 04          	mov    %eax,0x4(%esp)
 55a:	8b 45 08             	mov    0x8(%ebp),%eax
 55d:	89 04 24             	mov    %eax,(%esp)
 560:	e8 37 ff ff ff       	call   49c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 565:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 569:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 56d:	79 dc                	jns    54b <printint+0x87>
    putc(fd, buf[i]);
}
 56f:	83 c4 44             	add    $0x44,%esp
 572:	5b                   	pop    %ebx
 573:	5d                   	pop    %ebp
 574:	c3                   	ret    

00000575 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 575:	55                   	push   %ebp
 576:	89 e5                	mov    %esp,%ebp
 578:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 57b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 582:	8d 45 0c             	lea    0xc(%ebp),%eax
 585:	83 c0 04             	add    $0x4,%eax
 588:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 58b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 592:	e9 7e 01 00 00       	jmp    715 <printf+0x1a0>
    c = fmt[i] & 0xff;
 597:	8b 55 0c             	mov    0xc(%ebp),%edx
 59a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 59d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5a0:	0f b6 00             	movzbl (%eax),%eax
 5a3:	0f be c0             	movsbl %al,%eax
 5a6:	25 ff 00 00 00       	and    $0xff,%eax
 5ab:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 5ae:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5b2:	75 2c                	jne    5e0 <printf+0x6b>
      if(c == '%'){
 5b4:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5b8:	75 0c                	jne    5c6 <printf+0x51>
        state = '%';
 5ba:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 5c1:	e9 4b 01 00 00       	jmp    711 <printf+0x19c>
      } else {
        putc(fd, c);
 5c6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5c9:	0f be c0             	movsbl %al,%eax
 5cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d0:	8b 45 08             	mov    0x8(%ebp),%eax
 5d3:	89 04 24             	mov    %eax,(%esp)
 5d6:	e8 c1 fe ff ff       	call   49c <putc>
 5db:	e9 31 01 00 00       	jmp    711 <printf+0x19c>
      }
    } else if(state == '%'){
 5e0:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 5e4:	0f 85 27 01 00 00    	jne    711 <printf+0x19c>
      if(c == 'd'){
 5ea:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 5ee:	75 2d                	jne    61d <printf+0xa8>
        printint(fd, *ap, 10, 1);
 5f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f3:	8b 00                	mov    (%eax),%eax
 5f5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5fc:	00 
 5fd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 604:	00 
 605:	89 44 24 04          	mov    %eax,0x4(%esp)
 609:	8b 45 08             	mov    0x8(%ebp),%eax
 60c:	89 04 24             	mov    %eax,(%esp)
 60f:	e8 b0 fe ff ff       	call   4c4 <printint>
        ap++;
 614:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 618:	e9 ed 00 00 00       	jmp    70a <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 61d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 621:	74 06                	je     629 <printf+0xb4>
 623:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 627:	75 2d                	jne    656 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 629:	8b 45 f4             	mov    -0xc(%ebp),%eax
 62c:	8b 00                	mov    (%eax),%eax
 62e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 635:	00 
 636:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 63d:	00 
 63e:	89 44 24 04          	mov    %eax,0x4(%esp)
 642:	8b 45 08             	mov    0x8(%ebp),%eax
 645:	89 04 24             	mov    %eax,(%esp)
 648:	e8 77 fe ff ff       	call   4c4 <printint>
        ap++;
 64d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 651:	e9 b4 00 00 00       	jmp    70a <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 656:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 65a:	75 46                	jne    6a2 <printf+0x12d>
        s = (char*)*ap;
 65c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 65f:	8b 00                	mov    (%eax),%eax
 661:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 664:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 668:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 66c:	75 27                	jne    695 <printf+0x120>
          s = "(null)";
 66e:	c7 45 e4 9e 09 00 00 	movl   $0x99e,-0x1c(%ebp)
        while(*s != 0){
 675:	eb 1f                	jmp    696 <printf+0x121>
          putc(fd, *s);
 677:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 67a:	0f b6 00             	movzbl (%eax),%eax
 67d:	0f be c0             	movsbl %al,%eax
 680:	89 44 24 04          	mov    %eax,0x4(%esp)
 684:	8b 45 08             	mov    0x8(%ebp),%eax
 687:	89 04 24             	mov    %eax,(%esp)
 68a:	e8 0d fe ff ff       	call   49c <putc>
          s++;
 68f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 693:	eb 01                	jmp    696 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 695:	90                   	nop
 696:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 699:	0f b6 00             	movzbl (%eax),%eax
 69c:	84 c0                	test   %al,%al
 69e:	75 d7                	jne    677 <printf+0x102>
 6a0:	eb 68                	jmp    70a <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6a2:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 6a6:	75 1d                	jne    6c5 <printf+0x150>
        putc(fd, *ap);
 6a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ab:	8b 00                	mov    (%eax),%eax
 6ad:	0f be c0             	movsbl %al,%eax
 6b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b4:	8b 45 08             	mov    0x8(%ebp),%eax
 6b7:	89 04 24             	mov    %eax,(%esp)
 6ba:	e8 dd fd ff ff       	call   49c <putc>
        ap++;
 6bf:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 6c3:	eb 45                	jmp    70a <printf+0x195>
      } else if(c == '%'){
 6c5:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 6c9:	75 17                	jne    6e2 <printf+0x16d>
        putc(fd, c);
 6cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ce:	0f be c0             	movsbl %al,%eax
 6d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d5:	8b 45 08             	mov    0x8(%ebp),%eax
 6d8:	89 04 24             	mov    %eax,(%esp)
 6db:	e8 bc fd ff ff       	call   49c <putc>
 6e0:	eb 28                	jmp    70a <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6e2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6e9:	00 
 6ea:	8b 45 08             	mov    0x8(%ebp),%eax
 6ed:	89 04 24             	mov    %eax,(%esp)
 6f0:	e8 a7 fd ff ff       	call   49c <putc>
        putc(fd, c);
 6f5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6f8:	0f be c0             	movsbl %al,%eax
 6fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ff:	8b 45 08             	mov    0x8(%ebp),%eax
 702:	89 04 24             	mov    %eax,(%esp)
 705:	e8 92 fd ff ff       	call   49c <putc>
      }
      state = 0;
 70a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 711:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 715:	8b 55 0c             	mov    0xc(%ebp),%edx
 718:	8b 45 ec             	mov    -0x14(%ebp),%eax
 71b:	8d 04 02             	lea    (%edx,%eax,1),%eax
 71e:	0f b6 00             	movzbl (%eax),%eax
 721:	84 c0                	test   %al,%al
 723:	0f 85 6e fe ff ff    	jne    597 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 729:	c9                   	leave  
 72a:	c3                   	ret    
 72b:	90                   	nop

0000072c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 72c:	55                   	push   %ebp
 72d:	89 e5                	mov    %esp,%ebp
 72f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 732:	8b 45 08             	mov    0x8(%ebp),%eax
 735:	83 e8 08             	sub    $0x8,%eax
 738:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 73b:	a1 c4 09 00 00       	mov    0x9c4,%eax
 740:	89 45 fc             	mov    %eax,-0x4(%ebp)
 743:	eb 24                	jmp    769 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 745:	8b 45 fc             	mov    -0x4(%ebp),%eax
 748:	8b 00                	mov    (%eax),%eax
 74a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 74d:	77 12                	ja     761 <free+0x35>
 74f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 752:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 755:	77 24                	ja     77b <free+0x4f>
 757:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75a:	8b 00                	mov    (%eax),%eax
 75c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 75f:	77 1a                	ja     77b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	8b 00                	mov    (%eax),%eax
 766:	89 45 fc             	mov    %eax,-0x4(%ebp)
 769:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 76f:	76 d4                	jbe    745 <free+0x19>
 771:	8b 45 fc             	mov    -0x4(%ebp),%eax
 774:	8b 00                	mov    (%eax),%eax
 776:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 779:	76 ca                	jbe    745 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 77b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77e:	8b 40 04             	mov    0x4(%eax),%eax
 781:	c1 e0 03             	shl    $0x3,%eax
 784:	89 c2                	mov    %eax,%edx
 786:	03 55 f8             	add    -0x8(%ebp),%edx
 789:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78c:	8b 00                	mov    (%eax),%eax
 78e:	39 c2                	cmp    %eax,%edx
 790:	75 24                	jne    7b6 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 792:	8b 45 f8             	mov    -0x8(%ebp),%eax
 795:	8b 50 04             	mov    0x4(%eax),%edx
 798:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79b:	8b 00                	mov    (%eax),%eax
 79d:	8b 40 04             	mov    0x4(%eax),%eax
 7a0:	01 c2                	add    %eax,%edx
 7a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ab:	8b 00                	mov    (%eax),%eax
 7ad:	8b 10                	mov    (%eax),%edx
 7af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b2:	89 10                	mov    %edx,(%eax)
 7b4:	eb 0a                	jmp    7c0 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 7b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b9:	8b 10                	mov    (%eax),%edx
 7bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7be:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c3:	8b 40 04             	mov    0x4(%eax),%eax
 7c6:	c1 e0 03             	shl    $0x3,%eax
 7c9:	03 45 fc             	add    -0x4(%ebp),%eax
 7cc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cf:	75 20                	jne    7f1 <free+0xc5>
    p->s.size += bp->s.size;
 7d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d4:	8b 50 04             	mov    0x4(%eax),%edx
 7d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7da:	8b 40 04             	mov    0x4(%eax),%eax
 7dd:	01 c2                	add    %eax,%edx
 7df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e8:	8b 10                	mov    (%eax),%edx
 7ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ed:	89 10                	mov    %edx,(%eax)
 7ef:	eb 08                	jmp    7f9 <free+0xcd>
  } else
    p->s.ptr = bp;
 7f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7f7:	89 10                	mov    %edx,(%eax)
  freep = p;
 7f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fc:	a3 c4 09 00 00       	mov    %eax,0x9c4
}
 801:	c9                   	leave  
 802:	c3                   	ret    

00000803 <morecore>:

static Header*
morecore(uint nu)
{
 803:	55                   	push   %ebp
 804:	89 e5                	mov    %esp,%ebp
 806:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 809:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 810:	77 07                	ja     819 <morecore+0x16>
    nu = 4096;
 812:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 819:	8b 45 08             	mov    0x8(%ebp),%eax
 81c:	c1 e0 03             	shl    $0x3,%eax
 81f:	89 04 24             	mov    %eax,(%esp)
 822:	e8 4d fc ff ff       	call   474 <sbrk>
 827:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 82a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 82e:	75 07                	jne    837 <morecore+0x34>
    return 0;
 830:	b8 00 00 00 00       	mov    $0x0,%eax
 835:	eb 22                	jmp    859 <morecore+0x56>
  hp = (Header*)p;
 837:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 83d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 840:	8b 55 08             	mov    0x8(%ebp),%edx
 843:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 846:	8b 45 f4             	mov    -0xc(%ebp),%eax
 849:	83 c0 08             	add    $0x8,%eax
 84c:	89 04 24             	mov    %eax,(%esp)
 84f:	e8 d8 fe ff ff       	call   72c <free>
  return freep;
 854:	a1 c4 09 00 00       	mov    0x9c4,%eax
}
 859:	c9                   	leave  
 85a:	c3                   	ret    

0000085b <malloc>:

void*
malloc(uint nbytes)
{
 85b:	55                   	push   %ebp
 85c:	89 e5                	mov    %esp,%ebp
 85e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 861:	8b 45 08             	mov    0x8(%ebp),%eax
 864:	83 c0 07             	add    $0x7,%eax
 867:	c1 e8 03             	shr    $0x3,%eax
 86a:	83 c0 01             	add    $0x1,%eax
 86d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 870:	a1 c4 09 00 00       	mov    0x9c4,%eax
 875:	89 45 f0             	mov    %eax,-0x10(%ebp)
 878:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 87c:	75 23                	jne    8a1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 87e:	c7 45 f0 bc 09 00 00 	movl   $0x9bc,-0x10(%ebp)
 885:	8b 45 f0             	mov    -0x10(%ebp),%eax
 888:	a3 c4 09 00 00       	mov    %eax,0x9c4
 88d:	a1 c4 09 00 00       	mov    0x9c4,%eax
 892:	a3 bc 09 00 00       	mov    %eax,0x9bc
    base.s.size = 0;
 897:	c7 05 c0 09 00 00 00 	movl   $0x0,0x9c0
 89e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a4:	8b 00                	mov    (%eax),%eax
 8a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 8a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8ac:	8b 40 04             	mov    0x4(%eax),%eax
 8af:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8b2:	72 4d                	jb     901 <malloc+0xa6>
      if(p->s.size == nunits)
 8b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8b7:	8b 40 04             	mov    0x4(%eax),%eax
 8ba:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8bd:	75 0c                	jne    8cb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8c2:	8b 10                	mov    (%eax),%edx
 8c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c7:	89 10                	mov    %edx,(%eax)
 8c9:	eb 26                	jmp    8f1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8cb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8ce:	8b 40 04             	mov    0x4(%eax),%eax
 8d1:	89 c2                	mov    %eax,%edx
 8d3:	2b 55 f4             	sub    -0xc(%ebp),%edx
 8d6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8d9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8df:	8b 40 04             	mov    0x4(%eax),%eax
 8e2:	c1 e0 03             	shl    $0x3,%eax
 8e5:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 8e8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8eb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8ee:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f4:	a3 c4 09 00 00       	mov    %eax,0x9c4
      return (void*)(p + 1);
 8f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8fc:	83 c0 08             	add    $0x8,%eax
 8ff:	eb 38                	jmp    939 <malloc+0xde>
    }
    if(p == freep)
 901:	a1 c4 09 00 00       	mov    0x9c4,%eax
 906:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 909:	75 1b                	jne    926 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 90b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90e:	89 04 24             	mov    %eax,(%esp)
 911:	e8 ed fe ff ff       	call   803 <morecore>
 916:	89 45 ec             	mov    %eax,-0x14(%ebp)
 919:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 91d:	75 07                	jne    926 <malloc+0xcb>
        return 0;
 91f:	b8 00 00 00 00       	mov    $0x0,%eax
 924:	eb 13                	jmp    939 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 926:	8b 45 ec             	mov    -0x14(%ebp),%eax
 929:	89 45 f0             	mov    %eax,-0x10(%ebp)
 92c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 92f:	8b 00                	mov    (%eax),%eax
 931:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 934:	e9 70 ff ff ff       	jmp    8a9 <malloc+0x4e>
}
 939:	c9                   	leave  
 93a:	c3                   	ret    
