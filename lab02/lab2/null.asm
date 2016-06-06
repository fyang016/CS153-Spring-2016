
_null:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
	int *p = 0;
   9:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  10:	00 
	printf(1, "hello[%x]\n", *p); // uh oh?
  11:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  15:	8b 00                	mov    (%eax),%eax
  17:	89 44 24 08          	mov    %eax,0x8(%esp)
  1b:	c7 44 24 04 b3 0b 00 	movl   $0xbb3,0x4(%esp)
  22:	00 
  23:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2a:	e8 15 04 00 00       	call   444 <printf>
	exit();
  2f:	e8 68 02 00 00       	call   29c <exit>

00000034 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  34:	55                   	push   %ebp
  35:	89 e5                	mov    %esp,%ebp
  37:	57                   	push   %edi
  38:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  39:	8b 4d 08             	mov    0x8(%ebp),%ecx
  3c:	8b 55 10             	mov    0x10(%ebp),%edx
  3f:	8b 45 0c             	mov    0xc(%ebp),%eax
  42:	89 cb                	mov    %ecx,%ebx
  44:	89 df                	mov    %ebx,%edi
  46:	89 d1                	mov    %edx,%ecx
  48:	fc                   	cld    
  49:	f3 aa                	rep stos %al,%es:(%edi)
  4b:	89 ca                	mov    %ecx,%edx
  4d:	89 fb                	mov    %edi,%ebx
  4f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  52:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  55:	5b                   	pop    %ebx
  56:	5f                   	pop    %edi
  57:	5d                   	pop    %ebp
  58:	c3                   	ret    

00000059 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  59:	55                   	push   %ebp
  5a:	89 e5                	mov    %esp,%ebp
  5c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  5f:	8b 45 08             	mov    0x8(%ebp),%eax
  62:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  65:	90                   	nop
  66:	8b 45 08             	mov    0x8(%ebp),%eax
  69:	8d 50 01             	lea    0x1(%eax),%edx
  6c:	89 55 08             	mov    %edx,0x8(%ebp)
  6f:	8b 55 0c             	mov    0xc(%ebp),%edx
  72:	8d 4a 01             	lea    0x1(%edx),%ecx
  75:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  78:	0f b6 12             	movzbl (%edx),%edx
  7b:	88 10                	mov    %dl,(%eax)
  7d:	0f b6 00             	movzbl (%eax),%eax
  80:	84 c0                	test   %al,%al
  82:	75 e2                	jne    66 <strcpy+0xd>
    ;
  return os;
  84:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  87:	c9                   	leave  
  88:	c3                   	ret    

00000089 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  89:	55                   	push   %ebp
  8a:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  8c:	eb 08                	jmp    96 <strcmp+0xd>
    p++, q++;
  8e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  92:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  96:	8b 45 08             	mov    0x8(%ebp),%eax
  99:	0f b6 00             	movzbl (%eax),%eax
  9c:	84 c0                	test   %al,%al
  9e:	74 10                	je     b0 <strcmp+0x27>
  a0:	8b 45 08             	mov    0x8(%ebp),%eax
  a3:	0f b6 10             	movzbl (%eax),%edx
  a6:	8b 45 0c             	mov    0xc(%ebp),%eax
  a9:	0f b6 00             	movzbl (%eax),%eax
  ac:	38 c2                	cmp    %al,%dl
  ae:	74 de                	je     8e <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  b0:	8b 45 08             	mov    0x8(%ebp),%eax
  b3:	0f b6 00             	movzbl (%eax),%eax
  b6:	0f b6 d0             	movzbl %al,%edx
  b9:	8b 45 0c             	mov    0xc(%ebp),%eax
  bc:	0f b6 00             	movzbl (%eax),%eax
  bf:	0f b6 c0             	movzbl %al,%eax
  c2:	29 c2                	sub    %eax,%edx
  c4:	89 d0                	mov    %edx,%eax
}
  c6:	5d                   	pop    %ebp
  c7:	c3                   	ret    

000000c8 <strlen>:

uint
strlen(char *s)
{
  c8:	55                   	push   %ebp
  c9:	89 e5                	mov    %esp,%ebp
  cb:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  ce:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  d5:	eb 04                	jmp    db <strlen+0x13>
  d7:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  db:	8b 55 fc             	mov    -0x4(%ebp),%edx
  de:	8b 45 08             	mov    0x8(%ebp),%eax
  e1:	01 d0                	add    %edx,%eax
  e3:	0f b6 00             	movzbl (%eax),%eax
  e6:	84 c0                	test   %al,%al
  e8:	75 ed                	jne    d7 <strlen+0xf>
    ;
  return n;
  ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  ed:	c9                   	leave  
  ee:	c3                   	ret    

000000ef <memset>:

void*
memset(void *dst, int c, uint n)
{
  ef:	55                   	push   %ebp
  f0:	89 e5                	mov    %esp,%ebp
  f2:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  f5:	8b 45 10             	mov    0x10(%ebp),%eax
  f8:	89 44 24 08          	mov    %eax,0x8(%esp)
  fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	89 04 24             	mov    %eax,(%esp)
 109:	e8 26 ff ff ff       	call   34 <stosb>
  return dst;
 10e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 111:	c9                   	leave  
 112:	c3                   	ret    

00000113 <strchr>:

char*
strchr(const char *s, char c)
{
 113:	55                   	push   %ebp
 114:	89 e5                	mov    %esp,%ebp
 116:	83 ec 04             	sub    $0x4,%esp
 119:	8b 45 0c             	mov    0xc(%ebp),%eax
 11c:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 11f:	eb 14                	jmp    135 <strchr+0x22>
    if(*s == c)
 121:	8b 45 08             	mov    0x8(%ebp),%eax
 124:	0f b6 00             	movzbl (%eax),%eax
 127:	3a 45 fc             	cmp    -0x4(%ebp),%al
 12a:	75 05                	jne    131 <strchr+0x1e>
      return (char*)s;
 12c:	8b 45 08             	mov    0x8(%ebp),%eax
 12f:	eb 13                	jmp    144 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 131:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 135:	8b 45 08             	mov    0x8(%ebp),%eax
 138:	0f b6 00             	movzbl (%eax),%eax
 13b:	84 c0                	test   %al,%al
 13d:	75 e2                	jne    121 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 13f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 144:	c9                   	leave  
 145:	c3                   	ret    

00000146 <gets>:

char*
gets(char *buf, int max)
{
 146:	55                   	push   %ebp
 147:	89 e5                	mov    %esp,%ebp
 149:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 14c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 153:	eb 4c                	jmp    1a1 <gets+0x5b>
    cc = read(0, &c, 1);
 155:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 15c:	00 
 15d:	8d 45 ef             	lea    -0x11(%ebp),%eax
 160:	89 44 24 04          	mov    %eax,0x4(%esp)
 164:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 16b:	e8 44 01 00 00       	call   2b4 <read>
 170:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 173:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 177:	7f 02                	jg     17b <gets+0x35>
      break;
 179:	eb 31                	jmp    1ac <gets+0x66>
    buf[i++] = c;
 17b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 17e:	8d 50 01             	lea    0x1(%eax),%edx
 181:	89 55 f4             	mov    %edx,-0xc(%ebp)
 184:	89 c2                	mov    %eax,%edx
 186:	8b 45 08             	mov    0x8(%ebp),%eax
 189:	01 c2                	add    %eax,%edx
 18b:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18f:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 191:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 195:	3c 0a                	cmp    $0xa,%al
 197:	74 13                	je     1ac <gets+0x66>
 199:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 19d:	3c 0d                	cmp    $0xd,%al
 19f:	74 0b                	je     1ac <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1a4:	83 c0 01             	add    $0x1,%eax
 1a7:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1aa:	7c a9                	jl     155 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1ac:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1af:	8b 45 08             	mov    0x8(%ebp),%eax
 1b2:	01 d0                	add    %edx,%eax
 1b4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ba:	c9                   	leave  
 1bb:	c3                   	ret    

000001bc <stat>:

int
stat(char *n, struct stat *st)
{
 1bc:	55                   	push   %ebp
 1bd:	89 e5                	mov    %esp,%ebp
 1bf:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1c9:	00 
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	89 04 24             	mov    %eax,(%esp)
 1d0:	e8 07 01 00 00       	call   2dc <open>
 1d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1d8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1dc:	79 07                	jns    1e5 <stat+0x29>
    return -1;
 1de:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1e3:	eb 23                	jmp    208 <stat+0x4c>
  r = fstat(fd, st);
 1e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ef:	89 04 24             	mov    %eax,(%esp)
 1f2:	e8 fd 00 00 00       	call   2f4 <fstat>
 1f7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1fd:	89 04 24             	mov    %eax,(%esp)
 200:	e8 bf 00 00 00       	call   2c4 <close>
  return r;
 205:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 208:	c9                   	leave  
 209:	c3                   	ret    

0000020a <atoi>:

int
atoi(const char *s)
{
 20a:	55                   	push   %ebp
 20b:	89 e5                	mov    %esp,%ebp
 20d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 210:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 217:	eb 25                	jmp    23e <atoi+0x34>
    n = n*10 + *s++ - '0';
 219:	8b 55 fc             	mov    -0x4(%ebp),%edx
 21c:	89 d0                	mov    %edx,%eax
 21e:	c1 e0 02             	shl    $0x2,%eax
 221:	01 d0                	add    %edx,%eax
 223:	01 c0                	add    %eax,%eax
 225:	89 c1                	mov    %eax,%ecx
 227:	8b 45 08             	mov    0x8(%ebp),%eax
 22a:	8d 50 01             	lea    0x1(%eax),%edx
 22d:	89 55 08             	mov    %edx,0x8(%ebp)
 230:	0f b6 00             	movzbl (%eax),%eax
 233:	0f be c0             	movsbl %al,%eax
 236:	01 c8                	add    %ecx,%eax
 238:	83 e8 30             	sub    $0x30,%eax
 23b:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 23e:	8b 45 08             	mov    0x8(%ebp),%eax
 241:	0f b6 00             	movzbl (%eax),%eax
 244:	3c 2f                	cmp    $0x2f,%al
 246:	7e 0a                	jle    252 <atoi+0x48>
 248:	8b 45 08             	mov    0x8(%ebp),%eax
 24b:	0f b6 00             	movzbl (%eax),%eax
 24e:	3c 39                	cmp    $0x39,%al
 250:	7e c7                	jle    219 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 252:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 255:	c9                   	leave  
 256:	c3                   	ret    

00000257 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 257:	55                   	push   %ebp
 258:	89 e5                	mov    %esp,%ebp
 25a:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
 260:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 263:	8b 45 0c             	mov    0xc(%ebp),%eax
 266:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 269:	eb 17                	jmp    282 <memmove+0x2b>
    *dst++ = *src++;
 26b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 26e:	8d 50 01             	lea    0x1(%eax),%edx
 271:	89 55 fc             	mov    %edx,-0x4(%ebp)
 274:	8b 55 f8             	mov    -0x8(%ebp),%edx
 277:	8d 4a 01             	lea    0x1(%edx),%ecx
 27a:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 27d:	0f b6 12             	movzbl (%edx),%edx
 280:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 282:	8b 45 10             	mov    0x10(%ebp),%eax
 285:	8d 50 ff             	lea    -0x1(%eax),%edx
 288:	89 55 10             	mov    %edx,0x10(%ebp)
 28b:	85 c0                	test   %eax,%eax
 28d:	7f dc                	jg     26b <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 28f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 294:	b8 01 00 00 00       	mov    $0x1,%eax
 299:	cd 40                	int    $0x40
 29b:	c3                   	ret    

0000029c <exit>:
SYSCALL(exit)
 29c:	b8 02 00 00 00       	mov    $0x2,%eax
 2a1:	cd 40                	int    $0x40
 2a3:	c3                   	ret    

000002a4 <wait>:
SYSCALL(wait)
 2a4:	b8 03 00 00 00       	mov    $0x3,%eax
 2a9:	cd 40                	int    $0x40
 2ab:	c3                   	ret    

000002ac <pipe>:
SYSCALL(pipe)
 2ac:	b8 04 00 00 00       	mov    $0x4,%eax
 2b1:	cd 40                	int    $0x40
 2b3:	c3                   	ret    

000002b4 <read>:
SYSCALL(read)
 2b4:	b8 05 00 00 00       	mov    $0x5,%eax
 2b9:	cd 40                	int    $0x40
 2bb:	c3                   	ret    

000002bc <write>:
SYSCALL(write)
 2bc:	b8 10 00 00 00       	mov    $0x10,%eax
 2c1:	cd 40                	int    $0x40
 2c3:	c3                   	ret    

000002c4 <close>:
SYSCALL(close)
 2c4:	b8 15 00 00 00       	mov    $0x15,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <kill>:
SYSCALL(kill)
 2cc:	b8 06 00 00 00       	mov    $0x6,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <exec>:
SYSCALL(exec)
 2d4:	b8 07 00 00 00       	mov    $0x7,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <open>:
SYSCALL(open)
 2dc:	b8 0f 00 00 00       	mov    $0xf,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <mknod>:
SYSCALL(mknod)
 2e4:	b8 11 00 00 00       	mov    $0x11,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <unlink>:
SYSCALL(unlink)
 2ec:	b8 12 00 00 00       	mov    $0x12,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <fstat>:
SYSCALL(fstat)
 2f4:	b8 08 00 00 00       	mov    $0x8,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <link>:
SYSCALL(link)
 2fc:	b8 13 00 00 00       	mov    $0x13,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <mkdir>:
SYSCALL(mkdir)
 304:	b8 14 00 00 00       	mov    $0x14,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <chdir>:
SYSCALL(chdir)
 30c:	b8 09 00 00 00       	mov    $0x9,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <dup>:
SYSCALL(dup)
 314:	b8 0a 00 00 00       	mov    $0xa,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <getpid>:
SYSCALL(getpid)
 31c:	b8 0b 00 00 00       	mov    $0xb,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <sbrk>:
SYSCALL(sbrk)
 324:	b8 0c 00 00 00       	mov    $0xc,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <sleep>:
SYSCALL(sleep)
 32c:	b8 0d 00 00 00       	mov    $0xd,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <uptime>:
SYSCALL(uptime)
 334:	b8 0e 00 00 00       	mov    $0xe,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <clone>:
SYSCALL(clone)
 33c:	b8 16 00 00 00       	mov    $0x16,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <texit>:
SYSCALL(texit)
 344:	b8 17 00 00 00       	mov    $0x17,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <tsleep>:
SYSCALL(tsleep)
 34c:	b8 18 00 00 00       	mov    $0x18,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <twakeup>:
SYSCALL(twakeup)
 354:	b8 19 00 00 00       	mov    $0x19,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <test>:
SYSCALL(test)
 35c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	83 ec 18             	sub    $0x18,%esp
 36a:	8b 45 0c             	mov    0xc(%ebp),%eax
 36d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 370:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 377:	00 
 378:	8d 45 f4             	lea    -0xc(%ebp),%eax
 37b:	89 44 24 04          	mov    %eax,0x4(%esp)
 37f:	8b 45 08             	mov    0x8(%ebp),%eax
 382:	89 04 24             	mov    %eax,(%esp)
 385:	e8 32 ff ff ff       	call   2bc <write>
}
 38a:	c9                   	leave  
 38b:	c3                   	ret    

0000038c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 38c:	55                   	push   %ebp
 38d:	89 e5                	mov    %esp,%ebp
 38f:	56                   	push   %esi
 390:	53                   	push   %ebx
 391:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 394:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 39b:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 39f:	74 17                	je     3b8 <printint+0x2c>
 3a1:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3a5:	79 11                	jns    3b8 <printint+0x2c>
    neg = 1;
 3a7:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b1:	f7 d8                	neg    %eax
 3b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3b6:	eb 06                	jmp    3be <printint+0x32>
  } else {
    x = xx;
 3b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3bb:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3be:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3c5:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3c8:	8d 41 01             	lea    0x1(%ecx),%eax
 3cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3ce:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3d4:	ba 00 00 00 00       	mov    $0x0,%edx
 3d9:	f7 f3                	div    %ebx
 3db:	89 d0                	mov    %edx,%eax
 3dd:	0f b6 80 f8 0f 00 00 	movzbl 0xff8(%eax),%eax
 3e4:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3e8:	8b 75 10             	mov    0x10(%ebp),%esi
 3eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3ee:	ba 00 00 00 00       	mov    $0x0,%edx
 3f3:	f7 f6                	div    %esi
 3f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3f8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3fc:	75 c7                	jne    3c5 <printint+0x39>
  if(neg)
 3fe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 402:	74 10                	je     414 <printint+0x88>
    buf[i++] = '-';
 404:	8b 45 f4             	mov    -0xc(%ebp),%eax
 407:	8d 50 01             	lea    0x1(%eax),%edx
 40a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 40d:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 412:	eb 1f                	jmp    433 <printint+0xa7>
 414:	eb 1d                	jmp    433 <printint+0xa7>
    putc(fd, buf[i]);
 416:	8d 55 dc             	lea    -0x24(%ebp),%edx
 419:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41c:	01 d0                	add    %edx,%eax
 41e:	0f b6 00             	movzbl (%eax),%eax
 421:	0f be c0             	movsbl %al,%eax
 424:	89 44 24 04          	mov    %eax,0x4(%esp)
 428:	8b 45 08             	mov    0x8(%ebp),%eax
 42b:	89 04 24             	mov    %eax,(%esp)
 42e:	e8 31 ff ff ff       	call   364 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 433:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 437:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 43b:	79 d9                	jns    416 <printint+0x8a>
    putc(fd, buf[i]);
}
 43d:	83 c4 30             	add    $0x30,%esp
 440:	5b                   	pop    %ebx
 441:	5e                   	pop    %esi
 442:	5d                   	pop    %ebp
 443:	c3                   	ret    

00000444 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 44a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 451:	8d 45 0c             	lea    0xc(%ebp),%eax
 454:	83 c0 04             	add    $0x4,%eax
 457:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 45a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 461:	e9 7c 01 00 00       	jmp    5e2 <printf+0x19e>
    c = fmt[i] & 0xff;
 466:	8b 55 0c             	mov    0xc(%ebp),%edx
 469:	8b 45 f0             	mov    -0x10(%ebp),%eax
 46c:	01 d0                	add    %edx,%eax
 46e:	0f b6 00             	movzbl (%eax),%eax
 471:	0f be c0             	movsbl %al,%eax
 474:	25 ff 00 00 00       	and    $0xff,%eax
 479:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 47c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 480:	75 2c                	jne    4ae <printf+0x6a>
      if(c == '%'){
 482:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 486:	75 0c                	jne    494 <printf+0x50>
        state = '%';
 488:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 48f:	e9 4a 01 00 00       	jmp    5de <printf+0x19a>
      } else {
        putc(fd, c);
 494:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 497:	0f be c0             	movsbl %al,%eax
 49a:	89 44 24 04          	mov    %eax,0x4(%esp)
 49e:	8b 45 08             	mov    0x8(%ebp),%eax
 4a1:	89 04 24             	mov    %eax,(%esp)
 4a4:	e8 bb fe ff ff       	call   364 <putc>
 4a9:	e9 30 01 00 00       	jmp    5de <printf+0x19a>
      }
    } else if(state == '%'){
 4ae:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4b2:	0f 85 26 01 00 00    	jne    5de <printf+0x19a>
      if(c == 'd'){
 4b8:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4bc:	75 2d                	jne    4eb <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4be:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4c1:	8b 00                	mov    (%eax),%eax
 4c3:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4ca:	00 
 4cb:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4d2:	00 
 4d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d7:	8b 45 08             	mov    0x8(%ebp),%eax
 4da:	89 04 24             	mov    %eax,(%esp)
 4dd:	e8 aa fe ff ff       	call   38c <printint>
        ap++;
 4e2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4e6:	e9 ec 00 00 00       	jmp    5d7 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4eb:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4ef:	74 06                	je     4f7 <printf+0xb3>
 4f1:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4f5:	75 2d                	jne    524 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4fa:	8b 00                	mov    (%eax),%eax
 4fc:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 503:	00 
 504:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 50b:	00 
 50c:	89 44 24 04          	mov    %eax,0x4(%esp)
 510:	8b 45 08             	mov    0x8(%ebp),%eax
 513:	89 04 24             	mov    %eax,(%esp)
 516:	e8 71 fe ff ff       	call   38c <printint>
        ap++;
 51b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 51f:	e9 b3 00 00 00       	jmp    5d7 <printf+0x193>
      } else if(c == 's'){
 524:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 528:	75 45                	jne    56f <printf+0x12b>
        s = (char*)*ap;
 52a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 52d:	8b 00                	mov    (%eax),%eax
 52f:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 532:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 536:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 53a:	75 09                	jne    545 <printf+0x101>
          s = "(null)";
 53c:	c7 45 f4 be 0b 00 00 	movl   $0xbbe,-0xc(%ebp)
        while(*s != 0){
 543:	eb 1e                	jmp    563 <printf+0x11f>
 545:	eb 1c                	jmp    563 <printf+0x11f>
          putc(fd, *s);
 547:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54a:	0f b6 00             	movzbl (%eax),%eax
 54d:	0f be c0             	movsbl %al,%eax
 550:	89 44 24 04          	mov    %eax,0x4(%esp)
 554:	8b 45 08             	mov    0x8(%ebp),%eax
 557:	89 04 24             	mov    %eax,(%esp)
 55a:	e8 05 fe ff ff       	call   364 <putc>
          s++;
 55f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 563:	8b 45 f4             	mov    -0xc(%ebp),%eax
 566:	0f b6 00             	movzbl (%eax),%eax
 569:	84 c0                	test   %al,%al
 56b:	75 da                	jne    547 <printf+0x103>
 56d:	eb 68                	jmp    5d7 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 56f:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 573:	75 1d                	jne    592 <printf+0x14e>
        putc(fd, *ap);
 575:	8b 45 e8             	mov    -0x18(%ebp),%eax
 578:	8b 00                	mov    (%eax),%eax
 57a:	0f be c0             	movsbl %al,%eax
 57d:	89 44 24 04          	mov    %eax,0x4(%esp)
 581:	8b 45 08             	mov    0x8(%ebp),%eax
 584:	89 04 24             	mov    %eax,(%esp)
 587:	e8 d8 fd ff ff       	call   364 <putc>
        ap++;
 58c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 590:	eb 45                	jmp    5d7 <printf+0x193>
      } else if(c == '%'){
 592:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 596:	75 17                	jne    5af <printf+0x16b>
        putc(fd, c);
 598:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 59b:	0f be c0             	movsbl %al,%eax
 59e:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a2:	8b 45 08             	mov    0x8(%ebp),%eax
 5a5:	89 04 24             	mov    %eax,(%esp)
 5a8:	e8 b7 fd ff ff       	call   364 <putc>
 5ad:	eb 28                	jmp    5d7 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5af:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5b6:	00 
 5b7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ba:	89 04 24             	mov    %eax,(%esp)
 5bd:	e8 a2 fd ff ff       	call   364 <putc>
        putc(fd, c);
 5c2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c5:	0f be c0             	movsbl %al,%eax
 5c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5cc:	8b 45 08             	mov    0x8(%ebp),%eax
 5cf:	89 04 24             	mov    %eax,(%esp)
 5d2:	e8 8d fd ff ff       	call   364 <putc>
      }
      state = 0;
 5d7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5de:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5e2:	8b 55 0c             	mov    0xc(%ebp),%edx
 5e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5e8:	01 d0                	add    %edx,%eax
 5ea:	0f b6 00             	movzbl (%eax),%eax
 5ed:	84 c0                	test   %al,%al
 5ef:	0f 85 71 fe ff ff    	jne    466 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5f5:	c9                   	leave  
 5f6:	c3                   	ret    

000005f7 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f7:	55                   	push   %ebp
 5f8:	89 e5                	mov    %esp,%ebp
 5fa:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5fd:	8b 45 08             	mov    0x8(%ebp),%eax
 600:	83 e8 08             	sub    $0x8,%eax
 603:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 606:	a1 18 10 00 00       	mov    0x1018,%eax
 60b:	89 45 fc             	mov    %eax,-0x4(%ebp)
 60e:	eb 24                	jmp    634 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 610:	8b 45 fc             	mov    -0x4(%ebp),%eax
 613:	8b 00                	mov    (%eax),%eax
 615:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 618:	77 12                	ja     62c <free+0x35>
 61a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 61d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 620:	77 24                	ja     646 <free+0x4f>
 622:	8b 45 fc             	mov    -0x4(%ebp),%eax
 625:	8b 00                	mov    (%eax),%eax
 627:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 62a:	77 1a                	ja     646 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62f:	8b 00                	mov    (%eax),%eax
 631:	89 45 fc             	mov    %eax,-0x4(%ebp)
 634:	8b 45 f8             	mov    -0x8(%ebp),%eax
 637:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 63a:	76 d4                	jbe    610 <free+0x19>
 63c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63f:	8b 00                	mov    (%eax),%eax
 641:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 644:	76 ca                	jbe    610 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 646:	8b 45 f8             	mov    -0x8(%ebp),%eax
 649:	8b 40 04             	mov    0x4(%eax),%eax
 64c:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 653:	8b 45 f8             	mov    -0x8(%ebp),%eax
 656:	01 c2                	add    %eax,%edx
 658:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65b:	8b 00                	mov    (%eax),%eax
 65d:	39 c2                	cmp    %eax,%edx
 65f:	75 24                	jne    685 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 661:	8b 45 f8             	mov    -0x8(%ebp),%eax
 664:	8b 50 04             	mov    0x4(%eax),%edx
 667:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66a:	8b 00                	mov    (%eax),%eax
 66c:	8b 40 04             	mov    0x4(%eax),%eax
 66f:	01 c2                	add    %eax,%edx
 671:	8b 45 f8             	mov    -0x8(%ebp),%eax
 674:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 677:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67a:	8b 00                	mov    (%eax),%eax
 67c:	8b 10                	mov    (%eax),%edx
 67e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 681:	89 10                	mov    %edx,(%eax)
 683:	eb 0a                	jmp    68f <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 685:	8b 45 fc             	mov    -0x4(%ebp),%eax
 688:	8b 10                	mov    (%eax),%edx
 68a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68d:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 68f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 692:	8b 40 04             	mov    0x4(%eax),%eax
 695:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 69c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69f:	01 d0                	add    %edx,%eax
 6a1:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6a4:	75 20                	jne    6c6 <free+0xcf>
    p->s.size += bp->s.size;
 6a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a9:	8b 50 04             	mov    0x4(%eax),%edx
 6ac:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6af:	8b 40 04             	mov    0x4(%eax),%eax
 6b2:	01 c2                	add    %eax,%edx
 6b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b7:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6bd:	8b 10                	mov    (%eax),%edx
 6bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c2:	89 10                	mov    %edx,(%eax)
 6c4:	eb 08                	jmp    6ce <free+0xd7>
  } else
    p->s.ptr = bp;
 6c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6cc:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d1:	a3 18 10 00 00       	mov    %eax,0x1018
}
 6d6:	c9                   	leave  
 6d7:	c3                   	ret    

000006d8 <morecore>:

static Header*
morecore(uint nu)
{
 6d8:	55                   	push   %ebp
 6d9:	89 e5                	mov    %esp,%ebp
 6db:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6de:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6e5:	77 07                	ja     6ee <morecore+0x16>
    nu = 4096;
 6e7:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6ee:	8b 45 08             	mov    0x8(%ebp),%eax
 6f1:	c1 e0 03             	shl    $0x3,%eax
 6f4:	89 04 24             	mov    %eax,(%esp)
 6f7:	e8 28 fc ff ff       	call   324 <sbrk>
 6fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6ff:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 703:	75 07                	jne    70c <morecore+0x34>
    return 0;
 705:	b8 00 00 00 00       	mov    $0x0,%eax
 70a:	eb 22                	jmp    72e <morecore+0x56>
  hp = (Header*)p;
 70c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 712:	8b 45 f0             	mov    -0x10(%ebp),%eax
 715:	8b 55 08             	mov    0x8(%ebp),%edx
 718:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 71b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71e:	83 c0 08             	add    $0x8,%eax
 721:	89 04 24             	mov    %eax,(%esp)
 724:	e8 ce fe ff ff       	call   5f7 <free>
  return freep;
 729:	a1 18 10 00 00       	mov    0x1018,%eax
}
 72e:	c9                   	leave  
 72f:	c3                   	ret    

00000730 <malloc>:

void*
malloc(uint nbytes)
{
 730:	55                   	push   %ebp
 731:	89 e5                	mov    %esp,%ebp
 733:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 736:	8b 45 08             	mov    0x8(%ebp),%eax
 739:	83 c0 07             	add    $0x7,%eax
 73c:	c1 e8 03             	shr    $0x3,%eax
 73f:	83 c0 01             	add    $0x1,%eax
 742:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 745:	a1 18 10 00 00       	mov    0x1018,%eax
 74a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 74d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 751:	75 23                	jne    776 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 753:	c7 45 f0 10 10 00 00 	movl   $0x1010,-0x10(%ebp)
 75a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75d:	a3 18 10 00 00       	mov    %eax,0x1018
 762:	a1 18 10 00 00       	mov    0x1018,%eax
 767:	a3 10 10 00 00       	mov    %eax,0x1010
    base.s.size = 0;
 76c:	c7 05 14 10 00 00 00 	movl   $0x0,0x1014
 773:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 776:	8b 45 f0             	mov    -0x10(%ebp),%eax
 779:	8b 00                	mov    (%eax),%eax
 77b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 77e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 781:	8b 40 04             	mov    0x4(%eax),%eax
 784:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 787:	72 4d                	jb     7d6 <malloc+0xa6>
      if(p->s.size == nunits)
 789:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78c:	8b 40 04             	mov    0x4(%eax),%eax
 78f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 792:	75 0c                	jne    7a0 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 794:	8b 45 f4             	mov    -0xc(%ebp),%eax
 797:	8b 10                	mov    (%eax),%edx
 799:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79c:	89 10                	mov    %edx,(%eax)
 79e:	eb 26                	jmp    7c6 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a3:	8b 40 04             	mov    0x4(%eax),%eax
 7a6:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7a9:	89 c2                	mov    %eax,%edx
 7ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ae:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b4:	8b 40 04             	mov    0x4(%eax),%eax
 7b7:	c1 e0 03             	shl    $0x3,%eax
 7ba:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c0:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7c3:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c9:	a3 18 10 00 00       	mov    %eax,0x1018
      return (void*)(p + 1);
 7ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d1:	83 c0 08             	add    $0x8,%eax
 7d4:	eb 38                	jmp    80e <malloc+0xde>
    }
    if(p == freep)
 7d6:	a1 18 10 00 00       	mov    0x1018,%eax
 7db:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7de:	75 1b                	jne    7fb <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7e3:	89 04 24             	mov    %eax,(%esp)
 7e6:	e8 ed fe ff ff       	call   6d8 <morecore>
 7eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7ee:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7f2:	75 07                	jne    7fb <malloc+0xcb>
        return 0;
 7f4:	b8 00 00 00 00       	mov    $0x0,%eax
 7f9:	eb 13                	jmp    80e <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
 801:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804:	8b 00                	mov    (%eax),%eax
 806:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 809:	e9 70 ff ff ff       	jmp    77e <malloc+0x4e>
}
 80e:	c9                   	leave  
 80f:	c3                   	ret    

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
 83e:	90                   	nop
 83f:	8b 45 08             	mov    0x8(%ebp),%eax
 842:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 849:	00 
 84a:	89 04 24             	mov    %eax,(%esp)
 84d:	e8 be ff ff ff       	call   810 <xchg>
 852:	85 c0                	test   %eax,%eax
 854:	75 e9                	jne    83f <lock_acquire+0x7>
}
 856:	c9                   	leave  
 857:	c3                   	ret    

00000858 <lock_release>:
void lock_release(lock_t *lock){
 858:	55                   	push   %ebp
 859:	89 e5                	mov    %esp,%ebp
 85b:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 85e:	8b 45 08             	mov    0x8(%ebp),%eax
 861:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 868:	00 
 869:	89 04 24             	mov    %eax,(%esp)
 86c:	e8 9f ff ff ff       	call   810 <xchg>
}
 871:	c9                   	leave  
 872:	c3                   	ret    

00000873 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 873:	55                   	push   %ebp
 874:	89 e5                	mov    %esp,%ebp
 876:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 879:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 880:	e8 ab fe ff ff       	call   730 <malloc>
 885:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 888:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88b:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 88e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 891:	25 ff 0f 00 00       	and    $0xfff,%eax
 896:	85 c0                	test   %eax,%eax
 898:	74 14                	je     8ae <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 89a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89d:	25 ff 0f 00 00       	and    $0xfff,%eax
 8a2:	89 c2                	mov    %eax,%edx
 8a4:	b8 00 10 00 00       	mov    $0x1000,%eax
 8a9:	29 d0                	sub    %edx,%eax
 8ab:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 8ae:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8b2:	75 1b                	jne    8cf <thread_create+0x5c>

        printf(1,"malloc fail \n");
 8b4:	c7 44 24 04 c5 0b 00 	movl   $0xbc5,0x4(%esp)
 8bb:	00 
 8bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8c3:	e8 7c fb ff ff       	call   444 <printf>
        return 0;
 8c8:	b8 00 00 00 00       	mov    $0x0,%eax
 8cd:	eb 6f                	jmp    93e <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 8cf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8d2:	8b 55 08             	mov    0x8(%ebp),%edx
 8d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8dc:	89 54 24 08          	mov    %edx,0x8(%esp)
 8e0:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 8e7:	00 
 8e8:	89 04 24             	mov    %eax,(%esp)
 8eb:	e8 4c fa ff ff       	call   33c <clone>
 8f0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 8f3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8f7:	79 1b                	jns    914 <thread_create+0xa1>
        printf(1,"clone fails\n");
 8f9:	c7 44 24 04 d3 0b 00 	movl   $0xbd3,0x4(%esp)
 900:	00 
 901:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 908:	e8 37 fb ff ff       	call   444 <printf>
        return 0;
 90d:	b8 00 00 00 00       	mov    $0x0,%eax
 912:	eb 2a                	jmp    93e <thread_create+0xcb>
    }
    if(tid > 0){
 914:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 918:	7e 05                	jle    91f <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 91a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91d:	eb 1f                	jmp    93e <thread_create+0xcb>
    }
    if(tid == 0){
 91f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 923:	75 14                	jne    939 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 925:	c7 44 24 04 e0 0b 00 	movl   $0xbe0,0x4(%esp)
 92c:	00 
 92d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 934:	e8 0b fb ff ff       	call   444 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 939:	b8 00 00 00 00       	mov    $0x0,%eax
}
 93e:	c9                   	leave  
 93f:	c3                   	ret    

