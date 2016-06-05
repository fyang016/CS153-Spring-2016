
_testing:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
//#include "h2o.c"
//#include "thread.c"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
	printf(1, "Running the test\n");
   9:	c7 44 24 04 a2 0b 00 	movl   $0xba2,0x4(%esp)
  10:	00 
  11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  18:	e8 2c 04 00 00       	call   449 <printf>
	test(3);
  1d:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  24:	e8 3f 03 00 00       	call   368 <test>
	printf(1, "Testing finished\n");
  29:	c7 44 24 04 b4 0b 00 	movl   $0xbb4,0x4(%esp)
  30:	00 
  31:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  38:	e8 0c 04 00 00       	call   449 <printf>
  
	exit();
  3d:	e8 66 02 00 00       	call   2a8 <exit>
  42:	90                   	nop
  43:	90                   	nop

00000044 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  44:	55                   	push   %ebp
  45:	89 e5                	mov    %esp,%ebp
  47:	57                   	push   %edi
  48:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  49:	8b 4d 08             	mov    0x8(%ebp),%ecx
  4c:	8b 55 10             	mov    0x10(%ebp),%edx
  4f:	8b 45 0c             	mov    0xc(%ebp),%eax
  52:	89 cb                	mov    %ecx,%ebx
  54:	89 df                	mov    %ebx,%edi
  56:	89 d1                	mov    %edx,%ecx
  58:	fc                   	cld    
  59:	f3 aa                	rep stos %al,%es:(%edi)
  5b:	89 ca                	mov    %ecx,%edx
  5d:	89 fb                	mov    %edi,%ebx
  5f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  62:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  65:	5b                   	pop    %ebx
  66:	5f                   	pop    %edi
  67:	5d                   	pop    %ebp
  68:	c3                   	ret    

00000069 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  69:	55                   	push   %ebp
  6a:	89 e5                	mov    %esp,%ebp
  6c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  6f:	8b 45 08             	mov    0x8(%ebp),%eax
  72:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  75:	8b 45 0c             	mov    0xc(%ebp),%eax
  78:	0f b6 10             	movzbl (%eax),%edx
  7b:	8b 45 08             	mov    0x8(%ebp),%eax
  7e:	88 10                	mov    %dl,(%eax)
  80:	8b 45 08             	mov    0x8(%ebp),%eax
  83:	0f b6 00             	movzbl (%eax),%eax
  86:	84 c0                	test   %al,%al
  88:	0f 95 c0             	setne  %al
  8b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  8f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  93:	84 c0                	test   %al,%al
  95:	75 de                	jne    75 <strcpy+0xc>
    ;
  return os;
  97:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  9a:	c9                   	leave  
  9b:	c3                   	ret    

0000009c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  9c:	55                   	push   %ebp
  9d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  9f:	eb 08                	jmp    a9 <strcmp+0xd>
    p++, q++;
  a1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  a5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  a9:	8b 45 08             	mov    0x8(%ebp),%eax
  ac:	0f b6 00             	movzbl (%eax),%eax
  af:	84 c0                	test   %al,%al
  b1:	74 10                	je     c3 <strcmp+0x27>
  b3:	8b 45 08             	mov    0x8(%ebp),%eax
  b6:	0f b6 10             	movzbl (%eax),%edx
  b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  bc:	0f b6 00             	movzbl (%eax),%eax
  bf:	38 c2                	cmp    %al,%dl
  c1:	74 de                	je     a1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  c3:	8b 45 08             	mov    0x8(%ebp),%eax
  c6:	0f b6 00             	movzbl (%eax),%eax
  c9:	0f b6 d0             	movzbl %al,%edx
  cc:	8b 45 0c             	mov    0xc(%ebp),%eax
  cf:	0f b6 00             	movzbl (%eax),%eax
  d2:	0f b6 c0             	movzbl %al,%eax
  d5:	89 d1                	mov    %edx,%ecx
  d7:	29 c1                	sub    %eax,%ecx
  d9:	89 c8                	mov    %ecx,%eax
}
  db:	5d                   	pop    %ebp
  dc:	c3                   	ret    

000000dd <strlen>:

uint
strlen(char *s)
{
  dd:	55                   	push   %ebp
  de:	89 e5                	mov    %esp,%ebp
  e0:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  e3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  ea:	eb 04                	jmp    f0 <strlen+0x13>
  ec:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  f3:	03 45 08             	add    0x8(%ebp),%eax
  f6:	0f b6 00             	movzbl (%eax),%eax
  f9:	84 c0                	test   %al,%al
  fb:	75 ef                	jne    ec <strlen+0xf>
    ;
  return n;
  fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <memset>:

void*
memset(void *dst, int c, uint n)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 108:	8b 45 10             	mov    0x10(%ebp),%eax
 10b:	89 44 24 08          	mov    %eax,0x8(%esp)
 10f:	8b 45 0c             	mov    0xc(%ebp),%eax
 112:	89 44 24 04          	mov    %eax,0x4(%esp)
 116:	8b 45 08             	mov    0x8(%ebp),%eax
 119:	89 04 24             	mov    %eax,(%esp)
 11c:	e8 23 ff ff ff       	call   44 <stosb>
  return dst;
 121:	8b 45 08             	mov    0x8(%ebp),%eax
}
 124:	c9                   	leave  
 125:	c3                   	ret    

00000126 <strchr>:

char*
strchr(const char *s, char c)
{
 126:	55                   	push   %ebp
 127:	89 e5                	mov    %esp,%ebp
 129:	83 ec 04             	sub    $0x4,%esp
 12c:	8b 45 0c             	mov    0xc(%ebp),%eax
 12f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 132:	eb 14                	jmp    148 <strchr+0x22>
    if(*s == c)
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	0f b6 00             	movzbl (%eax),%eax
 13a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 13d:	75 05                	jne    144 <strchr+0x1e>
      return (char*)s;
 13f:	8b 45 08             	mov    0x8(%ebp),%eax
 142:	eb 13                	jmp    157 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 144:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	0f b6 00             	movzbl (%eax),%eax
 14e:	84 c0                	test   %al,%al
 150:	75 e2                	jne    134 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 152:	b8 00 00 00 00       	mov    $0x0,%eax
}
 157:	c9                   	leave  
 158:	c3                   	ret    

00000159 <gets>:

char*
gets(char *buf, int max)
{
 159:	55                   	push   %ebp
 15a:	89 e5                	mov    %esp,%ebp
 15c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 15f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 166:	eb 44                	jmp    1ac <gets+0x53>
    cc = read(0, &c, 1);
 168:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 16f:	00 
 170:	8d 45 ef             	lea    -0x11(%ebp),%eax
 173:	89 44 24 04          	mov    %eax,0x4(%esp)
 177:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 17e:	e8 3d 01 00 00       	call   2c0 <read>
 183:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 186:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 18a:	7e 2d                	jle    1b9 <gets+0x60>
      break;
    buf[i++] = c;
 18c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 18f:	03 45 08             	add    0x8(%ebp),%eax
 192:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 196:	88 10                	mov    %dl,(%eax)
 198:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 19c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1a0:	3c 0a                	cmp    $0xa,%al
 1a2:	74 16                	je     1ba <gets+0x61>
 1a4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1a8:	3c 0d                	cmp    $0xd,%al
 1aa:	74 0e                	je     1ba <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1af:	83 c0 01             	add    $0x1,%eax
 1b2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1b5:	7c b1                	jl     168 <gets+0xf>
 1b7:	eb 01                	jmp    1ba <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1b9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1ba:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1bd:	03 45 08             	add    0x8(%ebp),%eax
 1c0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1c3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1c6:	c9                   	leave  
 1c7:	c3                   	ret    

000001c8 <stat>:

int
stat(char *n, struct stat *st)
{
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
 1cb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ce:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1d5:	00 
 1d6:	8b 45 08             	mov    0x8(%ebp),%eax
 1d9:	89 04 24             	mov    %eax,(%esp)
 1dc:	e8 07 01 00 00       	call   2e8 <open>
 1e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 1e4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1e8:	79 07                	jns    1f1 <stat+0x29>
    return -1;
 1ea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1ef:	eb 23                	jmp    214 <stat+0x4c>
  r = fstat(fd, st);
 1f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1fb:	89 04 24             	mov    %eax,(%esp)
 1fe:	e8 fd 00 00 00       	call   300 <fstat>
 203:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 206:	8b 45 f0             	mov    -0x10(%ebp),%eax
 209:	89 04 24             	mov    %eax,(%esp)
 20c:	e8 bf 00 00 00       	call   2d0 <close>
  return r;
 211:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 214:	c9                   	leave  
 215:	c3                   	ret    

00000216 <atoi>:

int
atoi(const char *s)
{
 216:	55                   	push   %ebp
 217:	89 e5                	mov    %esp,%ebp
 219:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 21c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 223:	eb 24                	jmp    249 <atoi+0x33>
    n = n*10 + *s++ - '0';
 225:	8b 55 fc             	mov    -0x4(%ebp),%edx
 228:	89 d0                	mov    %edx,%eax
 22a:	c1 e0 02             	shl    $0x2,%eax
 22d:	01 d0                	add    %edx,%eax
 22f:	01 c0                	add    %eax,%eax
 231:	89 c2                	mov    %eax,%edx
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	0f b6 00             	movzbl (%eax),%eax
 239:	0f be c0             	movsbl %al,%eax
 23c:	8d 04 02             	lea    (%edx,%eax,1),%eax
 23f:	83 e8 30             	sub    $0x30,%eax
 242:	89 45 fc             	mov    %eax,-0x4(%ebp)
 245:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 249:	8b 45 08             	mov    0x8(%ebp),%eax
 24c:	0f b6 00             	movzbl (%eax),%eax
 24f:	3c 2f                	cmp    $0x2f,%al
 251:	7e 0a                	jle    25d <atoi+0x47>
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	0f b6 00             	movzbl (%eax),%eax
 259:	3c 39                	cmp    $0x39,%al
 25b:	7e c8                	jle    225 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 25d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 260:	c9                   	leave  
 261:	c3                   	ret    

00000262 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 262:	55                   	push   %ebp
 263:	89 e5                	mov    %esp,%ebp
 265:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 268:	8b 45 08             	mov    0x8(%ebp),%eax
 26b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 26e:	8b 45 0c             	mov    0xc(%ebp),%eax
 271:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 274:	eb 13                	jmp    289 <memmove+0x27>
    *dst++ = *src++;
 276:	8b 45 fc             	mov    -0x4(%ebp),%eax
 279:	0f b6 10             	movzbl (%eax),%edx
 27c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 27f:	88 10                	mov    %dl,(%eax)
 281:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 285:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 289:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 28d:	0f 9f c0             	setg   %al
 290:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 294:	84 c0                	test   %al,%al
 296:	75 de                	jne    276 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 298:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29b:	c9                   	leave  
 29c:	c3                   	ret    
 29d:	90                   	nop
 29e:	90                   	nop
 29f:	90                   	nop

000002a0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a0:	b8 01 00 00 00       	mov    $0x1,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <exit>:
SYSCALL(exit)
 2a8:	b8 02 00 00 00       	mov    $0x2,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <wait>:
SYSCALL(wait)
 2b0:	b8 03 00 00 00       	mov    $0x3,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <pipe>:
SYSCALL(pipe)
 2b8:	b8 04 00 00 00       	mov    $0x4,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <read>:
SYSCALL(read)
 2c0:	b8 05 00 00 00       	mov    $0x5,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <write>:
SYSCALL(write)
 2c8:	b8 10 00 00 00       	mov    $0x10,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <close>:
SYSCALL(close)
 2d0:	b8 15 00 00 00       	mov    $0x15,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <kill>:
SYSCALL(kill)
 2d8:	b8 06 00 00 00       	mov    $0x6,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <exec>:
SYSCALL(exec)
 2e0:	b8 07 00 00 00       	mov    $0x7,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <open>:
SYSCALL(open)
 2e8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <mknod>:
SYSCALL(mknod)
 2f0:	b8 11 00 00 00       	mov    $0x11,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <unlink>:
SYSCALL(unlink)
 2f8:	b8 12 00 00 00       	mov    $0x12,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <fstat>:
SYSCALL(fstat)
 300:	b8 08 00 00 00       	mov    $0x8,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <link>:
SYSCALL(link)
 308:	b8 13 00 00 00       	mov    $0x13,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <mkdir>:
SYSCALL(mkdir)
 310:	b8 14 00 00 00       	mov    $0x14,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <chdir>:
SYSCALL(chdir)
 318:	b8 09 00 00 00       	mov    $0x9,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <dup>:
SYSCALL(dup)
 320:	b8 0a 00 00 00       	mov    $0xa,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <getpid>:
SYSCALL(getpid)
 328:	b8 0b 00 00 00       	mov    $0xb,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <sbrk>:
SYSCALL(sbrk)
 330:	b8 0c 00 00 00       	mov    $0xc,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <sleep>:
SYSCALL(sleep)
 338:	b8 0d 00 00 00       	mov    $0xd,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <uptime>:
SYSCALL(uptime)
 340:	b8 0e 00 00 00       	mov    $0xe,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <clone>:
SYSCALL(clone)
 348:	b8 16 00 00 00       	mov    $0x16,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <texit>:
SYSCALL(texit)
 350:	b8 17 00 00 00       	mov    $0x17,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <tsleep>:
SYSCALL(tsleep)
 358:	b8 18 00 00 00       	mov    $0x18,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <twakeup>:
SYSCALL(twakeup)
 360:	b8 19 00 00 00       	mov    $0x19,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <test>:
SYSCALL(test)
 368:	b8 1a 00 00 00       	mov    $0x1a,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	83 ec 28             	sub    $0x28,%esp
 376:	8b 45 0c             	mov    0xc(%ebp),%eax
 379:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 37c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 383:	00 
 384:	8d 45 f4             	lea    -0xc(%ebp),%eax
 387:	89 44 24 04          	mov    %eax,0x4(%esp)
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	89 04 24             	mov    %eax,(%esp)
 391:	e8 32 ff ff ff       	call   2c8 <write>
}
 396:	c9                   	leave  
 397:	c3                   	ret    

00000398 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	53                   	push   %ebx
 39c:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 39f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3a6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3aa:	74 17                	je     3c3 <printint+0x2b>
 3ac:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3b0:	79 11                	jns    3c3 <printint+0x2b>
    neg = 1;
 3b2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bc:	f7 d8                	neg    %eax
 3be:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3c1:	eb 06                	jmp    3c9 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3d0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3d3:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3d9:	ba 00 00 00 00       	mov    $0x0,%edx
 3de:	f7 f3                	div    %ebx
 3e0:	89 d0                	mov    %edx,%eax
 3e2:	0f b6 80 10 0c 00 00 	movzbl 0xc10(%eax),%eax
 3e9:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 3ed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 3f1:	8b 45 10             	mov    0x10(%ebp),%eax
 3f4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3fa:	ba 00 00 00 00       	mov    $0x0,%edx
 3ff:	f7 75 d4             	divl   -0x2c(%ebp)
 402:	89 45 f4             	mov    %eax,-0xc(%ebp)
 405:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 409:	75 c5                	jne    3d0 <printint+0x38>
  if(neg)
 40b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 40f:	74 28                	je     439 <printint+0xa1>
    buf[i++] = '-';
 411:	8b 45 ec             	mov    -0x14(%ebp),%eax
 414:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 419:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 41d:	eb 1a                	jmp    439 <printint+0xa1>
    putc(fd, buf[i]);
 41f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 422:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 427:	0f be c0             	movsbl %al,%eax
 42a:	89 44 24 04          	mov    %eax,0x4(%esp)
 42e:	8b 45 08             	mov    0x8(%ebp),%eax
 431:	89 04 24             	mov    %eax,(%esp)
 434:	e8 37 ff ff ff       	call   370 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 439:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 43d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 441:	79 dc                	jns    41f <printint+0x87>
    putc(fd, buf[i]);
}
 443:	83 c4 44             	add    $0x44,%esp
 446:	5b                   	pop    %ebx
 447:	5d                   	pop    %ebp
 448:	c3                   	ret    

00000449 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 449:	55                   	push   %ebp
 44a:	89 e5                	mov    %esp,%ebp
 44c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 44f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 456:	8d 45 0c             	lea    0xc(%ebp),%eax
 459:	83 c0 04             	add    $0x4,%eax
 45c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 45f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 466:	e9 7e 01 00 00       	jmp    5e9 <printf+0x1a0>
    c = fmt[i] & 0xff;
 46b:	8b 55 0c             	mov    0xc(%ebp),%edx
 46e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 471:	8d 04 02             	lea    (%edx,%eax,1),%eax
 474:	0f b6 00             	movzbl (%eax),%eax
 477:	0f be c0             	movsbl %al,%eax
 47a:	25 ff 00 00 00       	and    $0xff,%eax
 47f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 482:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 486:	75 2c                	jne    4b4 <printf+0x6b>
      if(c == '%'){
 488:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 48c:	75 0c                	jne    49a <printf+0x51>
        state = '%';
 48e:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 495:	e9 4b 01 00 00       	jmp    5e5 <printf+0x19c>
      } else {
        putc(fd, c);
 49a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 49d:	0f be c0             	movsbl %al,%eax
 4a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a4:	8b 45 08             	mov    0x8(%ebp),%eax
 4a7:	89 04 24             	mov    %eax,(%esp)
 4aa:	e8 c1 fe ff ff       	call   370 <putc>
 4af:	e9 31 01 00 00       	jmp    5e5 <printf+0x19c>
      }
    } else if(state == '%'){
 4b4:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4b8:	0f 85 27 01 00 00    	jne    5e5 <printf+0x19c>
      if(c == 'd'){
 4be:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4c2:	75 2d                	jne    4f1 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c7:	8b 00                	mov    (%eax),%eax
 4c9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4d0:	00 
 4d1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4d8:	00 
 4d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4dd:	8b 45 08             	mov    0x8(%ebp),%eax
 4e0:	89 04 24             	mov    %eax,(%esp)
 4e3:	e8 b0 fe ff ff       	call   398 <printint>
        ap++;
 4e8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 4ec:	e9 ed 00 00 00       	jmp    5de <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 4f1:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 4f5:	74 06                	je     4fd <printf+0xb4>
 4f7:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 4fb:	75 2d                	jne    52a <printf+0xe1>
        printint(fd, *ap, 16, 0);
 4fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 500:	8b 00                	mov    (%eax),%eax
 502:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 509:	00 
 50a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 511:	00 
 512:	89 44 24 04          	mov    %eax,0x4(%esp)
 516:	8b 45 08             	mov    0x8(%ebp),%eax
 519:	89 04 24             	mov    %eax,(%esp)
 51c:	e8 77 fe ff ff       	call   398 <printint>
        ap++;
 521:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 525:	e9 b4 00 00 00       	jmp    5de <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 52a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 52e:	75 46                	jne    576 <printf+0x12d>
        s = (char*)*ap;
 530:	8b 45 f4             	mov    -0xc(%ebp),%eax
 533:	8b 00                	mov    (%eax),%eax
 535:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 538:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 53c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 540:	75 27                	jne    569 <printf+0x120>
          s = "(null)";
 542:	c7 45 e4 c6 0b 00 00 	movl   $0xbc6,-0x1c(%ebp)
        while(*s != 0){
 549:	eb 1f                	jmp    56a <printf+0x121>
          putc(fd, *s);
 54b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 54e:	0f b6 00             	movzbl (%eax),%eax
 551:	0f be c0             	movsbl %al,%eax
 554:	89 44 24 04          	mov    %eax,0x4(%esp)
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	89 04 24             	mov    %eax,(%esp)
 55e:	e8 0d fe ff ff       	call   370 <putc>
          s++;
 563:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 567:	eb 01                	jmp    56a <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 569:	90                   	nop
 56a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 56d:	0f b6 00             	movzbl (%eax),%eax
 570:	84 c0                	test   %al,%al
 572:	75 d7                	jne    54b <printf+0x102>
 574:	eb 68                	jmp    5de <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 576:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 57a:	75 1d                	jne    599 <printf+0x150>
        putc(fd, *ap);
 57c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57f:	8b 00                	mov    (%eax),%eax
 581:	0f be c0             	movsbl %al,%eax
 584:	89 44 24 04          	mov    %eax,0x4(%esp)
 588:	8b 45 08             	mov    0x8(%ebp),%eax
 58b:	89 04 24             	mov    %eax,(%esp)
 58e:	e8 dd fd ff ff       	call   370 <putc>
        ap++;
 593:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 597:	eb 45                	jmp    5de <printf+0x195>
      } else if(c == '%'){
 599:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 59d:	75 17                	jne    5b6 <printf+0x16d>
        putc(fd, c);
 59f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a2:	0f be c0             	movsbl %al,%eax
 5a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	89 04 24             	mov    %eax,(%esp)
 5af:	e8 bc fd ff ff       	call   370 <putc>
 5b4:	eb 28                	jmp    5de <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5b6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5bd:	00 
 5be:	8b 45 08             	mov    0x8(%ebp),%eax
 5c1:	89 04 24             	mov    %eax,(%esp)
 5c4:	e8 a7 fd ff ff       	call   370 <putc>
        putc(fd, c);
 5c9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5cc:	0f be c0             	movsbl %al,%eax
 5cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d3:	8b 45 08             	mov    0x8(%ebp),%eax
 5d6:	89 04 24             	mov    %eax,(%esp)
 5d9:	e8 92 fd ff ff       	call   370 <putc>
      }
      state = 0;
 5de:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5e5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5e9:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5ef:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5f2:	0f b6 00             	movzbl (%eax),%eax
 5f5:	84 c0                	test   %al,%al
 5f7:	0f 85 6e fe ff ff    	jne    46b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5fd:	c9                   	leave  
 5fe:	c3                   	ret    
 5ff:	90                   	nop

00000600 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 600:	55                   	push   %ebp
 601:	89 e5                	mov    %esp,%ebp
 603:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 606:	8b 45 08             	mov    0x8(%ebp),%eax
 609:	83 e8 08             	sub    $0x8,%eax
 60c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 60f:	a1 2c 0c 00 00       	mov    0xc2c,%eax
 614:	89 45 fc             	mov    %eax,-0x4(%ebp)
 617:	eb 24                	jmp    63d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 619:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61c:	8b 00                	mov    (%eax),%eax
 61e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 621:	77 12                	ja     635 <free+0x35>
 623:	8b 45 f8             	mov    -0x8(%ebp),%eax
 626:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 629:	77 24                	ja     64f <free+0x4f>
 62b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62e:	8b 00                	mov    (%eax),%eax
 630:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 633:	77 1a                	ja     64f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 635:	8b 45 fc             	mov    -0x4(%ebp),%eax
 638:	8b 00                	mov    (%eax),%eax
 63a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 63d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 640:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 643:	76 d4                	jbe    619 <free+0x19>
 645:	8b 45 fc             	mov    -0x4(%ebp),%eax
 648:	8b 00                	mov    (%eax),%eax
 64a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 64d:	76 ca                	jbe    619 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 64f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 652:	8b 40 04             	mov    0x4(%eax),%eax
 655:	c1 e0 03             	shl    $0x3,%eax
 658:	89 c2                	mov    %eax,%edx
 65a:	03 55 f8             	add    -0x8(%ebp),%edx
 65d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 660:	8b 00                	mov    (%eax),%eax
 662:	39 c2                	cmp    %eax,%edx
 664:	75 24                	jne    68a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 666:	8b 45 f8             	mov    -0x8(%ebp),%eax
 669:	8b 50 04             	mov    0x4(%eax),%edx
 66c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66f:	8b 00                	mov    (%eax),%eax
 671:	8b 40 04             	mov    0x4(%eax),%eax
 674:	01 c2                	add    %eax,%edx
 676:	8b 45 f8             	mov    -0x8(%ebp),%eax
 679:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 67c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67f:	8b 00                	mov    (%eax),%eax
 681:	8b 10                	mov    (%eax),%edx
 683:	8b 45 f8             	mov    -0x8(%ebp),%eax
 686:	89 10                	mov    %edx,(%eax)
 688:	eb 0a                	jmp    694 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 68a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68d:	8b 10                	mov    (%eax),%edx
 68f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 692:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 694:	8b 45 fc             	mov    -0x4(%ebp),%eax
 697:	8b 40 04             	mov    0x4(%eax),%eax
 69a:	c1 e0 03             	shl    $0x3,%eax
 69d:	03 45 fc             	add    -0x4(%ebp),%eax
 6a0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6a3:	75 20                	jne    6c5 <free+0xc5>
    p->s.size += bp->s.size;
 6a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a8:	8b 50 04             	mov    0x4(%eax),%edx
 6ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ae:	8b 40 04             	mov    0x4(%eax),%eax
 6b1:	01 c2                	add    %eax,%edx
 6b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6b9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6bc:	8b 10                	mov    (%eax),%edx
 6be:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c1:	89 10                	mov    %edx,(%eax)
 6c3:	eb 08                	jmp    6cd <free+0xcd>
  } else
    p->s.ptr = bp;
 6c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6cb:	89 10                	mov    %edx,(%eax)
  freep = p;
 6cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d0:	a3 2c 0c 00 00       	mov    %eax,0xc2c
}
 6d5:	c9                   	leave  
 6d6:	c3                   	ret    

