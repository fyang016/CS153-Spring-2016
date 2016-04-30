
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 7a 02 00 00       	call   288 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 0a 03 00 00       	call   328 <sleep>
  exit(0);
  1e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  25:	e8 66 02 00 00       	call   290 <exit>
  2a:	90                   	nop
  2b:	90                   	nop

0000002c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  2c:	55                   	push   %ebp
  2d:	89 e5                	mov    %esp,%ebp
  2f:	57                   	push   %edi
  30:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  31:	8b 4d 08             	mov    0x8(%ebp),%ecx
  34:	8b 55 10             	mov    0x10(%ebp),%edx
  37:	8b 45 0c             	mov    0xc(%ebp),%eax
  3a:	89 cb                	mov    %ecx,%ebx
  3c:	89 df                	mov    %ebx,%edi
  3e:	89 d1                	mov    %edx,%ecx
  40:	fc                   	cld    
  41:	f3 aa                	rep stos %al,%es:(%edi)
  43:	89 ca                	mov    %ecx,%edx
  45:	89 fb                	mov    %edi,%ebx
  47:	89 5d 08             	mov    %ebx,0x8(%ebp)
  4a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  4d:	5b                   	pop    %ebx
  4e:	5f                   	pop    %edi
  4f:	5d                   	pop    %ebp
  50:	c3                   	ret    

00000051 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  51:	55                   	push   %ebp
  52:	89 e5                	mov    %esp,%ebp
  54:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  57:	8b 45 08             	mov    0x8(%ebp),%eax
  5a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  5d:	8b 45 0c             	mov    0xc(%ebp),%eax
  60:	0f b6 10             	movzbl (%eax),%edx
  63:	8b 45 08             	mov    0x8(%ebp),%eax
  66:	88 10                	mov    %dl,(%eax)
  68:	8b 45 08             	mov    0x8(%ebp),%eax
  6b:	0f b6 00             	movzbl (%eax),%eax
  6e:	84 c0                	test   %al,%al
  70:	0f 95 c0             	setne  %al
  73:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  77:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  7b:	84 c0                	test   %al,%al
  7d:	75 de                	jne    5d <strcpy+0xc>
    ;
  return os;
  7f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  82:	c9                   	leave  
  83:	c3                   	ret    

00000084 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  87:	eb 08                	jmp    91 <strcmp+0xd>
    p++, q++;
  89:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  8d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  91:	8b 45 08             	mov    0x8(%ebp),%eax
  94:	0f b6 00             	movzbl (%eax),%eax
  97:	84 c0                	test   %al,%al
  99:	74 10                	je     ab <strcmp+0x27>
  9b:	8b 45 08             	mov    0x8(%ebp),%eax
  9e:	0f b6 10             	movzbl (%eax),%edx
  a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  a4:	0f b6 00             	movzbl (%eax),%eax
  a7:	38 c2                	cmp    %al,%dl
  a9:	74 de                	je     89 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  ab:	8b 45 08             	mov    0x8(%ebp),%eax
  ae:	0f b6 00             	movzbl (%eax),%eax
  b1:	0f b6 d0             	movzbl %al,%edx
  b4:	8b 45 0c             	mov    0xc(%ebp),%eax
  b7:	0f b6 00             	movzbl (%eax),%eax
  ba:	0f b6 c0             	movzbl %al,%eax
  bd:	89 d1                	mov    %edx,%ecx
  bf:	29 c1                	sub    %eax,%ecx
  c1:	89 c8                	mov    %ecx,%eax
}
  c3:	5d                   	pop    %ebp
  c4:	c3                   	ret    

000000c5 <strlen>:

