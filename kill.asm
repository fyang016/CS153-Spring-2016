
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
   f:	c7 44 24 04 49 09 00 	movl   $0x949,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 2e 04 00 00       	call   451 <printf>
    exit();
  23:	e8 a0 02 00 00       	call   2c8 <exit>
  }
  for(i=1; i<argc; i++)
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 21                	jmp    53 <main+0x53>
    kill(atoi(argv[i]));
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	c1 e0 02             	shl    $0x2,%eax
  39:	03 45 0c             	add    0xc(%ebp),%eax
  3c:	8b 00                	mov    (%eax),%eax
  3e:	89 04 24             	mov    %eax,(%esp)
  41:	e8 f0 01 00 00       	call   236 <atoi>
  46:	89 04 24             	mov    %eax,(%esp)
  49:	e8 aa 02 00 00       	call   2f8 <kill>

  if(argc < 1){
    printf(2, "usage: kill pid...\n");
    exit();
  }
  for(i=1; i<argc; i++)
  4e:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  53:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  57:	3b 45 08             	cmp    0x8(%ebp),%eax
  5a:	7c d6                	jl     32 <main+0x32>
    kill(atoi(argv[i]));
  exit();
  5c:	e8 67 02 00 00       	call   2c8 <exit>
  61:	90                   	nop
  62:	90                   	nop
  63:	90                   	nop

00000064 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  64:	55                   	push   %ebp
  65:	89 e5                	mov    %esp,%ebp
  67:	57                   	push   %edi
  68:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  69:	8b 4d 08             	mov    0x8(%ebp),%ecx
  6c:	8b 55 10             	mov    0x10(%ebp),%edx
  6f:	8b 45 0c             	mov    0xc(%ebp),%eax
  72:	89 cb                	mov    %ecx,%ebx
  74:	89 df                	mov    %ebx,%edi
  76:	89 d1                	mov    %edx,%ecx
  78:	fc                   	cld    
  79:	f3 aa                	rep stos %al,%es:(%edi)
  7b:	89 ca                	mov    %ecx,%edx
  7d:	89 fb                	mov    %edi,%ebx
  7f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  82:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  85:	5b                   	pop    %ebx
  86:	5f                   	pop    %edi
  87:	5d                   	pop    %ebp
  88:	c3                   	ret    

00000089 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  89:	55                   	push   %ebp
  8a:	89 e5                	mov    %esp,%ebp
  8c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  8f:	8b 45 08             	mov    0x8(%ebp),%eax
  92:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 10             	movzbl (%eax),%edx
  9b:	8b 45 08             	mov    0x8(%ebp),%eax
  9e:	88 10                	mov    %dl,(%eax)
  a0:	8b 45 08             	mov    0x8(%ebp),%eax
  a3:	0f b6 00             	movzbl (%eax),%eax
  a6:	84 c0                	test   %al,%al
  a8:	0f 95 c0             	setne  %al
  ab:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  af:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  b3:	84 c0                	test   %al,%al
  b5:	75 de                	jne    95 <strcpy+0xc>
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
  f5:	89 d1                	mov    %edx,%ecx
  f7:	29 c1                	sub    %eax,%ecx
  f9:	89 c8                	mov    %ecx,%eax
}
  fb:	5d                   	pop    %ebp
  fc:	c3                   	ret    

000000fd <strlen>:

uint
strlen(char *s)
{
  fd:	55                   	push   %ebp
  fe:	89 e5                	mov    %esp,%ebp
 100:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 103:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 10a:	eb 04                	jmp    110 <strlen+0x13>
 10c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 110:	8b 45 fc             	mov    -0x4(%ebp),%eax
 113:	03 45 08             	add    0x8(%ebp),%eax
 116:	0f b6 00             	movzbl (%eax),%eax
 119:	84 c0                	test   %al,%al
 11b:	75 ef                	jne    10c <strlen+0xf>
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
 13c:	e8 23 ff ff ff       	call   64 <stosb>
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
 17f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 186:	eb 44                	jmp    1cc <gets+0x53>
    cc = read(0, &c, 1);
 188:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 18f:	00 
 190:	8d 45 ef             	lea    -0x11(%ebp),%eax
 193:	89 44 24 04          	mov    %eax,0x4(%esp)
 197:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 19e:	e8 3d 01 00 00       	call   2e0 <read>
 1a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 1a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1aa:	7e 2d                	jle    1d9 <gets+0x60>
      break;
    buf[i++] = c;
 1ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1af:	03 45 08             	add    0x8(%ebp),%eax
 1b2:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1b6:	88 10                	mov    %dl,(%eax)
 1b8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 1bc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c0:	3c 0a                	cmp    $0xa,%al
 1c2:	74 16                	je     1da <gets+0x61>
 1c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1c8:	3c 0d                	cmp    $0xd,%al
 1ca:	74 0e                	je     1da <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1cf:	83 c0 01             	add    $0x1,%eax
 1d2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1d5:	7c b1                	jl     188 <gets+0xf>
 1d7:	eb 01                	jmp    1da <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1d9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1dd:	03 45 08             	add    0x8(%ebp),%eax
 1e0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1e6:	c9                   	leave  
 1e7:	c3                   	ret    

000001e8 <stat>:

int
stat(char *n, struct stat *st)
{
 1e8:	55                   	push   %ebp
 1e9:	89 e5                	mov    %esp,%ebp
 1eb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1f5:	00 
 1f6:	8b 45 08             	mov    0x8(%ebp),%eax
 1f9:	89 04 24             	mov    %eax,(%esp)
 1fc:	e8 07 01 00 00       	call   308 <open>
 201:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 204:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 208:	79 07                	jns    211 <stat+0x29>
    return -1;
 20a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 20f:	eb 23                	jmp    234 <stat+0x4c>
  r = fstat(fd, st);
 211:	8b 45 0c             	mov    0xc(%ebp),%eax
 214:	89 44 24 04          	mov    %eax,0x4(%esp)
 218:	8b 45 f0             	mov    -0x10(%ebp),%eax
 21b:	89 04 24             	mov    %eax,(%esp)
 21e:	e8 fd 00 00 00       	call   320 <fstat>
 223:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 226:	8b 45 f0             	mov    -0x10(%ebp),%eax
 229:	89 04 24             	mov    %eax,(%esp)
 22c:	e8 bf 00 00 00       	call   2f0 <close>
  return r;
 231:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 234:	c9                   	leave  
 235:	c3                   	ret    

00000236 <atoi>:

int
atoi(const char *s)
{
 236:	55                   	push   %ebp
 237:	89 e5                	mov    %esp,%ebp
 239:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 23c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 243:	eb 24                	jmp    269 <atoi+0x33>
    n = n*10 + *s++ - '0';
 245:	8b 55 fc             	mov    -0x4(%ebp),%edx
 248:	89 d0                	mov    %edx,%eax
 24a:	c1 e0 02             	shl    $0x2,%eax
 24d:	01 d0                	add    %edx,%eax
 24f:	01 c0                	add    %eax,%eax
 251:	89 c2                	mov    %eax,%edx
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	0f b6 00             	movzbl (%eax),%eax
 259:	0f be c0             	movsbl %al,%eax
 25c:	8d 04 02             	lea    (%edx,%eax,1),%eax
 25f:	83 e8 30             	sub    $0x30,%eax
 262:	89 45 fc             	mov    %eax,-0x4(%ebp)
 265:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 269:	8b 45 08             	mov    0x8(%ebp),%eax
 26c:	0f b6 00             	movzbl (%eax),%eax
 26f:	3c 2f                	cmp    $0x2f,%al
 271:	7e 0a                	jle    27d <atoi+0x47>
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 00             	movzbl (%eax),%eax
 279:	3c 39                	cmp    $0x39,%al
 27b:	7e c8                	jle    245 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 27d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 280:	c9                   	leave  
 281:	c3                   	ret    

00000282 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 282:	55                   	push   %ebp
 283:	89 e5                	mov    %esp,%ebp
 285:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 288:	8b 45 08             	mov    0x8(%ebp),%eax
 28b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 28e:	8b 45 0c             	mov    0xc(%ebp),%eax
 291:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 294:	eb 13                	jmp    2a9 <memmove+0x27>
    *dst++ = *src++;
 296:	8b 45 fc             	mov    -0x4(%ebp),%eax
 299:	0f b6 10             	movzbl (%eax),%edx
 29c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 29f:	88 10                	mov    %dl,(%eax)
 2a1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 2a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2a9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2ad:	0f 9f c0             	setg   %al
 2b0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2b4:	84 c0                	test   %al,%al
 2b6:	75 de                	jne    296 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2bb:	c9                   	leave  
 2bc:	c3                   	ret    
 2bd:	90                   	nop
 2be:	90                   	nop
 2bf:	90                   	nop

000002c0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2c0:	b8 01 00 00 00       	mov    $0x1,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <exit>:
SYSCALL(exit)
 2c8:	b8 02 00 00 00       	mov    $0x2,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <wait>:
SYSCALL(wait)
 2d0:	b8 03 00 00 00       	mov    $0x3,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <pipe>:
SYSCALL(pipe)
 2d8:	b8 04 00 00 00       	mov    $0x4,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <read>:
SYSCALL(read)
 2e0:	b8 05 00 00 00       	mov    $0x5,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <write>:
SYSCALL(write)
 2e8:	b8 10 00 00 00       	mov    $0x10,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <close>:
SYSCALL(close)
 2f0:	b8 15 00 00 00       	mov    $0x15,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <kill>:
SYSCALL(kill)
 2f8:	b8 06 00 00 00       	mov    $0x6,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <exec>:
SYSCALL(exec)
 300:	b8 07 00 00 00       	mov    $0x7,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <open>:
SYSCALL(open)
 308:	b8 0f 00 00 00       	mov    $0xf,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <mknod>:
SYSCALL(mknod)
 310:	b8 11 00 00 00       	mov    $0x11,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <unlink>:
SYSCALL(unlink)
 318:	b8 12 00 00 00       	mov    $0x12,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <fstat>:
SYSCALL(fstat)
 320:	b8 08 00 00 00       	mov    $0x8,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <link>:
SYSCALL(link)
 328:	b8 13 00 00 00       	mov    $0x13,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <mkdir>:
SYSCALL(mkdir)
 330:	b8 14 00 00 00       	mov    $0x14,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <chdir>:
SYSCALL(chdir)
 338:	b8 09 00 00 00       	mov    $0x9,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <dup>:
SYSCALL(dup)
 340:	b8 0a 00 00 00       	mov    $0xa,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <getpid>:
SYSCALL(getpid)
 348:	b8 0b 00 00 00       	mov    $0xb,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <sbrk>:
SYSCALL(sbrk)
 350:	b8 0c 00 00 00       	mov    $0xc,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <sleep>:
SYSCALL(sleep)
 358:	b8 0d 00 00 00       	mov    $0xd,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <uptime>:
SYSCALL(uptime)
 360:	b8 0e 00 00 00       	mov    $0xe,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <clone>:
SYSCALL(clone)
 368:	b8 16 00 00 00       	mov    $0x16,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <texit>:
SYSCALL(texit)
 370:	b8 17 00 00 00       	mov    $0x17,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
 37b:	83 ec 28             	sub    $0x28,%esp
 37e:	8b 45 0c             	mov    0xc(%ebp),%eax
 381:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 384:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 38b:	00 
 38c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 38f:	89 44 24 04          	mov    %eax,0x4(%esp)
 393:	8b 45 08             	mov    0x8(%ebp),%eax
 396:	89 04 24             	mov    %eax,(%esp)
 399:	e8 4a ff ff ff       	call   2e8 <write>
}
 39e:	c9                   	leave  
 39f:	c3                   	ret    

000003a0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3a0:	55                   	push   %ebp
 3a1:	89 e5                	mov    %esp,%ebp
 3a3:	53                   	push   %ebx
 3a4:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3a7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3ae:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3b2:	74 17                	je     3cb <printint+0x2b>
 3b4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3b8:	79 11                	jns    3cb <printint+0x2b>
    neg = 1;
 3ba:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c4:	f7 d8                	neg    %eax
 3c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3c9:	eb 06                	jmp    3d1 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3d1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3d8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3db:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e1:	ba 00 00 00 00       	mov    $0x0,%edx
 3e6:	f7 f3                	div    %ebx
 3e8:	89 d0                	mov    %edx,%eax
 3ea:	0f b6 80 90 09 00 00 	movzbl 0x990(%eax),%eax
 3f1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 3f5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 3f9:	8b 45 10             	mov    0x10(%ebp),%eax
 3fc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 402:	ba 00 00 00 00       	mov    $0x0,%edx
 407:	f7 75 d4             	divl   -0x2c(%ebp)
 40a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 40d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 411:	75 c5                	jne    3d8 <printint+0x38>
  if(neg)
 413:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 417:	74 28                	je     441 <printint+0xa1>
    buf[i++] = '-';
 419:	8b 45 ec             	mov    -0x14(%ebp),%eax
 41c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 421:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 425:	eb 1a                	jmp    441 <printint+0xa1>
    putc(fd, buf[i]);
 427:	8b 45 ec             	mov    -0x14(%ebp),%eax
 42a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 42f:	0f be c0             	movsbl %al,%eax
 432:	89 44 24 04          	mov    %eax,0x4(%esp)
 436:	8b 45 08             	mov    0x8(%ebp),%eax
 439:	89 04 24             	mov    %eax,(%esp)
 43c:	e8 37 ff ff ff       	call   378 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 441:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 445:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 449:	79 dc                	jns    427 <printint+0x87>
    putc(fd, buf[i]);
}
 44b:	83 c4 44             	add    $0x44,%esp
 44e:	5b                   	pop    %ebx
 44f:	5d                   	pop    %ebp
 450:	c3                   	ret    

00000451 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 451:	55                   	push   %ebp
 452:	89 e5                	mov    %esp,%ebp
 454:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 457:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 45e:	8d 45 0c             	lea    0xc(%ebp),%eax
 461:	83 c0 04             	add    $0x4,%eax
 464:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 467:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 46e:	e9 7e 01 00 00       	jmp    5f1 <printf+0x1a0>
    c = fmt[i] & 0xff;
 473:	8b 55 0c             	mov    0xc(%ebp),%edx
 476:	8b 45 ec             	mov    -0x14(%ebp),%eax
 479:	8d 04 02             	lea    (%edx,%eax,1),%eax
 47c:	0f b6 00             	movzbl (%eax),%eax
 47f:	0f be c0             	movsbl %al,%eax
 482:	25 ff 00 00 00       	and    $0xff,%eax
 487:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 48a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 48e:	75 2c                	jne    4bc <printf+0x6b>
      if(c == '%'){
 490:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 494:	75 0c                	jne    4a2 <printf+0x51>
        state = '%';
 496:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 49d:	e9 4b 01 00 00       	jmp    5ed <printf+0x19c>
      } else {
        putc(fd, c);
 4a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4a5:	0f be c0             	movsbl %al,%eax
 4a8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ac:	8b 45 08             	mov    0x8(%ebp),%eax
 4af:	89 04 24             	mov    %eax,(%esp)
 4b2:	e8 c1 fe ff ff       	call   378 <putc>
 4b7:	e9 31 01 00 00       	jmp    5ed <printf+0x19c>
      }
    } else if(state == '%'){
 4bc:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4c0:	0f 85 27 01 00 00    	jne    5ed <printf+0x19c>
      if(c == 'd'){
 4c6:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4ca:	75 2d                	jne    4f9 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4cf:	8b 00                	mov    (%eax),%eax
 4d1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4d8:	00 
 4d9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4e0:	00 
 4e1:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e5:	8b 45 08             	mov    0x8(%ebp),%eax
 4e8:	89 04 24             	mov    %eax,(%esp)
 4eb:	e8 b0 fe ff ff       	call   3a0 <printint>
        ap++;
 4f0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 4f4:	e9 ed 00 00 00       	jmp    5e6 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 4f9:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 4fd:	74 06                	je     505 <printf+0xb4>
 4ff:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 503:	75 2d                	jne    532 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 505:	8b 45 f4             	mov    -0xc(%ebp),%eax
 508:	8b 00                	mov    (%eax),%eax
 50a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 511:	00 
 512:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 519:	00 
 51a:	89 44 24 04          	mov    %eax,0x4(%esp)
 51e:	8b 45 08             	mov    0x8(%ebp),%eax
 521:	89 04 24             	mov    %eax,(%esp)
 524:	e8 77 fe ff ff       	call   3a0 <printint>
        ap++;
 529:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 52d:	e9 b4 00 00 00       	jmp    5e6 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 532:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 536:	75 46                	jne    57e <printf+0x12d>
        s = (char*)*ap;
 538:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53b:	8b 00                	mov    (%eax),%eax
 53d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 540:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 544:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 548:	75 27                	jne    571 <printf+0x120>
          s = "(null)";
 54a:	c7 45 e4 5d 09 00 00 	movl   $0x95d,-0x1c(%ebp)
        while(*s != 0){
 551:	eb 1f                	jmp    572 <printf+0x121>
          putc(fd, *s);
 553:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 556:	0f b6 00             	movzbl (%eax),%eax
 559:	0f be c0             	movsbl %al,%eax
 55c:	89 44 24 04          	mov    %eax,0x4(%esp)
 560:	8b 45 08             	mov    0x8(%ebp),%eax
 563:	89 04 24             	mov    %eax,(%esp)
 566:	e8 0d fe ff ff       	call   378 <putc>
          s++;
 56b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 56f:	eb 01                	jmp    572 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 571:	90                   	nop
 572:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 575:	0f b6 00             	movzbl (%eax),%eax
 578:	84 c0                	test   %al,%al
 57a:	75 d7                	jne    553 <printf+0x102>
 57c:	eb 68                	jmp    5e6 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 57e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 582:	75 1d                	jne    5a1 <printf+0x150>
        putc(fd, *ap);
 584:	8b 45 f4             	mov    -0xc(%ebp),%eax
 587:	8b 00                	mov    (%eax),%eax
 589:	0f be c0             	movsbl %al,%eax
 58c:	89 44 24 04          	mov    %eax,0x4(%esp)
 590:	8b 45 08             	mov    0x8(%ebp),%eax
 593:	89 04 24             	mov    %eax,(%esp)
 596:	e8 dd fd ff ff       	call   378 <putc>
        ap++;
 59b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 59f:	eb 45                	jmp    5e6 <printf+0x195>
      } else if(c == '%'){
 5a1:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5a5:	75 17                	jne    5be <printf+0x16d>
        putc(fd, c);
 5a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5aa:	0f be c0             	movsbl %al,%eax
 5ad:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b1:	8b 45 08             	mov    0x8(%ebp),%eax
 5b4:	89 04 24             	mov    %eax,(%esp)
 5b7:	e8 bc fd ff ff       	call   378 <putc>
 5bc:	eb 28                	jmp    5e6 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5be:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5c5:	00 
 5c6:	8b 45 08             	mov    0x8(%ebp),%eax
 5c9:	89 04 24             	mov    %eax,(%esp)
 5cc:	e8 a7 fd ff ff       	call   378 <putc>
        putc(fd, c);
 5d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d4:	0f be c0             	movsbl %al,%eax
 5d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5db:	8b 45 08             	mov    0x8(%ebp),%eax
 5de:	89 04 24             	mov    %eax,(%esp)
 5e1:	e8 92 fd ff ff       	call   378 <putc>
      }
      state = 0;
 5e6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5ed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5f1:	8b 55 0c             	mov    0xc(%ebp),%edx
 5f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5f7:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5fa:	0f b6 00             	movzbl (%eax),%eax
 5fd:	84 c0                	test   %al,%al
 5ff:	0f 85 6e fe ff ff    	jne    473 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 605:	c9                   	leave  
 606:	c3                   	ret    
 607:	90                   	nop

00000608 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 608:	55                   	push   %ebp
 609:	89 e5                	mov    %esp,%ebp
 60b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 60e:	8b 45 08             	mov    0x8(%ebp),%eax
 611:	83 e8 08             	sub    $0x8,%eax
 614:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 617:	a1 ac 09 00 00       	mov    0x9ac,%eax
 61c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 61f:	eb 24                	jmp    645 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 621:	8b 45 fc             	mov    -0x4(%ebp),%eax
 624:	8b 00                	mov    (%eax),%eax
 626:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 629:	77 12                	ja     63d <free+0x35>
 62b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 62e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 631:	77 24                	ja     657 <free+0x4f>
 633:	8b 45 fc             	mov    -0x4(%ebp),%eax
 636:	8b 00                	mov    (%eax),%eax
 638:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 63b:	77 1a                	ja     657 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 63d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 640:	8b 00                	mov    (%eax),%eax
 642:	89 45 fc             	mov    %eax,-0x4(%ebp)
 645:	8b 45 f8             	mov    -0x8(%ebp),%eax
 648:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 64b:	76 d4                	jbe    621 <free+0x19>
 64d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 650:	8b 00                	mov    (%eax),%eax
 652:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 655:	76 ca                	jbe    621 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 657:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65a:	8b 40 04             	mov    0x4(%eax),%eax
 65d:	c1 e0 03             	shl    $0x3,%eax
 660:	89 c2                	mov    %eax,%edx
 662:	03 55 f8             	add    -0x8(%ebp),%edx
 665:	8b 45 fc             	mov    -0x4(%ebp),%eax
 668:	8b 00                	mov    (%eax),%eax
 66a:	39 c2                	cmp    %eax,%edx
 66c:	75 24                	jne    692 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 66e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 671:	8b 50 04             	mov    0x4(%eax),%edx
 674:	8b 45 fc             	mov    -0x4(%ebp),%eax
 677:	8b 00                	mov    (%eax),%eax
 679:	8b 40 04             	mov    0x4(%eax),%eax
 67c:	01 c2                	add    %eax,%edx
 67e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 681:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 684:	8b 45 fc             	mov    -0x4(%ebp),%eax
 687:	8b 00                	mov    (%eax),%eax
 689:	8b 10                	mov    (%eax),%edx
 68b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68e:	89 10                	mov    %edx,(%eax)
 690:	eb 0a                	jmp    69c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 692:	8b 45 fc             	mov    -0x4(%ebp),%eax
 695:	8b 10                	mov    (%eax),%edx
 697:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 69c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69f:	8b 40 04             	mov    0x4(%eax),%eax
 6a2:	c1 e0 03             	shl    $0x3,%eax
 6a5:	03 45 fc             	add    -0x4(%ebp),%eax
 6a8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ab:	75 20                	jne    6cd <free+0xc5>
    p->s.size += bp->s.size;
 6ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b0:	8b 50 04             	mov    0x4(%eax),%edx
 6b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b6:	8b 40 04             	mov    0x4(%eax),%eax
 6b9:	01 c2                	add    %eax,%edx
 6bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6be:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6c1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c4:	8b 10                	mov    (%eax),%edx
 6c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c9:	89 10                	mov    %edx,(%eax)
 6cb:	eb 08                	jmp    6d5 <free+0xcd>
  } else
    p->s.ptr = bp;
 6cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6d3:	89 10                	mov    %edx,(%eax)
  freep = p;
 6d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d8:	a3 ac 09 00 00       	mov    %eax,0x9ac
}
 6dd:	c9                   	leave  
 6de:	c3                   	ret    