000006d7 <morecore>:

static Header*
morecore(uint nu)
{
 6d7:	55                   	push   %ebp
 6d8:	89 e5                	mov    %esp,%ebp
 6da:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6dd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6e4:	77 07                	ja     6ed <morecore+0x16>
    nu = 4096;
 6e6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6ed:	8b 45 08             	mov    0x8(%ebp),%eax
 6f0:	c1 e0 03             	shl    $0x3,%eax
 6f3:	89 04 24             	mov    %eax,(%esp)
 6f6:	e8 35 fc ff ff       	call   330 <sbrk>
 6fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 6fe:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 702:	75 07                	jne    70b <morecore+0x34>
    return 0;
 704:	b8 00 00 00 00       	mov    $0x0,%eax
 709:	eb 22                	jmp    72d <morecore+0x56>
  hp = (Header*)p;
 70b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 711:	8b 45 f4             	mov    -0xc(%ebp),%eax
 714:	8b 55 08             	mov    0x8(%ebp),%edx
 717:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 71a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71d:	83 c0 08             	add    $0x8,%eax
 720:	89 04 24             	mov    %eax,(%esp)
 723:	e8 d8 fe ff ff       	call   600 <free>
  return freep;
 728:	a1 2c 0c 00 00       	mov    0xc2c,%eax
}
 72d:	c9                   	leave  
 72e:	c3                   	ret    

