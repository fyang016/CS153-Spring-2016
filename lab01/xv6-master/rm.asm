
_rm:     file format elf32-i386


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

  if(argc < 2){
   9:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
   d:	7f 20                	jg     2f <main+0x2f>
    printf(2, "Usage: rm files...\n");
   f:	c7 44 24 04 4f 08 00 	movl   $0x84f,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 66 04 00 00       	call   489 <printf>
    exit(1);
  23:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2a:	e8 c9 02 00 00       	call   2f8 <exit>
  }

  for(i = 1; i < argc; i++){
  2f:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  36:	00 
  37:	eb 43                	jmp    7c <main+0x7c>
    if(unlink(argv[i]) < 0){
  39:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  3d:	c1 e0 02             	shl    $0x2,%eax
  40:	03 45 0c             	add    0xc(%ebp),%eax
  43:	8b 00                	mov    (%eax),%eax
  45:	89 04 24             	mov    %eax,(%esp)
  48:	e8 03 03 00 00       	call   350 <unlink>
  4d:	85 c0                	test   %eax,%eax
  4f:	79 26                	jns    77 <main+0x77>
      printf(2, "rm: %s failed to delete\n", argv[i]);
  51:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  55:	c1 e0 02             	shl    $0x2,%eax
  58:	03 45 0c             	add    0xc(%ebp),%eax
  5b:	8b 00                	mov    (%eax),%eax
  5d:	89 44 24 08          	mov    %eax,0x8(%esp)
  61:	c7 44 24 04 63 08 00 	movl   $0x863,0x4(%esp)
  68:	00 
  69:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  70:	e8 14 04 00 00       	call   489 <printf>
      break;
  75:	eb 0e                	jmp    85 <main+0x85>
  if(argc < 2){
    printf(2, "Usage: rm files...\n");
    exit(1);
  }

  for(i = 1; i < argc; i++){
  77:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  7c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  80:	3b 45 08             	cmp    0x8(%ebp),%eax
  83:	7c b4                	jl     39 <main+0x39>
      printf(2, "rm: %s failed to delete\n", argv[i]);
      break;
    }
  }

  exit(0);
  85:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  8c:	e8 67 02 00 00       	call   2f8 <exit>
  91:	90                   	nop
  92:	90                   	nop
  93:	90                   	nop

00000094 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  94:	55                   	push   %ebp
  95:	89 e5                	mov    %esp,%ebp
  97:	57                   	push   %edi
  98:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  99:	8b 4d 08             	mov    0x8(%ebp),%ecx
  9c:	8b 55 10             	mov    0x10(%ebp),%edx
  9f:	8b 45 0c             	mov    0xc(%ebp),%eax
  a2:	89 cb                	mov    %ecx,%ebx
  a4:	89 df                	mov    %ebx,%edi
  a6:	89 d1                	mov    %edx,%ecx
  a8:	fc                   	cld    
  a9:	f3 aa                	rep stos %al,%es:(%edi)
  ab:	89 ca                	mov    %ecx,%edx
  ad:	89 fb                	mov    %edi,%ebx
  af:	89 5d 08             	mov    %ebx,0x8(%ebp)
  b2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b5:	5b                   	pop    %ebx
  b6:	5f                   	pop    %edi
  b7:	5d                   	pop    %ebp
  b8:	c3                   	ret    

000000b9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  b9:	55                   	push   %ebp
  ba:	89 e5                	mov    %esp,%ebp
  bc:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  bf:	8b 45 08             	mov    0x8(%ebp),%eax
  c2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c5:	8b 45 0c             	mov    0xc(%ebp),%eax
  c8:	0f b6 10             	movzbl (%eax),%edx
  cb:	8b 45 08             	mov    0x8(%ebp),%eax
  ce:	88 10                	mov    %dl,(%eax)
  d0:	8b 45 08             	mov    0x8(%ebp),%eax
  d3:	0f b6 00             	movzbl (%eax),%eax
  d6:	84 c0                	test   %al,%al
  d8:	0f 95 c0             	setne  %al
  db:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  df:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  e3:	84 c0                	test   %al,%al
  e5:	75 de                	jne    c5 <strcpy+0xc>
    ;
  return os;
  e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  ea:	c9                   	leave  
  eb:	c3                   	ret    

000000ec <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ec:	55                   	push   %ebp
  ed:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  ef:	eb 08                	jmp    f9 <strcmp+0xd>
    p++, q++;
  f1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  f5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f9:	8b 45 08             	mov    0x8(%ebp),%eax
  fc:	0f b6 00             	movzbl (%eax),%eax
  ff:	84 c0                	test   %al,%al
 101:	74 10                	je     113 <strcmp+0x27>
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	0f b6 10             	movzbl (%eax),%edx
 109:	8b 45 0c             	mov    0xc(%ebp),%eax
 10c:	0f b6 00             	movzbl (%eax),%eax
 10f:	38 c2                	cmp    %al,%dl
 111:	74 de                	je     f1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 113:	8b 45 08             	mov    0x8(%ebp),%eax
 116:	0f b6 00             	movzbl (%eax),%eax
 119:	0f b6 d0             	movzbl %al,%edx
 11c:	8b 45 0c             	mov    0xc(%ebp),%eax
 11f:	0f b6 00             	movzbl (%eax),%eax
 122:	0f b6 c0             	movzbl %al,%eax
 125:	89 d1                	mov    %edx,%ecx
 127:	29 c1                	sub    %eax,%ecx
 129:	89 c8                	mov    %ecx,%eax
}
 12b:	5d                   	pop    %ebp
 12c:	c3                   	ret    

