
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
   9:	c7 44 24 04 79 0b 00 	movl   $0xb79,0x4(%esp)
  10:	00 
  11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  18:	e8 35 04 00 00       	call   452 <printf>
	test(3);
  1d:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
  24:	e8 41 03 00 00       	call   36a <test>
	printf(1, "Testing finished\n");
  29:	c7 44 24 04 8b 0b 00 	movl   $0xb8b,0x4(%esp)
  30:	00 
  31:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  38:	e8 15 04 00 00       	call   452 <printf>
  
	exit();
  3d:	e8 68 02 00 00       	call   2aa <exit>

00000042 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  42:	55                   	push   %ebp
  43:	89 e5                	mov    %esp,%ebp
  45:	57                   	push   %edi
  46:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  47:	8b 4d 08             	mov    0x8(%ebp),%ecx
  4a:	8b 55 10             	mov    0x10(%ebp),%edx
  4d:	8b 45 0c             	mov    0xc(%ebp),%eax
  50:	89 cb                	mov    %ecx,%ebx
  52:	89 df                	mov    %ebx,%edi
  54:	89 d1                	mov    %edx,%ecx
  56:	fc                   	cld    
  57:	f3 aa                	rep stos %al,%es:(%edi)
  59:	89 ca                	mov    %ecx,%edx
  5b:	89 fb                	mov    %edi,%ebx
  5d:	89 5d 08             	mov    %ebx,0x8(%ebp)
  60:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  63:	5b                   	pop    %ebx
  64:	5f                   	pop    %edi
  65:	5d                   	pop    %ebp
  66:	c3                   	ret    

00000067 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  67:	55                   	push   %ebp
  68:	89 e5                	mov    %esp,%ebp
  6a:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  6d:	8b 45 08             	mov    0x8(%ebp),%eax
  70:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  73:	90                   	nop
  74:	8b 45 08             	mov    0x8(%ebp),%eax
  77:	8d 50 01             	lea    0x1(%eax),%edx
  7a:	89 55 08             	mov    %edx,0x8(%ebp)
  7d:	8b 55 0c             	mov    0xc(%ebp),%edx
  80:	8d 4a 01             	lea    0x1(%edx),%ecx
  83:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  86:	0f b6 12             	movzbl (%edx),%edx
  89:	88 10                	mov    %dl,(%eax)
  8b:	0f b6 00             	movzbl (%eax),%eax
  8e:	84 c0                	test   %al,%al
  90:	75 e2                	jne    74 <strcpy+0xd>
    ;
  return os;
  92:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  95:	c9                   	leave  
  96:	c3                   	ret    

00000097 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  97:	55                   	push   %ebp
  98:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  9a:	eb 08                	jmp    a4 <strcmp+0xd>
    p++, q++;
  9c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  a0:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	0f b6 00             	movzbl (%eax),%eax
  aa:	84 c0                	test   %al,%al
  ac:	74 10                	je     be <strcmp+0x27>
  ae:	8b 45 08             	mov    0x8(%ebp),%eax
  b1:	0f b6 10             	movzbl (%eax),%edx
  b4:	8b 45 0c             	mov    0xc(%ebp),%eax
  b7:	0f b6 00             	movzbl (%eax),%eax
  ba:	38 c2                	cmp    %al,%dl
  bc:	74 de                	je     9c <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  be:	8b 45 08             	mov    0x8(%ebp),%eax
  c1:	0f b6 00             	movzbl (%eax),%eax
  c4:	0f b6 d0             	movzbl %al,%edx
  c7:	8b 45 0c             	mov    0xc(%ebp),%eax
  ca:	0f b6 00             	movzbl (%eax),%eax
  cd:	0f b6 c0             	movzbl %al,%eax
  d0:	29 c2                	sub    %eax,%edx
  d2:	89 d0                	mov    %edx,%eax
}
  d4:	5d                   	pop    %ebp
  d5:	c3                   	ret    

000000d6 <strlen>:

uint
strlen(char *s)
{
  d6:	55                   	push   %ebp
  d7:	89 e5                	mov    %esp,%ebp
  d9:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  dc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  e3:	eb 04                	jmp    e9 <strlen+0x13>
  e5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  e9:	8b 55 fc             	mov    -0x4(%ebp),%edx
  ec:	8b 45 08             	mov    0x8(%ebp),%eax
  ef:	01 d0                	add    %edx,%eax
  f1:	0f b6 00             	movzbl (%eax),%eax
  f4:	84 c0                	test   %al,%al
  f6:	75 ed                	jne    e5 <strlen+0xf>
    ;
  return n;
  f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  fb:	c9                   	leave  
  fc:	c3                   	ret    

000000fd <memset>:

void*
memset(void *dst, int c, uint n)
{
  fd:	55                   	push   %ebp
  fe:	89 e5                	mov    %esp,%ebp
 100:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 103:	8b 45 10             	mov    0x10(%ebp),%eax
 106:	89 44 24 08          	mov    %eax,0x8(%esp)
 10a:	8b 45 0c             	mov    0xc(%ebp),%eax
 10d:	89 44 24 04          	mov    %eax,0x4(%esp)
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	89 04 24             	mov    %eax,(%esp)
 117:	e8 26 ff ff ff       	call   42 <stosb>
  return dst;
 11c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 11f:	c9                   	leave  
 120:	c3                   	ret    

00000121 <strchr>:

char*
strchr(const char *s, char c)
{
 121:	55                   	push   %ebp
 122:	89 e5                	mov    %esp,%ebp
 124:	83 ec 04             	sub    $0x4,%esp
 127:	8b 45 0c             	mov    0xc(%ebp),%eax
 12a:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 12d:	eb 14                	jmp    143 <strchr+0x22>
    if(*s == c)
 12f:	8b 45 08             	mov    0x8(%ebp),%eax
 132:	0f b6 00             	movzbl (%eax),%eax
 135:	3a 45 fc             	cmp    -0x4(%ebp),%al
 138:	75 05                	jne    13f <strchr+0x1e>
      return (char*)s;
 13a:	8b 45 08             	mov    0x8(%ebp),%eax
 13d:	eb 13                	jmp    152 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 13f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	0f b6 00             	movzbl (%eax),%eax
 149:	84 c0                	test   %al,%al
 14b:	75 e2                	jne    12f <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 14d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 152:	c9                   	leave  
 153:	c3                   	ret    

00000154 <gets>:

char*
gets(char *buf, int max)
{
 154:	55                   	push   %ebp
 155:	89 e5                	mov    %esp,%ebp
 157:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 15a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 161:	eb 4c                	jmp    1af <gets+0x5b>
    cc = read(0, &c, 1);
 163:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 16a:	00 
 16b:	8d 45 ef             	lea    -0x11(%ebp),%eax
 16e:	89 44 24 04          	mov    %eax,0x4(%esp)
 172:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 179:	e8 44 01 00 00       	call   2c2 <read>
 17e:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 181:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 185:	7f 02                	jg     189 <gets+0x35>
      break;
 187:	eb 31                	jmp    1ba <gets+0x66>
    buf[i++] = c;
 189:	8b 45 f4             	mov    -0xc(%ebp),%eax
 18c:	8d 50 01             	lea    0x1(%eax),%edx
 18f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 192:	89 c2                	mov    %eax,%edx
 194:	8b 45 08             	mov    0x8(%ebp),%eax
 197:	01 c2                	add    %eax,%edx
 199:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 19d:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 19f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1a3:	3c 0a                	cmp    $0xa,%al
 1a5:	74 13                	je     1ba <gets+0x66>
 1a7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ab:	3c 0d                	cmp    $0xd,%al
 1ad:	74 0b                	je     1ba <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b2:	83 c0 01             	add    $0x1,%eax
 1b5:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1b8:	7c a9                	jl     163 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
 1c0:	01 d0                	add    %edx,%eax
 1c2:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1c5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1c8:	c9                   	leave  
 1c9:	c3                   	ret    

000001ca <stat>:

int
stat(char *n, struct stat *st)
{
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1d0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1d7:	00 
 1d8:	8b 45 08             	mov    0x8(%ebp),%eax
 1db:	89 04 24             	mov    %eax,(%esp)
 1de:	e8 07 01 00 00       	call   2ea <open>
 1e3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1ea:	79 07                	jns    1f3 <stat+0x29>
    return -1;
 1ec:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1f1:	eb 23                	jmp    216 <stat+0x4c>
  r = fstat(fd, st);
 1f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1fd:	89 04 24             	mov    %eax,(%esp)
 200:	e8 fd 00 00 00       	call   302 <fstat>
 205:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 208:	8b 45 f4             	mov    -0xc(%ebp),%eax
 20b:	89 04 24             	mov    %eax,(%esp)
 20e:	e8 bf 00 00 00       	call   2d2 <close>
  return r;
 213:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 216:	c9                   	leave  
 217:	c3                   	ret    

00000218 <atoi>:

int
atoi(const char *s)
{
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 21e:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 225:	eb 25                	jmp    24c <atoi+0x34>
    n = n*10 + *s++ - '0';
 227:	8b 55 fc             	mov    -0x4(%ebp),%edx
 22a:	89 d0                	mov    %edx,%eax
 22c:	c1 e0 02             	shl    $0x2,%eax
 22f:	01 d0                	add    %edx,%eax
 231:	01 c0                	add    %eax,%eax
 233:	89 c1                	mov    %eax,%ecx
 235:	8b 45 08             	mov    0x8(%ebp),%eax
 238:	8d 50 01             	lea    0x1(%eax),%edx
 23b:	89 55 08             	mov    %edx,0x8(%ebp)
 23e:	0f b6 00             	movzbl (%eax),%eax
 241:	0f be c0             	movsbl %al,%eax
 244:	01 c8                	add    %ecx,%eax
 246:	83 e8 30             	sub    $0x30,%eax
 249:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	0f b6 00             	movzbl (%eax),%eax
 252:	3c 2f                	cmp    $0x2f,%al
 254:	7e 0a                	jle    260 <atoi+0x48>
 256:	8b 45 08             	mov    0x8(%ebp),%eax
 259:	0f b6 00             	movzbl (%eax),%eax
 25c:	3c 39                	cmp    $0x39,%al
 25e:	7e c7                	jle    227 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 260:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 263:	c9                   	leave  
 264:	c3                   	ret    

00000265 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
 268:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
 26e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 271:	8b 45 0c             	mov    0xc(%ebp),%eax
 274:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 277:	eb 17                	jmp    290 <memmove+0x2b>
    *dst++ = *src++;
 279:	8b 45 fc             	mov    -0x4(%ebp),%eax
 27c:	8d 50 01             	lea    0x1(%eax),%edx
 27f:	89 55 fc             	mov    %edx,-0x4(%ebp)
 282:	8b 55 f8             	mov    -0x8(%ebp),%edx
 285:	8d 4a 01             	lea    0x1(%edx),%ecx
 288:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 28b:	0f b6 12             	movzbl (%edx),%edx
 28e:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 290:	8b 45 10             	mov    0x10(%ebp),%eax
 293:	8d 50 ff             	lea    -0x1(%eax),%edx
 296:	89 55 10             	mov    %edx,0x10(%ebp)
 299:	85 c0                	test   %eax,%eax
 29b:	7f dc                	jg     279 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2a0:	c9                   	leave  
 2a1:	c3                   	ret    

000002a2 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2a2:	b8 01 00 00 00       	mov    $0x1,%eax
 2a7:	cd 40                	int    $0x40
 2a9:	c3                   	ret    

000002aa <exit>:
SYSCALL(exit)
 2aa:	b8 02 00 00 00       	mov    $0x2,%eax
 2af:	cd 40                	int    $0x40
 2b1:	c3                   	ret    

000002b2 <wait>:
SYSCALL(wait)
 2b2:	b8 03 00 00 00       	mov    $0x3,%eax
 2b7:	cd 40                	int    $0x40
 2b9:	c3                   	ret    

000002ba <pipe>:
SYSCALL(pipe)
 2ba:	b8 04 00 00 00       	mov    $0x4,%eax
 2bf:	cd 40                	int    $0x40
 2c1:	c3                   	ret    

000002c2 <read>:
SYSCALL(read)
 2c2:	b8 05 00 00 00       	mov    $0x5,%eax
 2c7:	cd 40                	int    $0x40
 2c9:	c3                   	ret    

000002ca <write>:
SYSCALL(write)
 2ca:	b8 10 00 00 00       	mov    $0x10,%eax
 2cf:	cd 40                	int    $0x40
 2d1:	c3                   	ret    

000002d2 <close>:
SYSCALL(close)
 2d2:	b8 15 00 00 00       	mov    $0x15,%eax
 2d7:	cd 40                	int    $0x40
 2d9:	c3                   	ret    

000002da <kill>:
SYSCALL(kill)
 2da:	b8 06 00 00 00       	mov    $0x6,%eax
 2df:	cd 40                	int    $0x40
 2e1:	c3                   	ret    

000002e2 <exec>:
SYSCALL(exec)
 2e2:	b8 07 00 00 00       	mov    $0x7,%eax
 2e7:	cd 40                	int    $0x40
 2e9:	c3                   	ret    

000002ea <open>:
SYSCALL(open)
 2ea:	b8 0f 00 00 00       	mov    $0xf,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <mknod>:
SYSCALL(mknod)
 2f2:	b8 11 00 00 00       	mov    $0x11,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <unlink>:
SYSCALL(unlink)
 2fa:	b8 12 00 00 00       	mov    $0x12,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <fstat>:
SYSCALL(fstat)
 302:	b8 08 00 00 00       	mov    $0x8,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <link>:
SYSCALL(link)
 30a:	b8 13 00 00 00       	mov    $0x13,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <mkdir>:
SYSCALL(mkdir)
 312:	b8 14 00 00 00       	mov    $0x14,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <chdir>:
SYSCALL(chdir)
 31a:	b8 09 00 00 00       	mov    $0x9,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <dup>:
SYSCALL(dup)
 322:	b8 0a 00 00 00       	mov    $0xa,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <getpid>:
SYSCALL(getpid)
 32a:	b8 0b 00 00 00       	mov    $0xb,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <sbrk>:
SYSCALL(sbrk)
 332:	b8 0c 00 00 00       	mov    $0xc,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <sleep>:
SYSCALL(sleep)
 33a:	b8 0d 00 00 00       	mov    $0xd,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <uptime>:
SYSCALL(uptime)
 342:	b8 0e 00 00 00       	mov    $0xe,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <clone>:
SYSCALL(clone)
 34a:	b8 16 00 00 00       	mov    $0x16,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <texit>:
SYSCALL(texit)
 352:	b8 17 00 00 00       	mov    $0x17,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <tsleep>:
SYSCALL(tsleep)
 35a:	b8 18 00 00 00       	mov    $0x18,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <twakeup>:
SYSCALL(twakeup)
 362:	b8 19 00 00 00       	mov    $0x19,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <test>:
SYSCALL(test)
 36a:	b8 1a 00 00 00       	mov    $0x1a,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 372:	55                   	push   %ebp
 373:	89 e5                	mov    %esp,%ebp
 375:	83 ec 18             	sub    $0x18,%esp
 378:	8b 45 0c             	mov    0xc(%ebp),%eax
 37b:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 37e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 385:	00 
 386:	8d 45 f4             	lea    -0xc(%ebp),%eax
 389:	89 44 24 04          	mov    %eax,0x4(%esp)
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
 390:	89 04 24             	mov    %eax,(%esp)
 393:	e8 32 ff ff ff       	call   2ca <write>
}
 398:	c9                   	leave  
 399:	c3                   	ret    

0000039a <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 39a:	55                   	push   %ebp
 39b:	89 e5                	mov    %esp,%ebp
 39d:	56                   	push   %esi
 39e:	53                   	push   %ebx
 39f:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3a2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3a9:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3ad:	74 17                	je     3c6 <printint+0x2c>
 3af:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3b3:	79 11                	jns    3c6 <printint+0x2c>
    neg = 1;
 3b5:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bf:	f7 d8                	neg    %eax
 3c1:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3c4:	eb 06                	jmp    3cc <printint+0x32>
  } else {
    x = xx;
 3c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3cc:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3d3:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3d6:	8d 41 01             	lea    0x1(%ecx),%eax
 3d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3dc:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3df:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3e2:	ba 00 00 00 00       	mov    $0x0,%edx
 3e7:	f7 f3                	div    %ebx
 3e9:	89 d0                	mov    %edx,%eax
 3eb:	0f b6 80 94 0f 00 00 	movzbl 0xf94(%eax),%eax
 3f2:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3f6:	8b 75 10             	mov    0x10(%ebp),%esi
 3f9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3fc:	ba 00 00 00 00       	mov    $0x0,%edx
 401:	f7 f6                	div    %esi
 403:	89 45 ec             	mov    %eax,-0x14(%ebp)
 406:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 40a:	75 c7                	jne    3d3 <printint+0x39>
  if(neg)
 40c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 410:	74 10                	je     422 <printint+0x88>
    buf[i++] = '-';
 412:	8b 45 f4             	mov    -0xc(%ebp),%eax
 415:	8d 50 01             	lea    0x1(%eax),%edx
 418:	89 55 f4             	mov    %edx,-0xc(%ebp)
 41b:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 420:	eb 1f                	jmp    441 <printint+0xa7>
 422:	eb 1d                	jmp    441 <printint+0xa7>
    putc(fd, buf[i]);
 424:	8d 55 dc             	lea    -0x24(%ebp),%edx
 427:	8b 45 f4             	mov    -0xc(%ebp),%eax
 42a:	01 d0                	add    %edx,%eax
 42c:	0f b6 00             	movzbl (%eax),%eax
 42f:	0f be c0             	movsbl %al,%eax
 432:	89 44 24 04          	mov    %eax,0x4(%esp)
 436:	8b 45 08             	mov    0x8(%ebp),%eax
 439:	89 04 24             	mov    %eax,(%esp)
 43c:	e8 31 ff ff ff       	call   372 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 441:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 445:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 449:	79 d9                	jns    424 <printint+0x8a>
    putc(fd, buf[i]);
}
 44b:	83 c4 30             	add    $0x30,%esp
 44e:	5b                   	pop    %ebx
 44f:	5e                   	pop    %esi
 450:	5d                   	pop    %ebp
 451:	c3                   	ret    

00000452 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 452:	55                   	push   %ebp
 453:	89 e5                	mov    %esp,%ebp
 455:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 458:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 45f:	8d 45 0c             	lea    0xc(%ebp),%eax
 462:	83 c0 04             	add    $0x4,%eax
 465:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 468:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 46f:	e9 7c 01 00 00       	jmp    5f0 <printf+0x19e>
    c = fmt[i] & 0xff;
 474:	8b 55 0c             	mov    0xc(%ebp),%edx
 477:	8b 45 f0             	mov    -0x10(%ebp),%eax
 47a:	01 d0                	add    %edx,%eax
 47c:	0f b6 00             	movzbl (%eax),%eax
 47f:	0f be c0             	movsbl %al,%eax
 482:	25 ff 00 00 00       	and    $0xff,%eax
 487:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 48a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 48e:	75 2c                	jne    4bc <printf+0x6a>
      if(c == '%'){
 490:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 494:	75 0c                	jne    4a2 <printf+0x50>
        state = '%';
 496:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 49d:	e9 4a 01 00 00       	jmp    5ec <printf+0x19a>
      } else {
        putc(fd, c);
 4a2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4a5:	0f be c0             	movsbl %al,%eax
 4a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ac:	8b 45 08             	mov    0x8(%ebp),%eax
 4af:	89 04 24             	mov    %eax,(%esp)
 4b2:	e8 bb fe ff ff       	call   372 <putc>
 4b7:	e9 30 01 00 00       	jmp    5ec <printf+0x19a>
      }
    } else if(state == '%'){
 4bc:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4c0:	0f 85 26 01 00 00    	jne    5ec <printf+0x19a>
      if(c == 'd'){
 4c6:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4ca:	75 2d                	jne    4f9 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4cc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4cf:	8b 00                	mov    (%eax),%eax
 4d1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4d8:	00 
 4d9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4e0:	00 
 4e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e5:	8b 45 08             	mov    0x8(%ebp),%eax
 4e8:	89 04 24             	mov    %eax,(%esp)
 4eb:	e8 aa fe ff ff       	call   39a <printint>
        ap++;
 4f0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4f4:	e9 ec 00 00 00       	jmp    5e5 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4f9:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4fd:	74 06                	je     505 <printf+0xb3>
 4ff:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 503:	75 2d                	jne    532 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 505:	8b 45 e8             	mov    -0x18(%ebp),%eax
 508:	8b 00                	mov    (%eax),%eax
 50a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 511:	00 
 512:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 519:	00 
 51a:	89 44 24 04          	mov    %eax,0x4(%esp)
 51e:	8b 45 08             	mov    0x8(%ebp),%eax
 521:	89 04 24             	mov    %eax,(%esp)
 524:	e8 71 fe ff ff       	call   39a <printint>
        ap++;
 529:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 52d:	e9 b3 00 00 00       	jmp    5e5 <printf+0x193>
      } else if(c == 's'){
 532:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 536:	75 45                	jne    57d <printf+0x12b>
        s = (char*)*ap;
 538:	8b 45 e8             	mov    -0x18(%ebp),%eax
 53b:	8b 00                	mov    (%eax),%eax
 53d:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 540:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 544:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 548:	75 09                	jne    553 <printf+0x101>
          s = "(null)";
 54a:	c7 45 f4 9d 0b 00 00 	movl   $0xb9d,-0xc(%ebp)
        while(*s != 0){
 551:	eb 1e                	jmp    571 <printf+0x11f>
 553:	eb 1c                	jmp    571 <printf+0x11f>
          putc(fd, *s);
 555:	8b 45 f4             	mov    -0xc(%ebp),%eax
 558:	0f b6 00             	movzbl (%eax),%eax
 55b:	0f be c0             	movsbl %al,%eax
 55e:	89 44 24 04          	mov    %eax,0x4(%esp)
 562:	8b 45 08             	mov    0x8(%ebp),%eax
 565:	89 04 24             	mov    %eax,(%esp)
 568:	e8 05 fe ff ff       	call   372 <putc>
          s++;
 56d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 571:	8b 45 f4             	mov    -0xc(%ebp),%eax
 574:	0f b6 00             	movzbl (%eax),%eax
 577:	84 c0                	test   %al,%al
 579:	75 da                	jne    555 <printf+0x103>
 57b:	eb 68                	jmp    5e5 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 57d:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 581:	75 1d                	jne    5a0 <printf+0x14e>
        putc(fd, *ap);
 583:	8b 45 e8             	mov    -0x18(%ebp),%eax
 586:	8b 00                	mov    (%eax),%eax
 588:	0f be c0             	movsbl %al,%eax
 58b:	89 44 24 04          	mov    %eax,0x4(%esp)
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	89 04 24             	mov    %eax,(%esp)
 595:	e8 d8 fd ff ff       	call   372 <putc>
        ap++;
 59a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 59e:	eb 45                	jmp    5e5 <printf+0x193>
      } else if(c == '%'){
 5a0:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5a4:	75 17                	jne    5bd <printf+0x16b>
        putc(fd, c);
 5a6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5a9:	0f be c0             	movsbl %al,%eax
 5ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b0:	8b 45 08             	mov    0x8(%ebp),%eax
 5b3:	89 04 24             	mov    %eax,(%esp)
 5b6:	e8 b7 fd ff ff       	call   372 <putc>
 5bb:	eb 28                	jmp    5e5 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5bd:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5c4:	00 
 5c5:	8b 45 08             	mov    0x8(%ebp),%eax
 5c8:	89 04 24             	mov    %eax,(%esp)
 5cb:	e8 a2 fd ff ff       	call   372 <putc>
        putc(fd, c);
 5d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d3:	0f be c0             	movsbl %al,%eax
 5d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	89 04 24             	mov    %eax,(%esp)
 5e0:	e8 8d fd ff ff       	call   372 <putc>
      }
      state = 0;
 5e5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5ec:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5f0:	8b 55 0c             	mov    0xc(%ebp),%edx
 5f3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5f6:	01 d0                	add    %edx,%eax
 5f8:	0f b6 00             	movzbl (%eax),%eax
 5fb:	84 c0                	test   %al,%al
 5fd:	0f 85 71 fe ff ff    	jne    474 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 603:	c9                   	leave  
 604:	c3                   	ret    

00000605 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 605:	55                   	push   %ebp
 606:	89 e5                	mov    %esp,%ebp
 608:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 60b:	8b 45 08             	mov    0x8(%ebp),%eax
 60e:	83 e8 08             	sub    $0x8,%eax
 611:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 614:	a1 b0 0f 00 00       	mov    0xfb0,%eax
 619:	89 45 fc             	mov    %eax,-0x4(%ebp)
 61c:	eb 24                	jmp    642 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 61e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 621:	8b 00                	mov    (%eax),%eax
 623:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 626:	77 12                	ja     63a <free+0x35>
 628:	8b 45 f8             	mov    -0x8(%ebp),%eax
 62b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 62e:	77 24                	ja     654 <free+0x4f>
 630:	8b 45 fc             	mov    -0x4(%ebp),%eax
 633:	8b 00                	mov    (%eax),%eax
 635:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 638:	77 1a                	ja     654 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 63a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63d:	8b 00                	mov    (%eax),%eax
 63f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 642:	8b 45 f8             	mov    -0x8(%ebp),%eax
 645:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 648:	76 d4                	jbe    61e <free+0x19>
 64a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64d:	8b 00                	mov    (%eax),%eax
 64f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 652:	76 ca                	jbe    61e <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 654:	8b 45 f8             	mov    -0x8(%ebp),%eax
 657:	8b 40 04             	mov    0x4(%eax),%eax
 65a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 661:	8b 45 f8             	mov    -0x8(%ebp),%eax
 664:	01 c2                	add    %eax,%edx
 666:	8b 45 fc             	mov    -0x4(%ebp),%eax
 669:	8b 00                	mov    (%eax),%eax
 66b:	39 c2                	cmp    %eax,%edx
 66d:	75 24                	jne    693 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 66f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 672:	8b 50 04             	mov    0x4(%eax),%edx
 675:	8b 45 fc             	mov    -0x4(%ebp),%eax
 678:	8b 00                	mov    (%eax),%eax
 67a:	8b 40 04             	mov    0x4(%eax),%eax
 67d:	01 c2                	add    %eax,%edx
 67f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 682:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 685:	8b 45 fc             	mov    -0x4(%ebp),%eax
 688:	8b 00                	mov    (%eax),%eax
 68a:	8b 10                	mov    (%eax),%edx
 68c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68f:	89 10                	mov    %edx,(%eax)
 691:	eb 0a                	jmp    69d <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 693:	8b 45 fc             	mov    -0x4(%ebp),%eax
 696:	8b 10                	mov    (%eax),%edx
 698:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69b:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 69d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a0:	8b 40 04             	mov    0x4(%eax),%eax
 6a3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ad:	01 d0                	add    %edx,%eax
 6af:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6b2:	75 20                	jne    6d4 <free+0xcf>
    p->s.size += bp->s.size;
 6b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b7:	8b 50 04             	mov    0x4(%eax),%edx
 6ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6bd:	8b 40 04             	mov    0x4(%eax),%eax
 6c0:	01 c2                	add    %eax,%edx
 6c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c5:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6cb:	8b 10                	mov    (%eax),%edx
 6cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d0:	89 10                	mov    %edx,(%eax)
 6d2:	eb 08                	jmp    6dc <free+0xd7>
  } else
    p->s.ptr = bp;
 6d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6da:	89 10                	mov    %edx,(%eax)
  freep = p;
 6dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6df:	a3 b0 0f 00 00       	mov    %eax,0xfb0
}
 6e4:	c9                   	leave  
 6e5:	c3                   	ret    

000006e6 <morecore>:

static Header*
morecore(uint nu)
{
 6e6:	55                   	push   %ebp
 6e7:	89 e5                	mov    %esp,%ebp
 6e9:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6ec:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6f3:	77 07                	ja     6fc <morecore+0x16>
    nu = 4096;
 6f5:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6fc:	8b 45 08             	mov    0x8(%ebp),%eax
 6ff:	c1 e0 03             	shl    $0x3,%eax
 702:	89 04 24             	mov    %eax,(%esp)
 705:	e8 28 fc ff ff       	call   332 <sbrk>
 70a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 70d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 711:	75 07                	jne    71a <morecore+0x34>
    return 0;
 713:	b8 00 00 00 00       	mov    $0x0,%eax
 718:	eb 22                	jmp    73c <morecore+0x56>
  hp = (Header*)p;
 71a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 720:	8b 45 f0             	mov    -0x10(%ebp),%eax
 723:	8b 55 08             	mov    0x8(%ebp),%edx
 726:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 729:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72c:	83 c0 08             	add    $0x8,%eax
 72f:	89 04 24             	mov    %eax,(%esp)
 732:	e8 ce fe ff ff       	call   605 <free>
  return freep;
 737:	a1 b0 0f 00 00       	mov    0xfb0,%eax
}
 73c:	c9                   	leave  
 73d:	c3                   	ret    

0000073e <malloc>:

void*
malloc(uint nbytes)
{
 73e:	55                   	push   %ebp
 73f:	89 e5                	mov    %esp,%ebp
 741:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 744:	8b 45 08             	mov    0x8(%ebp),%eax
 747:	83 c0 07             	add    $0x7,%eax
 74a:	c1 e8 03             	shr    $0x3,%eax
 74d:	83 c0 01             	add    $0x1,%eax
 750:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 753:	a1 b0 0f 00 00       	mov    0xfb0,%eax
 758:	89 45 f0             	mov    %eax,-0x10(%ebp)
 75b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 75f:	75 23                	jne    784 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 761:	c7 45 f0 a8 0f 00 00 	movl   $0xfa8,-0x10(%ebp)
 768:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76b:	a3 b0 0f 00 00       	mov    %eax,0xfb0
 770:	a1 b0 0f 00 00       	mov    0xfb0,%eax
 775:	a3 a8 0f 00 00       	mov    %eax,0xfa8
    base.s.size = 0;
 77a:	c7 05 ac 0f 00 00 00 	movl   $0x0,0xfac
 781:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 784:	8b 45 f0             	mov    -0x10(%ebp),%eax
 787:	8b 00                	mov    (%eax),%eax
 789:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 78c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78f:	8b 40 04             	mov    0x4(%eax),%eax
 792:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 795:	72 4d                	jb     7e4 <malloc+0xa6>
      if(p->s.size == nunits)
 797:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79a:	8b 40 04             	mov    0x4(%eax),%eax
 79d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7a0:	75 0c                	jne    7ae <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a5:	8b 10                	mov    (%eax),%edx
 7a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7aa:	89 10                	mov    %edx,(%eax)
 7ac:	eb 26                	jmp    7d4 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b1:	8b 40 04             	mov    0x4(%eax),%eax
 7b4:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7b7:	89 c2                	mov    %eax,%edx
 7b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bc:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c2:	8b 40 04             	mov    0x4(%eax),%eax
 7c5:	c1 e0 03             	shl    $0x3,%eax
 7c8:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ce:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7d1:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d7:	a3 b0 0f 00 00       	mov    %eax,0xfb0
      return (void*)(p + 1);
 7dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7df:	83 c0 08             	add    $0x8,%eax
 7e2:	eb 38                	jmp    81c <malloc+0xde>
    }
    if(p == freep)
 7e4:	a1 b0 0f 00 00       	mov    0xfb0,%eax
 7e9:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7ec:	75 1b                	jne    809 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f1:	89 04 24             	mov    %eax,(%esp)
 7f4:	e8 ed fe ff ff       	call   6e6 <morecore>
 7f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7fc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 800:	75 07                	jne    809 <malloc+0xcb>
        return 0;
 802:	b8 00 00 00 00       	mov    $0x0,%eax
 807:	eb 13                	jmp    81c <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 809:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80c:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 812:	8b 00                	mov    (%eax),%eax
 814:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 817:	e9 70 ff ff ff       	jmp    78c <malloc+0x4e>
}
 81c:	c9                   	leave  
 81d:	c3                   	ret    

0000081e <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 81e:	55                   	push   %ebp
 81f:	89 e5                	mov    %esp,%ebp
 821:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 824:	8b 55 08             	mov    0x8(%ebp),%edx
 827:	8b 45 0c             	mov    0xc(%ebp),%eax
 82a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 82d:	f0 87 02             	lock xchg %eax,(%edx)
 830:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 833:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 836:	c9                   	leave  
 837:	c3                   	ret    

00000838 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 838:	55                   	push   %ebp
 839:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 83b:	8b 45 08             	mov    0x8(%ebp),%eax
 83e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 844:	5d                   	pop    %ebp
 845:	c3                   	ret    

00000846 <lock_acquire>:
void lock_acquire(lock_t *lock){
 846:	55                   	push   %ebp
 847:	89 e5                	mov    %esp,%ebp
 849:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 84c:	90                   	nop
 84d:	8b 45 08             	mov    0x8(%ebp),%eax
 850:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 857:	00 
 858:	89 04 24             	mov    %eax,(%esp)
 85b:	e8 be ff ff ff       	call   81e <xchg>
 860:	85 c0                	test   %eax,%eax
 862:	75 e9                	jne    84d <lock_acquire+0x7>
}
 864:	c9                   	leave  
 865:	c3                   	ret    

00000866 <lock_release>:
void lock_release(lock_t *lock){
 866:	55                   	push   %ebp
 867:	89 e5                	mov    %esp,%ebp
 869:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 86c:	8b 45 08             	mov    0x8(%ebp),%eax
 86f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 876:	00 
 877:	89 04 24             	mov    %eax,(%esp)
 87a:	e8 9f ff ff ff       	call   81e <xchg>
}
 87f:	c9                   	leave  
 880:	c3                   	ret    

00000881 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 881:	55                   	push   %ebp
 882:	89 e5                	mov    %esp,%ebp
 884:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 887:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 88e:	e8 ab fe ff ff       	call   73e <malloc>
 893:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 896:	8b 45 f4             	mov    -0xc(%ebp),%eax
 899:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 89c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89f:	25 ff 0f 00 00       	and    $0xfff,%eax
 8a4:	85 c0                	test   %eax,%eax
 8a6:	74 14                	je     8bc <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 8a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ab:	25 ff 0f 00 00       	and    $0xfff,%eax
 8b0:	89 c2                	mov    %eax,%edx
 8b2:	b8 00 10 00 00       	mov    $0x1000,%eax
 8b7:	29 d0                	sub    %edx,%eax
 8b9:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 8bc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8c0:	75 1b                	jne    8dd <thread_create+0x5c>

        printf(1,"malloc fail \n");
 8c2:	c7 44 24 04 a4 0b 00 	movl   $0xba4,0x4(%esp)
 8c9:	00 
 8ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8d1:	e8 7c fb ff ff       	call   452 <printf>
        return 0;
 8d6:	b8 00 00 00 00       	mov    $0x0,%eax
 8db:	eb 6f                	jmp    94c <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 8dd:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8e0:	8b 55 08             	mov    0x8(%ebp),%edx
 8e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e6:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8ea:	89 54 24 08          	mov    %edx,0x8(%esp)
 8ee:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 8f5:	00 
 8f6:	89 04 24             	mov    %eax,(%esp)
 8f9:	e8 4c fa ff ff       	call   34a <clone>
 8fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 901:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 905:	79 1b                	jns    922 <thread_create+0xa1>
        printf(1,"clone fails\n");
 907:	c7 44 24 04 b2 0b 00 	movl   $0xbb2,0x4(%esp)
 90e:	00 
 90f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 916:	e8 37 fb ff ff       	call   452 <printf>
        return 0;
 91b:	b8 00 00 00 00       	mov    $0x0,%eax
 920:	eb 2a                	jmp    94c <thread_create+0xcb>
    }
    if(tid > 0){
 922:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 926:	7e 05                	jle    92d <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 928:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92b:	eb 1f                	jmp    94c <thread_create+0xcb>
    }
    if(tid == 0){
 92d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 931:	75 14                	jne    947 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 933:	c7 44 24 04 bf 0b 00 	movl   $0xbbf,0x4(%esp)
 93a:	00 
 93b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 942:	e8 0b fb ff ff       	call   452 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 947:	b8 00 00 00 00       	mov    $0x0,%eax
}
 94c:	c9                   	leave  
 94d:	c3                   	ret    

0000094e <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 94e:	55                   	push   %ebp
 94f:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 951:	8b 45 08             	mov    0x8(%ebp),%eax
 954:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 95a:	8b 45 08             	mov    0x8(%ebp),%eax
 95d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 964:	8b 45 08             	mov    0x8(%ebp),%eax
 967:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 96e:	5d                   	pop    %ebp
 96f:	c3                   	ret    

00000970 <add_q>:

void add_q(struct queue *q, int v){
 970:	55                   	push   %ebp
 971:	89 e5                	mov    %esp,%ebp
 973:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 976:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 97d:	e8 bc fd ff ff       	call   73e <malloc>
 982:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 985:	8b 45 f4             	mov    -0xc(%ebp),%eax
 988:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 98f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 992:	8b 55 0c             	mov    0xc(%ebp),%edx
 995:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 997:	8b 45 08             	mov    0x8(%ebp),%eax
 99a:	8b 40 04             	mov    0x4(%eax),%eax
 99d:	85 c0                	test   %eax,%eax
 99f:	75 0b                	jne    9ac <add_q+0x3c>
        q->head = n;
 9a1:	8b 45 08             	mov    0x8(%ebp),%eax
 9a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9a7:	89 50 04             	mov    %edx,0x4(%eax)
 9aa:	eb 0c                	jmp    9b8 <add_q+0x48>
    }else{
        q->tail->next = n;
 9ac:	8b 45 08             	mov    0x8(%ebp),%eax
 9af:	8b 40 08             	mov    0x8(%eax),%eax
 9b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9b5:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 9b8:	8b 45 08             	mov    0x8(%ebp),%eax
 9bb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9be:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 9c1:	8b 45 08             	mov    0x8(%ebp),%eax
 9c4:	8b 00                	mov    (%eax),%eax
 9c6:	8d 50 01             	lea    0x1(%eax),%edx
 9c9:	8b 45 08             	mov    0x8(%ebp),%eax
 9cc:	89 10                	mov    %edx,(%eax)
}
 9ce:	c9                   	leave  
 9cf:	c3                   	ret    

000009d0 <empty_q>:

int empty_q(struct queue *q){
 9d0:	55                   	push   %ebp
 9d1:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 9d3:	8b 45 08             	mov    0x8(%ebp),%eax
 9d6:	8b 00                	mov    (%eax),%eax
 9d8:	85 c0                	test   %eax,%eax
 9da:	75 07                	jne    9e3 <empty_q+0x13>
        return 1;
 9dc:	b8 01 00 00 00       	mov    $0x1,%eax
 9e1:	eb 05                	jmp    9e8 <empty_q+0x18>
    else
        return 0;
 9e3:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 9e8:	5d                   	pop    %ebp
 9e9:	c3                   	ret    

000009ea <pop_q>:
int pop_q(struct queue *q){
 9ea:	55                   	push   %ebp
 9eb:	89 e5                	mov    %esp,%ebp
 9ed:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 9f0:	8b 45 08             	mov    0x8(%ebp),%eax
 9f3:	89 04 24             	mov    %eax,(%esp)
 9f6:	e8 d5 ff ff ff       	call   9d0 <empty_q>
 9fb:	85 c0                	test   %eax,%eax
 9fd:	75 5d                	jne    a5c <pop_q+0x72>
       val = q->head->value; 
 9ff:	8b 45 08             	mov    0x8(%ebp),%eax
 a02:	8b 40 04             	mov    0x4(%eax),%eax
 a05:	8b 00                	mov    (%eax),%eax
 a07:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 a0a:	8b 45 08             	mov    0x8(%ebp),%eax
 a0d:	8b 40 04             	mov    0x4(%eax),%eax
 a10:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 a13:	8b 45 08             	mov    0x8(%ebp),%eax
 a16:	8b 40 04             	mov    0x4(%eax),%eax
 a19:	8b 50 04             	mov    0x4(%eax),%edx
 a1c:	8b 45 08             	mov    0x8(%ebp),%eax
 a1f:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a22:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a25:	89 04 24             	mov    %eax,(%esp)
 a28:	e8 d8 fb ff ff       	call   605 <free>
       q->size--;
 a2d:	8b 45 08             	mov    0x8(%ebp),%eax
 a30:	8b 00                	mov    (%eax),%eax
 a32:	8d 50 ff             	lea    -0x1(%eax),%edx
 a35:	8b 45 08             	mov    0x8(%ebp),%eax
 a38:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a3a:	8b 45 08             	mov    0x8(%ebp),%eax
 a3d:	8b 00                	mov    (%eax),%eax
 a3f:	85 c0                	test   %eax,%eax
 a41:	75 14                	jne    a57 <pop_q+0x6d>
            q->head = 0;
 a43:	8b 45 08             	mov    0x8(%ebp),%eax
 a46:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a4d:	8b 45 08             	mov    0x8(%ebp),%eax
 a50:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5a:	eb 05                	jmp    a61 <pop_q+0x77>
    }
    return -1;
 a5c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a61:	c9                   	leave  
 a62:	c3                   	ret    

00000a63 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 a63:	55                   	push   %ebp
 a64:	89 e5                	mov    %esp,%ebp
 a66:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 a69:	8b 45 08             	mov    0x8(%ebp),%eax
 a6c:	8b 55 0c             	mov    0xc(%ebp),%edx
 a6f:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 a72:	8b 45 08             	mov    0x8(%ebp),%eax
 a75:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 a7c:	8b 45 08             	mov    0x8(%ebp),%eax
 a7f:	89 04 24             	mov    %eax,(%esp)
 a82:	e8 b1 fd ff ff       	call   838 <lock_init>
}
 a87:	c9                   	leave  
 a88:	c3                   	ret    

00000a89 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 a89:	55                   	push   %ebp
 a8a:	89 e5                	mov    %esp,%ebp
 a8c:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 a8f:	8b 45 08             	mov    0x8(%ebp),%eax
 a92:	89 04 24             	mov    %eax,(%esp)
 a95:	e8 ac fd ff ff       	call   846 <lock_acquire>
	if(s->count  == 0){
 a9a:	8b 45 08             	mov    0x8(%ebp),%eax
 a9d:	8b 40 04             	mov    0x4(%eax),%eax
 aa0:	85 c0                	test   %eax,%eax
 aa2:	75 2f                	jne    ad3 <sem_aquire+0x4a>
		//add proc to waiters list
		int tid = getpid();
 aa4:	e8 81 f8 ff ff       	call   32a <getpid>
 aa9:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 aac:	8b 45 08             	mov    0x8(%ebp),%eax
 aaf:	8d 50 0c             	lea    0xc(%eax),%edx
 ab2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab5:	89 44 24 04          	mov    %eax,0x4(%esp)
 ab9:	89 14 24             	mov    %edx,(%esp)
 abc:	e8 af fe ff ff       	call   970 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 ac1:	8b 45 08             	mov    0x8(%ebp),%eax
 ac4:	89 04 24             	mov    %eax,(%esp)
 ac7:	e8 9a fd ff ff       	call   866 <lock_release>
		tsleep(); 
 acc:	e8 89 f8 ff ff       	call   35a <tsleep>
 ad1:	eb 1a                	jmp    aed <sem_aquire+0x64>
	}
	else{
		s->count--;	
 ad3:	8b 45 08             	mov    0x8(%ebp),%eax
 ad6:	8b 40 04             	mov    0x4(%eax),%eax
 ad9:	8d 50 ff             	lea    -0x1(%eax),%edx
 adc:	8b 45 08             	mov    0x8(%ebp),%eax
 adf:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 ae2:	8b 45 08             	mov    0x8(%ebp),%eax
 ae5:	89 04 24             	mov    %eax,(%esp)
 ae8:	e8 79 fd ff ff       	call   866 <lock_release>
	}
}
 aed:	c9                   	leave  
 aee:	c3                   	ret    

