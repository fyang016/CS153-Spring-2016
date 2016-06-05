
_null:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
	int *p = 0;
   9:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  10:	00 
	printf(1, "hello[%x]\n", *p); // uh oh?
  11:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  15:	8b 00                	mov    (%eax),%eax
  17:	89 44 24 08          	mov    %eax,0x8(%esp)
  1b:	c7 44 24 04 92 0b 00 	movl   $0xb92,0x4(%esp)
  22:	00 
  23:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  2a:	e8 0a 04 00 00       	call   439 <printf>
	exit();
  2f:	e8 64 02 00 00       	call   298 <exit>

00000034 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  34:	55                   	push   %ebp
  35:	89 e5                	mov    %esp,%ebp
  37:	57                   	push   %edi
  38:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  39:	8b 4d 08             	mov    0x8(%ebp),%ecx
  3c:	8b 55 10             	mov    0x10(%ebp),%edx
  3f:	8b 45 0c             	mov    0xc(%ebp),%eax
  42:	89 cb                	mov    %ecx,%ebx
  44:	89 df                	mov    %ebx,%edi
  46:	89 d1                	mov    %edx,%ecx
  48:	fc                   	cld    
  49:	f3 aa                	rep stos %al,%es:(%edi)
  4b:	89 ca                	mov    %ecx,%edx
  4d:	89 fb                	mov    %edi,%ebx
  4f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  52:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  55:	5b                   	pop    %ebx
  56:	5f                   	pop    %edi
  57:	5d                   	pop    %ebp
  58:	c3                   	ret    

00000059 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  59:	55                   	push   %ebp
  5a:	89 e5                	mov    %esp,%ebp
  5c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  5f:	8b 45 08             	mov    0x8(%ebp),%eax
  62:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  65:	8b 45 0c             	mov    0xc(%ebp),%eax
  68:	0f b6 10             	movzbl (%eax),%edx
  6b:	8b 45 08             	mov    0x8(%ebp),%eax
  6e:	88 10                	mov    %dl,(%eax)
  70:	8b 45 08             	mov    0x8(%ebp),%eax
  73:	0f b6 00             	movzbl (%eax),%eax
  76:	84 c0                	test   %al,%al
  78:	0f 95 c0             	setne  %al
  7b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  7f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  83:	84 c0                	test   %al,%al
  85:	75 de                	jne    65 <strcpy+0xc>
    ;
  return os;
  87:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  8a:	c9                   	leave  
  8b:	c3                   	ret    

0000008c <strcmp>:

int
strcmp(const char *p, const char *q)
{
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  8f:	eb 08                	jmp    99 <strcmp+0xd>
    p++, q++;
  91:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  95:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  99:	8b 45 08             	mov    0x8(%ebp),%eax
  9c:	0f b6 00             	movzbl (%eax),%eax
  9f:	84 c0                	test   %al,%al
  a1:	74 10                	je     b3 <strcmp+0x27>
  a3:	8b 45 08             	mov    0x8(%ebp),%eax
  a6:	0f b6 10             	movzbl (%eax),%edx
  a9:	8b 45 0c             	mov    0xc(%ebp),%eax
  ac:	0f b6 00             	movzbl (%eax),%eax
  af:	38 c2                	cmp    %al,%dl
  b1:	74 de                	je     91 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  b3:	8b 45 08             	mov    0x8(%ebp),%eax
  b6:	0f b6 00             	movzbl (%eax),%eax
  b9:	0f b6 d0             	movzbl %al,%edx
  bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  bf:	0f b6 00             	movzbl (%eax),%eax
  c2:	0f b6 c0             	movzbl %al,%eax
  c5:	89 d1                	mov    %edx,%ecx
  c7:	29 c1                	sub    %eax,%ecx
  c9:	89 c8                	mov    %ecx,%eax
}
  cb:	5d                   	pop    %ebp
  cc:	c3                   	ret    

000000cd <strlen>:

uint
strlen(char *s)
{
  cd:	55                   	push   %ebp
  ce:	89 e5                	mov    %esp,%ebp
  d0:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
  d3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  da:	eb 04                	jmp    e0 <strlen+0x13>
  dc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
  e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
  e3:	03 45 08             	add    0x8(%ebp),%eax
  e6:	0f b6 00             	movzbl (%eax),%eax
  e9:	84 c0                	test   %al,%al
  eb:	75 ef                	jne    dc <strlen+0xf>
    ;
  return n;
  ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  f0:	c9                   	leave  
  f1:	c3                   	ret    

000000f2 <memset>:

void*
memset(void *dst, int c, uint n)
{
  f2:	55                   	push   %ebp
  f3:	89 e5                	mov    %esp,%ebp
  f5:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
  f8:	8b 45 10             	mov    0x10(%ebp),%eax
  fb:	89 44 24 08          	mov    %eax,0x8(%esp)
  ff:	8b 45 0c             	mov    0xc(%ebp),%eax
 102:	89 44 24 04          	mov    %eax,0x4(%esp)
 106:	8b 45 08             	mov    0x8(%ebp),%eax
 109:	89 04 24             	mov    %eax,(%esp)
 10c:	e8 23 ff ff ff       	call   34 <stosb>
  return dst;
 111:	8b 45 08             	mov    0x8(%ebp),%eax
}
 114:	c9                   	leave  
 115:	c3                   	ret    

00000116 <strchr>:

char*
strchr(const char *s, char c)
{
 116:	55                   	push   %ebp
 117:	89 e5                	mov    %esp,%ebp
 119:	83 ec 04             	sub    $0x4,%esp
 11c:	8b 45 0c             	mov    0xc(%ebp),%eax
 11f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 122:	eb 14                	jmp    138 <strchr+0x22>
    if(*s == c)
 124:	8b 45 08             	mov    0x8(%ebp),%eax
 127:	0f b6 00             	movzbl (%eax),%eax
 12a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 12d:	75 05                	jne    134 <strchr+0x1e>
      return (char*)s;
 12f:	8b 45 08             	mov    0x8(%ebp),%eax
 132:	eb 13                	jmp    147 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 134:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 138:	8b 45 08             	mov    0x8(%ebp),%eax
 13b:	0f b6 00             	movzbl (%eax),%eax
 13e:	84 c0                	test   %al,%al
 140:	75 e2                	jne    124 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 142:	b8 00 00 00 00       	mov    $0x0,%eax
}
 147:	c9                   	leave  
 148:	c3                   	ret    

00000149 <gets>:

char*
gets(char *buf, int max)
{
 149:	55                   	push   %ebp
 14a:	89 e5                	mov    %esp,%ebp
 14c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 14f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 156:	eb 44                	jmp    19c <gets+0x53>
    cc = read(0, &c, 1);
 158:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 15f:	00 
 160:	8d 45 ef             	lea    -0x11(%ebp),%eax
 163:	89 44 24 04          	mov    %eax,0x4(%esp)
 167:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 16e:	e8 3d 01 00 00       	call   2b0 <read>
 173:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 176:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 17a:	7e 2d                	jle    1a9 <gets+0x60>
      break;
    buf[i++] = c;
 17c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 17f:	03 45 08             	add    0x8(%ebp),%eax
 182:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 186:	88 10                	mov    %dl,(%eax)
 188:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 18c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 190:	3c 0a                	cmp    $0xa,%al
 192:	74 16                	je     1aa <gets+0x61>
 194:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 198:	3c 0d                	cmp    $0xd,%al
 19a:	74 0e                	je     1aa <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 19f:	83 c0 01             	add    $0x1,%eax
 1a2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1a5:	7c b1                	jl     158 <gets+0xf>
 1a7:	eb 01                	jmp    1aa <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1a9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1ad:	03 45 08             	add    0x8(%ebp),%eax
 1b0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 1b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1b6:	c9                   	leave  
 1b7:	c3                   	ret    

000001b8 <stat>:

int
stat(char *n, struct stat *st)
{
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 1be:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1c5:	00 
 1c6:	8b 45 08             	mov    0x8(%ebp),%eax
 1c9:	89 04 24             	mov    %eax,(%esp)
 1cc:	e8 07 01 00 00       	call   2d8 <open>
 1d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 1d4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1d8:	79 07                	jns    1e1 <stat+0x29>
    return -1;
 1da:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 1df:	eb 23                	jmp    204 <stat+0x4c>
  r = fstat(fd, st);
 1e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1eb:	89 04 24             	mov    %eax,(%esp)
 1ee:	e8 fd 00 00 00       	call   2f0 <fstat>
 1f3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 1f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1f9:	89 04 24             	mov    %eax,(%esp)
 1fc:	e8 bf 00 00 00       	call   2c0 <close>
  return r;
 201:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 204:	c9                   	leave  
 205:	c3                   	ret    

00000206 <atoi>:

int
atoi(const char *s)
{
 206:	55                   	push   %ebp
 207:	89 e5                	mov    %esp,%ebp
 209:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 20c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 213:	eb 24                	jmp    239 <atoi+0x33>
    n = n*10 + *s++ - '0';
 215:	8b 55 fc             	mov    -0x4(%ebp),%edx
 218:	89 d0                	mov    %edx,%eax
 21a:	c1 e0 02             	shl    $0x2,%eax
 21d:	01 d0                	add    %edx,%eax
 21f:	01 c0                	add    %eax,%eax
 221:	89 c2                	mov    %eax,%edx
 223:	8b 45 08             	mov    0x8(%ebp),%eax
 226:	0f b6 00             	movzbl (%eax),%eax
 229:	0f be c0             	movsbl %al,%eax
 22c:	8d 04 02             	lea    (%edx,%eax,1),%eax
 22f:	83 e8 30             	sub    $0x30,%eax
 232:	89 45 fc             	mov    %eax,-0x4(%ebp)
 235:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 239:	8b 45 08             	mov    0x8(%ebp),%eax
 23c:	0f b6 00             	movzbl (%eax),%eax
 23f:	3c 2f                	cmp    $0x2f,%al
 241:	7e 0a                	jle    24d <atoi+0x47>
 243:	8b 45 08             	mov    0x8(%ebp),%eax
 246:	0f b6 00             	movzbl (%eax),%eax
 249:	3c 39                	cmp    $0x39,%al
 24b:	7e c8                	jle    215 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 24d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 250:	c9                   	leave  
 251:	c3                   	ret    

00000252 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 252:	55                   	push   %ebp
 253:	89 e5                	mov    %esp,%ebp
 255:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 258:	8b 45 08             	mov    0x8(%ebp),%eax
 25b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 264:	eb 13                	jmp    279 <memmove+0x27>
    *dst++ = *src++;
 266:	8b 45 fc             	mov    -0x4(%ebp),%eax
 269:	0f b6 10             	movzbl (%eax),%edx
 26c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 26f:	88 10                	mov    %dl,(%eax)
 271:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 275:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 279:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 27d:	0f 9f c0             	setg   %al
 280:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 284:	84 c0                	test   %al,%al
 286:	75 de                	jne    266 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 288:	8b 45 08             	mov    0x8(%ebp),%eax
}
 28b:	c9                   	leave  
 28c:	c3                   	ret    
 28d:	90                   	nop
 28e:	90                   	nop
 28f:	90                   	nop

00000290 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 290:	b8 01 00 00 00       	mov    $0x1,%eax
 295:	cd 40                	int    $0x40
 297:	c3                   	ret    

00000298 <exit>:
SYSCALL(exit)
 298:	b8 02 00 00 00       	mov    $0x2,%eax
 29d:	cd 40                	int    $0x40
 29f:	c3                   	ret    

000002a0 <wait>:
SYSCALL(wait)
 2a0:	b8 03 00 00 00       	mov    $0x3,%eax
 2a5:	cd 40                	int    $0x40
 2a7:	c3                   	ret    

000002a8 <pipe>:
SYSCALL(pipe)
 2a8:	b8 04 00 00 00       	mov    $0x4,%eax
 2ad:	cd 40                	int    $0x40
 2af:	c3                   	ret    

000002b0 <read>:
SYSCALL(read)
 2b0:	b8 05 00 00 00       	mov    $0x5,%eax
 2b5:	cd 40                	int    $0x40
 2b7:	c3                   	ret    

000002b8 <write>:
SYSCALL(write)
 2b8:	b8 10 00 00 00       	mov    $0x10,%eax
 2bd:	cd 40                	int    $0x40
 2bf:	c3                   	ret    

000002c0 <close>:
SYSCALL(close)
 2c0:	b8 15 00 00 00       	mov    $0x15,%eax
 2c5:	cd 40                	int    $0x40
 2c7:	c3                   	ret    

000002c8 <kill>:
SYSCALL(kill)
 2c8:	b8 06 00 00 00       	mov    $0x6,%eax
 2cd:	cd 40                	int    $0x40
 2cf:	c3                   	ret    

000002d0 <exec>:
SYSCALL(exec)
 2d0:	b8 07 00 00 00       	mov    $0x7,%eax
 2d5:	cd 40                	int    $0x40
 2d7:	c3                   	ret    

000002d8 <open>:
SYSCALL(open)
 2d8:	b8 0f 00 00 00       	mov    $0xf,%eax
 2dd:	cd 40                	int    $0x40
 2df:	c3                   	ret    

000002e0 <mknod>:
SYSCALL(mknod)
 2e0:	b8 11 00 00 00       	mov    $0x11,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <unlink>:
SYSCALL(unlink)
 2e8:	b8 12 00 00 00       	mov    $0x12,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <fstat>:
SYSCALL(fstat)
 2f0:	b8 08 00 00 00       	mov    $0x8,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <link>:
SYSCALL(link)
 2f8:	b8 13 00 00 00       	mov    $0x13,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <mkdir>:
SYSCALL(mkdir)
 300:	b8 14 00 00 00       	mov    $0x14,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <chdir>:
SYSCALL(chdir)
 308:	b8 09 00 00 00       	mov    $0x9,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <dup>:
SYSCALL(dup)
 310:	b8 0a 00 00 00       	mov    $0xa,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <getpid>:
SYSCALL(getpid)
 318:	b8 0b 00 00 00       	mov    $0xb,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <sbrk>:
SYSCALL(sbrk)
 320:	b8 0c 00 00 00       	mov    $0xc,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <sleep>:
SYSCALL(sleep)
 328:	b8 0d 00 00 00       	mov    $0xd,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <uptime>:
SYSCALL(uptime)
 330:	b8 0e 00 00 00       	mov    $0xe,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <clone>:
SYSCALL(clone)
 338:	b8 16 00 00 00       	mov    $0x16,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <texit>:
SYSCALL(texit)
 340:	b8 17 00 00 00       	mov    $0x17,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <tsleep>:
SYSCALL(tsleep)
 348:	b8 18 00 00 00       	mov    $0x18,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <twakeup>:
SYSCALL(twakeup)
 350:	b8 19 00 00 00       	mov    $0x19,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <test>:
SYSCALL(test)
 358:	b8 1a 00 00 00       	mov    $0x1a,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 360:	55                   	push   %ebp
 361:	89 e5                	mov    %esp,%ebp
 363:	83 ec 28             	sub    $0x28,%esp
 366:	8b 45 0c             	mov    0xc(%ebp),%eax
 369:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 36c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 373:	00 
 374:	8d 45 f4             	lea    -0xc(%ebp),%eax
 377:	89 44 24 04          	mov    %eax,0x4(%esp)
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	89 04 24             	mov    %eax,(%esp)
 381:	e8 32 ff ff ff       	call   2b8 <write>
}
 386:	c9                   	leave  
 387:	c3                   	ret    

00000388 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 388:	55                   	push   %ebp
 389:	89 e5                	mov    %esp,%ebp
 38b:	53                   	push   %ebx
 38c:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 38f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 396:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 39a:	74 17                	je     3b3 <printint+0x2b>
 39c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3a0:	79 11                	jns    3b3 <printint+0x2b>
    neg = 1;
 3a2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ac:	f7 d8                	neg    %eax
 3ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3b1:	eb 06                	jmp    3b9 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3b9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3c0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3c3:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3c9:	ba 00 00 00 00       	mov    $0x0,%edx
 3ce:	f7 f3                	div    %ebx
 3d0:	89 d0                	mov    %edx,%eax
 3d2:	0f b6 80 e8 0b 00 00 	movzbl 0xbe8(%eax),%eax
 3d9:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 3dd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 3e1:	8b 45 10             	mov    0x10(%ebp),%eax
 3e4:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 3e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3ea:	ba 00 00 00 00       	mov    $0x0,%edx
 3ef:	f7 75 d4             	divl   -0x2c(%ebp)
 3f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 3f5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3f9:	75 c5                	jne    3c0 <printint+0x38>
  if(neg)
 3fb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3ff:	74 28                	je     429 <printint+0xa1>
    buf[i++] = '-';
 401:	8b 45 ec             	mov    -0x14(%ebp),%eax
 404:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 409:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 40d:	eb 1a                	jmp    429 <printint+0xa1>
    putc(fd, buf[i]);
 40f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 412:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 417:	0f be c0             	movsbl %al,%eax
 41a:	89 44 24 04          	mov    %eax,0x4(%esp)
 41e:	8b 45 08             	mov    0x8(%ebp),%eax
 421:	89 04 24             	mov    %eax,(%esp)
 424:	e8 37 ff ff ff       	call   360 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 429:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 42d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 431:	79 dc                	jns    40f <printint+0x87>
    putc(fd, buf[i]);
}
 433:	83 c4 44             	add    $0x44,%esp
 436:	5b                   	pop    %ebx
 437:	5d                   	pop    %ebp
 438:	c3                   	ret    

00000439 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 439:	55                   	push   %ebp
 43a:	89 e5                	mov    %esp,%ebp
 43c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 43f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 446:	8d 45 0c             	lea    0xc(%ebp),%eax
 449:	83 c0 04             	add    $0x4,%eax
 44c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 44f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 456:	e9 7e 01 00 00       	jmp    5d9 <printf+0x1a0>
    c = fmt[i] & 0xff;
 45b:	8b 55 0c             	mov    0xc(%ebp),%edx
 45e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 461:	8d 04 02             	lea    (%edx,%eax,1),%eax
 464:	0f b6 00             	movzbl (%eax),%eax
 467:	0f be c0             	movsbl %al,%eax
 46a:	25 ff 00 00 00       	and    $0xff,%eax
 46f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 472:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 476:	75 2c                	jne    4a4 <printf+0x6b>
      if(c == '%'){
 478:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 47c:	75 0c                	jne    48a <printf+0x51>
        state = '%';
 47e:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 485:	e9 4b 01 00 00       	jmp    5d5 <printf+0x19c>
      } else {
        putc(fd, c);
 48a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 48d:	0f be c0             	movsbl %al,%eax
 490:	89 44 24 04          	mov    %eax,0x4(%esp)
 494:	8b 45 08             	mov    0x8(%ebp),%eax
 497:	89 04 24             	mov    %eax,(%esp)
 49a:	e8 c1 fe ff ff       	call   360 <putc>
 49f:	e9 31 01 00 00       	jmp    5d5 <printf+0x19c>
      }
    } else if(state == '%'){
 4a4:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4a8:	0f 85 27 01 00 00    	jne    5d5 <printf+0x19c>
      if(c == 'd'){
 4ae:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4b2:	75 2d                	jne    4e1 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b7:	8b 00                	mov    (%eax),%eax
 4b9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4c0:	00 
 4c1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4c8:	00 
 4c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4cd:	8b 45 08             	mov    0x8(%ebp),%eax
 4d0:	89 04 24             	mov    %eax,(%esp)
 4d3:	e8 b0 fe ff ff       	call   388 <printint>
        ap++;
 4d8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 4dc:	e9 ed 00 00 00       	jmp    5ce <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 4e1:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 4e5:	74 06                	je     4ed <printf+0xb4>
 4e7:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 4eb:	75 2d                	jne    51a <printf+0xe1>
        printint(fd, *ap, 16, 0);
 4ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f0:	8b 00                	mov    (%eax),%eax
 4f2:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 4f9:	00 
 4fa:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 501:	00 
 502:	89 44 24 04          	mov    %eax,0x4(%esp)
 506:	8b 45 08             	mov    0x8(%ebp),%eax
 509:	89 04 24             	mov    %eax,(%esp)
 50c:	e8 77 fe ff ff       	call   388 <printint>
        ap++;
 511:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 515:	e9 b4 00 00 00       	jmp    5ce <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 51a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 51e:	75 46                	jne    566 <printf+0x12d>
        s = (char*)*ap;
 520:	8b 45 f4             	mov    -0xc(%ebp),%eax
 523:	8b 00                	mov    (%eax),%eax
 525:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 528:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 52c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 530:	75 27                	jne    559 <printf+0x120>
          s = "(null)";
 532:	c7 45 e4 9d 0b 00 00 	movl   $0xb9d,-0x1c(%ebp)
        while(*s != 0){
 539:	eb 1f                	jmp    55a <printf+0x121>
          putc(fd, *s);
 53b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 53e:	0f b6 00             	movzbl (%eax),%eax
 541:	0f be c0             	movsbl %al,%eax
 544:	89 44 24 04          	mov    %eax,0x4(%esp)
 548:	8b 45 08             	mov    0x8(%ebp),%eax
 54b:	89 04 24             	mov    %eax,(%esp)
 54e:	e8 0d fe ff ff       	call   360 <putc>
          s++;
 553:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 557:	eb 01                	jmp    55a <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 559:	90                   	nop
 55a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 55d:	0f b6 00             	movzbl (%eax),%eax
 560:	84 c0                	test   %al,%al
 562:	75 d7                	jne    53b <printf+0x102>
 564:	eb 68                	jmp    5ce <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 566:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 56a:	75 1d                	jne    589 <printf+0x150>
        putc(fd, *ap);
 56c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56f:	8b 00                	mov    (%eax),%eax
 571:	0f be c0             	movsbl %al,%eax
 574:	89 44 24 04          	mov    %eax,0x4(%esp)
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	89 04 24             	mov    %eax,(%esp)
 57e:	e8 dd fd ff ff       	call   360 <putc>
        ap++;
 583:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 587:	eb 45                	jmp    5ce <printf+0x195>
      } else if(c == '%'){
 589:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 58d:	75 17                	jne    5a6 <printf+0x16d>
        putc(fd, c);
 58f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 592:	0f be c0             	movsbl %al,%eax
 595:	89 44 24 04          	mov    %eax,0x4(%esp)
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	89 04 24             	mov    %eax,(%esp)
 59f:	e8 bc fd ff ff       	call   360 <putc>
 5a4:	eb 28                	jmp    5ce <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5a6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5ad:	00 
 5ae:	8b 45 08             	mov    0x8(%ebp),%eax
 5b1:	89 04 24             	mov    %eax,(%esp)
 5b4:	e8 a7 fd ff ff       	call   360 <putc>
        putc(fd, c);
 5b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5bc:	0f be c0             	movsbl %al,%eax
 5bf:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c3:	8b 45 08             	mov    0x8(%ebp),%eax
 5c6:	89 04 24             	mov    %eax,(%esp)
 5c9:	e8 92 fd ff ff       	call   360 <putc>
      }
      state = 0;
 5ce:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 5d5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 5d9:	8b 55 0c             	mov    0xc(%ebp),%edx
 5dc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5df:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5e2:	0f b6 00             	movzbl (%eax),%eax
 5e5:	84 c0                	test   %al,%al
 5e7:	0f 85 6e fe ff ff    	jne    45b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 5ed:	c9                   	leave  
 5ee:	c3                   	ret    
 5ef:	90                   	nop

000005f0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 5f0:	55                   	push   %ebp
 5f1:	89 e5                	mov    %esp,%ebp
 5f3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 5f6:	8b 45 08             	mov    0x8(%ebp),%eax
 5f9:	83 e8 08             	sub    $0x8,%eax
 5fc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 5ff:	a1 04 0c 00 00       	mov    0xc04,%eax
 604:	89 45 fc             	mov    %eax,-0x4(%ebp)
 607:	eb 24                	jmp    62d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 609:	8b 45 fc             	mov    -0x4(%ebp),%eax
 60c:	8b 00                	mov    (%eax),%eax
 60e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 611:	77 12                	ja     625 <free+0x35>
 613:	8b 45 f8             	mov    -0x8(%ebp),%eax
 616:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 619:	77 24                	ja     63f <free+0x4f>
 61b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 61e:	8b 00                	mov    (%eax),%eax
 620:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 623:	77 1a                	ja     63f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 625:	8b 45 fc             	mov    -0x4(%ebp),%eax
 628:	8b 00                	mov    (%eax),%eax
 62a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 62d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 630:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 633:	76 d4                	jbe    609 <free+0x19>
 635:	8b 45 fc             	mov    -0x4(%ebp),%eax
 638:	8b 00                	mov    (%eax),%eax
 63a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 63d:	76 ca                	jbe    609 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 63f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 642:	8b 40 04             	mov    0x4(%eax),%eax
 645:	c1 e0 03             	shl    $0x3,%eax
 648:	89 c2                	mov    %eax,%edx
 64a:	03 55 f8             	add    -0x8(%ebp),%edx
 64d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 650:	8b 00                	mov    (%eax),%eax
 652:	39 c2                	cmp    %eax,%edx
 654:	75 24                	jne    67a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 656:	8b 45 f8             	mov    -0x8(%ebp),%eax
 659:	8b 50 04             	mov    0x4(%eax),%edx
 65c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 65f:	8b 00                	mov    (%eax),%eax
 661:	8b 40 04             	mov    0x4(%eax),%eax
 664:	01 c2                	add    %eax,%edx
 666:	8b 45 f8             	mov    -0x8(%ebp),%eax
 669:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 66c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66f:	8b 00                	mov    (%eax),%eax
 671:	8b 10                	mov    (%eax),%edx
 673:	8b 45 f8             	mov    -0x8(%ebp),%eax
 676:	89 10                	mov    %edx,(%eax)
 678:	eb 0a                	jmp    684 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 67a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67d:	8b 10                	mov    (%eax),%edx
 67f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 682:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 684:	8b 45 fc             	mov    -0x4(%ebp),%eax
 687:	8b 40 04             	mov    0x4(%eax),%eax
 68a:	c1 e0 03             	shl    $0x3,%eax
 68d:	03 45 fc             	add    -0x4(%ebp),%eax
 690:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 693:	75 20                	jne    6b5 <free+0xc5>
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
 6b3:	eb 08                	jmp    6bd <free+0xcd>
  } else
    p->s.ptr = bp;
 6b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6bb:	89 10                	mov    %edx,(%eax)
  freep = p;
 6bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c0:	a3 04 0c 00 00       	mov    %eax,0xc04
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
 6e6:	e8 35 fc ff ff       	call   320 <sbrk>
 6eb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 6ee:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 6f2:	75 07                	jne    6fb <morecore+0x34>
    return 0;
 6f4:	b8 00 00 00 00       	mov    $0x0,%eax
 6f9:	eb 22                	jmp    71d <morecore+0x56>
  hp = (Header*)p;
 6fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 701:	8b 45 f4             	mov    -0xc(%ebp),%eax
 704:	8b 55 08             	mov    0x8(%ebp),%edx
 707:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 70a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70d:	83 c0 08             	add    $0x8,%eax
 710:	89 04 24             	mov    %eax,(%esp)
 713:	e8 d8 fe ff ff       	call   5f0 <free>
  return freep;
 718:	a1 04 0c 00 00       	mov    0xc04,%eax
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
 731:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 734:	a1 04 0c 00 00       	mov    0xc04,%eax
 739:	89 45 f0             	mov    %eax,-0x10(%ebp)
 73c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 740:	75 23                	jne    765 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 742:	c7 45 f0 fc 0b 00 00 	movl   $0xbfc,-0x10(%ebp)
 749:	8b 45 f0             	mov    -0x10(%ebp),%eax
 74c:	a3 04 0c 00 00       	mov    %eax,0xc04
 751:	a1 04 0c 00 00       	mov    0xc04,%eax
 756:	a3 fc 0b 00 00       	mov    %eax,0xbfc
    base.s.size = 0;
 75b:	c7 05 00 0c 00 00 00 	movl   $0x0,0xc00
 762:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 765:	8b 45 f0             	mov    -0x10(%ebp),%eax
 768:	8b 00                	mov    (%eax),%eax
 76a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 76d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 770:	8b 40 04             	mov    0x4(%eax),%eax
 773:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 776:	72 4d                	jb     7c5 <malloc+0xa6>
      if(p->s.size == nunits)
 778:	8b 45 ec             	mov    -0x14(%ebp),%eax
 77b:	8b 40 04             	mov    0x4(%eax),%eax
 77e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 781:	75 0c                	jne    78f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 783:	8b 45 ec             	mov    -0x14(%ebp),%eax
 786:	8b 10                	mov    (%eax),%edx
 788:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78b:	89 10                	mov    %edx,(%eax)
 78d:	eb 26                	jmp    7b5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 78f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 792:	8b 40 04             	mov    0x4(%eax),%eax
 795:	89 c2                	mov    %eax,%edx
 797:	2b 55 f4             	sub    -0xc(%ebp),%edx
 79a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 79d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a3:	8b 40 04             	mov    0x4(%eax),%eax
 7a6:	c1 e0 03             	shl    $0x3,%eax
 7a9:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7af:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7b2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b8:	a3 04 0c 00 00       	mov    %eax,0xc04
      return (void*)(p + 1);
 7bd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c0:	83 c0 08             	add    $0x8,%eax
 7c3:	eb 38                	jmp    7fd <malloc+0xde>
    }
    if(p == freep)
 7c5:	a1 04 0c 00 00       	mov    0xc04,%eax
 7ca:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7cd:	75 1b                	jne    7ea <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d2:	89 04 24             	mov    %eax,(%esp)
 7d5:	e8 ed fe ff ff       	call   6c7 <morecore>
 7da:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7dd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
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
 7ea:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7f0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f3:	8b 00                	mov    (%eax),%eax
 7f5:	89 45 ec             	mov    %eax,-0x14(%ebp)
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
 7ff:	90                   	nop

