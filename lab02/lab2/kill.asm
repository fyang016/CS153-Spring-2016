
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
   f:	c7 44 24 04 c2 0b 00 	movl   $0xbc2,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 46 04 00 00       	call   469 <printf>
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

00000378 <tsleep>:
SYSCALL(tsleep)
 378:	b8 18 00 00 00       	mov    $0x18,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <twakeup>:
SYSCALL(twakeup)
 380:	b8 19 00 00 00       	mov    $0x19,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <test>:
SYSCALL(test)
 388:	b8 1a 00 00 00       	mov    $0x1a,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 390:	55                   	push   %ebp
 391:	89 e5                	mov    %esp,%ebp
 393:	83 ec 28             	sub    $0x28,%esp
 396:	8b 45 0c             	mov    0xc(%ebp),%eax
 399:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 39c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3a3:	00 
 3a4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 3ab:	8b 45 08             	mov    0x8(%ebp),%eax
 3ae:	89 04 24             	mov    %eax,(%esp)
 3b1:	e8 32 ff ff ff       	call   2e8 <write>
}
 3b6:	c9                   	leave  
 3b7:	c3                   	ret    

000003b8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3b8:	55                   	push   %ebp
 3b9:	89 e5                	mov    %esp,%ebp
 3bb:	53                   	push   %ebx
 3bc:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3c6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3ca:	74 17                	je     3e3 <printint+0x2b>
 3cc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3d0:	79 11                	jns    3e3 <printint+0x2b>
    neg = 1;
 3d2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dc:	f7 d8                	neg    %eax
 3de:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3e1:	eb 06                	jmp    3e9 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3e9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3f0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3f3:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f9:	ba 00 00 00 00       	mov    $0x0,%edx
 3fe:	f7 f3                	div    %ebx
 400:	89 d0                	mov    %edx,%eax
 402:	0f b6 80 20 0c 00 00 	movzbl 0xc20(%eax),%eax
 409:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 40d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 411:	8b 45 10             	mov    0x10(%ebp),%eax
 414:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 417:	8b 45 f4             	mov    -0xc(%ebp),%eax
 41a:	ba 00 00 00 00       	mov    $0x0,%edx
 41f:	f7 75 d4             	divl   -0x2c(%ebp)
 422:	89 45 f4             	mov    %eax,-0xc(%ebp)
 425:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 429:	75 c5                	jne    3f0 <printint+0x38>
  if(neg)
 42b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 42f:	74 28                	je     459 <printint+0xa1>
    buf[i++] = '-';
 431:	8b 45 ec             	mov    -0x14(%ebp),%eax
 434:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 439:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 43d:	eb 1a                	jmp    459 <printint+0xa1>
    putc(fd, buf[i]);
 43f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 442:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 447:	0f be c0             	movsbl %al,%eax
 44a:	89 44 24 04          	mov    %eax,0x4(%esp)
 44e:	8b 45 08             	mov    0x8(%ebp),%eax
 451:	89 04 24             	mov    %eax,(%esp)
 454:	e8 37 ff ff ff       	call   390 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 459:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 45d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 461:	79 dc                	jns    43f <printint+0x87>
    putc(fd, buf[i]);
}
 463:	83 c4 44             	add    $0x44,%esp
 466:	5b                   	pop    %ebx
 467:	5d                   	pop    %ebp
 468:	c3                   	ret    