00000940 <random>:

unsigned long rands = 1;
// generate 0 -> max random number exclude max.
int random(int max){
 940:	55                   	push   %ebp
 941:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
 943:	a1 0c 10 00 00       	mov    0x100c,%eax
 948:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
 94e:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
 953:	a3 0c 10 00 00       	mov    %eax,0x100c
    return (int)(rands % max);
 958:	a1 0c 10 00 00       	mov    0x100c,%eax
 95d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 960:	ba 00 00 00 00       	mov    $0x0,%edx
 965:	f7 f1                	div    %ecx
 967:	89 d0                	mov    %edx,%eax
 969:	5d                   	pop    %ebp
 96a:	c3                   	ret    

0000096b <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 96b:	55                   	push   %ebp
 96c:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 96e:	8b 45 08             	mov    0x8(%ebp),%eax
 971:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 977:	8b 45 08             	mov    0x8(%ebp),%eax
 97a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 981:	8b 45 08             	mov    0x8(%ebp),%eax
 984:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 98b:	5d                   	pop    %ebp
 98c:	c3                   	ret    

0000098d <add_q>:

void add_q(struct queue *q, int v){
 98d:	55                   	push   %ebp
 98e:	89 e5                	mov    %esp,%ebp
 990:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 993:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 99a:	e8 91 fd ff ff       	call   730 <malloc>
 99f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 9a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 9ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9af:	8b 55 0c             	mov    0xc(%ebp),%edx
 9b2:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 9b4:	8b 45 08             	mov    0x8(%ebp),%eax
 9b7:	8b 40 04             	mov    0x4(%eax),%eax
 9ba:	85 c0                	test   %eax,%eax
 9bc:	75 0b                	jne    9c9 <add_q+0x3c>
        q->head = n;
 9be:	8b 45 08             	mov    0x8(%ebp),%eax
 9c1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9c4:	89 50 04             	mov    %edx,0x4(%eax)
 9c7:	eb 0c                	jmp    9d5 <add_q+0x48>
    }else{
        q->tail->next = n;
 9c9:	8b 45 08             	mov    0x8(%ebp),%eax
 9cc:	8b 40 08             	mov    0x8(%eax),%eax
 9cf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9d2:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 9d5:	8b 45 08             	mov    0x8(%ebp),%eax
 9d8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9db:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 9de:	8b 45 08             	mov    0x8(%ebp),%eax
 9e1:	8b 00                	mov    (%eax),%eax
 9e3:	8d 50 01             	lea    0x1(%eax),%edx
 9e6:	8b 45 08             	mov    0x8(%ebp),%eax
 9e9:	89 10                	mov    %edx,(%eax)
}
 9eb:	c9                   	leave  
 9ec:	c3                   	ret    

000009ed <empty_q>:

int empty_q(struct queue *q){
 9ed:	55                   	push   %ebp
 9ee:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 9f0:	8b 45 08             	mov    0x8(%ebp),%eax
 9f3:	8b 00                	mov    (%eax),%eax
 9f5:	85 c0                	test   %eax,%eax
 9f7:	75 07                	jne    a00 <empty_q+0x13>
        return 1;
 9f9:	b8 01 00 00 00       	mov    $0x1,%eax
 9fe:	eb 05                	jmp    a05 <empty_q+0x18>
    else
        return 0;
 a00:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 a05:	5d                   	pop    %ebp
 a06:	c3                   	ret    

00000a07 <pop_q>:
int pop_q(struct queue *q){
 a07:	55                   	push   %ebp
 a08:	89 e5                	mov    %esp,%ebp
 a0a:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a0d:	8b 45 08             	mov    0x8(%ebp),%eax
 a10:	89 04 24             	mov    %eax,(%esp)
 a13:	e8 d5 ff ff ff       	call   9ed <empty_q>
 a18:	85 c0                	test   %eax,%eax
 a1a:	75 5d                	jne    a79 <pop_q+0x72>
       val = q->head->value; 
 a1c:	8b 45 08             	mov    0x8(%ebp),%eax
 a1f:	8b 40 04             	mov    0x4(%eax),%eax
 a22:	8b 00                	mov    (%eax),%eax
 a24:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 a27:	8b 45 08             	mov    0x8(%ebp),%eax
 a2a:	8b 40 04             	mov    0x4(%eax),%eax
 a2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 a30:	8b 45 08             	mov    0x8(%ebp),%eax
 a33:	8b 40 04             	mov    0x4(%eax),%eax
 a36:	8b 50 04             	mov    0x4(%eax),%edx
 a39:	8b 45 08             	mov    0x8(%ebp),%eax
 a3c:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a42:	89 04 24             	mov    %eax,(%esp)
 a45:	e8 ad fb ff ff       	call   5f7 <free>
       q->size--;
 a4a:	8b 45 08             	mov    0x8(%ebp),%eax
 a4d:	8b 00                	mov    (%eax),%eax
 a4f:	8d 50 ff             	lea    -0x1(%eax),%edx
 a52:	8b 45 08             	mov    0x8(%ebp),%eax
 a55:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a57:	8b 45 08             	mov    0x8(%ebp),%eax
 a5a:	8b 00                	mov    (%eax),%eax
 a5c:	85 c0                	test   %eax,%eax
 a5e:	75 14                	jne    a74 <pop_q+0x6d>
            q->head = 0;
 a60:	8b 45 08             	mov    0x8(%ebp),%eax
 a63:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a6a:	8b 45 08             	mov    0x8(%ebp),%eax
 a6d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a74:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a77:	eb 05                	jmp    a7e <pop_q+0x77>
    }
    return -1;
 a79:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a7e:	c9                   	leave  
 a7f:	c3                   	ret    

00000a80 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 a80:	55                   	push   %ebp
 a81:	89 e5                	mov    %esp,%ebp
 a83:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 a86:	8b 45 08             	mov    0x8(%ebp),%eax
 a89:	8b 55 0c             	mov    0xc(%ebp),%edx
 a8c:	89 50 08             	mov    %edx,0x8(%eax)
	s->count = size;
 a8f:	8b 45 08             	mov    0x8(%ebp),%eax
 a92:	8b 55 0c             	mov    0xc(%ebp),%edx
 a95:	89 50 04             	mov    %edx,0x4(%eax)
	lock_init(&s->lock);
 a98:	8b 45 08             	mov    0x8(%ebp),%eax
 a9b:	89 04 24             	mov    %eax,(%esp)
 a9e:	e8 87 fd ff ff       	call   82a <lock_init>
}
 aa3:	c9                   	leave  
 aa4:	c3                   	ret    

00000aa5 <sem_init_full>:

void 
sem_init_full(struct semaphore *s, int size){
 aa5:	55                   	push   %ebp
 aa6:	89 e5                	mov    %esp,%ebp
 aa8:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 aab:	8b 45 08             	mov    0x8(%ebp),%eax
 aae:	8b 55 0c             	mov    0xc(%ebp),%edx
 ab1:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 ab4:	8b 45 08             	mov    0x8(%ebp),%eax
 ab7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock);
 abe:	8b 45 08             	mov    0x8(%ebp),%eax
 ac1:	89 04 24             	mov    %eax,(%esp)
 ac4:	e8 61 fd ff ff       	call   82a <lock_init>
}
 ac9:	c9                   	leave  
 aca:	c3                   	ret    