000006df <morecore>:

static Header*
morecore(uint nu)
{
 6df:	55                   	push   %ebp
 6e0:	89 e5                	mov    %esp,%ebp
 6e2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6e5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6ec:	77 07                	ja     6f5 <morecore+0x16>
    nu = 4096;
 6ee:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6f5:	8b 45 08             	mov    0x8(%ebp),%eax
 6f8:	c1 e0 03             	shl    $0x3,%eax
 6fb:	89 04 24             	mov    %eax,(%esp)
 6fe:	e8 4d fc ff ff       	call   350 <sbrk>
 703:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 706:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 70a:	75 07                	jne    713 <morecore+0x34>
    return 0;
 70c:	b8 00 00 00 00       	mov    $0x0,%eax
 711:	eb 22                	jmp    735 <morecore+0x56>
  hp = (Header*)p;
 713:	8b 45 f0             	mov    -0x10(%ebp),%eax
 716:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 719:	8b 45 f4             	mov    -0xc(%ebp),%eax
 71c:	8b 55 08             	mov    0x8(%ebp),%edx
 71f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 722:	8b 45 f4             	mov    -0xc(%ebp),%eax
 725:	83 c0 08             	add    $0x8,%eax
 728:	89 04 24             	mov    %eax,(%esp)
 72b:	e8 d8 fe ff ff       	call   608 <free>
  return freep;
 730:	a1 ac 09 00 00       	mov    0x9ac,%eax
}
 735:	c9                   	leave  
 736:	c3                   	ret    

