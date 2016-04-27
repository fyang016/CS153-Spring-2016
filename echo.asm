
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
  1f:	b8 4d 09 00 00       	mov    $0x94d,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 4f 09 00 00       	mov    $0x94f,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	c1 e2 02             	shl    $0x2,%edx
  32:	03 55 0c             	add    0xc(%ebp),%edx
  35:	8b 12                	mov    (%edx),%edx
  37:	89 44 24 0c          	mov    %eax,0xc(%esp)
  3b:	89 54 24 08          	mov    %edx,0x8(%esp)
  3f:	c7 44 24 04 51 09 00 	movl   $0x951,0x4(%esp)
  46:	00 
  47:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4e:	e8 02 04 00 00       	call   455 <printf>
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

0000037c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 37c:	55                   	push   %ebp
 37d:	89 e5                	mov    %esp,%ebp
 37f:	83 ec 28             	sub    $0x28,%esp
 382:	8b 45 0c             	mov    0xc(%ebp),%eax
 385:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 388:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 38f:	00 
 390:	8d 45 f4             	lea    -0xc(%ebp),%eax
 393:	89 44 24 04          	mov    %eax,0x4(%esp)
 397:	8b 45 08             	mov    0x8(%ebp),%eax
 39a:	89 04 24             	mov    %eax,(%esp)
 39d:	e8 4a ff ff ff       	call   2ec <write>
}
 3a2:	c9                   	leave  
 3a3:	c3                   	ret    

000003a4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3a4:	55                   	push   %ebp
 3a5:	89 e5                	mov    %esp,%ebp
 3a7:	53                   	push   %ebx
 3a8:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3ab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3b2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3b6:	74 17                	je     3cf <printint+0x2b>
 3b8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3bc:	79 11                	jns    3cf <printint+0x2b>
    neg = 1;
 3be:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c8:	f7 d8                	neg    %eax
 3ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3cd:	eb 06                	jmp    3d5 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3d5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3dc:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3df:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e5:	ba 00 00 00 00       	mov    $0x0,%edx
 3ea:	f7 f3                	div    %ebx
 3ec:	89 d0                	mov    %edx,%eax
 3ee:	0f b6 80 8c 09 00 00 	movzbl 0x98c(%eax),%eax
 3f5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 3f9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 3fd:	8b 45 10             	mov    0x10(%ebp),%eax
 400:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 403:	8b 45 f4             	mov    -0xc(%ebp),%eax
 406:	ba 00 00 00 00       	mov    $0x0,%edx
 40b:	f7 75 d4             	divl   -0x2c(%ebp)
 40e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 411:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 415:	75 c5                	jne    3dc <printint+0x38>
  if(neg)
 417:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 41b:	74 28                	je     445 <printint+0xa1>
    buf[i++] = '-';
 41d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 420:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 425:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 429:	eb 1a                	jmp    445 <printint+0xa1>
    putc(fd, buf[i]);
 42b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 42e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 433:	0f be c0             	movsbl %al,%eax
 436:	89 44 24 04          	mov    %eax,0x4(%esp)
 43a:	8b 45 08             	mov    0x8(%ebp),%eax
 43d:	89 04 24             	mov    %eax,(%esp)
 440:	e8 37 ff ff ff       	call   37c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 445:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 449:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 44d:	79 dc                	jns    42b <printint+0x87>
    putc(fd, buf[i]);
}
 44f:	83 c4 44             	add    $0x44,%esp
 452:	5b                   	pop    %ebx
 453:	5d                   	pop    %ebp
 454:	c3                   	ret    

