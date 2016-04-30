
_ln:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 20                	je     2f <main+0x2f>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 43 08 00 	movl   $0x843,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 5a 04 00 00       	call   47d <printf>
    exit(1);
  23:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2a:	e8 bd 02 00 00       	call   2ec <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  2f:	8b 45 0c             	mov    0xc(%ebp),%eax
  32:	83 c0 08             	add    $0x8,%eax
  35:	8b 10                	mov    (%eax),%edx
  37:	8b 45 0c             	mov    0xc(%ebp),%eax
  3a:	83 c0 04             	add    $0x4,%eax
  3d:	8b 00                	mov    (%eax),%eax
  3f:	89 54 24 04          	mov    %edx,0x4(%esp)
  43:	89 04 24             	mov    %eax,(%esp)
  46:	e8 09 03 00 00       	call   354 <link>
  4b:	85 c0                	test   %eax,%eax
  4d:	79 2c                	jns    7b <main+0x7b>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  4f:	8b 45 0c             	mov    0xc(%ebp),%eax
  52:	83 c0 08             	add    $0x8,%eax
  55:	8b 10                	mov    (%eax),%edx
  57:	8b 45 0c             	mov    0xc(%ebp),%eax
  5a:	83 c0 04             	add    $0x4,%eax
  5d:	8b 00                	mov    (%eax),%eax
  5f:	89 54 24 0c          	mov    %edx,0xc(%esp)
  63:	89 44 24 08          	mov    %eax,0x8(%esp)
  67:	c7 44 24 04 56 08 00 	movl   $0x856,0x4(%esp)
  6e:	00 
  6f:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  76:	e8 02 04 00 00       	call   47d <printf>
  exit(0);
  7b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  82:	e8 65 02 00 00       	call   2ec <exit>
  87:	90                   	nop

00000088 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  88:	55                   	push   %ebp
  89:	89 e5                	mov    %esp,%ebp
  8b:	57                   	push   %edi
  8c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  8d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  90:	8b 55 10             	mov    0x10(%ebp),%edx
  93:	8b 45 0c             	mov    0xc(%ebp),%eax
  96:	89 cb                	mov    %ecx,%ebx
  98:	89 df                	mov    %ebx,%edi
  9a:	89 d1                	mov    %edx,%ecx
  9c:	fc                   	cld    
  9d:	f3 aa                	rep stos %al,%es:(%edi)
  9f:	89 ca                	mov    %ecx,%edx
  a1:	89 fb                	mov    %edi,%ebx
  a3:	89 5d 08             	mov    %ebx,0x8(%ebp)
  a6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  a9:	5b                   	pop    %ebx
  aa:	5f                   	pop    %edi
  ab:	5d                   	pop    %ebp
  ac:	c3                   	ret    

000000ad <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  ad:	55                   	push   %ebp
  ae:	89 e5                	mov    %esp,%ebp
  b0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  b3:	8b 45 08             	mov    0x8(%ebp),%eax
  b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  bc:	0f b6 10             	movzbl (%eax),%edx
  bf:	8b 45 08             	mov    0x8(%ebp),%eax
  c2:	88 10                	mov    %dl,(%eax)
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	0f b6 00             	movzbl (%eax),%eax
  ca:	84 c0                	test   %al,%al
  cc:	0f 95 c0             	setne  %al
  cf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  d7:	84 c0                	test   %al,%al
  d9:	75 de                	jne    b9 <strcpy+0xc>
    ;
  return os;
  db:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  de:	c9                   	leave  
  df:	c3                   	ret    