00000800 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 800:	55                   	push   %ebp
 801:	89 e5                	mov    %esp,%ebp
 803:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 806:	8b 55 08             	mov    0x8(%ebp),%edx
 809:	8b 45 0c             	mov    0xc(%ebp),%eax
 80c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 80f:	f0 87 02             	lock xchg %eax,(%edx)
 812:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 815:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 818:	c9                   	leave  
 819:	c3                   	ret    

0000081a <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 81a:	55                   	push   %ebp
 81b:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 81d:	8b 45 08             	mov    0x8(%ebp),%eax
 820:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 826:	5d                   	pop    %ebp
 827:	c3                   	ret    

00000828 <lock_acquire>:
void lock_acquire(lock_t *lock){
 828:	55                   	push   %ebp
 829:	89 e5                	mov    %esp,%ebp
 82b:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 82e:	8b 45 08             	mov    0x8(%ebp),%eax
 831:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 838:	00 
 839:	89 04 24             	mov    %eax,(%esp)
 83c:	e8 bf ff ff ff       	call   800 <xchg>
 841:	85 c0                	test   %eax,%eax
 843:	75 e9                	jne    82e <lock_acquire+0x6>
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
 85b:	e8 a0 ff ff ff       	call   800 <xchg>
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
 874:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 877:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87a:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 87d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 880:	25 ff 0f 00 00       	and    $0xfff,%eax
 885:	85 c0                	test   %eax,%eax
 887:	74 15                	je     89e <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 889:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88c:	89 c2                	mov    %eax,%edx
 88e:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 894:	b8 00 10 00 00       	mov    $0x1000,%eax
 899:	29 d0                	sub    %edx,%eax
 89b:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 89e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8a2:	75 1b                	jne    8bf <thread_create+0x5d>

        printf(1,"malloc fail \n");
 8a4:	c7 44 24 04 a4 0b 00 	movl   $0xba4,0x4(%esp)
 8ab:	00 
 8ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8b3:	e8 81 fb ff ff       	call   439 <printf>
        return 0;
 8b8:	b8 00 00 00 00       	mov    $0x0,%eax
 8bd:	eb 6f                	jmp    92e <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 8bf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 8c2:	8b 55 08             	mov    0x8(%ebp),%edx
 8c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 8cc:	89 54 24 08          	mov    %edx,0x8(%esp)
 8d0:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 8d7:	00 
 8d8:	89 04 24             	mov    %eax,(%esp)
 8db:	e8 58 fa ff ff       	call   338 <clone>
 8e0:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 8e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8e7:	79 1b                	jns    904 <thread_create+0xa2>
        printf(1,"clone fails\n");
 8e9:	c7 44 24 04 b2 0b 00 	movl   $0xbb2,0x4(%esp)
 8f0:	00 
 8f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8f8:	e8 3c fb ff ff       	call   439 <printf>
        return 0;
 8fd:	b8 00 00 00 00       	mov    $0x0,%eax
 902:	eb 2a                	jmp    92e <thread_create+0xcc>
    }
    if(tid > 0){
 904:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 908:	7e 05                	jle    90f <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 90a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90d:	eb 1f                	jmp    92e <thread_create+0xcc>
    }
    if(tid == 0){
 90f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 913:	75 14                	jne    929 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 915:	c7 44 24 04 bf 0b 00 	movl   $0xbbf,0x4(%esp)
 91c:	00 
 91d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 924:	e8 10 fb ff ff       	call   439 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 929:	b8 00 00 00 00       	mov    $0x0,%eax
}
 92e:	c9                   	leave  
 92f:	c3                   	ret    

