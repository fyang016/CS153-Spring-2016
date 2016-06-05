
_echo:     file format elf32-i386


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
   6:	83 ec 20             	sub    $0x20,%esp
  int i;

  for(i = 1; i < argc; i++)
   9:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  10:	00 
  11:	eb 4b                	jmp    5e <main+0x5e>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	83 c0 01             	add    $0x1,%eax
  1a:	3b 45 08             	cmp    0x8(%ebp),%eax
  1d:	7d 07                	jge    26 <main+0x26>
  1f:	b8 d7 0b 00 00       	mov    $0xbd7,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 d9 0b 00 00       	mov    $0xbd9,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	8d 0c 95 00 00 00 00 	lea    0x0(,%edx,4),%ecx
  36:	8b 55 0c             	mov    0xc(%ebp),%edx
  39:	01 ca                	add    %ecx,%edx
  3b:	8b 12                	mov    (%edx),%edx
  3d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  41:	89 54 24 08          	mov    %edx,0x8(%esp)
  45:	c7 44 24 04 db 0b 00 	movl   $0xbdb,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  54:	e8 23 04 00 00       	call   47c <printf>
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
  59:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  5e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  62:	3b 45 08             	cmp    0x8(%ebp),%eax
  65:	7c ac                	jl     13 <main+0x13>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit();
  67:	e8 68 02 00 00       	call   2d4 <exit>

0000006c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  6c:	55                   	push   %ebp
  6d:	89 e5                	mov    %esp,%ebp
  6f:	57                   	push   %edi
  70:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  71:	8b 4d 08             	mov    0x8(%ebp),%ecx
  74:	8b 55 10             	mov    0x10(%ebp),%edx
  77:	8b 45 0c             	mov    0xc(%ebp),%eax
  7a:	89 cb                	mov    %ecx,%ebx
  7c:	89 df                	mov    %ebx,%edi
  7e:	89 d1                	mov    %edx,%ecx
  80:	fc                   	cld    
  81:	f3 aa                	rep stos %al,%es:(%edi)
  83:	89 ca                	mov    %ecx,%edx
  85:	89 fb                	mov    %edi,%ebx
  87:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  8d:	5b                   	pop    %ebx
  8e:	5f                   	pop    %edi
  8f:	5d                   	pop    %ebp
  90:	c3                   	ret    

00000091 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  91:	55                   	push   %ebp
  92:	89 e5                	mov    %esp,%ebp
  94:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  97:	8b 45 08             	mov    0x8(%ebp),%eax
  9a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  9d:	90                   	nop
  9e:	8b 45 08             	mov    0x8(%ebp),%eax
  a1:	8d 50 01             	lea    0x1(%eax),%edx
  a4:	89 55 08             	mov    %edx,0x8(%ebp)
  a7:	8b 55 0c             	mov    0xc(%ebp),%edx
  aa:	8d 4a 01             	lea    0x1(%edx),%ecx
  ad:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  b0:	0f b6 12             	movzbl (%edx),%edx
  b3:	88 10                	mov    %dl,(%eax)
  b5:	0f b6 00             	movzbl (%eax),%eax
  b8:	84 c0                	test   %al,%al
  ba:	75 e2                	jne    9e <strcpy+0xd>
    ;
  return os;
  bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  bf:	c9                   	leave  
  c0:	c3                   	ret    

000000c1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c1:	55                   	push   %ebp
  c2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  c4:	eb 08                	jmp    ce <strcmp+0xd>
    p++, q++;
  c6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ca:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ce:	8b 45 08             	mov    0x8(%ebp),%eax
  d1:	0f b6 00             	movzbl (%eax),%eax
  d4:	84 c0                	test   %al,%al
  d6:	74 10                	je     e8 <strcmp+0x27>
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	0f b6 10             	movzbl (%eax),%edx
  de:	8b 45 0c             	mov    0xc(%ebp),%eax
  e1:	0f b6 00             	movzbl (%eax),%eax
  e4:	38 c2                	cmp    %al,%dl
  e6:	74 de                	je     c6 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e8:	8b 45 08             	mov    0x8(%ebp),%eax
  eb:	0f b6 00             	movzbl (%eax),%eax
  ee:	0f b6 d0             	movzbl %al,%edx
  f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	0f b6 c0             	movzbl %al,%eax
  fa:	29 c2                	sub    %eax,%edx
  fc:	89 d0                	mov    %edx,%eax
}
  fe:	5d                   	pop    %ebp
  ff:	c3                   	ret    

00000100 <strlen>:

uint
strlen(char *s)
{
 100:	55                   	push   %ebp
 101:	89 e5                	mov    %esp,%ebp
 103:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 106:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 10d:	eb 04                	jmp    113 <strlen+0x13>
 10f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 113:	8b 55 fc             	mov    -0x4(%ebp),%edx
 116:	8b 45 08             	mov    0x8(%ebp),%eax
 119:	01 d0                	add    %edx,%eax
 11b:	0f b6 00             	movzbl (%eax),%eax
 11e:	84 c0                	test   %al,%al
 120:	75 ed                	jne    10f <strlen+0xf>
    ;
  return n;
 122:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 125:	c9                   	leave  
 126:	c3                   	ret    

00000127 <memset>:

void*
memset(void *dst, int c, uint n)
{
 127:	55                   	push   %ebp
 128:	89 e5                	mov    %esp,%ebp
 12a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 12d:	8b 45 10             	mov    0x10(%ebp),%eax
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	8b 45 0c             	mov    0xc(%ebp),%eax
 137:	89 44 24 04          	mov    %eax,0x4(%esp)
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 04 24             	mov    %eax,(%esp)
 141:	e8 26 ff ff ff       	call   6c <stosb>
  return dst;
 146:	8b 45 08             	mov    0x8(%ebp),%eax
}
 149:	c9                   	leave  
 14a:	c3                   	ret    

0000014b <strchr>:

char*
strchr(const char *s, char c)
{
 14b:	55                   	push   %ebp
 14c:	89 e5                	mov    %esp,%ebp
 14e:	83 ec 04             	sub    $0x4,%esp
 151:	8b 45 0c             	mov    0xc(%ebp),%eax
 154:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 157:	eb 14                	jmp    16d <strchr+0x22>
    if(*s == c)
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	0f b6 00             	movzbl (%eax),%eax
 15f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 162:	75 05                	jne    169 <strchr+0x1e>
      return (char*)s;
 164:	8b 45 08             	mov    0x8(%ebp),%eax
 167:	eb 13                	jmp    17c <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	8b 45 08             	mov    0x8(%ebp),%eax
 170:	0f b6 00             	movzbl (%eax),%eax
 173:	84 c0                	test   %al,%al
 175:	75 e2                	jne    159 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 177:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17c:	c9                   	leave  
 17d:	c3                   	ret    

0000017e <gets>:

char*
gets(char *buf, int max)
{
 17e:	55                   	push   %ebp
 17f:	89 e5                	mov    %esp,%ebp
 181:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 184:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 18b:	eb 4c                	jmp    1d9 <gets+0x5b>
    cc = read(0, &c, 1);
 18d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 194:	00 
 195:	8d 45 ef             	lea    -0x11(%ebp),%eax
 198:	89 44 24 04          	mov    %eax,0x4(%esp)
 19c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a3:	e8 44 01 00 00       	call   2ec <read>
 1a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1af:	7f 02                	jg     1b3 <gets+0x35>
      break;
 1b1:	eb 31                	jmp    1e4 <gets+0x66>
    buf[i++] = c;
 1b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1b6:	8d 50 01             	lea    0x1(%eax),%edx
 1b9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1bc:	89 c2                	mov    %eax,%edx
 1be:	8b 45 08             	mov    0x8(%ebp),%eax
 1c1:	01 c2                	add    %eax,%edx
 1c3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1c9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cd:	3c 0a                	cmp    $0xa,%al
 1cf:	74 13                	je     1e4 <gets+0x66>
 1d1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d5:	3c 0d                	cmp    $0xd,%al
 1d7:	74 0b                	je     1e4 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1dc:	83 c0 01             	add    $0x1,%eax
 1df:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1e2:	7c a9                	jl     18d <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ea:	01 d0                	add    %edx,%eax
 1ec:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f2:	c9                   	leave  
 1f3:	c3                   	ret    

000001f4 <stat>:

int
stat(char *n, struct stat *st)
{
 1f4:	55                   	push   %ebp
 1f5:	89 e5                	mov    %esp,%ebp
 1f7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 201:	00 
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	89 04 24             	mov    %eax,(%esp)
 208:	e8 07 01 00 00       	call   314 <open>
 20d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 210:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 214:	79 07                	jns    21d <stat+0x29>
    return -1;
 216:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 21b:	eb 23                	jmp    240 <stat+0x4c>
  r = fstat(fd, st);
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	89 44 24 04          	mov    %eax,0x4(%esp)
 224:	8b 45 f4             	mov    -0xc(%ebp),%eax
 227:	89 04 24             	mov    %eax,(%esp)
 22a:	e8 fd 00 00 00       	call   32c <fstat>
 22f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 232:	8b 45 f4             	mov    -0xc(%ebp),%eax
 235:	89 04 24             	mov    %eax,(%esp)
 238:	e8 bf 00 00 00       	call   2fc <close>
  return r;
 23d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 240:	c9                   	leave  
 241:	c3                   	ret    

00000242 <atoi>:

int
atoi(const char *s)
{
 242:	55                   	push   %ebp
 243:	89 e5                	mov    %esp,%ebp
 245:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 248:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 24f:	eb 25                	jmp    276 <atoi+0x34>
    n = n*10 + *s++ - '0';
 251:	8b 55 fc             	mov    -0x4(%ebp),%edx
 254:	89 d0                	mov    %edx,%eax
 256:	c1 e0 02             	shl    $0x2,%eax
 259:	01 d0                	add    %edx,%eax
 25b:	01 c0                	add    %eax,%eax
 25d:	89 c1                	mov    %eax,%ecx
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	8d 50 01             	lea    0x1(%eax),%edx
 265:	89 55 08             	mov    %edx,0x8(%ebp)
 268:	0f b6 00             	movzbl (%eax),%eax
 26b:	0f be c0             	movsbl %al,%eax
 26e:	01 c8                	add    %ecx,%eax
 270:	83 e8 30             	sub    $0x30,%eax
 273:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 276:	8b 45 08             	mov    0x8(%ebp),%eax
 279:	0f b6 00             	movzbl (%eax),%eax
 27c:	3c 2f                	cmp    $0x2f,%al
 27e:	7e 0a                	jle    28a <atoi+0x48>
 280:	8b 45 08             	mov    0x8(%ebp),%eax
 283:	0f b6 00             	movzbl (%eax),%eax
 286:	3c 39                	cmp    $0x39,%al
 288:	7e c7                	jle    251 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 28a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 28d:	c9                   	leave  
 28e:	c3                   	ret    

0000028f <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 28f:	55                   	push   %ebp
 290:	89 e5                	mov    %esp,%ebp
 292:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 295:	8b 45 08             	mov    0x8(%ebp),%eax
 298:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 29b:	8b 45 0c             	mov    0xc(%ebp),%eax
 29e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2a1:	eb 17                	jmp    2ba <memmove+0x2b>
    *dst++ = *src++;
 2a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a6:	8d 50 01             	lea    0x1(%eax),%edx
 2a9:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2ac:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2af:	8d 4a 01             	lea    0x1(%edx),%ecx
 2b2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2b5:	0f b6 12             	movzbl (%edx),%edx
 2b8:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ba:	8b 45 10             	mov    0x10(%ebp),%eax
 2bd:	8d 50 ff             	lea    -0x1(%eax),%edx
 2c0:	89 55 10             	mov    %edx,0x10(%ebp)
 2c3:	85 c0                	test   %eax,%eax
 2c5:	7f dc                	jg     2a3 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2c7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ca:	c9                   	leave  
 2cb:	c3                   	ret    

000002cc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2cc:	b8 01 00 00 00       	mov    $0x1,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <exit>:
SYSCALL(exit)
 2d4:	b8 02 00 00 00       	mov    $0x2,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <wait>:
SYSCALL(wait)
 2dc:	b8 03 00 00 00       	mov    $0x3,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <pipe>:
SYSCALL(pipe)
 2e4:	b8 04 00 00 00       	mov    $0x4,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <read>:
SYSCALL(read)
 2ec:	b8 05 00 00 00       	mov    $0x5,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <write>:
SYSCALL(write)
 2f4:	b8 10 00 00 00       	mov    $0x10,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <close>:
SYSCALL(close)
 2fc:	b8 15 00 00 00       	mov    $0x15,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <kill>:
SYSCALL(kill)
 304:	b8 06 00 00 00       	mov    $0x6,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <exec>:
SYSCALL(exec)
 30c:	b8 07 00 00 00       	mov    $0x7,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <open>:
SYSCALL(open)
 314:	b8 0f 00 00 00       	mov    $0xf,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <mknod>:
SYSCALL(mknod)
 31c:	b8 11 00 00 00       	mov    $0x11,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <unlink>:
SYSCALL(unlink)
 324:	b8 12 00 00 00       	mov    $0x12,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <fstat>:
SYSCALL(fstat)
 32c:	b8 08 00 00 00       	mov    $0x8,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <link>:
SYSCALL(link)
 334:	b8 13 00 00 00       	mov    $0x13,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <mkdir>:
SYSCALL(mkdir)
 33c:	b8 14 00 00 00       	mov    $0x14,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <chdir>:
SYSCALL(chdir)
 344:	b8 09 00 00 00       	mov    $0x9,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <dup>:
SYSCALL(dup)
 34c:	b8 0a 00 00 00       	mov    $0xa,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <getpid>:
SYSCALL(getpid)
 354:	b8 0b 00 00 00       	mov    $0xb,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <sbrk>:
SYSCALL(sbrk)
 35c:	b8 0c 00 00 00       	mov    $0xc,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <sleep>:
SYSCALL(sleep)
 364:	b8 0d 00 00 00       	mov    $0xd,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <uptime>:
SYSCALL(uptime)
 36c:	b8 0e 00 00 00       	mov    $0xe,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <clone>:
SYSCALL(clone)
 374:	b8 16 00 00 00       	mov    $0x16,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <texit>:
SYSCALL(texit)
 37c:	b8 17 00 00 00       	mov    $0x17,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <tsleep>:
SYSCALL(tsleep)
 384:	b8 18 00 00 00       	mov    $0x18,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <twakeup>:
SYSCALL(twakeup)
 38c:	b8 19 00 00 00       	mov    $0x19,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <test>:
SYSCALL(test)
 394:	b8 1a 00 00 00       	mov    $0x1a,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 39c:	55                   	push   %ebp
 39d:	89 e5                	mov    %esp,%ebp
 39f:	83 ec 18             	sub    $0x18,%esp
 3a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3af:	00 
 3b0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 3b7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ba:	89 04 24             	mov    %eax,(%esp)
 3bd:	e8 32 ff ff ff       	call   2f4 <write>
}
 3c2:	c9                   	leave  
 3c3:	c3                   	ret    

000003c4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3c4:	55                   	push   %ebp
 3c5:	89 e5                	mov    %esp,%ebp
 3c7:	56                   	push   %esi
 3c8:	53                   	push   %ebx
 3c9:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3cc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3d3:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3d7:	74 17                	je     3f0 <printint+0x2c>
 3d9:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3dd:	79 11                	jns    3f0 <printint+0x2c>
    neg = 1;
 3df:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e9:	f7 d8                	neg    %eax
 3eb:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3ee:	eb 06                	jmp    3f6 <printint+0x32>
  } else {
    x = xx;
 3f0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3f6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3fd:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 400:	8d 41 01             	lea    0x1(%ecx),%eax
 403:	89 45 f4             	mov    %eax,-0xc(%ebp)
 406:	8b 5d 10             	mov    0x10(%ebp),%ebx
 409:	8b 45 ec             	mov    -0x14(%ebp),%eax
 40c:	ba 00 00 00 00       	mov    $0x0,%edx
 411:	f7 f3                	div    %ebx
 413:	89 d0                	mov    %edx,%eax
 415:	0f b6 80 ec 0f 00 00 	movzbl 0xfec(%eax),%eax
 41c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 420:	8b 75 10             	mov    0x10(%ebp),%esi
 423:	8b 45 ec             	mov    -0x14(%ebp),%eax
 426:	ba 00 00 00 00       	mov    $0x0,%edx
 42b:	f7 f6                	div    %esi
 42d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 430:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 434:	75 c7                	jne    3fd <printint+0x39>
  if(neg)
 436:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 43a:	74 10                	je     44c <printint+0x88>
    buf[i++] = '-';
 43c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 43f:	8d 50 01             	lea    0x1(%eax),%edx
 442:	89 55 f4             	mov    %edx,-0xc(%ebp)
 445:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 44a:	eb 1f                	jmp    46b <printint+0xa7>
 44c:	eb 1d                	jmp    46b <printint+0xa7>
    putc(fd, buf[i]);
 44e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 451:	8b 45 f4             	mov    -0xc(%ebp),%eax
 454:	01 d0                	add    %edx,%eax
 456:	0f b6 00             	movzbl (%eax),%eax
 459:	0f be c0             	movsbl %al,%eax
 45c:	89 44 24 04          	mov    %eax,0x4(%esp)
 460:	8b 45 08             	mov    0x8(%ebp),%eax
 463:	89 04 24             	mov    %eax,(%esp)
 466:	e8 31 ff ff ff       	call   39c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 46b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 46f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 473:	79 d9                	jns    44e <printint+0x8a>
    putc(fd, buf[i]);
}
 475:	83 c4 30             	add    $0x30,%esp
 478:	5b                   	pop    %ebx
 479:	5e                   	pop    %esi
 47a:	5d                   	pop    %ebp
 47b:	c3                   	ret    

0000047c <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 47c:	55                   	push   %ebp
 47d:	89 e5                	mov    %esp,%ebp
 47f:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 482:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 489:	8d 45 0c             	lea    0xc(%ebp),%eax
 48c:	83 c0 04             	add    $0x4,%eax
 48f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 492:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 499:	e9 7c 01 00 00       	jmp    61a <printf+0x19e>
    c = fmt[i] & 0xff;
 49e:	8b 55 0c             	mov    0xc(%ebp),%edx
 4a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4a4:	01 d0                	add    %edx,%eax
 4a6:	0f b6 00             	movzbl (%eax),%eax
 4a9:	0f be c0             	movsbl %al,%eax
 4ac:	25 ff 00 00 00       	and    $0xff,%eax
 4b1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4b4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4b8:	75 2c                	jne    4e6 <printf+0x6a>
      if(c == '%'){
 4ba:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4be:	75 0c                	jne    4cc <printf+0x50>
        state = '%';
 4c0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4c7:	e9 4a 01 00 00       	jmp    616 <printf+0x19a>
      } else {
        putc(fd, c);
 4cc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4cf:	0f be c0             	movsbl %al,%eax
 4d2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
 4d9:	89 04 24             	mov    %eax,(%esp)
 4dc:	e8 bb fe ff ff       	call   39c <putc>
 4e1:	e9 30 01 00 00       	jmp    616 <printf+0x19a>
      }
    } else if(state == '%'){
 4e6:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4ea:	0f 85 26 01 00 00    	jne    616 <printf+0x19a>
      if(c == 'd'){
 4f0:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4f4:	75 2d                	jne    523 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4f9:	8b 00                	mov    (%eax),%eax
 4fb:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 502:	00 
 503:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 50a:	00 
 50b:	89 44 24 04          	mov    %eax,0x4(%esp)
 50f:	8b 45 08             	mov    0x8(%ebp),%eax
 512:	89 04 24             	mov    %eax,(%esp)
 515:	e8 aa fe ff ff       	call   3c4 <printint>
        ap++;
 51a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 51e:	e9 ec 00 00 00       	jmp    60f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 523:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 527:	74 06                	je     52f <printf+0xb3>
 529:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 52d:	75 2d                	jne    55c <printf+0xe0>
        printint(fd, *ap, 16, 0);
 52f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 532:	8b 00                	mov    (%eax),%eax
 534:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 53b:	00 
 53c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 543:	00 
 544:	89 44 24 04          	mov    %eax,0x4(%esp)
 548:	8b 45 08             	mov    0x8(%ebp),%eax
 54b:	89 04 24             	mov    %eax,(%esp)
 54e:	e8 71 fe ff ff       	call   3c4 <printint>
        ap++;
 553:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 557:	e9 b3 00 00 00       	jmp    60f <printf+0x193>
      } else if(c == 's'){
 55c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 560:	75 45                	jne    5a7 <printf+0x12b>
        s = (char*)*ap;
 562:	8b 45 e8             	mov    -0x18(%ebp),%eax
 565:	8b 00                	mov    (%eax),%eax
 567:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 56a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 56e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 572:	75 09                	jne    57d <printf+0x101>
          s = "(null)";
 574:	c7 45 f4 e0 0b 00 00 	movl   $0xbe0,-0xc(%ebp)
        while(*s != 0){
 57b:	eb 1e                	jmp    59b <printf+0x11f>
 57d:	eb 1c                	jmp    59b <printf+0x11f>
          putc(fd, *s);
 57f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 582:	0f b6 00             	movzbl (%eax),%eax
 585:	0f be c0             	movsbl %al,%eax
 588:	89 44 24 04          	mov    %eax,0x4(%esp)
 58c:	8b 45 08             	mov    0x8(%ebp),%eax
 58f:	89 04 24             	mov    %eax,(%esp)
 592:	e8 05 fe ff ff       	call   39c <putc>
          s++;
 597:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 59b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59e:	0f b6 00             	movzbl (%eax),%eax
 5a1:	84 c0                	test   %al,%al
 5a3:	75 da                	jne    57f <printf+0x103>
 5a5:	eb 68                	jmp    60f <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5a7:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5ab:	75 1d                	jne    5ca <printf+0x14e>
        putc(fd, *ap);
 5ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5b0:	8b 00                	mov    (%eax),%eax
 5b2:	0f be c0             	movsbl %al,%eax
 5b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b9:	8b 45 08             	mov    0x8(%ebp),%eax
 5bc:	89 04 24             	mov    %eax,(%esp)
 5bf:	e8 d8 fd ff ff       	call   39c <putc>
        ap++;
 5c4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c8:	eb 45                	jmp    60f <printf+0x193>
      } else if(c == '%'){
 5ca:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ce:	75 17                	jne    5e7 <printf+0x16b>
        putc(fd, c);
 5d0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5d3:	0f be c0             	movsbl %al,%eax
 5d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	89 04 24             	mov    %eax,(%esp)
 5e0:	e8 b7 fd ff ff       	call   39c <putc>
 5e5:	eb 28                	jmp    60f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5e7:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5ee:	00 
 5ef:	8b 45 08             	mov    0x8(%ebp),%eax
 5f2:	89 04 24             	mov    %eax,(%esp)
 5f5:	e8 a2 fd ff ff       	call   39c <putc>
        putc(fd, c);
 5fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5fd:	0f be c0             	movsbl %al,%eax
 600:	89 44 24 04          	mov    %eax,0x4(%esp)
 604:	8b 45 08             	mov    0x8(%ebp),%eax
 607:	89 04 24             	mov    %eax,(%esp)
 60a:	e8 8d fd ff ff       	call   39c <putc>
      }
      state = 0;
 60f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 616:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 61a:	8b 55 0c             	mov    0xc(%ebp),%edx
 61d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 620:	01 d0                	add    %edx,%eax
 622:	0f b6 00             	movzbl (%eax),%eax
 625:	84 c0                	test   %al,%al
 627:	0f 85 71 fe ff ff    	jne    49e <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 62d:	c9                   	leave  
 62e:	c3                   	ret    

0000062f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 62f:	55                   	push   %ebp
 630:	89 e5                	mov    %esp,%ebp
 632:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 635:	8b 45 08             	mov    0x8(%ebp),%eax
 638:	83 e8 08             	sub    $0x8,%eax
 63b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 63e:	a1 08 10 00 00       	mov    0x1008,%eax
 643:	89 45 fc             	mov    %eax,-0x4(%ebp)
 646:	eb 24                	jmp    66c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 648:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64b:	8b 00                	mov    (%eax),%eax
 64d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 650:	77 12                	ja     664 <free+0x35>
 652:	8b 45 f8             	mov    -0x8(%ebp),%eax
 655:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 658:	77 24                	ja     67e <free+0x4f>
 65a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65d:	8b 00                	mov    (%eax),%eax
 65f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 662:	77 1a                	ja     67e <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 664:	8b 45 fc             	mov    -0x4(%ebp),%eax
 667:	8b 00                	mov    (%eax),%eax
 669:	89 45 fc             	mov    %eax,-0x4(%ebp)
 66c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 672:	76 d4                	jbe    648 <free+0x19>
 674:	8b 45 fc             	mov    -0x4(%ebp),%eax
 677:	8b 00                	mov    (%eax),%eax
 679:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 67c:	76 ca                	jbe    648 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 67e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 681:	8b 40 04             	mov    0x4(%eax),%eax
 684:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 68b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68e:	01 c2                	add    %eax,%edx
 690:	8b 45 fc             	mov    -0x4(%ebp),%eax
 693:	8b 00                	mov    (%eax),%eax
 695:	39 c2                	cmp    %eax,%edx
 697:	75 24                	jne    6bd <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 699:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69c:	8b 50 04             	mov    0x4(%eax),%edx
 69f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a2:	8b 00                	mov    (%eax),%eax
 6a4:	8b 40 04             	mov    0x4(%eax),%eax
 6a7:	01 c2                	add    %eax,%edx
 6a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ac:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6af:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b2:	8b 00                	mov    (%eax),%eax
 6b4:	8b 10                	mov    (%eax),%edx
 6b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b9:	89 10                	mov    %edx,(%eax)
 6bb:	eb 0a                	jmp    6c7 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c0:	8b 10                	mov    (%eax),%edx
 6c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c5:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ca:	8b 40 04             	mov    0x4(%eax),%eax
 6cd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d7:	01 d0                	add    %edx,%eax
 6d9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6dc:	75 20                	jne    6fe <free+0xcf>
    p->s.size += bp->s.size;
 6de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e1:	8b 50 04             	mov    0x4(%eax),%edx
 6e4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e7:	8b 40 04             	mov    0x4(%eax),%eax
 6ea:	01 c2                	add    %eax,%edx
 6ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ef:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f5:	8b 10                	mov    (%eax),%edx
 6f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fa:	89 10                	mov    %edx,(%eax)
 6fc:	eb 08                	jmp    706 <free+0xd7>
  } else
    p->s.ptr = bp;
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	8b 55 f8             	mov    -0x8(%ebp),%edx
 704:	89 10                	mov    %edx,(%eax)
  freep = p;
 706:	8b 45 fc             	mov    -0x4(%ebp),%eax
 709:	a3 08 10 00 00       	mov    %eax,0x1008
}
 70e:	c9                   	leave  
 70f:	c3                   	ret    

00000710 <morecore>:

static Header*
morecore(uint nu)
{
 710:	55                   	push   %ebp
 711:	89 e5                	mov    %esp,%ebp
 713:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 716:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 71d:	77 07                	ja     726 <morecore+0x16>
    nu = 4096;
 71f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 726:	8b 45 08             	mov    0x8(%ebp),%eax
 729:	c1 e0 03             	shl    $0x3,%eax
 72c:	89 04 24             	mov    %eax,(%esp)
 72f:	e8 28 fc ff ff       	call   35c <sbrk>
 734:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 737:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 73b:	75 07                	jne    744 <morecore+0x34>
    return 0;
 73d:	b8 00 00 00 00       	mov    $0x0,%eax
 742:	eb 22                	jmp    766 <morecore+0x56>
  hp = (Header*)p;
 744:	8b 45 f4             	mov    -0xc(%ebp),%eax
 747:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 74a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74d:	8b 55 08             	mov    0x8(%ebp),%edx
 750:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 753:	8b 45 f0             	mov    -0x10(%ebp),%eax
 756:	83 c0 08             	add    $0x8,%eax
 759:	89 04 24             	mov    %eax,(%esp)
 75c:	e8 ce fe ff ff       	call   62f <free>
  return freep;
 761:	a1 08 10 00 00       	mov    0x1008,%eax
}
 766:	c9                   	leave  
 767:	c3                   	ret    

00000768 <malloc>:

void*
malloc(uint nbytes)
{
 768:	55                   	push   %ebp
 769:	89 e5                	mov    %esp,%ebp
 76b:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 76e:	8b 45 08             	mov    0x8(%ebp),%eax
 771:	83 c0 07             	add    $0x7,%eax
 774:	c1 e8 03             	shr    $0x3,%eax
 777:	83 c0 01             	add    $0x1,%eax
 77a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 77d:	a1 08 10 00 00       	mov    0x1008,%eax
 782:	89 45 f0             	mov    %eax,-0x10(%ebp)
 785:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 789:	75 23                	jne    7ae <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 78b:	c7 45 f0 00 10 00 00 	movl   $0x1000,-0x10(%ebp)
 792:	8b 45 f0             	mov    -0x10(%ebp),%eax
 795:	a3 08 10 00 00       	mov    %eax,0x1008
 79a:	a1 08 10 00 00       	mov    0x1008,%eax
 79f:	a3 00 10 00 00       	mov    %eax,0x1000
    base.s.size = 0;
 7a4:	c7 05 04 10 00 00 00 	movl   $0x0,0x1004
 7ab:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b1:	8b 00                	mov    (%eax),%eax
 7b3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b9:	8b 40 04             	mov    0x4(%eax),%eax
 7bc:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7bf:	72 4d                	jb     80e <malloc+0xa6>
      if(p->s.size == nunits)
 7c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c4:	8b 40 04             	mov    0x4(%eax),%eax
 7c7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7ca:	75 0c                	jne    7d8 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cf:	8b 10                	mov    (%eax),%edx
 7d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d4:	89 10                	mov    %edx,(%eax)
 7d6:	eb 26                	jmp    7fe <malloc+0x96>
      else {
        p->s.size -= nunits;
 7d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7db:	8b 40 04             	mov    0x4(%eax),%eax
 7de:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7e1:	89 c2                	mov    %eax,%edx
 7e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e6:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ec:	8b 40 04             	mov    0x4(%eax),%eax
 7ef:	c1 e0 03             	shl    $0x3,%eax
 7f2:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f8:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7fb:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 801:	a3 08 10 00 00       	mov    %eax,0x1008
      return (void*)(p + 1);
 806:	8b 45 f4             	mov    -0xc(%ebp),%eax
 809:	83 c0 08             	add    $0x8,%eax
 80c:	eb 38                	jmp    846 <malloc+0xde>
    }
    if(p == freep)
 80e:	a1 08 10 00 00       	mov    0x1008,%eax
 813:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 816:	75 1b                	jne    833 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 818:	8b 45 ec             	mov    -0x14(%ebp),%eax
 81b:	89 04 24             	mov    %eax,(%esp)
 81e:	e8 ed fe ff ff       	call   710 <morecore>
 823:	89 45 f4             	mov    %eax,-0xc(%ebp)
 826:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 82a:	75 07                	jne    833 <malloc+0xcb>
        return 0;
 82c:	b8 00 00 00 00       	mov    $0x0,%eax
 831:	eb 13                	jmp    846 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 833:	8b 45 f4             	mov    -0xc(%ebp),%eax
 836:	89 45 f0             	mov    %eax,-0x10(%ebp)
 839:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83c:	8b 00                	mov    (%eax),%eax
 83e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 841:	e9 70 ff ff ff       	jmp    7b6 <malloc+0x4e>
}
 846:	c9                   	leave  
 847:	c3                   	ret    

00000848 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 848:	55                   	push   %ebp
 849:	89 e5                	mov    %esp,%ebp
 84b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 84e:	8b 55 08             	mov    0x8(%ebp),%edx
 851:	8b 45 0c             	mov    0xc(%ebp),%eax
 854:	8b 4d 08             	mov    0x8(%ebp),%ecx
 857:	f0 87 02             	lock xchg %eax,(%edx)
 85a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 85d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 860:	c9                   	leave  
 861:	c3                   	ret    

00000862 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 862:	55                   	push   %ebp
 863:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 865:	8b 45 08             	mov    0x8(%ebp),%eax
 868:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 86e:	5d                   	pop    %ebp
 86f:	c3                   	ret    

00000870 <lock_acquire>:
void lock_acquire(lock_t *lock){
 870:	55                   	push   %ebp
 871:	89 e5                	mov    %esp,%ebp
 873:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 876:	90                   	nop
 877:	8b 45 08             	mov    0x8(%ebp),%eax
 87a:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 881:	00 
 882:	89 04 24             	mov    %eax,(%esp)
 885:	e8 be ff ff ff       	call   848 <xchg>
 88a:	85 c0                	test   %eax,%eax
 88c:	75 e9                	jne    877 <lock_acquire+0x7>
}
 88e:	c9                   	leave  
 88f:	c3                   	ret    

00000890 <lock_release>:
void lock_release(lock_t *lock){
 890:	55                   	push   %ebp
 891:	89 e5                	mov    %esp,%ebp
 893:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 896:	8b 45 08             	mov    0x8(%ebp),%eax
 899:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8a0:	00 
 8a1:	89 04 24             	mov    %eax,(%esp)
 8a4:	e8 9f ff ff ff       	call   848 <xchg>
}
 8a9:	c9                   	leave  
 8aa:	c3                   	ret    

000008ab <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 8ab:	55                   	push   %ebp
 8ac:	89 e5                	mov    %esp,%ebp
 8ae:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 8b1:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8b8:	e8 ab fe ff ff       	call   768 <malloc>
 8bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 8c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c3:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 8c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c9:	25 ff 0f 00 00       	and    $0xfff,%eax
 8ce:	85 c0                	test   %eax,%eax
 8d0:	74 14                	je     8e6 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 8d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d5:	25 ff 0f 00 00       	and    $0xfff,%eax
 8da:	89 c2                	mov    %eax,%edx
 8dc:	b8 00 10 00 00       	mov    $0x1000,%eax
 8e1:	29 d0                	sub    %edx,%eax
 8e3:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 8e6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8ea:	75 1b                	jne    907 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 8ec:	c7 44 24 04 e7 0b 00 	movl   $0xbe7,0x4(%esp)
 8f3:	00 
 8f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8fb:	e8 7c fb ff ff       	call   47c <printf>
        return 0;
 900:	b8 00 00 00 00       	mov    $0x0,%eax
 905:	eb 6f                	jmp    976 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 907:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 90a:	8b 55 08             	mov    0x8(%ebp),%edx
 90d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 910:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 914:	89 54 24 08          	mov    %edx,0x8(%esp)
 918:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 91f:	00 
 920:	89 04 24             	mov    %eax,(%esp)
 923:	e8 4c fa ff ff       	call   374 <clone>
 928:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 92b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 92f:	79 1b                	jns    94c <thread_create+0xa1>
        printf(1,"clone fails\n");
 931:	c7 44 24 04 f5 0b 00 	movl   $0xbf5,0x4(%esp)
 938:	00 
 939:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 940:	e8 37 fb ff ff       	call   47c <printf>
        return 0;
 945:	b8 00 00 00 00       	mov    $0x0,%eax
 94a:	eb 2a                	jmp    976 <thread_create+0xcb>
    }
    if(tid > 0){
 94c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 950:	7e 05                	jle    957 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 952:	8b 45 f0             	mov    -0x10(%ebp),%eax
 955:	eb 1f                	jmp    976 <thread_create+0xcb>
    }
    if(tid == 0){
 957:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 95b:	75 14                	jne    971 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 95d:	c7 44 24 04 02 0c 00 	movl   $0xc02,0x4(%esp)
 964:	00 
 965:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 96c:	e8 0b fb ff ff       	call   47c <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 971:	b8 00 00 00 00       	mov    $0x0,%eax
}
 976:	c9                   	leave  
 977:	c3                   	ret    

00000978 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 978:	55                   	push   %ebp
 979:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 97b:	8b 45 08             	mov    0x8(%ebp),%eax
 97e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 984:	8b 45 08             	mov    0x8(%ebp),%eax
 987:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 98e:	8b 45 08             	mov    0x8(%ebp),%eax
 991:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 998:	5d                   	pop    %ebp
 999:	c3                   	ret    

0000099a <add_q>:

void add_q(struct queue *q, int v){
 99a:	55                   	push   %ebp
 99b:	89 e5                	mov    %esp,%ebp
 99d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 9a0:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 9a7:	e8 bc fd ff ff       	call   768 <malloc>
 9ac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 9af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 9b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bc:	8b 55 0c             	mov    0xc(%ebp),%edx
 9bf:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 9c1:	8b 45 08             	mov    0x8(%ebp),%eax
 9c4:	8b 40 04             	mov    0x4(%eax),%eax
 9c7:	85 c0                	test   %eax,%eax
 9c9:	75 0b                	jne    9d6 <add_q+0x3c>
        q->head = n;
 9cb:	8b 45 08             	mov    0x8(%ebp),%eax
 9ce:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9d1:	89 50 04             	mov    %edx,0x4(%eax)
 9d4:	eb 0c                	jmp    9e2 <add_q+0x48>
    }else{
        q->tail->next = n;
 9d6:	8b 45 08             	mov    0x8(%ebp),%eax
 9d9:	8b 40 08             	mov    0x8(%eax),%eax
 9dc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9df:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 9e2:	8b 45 08             	mov    0x8(%ebp),%eax
 9e5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9e8:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 9eb:	8b 45 08             	mov    0x8(%ebp),%eax
 9ee:	8b 00                	mov    (%eax),%eax
 9f0:	8d 50 01             	lea    0x1(%eax),%edx
 9f3:	8b 45 08             	mov    0x8(%ebp),%eax
 9f6:	89 10                	mov    %edx,(%eax)
}
 9f8:	c9                   	leave  
 9f9:	c3                   	ret    

000009fa <empty_q>:

int empty_q(struct queue *q){
 9fa:	55                   	push   %ebp
 9fb:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 9fd:	8b 45 08             	mov    0x8(%ebp),%eax
 a00:	8b 00                	mov    (%eax),%eax
 a02:	85 c0                	test   %eax,%eax
 a04:	75 07                	jne    a0d <empty_q+0x13>
        return 1;
 a06:	b8 01 00 00 00       	mov    $0x1,%eax
 a0b:	eb 05                	jmp    a12 <empty_q+0x18>
    else
        return 0;
 a0d:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 a12:	5d                   	pop    %ebp
 a13:	c3                   	ret    

00000a14 <pop_q>:
int pop_q(struct queue *q){
 a14:	55                   	push   %ebp
 a15:	89 e5                	mov    %esp,%ebp
 a17:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a1a:	8b 45 08             	mov    0x8(%ebp),%eax
 a1d:	89 04 24             	mov    %eax,(%esp)
 a20:	e8 d5 ff ff ff       	call   9fa <empty_q>
 a25:	85 c0                	test   %eax,%eax
 a27:	75 5d                	jne    a86 <pop_q+0x72>
       val = q->head->value; 
 a29:	8b 45 08             	mov    0x8(%ebp),%eax
 a2c:	8b 40 04             	mov    0x4(%eax),%eax
 a2f:	8b 00                	mov    (%eax),%eax
 a31:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 a34:	8b 45 08             	mov    0x8(%ebp),%eax
 a37:	8b 40 04             	mov    0x4(%eax),%eax
 a3a:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 a3d:	8b 45 08             	mov    0x8(%ebp),%eax
 a40:	8b 40 04             	mov    0x4(%eax),%eax
 a43:	8b 50 04             	mov    0x4(%eax),%edx
 a46:	8b 45 08             	mov    0x8(%ebp),%eax
 a49:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a4c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a4f:	89 04 24             	mov    %eax,(%esp)
 a52:	e8 d8 fb ff ff       	call   62f <free>
       q->size--;
 a57:	8b 45 08             	mov    0x8(%ebp),%eax
 a5a:	8b 00                	mov    (%eax),%eax
 a5c:	8d 50 ff             	lea    -0x1(%eax),%edx
 a5f:	8b 45 08             	mov    0x8(%ebp),%eax
 a62:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a64:	8b 45 08             	mov    0x8(%ebp),%eax
 a67:	8b 00                	mov    (%eax),%eax
 a69:	85 c0                	test   %eax,%eax
 a6b:	75 14                	jne    a81 <pop_q+0x6d>
            q->head = 0;
 a6d:	8b 45 08             	mov    0x8(%ebp),%eax
 a70:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a77:	8b 45 08             	mov    0x8(%ebp),%eax
 a7a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a81:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a84:	eb 05                	jmp    a8b <pop_q+0x77>
    }
    return -1;
 a86:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a8b:	c9                   	leave  
 a8c:	c3                   	ret    

00000a8d <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 a8d:	55                   	push   %ebp
 a8e:	89 e5                	mov    %esp,%ebp
 a90:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 a93:	8b 45 08             	mov    0x8(%ebp),%eax
 a96:	8b 55 0c             	mov    0xc(%ebp),%edx
 a99:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 a9c:	8b 45 08             	mov    0x8(%ebp),%eax
 a9f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 aa6:	8b 45 08             	mov    0x8(%ebp),%eax
 aa9:	89 04 24             	mov    %eax,(%esp)
 aac:	e8 b1 fd ff ff       	call   862 <lock_init>
}
 ab1:	c9                   	leave  
 ab2:	c3                   	ret    

00000ab3 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 ab3:	55                   	push   %ebp
 ab4:	89 e5                	mov    %esp,%ebp
 ab6:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 ab9:	8b 45 08             	mov    0x8(%ebp),%eax
 abc:	89 04 24             	mov    %eax,(%esp)
 abf:	e8 ac fd ff ff       	call   870 <lock_acquire>
	if(s->count  == 0){
 ac4:	8b 45 08             	mov    0x8(%ebp),%eax
 ac7:	8b 40 04             	mov    0x4(%eax),%eax
 aca:	85 c0                	test   %eax,%eax
 acc:	75 43                	jne    b11 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 ace:	c7 44 24 04 13 0c 00 	movl   $0xc13,0x4(%esp)
 ad5:	00 
 ad6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 add:	e8 9a f9 ff ff       	call   47c <printf>
		//add proc to waiters list
		int tid = getpid();
 ae2:	e8 6d f8 ff ff       	call   354 <getpid>
 ae7:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 aea:	8b 45 08             	mov    0x8(%ebp),%eax
 aed:	8d 50 0c             	lea    0xc(%eax),%edx
 af0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af3:	89 44 24 04          	mov    %eax,0x4(%esp)
 af7:	89 14 24             	mov    %edx,(%esp)
 afa:	e8 9b fe ff ff       	call   99a <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 aff:	8b 45 08             	mov    0x8(%ebp),%eax
 b02:	89 04 24             	mov    %eax,(%esp)
 b05:	e8 86 fd ff ff       	call   890 <lock_release>
		tsleep(); 
 b0a:	e8 75 f8 ff ff       	call   384 <tsleep>
 b0f:	eb 2e                	jmp    b3f <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 b11:	c7 44 24 04 1a 0c 00 	movl   $0xc1a,0x4(%esp)
 b18:	00 
 b19:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b20:	e8 57 f9 ff ff       	call   47c <printf>
		s->count--;	
 b25:	8b 45 08             	mov    0x8(%ebp),%eax
 b28:	8b 40 04             	mov    0x4(%eax),%eax
 b2b:	8d 50 ff             	lea    -0x1(%eax),%edx
 b2e:	8b 45 08             	mov    0x8(%ebp),%eax
 b31:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b34:	8b 45 08             	mov    0x8(%ebp),%eax
 b37:	89 04 24             	mov    %eax,(%esp)
 b3a:	e8 51 fd ff ff       	call   890 <lock_release>
	}
}
 b3f:	c9                   	leave  
 b40:	c3                   	ret    

