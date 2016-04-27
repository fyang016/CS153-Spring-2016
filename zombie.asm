
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

00000338 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 338:	55                   	push   %ebp
 339:	89 e5                	mov    %esp,%ebp
 33b:	83 ec 28             	sub    $0x28,%esp
 33e:	8b 45 0c             	mov    0xc(%ebp),%eax
 341:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 344:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 34b:	00 
 34c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 34f:	89 44 24 04          	mov    %eax,0x4(%esp)
 353:	8b 45 08             	mov    0x8(%ebp),%eax
 356:	89 04 24             	mov    %eax,(%esp)
 359:	e8 4a ff ff ff       	call   2a8 <write>
}
 35e:	c9                   	leave  
 35f:	c3                   	ret    

00000360 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	53                   	push   %ebx
 364:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 367:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 36e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 372:	74 17                	je     38b <printint+0x2b>
 374:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 378:	79 11                	jns    38b <printint+0x2b>
    neg = 1;
 37a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 381:	8b 45 0c             	mov    0xc(%ebp),%eax
 384:	f7 d8                	neg    %eax
 386:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 389:	eb 06                	jmp    391 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 38b:	8b 45 0c             	mov    0xc(%ebp),%eax
 38e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 391:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 398:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 39b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 39e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a1:	ba 00 00 00 00       	mov    $0x0,%edx
 3a6:	f7 f3                	div    %ebx
 3a8:	89 d0                	mov    %edx,%eax
 3aa:	0f b6 80 3c 09 00 00 	movzbl 0x93c(%eax),%eax
 3b1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 3b5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 3b9:	8b 45 10             	mov    0x10(%ebp),%eax
 3bc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3c2:	ba 00 00 00 00       	mov    $0x0,%edx
 3c7:	f7 75 d4             	divl   -0x2c(%ebp)
 3ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3cd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3d1:	75 c5                	jne    398 <printint+0x38>
  if(neg)
 3d3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3d7:	74 28                	je     401 <printint+0xa1>
    buf[i++] = '-';
 3d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3dc:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 3e1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 3e5:	eb 1a                	jmp    401 <printint+0xa1>
    putc(fd, buf[i]);
 3e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ea:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 3ef:	0f be c0             	movsbl %al,%eax
 3f2:	89 44 24 04          	mov    %eax,0x4(%esp)
 3f6:	8b 45 08             	mov    0x8(%ebp),%eax
 3f9:	89 04 24             	mov    %eax,(%esp)
 3fc:	e8 37 ff ff ff       	call   338 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 401:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 405:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 409:	79 dc                	jns    3e7 <printint+0x87>
    putc(fd, buf[i]);
}
 40b:	83 c4 44             	add    $0x44,%esp
 40e:	5b                   	pop    %ebx
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret    