0000012d <strlen>:

uint
strlen(char *s)
{
 12d:	55                   	push   %ebp
 12e:	89 e5                	mov    %esp,%ebp
 130:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 133:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 13a:	eb 04                	jmp    140 <strlen+0x13>
 13c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 140:	8b 45 fc             	mov    -0x4(%ebp),%eax
 143:	03 45 08             	add    0x8(%ebp),%eax
 146:	0f b6 00             	movzbl (%eax),%eax
 149:	84 c0                	test   %al,%al
 14b:	75 ef                	jne    13c <strlen+0xf>
    ;
  return n;
 14d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 150:	c9                   	leave  
 151:	c3                   	ret    

00000152 <memset>:

void*
memset(void *dst, int c, uint n)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 158:	8b 45 10             	mov    0x10(%ebp),%eax
 15b:	89 44 24 08          	mov    %eax,0x8(%esp)
 15f:	8b 45 0c             	mov    0xc(%ebp),%eax
 162:	89 44 24 04          	mov    %eax,0x4(%esp)
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	89 04 24             	mov    %eax,(%esp)
 16c:	e8 23 ff ff ff       	call   94 <stosb>
  return dst;
 171:	8b 45 08             	mov    0x8(%ebp),%eax
}
 174:	c9                   	leave  
 175:	c3                   	ret    

00000176 <strchr>:

char*
strchr(const char *s, char c)
{
 176:	55                   	push   %ebp
 177:	89 e5                	mov    %esp,%ebp
 179:	83 ec 04             	sub    $0x4,%esp
 17c:	8b 45 0c             	mov    0xc(%ebp),%eax
 17f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 182:	eb 14                	jmp    198 <strchr+0x22>
    if(*s == c)
 184:	8b 45 08             	mov    0x8(%ebp),%eax
 187:	0f b6 00             	movzbl (%eax),%eax
 18a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 18d:	75 05                	jne    194 <strchr+0x1e>
      return (char*)s;
 18f:	8b 45 08             	mov    0x8(%ebp),%eax
 192:	eb 13                	jmp    1a7 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 194:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 198:	8b 45 08             	mov    0x8(%ebp),%eax
 19b:	0f b6 00             	movzbl (%eax),%eax
 19e:	84 c0                	test   %al,%al
 1a0:	75 e2                	jne    184 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1a2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1a7:	c9                   	leave  
 1a8:	c3                   	ret    

000001a9 <gets>:

char*
gets(char *buf, int max)
{
 1a9:	55                   	push   %ebp
 1aa:	89 e5                	mov    %esp,%ebp
 1ac:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1b6:	eb 44                	jmp    1fc <gets+0x53>
    cc = read(0, &c, 1);
 1b8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1bf:	00 
 1c0:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 1c7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1ce:	e8 45 01 00 00       	call   318 <read>
 1d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 1d6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1da:	7e 2d                	jle    209 <gets+0x60>
      break;
    buf[i++] = c;
 1dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1df:	03 45 08             	add    0x8(%ebp),%eax
 1e2:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1e6:	88 10                	mov    %dl,(%eax)
 1e8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 1ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f0:	3c 0a                	cmp    $0xa,%al
 1f2:	74 16                	je     20a <gets+0x61>
 1f4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f8:	3c 0d                	cmp    $0xd,%al
 1fa:	74 0e                	je     20a <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1ff:	83 c0 01             	add    $0x1,%eax
 202:	3b 45 0c             	cmp    0xc(%ebp),%eax
 205:	7c b1                	jl     1b8 <gets+0xf>
 207:	eb 01                	jmp    20a <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 209:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 20a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 20d:	03 45 08             	add    0x8(%ebp),%eax
 210:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 213:	8b 45 08             	mov    0x8(%ebp),%eax
}
 216:	c9                   	leave  
 217:	c3                   	ret    

00000218 <stat>:

int
stat(char *n, struct stat *st)
{
 218:	55                   	push   %ebp
 219:	89 e5                	mov    %esp,%ebp
 21b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 21e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 225:	00 
 226:	8b 45 08             	mov    0x8(%ebp),%eax
 229:	89 04 24             	mov    %eax,(%esp)
 22c:	e8 0f 01 00 00       	call   340 <open>
 231:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 234:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 238:	79 07                	jns    241 <stat+0x29>
    return -1;
 23a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23f:	eb 23                	jmp    264 <stat+0x4c>
  r = fstat(fd, st);
 241:	8b 45 0c             	mov    0xc(%ebp),%eax
 244:	89 44 24 04          	mov    %eax,0x4(%esp)
 248:	8b 45 f0             	mov    -0x10(%ebp),%eax
 24b:	89 04 24             	mov    %eax,(%esp)
 24e:	e8 05 01 00 00       	call   358 <fstat>
 253:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 256:	8b 45 f0             	mov    -0x10(%ebp),%eax
 259:	89 04 24             	mov    %eax,(%esp)
 25c:	e8 c7 00 00 00       	call   328 <close>
  return r;
 261:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 264:	c9                   	leave  
 265:	c3                   	ret    

00000266 <atoi>:

int
atoi(const char *s)
{
 266:	55                   	push   %ebp
 267:	89 e5                	mov    %esp,%ebp
 269:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 26c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 273:	eb 24                	jmp    299 <atoi+0x33>
    n = n*10 + *s++ - '0';
 275:	8b 55 fc             	mov    -0x4(%ebp),%edx
 278:	89 d0                	mov    %edx,%eax
 27a:	c1 e0 02             	shl    $0x2,%eax
 27d:	01 d0                	add    %edx,%eax
 27f:	01 c0                	add    %eax,%eax
 281:	89 c2                	mov    %eax,%edx
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 00             	movzbl (%eax),%eax
 289:	0f be c0             	movsbl %al,%eax
 28c:	8d 04 02             	lea    (%edx,%eax,1),%eax
 28f:	83 e8 30             	sub    $0x30,%eax
 292:	89 45 fc             	mov    %eax,-0x4(%ebp)
 295:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	0f b6 00             	movzbl (%eax),%eax
 29f:	3c 2f                	cmp    $0x2f,%al
 2a1:	7e 0a                	jle    2ad <atoi+0x47>
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 00             	movzbl (%eax),%eax
 2a9:	3c 39                	cmp    $0x39,%al
 2ab:	7e c8                	jle    275 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2b0:	c9                   	leave  
 2b1:	c3                   	ret    

000002b2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2b2:	55                   	push   %ebp
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2b8:	8b 45 08             	mov    0x8(%ebp),%eax
 2bb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 2c4:	eb 13                	jmp    2d9 <memmove+0x27>
    *dst++ = *src++;
 2c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c9:	0f b6 10             	movzbl (%eax),%edx
 2cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2cf:	88 10                	mov    %dl,(%eax)
 2d1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 2d5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2dd:	0f 9f c0             	setg   %al
 2e0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2e4:	84 c0                	test   %al,%al
 2e6:	75 de                	jne    2c6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2e8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2eb:	c9                   	leave  
 2ec:	c3                   	ret    
 2ed:	90                   	nop
 2ee:	90                   	nop
 2ef:	90                   	nop

000002f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2f0:	b8 01 00 00 00       	mov    $0x1,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <exit>:
SYSCALL(exit)
 2f8:	b8 02 00 00 00       	mov    $0x2,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <wait>:
SYSCALL(wait)
 300:	b8 03 00 00 00       	mov    $0x3,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <waitpid>:
SYSCALL(waitpid)
 308:	b8 17 00 00 00       	mov    $0x17,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <pipe>:
SYSCALL(pipe)
 310:	b8 04 00 00 00       	mov    $0x4,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <read>:
SYSCALL(read)
 318:	b8 05 00 00 00       	mov    $0x5,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <write>:
SYSCALL(write)
 320:	b8 10 00 00 00       	mov    $0x10,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <close>:
SYSCALL(close)
 328:	b8 15 00 00 00       	mov    $0x15,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <kill>:
SYSCALL(kill)
 330:	b8 06 00 00 00       	mov    $0x6,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <exec>:
SYSCALL(exec)
 338:	b8 07 00 00 00       	mov    $0x7,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <open>:
SYSCALL(open)
 340:	b8 0f 00 00 00       	mov    $0xf,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <mknod>:
SYSCALL(mknod)
 348:	b8 11 00 00 00       	mov    $0x11,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <unlink>:
SYSCALL(unlink)
 350:	b8 12 00 00 00       	mov    $0x12,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <fstat>:
SYSCALL(fstat)
 358:	b8 08 00 00 00       	mov    $0x8,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <link>:
SYSCALL(link)
 360:	b8 13 00 00 00       	mov    $0x13,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <mkdir>:
SYSCALL(mkdir)
 368:	b8 14 00 00 00       	mov    $0x14,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <chdir>:
SYSCALL(chdir)
 370:	b8 09 00 00 00       	mov    $0x9,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <dup>:
SYSCALL(dup)
 378:	b8 0a 00 00 00       	mov    $0xa,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <getpid>:
SYSCALL(getpid)
 380:	b8 0b 00 00 00       	mov    $0xb,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <sbrk>:
SYSCALL(sbrk)
 388:	b8 0c 00 00 00       	mov    $0xc,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <sleep>:
SYSCALL(sleep)
 390:	b8 0d 00 00 00       	mov    $0xd,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <uptime>:
SYSCALL(uptime)
 398:	b8 0e 00 00 00       	mov    $0xe,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <count>:
SYSCALL(count)
 3a0:	b8 16 00 00 00       	mov    $0x16,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <change_priority>:
SYSCALL(change_priority)
 3a8:	b8 18 00 00 00       	mov    $0x18,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	83 ec 28             	sub    $0x28,%esp
 3b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3bc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3c3:	00 
 3c4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 3cb:	8b 45 08             	mov    0x8(%ebp),%eax
 3ce:	89 04 24             	mov    %eax,(%esp)
 3d1:	e8 4a ff ff ff       	call   320 <write>
}
 3d6:	c9                   	leave  
 3d7:	c3                   	ret    

000003d8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3d8:	55                   	push   %ebp
 3d9:	89 e5                	mov    %esp,%ebp
 3db:	53                   	push   %ebx
 3dc:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3e6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3ea:	74 17                	je     403 <printint+0x2b>
 3ec:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3f0:	79 11                	jns    403 <printint+0x2b>
    neg = 1;
 3f2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3f9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fc:	f7 d8                	neg    %eax
 3fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 401:	eb 06                	jmp    409 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 403:	8b 45 0c             	mov    0xc(%ebp),%eax
 406:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 409:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 410:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 413:	8b 5d 10             	mov    0x10(%ebp),%ebx
 416:	8b 45 f4             	mov    -0xc(%ebp),%eax
 419:	ba 00 00 00 00       	mov    $0x0,%edx
 41e:	f7 f3                	div    %ebx
 420:	89 d0                	mov    %edx,%eax
 422:	0f b6 80 84 08 00 00 	movzbl 0x884(%eax),%eax
 429:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 42d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 431:	8b 45 10             	mov    0x10(%ebp),%eax
 434:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 437:	8b 45 f4             	mov    -0xc(%ebp),%eax
 43a:	ba 00 00 00 00       	mov    $0x0,%edx
 43f:	f7 75 d4             	divl   -0x2c(%ebp)
 442:	89 45 f4             	mov    %eax,-0xc(%ebp)
 445:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 449:	75 c5                	jne    410 <printint+0x38>
  if(neg)
 44b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 44f:	74 28                	je     479 <printint+0xa1>
    buf[i++] = '-';
 451:	8b 45 ec             	mov    -0x14(%ebp),%eax
 454:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 459:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 45d:	eb 1a                	jmp    479 <printint+0xa1>
    putc(fd, buf[i]);
 45f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 462:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 467:	0f be c0             	movsbl %al,%eax
 46a:	89 44 24 04          	mov    %eax,0x4(%esp)
 46e:	8b 45 08             	mov    0x8(%ebp),%eax
 471:	89 04 24             	mov    %eax,(%esp)
 474:	e8 37 ff ff ff       	call   3b0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 479:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 47d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 481:	79 dc                	jns    45f <printint+0x87>
    putc(fd, buf[i]);
}
 483:	83 c4 44             	add    $0x44,%esp
 486:	5b                   	pop    %ebx
 487:	5d                   	pop    %ebp
 488:	c3                   	ret    

00000489 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 489:	55                   	push   %ebp
 48a:	89 e5                	mov    %esp,%ebp
 48c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 48f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 496:	8d 45 0c             	lea    0xc(%ebp),%eax
 499:	83 c0 04             	add    $0x4,%eax
 49c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 49f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 4a6:	e9 7e 01 00 00       	jmp    629 <printf+0x1a0>
    c = fmt[i] & 0xff;
 4ab:	8b 55 0c             	mov    0xc(%ebp),%edx
 4ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4b1:	8d 04 02             	lea    (%edx,%eax,1),%eax
 4b4:	0f b6 00             	movzbl (%eax),%eax
 4b7:	0f be c0             	movsbl %al,%eax
 4ba:	25 ff 00 00 00       	and    $0xff,%eax
 4bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 4c2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4c6:	75 2c                	jne    4f4 <printf+0x6b>
      if(c == '%'){
 4c8:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 4cc:	75 0c                	jne    4da <printf+0x51>
        state = '%';
 4ce:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 4d5:	e9 4b 01 00 00       	jmp    625 <printf+0x19c>
      } else {
        putc(fd, c);
 4da:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4dd:	0f be c0             	movsbl %al,%eax
 4e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e4:	8b 45 08             	mov    0x8(%ebp),%eax
 4e7:	89 04 24             	mov    %eax,(%esp)
 4ea:	e8 c1 fe ff ff       	call   3b0 <putc>
 4ef:	e9 31 01 00 00       	jmp    625 <printf+0x19c>
      }
    } else if(state == '%'){
 4f4:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4f8:	0f 85 27 01 00 00    	jne    625 <printf+0x19c>
      if(c == 'd'){
 4fe:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 502:	75 2d                	jne    531 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 504:	8b 45 f4             	mov    -0xc(%ebp),%eax
 507:	8b 00                	mov    (%eax),%eax
 509:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 510:	00 
 511:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 518:	00 
 519:	89 44 24 04          	mov    %eax,0x4(%esp)
 51d:	8b 45 08             	mov    0x8(%ebp),%eax
 520:	89 04 24             	mov    %eax,(%esp)
 523:	e8 b0 fe ff ff       	call   3d8 <printint>
        ap++;
 528:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 52c:	e9 ed 00 00 00       	jmp    61e <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 531:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 535:	74 06                	je     53d <printf+0xb4>
 537:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 53b:	75 2d                	jne    56a <printf+0xe1>
        printint(fd, *ap, 16, 0);
 53d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 540:	8b 00                	mov    (%eax),%eax
 542:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 549:	00 
 54a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 551:	00 
 552:	89 44 24 04          	mov    %eax,0x4(%esp)
 556:	8b 45 08             	mov    0x8(%ebp),%eax
 559:	89 04 24             	mov    %eax,(%esp)
 55c:	e8 77 fe ff ff       	call   3d8 <printint>
        ap++;
 561:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 565:	e9 b4 00 00 00       	jmp    61e <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 56a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 56e:	75 46                	jne    5b6 <printf+0x12d>
        s = (char*)*ap;
 570:	8b 45 f4             	mov    -0xc(%ebp),%eax
 573:	8b 00                	mov    (%eax),%eax
 575:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 578:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 57c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 580:	75 27                	jne    5a9 <printf+0x120>
          s = "(null)";
 582:	c7 45 e4 7c 08 00 00 	movl   $0x87c,-0x1c(%ebp)
        while(*s != 0){
 589:	eb 1f                	jmp    5aa <printf+0x121>
          putc(fd, *s);
 58b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58e:	0f b6 00             	movzbl (%eax),%eax
 591:	0f be c0             	movsbl %al,%eax
 594:	89 44 24 04          	mov    %eax,0x4(%esp)
 598:	8b 45 08             	mov    0x8(%ebp),%eax
 59b:	89 04 24             	mov    %eax,(%esp)
 59e:	e8 0d fe ff ff       	call   3b0 <putc>
          s++;
 5a3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 5a7:	eb 01                	jmp    5aa <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5a9:	90                   	nop
 5aa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ad:	0f b6 00             	movzbl (%eax),%eax
 5b0:	84 c0                	test   %al,%al
 5b2:	75 d7                	jne    58b <printf+0x102>
 5b4:	eb 68                	jmp    61e <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5b6:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 5ba:	75 1d                	jne    5d9 <printf+0x150>
        putc(fd, *ap);
 5bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5bf:	8b 00                	mov    (%eax),%eax
 5c1:	0f be c0             	movsbl %al,%eax
 5c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c8:	8b 45 08             	mov    0x8(%ebp),%eax
 5cb:	89 04 24             	mov    %eax,(%esp)
 5ce:	e8 dd fd ff ff       	call   3b0 <putc>
        ap++;
 5d3:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5d7:	eb 45                	jmp    61e <printf+0x195>
      } else if(c == '%'){
 5d9:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5dd:	75 17                	jne    5f6 <printf+0x16d>
        putc(fd, c);
 5df:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e2:	0f be c0             	movsbl %al,%eax
 5e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ec:	89 04 24             	mov    %eax,(%esp)
 5ef:	e8 bc fd ff ff       	call   3b0 <putc>
 5f4:	eb 28                	jmp    61e <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5f6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5fd:	00 
 5fe:	8b 45 08             	mov    0x8(%ebp),%eax
 601:	89 04 24             	mov    %eax,(%esp)
 604:	e8 a7 fd ff ff       	call   3b0 <putc>
        putc(fd, c);
 609:	8b 45 e8             	mov    -0x18(%ebp),%eax
 60c:	0f be c0             	movsbl %al,%eax
 60f:	89 44 24 04          	mov    %eax,0x4(%esp)
 613:	8b 45 08             	mov    0x8(%ebp),%eax
 616:	89 04 24             	mov    %eax,(%esp)
 619:	e8 92 fd ff ff       	call   3b0 <putc>
      }
      state = 0;
 61e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 625:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 629:	8b 55 0c             	mov    0xc(%ebp),%edx
 62c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 62f:	8d 04 02             	lea    (%edx,%eax,1),%eax
 632:	0f b6 00             	movzbl (%eax),%eax
 635:	84 c0                	test   %al,%al
 637:	0f 85 6e fe ff ff    	jne    4ab <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 63d:	c9                   	leave  
 63e:	c3                   	ret    
 63f:	90                   	nop

00000640 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 640:	55                   	push   %ebp
 641:	89 e5                	mov    %esp,%ebp
 643:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 646:	8b 45 08             	mov    0x8(%ebp),%eax
 649:	83 e8 08             	sub    $0x8,%eax
 64c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64f:	a1 a0 08 00 00       	mov    0x8a0,%eax
 654:	89 45 fc             	mov    %eax,-0x4(%ebp)
 657:	eb 24                	jmp    67d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 659:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65c:	8b 00                	mov    (%eax),%eax
 65e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 661:	77 12                	ja     675 <free+0x35>
 663:	8b 45 f8             	mov    -0x8(%ebp),%eax
 666:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 669:	77 24                	ja     68f <free+0x4f>
 66b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66e:	8b 00                	mov    (%eax),%eax
 670:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 673:	77 1a                	ja     68f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 675:	8b 45 fc             	mov    -0x4(%ebp),%eax
 678:	8b 00                	mov    (%eax),%eax
 67a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 67d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 680:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 683:	76 d4                	jbe    659 <free+0x19>
 685:	8b 45 fc             	mov    -0x4(%ebp),%eax
 688:	8b 00                	mov    (%eax),%eax
 68a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 68d:	76 ca                	jbe    659 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 68f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 692:	8b 40 04             	mov    0x4(%eax),%eax
 695:	c1 e0 03             	shl    $0x3,%eax
 698:	89 c2                	mov    %eax,%edx
 69a:	03 55 f8             	add    -0x8(%ebp),%edx
 69d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a0:	8b 00                	mov    (%eax),%eax
 6a2:	39 c2                	cmp    %eax,%edx
 6a4:	75 24                	jne    6ca <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 6a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a9:	8b 50 04             	mov    0x4(%eax),%edx
 6ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6af:	8b 00                	mov    (%eax),%eax
 6b1:	8b 40 04             	mov    0x4(%eax),%eax
 6b4:	01 c2                	add    %eax,%edx
 6b6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bf:	8b 00                	mov    (%eax),%eax
 6c1:	8b 10                	mov    (%eax),%edx
 6c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c6:	89 10                	mov    %edx,(%eax)
 6c8:	eb 0a                	jmp    6d4 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 6ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cd:	8b 10                	mov    (%eax),%edx
 6cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d7:	8b 40 04             	mov    0x4(%eax),%eax
 6da:	c1 e0 03             	shl    $0x3,%eax
 6dd:	03 45 fc             	add    -0x4(%ebp),%eax
 6e0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6e3:	75 20                	jne    705 <free+0xc5>
    p->s.size += bp->s.size;
 6e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e8:	8b 50 04             	mov    0x4(%eax),%edx
 6eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ee:	8b 40 04             	mov    0x4(%eax),%eax
 6f1:	01 c2                	add    %eax,%edx
 6f3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fc:	8b 10                	mov    (%eax),%edx
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	89 10                	mov    %edx,(%eax)
 703:	eb 08                	jmp    70d <free+0xcd>
  } else
    p->s.ptr = bp;
 705:	8b 45 fc             	mov    -0x4(%ebp),%eax
 708:	8b 55 f8             	mov    -0x8(%ebp),%edx
 70b:	89 10                	mov    %edx,(%eax)
  freep = p;
 70d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 710:	a3 a0 08 00 00       	mov    %eax,0x8a0
}
 715:	c9                   	leave  
 716:	c3                   	ret    