00000930 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 933:	8b 45 08             	mov    0x8(%ebp),%eax
 936:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 93c:	8b 45 08             	mov    0x8(%ebp),%eax
 93f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 946:	8b 45 08             	mov    0x8(%ebp),%eax
 949:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 950:	5d                   	pop    %ebp
 951:	c3                   	ret    

00000952 <add_q>:

void add_q(struct queue *q, int v){
 952:	55                   	push   %ebp
 953:	89 e5                	mov    %esp,%ebp
 955:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 958:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 95f:	e8 bb fd ff ff       	call   71f <malloc>
 964:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 967:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 971:	8b 45 f4             	mov    -0xc(%ebp),%eax
 974:	8b 55 0c             	mov    0xc(%ebp),%edx
 977:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 979:	8b 45 08             	mov    0x8(%ebp),%eax
 97c:	8b 40 04             	mov    0x4(%eax),%eax
 97f:	85 c0                	test   %eax,%eax
 981:	75 0b                	jne    98e <add_q+0x3c>
        q->head = n;
 983:	8b 45 08             	mov    0x8(%ebp),%eax
 986:	8b 55 f4             	mov    -0xc(%ebp),%edx
 989:	89 50 04             	mov    %edx,0x4(%eax)
 98c:	eb 0c                	jmp    99a <add_q+0x48>
    }else{
        q->tail->next = n;
 98e:	8b 45 08             	mov    0x8(%ebp),%eax
 991:	8b 40 08             	mov    0x8(%eax),%eax
 994:	8b 55 f4             	mov    -0xc(%ebp),%edx
 997:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 99a:	8b 45 08             	mov    0x8(%ebp),%eax
 99d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9a0:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 9a3:	8b 45 08             	mov    0x8(%ebp),%eax
 9a6:	8b 00                	mov    (%eax),%eax
 9a8:	8d 50 01             	lea    0x1(%eax),%edx
 9ab:	8b 45 08             	mov    0x8(%ebp),%eax
 9ae:	89 10                	mov    %edx,(%eax)
}
 9b0:	c9                   	leave  
 9b1:	c3                   	ret    