00000411 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 411:	55                   	push   %ebp
 412:	89 e5                	mov    %esp,%ebp
 414:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 417:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 41e:	8d 45 0c             	lea    0xc(%ebp),%eax
 421:	83 c0 04             	add    $0x4,%eax
 424:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 427:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 42e:	e9 7e 01 00 00       	jmp    5b1 <printf+0x1a0>
    c = fmt[i] & 0xff;
 433:	8b 55 0c             	mov    0xc(%ebp),%edx
 436:	8b 45 ec             	mov    -0x14(%ebp),%eax
 439:	8d 04 02             	lea    (%edx,%eax,1),%eax
 43c:	0f b6 00             	movzbl (%eax),%eax
 43f:	0f be c0             	movsbl %al,%eax
 442:	25 ff 00 00 00       	and    $0xff,%eax
 447:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 44a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 44e:	75 2c                	jne    47c <printf+0x6b>
      if(c == '%'){
 450:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 454:	75 0c                	jne    462 <printf+0x51>
        state = '%';
 456:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 45d:	e9 4b 01 00 00       	jmp    5ad <printf+0x19c>
      } else {
        putc(fd, c);
 462:	8b 45 e8             	mov    -0x18(%ebp),%eax
 465:	0f be c0             	movsbl %al,%eax
 468:	89 44 24 04          	mov    %eax,0x4(%esp)
 46c:	8b 45 08             	mov    0x8(%ebp),%eax
 46f:	89 04 24             	mov    %eax,(%esp)
 472:	e8 c1 fe ff ff       	call   338 <putc>
 477:	e9 31 01 00 00       	jmp    5ad <printf+0x19c>
      }
    } else if(state == '%'){
 47c:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 480:	0f 85 27 01 00 00    	jne    5ad <printf+0x19c>
      if(c == 'd'){
 486:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 48a:	75 2d                	jne    4b9 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 48c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 48f:	8b 00                	mov    (%eax),%eax
 491:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 498:	00 
 499:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4a0:	00 
 4a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a5:	8b 45 08             	mov    0x8(%ebp),%eax
 4a8:	89 04 24             	mov    %eax,(%esp)
 4ab:	e8 b0 fe ff ff       	call   360 <printint>
        ap++;
 4b0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 4b4:	e9 ed 00 00 00       	jmp    5a6 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 4b9:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 4bd:	74 06                	je     4c5 <printf+0xb4>
 4bf:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 4c3:	75 2d                	jne    4f2 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 4c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c8:	8b 00                	mov    (%eax),%eax
 4ca:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4d1:	00 
 4d2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4d9:	00 
 4da:	89 44 24 04          	mov    %eax,0x4(%esp)
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
 4e1:	89 04 24             	mov    %eax,(%esp)
 4e4:	e8 77 fe ff ff       	call   360 <printint>
        ap++;
 4e9:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 4ed:	e9 b4 00 00 00       	jmp    5a6 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 4f2:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 4f6:	75 46                	jne    53e <printf+0x12d>
        s = (char*)*ap;
 4f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4fb:	8b 00                	mov    (%eax),%eax
 4fd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 500:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 504:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 508:	75 27                	jne    531 <printf+0x120>
          s = "(null)";
 50a:	c7 45 e4 09 09 00 00 	movl   $0x909,-0x1c(%ebp)
        while(*s != 0){
 511:	eb 1f                	jmp    532 <printf+0x121>
          putc(fd, *s);
 513:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 516:	0f b6 00             	movzbl (%eax),%eax
 519:	0f be c0             	movsbl %al,%eax
 51c:	89 44 24 04          	mov    %eax,0x4(%esp)
 520:	8b 45 08             	mov    0x8(%ebp),%eax
 523:	89 04 24             	mov    %eax,(%esp)
 526:	e8 0d fe ff ff       	call   338 <putc>
          s++;
 52b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 52f:	eb 01                	jmp    532 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 531:	90                   	nop
 532:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 535:	0f b6 00             	movzbl (%eax),%eax
 538:	84 c0                	test   %al,%al
 53a:	75 d7                	jne    513 <printf+0x102>
 53c:	eb 68                	jmp    5a6 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 53e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 542:	75 1d                	jne    561 <printf+0x150>
        putc(fd, *ap);
 544:	8b 45 f4             	mov    -0xc(%ebp),%eax
 547:	8b 00                	mov    (%eax),%eax
 549:	0f be c0             	movsbl %al,%eax
 54c:	89 44 24 04          	mov    %eax,0x4(%esp)
 550:	8b 45 08             	mov    0x8(%ebp),%eax
 553:	89 04 24             	mov    %eax,(%esp)
 556:	e8 dd fd ff ff       	call   338 <putc>
        ap++;
 55b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 55f:	eb 45                	jmp    5a6 <printf+0x195>
      } else if(c == '%'){
 561:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 565:	75 17                	jne    57e <printf+0x16d>
        putc(fd, c);
 567:	8b 45 e8             	mov    -0x18(%ebp),%eax
 56a:	0f be c0             	movsbl %al,%eax
 56d:	89 44 24 04          	mov    %eax,0x4(%esp)
 571:	8b 45 08             	mov    0x8(%ebp),%eax
 574:	89 04 24             	mov    %eax,(%esp)
 577:	e8 bc fd ff ff       	call   338 <putc>
 57c:	eb 28                	jmp    5a6 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 57e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 585:	00 
 586:	8b 45 08             	mov    0x8(%ebp),%eax
 589:	89 04 24             	mov    %eax,(%esp)
 58c:	e8 a7 fd ff ff       	call   338 <putc>
        putc(fd, c);
 591:	8b 45 e8             	mov    -0x18(%ebp),%eax
 594:	0f be c0             	movsbl %al,%eax
 597:	89 44 24 04          	mov    %eax,0x4(%esp)
 59b:	8b 45 08             	mov    0x8(%ebp),%eax
 59e:	89 04 24             	mov    %eax,(%esp)
 5a1:	e8 92 fd ff ff       	call   338 <putc>
      }
      state = 0;
 5a6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5ad:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5b1:	8b 55 0c             	mov    0xc(%ebp),%edx
 5b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5b7:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5ba:	0f b6 00             	movzbl (%eax),%eax
 5bd:	84 c0                	test   %al,%al
 5bf:	0f 85 6e fe ff ff    	jne    433 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5c5:	c9                   	leave  
 5c6:	c3                   	ret    
 5c7:	90                   	nop

000005c8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5c8:	55                   	push   %ebp
 5c9:	89 e5                	mov    %esp,%ebp
 5cb:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5ce:	8b 45 08             	mov    0x8(%ebp),%eax
 5d1:	83 e8 08             	sub    $0x8,%eax
 5d4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5d7:	a1 58 09 00 00       	mov    0x958,%eax
 5dc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5df:	eb 24                	jmp    605 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5e4:	8b 00                	mov    (%eax),%eax
 5e6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5e9:	77 12                	ja     5fd <free+0x35>
 5eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5ee:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 5f1:	77 24                	ja     617 <free+0x4f>
 5f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5f6:	8b 00                	mov    (%eax),%eax
 5f8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 5fb:	77 1a                	ja     617 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 600:	8b 00                	mov    (%eax),%eax
 602:	89 45 fc             	mov    %eax,-0x4(%ebp)
 605:	8b 45 f8             	mov    -0x8(%ebp),%eax
 608:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60b:	76 d4                	jbe    5e1 <free+0x19>
 60d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 610:	8b 00                	mov    (%eax),%eax
 612:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 615:	76 ca                	jbe    5e1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 617:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61a:	8b 40 04             	mov    0x4(%eax),%eax
 61d:	c1 e0 03             	shl    $0x3,%eax
 620:	89 c2                	mov    %eax,%edx
 622:	03 55 f8             	add    -0x8(%ebp),%edx
 625:	8b 45 fc             	mov    -0x4(%ebp),%eax
 628:	8b 00                	mov    (%eax),%eax
 62a:	39 c2                	cmp    %eax,%edx
 62c:	75 24                	jne    652 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 62e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 631:	8b 50 04             	mov    0x4(%eax),%edx
 634:	8b 45 fc             	mov    -0x4(%ebp),%eax
 637:	8b 00                	mov    (%eax),%eax
 639:	8b 40 04             	mov    0x4(%eax),%eax
 63c:	01 c2                	add    %eax,%edx
 63e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 641:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 644:	8b 45 fc             	mov    -0x4(%ebp),%eax
 647:	8b 00                	mov    (%eax),%eax
 649:	8b 10                	mov    (%eax),%edx
 64b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64e:	89 10                	mov    %edx,(%eax)
 650:	eb 0a                	jmp    65c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 652:	8b 45 fc             	mov    -0x4(%ebp),%eax
 655:	8b 10                	mov    (%eax),%edx
 657:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 65c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65f:	8b 40 04             	mov    0x4(%eax),%eax
 662:	c1 e0 03             	shl    $0x3,%eax
 665:	03 45 fc             	add    -0x4(%ebp),%eax
 668:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 66b:	75 20                	jne    68d <free+0xc5>
    p->s.size += bp->s.size;
 66d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 670:	8b 50 04             	mov    0x4(%eax),%edx
 673:	8b 45 f8             	mov    -0x8(%ebp),%eax
 676:	8b 40 04             	mov    0x4(%eax),%eax
 679:	01 c2                	add    %eax,%edx
 67b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 681:	8b 45 f8             	mov    -0x8(%ebp),%eax
 684:	8b 10                	mov    (%eax),%edx
 686:	8b 45 fc             	mov    -0x4(%ebp),%eax
 689:	89 10                	mov    %edx,(%eax)
 68b:	eb 08                	jmp    695 <free+0xcd>
  } else
    p->s.ptr = bp;
 68d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 690:	8b 55 f8             	mov    -0x8(%ebp),%edx
 693:	89 10                	mov    %edx,(%eax)
  freep = p;
 695:	8b 45 fc             	mov    -0x4(%ebp),%eax
 698:	a3 58 09 00 00       	mov    %eax,0x958
}
 69d:	c9                   	leave  
 69e:	c3                   	ret    