00000717 <morecore>:

static Header*
morecore(uint nu)
{
 717:	55                   	push   %ebp
 718:	89 e5                	mov    %esp,%ebp
 71a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 71d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 724:	77 07                	ja     72d <morecore+0x16>
    nu = 4096;
 726:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 72d:	8b 45 08             	mov    0x8(%ebp),%eax
 730:	c1 e0 03             	shl    $0x3,%eax
 733:	89 04 24             	mov    %eax,(%esp)
 736:	e8 4d fc ff ff       	call   388 <sbrk>
 73b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 73e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 742:	75 07                	jne    74b <morecore+0x34>
    return 0;
 744:	b8 00 00 00 00       	mov    $0x0,%eax
 749:	eb 22                	jmp    76d <morecore+0x56>
  hp = (Header*)p;
 74b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 751:	8b 45 f4             	mov    -0xc(%ebp),%eax
 754:	8b 55 08             	mov    0x8(%ebp),%edx
 757:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 75a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75d:	83 c0 08             	add    $0x8,%eax
 760:	89 04 24             	mov    %eax,(%esp)
 763:	e8 d8 fe ff ff       	call   640 <free>
  return freep;
 768:	a1 a0 08 00 00       	mov    0x8a0,%eax
}
 76d:	c9                   	leave  
 76e:	c3                   	ret    

