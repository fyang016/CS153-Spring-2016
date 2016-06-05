
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
   f:	c7 44 24 04 e4 0b 00 	movl   $0xbe4,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 66 04 00 00       	call   489 <printf>
    exit();
  23:	e8 b9 02 00 00       	call   2e1 <exit>
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
  3f:	e8 fd 02 00 00       	call   341 <link>
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
  60:	c7 44 24 04 f7 0b 00 	movl   $0xbf7,0x4(%esp)
  67:	00 
  68:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  6f:	e8 15 04 00 00       	call   489 <printf>
  exit();
  74:	e8 68 02 00 00       	call   2e1 <exit>

00000079 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  79:	55                   	push   %ebp
  7a:	89 e5                	mov    %esp,%ebp
  7c:	57                   	push   %edi
  7d:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  7e:	8b 4d 08             	mov    0x8(%ebp),%ecx
  81:	8b 55 10             	mov    0x10(%ebp),%edx
  84:	8b 45 0c             	mov    0xc(%ebp),%eax
  87:	89 cb                	mov    %ecx,%ebx
  89:	89 df                	mov    %ebx,%edi
  8b:	89 d1                	mov    %edx,%ecx
  8d:	fc                   	cld    
  8e:	f3 aa                	rep stos %al,%es:(%edi)
  90:	89 ca                	mov    %ecx,%edx
  92:	89 fb                	mov    %edi,%ebx
  94:	89 5d 08             	mov    %ebx,0x8(%ebp)
  97:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  9a:	5b                   	pop    %ebx
  9b:	5f                   	pop    %edi
  9c:	5d                   	pop    %ebp
  9d:	c3                   	ret    

0000009e <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  9e:	55                   	push   %ebp
  9f:	89 e5                	mov    %esp,%ebp
  a1:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  a4:	8b 45 08             	mov    0x8(%ebp),%eax
  a7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  aa:	90                   	nop
  ab:	8b 45 08             	mov    0x8(%ebp),%eax
  ae:	8d 50 01             	lea    0x1(%eax),%edx
  b1:	89 55 08             	mov    %edx,0x8(%ebp)
  b4:	8b 55 0c             	mov    0xc(%ebp),%edx
  b7:	8d 4a 01             	lea    0x1(%edx),%ecx
  ba:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  bd:	0f b6 12             	movzbl (%edx),%edx
  c0:	88 10                	mov    %dl,(%eax)
  c2:	0f b6 00             	movzbl (%eax),%eax
  c5:	84 c0                	test   %al,%al
  c7:	75 e2                	jne    ab <strcpy+0xd>
    ;
  return os;
  c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  cc:	c9                   	leave  
  cd:	c3                   	ret    

000000ce <strcmp>:

int
strcmp(const char *p, const char *q)
{
  ce:	55                   	push   %ebp
  cf:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  d1:	eb 08                	jmp    db <strcmp+0xd>
    p++, q++;
  d3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  db:	8b 45 08             	mov    0x8(%ebp),%eax
  de:	0f b6 00             	movzbl (%eax),%eax
  e1:	84 c0                	test   %al,%al
  e3:	74 10                	je     f5 <strcmp+0x27>
  e5:	8b 45 08             	mov    0x8(%ebp),%eax
  e8:	0f b6 10             	movzbl (%eax),%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	0f b6 00             	movzbl (%eax),%eax
  f1:	38 c2                	cmp    %al,%dl
  f3:	74 de                	je     d3 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  f5:	8b 45 08             	mov    0x8(%ebp),%eax
  f8:	0f b6 00             	movzbl (%eax),%eax
  fb:	0f b6 d0             	movzbl %al,%edx
  fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 101:	0f b6 00             	movzbl (%eax),%eax
 104:	0f b6 c0             	movzbl %al,%eax
 107:	29 c2                	sub    %eax,%edx
 109:	89 d0                	mov    %edx,%eax
}
 10b:	5d                   	pop    %ebp
 10c:	c3                   	ret    

0000010d <strlen>:

uint
strlen(char *s)
{
 10d:	55                   	push   %ebp
 10e:	89 e5                	mov    %esp,%ebp
 110:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 113:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 11a:	eb 04                	jmp    120 <strlen+0x13>
 11c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 120:	8b 55 fc             	mov    -0x4(%ebp),%edx
 123:	8b 45 08             	mov    0x8(%ebp),%eax
 126:	01 d0                	add    %edx,%eax
 128:	0f b6 00             	movzbl (%eax),%eax
 12b:	84 c0                	test   %al,%al
 12d:	75 ed                	jne    11c <strlen+0xf>
    ;
  return n;
 12f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 132:	c9                   	leave  
 133:	c3                   	ret    

00000134 <memset>:

void*
memset(void *dst, int c, uint n)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 13a:	8b 45 10             	mov    0x10(%ebp),%eax
 13d:	89 44 24 08          	mov    %eax,0x8(%esp)
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	89 44 24 04          	mov    %eax,0x4(%esp)
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	89 04 24             	mov    %eax,(%esp)
 14e:	e8 26 ff ff ff       	call   79 <stosb>
  return dst;
 153:	8b 45 08             	mov    0x8(%ebp),%eax
}
 156:	c9                   	leave  
 157:	c3                   	ret    

00000158 <strchr>:

char*
strchr(const char *s, char c)
{
 158:	55                   	push   %ebp
 159:	89 e5                	mov    %esp,%ebp
 15b:	83 ec 04             	sub    $0x4,%esp
 15e:	8b 45 0c             	mov    0xc(%ebp),%eax
 161:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 164:	eb 14                	jmp    17a <strchr+0x22>
    if(*s == c)
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	0f b6 00             	movzbl (%eax),%eax
 16c:	3a 45 fc             	cmp    -0x4(%ebp),%al
 16f:	75 05                	jne    176 <strchr+0x1e>
      return (char*)s;
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	eb 13                	jmp    189 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 176:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17a:	8b 45 08             	mov    0x8(%ebp),%eax
 17d:	0f b6 00             	movzbl (%eax),%eax
 180:	84 c0                	test   %al,%al
 182:	75 e2                	jne    166 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 184:	b8 00 00 00 00       	mov    $0x0,%eax
}
 189:	c9                   	leave  
 18a:	c3                   	ret    