000009b2 <empty_q>:

int empty_q(struct queue *q){
 9b2:	55                   	push   %ebp
 9b3:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 9b5:	8b 45 08             	mov    0x8(%ebp),%eax
 9b8:	8b 00                	mov    (%eax),%eax
 9ba:	85 c0                	test   %eax,%eax
 9bc:	75 07                	jne    9c5 <empty_q+0x13>
        return 1;
 9be:	b8 01 00 00 00       	mov    $0x1,%eax
 9c3:	eb 05                	jmp    9ca <empty_q+0x18>
    else
        return 0;
 9c5:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 9ca:	5d                   	pop    %ebp
 9cb:	c3                   	ret    

000009cc <pop_q>:
int pop_q(struct queue *q){
 9cc:	55                   	push   %ebp
 9cd:	89 e5                	mov    %esp,%ebp
 9cf:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 9d2:	8b 45 08             	mov    0x8(%ebp),%eax
 9d5:	89 04 24             	mov    %eax,(%esp)
 9d8:	e8 d5 ff ff ff       	call   9b2 <empty_q>
 9dd:	85 c0                	test   %eax,%eax
 9df:	75 5d                	jne    a3e <pop_q+0x72>
       val = q->head->value; 
 9e1:	8b 45 08             	mov    0x8(%ebp),%eax
 9e4:	8b 40 04             	mov    0x4(%eax),%eax
 9e7:	8b 00                	mov    (%eax),%eax
 9e9:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 9ec:	8b 45 08             	mov    0x8(%ebp),%eax
 9ef:	8b 40 04             	mov    0x4(%eax),%eax
 9f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 9f5:	8b 45 08             	mov    0x8(%ebp),%eax
 9f8:	8b 40 04             	mov    0x4(%eax),%eax
 9fb:	8b 50 04             	mov    0x4(%eax),%edx
 9fe:	8b 45 08             	mov    0x8(%ebp),%eax
 a01:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a04:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a07:	89 04 24             	mov    %eax,(%esp)
 a0a:	e8 e1 fb ff ff       	call   5f0 <free>
       q->size--;
 a0f:	8b 45 08             	mov    0x8(%ebp),%eax
 a12:	8b 00                	mov    (%eax),%eax
 a14:	8d 50 ff             	lea    -0x1(%eax),%edx
 a17:	8b 45 08             	mov    0x8(%ebp),%eax
 a1a:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a1c:	8b 45 08             	mov    0x8(%ebp),%eax
 a1f:	8b 00                	mov    (%eax),%eax
 a21:	85 c0                	test   %eax,%eax
 a23:	75 14                	jne    a39 <pop_q+0x6d>
            q->head = 0;
 a25:	8b 45 08             	mov    0x8(%ebp),%eax
 a28:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a2f:	8b 45 08             	mov    0x8(%ebp),%eax
 a32:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a39:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a3c:	eb 05                	jmp    a43 <pop_q+0x77>
    }
    return -1;
 a3e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a43:	c9                   	leave  
 a44:	c3                   	ret    
 a45:	90                   	nop
 a46:	90                   	nop
 a47:	90                   	nop

00000a48 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 a48:	55                   	push   %ebp
 a49:	89 e5                	mov    %esp,%ebp
 a4b:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 a4e:	8b 45 08             	mov    0x8(%ebp),%eax
 a51:	8b 55 0c             	mov    0xc(%ebp),%edx
 a54:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 a57:	8b 45 08             	mov    0x8(%ebp),%eax
 a5a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 a61:	8b 45 08             	mov    0x8(%ebp),%eax
 a64:	89 04 24             	mov    %eax,(%esp)
 a67:	e8 ae fd ff ff       	call   81a <lock_init>
}
 a6c:	c9                   	leave  
 a6d:	c3                   	ret    