00000acb <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 acb:	55                   	push   %ebp
 acc:	89 e5                	mov    %esp,%ebp
 ace:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 ad1:	8b 45 08             	mov    0x8(%ebp),%eax
 ad4:	89 04 24             	mov    %eax,(%esp)
 ad7:	e8 5c fd ff ff       	call   838 <lock_acquire>
	if(s->count  == 0){
 adc:	8b 45 08             	mov    0x8(%ebp),%eax
 adf:	8b 40 04             	mov    0x4(%eax),%eax
 ae2:	85 c0                	test   %eax,%eax
 ae4:	75 2f                	jne    b15 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 ae6:	e8 31 f8 ff ff       	call   31c <getpid>
 aeb:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 aee:	8b 45 08             	mov    0x8(%ebp),%eax
 af1:	8d 50 0c             	lea    0xc(%eax),%edx
 af4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af7:	89 44 24 04          	mov    %eax,0x4(%esp)
 afb:	89 14 24             	mov    %edx,(%esp)
 afe:	e8 8a fe ff ff       	call   98d <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 b03:	8b 45 08             	mov    0x8(%ebp),%eax
 b06:	89 04 24             	mov    %eax,(%esp)
 b09:	e8 4a fd ff ff       	call   858 <lock_release>
		tsleep(); 
 b0e:	e8 39 f8 ff ff       	call   34c <tsleep>
 b13:	eb 1a                	jmp    b2f <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 b15:	8b 45 08             	mov    0x8(%ebp),%eax
 b18:	8b 40 04             	mov    0x4(%eax),%eax
 b1b:	8d 50 ff             	lea    -0x1(%eax),%edx
 b1e:	8b 45 08             	mov    0x8(%ebp),%eax
 b21:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b24:	8b 45 08             	mov    0x8(%ebp),%eax
 b27:	89 04 24             	mov    %eax,(%esp)
 b2a:	e8 29 fd ff ff       	call   858 <lock_release>
	}
}
 b2f:	c9                   	leave  
 b30:	c3                   	ret    