0000018b <gets>:

char*
gets(char *buf, int max)
{
 18b:	55                   	push   %ebp
 18c:	89 e5                	mov    %esp,%ebp
 18e:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 191:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 198:	eb 4c                	jmp    1e6 <gets+0x5b>
    cc = read(0, &c, 1);
 19a:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1a1:	00 
 1a2:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a9:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b0:	e8 44 01 00 00       	call   2f9 <read>
 1b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1bc:	7f 02                	jg     1c0 <gets+0x35>
      break;
 1be:	eb 31                	jmp    1f1 <gets+0x66>
    buf[i++] = c;
 1c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c3:	8d 50 01             	lea    0x1(%eax),%edx
 1c6:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1c9:	89 c2                	mov    %eax,%edx
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ce:	01 c2                	add    %eax,%edx
 1d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d4:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1d6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1da:	3c 0a                	cmp    $0xa,%al
 1dc:	74 13                	je     1f1 <gets+0x66>
 1de:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e2:	3c 0d                	cmp    $0xd,%al
 1e4:	74 0b                	je     1f1 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e9:	83 c0 01             	add    $0x1,%eax
 1ec:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1ef:	7c a9                	jl     19a <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	01 d0                	add    %edx,%eax
 1f9:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ff:	c9                   	leave  
 200:	c3                   	ret    

00000201 <stat>:

int
stat(char *n, struct stat *st)
{
 201:	55                   	push   %ebp
 202:	89 e5                	mov    %esp,%ebp
 204:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 207:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 20e:	00 
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	89 04 24             	mov    %eax,(%esp)
 215:	e8 07 01 00 00       	call   321 <open>
 21a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 21d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 221:	79 07                	jns    22a <stat+0x29>
    return -1;
 223:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 228:	eb 23                	jmp    24d <stat+0x4c>
  r = fstat(fd, st);
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	89 44 24 04          	mov    %eax,0x4(%esp)
 231:	8b 45 f4             	mov    -0xc(%ebp),%eax
 234:	89 04 24             	mov    %eax,(%esp)
 237:	e8 fd 00 00 00       	call   339 <fstat>
 23c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 23f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 242:	89 04 24             	mov    %eax,(%esp)
 245:	e8 bf 00 00 00       	call   309 <close>
  return r;
 24a:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 24d:	c9                   	leave  
 24e:	c3                   	ret    

0000024f <atoi>:

int
atoi(const char *s)
{
 24f:	55                   	push   %ebp
 250:	89 e5                	mov    %esp,%ebp
 252:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 255:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 25c:	eb 25                	jmp    283 <atoi+0x34>
    n = n*10 + *s++ - '0';
 25e:	8b 55 fc             	mov    -0x4(%ebp),%edx
 261:	89 d0                	mov    %edx,%eax
 263:	c1 e0 02             	shl    $0x2,%eax
 266:	01 d0                	add    %edx,%eax
 268:	01 c0                	add    %eax,%eax
 26a:	89 c1                	mov    %eax,%ecx
 26c:	8b 45 08             	mov    0x8(%ebp),%eax
 26f:	8d 50 01             	lea    0x1(%eax),%edx
 272:	89 55 08             	mov    %edx,0x8(%ebp)
 275:	0f b6 00             	movzbl (%eax),%eax
 278:	0f be c0             	movsbl %al,%eax
 27b:	01 c8                	add    %ecx,%eax
 27d:	83 e8 30             	sub    $0x30,%eax
 280:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	0f b6 00             	movzbl (%eax),%eax
 289:	3c 2f                	cmp    $0x2f,%al
 28b:	7e 0a                	jle    297 <atoi+0x48>
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
 290:	0f b6 00             	movzbl (%eax),%eax
 293:	3c 39                	cmp    $0x39,%al
 295:	7e c7                	jle    25e <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 297:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2a2:	8b 45 08             	mov    0x8(%ebp),%eax
 2a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2a8:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2ae:	eb 17                	jmp    2c7 <memmove+0x2b>
    *dst++ = *src++;
 2b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b3:	8d 50 01             	lea    0x1(%eax),%edx
 2b6:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2b9:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2bc:	8d 4a 01             	lea    0x1(%edx),%ecx
 2bf:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2c2:	0f b6 12             	movzbl (%edx),%edx
 2c5:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c7:	8b 45 10             	mov    0x10(%ebp),%eax
 2ca:	8d 50 ff             	lea    -0x1(%eax),%edx
 2cd:	89 55 10             	mov    %edx,0x10(%ebp)
 2d0:	85 c0                	test   %eax,%eax
 2d2:	7f dc                	jg     2b0 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2d9:	b8 01 00 00 00       	mov    $0x1,%eax
 2de:	cd 40                	int    $0x40
 2e0:	c3                   	ret    

000002e1 <exit>:
SYSCALL(exit)
 2e1:	b8 02 00 00 00       	mov    $0x2,%eax
 2e6:	cd 40                	int    $0x40
 2e8:	c3                   	ret    

000002e9 <wait>:
SYSCALL(wait)
 2e9:	b8 03 00 00 00       	mov    $0x3,%eax
 2ee:	cd 40                	int    $0x40
 2f0:	c3                   	ret    

000002f1 <pipe>:
SYSCALL(pipe)
 2f1:	b8 04 00 00 00       	mov    $0x4,%eax
 2f6:	cd 40                	int    $0x40
 2f8:	c3                   	ret    

000002f9 <read>:
SYSCALL(read)
 2f9:	b8 05 00 00 00       	mov    $0x5,%eax
 2fe:	cd 40                	int    $0x40
 300:	c3                   	ret    

00000301 <write>:
SYSCALL(write)
 301:	b8 10 00 00 00       	mov    $0x10,%eax
 306:	cd 40                	int    $0x40
 308:	c3                   	ret    

00000309 <close>:
SYSCALL(close)
 309:	b8 15 00 00 00       	mov    $0x15,%eax
 30e:	cd 40                	int    $0x40
 310:	c3                   	ret    

00000311 <kill>:
SYSCALL(kill)
 311:	b8 06 00 00 00       	mov    $0x6,%eax
 316:	cd 40                	int    $0x40
 318:	c3                   	ret    

00000319 <exec>:
SYSCALL(exec)
 319:	b8 07 00 00 00       	mov    $0x7,%eax
 31e:	cd 40                	int    $0x40
 320:	c3                   	ret    

00000321 <open>:
SYSCALL(open)
 321:	b8 0f 00 00 00       	mov    $0xf,%eax
 326:	cd 40                	int    $0x40
 328:	c3                   	ret    

00000329 <mknod>:
SYSCALL(mknod)
 329:	b8 11 00 00 00       	mov    $0x11,%eax
 32e:	cd 40                	int    $0x40
 330:	c3                   	ret    

00000331 <unlink>:
SYSCALL(unlink)
 331:	b8 12 00 00 00       	mov    $0x12,%eax
 336:	cd 40                	int    $0x40
 338:	c3                   	ret    

00000339 <fstat>:
SYSCALL(fstat)
 339:	b8 08 00 00 00       	mov    $0x8,%eax
 33e:	cd 40                	int    $0x40
 340:	c3                   	ret    

00000341 <link>:
SYSCALL(link)
 341:	b8 13 00 00 00       	mov    $0x13,%eax
 346:	cd 40                	int    $0x40
 348:	c3                   	ret    

00000349 <mkdir>:
SYSCALL(mkdir)
 349:	b8 14 00 00 00       	mov    $0x14,%eax
 34e:	cd 40                	int    $0x40
 350:	c3                   	ret    

00000351 <chdir>:
SYSCALL(chdir)
 351:	b8 09 00 00 00       	mov    $0x9,%eax
 356:	cd 40                	int    $0x40
 358:	c3                   	ret    

00000359 <dup>:
SYSCALL(dup)
 359:	b8 0a 00 00 00       	mov    $0xa,%eax
 35e:	cd 40                	int    $0x40
 360:	c3                   	ret    

00000361 <getpid>:
SYSCALL(getpid)
 361:	b8 0b 00 00 00       	mov    $0xb,%eax
 366:	cd 40                	int    $0x40
 368:	c3                   	ret    

00000369 <sbrk>:
SYSCALL(sbrk)
 369:	b8 0c 00 00 00       	mov    $0xc,%eax
 36e:	cd 40                	int    $0x40
 370:	c3                   	ret    

00000371 <sleep>:
SYSCALL(sleep)
 371:	b8 0d 00 00 00       	mov    $0xd,%eax
 376:	cd 40                	int    $0x40
 378:	c3                   	ret    

00000379 <uptime>:
SYSCALL(uptime)
 379:	b8 0e 00 00 00       	mov    $0xe,%eax
 37e:	cd 40                	int    $0x40
 380:	c3                   	ret    

00000381 <clone>:
SYSCALL(clone)
 381:	b8 16 00 00 00       	mov    $0x16,%eax
 386:	cd 40                	int    $0x40
 388:	c3                   	ret    

00000389 <texit>:
SYSCALL(texit)
 389:	b8 17 00 00 00       	mov    $0x17,%eax
 38e:	cd 40                	int    $0x40
 390:	c3                   	ret    

00000391 <tsleep>:
SYSCALL(tsleep)
 391:	b8 18 00 00 00       	mov    $0x18,%eax
 396:	cd 40                	int    $0x40
 398:	c3                   	ret    

00000399 <twakeup>:
SYSCALL(twakeup)
 399:	b8 19 00 00 00       	mov    $0x19,%eax
 39e:	cd 40                	int    $0x40
 3a0:	c3                   	ret    

000003a1 <test>:
SYSCALL(test)
 3a1:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3a6:	cd 40                	int    $0x40
 3a8:	c3                   	ret    

000003a9 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3a9:	55                   	push   %ebp
 3aa:	89 e5                	mov    %esp,%ebp
 3ac:	83 ec 18             	sub    $0x18,%esp
 3af:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b2:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3b5:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3bc:	00 
 3bd:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 3c4:	8b 45 08             	mov    0x8(%ebp),%eax
 3c7:	89 04 24             	mov    %eax,(%esp)
 3ca:	e8 32 ff ff ff       	call   301 <write>
}
 3cf:	c9                   	leave  
 3d0:	c3                   	ret    

000003d1 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3d1:	55                   	push   %ebp
 3d2:	89 e5                	mov    %esp,%ebp
 3d4:	56                   	push   %esi
 3d5:	53                   	push   %ebx
 3d6:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3d9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3e0:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3e4:	74 17                	je     3fd <printint+0x2c>
 3e6:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3ea:	79 11                	jns    3fd <printint+0x2c>
    neg = 1;
 3ec:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3f3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f6:	f7 d8                	neg    %eax
 3f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3fb:	eb 06                	jmp    403 <printint+0x32>
  } else {
    x = xx;
 3fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 400:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 403:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 40a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 40d:	8d 41 01             	lea    0x1(%ecx),%eax
 410:	89 45 f4             	mov    %eax,-0xc(%ebp)
 413:	8b 5d 10             	mov    0x10(%ebp),%ebx
 416:	8b 45 ec             	mov    -0x14(%ebp),%eax
 419:	ba 00 00 00 00       	mov    $0x0,%edx
 41e:	f7 f3                	div    %ebx
 420:	89 d0                	mov    %edx,%eax
 422:	0f b6 80 18 10 00 00 	movzbl 0x1018(%eax),%eax
 429:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 42d:	8b 75 10             	mov    0x10(%ebp),%esi
 430:	8b 45 ec             	mov    -0x14(%ebp),%eax
 433:	ba 00 00 00 00       	mov    $0x0,%edx
 438:	f7 f6                	div    %esi
 43a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 43d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 441:	75 c7                	jne    40a <printint+0x39>
  if(neg)
 443:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 447:	74 10                	je     459 <printint+0x88>
    buf[i++] = '-';
 449:	8b 45 f4             	mov    -0xc(%ebp),%eax
 44c:	8d 50 01             	lea    0x1(%eax),%edx
 44f:	89 55 f4             	mov    %edx,-0xc(%ebp)
 452:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 457:	eb 1f                	jmp    478 <printint+0xa7>
 459:	eb 1d                	jmp    478 <printint+0xa7>
    putc(fd, buf[i]);
 45b:	8d 55 dc             	lea    -0x24(%ebp),%edx
 45e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 461:	01 d0                	add    %edx,%eax
 463:	0f b6 00             	movzbl (%eax),%eax
 466:	0f be c0             	movsbl %al,%eax
 469:	89 44 24 04          	mov    %eax,0x4(%esp)
 46d:	8b 45 08             	mov    0x8(%ebp),%eax
 470:	89 04 24             	mov    %eax,(%esp)
 473:	e8 31 ff ff ff       	call   3a9 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 478:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 47c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 480:	79 d9                	jns    45b <printint+0x8a>
    putc(fd, buf[i]);
}
 482:	83 c4 30             	add    $0x30,%esp
 485:	5b                   	pop    %ebx
 486:	5e                   	pop    %esi
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
 48f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 496:	8d 45 0c             	lea    0xc(%ebp),%eax
 499:	83 c0 04             	add    $0x4,%eax
 49c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 49f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4a6:	e9 7c 01 00 00       	jmp    627 <printf+0x19e>
    c = fmt[i] & 0xff;
 4ab:	8b 55 0c             	mov    0xc(%ebp),%edx
 4ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4b1:	01 d0                	add    %edx,%eax
 4b3:	0f b6 00             	movzbl (%eax),%eax
 4b6:	0f be c0             	movsbl %al,%eax
 4b9:	25 ff 00 00 00       	and    $0xff,%eax
 4be:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4c1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4c5:	75 2c                	jne    4f3 <printf+0x6a>
      if(c == '%'){
 4c7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4cb:	75 0c                	jne    4d9 <printf+0x50>
        state = '%';
 4cd:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4d4:	e9 4a 01 00 00       	jmp    623 <printf+0x19a>
      } else {
        putc(fd, c);
 4d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4dc:	0f be c0             	movsbl %al,%eax
 4df:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
 4e6:	89 04 24             	mov    %eax,(%esp)
 4e9:	e8 bb fe ff ff       	call   3a9 <putc>
 4ee:	e9 30 01 00 00       	jmp    623 <printf+0x19a>
      }
    } else if(state == '%'){
 4f3:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4f7:	0f 85 26 01 00 00    	jne    623 <printf+0x19a>
      if(c == 'd'){
 4fd:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 501:	75 2d                	jne    530 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 503:	8b 45 e8             	mov    -0x18(%ebp),%eax
 506:	8b 00                	mov    (%eax),%eax
 508:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 50f:	00 
 510:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 517:	00 
 518:	89 44 24 04          	mov    %eax,0x4(%esp)
 51c:	8b 45 08             	mov    0x8(%ebp),%eax
 51f:	89 04 24             	mov    %eax,(%esp)
 522:	e8 aa fe ff ff       	call   3d1 <printint>
        ap++;
 527:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 52b:	e9 ec 00 00 00       	jmp    61c <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 530:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 534:	74 06                	je     53c <printf+0xb3>
 536:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 53a:	75 2d                	jne    569 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 53c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 53f:	8b 00                	mov    (%eax),%eax
 541:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 548:	00 
 549:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 550:	00 
 551:	89 44 24 04          	mov    %eax,0x4(%esp)
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	89 04 24             	mov    %eax,(%esp)
 55b:	e8 71 fe ff ff       	call   3d1 <printint>
        ap++;
 560:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 564:	e9 b3 00 00 00       	jmp    61c <printf+0x193>
      } else if(c == 's'){
 569:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 56d:	75 45                	jne    5b4 <printf+0x12b>
        s = (char*)*ap;
 56f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 572:	8b 00                	mov    (%eax),%eax
 574:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 577:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 57b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 57f:	75 09                	jne    58a <printf+0x101>
          s = "(null)";
 581:	c7 45 f4 0b 0c 00 00 	movl   $0xc0b,-0xc(%ebp)
        while(*s != 0){
 588:	eb 1e                	jmp    5a8 <printf+0x11f>
 58a:	eb 1c                	jmp    5a8 <printf+0x11f>
          putc(fd, *s);
 58c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58f:	0f b6 00             	movzbl (%eax),%eax
 592:	0f be c0             	movsbl %al,%eax
 595:	89 44 24 04          	mov    %eax,0x4(%esp)
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	89 04 24             	mov    %eax,(%esp)
 59f:	e8 05 fe ff ff       	call   3a9 <putc>
          s++;
 5a4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ab:	0f b6 00             	movzbl (%eax),%eax
 5ae:	84 c0                	test   %al,%al
 5b0:	75 da                	jne    58c <printf+0x103>
 5b2:	eb 68                	jmp    61c <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5b4:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5b8:	75 1d                	jne    5d7 <printf+0x14e>
        putc(fd, *ap);
 5ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5bd:	8b 00                	mov    (%eax),%eax
 5bf:	0f be c0             	movsbl %al,%eax
 5c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c6:	8b 45 08             	mov    0x8(%ebp),%eax
 5c9:	89 04 24             	mov    %eax,(%esp)
 5cc:	e8 d8 fd ff ff       	call   3a9 <putc>
        ap++;
 5d1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5d5:	eb 45                	jmp    61c <printf+0x193>
      } else if(c == '%'){
 5d7:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5db:	75 17                	jne    5f4 <printf+0x16b>
        putc(fd, c);
 5dd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e0:	0f be c0             	movsbl %al,%eax
 5e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e7:	8b 45 08             	mov    0x8(%ebp),%eax
 5ea:	89 04 24             	mov    %eax,(%esp)
 5ed:	e8 b7 fd ff ff       	call   3a9 <putc>
 5f2:	eb 28                	jmp    61c <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5f4:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5fb:	00 
 5fc:	8b 45 08             	mov    0x8(%ebp),%eax
 5ff:	89 04 24             	mov    %eax,(%esp)
 602:	e8 a2 fd ff ff       	call   3a9 <putc>
        putc(fd, c);
 607:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 60a:	0f be c0             	movsbl %al,%eax
 60d:	89 44 24 04          	mov    %eax,0x4(%esp)
 611:	8b 45 08             	mov    0x8(%ebp),%eax
 614:	89 04 24             	mov    %eax,(%esp)
 617:	e8 8d fd ff ff       	call   3a9 <putc>
      }
      state = 0;
 61c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 623:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 627:	8b 55 0c             	mov    0xc(%ebp),%edx
 62a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 62d:	01 d0                	add    %edx,%eax
 62f:	0f b6 00             	movzbl (%eax),%eax
 632:	84 c0                	test   %al,%al
 634:	0f 85 71 fe ff ff    	jne    4ab <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 63a:	c9                   	leave  
 63b:	c3                   	ret    

0000063c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 63c:	55                   	push   %ebp
 63d:	89 e5                	mov    %esp,%ebp
 63f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 642:	8b 45 08             	mov    0x8(%ebp),%eax
 645:	83 e8 08             	sub    $0x8,%eax
 648:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 64b:	a1 34 10 00 00       	mov    0x1034,%eax
 650:	89 45 fc             	mov    %eax,-0x4(%ebp)
 653:	eb 24                	jmp    679 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 655:	8b 45 fc             	mov    -0x4(%ebp),%eax
 658:	8b 00                	mov    (%eax),%eax
 65a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 65d:	77 12                	ja     671 <free+0x35>
 65f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 662:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 665:	77 24                	ja     68b <free+0x4f>
 667:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66a:	8b 00                	mov    (%eax),%eax
 66c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 66f:	77 1a                	ja     68b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 671:	8b 45 fc             	mov    -0x4(%ebp),%eax
 674:	8b 00                	mov    (%eax),%eax
 676:	89 45 fc             	mov    %eax,-0x4(%ebp)
 679:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 67f:	76 d4                	jbe    655 <free+0x19>
 681:	8b 45 fc             	mov    -0x4(%ebp),%eax
 684:	8b 00                	mov    (%eax),%eax
 686:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 689:	76 ca                	jbe    655 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 68b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68e:	8b 40 04             	mov    0x4(%eax),%eax
 691:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 698:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69b:	01 c2                	add    %eax,%edx
 69d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a0:	8b 00                	mov    (%eax),%eax
 6a2:	39 c2                	cmp    %eax,%edx
 6a4:	75 24                	jne    6ca <free+0x8e>
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
 6c8:	eb 0a                	jmp    6d4 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6cd:	8b 10                	mov    (%eax),%edx
 6cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d7:	8b 40 04             	mov    0x4(%eax),%eax
 6da:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e4:	01 d0                	add    %edx,%eax
 6e6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6e9:	75 20                	jne    70b <free+0xcf>
    p->s.size += bp->s.size;
 6eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ee:	8b 50 04             	mov    0x4(%eax),%edx
 6f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f4:	8b 40 04             	mov    0x4(%eax),%eax
 6f7:	01 c2                	add    %eax,%edx
 6f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fc:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 702:	8b 10                	mov    (%eax),%edx
 704:	8b 45 fc             	mov    -0x4(%ebp),%eax
 707:	89 10                	mov    %edx,(%eax)
 709:	eb 08                	jmp    713 <free+0xd7>
  } else
    p->s.ptr = bp;
 70b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 711:	89 10                	mov    %edx,(%eax)
  freep = p;
 713:	8b 45 fc             	mov    -0x4(%ebp),%eax
 716:	a3 34 10 00 00       	mov    %eax,0x1034
}
 71b:	c9                   	leave  
 71c:	c3                   	ret    