0000069f <morecore>:

static Header*
morecore(uint nu)
{
 69f:	55                   	push   %ebp
 6a0:	89 e5                	mov    %esp,%ebp
 6a2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6a5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6ac:	77 07                	ja     6b5 <morecore+0x16>
    nu = 4096;
 6ae:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	c1 e0 03             	shl    $0x3,%eax
 6bb:	89 04 24             	mov    %eax,(%esp)
 6be:	e8 4d fc ff ff       	call   310 <sbrk>
 6c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 6c6:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 6ca:	75 07                	jne    6d3 <morecore+0x34>
    return 0;
 6cc:	b8 00 00 00 00       	mov    $0x0,%eax
 6d1:	eb 22                	jmp    6f5 <morecore+0x56>
  hp = (Header*)p;
 6d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 6d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6dc:	8b 55 08             	mov    0x8(%ebp),%edx
 6df:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 6e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e5:	83 c0 08             	add    $0x8,%eax
 6e8:	89 04 24             	mov    %eax,(%esp)
 6eb:	e8 d8 fe ff ff       	call   5c8 <free>
  return freep;
 6f0:	a1 58 09 00 00       	mov    0x958,%eax
}
 6f5:	c9                   	leave  
 6f6:	c3                   	ret    

000006f7 <malloc>:

void*
malloc(uint nbytes)
{
 6f7:	55                   	push   %ebp
 6f8:	89 e5                	mov    %esp,%ebp
 6fa:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 6fd:	8b 45 08             	mov    0x8(%ebp),%eax
 700:	83 c0 07             	add    $0x7,%eax
 703:	c1 e8 03             	shr    $0x3,%eax
 706:	83 c0 01             	add    $0x1,%eax
 709:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 70c:	a1 58 09 00 00       	mov    0x958,%eax
 711:	89 45 f0             	mov    %eax,-0x10(%ebp)
 714:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 718:	75 23                	jne    73d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 71a:	c7 45 f0 50 09 00 00 	movl   $0x950,-0x10(%ebp)
 721:	8b 45 f0             	mov    -0x10(%ebp),%eax
 724:	a3 58 09 00 00       	mov    %eax,0x958
 729:	a1 58 09 00 00       	mov    0x958,%eax
 72e:	a3 50 09 00 00       	mov    %eax,0x950
    base.s.size = 0;
 733:	c7 05 54 09 00 00 00 	movl   $0x0,0x954
 73a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 73d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 740:	8b 00                	mov    (%eax),%eax
 742:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 745:	8b 45 ec             	mov    -0x14(%ebp),%eax
 748:	8b 40 04             	mov    0x4(%eax),%eax
 74b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 74e:	72 4d                	jb     79d <malloc+0xa6>
      if(p->s.size == nunits)
 750:	8b 45 ec             	mov    -0x14(%ebp),%eax
 753:	8b 40 04             	mov    0x4(%eax),%eax
 756:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 759:	75 0c                	jne    767 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 75b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 75e:	8b 10                	mov    (%eax),%edx
 760:	8b 45 f0             	mov    -0x10(%ebp),%eax
 763:	89 10                	mov    %edx,(%eax)
 765:	eb 26                	jmp    78d <malloc+0x96>
      else {
        p->s.size -= nunits;
 767:	8b 45 ec             	mov    -0x14(%ebp),%eax
 76a:	8b 40 04             	mov    0x4(%eax),%eax
 76d:	89 c2                	mov    %eax,%edx
 76f:	2b 55 f4             	sub    -0xc(%ebp),%edx
 772:	8b 45 ec             	mov    -0x14(%ebp),%eax
 775:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 778:	8b 45 ec             	mov    -0x14(%ebp),%eax
 77b:	8b 40 04             	mov    0x4(%eax),%eax
 77e:	c1 e0 03             	shl    $0x3,%eax
 781:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 784:	8b 45 ec             	mov    -0x14(%ebp),%eax
 787:	8b 55 f4             	mov    -0xc(%ebp),%edx
 78a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 78d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 790:	a3 58 09 00 00       	mov    %eax,0x958
      return (void*)(p + 1);
 795:	8b 45 ec             	mov    -0x14(%ebp),%eax
 798:	83 c0 08             	add    $0x8,%eax
 79b:	eb 38                	jmp    7d5 <malloc+0xde>
    }
    if(p == freep)
 79d:	a1 58 09 00 00       	mov    0x958,%eax
 7a2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7a5:	75 1b                	jne    7c2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7aa:	89 04 24             	mov    %eax,(%esp)
 7ad:	e8 ed fe ff ff       	call   69f <morecore>
 7b2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7b5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7b9:	75 07                	jne    7c2 <malloc+0xcb>
        return 0;
 7bb:	b8 00 00 00 00       	mov    $0x0,%eax
 7c0:	eb 13                	jmp    7d5 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7c2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7cb:	8b 00                	mov    (%eax),%eax
 7cd:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7d0:	e9 70 ff ff ff       	jmp    745 <malloc+0x4e>
}
 7d5:	c9                   	leave  
 7d6:	c3                   	ret    
 7d7:	90                   	nop

