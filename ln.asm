
_ln:     file format elf32-i386


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
   6:	83 ec 10             	sub    $0x10,%esp
  if(argc != 3){
   9:	83 7d 08 03          	cmpl   $0x3,0x8(%ebp)
   d:	74 19                	je     28 <main+0x28>
    printf(2, "Usage: ln old new\n");
   f:	c7 44 24 04 61 09 00 	movl   $0x961,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 46 04 00 00       	call   469 <printf>
    exit();
  23:	e8 b8 02 00 00       	call   2e0 <exit>
  }
  if(link(argv[1], argv[2]) < 0)
  28:	8b 45 0c             	mov    0xc(%ebp),%eax
  2b:	83 c0 08             	add    $0x8,%eax
  2e:	8b 10                	mov    (%eax),%edx
  30:	8b 45 0c             	mov    0xc(%ebp),%eax
  33:	83 c0 04             	add    $0x4,%eax
  36:	8b 00                	mov    (%eax),%eax
  38:	89 54 24 04          	mov    %edx,0x4(%esp)
  3c:	89 04 24             	mov    %eax,(%esp)
  3f:	e8 fc 02 00 00       	call   340 <link>
  44:	85 c0                	test   %eax,%eax
  46:	79 2c                	jns    74 <main+0x74>
    printf(2, "link %s %s: failed\n", argv[1], argv[2]);
  48:	8b 45 0c             	mov    0xc(%ebp),%eax
  4b:	83 c0 08             	add    $0x8,%eax
  4e:	8b 10                	mov    (%eax),%edx
  50:	8b 45 0c             	mov    0xc(%ebp),%eax
  53:	83 c0 04             	add    $0x4,%eax
  56:	8b 00                	mov    (%eax),%eax
  58:	89 54 24 0c          	mov    %edx,0xc(%esp)
  5c:	89 44 24 08          	mov    %eax,0x8(%esp)
  60:	c7 44 24 04 74 09 00 	movl   $0x974,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 f5 03 00 00       	call   469 <printf>
  exit();
  74:	e8 67 02 00 00       	call   2e0 <exit>
  79:	90                   	nop
  7a:	90                   	nop
  7b:	90                   	nop

0000007c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  7c:	55                   	push   %ebp
  7d:	89 e5                	mov    %esp,%ebp
  7f:	57                   	push   %edi
  80:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  81:	8b 4d 08             	mov    0x8(%ebp),%ecx
  84:	8b 55 10             	mov    0x10(%ebp),%edx
  87:	8b 45 0c             	mov    0xc(%ebp),%eax
  8a:	89 cb                	mov    %ecx,%ebx
  8c:	89 df                	mov    %ebx,%edi
  8e:	89 d1                	mov    %edx,%ecx
  90:	fc                   	cld    
  91:	f3 aa                	rep stos %al,%es:(%edi)
  93:	89 ca                	mov    %ecx,%edx
  95:	89 fb                	mov    %edi,%ebx
  97:	89 5d 08             	mov    %ebx,0x8(%ebp)
  9a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9d:	5b                   	pop    %ebx
  9e:	5f                   	pop    %edi
  9f:	5d                   	pop    %ebp
  a0:	c3                   	ret    

000000a1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  a1:	55                   	push   %ebp
  a2:	89 e5                	mov    %esp,%ebp
  a4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  ad:	8b 45 0c             	mov    0xc(%ebp),%eax
  b0:	0f b6 10             	movzbl (%eax),%edx
  b3:	8b 45 08             	mov    0x8(%ebp),%eax
  b6:	88 10                	mov    %dl,(%eax)
  b8:	8b 45 08             	mov    0x8(%ebp),%eax
  bb:	0f b6 00             	movzbl (%eax),%eax
  be:	84 c0                	test   %al,%al
  c0:	0f 95 c0             	setne  %al
  c3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  c7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  cb:	84 c0                	test   %al,%al
  cd:	75 de                	jne    ad <strcpy+0xc>
    ;
  return os;
  cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  d2:	c9                   	leave  
  d3:	c3                   	ret    