0000071d <morecore>:

static Header*
morecore(uint nu)
{
 71d:	55                   	push   %ebp
 71e:	89 e5                	mov    %esp,%ebp
 720:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 723:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 72a:	77 07                	ja     733 <morecore+0x16>
    nu = 4096;
 72c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 733:	8b 45 08             	mov    0x8(%ebp),%eax
 736:	c1 e0 03             	shl    $0x3,%eax
 739:	89 04 24             	mov    %eax,(%esp)
 73c:	e8 28 fc ff ff       	call   369 <sbrk>
 741:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 744:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 748:	75 07                	jne    751 <morecore+0x34>
    return 0;
 74a:	b8 00 00 00 00       	mov    $0x0,%eax
 74f:	eb 22                	jmp    773 <morecore+0x56>
  hp = (Header*)p;
 751:	8b 45 f4             	mov    -0xc(%ebp),%eax
 754:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 757:	8b 45 f0             	mov    -0x10(%ebp),%eax
 75a:	8b 55 08             	mov    0x8(%ebp),%edx
 75d:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 760:	8b 45 f0             	mov    -0x10(%ebp),%eax
 763:	83 c0 08             	add    $0x8,%eax
 766:	89 04 24             	mov    %eax,(%esp)
 769:	e8 ce fe ff ff       	call   63c <free>
  return freep;
 76e:	a1 34 10 00 00       	mov    0x1034,%eax
}
 773:	c9                   	leave  
 774:	c3                   	ret    