00000a6e <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 a6e:	55                   	push   %ebp
 a6f:	89 e5                	mov    %esp,%ebp
 a71:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 a74:	8b 45 08             	mov    0x8(%ebp),%eax
 a77:	89 04 24             	mov    %eax,(%esp)
 a7a:	e8 a9 fd ff ff       	call   828 <lock_acquire>
	if(s->count  == 0){
 a7f:	8b 45 08             	mov    0x8(%ebp),%eax
 a82:	8b 40 04             	mov    0x4(%eax),%eax
 a85:	85 c0                	test   %eax,%eax
 a87:	75 43                	jne    acc <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 a89:	c7 44 24 04 d0 0b 00 	movl   $0xbd0,0x4(%esp)
 a90:	00 
 a91:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a98:	e8 9c f9 ff ff       	call   439 <printf>
		//add proc to waiters list
		int tid = getpid();
 a9d:	e8 76 f8 ff ff       	call   318 <getpid>
 aa2:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 aa5:	8b 45 08             	mov    0x8(%ebp),%eax
 aa8:	8d 50 0c             	lea    0xc(%eax),%edx
 aab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aae:	89 44 24 04          	mov    %eax,0x4(%esp)
 ab2:	89 14 24             	mov    %edx,(%esp)
 ab5:	e8 98 fe ff ff       	call   952 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 aba:	8b 45 08             	mov    0x8(%ebp),%eax
 abd:	89 04 24             	mov    %eax,(%esp)
 ac0:	e8 82 fd ff ff       	call   847 <lock_release>
		tsleep(); 
 ac5:	e8 7e f8 ff ff       	call   348 <tsleep>
 aca:	eb 2e                	jmp    afa <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 acc:	c7 44 24 04 d7 0b 00 	movl   $0xbd7,0x4(%esp)
 ad3:	00 
 ad4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 adb:	e8 59 f9 ff ff       	call   439 <printf>
		s->count--;	
 ae0:	8b 45 08             	mov    0x8(%ebp),%eax
 ae3:	8b 40 04             	mov    0x4(%eax),%eax
 ae6:	8d 50 ff             	lea    -0x1(%eax),%edx
 ae9:	8b 45 08             	mov    0x8(%ebp),%eax
 aec:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 aef:	8b 45 08             	mov    0x8(%ebp),%eax
 af2:	89 04 24             	mov    %eax,(%esp)
 af5:	e8 4d fd ff ff       	call   847 <lock_release>
	}
}
 afa:	c9                   	leave  
 afb:	c3                   	ret    

