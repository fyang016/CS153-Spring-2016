
_zombie:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "stat.h"
#include "user.h"

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 10             	sub    $0x10,%esp
  if(fork() > 0)
   9:	e8 75 02 00 00       	call   283 <fork>
   e:	85 c0                	test   %eax,%eax
  10:	7e 0c                	jle    1e <main+0x1e>
    sleep(5);  // Let child exit before parent.
  12:	c7 04 24 05 00 00 00 	movl   $0x5,(%esp)
  19:	e8 fd 02 00 00       	call   31b <sleep>
  exit();
  1e:	e8 68 02 00 00       	call   28b <exit>

00000023 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  23:	55                   	push   %ebp
  24:	89 e5                	mov    %esp,%ebp
  26:	57                   	push   %edi
  27:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  28:	8b 4d 08             	mov    0x8(%ebp),%ecx
  2b:	8b 55 10             	mov    0x10(%ebp),%edx
  2e:	8b 45 0c             	mov    0xc(%ebp),%eax
  31:	89 cb                	mov    %ecx,%ebx
  33:	89 df                	mov    %ebx,%edi
  35:	89 d1                	mov    %edx,%ecx
  37:	fc                   	cld    
  38:	f3 aa                	rep stos %al,%es:(%edi)
  3a:	89 ca                	mov    %ecx,%edx
  3c:	89 fb                	mov    %edi,%ebx
  3e:	89 5d 08             	mov    %ebx,0x8(%ebp)
  41:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  44:	5b                   	pop    %ebx
  45:	5f                   	pop    %edi
  46:	5d                   	pop    %ebp
  47:	c3                   	ret    

00000048 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  48:	55                   	push   %ebp
  49:	89 e5                	mov    %esp,%ebp
  4b:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  4e:	8b 45 08             	mov    0x8(%ebp),%eax
  51:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  54:	90                   	nop
  55:	8b 45 08             	mov    0x8(%ebp),%eax
  58:	8d 50 01             	lea    0x1(%eax),%edx
  5b:	89 55 08             	mov    %edx,0x8(%ebp)
  5e:	8b 55 0c             	mov    0xc(%ebp),%edx
  61:	8d 4a 01             	lea    0x1(%edx),%ecx
  64:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  67:	0f b6 12             	movzbl (%edx),%edx
  6a:	88 10                	mov    %dl,(%eax)
  6c:	0f b6 00             	movzbl (%eax),%eax
  6f:	84 c0                	test   %al,%al
  71:	75 e2                	jne    55 <strcpy+0xd>
    ;
  return os;
  73:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  76:	c9                   	leave  
  77:	c3                   	ret    

00000078 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  78:	55                   	push   %ebp
  79:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  7b:	eb 08                	jmp    85 <strcmp+0xd>
    p++, q++;
  7d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  81:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  85:	8b 45 08             	mov    0x8(%ebp),%eax
  88:	0f b6 00             	movzbl (%eax),%eax
  8b:	84 c0                	test   %al,%al
  8d:	74 10                	je     9f <strcmp+0x27>
  8f:	8b 45 08             	mov    0x8(%ebp),%eax
  92:	0f b6 10             	movzbl (%eax),%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	0f b6 00             	movzbl (%eax),%eax
  9b:	38 c2                	cmp    %al,%dl
  9d:	74 de                	je     7d <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  9f:	8b 45 08             	mov    0x8(%ebp),%eax
  a2:	0f b6 00             	movzbl (%eax),%eax
  a5:	0f b6 d0             	movzbl %al,%edx
  a8:	8b 45 0c             	mov    0xc(%ebp),%eax
  ab:	0f b6 00             	movzbl (%eax),%eax
  ae:	0f b6 c0             	movzbl %al,%eax
  b1:	29 c2                	sub    %eax,%edx
  b3:	89 d0                	mov    %edx,%eax
}
  b5:	5d                   	pop    %ebp
  b6:	c3                   	ret    

000000b7 <strlen>:

uint
strlen(char *s)
{
  b7:	55                   	push   %ebp
  b8:	89 e5                	mov    %esp,%ebp
  ba:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  bd:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  c4:	eb 04                	jmp    ca <strlen+0x13>
  c6:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  ca:	8b 55 fc             	mov    -0x4(%ebp),%edx
  cd:	8b 45 08             	mov    0x8(%ebp),%eax
  d0:	01 d0                	add    %edx,%eax
  d2:	0f b6 00             	movzbl (%eax),%eax
  d5:	84 c0                	test   %al,%al
  d7:	75 ed                	jne    c6 <strlen+0xf>
    ;
  return n;
  d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  dc:	c9                   	leave  
  dd:	c3                   	ret    

000000de <memset>:

void*
memset(void *dst, int c, uint n)
{
  de:	55                   	push   %ebp
  df:	89 e5                	mov    %esp,%ebp
  e1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  e4:	8b 45 10             	mov    0x10(%ebp),%eax
  e7:	89 44 24 08          	mov    %eax,0x8(%esp)
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	89 44 24 04          	mov    %eax,0x4(%esp)
  f2:	8b 45 08             	mov    0x8(%ebp),%eax
  f5:	89 04 24             	mov    %eax,(%esp)
  f8:	e8 26 ff ff ff       	call   23 <stosb>
  return dst;
  fd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 100:	c9                   	leave  
 101:	c3                   	ret    

00000102 <strchr>:

char*
strchr(const char *s, char c)
{
 102:	55                   	push   %ebp
 103:	89 e5                	mov    %esp,%ebp
 105:	83 ec 04             	sub    $0x4,%esp
 108:	8b 45 0c             	mov    0xc(%ebp),%eax
 10b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 10e:	eb 14                	jmp    124 <strchr+0x22>
    if(*s == c)
 110:	8b 45 08             	mov    0x8(%ebp),%eax
 113:	0f b6 00             	movzbl (%eax),%eax
 116:	3a 45 fc             	cmp    -0x4(%ebp),%al
 119:	75 05                	jne    120 <strchr+0x1e>
      return (char*)s;
 11b:	8b 45 08             	mov    0x8(%ebp),%eax
 11e:	eb 13                	jmp    133 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 120:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	84 c0                	test   %al,%al
 12c:	75 e2                	jne    110 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 12e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 133:	c9                   	leave  
 134:	c3                   	ret    

00000135 <gets>:

char*
gets(char *buf, int max)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 13b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 142:	eb 4c                	jmp    190 <gets+0x5b>
    cc = read(0, &c, 1);
 144:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 14b:	00 
 14c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 14f:	89 44 24 04          	mov    %eax,0x4(%esp)
 153:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 15a:	e8 44 01 00 00       	call   2a3 <read>
 15f:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 162:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 166:	7f 02                	jg     16a <gets+0x35>
      break;
 168:	eb 31                	jmp    19b <gets+0x66>
    buf[i++] = c;
 16a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 16d:	8d 50 01             	lea    0x1(%eax),%edx
 170:	89 55 f4             	mov    %edx,-0xc(%ebp)
 173:	89 c2                	mov    %eax,%edx
 175:	8b 45 08             	mov    0x8(%ebp),%eax
 178:	01 c2                	add    %eax,%edx
 17a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 17e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 180:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 184:	3c 0a                	cmp    $0xa,%al
 186:	74 13                	je     19b <gets+0x66>
 188:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 18c:	3c 0d                	cmp    $0xd,%al
 18e:	74 0b                	je     19b <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 190:	8b 45 f4             	mov    -0xc(%ebp),%eax
 193:	83 c0 01             	add    $0x1,%eax
 196:	3b 45 0c             	cmp    0xc(%ebp),%eax
 199:	7c a9                	jl     144 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 19b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 19e:	8b 45 08             	mov    0x8(%ebp),%eax
 1a1:	01 d0                	add    %edx,%eax
 1a3:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1a6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1a9:	c9                   	leave  
 1aa:	c3                   	ret    

000001ab <stat>:

int
stat(char *n, struct stat *st)
{
 1ab:	55                   	push   %ebp
 1ac:	89 e5                	mov    %esp,%ebp
 1ae:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1b1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1b8:	00 
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	89 04 24             	mov    %eax,(%esp)
 1bf:	e8 07 01 00 00       	call   2cb <open>
 1c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 1c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1cb:	79 07                	jns    1d4 <stat+0x29>
    return -1;
 1cd:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1d2:	eb 23                	jmp    1f7 <stat+0x4c>
  r = fstat(fd, st);
 1d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1de:	89 04 24             	mov    %eax,(%esp)
 1e1:	e8 fd 00 00 00       	call   2e3 <fstat>
 1e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 1e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ec:	89 04 24             	mov    %eax,(%esp)
 1ef:	e8 bf 00 00 00       	call   2b3 <close>
  return r;
 1f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 1f7:	c9                   	leave  
 1f8:	c3                   	ret    

000001f9 <atoi>:

int
atoi(const char *s)
{
 1f9:	55                   	push   %ebp
 1fa:	89 e5                	mov    %esp,%ebp
 1fc:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 1ff:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 206:	eb 25                	jmp    22d <atoi+0x34>
    n = n*10 + *s++ - '0';
 208:	8b 55 fc             	mov    -0x4(%ebp),%edx
 20b:	89 d0                	mov    %edx,%eax
 20d:	c1 e0 02             	shl    $0x2,%eax
 210:	01 d0                	add    %edx,%eax
 212:	01 c0                	add    %eax,%eax
 214:	89 c1                	mov    %eax,%ecx
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	8d 50 01             	lea    0x1(%eax),%edx
 21c:	89 55 08             	mov    %edx,0x8(%ebp)
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	0f be c0             	movsbl %al,%eax
 225:	01 c8                	add    %ecx,%eax
 227:	83 e8 30             	sub    $0x30,%eax
 22a:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 22d:	8b 45 08             	mov    0x8(%ebp),%eax
 230:	0f b6 00             	movzbl (%eax),%eax
 233:	3c 2f                	cmp    $0x2f,%al
 235:	7e 0a                	jle    241 <atoi+0x48>
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 00             	movzbl (%eax),%eax
 23d:	3c 39                	cmp    $0x39,%al
 23f:	7e c7                	jle    208 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 241:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 244:	c9                   	leave  
 245:	c3                   	ret    

00000246 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 246:	55                   	push   %ebp
 247:	89 e5                	mov    %esp,%ebp
 249:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 252:	8b 45 0c             	mov    0xc(%ebp),%eax
 255:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 258:	eb 17                	jmp    271 <memmove+0x2b>
    *dst++ = *src++;
 25a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 25d:	8d 50 01             	lea    0x1(%eax),%edx
 260:	89 55 fc             	mov    %edx,-0x4(%ebp)
 263:	8b 55 f8             	mov    -0x8(%ebp),%edx
 266:	8d 4a 01             	lea    0x1(%edx),%ecx
 269:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 26c:	0f b6 12             	movzbl (%edx),%edx
 26f:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 271:	8b 45 10             	mov    0x10(%ebp),%eax
 274:	8d 50 ff             	lea    -0x1(%eax),%edx
 277:	89 55 10             	mov    %edx,0x10(%ebp)
 27a:	85 c0                	test   %eax,%eax
 27c:	7f dc                	jg     25a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 27e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 281:	c9                   	leave  
 282:	c3                   	ret    

00000283 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 283:	b8 01 00 00 00       	mov    $0x1,%eax
 288:	cd 40                	int    $0x40
 28a:	c3                   	ret    

0000028b <exit>:
SYSCALL(exit)
 28b:	b8 02 00 00 00       	mov    $0x2,%eax
 290:	cd 40                	int    $0x40
 292:	c3                   	ret    

00000293 <wait>:
SYSCALL(wait)
 293:	b8 03 00 00 00       	mov    $0x3,%eax
 298:	cd 40                	int    $0x40
 29a:	c3                   	ret    

0000029b <pipe>:
SYSCALL(pipe)
 29b:	b8 04 00 00 00       	mov    $0x4,%eax
 2a0:	cd 40                	int    $0x40
 2a2:	c3                   	ret    

000002a3 <read>:
SYSCALL(read)
 2a3:	b8 05 00 00 00       	mov    $0x5,%eax
 2a8:	cd 40                	int    $0x40
 2aa:	c3                   	ret    

000002ab <write>:
SYSCALL(write)
 2ab:	b8 10 00 00 00       	mov    $0x10,%eax
 2b0:	cd 40                	int    $0x40
 2b2:	c3                   	ret    

000002b3 <close>:
SYSCALL(close)
 2b3:	b8 15 00 00 00       	mov    $0x15,%eax
 2b8:	cd 40                	int    $0x40
 2ba:	c3                   	ret    

000002bb <kill>:
SYSCALL(kill)
 2bb:	b8 06 00 00 00       	mov    $0x6,%eax
 2c0:	cd 40                	int    $0x40
 2c2:	c3                   	ret    

000002c3 <exec>:
SYSCALL(exec)
 2c3:	b8 07 00 00 00       	mov    $0x7,%eax
 2c8:	cd 40                	int    $0x40
 2ca:	c3                   	ret    

000002cb <open>:
SYSCALL(open)
 2cb:	b8 0f 00 00 00       	mov    $0xf,%eax
 2d0:	cd 40                	int    $0x40
 2d2:	c3                   	ret    

000002d3 <mknod>:
SYSCALL(mknod)
 2d3:	b8 11 00 00 00       	mov    $0x11,%eax
 2d8:	cd 40                	int    $0x40
 2da:	c3                   	ret    

000002db <unlink>:
SYSCALL(unlink)
 2db:	b8 12 00 00 00       	mov    $0x12,%eax
 2e0:	cd 40                	int    $0x40
 2e2:	c3                   	ret    

000002e3 <fstat>:
SYSCALL(fstat)
 2e3:	b8 08 00 00 00       	mov    $0x8,%eax
 2e8:	cd 40                	int    $0x40
 2ea:	c3                   	ret    

000002eb <link>:
SYSCALL(link)
 2eb:	b8 13 00 00 00       	mov    $0x13,%eax
 2f0:	cd 40                	int    $0x40
 2f2:	c3                   	ret    

000002f3 <mkdir>:
SYSCALL(mkdir)
 2f3:	b8 14 00 00 00       	mov    $0x14,%eax
 2f8:	cd 40                	int    $0x40
 2fa:	c3                   	ret    

000002fb <chdir>:
SYSCALL(chdir)
 2fb:	b8 09 00 00 00       	mov    $0x9,%eax
 300:	cd 40                	int    $0x40
 302:	c3                   	ret    

00000303 <dup>:
SYSCALL(dup)
 303:	b8 0a 00 00 00       	mov    $0xa,%eax
 308:	cd 40                	int    $0x40
 30a:	c3                   	ret    

0000030b <getpid>:
SYSCALL(getpid)
 30b:	b8 0b 00 00 00       	mov    $0xb,%eax
 310:	cd 40                	int    $0x40
 312:	c3                   	ret    

00000313 <sbrk>:
SYSCALL(sbrk)
 313:	b8 0c 00 00 00       	mov    $0xc,%eax
 318:	cd 40                	int    $0x40
 31a:	c3                   	ret    

0000031b <sleep>:
SYSCALL(sleep)
 31b:	b8 0d 00 00 00       	mov    $0xd,%eax
 320:	cd 40                	int    $0x40
 322:	c3                   	ret    

00000323 <uptime>:
SYSCALL(uptime)
 323:	b8 0e 00 00 00       	mov    $0xe,%eax
 328:	cd 40                	int    $0x40
 32a:	c3                   	ret    

0000032b <clone>:
SYSCALL(clone)
 32b:	b8 16 00 00 00       	mov    $0x16,%eax
 330:	cd 40                	int    $0x40
 332:	c3                   	ret    

00000333 <texit>:
SYSCALL(texit)
 333:	b8 17 00 00 00       	mov    $0x17,%eax
 338:	cd 40                	int    $0x40
 33a:	c3                   	ret    

0000033b <tsleep>:
SYSCALL(tsleep)
 33b:	b8 18 00 00 00       	mov    $0x18,%eax
 340:	cd 40                	int    $0x40
 342:	c3                   	ret    

00000343 <twakeup>:
SYSCALL(twakeup)
 343:	b8 19 00 00 00       	mov    $0x19,%eax
 348:	cd 40                	int    $0x40
 34a:	c3                   	ret    

0000034b <test>:
SYSCALL(test)
 34b:	b8 1a 00 00 00       	mov    $0x1a,%eax
 350:	cd 40                	int    $0x40
 352:	c3                   	ret    

00000353 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 353:	55                   	push   %ebp
 354:	89 e5                	mov    %esp,%ebp
 356:	83 ec 18             	sub    $0x18,%esp
 359:	8b 45 0c             	mov    0xc(%ebp),%eax
 35c:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 35f:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 366:	00 
 367:	8d 45 f4             	lea    -0xc(%ebp),%eax
 36a:	89 44 24 04          	mov    %eax,0x4(%esp)
 36e:	8b 45 08             	mov    0x8(%ebp),%eax
 371:	89 04 24             	mov    %eax,(%esp)
 374:	e8 32 ff ff ff       	call   2ab <write>
}
 379:	c9                   	leave  
 37a:	c3                   	ret    

0000037b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 37b:	55                   	push   %ebp
 37c:	89 e5                	mov    %esp,%ebp
 37e:	56                   	push   %esi
 37f:	53                   	push   %ebx
 380:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 383:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 38a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 38e:	74 17                	je     3a7 <printint+0x2c>
 390:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 394:	79 11                	jns    3a7 <printint+0x2c>
    neg = 1;
 396:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 39d:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a0:	f7 d8                	neg    %eax
 3a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3a5:	eb 06                	jmp    3ad <printint+0x32>
  } else {
    x = xx;
 3a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3aa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 3ad:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 3b4:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 3b7:	8d 41 01             	lea    0x1(%ecx),%eax
 3ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3bd:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3c3:	ba 00 00 00 00       	mov    $0x0,%edx
 3c8:	f7 f3                	div    %ebx
 3ca:	89 d0                	mov    %edx,%eax
 3cc:	0f b6 80 54 0f 00 00 	movzbl 0xf54(%eax),%eax
 3d3:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 3d7:	8b 75 10             	mov    0x10(%ebp),%esi
 3da:	8b 45 ec             	mov    -0x14(%ebp),%eax
 3dd:	ba 00 00 00 00       	mov    $0x0,%edx
 3e2:	f7 f6                	div    %esi
 3e4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 3e7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 3eb:	75 c7                	jne    3b4 <printint+0x39>
  if(neg)
 3ed:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3f1:	74 10                	je     403 <printint+0x88>
    buf[i++] = '-';
 3f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f6:	8d 50 01             	lea    0x1(%eax),%edx
 3f9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3fc:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 401:	eb 1f                	jmp    422 <printint+0xa7>
 403:	eb 1d                	jmp    422 <printint+0xa7>
    putc(fd, buf[i]);
 405:	8d 55 dc             	lea    -0x24(%ebp),%edx
 408:	8b 45 f4             	mov    -0xc(%ebp),%eax
 40b:	01 d0                	add    %edx,%eax
 40d:	0f b6 00             	movzbl (%eax),%eax
 410:	0f be c0             	movsbl %al,%eax
 413:	89 44 24 04          	mov    %eax,0x4(%esp)
 417:	8b 45 08             	mov    0x8(%ebp),%eax
 41a:	89 04 24             	mov    %eax,(%esp)
 41d:	e8 31 ff ff ff       	call   353 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 422:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 426:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 42a:	79 d9                	jns    405 <printint+0x8a>
    putc(fd, buf[i]);
}
 42c:	83 c4 30             	add    $0x30,%esp
 42f:	5b                   	pop    %ebx
 430:	5e                   	pop    %esi
 431:	5d                   	pop    %ebp
 432:	c3                   	ret    

00000433 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 433:	55                   	push   %ebp
 434:	89 e5                	mov    %esp,%ebp
 436:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 439:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 440:	8d 45 0c             	lea    0xc(%ebp),%eax
 443:	83 c0 04             	add    $0x4,%eax
 446:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 449:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 450:	e9 7c 01 00 00       	jmp    5d1 <printf+0x19e>
    c = fmt[i] & 0xff;
 455:	8b 55 0c             	mov    0xc(%ebp),%edx
 458:	8b 45 f0             	mov    -0x10(%ebp),%eax
 45b:	01 d0                	add    %edx,%eax
 45d:	0f b6 00             	movzbl (%eax),%eax
 460:	0f be c0             	movsbl %al,%eax
 463:	25 ff 00 00 00       	and    $0xff,%eax
 468:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 46b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 46f:	75 2c                	jne    49d <printf+0x6a>
      if(c == '%'){
 471:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 475:	75 0c                	jne    483 <printf+0x50>
        state = '%';
 477:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 47e:	e9 4a 01 00 00       	jmp    5cd <printf+0x19a>
      } else {
        putc(fd, c);
 483:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 486:	0f be c0             	movsbl %al,%eax
 489:	89 44 24 04          	mov    %eax,0x4(%esp)
 48d:	8b 45 08             	mov    0x8(%ebp),%eax
 490:	89 04 24             	mov    %eax,(%esp)
 493:	e8 bb fe ff ff       	call   353 <putc>
 498:	e9 30 01 00 00       	jmp    5cd <printf+0x19a>
      }
    } else if(state == '%'){
 49d:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 4a1:	0f 85 26 01 00 00    	jne    5cd <printf+0x19a>
      if(c == 'd'){
 4a7:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 4ab:	75 2d                	jne    4da <printf+0xa7>
        printint(fd, *ap, 10, 1);
 4ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4b0:	8b 00                	mov    (%eax),%eax
 4b2:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4b9:	00 
 4ba:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4c1:	00 
 4c2:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c6:	8b 45 08             	mov    0x8(%ebp),%eax
 4c9:	89 04 24             	mov    %eax,(%esp)
 4cc:	e8 aa fe ff ff       	call   37b <printint>
        ap++;
 4d1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 4d5:	e9 ec 00 00 00       	jmp    5c6 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 4da:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 4de:	74 06                	je     4e6 <printf+0xb3>
 4e0:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 4e4:	75 2d                	jne    513 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 4e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e9:	8b 00                	mov    (%eax),%eax
 4eb:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4f2:	00 
 4f3:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 4fa:	00 
 4fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	89 04 24             	mov    %eax,(%esp)
 505:	e8 71 fe ff ff       	call   37b <printint>
        ap++;
 50a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 50e:	e9 b3 00 00 00       	jmp    5c6 <printf+0x193>
      } else if(c == 's'){
 513:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 517:	75 45                	jne    55e <printf+0x12b>
        s = (char*)*ap;
 519:	8b 45 e8             	mov    -0x18(%ebp),%eax
 51c:	8b 00                	mov    (%eax),%eax
 51e:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 521:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 525:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 529:	75 09                	jne    534 <printf+0x101>
          s = "(null)";
 52b:	c7 45 f4 5a 0b 00 00 	movl   $0xb5a,-0xc(%ebp)
        while(*s != 0){
 532:	eb 1e                	jmp    552 <printf+0x11f>
 534:	eb 1c                	jmp    552 <printf+0x11f>
          putc(fd, *s);
 536:	8b 45 f4             	mov    -0xc(%ebp),%eax
 539:	0f b6 00             	movzbl (%eax),%eax
 53c:	0f be c0             	movsbl %al,%eax
 53f:	89 44 24 04          	mov    %eax,0x4(%esp)
 543:	8b 45 08             	mov    0x8(%ebp),%eax
 546:	89 04 24             	mov    %eax,(%esp)
 549:	e8 05 fe ff ff       	call   353 <putc>
          s++;
 54e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 552:	8b 45 f4             	mov    -0xc(%ebp),%eax
 555:	0f b6 00             	movzbl (%eax),%eax
 558:	84 c0                	test   %al,%al
 55a:	75 da                	jne    536 <printf+0x103>
 55c:	eb 68                	jmp    5c6 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 55e:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 562:	75 1d                	jne    581 <printf+0x14e>
        putc(fd, *ap);
 564:	8b 45 e8             	mov    -0x18(%ebp),%eax
 567:	8b 00                	mov    (%eax),%eax
 569:	0f be c0             	movsbl %al,%eax
 56c:	89 44 24 04          	mov    %eax,0x4(%esp)
 570:	8b 45 08             	mov    0x8(%ebp),%eax
 573:	89 04 24             	mov    %eax,(%esp)
 576:	e8 d8 fd ff ff       	call   353 <putc>
        ap++;
 57b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 57f:	eb 45                	jmp    5c6 <printf+0x193>
      } else if(c == '%'){
 581:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 585:	75 17                	jne    59e <printf+0x16b>
        putc(fd, c);
 587:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 58a:	0f be c0             	movsbl %al,%eax
 58d:	89 44 24 04          	mov    %eax,0x4(%esp)
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	89 04 24             	mov    %eax,(%esp)
 597:	e8 b7 fd ff ff       	call   353 <putc>
 59c:	eb 28                	jmp    5c6 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 59e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5a5:	00 
 5a6:	8b 45 08             	mov    0x8(%ebp),%eax
 5a9:	89 04 24             	mov    %eax,(%esp)
 5ac:	e8 a2 fd ff ff       	call   353 <putc>
        putc(fd, c);
 5b1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b4:	0f be c0             	movsbl %al,%eax
 5b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bb:	8b 45 08             	mov    0x8(%ebp),%eax
 5be:	89 04 24             	mov    %eax,(%esp)
 5c1:	e8 8d fd ff ff       	call   353 <putc>
      }
      state = 0;
 5c6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5cd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 5d1:	8b 55 0c             	mov    0xc(%ebp),%edx
 5d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5d7:	01 d0                	add    %edx,%eax
 5d9:	0f b6 00             	movzbl (%eax),%eax
 5dc:	84 c0                	test   %al,%al
 5de:	0f 85 71 fe ff ff    	jne    455 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5e4:	c9                   	leave  
 5e5:	c3                   	ret    

000005e6 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5e6:	55                   	push   %ebp
 5e7:	89 e5                	mov    %esp,%ebp
 5e9:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5ec:	8b 45 08             	mov    0x8(%ebp),%eax
 5ef:	83 e8 08             	sub    $0x8,%eax
 5f2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5f5:	a1 70 0f 00 00       	mov    0xf70,%eax
 5fa:	89 45 fc             	mov    %eax,-0x4(%ebp)
 5fd:	eb 24                	jmp    623 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 5ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 602:	8b 00                	mov    (%eax),%eax
 604:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 607:	77 12                	ja     61b <free+0x35>
 609:	8b 45 f8             	mov    -0x8(%ebp),%eax
 60c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 60f:	77 24                	ja     635 <free+0x4f>
 611:	8b 45 fc             	mov    -0x4(%ebp),%eax
 614:	8b 00                	mov    (%eax),%eax
 616:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 619:	77 1a                	ja     635 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 61b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61e:	8b 00                	mov    (%eax),%eax
 620:	89 45 fc             	mov    %eax,-0x4(%ebp)
 623:	8b 45 f8             	mov    -0x8(%ebp),%eax
 626:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 629:	76 d4                	jbe    5ff <free+0x19>
 62b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 62e:	8b 00                	mov    (%eax),%eax
 630:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 633:	76 ca                	jbe    5ff <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 635:	8b 45 f8             	mov    -0x8(%ebp),%eax
 638:	8b 40 04             	mov    0x4(%eax),%eax
 63b:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 642:	8b 45 f8             	mov    -0x8(%ebp),%eax
 645:	01 c2                	add    %eax,%edx
 647:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64a:	8b 00                	mov    (%eax),%eax
 64c:	39 c2                	cmp    %eax,%edx
 64e:	75 24                	jne    674 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 650:	8b 45 f8             	mov    -0x8(%ebp),%eax
 653:	8b 50 04             	mov    0x4(%eax),%edx
 656:	8b 45 fc             	mov    -0x4(%ebp),%eax
 659:	8b 00                	mov    (%eax),%eax
 65b:	8b 40 04             	mov    0x4(%eax),%eax
 65e:	01 c2                	add    %eax,%edx
 660:	8b 45 f8             	mov    -0x8(%ebp),%eax
 663:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 666:	8b 45 fc             	mov    -0x4(%ebp),%eax
 669:	8b 00                	mov    (%eax),%eax
 66b:	8b 10                	mov    (%eax),%edx
 66d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 670:	89 10                	mov    %edx,(%eax)
 672:	eb 0a                	jmp    67e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 674:	8b 45 fc             	mov    -0x4(%ebp),%eax
 677:	8b 10                	mov    (%eax),%edx
 679:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 67e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 681:	8b 40 04             	mov    0x4(%eax),%eax
 684:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 68b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68e:	01 d0                	add    %edx,%eax
 690:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 693:	75 20                	jne    6b5 <free+0xcf>
    p->s.size += bp->s.size;
 695:	8b 45 fc             	mov    -0x4(%ebp),%eax
 698:	8b 50 04             	mov    0x4(%eax),%edx
 69b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69e:	8b 40 04             	mov    0x4(%eax),%eax
 6a1:	01 c2                	add    %eax,%edx
 6a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ac:	8b 10                	mov    (%eax),%edx
 6ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b1:	89 10                	mov    %edx,(%eax)
 6b3:	eb 08                	jmp    6bd <free+0xd7>
  } else
    p->s.ptr = bp;
 6b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6bb:	89 10                	mov    %edx,(%eax)
  freep = p;
 6bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c0:	a3 70 0f 00 00       	mov    %eax,0xf70
}
 6c5:	c9                   	leave  
 6c6:	c3                   	ret    

000006c7 <morecore>:

static Header*
morecore(uint nu)
{
 6c7:	55                   	push   %ebp
 6c8:	89 e5                	mov    %esp,%ebp
 6ca:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6cd:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 6d4:	77 07                	ja     6dd <morecore+0x16>
    nu = 4096;
 6d6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 6dd:	8b 45 08             	mov    0x8(%ebp),%eax
 6e0:	c1 e0 03             	shl    $0x3,%eax
 6e3:	89 04 24             	mov    %eax,(%esp)
 6e6:	e8 28 fc ff ff       	call   313 <sbrk>
 6eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 6ee:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 6f2:	75 07                	jne    6fb <morecore+0x34>
    return 0;
 6f4:	b8 00 00 00 00       	mov    $0x0,%eax
 6f9:	eb 22                	jmp    71d <morecore+0x56>
  hp = (Header*)p;
 6fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6fe:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 701:	8b 45 f0             	mov    -0x10(%ebp),%eax
 704:	8b 55 08             	mov    0x8(%ebp),%edx
 707:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 70a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 70d:	83 c0 08             	add    $0x8,%eax
 710:	89 04 24             	mov    %eax,(%esp)
 713:	e8 ce fe ff ff       	call   5e6 <free>
  return freep;
 718:	a1 70 0f 00 00       	mov    0xf70,%eax
}
 71d:	c9                   	leave  
 71e:	c3                   	ret    

0000071f <malloc>:

void*
malloc(uint nbytes)
{
 71f:	55                   	push   %ebp
 720:	89 e5                	mov    %esp,%ebp
 722:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 725:	8b 45 08             	mov    0x8(%ebp),%eax
 728:	83 c0 07             	add    $0x7,%eax
 72b:	c1 e8 03             	shr    $0x3,%eax
 72e:	83 c0 01             	add    $0x1,%eax
 731:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 734:	a1 70 0f 00 00       	mov    0xf70,%eax
 739:	89 45 f0             	mov    %eax,-0x10(%ebp)
 73c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 740:	75 23                	jne    765 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 742:	c7 45 f0 68 0f 00 00 	movl   $0xf68,-0x10(%ebp)
 749:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74c:	a3 70 0f 00 00       	mov    %eax,0xf70
 751:	a1 70 0f 00 00       	mov    0xf70,%eax
 756:	a3 68 0f 00 00       	mov    %eax,0xf68
    base.s.size = 0;
 75b:	c7 05 6c 0f 00 00 00 	movl   $0x0,0xf6c
 762:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 765:	8b 45 f0             	mov    -0x10(%ebp),%eax
 768:	8b 00                	mov    (%eax),%eax
 76a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 76d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 770:	8b 40 04             	mov    0x4(%eax),%eax
 773:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 776:	72 4d                	jb     7c5 <malloc+0xa6>
      if(p->s.size == nunits)
 778:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77b:	8b 40 04             	mov    0x4(%eax),%eax
 77e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 781:	75 0c                	jne    78f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 783:	8b 45 f4             	mov    -0xc(%ebp),%eax
 786:	8b 10                	mov    (%eax),%edx
 788:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78b:	89 10                	mov    %edx,(%eax)
 78d:	eb 26                	jmp    7b5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 78f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 792:	8b 40 04             	mov    0x4(%eax),%eax
 795:	2b 45 ec             	sub    -0x14(%ebp),%eax
 798:	89 c2                	mov    %eax,%edx
 79a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 79d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a3:	8b 40 04             	mov    0x4(%eax),%eax
 7a6:	c1 e0 03             	shl    $0x3,%eax
 7a9:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 7ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7af:	8b 55 ec             	mov    -0x14(%ebp),%edx
 7b2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b8:	a3 70 0f 00 00       	mov    %eax,0xf70
      return (void*)(p + 1);
 7bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c0:	83 c0 08             	add    $0x8,%eax
 7c3:	eb 38                	jmp    7fd <malloc+0xde>
    }
    if(p == freep)
 7c5:	a1 70 0f 00 00       	mov    0xf70,%eax
 7ca:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 7cd:	75 1b                	jne    7ea <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d2:	89 04 24             	mov    %eax,(%esp)
 7d5:	e8 ed fe ff ff       	call   6c7 <morecore>
 7da:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7e1:	75 07                	jne    7ea <malloc+0xcb>
        return 0;
 7e3:	b8 00 00 00 00       	mov    $0x0,%eax
 7e8:	eb 13                	jmp    7fd <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f3:	8b 00                	mov    (%eax),%eax
 7f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 7f8:	e9 70 ff ff ff       	jmp    76d <malloc+0x4e>
}
 7fd:	c9                   	leave  
 7fe:	c3                   	ret    

000007ff <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 7ff:	55                   	push   %ebp
 800:	89 e5                	mov    %esp,%ebp
 802:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 805:	8b 55 08             	mov    0x8(%ebp),%edx
 808:	8b 45 0c             	mov    0xc(%ebp),%eax
 80b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80e:	f0 87 02             	lock xchg %eax,(%edx)
 811:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 814:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 817:	c9                   	leave  
 818:	c3                   	ret    

00000819 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 819:	55                   	push   %ebp
 81a:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 81c:	8b 45 08             	mov    0x8(%ebp),%eax
 81f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 825:	5d                   	pop    %ebp
 826:	c3                   	ret    

00000827 <lock_acquire>:
void lock_acquire(lock_t *lock){
 827:	55                   	push   %ebp
 828:	89 e5                	mov    %esp,%ebp
 82a:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 82d:	90                   	nop
 82e:	8b 45 08             	mov    0x8(%ebp),%eax
 831:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 838:	00 
 839:	89 04 24             	mov    %eax,(%esp)
 83c:	e8 be ff ff ff       	call   7ff <xchg>
 841:	85 c0                	test   %eax,%eax
 843:	75 e9                	jne    82e <lock_acquire+0x7>
}
 845:	c9                   	leave  
 846:	c3                   	ret    

00000847 <lock_release>:
void lock_release(lock_t *lock){
 847:	55                   	push   %ebp
 848:	89 e5                	mov    %esp,%ebp
 84a:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 84d:	8b 45 08             	mov    0x8(%ebp),%eax
 850:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 857:	00 
 858:	89 04 24             	mov    %eax,(%esp)
 85b:	e8 9f ff ff ff       	call   7ff <xchg>
}
 860:	c9                   	leave  
 861:	c3                   	ret    

00000862 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 862:	55                   	push   %ebp
 863:	89 e5                	mov    %esp,%ebp
 865:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 868:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 86f:	e8 ab fe ff ff       	call   71f <malloc>
 874:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 877:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87a:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 87d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 880:	25 ff 0f 00 00       	and    $0xfff,%eax
 885:	85 c0                	test   %eax,%eax
 887:	74 14                	je     89d <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 889:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88c:	25 ff 0f 00 00       	and    $0xfff,%eax
 891:	89 c2                	mov    %eax,%edx
 893:	b8 00 10 00 00       	mov    $0x1000,%eax
 898:	29 d0                	sub    %edx,%eax
 89a:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 89d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8a1:	75 1b                	jne    8be <thread_create+0x5c>

        printf(1,"malloc fail \n");
 8a3:	c7 44 24 04 61 0b 00 	movl   $0xb61,0x4(%esp)
 8aa:	00 
 8ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8b2:	e8 7c fb ff ff       	call   433 <printf>
        return 0;
 8b7:	b8 00 00 00 00       	mov    $0x0,%eax
 8bc:	eb 6f                	jmp    92d <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 8be:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8c1:	8b 55 08             	mov    0x8(%ebp),%edx
 8c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c7:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8cb:	89 54 24 08          	mov    %edx,0x8(%esp)
 8cf:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 8d6:	00 
 8d7:	89 04 24             	mov    %eax,(%esp)
 8da:	e8 4c fa ff ff       	call   32b <clone>
 8df:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 8e2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8e6:	79 1b                	jns    903 <thread_create+0xa1>
        printf(1,"clone fails\n");
 8e8:	c7 44 24 04 6f 0b 00 	movl   $0xb6f,0x4(%esp)
 8ef:	00 
 8f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8f7:	e8 37 fb ff ff       	call   433 <printf>
        return 0;
 8fc:	b8 00 00 00 00       	mov    $0x0,%eax
 901:	eb 2a                	jmp    92d <thread_create+0xcb>
    }
    if(tid > 0){
 903:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 907:	7e 05                	jle    90e <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 909:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90c:	eb 1f                	jmp    92d <thread_create+0xcb>
    }
    if(tid == 0){
 90e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 912:	75 14                	jne    928 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 914:	c7 44 24 04 7c 0b 00 	movl   $0xb7c,0x4(%esp)
 91b:	00 
 91c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 923:	e8 0b fb ff ff       	call   433 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 928:	b8 00 00 00 00       	mov    $0x0,%eax
}
 92d:	c9                   	leave  
 92e:	c3                   	ret    

