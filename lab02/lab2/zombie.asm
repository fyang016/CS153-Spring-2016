
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
   9:	e8 72 02 00 00       	call   280 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 fa 02 00 00       	call   318 <sleep>
  exit();
  1e:	e8 65 02 00 00       	call   288 <exit>
  23:	90                   	nop

00000024 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  24:	55                   	push   %ebp
  25:	89 e5                	mov    %esp,%ebp
  27:	57                   	push   %edi
  28:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  29:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2c:	8b 55 10             	mov    0x10(%ebp),%edx
  2f:	8b 45 0c             	mov    0xc(%ebp),%eax
  32:	89 cb                	mov    %ecx,%ebx
  34:	89 df                	mov    %ebx,%edi
  36:	89 d1                	mov    %edx,%ecx
  38:	fc                   	cld    
  39:	f3 aa                	rep stos %al,%es:(%edi)
  3b:	89 ca                	mov    %ecx,%edx
  3d:	89 fb                	mov    %edi,%ebx
  3f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  42:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  45:	5b                   	pop    %ebx
  46:	5f                   	pop    %edi
  47:	5d                   	pop    %ebp
  48:	c3                   	ret    

00000049 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  49:	55                   	push   %ebp
  4a:	89 e5                	mov    %esp,%ebp
  4c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4f:	8b 45 08             	mov    0x8(%ebp),%eax
  52:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  55:	8b 45 0c             	mov    0xc(%ebp),%eax
  58:	0f b6 10             	movzbl (%eax),%edx
  5b:	8b 45 08             	mov    0x8(%ebp),%eax
  5e:	88 10                	mov    %dl,(%eax)
  60:	8b 45 08             	mov    0x8(%ebp),%eax
  63:	0f b6 00             	movzbl (%eax),%eax
  66:	84 c0                	test   %al,%al
  68:	0f 95 c0             	setne  %al
  6b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  6f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  73:	84 c0                	test   %al,%al
  75:	75 de                	jne    55 <strcpy+0xc>
    ;
  return os;
  77:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  7a:	c9                   	leave  
  7b:	c3                   	ret    

0000007c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  7c:	55                   	push   %ebp
  7d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7f:	eb 08                	jmp    89 <strcmp+0xd>
    p++, q++;
  81:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  85:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  89:	8b 45 08             	mov    0x8(%ebp),%eax
  8c:	0f b6 00             	movzbl (%eax),%eax
  8f:	84 c0                	test   %al,%al
  91:	74 10                	je     a3 <strcmp+0x27>
  93:	8b 45 08             	mov    0x8(%ebp),%eax
  96:	0f b6 10             	movzbl (%eax),%edx
  99:	8b 45 0c             	mov    0xc(%ebp),%eax
  9c:	0f b6 00             	movzbl (%eax),%eax
  9f:	38 c2                	cmp    %al,%dl
  a1:	74 de                	je     81 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  a3:	8b 45 08             	mov    0x8(%ebp),%eax
  a6:	0f b6 00             	movzbl (%eax),%eax
  a9:	0f b6 d0             	movzbl %al,%edx
  ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  af:	0f b6 00             	movzbl (%eax),%eax
  b2:	0f b6 c0             	movzbl %al,%eax
  b5:	89 d1                	mov    %edx,%ecx
  b7:	29 c1                	sub    %eax,%ecx
  b9:	89 c8                	mov    %ecx,%eax
}
  bb:	5d                   	pop    %ebp
  bc:	c3                   	ret    

000000bd <strlen>:

uint
strlen(char *s)
{
  bd:	55                   	push   %ebp
  be:	89 e5                	mov    %esp,%ebp
  c0:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  c3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  ca:	eb 04                	jmp    d0 <strlen+0x13>
  cc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  d3:	03 45 08             	add    0x8(%ebp),%eax
  d6:	0f b6 00             	movzbl (%eax),%eax
  d9:	84 c0                	test   %al,%al
  db:	75 ef                	jne    cc <strlen+0xf>
    ;
  return n;
  dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e0:	c9                   	leave  
  e1:	c3                   	ret    

000000e2 <memset>:

void*
memset(void *dst, int c, uint n)
{
  e2:	55                   	push   %ebp
  e3:	89 e5                	mov    %esp,%ebp
  e5:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e8:	8b 45 10             	mov    0x10(%ebp),%eax
  eb:	89 44 24 08          	mov    %eax,0x8(%esp)
  ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  f2:	89 44 24 04          	mov    %eax,0x4(%esp)
  f6:	8b 45 08             	mov    0x8(%ebp),%eax
  f9:	89 04 24             	mov    %eax,(%esp)
  fc:	e8 23 ff ff ff       	call   24 <stosb>
  return dst;
 101:	8b 45 08             	mov    0x8(%ebp),%eax
}
 104:	c9                   	leave  
 105:	c3                   	ret    

00000106 <strchr>:

char*
strchr(const char *s, char c)
{
 106:	55                   	push   %ebp
 107:	89 e5                	mov    %esp,%ebp
 109:	83 ec 04             	sub    $0x4,%esp
 10c:	8b 45 0c             	mov    0xc(%ebp),%eax
 10f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 112:	eb 14                	jmp    128 <strchr+0x22>
    if(*s == c)
 114:	8b 45 08             	mov    0x8(%ebp),%eax
 117:	0f b6 00             	movzbl (%eax),%eax
 11a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 11d:	75 05                	jne    124 <strchr+0x1e>
      return (char*)s;
 11f:	8b 45 08             	mov    0x8(%ebp),%eax
 122:	eb 13                	jmp    137 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 124:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 128:	8b 45 08             	mov    0x8(%ebp),%eax
 12b:	0f b6 00             	movzbl (%eax),%eax
 12e:	84 c0                	test   %al,%al
 130:	75 e2                	jne    114 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 132:	b8 00 00 00 00       	mov    $0x0,%eax
}
 137:	c9                   	leave  
 138:	c3                   	ret    

00000139 <gets>:

char*
gets(char *buf, int max)
{
 139:	55                   	push   %ebp
 13a:	89 e5                	mov    %esp,%ebp
 13c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 146:	eb 44                	jmp    18c <gets+0x53>
    cc = read(0, &c, 1);
 148:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 14f:	00 
 150:	8d 45 ef             	lea    -0x11(%ebp),%eax
 153:	89 44 24 04          	mov    %eax,0x4(%esp)
 157:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15e:	e8 3d 01 00 00       	call   2a0 <read>
 163:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 166:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 16a:	7e 2d                	jle    199 <gets+0x60>
      break;
    buf[i++] = c;
 16c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 16f:	03 45 08             	add    0x8(%ebp),%eax
 172:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 176:	88 10                	mov    %dl,(%eax)
 178:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 17c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 180:	3c 0a                	cmp    $0xa,%al
 182:	74 16                	je     19a <gets+0x61>
 184:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 188:	3c 0d                	cmp    $0xd,%al
 18a:	74 0e                	je     19a <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 18f:	83 c0 01             	add    $0x1,%eax
 192:	3b 45 0c             	cmp    0xc(%ebp),%eax
 195:	7c b1                	jl     148 <gets+0xf>
 197:	eb 01                	jmp    19a <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 199:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 19a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 19d:	03 45 08             	add    0x8(%ebp),%eax
 1a0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a6:	c9                   	leave  
 1a7:	c3                   	ret    

000001a8 <stat>:

int
stat(char *n, struct stat *st)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
 1ab:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ae:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b5:	00 
 1b6:	8b 45 08             	mov    0x8(%ebp),%eax
 1b9:	89 04 24             	mov    %eax,(%esp)
 1bc:	e8 07 01 00 00       	call   2c8 <open>
 1c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 1c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1c8:	79 07                	jns    1d1 <stat+0x29>
    return -1;
 1ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1cf:	eb 23                	jmp    1f4 <stat+0x4c>
  r = fstat(fd, st);
 1d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1db:	89 04 24             	mov    %eax,(%esp)
 1de:	e8 fd 00 00 00       	call   2e0 <fstat>
 1e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 1e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1e9:	89 04 24             	mov    %eax,(%esp)
 1ec:	e8 bf 00 00 00       	call   2b0 <close>
  return r;
 1f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    

000001f6 <atoi>:

int
atoi(const char *s)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1fc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 203:	eb 24                	jmp    229 <atoi+0x33>
    n = n*10 + *s++ - '0';
 205:	8b 55 fc             	mov    -0x4(%ebp),%edx
 208:	89 d0                	mov    %edx,%eax
 20a:	c1 e0 02             	shl    $0x2,%eax
 20d:	01 d0                	add    %edx,%eax
 20f:	01 c0                	add    %eax,%eax
 211:	89 c2                	mov    %eax,%edx
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	0f b6 00             	movzbl (%eax),%eax
 219:	0f be c0             	movsbl %al,%eax
 21c:	8d 04 02             	lea    (%edx,%eax,1),%eax
 21f:	83 e8 30             	sub    $0x30,%eax
 222:	89 45 fc             	mov    %eax,-0x4(%ebp)
 225:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 229:	8b 45 08             	mov    0x8(%ebp),%eax
 22c:	0f b6 00             	movzbl (%eax),%eax
 22f:	3c 2f                	cmp    $0x2f,%al
 231:	7e 0a                	jle    23d <atoi+0x47>
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	0f b6 00             	movzbl (%eax),%eax
 239:	3c 39                	cmp    $0x39,%al
 23b:	7e c8                	jle    205 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 23d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 240:	c9                   	leave  
 241:	c3                   	ret    

00000242 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 242:	55                   	push   %ebp
 243:	89 e5                	mov    %esp,%ebp
 245:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 24e:	8b 45 0c             	mov    0xc(%ebp),%eax
 251:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 254:	eb 13                	jmp    269 <memmove+0x27>
    *dst++ = *src++;
 256:	8b 45 fc             	mov    -0x4(%ebp),%eax
 259:	0f b6 10             	movzbl (%eax),%edx
 25c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 25f:	88 10                	mov    %dl,(%eax)
 261:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 265:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 269:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 26d:	0f 9f c0             	setg   %al
 270:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 274:	84 c0                	test   %al,%al
 276:	75 de                	jne    256 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 278:	8b 45 08             	mov    0x8(%ebp),%eax
}
 27b:	c9                   	leave  
 27c:	c3                   	ret    
 27d:	90                   	nop
 27e:	90                   	nop
 27f:	90                   	nop

00000280 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 280:	b8 01 00 00 00       	mov    $0x1,%eax
 285:	cd 40                	int    $0x40
 287:	c3                   	ret    

00000288 <exit>:
SYSCALL(exit)
 288:	b8 02 00 00 00       	mov    $0x2,%eax
 28d:	cd 40                	int    $0x40
 28f:	c3                   	ret    

00000290 <wait>:
SYSCALL(wait)
 290:	b8 03 00 00 00       	mov    $0x3,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <pipe>:
SYSCALL(pipe)
 298:	b8 04 00 00 00       	mov    $0x4,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <read>:
SYSCALL(read)
 2a0:	b8 05 00 00 00       	mov    $0x5,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <write>:
SYSCALL(write)
 2a8:	b8 10 00 00 00       	mov    $0x10,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <close>:
SYSCALL(close)
 2b0:	b8 15 00 00 00       	mov    $0x15,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <kill>:
SYSCALL(kill)
 2b8:	b8 06 00 00 00       	mov    $0x6,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <exec>:
SYSCALL(exec)
 2c0:	b8 07 00 00 00       	mov    $0x7,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <open>:
SYSCALL(open)
 2c8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <mknod>:
SYSCALL(mknod)
 2d0:	b8 11 00 00 00       	mov    $0x11,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <unlink>:
SYSCALL(unlink)
 2d8:	b8 12 00 00 00       	mov    $0x12,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <fstat>:
SYSCALL(fstat)
 2e0:	b8 08 00 00 00       	mov    $0x8,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <link>:
SYSCALL(link)
 2e8:	b8 13 00 00 00       	mov    $0x13,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <mkdir>:
SYSCALL(mkdir)
 2f0:	b8 14 00 00 00       	mov    $0x14,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <chdir>:
SYSCALL(chdir)
 2f8:	b8 09 00 00 00       	mov    $0x9,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <dup>:
SYSCALL(dup)
 300:	b8 0a 00 00 00       	mov    $0xa,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <getpid>:
SYSCALL(getpid)
 308:	b8 0b 00 00 00       	mov    $0xb,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <sbrk>:
SYSCALL(sbrk)
 310:	b8 0c 00 00 00       	mov    $0xc,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <sleep>:
SYSCALL(sleep)
 318:	b8 0d 00 00 00       	mov    $0xd,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <uptime>:
SYSCALL(uptime)
 320:	b8 0e 00 00 00       	mov    $0xe,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <clone>:
SYSCALL(clone)
 328:	b8 16 00 00 00       	mov    $0x16,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <texit>:
SYSCALL(texit)
 330:	b8 17 00 00 00       	mov    $0x17,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <tsleep>:
SYSCALL(tsleep)
 338:	b8 18 00 00 00       	mov    $0x18,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <twakeup>:
SYSCALL(twakeup)
 340:	b8 19 00 00 00       	mov    $0x19,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <test>:
SYSCALL(test)
 348:	b8 1a 00 00 00       	mov    $0x1a,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	83 ec 28             	sub    $0x28,%esp
 356:	8b 45 0c             	mov    0xc(%ebp),%eax
 359:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 35c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 363:	00 
 364:	8d 45 f4             	lea    -0xc(%ebp),%eax
 367:	89 44 24 04          	mov    %eax,0x4(%esp)
 36b:	8b 45 08             	mov    0x8(%ebp),%eax
 36e:	89 04 24             	mov    %eax,(%esp)
 371:	e8 32 ff ff ff       	call   2a8 <write>
}
 376:	c9                   	leave  
 377:	c3                   	ret    

