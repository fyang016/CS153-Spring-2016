
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
  1f:	b8 2b 08 00 00       	mov    $0x82b,%eax
  24:	eb 05                	jmp    2b <main+0x2b>
  26:	b8 2d 08 00 00       	mov    $0x82d,%eax
  2b:	8b 54 24 1c          	mov    0x1c(%esp),%edx
  2f:	c1 e2 02             	shl    $0x2,%edx
  32:	03 55 0c             	add    0xc(%ebp),%edx
  35:	8b 12                	mov    (%edx),%edx
  37:	89 44 24 0c          	mov    %eax,0xc(%esp)
  3b:	89 54 24 08          	mov    %edx,0x8(%esp)
  3f:	c7 44 24 04 2f 08 00 	movl   $0x82f,0x4(%esp)
  46:	00 
  47:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4e:	e8 12 04 00 00       	call   465 <printf>
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
  exit(0);
  61:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  68:	e8 67 02 00 00       	call   2d4 <exit>
  6d:	90                   	nop
  6e:	90                   	nop
  6f:	90                   	nop

00000070 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  70:	55                   	push   %ebp
  71:	89 e5                	mov    %esp,%ebp
  73:	57                   	push   %edi
  74:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  75:	8b 4d 08             	mov    0x8(%ebp),%ecx
  78:	8b 55 10             	mov    0x10(%ebp),%edx
  7b:	8b 45 0c             	mov    0xc(%ebp),%eax
  7e:	89 cb                	mov    %ecx,%ebx
  80:	89 df                	mov    %ebx,%edi
  82:	89 d1                	mov    %edx,%ecx
  84:	fc                   	cld    
  85:	f3 aa                	rep stos %al,%es:(%edi)
  87:	89 ca                	mov    %ecx,%edx
  89:	89 fb                	mov    %edi,%ebx
  8b:	89 5d 08             	mov    %ebx,0x8(%ebp)
  8e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  91:	5b                   	pop    %ebx
  92:	5f                   	pop    %edi
  93:	5d                   	pop    %ebp
  94:	c3                   	ret    

00000095 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  95:	55                   	push   %ebp
  96:	89 e5                	mov    %esp,%ebp
  98:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  9b:	8b 45 08             	mov    0x8(%ebp),%eax
  9e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  a1:	8b 45 0c             	mov    0xc(%ebp),%eax
  a4:	0f b6 10             	movzbl (%eax),%edx
  a7:	8b 45 08             	mov    0x8(%ebp),%eax
  aa:	88 10                	mov    %dl,(%eax)
  ac:	8b 45 08             	mov    0x8(%ebp),%eax
  af:	0f b6 00             	movzbl (%eax),%eax
  b2:	84 c0                	test   %al,%al
  b4:	0f 95 c0             	setne  %al
  b7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  bb:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  bf:	84 c0                	test   %al,%al
  c1:	75 de                	jne    a1 <strcpy+0xc>
    ;
  return os;
  c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  c6:	c9                   	leave  
  c7:	c3                   	ret    

000000c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  c8:	55                   	push   %ebp
  c9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  cb:	eb 08                	jmp    d5 <strcmp+0xd>
    p++, q++;
  cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  d5:	8b 45 08             	mov    0x8(%ebp),%eax
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	74 10                	je     ef <strcmp+0x27>
  df:	8b 45 08             	mov    0x8(%ebp),%eax
  e2:	0f b6 10             	movzbl (%eax),%edx
  e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  e8:	0f b6 00             	movzbl (%eax),%eax
  eb:	38 c2                	cmp    %al,%dl
  ed:	74 de                	je     cd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
  ef:	8b 45 08             	mov    0x8(%ebp),%eax
  f2:	0f b6 00             	movzbl (%eax),%eax
  f5:	0f b6 d0             	movzbl %al,%edx
  f8:	8b 45 0c             	mov    0xc(%ebp),%eax
  fb:	0f b6 00             	movzbl (%eax),%eax
  fe:	0f b6 c0             	movzbl %al,%eax
 101:	89 d1                	mov    %edx,%ecx
 103:	29 c1                	sub    %eax,%ecx
 105:	89 c8                	mov    %ecx,%eax
}
 107:	5d                   	pop    %ebp
 108:	c3                   	ret    

00000109 <strlen>:

uint
strlen(char *s)
{
 109:	55                   	push   %ebp
 10a:	89 e5                	mov    %esp,%ebp
 10c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 10f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 116:	eb 04                	jmp    11c <strlen+0x13>
 118:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 11c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 11f:	03 45 08             	add    0x8(%ebp),%eax
 122:	0f b6 00             	movzbl (%eax),%eax
 125:	84 c0                	test   %al,%al
 127:	75 ef                	jne    118 <strlen+0xf>
    ;
  return n;
 129:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 12c:	c9                   	leave  
 12d:	c3                   	ret    

0000012e <memset>:

void*
memset(void *dst, int c, uint n)
{
 12e:	55                   	push   %ebp
 12f:	89 e5                	mov    %esp,%ebp
 131:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 134:	8b 45 10             	mov    0x10(%ebp),%eax
 137:	89 44 24 08          	mov    %eax,0x8(%esp)
 13b:	8b 45 0c             	mov    0xc(%ebp),%eax
 13e:	89 44 24 04          	mov    %eax,0x4(%esp)
 142:	8b 45 08             	mov    0x8(%ebp),%eax
 145:	89 04 24             	mov    %eax,(%esp)
 148:	e8 23 ff ff ff       	call   70 <stosb>
  return dst;
 14d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 150:	c9                   	leave  
 151:	c3                   	ret    

00000152 <strchr>:

char*
strchr(const char *s, char c)
{
 152:	55                   	push   %ebp
 153:	89 e5                	mov    %esp,%ebp
 155:	83 ec 04             	sub    $0x4,%esp
 158:	8b 45 0c             	mov    0xc(%ebp),%eax
 15b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 15e:	eb 14                	jmp    174 <strchr+0x22>
    if(*s == c)
 160:	8b 45 08             	mov    0x8(%ebp),%eax
 163:	0f b6 00             	movzbl (%eax),%eax
 166:	3a 45 fc             	cmp    -0x4(%ebp),%al
 169:	75 05                	jne    170 <strchr+0x1e>
      return (char*)s;
 16b:	8b 45 08             	mov    0x8(%ebp),%eax
 16e:	eb 13                	jmp    183 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 170:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	84 c0                	test   %al,%al
 17c:	75 e2                	jne    160 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 17e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 183:	c9                   	leave  
 184:	c3                   	ret    

00000185 <gets>:

char*
gets(char *buf, int max)
{
 185:	55                   	push   %ebp
 186:	89 e5                	mov    %esp,%ebp
 188:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 18b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 192:	eb 44                	jmp    1d8 <gets+0x53>
    cc = read(0, &c, 1);
 194:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 19b:	00 
 19c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 19f:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1aa:	e8 45 01 00 00       	call   2f4 <read>
 1af:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 1b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1b6:	7e 2d                	jle    1e5 <gets+0x60>
      break;
    buf[i++] = c;
 1b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1bb:	03 45 08             	add    0x8(%ebp),%eax
 1be:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1c2:	88 10                	mov    %dl,(%eax)
 1c4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 1c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1cc:	3c 0a                	cmp    $0xa,%al
 1ce:	74 16                	je     1e6 <gets+0x61>
 1d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1d4:	3c 0d                	cmp    $0xd,%al
 1d6:	74 0e                	je     1e6 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1db:	83 c0 01             	add    $0x1,%eax
 1de:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1e1:	7c b1                	jl     194 <gets+0xf>
 1e3:	eb 01                	jmp    1e6 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1e5:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1e9:	03 45 08             	add    0x8(%ebp),%eax
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
 208:	e8 0f 01 00 00       	call   31c <open>
 20d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 210:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 214:	79 07                	jns    21d <stat+0x29>
    return -1;
 216:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 21b:	eb 23                	jmp    240 <stat+0x4c>
  r = fstat(fd, st);
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	89 44 24 04          	mov    %eax,0x4(%esp)
 224:	8b 45 f0             	mov    -0x10(%ebp),%eax
 227:	89 04 24             	mov    %eax,(%esp)
 22a:	e8 05 01 00 00       	call   334 <fstat>
 22f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 232:	8b 45 f0             	mov    -0x10(%ebp),%eax
 235:	89 04 24             	mov    %eax,(%esp)
 238:	e8 c7 00 00 00       	call   304 <close>
  return r;
 23d:	8b 45 f4             	mov    -0xc(%ebp),%eax
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
 24f:	eb 24                	jmp    275 <atoi+0x33>
    n = n*10 + *s++ - '0';
 251:	8b 55 fc             	mov    -0x4(%ebp),%edx
 254:	89 d0                	mov    %edx,%eax
 256:	c1 e0 02             	shl    $0x2,%eax
 259:	01 d0                	add    %edx,%eax
 25b:	01 c0                	add    %eax,%eax
 25d:	89 c2                	mov    %eax,%edx
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
 262:	0f b6 00             	movzbl (%eax),%eax
 265:	0f be c0             	movsbl %al,%eax
 268:	8d 04 02             	lea    (%edx,%eax,1),%eax
 26b:	83 e8 30             	sub    $0x30,%eax
 26e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 271:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	0f b6 00             	movzbl (%eax),%eax
 27b:	3c 2f                	cmp    $0x2f,%al
 27d:	7e 0a                	jle    289 <atoi+0x47>
 27f:	8b 45 08             	mov    0x8(%ebp),%eax
 282:	0f b6 00             	movzbl (%eax),%eax
 285:	3c 39                	cmp    $0x39,%al
 287:	7e c8                	jle    251 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 289:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 28c:	c9                   	leave  
 28d:	c3                   	ret    

0000028e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 28e:	55                   	push   %ebp
 28f:	89 e5                	mov    %esp,%ebp
 291:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 29a:	8b 45 0c             	mov    0xc(%ebp),%eax
 29d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 2a0:	eb 13                	jmp    2b5 <memmove+0x27>
    *dst++ = *src++;
 2a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2a5:	0f b6 10             	movzbl (%eax),%edx
 2a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2ab:	88 10                	mov    %dl,(%eax)
 2ad:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 2b1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2b5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2b9:	0f 9f c0             	setg   %al
 2bc:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2c0:	84 c0                	test   %al,%al
 2c2:	75 de                	jne    2a2 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c7:	c9                   	leave  
 2c8:	c3                   	ret    
 2c9:	90                   	nop
 2ca:	90                   	nop
 2cb:	90                   	nop

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

000002e4 <waitpid>:
SYSCALL(waitpid)
 2e4:	b8 17 00 00 00       	mov    $0x17,%eax
 2e9:	cd 40                	int    $0x40
 2eb:	c3                   	ret    

000002ec <pipe>:
SYSCALL(pipe)
 2ec:	b8 04 00 00 00       	mov    $0x4,%eax
 2f1:	cd 40                	int    $0x40
 2f3:	c3                   	ret    

000002f4 <read>:
SYSCALL(read)
 2f4:	b8 05 00 00 00       	mov    $0x5,%eax
 2f9:	cd 40                	int    $0x40
 2fb:	c3                   	ret    

000002fc <write>:
SYSCALL(write)
 2fc:	b8 10 00 00 00       	mov    $0x10,%eax
 301:	cd 40                	int    $0x40
 303:	c3                   	ret    

00000304 <close>:
SYSCALL(close)
 304:	b8 15 00 00 00       	mov    $0x15,%eax
 309:	cd 40                	int    $0x40
 30b:	c3                   	ret    

0000030c <kill>:
SYSCALL(kill)
 30c:	b8 06 00 00 00       	mov    $0x6,%eax
 311:	cd 40                	int    $0x40
 313:	c3                   	ret    

00000314 <exec>:
SYSCALL(exec)
 314:	b8 07 00 00 00       	mov    $0x7,%eax
 319:	cd 40                	int    $0x40
 31b:	c3                   	ret    

0000031c <open>:
SYSCALL(open)
 31c:	b8 0f 00 00 00       	mov    $0xf,%eax
 321:	cd 40                	int    $0x40
 323:	c3                   	ret    

00000324 <mknod>:
SYSCALL(mknod)
 324:	b8 11 00 00 00       	mov    $0x11,%eax
 329:	cd 40                	int    $0x40
 32b:	c3                   	ret    

0000032c <unlink>:
SYSCALL(unlink)
 32c:	b8 12 00 00 00       	mov    $0x12,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <fstat>:
SYSCALL(fstat)
 334:	b8 08 00 00 00       	mov    $0x8,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <link>:
SYSCALL(link)
 33c:	b8 13 00 00 00       	mov    $0x13,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <mkdir>:
SYSCALL(mkdir)
 344:	b8 14 00 00 00       	mov    $0x14,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <chdir>:
SYSCALL(chdir)
 34c:	b8 09 00 00 00       	mov    $0x9,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <dup>:
SYSCALL(dup)
 354:	b8 0a 00 00 00       	mov    $0xa,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <getpid>:
SYSCALL(getpid)
 35c:	b8 0b 00 00 00       	mov    $0xb,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <sbrk>:
SYSCALL(sbrk)
 364:	b8 0c 00 00 00       	mov    $0xc,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <sleep>:
SYSCALL(sleep)
 36c:	b8 0d 00 00 00       	mov    $0xd,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <uptime>:
SYSCALL(uptime)
 374:	b8 0e 00 00 00       	mov    $0xe,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <count>:
SYSCALL(count)
 37c:	b8 16 00 00 00       	mov    $0x16,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <change_priority>:
SYSCALL(change_priority)
 384:	b8 18 00 00 00       	mov    $0x18,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 38c:	55                   	push   %ebp
 38d:	89 e5                	mov    %esp,%ebp
 38f:	83 ec 28             	sub    $0x28,%esp
 392:	8b 45 0c             	mov    0xc(%ebp),%eax
 395:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 398:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 39f:	00 
 3a0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
 3aa:	89 04 24             	mov    %eax,(%esp)
 3ad:	e8 4a ff ff ff       	call   2fc <write>
}
 3b2:	c9                   	leave  
 3b3:	c3                   	ret    

000003b4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3b4:	55                   	push   %ebp
 3b5:	89 e5                	mov    %esp,%ebp
 3b7:	53                   	push   %ebx
 3b8:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3c2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3c6:	74 17                	je     3df <printint+0x2b>
 3c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3cc:	79 11                	jns    3df <printint+0x2b>
    neg = 1;
 3ce:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d8:	f7 d8                	neg    %eax
 3da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3dd:	eb 06                	jmp    3e5 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3df:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3e5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3ec:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3ef:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3f5:	ba 00 00 00 00       	mov    $0x0,%edx
 3fa:	f7 f3                	div    %ebx
 3fc:	89 d0                	mov    %edx,%eax
 3fe:	0f b6 80 3c 08 00 00 	movzbl 0x83c(%eax),%eax
 405:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 409:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 40d:	8b 45 10             	mov    0x10(%ebp),%eax
 410:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 413:	8b 45 f4             	mov    -0xc(%ebp),%eax
 416:	ba 00 00 00 00       	mov    $0x0,%edx
 41b:	f7 75 d4             	divl   -0x2c(%ebp)
 41e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 421:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 425:	75 c5                	jne    3ec <printint+0x38>
  if(neg)
 427:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 42b:	74 28                	je     455 <printint+0xa1>
    buf[i++] = '-';
 42d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 430:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 435:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 439:	eb 1a                	jmp    455 <printint+0xa1>
    putc(fd, buf[i]);
 43b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 43e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 443:	0f be c0             	movsbl %al,%eax
 446:	89 44 24 04          	mov    %eax,0x4(%esp)
 44a:	8b 45 08             	mov    0x8(%ebp),%eax
 44d:	89 04 24             	mov    %eax,(%esp)
 450:	e8 37 ff ff ff       	call   38c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 455:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 459:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 45d:	79 dc                	jns    43b <printint+0x87>
    putc(fd, buf[i]);
}
 45f:	83 c4 44             	add    $0x44,%esp
 462:	5b                   	pop    %ebx
 463:	5d                   	pop    %ebp
 464:	c3                   	ret    

00000465 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 465:	55                   	push   %ebp
 466:	89 e5                	mov    %esp,%ebp
 468:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 46b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 472:	8d 45 0c             	lea    0xc(%ebp),%eax
 475:	83 c0 04             	add    $0x4,%eax
 478:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 47b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 482:	e9 7e 01 00 00       	jmp    605 <printf+0x1a0>
    c = fmt[i] & 0xff;
 487:	8b 55 0c             	mov    0xc(%ebp),%edx
 48a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 48d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 490:	0f b6 00             	movzbl (%eax),%eax
 493:	0f be c0             	movsbl %al,%eax
 496:	25 ff 00 00 00       	and    $0xff,%eax
 49b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 49e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a2:	75 2c                	jne    4d0 <printf+0x6b>
      if(c == '%'){
 4a4:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 4a8:	75 0c                	jne    4b6 <printf+0x51>
        state = '%';
 4aa:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 4b1:	e9 4b 01 00 00       	jmp    601 <printf+0x19c>
      } else {
        putc(fd, c);
 4b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4b9:	0f be c0             	movsbl %al,%eax
 4bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c0:	8b 45 08             	mov    0x8(%ebp),%eax
 4c3:	89 04 24             	mov    %eax,(%esp)
 4c6:	e8 c1 fe ff ff       	call   38c <putc>
 4cb:	e9 31 01 00 00       	jmp    601 <printf+0x19c>
      }
    } else if(state == '%'){
 4d0:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4d4:	0f 85 27 01 00 00    	jne    601 <printf+0x19c>
      if(c == 'd'){
 4da:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4de:	75 2d                	jne    50d <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e3:	8b 00                	mov    (%eax),%eax
 4e5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4ec:	00 
 4ed:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 4f4:	00 
 4f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f9:	8b 45 08             	mov    0x8(%ebp),%eax
 4fc:	89 04 24             	mov    %eax,(%esp)
 4ff:	e8 b0 fe ff ff       	call   3b4 <printint>
        ap++;
 504:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 508:	e9 ed 00 00 00       	jmp    5fa <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 50d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 511:	74 06                	je     519 <printf+0xb4>
 513:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 517:	75 2d                	jne    546 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 519:	8b 45 f4             	mov    -0xc(%ebp),%eax
 51c:	8b 00                	mov    (%eax),%eax
 51e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 525:	00 
 526:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 52d:	00 
 52e:	89 44 24 04          	mov    %eax,0x4(%esp)
 532:	8b 45 08             	mov    0x8(%ebp),%eax
 535:	89 04 24             	mov    %eax,(%esp)
 538:	e8 77 fe ff ff       	call   3b4 <printint>
        ap++;
 53d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 541:	e9 b4 00 00 00       	jmp    5fa <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 546:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 54a:	75 46                	jne    592 <printf+0x12d>
        s = (char*)*ap;
 54c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 54f:	8b 00                	mov    (%eax),%eax
 551:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 554:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 558:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 55c:	75 27                	jne    585 <printf+0x120>
          s = "(null)";
 55e:	c7 45 e4 34 08 00 00 	movl   $0x834,-0x1c(%ebp)
        while(*s != 0){
 565:	eb 1f                	jmp    586 <printf+0x121>
          putc(fd, *s);
 567:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 56a:	0f b6 00             	movzbl (%eax),%eax
 56d:	0f be c0             	movsbl %al,%eax
 570:	89 44 24 04          	mov    %eax,0x4(%esp)
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	89 04 24             	mov    %eax,(%esp)
 57a:	e8 0d fe ff ff       	call   38c <putc>
          s++;
 57f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 583:	eb 01                	jmp    586 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 585:	90                   	nop
 586:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 589:	0f b6 00             	movzbl (%eax),%eax
 58c:	84 c0                	test   %al,%al
 58e:	75 d7                	jne    567 <printf+0x102>
 590:	eb 68                	jmp    5fa <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 592:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 596:	75 1d                	jne    5b5 <printf+0x150>
        putc(fd, *ap);
 598:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59b:	8b 00                	mov    (%eax),%eax
 59d:	0f be c0             	movsbl %al,%eax
 5a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
 5a7:	89 04 24             	mov    %eax,(%esp)
 5aa:	e8 dd fd ff ff       	call   38c <putc>
        ap++;
 5af:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5b3:	eb 45                	jmp    5fa <printf+0x195>
      } else if(c == '%'){
 5b5:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5b9:	75 17                	jne    5d2 <printf+0x16d>
        putc(fd, c);
 5bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5be:	0f be c0             	movsbl %al,%eax
 5c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c5:	8b 45 08             	mov    0x8(%ebp),%eax
 5c8:	89 04 24             	mov    %eax,(%esp)
 5cb:	e8 bc fd ff ff       	call   38c <putc>
 5d0:	eb 28                	jmp    5fa <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5d2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5d9:	00 
 5da:	8b 45 08             	mov    0x8(%ebp),%eax
 5dd:	89 04 24             	mov    %eax,(%esp)
 5e0:	e8 a7 fd ff ff       	call   38c <putc>
        putc(fd, c);
 5e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e8:	0f be c0             	movsbl %al,%eax
 5eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ef:	8b 45 08             	mov    0x8(%ebp),%eax
 5f2:	89 04 24             	mov    %eax,(%esp)
 5f5:	e8 92 fd ff ff       	call   38c <putc>
      }
      state = 0;
 5fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 601:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 605:	8b 55 0c             	mov    0xc(%ebp),%edx
 608:	8b 45 ec             	mov    -0x14(%ebp),%eax
 60b:	8d 04 02             	lea    (%edx,%eax,1),%eax
 60e:	0f b6 00             	movzbl (%eax),%eax
 611:	84 c0                	test   %al,%al
 613:	0f 85 6e fe ff ff    	jne    487 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 619:	c9                   	leave  
 61a:	c3                   	ret    
 61b:	90                   	nop

0000061c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 61c:	55                   	push   %ebp
 61d:	89 e5                	mov    %esp,%ebp
 61f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 622:	8b 45 08             	mov    0x8(%ebp),%eax
 625:	83 e8 08             	sub    $0x8,%eax
 628:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 62b:	a1 58 08 00 00       	mov    0x858,%eax
 630:	89 45 fc             	mov    %eax,-0x4(%ebp)
 633:	eb 24                	jmp    659 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 635:	8b 45 fc             	mov    -0x4(%ebp),%eax
 638:	8b 00                	mov    (%eax),%eax
 63a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 63d:	77 12                	ja     651 <free+0x35>
 63f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 642:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 645:	77 24                	ja     66b <free+0x4f>
 647:	8b 45 fc             	mov    -0x4(%ebp),%eax
 64a:	8b 00                	mov    (%eax),%eax
 64c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 64f:	77 1a                	ja     66b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 651:	8b 45 fc             	mov    -0x4(%ebp),%eax
 654:	8b 00                	mov    (%eax),%eax
 656:	89 45 fc             	mov    %eax,-0x4(%ebp)
 659:	8b 45 f8             	mov    -0x8(%ebp),%eax
 65c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 65f:	76 d4                	jbe    635 <free+0x19>
 661:	8b 45 fc             	mov    -0x4(%ebp),%eax
 664:	8b 00                	mov    (%eax),%eax
 666:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 669:	76 ca                	jbe    635 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 66b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66e:	8b 40 04             	mov    0x4(%eax),%eax
 671:	c1 e0 03             	shl    $0x3,%eax
 674:	89 c2                	mov    %eax,%edx
 676:	03 55 f8             	add    -0x8(%ebp),%edx
 679:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67c:	8b 00                	mov    (%eax),%eax
 67e:	39 c2                	cmp    %eax,%edx
 680:	75 24                	jne    6a6 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 682:	8b 45 f8             	mov    -0x8(%ebp),%eax
 685:	8b 50 04             	mov    0x4(%eax),%edx
 688:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68b:	8b 00                	mov    (%eax),%eax
 68d:	8b 40 04             	mov    0x4(%eax),%eax
 690:	01 c2                	add    %eax,%edx
 692:	8b 45 f8             	mov    -0x8(%ebp),%eax
 695:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 698:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69b:	8b 00                	mov    (%eax),%eax
 69d:	8b 10                	mov    (%eax),%edx
 69f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a2:	89 10                	mov    %edx,(%eax)
 6a4:	eb 0a                	jmp    6b0 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 6a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a9:	8b 10                	mov    (%eax),%edx
 6ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ae:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b3:	8b 40 04             	mov    0x4(%eax),%eax
 6b6:	c1 e0 03             	shl    $0x3,%eax
 6b9:	03 45 fc             	add    -0x4(%ebp),%eax
 6bc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6bf:	75 20                	jne    6e1 <free+0xc5>
    p->s.size += bp->s.size;
 6c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c4:	8b 50 04             	mov    0x4(%eax),%edx
 6c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ca:	8b 40 04             	mov    0x4(%eax),%eax
 6cd:	01 c2                	add    %eax,%edx
 6cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d8:	8b 10                	mov    (%eax),%edx
 6da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6dd:	89 10                	mov    %edx,(%eax)
 6df:	eb 08                	jmp    6e9 <free+0xcd>
  } else
    p->s.ptr = bp;
 6e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6e7:	89 10                	mov    %edx,(%eax)
  freep = p;
 6e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ec:	a3 58 08 00 00       	mov    %eax,0x858
}
 6f1:	c9                   	leave  
 6f2:	c3                   	ret    

000006f3 <morecore>:

static Header*
morecore(uint nu)
{
 6f3:	55                   	push   %ebp
 6f4:	89 e5                	mov    %esp,%ebp
 6f6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 6f9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 700:	77 07                	ja     709 <morecore+0x16>
    nu = 4096;
 702:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 709:	8b 45 08             	mov    0x8(%ebp),%eax
 70c:	c1 e0 03             	shl    $0x3,%eax
 70f:	89 04 24             	mov    %eax,(%esp)
 712:	e8 4d fc ff ff       	call   364 <sbrk>
 717:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 71a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 71e:	75 07                	jne    727 <morecore+0x34>
    return 0;
 720:	b8 00 00 00 00       	mov    $0x0,%eax
 725:	eb 22                	jmp    749 <morecore+0x56>
  hp = (Header*)p;
 727:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 72d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 730:	8b 55 08             	mov    0x8(%ebp),%edx
 733:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 736:	8b 45 f4             	mov    -0xc(%ebp),%eax
 739:	83 c0 08             	add    $0x8,%eax
 73c:	89 04 24             	mov    %eax,(%esp)
 73f:	e8 d8 fe ff ff       	call   61c <free>
  return freep;
 744:	a1 58 08 00 00       	mov    0x858,%eax
}
 749:	c9                   	leave  
 74a:	c3                   	ret    

0000074b <malloc>:

void*
malloc(uint nbytes)
{
 74b:	55                   	push   %ebp
 74c:	89 e5                	mov    %esp,%ebp
 74e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 751:	8b 45 08             	mov    0x8(%ebp),%eax
 754:	83 c0 07             	add    $0x7,%eax
 757:	c1 e8 03             	shr    $0x3,%eax
 75a:	83 c0 01             	add    $0x1,%eax
 75d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 760:	a1 58 08 00 00       	mov    0x858,%eax
 765:	89 45 f0             	mov    %eax,-0x10(%ebp)
 768:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 76c:	75 23                	jne    791 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 76e:	c7 45 f0 50 08 00 00 	movl   $0x850,-0x10(%ebp)
 775:	8b 45 f0             	mov    -0x10(%ebp),%eax
 778:	a3 58 08 00 00       	mov    %eax,0x858
 77d:	a1 58 08 00 00       	mov    0x858,%eax
 782:	a3 50 08 00 00       	mov    %eax,0x850
    base.s.size = 0;
 787:	c7 05 54 08 00 00 00 	movl   $0x0,0x854
 78e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 791:	8b 45 f0             	mov    -0x10(%ebp),%eax
 794:	8b 00                	mov    (%eax),%eax
 796:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 799:	8b 45 ec             	mov    -0x14(%ebp),%eax
 79c:	8b 40 04             	mov    0x4(%eax),%eax
 79f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7a2:	72 4d                	jb     7f1 <malloc+0xa6>
      if(p->s.size == nunits)
 7a4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a7:	8b 40 04             	mov    0x4(%eax),%eax
 7aa:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7ad:	75 0c                	jne    7bb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7af:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b2:	8b 10                	mov    (%eax),%edx
 7b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b7:	89 10                	mov    %edx,(%eax)
 7b9:	eb 26                	jmp    7e1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7be:	8b 40 04             	mov    0x4(%eax),%eax
 7c1:	89 c2                	mov    %eax,%edx
 7c3:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7cf:	8b 40 04             	mov    0x4(%eax),%eax
 7d2:	c1 e0 03             	shl    $0x3,%eax
 7d5:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7db:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7de:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e4:	a3 58 08 00 00       	mov    %eax,0x858
      return (void*)(p + 1);
 7e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ec:	83 c0 08             	add    $0x8,%eax
 7ef:	eb 38                	jmp    829 <malloc+0xde>
    }
    if(p == freep)
 7f1:	a1 58 08 00 00       	mov    0x858,%eax
 7f6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 7f9:	75 1b                	jne    816 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 7fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fe:	89 04 24             	mov    %eax,(%esp)
 801:	e8 ed fe ff ff       	call   6f3 <morecore>
 806:	89 45 ec             	mov    %eax,-0x14(%ebp)
 809:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 80d:	75 07                	jne    816 <malloc+0xcb>
        return 0;
 80f:	b8 00 00 00 00       	mov    $0x0,%eax
 814:	eb 13                	jmp    829 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 816:	8b 45 ec             	mov    -0x14(%ebp),%eax
 819:	89 45 f0             	mov    %eax,-0x10(%ebp)
 81c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 81f:	8b 00                	mov    (%eax),%eax
 821:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 824:	e9 70 ff ff ff       	jmp    799 <malloc+0x4e>
}
 829:	c9                   	leave  
 82a:	c3                   	ret    
