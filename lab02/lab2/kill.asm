
_kill:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(int argc, char **argv)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 1){
   9:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "usage: kill pid...\n");
   f:	c7 44 24 04 e6 0b 00 	movl   $0xbe6,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 54 04 00 00       	call   477 <printf>
    exit();
  23:	e8 a7 02 00 00       	call   2cf <exit>
  }
  for(i=1; i<argc; i++)
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 27                	jmp    59 <main+0x59>
    kill(atoi(argv[i]));
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 f1 01 00 00       	call   23d <atoi>
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 ab 02 00 00       	call   2ff <kill>

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  54:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  59:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5d:	3b 45 08             	cmp    0x8(%ebp),%eax
  60:	7c d0                	jl     32 <main+0x32>
    kill(atoi(argv[i]));
  exit();
  62:	e8 68 02 00 00       	call   2cf <exit>

00000067 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  67:	55                   	push   %ebp
  68:	89 e5                	mov    %esp,%ebp
  6a:	57                   	push   %edi
  6b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  6c:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6f:	8b 55 10             	mov    0x10(%ebp),%edx
  72:	8b 45 0c             	mov    0xc(%ebp),%eax
  75:	89 cb                	mov    %ecx,%ebx
  77:	89 df                	mov    %ebx,%edi
  79:	89 d1                	mov    %edx,%ecx
  7b:	fc                   	cld    
  7c:	f3 aa                	rep stos %al,%es:(%edi)
  7e:	89 ca                	mov    %ecx,%edx
  80:	89 fb                	mov    %edi,%ebx
  82:	89 5d 08             	mov    %ebx,0x8(%ebp)
  85:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  88:	5b                   	pop    %ebx
  89:	5f                   	pop    %edi
  8a:	5d                   	pop    %ebp
  8b:	c3                   	ret    

0000008c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  92:	8b 45 08             	mov    0x8(%ebp),%eax
  95:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  98:	90                   	nop
  99:	8b 45 08             	mov    0x8(%ebp),%eax
  9c:	8d 50 01             	lea    0x1(%eax),%edx
  9f:	89 55 08             	mov    %edx,0x8(%ebp)
  a2:	8b 55 0c             	mov    0xc(%ebp),%edx
  a5:	8d 4a 01             	lea    0x1(%edx),%ecx
  a8:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  ab:	0f b6 12             	movzbl (%edx),%edx
  ae:	88 10                	mov    %dl,(%eax)
  b0:	0f b6 00             	movzbl (%eax),%eax
  b3:	84 c0                	test   %al,%al
  b5:	75 e2                	jne    99 <strcpy+0xd>
    ;
  return os;
  b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  ba:	c9                   	leave  
  bb:	c3                   	ret    

000000bc <strcmp>:

int
strcmp(const char *p, const char *q)
{
  bc:	55                   	push   %ebp
  bd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  bf:	eb 08                	jmp    c9 <strcmp+0xd>
    p++, q++;
  c1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  c9:	8b 45 08             	mov    0x8(%ebp),%eax
  cc:	0f b6 00             	movzbl (%eax),%eax
  cf:	84 c0                	test   %al,%al
  d1:	74 10                	je     e3 <strcmp+0x27>
  d3:	8b 45 08             	mov    0x8(%ebp),%eax
  d6:	0f b6 10             	movzbl (%eax),%edx
  d9:	8b 45 0c             	mov    0xc(%ebp),%eax
  dc:	0f b6 00             	movzbl (%eax),%eax
  df:	38 c2                	cmp    %al,%dl
  e1:	74 de                	je     c1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e3:	8b 45 08             	mov    0x8(%ebp),%eax
  e6:	0f b6 00             	movzbl (%eax),%eax
  e9:	0f b6 d0             	movzbl %al,%edx
  ec:	8b 45 0c             	mov    0xc(%ebp),%eax
  ef:	0f b6 00             	movzbl (%eax),%eax
  f2:	0f b6 c0             	movzbl %al,%eax
  f5:	29 c2                	sub    %eax,%edx
  f7:	89 d0                	mov    %edx,%eax
}
  f9:	5d                   	pop    %ebp
  fa:	c3                   	ret    

000000fb <strlen>:

uint
strlen(char *s)
{
  fb:	55                   	push   %ebp
  fc:	89 e5                	mov    %esp,%ebp
  fe:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 101:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 108:	eb 04                	jmp    10e <strlen+0x13>
 10a:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 10e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	01 d0                	add    %edx,%eax
 116:	0f b6 00             	movzbl (%eax),%eax
 119:	84 c0                	test   %al,%al
 11b:	75 ed                	jne    10a <strlen+0xf>
    ;
  return n;
 11d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 120:	c9                   	leave  
 121:	c3                   	ret    

00000122 <memset>:

void*
memset(void *dst, int c, uint n)
{
 122:	55                   	push   %ebp
 123:	89 e5                	mov    %esp,%ebp
 125:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 128:	8b 45 10             	mov    0x10(%ebp),%eax
 12b:	89 44 24 08          	mov    %eax,0x8(%esp)
 12f:	8b 45 0c             	mov    0xc(%ebp),%eax
 132:	89 44 24 04          	mov    %eax,0x4(%esp)
 136:	8b 45 08             	mov    0x8(%ebp),%eax
 139:	89 04 24             	mov    %eax,(%esp)
 13c:	e8 26 ff ff ff       	call   67 <stosb>
  return dst;
 141:	8b 45 08             	mov    0x8(%ebp),%eax
}
 144:	c9                   	leave  
 145:	c3                   	ret    

00000146 <strchr>:

char*
strchr(const char *s, char c)
{
 146:	55                   	push   %ebp
 147:	89 e5                	mov    %esp,%ebp
 149:	83 ec 04             	sub    $0x4,%esp
 14c:	8b 45 0c             	mov    0xc(%ebp),%eax
 14f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 152:	eb 14                	jmp    168 <strchr+0x22>
    if(*s == c)
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	0f b6 00             	movzbl (%eax),%eax
 15a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 15d:	75 05                	jne    164 <strchr+0x1e>
      return (char*)s;
 15f:	8b 45 08             	mov    0x8(%ebp),%eax
 162:	eb 13                	jmp    177 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 164:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	0f b6 00             	movzbl (%eax),%eax
 16e:	84 c0                	test   %al,%al
 170:	75 e2                	jne    154 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 172:	b8 00 00 00 00       	mov    $0x0,%eax
}
 177:	c9                   	leave  
 178:	c3                   	ret    

00000179 <gets>:

char*
gets(char *buf, int max)
{
 179:	55                   	push   %ebp
 17a:	89 e5                	mov    %esp,%ebp
 17c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 17f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 186:	eb 4c                	jmp    1d4 <gets+0x5b>
    cc = read(0, &c, 1);
 188:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 18f:	00 
 190:	8d 45 ef             	lea    -0x11(%ebp),%eax
 193:	89 44 24 04          	mov    %eax,0x4(%esp)
 197:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 19e:	e8 44 01 00 00       	call   2e7 <read>
 1a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1aa:	7f 02                	jg     1ae <gets+0x35>
      break;
 1ac:	eb 31                	jmp    1df <gets+0x66>
    buf[i++] = c;
 1ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b1:	8d 50 01             	lea    0x1(%eax),%edx
 1b4:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1b7:	89 c2                	mov    %eax,%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 c2                	add    %eax,%edx
 1be:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c2:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c8:	3c 0a                	cmp    $0xa,%al
 1ca:	74 13                	je     1df <gets+0x66>
 1cc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d0:	3c 0d                	cmp    $0xd,%al
 1d2:	74 0b                	je     1df <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d7:	83 c0 01             	add    $0x1,%eax
 1da:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1dd:	7c a9                	jl     188 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1df:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	01 d0                	add    %edx,%eax
 1e7:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ed:	c9                   	leave  
 1ee:	c3                   	ret    

000001ef <stat>:

int
stat(char *n, struct stat *st)
{
 1ef:	55                   	push   %ebp
 1f0:	89 e5                	mov    %esp,%ebp
 1f2:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1fc:	00 
 1fd:	8b 45 08             	mov    0x8(%ebp),%eax
 200:	89 04 24             	mov    %eax,(%esp)
 203:	e8 07 01 00 00       	call   30f <open>
 208:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 20b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 20f:	79 07                	jns    218 <stat+0x29>
    return -1;
 211:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 216:	eb 23                	jmp    23b <stat+0x4c>
  r = fstat(fd, st);
 218:	8b 45 0c             	mov    0xc(%ebp),%eax
 21b:	89 44 24 04          	mov    %eax,0x4(%esp)
 21f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 222:	89 04 24             	mov    %eax,(%esp)
 225:	e8 fd 00 00 00       	call   327 <fstat>
 22a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 22d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 230:	89 04 24             	mov    %eax,(%esp)
 233:	e8 bf 00 00 00       	call   2f7 <close>
  return r;
 238:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 23b:	c9                   	leave  
 23c:	c3                   	ret    

0000023d <atoi>:

int
atoi(const char *s)
{
 23d:	55                   	push   %ebp
 23e:	89 e5                	mov    %esp,%ebp
 240:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 243:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24a:	eb 25                	jmp    271 <atoi+0x34>
    n = n*10 + *s++ - '0';
 24c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24f:	89 d0                	mov    %edx,%eax
 251:	c1 e0 02             	shl    $0x2,%eax
 254:	01 d0                	add    %edx,%eax
 256:	01 c0                	add    %eax,%eax
 258:	89 c1                	mov    %eax,%ecx
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 08             	mov    %edx,0x8(%ebp)
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	0f be c0             	movsbl %al,%eax
 269:	01 c8                	add    %ecx,%eax
 26b:	83 e8 30             	sub    $0x30,%eax
 26e:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 271:	8b 45 08             	mov    0x8(%ebp),%eax
 274:	0f b6 00             	movzbl (%eax),%eax
 277:	3c 2f                	cmp    $0x2f,%al
 279:	7e 0a                	jle    285 <atoi+0x48>
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	0f b6 00             	movzbl (%eax),%eax
 281:	3c 39                	cmp    $0x39,%al
 283:	7e c7                	jle    24c <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 285:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 288:	c9                   	leave  
 289:	c3                   	ret    

0000028a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 290:	8b 45 08             	mov    0x8(%ebp),%eax
 293:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 296:	8b 45 0c             	mov    0xc(%ebp),%eax
 299:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 29c:	eb 17                	jmp    2b5 <memmove+0x2b>
    *dst++ = *src++;
 29e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a1:	8d 50 01             	lea    0x1(%eax),%edx
 2a4:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2a7:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2aa:	8d 4a 01             	lea    0x1(%edx),%ecx
 2ad:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b0:	0f b6 12             	movzbl (%edx),%edx
 2b3:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b5:	8b 45 10             	mov    0x10(%ebp),%eax
 2b8:	8d 50 ff             	lea    -0x1(%eax),%edx
 2bb:	89 55 10             	mov    %edx,0x10(%ebp)
 2be:	85 c0                	test   %eax,%eax
 2c0:	7f dc                	jg     29e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2c2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c5:	c9                   	leave  
 2c6:	c3                   	ret    

000002c7 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c7:	b8 01 00 00 00       	mov    $0x1,%eax
 2cc:	cd 40                	int    $0x40
 2ce:	c3                   	ret    

000002cf <exit>:
SYSCALL(exit)
 2cf:	b8 02 00 00 00       	mov    $0x2,%eax
 2d4:	cd 40                	int    $0x40
 2d6:	c3                   	ret    

000002d7 <wait>:
SYSCALL(wait)
 2d7:	b8 03 00 00 00       	mov    $0x3,%eax
 2dc:	cd 40                	int    $0x40
 2de:	c3                   	ret    

000002df <pipe>:
SYSCALL(pipe)
 2df:	b8 04 00 00 00       	mov    $0x4,%eax
 2e4:	cd 40                	int    $0x40
 2e6:	c3                   	ret    

000002e7 <read>:
SYSCALL(read)
 2e7:	b8 05 00 00 00       	mov    $0x5,%eax
 2ec:	cd 40                	int    $0x40
 2ee:	c3                   	ret    

000002ef <write>:
SYSCALL(write)
 2ef:	b8 10 00 00 00       	mov    $0x10,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <close>:
SYSCALL(close)
 2f7:	b8 15 00 00 00       	mov    $0x15,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <kill>:
SYSCALL(kill)
 2ff:	b8 06 00 00 00       	mov    $0x6,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <exec>:
SYSCALL(exec)
 307:	b8 07 00 00 00       	mov    $0x7,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <open>:
SYSCALL(open)
 30f:	b8 0f 00 00 00       	mov    $0xf,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <mknod>:
SYSCALL(mknod)
 317:	b8 11 00 00 00       	mov    $0x11,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <unlink>:
SYSCALL(unlink)
 31f:	b8 12 00 00 00       	mov    $0x12,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <fstat>:
SYSCALL(fstat)
 327:	b8 08 00 00 00       	mov    $0x8,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <link>:
SYSCALL(link)
 32f:	b8 13 00 00 00       	mov    $0x13,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <mkdir>:
SYSCALL(mkdir)
 337:	b8 14 00 00 00       	mov    $0x14,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <chdir>:
SYSCALL(chdir)
 33f:	b8 09 00 00 00       	mov    $0x9,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <dup>:
SYSCALL(dup)
 347:	b8 0a 00 00 00       	mov    $0xa,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <getpid>:
SYSCALL(getpid)
 34f:	b8 0b 00 00 00       	mov    $0xb,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <sbrk>:
SYSCALL(sbrk)
 357:	b8 0c 00 00 00       	mov    $0xc,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <sleep>:
SYSCALL(sleep)
 35f:	b8 0d 00 00 00       	mov    $0xd,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <uptime>:
SYSCALL(uptime)
 367:	b8 0e 00 00 00       	mov    $0xe,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <clone>:
SYSCALL(clone)
 36f:	b8 16 00 00 00       	mov    $0x16,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <texit>:
SYSCALL(texit)
 377:	b8 17 00 00 00       	mov    $0x17,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <tsleep>:
SYSCALL(tsleep)
 37f:	b8 18 00 00 00       	mov    $0x18,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <twakeup>:
SYSCALL(twakeup)
 387:	b8 19 00 00 00       	mov    $0x19,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <test>:
SYSCALL(test)
 38f:	b8 1a 00 00 00       	mov    $0x1a,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 397:	55                   	push   %ebp
 398:	89 e5                	mov    %esp,%ebp
 39a:	83 ec 18             	sub    $0x18,%esp
 39d:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a0:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3a3:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3aa:	00 
 3ab:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 3b2:	8b 45 08             	mov    0x8(%ebp),%eax
 3b5:	89 04 24             	mov    %eax,(%esp)
 3b8:	e8 32 ff ff ff       	call   2ef <write>
}
 3bd:	c9                   	leave  
 3be:	c3                   	ret    

000003bf <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	56                   	push   %esi
 3c3:	53                   	push   %ebx
 3c4:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3ce:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3d2:	74 17                	je     3eb <printint+0x2c>
 3d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3d8:	79 11                	jns    3eb <printint+0x2c>
    neg = 1;
 3da:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e4:	f7 d8                	neg    %eax
 3e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3e9:	eb 06                	jmp    3f1 <printint+0x32>
  } else {
    x = xx;
 3eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3f8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3fb:	8d 41 01             	lea    0x1(%ecx),%eax
 3fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
 401:	8b 5d 10             	mov    0x10(%ebp),%ebx
 404:	8b 45 ec             	mov    -0x14(%ebp),%eax
 407:	ba 00 00 00 00       	mov    $0x0,%edx
 40c:	f7 f3                	div    %ebx
 40e:	89 d0                	mov    %edx,%eax
 410:	0f b6 80 34 10 00 00 	movzbl 0x1034(%eax),%eax
 417:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 41b:	8b 75 10             	mov    0x10(%ebp),%esi
 41e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 421:	ba 00 00 00 00       	mov    $0x0,%edx
 426:	f7 f6                	div    %esi
 428:	89 45 ec             	mov    %eax,-0x14(%ebp)
 42b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 42f:	75 c7                	jne    3f8 <printint+0x39>
  if(neg)
 431:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 435:	74 10                	je     447 <printint+0x88>
    buf[i++] = '-';
 437:	8b 45 f4             	mov    -0xc(%ebp),%eax
 43a:	8d 50 01             	lea    0x1(%eax),%edx
 43d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 440:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 445:	eb 1f                	jmp    466 <printint+0xa7>
 447:	eb 1d                	jmp    466 <printint+0xa7>
    putc(fd, buf[i]);
 449:	8d 55 dc             	lea    -0x24(%ebp),%edx
 44c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 44f:	01 d0                	add    %edx,%eax
 451:	0f b6 00             	movzbl (%eax),%eax
 454:	0f be c0             	movsbl %al,%eax
 457:	89 44 24 04          	mov    %eax,0x4(%esp)
 45b:	8b 45 08             	mov    0x8(%ebp),%eax
 45e:	89 04 24             	mov    %eax,(%esp)
 461:	e8 31 ff ff ff       	call   397 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 466:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 46a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 46e:	79 d9                	jns    449 <printint+0x8a>
    putc(fd, buf[i]);
}
 470:	83 c4 30             	add    $0x30,%esp
 473:	5b                   	pop    %ebx
 474:	5e                   	pop    %esi
 475:	5d                   	pop    %ebp
 476:	c3                   	ret    

00000477 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 477:	55                   	push   %ebp
 478:	89 e5                	mov    %esp,%ebp
 47a:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 47d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 484:	8d 45 0c             	lea    0xc(%ebp),%eax
 487:	83 c0 04             	add    $0x4,%eax
 48a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 48d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 494:	e9 7c 01 00 00       	jmp    615 <printf+0x19e>
    c = fmt[i] & 0xff;
 499:	8b 55 0c             	mov    0xc(%ebp),%edx
 49c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 49f:	01 d0                	add    %edx,%eax
 4a1:	0f b6 00             	movzbl (%eax),%eax
 4a4:	0f be c0             	movsbl %al,%eax
 4a7:	25 ff 00 00 00       	and    $0xff,%eax
 4ac:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4af:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4b3:	75 2c                	jne    4e1 <printf+0x6a>
      if(c == '%'){
 4b5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4b9:	75 0c                	jne    4c7 <printf+0x50>
        state = '%';
 4bb:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4c2:	e9 4a 01 00 00       	jmp    611 <printf+0x19a>
      } else {
        putc(fd, c);
 4c7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4ca:	0f be c0             	movsbl %al,%eax
 4cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d1:	8b 45 08             	mov    0x8(%ebp),%eax
 4d4:	89 04 24             	mov    %eax,(%esp)
 4d7:	e8 bb fe ff ff       	call   397 <putc>
 4dc:	e9 30 01 00 00       	jmp    611 <printf+0x19a>
      }
    } else if(state == '%'){
 4e1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4e5:	0f 85 26 01 00 00    	jne    611 <printf+0x19a>
      if(c == 'd'){
 4eb:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4ef:	75 2d                	jne    51e <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4f4:	8b 00                	mov    (%eax),%eax
 4f6:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4fd:	00 
 4fe:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 505:	00 
 506:	89 44 24 04          	mov    %eax,0x4(%esp)
 50a:	8b 45 08             	mov    0x8(%ebp),%eax
 50d:	89 04 24             	mov    %eax,(%esp)
 510:	e8 aa fe ff ff       	call   3bf <printint>
        ap++;
 515:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 519:	e9 ec 00 00 00       	jmp    60a <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 51e:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 522:	74 06                	je     52a <printf+0xb3>
 524:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 528:	75 2d                	jne    557 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 52a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 52d:	8b 00                	mov    (%eax),%eax
 52f:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 536:	00 
 537:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 53e:	00 
 53f:	89 44 24 04          	mov    %eax,0x4(%esp)
 543:	8b 45 08             	mov    0x8(%ebp),%eax
 546:	89 04 24             	mov    %eax,(%esp)
 549:	e8 71 fe ff ff       	call   3bf <printint>
        ap++;
 54e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 552:	e9 b3 00 00 00       	jmp    60a <printf+0x193>
      } else if(c == 's'){
 557:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 55b:	75 45                	jne    5a2 <printf+0x12b>
        s = (char*)*ap;
 55d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 560:	8b 00                	mov    (%eax),%eax
 562:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 565:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 569:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 56d:	75 09                	jne    578 <printf+0x101>
          s = "(null)";
 56f:	c7 45 f4 fa 0b 00 00 	movl   $0xbfa,-0xc(%ebp)
        while(*s != 0){
 576:	eb 1e                	jmp    596 <printf+0x11f>
 578:	eb 1c                	jmp    596 <printf+0x11f>
          putc(fd, *s);
 57a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57d:	0f b6 00             	movzbl (%eax),%eax
 580:	0f be c0             	movsbl %al,%eax
 583:	89 44 24 04          	mov    %eax,0x4(%esp)
 587:	8b 45 08             	mov    0x8(%ebp),%eax
 58a:	89 04 24             	mov    %eax,(%esp)
 58d:	e8 05 fe ff ff       	call   397 <putc>
          s++;
 592:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 596:	8b 45 f4             	mov    -0xc(%ebp),%eax
 599:	0f b6 00             	movzbl (%eax),%eax
 59c:	84 c0                	test   %al,%al
 59e:	75 da                	jne    57a <printf+0x103>
 5a0:	eb 68                	jmp    60a <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5a2:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5a6:	75 1d                	jne    5c5 <printf+0x14e>
        putc(fd, *ap);
 5a8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ab:	8b 00                	mov    (%eax),%eax
 5ad:	0f be c0             	movsbl %al,%eax
 5b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b4:	8b 45 08             	mov    0x8(%ebp),%eax
 5b7:	89 04 24             	mov    %eax,(%esp)
 5ba:	e8 d8 fd ff ff       	call   397 <putc>
        ap++;
 5bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c3:	eb 45                	jmp    60a <printf+0x193>
      } else if(c == '%'){
 5c5:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5c9:	75 17                	jne    5e2 <printf+0x16b>
        putc(fd, c);
 5cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ce:	0f be c0             	movsbl %al,%eax
 5d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d5:	8b 45 08             	mov    0x8(%ebp),%eax
 5d8:	89 04 24             	mov    %eax,(%esp)
 5db:	e8 b7 fd ff ff       	call   397 <putc>
 5e0:	eb 28                	jmp    60a <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5e2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5e9:	00 
 5ea:	8b 45 08             	mov    0x8(%ebp),%eax
 5ed:	89 04 24             	mov    %eax,(%esp)
 5f0:	e8 a2 fd ff ff       	call   397 <putc>
        putc(fd, c);
 5f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f8:	0f be c0             	movsbl %al,%eax
 5fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ff:	8b 45 08             	mov    0x8(%ebp),%eax
 602:	89 04 24             	mov    %eax,(%esp)
 605:	e8 8d fd ff ff       	call   397 <putc>
      }
      state = 0;
 60a:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 611:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 615:	8b 55 0c             	mov    0xc(%ebp),%edx
 618:	8b 45 f0             	mov    -0x10(%ebp),%eax
 61b:	01 d0                	add    %edx,%eax
 61d:	0f b6 00             	movzbl (%eax),%eax
 620:	84 c0                	test   %al,%al
 622:	0f 85 71 fe ff ff    	jne    499 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 628:	c9                   	leave  
 629:	c3                   	ret    

0000062a <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 62a:	55                   	push   %ebp
 62b:	89 e5                	mov    %esp,%ebp
 62d:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 630:	8b 45 08             	mov    0x8(%ebp),%eax
 633:	83 e8 08             	sub    $0x8,%eax
 636:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 639:	a1 54 10 00 00       	mov    0x1054,%eax
 63e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 641:	eb 24                	jmp    667 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 643:	8b 45 fc             	mov    -0x4(%ebp),%eax
 646:	8b 00                	mov    (%eax),%eax
 648:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 64b:	77 12                	ja     65f <free+0x35>
 64d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 650:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 653:	77 24                	ja     679 <free+0x4f>
 655:	8b 45 fc             	mov    -0x4(%ebp),%eax
 658:	8b 00                	mov    (%eax),%eax
 65a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 65d:	77 1a                	ja     679 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 662:	8b 00                	mov    (%eax),%eax
 664:	89 45 fc             	mov    %eax,-0x4(%ebp)
 667:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 66d:	76 d4                	jbe    643 <free+0x19>
 66f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 672:	8b 00                	mov    (%eax),%eax
 674:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 677:	76 ca                	jbe    643 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 679:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67c:	8b 40 04             	mov    0x4(%eax),%eax
 67f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 686:	8b 45 f8             	mov    -0x8(%ebp),%eax
 689:	01 c2                	add    %eax,%edx
 68b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68e:	8b 00                	mov    (%eax),%eax
 690:	39 c2                	cmp    %eax,%edx
 692:	75 24                	jne    6b8 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 694:	8b 45 f8             	mov    -0x8(%ebp),%eax
 697:	8b 50 04             	mov    0x4(%eax),%edx
 69a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69d:	8b 00                	mov    (%eax),%eax
 69f:	8b 40 04             	mov    0x4(%eax),%eax
 6a2:	01 c2                	add    %eax,%edx
 6a4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a7:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ad:	8b 00                	mov    (%eax),%eax
 6af:	8b 10                	mov    (%eax),%edx
 6b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b4:	89 10                	mov    %edx,(%eax)
 6b6:	eb 0a                	jmp    6c2 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bb:	8b 10                	mov    (%eax),%edx
 6bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c0:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c5:	8b 40 04             	mov    0x4(%eax),%eax
 6c8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d2:	01 d0                	add    %edx,%eax
 6d4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6d7:	75 20                	jne    6f9 <free+0xcf>
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
 6f7:	eb 08                	jmp    701 <free+0xd7>
  } else
    p->s.ptr = bp;
 6f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6ff:	89 10                	mov    %edx,(%eax)
  freep = p;
 701:	8b 45 fc             	mov    -0x4(%ebp),%eax
 704:	a3 54 10 00 00       	mov    %eax,0x1054
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
 72a:	e8 28 fc ff ff       	call   357 <sbrk>
 72f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 732:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 736:	75 07                	jne    73f <morecore+0x34>
    return 0;
 738:	b8 00 00 00 00       	mov    $0x0,%eax
 73d:	eb 22                	jmp    761 <morecore+0x56>
  hp = (Header*)p;
 73f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 742:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 745:	8b 45 f0             	mov    -0x10(%ebp),%eax
 748:	8b 55 08             	mov    0x8(%ebp),%edx
 74b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 74e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 751:	83 c0 08             	add    $0x8,%eax
 754:	89 04 24             	mov    %eax,(%esp)
 757:	e8 ce fe ff ff       	call   62a <free>
  return freep;
 75c:	a1 54 10 00 00       	mov    0x1054,%eax
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
 775:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 778:	a1 54 10 00 00       	mov    0x1054,%eax
 77d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 780:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 784:	75 23                	jne    7a9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 786:	c7 45 f0 4c 10 00 00 	movl   $0x104c,-0x10(%ebp)
 78d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 790:	a3 54 10 00 00       	mov    %eax,0x1054
 795:	a1 54 10 00 00       	mov    0x1054,%eax
 79a:	a3 4c 10 00 00       	mov    %eax,0x104c
    base.s.size = 0;
 79f:	c7 05 50 10 00 00 00 	movl   $0x0,0x1050
 7a6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ac:	8b 00                	mov    (%eax),%eax
 7ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b4:	8b 40 04             	mov    0x4(%eax),%eax
 7b7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7ba:	72 4d                	jb     809 <malloc+0xa6>
      if(p->s.size == nunits)
 7bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bf:	8b 40 04             	mov    0x4(%eax),%eax
 7c2:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7c5:	75 0c                	jne    7d3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ca:	8b 10                	mov    (%eax),%edx
 7cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cf:	89 10                	mov    %edx,(%eax)
 7d1:	eb 26                	jmp    7f9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d6:	8b 40 04             	mov    0x4(%eax),%eax
 7d9:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7dc:	89 c2                	mov    %eax,%edx
 7de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e7:	8b 40 04             	mov    0x4(%eax),%eax
 7ea:	c1 e0 03             	shl    $0x3,%eax
 7ed:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7f6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fc:	a3 54 10 00 00       	mov    %eax,0x1054
      return (void*)(p + 1);
 801:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804:	83 c0 08             	add    $0x8,%eax
 807:	eb 38                	jmp    841 <malloc+0xde>
    }
    if(p == freep)
 809:	a1 54 10 00 00       	mov    0x1054,%eax
 80e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 811:	75 1b                	jne    82e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 813:	8b 45 ec             	mov    -0x14(%ebp),%eax
 816:	89 04 24             	mov    %eax,(%esp)
 819:	e8 ed fe ff ff       	call   70b <morecore>
 81e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 821:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
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
 82e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 831:	89 45 f0             	mov    %eax,-0x10(%ebp)
 834:	8b 45 f4             	mov    -0xc(%ebp),%eax
 837:	8b 00                	mov    (%eax),%eax
 839:	89 45 f4             	mov    %eax,-0xc(%ebp)
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

00000843 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 843:	55                   	push   %ebp
 844:	89 e5                	mov    %esp,%ebp
 846:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 849:	8b 55 08             	mov    0x8(%ebp),%edx
 84c:	8b 45 0c             	mov    0xc(%ebp),%eax
 84f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 852:	f0 87 02             	lock xchg %eax,(%edx)
 855:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 858:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 85b:	c9                   	leave  
 85c:	c3                   	ret    

0000085d <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 85d:	55                   	push   %ebp
 85e:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 860:	8b 45 08             	mov    0x8(%ebp),%eax
 863:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 869:	5d                   	pop    %ebp
 86a:	c3                   	ret    

0000086b <lock_acquire>:
void lock_acquire(lock_t *lock){
 86b:	55                   	push   %ebp
 86c:	89 e5                	mov    %esp,%ebp
 86e:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 871:	90                   	nop
 872:	8b 45 08             	mov    0x8(%ebp),%eax
 875:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 87c:	00 
 87d:	89 04 24             	mov    %eax,(%esp)
 880:	e8 be ff ff ff       	call   843 <xchg>
 885:	85 c0                	test   %eax,%eax
 887:	75 e9                	jne    872 <lock_acquire+0x7>
}
 889:	c9                   	leave  
 88a:	c3                   	ret    

0000088b <lock_release>:
void lock_release(lock_t *lock){
 88b:	55                   	push   %ebp
 88c:	89 e5                	mov    %esp,%ebp
 88e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 891:	8b 45 08             	mov    0x8(%ebp),%eax
 894:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 89b:	00 
 89c:	89 04 24             	mov    %eax,(%esp)
 89f:	e8 9f ff ff ff       	call   843 <xchg>
}
 8a4:	c9                   	leave  
 8a5:	c3                   	ret    

000008a6 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 8a6:	55                   	push   %ebp
 8a7:	89 e5                	mov    %esp,%ebp
 8a9:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 8ac:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8b3:	e8 ab fe ff ff       	call   763 <malloc>
 8b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 8bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8be:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 8c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c4:	25 ff 0f 00 00       	and    $0xfff,%eax
 8c9:	85 c0                	test   %eax,%eax
 8cb:	74 14                	je     8e1 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 8cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d0:	25 ff 0f 00 00       	and    $0xfff,%eax
 8d5:	89 c2                	mov    %eax,%edx
 8d7:	b8 00 10 00 00       	mov    $0x1000,%eax
 8dc:	29 d0                	sub    %edx,%eax
 8de:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 8e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8e5:	75 1b                	jne    902 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 8e7:	c7 44 24 04 01 0c 00 	movl   $0xc01,0x4(%esp)
 8ee:	00 
 8ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8f6:	e8 7c fb ff ff       	call   477 <printf>
        return 0;
 8fb:	b8 00 00 00 00       	mov    $0x0,%eax
 900:	eb 6f                	jmp    971 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 902:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 905:	8b 55 08             	mov    0x8(%ebp),%edx
 908:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90b:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 90f:	89 54 24 08          	mov    %edx,0x8(%esp)
 913:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 91a:	00 
 91b:	89 04 24             	mov    %eax,(%esp)
 91e:	e8 4c fa ff ff       	call   36f <clone>
 923:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 926:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 92a:	79 1b                	jns    947 <thread_create+0xa1>
        printf(1,"clone fails\n");
 92c:	c7 44 24 04 0f 0c 00 	movl   $0xc0f,0x4(%esp)
 933:	00 
 934:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 93b:	e8 37 fb ff ff       	call   477 <printf>
        return 0;
 940:	b8 00 00 00 00       	mov    $0x0,%eax
 945:	eb 2a                	jmp    971 <thread_create+0xcb>
    }
    if(tid > 0){
 947:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 94b:	7e 05                	jle    952 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 94d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 950:	eb 1f                	jmp    971 <thread_create+0xcb>
    }
    if(tid == 0){
 952:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 956:	75 14                	jne    96c <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 958:	c7 44 24 04 1c 0c 00 	movl   $0xc1c,0x4(%esp)
 95f:	00 
 960:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 967:	e8 0b fb ff ff       	call   477 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 96c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 971:	c9                   	leave  
 972:	c3                   	ret    

00000973 <random>:

unsigned long rands = 1;
// generate 0 -> max random number exclude max.
int random(int max){
 973:	55                   	push   %ebp
 974:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
 976:	a1 48 10 00 00       	mov    0x1048,%eax
 97b:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
 981:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
 986:	a3 48 10 00 00       	mov    %eax,0x1048
    return (int)(rands % max);
 98b:	a1 48 10 00 00       	mov    0x1048,%eax
 990:	8b 4d 08             	mov    0x8(%ebp),%ecx
 993:	ba 00 00 00 00       	mov    $0x0,%edx
 998:	f7 f1                	div    %ecx
 99a:	89 d0                	mov    %edx,%eax
 99c:	5d                   	pop    %ebp
 99d:	c3                   	ret    

0000099e <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 99e:	55                   	push   %ebp
 99f:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 9a1:	8b 45 08             	mov    0x8(%ebp),%eax
 9a4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 9aa:	8b 45 08             	mov    0x8(%ebp),%eax
 9ad:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 9b4:	8b 45 08             	mov    0x8(%ebp),%eax
 9b7:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 9be:	5d                   	pop    %ebp
 9bf:	c3                   	ret    

000009c0 <add_q>:

void add_q(struct queue *q, int v){
 9c0:	55                   	push   %ebp
 9c1:	89 e5                	mov    %esp,%ebp
 9c3:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 9c6:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 9cd:	e8 91 fd ff ff       	call   763 <malloc>
 9d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 9d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 9df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e2:	8b 55 0c             	mov    0xc(%ebp),%edx
 9e5:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 9e7:	8b 45 08             	mov    0x8(%ebp),%eax
 9ea:	8b 40 04             	mov    0x4(%eax),%eax
 9ed:	85 c0                	test   %eax,%eax
 9ef:	75 0b                	jne    9fc <add_q+0x3c>
        q->head = n;
 9f1:	8b 45 08             	mov    0x8(%ebp),%eax
 9f4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9f7:	89 50 04             	mov    %edx,0x4(%eax)
 9fa:	eb 0c                	jmp    a08 <add_q+0x48>
    }else{
        q->tail->next = n;
 9fc:	8b 45 08             	mov    0x8(%ebp),%eax
 9ff:	8b 40 08             	mov    0x8(%eax),%eax
 a02:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a05:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 a08:	8b 45 08             	mov    0x8(%ebp),%eax
 a0b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a0e:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 a11:	8b 45 08             	mov    0x8(%ebp),%eax
 a14:	8b 00                	mov    (%eax),%eax
 a16:	8d 50 01             	lea    0x1(%eax),%edx
 a19:	8b 45 08             	mov    0x8(%ebp),%eax
 a1c:	89 10                	mov    %edx,(%eax)
}
 a1e:	c9                   	leave  
 a1f:	c3                   	ret    

00000a20 <empty_q>:

int empty_q(struct queue *q){
 a20:	55                   	push   %ebp
 a21:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 a23:	8b 45 08             	mov    0x8(%ebp),%eax
 a26:	8b 00                	mov    (%eax),%eax
 a28:	85 c0                	test   %eax,%eax
 a2a:	75 07                	jne    a33 <empty_q+0x13>
        return 1;
 a2c:	b8 01 00 00 00       	mov    $0x1,%eax
 a31:	eb 05                	jmp    a38 <empty_q+0x18>
    else
        return 0;
 a33:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 a38:	5d                   	pop    %ebp
 a39:	c3                   	ret    

00000a3a <pop_q>:
int pop_q(struct queue *q){
 a3a:	55                   	push   %ebp
 a3b:	89 e5                	mov    %esp,%ebp
 a3d:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a40:	8b 45 08             	mov    0x8(%ebp),%eax
 a43:	89 04 24             	mov    %eax,(%esp)
 a46:	e8 d5 ff ff ff       	call   a20 <empty_q>
 a4b:	85 c0                	test   %eax,%eax
 a4d:	75 5d                	jne    aac <pop_q+0x72>
       val = q->head->value; 
 a4f:	8b 45 08             	mov    0x8(%ebp),%eax
 a52:	8b 40 04             	mov    0x4(%eax),%eax
 a55:	8b 00                	mov    (%eax),%eax
 a57:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 a5a:	8b 45 08             	mov    0x8(%ebp),%eax
 a5d:	8b 40 04             	mov    0x4(%eax),%eax
 a60:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 a63:	8b 45 08             	mov    0x8(%ebp),%eax
 a66:	8b 40 04             	mov    0x4(%eax),%eax
 a69:	8b 50 04             	mov    0x4(%eax),%edx
 a6c:	8b 45 08             	mov    0x8(%ebp),%eax
 a6f:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a72:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a75:	89 04 24             	mov    %eax,(%esp)
 a78:	e8 ad fb ff ff       	call   62a <free>
       q->size--;
 a7d:	8b 45 08             	mov    0x8(%ebp),%eax
 a80:	8b 00                	mov    (%eax),%eax
 a82:	8d 50 ff             	lea    -0x1(%eax),%edx
 a85:	8b 45 08             	mov    0x8(%ebp),%eax
 a88:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a8a:	8b 45 08             	mov    0x8(%ebp),%eax
 a8d:	8b 00                	mov    (%eax),%eax
 a8f:	85 c0                	test   %eax,%eax
 a91:	75 14                	jne    aa7 <pop_q+0x6d>
            q->head = 0;
 a93:	8b 45 08             	mov    0x8(%ebp),%eax
 a96:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a9d:	8b 45 08             	mov    0x8(%ebp),%eax
 aa0:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 aa7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aaa:	eb 05                	jmp    ab1 <pop_q+0x77>
    }
    return -1;
 aac:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 ab1:	c9                   	leave  
 ab2:	c3                   	ret    

00000ab3 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 ab3:	55                   	push   %ebp
 ab4:	89 e5                	mov    %esp,%ebp
 ab6:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 ab9:	8b 45 08             	mov    0x8(%ebp),%eax
 abc:	8b 55 0c             	mov    0xc(%ebp),%edx
 abf:	89 50 08             	mov    %edx,0x8(%eax)
	s->count = size;
 ac2:	8b 45 08             	mov    0x8(%ebp),%eax
 ac5:	8b 55 0c             	mov    0xc(%ebp),%edx
 ac8:	89 50 04             	mov    %edx,0x4(%eax)
	lock_init(&s->lock);
 acb:	8b 45 08             	mov    0x8(%ebp),%eax
 ace:	89 04 24             	mov    %eax,(%esp)
 ad1:	e8 87 fd ff ff       	call   85d <lock_init>
}
 ad6:	c9                   	leave  
 ad7:	c3                   	ret    

00000ad8 <sem_init_full>:

void 
sem_init_full(struct semaphore *s, int size){
 ad8:	55                   	push   %ebp
 ad9:	89 e5                	mov    %esp,%ebp
 adb:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 ade:	8b 45 08             	mov    0x8(%ebp),%eax
 ae1:	8b 55 0c             	mov    0xc(%ebp),%edx
 ae4:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 ae7:	8b 45 08             	mov    0x8(%ebp),%eax
 aea:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock);
 af1:	8b 45 08             	mov    0x8(%ebp),%eax
 af4:	89 04 24             	mov    %eax,(%esp)
 af7:	e8 61 fd ff ff       	call   85d <lock_init>
}
 afc:	c9                   	leave  
 afd:	c3                   	ret    

00000afe <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 afe:	55                   	push   %ebp
 aff:	89 e5                	mov    %esp,%ebp
 b01:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 b04:	8b 45 08             	mov    0x8(%ebp),%eax
 b07:	89 04 24             	mov    %eax,(%esp)
 b0a:	e8 5c fd ff ff       	call   86b <lock_acquire>
	if(s->count  == 0){
 b0f:	8b 45 08             	mov    0x8(%ebp),%eax
 b12:	8b 40 04             	mov    0x4(%eax),%eax
 b15:	85 c0                	test   %eax,%eax
 b17:	75 2f                	jne    b48 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 b19:	e8 31 f8 ff ff       	call   34f <getpid>
 b1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 b21:	8b 45 08             	mov    0x8(%ebp),%eax
 b24:	8d 50 0c             	lea    0xc(%eax),%edx
 b27:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b2a:	89 44 24 04          	mov    %eax,0x4(%esp)
 b2e:	89 14 24             	mov    %edx,(%esp)
 b31:	e8 8a fe ff ff       	call   9c0 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 b36:	8b 45 08             	mov    0x8(%ebp),%eax
 b39:	89 04 24             	mov    %eax,(%esp)
 b3c:	e8 4a fd ff ff       	call   88b <lock_release>
		tsleep(); 
 b41:	e8 39 f8 ff ff       	call   37f <tsleep>
 b46:	eb 1a                	jmp    b62 <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 b48:	8b 45 08             	mov    0x8(%ebp),%eax
 b4b:	8b 40 04             	mov    0x4(%eax),%eax
 b4e:	8d 50 ff             	lea    -0x1(%eax),%edx
 b51:	8b 45 08             	mov    0x8(%ebp),%eax
 b54:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b57:	8b 45 08             	mov    0x8(%ebp),%eax
 b5a:	89 04 24             	mov    %eax,(%esp)
 b5d:	e8 29 fd ff ff       	call   88b <lock_release>
	}
}
 b62:	c9                   	leave  
 b63:	c3                   	ret    