00000469 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 469:	55                   	push   %ebp
 46a:	89 e5                	mov    %esp,%ebp
 46c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 46f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 476:	8d 45 0c             	lea    0xc(%ebp),%eax
 479:	83 c0 04             	add    $0x4,%eax
 47c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 47f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 486:	e9 7e 01 00 00       	jmp    609 <printf+0x1a0>
    c = fmt[i] & 0xff;
 48b:	8b 55 0c             	mov    0xc(%ebp),%edx
 48e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 491:	8d 04 02             	lea    (%edx,%eax,1),%eax
 494:	0f b6 00             	movzbl (%eax),%eax
 497:	0f be c0             	movsbl %al,%eax
 49a:	25 ff 00 00 00       	and    $0xff,%eax
 49f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 4a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a6:	75 2c                	jne    4d4 <printf+0x6b>
      if(c == '%'){
 4a8:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 4ac:	75 0c                	jne    4ba <printf+0x51>
        state = '%';
 4ae:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 4b5:	e9 4b 01 00 00       	jmp    605 <printf+0x19c>
      } else {
        putc(fd, c);
 4ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4bd:	0f be c0             	movsbl %al,%eax
 4c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c4:	8b 45 08             	mov    0x8(%ebp),%eax
 4c7:	89 04 24             	mov    %eax,(%esp)
 4ca:	e8 c1 fe ff ff       	call   390 <putc>
 4cf:	e9 31 01 00 00       	jmp    605 <printf+0x19c>
      }
    } else if(state == '%'){
 4d4:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4d8:	0f 85 27 01 00 00    	jne    605 <printf+0x19c>
      if(c == 'd'){
 4de:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4e2:	75 2d                	jne    511 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e7:	8b 00                	mov    (%eax),%eax
 4e9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4f0:	00 
 4f1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4f8:	00 
 4f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fd:	8b 45 08             	mov    0x8(%ebp),%eax
 500:	89 04 24             	mov    %eax,(%esp)
 503:	e8 b0 fe ff ff       	call   3b8 <printint>
        ap++;
 508:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 50c:	e9 ed 00 00 00       	jmp    5fe <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 511:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 515:	74 06                	je     51d <printf+0xb4>
 517:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 51b:	75 2d                	jne    54a <printf+0xe1>
        printint(fd, *ap, 16, 0);
 51d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 520:	8b 00                	mov    (%eax),%eax
 522:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 529:	00 
 52a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 531:	00 
 532:	89 44 24 04          	mov    %eax,0x4(%esp)
 536:	8b 45 08             	mov    0x8(%ebp),%eax
 539:	89 04 24             	mov    %eax,(%esp)
 53c:	e8 77 fe ff ff       	call   3b8 <printint>
        ap++;
 541:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 545:	e9 b4 00 00 00       	jmp    5fe <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 54a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 54e:	75 46                	jne    596 <printf+0x12d>
        s = (char*)*ap;
 550:	8b 45 f4             	mov    -0xc(%ebp),%eax
 553:	8b 00                	mov    (%eax),%eax
 555:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 558:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 55c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 560:	75 27                	jne    589 <printf+0x120>
          s = "(null)";
 562:	c7 45 e4 d6 0b 00 00 	movl   $0xbd6,-0x1c(%ebp)
        while(*s != 0){
 569:	eb 1f                	jmp    58a <printf+0x121>
          putc(fd, *s);
 56b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 56e:	0f b6 00             	movzbl (%eax),%eax
 571:	0f be c0             	movsbl %al,%eax
 574:	89 44 24 04          	mov    %eax,0x4(%esp)
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	89 04 24             	mov    %eax,(%esp)
 57e:	e8 0d fe ff ff       	call   390 <putc>
          s++;
 583:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 587:	eb 01                	jmp    58a <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 589:	90                   	nop
 58a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58d:	0f b6 00             	movzbl (%eax),%eax
 590:	84 c0                	test   %al,%al
 592:	75 d7                	jne    56b <printf+0x102>
 594:	eb 68                	jmp    5fe <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 596:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 59a:	75 1d                	jne    5b9 <printf+0x150>
        putc(fd, *ap);
 59c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59f:	8b 00                	mov    (%eax),%eax
 5a1:	0f be c0             	movsbl %al,%eax
 5a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a8:	8b 45 08             	mov    0x8(%ebp),%eax
 5ab:	89 04 24             	mov    %eax,(%esp)
 5ae:	e8 dd fd ff ff       	call   390 <putc>
        ap++;
 5b3:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5b7:	eb 45                	jmp    5fe <printf+0x195>
      } else if(c == '%'){
 5b9:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5bd:	75 17                	jne    5d6 <printf+0x16d>
        putc(fd, c);
 5bf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5c2:	0f be c0             	movsbl %al,%eax
 5c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c9:	8b 45 08             	mov    0x8(%ebp),%eax
 5cc:	89 04 24             	mov    %eax,(%esp)
 5cf:	e8 bc fd ff ff       	call   390 <putc>
 5d4:	eb 28                	jmp    5fe <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5d6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5dd:	00 
 5de:	8b 45 08             	mov    0x8(%ebp),%eax
 5e1:	89 04 24             	mov    %eax,(%esp)
 5e4:	e8 a7 fd ff ff       	call   390 <putc>
        putc(fd, c);
 5e9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ec:	0f be c0             	movsbl %al,%eax
 5ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f3:	8b 45 08             	mov    0x8(%ebp),%eax
 5f6:	89 04 24             	mov    %eax,(%esp)
 5f9:	e8 92 fd ff ff       	call   390 <putc>
      }
      state = 0;
 5fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 605:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 609:	8b 55 0c             	mov    0xc(%ebp),%edx
 60c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 60f:	8d 04 02             	lea    (%edx,%eax,1),%eax
 612:	0f b6 00             	movzbl (%eax),%eax
 615:	84 c0                	test   %al,%al
 617:	0f 85 6e fe ff ff    	jne    48b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 61d:	c9                   	leave  
 61e:	c3                   	ret    
 61f:	90                   	nop

00000620 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 620:	55                   	push   %ebp
 621:	89 e5                	mov    %esp,%ebp
 623:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 626:	8b 45 08             	mov    0x8(%ebp),%eax
 629:	83 e8 08             	sub    $0x8,%eax
 62c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62f:	a1 3c 0c 00 00       	mov    0xc3c,%eax
 634:	89 45 fc             	mov    %eax,-0x4(%ebp)
 637:	eb 24                	jmp    65d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 639:	8b 45 fc             	mov    -0x4(%ebp),%eax
 63c:	8b 00                	mov    (%eax),%eax
 63e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 641:	77 12                	ja     655 <free+0x35>
 643:	8b 45 f8             	mov    -0x8(%ebp),%eax
 646:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 649:	77 24                	ja     66f <free+0x4f>
 64b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64e:	8b 00                	mov    (%eax),%eax
 650:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 653:	77 1a                	ja     66f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 655:	8b 45 fc             	mov    -0x4(%ebp),%eax
 658:	8b 00                	mov    (%eax),%eax
 65a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 65d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 660:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 663:	76 d4                	jbe    639 <free+0x19>
 665:	8b 45 fc             	mov    -0x4(%ebp),%eax
 668:	8b 00                	mov    (%eax),%eax
 66a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 66d:	76 ca                	jbe    639 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 66f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 672:	8b 40 04             	mov    0x4(%eax),%eax
 675:	c1 e0 03             	shl    $0x3,%eax
 678:	89 c2                	mov    %eax,%edx
 67a:	03 55 f8             	add    -0x8(%ebp),%edx
 67d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 680:	8b 00                	mov    (%eax),%eax
 682:	39 c2                	cmp    %eax,%edx
 684:	75 24                	jne    6aa <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 686:	8b 45 f8             	mov    -0x8(%ebp),%eax
 689:	8b 50 04             	mov    0x4(%eax),%edx
 68c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68f:	8b 00                	mov    (%eax),%eax
 691:	8b 40 04             	mov    0x4(%eax),%eax
 694:	01 c2                	add    %eax,%edx
 696:	8b 45 f8             	mov    -0x8(%ebp),%eax
 699:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 69c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69f:	8b 00                	mov    (%eax),%eax
 6a1:	8b 10                	mov    (%eax),%edx
 6a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a6:	89 10                	mov    %edx,(%eax)
 6a8:	eb 0a                	jmp    6b4 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 6aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ad:	8b 10                	mov    (%eax),%edx
 6af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b7:	8b 40 04             	mov    0x4(%eax),%eax
 6ba:	c1 e0 03             	shl    $0x3,%eax
 6bd:	03 45 fc             	add    -0x4(%ebp),%eax
 6c0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6c3:	75 20                	jne    6e5 <free+0xc5>
    p->s.size += bp->s.size;
 6c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c8:	8b 50 04             	mov    0x4(%eax),%edx
 6cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ce:	8b 40 04             	mov    0x4(%eax),%eax
 6d1:	01 c2                	add    %eax,%edx
 6d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6dc:	8b 10                	mov    (%eax),%edx
 6de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e1:	89 10                	mov    %edx,(%eax)
 6e3:	eb 08                	jmp    6ed <free+0xcd>
  } else
    p->s.ptr = bp;
 6e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6eb:	89 10                	mov    %edx,(%eax)
  freep = p;
 6ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f0:	a3 3c 0c 00 00       	mov    %eax,0xc3c
}
 6f5:	c9                   	leave  
 6f6:	c3                   	ret    