0000072f <malloc>:

void*
malloc(uint nbytes)
{
 72f:	55                   	push   %ebp
 730:	89 e5                	mov    %esp,%ebp
 732:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 735:	8b 45 08             	mov    0x8(%ebp),%eax
 738:	83 c0 07             	add    $0x7,%eax
 73b:	c1 e8 03             	shr    $0x3,%eax
 73e:	83 c0 01             	add    $0x1,%eax
 741:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 744:	a1 2c 0c 00 00       	mov    0xc2c,%eax
 749:	89 45 f0             	mov    %eax,-0x10(%ebp)
 74c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 750:	75 23                	jne    775 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 752:	c7 45 f0 24 0c 00 00 	movl   $0xc24,-0x10(%ebp)
 759:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75c:	a3 2c 0c 00 00       	mov    %eax,0xc2c
 761:	a1 2c 0c 00 00       	mov    0xc2c,%eax
 766:	a3 24 0c 00 00       	mov    %eax,0xc24
    base.s.size = 0;
 76b:	c7 05 28 0c 00 00 00 	movl   $0x0,0xc28
 772:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 775:	8b 45 f0             	mov    -0x10(%ebp),%eax
 778:	8b 00                	mov    (%eax),%eax
 77a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 77d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 780:	8b 40 04             	mov    0x4(%eax),%eax
 783:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 786:	72 4d                	jb     7d5 <malloc+0xa6>
      if(p->s.size == nunits)
 788:	8b 45 ec             	mov    -0x14(%ebp),%eax
 78b:	8b 40 04             	mov    0x4(%eax),%eax
 78e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 791:	75 0c                	jne    79f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 793:	8b 45 ec             	mov    -0x14(%ebp),%eax
 796:	8b 10                	mov    (%eax),%edx
 798:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79b:	89 10                	mov    %edx,(%eax)
 79d:	eb 26                	jmp    7c5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 79f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a2:	8b 40 04             	mov    0x4(%eax),%eax
 7a5:	89 c2                	mov    %eax,%edx
 7a7:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7aa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ad:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b3:	8b 40 04             	mov    0x4(%eax),%eax
 7b6:	c1 e0 03             	shl    $0x3,%eax
 7b9:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7bf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7c2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c8:	a3 2c 0c 00 00       	mov    %eax,0xc2c
      return (void*)(p + 1);
 7cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d0:	83 c0 08             	add    $0x8,%eax
 7d3:	eb 38                	jmp    80d <malloc+0xde>
    }
    if(p == freep)
 7d5:	a1 2c 0c 00 00       	mov    0xc2c,%eax
 7da:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7dd:	75 1b                	jne    7fa <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e2:	89 04 24             	mov    %eax,(%esp)
 7e5:	e8 ed fe ff ff       	call   6d7 <morecore>
 7ea:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7ed:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7f1:	75 07                	jne    7fa <malloc+0xcb>
        return 0;
 7f3:	b8 00 00 00 00       	mov    $0x0,%eax
 7f8:	eb 13                	jmp    80d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7fa:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 800:	8b 45 ec             	mov    -0x14(%ebp),%eax
 803:	8b 00                	mov    (%eax),%eax
 805:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 808:	e9 70 ff ff ff       	jmp    77d <malloc+0x4e>
}
 80d:	c9                   	leave  
 80e:	c3                   	ret    
 80f:	90                   	nop