000000e0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e3:	eb 08                	jmp    ed <strcmp+0xd>
    p++, q++;
  e5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  e9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ed:	8b 45 08             	mov    0x8(%ebp),%eax
  f0:	0f b6 00             	movzbl (%eax),%eax
  f3:	84 c0                	test   %al,%al
  f5:	74 10                	je     107 <strcmp+0x27>
  f7:	8b 45 08             	mov    0x8(%ebp),%eax
  fa:	0f b6 10             	movzbl (%eax),%edx
  fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 100:	0f b6 00             	movzbl (%eax),%eax
 103:	38 c2                	cmp    %al,%dl
 105:	74 de                	je     e5 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 107:	8b 45 08             	mov    0x8(%ebp),%eax
 10a:	0f b6 00             	movzbl (%eax),%eax
 10d:	0f b6 d0             	movzbl %al,%edx
 110:	8b 45 0c             	mov    0xc(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	0f b6 c0             	movzbl %al,%eax
 119:	89 d1                	mov    %edx,%ecx
 11b:	29 c1                	sub    %eax,%ecx
 11d:	89 c8                	mov    %ecx,%eax
}
 11f:	5d                   	pop    %ebp
 120:	c3                   	ret    

00000121 <strlen>:

uint
strlen(char *s)
{
 121:	55                   	push   %ebp
 122:	89 e5                	mov    %esp,%ebp
 124:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 127:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 12e:	eb 04                	jmp    134 <strlen+0x13>
 130:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 134:	8b 45 fc             	mov    -0x4(%ebp),%eax
 137:	03 45 08             	add    0x8(%ebp),%eax
 13a:	0f b6 00             	movzbl (%eax),%eax
 13d:	84 c0                	test   %al,%al
 13f:	75 ef                	jne    130 <strlen+0xf>
    ;
  return n;
 141:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 144:	c9                   	leave  
 145:	c3                   	ret    

00000146 <memset>:

void*
memset(void *dst, int c, uint n)
{
 146:	55                   	push   %ebp
 147:	89 e5                	mov    %esp,%ebp
 149:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 14c:	8b 45 10             	mov    0x10(%ebp),%eax
 14f:	89 44 24 08          	mov    %eax,0x8(%esp)
 153:	8b 45 0c             	mov    0xc(%ebp),%eax
 156:	89 44 24 04          	mov    %eax,0x4(%esp)
 15a:	8b 45 08             	mov    0x8(%ebp),%eax
 15d:	89 04 24             	mov    %eax,(%esp)
 160:	e8 23 ff ff ff       	call   88 <stosb>
  return dst;
 165:	8b 45 08             	mov    0x8(%ebp),%eax
}
 168:	c9                   	leave  
 169:	c3                   	ret    

0000016a <strchr>:

char*
strchr(const char *s, char c)
{
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
 16d:	83 ec 04             	sub    $0x4,%esp
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 176:	eb 14                	jmp    18c <strchr+0x22>
    if(*s == c)
 178:	8b 45 08             	mov    0x8(%ebp),%eax
 17b:	0f b6 00             	movzbl (%eax),%eax
 17e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 181:	75 05                	jne    188 <strchr+0x1e>
      return (char*)s;
 183:	8b 45 08             	mov    0x8(%ebp),%eax
 186:	eb 13                	jmp    19b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 188:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 18c:	8b 45 08             	mov    0x8(%ebp),%eax
 18f:	0f b6 00             	movzbl (%eax),%eax
 192:	84 c0                	test   %al,%al
 194:	75 e2                	jne    178 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 196:	b8 00 00 00 00       	mov    $0x0,%eax
}
 19b:	c9                   	leave  
 19c:	c3                   	ret    

0000019d <gets>:

char*
gets(char *buf, int max)
{
 19d:	55                   	push   %ebp
 19e:	89 e5                	mov    %esp,%ebp
 1a0:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1aa:	eb 44                	jmp    1f0 <gets+0x53>
    cc = read(0, &c, 1);
 1ac:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b3:	00 
 1b4:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c2:	e8 45 01 00 00       	call   30c <read>
 1c7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 1ca:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1ce:	7e 2d                	jle    1fd <gets+0x60>
      break;
    buf[i++] = c;
 1d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1d3:	03 45 08             	add    0x8(%ebp),%eax
 1d6:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1da:	88 10                	mov    %dl,(%eax)
 1dc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 1e0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e4:	3c 0a                	cmp    $0xa,%al
 1e6:	74 16                	je     1fe <gets+0x61>
 1e8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ec:	3c 0d                	cmp    $0xd,%al
 1ee:	74 0e                	je     1fe <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1f3:	83 c0 01             	add    $0x1,%eax
 1f6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1f9:	7c b1                	jl     1ac <gets+0xf>
 1fb:	eb 01                	jmp    1fe <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1fd:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 201:	03 45 08             	add    0x8(%ebp),%eax
 204:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 207:	8b 45 08             	mov    0x8(%ebp),%eax
}
 20a:	c9                   	leave  
 20b:	c3                   	ret    

0000020c <stat>:

int
stat(char *n, struct stat *st)
{
 20c:	55                   	push   %ebp
 20d:	89 e5                	mov    %esp,%ebp
 20f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 212:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 219:	00 
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	89 04 24             	mov    %eax,(%esp)
 220:	e8 0f 01 00 00       	call   334 <open>
 225:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 228:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 22c:	79 07                	jns    235 <stat+0x29>
    return -1;
 22e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 233:	eb 23                	jmp    258 <stat+0x4c>
  r = fstat(fd, st);
 235:	8b 45 0c             	mov    0xc(%ebp),%eax
 238:	89 44 24 04          	mov    %eax,0x4(%esp)
 23c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 23f:	89 04 24             	mov    %eax,(%esp)
 242:	e8 05 01 00 00       	call   34c <fstat>
 247:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 24a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 24d:	89 04 24             	mov    %eax,(%esp)
 250:	e8 c7 00 00 00       	call   31c <close>
  return r;
 255:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 258:	c9                   	leave  
 259:	c3                   	ret    

0000025a <atoi>:

int
atoi(const char *s)
{
 25a:	55                   	push   %ebp
 25b:	89 e5                	mov    %esp,%ebp
 25d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 260:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 267:	eb 24                	jmp    28d <atoi+0x33>
    n = n*10 + *s++ - '0';
 269:	8b 55 fc             	mov    -0x4(%ebp),%edx
 26c:	89 d0                	mov    %edx,%eax
 26e:	c1 e0 02             	shl    $0x2,%eax
 271:	01 d0                	add    %edx,%eax
 273:	01 c0                	add    %eax,%eax
 275:	89 c2                	mov    %eax,%edx
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 00             	movzbl (%eax),%eax
 27d:	0f be c0             	movsbl %al,%eax
 280:	8d 04 02             	lea    (%edx,%eax,1),%eax
 283:	83 e8 30             	sub    $0x30,%eax
 286:	89 45 fc             	mov    %eax,-0x4(%ebp)
 289:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	0f b6 00             	movzbl (%eax),%eax
 293:	3c 2f                	cmp    $0x2f,%al
 295:	7e 0a                	jle    2a1 <atoi+0x47>
 297:	8b 45 08             	mov    0x8(%ebp),%eax
 29a:	0f b6 00             	movzbl (%eax),%eax
 29d:	3c 39                	cmp    $0x39,%al
 29f:	7e c8                	jle    269 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    

000002a6 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2ac:	8b 45 08             	mov    0x8(%ebp),%eax
 2af:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 2b2:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 2b8:	eb 13                	jmp    2cd <memmove+0x27>
    *dst++ = *src++;
 2ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2bd:	0f b6 10             	movzbl (%eax),%edx
 2c0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2c3:	88 10                	mov    %dl,(%eax)
 2c5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 2c9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2cd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2d1:	0f 9f c0             	setg   %al
 2d4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2d8:	84 c0                	test   %al,%al
 2da:	75 de                	jne    2ba <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2dc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2df:	c9                   	leave  
 2e0:	c3                   	ret    
 2e1:	90                   	nop
 2e2:	90                   	nop
 2e3:	90                   	nop

000002e4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2e4:	b8 01 00 00 00       	mov    $0x1,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <exit>:
SYSCALL(exit)
 2ec:	b8 02 00 00 00       	mov    $0x2,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <wait>:
SYSCALL(wait)
 2f4:	b8 03 00 00 00       	mov    $0x3,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <waitpid>:
SYSCALL(waitpid)
 2fc:	b8 17 00 00 00       	mov    $0x17,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <pipe>:
SYSCALL(pipe)
 304:	b8 04 00 00 00       	mov    $0x4,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <read>:
SYSCALL(read)
 30c:	b8 05 00 00 00       	mov    $0x5,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <write>:
SYSCALL(write)
 314:	b8 10 00 00 00       	mov    $0x10,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <close>:
SYSCALL(close)
 31c:	b8 15 00 00 00       	mov    $0x15,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <kill>:
SYSCALL(kill)
 324:	b8 06 00 00 00       	mov    $0x6,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <exec>:
SYSCALL(exec)
 32c:	b8 07 00 00 00       	mov    $0x7,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <open>:
SYSCALL(open)
 334:	b8 0f 00 00 00       	mov    $0xf,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <mknod>:
SYSCALL(mknod)
 33c:	b8 11 00 00 00       	mov    $0x11,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <unlink>:
SYSCALL(unlink)
 344:	b8 12 00 00 00       	mov    $0x12,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <fstat>:
SYSCALL(fstat)
 34c:	b8 08 00 00 00       	mov    $0x8,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <link>:
SYSCALL(link)
 354:	b8 13 00 00 00       	mov    $0x13,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <mkdir>:
SYSCALL(mkdir)
 35c:	b8 14 00 00 00       	mov    $0x14,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <chdir>:
SYSCALL(chdir)
 364:	b8 09 00 00 00       	mov    $0x9,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <dup>:
SYSCALL(dup)
 36c:	b8 0a 00 00 00       	mov    $0xa,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <getpid>:
SYSCALL(getpid)
 374:	b8 0b 00 00 00       	mov    $0xb,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <sbrk>:
SYSCALL(sbrk)
 37c:	b8 0c 00 00 00       	mov    $0xc,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <sleep>:
SYSCALL(sleep)
 384:	b8 0d 00 00 00       	mov    $0xd,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <uptime>:
SYSCALL(uptime)
 38c:	b8 0e 00 00 00       	mov    $0xe,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <count>:
SYSCALL(count)
 394:	b8 16 00 00 00       	mov    $0x16,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <change_priority>:
SYSCALL(change_priority)
 39c:	b8 18 00 00 00       	mov    $0x18,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	83 ec 28             	sub    $0x28,%esp
 3aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ad:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3b7:	00 
 3b8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 3bf:	8b 45 08             	mov    0x8(%ebp),%eax
 3c2:	89 04 24             	mov    %eax,(%esp)
 3c5:	e8 4a ff ff ff       	call   314 <write>
}
 3ca:	c9                   	leave  
 3cb:	c3                   	ret    

000003cc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3cc:	55                   	push   %ebp
 3cd:	89 e5                	mov    %esp,%ebp
 3cf:	53                   	push   %ebx
 3d0:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3da:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3de:	74 17                	je     3f7 <printint+0x2b>
 3e0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3e4:	79 11                	jns    3f7 <printint+0x2b>
    neg = 1;
 3e6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f0:	f7 d8                	neg    %eax
 3f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3f5:	eb 06                	jmp    3fd <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3fd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 404:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 407:	8b 5d 10             	mov    0x10(%ebp),%ebx
 40a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 40d:	ba 00 00 00 00       	mov    $0x0,%edx
 412:	f7 f3                	div    %ebx
 414:	89 d0                	mov    %edx,%eax
 416:	0f b6 80 74 08 00 00 	movzbl 0x874(%eax),%eax
 41d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 421:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 425:	8b 45 10             	mov    0x10(%ebp),%eax
 428:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 42b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 42e:	ba 00 00 00 00       	mov    $0x0,%edx
 433:	f7 75 d4             	divl   -0x2c(%ebp)
 436:	89 45 f4             	mov    %eax,-0xc(%ebp)
 439:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 43d:	75 c5                	jne    404 <printint+0x38>
  if(neg)
 43f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 443:	74 28                	je     46d <printint+0xa1>
    buf[i++] = '-';
 445:	8b 45 ec             	mov    -0x14(%ebp),%eax
 448:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 44d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 451:	eb 1a                	jmp    46d <printint+0xa1>
    putc(fd, buf[i]);
 453:	8b 45 ec             	mov    -0x14(%ebp),%eax
 456:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 45b:	0f be c0             	movsbl %al,%eax
 45e:	89 44 24 04          	mov    %eax,0x4(%esp)
 462:	8b 45 08             	mov    0x8(%ebp),%eax
 465:	89 04 24             	mov    %eax,(%esp)
 468:	e8 37 ff ff ff       	call   3a4 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 46d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 471:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 475:	79 dc                	jns    453 <printint+0x87>
    putc(fd, buf[i]);
}
 477:	83 c4 44             	add    $0x44,%esp
 47a:	5b                   	pop    %ebx
 47b:	5d                   	pop    %ebp
 47c:	c3                   	ret    

0000047d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 47d:	55                   	push   %ebp
 47e:	89 e5                	mov    %esp,%ebp
 480:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 483:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 48a:	8d 45 0c             	lea    0xc(%ebp),%eax
 48d:	83 c0 04             	add    $0x4,%eax
 490:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 493:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 49a:	e9 7e 01 00 00       	jmp    61d <printf+0x1a0>
    c = fmt[i] & 0xff;
 49f:	8b 55 0c             	mov    0xc(%ebp),%edx
 4a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4a5:	8d 04 02             	lea    (%edx,%eax,1),%eax
 4a8:	0f b6 00             	movzbl (%eax),%eax
 4ab:	0f be c0             	movsbl %al,%eax
 4ae:	25 ff 00 00 00       	and    $0xff,%eax
 4b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 4b6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ba:	75 2c                	jne    4e8 <printf+0x6b>
      if(c == '%'){
 4bc:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 4c0:	75 0c                	jne    4ce <printf+0x51>
        state = '%';
 4c2:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 4c9:	e9 4b 01 00 00       	jmp    619 <printf+0x19c>
      } else {
        putc(fd, c);
 4ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4d1:	0f be c0             	movsbl %al,%eax
 4d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d8:	8b 45 08             	mov    0x8(%ebp),%eax
 4db:	89 04 24             	mov    %eax,(%esp)
 4de:	e8 c1 fe ff ff       	call   3a4 <putc>
 4e3:	e9 31 01 00 00       	jmp    619 <printf+0x19c>
      }
    } else if(state == '%'){
 4e8:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4ec:	0f 85 27 01 00 00    	jne    619 <printf+0x19c>
      if(c == 'd'){
 4f2:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4f6:	75 2d                	jne    525 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4fb:	8b 00                	mov    (%eax),%eax
 4fd:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 504:	00 
 505:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 50c:	00 
 50d:	89 44 24 04          	mov    %eax,0x4(%esp)
 511:	8b 45 08             	mov    0x8(%ebp),%eax
 514:	89 04 24             	mov    %eax,(%esp)
 517:	e8 b0 fe ff ff       	call   3cc <printint>
        ap++;
 51c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 520:	e9 ed 00 00 00       	jmp    612 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 525:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 529:	74 06                	je     531 <printf+0xb4>
 52b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 52f:	75 2d                	jne    55e <printf+0xe1>
        printint(fd, *ap, 16, 0);
 531:	8b 45 f4             	mov    -0xc(%ebp),%eax
 534:	8b 00                	mov    (%eax),%eax
 536:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 53d:	00 
 53e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 545:	00 
 546:	89 44 24 04          	mov    %eax,0x4(%esp)
 54a:	8b 45 08             	mov    0x8(%ebp),%eax
 54d:	89 04 24             	mov    %eax,(%esp)
 550:	e8 77 fe ff ff       	call   3cc <printint>
        ap++;
 555:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 559:	e9 b4 00 00 00       	jmp    612 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 55e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 562:	75 46                	jne    5aa <printf+0x12d>
        s = (char*)*ap;
 564:	8b 45 f4             	mov    -0xc(%ebp),%eax
 567:	8b 00                	mov    (%eax),%eax
 569:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 56c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 570:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 574:	75 27                	jne    59d <printf+0x120>
          s = "(null)";
 576:	c7 45 e4 6a 08 00 00 	movl   $0x86a,-0x1c(%ebp)
        while(*s != 0){
 57d:	eb 1f                	jmp    59e <printf+0x121>
          putc(fd, *s);
 57f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 582:	0f b6 00             	movzbl (%eax),%eax
 585:	0f be c0             	movsbl %al,%eax
 588:	89 44 24 04          	mov    %eax,0x4(%esp)
 58c:	8b 45 08             	mov    0x8(%ebp),%eax
 58f:	89 04 24             	mov    %eax,(%esp)
 592:	e8 0d fe ff ff       	call   3a4 <putc>
          s++;
 597:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 59b:	eb 01                	jmp    59e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 59d:	90                   	nop
 59e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5a1:	0f b6 00             	movzbl (%eax),%eax
 5a4:	84 c0                	test   %al,%al
 5a6:	75 d7                	jne    57f <printf+0x102>
 5a8:	eb 68                	jmp    612 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5aa:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 5ae:	75 1d                	jne    5cd <printf+0x150>
        putc(fd, *ap);
 5b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b3:	8b 00                	mov    (%eax),%eax
 5b5:	0f be c0             	movsbl %al,%eax
 5b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bc:	8b 45 08             	mov    0x8(%ebp),%eax
 5bf:	89 04 24             	mov    %eax,(%esp)
 5c2:	e8 dd fd ff ff       	call   3a4 <putc>
        ap++;
 5c7:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5cb:	eb 45                	jmp    612 <printf+0x195>
      } else if(c == '%'){
 5cd:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5d1:	75 17                	jne    5ea <printf+0x16d>
        putc(fd, c);
 5d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d6:	0f be c0             	movsbl %al,%eax
 5d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5dd:	8b 45 08             	mov    0x8(%ebp),%eax
 5e0:	89 04 24             	mov    %eax,(%esp)
 5e3:	e8 bc fd ff ff       	call   3a4 <putc>
 5e8:	eb 28                	jmp    612 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5ea:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5f1:	00 
 5f2:	8b 45 08             	mov    0x8(%ebp),%eax
 5f5:	89 04 24             	mov    %eax,(%esp)
 5f8:	e8 a7 fd ff ff       	call   3a4 <putc>
        putc(fd, c);
 5fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 600:	0f be c0             	movsbl %al,%eax
 603:	89 44 24 04          	mov    %eax,0x4(%esp)
 607:	8b 45 08             	mov    0x8(%ebp),%eax
 60a:	89 04 24             	mov    %eax,(%esp)
 60d:	e8 92 fd ff ff       	call   3a4 <putc>
      }
      state = 0;
 612:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 619:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 61d:	8b 55 0c             	mov    0xc(%ebp),%edx
 620:	8b 45 ec             	mov    -0x14(%ebp),%eax
 623:	8d 04 02             	lea    (%edx,%eax,1),%eax
 626:	0f b6 00             	movzbl (%eax),%eax
 629:	84 c0                	test   %al,%al
 62b:	0f 85 6e fe ff ff    	jne    49f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 631:	c9                   	leave  
 632:	c3                   	ret    
 633:	90                   	nop

00000634 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 634:	55                   	push   %ebp
 635:	89 e5                	mov    %esp,%ebp
 637:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 63a:	8b 45 08             	mov    0x8(%ebp),%eax
 63d:	83 e8 08             	sub    $0x8,%eax
 640:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 643:	a1 90 08 00 00       	mov    0x890,%eax
 648:	89 45 fc             	mov    %eax,-0x4(%ebp)
 64b:	eb 24                	jmp    671 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 64d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 650:	8b 00                	mov    (%eax),%eax
 652:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 655:	77 12                	ja     669 <free+0x35>
 657:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 65d:	77 24                	ja     683 <free+0x4f>
 65f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 662:	8b 00                	mov    (%eax),%eax
 664:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 667:	77 1a                	ja     683 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 669:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66c:	8b 00                	mov    (%eax),%eax
 66e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 671:	8b 45 f8             	mov    -0x8(%ebp),%eax
 674:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 677:	76 d4                	jbe    64d <free+0x19>
 679:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67c:	8b 00                	mov    (%eax),%eax
 67e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 681:	76 ca                	jbe    64d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 683:	8b 45 f8             	mov    -0x8(%ebp),%eax
 686:	8b 40 04             	mov    0x4(%eax),%eax
 689:	c1 e0 03             	shl    $0x3,%eax
 68c:	89 c2                	mov    %eax,%edx
 68e:	03 55 f8             	add    -0x8(%ebp),%edx
 691:	8b 45 fc             	mov    -0x4(%ebp),%eax
 694:	8b 00                	mov    (%eax),%eax
 696:	39 c2                	cmp    %eax,%edx
 698:	75 24                	jne    6be <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 69a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69d:	8b 50 04             	mov    0x4(%eax),%edx
 6a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a3:	8b 00                	mov    (%eax),%eax
 6a5:	8b 40 04             	mov    0x4(%eax),%eax
 6a8:	01 c2                	add    %eax,%edx
 6aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ad:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b3:	8b 00                	mov    (%eax),%eax
 6b5:	8b 10                	mov    (%eax),%edx
 6b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ba:	89 10                	mov    %edx,(%eax)
 6bc:	eb 0a                	jmp    6c8 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 6be:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c1:	8b 10                	mov    (%eax),%edx
 6c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cb:	8b 40 04             	mov    0x4(%eax),%eax
 6ce:	c1 e0 03             	shl    $0x3,%eax
 6d1:	03 45 fc             	add    -0x4(%ebp),%eax
 6d4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6d7:	75 20                	jne    6f9 <free+0xc5>
    p->s.size += bp->s.size;
 6d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dc:	8b 50 04             	mov    0x4(%eax),%edx
 6df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e2:	8b 40 04             	mov    0x4(%eax),%eax
 6e5:	01 c2                	add    %eax,%edx
 6e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ea:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f0:	8b 10                	mov    (%eax),%edx
 6f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f5:	89 10                	mov    %edx,(%eax)
 6f7:	eb 08                	jmp    701 <free+0xcd>
  } else
    p->s.ptr = bp;
 6f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6ff:	89 10                	mov    %edx,(%eax)
  freep = p;
 701:	8b 45 fc             	mov    -0x4(%ebp),%eax
 704:	a3 90 08 00 00       	mov    %eax,0x890
}
 709:	c9                   	leave  
 70a:	c3                   	ret    