000006f7 <morecore>:

static Header*
morecore(uint nu)
{
 6f7:	55                   	push   %ebp
 6f8:	89 e5                	mov    %esp,%ebp
 6fa:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6fd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 704:	77 07                	ja     70d <morecore+0x16>
    nu = 4096;
 706:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
 710:	c1 e0 03             	shl    $0x3,%eax
 713:	89 04 24             	mov    %eax,(%esp)
 716:	e8 35 fc ff ff       	call   350 <sbrk>
 71b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 71e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 722:	75 07                	jne    72b <morecore+0x34>
    return 0;
 724:	b8 00 00 00 00       	mov    $0x0,%eax
 729:	eb 22                	jmp    74d <morecore+0x56>
  hp = (Header*)p;
 72b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 731:	8b 45 f4             	mov    -0xc(%ebp),%eax
 734:	8b 55 08             	mov    0x8(%ebp),%edx
 737:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 73a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 73d:	83 c0 08             	add    $0x8,%eax
 740:	89 04 24             	mov    %eax,(%esp)
 743:	e8 d8 fe ff ff       	call   620 <free>
  return freep;
 748:	a1 3c 0c 00 00       	mov    0xc3c,%eax
}
 74d:	c9                   	leave  
 74e:	c3                   	ret    

0000074f <malloc>:

void*
malloc(uint nbytes)
{
 74f:	55                   	push   %ebp
 750:	89 e5                	mov    %esp,%ebp
 752:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 755:	8b 45 08             	mov    0x8(%ebp),%eax
 758:	83 c0 07             	add    $0x7,%eax
 75b:	c1 e8 03             	shr    $0x3,%eax
 75e:	83 c0 01             	add    $0x1,%eax
 761:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 764:	a1 3c 0c 00 00       	mov    0xc3c,%eax
 769:	89 45 f0             	mov    %eax,-0x10(%ebp)
 76c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 770:	75 23                	jne    795 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 772:	c7 45 f0 34 0c 00 00 	movl   $0xc34,-0x10(%ebp)
 779:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77c:	a3 3c 0c 00 00       	mov    %eax,0xc3c
 781:	a1 3c 0c 00 00       	mov    0xc3c,%eax
 786:	a3 34 0c 00 00       	mov    %eax,0xc34
    base.s.size = 0;
 78b:	c7 05 38 0c 00 00 00 	movl   $0x0,0xc38
 792:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 795:	8b 45 f0             	mov    -0x10(%ebp),%eax
 798:	8b 00                	mov    (%eax),%eax
 79a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 79d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a0:	8b 40 04             	mov    0x4(%eax),%eax
 7a3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7a6:	72 4d                	jb     7f5 <malloc+0xa6>
      if(p->s.size == nunits)
 7a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ab:	8b 40 04             	mov    0x4(%eax),%eax
 7ae:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7b1:	75 0c                	jne    7bf <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b6:	8b 10                	mov    (%eax),%edx
 7b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7bb:	89 10                	mov    %edx,(%eax)
 7bd:	eb 26                	jmp    7e5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7bf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c2:	8b 40 04             	mov    0x4(%eax),%eax
 7c5:	89 c2                	mov    %eax,%edx
 7c7:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7cd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d3:	8b 40 04             	mov    0x4(%eax),%eax
 7d6:	c1 e0 03             	shl    $0x3,%eax
 7d9:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7df:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7e2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e8:	a3 3c 0c 00 00       	mov    %eax,0xc3c
      return (void*)(p + 1);
 7ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f0:	83 c0 08             	add    $0x8,%eax
 7f3:	eb 38                	jmp    82d <malloc+0xde>
    }
    if(p == freep)
 7f5:	a1 3c 0c 00 00       	mov    0xc3c,%eax
 7fa:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7fd:	75 1b                	jne    81a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 802:	89 04 24             	mov    %eax,(%esp)
 805:	e8 ed fe ff ff       	call   6f7 <morecore>
 80a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 80d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 811:	75 07                	jne    81a <malloc+0xcb>
        return 0;
 813:	b8 00 00 00 00       	mov    $0x0,%eax
 818:	eb 13                	jmp    82d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 81a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 81d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 820:	8b 45 ec             	mov    -0x14(%ebp),%eax
 823:	8b 00                	mov    (%eax),%eax
 825:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 828:	e9 70 ff ff ff       	jmp    79d <malloc+0x4e>
}
 82d:	c9                   	leave  
 82e:	c3                   	ret    
 82f:	90                   	nop