0000092f <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 92f:	55                   	push   %ebp
 930:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 932:	8b 45 08             	mov    0x8(%ebp),%eax
 935:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 93b:	8b 45 08             	mov    0x8(%ebp),%eax
 93e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 945:	8b 45 08             	mov    0x8(%ebp),%eax
 948:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 94f:	5d                   	pop    %ebp
 950:	c3                   	ret    

00000951 <add_q>:

void add_q(struct queue *q, int v){
 951:	55                   	push   %ebp
 952:	89 e5                	mov    %esp,%ebp
 954:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 957:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 95e:	e8 bc fd ff ff       	call   71f <malloc>
 963:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 966:	8b 45 f4             	mov    -0xc(%ebp),%eax
 969:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 970:	8b 45 f4             	mov    -0xc(%ebp),%eax
 973:	8b 55 0c             	mov    0xc(%ebp),%edx
 976:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 978:	8b 45 08             	mov    0x8(%ebp),%eax
 97b:	8b 40 04             	mov    0x4(%eax),%eax
 97e:	85 c0                	test   %eax,%eax
 980:	75 0b                	jne    98d <add_q+0x3c>
        q->head = n;
 982:	8b 45 08             	mov    0x8(%ebp),%eax
 985:	8b 55 f4             	mov    -0xc(%ebp),%edx
 988:	89 50 04             	mov    %edx,0x4(%eax)
 98b:	eb 0c                	jmp    999 <add_q+0x48>
    }else{
        q->tail->next = n;
 98d:	8b 45 08             	mov    0x8(%ebp),%eax
 990:	8b 40 08             	mov    0x8(%eax),%eax
 993:	8b 55 f4             	mov    -0xc(%ebp),%edx
 996:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 999:	8b 45 08             	mov    0x8(%ebp),%eax
 99c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 99f:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 9a2:	8b 45 08             	mov    0x8(%ebp),%eax
 9a5:	8b 00                	mov    (%eax),%eax
 9a7:	8d 50 01             	lea    0x1(%eax),%edx
 9aa:	8b 45 08             	mov    0x8(%ebp),%eax
 9ad:	89 10                	mov    %edx,(%eax)
}
 9af:	c9                   	leave  
 9b0:	c3                   	ret    

