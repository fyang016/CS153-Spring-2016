
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
  11:	eb 45                	jmp    58 <main+0x58>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  13:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  17:	83 c0 01             	add    $0x1,%eax
  1a:	3b 45 08             	cmp    0x8(%ebp),%eax
  1d:	7d 07                	jge    26 <main+0x26>
  1f:	b8 c6 0b 00 00       	mov    $0xbc6,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 c8 0b 00 00       	mov    $0xbc8,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	c1 e2 02             	shl    $0x2,%edx
  32:	03 55 0c             	add    0xc(%ebp),%edx
  35:	8b 12                	mov    (%edx),%edx
  37:	89 44 24 0c          	mov    %eax,0xc(%esp)
  3b:	89 54 24 08          	mov    %edx,0x8(%esp)
  3f:	c7 44 24 04 ca 0b 00 	movl   $0xbca,0x4(%esp)
  46:	00 
  47:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4e:	e8 1a 04 00 00       	call   46d <printf>
int
main(int argc, char *argv[])
{
  int i;

  for(i = 1; i < argc; i++)
  53:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  58:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  5c:	3b 45 08             	cmp    0x8(%ebp),%eax
  5f:	7c b2                	jl     13 <main+0x13>
    printf(1, "%s%s", argv[i], i+1 < argc ? " " : "\n");
  exit();
  61:	e8 66 02 00 00       	call   2cc <exit>
  66:	90                   	nop
  67:	90                   	nop

00000068 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  68:	55                   	push   %ebp
  69:	89 e5                	mov    %esp,%ebp
  6b:	57                   	push   %edi
  6c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  6d:	8b 4d 08             	mov    0x8(%ebp),%ecx
  70:	8b 55 10             	mov    0x10(%ebp),%edx
  73:	8b 45 0c             	mov    0xc(%ebp),%eax
  76:	89 cb                	mov    %ecx,%ebx
  78:	89 df                	mov    %ebx,%edi
  7a:	89 d1                	mov    %edx,%ecx
  7c:	fc                   	cld    
  7d:	f3 aa                	rep stos %al,%es:(%edi)
  7f:	89 ca                	mov    %ecx,%edx
  81:	89 fb                	mov    %edi,%ebx
  83:	89 5d 08             	mov    %ebx,0x8(%ebp)
  86:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  89:	5b                   	pop    %ebx
  8a:	5f                   	pop    %edi
  8b:	5d                   	pop    %ebp
  8c:	c3                   	ret    

0000008d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  8d:	55                   	push   %ebp
  8e:	89 e5                	mov    %esp,%ebp
  90:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  93:	8b 45 08             	mov    0x8(%ebp),%eax
  96:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  99:	8b 45 0c             	mov    0xc(%ebp),%eax
  9c:	0f b6 10             	movzbl (%eax),%edx
  9f:	8b 45 08             	mov    0x8(%ebp),%eax
  a2:	88 10                	mov    %dl,(%eax)
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	0f b6 00             	movzbl (%eax),%eax
  aa:	84 c0                	test   %al,%al
  ac:	0f 95 c0             	setne  %al
  af:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  b3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  b7:	84 c0                	test   %al,%al
  b9:	75 de                	jne    99 <strcpy+0xc>
    ;
  return os;
  bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  be:	c9                   	leave  
  bf:	c3                   	ret    

000000c0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c0:	55                   	push   %ebp
  c1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  c3:	eb 08                	jmp    cd <strcmp+0xd>
    p++, q++;
  c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  cd:	8b 45 08             	mov    0x8(%ebp),%eax
  d0:	0f b6 00             	movzbl (%eax),%eax
  d3:	84 c0                	test   %al,%al
  d5:	74 10                	je     e7 <strcmp+0x27>
  d7:	8b 45 08             	mov    0x8(%ebp),%eax
  da:	0f b6 10             	movzbl (%eax),%edx
  dd:	8b 45 0c             	mov    0xc(%ebp),%eax
  e0:	0f b6 00             	movzbl (%eax),%eax
  e3:	38 c2                	cmp    %al,%dl
  e5:	74 de                	je     c5 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  e7:	8b 45 08             	mov    0x8(%ebp),%eax
  ea:	0f b6 00             	movzbl (%eax),%eax
  ed:	0f b6 d0             	movzbl %al,%edx
  f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  f3:	0f b6 00             	movzbl (%eax),%eax
  f6:	0f b6 c0             	movzbl %al,%eax
  f9:	89 d1                	mov    %edx,%ecx
  fb:	29 c1                	sub    %eax,%ecx
  fd:	89 c8                	mov    %ecx,%eax
}
  ff:	5d                   	pop    %ebp
 100:	c3                   	ret    

00000101 <strlen>:

uint
strlen(char *s)
{
 101:	55                   	push   %ebp
 102:	89 e5                	mov    %esp,%ebp
 104:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 107:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 10e:	eb 04                	jmp    114 <strlen+0x13>
 110:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 114:	8b 45 fc             	mov    -0x4(%ebp),%eax
 117:	03 45 08             	add    0x8(%ebp),%eax
 11a:	0f b6 00             	movzbl (%eax),%eax
 11d:	84 c0                	test   %al,%al
 11f:	75 ef                	jne    110 <strlen+0xf>
    ;
  return n;
 121:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 124:	c9                   	leave  
 125:	c3                   	ret    

00000126 <memset>:

void*
memset(void *dst, int c, uint n)
{
 126:	55                   	push   %ebp
 127:	89 e5                	mov    %esp,%ebp
 129:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 12c:	8b 45 10             	mov    0x10(%ebp),%eax
 12f:	89 44 24 08          	mov    %eax,0x8(%esp)
 133:	8b 45 0c             	mov    0xc(%ebp),%eax
 136:	89 44 24 04          	mov    %eax,0x4(%esp)
 13a:	8b 45 08             	mov    0x8(%ebp),%eax
 13d:	89 04 24             	mov    %eax,(%esp)
 140:	e8 23 ff ff ff       	call   68 <stosb>
  return dst;
 145:	8b 45 08             	mov    0x8(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <strchr>:

char*
strchr(const char *s, char c)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 04             	sub    $0x4,%esp
 150:	8b 45 0c             	mov    0xc(%ebp),%eax
 153:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 156:	eb 14                	jmp    16c <strchr+0x22>
    if(*s == c)
 158:	8b 45 08             	mov    0x8(%ebp),%eax
 15b:	0f b6 00             	movzbl (%eax),%eax
 15e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 161:	75 05                	jne    168 <strchr+0x1e>
      return (char*)s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	eb 13                	jmp    17b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 168:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	0f b6 00             	movzbl (%eax),%eax
 172:	84 c0                	test   %al,%al
 174:	75 e2                	jne    158 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 176:	b8 00 00 00 00       	mov    $0x0,%eax
}
 17b:	c9                   	leave  
 17c:	c3                   	ret    

0000017d <gets>:

char*
gets(char *buf, int max)
{
 17d:	55                   	push   %ebp
 17e:	89 e5                	mov    %esp,%ebp
 180:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 183:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 18a:	eb 44                	jmp    1d0 <gets+0x53>
    cc = read(0, &c, 1);
 18c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 193:	00 
 194:	8d 45 ef             	lea    -0x11(%ebp),%eax
 197:	89 44 24 04          	mov    %eax,0x4(%esp)
 19b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1a2:	e8 3d 01 00 00       	call   2e4 <read>
 1a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 1aa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1ae:	7e 2d                	jle    1dd <gets+0x60>
      break;
    buf[i++] = c;
 1b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1b3:	03 45 08             	add    0x8(%ebp),%eax
 1b6:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1ba:	88 10                	mov    %dl,(%eax)
 1bc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 1c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c4:	3c 0a                	cmp    $0xa,%al
 1c6:	74 16                	je     1de <gets+0x61>
 1c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cc:	3c 0d                	cmp    $0xd,%al
 1ce:	74 0e                	je     1de <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1d3:	83 c0 01             	add    $0x1,%eax
 1d6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d9:	7c b1                	jl     18c <gets+0xf>
 1db:	eb 01                	jmp    1de <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1dd:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1e1:	03 45 08             	add    0x8(%ebp),%eax
 1e4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ea:	c9                   	leave  
 1eb:	c3                   	ret    

000001ec <stat>:

int
stat(char *n, struct stat *st)
{
 1ec:	55                   	push   %ebp
 1ed:	89 e5                	mov    %esp,%ebp
 1ef:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1f2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1f9:	00 
 1fa:	8b 45 08             	mov    0x8(%ebp),%eax
 1fd:	89 04 24             	mov    %eax,(%esp)
 200:	e8 07 01 00 00       	call   30c <open>
 205:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 208:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 20c:	79 07                	jns    215 <stat+0x29>
    return -1;
 20e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 213:	eb 23                	jmp    238 <stat+0x4c>
  r = fstat(fd, st);
 215:	8b 45 0c             	mov    0xc(%ebp),%eax
 218:	89 44 24 04          	mov    %eax,0x4(%esp)
 21c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 21f:	89 04 24             	mov    %eax,(%esp)
 222:	e8 fd 00 00 00       	call   324 <fstat>
 227:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 22a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 22d:	89 04 24             	mov    %eax,(%esp)
 230:	e8 bf 00 00 00       	call   2f4 <close>
  return r;
 235:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 238:	c9                   	leave  
 239:	c3                   	ret    

0000023a <atoi>:

int
atoi(const char *s)
{
 23a:	55                   	push   %ebp
 23b:	89 e5                	mov    %esp,%ebp
 23d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 240:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 247:	eb 24                	jmp    26d <atoi+0x33>
    n = n*10 + *s++ - '0';
 249:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24c:	89 d0                	mov    %edx,%eax
 24e:	c1 e0 02             	shl    $0x2,%eax
 251:	01 d0                	add    %edx,%eax
 253:	01 c0                	add    %eax,%eax
 255:	89 c2                	mov    %eax,%edx
 257:	8b 45 08             	mov    0x8(%ebp),%eax
 25a:	0f b6 00             	movzbl (%eax),%eax
 25d:	0f be c0             	movsbl %al,%eax
 260:	8d 04 02             	lea    (%edx,%eax,1),%eax
 263:	83 e8 30             	sub    $0x30,%eax
 266:	89 45 fc             	mov    %eax,-0x4(%ebp)
 269:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 26d:	8b 45 08             	mov    0x8(%ebp),%eax
 270:	0f b6 00             	movzbl (%eax),%eax
 273:	3c 2f                	cmp    $0x2f,%al
 275:	7e 0a                	jle    281 <atoi+0x47>
 277:	8b 45 08             	mov    0x8(%ebp),%eax
 27a:	0f b6 00             	movzbl (%eax),%eax
 27d:	3c 39                	cmp    $0x39,%al
 27f:	7e c8                	jle    249 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 281:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 284:	c9                   	leave  
 285:	c3                   	ret    

00000286 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 286:	55                   	push   %ebp
 287:	89 e5                	mov    %esp,%ebp
 289:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 28c:	8b 45 08             	mov    0x8(%ebp),%eax
 28f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 292:	8b 45 0c             	mov    0xc(%ebp),%eax
 295:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 298:	eb 13                	jmp    2ad <memmove+0x27>
    *dst++ = *src++;
 29a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 29d:	0f b6 10             	movzbl (%eax),%edx
 2a0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2a3:	88 10                	mov    %dl,(%eax)
 2a5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 2a9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2ad:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2b1:	0f 9f c0             	setg   %al
 2b4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2b8:	84 c0                	test   %al,%al
 2ba:	75 de                	jne    29a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2bc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2bf:	c9                   	leave  
 2c0:	c3                   	ret    
 2c1:	90                   	nop
 2c2:	90                   	nop
 2c3:	90                   	nop

000002c4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c4:	b8 01 00 00 00       	mov    $0x1,%eax
 2c9:	cd 40                	int    $0x40
 2cb:	c3                   	ret    

000002cc <exit>:
SYSCALL(exit)
 2cc:	b8 02 00 00 00       	mov    $0x2,%eax
 2d1:	cd 40                	int    $0x40
 2d3:	c3                   	ret    

000002d4 <wait>:
SYSCALL(wait)
 2d4:	b8 03 00 00 00       	mov    $0x3,%eax
 2d9:	cd 40                	int    $0x40
 2db:	c3                   	ret    

000002dc <pipe>:
SYSCALL(pipe)
 2dc:	b8 04 00 00 00       	mov    $0x4,%eax
 2e1:	cd 40                	int    $0x40
 2e3:	c3                   	ret    

000002e4 <read>:
SYSCALL(read)
 2e4:	b8 05 00 00 00       	mov    $0x5,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <write>:
SYSCALL(write)
 2ec:	b8 10 00 00 00       	mov    $0x10,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <close>:
SYSCALL(close)
 2f4:	b8 15 00 00 00       	mov    $0x15,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <kill>:
SYSCALL(kill)
 2fc:	b8 06 00 00 00       	mov    $0x6,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <exec>:
SYSCALL(exec)
 304:	b8 07 00 00 00       	mov    $0x7,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <open>:
SYSCALL(open)
 30c:	b8 0f 00 00 00       	mov    $0xf,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <mknod>:
SYSCALL(mknod)
 314:	b8 11 00 00 00       	mov    $0x11,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <unlink>:
SYSCALL(unlink)
 31c:	b8 12 00 00 00       	mov    $0x12,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <fstat>:
SYSCALL(fstat)
 324:	b8 08 00 00 00       	mov    $0x8,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <link>:
SYSCALL(link)
 32c:	b8 13 00 00 00       	mov    $0x13,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <mkdir>:
SYSCALL(mkdir)
 334:	b8 14 00 00 00       	mov    $0x14,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <chdir>:
SYSCALL(chdir)
 33c:	b8 09 00 00 00       	mov    $0x9,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <dup>:
SYSCALL(dup)
 344:	b8 0a 00 00 00       	mov    $0xa,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <getpid>:
SYSCALL(getpid)
 34c:	b8 0b 00 00 00       	mov    $0xb,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <sbrk>:
SYSCALL(sbrk)
 354:	b8 0c 00 00 00       	mov    $0xc,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <sleep>:
SYSCALL(sleep)
 35c:	b8 0d 00 00 00       	mov    $0xd,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <uptime>:
SYSCALL(uptime)
 364:	b8 0e 00 00 00       	mov    $0xe,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <clone>:
SYSCALL(clone)
 36c:	b8 16 00 00 00       	mov    $0x16,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <texit>:
SYSCALL(texit)
 374:	b8 17 00 00 00       	mov    $0x17,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <tsleep>:
SYSCALL(tsleep)
 37c:	b8 18 00 00 00       	mov    $0x18,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <twakeup>:
SYSCALL(twakeup)
 384:	b8 19 00 00 00       	mov    $0x19,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <test>:
SYSCALL(test)
 38c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 394:	55                   	push   %ebp
 395:	89 e5                	mov    %esp,%ebp
 397:	83 ec 28             	sub    $0x28,%esp
 39a:	8b 45 0c             	mov    0xc(%ebp),%eax
 39d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3a7:	00 
 3a8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 3af:	8b 45 08             	mov    0x8(%ebp),%eax
 3b2:	89 04 24             	mov    %eax,(%esp)
 3b5:	e8 32 ff ff ff       	call   2ec <write>
}
 3ba:	c9                   	leave  
 3bb:	c3                   	ret    

000003bc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3bc:	55                   	push   %ebp
 3bd:	89 e5                	mov    %esp,%ebp
 3bf:	53                   	push   %ebx
 3c0:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3c3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3ca:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3ce:	74 17                	je     3e7 <printint+0x2b>
 3d0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3d4:	79 11                	jns    3e7 <printint+0x2b>
    neg = 1;
 3d6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3dd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e0:	f7 d8                	neg    %eax
 3e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3e5:	eb 06                	jmp    3ed <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ea:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3ed:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3f4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3f7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3fd:	ba 00 00 00 00       	mov    $0x0,%edx
 402:	f7 f3                	div    %ebx
 404:	89 d0                	mov    %edx,%eax
 406:	0f b6 80 18 0c 00 00 	movzbl 0xc18(%eax),%eax
 40d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 411:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 415:	8b 45 10             	mov    0x10(%ebp),%eax
 418:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 41b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41e:	ba 00 00 00 00       	mov    $0x0,%edx
 423:	f7 75 d4             	divl   -0x2c(%ebp)
 426:	89 45 f4             	mov    %eax,-0xc(%ebp)
 429:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 42d:	75 c5                	jne    3f4 <printint+0x38>
  if(neg)
 42f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 433:	74 28                	je     45d <printint+0xa1>
    buf[i++] = '-';
 435:	8b 45 ec             	mov    -0x14(%ebp),%eax
 438:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 43d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 441:	eb 1a                	jmp    45d <printint+0xa1>
    putc(fd, buf[i]);
 443:	8b 45 ec             	mov    -0x14(%ebp),%eax
 446:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 44b:	0f be c0             	movsbl %al,%eax
 44e:	89 44 24 04          	mov    %eax,0x4(%esp)
 452:	8b 45 08             	mov    0x8(%ebp),%eax
 455:	89 04 24             	mov    %eax,(%esp)
 458:	e8 37 ff ff ff       	call   394 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 45d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 461:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 465:	79 dc                	jns    443 <printint+0x87>
    putc(fd, buf[i]);
}
 467:	83 c4 44             	add    $0x44,%esp
 46a:	5b                   	pop    %ebx
 46b:	5d                   	pop    %ebp
 46c:	c3                   	ret    

0000046d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 46d:	55                   	push   %ebp
 46e:	89 e5                	mov    %esp,%ebp
 470:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 473:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 47a:	8d 45 0c             	lea    0xc(%ebp),%eax
 47d:	83 c0 04             	add    $0x4,%eax
 480:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 483:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 48a:	e9 7e 01 00 00       	jmp    60d <printf+0x1a0>
    c = fmt[i] & 0xff;
 48f:	8b 55 0c             	mov    0xc(%ebp),%edx
 492:	8b 45 ec             	mov    -0x14(%ebp),%eax
 495:	8d 04 02             	lea    (%edx,%eax,1),%eax
 498:	0f b6 00             	movzbl (%eax),%eax
 49b:	0f be c0             	movsbl %al,%eax
 49e:	25 ff 00 00 00       	and    $0xff,%eax
 4a3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 4a6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4aa:	75 2c                	jne    4d8 <printf+0x6b>
      if(c == '%'){
 4ac:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 4b0:	75 0c                	jne    4be <printf+0x51>
        state = '%';
 4b2:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 4b9:	e9 4b 01 00 00       	jmp    609 <printf+0x19c>
      } else {
        putc(fd, c);
 4be:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4c1:	0f be c0             	movsbl %al,%eax
 4c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c8:	8b 45 08             	mov    0x8(%ebp),%eax
 4cb:	89 04 24             	mov    %eax,(%esp)
 4ce:	e8 c1 fe ff ff       	call   394 <putc>
 4d3:	e9 31 01 00 00       	jmp    609 <printf+0x19c>
      }
    } else if(state == '%'){
 4d8:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4dc:	0f 85 27 01 00 00    	jne    609 <printf+0x19c>
      if(c == 'd'){
 4e2:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4e6:	75 2d                	jne    515 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4e8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4eb:	8b 00                	mov    (%eax),%eax
 4ed:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4f4:	00 
 4f5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4fc:	00 
 4fd:	89 44 24 04          	mov    %eax,0x4(%esp)
 501:	8b 45 08             	mov    0x8(%ebp),%eax
 504:	89 04 24             	mov    %eax,(%esp)
 507:	e8 b0 fe ff ff       	call   3bc <printint>
        ap++;
 50c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 510:	e9 ed 00 00 00       	jmp    602 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 515:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 519:	74 06                	je     521 <printf+0xb4>
 51b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 51f:	75 2d                	jne    54e <printf+0xe1>
        printint(fd, *ap, 16, 0);
 521:	8b 45 f4             	mov    -0xc(%ebp),%eax
 524:	8b 00                	mov    (%eax),%eax
 526:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 52d:	00 
 52e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 535:	00 
 536:	89 44 24 04          	mov    %eax,0x4(%esp)
 53a:	8b 45 08             	mov    0x8(%ebp),%eax
 53d:	89 04 24             	mov    %eax,(%esp)
 540:	e8 77 fe ff ff       	call   3bc <printint>
        ap++;
 545:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 549:	e9 b4 00 00 00       	jmp    602 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 54e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 552:	75 46                	jne    59a <printf+0x12d>
        s = (char*)*ap;
 554:	8b 45 f4             	mov    -0xc(%ebp),%eax
 557:	8b 00                	mov    (%eax),%eax
 559:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 55c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 560:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 564:	75 27                	jne    58d <printf+0x120>
          s = "(null)";
 566:	c7 45 e4 cf 0b 00 00 	movl   $0xbcf,-0x1c(%ebp)
        while(*s != 0){
 56d:	eb 1f                	jmp    58e <printf+0x121>
          putc(fd, *s);
 56f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 572:	0f b6 00             	movzbl (%eax),%eax
 575:	0f be c0             	movsbl %al,%eax
 578:	89 44 24 04          	mov    %eax,0x4(%esp)
 57c:	8b 45 08             	mov    0x8(%ebp),%eax
 57f:	89 04 24             	mov    %eax,(%esp)
 582:	e8 0d fe ff ff       	call   394 <putc>
          s++;
 587:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 58b:	eb 01                	jmp    58e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 58d:	90                   	nop
 58e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 591:	0f b6 00             	movzbl (%eax),%eax
 594:	84 c0                	test   %al,%al
 596:	75 d7                	jne    56f <printf+0x102>
 598:	eb 68                	jmp    602 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 59a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 59e:	75 1d                	jne    5bd <printf+0x150>
        putc(fd, *ap);
 5a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a3:	8b 00                	mov    (%eax),%eax
 5a5:	0f be c0             	movsbl %al,%eax
 5a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ac:	8b 45 08             	mov    0x8(%ebp),%eax
 5af:	89 04 24             	mov    %eax,(%esp)
 5b2:	e8 dd fd ff ff       	call   394 <putc>
        ap++;
 5b7:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5bb:	eb 45                	jmp    602 <printf+0x195>
      } else if(c == '%'){
 5bd:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5c1:	75 17                	jne    5da <printf+0x16d>
        putc(fd, c);
 5c3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5c6:	0f be c0             	movsbl %al,%eax
 5c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
 5d0:	89 04 24             	mov    %eax,(%esp)
 5d3:	e8 bc fd ff ff       	call   394 <putc>
 5d8:	eb 28                	jmp    602 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5da:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5e1:	00 
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
 5e5:	89 04 24             	mov    %eax,(%esp)
 5e8:	e8 a7 fd ff ff       	call   394 <putc>
        putc(fd, c);
 5ed:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f0:	0f be c0             	movsbl %al,%eax
 5f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f7:	8b 45 08             	mov    0x8(%ebp),%eax
 5fa:	89 04 24             	mov    %eax,(%esp)
 5fd:	e8 92 fd ff ff       	call   394 <putc>
      }
      state = 0;
 602:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 609:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 60d:	8b 55 0c             	mov    0xc(%ebp),%edx
 610:	8b 45 ec             	mov    -0x14(%ebp),%eax
 613:	8d 04 02             	lea    (%edx,%eax,1),%eax
 616:	0f b6 00             	movzbl (%eax),%eax
 619:	84 c0                	test   %al,%al
 61b:	0f 85 6e fe ff ff    	jne    48f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 621:	c9                   	leave  
 622:	c3                   	ret    
 623:	90                   	nop

00000624 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 624:	55                   	push   %ebp
 625:	89 e5                	mov    %esp,%ebp
 627:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 62a:	8b 45 08             	mov    0x8(%ebp),%eax
 62d:	83 e8 08             	sub    $0x8,%eax
 630:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 633:	a1 34 0c 00 00       	mov    0xc34,%eax
 638:	89 45 fc             	mov    %eax,-0x4(%ebp)
 63b:	eb 24                	jmp    661 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 63d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 640:	8b 00                	mov    (%eax),%eax
 642:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 645:	77 12                	ja     659 <free+0x35>
 647:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 64d:	77 24                	ja     673 <free+0x4f>
 64f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 652:	8b 00                	mov    (%eax),%eax
 654:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 657:	77 1a                	ja     673 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 659:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65c:	8b 00                	mov    (%eax),%eax
 65e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 661:	8b 45 f8             	mov    -0x8(%ebp),%eax
 664:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 667:	76 d4                	jbe    63d <free+0x19>
 669:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66c:	8b 00                	mov    (%eax),%eax
 66e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 671:	76 ca                	jbe    63d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 673:	8b 45 f8             	mov    -0x8(%ebp),%eax
 676:	8b 40 04             	mov    0x4(%eax),%eax
 679:	c1 e0 03             	shl    $0x3,%eax
 67c:	89 c2                	mov    %eax,%edx
 67e:	03 55 f8             	add    -0x8(%ebp),%edx
 681:	8b 45 fc             	mov    -0x4(%ebp),%eax
 684:	8b 00                	mov    (%eax),%eax
 686:	39 c2                	cmp    %eax,%edx
 688:	75 24                	jne    6ae <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 68a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68d:	8b 50 04             	mov    0x4(%eax),%edx
 690:	8b 45 fc             	mov    -0x4(%ebp),%eax
 693:	8b 00                	mov    (%eax),%eax
 695:	8b 40 04             	mov    0x4(%eax),%eax
 698:	01 c2                	add    %eax,%edx
 69a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a3:	8b 00                	mov    (%eax),%eax
 6a5:	8b 10                	mov    (%eax),%edx
 6a7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6aa:	89 10                	mov    %edx,(%eax)
 6ac:	eb 0a                	jmp    6b8 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 6ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b1:	8b 10                	mov    (%eax),%edx
 6b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bb:	8b 40 04             	mov    0x4(%eax),%eax
 6be:	c1 e0 03             	shl    $0x3,%eax
 6c1:	03 45 fc             	add    -0x4(%ebp),%eax
 6c4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6c7:	75 20                	jne    6e9 <free+0xc5>
    p->s.size += bp->s.size;
 6c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cc:	8b 50 04             	mov    0x4(%eax),%edx
 6cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d2:	8b 40 04             	mov    0x4(%eax),%eax
 6d5:	01 c2                	add    %eax,%edx
 6d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6da:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6dd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e0:	8b 10                	mov    (%eax),%edx
 6e2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e5:	89 10                	mov    %edx,(%eax)
 6e7:	eb 08                	jmp    6f1 <free+0xcd>
  } else
    p->s.ptr = bp;
 6e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ec:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6ef:	89 10                	mov    %edx,(%eax)
  freep = p;
 6f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f4:	a3 34 0c 00 00       	mov    %eax,0xc34
}
 6f9:	c9                   	leave  
 6fa:	c3                   	ret    

000006fb <morecore>:

static Header*
morecore(uint nu)
{
 6fb:	55                   	push   %ebp
 6fc:	89 e5                	mov    %esp,%ebp
 6fe:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 701:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 708:	77 07                	ja     711 <morecore+0x16>
    nu = 4096;
 70a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 711:	8b 45 08             	mov    0x8(%ebp),%eax
 714:	c1 e0 03             	shl    $0x3,%eax
 717:	89 04 24             	mov    %eax,(%esp)
 71a:	e8 35 fc ff ff       	call   354 <sbrk>
 71f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 722:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 726:	75 07                	jne    72f <morecore+0x34>
    return 0;
 728:	b8 00 00 00 00       	mov    $0x0,%eax
 72d:	eb 22                	jmp    751 <morecore+0x56>
  hp = (Header*)p;
 72f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 732:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 735:	8b 45 f4             	mov    -0xc(%ebp),%eax
 738:	8b 55 08             	mov    0x8(%ebp),%edx
 73b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 73e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 741:	83 c0 08             	add    $0x8,%eax
 744:	89 04 24             	mov    %eax,(%esp)
 747:	e8 d8 fe ff ff       	call   624 <free>
  return freep;
 74c:	a1 34 0c 00 00       	mov    0xc34,%eax
}
 751:	c9                   	leave  
 752:	c3                   	ret    

00000753 <malloc>:

void*
malloc(uint nbytes)
{
 753:	55                   	push   %ebp
 754:	89 e5                	mov    %esp,%ebp
 756:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 759:	8b 45 08             	mov    0x8(%ebp),%eax
 75c:	83 c0 07             	add    $0x7,%eax
 75f:	c1 e8 03             	shr    $0x3,%eax
 762:	83 c0 01             	add    $0x1,%eax
 765:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 768:	a1 34 0c 00 00       	mov    0xc34,%eax
 76d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 770:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 774:	75 23                	jne    799 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 776:	c7 45 f0 2c 0c 00 00 	movl   $0xc2c,-0x10(%ebp)
 77d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 780:	a3 34 0c 00 00       	mov    %eax,0xc34
 785:	a1 34 0c 00 00       	mov    0xc34,%eax
 78a:	a3 2c 0c 00 00       	mov    %eax,0xc2c
    base.s.size = 0;
 78f:	c7 05 30 0c 00 00 00 	movl   $0x0,0xc30
 796:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 799:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79c:	8b 00                	mov    (%eax),%eax
 79e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 7a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a4:	8b 40 04             	mov    0x4(%eax),%eax
 7a7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7aa:	72 4d                	jb     7f9 <malloc+0xa6>
      if(p->s.size == nunits)
 7ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7af:	8b 40 04             	mov    0x4(%eax),%eax
 7b2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7b5:	75 0c                	jne    7c3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ba:	8b 10                	mov    (%eax),%edx
 7bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7bf:	89 10                	mov    %edx,(%eax)
 7c1:	eb 26                	jmp    7e9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7c3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c6:	8b 40 04             	mov    0x4(%eax),%eax
 7c9:	89 c2                	mov    %eax,%edx
 7cb:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d7:	8b 40 04             	mov    0x4(%eax),%eax
 7da:	c1 e0 03             	shl    $0x3,%eax
 7dd:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7e3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7e6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ec:	a3 34 0c 00 00       	mov    %eax,0xc34
      return (void*)(p + 1);
 7f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f4:	83 c0 08             	add    $0x8,%eax
 7f7:	eb 38                	jmp    831 <malloc+0xde>
    }
    if(p == freep)
 7f9:	a1 34 0c 00 00       	mov    0xc34,%eax
 7fe:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 801:	75 1b                	jne    81e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 803:	8b 45 f4             	mov    -0xc(%ebp),%eax
 806:	89 04 24             	mov    %eax,(%esp)
 809:	e8 ed fe ff ff       	call   6fb <morecore>
 80e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 811:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 815:	75 07                	jne    81e <malloc+0xcb>
        return 0;
 817:	b8 00 00 00 00       	mov    $0x0,%eax
 81c:	eb 13                	jmp    831 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 81e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 821:	89 45 f0             	mov    %eax,-0x10(%ebp)
 824:	8b 45 ec             	mov    -0x14(%ebp),%eax
 827:	8b 00                	mov    (%eax),%eax
 829:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 82c:	e9 70 ff ff ff       	jmp    7a1 <malloc+0x4e>
}
 831:	c9                   	leave  
 832:	c3                   	ret    
 833:	90                   	nop

00000834 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 834:	55                   	push   %ebp
 835:	89 e5                	mov    %esp,%ebp
 837:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 83a:	8b 55 08             	mov    0x8(%ebp),%edx
 83d:	8b 45 0c             	mov    0xc(%ebp),%eax
 840:	8b 4d 08             	mov    0x8(%ebp),%ecx
 843:	f0 87 02             	lock xchg %eax,(%edx)
 846:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 849:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 84c:	c9                   	leave  
 84d:	c3                   	ret    

0000084e <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 84e:	55                   	push   %ebp
 84f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 851:	8b 45 08             	mov    0x8(%ebp),%eax
 854:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 85a:	5d                   	pop    %ebp
 85b:	c3                   	ret    

0000085c <lock_acquire>:
void lock_acquire(lock_t *lock){
 85c:	55                   	push   %ebp
 85d:	89 e5                	mov    %esp,%ebp
 85f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 862:	8b 45 08             	mov    0x8(%ebp),%eax
 865:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 86c:	00 
 86d:	89 04 24             	mov    %eax,(%esp)
 870:	e8 bf ff ff ff       	call   834 <xchg>
 875:	85 c0                	test   %eax,%eax
 877:	75 e9                	jne    862 <lock_acquire+0x6>
}
 879:	c9                   	leave  
 87a:	c3                   	ret    

0000087b <lock_release>:
void lock_release(lock_t *lock){
 87b:	55                   	push   %ebp
 87c:	89 e5                	mov    %esp,%ebp
 87e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 881:	8b 45 08             	mov    0x8(%ebp),%eax
 884:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 88b:	00 
 88c:	89 04 24             	mov    %eax,(%esp)
 88f:	e8 a0 ff ff ff       	call   834 <xchg>
}
 894:	c9                   	leave  
 895:	c3                   	ret    

00000896 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 896:	55                   	push   %ebp
 897:	89 e5                	mov    %esp,%ebp
 899:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 89c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8a3:	e8 ab fe ff ff       	call   753 <malloc>
 8a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 8ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 8b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b4:	25 ff 0f 00 00       	and    $0xfff,%eax
 8b9:	85 c0                	test   %eax,%eax
 8bb:	74 15                	je     8d2 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 8bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c0:	89 c2                	mov    %eax,%edx
 8c2:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 8c8:	b8 00 10 00 00       	mov    $0x1000,%eax
 8cd:	29 d0                	sub    %edx,%eax
 8cf:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 8d2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8d6:	75 1b                	jne    8f3 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 8d8:	c7 44 24 04 d6 0b 00 	movl   $0xbd6,0x4(%esp)
 8df:	00 
 8e0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8e7:	e8 81 fb ff ff       	call   46d <printf>
        return 0;
 8ec:	b8 00 00 00 00       	mov    $0x0,%eax
 8f1:	eb 6f                	jmp    962 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 8f3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8f6:	8b 55 08             	mov    0x8(%ebp),%edx
 8f9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fc:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 900:	89 54 24 08          	mov    %edx,0x8(%esp)
 904:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 90b:	00 
 90c:	89 04 24             	mov    %eax,(%esp)
 90f:	e8 58 fa ff ff       	call   36c <clone>
 914:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 917:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 91b:	79 1b                	jns    938 <thread_create+0xa2>
        printf(1,"clone fails\n");
 91d:	c7 44 24 04 e4 0b 00 	movl   $0xbe4,0x4(%esp)
 924:	00 
 925:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 92c:	e8 3c fb ff ff       	call   46d <printf>
        return 0;
 931:	b8 00 00 00 00       	mov    $0x0,%eax
 936:	eb 2a                	jmp    962 <thread_create+0xcc>
    }
    if(tid > 0){
 938:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 93c:	7e 05                	jle    943 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 93e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 941:	eb 1f                	jmp    962 <thread_create+0xcc>
    }
    if(tid == 0){
 943:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 947:	75 14                	jne    95d <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 949:	c7 44 24 04 f1 0b 00 	movl   $0xbf1,0x4(%esp)
 950:	00 
 951:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 958:	e8 10 fb ff ff       	call   46d <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 95d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 962:	c9                   	leave  
 963:	c3                   	ret    

00000964 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 964:	55                   	push   %ebp
 965:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 967:	8b 45 08             	mov    0x8(%ebp),%eax
 96a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 970:	8b 45 08             	mov    0x8(%ebp),%eax
 973:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 97a:	8b 45 08             	mov    0x8(%ebp),%eax
 97d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 984:	5d                   	pop    %ebp
 985:	c3                   	ret    

00000986 <add_q>:

void add_q(struct queue *q, int v){
 986:	55                   	push   %ebp
 987:	89 e5                	mov    %esp,%ebp
 989:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 98c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 993:	e8 bb fd ff ff       	call   753 <malloc>
 998:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 99b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 9a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a8:	8b 55 0c             	mov    0xc(%ebp),%edx
 9ab:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 9ad:	8b 45 08             	mov    0x8(%ebp),%eax
 9b0:	8b 40 04             	mov    0x4(%eax),%eax
 9b3:	85 c0                	test   %eax,%eax
 9b5:	75 0b                	jne    9c2 <add_q+0x3c>
        q->head = n;
 9b7:	8b 45 08             	mov    0x8(%ebp),%eax
 9ba:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9bd:	89 50 04             	mov    %edx,0x4(%eax)
 9c0:	eb 0c                	jmp    9ce <add_q+0x48>
    }else{
        q->tail->next = n;
 9c2:	8b 45 08             	mov    0x8(%ebp),%eax
 9c5:	8b 40 08             	mov    0x8(%eax),%eax
 9c8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9cb:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 9ce:	8b 45 08             	mov    0x8(%ebp),%eax
 9d1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9d4:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 9d7:	8b 45 08             	mov    0x8(%ebp),%eax
 9da:	8b 00                	mov    (%eax),%eax
 9dc:	8d 50 01             	lea    0x1(%eax),%edx
 9df:	8b 45 08             	mov    0x8(%ebp),%eax
 9e2:	89 10                	mov    %edx,(%eax)
}
 9e4:	c9                   	leave  
 9e5:	c3                   	ret    

000009e6 <empty_q>:

int empty_q(struct queue *q){
 9e6:	55                   	push   %ebp
 9e7:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 9e9:	8b 45 08             	mov    0x8(%ebp),%eax
 9ec:	8b 00                	mov    (%eax),%eax
 9ee:	85 c0                	test   %eax,%eax
 9f0:	75 07                	jne    9f9 <empty_q+0x13>
        return 1;
 9f2:	b8 01 00 00 00       	mov    $0x1,%eax
 9f7:	eb 05                	jmp    9fe <empty_q+0x18>
    else
        return 0;
 9f9:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 9fe:	5d                   	pop    %ebp
 9ff:	c3                   	ret    

00000a00 <pop_q>:
int pop_q(struct queue *q){
 a00:	55                   	push   %ebp
 a01:	89 e5                	mov    %esp,%ebp
 a03:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a06:	8b 45 08             	mov    0x8(%ebp),%eax
 a09:	89 04 24             	mov    %eax,(%esp)
 a0c:	e8 d5 ff ff ff       	call   9e6 <empty_q>
 a11:	85 c0                	test   %eax,%eax
 a13:	75 5d                	jne    a72 <pop_q+0x72>
       val = q->head->value; 
 a15:	8b 45 08             	mov    0x8(%ebp),%eax
 a18:	8b 40 04             	mov    0x4(%eax),%eax
 a1b:	8b 00                	mov    (%eax),%eax
 a1d:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 a20:	8b 45 08             	mov    0x8(%ebp),%eax
 a23:	8b 40 04             	mov    0x4(%eax),%eax
 a26:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 a29:	8b 45 08             	mov    0x8(%ebp),%eax
 a2c:	8b 40 04             	mov    0x4(%eax),%eax
 a2f:	8b 50 04             	mov    0x4(%eax),%edx
 a32:	8b 45 08             	mov    0x8(%ebp),%eax
 a35:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a38:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3b:	89 04 24             	mov    %eax,(%esp)
 a3e:	e8 e1 fb ff ff       	call   624 <free>
       q->size--;
 a43:	8b 45 08             	mov    0x8(%ebp),%eax
 a46:	8b 00                	mov    (%eax),%eax
 a48:	8d 50 ff             	lea    -0x1(%eax),%edx
 a4b:	8b 45 08             	mov    0x8(%ebp),%eax
 a4e:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a50:	8b 45 08             	mov    0x8(%ebp),%eax
 a53:	8b 00                	mov    (%eax),%eax
 a55:	85 c0                	test   %eax,%eax
 a57:	75 14                	jne    a6d <pop_q+0x6d>
            q->head = 0;
 a59:	8b 45 08             	mov    0x8(%ebp),%eax
 a5c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a63:	8b 45 08             	mov    0x8(%ebp),%eax
 a66:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a70:	eb 05                	jmp    a77 <pop_q+0x77>
    }
    return -1;
 a72:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a77:	c9                   	leave  
 a78:	c3                   	ret    
 a79:	90                   	nop
 a7a:	90                   	nop
 a7b:	90                   	nop

00000a7c <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 a7c:	55                   	push   %ebp
 a7d:	89 e5                	mov    %esp,%ebp
 a7f:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 a82:	8b 45 08             	mov    0x8(%ebp),%eax
 a85:	8b 55 0c             	mov    0xc(%ebp),%edx
 a88:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 a8b:	8b 45 08             	mov    0x8(%ebp),%eax
 a8e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 a95:	8b 45 08             	mov    0x8(%ebp),%eax
 a98:	89 04 24             	mov    %eax,(%esp)
 a9b:	e8 ae fd ff ff       	call   84e <lock_init>
}
 aa0:	c9                   	leave  
 aa1:	c3                   	ret    

00000aa2 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 aa2:	55                   	push   %ebp
 aa3:	89 e5                	mov    %esp,%ebp
 aa5:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 aa8:	8b 45 08             	mov    0x8(%ebp),%eax
 aab:	89 04 24             	mov    %eax,(%esp)
 aae:	e8 a9 fd ff ff       	call   85c <lock_acquire>
	if(s->count  == 0){
 ab3:	8b 45 08             	mov    0x8(%ebp),%eax
 ab6:	8b 40 04             	mov    0x4(%eax),%eax
 ab9:	85 c0                	test   %eax,%eax
 abb:	75 43                	jne    b00 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 abd:	c7 44 24 04 02 0c 00 	movl   $0xc02,0x4(%esp)
 ac4:	00 
 ac5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 acc:	e8 9c f9 ff ff       	call   46d <printf>
		//add proc to waiters list
		int tid = getpid();
 ad1:	e8 76 f8 ff ff       	call   34c <getpid>
 ad6:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 ad9:	8b 45 08             	mov    0x8(%ebp),%eax
 adc:	8d 50 0c             	lea    0xc(%eax),%edx
 adf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae2:	89 44 24 04          	mov    %eax,0x4(%esp)
 ae6:	89 14 24             	mov    %edx,(%esp)
 ae9:	e8 98 fe ff ff       	call   986 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 aee:	8b 45 08             	mov    0x8(%ebp),%eax
 af1:	89 04 24             	mov    %eax,(%esp)
 af4:	e8 82 fd ff ff       	call   87b <lock_release>
		tsleep(); 
 af9:	e8 7e f8 ff ff       	call   37c <tsleep>
 afe:	eb 2e                	jmp    b2e <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 b00:	c7 44 24 04 09 0c 00 	movl   $0xc09,0x4(%esp)
 b07:	00 
 b08:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b0f:	e8 59 f9 ff ff       	call   46d <printf>
		s->count--;	
 b14:	8b 45 08             	mov    0x8(%ebp),%eax
 b17:	8b 40 04             	mov    0x4(%eax),%eax
 b1a:	8d 50 ff             	lea    -0x1(%eax),%edx
 b1d:	8b 45 08             	mov    0x8(%ebp),%eax
 b20:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b23:	8b 45 08             	mov    0x8(%ebp),%eax
 b26:	89 04 24             	mov    %eax,(%esp)
 b29:	e8 4d fd ff ff       	call   87b <lock_release>
	}
}
 b2e:	c9                   	leave  
 b2f:	c3                   	ret    