00000b31 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b31:	55                   	push   %ebp
 b32:	89 e5                	mov    %esp,%ebp
 b34:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b37:	8b 45 08             	mov    0x8(%ebp),%eax
 b3a:	89 04 24             	mov    %eax,(%esp)
 b3d:	e8 f6 fc ff ff       	call   838 <lock_acquire>
	if(s->count < s->size){
 b42:	8b 45 08             	mov    0x8(%ebp),%eax
 b45:	8b 50 04             	mov    0x4(%eax),%edx
 b48:	8b 45 08             	mov    0x8(%ebp),%eax
 b4b:	8b 40 08             	mov    0x8(%eax),%eax
 b4e:	39 c2                	cmp    %eax,%edx
 b50:	7d 0f                	jge    b61 <sem_signal+0x30>
		s->count++;	
 b52:	8b 45 08             	mov    0x8(%ebp),%eax
 b55:	8b 40 04             	mov    0x4(%eax),%eax
 b58:	8d 50 01             	lea    0x1(%eax),%edx
 b5b:	8b 45 08             	mov    0x8(%ebp),%eax
 b5e:	89 50 04             	mov    %edx,0x4(%eax)
	}

	int tid;
	tid = pop_q(&s->waiters);
 b61:	8b 45 08             	mov    0x8(%ebp),%eax
 b64:	83 c0 0c             	add    $0xc,%eax
 b67:	89 04 24             	mov    %eax,(%esp)
 b6a:	e8 98 fe ff ff       	call   a07 <pop_q>
 b6f:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 b72:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b76:	74 2e                	je     ba6 <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 b78:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b7b:	89 04 24             	mov    %eax,(%esp)
 b7e:	e8 d1 f7 ff ff       	call   354 <twakeup>
		s->count--;
 b83:	8b 45 08             	mov    0x8(%ebp),%eax
 b86:	8b 40 04             	mov    0x4(%eax),%eax
 b89:	8d 50 ff             	lea    -0x1(%eax),%edx
 b8c:	8b 45 08             	mov    0x8(%ebp),%eax
 b8f:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 b92:	8b 45 08             	mov    0x8(%ebp),%eax
 b95:	8b 40 04             	mov    0x4(%eax),%eax
 b98:	85 c0                	test   %eax,%eax
 b9a:	79 0a                	jns    ba6 <sem_signal+0x75>
 b9c:	8b 45 08             	mov    0x8(%ebp),%eax
 b9f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 ba6:	8b 45 08             	mov    0x8(%ebp),%eax
 ba9:	89 04 24             	mov    %eax,(%esp)
 bac:	e8 a7 fc ff ff       	call   858 <lock_release>

 bb1:	c9                   	leave  
 bb2:	c3                   	ret    