00000737 <malloc>:

void*
malloc(uint nbytes)
{
 737:	55                   	push   %ebp
 738:	89 e5                	mov    %esp,%ebp
 73a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 73d:	8b 45 08             	mov    0x8(%ebp),%eax
 740:	83 c0 07             	add    $0x7,%eax
 743:	c1 e8 03             	shr    $0x3,%eax
 746:	83 c0 01             	add    $0x1,%eax
 749:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 74c:	a1 ac 09 00 00       	mov    0x9ac,%eax
 751:	89 45 f0             	mov    %eax,-0x10(%ebp)
 754:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 758:	75 23                	jne    77d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 75a:	c7 45 f0 a4 09 00 00 	movl   $0x9a4,-0x10(%ebp)
 761:	8b 45 f0             	mov    -0x10(%ebp),%eax
 764:	a3 ac 09 00 00       	mov    %eax,0x9ac
 769:	a1 ac 09 00 00       	mov    0x9ac,%eax
 76e:	a3 a4 09 00 00       	mov    %eax,0x9a4
    base.s.size = 0;
 773:	c7 05 a8 09 00 00 00 	movl   $0x0,0x9a8
 77a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 77d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 780:	8b 00                	mov    (%eax),%eax
 782:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 785:	8b 45 ec             	mov    -0x14(%ebp),%eax
 788:	8b 40 04             	mov    0x4(%eax),%eax
 78b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 78e:	72 4d                	jb     7dd <malloc+0xa6>
      if(p->s.size == nunits)
 790:	8b 45 ec             	mov    -0x14(%ebp),%eax
 793:	8b 40 04             	mov    0x4(%eax),%eax
 796:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 799:	75 0c                	jne    7a7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 79b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 79e:	8b 10                	mov    (%eax),%edx
 7a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a3:	89 10                	mov    %edx,(%eax)
 7a5:	eb 26                	jmp    7cd <malloc+0x96>
      else {
        p->s.size -= nunits;
 7a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7aa:	8b 40 04             	mov    0x4(%eax),%eax
 7ad:	89 c2                	mov    %eax,%edx
 7af:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7bb:	8b 40 04             	mov    0x4(%eax),%eax
 7be:	c1 e0 03             	shl    $0x3,%eax
 7c1:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7ca:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d0:	a3 ac 09 00 00       	mov    %eax,0x9ac
      return (void*)(p + 1);
 7d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d8:	83 c0 08             	add    $0x8,%eax
 7db:	eb 38                	jmp    815 <malloc+0xde>
    }
    if(p == freep)
 7dd:	a1 ac 09 00 00       	mov    0x9ac,%eax
 7e2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7e5:	75 1b                	jne    802 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ea:	89 04 24             	mov    %eax,(%esp)
 7ed:	e8 ed fe ff ff       	call   6df <morecore>
 7f2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7f5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7f9:	75 07                	jne    802 <malloc+0xcb>
        return 0;
 7fb:	b8 00 00 00 00       	mov    $0x0,%eax
 800:	eb 13                	jmp    815 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 802:	8b 45 ec             	mov    -0x14(%ebp),%eax
 805:	89 45 f0             	mov    %eax,-0x10(%ebp)
 808:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80b:	8b 00                	mov    (%eax),%eax
 80d:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 810:	e9 70 ff ff ff       	jmp    785 <malloc+0x4e>
}
 815:	c9                   	leave  
 816:	c3                   	ret    
 817:	90                   	nop