000009b1 <empty_q>:

int empty_q(struct queue *q){
 9b1:	55                   	push   %ebp
 9b2:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 9b4:	8b 45 08             	mov    0x8(%ebp),%eax
 9b7:	8b 00                	mov    (%eax),%eax
 9b9:	85 c0                	test   %eax,%eax
 9bb:	75 07                	jne    9c4 <empty_q+0x13>
        return 1;
 9bd:	b8 01 00 00 00       	mov    $0x1,%eax
 9c2:	eb 05                	jmp    9c9 <empty_q+0x18>
    else
        return 0;
 9c4:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 9c9:	5d                   	pop    %ebp
 9ca:	c3                   	ret    

000009cb <pop_q>:
int pop_q(struct queue *q){
 9cb:	55                   	push   %ebp
 9cc:	89 e5                	mov    %esp,%ebp
 9ce:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 9d1:	8b 45 08             	mov    0x8(%ebp),%eax
 9d4:	89 04 24             	mov    %eax,(%esp)
 9d7:	e8 d5 ff ff ff       	call   9b1 <empty_q>
 9dc:	85 c0                	test   %eax,%eax
 9de:	75 5d                	jne    a3d <pop_q+0x72>
       val = q->head->value; 
 9e0:	8b 45 08             	mov    0x8(%ebp),%eax
 9e3:	8b 40 04             	mov    0x4(%eax),%eax
 9e6:	8b 00                	mov    (%eax),%eax
 9e8:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 9eb:	8b 45 08             	mov    0x8(%ebp),%eax
 9ee:	8b 40 04             	mov    0x4(%eax),%eax
 9f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 9f4:	8b 45 08             	mov    0x8(%ebp),%eax
 9f7:	8b 40 04             	mov    0x4(%eax),%eax
 9fa:	8b 50 04             	mov    0x4(%eax),%edx
 9fd:	8b 45 08             	mov    0x8(%ebp),%eax
 a00:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a03:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a06:	89 04 24             	mov    %eax,(%esp)
 a09:	e8 d8 fb ff ff       	call   5e6 <free>
       q->size--;
 a0e:	8b 45 08             	mov    0x8(%ebp),%eax
 a11:	8b 00                	mov    (%eax),%eax
 a13:	8d 50 ff             	lea    -0x1(%eax),%edx
 a16:	8b 45 08             	mov    0x8(%ebp),%eax
 a19:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a1b:	8b 45 08             	mov    0x8(%ebp),%eax
 a1e:	8b 00                	mov    (%eax),%eax
 a20:	85 c0                	test   %eax,%eax
 a22:	75 14                	jne    a38 <pop_q+0x6d>
            q->head = 0;
 a24:	8b 45 08             	mov    0x8(%ebp),%eax
 a27:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a2e:	8b 45 08             	mov    0x8(%ebp),%eax
 a31:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a38:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3b:	eb 05                	jmp    a42 <pop_q+0x77>
    }
    return -1;
 a3d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a42:	c9                   	leave  
 a43:	c3                   	ret    

00000a44 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 a44:	55                   	push   %ebp
 a45:	89 e5                	mov    %esp,%ebp
 a47:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 a4a:	8b 45 08             	mov    0x8(%ebp),%eax
 a4d:	8b 55 0c             	mov    0xc(%ebp),%edx
 a50:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 a53:	8b 45 08             	mov    0x8(%ebp),%eax
 a56:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 a5d:	8b 45 08             	mov    0x8(%ebp),%eax
 a60:	89 04 24             	mov    %eax,(%esp)
 a63:	e8 b1 fd ff ff       	call   819 <lock_init>
}
 a68:	c9                   	leave  
 a69:	c3                   	ret    