00000b30 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 b36:	c7 44 24 04 10 0c 00 	movl   $0xc10,0x4(%esp)
 b3d:	00 
 b3e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b45:	e8 23 f9 ff ff       	call   46d <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b4a:	8b 45 08             	mov    0x8(%ebp),%eax
 b4d:	89 04 24             	mov    %eax,(%esp)
 b50:	e8 07 fd ff ff       	call   85c <lock_acquire>
	if(s->count < s->size){
 b55:	8b 45 08             	mov    0x8(%ebp),%eax
 b58:	8b 50 04             	mov    0x4(%eax),%edx
 b5b:	8b 45 08             	mov    0x8(%ebp),%eax
 b5e:	8b 40 08             	mov    0x8(%eax),%eax
 b61:	39 c2                	cmp    %eax,%edx
 b63:	7d 0f                	jge    b74 <sem_signal+0x44>
		s->count++;	
 b65:	8b 45 08             	mov    0x8(%ebp),%eax
 b68:	8b 40 04             	mov    0x4(%eax),%eax
 b6b:	8d 50 01             	lea    0x1(%eax),%edx
 b6e:	8b 45 08             	mov    0x8(%ebp),%eax
 b71:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 b74:	8b 45 08             	mov    0x8(%ebp),%eax
 b77:	83 c0 0c             	add    $0xc,%eax
 b7a:	89 04 24             	mov    %eax,(%esp)
 b7d:	e8 7e fe ff ff       	call   a00 <pop_q>
 b82:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 b85:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b89:	74 2e                	je     bb9 <sem_signal+0x89>
		printf(1, "Sem A\n");
 b8b:	c7 44 24 04 09 0c 00 	movl   $0xc09,0x4(%esp)
 b92:	00 
 b93:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b9a:	e8 ce f8 ff ff       	call   46d <printf>
		twakeup(tid);
 b9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba2:	89 04 24             	mov    %eax,(%esp)
 ba5:	e8 da f7 ff ff       	call   384 <twakeup>
		s->count--;
 baa:	8b 45 08             	mov    0x8(%ebp),%eax
 bad:	8b 40 04             	mov    0x4(%eax),%eax
 bb0:	8d 50 ff             	lea    -0x1(%eax),%edx
 bb3:	8b 45 08             	mov    0x8(%ebp),%eax
 bb6:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 bb9:	8b 45 08             	mov    0x8(%ebp),%eax
 bbc:	89 04 24             	mov    %eax,(%esp)
 bbf:	e8 b7 fc ff ff       	call   87b <lock_release>

 bc4:	c9                   	leave  
 bc5:	c3                   	ret    