00000455 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 455:	55                   	push   %ebp
 456:	89 e5                	mov    %esp,%ebp
 458:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 45b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 462:	8d 45 0c             	lea    0xc(%ebp),%eax
 465:	83 c0 04             	add    $0x4,%eax
 468:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 46b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 472:	e9 7e 01 00 00       	jmp    5f5 <printf+0x1a0>
    c = fmt[i] & 0xff;
 477:	8b 55 0c             	mov    0xc(%ebp),%edx
 47a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 47d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 480:	0f b6 00             	movzbl (%eax),%eax
 483:	0f be c0             	movsbl %al,%eax
 486:	25 ff 00 00 00       	and    $0xff,%eax
 48b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 48e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 492:	75 2c                	jne    4c0 <printf+0x6b>
      if(c == '%'){
 494:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 498:	75 0c                	jne    4a6 <printf+0x51>
        state = '%';
 49a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 4a1:	e9 4b 01 00 00       	jmp    5f1 <printf+0x19c>
      } else {
        putc(fd, c);
 4a6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4a9:	0f be c0             	movsbl %al,%eax
 4ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b0:	8b 45 08             	mov    0x8(%ebp),%eax
 4b3:	89 04 24             	mov    %eax,(%esp)
 4b6:	e8 c1 fe ff ff       	call   37c <putc>
 4bb:	e9 31 01 00 00       	jmp    5f1 <printf+0x19c>
      }
    } else if(state == '%'){
 4c0:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4c4:	0f 85 27 01 00 00    	jne    5f1 <printf+0x19c>
      if(c == 'd'){
 4ca:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4ce:	75 2d                	jne    4fd <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4d0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d3:	8b 00                	mov    (%eax),%eax
 4d5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4dc:	00 
 4dd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4e4:	00 
 4e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e9:	8b 45 08             	mov    0x8(%ebp),%eax
 4ec:	89 04 24             	mov    %eax,(%esp)
 4ef:	e8 b0 fe ff ff       	call   3a4 <printint>
        ap++;
 4f4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 4f8:	e9 ed 00 00 00       	jmp    5ea <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 4fd:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 501:	74 06                	je     509 <printf+0xb4>
 503:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 507:	75 2d                	jne    536 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 509:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50c:	8b 00                	mov    (%eax),%eax
 50e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 515:	00 
 516:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 51d:	00 
 51e:	89 44 24 04          	mov    %eax,0x4(%esp)
 522:	8b 45 08             	mov    0x8(%ebp),%eax
 525:	89 04 24             	mov    %eax,(%esp)
 528:	e8 77 fe ff ff       	call   3a4 <printint>
        ap++;
 52d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 531:	e9 b4 00 00 00       	jmp    5ea <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 536:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 53a:	75 46                	jne    582 <printf+0x12d>
        s = (char*)*ap;
 53c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53f:	8b 00                	mov    (%eax),%eax
 541:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 544:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 548:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 54c:	75 27                	jne    575 <printf+0x120>
          s = "(null)";
 54e:	c7 45 e4 56 09 00 00 	movl   $0x956,-0x1c(%ebp)
        while(*s != 0){
 555:	eb 1f                	jmp    576 <printf+0x121>
          putc(fd, *s);
 557:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 55a:	0f b6 00             	movzbl (%eax),%eax
 55d:	0f be c0             	movsbl %al,%eax
 560:	89 44 24 04          	mov    %eax,0x4(%esp)
 564:	8b 45 08             	mov    0x8(%ebp),%eax
 567:	89 04 24             	mov    %eax,(%esp)
 56a:	e8 0d fe ff ff       	call   37c <putc>
          s++;
 56f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 573:	eb 01                	jmp    576 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 575:	90                   	nop
 576:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 579:	0f b6 00             	movzbl (%eax),%eax
 57c:	84 c0                	test   %al,%al
 57e:	75 d7                	jne    557 <printf+0x102>
 580:	eb 68                	jmp    5ea <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 582:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 586:	75 1d                	jne    5a5 <printf+0x150>
        putc(fd, *ap);
 588:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58b:	8b 00                	mov    (%eax),%eax
 58d:	0f be c0             	movsbl %al,%eax
 590:	89 44 24 04          	mov    %eax,0x4(%esp)
 594:	8b 45 08             	mov    0x8(%ebp),%eax
 597:	89 04 24             	mov    %eax,(%esp)
 59a:	e8 dd fd ff ff       	call   37c <putc>
        ap++;
 59f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5a3:	eb 45                	jmp    5ea <printf+0x195>
      } else if(c == '%'){
 5a5:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5a9:	75 17                	jne    5c2 <printf+0x16d>
        putc(fd, c);
 5ab:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ae:	0f be c0             	movsbl %al,%eax
 5b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b5:	8b 45 08             	mov    0x8(%ebp),%eax
 5b8:	89 04 24             	mov    %eax,(%esp)
 5bb:	e8 bc fd ff ff       	call   37c <putc>
 5c0:	eb 28                	jmp    5ea <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5c2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5c9:	00 
 5ca:	8b 45 08             	mov    0x8(%ebp),%eax
 5cd:	89 04 24             	mov    %eax,(%esp)
 5d0:	e8 a7 fd ff ff       	call   37c <putc>
        putc(fd, c);
 5d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d8:	0f be c0             	movsbl %al,%eax
 5db:	89 44 24 04          	mov    %eax,0x4(%esp)
 5df:	8b 45 08             	mov    0x8(%ebp),%eax
 5e2:	89 04 24             	mov    %eax,(%esp)
 5e5:	e8 92 fd ff ff       	call   37c <putc>
      }
      state = 0;
 5ea:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5f1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5f5:	8b 55 0c             	mov    0xc(%ebp),%edx
 5f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5fb:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5fe:	0f b6 00             	movzbl (%eax),%eax
 601:	84 c0                	test   %al,%al
 603:	0f 85 6e fe ff ff    	jne    477 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 609:	c9                   	leave  
 60a:	c3                   	ret    
 60b:	90                   	nop

0000060c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 60c:	55                   	push   %ebp
 60d:	89 e5                	mov    %esp,%ebp
 60f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 612:	8b 45 08             	mov    0x8(%ebp),%eax
 615:	83 e8 08             	sub    $0x8,%eax
 618:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 61b:	a1 a8 09 00 00       	mov    0x9a8,%eax
 620:	89 45 fc             	mov    %eax,-0x4(%ebp)
 623:	eb 24                	jmp    649 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 625:	8b 45 fc             	mov    -0x4(%ebp),%eax
 628:	8b 00                	mov    (%eax),%eax
 62a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 62d:	77 12                	ja     641 <free+0x35>
 62f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 632:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 635:	77 24                	ja     65b <free+0x4f>
 637:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63a:	8b 00                	mov    (%eax),%eax
 63c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 63f:	77 1a                	ja     65b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 641:	8b 45 fc             	mov    -0x4(%ebp),%eax
 644:	8b 00                	mov    (%eax),%eax
 646:	89 45 fc             	mov    %eax,-0x4(%ebp)
 649:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 64f:	76 d4                	jbe    625 <free+0x19>
 651:	8b 45 fc             	mov    -0x4(%ebp),%eax
 654:	8b 00                	mov    (%eax),%eax
 656:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 659:	76 ca                	jbe    625 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 65b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65e:	8b 40 04             	mov    0x4(%eax),%eax
 661:	c1 e0 03             	shl    $0x3,%eax
 664:	89 c2                	mov    %eax,%edx
 666:	03 55 f8             	add    -0x8(%ebp),%edx
 669:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66c:	8b 00                	mov    (%eax),%eax
 66e:	39 c2                	cmp    %eax,%edx
 670:	75 24                	jne    696 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 672:	8b 45 f8             	mov    -0x8(%ebp),%eax
 675:	8b 50 04             	mov    0x4(%eax),%edx
 678:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67b:	8b 00                	mov    (%eax),%eax
 67d:	8b 40 04             	mov    0x4(%eax),%eax
 680:	01 c2                	add    %eax,%edx
 682:	8b 45 f8             	mov    -0x8(%ebp),%eax
 685:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 688:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68b:	8b 00                	mov    (%eax),%eax
 68d:	8b 10                	mov    (%eax),%edx
 68f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 692:	89 10                	mov    %edx,(%eax)
 694:	eb 0a                	jmp    6a0 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 696:	8b 45 fc             	mov    -0x4(%ebp),%eax
 699:	8b 10                	mov    (%eax),%edx
 69b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a3:	8b 40 04             	mov    0x4(%eax),%eax
 6a6:	c1 e0 03             	shl    $0x3,%eax
 6a9:	03 45 fc             	add    -0x4(%ebp),%eax
 6ac:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6af:	75 20                	jne    6d1 <free+0xc5>
    p->s.size += bp->s.size;
 6b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b4:	8b 50 04             	mov    0x4(%eax),%edx
 6b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ba:	8b 40 04             	mov    0x4(%eax),%eax
 6bd:	01 c2                	add    %eax,%edx
 6bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c8:	8b 10                	mov    (%eax),%edx
 6ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cd:	89 10                	mov    %edx,(%eax)
 6cf:	eb 08                	jmp    6d9 <free+0xcd>
  } else
    p->s.ptr = bp;
 6d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6d7:	89 10                	mov    %edx,(%eax)
  freep = p;
 6d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dc:	a3 a8 09 00 00       	mov    %eax,0x9a8
}
 6e1:	c9                   	leave  
 6e2:	c3                   	ret    