00000830 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 830:	55                   	push   %ebp
 831:	89 e5                	mov    %esp,%ebp
 833:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 836:	8b 55 08             	mov    0x8(%ebp),%edx
 839:	8b 45 0c             	mov    0xc(%ebp),%eax
 83c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 83f:	f0 87 02             	lock xchg %eax,(%edx)
 842:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 845:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 848:	c9                   	leave  
 849:	c3                   	ret    

0000084a <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 84a:	55                   	push   %ebp
 84b:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 84d:	8b 45 08             	mov    0x8(%ebp),%eax
 850:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 856:	5d                   	pop    %ebp
 857:	c3                   	ret    

00000858 <lock_acquire>:
void lock_acquire(lock_t *lock){
 858:	55                   	push   %ebp
 859:	89 e5                	mov    %esp,%ebp
 85b:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 85e:	8b 45 08             	mov    0x8(%ebp),%eax
 861:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 868:	00 
 869:	89 04 24             	mov    %eax,(%esp)
 86c:	e8 bf ff ff ff       	call   830 <xchg>
 871:	85 c0                	test   %eax,%eax
 873:	75 e9                	jne    85e <lock_acquire+0x6>
}
 875:	c9                   	leave  
 876:	c3                   	ret    

00000877 <lock_release>:
void lock_release(lock_t *lock){
 877:	55                   	push   %ebp
 878:	89 e5                	mov    %esp,%ebp
 87a:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 87d:	8b 45 08             	mov    0x8(%ebp),%eax
 880:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 887:	00 
 888:	89 04 24             	mov    %eax,(%esp)
 88b:	e8 a0 ff ff ff       	call   830 <xchg>
}
 890:	c9                   	leave  
 891:	c3                   	ret    

00000892 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 892:	55                   	push   %ebp
 893:	89 e5                	mov    %esp,%ebp
 895:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 898:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 89f:	e8 ab fe ff ff       	call   74f <malloc>
 8a4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 8a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 8ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b0:	25 ff 0f 00 00       	and    $0xfff,%eax
 8b5:	85 c0                	test   %eax,%eax
 8b7:	74 15                	je     8ce <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 8b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8bc:	89 c2                	mov    %eax,%edx
 8be:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 8c4:	b8 00 10 00 00       	mov    $0x1000,%eax
 8c9:	29 d0                	sub    %edx,%eax
 8cb:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 8ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8d2:	75 1b                	jne    8ef <thread_create+0x5d>

        printf(1,"malloc fail \n");
 8d4:	c7 44 24 04 dd 0b 00 	movl   $0xbdd,0x4(%esp)
 8db:	00 
 8dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8e3:	e8 81 fb ff ff       	call   469 <printf>
        return 0;
 8e8:	b8 00 00 00 00       	mov    $0x0,%eax
 8ed:	eb 6f                	jmp    95e <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 8ef:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8f2:	8b 55 08             	mov    0x8(%ebp),%edx
 8f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8fc:	89 54 24 08          	mov    %edx,0x8(%esp)
 900:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 907:	00 
 908:	89 04 24             	mov    %eax,(%esp)
 90b:	e8 58 fa ff ff       	call   368 <clone>
 910:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 913:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 917:	79 1b                	jns    934 <thread_create+0xa2>
        printf(1,"clone fails\n");
 919:	c7 44 24 04 eb 0b 00 	movl   $0xbeb,0x4(%esp)
 920:	00 
 921:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 928:	e8 3c fb ff ff       	call   469 <printf>
        return 0;
 92d:	b8 00 00 00 00       	mov    $0x0,%eax
 932:	eb 2a                	jmp    95e <thread_create+0xcc>
    }
    if(tid > 0){
 934:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 938:	7e 05                	jle    93f <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 93a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93d:	eb 1f                	jmp    95e <thread_create+0xcc>
    }
    if(tid == 0){
 93f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 943:	75 14                	jne    959 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 945:	c7 44 24 04 f8 0b 00 	movl   $0xbf8,0x4(%esp)
 94c:	00 
 94d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 954:	e8 10 fb ff ff       	call   469 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 959:	b8 00 00 00 00       	mov    $0x0,%eax
}
 95e:	c9                   	leave  
 95f:	c3                   	ret    