00000b64 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b64:	55                   	push   %ebp
 b65:	89 e5                	mov    %esp,%ebp
 b67:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b6a:	8b 45 08             	mov    0x8(%ebp),%eax
 b6d:	89 04 24             	mov    %eax,(%esp)
 b70:	e8 f6 fc ff ff       	call   86b <lock_acquire>
	if(s->count < s->size){
 b75:	8b 45 08             	mov    0x8(%ebp),%eax
 b78:	8b 50 04             	mov    0x4(%eax),%edx
 b7b:	8b 45 08             	mov    0x8(%ebp),%eax
 b7e:	8b 40 08             	mov    0x8(%eax),%eax
 b81:	39 c2                	cmp    %eax,%edx
 b83:	7d 0f                	jge    b94 <sem_signal+0x30>
		s->count++;	
 b85:	8b 45 08             	mov    0x8(%ebp),%eax
 b88:	8b 40 04             	mov    0x4(%eax),%eax
 b8b:	8d 50 01             	lea    0x1(%eax),%edx
 b8e:	8b 45 08             	mov    0x8(%ebp),%eax
 b91:	89 50 04             	mov    %edx,0x4(%eax)
	}

	int tid;
	tid = pop_q(&s->waiters);
 b94:	8b 45 08             	mov    0x8(%ebp),%eax
 b97:	83 c0 0c             	add    $0xc,%eax
 b9a:	89 04 24             	mov    %eax,(%esp)
 b9d:	e8 98 fe ff ff       	call   a3a <pop_q>
 ba2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 ba5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 ba9:	74 2e                	je     bd9 <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 bab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bae:	89 04 24             	mov    %eax,(%esp)
 bb1:	e8 d1 f7 ff ff       	call   387 <twakeup>
		s->count--;
 bb6:	8b 45 08             	mov    0x8(%ebp),%eax
 bb9:	8b 40 04             	mov    0x4(%eax),%eax
 bbc:	8d 50 ff             	lea    -0x1(%eax),%edx
 bbf:	8b 45 08             	mov    0x8(%ebp),%eax
 bc2:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 bc5:	8b 45 08             	mov    0x8(%ebp),%eax
 bc8:	8b 40 04             	mov    0x4(%eax),%eax
 bcb:	85 c0                	test   %eax,%eax
 bcd:	79 0a                	jns    bd9 <sem_signal+0x75>
 bcf:	8b 45 08             	mov    0x8(%ebp),%eax
 bd2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 bd9:	8b 45 08             	mov    0x8(%ebp),%eax
 bdc:	89 04 24             	mov    %eax,(%esp)
 bdf:	e8 a7 fc ff ff       	call   88b <lock_release>

 be4:	c9                   	leave  
 be5:	c3                   	ret    