000006e3 <morecore>:

static Header*
morecore(uint nu)
{
 6e3:	55                   	push   %ebp
 6e4:	89 e5                	mov    %esp,%ebp
 6e6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6e9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6f0:	77 07                	ja     6f9 <morecore+0x16>
    nu = 4096;
 6f2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
 6fc:	c1 e0 03             	shl    $0x3,%eax
 6ff:	89 04 24             	mov    %eax,(%esp)
 702:	e8 4d fc ff ff       	call   354 <sbrk>
 707:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 70a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 70e:	75 07                	jne    717 <morecore+0x34>
    return 0;
 710:	b8 00 00 00 00       	mov    $0x0,%eax
 715:	eb 22                	jmp    739 <morecore+0x56>
  hp = (Header*)p;
 717:	8b 45 f0             	mov    -0x10(%ebp),%eax
 71a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 71d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 720:	8b 55 08             	mov    0x8(%ebp),%edx
 723:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 726:	8b 45 f4             	mov    -0xc(%ebp),%eax
 729:	83 c0 08             	add    $0x8,%eax
 72c:	89 04 24             	mov    %eax,(%esp)
 72f:	e8 d8 fe ff ff       	call   60c <free>
  return freep;
 734:	a1 a8 09 00 00       	mov    0x9a8,%eax
}
 739:	c9                   	leave  
 73a:	c3                   	ret    