0000070b <morecore>:

static Header*
morecore(uint nu)
{
 70b:	55                   	push   %ebp
 70c:	89 e5                	mov    %esp,%ebp
 70e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 711:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 718:	77 07                	ja     721 <morecore+0x16>
    nu = 4096;
 71a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 721:	8b 45 08             	mov    0x8(%ebp),%eax
 724:	c1 e0 03             	shl    $0x3,%eax
 727:	89 04 24             	mov    %eax,(%esp)
 72a:	e8 4d fc ff ff       	call   37c <sbrk>
 72f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 732:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 736:	75 07                	jne    73f <morecore+0x34>
    return 0;
 738:	b8 00 00 00 00       	mov    $0x0,%eax
 73d:	eb 22                	jmp    761 <morecore+0x56>
  hp = (Header*)p;
 73f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 742:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 745:	8b 45 f4             	mov    -0xc(%ebp),%eax
 748:	8b 55 08             	mov    0x8(%ebp),%edx
 74b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 74e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 751:	83 c0 08             	add    $0x8,%eax
 754:	89 04 24             	mov    %eax,(%esp)
 757:	e8 d8 fe ff ff       	call   634 <free>
  return freep;
 75c:	a1 90 08 00 00       	mov    0x890,%eax
}
 761:	c9                   	leave  
 762:	c3                   	ret    