00000378 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
 37b:	53                   	push   %ebx
 37c:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 37f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 386:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 38a:	74 17                	je     3a3 <printint+0x2b>
 38c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 390:	79 11                	jns    3a3 <printint+0x2b>
    neg = 1;
 392:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 399:	8b 45 0c             	mov    0xc(%ebp),%eax
 39c:	f7 d8                	neg    %eax
 39e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3a1:	eb 06                	jmp    3a9 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3a9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3b0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3b3:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3b9:	ba 00 00 00 00       	mov    $0x0,%edx
 3be:	f7 f3                	div    %ebx
 3c0:	89 d0                	mov    %edx,%eax
 3c2:	0f b6 80 cc 0b 00 00 	movzbl 0xbcc(%eax),%eax
 3c9:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 3cd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 3d1:	8b 45 10             	mov    0x10(%ebp),%eax
 3d4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3da:	ba 00 00 00 00       	mov    $0x0,%edx
 3df:	f7 75 d4             	divl   -0x2c(%ebp)
 3e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3e5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3e9:	75 c5                	jne    3b0 <printint+0x38>
  if(neg)
 3eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3ef:	74 28                	je     419 <printint+0xa1>
    buf[i++] = '-';
 3f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3f4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 3f9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 3fd:	eb 1a                	jmp    419 <printint+0xa1>
    putc(fd, buf[i]);
 3ff:	8b 45 ec             	mov    -0x14(%ebp),%eax
 402:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 407:	0f be c0             	movsbl %al,%eax
 40a:	89 44 24 04          	mov    %eax,0x4(%esp)
 40e:	8b 45 08             	mov    0x8(%ebp),%eax
 411:	89 04 24             	mov    %eax,(%esp)
 414:	e8 37 ff ff ff       	call   350 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 419:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 41d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 421:	79 dc                	jns    3ff <printint+0x87>
    putc(fd, buf[i]);
}
 423:	83 c4 44             	add    $0x44,%esp
 426:	5b                   	pop    %ebx
 427:	5d                   	pop    %ebp
 428:	c3                   	ret    