0000073b <malloc>:

void*
malloc(uint nbytes)
{
 73b:	55                   	push   %ebp
 73c:	89 e5                	mov    %esp,%ebp
 73e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 741:	8b 45 08             	mov    0x8(%ebp),%eax
 744:	83 c0 07             	add    $0x7,%eax
 747:	c1 e8 03             	shr    $0x3,%eax
 74a:	83 c0 01             	add    $0x1,%eax
 74d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 750:	a1 a8 09 00 00       	mov    0x9a8,%eax
 755:	89 45 f0             	mov    %eax,-0x10(%ebp)
 758:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 75c:	75 23                	jne    781 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 75e:	c7 45 f0 a0 09 00 00 	movl   $0x9a0,-0x10(%ebp)
 765:	8b 45 f0             	mov    -0x10(%ebp),%eax
 768:	a3 a8 09 00 00       	mov    %eax,0x9a8
 76d:	a1 a8 09 00 00       	mov    0x9a8,%eax
 772:	a3 a0 09 00 00       	mov    %eax,0x9a0
    base.s.size = 0;
 777:	c7 05 a4 09 00 00 00 	movl   $0x0,0x9a4
 77e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 781:	8b 45 f0             	mov    -0x10(%ebp),%eax
 784:	8b 00                	mov    (%eax),%eax
 786:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 789:	8b 45 ec             	mov    -0x14(%ebp),%eax
 78c:	8b 40 04             	mov    0x4(%eax),%eax
 78f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 792:	72 4d                	jb     7e1 <malloc+0xa6>
      if(p->s.size == nunits)
 794:	8b 45 ec             	mov    -0x14(%ebp),%eax
 797:	8b 40 04             	mov    0x4(%eax),%eax
 79a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 79d:	75 0c                	jne    7ab <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 79f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a2:	8b 10                	mov    (%eax),%edx
 7a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a7:	89 10                	mov    %edx,(%eax)
 7a9:	eb 26                	jmp    7d1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7ab:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ae:	8b 40 04             	mov    0x4(%eax),%eax
 7b1:	89 c2                	mov    %eax,%edx
 7b3:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7bf:	8b 40 04             	mov    0x4(%eax),%eax
 7c2:	c1 e0 03             	shl    $0x3,%eax
 7c5:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7cb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7ce:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d4:	a3 a8 09 00 00       	mov    %eax,0x9a8
      return (void*)(p + 1);
 7d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7dc:	83 c0 08             	add    $0x8,%eax
 7df:	eb 38                	jmp    819 <malloc+0xde>
    }
    if(p == freep)
 7e1:	a1 a8 09 00 00       	mov    0x9a8,%eax
 7e6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7e9:	75 1b                	jne    806 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ee:	89 04 24             	mov    %eax,(%esp)
 7f1:	e8 ed fe ff ff       	call   6e3 <morecore>
 7f6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7f9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7fd:	75 07                	jne    806 <malloc+0xcb>
        return 0;
 7ff:	b8 00 00 00 00       	mov    $0x0,%eax
 804:	eb 13                	jmp    819 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 806:	8b 45 ec             	mov    -0x14(%ebp),%eax
 809:	89 45 f0             	mov    %eax,-0x10(%ebp)
 80c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80f:	8b 00                	mov    (%eax),%eax
 811:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 814:	e9 70 ff ff ff       	jmp    789 <malloc+0x4e>
}
 819:	c9                   	leave  
 81a:	c3                   	ret    
 81b:	90                   	nop