00000818 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 818:	55                   	push   %ebp
 819:	89 e5                	mov    %esp,%ebp
 81b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 81e:	8b 55 08             	mov    0x8(%ebp),%edx
 821:	8b 45 0c             	mov    0xc(%ebp),%eax
 824:	8b 4d 08             	mov    0x8(%ebp),%ecx
 827:	f0 87 02             	lock xchg %eax,(%edx)
 82a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 82d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 830:	c9                   	leave  
 831:	c3                   	ret    

00000832 <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 832:	55                   	push   %ebp
 833:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 835:	8b 45 08             	mov    0x8(%ebp),%eax
 838:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 83e:	5d                   	pop    %ebp
 83f:	c3                   	ret    

00000840 <lock_acquire>:
void lock_acquire(lock_t *lock){
 840:	55                   	push   %ebp
 841:	89 e5                	mov    %esp,%ebp
 843:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 846:	8b 45 08             	mov    0x8(%ebp),%eax
 849:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 850:	00 
 851:	89 04 24             	mov    %eax,(%esp)
 854:	e8 bf ff ff ff       	call   818 <xchg>
 859:	85 c0                	test   %eax,%eax
 85b:	75 e9                	jne    846 <lock_acquire+0x6>
}
 85d:	c9                   	leave  
 85e:	c3                   	ret    