000007d8 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 7d8:	55                   	push   %ebp
 7d9:	89 e5                	mov    %esp,%ebp
 7db:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 7de:	8b 55 08             	mov    0x8(%ebp),%edx
 7e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 7e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
 7e7:	f0 87 02             	lock xchg %eax,(%edx)
 7ea:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 7ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 7f0:	c9                   	leave  
 7f1:	c3                   	ret    

000007f2 <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 7f2:	55                   	push   %ebp
 7f3:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 7fe:	5d                   	pop    %ebp
 7ff:	c3                   	ret    

00000800 <lock_acquire>:
void lock_acquire(lock_t *lock){
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 806:	8b 45 08             	mov    0x8(%ebp),%eax
 809:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 810:	00 
 811:	89 04 24             	mov    %eax,(%esp)
 814:	e8 bf ff ff ff       	call   7d8 <xchg>
 819:	85 c0                	test   %eax,%eax
 81b:	75 e9                	jne    806 <lock_acquire+0x6>
}
 81d:	c9                   	leave  
 81e:	c3                   	ret    

0000081f <lock_release>:
void lock_release(lock_t *lock){
 81f:	55                   	push   %ebp
 820:	89 e5                	mov    %esp,%ebp
 822:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 825:	8b 45 08             	mov    0x8(%ebp),%eax
 828:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 82f:	00 
 830:	89 04 24             	mov    %eax,(%esp)
 833:	e8 a0 ff ff ff       	call   7d8 <xchg>
}
 838:	c9                   	leave  
 839:	c3                   	ret    

0000083a <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 83a:	55                   	push   %ebp
 83b:	89 e5                	mov    %esp,%ebp
 83d:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 840:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 847:	e8 ab fe ff ff       	call   6f7 <malloc>
 84c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 84f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 852:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 855:	8b 45 f0             	mov    -0x10(%ebp),%eax
 858:	25 ff 0f 00 00       	and    $0xfff,%eax
 85d:	85 c0                	test   %eax,%eax
 85f:	74 15                	je     876 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 861:	8b 45 f0             	mov    -0x10(%ebp),%eax
 864:	89 c2                	mov    %eax,%edx
 866:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 86c:	b8 00 10 00 00       	mov    $0x1000,%eax
 871:	29 d0                	sub    %edx,%eax
 873:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 876:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 87a:	75 1b                	jne    897 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 87c:	c7 44 24 04 10 09 00 	movl   $0x910,0x4(%esp)
 883:	00 
 884:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 88b:	e8 81 fb ff ff       	call   411 <printf>
        return 0;
 890:	b8 00 00 00 00       	mov    $0x0,%eax
 895:	eb 70                	jmp    907 <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 897:	8b 55 08             	mov    0x8(%ebp),%edx
 89a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 8a4:	00 
 8a5:	89 54 24 08          	mov    %edx,0x8(%esp)
 8a9:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 8b0:	00 
 8b1:	89 04 24             	mov    %eax,(%esp)
 8b4:	e8 6f fa ff ff       	call   328 <clone>
 8b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 8bc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8c0:	79 1b                	jns    8dd <thread_create+0xa3>
        printf(1,"clone fails\n");
 8c2:	c7 44 24 04 1e 09 00 	movl   $0x91e,0x4(%esp)
 8c9:	00 
 8ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8d1:	e8 3b fb ff ff       	call   411 <printf>
        return 0;
 8d6:	b8 00 00 00 00       	mov    $0x0,%eax
 8db:	eb 2a                	jmp    907 <thread_create+0xcd>
    }
    if(tid > 0){
 8dd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8e1:	7e 05                	jle    8e8 <thread_create+0xae>
        return garbage_stack;
 8e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e6:	eb 1f                	jmp    907 <thread_create+0xcd>
    }
    if(tid == 0){
 8e8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8ec:	75 14                	jne    902 <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 8ee:	c7 44 24 04 2b 09 00 	movl   $0x92b,0x4(%esp)
 8f5:	00 
 8f6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8fd:	e8 0f fb ff ff       	call   411 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 902:	b8 00 00 00 00       	mov    $0x0,%eax
}
 907:	c9                   	leave  
 908:	c3                   	ret    