00000775 <malloc>:

void*
malloc(uint nbytes)
{
 775:	55                   	push   %ebp
 776:	89 e5                	mov    %esp,%ebp
 778:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 77b:	8b 45 08             	mov    0x8(%ebp),%eax
 77e:	83 c0 07             	add    $0x7,%eax
 781:	c1 e8 03             	shr    $0x3,%eax
 784:	83 c0 01             	add    $0x1,%eax
 787:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 78a:	a1 34 10 00 00       	mov    0x1034,%eax
 78f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 792:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 796:	75 23                	jne    7bb <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 798:	c7 45 f0 2c 10 00 00 	movl   $0x102c,-0x10(%ebp)
 79f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a2:	a3 34 10 00 00       	mov    %eax,0x1034
 7a7:	a1 34 10 00 00       	mov    0x1034,%eax
 7ac:	a3 2c 10 00 00       	mov    %eax,0x102c
    base.s.size = 0;
 7b1:	c7 05 30 10 00 00 00 	movl   $0x0,0x1030
 7b8:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7bb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7be:	8b 00                	mov    (%eax),%eax
 7c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c6:	8b 40 04             	mov    0x4(%eax),%eax
 7c9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7cc:	72 4d                	jb     81b <malloc+0xa6>
      if(p->s.size == nunits)
 7ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d1:	8b 40 04             	mov    0x4(%eax),%eax
 7d4:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7d7:	75 0c                	jne    7e5 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dc:	8b 10                	mov    (%eax),%edx
 7de:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e1:	89 10                	mov    %edx,(%eax)
 7e3:	eb 26                	jmp    80b <malloc+0x96>
      else {
        p->s.size -= nunits;
 7e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e8:	8b 40 04             	mov    0x4(%eax),%eax
 7eb:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7ee:	89 c2                	mov    %eax,%edx
 7f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f3:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f9:	8b 40 04             	mov    0x4(%eax),%eax
 7fc:	c1 e0 03             	shl    $0x3,%eax
 7ff:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 802:	8b 45 f4             	mov    -0xc(%ebp),%eax
 805:	8b 55 ec             	mov    -0x14(%ebp),%edx
 808:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 80b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80e:	a3 34 10 00 00       	mov    %eax,0x1034
      return (void*)(p + 1);
 813:	8b 45 f4             	mov    -0xc(%ebp),%eax
 816:	83 c0 08             	add    $0x8,%eax
 819:	eb 38                	jmp    853 <malloc+0xde>
    }
    if(p == freep)
 81b:	a1 34 10 00 00       	mov    0x1034,%eax
 820:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 823:	75 1b                	jne    840 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 825:	8b 45 ec             	mov    -0x14(%ebp),%eax
 828:	89 04 24             	mov    %eax,(%esp)
 82b:	e8 ed fe ff ff       	call   71d <morecore>
 830:	89 45 f4             	mov    %eax,-0xc(%ebp)
 833:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 837:	75 07                	jne    840 <malloc+0xcb>
        return 0;
 839:	b8 00 00 00 00       	mov    $0x0,%eax
 83e:	eb 13                	jmp    853 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 840:	8b 45 f4             	mov    -0xc(%ebp),%eax
 843:	89 45 f0             	mov    %eax,-0x10(%ebp)
 846:	8b 45 f4             	mov    -0xc(%ebp),%eax
 849:	8b 00                	mov    (%eax),%eax
 84b:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 84e:	e9 70 ff ff ff       	jmp    7c3 <malloc+0x4e>
}
 853:	c9                   	leave  
 854:	c3                   	ret    