00000429 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 429:	55                   	push   %ebp
 42a:	89 e5                	mov    %esp,%ebp
 42c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 42f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 436:	8d 45 0c             	lea    0xc(%ebp),%eax
 439:	83 c0 04             	add    $0x4,%eax
 43c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 43f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 446:	e9 7e 01 00 00       	jmp    5c9 <printf+0x1a0>
    c = fmt[i] & 0xff;
 44b:	8b 55 0c             	mov    0xc(%ebp),%edx
 44e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 451:	8d 04 02             	lea    (%edx,%eax,1),%eax
 454:	0f b6 00             	movzbl (%eax),%eax
 457:	0f be c0             	movsbl %al,%eax
 45a:	25 ff 00 00 00       	and    $0xff,%eax
 45f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 462:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 466:	75 2c                	jne    494 <printf+0x6b>
      if(c == '%'){
 468:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 46c:	75 0c                	jne    47a <printf+0x51>
        state = '%';
 46e:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 475:	e9 4b 01 00 00       	jmp    5c5 <printf+0x19c>
      } else {
        putc(fd, c);
 47a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 47d:	0f be c0             	movsbl %al,%eax
 480:	89 44 24 04          	mov    %eax,0x4(%esp)
 484:	8b 45 08             	mov    0x8(%ebp),%eax
 487:	89 04 24             	mov    %eax,(%esp)
 48a:	e8 c1 fe ff ff       	call   350 <putc>
 48f:	e9 31 01 00 00       	jmp    5c5 <printf+0x19c>
      }
    } else if(state == '%'){
 494:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 498:	0f 85 27 01 00 00    	jne    5c5 <printf+0x19c>
      if(c == 'd'){
 49e:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4a2:	75 2d                	jne    4d1 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a7:	8b 00                	mov    (%eax),%eax
 4a9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4b0:	00 
 4b1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4b8:	00 
 4b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4bd:	8b 45 08             	mov    0x8(%ebp),%eax
 4c0:	89 04 24             	mov    %eax,(%esp)
 4c3:	e8 b0 fe ff ff       	call   378 <printint>
        ap++;
 4c8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 4cc:	e9 ed 00 00 00       	jmp    5be <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 4d1:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 4d5:	74 06                	je     4dd <printf+0xb4>
 4d7:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 4db:	75 2d                	jne    50a <printf+0xe1>
        printint(fd, *ap, 16, 0);
 4dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e0:	8b 00                	mov    (%eax),%eax
 4e2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4e9:	00 
 4ea:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4f1:	00 
 4f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f6:	8b 45 08             	mov    0x8(%ebp),%eax
 4f9:	89 04 24             	mov    %eax,(%esp)
 4fc:	e8 77 fe ff ff       	call   378 <printint>
        ap++;
 501:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 505:	e9 b4 00 00 00       	jmp    5be <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 50a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 50e:	75 46                	jne    556 <printf+0x12d>
        s = (char*)*ap;
 510:	8b 45 f4             	mov    -0xc(%ebp),%eax
 513:	8b 00                	mov    (%eax),%eax
 515:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 518:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 51c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 520:	75 27                	jne    549 <printf+0x120>
          s = "(null)";
 522:	c7 45 e4 82 0b 00 00 	movl   $0xb82,-0x1c(%ebp)
        while(*s != 0){
 529:	eb 1f                	jmp    54a <printf+0x121>
          putc(fd, *s);
 52b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 52e:	0f b6 00             	movzbl (%eax),%eax
 531:	0f be c0             	movsbl %al,%eax
 534:	89 44 24 04          	mov    %eax,0x4(%esp)
 538:	8b 45 08             	mov    0x8(%ebp),%eax
 53b:	89 04 24             	mov    %eax,(%esp)
 53e:	e8 0d fe ff ff       	call   350 <putc>
          s++;
 543:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 547:	eb 01                	jmp    54a <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 549:	90                   	nop
 54a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 54d:	0f b6 00             	movzbl (%eax),%eax
 550:	84 c0                	test   %al,%al
 552:	75 d7                	jne    52b <printf+0x102>
 554:	eb 68                	jmp    5be <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 556:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 55a:	75 1d                	jne    579 <printf+0x150>
        putc(fd, *ap);
 55c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 55f:	8b 00                	mov    (%eax),%eax
 561:	0f be c0             	movsbl %al,%eax
 564:	89 44 24 04          	mov    %eax,0x4(%esp)
 568:	8b 45 08             	mov    0x8(%ebp),%eax
 56b:	89 04 24             	mov    %eax,(%esp)
 56e:	e8 dd fd ff ff       	call   350 <putc>
        ap++;
 573:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 577:	eb 45                	jmp    5be <printf+0x195>
      } else if(c == '%'){
 579:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 57d:	75 17                	jne    596 <printf+0x16d>
        putc(fd, c);
 57f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 582:	0f be c0             	movsbl %al,%eax
 585:	89 44 24 04          	mov    %eax,0x4(%esp)
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	89 04 24             	mov    %eax,(%esp)
 58f:	e8 bc fd ff ff       	call   350 <putc>
 594:	eb 28                	jmp    5be <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 596:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 59d:	00 
 59e:	8b 45 08             	mov    0x8(%ebp),%eax
 5a1:	89 04 24             	mov    %eax,(%esp)
 5a4:	e8 a7 fd ff ff       	call   350 <putc>
        putc(fd, c);
 5a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ac:	0f be c0             	movsbl %al,%eax
 5af:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	89 04 24             	mov    %eax,(%esp)
 5b9:	e8 92 fd ff ff       	call   350 <putc>
      }
      state = 0;
 5be:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5c5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5c9:	8b 55 0c             	mov    0xc(%ebp),%edx
 5cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5cf:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5d2:	0f b6 00             	movzbl (%eax),%eax
 5d5:	84 c0                	test   %al,%al
 5d7:	0f 85 6e fe ff ff    	jne    44b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5dd:	c9                   	leave  
 5de:	c3                   	ret    
 5df:	90                   	nop

000005e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e0:	55                   	push   %ebp
 5e1:	89 e5                	mov    %esp,%ebp
 5e3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5e6:	8b 45 08             	mov    0x8(%ebp),%eax
 5e9:	83 e8 08             	sub    $0x8,%eax
 5ec:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ef:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 5f4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5f7:	eb 24                	jmp    61d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5fc:	8b 00                	mov    (%eax),%eax
 5fe:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 601:	77 12                	ja     615 <free+0x35>
 603:	8b 45 f8             	mov    -0x8(%ebp),%eax
 606:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 609:	77 24                	ja     62f <free+0x4f>
 60b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60e:	8b 00                	mov    (%eax),%eax
 610:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 613:	77 1a                	ja     62f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 615:	8b 45 fc             	mov    -0x4(%ebp),%eax
 618:	8b 00                	mov    (%eax),%eax
 61a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 61d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 620:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 623:	76 d4                	jbe    5f9 <free+0x19>
 625:	8b 45 fc             	mov    -0x4(%ebp),%eax
 628:	8b 00                	mov    (%eax),%eax
 62a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 62d:	76 ca                	jbe    5f9 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 62f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 632:	8b 40 04             	mov    0x4(%eax),%eax
 635:	c1 e0 03             	shl    $0x3,%eax
 638:	89 c2                	mov    %eax,%edx
 63a:	03 55 f8             	add    -0x8(%ebp),%edx
 63d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 640:	8b 00                	mov    (%eax),%eax
 642:	39 c2                	cmp    %eax,%edx
 644:	75 24                	jne    66a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 646:	8b 45 f8             	mov    -0x8(%ebp),%eax
 649:	8b 50 04             	mov    0x4(%eax),%edx
 64c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64f:	8b 00                	mov    (%eax),%eax
 651:	8b 40 04             	mov    0x4(%eax),%eax
 654:	01 c2                	add    %eax,%edx
 656:	8b 45 f8             	mov    -0x8(%ebp),%eax
 659:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 65c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65f:	8b 00                	mov    (%eax),%eax
 661:	8b 10                	mov    (%eax),%edx
 663:	8b 45 f8             	mov    -0x8(%ebp),%eax
 666:	89 10                	mov    %edx,(%eax)
 668:	eb 0a                	jmp    674 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 66a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66d:	8b 10                	mov    (%eax),%edx
 66f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 672:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 674:	8b 45 fc             	mov    -0x4(%ebp),%eax
 677:	8b 40 04             	mov    0x4(%eax),%eax
 67a:	c1 e0 03             	shl    $0x3,%eax
 67d:	03 45 fc             	add    -0x4(%ebp),%eax
 680:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 683:	75 20                	jne    6a5 <free+0xc5>
    p->s.size += bp->s.size;
 685:	8b 45 fc             	mov    -0x4(%ebp),%eax
 688:	8b 50 04             	mov    0x4(%eax),%edx
 68b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68e:	8b 40 04             	mov    0x4(%eax),%eax
 691:	01 c2                	add    %eax,%edx
 693:	8b 45 fc             	mov    -0x4(%ebp),%eax
 696:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 699:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69c:	8b 10                	mov    (%eax),%edx
 69e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a1:	89 10                	mov    %edx,(%eax)
 6a3:	eb 08                	jmp    6ad <free+0xcd>
  } else
    p->s.ptr = bp;
 6a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6ab:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b0:	a3 e8 0b 00 00       	mov    %eax,0xbe8
}
 6b5:	c9                   	leave  
 6b6:	c3                   	ret    