00000b41 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b41:	55                   	push   %ebp
 b42:	89 e5                	mov    %esp,%ebp
 b44:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 b47:	c7 44 24 04 21 0c 00 	movl   $0xc21,0x4(%esp)
 b4e:	00 
 b4f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b56:	e8 21 f9 ff ff       	call   47c <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b5b:	8b 45 08             	mov    0x8(%ebp),%eax
 b5e:	89 04 24             	mov    %eax,(%esp)
 b61:	e8 0a fd ff ff       	call   870 <lock_acquire>
	if(s->count < s->size){
 b66:	8b 45 08             	mov    0x8(%ebp),%eax
 b69:	8b 50 04             	mov    0x4(%eax),%edx
 b6c:	8b 45 08             	mov    0x8(%ebp),%eax
 b6f:	8b 40 08             	mov    0x8(%eax),%eax
 b72:	39 c2                	cmp    %eax,%edx
 b74:	7d 0f                	jge    b85 <sem_signal+0x44>
		s->count++;	
 b76:	8b 45 08             	mov    0x8(%ebp),%eax
 b79:	8b 40 04             	mov    0x4(%eax),%eax
 b7c:	8d 50 01             	lea    0x1(%eax),%edx
 b7f:	8b 45 08             	mov    0x8(%ebp),%eax
 b82:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 b85:	8b 45 08             	mov    0x8(%ebp),%eax
 b88:	83 c0 0c             	add    $0xc,%eax
 b8b:	89 04 24             	mov    %eax,(%esp)
 b8e:	e8 81 fe ff ff       	call   a14 <pop_q>
 b93:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 b96:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b9a:	74 2e                	je     bca <sem_signal+0x89>
		printf(1, "Sem A\n");
 b9c:	c7 44 24 04 1a 0c 00 	movl   $0xc1a,0x4(%esp)
 ba3:	00 
 ba4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bab:	e8 cc f8 ff ff       	call   47c <printf>
		twakeup(tid);
 bb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb3:	89 04 24             	mov    %eax,(%esp)
 bb6:	e8 d1 f7 ff ff       	call   38c <twakeup>
		s->count--;
 bbb:	8b 45 08             	mov    0x8(%ebp),%eax
 bbe:	8b 40 04             	mov    0x4(%eax),%eax
 bc1:	8d 50 ff             	lea    -0x1(%eax),%edx
 bc4:	8b 45 08             	mov    0x8(%ebp),%eax
 bc7:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 bca:	8b 45 08             	mov    0x8(%ebp),%eax
 bcd:	89 04 24             	mov    %eax,(%esp)
 bd0:	e8 bb fc ff ff       	call   890 <lock_release>

 bd5:	c9                   	leave  
 bd6:	c3                   	ret    