00000855 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 855:	55                   	push   %ebp
 856:	89 e5                	mov    %esp,%ebp
 858:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 85b:	8b 55 08             	mov    0x8(%ebp),%edx
 85e:	8b 45 0c             	mov    0xc(%ebp),%eax
 861:	8b 4d 08             	mov    0x8(%ebp),%ecx
 864:	f0 87 02             	lock xchg %eax,(%edx)
 867:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 86a:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 86d:	c9                   	leave  
 86e:	c3                   	ret    

0000086f <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 86f:	55                   	push   %ebp
 870:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 872:	8b 45 08             	mov    0x8(%ebp),%eax
 875:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 87b:	5d                   	pop    %ebp
 87c:	c3                   	ret    

0000087d <lock_acquire>:
void lock_acquire(lock_t *lock){
 87d:	55                   	push   %ebp
 87e:	89 e5                	mov    %esp,%ebp
 880:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 883:	90                   	nop
 884:	8b 45 08             	mov    0x8(%ebp),%eax
 887:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 88e:	00 
 88f:	89 04 24             	mov    %eax,(%esp)
 892:	e8 be ff ff ff       	call   855 <xchg>
 897:	85 c0                	test   %eax,%eax
 899:	75 e9                	jne    884 <lock_acquire+0x7>
}
 89b:	c9                   	leave  
 89c:	c3                   	ret    