uint
strlen(char *s)
{
  c5:	55                   	push   %ebp
  c6:	89 e5                	mov    %esp,%ebp
  c8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  cb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  d2:	eb 04                	jmp    d8 <strlen+0x13>
  d4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
  db:	03 45 08             	add    0x8(%ebp),%eax
  de:	0f b6 00             	movzbl (%eax),%eax
  e1:	84 c0                	test   %al,%al
  e3:	75 ef                	jne    d4 <strlen+0xf>
    ;
  return n;
  e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e8:	c9                   	leave  
  e9:	c3                   	ret    

000000ea <memset>:

void*
memset(void *dst, int c, uint n)
{
  ea:	55                   	push   %ebp
  eb:	89 e5                	mov    %esp,%ebp
  ed:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  f0:	8b 45 10             	mov    0x10(%ebp),%eax
  f3:	89 44 24 08          	mov    %eax,0x8(%esp)
  f7:	8b 45 0c             	mov    0xc(%ebp),%eax
  fa:	89 44 24 04          	mov    %eax,0x4(%esp)
  fe:	8b 45 08             	mov    0x8(%ebp),%eax
 101:	89 04 24             	mov    %eax,(%esp)
 104:	e8 23 ff ff ff       	call   2c <stosb>
  return dst;
 109:	8b 45 08             	mov    0x8(%ebp),%eax
}
 10c:	c9                   	leave  
 10d:	c3                   	ret    

0000010e <strchr>:

char*
strchr(const char *s, char c)
{
 10e:	55                   	push   %ebp
 10f:	89 e5                	mov    %esp,%ebp
 111:	83 ec 04             	sub    $0x4,%esp
 114:	8b 45 0c             	mov    0xc(%ebp),%eax
 117:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 11a:	eb 14                	jmp    130 <strchr+0x22>
    if(*s == c)
 11c:	8b 45 08             	mov    0x8(%ebp),%eax
 11f:	0f b6 00             	movzbl (%eax),%eax
 122:	3a 45 fc             	cmp    -0x4(%ebp),%al
 125:	75 05                	jne    12c <strchr+0x1e>
      return (char*)s;
 127:	8b 45 08             	mov    0x8(%ebp),%eax
 12a:	eb 13                	jmp    13f <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 12c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 130:	8b 45 08             	mov    0x8(%ebp),%eax
 133:	0f b6 00             	movzbl (%eax),%eax
 136:	84 c0                	test   %al,%al
 138:	75 e2                	jne    11c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 13a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 13f:	c9                   	leave  
 140:	c3                   	ret    

00000141 <gets>:

char*
gets(char *buf, int max)
{
 141:	55                   	push   %ebp
 142:	89 e5                	mov    %esp,%ebp
 144:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 147:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 14e:	eb 44                	jmp    194 <gets+0x53>
    cc = read(0, &c, 1);
 150:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 157:	00 
 158:	8d 45 ef             	lea    -0x11(%ebp),%eax
 15b:	89 44 24 04          	mov    %eax,0x4(%esp)
 15f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 166:	e8 45 01 00 00       	call   2b0 <read>
 16b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 16e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 172:	7e 2d                	jle    1a1 <gets+0x60>
      break;
    buf[i++] = c;
 174:	8b 45 f0             	mov    -0x10(%ebp),%eax
 177:	03 45 08             	add    0x8(%ebp),%eax
 17a:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 17e:	88 10                	mov    %dl,(%eax)
 180:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 184:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 188:	3c 0a                	cmp    $0xa,%al
 18a:	74 16                	je     1a2 <gets+0x61>
 18c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 190:	3c 0d                	cmp    $0xd,%al
 192:	74 0e                	je     1a2 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 194:	8b 45 f0             	mov    -0x10(%ebp),%eax
 197:	83 c0 01             	add    $0x1,%eax
 19a:	3b 45 0c             	cmp    0xc(%ebp),%eax
 19d:	7c b1                	jl     150 <gets+0xf>
 19f:	eb 01                	jmp    1a2 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1a1:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1a5:	03 45 08             	add    0x8(%ebp),%eax
 1a8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ab:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ae:	c9                   	leave  
 1af:	c3                   	ret    

000001b0 <stat>:

int
stat(char *n, struct stat *st)
{
 1b0:	55                   	push   %ebp
 1b1:	89 e5                	mov    %esp,%ebp
 1b3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1bd:	00 
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	89 04 24             	mov    %eax,(%esp)
 1c4:	e8 0f 01 00 00       	call   2d8 <open>
 1c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 1cc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1d0:	79 07                	jns    1d9 <stat+0x29>
    return -1;
 1d2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d7:	eb 23                	jmp    1fc <stat+0x4c>
  r = fstat(fd, st);
 1d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1e3:	89 04 24             	mov    %eax,(%esp)
 1e6:	e8 05 01 00 00       	call   2f0 <fstat>
 1eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 1ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1f1:	89 04 24             	mov    %eax,(%esp)
 1f4:	e8 c7 00 00 00       	call   2c0 <close>
  return r;
 1f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 1fc:	c9                   	leave  
 1fd:	c3                   	ret    

000001fe <atoi>:

int
atoi(const char *s)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 204:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 20b:	eb 24                	jmp    231 <atoi+0x33>
    n = n*10 + *s++ - '0';
 20d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 210:	89 d0                	mov    %edx,%eax
 212:	c1 e0 02             	shl    $0x2,%eax
 215:	01 d0                	add    %edx,%eax
 217:	01 c0                	add    %eax,%eax
 219:	89 c2                	mov    %eax,%edx
 21b:	8b 45 08             	mov    0x8(%ebp),%eax
 21e:	0f b6 00             	movzbl (%eax),%eax
 221:	0f be c0             	movsbl %al,%eax
 224:	8d 04 02             	lea    (%edx,%eax,1),%eax
 227:	83 e8 30             	sub    $0x30,%eax
 22a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 22d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 231:	8b 45 08             	mov    0x8(%ebp),%eax
 234:	0f b6 00             	movzbl (%eax),%eax
 237:	3c 2f                	cmp    $0x2f,%al
 239:	7e 0a                	jle    245 <atoi+0x47>
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	0f b6 00             	movzbl (%eax),%eax
 241:	3c 39                	cmp    $0x39,%al
 243:	7e c8                	jle    20d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 245:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 248:	c9                   	leave  
 249:	c3                   	ret    

0000024a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 24a:	55                   	push   %ebp
 24b:	89 e5                	mov    %esp,%ebp
 24d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 250:	8b 45 08             	mov    0x8(%ebp),%eax
 253:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 256:	8b 45 0c             	mov    0xc(%ebp),%eax
 259:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 25c:	eb 13                	jmp    271 <memmove+0x27>
    *dst++ = *src++;
 25e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 261:	0f b6 10             	movzbl (%eax),%edx
 264:	8b 45 f8             	mov    -0x8(%ebp),%eax
 267:	88 10                	mov    %dl,(%eax)
 269:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 26d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 271:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 275:	0f 9f c0             	setg   %al
 278:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 27c:	84 c0                	test   %al,%al
 27e:	75 de                	jne    25e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 280:	8b 45 08             	mov    0x8(%ebp),%eax
}
 283:	c9                   	leave  
 284:	c3                   	ret    
 285:	90                   	nop
 286:	90                   	nop
 287:	90                   	nop

00000288 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 288:	b8 01 00 00 00       	mov    $0x1,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <exit>:
SYSCALL(exit)
 290:	b8 02 00 00 00       	mov    $0x2,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <wait>:
SYSCALL(wait)
 298:	b8 03 00 00 00       	mov    $0x3,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <waitpid>:
SYSCALL(waitpid)
 2a0:	b8 17 00 00 00       	mov    $0x17,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <pipe>:
SYSCALL(pipe)
 2a8:	b8 04 00 00 00       	mov    $0x4,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <read>:
SYSCALL(read)
 2b0:	b8 05 00 00 00       	mov    $0x5,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <write>:
SYSCALL(write)
 2b8:	b8 10 00 00 00       	mov    $0x10,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <close>:
SYSCALL(close)
 2c0:	b8 15 00 00 00       	mov    $0x15,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <kill>:
SYSCALL(kill)
 2c8:	b8 06 00 00 00       	mov    $0x6,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <exec>:
SYSCALL(exec)
 2d0:	b8 07 00 00 00       	mov    $0x7,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <open>:
SYSCALL(open)
 2d8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <mknod>:
SYSCALL(mknod)
 2e0:	b8 11 00 00 00       	mov    $0x11,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <unlink>:
SYSCALL(unlink)
 2e8:	b8 12 00 00 00       	mov    $0x12,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <fstat>:
SYSCALL(fstat)
 2f0:	b8 08 00 00 00       	mov    $0x8,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <link>:
SYSCALL(link)
 2f8:	b8 13 00 00 00       	mov    $0x13,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <mkdir>:
SYSCALL(mkdir)
 300:	b8 14 00 00 00       	mov    $0x14,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <chdir>:
SYSCALL(chdir)
 308:	b8 09 00 00 00       	mov    $0x9,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <dup>:
SYSCALL(dup)
 310:	b8 0a 00 00 00       	mov    $0xa,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <getpid>:
SYSCALL(getpid)
 318:	b8 0b 00 00 00       	mov    $0xb,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <sbrk>:
SYSCALL(sbrk)
 320:	b8 0c 00 00 00       	mov    $0xc,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <sleep>:
SYSCALL(sleep)
 328:	b8 0d 00 00 00       	mov    $0xd,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <uptime>:
SYSCALL(uptime)
 330:	b8 0e 00 00 00       	mov    $0xe,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <count>:
SYSCALL(count)
 338:	b8 16 00 00 00       	mov    $0x16,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <change_priority>:
SYSCALL(change_priority)
 340:	b8 18 00 00 00       	mov    $0x18,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	83 ec 28             	sub    $0x28,%esp
 34e:	8b 45 0c             	mov    0xc(%ebp),%eax
 351:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 354:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 35b:	00 
 35c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 35f:	89 44 24 04          	mov    %eax,0x4(%esp)
 363:	8b 45 08             	mov    0x8(%ebp),%eax
 366:	89 04 24             	mov    %eax,(%esp)
 369:	e8 4a ff ff ff       	call   2b8 <write>
}
 36e:	c9                   	leave  
 36f:	c3                   	ret    

00000370 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	53                   	push   %ebx
 374:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 377:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 37e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 382:	74 17                	je     39b <printint+0x2b>
 384:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 388:	79 11                	jns    39b <printint+0x2b>
    neg = 1;
 38a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 391:	8b 45 0c             	mov    0xc(%ebp),%eax
 394:	f7 d8                	neg    %eax
 396:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 399:	eb 06                	jmp    3a1 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 39b:	8b 45 0c             	mov    0xc(%ebp),%eax
 39e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3a1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3a8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3ab:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3b1:	ba 00 00 00 00       	mov    $0x0,%edx
 3b6:	f7 f3                	div    %ebx
 3b8:	89 d0                	mov    %edx,%eax
 3ba:	0f b6 80 f0 07 00 00 	movzbl 0x7f0(%eax),%eax
 3c1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 3c5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 3c9:	8b 45 10             	mov    0x10(%ebp),%eax
 3cc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3d2:	ba 00 00 00 00       	mov    $0x0,%edx
 3d7:	f7 75 d4             	divl   -0x2c(%ebp)
 3da:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3e1:	75 c5                	jne    3a8 <printint+0x38>
  if(neg)
 3e3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3e7:	74 28                	je     411 <printint+0xa1>
    buf[i++] = '-';
 3e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ec:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 3f1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 3f5:	eb 1a                	jmp    411 <printint+0xa1>
    putc(fd, buf[i]);
 3f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3fa:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 3ff:	0f be c0             	movsbl %al,%eax
 402:	89 44 24 04          	mov    %eax,0x4(%esp)
 406:	8b 45 08             	mov    0x8(%ebp),%eax
 409:	89 04 24             	mov    %eax,(%esp)
 40c:	e8 37 ff ff ff       	call   348 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 411:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 415:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 419:	79 dc                	jns    3f7 <printint+0x87>
    putc(fd, buf[i]);
}
 41b:	83 c4 44             	add    $0x44,%esp
 41e:	5b                   	pop    %ebx
 41f:	5d                   	pop    %ebp
 420:	c3                   	ret    

00000421 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 421:	55                   	push   %ebp
 422:	89 e5                	mov    %esp,%ebp
 424:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 427:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 42e:	8d 45 0c             	lea    0xc(%ebp),%eax
 431:	83 c0 04             	add    $0x4,%eax
 434:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 437:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 43e:	e9 7e 01 00 00       	jmp    5c1 <printf+0x1a0>
    c = fmt[i] & 0xff;
 443:	8b 55 0c             	mov    0xc(%ebp),%edx
 446:	8b 45 ec             	mov    -0x14(%ebp),%eax
 449:	8d 04 02             	lea    (%edx,%eax,1),%eax
 44c:	0f b6 00             	movzbl (%eax),%eax
 44f:	0f be c0             	movsbl %al,%eax
 452:	25 ff 00 00 00       	and    $0xff,%eax
 457:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 45a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 45e:	75 2c                	jne    48c <printf+0x6b>
      if(c == '%'){
 460:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 464:	75 0c                	jne    472 <printf+0x51>
        state = '%';
 466:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 46d:	e9 4b 01 00 00       	jmp    5bd <printf+0x19c>
      } else {
        putc(fd, c);
 472:	8b 45 e8             	mov    -0x18(%ebp),%eax
 475:	0f be c0             	movsbl %al,%eax
 478:	89 44 24 04          	mov    %eax,0x4(%esp)
 47c:	8b 45 08             	mov    0x8(%ebp),%eax
 47f:	89 04 24             	mov    %eax,(%esp)
 482:	e8 c1 fe ff ff       	call   348 <putc>
 487:	e9 31 01 00 00       	jmp    5bd <printf+0x19c>
      }
    } else if(state == '%'){
 48c:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 490:	0f 85 27 01 00 00    	jne    5bd <printf+0x19c>
      if(c == 'd'){
 496:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 49a:	75 2d                	jne    4c9 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 49c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 49f:	8b 00                	mov    (%eax),%eax
 4a1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4a8:	00 
 4a9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4b0:	00 
 4b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b5:	8b 45 08             	mov    0x8(%ebp),%eax
 4b8:	89 04 24             	mov    %eax,(%esp)
 4bb:	e8 b0 fe ff ff       	call   370 <printint>
        ap++;
 4c0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 4c4:	e9 ed 00 00 00       	jmp    5b6 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 4c9:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 4cd:	74 06                	je     4d5 <printf+0xb4>
 4cf:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 4d3:	75 2d                	jne    502 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 4d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d8:	8b 00                	mov    (%eax),%eax
 4da:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4e1:	00 
 4e2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4e9:	00 
 4ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ee:	8b 45 08             	mov    0x8(%ebp),%eax
 4f1:	89 04 24             	mov    %eax,(%esp)
 4f4:	e8 77 fe ff ff       	call   370 <printint>
        ap++;
 4f9:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4fd:	e9 b4 00 00 00       	jmp    5b6 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 502:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 506:	75 46                	jne    54e <printf+0x12d>
        s = (char*)*ap;
 508:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50b:	8b 00                	mov    (%eax),%eax
 50d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 510:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 514:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 518:	75 27                	jne    541 <printf+0x120>
          s = "(null)";
 51a:	c7 45 e4 e7 07 00 00 	movl   $0x7e7,-0x1c(%ebp)
        while(*s != 0){
 521:	eb 1f                	jmp    542 <printf+0x121>
          putc(fd, *s);
 523:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 526:	0f b6 00             	movzbl (%eax),%eax
 529:	0f be c0             	movsbl %al,%eax
 52c:	89 44 24 04          	mov    %eax,0x4(%esp)
 530:	8b 45 08             	mov    0x8(%ebp),%eax
 533:	89 04 24             	mov    %eax,(%esp)
 536:	e8 0d fe ff ff       	call   348 <putc>
          s++;
 53b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 53f:	eb 01                	jmp    542 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 541:	90                   	nop
 542:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 545:	0f b6 00             	movzbl (%eax),%eax
 548:	84 c0                	test   %al,%al
 54a:	75 d7                	jne    523 <printf+0x102>
 54c:	eb 68                	jmp    5b6 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 54e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 552:	75 1d                	jne    571 <printf+0x150>
        putc(fd, *ap);
 554:	8b 45 f4             	mov    -0xc(%ebp),%eax
 557:	8b 00                	mov    (%eax),%eax
 559:	0f be c0             	movsbl %al,%eax
 55c:	89 44 24 04          	mov    %eax,0x4(%esp)
 560:	8b 45 08             	mov    0x8(%ebp),%eax
 563:	89 04 24             	mov    %eax,(%esp)
 566:	e8 dd fd ff ff       	call   348 <putc>
        ap++;
 56b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 56f:	eb 45                	jmp    5b6 <printf+0x195>
      } else if(c == '%'){
 571:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 575:	75 17                	jne    58e <printf+0x16d>
        putc(fd, c);
 577:	8b 45 e8             	mov    -0x18(%ebp),%eax
 57a:	0f be c0             	movsbl %al,%eax
 57d:	89 44 24 04          	mov    %eax,0x4(%esp)
 581:	8b 45 08             	mov    0x8(%ebp),%eax
 584:	89 04 24             	mov    %eax,(%esp)
 587:	e8 bc fd ff ff       	call   348 <putc>
 58c:	eb 28                	jmp    5b6 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 58e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 595:	00 
 596:	8b 45 08             	mov    0x8(%ebp),%eax
 599:	89 04 24             	mov    %eax,(%esp)
 59c:	e8 a7 fd ff ff       	call   348 <putc>
        putc(fd, c);
 5a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a4:	0f be c0             	movsbl %al,%eax
 5a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ab:	8b 45 08             	mov    0x8(%ebp),%eax
 5ae:	89 04 24             	mov    %eax,(%esp)
 5b1:	e8 92 fd ff ff       	call   348 <putc>
      }
      state = 0;
 5b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5bd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5c1:	8b 55 0c             	mov    0xc(%ebp),%edx
 5c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5c7:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5ca:	0f b6 00             	movzbl (%eax),%eax
 5cd:	84 c0                	test   %al,%al
 5cf:	0f 85 6e fe ff ff    	jne    443 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5d5:	c9                   	leave  
 5d6:	c3                   	ret    
 5d7:	90                   	nop

000005d8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5d8:	55                   	push   %ebp
 5d9:	89 e5                	mov    %esp,%ebp
 5db:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5de:	8b 45 08             	mov    0x8(%ebp),%eax
 5e1:	83 e8 08             	sub    $0x8,%eax
 5e4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5e7:	a1 0c 08 00 00       	mov    0x80c,%eax
 5ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5ef:	eb 24                	jmp    615 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f4:	8b 00                	mov    (%eax),%eax
 5f6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f9:	77 12                	ja     60d <free+0x35>
 5fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5fe:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 601:	77 24                	ja     627 <free+0x4f>
 603:	8b 45 fc             	mov    -0x4(%ebp),%eax
 606:	8b 00                	mov    (%eax),%eax
 608:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 60b:	77 1a                	ja     627 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 610:	8b 00                	mov    (%eax),%eax
 612:	89 45 fc             	mov    %eax,-0x4(%ebp)
 615:	8b 45 f8             	mov    -0x8(%ebp),%eax
 618:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 61b:	76 d4                	jbe    5f1 <free+0x19>
 61d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 620:	8b 00                	mov    (%eax),%eax
 622:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 625:	76 ca                	jbe    5f1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 627:	8b 45 f8             	mov    -0x8(%ebp),%eax
 62a:	8b 40 04             	mov    0x4(%eax),%eax
 62d:	c1 e0 03             	shl    $0x3,%eax
 630:	89 c2                	mov    %eax,%edx
 632:	03 55 f8             	add    -0x8(%ebp),%edx
 635:	8b 45 fc             	mov    -0x4(%ebp),%eax
 638:	8b 00                	mov    (%eax),%eax
 63a:	39 c2                	cmp    %eax,%edx
 63c:	75 24                	jne    662 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 63e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 641:	8b 50 04             	mov    0x4(%eax),%edx
 644:	8b 45 fc             	mov    -0x4(%ebp),%eax
 647:	8b 00                	mov    (%eax),%eax
 649:	8b 40 04             	mov    0x4(%eax),%eax
 64c:	01 c2                	add    %eax,%edx
 64e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 651:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 654:	8b 45 fc             	mov    -0x4(%ebp),%eax
 657:	8b 00                	mov    (%eax),%eax
 659:	8b 10                	mov    (%eax),%edx
 65b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65e:	89 10                	mov    %edx,(%eax)
 660:	eb 0a                	jmp    66c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 662:	8b 45 fc             	mov    -0x4(%ebp),%eax
 665:	8b 10                	mov    (%eax),%edx
 667:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 66c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66f:	8b 40 04             	mov    0x4(%eax),%eax
 672:	c1 e0 03             	shl    $0x3,%eax
 675:	03 45 fc             	add    -0x4(%ebp),%eax
 678:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 67b:	75 20                	jne    69d <free+0xc5>
    p->s.size += bp->s.size;
 67d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 680:	8b 50 04             	mov    0x4(%eax),%edx
 683:	8b 45 f8             	mov    -0x8(%ebp),%eax
 686:	8b 40 04             	mov    0x4(%eax),%eax
 689:	01 c2                	add    %eax,%edx
 68b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 691:	8b 45 f8             	mov    -0x8(%ebp),%eax
 694:	8b 10                	mov    (%eax),%edx
 696:	8b 45 fc             	mov    -0x4(%ebp),%eax
 699:	89 10                	mov    %edx,(%eax)
 69b:	eb 08                	jmp    6a5 <free+0xcd>
  } else
    p->s.ptr = bp;
 69d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6a3:	89 10                	mov    %edx,(%eax)
  freep = p;
 6a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a8:	a3 0c 08 00 00       	mov    %eax,0x80c
}
 6ad:	c9                   	leave  
 6ae:	c3                   	ret    