00000a6a <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 a6a:	55                   	push   %ebp
 a6b:	89 e5                	mov    %esp,%ebp
 a6d:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 a70:	8b 45 08             	mov    0x8(%ebp),%eax
 a73:	89 04 24             	mov    %eax,(%esp)
 a76:	e8 ac fd ff ff       	call   827 <lock_acquire>
	if(s->count  == 0){
 a7b:	8b 45 08             	mov    0x8(%ebp),%eax
 a7e:	8b 40 04             	mov    0x4(%eax),%eax
 a81:	85 c0                	test   %eax,%eax
 a83:	75 2f                	jne    ab4 <sem_aquire+0x4a>
		//add proc to waiters list
		int tid = getpid();
 a85:	e8 81 f8 ff ff       	call   30b <getpid>
 a8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 a8d:	8b 45 08             	mov    0x8(%ebp),%eax
 a90:	8d 50 0c             	lea    0xc(%eax),%edx
 a93:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a96:	89 44 24 04          	mov    %eax,0x4(%esp)
 a9a:	89 14 24             	mov    %edx,(%esp)
 a9d:	e8 af fe ff ff       	call   951 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 aa2:	8b 45 08             	mov    0x8(%ebp),%eax
 aa5:	89 04 24             	mov    %eax,(%esp)
 aa8:	e8 9a fd ff ff       	call   847 <lock_release>
		tsleep(); 
 aad:	e8 89 f8 ff ff       	call   33b <tsleep>
 ab2:	eb 1a                	jmp    ace <sem_aquire+0x64>
	}
	else{
		s->count--;	
 ab4:	8b 45 08             	mov    0x8(%ebp),%eax
 ab7:	8b 40 04             	mov    0x4(%eax),%eax
 aba:	8d 50 ff             	lea    -0x1(%eax),%edx
 abd:	8b 45 08             	mov    0x8(%ebp),%eax
 ac0:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 ac3:	8b 45 08             	mov    0x8(%ebp),%eax
 ac6:	89 04 24             	mov    %eax,(%esp)
 ac9:	e8 79 fd ff ff       	call   847 <lock_release>
	}
}
 ace:	c9                   	leave  
 acf:	c3                   	ret    