00000afc <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 afc:	55                   	push   %ebp
 afd:	89 e5                	mov    %esp,%ebp
 aff:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 b02:	c7 44 24 04 de 0b 00 	movl   $0xbde,0x4(%esp)
 b09:	00 
 b0a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b11:	e8 23 f9 ff ff       	call   439 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b16:	8b 45 08             	mov    0x8(%ebp),%eax
 b19:	89 04 24             	mov    %eax,(%esp)
 b1c:	e8 07 fd ff ff       	call   828 <lock_acquire>
	if(s->count < s->size){
 b21:	8b 45 08             	mov    0x8(%ebp),%eax
 b24:	8b 50 04             	mov    0x4(%eax),%edx
 b27:	8b 45 08             	mov    0x8(%ebp),%eax
 b2a:	8b 40 08             	mov    0x8(%eax),%eax
 b2d:	39 c2                	cmp    %eax,%edx
 b2f:	7d 0f                	jge    b40 <sem_signal+0x44>
		s->count++;	
 b31:	8b 45 08             	mov    0x8(%ebp),%eax
 b34:	8b 40 04             	mov    0x4(%eax),%eax
 b37:	8d 50 01             	lea    0x1(%eax),%edx
 b3a:	8b 45 08             	mov    0x8(%ebp),%eax
 b3d:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 b40:	8b 45 08             	mov    0x8(%ebp),%eax
 b43:	83 c0 0c             	add    $0xc,%eax
 b46:	89 04 24             	mov    %eax,(%esp)
 b49:	e8 7e fe ff ff       	call   9cc <pop_q>
 b4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 b51:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b55:	74 2e                	je     b85 <sem_signal+0x89>
		printf(1, "Sem A\n");
 b57:	c7 44 24 04 d7 0b 00 	movl   $0xbd7,0x4(%esp)
 b5e:	00 
 b5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b66:	e8 ce f8 ff ff       	call   439 <printf>
		twakeup(tid);
 b6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b6e:	89 04 24             	mov    %eax,(%esp)
 b71:	e8 da f7 ff ff       	call   350 <twakeup>
		s->count--;
 b76:	8b 45 08             	mov    0x8(%ebp),%eax
 b79:	8b 40 04             	mov    0x4(%eax),%eax
 b7c:	8d 50 ff             	lea    -0x1(%eax),%edx
 b7f:	8b 45 08             	mov    0x8(%ebp),%eax
 b82:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 b85:	8b 45 08             	mov    0x8(%ebp),%eax
 b88:	89 04 24             	mov    %eax,(%esp)
 b8b:	e8 b7 fc ff ff       	call   847 <lock_release>

 b90:	c9                   	leave  
 b91:	c3                   	ret    