0000085f <lock_release>:
void lock_release(lock_t *lock){
 85f:	55                   	push   %ebp
 860:	89 e5                	mov    %esp,%ebp
 862:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 865:	8b 45 08             	mov    0x8(%ebp),%eax
 868:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 86f:	00 
 870:	89 04 24             	mov    %eax,(%esp)
 873:	e8 a0 ff ff ff       	call   818 <xchg>
}
 878:	c9                   	leave  
 879:	c3                   	ret    

0000087a <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 87a:	55                   	push   %ebp
 87b:	89 e5                	mov    %esp,%ebp
 87d:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 880:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 887:	e8 ab fe ff ff       	call   737 <malloc>
 88c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 88f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 892:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 895:	8b 45 f0             	mov    -0x10(%ebp),%eax
 898:	25 ff 0f 00 00       	and    $0xfff,%eax
 89d:	85 c0                	test   %eax,%eax
 89f:	74 15                	je     8b6 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 8a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a4:	89 c2                	mov    %eax,%edx
 8a6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 8ac:	b8 00 10 00 00       	mov    $0x1000,%eax
 8b1:	29 d0                	sub    %edx,%eax
 8b3:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 8b6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8ba:	75 1b                	jne    8d7 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 8bc:	c7 44 24 04 64 09 00 	movl   $0x964,0x4(%esp)
 8c3:	00 
 8c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8cb:	e8 81 fb ff ff       	call   451 <printf>
        return 0;
 8d0:	b8 00 00 00 00       	mov    $0x0,%eax
 8d5:	eb 70                	jmp    947 <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 8d7:	8b 55 08             	mov    0x8(%ebp),%edx
 8da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 8e4:	00 
 8e5:	89 54 24 08          	mov    %edx,0x8(%esp)
 8e9:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 8f0:	00 
 8f1:	89 04 24             	mov    %eax,(%esp)
 8f4:	e8 6f fa ff ff       	call   368 <clone>
 8f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 8fc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 900:	79 1b                	jns    91d <thread_create+0xa3>
        printf(1,"clone fails\n");
 902:	c7 44 24 04 72 09 00 	movl   $0x972,0x4(%esp)
 909:	00 
 90a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 911:	e8 3b fb ff ff       	call   451 <printf>
        return 0;
 916:	b8 00 00 00 00       	mov    $0x0,%eax
 91b:	eb 2a                	jmp    947 <thread_create+0xcd>
    }
    if(tid > 0){
 91d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 921:	7e 05                	jle    928 <thread_create+0xae>
        return garbage_stack;
 923:	8b 45 f4             	mov    -0xc(%ebp),%eax
 926:	eb 1f                	jmp    947 <thread_create+0xcd>
    }
    if(tid == 0){
 928:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 92c:	75 14                	jne    942 <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 92e:	c7 44 24 04 7f 09 00 	movl   $0x97f,0x4(%esp)
 935:	00 
 936:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 93d:	e8 0f fb ff ff       	call   451 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 942:	b8 00 00 00 00       	mov    $0x0,%eax
}
 947:	c9                   	leave  
 948:	c3                   	ret    