0000076f <malloc>:

void*
malloc(uint nbytes)
{
 76f:	55                   	push   %ebp
 770:	89 e5                	mov    %esp,%ebp
 772:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 775:	8b 45 08             	mov    0x8(%ebp),%eax
 778:	83 c0 07             	add    $0x7,%eax
 77b:	c1 e8 03             	shr    $0x3,%eax
 77e:	83 c0 01             	add    $0x1,%eax
 781:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 784:	a1 a0 08 00 00       	mov    0x8a0,%eax
 789:	89 45 f0             	mov    %eax,-0x10(%ebp)
 78c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 790:	75 23                	jne    7b5 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 792:	c7 45 f0 98 08 00 00 	movl   $0x898,-0x10(%ebp)
 799:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79c:	a3 a0 08 00 00       	mov    %eax,0x8a0
 7a1:	a1 a0 08 00 00       	mov    0x8a0,%eax
 7a6:	a3 98 08 00 00       	mov    %eax,0x898
    base.s.size = 0;
 7ab:	c7 05 9c 08 00 00 00 	movl   $0x0,0x89c
 7b2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b8:	8b 00                	mov    (%eax),%eax
 7ba:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 7bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c0:	8b 40 04             	mov    0x4(%eax),%eax
 7c3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7c6:	72 4d                	jb     815 <malloc+0xa6>
      if(p->s.size == nunits)
 7c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7cb:	8b 40 04             	mov    0x4(%eax),%eax
 7ce:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7d1:	75 0c                	jne    7df <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d6:	8b 10                	mov    (%eax),%edx
 7d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7db:	89 10                	mov    %edx,(%eax)
 7dd:	eb 26                	jmp    805 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7df:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7e2:	8b 40 04             	mov    0x4(%eax),%eax
 7e5:	89 c2                	mov    %eax,%edx
 7e7:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ed:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f3:	8b 40 04             	mov    0x4(%eax),%eax
 7f6:	c1 e0 03             	shl    $0x3,%eax
 7f9:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
 802:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 805:	8b 45 f0             	mov    -0x10(%ebp),%eax
 808:	a3 a0 08 00 00       	mov    %eax,0x8a0
      return (void*)(p + 1);
 80d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 810:	83 c0 08             	add    $0x8,%eax
 813:	eb 38                	jmp    84d <malloc+0xde>
    }
    if(p == freep)
 815:	a1 a0 08 00 00       	mov    0x8a0,%eax
 81a:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 81d:	75 1b                	jne    83a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 81f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 822:	89 04 24             	mov    %eax,(%esp)
 825:	e8 ed fe ff ff       	call   717 <morecore>
 82a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 82d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 831:	75 07                	jne    83a <malloc+0xcb>
        return 0;
 833:	b8 00 00 00 00       	mov    $0x0,%eax
 838:	eb 13                	jmp    84d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 83a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 83d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 840:	8b 45 ec             	mov    -0x14(%ebp),%eax
 843:	8b 00                	mov    (%eax),%eax
 845:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 848:	e9 70 ff ff ff       	jmp    7bd <malloc+0x4e>
}
 84d:	c9                   	leave  
 84e:	c3                   	ret    