00000aef <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 aef:	55                   	push   %ebp
 af0:	89 e5                	mov    %esp,%ebp
 af2:	83 ec 28             	sub    $0x28,%esp
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 af5:	8b 45 08             	mov    0x8(%ebp),%eax
 af8:	89 04 24             	mov    %eax,(%esp)
 afb:	e8 46 fd ff ff       	call   846 <lock_acquire>
	if(s->count < s->size){
 b00:	8b 45 08             	mov    0x8(%ebp),%eax
 b03:	8b 50 04             	mov    0x4(%eax),%edx
 b06:	8b 45 08             	mov    0x8(%ebp),%eax
 b09:	8b 40 08             	mov    0x8(%eax),%eax
 b0c:	39 c2                	cmp    %eax,%edx
 b0e:	7d 40                	jge    b50 <sem_signal+0x61>
		int tid;
		tid = pop_q(&s->waiters);
 b10:	8b 45 08             	mov    0x8(%ebp),%eax
 b13:	83 c0 0c             	add    $0xc,%eax
 b16:	89 04 24             	mov    %eax,(%esp)
 b19:	e8 cc fe ff ff       	call   9ea <pop_q>
 b1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if(tid != -1) twakeup(tid);
 b21:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b25:	74 0d                	je     b34 <sem_signal+0x45>
 b27:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b2a:	89 04 24             	mov    %eax,(%esp)
 b2d:	e8 30 f8 ff ff       	call   362 <twakeup>
 b32:	eb 0f                	jmp    b43 <sem_signal+0x54>
		else s->count++;	
 b34:	8b 45 08             	mov    0x8(%ebp),%eax
 b37:	8b 40 04             	mov    0x4(%eax),%eax
 b3a:	8d 50 01             	lea    0x1(%eax),%edx
 b3d:	8b 45 08             	mov    0x8(%ebp),%eax
 b40:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b43:	8b 45 08             	mov    0x8(%ebp),%eax
 b46:	89 04 24             	mov    %eax,(%esp)
 b49:	e8 18 fd ff ff       	call   866 <lock_release>
 b4e:	eb 27                	jmp    b77 <sem_signal+0x88>
	}
	else{
		int tid;
		tid = pop_q(&s->waiters);
 b50:	8b 45 08             	mov    0x8(%ebp),%eax
 b53:	83 c0 0c             	add    $0xc,%eax
 b56:	89 04 24             	mov    %eax,(%esp)
 b59:	e8 8c fe ff ff       	call   9ea <pop_q>
 b5e:	89 45 f0             	mov    %eax,-0x10(%ebp)
		twakeup(tid);
 b61:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b64:	89 04 24             	mov    %eax,(%esp)
 b67:	e8 f6 f7 ff ff       	call   362 <twakeup>
		lock_release(&s->lock);
 b6c:	8b 45 08             	mov    0x8(%ebp),%eax
 b6f:	89 04 24             	mov    %eax,(%esp)
 b72:	e8 ef fc ff ff       	call   866 <lock_release>
	}

 b77:	c9                   	leave  
 b78:	c3                   	ret    