000006b7 <morecore>:

static Header*
morecore(uint nu)
{
 6b7:	55                   	push   %ebp
 6b8:	89 e5                	mov    %esp,%ebp
 6ba:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6bd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6c4:	77 07                	ja     6cd <morecore+0x16>
    nu = 4096;
 6c6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6cd:	8b 45 08             	mov    0x8(%ebp),%eax
 6d0:	c1 e0 03             	shl    $0x3,%eax
 6d3:	89 04 24             	mov    %eax,(%esp)
 6d6:	e8 35 fc ff ff       	call   310 <sbrk>
 6db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 6de:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 6e2:	75 07                	jne    6eb <morecore+0x34>
    return 0;
 6e4:	b8 00 00 00 00       	mov    $0x0,%eax
 6e9:	eb 22                	jmp    70d <morecore+0x56>
  hp = (Header*)p;
 6eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 6f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f4:	8b 55 08             	mov    0x8(%ebp),%edx
 6f7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fd:	83 c0 08             	add    $0x8,%eax
 700:	89 04 24             	mov    %eax,(%esp)
 703:	e8 d8 fe ff ff       	call   5e0 <free>
  return freep;
 708:	a1 e8 0b 00 00       	mov    0xbe8,%eax
}
 70d:	c9                   	leave  
 70e:	c3                   	ret    

0000070f <malloc>:

void*
malloc(uint nbytes)
{
 70f:	55                   	push   %ebp
 710:	89 e5                	mov    %esp,%ebp
 712:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	83 c0 07             	add    $0x7,%eax
 71b:	c1 e8 03             	shr    $0x3,%eax
 71e:	83 c0 01             	add    $0x1,%eax
 721:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 724:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 729:	89 45 f0             	mov    %eax,-0x10(%ebp)
 72c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 730:	75 23                	jne    755 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 732:	c7 45 f0 e0 0b 00 00 	movl   $0xbe0,-0x10(%ebp)
 739:	8b 45 f0             	mov    -0x10(%ebp),%eax
 73c:	a3 e8 0b 00 00       	mov    %eax,0xbe8
 741:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 746:	a3 e0 0b 00 00       	mov    %eax,0xbe0
    base.s.size = 0;
 74b:	c7 05 e4 0b 00 00 00 	movl   $0x0,0xbe4
 752:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 755:	8b 45 f0             	mov    -0x10(%ebp),%eax
 758:	8b 00                	mov    (%eax),%eax
 75a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 75d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 760:	8b 40 04             	mov    0x4(%eax),%eax
 763:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 766:	72 4d                	jb     7b5 <malloc+0xa6>
      if(p->s.size == nunits)
 768:	8b 45 ec             	mov    -0x14(%ebp),%eax
 76b:	8b 40 04             	mov    0x4(%eax),%eax
 76e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 771:	75 0c                	jne    77f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 773:	8b 45 ec             	mov    -0x14(%ebp),%eax
 776:	8b 10                	mov    (%eax),%edx
 778:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77b:	89 10                	mov    %edx,(%eax)
 77d:	eb 26                	jmp    7a5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 77f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 782:	8b 40 04             	mov    0x4(%eax),%eax
 785:	89 c2                	mov    %eax,%edx
 787:	2b 55 f4             	sub    -0xc(%ebp),%edx
 78a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 78d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 790:	8b 45 ec             	mov    -0x14(%ebp),%eax
 793:	8b 40 04             	mov    0x4(%eax),%eax
 796:	c1 e0 03             	shl    $0x3,%eax
 799:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 79c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 79f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7a2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a8:	a3 e8 0b 00 00       	mov    %eax,0xbe8
      return (void*)(p + 1);
 7ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b0:	83 c0 08             	add    $0x8,%eax
 7b3:	eb 38                	jmp    7ed <malloc+0xde>
    }
    if(p == freep)
 7b5:	a1 e8 0b 00 00       	mov    0xbe8,%eax
 7ba:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7bd:	75 1b                	jne    7da <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c2:	89 04 24             	mov    %eax,(%esp)
 7c5:	e8 ed fe ff ff       	call   6b7 <morecore>
 7ca:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7cd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7d1:	75 07                	jne    7da <malloc+0xcb>
        return 0;
 7d3:	b8 00 00 00 00       	mov    $0x0,%eax
 7d8:	eb 13                	jmp    7ed <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7da:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7dd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7e3:	8b 00                	mov    (%eax),%eax
 7e5:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7e8:	e9 70 ff ff ff       	jmp    75d <malloc+0x4e>
}
 7ed:	c9                   	leave  
 7ee:	c3                   	ret    
 7ef:	90                   	nop

000007f0 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 7f0:	55                   	push   %ebp
 7f1:	89 e5                	mov    %esp,%ebp
 7f3:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 7f6:	8b 55 08             	mov    0x8(%ebp),%edx
 7f9:	8b 45 0c             	mov    0xc(%ebp),%eax
 7fc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 7ff:	f0 87 02             	lock xchg %eax,(%edx)
 802:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 805:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 808:	c9                   	leave  
 809:	c3                   	ret    

0000080a <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 80a:	55                   	push   %ebp
 80b:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 80d:	8b 45 08             	mov    0x8(%ebp),%eax
 810:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 816:	5d                   	pop    %ebp
 817:	c3                   	ret    

00000818 <lock_acquire>:
void lock_acquire(lock_t *lock){
 818:	55                   	push   %ebp
 819:	89 e5                	mov    %esp,%ebp
 81b:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 81e:	8b 45 08             	mov    0x8(%ebp),%eax
 821:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 828:	00 
 829:	89 04 24             	mov    %eax,(%esp)
 82c:	e8 bf ff ff ff       	call   7f0 <xchg>
 831:	85 c0                	test   %eax,%eax
 833:	75 e9                	jne    81e <lock_acquire+0x6>
}
 835:	c9                   	leave  
 836:	c3                   	ret    

00000837 <lock_release>:
void lock_release(lock_t *lock){
 837:	55                   	push   %ebp
 838:	89 e5                	mov    %esp,%ebp
 83a:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 83d:	8b 45 08             	mov    0x8(%ebp),%eax
 840:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 847:	00 
 848:	89 04 24             	mov    %eax,(%esp)
 84b:	e8 a0 ff ff ff       	call   7f0 <xchg>
}
 850:	c9                   	leave  
 851:	c3                   	ret    

00000852 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 852:	55                   	push   %ebp
 853:	89 e5                	mov    %esp,%ebp
 855:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 858:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 85f:	e8 ab fe ff ff       	call   70f <malloc>
 864:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 867:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86a:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 86d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 870:	25 ff 0f 00 00       	and    $0xfff,%eax
 875:	85 c0                	test   %eax,%eax
 877:	74 15                	je     88e <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 879:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87c:	89 c2                	mov    %eax,%edx
 87e:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 884:	b8 00 10 00 00       	mov    $0x1000,%eax
 889:	29 d0                	sub    %edx,%eax
 88b:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 88e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 892:	75 1b                	jne    8af <thread_create+0x5d>

        printf(1,"malloc fail \n");
 894:	c7 44 24 04 89 0b 00 	movl   $0xb89,0x4(%esp)
 89b:	00 
 89c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8a3:	e8 81 fb ff ff       	call   429 <printf>
        return 0;
 8a8:	b8 00 00 00 00       	mov    $0x0,%eax
 8ad:	eb 6f                	jmp    91e <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 8af:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8b2:	8b 55 08             	mov    0x8(%ebp),%edx
 8b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8bc:	89 54 24 08          	mov    %edx,0x8(%esp)
 8c0:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 8c7:	00 
 8c8:	89 04 24             	mov    %eax,(%esp)
 8cb:	e8 58 fa ff ff       	call   328 <clone>
 8d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 8d3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8d7:	79 1b                	jns    8f4 <thread_create+0xa2>
        printf(1,"clone fails\n");
 8d9:	c7 44 24 04 97 0b 00 	movl   $0xb97,0x4(%esp)
 8e0:	00 
 8e1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8e8:	e8 3c fb ff ff       	call   429 <printf>
        return 0;
 8ed:	b8 00 00 00 00       	mov    $0x0,%eax
 8f2:	eb 2a                	jmp    91e <thread_create+0xcc>
    }
    if(tid > 0){
 8f4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8f8:	7e 05                	jle    8ff <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 8fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fd:	eb 1f                	jmp    91e <thread_create+0xcc>
    }
    if(tid == 0){
 8ff:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 903:	75 14                	jne    919 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 905:	c7 44 24 04 a4 0b 00 	movl   $0xba4,0x4(%esp)
 90c:	00 
 90d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 914:	e8 10 fb ff ff       	call   429 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 919:	b8 00 00 00 00       	mov    $0x0,%eax
}
 91e:	c9                   	leave  
 91f:	c3                   	ret    