00000810 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 810:	55                   	push   %ebp
 811:	89 e5                	mov    %esp,%ebp
 813:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 816:	8b 55 08             	mov    0x8(%ebp),%edx
 819:	8b 45 0c             	mov    0xc(%ebp),%eax
 81c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 81f:	f0 87 02             	lock xchg %eax,(%edx)
 822:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 825:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 828:	c9                   	leave  
 829:	c3                   	ret    

0000082a <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 82a:	55                   	push   %ebp
 82b:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 82d:	8b 45 08             	mov    0x8(%ebp),%eax
 830:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 836:	5d                   	pop    %ebp
 837:	c3                   	ret    

00000838 <lock_acquire>:
void lock_acquire(lock_t *lock){
 838:	55                   	push   %ebp
 839:	89 e5                	mov    %esp,%ebp
 83b:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 83e:	8b 45 08             	mov    0x8(%ebp),%eax
 841:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 848:	00 
 849:	89 04 24             	mov    %eax,(%esp)
 84c:	e8 bf ff ff ff       	call   810 <xchg>
 851:	85 c0                	test   %eax,%eax
 853:	75 e9                	jne    83e <lock_acquire+0x6>
}
 855:	c9                   	leave  
 856:	c3                   	ret    

00000857 <lock_release>:
void lock_release(lock_t *lock){
 857:	55                   	push   %ebp
 858:	89 e5                	mov    %esp,%ebp
 85a:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 85d:	8b 45 08             	mov    0x8(%ebp),%eax
 860:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 867:	00 
 868:	89 04 24             	mov    %eax,(%esp)
 86b:	e8 a0 ff ff ff       	call   810 <xchg>
}
 870:	c9                   	leave  
 871:	c3                   	ret    