0000081c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 81c:	55                   	push   %ebp
 81d:	89 e5                	mov    %esp,%ebp
 81f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 822:	8b 55 08             	mov    0x8(%ebp),%edx
 825:	8b 45 0c             	mov    0xc(%ebp),%eax
 828:	8b 4d 08             	mov    0x8(%ebp),%ecx
 82b:	f0 87 02             	lock xchg %eax,(%edx)
 82e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 831:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 834:	c9                   	leave  
 835:	c3                   	ret    

00000836 <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 836:	55                   	push   %ebp
 837:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 839:	8b 45 08             	mov    0x8(%ebp),%eax
 83c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 842:	5d                   	pop    %ebp
 843:	c3                   	ret    

00000844 <lock_acquire>:
void lock_acquire(lock_t *lock){
 844:	55                   	push   %ebp
 845:	89 e5                	mov    %esp,%ebp
 847:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 84a:	8b 45 08             	mov    0x8(%ebp),%eax
 84d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 854:	00 
 855:	89 04 24             	mov    %eax,(%esp)
 858:	e8 bf ff ff ff       	call   81c <xchg>
 85d:	85 c0                	test   %eax,%eax
 85f:	75 e9                	jne    84a <lock_acquire+0x6>
}
 861:	c9                   	leave  
 862:	c3                   	ret    

00000863 <lock_release>:
void lock_release(lock_t *lock){
 863:	55                   	push   %ebp
 864:	89 e5                	mov    %esp,%ebp
 866:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 869:	8b 45 08             	mov    0x8(%ebp),%eax
 86c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 873:	00 
 874:	89 04 24             	mov    %eax,(%esp)
 877:	e8 a0 ff ff ff       	call   81c <xchg>
}
 87c:	c9                   	leave  
 87d:	c3                   	ret    

0000087e <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 87e:	55                   	push   %ebp
 87f:	89 e5                	mov    %esp,%ebp
 881:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 884:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 88b:	e8 ab fe ff ff       	call   73b <malloc>
 890:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 893:	8b 45 f0             	mov    -0x10(%ebp),%eax
 896:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 899:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89c:	25 ff 0f 00 00       	and    $0xfff,%eax
 8a1:	85 c0                	test   %eax,%eax
 8a3:	74 15                	je     8ba <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 8a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a8:	89 c2                	mov    %eax,%edx
 8aa:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 8b0:	b8 00 10 00 00       	mov    $0x1000,%eax
 8b5:	29 d0                	sub    %edx,%eax
 8b7:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 8ba:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8be:	75 1b                	jne    8db <thread_create+0x5d>

        printf(1,"malloc fail \n");
 8c0:	c7 44 24 04 5d 09 00 	movl   $0x95d,0x4(%esp)
 8c7:	00 
 8c8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8cf:	e8 81 fb ff ff       	call   455 <printf>
        return 0;
 8d4:	b8 00 00 00 00       	mov    $0x0,%eax
 8d9:	eb 70                	jmp    94b <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 8db:	8b 55 08             	mov    0x8(%ebp),%edx
 8de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 8e8:	00 
 8e9:	89 54 24 08          	mov    %edx,0x8(%esp)
 8ed:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 8f4:	00 
 8f5:	89 04 24             	mov    %eax,(%esp)
 8f8:	e8 6f fa ff ff       	call   36c <clone>
 8fd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 900:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 904:	79 1b                	jns    921 <thread_create+0xa3>
        printf(1,"clone fails\n");
 906:	c7 44 24 04 6b 09 00 	movl   $0x96b,0x4(%esp)
 90d:	00 
 90e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 915:	e8 3b fb ff ff       	call   455 <printf>
        return 0;
 91a:	b8 00 00 00 00       	mov    $0x0,%eax
 91f:	eb 2a                	jmp    94b <thread_create+0xcd>
    }
    if(tid > 0){
 921:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 925:	7e 05                	jle    92c <thread_create+0xae>
        return garbage_stack;
 927:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92a:	eb 1f                	jmp    94b <thread_create+0xcd>
    }
    if(tid == 0){
 92c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 930:	75 14                	jne    946 <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 932:	c7 44 24 04 78 09 00 	movl   $0x978,0x4(%esp)
 939:	00 
 93a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 941:	e8 0f fb ff ff       	call   455 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 946:	b8 00 00 00 00       	mov    $0x0,%eax
}
 94b:	c9                   	leave  
 94c:	c3                   	ret    