000000d4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  d4:	55                   	push   %ebp
  d5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  d7:	eb 08                	jmp    e1 <strcmp+0xd>
    p++, q++;
  d9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  dd:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e1:	8b 45 08             	mov    0x8(%ebp),%eax
  e4:	0f b6 00             	movzbl (%eax),%eax
  e7:	84 c0                	test   %al,%al
  e9:	74 10                	je     fb <strcmp+0x27>
  eb:	8b 45 08             	mov    0x8(%ebp),%eax
  ee:	0f b6 10             	movzbl (%eax),%edx
  f1:	8b 45 0c             	mov    0xc(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	38 c2                	cmp    %al,%dl
  f9:	74 de                	je     d9 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	0f b6 00             	movzbl (%eax),%eax
 101:	0f b6 d0             	movzbl %al,%edx
 104:	8b 45 0c             	mov    0xc(%ebp),%eax
 107:	0f b6 00             	movzbl (%eax),%eax
 10a:	0f b6 c0             	movzbl %al,%eax
 10d:	89 d1                	mov    %edx,%ecx
 10f:	29 c1                	sub    %eax,%ecx
 111:	89 c8                	mov    %ecx,%eax
}
 113:	5d                   	pop    %ebp
 114:	c3                   	ret    

00000115 <strlen>:

uint
strlen(char *s)
{
 115:	55                   	push   %ebp
 116:	89 e5                	mov    %esp,%ebp
 118:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 11b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 122:	eb 04                	jmp    128 <strlen+0x13>
 124:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 128:	8b 45 fc             	mov    -0x4(%ebp),%eax
 12b:	03 45 08             	add    0x8(%ebp),%eax
 12e:	0f b6 00             	movzbl (%eax),%eax
 131:	84 c0                	test   %al,%al
 133:	75 ef                	jne    124 <strlen+0xf>
    ;
  return n;
 135:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 138:	c9                   	leave  
 139:	c3                   	ret    

0000013a <memset>:

void*
memset(void *dst, int c, uint n)
{
 13a:	55                   	push   %ebp
 13b:	89 e5                	mov    %esp,%ebp
 13d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 140:	8b 45 10             	mov    0x10(%ebp),%eax
 143:	89 44 24 08          	mov    %eax,0x8(%esp)
 147:	8b 45 0c             	mov    0xc(%ebp),%eax
 14a:	89 44 24 04          	mov    %eax,0x4(%esp)
 14e:	8b 45 08             	mov    0x8(%ebp),%eax
 151:	89 04 24             	mov    %eax,(%esp)
 154:	e8 23 ff ff ff       	call   7c <stosb>
  return dst;
 159:	8b 45 08             	mov    0x8(%ebp),%eax
}
 15c:	c9                   	leave  
 15d:	c3                   	ret    

0000015e <strchr>:

char*
strchr(const char *s, char c)
{
 15e:	55                   	push   %ebp
 15f:	89 e5                	mov    %esp,%ebp
 161:	83 ec 04             	sub    $0x4,%esp
 164:	8b 45 0c             	mov    0xc(%ebp),%eax
 167:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 16a:	eb 14                	jmp    180 <strchr+0x22>
    if(*s == c)
 16c:	8b 45 08             	mov    0x8(%ebp),%eax
 16f:	0f b6 00             	movzbl (%eax),%eax
 172:	3a 45 fc             	cmp    -0x4(%ebp),%al
 175:	75 05                	jne    17c <strchr+0x1e>
      return (char*)s;
 177:	8b 45 08             	mov    0x8(%ebp),%eax
 17a:	eb 13                	jmp    18f <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 17c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 180:	8b 45 08             	mov    0x8(%ebp),%eax
 183:	0f b6 00             	movzbl (%eax),%eax
 186:	84 c0                	test   %al,%al
 188:	75 e2                	jne    16c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 18a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 18f:	c9                   	leave  
 190:	c3                   	ret    

00000191 <gets>:

char*
gets(char *buf, int max)
{
 191:	55                   	push   %ebp
 192:	89 e5                	mov    %esp,%ebp
 194:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 197:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 19e:	eb 44                	jmp    1e4 <gets+0x53>
    cc = read(0, &c, 1);
 1a0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a7:	00 
 1a8:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 1af:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b6:	e8 3d 01 00 00       	call   2f8 <read>
 1bb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 1be:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1c2:	7e 2d                	jle    1f1 <gets+0x60>
      break;
    buf[i++] = c;
 1c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1c7:	03 45 08             	add    0x8(%ebp),%eax
 1ca:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1ce:	88 10                	mov    %dl,(%eax)
 1d0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 1d4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d8:	3c 0a                	cmp    $0xa,%al
 1da:	74 16                	je     1f2 <gets+0x61>
 1dc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e0:	3c 0d                	cmp    $0xd,%al
 1e2:	74 0e                	je     1f2 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1e7:	83 c0 01             	add    $0x1,%eax
 1ea:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1ed:	7c b1                	jl     1a0 <gets+0xf>
 1ef:	eb 01                	jmp    1f2 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1f1:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1f5:	03 45 08             	add    0x8(%ebp),%eax
 1f8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1fe:	c9                   	leave  
 1ff:	c3                   	ret    

00000200 <stat>:

int
stat(char *n, struct stat *st)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
 203:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 206:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20d:	00 
 20e:	8b 45 08             	mov    0x8(%ebp),%eax
 211:	89 04 24             	mov    %eax,(%esp)
 214:	e8 07 01 00 00       	call   320 <open>
 219:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 21c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 220:	79 07                	jns    229 <stat+0x29>
    return -1;
 222:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 227:	eb 23                	jmp    24c <stat+0x4c>
  r = fstat(fd, st);
 229:	8b 45 0c             	mov    0xc(%ebp),%eax
 22c:	89 44 24 04          	mov    %eax,0x4(%esp)
 230:	8b 45 f0             	mov    -0x10(%ebp),%eax
 233:	89 04 24             	mov    %eax,(%esp)
 236:	e8 fd 00 00 00       	call   338 <fstat>
 23b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 23e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 241:	89 04 24             	mov    %eax,(%esp)
 244:	e8 bf 00 00 00       	call   308 <close>
  return r;
 249:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 24c:	c9                   	leave  
 24d:	c3                   	ret    

0000024e <atoi>:

int
atoi(const char *s)
{
 24e:	55                   	push   %ebp
 24f:	89 e5                	mov    %esp,%ebp
 251:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 254:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 25b:	eb 24                	jmp    281 <atoi+0x33>
    n = n*10 + *s++ - '0';
 25d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 260:	89 d0                	mov    %edx,%eax
 262:	c1 e0 02             	shl    $0x2,%eax
 265:	01 d0                	add    %edx,%eax
 267:	01 c0                	add    %eax,%eax
 269:	89 c2                	mov    %eax,%edx
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
 26e:	0f b6 00             	movzbl (%eax),%eax
 271:	0f be c0             	movsbl %al,%eax
 274:	8d 04 02             	lea    (%edx,%eax,1),%eax
 277:	83 e8 30             	sub    $0x30,%eax
 27a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 27d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 281:	8b 45 08             	mov    0x8(%ebp),%eax
 284:	0f b6 00             	movzbl (%eax),%eax
 287:	3c 2f                	cmp    $0x2f,%al
 289:	7e 0a                	jle    295 <atoi+0x47>
 28b:	8b 45 08             	mov    0x8(%ebp),%eax
 28e:	0f b6 00             	movzbl (%eax),%eax
 291:	3c 39                	cmp    $0x39,%al
 293:	7e c8                	jle    25d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 295:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 298:	c9                   	leave  
 299:	c3                   	ret    

0000029a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 29a:	55                   	push   %ebp
 29b:	89 e5                	mov    %esp,%ebp
 29d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 2a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 2ac:	eb 13                	jmp    2c1 <memmove+0x27>
    *dst++ = *src++;
 2ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b1:	0f b6 10             	movzbl (%eax),%edx
 2b4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2b7:	88 10                	mov    %dl,(%eax)
 2b9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 2bd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2c5:	0f 9f c0             	setg   %al
 2c8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2cc:	84 c0                	test   %al,%al
 2ce:	75 de                	jne    2ae <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2d0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d3:	c9                   	leave  
 2d4:	c3                   	ret    
 2d5:	90                   	nop
 2d6:	90                   	nop
 2d7:	90                   	nop

000002d8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2d8:	b8 01 00 00 00       	mov    $0x1,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <exit>:
SYSCALL(exit)
 2e0:	b8 02 00 00 00       	mov    $0x2,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <wait>:
SYSCALL(wait)
 2e8:	b8 03 00 00 00       	mov    $0x3,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <pipe>:
SYSCALL(pipe)
 2f0:	b8 04 00 00 00       	mov    $0x4,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <read>:
SYSCALL(read)
 2f8:	b8 05 00 00 00       	mov    $0x5,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <write>:
SYSCALL(write)
 300:	b8 10 00 00 00       	mov    $0x10,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <close>:
SYSCALL(close)
 308:	b8 15 00 00 00       	mov    $0x15,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <kill>:
SYSCALL(kill)
 310:	b8 06 00 00 00       	mov    $0x6,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <exec>:
SYSCALL(exec)
 318:	b8 07 00 00 00       	mov    $0x7,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <open>:
SYSCALL(open)
 320:	b8 0f 00 00 00       	mov    $0xf,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <mknod>:
SYSCALL(mknod)
 328:	b8 11 00 00 00       	mov    $0x11,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <unlink>:
SYSCALL(unlink)
 330:	b8 12 00 00 00       	mov    $0x12,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <fstat>:
SYSCALL(fstat)
 338:	b8 08 00 00 00       	mov    $0x8,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <link>:
SYSCALL(link)
 340:	b8 13 00 00 00       	mov    $0x13,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <mkdir>:
SYSCALL(mkdir)
 348:	b8 14 00 00 00       	mov    $0x14,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <chdir>:
SYSCALL(chdir)
 350:	b8 09 00 00 00       	mov    $0x9,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <dup>:
SYSCALL(dup)
 358:	b8 0a 00 00 00       	mov    $0xa,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <getpid>:
SYSCALL(getpid)
 360:	b8 0b 00 00 00       	mov    $0xb,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <sbrk>:
SYSCALL(sbrk)
 368:	b8 0c 00 00 00       	mov    $0xc,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <sleep>:
SYSCALL(sleep)
 370:	b8 0d 00 00 00       	mov    $0xd,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <uptime>:
SYSCALL(uptime)
 378:	b8 0e 00 00 00       	mov    $0xe,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <clone>:
SYSCALL(clone)
 380:	b8 16 00 00 00       	mov    $0x16,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <texit>:
SYSCALL(texit)
 388:	b8 17 00 00 00       	mov    $0x17,%eax
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
 3b1:	e8 4a ff ff ff       	call   300 <write>
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
 402:	0f b6 80 bc 09 00 00 	movzbl 0x9bc(%eax),%eax
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
 562:	c7 45 e4 88 09 00 00 	movl   $0x988,-0x1c(%ebp)
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
 62f:	a1 d8 09 00 00       	mov    0x9d8,%eax
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
 6f0:	a3 d8 09 00 00       	mov    %eax,0x9d8
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
 716:	e8 4d fc ff ff       	call   368 <sbrk>
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
 748:	a1 d8 09 00 00       	mov    0x9d8,%eax
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
 764:	a1 d8 09 00 00       	mov    0x9d8,%eax
 769:	89 45 f0             	mov    %eax,-0x10(%ebp)
 76c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 770:	75 23                	jne    795 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 772:	c7 45 f0 d0 09 00 00 	movl   $0x9d0,-0x10(%ebp)
 779:	8b 45 f0             	mov    -0x10(%ebp),%eax
 77c:	a3 d8 09 00 00       	mov    %eax,0x9d8
 781:	a1 d8 09 00 00       	mov    0x9d8,%eax
 786:	a3 d0 09 00 00       	mov    %eax,0x9d0
    base.s.size = 0;
 78b:	c7 05 d4 09 00 00 00 	movl   $0x0,0x9d4
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
 7e8:	a3 d8 09 00 00       	mov    %eax,0x9d8
      return (void*)(p + 1);
 7ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f0:	83 c0 08             	add    $0x8,%eax
 7f3:	eb 38                	jmp    82d <malloc+0xde>
    }
    if(p == freep)
 7f5:	a1 d8 09 00 00       	mov    0x9d8,%eax
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
 8d4:	c7 44 24 04 8f 09 00 	movl   $0x98f,0x4(%esp)
 8db:	00 
 8dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8e3:	e8 81 fb ff ff       	call   469 <printf>
        return 0;
 8e8:	b8 00 00 00 00       	mov    $0x0,%eax
 8ed:	eb 70                	jmp    95f <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 8ef:	8b 55 08             	mov    0x8(%ebp),%edx
 8f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 8fc:	00 
 8fd:	89 54 24 08          	mov    %edx,0x8(%esp)
 901:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 908:	00 
 909:	89 04 24             	mov    %eax,(%esp)
 90c:	e8 6f fa ff ff       	call   380 <clone>
 911:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 914:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 918:	79 1b                	jns    935 <thread_create+0xa3>
        printf(1,"clone fails\n");
 91a:	c7 44 24 04 9d 09 00 	movl   $0x99d,0x4(%esp)
 921:	00 
 922:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 929:	e8 3b fb ff ff       	call   469 <printf>
        return 0;
 92e:	b8 00 00 00 00       	mov    $0x0,%eax
 933:	eb 2a                	jmp    95f <thread_create+0xcd>
    }
    if(tid > 0){
 935:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 939:	7e 05                	jle    940 <thread_create+0xae>
        return garbage_stack;
 93b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93e:	eb 1f                	jmp    95f <thread_create+0xcd>
    }
    if(tid == 0){
 940:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 944:	75 14                	jne    95a <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 946:	c7 44 24 04 aa 09 00 	movl   $0x9aa,0x4(%esp)
 94d:	00 
 94e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 955:	e8 0f fb ff ff       	call   469 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 95a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 95f:	c9                   	leave  
 960:	c3                   	ret    