00000872 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 872:	55                   	push   %ebp
 873:	89 e5                	mov    %esp,%ebp
 875:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 878:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 87f:	e8 ab fe ff ff       	call   72f <malloc>
 884:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 887:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88a:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 88d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 890:	25 ff 0f 00 00       	and    $0xfff,%eax
 895:	85 c0                	test   %eax,%eax
 897:	74 15                	je     8ae <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 899:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89c:	89 c2                	mov    %eax,%edx
 89e:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 8a4:	b8 00 10 00 00       	mov    $0x1000,%eax
 8a9:	29 d0                	sub    %edx,%eax
 8ab:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 8ae:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8b2:	75 1b                	jne    8cf <thread_create+0x5d>

        printf(1,"malloc fail \n");
 8b4:	c7 44 24 04 cd 0b 00 	movl   $0xbcd,0x4(%esp)
 8bb:	00 
 8bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8c3:	e8 81 fb ff ff       	call   449 <printf>
        return 0;
 8c8:	b8 00 00 00 00       	mov    $0x0,%eax
 8cd:	eb 6f                	jmp    93e <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 8cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8d2:	8b 55 08             	mov    0x8(%ebp),%edx
 8d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8dc:	89 54 24 08          	mov    %edx,0x8(%esp)
 8e0:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 8e7:	00 
 8e8:	89 04 24             	mov    %eax,(%esp)
 8eb:	e8 58 fa ff ff       	call   348 <clone>
 8f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 8f3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8f7:	79 1b                	jns    914 <thread_create+0xa2>
        printf(1,"clone fails\n");
 8f9:	c7 44 24 04 db 0b 00 	movl   $0xbdb,0x4(%esp)
 900:	00 
 901:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 908:	e8 3c fb ff ff       	call   449 <printf>
        return 0;
 90d:	b8 00 00 00 00       	mov    $0x0,%eax
 912:	eb 2a                	jmp    93e <thread_create+0xcc>
    }
    if(tid > 0){
 914:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 918:	7e 05                	jle    91f <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 91a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91d:	eb 1f                	jmp    93e <thread_create+0xcc>
    }
    if(tid == 0){
 91f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 923:	75 14                	jne    939 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 925:	c7 44 24 04 e8 0b 00 	movl   $0xbe8,0x4(%esp)
 92c:	00 
 92d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 934:	e8 10 fb ff ff       	call   449 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 939:	b8 00 00 00 00       	mov    $0x0,%eax
}
 93e:	c9                   	leave  
 93f:	c3                   	ret    