0000089d <lock_release>:
void lock_release(lock_t *lock){
 89d:	55                   	push   %ebp
 89e:	89 e5                	mov    %esp,%ebp
 8a0:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 8a3:	8b 45 08             	mov    0x8(%ebp),%eax
 8a6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8ad:	00 
 8ae:	89 04 24             	mov    %eax,(%esp)
 8b1:	e8 9f ff ff ff       	call   855 <xchg>
}
 8b6:	c9                   	leave  
 8b7:	c3                   	ret    

000008b8 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 8b8:	55                   	push   %ebp
 8b9:	89 e5                	mov    %esp,%ebp
 8bb:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 8be:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8c5:	e8 ab fe ff ff       	call   775 <malloc>
 8ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 8cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 8d3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d6:	25 ff 0f 00 00       	and    $0xfff,%eax
 8db:	85 c0                	test   %eax,%eax
 8dd:	74 14                	je     8f3 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 8df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e2:	25 ff 0f 00 00       	and    $0xfff,%eax
 8e7:	89 c2                	mov    %eax,%edx
 8e9:	b8 00 10 00 00       	mov    $0x1000,%eax
 8ee:	29 d0                	sub    %edx,%eax
 8f0:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 8f3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8f7:	75 1b                	jne    914 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 8f9:	c7 44 24 04 12 0c 00 	movl   $0xc12,0x4(%esp)
 900:	00 
 901:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 908:	e8 7c fb ff ff       	call   489 <printf>
        return 0;
 90d:	b8 00 00 00 00       	mov    $0x0,%eax
 912:	eb 6f                	jmp    983 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 914:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 917:	8b 55 08             	mov    0x8(%ebp),%edx
 91a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91d:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 921:	89 54 24 08          	mov    %edx,0x8(%esp)
 925:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 92c:	00 
 92d:	89 04 24             	mov    %eax,(%esp)
 930:	e8 4c fa ff ff       	call   381 <clone>
 935:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 938:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 93c:	79 1b                	jns    959 <thread_create+0xa1>
        printf(1,"clone fails\n");
 93e:	c7 44 24 04 20 0c 00 	movl   $0xc20,0x4(%esp)
 945:	00 
 946:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 94d:	e8 37 fb ff ff       	call   489 <printf>
        return 0;
 952:	b8 00 00 00 00       	mov    $0x0,%eax
 957:	eb 2a                	jmp    983 <thread_create+0xcb>
    }
    if(tid > 0){
 959:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 95d:	7e 05                	jle    964 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 95f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 962:	eb 1f                	jmp    983 <thread_create+0xcb>
    }
    if(tid == 0){
 964:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 968:	75 14                	jne    97e <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 96a:	c7 44 24 04 2d 0c 00 	movl   $0xc2d,0x4(%esp)
 971:	00 
 972:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 979:	e8 0b fb ff ff       	call   489 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 97e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 983:	c9                   	leave  
 984:	c3                   	ret    

00000985 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 985:	55                   	push   %ebp
 986:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 988:	8b 45 08             	mov    0x8(%ebp),%eax
 98b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 991:	8b 45 08             	mov    0x8(%ebp),%eax
 994:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 99b:	8b 45 08             	mov    0x8(%ebp),%eax
 99e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 9a5:	5d                   	pop    %ebp
 9a6:	c3                   	ret    

000009a7 <add_q>:

void add_q(struct queue *q, int v){
 9a7:	55                   	push   %ebp
 9a8:	89 e5                	mov    %esp,%ebp
 9aa:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 9ad:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 9b4:	e8 bc fd ff ff       	call   775 <malloc>
 9b9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 9bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9bf:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 9c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c9:	8b 55 0c             	mov    0xc(%ebp),%edx
 9cc:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 9ce:	8b 45 08             	mov    0x8(%ebp),%eax
 9d1:	8b 40 04             	mov    0x4(%eax),%eax
 9d4:	85 c0                	test   %eax,%eax
 9d6:	75 0b                	jne    9e3 <add_q+0x3c>
        q->head = n;
 9d8:	8b 45 08             	mov    0x8(%ebp),%eax
 9db:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9de:	89 50 04             	mov    %edx,0x4(%eax)
 9e1:	eb 0c                	jmp    9ef <add_q+0x48>
    }else{
        q->tail->next = n;
 9e3:	8b 45 08             	mov    0x8(%ebp),%eax
 9e6:	8b 40 08             	mov    0x8(%eax),%eax
 9e9:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9ec:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 9ef:	8b 45 08             	mov    0x8(%ebp),%eax
 9f2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9f5:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 9f8:	8b 45 08             	mov    0x8(%ebp),%eax
 9fb:	8b 00                	mov    (%eax),%eax
 9fd:	8d 50 01             	lea    0x1(%eax),%edx
 a00:	8b 45 08             	mov    0x8(%ebp),%eax
 a03:	89 10                	mov    %edx,(%eax)
}
 a05:	c9                   	leave  
 a06:	c3                   	ret    

00000a07 <empty_q>:

int empty_q(struct queue *q){
 a07:	55                   	push   %ebp
 a08:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 a0a:	8b 45 08             	mov    0x8(%ebp),%eax
 a0d:	8b 00                	mov    (%eax),%eax
 a0f:	85 c0                	test   %eax,%eax
 a11:	75 07                	jne    a1a <empty_q+0x13>
        return 1;
 a13:	b8 01 00 00 00       	mov    $0x1,%eax
 a18:	eb 05                	jmp    a1f <empty_q+0x18>
    else
        return 0;
 a1a:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 a1f:	5d                   	pop    %ebp
 a20:	c3                   	ret    

00000a21 <pop_q>:
int pop_q(struct queue *q){
 a21:	55                   	push   %ebp
 a22:	89 e5                	mov    %esp,%ebp
 a24:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a27:	8b 45 08             	mov    0x8(%ebp),%eax
 a2a:	89 04 24             	mov    %eax,(%esp)
 a2d:	e8 d5 ff ff ff       	call   a07 <empty_q>
 a32:	85 c0                	test   %eax,%eax
 a34:	75 5d                	jne    a93 <pop_q+0x72>
       val = q->head->value; 
 a36:	8b 45 08             	mov    0x8(%ebp),%eax
 a39:	8b 40 04             	mov    0x4(%eax),%eax
 a3c:	8b 00                	mov    (%eax),%eax
 a3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 a41:	8b 45 08             	mov    0x8(%ebp),%eax
 a44:	8b 40 04             	mov    0x4(%eax),%eax
 a47:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 a4a:	8b 45 08             	mov    0x8(%ebp),%eax
 a4d:	8b 40 04             	mov    0x4(%eax),%eax
 a50:	8b 50 04             	mov    0x4(%eax),%edx
 a53:	8b 45 08             	mov    0x8(%ebp),%eax
 a56:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a59:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a5c:	89 04 24             	mov    %eax,(%esp)
 a5f:	e8 d8 fb ff ff       	call   63c <free>
       q->size--;
 a64:	8b 45 08             	mov    0x8(%ebp),%eax
 a67:	8b 00                	mov    (%eax),%eax
 a69:	8d 50 ff             	lea    -0x1(%eax),%edx
 a6c:	8b 45 08             	mov    0x8(%ebp),%eax
 a6f:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a71:	8b 45 08             	mov    0x8(%ebp),%eax
 a74:	8b 00                	mov    (%eax),%eax
 a76:	85 c0                	test   %eax,%eax
 a78:	75 14                	jne    a8e <pop_q+0x6d>
            q->head = 0;
 a7a:	8b 45 08             	mov    0x8(%ebp),%eax
 a7d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a84:	8b 45 08             	mov    0x8(%ebp),%eax
 a87:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a91:	eb 05                	jmp    a98 <pop_q+0x77>
    }
    return -1;
 a93:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a98:	c9                   	leave  
 a99:	c3                   	ret    

00000a9a <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 a9a:	55                   	push   %ebp
 a9b:	89 e5                	mov    %esp,%ebp
 a9d:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 aa0:	8b 45 08             	mov    0x8(%ebp),%eax
 aa3:	8b 55 0c             	mov    0xc(%ebp),%edx
 aa6:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 aa9:	8b 45 08             	mov    0x8(%ebp),%eax
 aac:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 ab3:	8b 45 08             	mov    0x8(%ebp),%eax
 ab6:	89 04 24             	mov    %eax,(%esp)
 ab9:	e8 b1 fd ff ff       	call   86f <lock_init>
}
 abe:	c9                   	leave  
 abf:	c3                   	ret    

00000ac0 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
 ac3:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 ac6:	8b 45 08             	mov    0x8(%ebp),%eax
 ac9:	89 04 24             	mov    %eax,(%esp)
 acc:	e8 ac fd ff ff       	call   87d <lock_acquire>
	if(s->count  == 0){
 ad1:	8b 45 08             	mov    0x8(%ebp),%eax
 ad4:	8b 40 04             	mov    0x4(%eax),%eax
 ad7:	85 c0                	test   %eax,%eax
 ad9:	75 43                	jne    b1e <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 adb:	c7 44 24 04 3e 0c 00 	movl   $0xc3e,0x4(%esp)
 ae2:	00 
 ae3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 aea:	e8 9a f9 ff ff       	call   489 <printf>
		//add proc to waiters list
		int tid = getpid();
 aef:	e8 6d f8 ff ff       	call   361 <getpid>
 af4:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 af7:	8b 45 08             	mov    0x8(%ebp),%eax
 afa:	8d 50 0c             	lea    0xc(%eax),%edx
 afd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b00:	89 44 24 04          	mov    %eax,0x4(%esp)
 b04:	89 14 24             	mov    %edx,(%esp)
 b07:	e8 9b fe ff ff       	call   9a7 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 b0c:	8b 45 08             	mov    0x8(%ebp),%eax
 b0f:	89 04 24             	mov    %eax,(%esp)
 b12:	e8 86 fd ff ff       	call   89d <lock_release>
		tsleep(); 
 b17:	e8 75 f8 ff ff       	call   391 <tsleep>
 b1c:	eb 2e                	jmp    b4c <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 b1e:	c7 44 24 04 45 0c 00 	movl   $0xc45,0x4(%esp)
 b25:	00 
 b26:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b2d:	e8 57 f9 ff ff       	call   489 <printf>
		s->count--;	
 b32:	8b 45 08             	mov    0x8(%ebp),%eax
 b35:	8b 40 04             	mov    0x4(%eax),%eax
 b38:	8d 50 ff             	lea    -0x1(%eax),%edx
 b3b:	8b 45 08             	mov    0x8(%ebp),%eax
 b3e:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b41:	8b 45 08             	mov    0x8(%ebp),%eax
 b44:	89 04 24             	mov    %eax,(%esp)
 b47:	e8 51 fd ff ff       	call   89d <lock_release>
	}
}
 b4c:	c9                   	leave  
 b4d:	c3                   	ret    