00000960 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 960:	55                   	push   %ebp
 961:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 963:	8b 45 08             	mov    0x8(%ebp),%eax
 966:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 96c:	8b 45 08             	mov    0x8(%ebp),%eax
 96f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 976:	8b 45 08             	mov    0x8(%ebp),%eax
 979:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 980:	5d                   	pop    %ebp
 981:	c3                   	ret    

00000982 <add_q>:

void add_q(struct queue *q, int v){
 982:	55                   	push   %ebp
 983:	89 e5                	mov    %esp,%ebp
 985:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 988:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 98f:	e8 bb fd ff ff       	call   74f <malloc>
 994:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 997:	8b 45 f4             	mov    -0xc(%ebp),%eax
 99a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 9a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a4:	8b 55 0c             	mov    0xc(%ebp),%edx
 9a7:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 9a9:	8b 45 08             	mov    0x8(%ebp),%eax
 9ac:	8b 40 04             	mov    0x4(%eax),%eax
 9af:	85 c0                	test   %eax,%eax
 9b1:	75 0b                	jne    9be <add_q+0x3c>
        q->head = n;
 9b3:	8b 45 08             	mov    0x8(%ebp),%eax
 9b6:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9b9:	89 50 04             	mov    %edx,0x4(%eax)
 9bc:	eb 0c                	jmp    9ca <add_q+0x48>
    }else{
        q->tail->next = n;
 9be:	8b 45 08             	mov    0x8(%ebp),%eax
 9c1:	8b 40 08             	mov    0x8(%eax),%eax
 9c4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9c7:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 9ca:	8b 45 08             	mov    0x8(%ebp),%eax
 9cd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9d0:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 9d3:	8b 45 08             	mov    0x8(%ebp),%eax
 9d6:	8b 00                	mov    (%eax),%eax
 9d8:	8d 50 01             	lea    0x1(%eax),%edx
 9db:	8b 45 08             	mov    0x8(%ebp),%eax
 9de:	89 10                	mov    %edx,(%eax)
}
 9e0:	c9                   	leave  
 9e1:	c3                   	ret    

000009e2 <empty_q>:

int empty_q(struct queue *q){
 9e2:	55                   	push   %ebp
 9e3:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 9e5:	8b 45 08             	mov    0x8(%ebp),%eax
 9e8:	8b 00                	mov    (%eax),%eax
 9ea:	85 c0                	test   %eax,%eax
 9ec:	75 07                	jne    9f5 <empty_q+0x13>
        return 1;
 9ee:	b8 01 00 00 00       	mov    $0x1,%eax
 9f3:	eb 05                	jmp    9fa <empty_q+0x18>
    else
        return 0;
 9f5:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 9fa:	5d                   	pop    %ebp
 9fb:	c3                   	ret    

000009fc <pop_q>:
int pop_q(struct queue *q){
 9fc:	55                   	push   %ebp
 9fd:	89 e5                	mov    %esp,%ebp
 9ff:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a02:	8b 45 08             	mov    0x8(%ebp),%eax
 a05:	89 04 24             	mov    %eax,(%esp)
 a08:	e8 d5 ff ff ff       	call   9e2 <empty_q>
 a0d:	85 c0                	test   %eax,%eax
 a0f:	75 5d                	jne    a6e <pop_q+0x72>
       val = q->head->value; 
 a11:	8b 45 08             	mov    0x8(%ebp),%eax
 a14:	8b 40 04             	mov    0x4(%eax),%eax
 a17:	8b 00                	mov    (%eax),%eax
 a19:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 a1c:	8b 45 08             	mov    0x8(%ebp),%eax
 a1f:	8b 40 04             	mov    0x4(%eax),%eax
 a22:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 a25:	8b 45 08             	mov    0x8(%ebp),%eax
 a28:	8b 40 04             	mov    0x4(%eax),%eax
 a2b:	8b 50 04             	mov    0x4(%eax),%edx
 a2e:	8b 45 08             	mov    0x8(%ebp),%eax
 a31:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a34:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a37:	89 04 24             	mov    %eax,(%esp)
 a3a:	e8 e1 fb ff ff       	call   620 <free>
       q->size--;
 a3f:	8b 45 08             	mov    0x8(%ebp),%eax
 a42:	8b 00                	mov    (%eax),%eax
 a44:	8d 50 ff             	lea    -0x1(%eax),%edx
 a47:	8b 45 08             	mov    0x8(%ebp),%eax
 a4a:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a4c:	8b 45 08             	mov    0x8(%ebp),%eax
 a4f:	8b 00                	mov    (%eax),%eax
 a51:	85 c0                	test   %eax,%eax
 a53:	75 14                	jne    a69 <pop_q+0x6d>
            q->head = 0;
 a55:	8b 45 08             	mov    0x8(%ebp),%eax
 a58:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a5f:	8b 45 08             	mov    0x8(%ebp),%eax
 a62:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a69:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a6c:	eb 05                	jmp    a73 <pop_q+0x77>
    }
    return -1;
 a6e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a73:	c9                   	leave  
 a74:	c3                   	ret    
 a75:	90                   	nop
 a76:	90                   	nop
 a77:	90                   	nop

00000a78 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 a78:	55                   	push   %ebp
 a79:	89 e5                	mov    %esp,%ebp
 a7b:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 a7e:	8b 45 08             	mov    0x8(%ebp),%eax
 a81:	8b 55 0c             	mov    0xc(%ebp),%edx
 a84:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 a87:	8b 45 08             	mov    0x8(%ebp),%eax
 a8a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 a91:	8b 45 08             	mov    0x8(%ebp),%eax
 a94:	89 04 24             	mov    %eax,(%esp)
 a97:	e8 ae fd ff ff       	call   84a <lock_init>
}
 a9c:	c9                   	leave  
 a9d:	c3                   	ret    