00000940 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 943:	8b 45 08             	mov    0x8(%ebp),%eax
 946:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 94c:	8b 45 08             	mov    0x8(%ebp),%eax
 94f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 956:	8b 45 08             	mov    0x8(%ebp),%eax
 959:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 960:	5d                   	pop    %ebp
 961:	c3                   	ret    

00000962 <add_q>:

void add_q(struct queue *q, int v){
 962:	55                   	push   %ebp
 963:	89 e5                	mov    %esp,%ebp
 965:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 968:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 96f:	e8 bb fd ff ff       	call   72f <malloc>
 974:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 977:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 981:	8b 45 f4             	mov    -0xc(%ebp),%eax
 984:	8b 55 0c             	mov    0xc(%ebp),%edx
 987:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 989:	8b 45 08             	mov    0x8(%ebp),%eax
 98c:	8b 40 04             	mov    0x4(%eax),%eax
 98f:	85 c0                	test   %eax,%eax
 991:	75 0b                	jne    99e <add_q+0x3c>
        q->head = n;
 993:	8b 45 08             	mov    0x8(%ebp),%eax
 996:	8b 55 f4             	mov    -0xc(%ebp),%edx
 999:	89 50 04             	mov    %edx,0x4(%eax)
 99c:	eb 0c                	jmp    9aa <add_q+0x48>
    }else{
        q->tail->next = n;
 99e:	8b 45 08             	mov    0x8(%ebp),%eax
 9a1:	8b 40 08             	mov    0x8(%eax),%eax
 9a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9a7:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 9aa:	8b 45 08             	mov    0x8(%ebp),%eax
 9ad:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9b0:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 9b3:	8b 45 08             	mov    0x8(%ebp),%eax
 9b6:	8b 00                	mov    (%eax),%eax
 9b8:	8d 50 01             	lea    0x1(%eax),%edx
 9bb:	8b 45 08             	mov    0x8(%ebp),%eax
 9be:	89 10                	mov    %edx,(%eax)
}
 9c0:	c9                   	leave  
 9c1:	c3                   	ret    

000009c2 <empty_q>:

int empty_q(struct queue *q){
 9c2:	55                   	push   %ebp
 9c3:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 9c5:	8b 45 08             	mov    0x8(%ebp),%eax
 9c8:	8b 00                	mov    (%eax),%eax
 9ca:	85 c0                	test   %eax,%eax
 9cc:	75 07                	jne    9d5 <empty_q+0x13>
        return 1;
 9ce:	b8 01 00 00 00       	mov    $0x1,%eax
 9d3:	eb 05                	jmp    9da <empty_q+0x18>
    else
        return 0;
 9d5:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 9da:	5d                   	pop    %ebp
 9db:	c3                   	ret    

000009dc <pop_q>:
int pop_q(struct queue *q){
 9dc:	55                   	push   %ebp
 9dd:	89 e5                	mov    %esp,%ebp
 9df:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 9e2:	8b 45 08             	mov    0x8(%ebp),%eax
 9e5:	89 04 24             	mov    %eax,(%esp)
 9e8:	e8 d5 ff ff ff       	call   9c2 <empty_q>
 9ed:	85 c0                	test   %eax,%eax
 9ef:	75 5d                	jne    a4e <pop_q+0x72>
       val = q->head->value; 
 9f1:	8b 45 08             	mov    0x8(%ebp),%eax
 9f4:	8b 40 04             	mov    0x4(%eax),%eax
 9f7:	8b 00                	mov    (%eax),%eax
 9f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 9fc:	8b 45 08             	mov    0x8(%ebp),%eax
 9ff:	8b 40 04             	mov    0x4(%eax),%eax
 a02:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 a05:	8b 45 08             	mov    0x8(%ebp),%eax
 a08:	8b 40 04             	mov    0x4(%eax),%eax
 a0b:	8b 50 04             	mov    0x4(%eax),%edx
 a0e:	8b 45 08             	mov    0x8(%ebp),%eax
 a11:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a14:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a17:	89 04 24             	mov    %eax,(%esp)
 a1a:	e8 e1 fb ff ff       	call   600 <free>
       q->size--;
 a1f:	8b 45 08             	mov    0x8(%ebp),%eax
 a22:	8b 00                	mov    (%eax),%eax
 a24:	8d 50 ff             	lea    -0x1(%eax),%edx
 a27:	8b 45 08             	mov    0x8(%ebp),%eax
 a2a:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a2c:	8b 45 08             	mov    0x8(%ebp),%eax
 a2f:	8b 00                	mov    (%eax),%eax
 a31:	85 c0                	test   %eax,%eax
 a33:	75 14                	jne    a49 <pop_q+0x6d>
            q->head = 0;
 a35:	8b 45 08             	mov    0x8(%ebp),%eax
 a38:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a3f:	8b 45 08             	mov    0x8(%ebp),%eax
 a42:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a49:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a4c:	eb 05                	jmp    a53 <pop_q+0x77>
    }
    return -1;
 a4e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a53:	c9                   	leave  
 a54:	c3                   	ret    
 a55:	90                   	nop
 a56:	90                   	nop
 a57:	90                   	nop

00000a58 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 a58:	55                   	push   %ebp
 a59:	89 e5                	mov    %esp,%ebp
 a5b:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 a5e:	8b 45 08             	mov    0x8(%ebp),%eax
 a61:	8b 55 0c             	mov    0xc(%ebp),%edx
 a64:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 a67:	8b 45 08             	mov    0x8(%ebp),%eax
 a6a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 a71:	8b 45 08             	mov    0x8(%ebp),%eax
 a74:	89 04 24             	mov    %eax,(%esp)
 a77:	e8 ae fd ff ff       	call   82a <lock_init>
}
 a7c:	c9                   	leave  
 a7d:	c3                   	ret    