00000ad0 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 ad0:	55                   	push   %ebp
 ad1:	89 e5                	mov    %esp,%ebp
 ad3:	83 ec 28             	sub    $0x28,%esp
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 ad6:	8b 45 08             	mov    0x8(%ebp),%eax
 ad9:	89 04 24             	mov    %eax,(%esp)
 adc:	e8 46 fd ff ff       	call   827 <lock_acquire>
	if(s->count < s->size){
 ae1:	8b 45 08             	mov    0x8(%ebp),%eax
 ae4:	8b 50 04             	mov    0x4(%eax),%edx
 ae7:	8b 45 08             	mov    0x8(%ebp),%eax
 aea:	8b 40 08             	mov    0x8(%eax),%eax
 aed:	39 c2                	cmp    %eax,%edx
 aef:	7d 40                	jge    b31 <sem_signal+0x61>
		int tid;
		tid = pop_q(&s->waiters);
 af1:	8b 45 08             	mov    0x8(%ebp),%eax
 af4:	83 c0 0c             	add    $0xc,%eax
 af7:	89 04 24             	mov    %eax,(%esp)
 afa:	e8 cc fe ff ff       	call   9cb <pop_q>
 aff:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if(tid != -1) twakeup(tid);
 b02:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b06:	74 0d                	je     b15 <sem_signal+0x45>
 b08:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b0b:	89 04 24             	mov    %eax,(%esp)
 b0e:	e8 30 f8 ff ff       	call   343 <twakeup>
 b13:	eb 0f                	jmp    b24 <sem_signal+0x54>
		else s->count++;	
 b15:	8b 45 08             	mov    0x8(%ebp),%eax
 b18:	8b 40 04             	mov    0x4(%eax),%eax
 b1b:	8d 50 01             	lea    0x1(%eax),%edx
 b1e:	8b 45 08             	mov    0x8(%ebp),%eax
 b21:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b24:	8b 45 08             	mov    0x8(%ebp),%eax
 b27:	89 04 24             	mov    %eax,(%esp)
 b2a:	e8 18 fd ff ff       	call   847 <lock_release>
 b2f:	eb 27                	jmp    b58 <sem_signal+0x88>
	}
	else{
		int tid;
		tid = pop_q(&s->waiters);
 b31:	8b 45 08             	mov    0x8(%ebp),%eax
 b34:	83 c0 0c             	add    $0xc,%eax
 b37:	89 04 24             	mov    %eax,(%esp)
 b3a:	e8 8c fe ff ff       	call   9cb <pop_q>
 b3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
		twakeup(tid);
 b42:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b45:	89 04 24             	mov    %eax,(%esp)
 b48:	e8 f6 f7 ff ff       	call   343 <twakeup>
		lock_release(&s->lock);
 b4d:	8b 45 08             	mov    0x8(%ebp),%eax
 b50:	89 04 24             	mov    %eax,(%esp)
 b53:	e8 ef fc ff ff       	call   847 <lock_release>
	}

 b58:	c9                   	leave  
 b59:	c3                   	ret    