00000b4e <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b4e:	55                   	push   %ebp
 b4f:	89 e5                	mov    %esp,%ebp
 b51:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 b54:	c7 44 24 04 4c 0c 00 	movl   $0xc4c,0x4(%esp)
 b5b:	00 
 b5c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b63:	e8 21 f9 ff ff       	call   489 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b68:	8b 45 08             	mov    0x8(%ebp),%eax
 b6b:	89 04 24             	mov    %eax,(%esp)
 b6e:	e8 0a fd ff ff       	call   87d <lock_acquire>
	if(s->count < s->size){
 b73:	8b 45 08             	mov    0x8(%ebp),%eax
 b76:	8b 50 04             	mov    0x4(%eax),%edx
 b79:	8b 45 08             	mov    0x8(%ebp),%eax
 b7c:	8b 40 08             	mov    0x8(%eax),%eax
 b7f:	39 c2                	cmp    %eax,%edx
 b81:	7d 0f                	jge    b92 <sem_signal+0x44>
		s->count++;	
 b83:	8b 45 08             	mov    0x8(%ebp),%eax
 b86:	8b 40 04             	mov    0x4(%eax),%eax
 b89:	8d 50 01             	lea    0x1(%eax),%edx
 b8c:	8b 45 08             	mov    0x8(%ebp),%eax
 b8f:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 b92:	8b 45 08             	mov    0x8(%ebp),%eax
 b95:	83 c0 0c             	add    $0xc,%eax
 b98:	89 04 24             	mov    %eax,(%esp)
 b9b:	e8 81 fe ff ff       	call   a21 <pop_q>
 ba0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 ba3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 ba7:	74 2e                	je     bd7 <sem_signal+0x89>
		printf(1, "Sem A\n");
 ba9:	c7 44 24 04 45 0c 00 	movl   $0xc45,0x4(%esp)
 bb0:	00 
 bb1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bb8:	e8 cc f8 ff ff       	call   489 <printf>
		twakeup(tid);
 bbd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc0:	89 04 24             	mov    %eax,(%esp)
 bc3:	e8 d1 f7 ff ff       	call   399 <twakeup>
		s->count--;
 bc8:	8b 45 08             	mov    0x8(%ebp),%eax
 bcb:	8b 40 04             	mov    0x4(%eax),%eax
 bce:	8d 50 ff             	lea    -0x1(%eax),%edx
 bd1:	8b 45 08             	mov    0x8(%ebp),%eax
 bd4:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 bd7:	8b 45 08             	mov    0x8(%ebp),%eax
 bda:	89 04 24             	mov    %eax,(%esp)
 bdd:	e8 bb fc ff ff       	call   89d <lock_release>

 be2:	c9                   	leave  
 be3:	c3                   	ret    