00000a9e <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 a9e:	55                   	push   %ebp
 a9f:	89 e5                	mov    %esp,%ebp
 aa1:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 aa4:	8b 45 08             	mov    0x8(%ebp),%eax
 aa7:	89 04 24             	mov    %eax,(%esp)
 aaa:	e8 a9 fd ff ff       	call   858 <lock_acquire>
	if(s->count  == 0){
 aaf:	8b 45 08             	mov    0x8(%ebp),%eax
 ab2:	8b 40 04             	mov    0x4(%eax),%eax
 ab5:	85 c0                	test   %eax,%eax
 ab7:	75 43                	jne    afc <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 ab9:	c7 44 24 04 09 0c 00 	movl   $0xc09,0x4(%esp)
 ac0:	00 
 ac1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ac8:	e8 9c f9 ff ff       	call   469 <printf>
		//add proc to waiters list
		int tid = getpid();
 acd:	e8 76 f8 ff ff       	call   348 <getpid>
 ad2:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 ad5:	8b 45 08             	mov    0x8(%ebp),%eax
 ad8:	8d 50 0c             	lea    0xc(%eax),%edx
 adb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ade:	89 44 24 04          	mov    %eax,0x4(%esp)
 ae2:	89 14 24             	mov    %edx,(%esp)
 ae5:	e8 98 fe ff ff       	call   982 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 aea:	8b 45 08             	mov    0x8(%ebp),%eax
 aed:	89 04 24             	mov    %eax,(%esp)
 af0:	e8 82 fd ff ff       	call   877 <lock_release>
		tsleep(); 
 af5:	e8 7e f8 ff ff       	call   378 <tsleep>
 afa:	eb 2e                	jmp    b2a <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 afc:	c7 44 24 04 10 0c 00 	movl   $0xc10,0x4(%esp)
 b03:	00 
 b04:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b0b:	e8 59 f9 ff ff       	call   469 <printf>
		s->count--;	
 b10:	8b 45 08             	mov    0x8(%ebp),%eax
 b13:	8b 40 04             	mov    0x4(%eax),%eax
 b16:	8d 50 ff             	lea    -0x1(%eax),%edx
 b19:	8b 45 08             	mov    0x8(%ebp),%eax
 b1c:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b1f:	8b 45 08             	mov    0x8(%ebp),%eax
 b22:	89 04 24             	mov    %eax,(%esp)
 b25:	e8 4d fd ff ff       	call   877 <lock_release>
	}
}
 b2a:	c9                   	leave  
 b2b:	c3                   	ret    

00000b2c <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b2c:	55                   	push   %ebp
 b2d:	89 e5                	mov    %esp,%ebp
 b2f:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 b32:	c7 44 24 04 17 0c 00 	movl   $0xc17,0x4(%esp)
 b39:	00 
 b3a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b41:	e8 23 f9 ff ff       	call   469 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b46:	8b 45 08             	mov    0x8(%ebp),%eax
 b49:	89 04 24             	mov    %eax,(%esp)
 b4c:	e8 07 fd ff ff       	call   858 <lock_acquire>
	if(s->count < s->size){
 b51:	8b 45 08             	mov    0x8(%ebp),%eax
 b54:	8b 50 04             	mov    0x4(%eax),%edx
 b57:	8b 45 08             	mov    0x8(%ebp),%eax
 b5a:	8b 40 08             	mov    0x8(%eax),%eax
 b5d:	39 c2                	cmp    %eax,%edx
 b5f:	7d 0f                	jge    b70 <sem_signal+0x44>
		s->count++;	
 b61:	8b 45 08             	mov    0x8(%ebp),%eax
 b64:	8b 40 04             	mov    0x4(%eax),%eax
 b67:	8d 50 01             	lea    0x1(%eax),%edx
 b6a:	8b 45 08             	mov    0x8(%ebp),%eax
 b6d:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 b70:	8b 45 08             	mov    0x8(%ebp),%eax
 b73:	83 c0 0c             	add    $0xc,%eax
 b76:	89 04 24             	mov    %eax,(%esp)
 b79:	e8 7e fe ff ff       	call   9fc <pop_q>
 b7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 b81:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b85:	74 2e                	je     bb5 <sem_signal+0x89>
		printf(1, "Sem A\n");
 b87:	c7 44 24 04 10 0c 00 	movl   $0xc10,0x4(%esp)
 b8e:	00 
 b8f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b96:	e8 ce f8 ff ff       	call   469 <printf>
		twakeup(tid);
 b9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b9e:	89 04 24             	mov    %eax,(%esp)
 ba1:	e8 da f7 ff ff       	call   380 <twakeup>
		s->count--;
 ba6:	8b 45 08             	mov    0x8(%ebp),%eax
 ba9:	8b 40 04             	mov    0x4(%eax),%eax
 bac:	8d 50 ff             	lea    -0x1(%eax),%edx
 baf:	8b 45 08             	mov    0x8(%ebp),%eax
 bb2:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 bb5:	8b 45 08             	mov    0x8(%ebp),%eax
 bb8:	89 04 24             	mov    %eax,(%esp)
 bbb:	e8 b7 fc ff ff       	call   877 <lock_release>

 bc0:	c9                   	leave  
 bc1:	c3                   	ret    