00000a7e <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 a7e:	55                   	push   %ebp
 a7f:	89 e5                	mov    %esp,%ebp
 a81:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 a84:	8b 45 08             	mov    0x8(%ebp),%eax
 a87:	89 04 24             	mov    %eax,(%esp)
 a8a:	e8 a9 fd ff ff       	call   838 <lock_acquire>
	if(s->count  == 0){
 a8f:	8b 45 08             	mov    0x8(%ebp),%eax
 a92:	8b 40 04             	mov    0x4(%eax),%eax
 a95:	85 c0                	test   %eax,%eax
 a97:	75 43                	jne    adc <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 a99:	c7 44 24 04 f9 0b 00 	movl   $0xbf9,0x4(%esp)
 aa0:	00 
 aa1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 aa8:	e8 9c f9 ff ff       	call   449 <printf>
		//add proc to waiters list
		int tid = getpid();
 aad:	e8 76 f8 ff ff       	call   328 <getpid>
 ab2:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 ab5:	8b 45 08             	mov    0x8(%ebp),%eax
 ab8:	8d 50 0c             	lea    0xc(%eax),%edx
 abb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 abe:	89 44 24 04          	mov    %eax,0x4(%esp)
 ac2:	89 14 24             	mov    %edx,(%esp)
 ac5:	e8 98 fe ff ff       	call   962 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 aca:	8b 45 08             	mov    0x8(%ebp),%eax
 acd:	89 04 24             	mov    %eax,(%esp)
 ad0:	e8 82 fd ff ff       	call   857 <lock_release>
		tsleep(); 
 ad5:	e8 7e f8 ff ff       	call   358 <tsleep>
 ada:	eb 2e                	jmp    b0a <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 adc:	c7 44 24 04 00 0c 00 	movl   $0xc00,0x4(%esp)
 ae3:	00 
 ae4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 aeb:	e8 59 f9 ff ff       	call   449 <printf>
		s->count--;	
 af0:	8b 45 08             	mov    0x8(%ebp),%eax
 af3:	8b 40 04             	mov    0x4(%eax),%eax
 af6:	8d 50 ff             	lea    -0x1(%eax),%edx
 af9:	8b 45 08             	mov    0x8(%ebp),%eax
 afc:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 aff:	8b 45 08             	mov    0x8(%ebp),%eax
 b02:	89 04 24             	mov    %eax,(%esp)
 b05:	e8 4d fd ff ff       	call   857 <lock_release>
	}
}
 b0a:	c9                   	leave  
 b0b:	c3                   	ret    

00000b0c <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b0c:	55                   	push   %ebp
 b0d:	89 e5                	mov    %esp,%ebp
 b0f:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 b12:	c7 44 24 04 07 0c 00 	movl   $0xc07,0x4(%esp)
 b19:	00 
 b1a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b21:	e8 23 f9 ff ff       	call   449 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b26:	8b 45 08             	mov    0x8(%ebp),%eax
 b29:	89 04 24             	mov    %eax,(%esp)
 b2c:	e8 07 fd ff ff       	call   838 <lock_acquire>
	if(s->count < s->size){
 b31:	8b 45 08             	mov    0x8(%ebp),%eax
 b34:	8b 50 04             	mov    0x4(%eax),%edx
 b37:	8b 45 08             	mov    0x8(%ebp),%eax
 b3a:	8b 40 08             	mov    0x8(%eax),%eax
 b3d:	39 c2                	cmp    %eax,%edx
 b3f:	7d 0f                	jge    b50 <sem_signal+0x44>
		s->count++;	
 b41:	8b 45 08             	mov    0x8(%ebp),%eax
 b44:	8b 40 04             	mov    0x4(%eax),%eax
 b47:	8d 50 01             	lea    0x1(%eax),%edx
 b4a:	8b 45 08             	mov    0x8(%ebp),%eax
 b4d:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 b50:	8b 45 08             	mov    0x8(%ebp),%eax
 b53:	83 c0 0c             	add    $0xc,%eax
 b56:	89 04 24             	mov    %eax,(%esp)
 b59:	e8 7e fe ff ff       	call   9dc <pop_q>
 b5e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 b61:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b65:	74 2e                	je     b95 <sem_signal+0x89>
		printf(1, "Sem A\n");
 b67:	c7 44 24 04 00 0c 00 	movl   $0xc00,0x4(%esp)
 b6e:	00 
 b6f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b76:	e8 ce f8 ff ff       	call   449 <printf>
		twakeup(tid);
 b7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b7e:	89 04 24             	mov    %eax,(%esp)
 b81:	e8 da f7 ff ff       	call   360 <twakeup>
		s->count--;
 b86:	8b 45 08             	mov    0x8(%ebp),%eax
 b89:	8b 40 04             	mov    0x4(%eax),%eax
 b8c:	8d 50 ff             	lea    -0x1(%eax),%edx
 b8f:	8b 45 08             	mov    0x8(%ebp),%eax
 b92:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 b95:	8b 45 08             	mov    0x8(%ebp),%eax
 b98:	89 04 24             	mov    %eax,(%esp)
 b9b:	e8 b7 fc ff ff       	call   857 <lock_release>

 ba0:	c9                   	leave  
 ba1:	c3                   	ret    