00000920 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 920:	55                   	push   %ebp
 921:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 923:	8b 45 08             	mov    0x8(%ebp),%eax
 926:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 92c:	8b 45 08             	mov    0x8(%ebp),%eax
 92f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 936:	8b 45 08             	mov    0x8(%ebp),%eax
 939:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 940:	5d                   	pop    %ebp
 941:	c3                   	ret    

00000942 <add_q>:

void add_q(struct queue *q, int v){
 942:	55                   	push   %ebp
 943:	89 e5                	mov    %esp,%ebp
 945:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 948:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 94f:	e8 bb fd ff ff       	call   70f <malloc>
 954:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 957:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 961:	8b 45 f4             	mov    -0xc(%ebp),%eax
 964:	8b 55 0c             	mov    0xc(%ebp),%edx
 967:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 969:	8b 45 08             	mov    0x8(%ebp),%eax
 96c:	8b 40 04             	mov    0x4(%eax),%eax
 96f:	85 c0                	test   %eax,%eax
 971:	75 0b                	jne    97e <add_q+0x3c>
        q->head = n;
 973:	8b 45 08             	mov    0x8(%ebp),%eax
 976:	8b 55 f4             	mov    -0xc(%ebp),%edx
 979:	89 50 04             	mov    %edx,0x4(%eax)
 97c:	eb 0c                	jmp    98a <add_q+0x48>
    }else{
        q->tail->next = n;
 97e:	8b 45 08             	mov    0x8(%ebp),%eax
 981:	8b 40 08             	mov    0x8(%eax),%eax
 984:	8b 55 f4             	mov    -0xc(%ebp),%edx
 987:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 98a:	8b 45 08             	mov    0x8(%ebp),%eax
 98d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 990:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 993:	8b 45 08             	mov    0x8(%ebp),%eax
 996:	8b 00                	mov    (%eax),%eax
 998:	8d 50 01             	lea    0x1(%eax),%edx
 99b:	8b 45 08             	mov    0x8(%ebp),%eax
 99e:	89 10                	mov    %edx,(%eax)
}
 9a0:	c9                   	leave  
 9a1:	c3                   	ret    

000009a2 <empty_q>:

int empty_q(struct queue *q){
 9a2:	55                   	push   %ebp
 9a3:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 9a5:	8b 45 08             	mov    0x8(%ebp),%eax
 9a8:	8b 00                	mov    (%eax),%eax
 9aa:	85 c0                	test   %eax,%eax
 9ac:	75 07                	jne    9b5 <empty_q+0x13>
        return 1;
 9ae:	b8 01 00 00 00       	mov    $0x1,%eax
 9b3:	eb 05                	jmp    9ba <empty_q+0x18>
    else
        return 0;
 9b5:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 9ba:	5d                   	pop    %ebp
 9bb:	c3                   	ret    

000009bc <pop_q>:
int pop_q(struct queue *q){
 9bc:	55                   	push   %ebp
 9bd:	89 e5                	mov    %esp,%ebp
 9bf:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 9c2:	8b 45 08             	mov    0x8(%ebp),%eax
 9c5:	89 04 24             	mov    %eax,(%esp)
 9c8:	e8 d5 ff ff ff       	call   9a2 <empty_q>
 9cd:	85 c0                	test   %eax,%eax
 9cf:	75 5d                	jne    a2e <pop_q+0x72>
       val = q->head->value; 
 9d1:	8b 45 08             	mov    0x8(%ebp),%eax
 9d4:	8b 40 04             	mov    0x4(%eax),%eax
 9d7:	8b 00                	mov    (%eax),%eax
 9d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 9dc:	8b 45 08             	mov    0x8(%ebp),%eax
 9df:	8b 40 04             	mov    0x4(%eax),%eax
 9e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 9e5:	8b 45 08             	mov    0x8(%ebp),%eax
 9e8:	8b 40 04             	mov    0x4(%eax),%eax
 9eb:	8b 50 04             	mov    0x4(%eax),%edx
 9ee:	8b 45 08             	mov    0x8(%ebp),%eax
 9f1:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 9f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f7:	89 04 24             	mov    %eax,(%esp)
 9fa:	e8 e1 fb ff ff       	call   5e0 <free>
       q->size--;
 9ff:	8b 45 08             	mov    0x8(%ebp),%eax
 a02:	8b 00                	mov    (%eax),%eax
 a04:	8d 50 ff             	lea    -0x1(%eax),%edx
 a07:	8b 45 08             	mov    0x8(%ebp),%eax
 a0a:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a0c:	8b 45 08             	mov    0x8(%ebp),%eax
 a0f:	8b 00                	mov    (%eax),%eax
 a11:	85 c0                	test   %eax,%eax
 a13:	75 14                	jne    a29 <pop_q+0x6d>
            q->head = 0;
 a15:	8b 45 08             	mov    0x8(%ebp),%eax
 a18:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a1f:	8b 45 08             	mov    0x8(%ebp),%eax
 a22:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a29:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a2c:	eb 05                	jmp    a33 <pop_q+0x77>
    }
    return -1;
 a2e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a33:	c9                   	leave  
 a34:	c3                   	ret    
 a35:	90                   	nop
 a36:	90                   	nop
 a37:	90                   	nop

00000a38 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 a38:	55                   	push   %ebp
 a39:	89 e5                	mov    %esp,%ebp
 a3b:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 a3e:	8b 45 08             	mov    0x8(%ebp),%eax
 a41:	8b 55 0c             	mov    0xc(%ebp),%edx
 a44:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 a47:	8b 45 08             	mov    0x8(%ebp),%eax
 a4a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 a51:	8b 45 08             	mov    0x8(%ebp),%eax
 a54:	89 04 24             	mov    %eax,(%esp)
 a57:	e8 ae fd ff ff       	call   80a <lock_init>
}
 a5c:	c9                   	leave  
 a5d:	c3                   	ret    