000006af <morecore>:

static Header*
morecore(uint nu)
{
 6af:	55                   	push   %ebp
 6b0:	89 e5                	mov    %esp,%ebp
 6b2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6b5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6bc:	77 07                	ja     6c5 <morecore+0x16>
    nu = 4096;
 6be:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	c1 e0 03             	shl    $0x3,%eax
 6cb:	89 04 24             	mov    %eax,(%esp)
 6ce:	e8 4d fc ff ff       	call   320 <sbrk>
 6d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 6d6:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 6da:	75 07                	jne    6e3 <morecore+0x34>
    return 0;
 6dc:	b8 00 00 00 00       	mov    $0x0,%eax
 6e1:	eb 22                	jmp    705 <morecore+0x56>
  hp = (Header*)p;
 6e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 6e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ec:	8b 55 08             	mov    0x8(%ebp),%edx
 6ef:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f5:	83 c0 08             	add    $0x8,%eax
 6f8:	89 04 24             	mov    %eax,(%esp)
 6fb:	e8 d8 fe ff ff       	call   5d8 <free>
  return freep;
 700:	a1 0c 08 00 00       	mov    0x80c,%eax
}
 705:	c9                   	leave  
 706:	c3                   	ret    

00000707 <malloc>:

void*
malloc(uint nbytes)
{
 707:	55                   	push   %ebp
 708:	89 e5                	mov    %esp,%ebp
 70a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
 710:	83 c0 07             	add    $0x7,%eax
 713:	c1 e8 03             	shr    $0x3,%eax
 716:	83 c0 01             	add    $0x1,%eax
 719:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 71c:	a1 0c 08 00 00       	mov    0x80c,%eax
 721:	89 45 f0             	mov    %eax,-0x10(%ebp)
 724:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 728:	75 23                	jne    74d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 72a:	c7 45 f0 04 08 00 00 	movl   $0x804,-0x10(%ebp)
 731:	8b 45 f0             	mov    -0x10(%ebp),%eax
 734:	a3 0c 08 00 00       	mov    %eax,0x80c
 739:	a1 0c 08 00 00       	mov    0x80c,%eax
 73e:	a3 04 08 00 00       	mov    %eax,0x804
    base.s.size = 0;
 743:	c7 05 08 08 00 00 00 	movl   $0x0,0x808
 74a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 74d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 750:	8b 00                	mov    (%eax),%eax
 752:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 755:	8b 45 ec             	mov    -0x14(%ebp),%eax
 758:	8b 40 04             	mov    0x4(%eax),%eax
 75b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 75e:	72 4d                	jb     7ad <malloc+0xa6>
      if(p->s.size == nunits)
 760:	8b 45 ec             	mov    -0x14(%ebp),%eax
 763:	8b 40 04             	mov    0x4(%eax),%eax
 766:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 769:	75 0c                	jne    777 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 76b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 76e:	8b 10                	mov    (%eax),%edx
 770:	8b 45 f0             	mov    -0x10(%ebp),%eax
 773:	89 10                	mov    %edx,(%eax)
 775:	eb 26                	jmp    79d <malloc+0x96>
      else {
        p->s.size -= nunits;
 777:	8b 45 ec             	mov    -0x14(%ebp),%eax
 77a:	8b 40 04             	mov    0x4(%eax),%eax
 77d:	89 c2                	mov    %eax,%edx
 77f:	2b 55 f4             	sub    -0xc(%ebp),%edx
 782:	8b 45 ec             	mov    -0x14(%ebp),%eax
 785:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 788:	8b 45 ec             	mov    -0x14(%ebp),%eax
 78b:	8b 40 04             	mov    0x4(%eax),%eax
 78e:	c1 e0 03             	shl    $0x3,%eax
 791:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 794:	8b 45 ec             	mov    -0x14(%ebp),%eax
 797:	8b 55 f4             	mov    -0xc(%ebp),%edx
 79a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 79d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a0:	a3 0c 08 00 00       	mov    %eax,0x80c
      return (void*)(p + 1);
 7a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a8:	83 c0 08             	add    $0x8,%eax
 7ab:	eb 38                	jmp    7e5 <malloc+0xde>
    }
    if(p == freep)
 7ad:	a1 0c 08 00 00       	mov    0x80c,%eax
 7b2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7b5:	75 1b                	jne    7d2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ba:	89 04 24             	mov    %eax,(%esp)
 7bd:	e8 ed fe ff ff       	call   6af <morecore>
 7c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7c9:	75 07                	jne    7d2 <malloc+0xcb>
        return 0;
 7cb:	b8 00 00 00 00       	mov    $0x0,%eax
 7d0:	eb 13                	jmp    7e5 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7db:	8b 00                	mov    (%eax),%eax
 7dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7e0:	e9 70 ff ff ff       	jmp    755 <malloc+0x4e>
}
 7e5:	c9                   	leave  
 7e6:	c3                   	ret    