00000763 <malloc>:

void*
malloc(uint nbytes)
{
 763:	55                   	push   %ebp
 764:	89 e5                	mov    %esp,%ebp
 766:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 769:	8b 45 08             	mov    0x8(%ebp),%eax
 76c:	83 c0 07             	add    $0x7,%eax
 76f:	c1 e8 03             	shr    $0x3,%eax
 772:	83 c0 01             	add    $0x1,%eax
 775:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 778:	a1 90 08 00 00       	mov    0x890,%eax
 77d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 780:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 784:	75 23                	jne    7a9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 786:	c7 45 f0 88 08 00 00 	movl   $0x888,-0x10(%ebp)
 78d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 790:	a3 90 08 00 00       	mov    %eax,0x890
 795:	a1 90 08 00 00       	mov    0x890,%eax
 79a:	a3 88 08 00 00       	mov    %eax,0x888
    base.s.size = 0;
 79f:	c7 05 8c 08 00 00 00 	movl   $0x0,0x88c
 7a6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ac:	8b 00                	mov    (%eax),%eax
 7ae:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 7b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b4:	8b 40 04             	mov    0x4(%eax),%eax
 7b7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7ba:	72 4d                	jb     809 <malloc+0xa6>
      if(p->s.size == nunits)
 7bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7bf:	8b 40 04             	mov    0x4(%eax),%eax
 7c2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7c5:	75 0c                	jne    7d3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ca:	8b 10                	mov    (%eax),%edx
 7cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cf:	89 10                	mov    %edx,(%eax)
 7d1:	eb 26                	jmp    7f9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d6:	8b 40 04             	mov    0x4(%eax),%eax
 7d9:	89 c2                	mov    %eax,%edx
 7db:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7de:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7e1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7e7:	8b 40 04             	mov    0x4(%eax),%eax
 7ea:	c1 e0 03             	shl    $0x3,%eax
 7ed:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7f6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fc:	a3 90 08 00 00       	mov    %eax,0x890
      return (void*)(p + 1);
 801:	8b 45 ec             	mov    -0x14(%ebp),%eax
 804:	83 c0 08             	add    $0x8,%eax
 807:	eb 38                	jmp    841 <malloc+0xde>
    }
    if(p == freep)
 809:	a1 90 08 00 00       	mov    0x890,%eax
 80e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 811:	75 1b                	jne    82e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 813:	8b 45 f4             	mov    -0xc(%ebp),%eax
 816:	89 04 24             	mov    %eax,(%esp)
 819:	e8 ed fe ff ff       	call   70b <morecore>
 81e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 821:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 825:	75 07                	jne    82e <malloc+0xcb>
        return 0;
 827:	b8 00 00 00 00       	mov    $0x0,%eax
 82c:	eb 13                	jmp    841 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 82e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 831:	89 45 f0             	mov    %eax,-0x10(%ebp)
 834:	8b 45 ec             	mov    -0x14(%ebp),%eax
 837:	8b 00                	mov    (%eax),%eax
 839:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 83c:	e9 70 ff ff ff       	jmp    7b1 <malloc+0x4e>
}
 841:	c9                   	leave  
 842:	c3                   	ret    