00000a5e <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 a5e:	55                   	push   %ebp
 a5f:	89 e5                	mov    %esp,%ebp
 a61:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 a64:	8b 45 08             	mov    0x8(%ebp),%eax
 a67:	89 04 24             	mov    %eax,(%esp)
 a6a:	e8 a9 fd ff ff       	call   818 <lock_acquire>
	if(s->count  == 0){
 a6f:	8b 45 08             	mov    0x8(%ebp),%eax
 a72:	8b 40 04             	mov    0x4(%eax),%eax
 a75:	85 c0                	test   %eax,%eax
 a77:	75 43                	jne    abc <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 a79:	c7 44 24 04 b5 0b 00 	movl   $0xbb5,0x4(%esp)
 a80:	00 
 a81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a88:	e8 9c f9 ff ff       	call   429 <printf>
		//add proc to waiters list
		int tid = getpid();
 a8d:	e8 76 f8 ff ff       	call   308 <getpid>
 a92:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 a95:	8b 45 08             	mov    0x8(%ebp),%eax
 a98:	8d 50 0c             	lea    0xc(%eax),%edx
 a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9e:	89 44 24 04          	mov    %eax,0x4(%esp)
 aa2:	89 14 24             	mov    %edx,(%esp)
 aa5:	e8 98 fe ff ff       	call   942 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 aaa:	8b 45 08             	mov    0x8(%ebp),%eax
 aad:	89 04 24             	mov    %eax,(%esp)
 ab0:	e8 82 fd ff ff       	call   837 <lock_release>
		tsleep(); 
 ab5:	e8 7e f8 ff ff       	call   338 <tsleep>
 aba:	eb 2e                	jmp    aea <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 abc:	c7 44 24 04 bc 0b 00 	movl   $0xbbc,0x4(%esp)
 ac3:	00 
 ac4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 acb:	e8 59 f9 ff ff       	call   429 <printf>
		s->count--;	
 ad0:	8b 45 08             	mov    0x8(%ebp),%eax
 ad3:	8b 40 04             	mov    0x4(%eax),%eax
 ad6:	8d 50 ff             	lea    -0x1(%eax),%edx
 ad9:	8b 45 08             	mov    0x8(%ebp),%eax
 adc:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 adf:	8b 45 08             	mov    0x8(%ebp),%eax
 ae2:	89 04 24             	mov    %eax,(%esp)
 ae5:	e8 4d fd ff ff       	call   837 <lock_release>
	}
}
 aea:	c9                   	leave  
 aeb:	c3                   	ret    

00000aec <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 aec:	55                   	push   %ebp
 aed:	89 e5                	mov    %esp,%ebp
 aef:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 af2:	c7 44 24 04 c3 0b 00 	movl   $0xbc3,0x4(%esp)
 af9:	00 
 afa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b01:	e8 23 f9 ff ff       	call   429 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b06:	8b 45 08             	mov    0x8(%ebp),%eax
 b09:	89 04 24             	mov    %eax,(%esp)
 b0c:	e8 07 fd ff ff       	call   818 <lock_acquire>
	if(s->count < s->size){
 b11:	8b 45 08             	mov    0x8(%ebp),%eax
 b14:	8b 50 04             	mov    0x4(%eax),%edx
 b17:	8b 45 08             	mov    0x8(%ebp),%eax
 b1a:	8b 40 08             	mov    0x8(%eax),%eax
 b1d:	39 c2                	cmp    %eax,%edx
 b1f:	7d 0f                	jge    b30 <sem_signal+0x44>
		s->count++;	
 b21:	8b 45 08             	mov    0x8(%ebp),%eax
 b24:	8b 40 04             	mov    0x4(%eax),%eax
 b27:	8d 50 01             	lea    0x1(%eax),%edx
 b2a:	8b 45 08             	mov    0x8(%ebp),%eax
 b2d:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 b30:	8b 45 08             	mov    0x8(%ebp),%eax
 b33:	83 c0 0c             	add    $0xc,%eax
 b36:	89 04 24             	mov    %eax,(%esp)
 b39:	e8 7e fe ff ff       	call   9bc <pop_q>
 b3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 b41:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b45:	74 2e                	je     b75 <sem_signal+0x89>
		printf(1, "Sem A\n");
 b47:	c7 44 24 04 bc 0b 00 	movl   $0xbbc,0x4(%esp)
 b4e:	00 
 b4f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b56:	e8 ce f8 ff ff       	call   429 <printf>
		twakeup(tid);
 b5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b5e:	89 04 24             	mov    %eax,(%esp)
 b61:	e8 da f7 ff ff       	call   340 <twakeup>
		s->count--;
 b66:	8b 45 08             	mov    0x8(%ebp),%eax
 b69:	8b 40 04             	mov    0x4(%eax),%eax
 b6c:	8d 50 ff             	lea    -0x1(%eax),%edx
 b6f:	8b 45 08             	mov    0x8(%ebp),%eax
 b72:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 b75:	8b 45 08             	mov    0x8(%ebp),%eax
 b78:	89 04 24             	mov    %eax,(%esp)
 b7b:	e8 b7 fc ff ff       	call   837 <lock_release>

 b80:	c9                   	leave  
 b81:	c3                   	ret    
