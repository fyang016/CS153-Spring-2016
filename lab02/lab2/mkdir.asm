
_mkdir:     file format elf32-i386


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
   d:	7f 19                	jg     28 <main+0x28>
    printf(2, "Usage: mkdir files...\n");
   f:	c7 44 24 04 be 0b 00 	movl   $0xbbe,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 7c 04 00 00       	call   49f <printf>
    exit();
  23:	e8 cf 02 00 00       	call   2f7 <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 4f                	jmp    81 <main+0x81>
    if(mkdir(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  3d:	8b 45 0c             	mov    0xc(%ebp),%eax
  40:	01 d0                	add    %edx,%eax
  42:	8b 00                	mov    (%eax),%eax
  44:	89 04 24             	mov    %eax,(%esp)
  47:	e8 13 03 00 00       	call   35f <mkdir>
  4c:	85 c0                	test   %eax,%eax
  4e:	79 2c                	jns    7c <main+0x7c>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  50:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  54:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  5b:	8b 45 0c             	mov    0xc(%ebp),%eax
  5e:	01 d0                	add    %edx,%eax
  60:	8b 00                	mov    (%eax),%eax
  62:	89 44 24 08          	mov    %eax,0x8(%esp)
  66:	c7 44 24 04 d5 0b 00 	movl   $0xbd5,0x4(%esp)
  6d:	00 
  6e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  75:	e8 25 04 00 00       	call   49f <printf>
      break;
  7a:	eb 0e                	jmp    8a <main+0x8a>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  7c:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  81:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  85:	3b 45 08             	cmp    0x8(%ebp),%eax
  88:	7c a8                	jl     32 <main+0x32>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  8a:	e8 68 02 00 00       	call   2f7 <exit>

0000008f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  8f:	55                   	push   %ebp
  90:	89 e5                	mov    %esp,%ebp
  92:	57                   	push   %edi
  93:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  94:	8b 4d 08             	mov    0x8(%ebp),%ecx
  97:	8b 55 10             	mov    0x10(%ebp),%edx
  9a:	8b 45 0c             	mov    0xc(%ebp),%eax
  9d:	89 cb                	mov    %ecx,%ebx
  9f:	89 df                	mov    %ebx,%edi
  a1:	89 d1                	mov    %edx,%ecx
  a3:	fc                   	cld    
  a4:	f3 aa                	rep stos %al,%es:(%edi)
  a6:	89 ca                	mov    %ecx,%edx
  a8:	89 fb                	mov    %edi,%ebx
  aa:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ad:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  b0:	5b                   	pop    %ebx
  b1:	5f                   	pop    %edi
  b2:	5d                   	pop    %ebp
  b3:	c3                   	ret    

000000b4 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  b4:	55                   	push   %ebp
  b5:	89 e5                	mov    %esp,%ebp
  b7:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  ba:	8b 45 08             	mov    0x8(%ebp),%eax
  bd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  c0:	90                   	nop
  c1:	8b 45 08             	mov    0x8(%ebp),%eax
  c4:	8d 50 01             	lea    0x1(%eax),%edx
  c7:	89 55 08             	mov    %edx,0x8(%ebp)
  ca:	8b 55 0c             	mov    0xc(%ebp),%edx
  cd:	8d 4a 01             	lea    0x1(%edx),%ecx
  d0:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  d3:	0f b6 12             	movzbl (%edx),%edx
  d6:	88 10                	mov    %dl,(%eax)
  d8:	0f b6 00             	movzbl (%eax),%eax
  db:	84 c0                	test   %al,%al
  dd:	75 e2                	jne    c1 <strcpy+0xd>
    ;
  return os;
  df:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  e2:	c9                   	leave  
  e3:	c3                   	ret    

000000e4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
  e4:	55                   	push   %ebp
  e5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e7:	eb 08                	jmp    f1 <strcmp+0xd>
    p++, q++;
  e9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  ed:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  f1:	8b 45 08             	mov    0x8(%ebp),%eax
  f4:	0f b6 00             	movzbl (%eax),%eax
  f7:	84 c0                	test   %al,%al
  f9:	74 10                	je     10b <strcmp+0x27>
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	0f b6 10             	movzbl (%eax),%edx
 101:	8b 45 0c             	mov    0xc(%ebp),%eax
 104:	0f b6 00             	movzbl (%eax),%eax
 107:	38 c2                	cmp    %al,%dl
 109:	74 de                	je     e9 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	0f b6 00             	movzbl (%eax),%eax
 111:	0f b6 d0             	movzbl %al,%edx
 114:	8b 45 0c             	mov    0xc(%ebp),%eax
 117:	0f b6 00             	movzbl (%eax),%eax
 11a:	0f b6 c0             	movzbl %al,%eax
 11d:	29 c2                	sub    %eax,%edx
 11f:	89 d0                	mov    %edx,%eax
}
 121:	5d                   	pop    %ebp
 122:	c3                   	ret    

00000123 <strlen>:

uint
strlen(char *s)
{
 123:	55                   	push   %ebp
 124:	89 e5                	mov    %esp,%ebp
 126:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 129:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 130:	eb 04                	jmp    136 <strlen+0x13>
 132:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 136:	8b 55 fc             	mov    -0x4(%ebp),%edx
 139:	8b 45 08             	mov    0x8(%ebp),%eax
 13c:	01 d0                	add    %edx,%eax
 13e:	0f b6 00             	movzbl (%eax),%eax
 141:	84 c0                	test   %al,%al
 143:	75 ed                	jne    132 <strlen+0xf>
    ;
  return n;
 145:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 148:	c9                   	leave  
 149:	c3                   	ret    

0000014a <memset>:

void*
memset(void *dst, int c, uint n)
{
 14a:	55                   	push   %ebp
 14b:	89 e5                	mov    %esp,%ebp
 14d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 150:	8b 45 10             	mov    0x10(%ebp),%eax
 153:	89 44 24 08          	mov    %eax,0x8(%esp)
 157:	8b 45 0c             	mov    0xc(%ebp),%eax
 15a:	89 44 24 04          	mov    %eax,0x4(%esp)
 15e:	8b 45 08             	mov    0x8(%ebp),%eax
 161:	89 04 24             	mov    %eax,(%esp)
 164:	e8 26 ff ff ff       	call   8f <stosb>
  return dst;
 169:	8b 45 08             	mov    0x8(%ebp),%eax
}
 16c:	c9                   	leave  
 16d:	c3                   	ret    

0000016e <strchr>:

char*
strchr(const char *s, char c)
{
 16e:	55                   	push   %ebp
 16f:	89 e5                	mov    %esp,%ebp
 171:	83 ec 04             	sub    $0x4,%esp
 174:	8b 45 0c             	mov    0xc(%ebp),%eax
 177:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 17a:	eb 14                	jmp    190 <strchr+0x22>
    if(*s == c)
 17c:	8b 45 08             	mov    0x8(%ebp),%eax
 17f:	0f b6 00             	movzbl (%eax),%eax
 182:	3a 45 fc             	cmp    -0x4(%ebp),%al
 185:	75 05                	jne    18c <strchr+0x1e>
      return (char*)s;
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	eb 13                	jmp    19f <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 18c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 190:	8b 45 08             	mov    0x8(%ebp),%eax
 193:	0f b6 00             	movzbl (%eax),%eax
 196:	84 c0                	test   %al,%al
 198:	75 e2                	jne    17c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 19a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 19f:	c9                   	leave  
 1a0:	c3                   	ret    

000001a1 <gets>:

char*
gets(char *buf, int max)
{
 1a1:	55                   	push   %ebp
 1a2:	89 e5                	mov    %esp,%ebp
 1a4:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1ae:	eb 4c                	jmp    1fc <gets+0x5b>
    cc = read(0, &c, 1);
 1b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b7:	00 
 1b8:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c6:	e8 44 01 00 00       	call   30f <read>
 1cb:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1d2:	7f 02                	jg     1d6 <gets+0x35>
      break;
 1d4:	eb 31                	jmp    207 <gets+0x66>
    buf[i++] = c;
 1d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d9:	8d 50 01             	lea    0x1(%eax),%edx
 1dc:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1df:	89 c2                	mov    %eax,%edx
 1e1:	8b 45 08             	mov    0x8(%ebp),%eax
 1e4:	01 c2                	add    %eax,%edx
 1e6:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1ea:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f0:	3c 0a                	cmp    $0xa,%al
 1f2:	74 13                	je     207 <gets+0x66>
 1f4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f8:	3c 0d                	cmp    $0xd,%al
 1fa:	74 0b                	je     207 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1ff:	83 c0 01             	add    $0x1,%eax
 202:	3b 45 0c             	cmp    0xc(%ebp),%eax
 205:	7c a9                	jl     1b0 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 207:	8b 55 f4             	mov    -0xc(%ebp),%edx
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	01 d0                	add    %edx,%eax
 20f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 212:	8b 45 08             	mov    0x8(%ebp),%eax
}
 215:	c9                   	leave  
 216:	c3                   	ret    

00000217 <stat>:

int
stat(char *n, struct stat *st)
{
 217:	55                   	push   %ebp
 218:	89 e5                	mov    %esp,%ebp
 21a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 21d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 224:	00 
 225:	8b 45 08             	mov    0x8(%ebp),%eax
 228:	89 04 24             	mov    %eax,(%esp)
 22b:	e8 07 01 00 00       	call   337 <open>
 230:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 233:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 237:	79 07                	jns    240 <stat+0x29>
    return -1;
 239:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 23e:	eb 23                	jmp    263 <stat+0x4c>
  r = fstat(fd, st);
 240:	8b 45 0c             	mov    0xc(%ebp),%eax
 243:	89 44 24 04          	mov    %eax,0x4(%esp)
 247:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24a:	89 04 24             	mov    %eax,(%esp)
 24d:	e8 fd 00 00 00       	call   34f <fstat>
 252:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 255:	8b 45 f4             	mov    -0xc(%ebp),%eax
 258:	89 04 24             	mov    %eax,(%esp)
 25b:	e8 bf 00 00 00       	call   31f <close>
  return r;
 260:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 263:	c9                   	leave  
 264:	c3                   	ret    

00000265 <atoi>:

int
atoi(const char *s)
{
 265:	55                   	push   %ebp
 266:	89 e5                	mov    %esp,%ebp
 268:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 26b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 272:	eb 25                	jmp    299 <atoi+0x34>
    n = n*10 + *s++ - '0';
 274:	8b 55 fc             	mov    -0x4(%ebp),%edx
 277:	89 d0                	mov    %edx,%eax
 279:	c1 e0 02             	shl    $0x2,%eax
 27c:	01 d0                	add    %edx,%eax
 27e:	01 c0                	add    %eax,%eax
 280:	89 c1                	mov    %eax,%ecx
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	8d 50 01             	lea    0x1(%eax),%edx
 288:	89 55 08             	mov    %edx,0x8(%ebp)
 28b:	0f b6 00             	movzbl (%eax),%eax
 28e:	0f be c0             	movsbl %al,%eax
 291:	01 c8                	add    %ecx,%eax
 293:	83 e8 30             	sub    $0x30,%eax
 296:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 299:	8b 45 08             	mov    0x8(%ebp),%eax
 29c:	0f b6 00             	movzbl (%eax),%eax
 29f:	3c 2f                	cmp    $0x2f,%al
 2a1:	7e 0a                	jle    2ad <atoi+0x48>
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	0f b6 00             	movzbl (%eax),%eax
 2a9:	3c 39                	cmp    $0x39,%al
 2ab:	7e c7                	jle    274 <atoi+0xf>
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
 2bb:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2c4:	eb 17                	jmp    2dd <memmove+0x2b>
    *dst++ = *src++;
 2c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c9:	8d 50 01             	lea    0x1(%eax),%edx
 2cc:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2cf:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2d2:	8d 4a 01             	lea    0x1(%edx),%ecx
 2d5:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2d8:	0f b6 12             	movzbl (%edx),%edx
 2db:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2dd:	8b 45 10             	mov    0x10(%ebp),%eax
 2e0:	8d 50 ff             	lea    -0x1(%eax),%edx
 2e3:	89 55 10             	mov    %edx,0x10(%ebp)
 2e6:	85 c0                	test   %eax,%eax
 2e8:	7f dc                	jg     2c6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2ea:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ed:	c9                   	leave  
 2ee:	c3                   	ret    

000002ef <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ef:	b8 01 00 00 00       	mov    $0x1,%eax
 2f4:	cd 40                	int    $0x40
 2f6:	c3                   	ret    

000002f7 <exit>:
SYSCALL(exit)
 2f7:	b8 02 00 00 00       	mov    $0x2,%eax
 2fc:	cd 40                	int    $0x40
 2fe:	c3                   	ret    

000002ff <wait>:
SYSCALL(wait)
 2ff:	b8 03 00 00 00       	mov    $0x3,%eax
 304:	cd 40                	int    $0x40
 306:	c3                   	ret    

00000307 <pipe>:
SYSCALL(pipe)
 307:	b8 04 00 00 00       	mov    $0x4,%eax
 30c:	cd 40                	int    $0x40
 30e:	c3                   	ret    

0000030f <read>:
SYSCALL(read)
 30f:	b8 05 00 00 00       	mov    $0x5,%eax
 314:	cd 40                	int    $0x40
 316:	c3                   	ret    

00000317 <write>:
SYSCALL(write)
 317:	b8 10 00 00 00       	mov    $0x10,%eax
 31c:	cd 40                	int    $0x40
 31e:	c3                   	ret    

0000031f <close>:
SYSCALL(close)
 31f:	b8 15 00 00 00       	mov    $0x15,%eax
 324:	cd 40                	int    $0x40
 326:	c3                   	ret    

00000327 <kill>:
SYSCALL(kill)
 327:	b8 06 00 00 00       	mov    $0x6,%eax
 32c:	cd 40                	int    $0x40
 32e:	c3                   	ret    

0000032f <exec>:
SYSCALL(exec)
 32f:	b8 07 00 00 00       	mov    $0x7,%eax
 334:	cd 40                	int    $0x40
 336:	c3                   	ret    

00000337 <open>:
SYSCALL(open)
 337:	b8 0f 00 00 00       	mov    $0xf,%eax
 33c:	cd 40                	int    $0x40
 33e:	c3                   	ret    

0000033f <mknod>:
SYSCALL(mknod)
 33f:	b8 11 00 00 00       	mov    $0x11,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <unlink>:
SYSCALL(unlink)
 347:	b8 12 00 00 00       	mov    $0x12,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <fstat>:
SYSCALL(fstat)
 34f:	b8 08 00 00 00       	mov    $0x8,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <link>:
SYSCALL(link)
 357:	b8 13 00 00 00       	mov    $0x13,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <mkdir>:
SYSCALL(mkdir)
 35f:	b8 14 00 00 00       	mov    $0x14,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <chdir>:
SYSCALL(chdir)
 367:	b8 09 00 00 00       	mov    $0x9,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <dup>:
SYSCALL(dup)
 36f:	b8 0a 00 00 00       	mov    $0xa,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <getpid>:
SYSCALL(getpid)
 377:	b8 0b 00 00 00       	mov    $0xb,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <sbrk>:
SYSCALL(sbrk)
 37f:	b8 0c 00 00 00       	mov    $0xc,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <sleep>:
SYSCALL(sleep)
 387:	b8 0d 00 00 00       	mov    $0xd,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <uptime>:
SYSCALL(uptime)
 38f:	b8 0e 00 00 00       	mov    $0xe,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <clone>:
SYSCALL(clone)
 397:	b8 16 00 00 00       	mov    $0x16,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <texit>:
SYSCALL(texit)
 39f:	b8 17 00 00 00       	mov    $0x17,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <tsleep>:
SYSCALL(tsleep)
 3a7:	b8 18 00 00 00       	mov    $0x18,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <twakeup>:
SYSCALL(twakeup)
 3af:	b8 19 00 00 00       	mov    $0x19,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <test>:
SYSCALL(test)
 3b7:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3bf:	55                   	push   %ebp
 3c0:	89 e5                	mov    %esp,%ebp
 3c2:	83 ec 18             	sub    $0x18,%esp
 3c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c8:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3cb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3d2:	00 
 3d3:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 3da:	8b 45 08             	mov    0x8(%ebp),%eax
 3dd:	89 04 24             	mov    %eax,(%esp)
 3e0:	e8 32 ff ff ff       	call   317 <write>
}
 3e5:	c9                   	leave  
 3e6:	c3                   	ret    

000003e7 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3e7:	55                   	push   %ebp
 3e8:	89 e5                	mov    %esp,%ebp
 3ea:	56                   	push   %esi
 3eb:	53                   	push   %ebx
 3ec:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3ef:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3f6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3fa:	74 17                	je     413 <printint+0x2c>
 3fc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 400:	79 11                	jns    413 <printint+0x2c>
    neg = 1;
 402:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 409:	8b 45 0c             	mov    0xc(%ebp),%eax
 40c:	f7 d8                	neg    %eax
 40e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 411:	eb 06                	jmp    419 <printint+0x32>
  } else {
    x = xx;
 413:	8b 45 0c             	mov    0xc(%ebp),%eax
 416:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 419:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 420:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 423:	8d 41 01             	lea    0x1(%ecx),%eax
 426:	89 45 f4             	mov    %eax,-0xc(%ebp)
 429:	8b 5d 10             	mov    0x10(%ebp),%ebx
 42c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 42f:	ba 00 00 00 00       	mov    $0x0,%edx
 434:	f7 f3                	div    %ebx
 436:	89 d0                	mov    %edx,%eax
 438:	0f b6 80 e8 0f 00 00 	movzbl 0xfe8(%eax),%eax
 43f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 443:	8b 75 10             	mov    0x10(%ebp),%esi
 446:	8b 45 ec             	mov    -0x14(%ebp),%eax
 449:	ba 00 00 00 00       	mov    $0x0,%edx
 44e:	f7 f6                	div    %esi
 450:	89 45 ec             	mov    %eax,-0x14(%ebp)
 453:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 457:	75 c7                	jne    420 <printint+0x39>
  if(neg)
 459:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 45d:	74 10                	je     46f <printint+0x88>
    buf[i++] = '-';
 45f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 462:	8d 50 01             	lea    0x1(%eax),%edx
 465:	89 55 f4             	mov    %edx,-0xc(%ebp)
 468:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 46d:	eb 1f                	jmp    48e <printint+0xa7>
 46f:	eb 1d                	jmp    48e <printint+0xa7>
    putc(fd, buf[i]);
 471:	8d 55 dc             	lea    -0x24(%ebp),%edx
 474:	8b 45 f4             	mov    -0xc(%ebp),%eax
 477:	01 d0                	add    %edx,%eax
 479:	0f b6 00             	movzbl (%eax),%eax
 47c:	0f be c0             	movsbl %al,%eax
 47f:	89 44 24 04          	mov    %eax,0x4(%esp)
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	89 04 24             	mov    %eax,(%esp)
 489:	e8 31 ff ff ff       	call   3bf <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 48e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 492:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 496:	79 d9                	jns    471 <printint+0x8a>
    putc(fd, buf[i]);
}
 498:	83 c4 30             	add    $0x30,%esp
 49b:	5b                   	pop    %ebx
 49c:	5e                   	pop    %esi
 49d:	5d                   	pop    %ebp
 49e:	c3                   	ret    

0000049f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 49f:	55                   	push   %ebp
 4a0:	89 e5                	mov    %esp,%ebp
 4a2:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4a5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4ac:	8d 45 0c             	lea    0xc(%ebp),%eax
 4af:	83 c0 04             	add    $0x4,%eax
 4b2:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4b5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4bc:	e9 7c 01 00 00       	jmp    63d <printf+0x19e>
    c = fmt[i] & 0xff;
 4c1:	8b 55 0c             	mov    0xc(%ebp),%edx
 4c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4c7:	01 d0                	add    %edx,%eax
 4c9:	0f b6 00             	movzbl (%eax),%eax
 4cc:	0f be c0             	movsbl %al,%eax
 4cf:	25 ff 00 00 00       	and    $0xff,%eax
 4d4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4d7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4db:	75 2c                	jne    509 <printf+0x6a>
      if(c == '%'){
 4dd:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4e1:	75 0c                	jne    4ef <printf+0x50>
        state = '%';
 4e3:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4ea:	e9 4a 01 00 00       	jmp    639 <printf+0x19a>
      } else {
        putc(fd, c);
 4ef:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4f2:	0f be c0             	movsbl %al,%eax
 4f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f9:	8b 45 08             	mov    0x8(%ebp),%eax
 4fc:	89 04 24             	mov    %eax,(%esp)
 4ff:	e8 bb fe ff ff       	call   3bf <putc>
 504:	e9 30 01 00 00       	jmp    639 <printf+0x19a>
      }
    } else if(state == '%'){
 509:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 50d:	0f 85 26 01 00 00    	jne    639 <printf+0x19a>
      if(c == 'd'){
 513:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 517:	75 2d                	jne    546 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 519:	8b 45 e8             	mov    -0x18(%ebp),%eax
 51c:	8b 00                	mov    (%eax),%eax
 51e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 525:	00 
 526:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 52d:	00 
 52e:	89 44 24 04          	mov    %eax,0x4(%esp)
 532:	8b 45 08             	mov    0x8(%ebp),%eax
 535:	89 04 24             	mov    %eax,(%esp)
 538:	e8 aa fe ff ff       	call   3e7 <printint>
        ap++;
 53d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 541:	e9 ec 00 00 00       	jmp    632 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 546:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 54a:	74 06                	je     552 <printf+0xb3>
 54c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 550:	75 2d                	jne    57f <printf+0xe0>
        printint(fd, *ap, 16, 0);
 552:	8b 45 e8             	mov    -0x18(%ebp),%eax
 555:	8b 00                	mov    (%eax),%eax
 557:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 55e:	00 
 55f:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 566:	00 
 567:	89 44 24 04          	mov    %eax,0x4(%esp)
 56b:	8b 45 08             	mov    0x8(%ebp),%eax
 56e:	89 04 24             	mov    %eax,(%esp)
 571:	e8 71 fe ff ff       	call   3e7 <printint>
        ap++;
 576:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 57a:	e9 b3 00 00 00       	jmp    632 <printf+0x193>
      } else if(c == 's'){
 57f:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 583:	75 45                	jne    5ca <printf+0x12b>
        s = (char*)*ap;
 585:	8b 45 e8             	mov    -0x18(%ebp),%eax
 588:	8b 00                	mov    (%eax),%eax
 58a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 58d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 591:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 595:	75 09                	jne    5a0 <printf+0x101>
          s = "(null)";
 597:	c7 45 f4 f1 0b 00 00 	movl   $0xbf1,-0xc(%ebp)
        while(*s != 0){
 59e:	eb 1e                	jmp    5be <printf+0x11f>
 5a0:	eb 1c                	jmp    5be <printf+0x11f>
          putc(fd, *s);
 5a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a5:	0f b6 00             	movzbl (%eax),%eax
 5a8:	0f be c0             	movsbl %al,%eax
 5ab:	89 44 24 04          	mov    %eax,0x4(%esp)
 5af:	8b 45 08             	mov    0x8(%ebp),%eax
 5b2:	89 04 24             	mov    %eax,(%esp)
 5b5:	e8 05 fe ff ff       	call   3bf <putc>
          s++;
 5ba:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c1:	0f b6 00             	movzbl (%eax),%eax
 5c4:	84 c0                	test   %al,%al
 5c6:	75 da                	jne    5a2 <printf+0x103>
 5c8:	eb 68                	jmp    632 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ca:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5ce:	75 1d                	jne    5ed <printf+0x14e>
        putc(fd, *ap);
 5d0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d3:	8b 00                	mov    (%eax),%eax
 5d5:	0f be c0             	movsbl %al,%eax
 5d8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5dc:	8b 45 08             	mov    0x8(%ebp),%eax
 5df:	89 04 24             	mov    %eax,(%esp)
 5e2:	e8 d8 fd ff ff       	call   3bf <putc>
        ap++;
 5e7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5eb:	eb 45                	jmp    632 <printf+0x193>
      } else if(c == '%'){
 5ed:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5f1:	75 17                	jne    60a <printf+0x16b>
        putc(fd, c);
 5f3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f6:	0f be c0             	movsbl %al,%eax
 5f9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fd:	8b 45 08             	mov    0x8(%ebp),%eax
 600:	89 04 24             	mov    %eax,(%esp)
 603:	e8 b7 fd ff ff       	call   3bf <putc>
 608:	eb 28                	jmp    632 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 60a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 611:	00 
 612:	8b 45 08             	mov    0x8(%ebp),%eax
 615:	89 04 24             	mov    %eax,(%esp)
 618:	e8 a2 fd ff ff       	call   3bf <putc>
        putc(fd, c);
 61d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 620:	0f be c0             	movsbl %al,%eax
 623:	89 44 24 04          	mov    %eax,0x4(%esp)
 627:	8b 45 08             	mov    0x8(%ebp),%eax
 62a:	89 04 24             	mov    %eax,(%esp)
 62d:	e8 8d fd ff ff       	call   3bf <putc>
      }
      state = 0;
 632:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 639:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 63d:	8b 55 0c             	mov    0xc(%ebp),%edx
 640:	8b 45 f0             	mov    -0x10(%ebp),%eax
 643:	01 d0                	add    %edx,%eax
 645:	0f b6 00             	movzbl (%eax),%eax
 648:	84 c0                	test   %al,%al
 64a:	0f 85 71 fe ff ff    	jne    4c1 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 650:	c9                   	leave  
 651:	c3                   	ret    

00000652 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 652:	55                   	push   %ebp
 653:	89 e5                	mov    %esp,%ebp
 655:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 658:	8b 45 08             	mov    0x8(%ebp),%eax
 65b:	83 e8 08             	sub    $0x8,%eax
 65e:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 661:	a1 04 10 00 00       	mov    0x1004,%eax
 666:	89 45 fc             	mov    %eax,-0x4(%ebp)
 669:	eb 24                	jmp    68f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 66b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 66e:	8b 00                	mov    (%eax),%eax
 670:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 673:	77 12                	ja     687 <free+0x35>
 675:	8b 45 f8             	mov    -0x8(%ebp),%eax
 678:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 67b:	77 24                	ja     6a1 <free+0x4f>
 67d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 680:	8b 00                	mov    (%eax),%eax
 682:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 685:	77 1a                	ja     6a1 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 687:	8b 45 fc             	mov    -0x4(%ebp),%eax
 68a:	8b 00                	mov    (%eax),%eax
 68c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 68f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 692:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 695:	76 d4                	jbe    66b <free+0x19>
 697:	8b 45 fc             	mov    -0x4(%ebp),%eax
 69a:	8b 00                	mov    (%eax),%eax
 69c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 69f:	76 ca                	jbe    66b <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a4:	8b 40 04             	mov    0x4(%eax),%eax
 6a7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b1:	01 c2                	add    %eax,%edx
 6b3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b6:	8b 00                	mov    (%eax),%eax
 6b8:	39 c2                	cmp    %eax,%edx
 6ba:	75 24                	jne    6e0 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6bf:	8b 50 04             	mov    0x4(%eax),%edx
 6c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c5:	8b 00                	mov    (%eax),%eax
 6c7:	8b 40 04             	mov    0x4(%eax),%eax
 6ca:	01 c2                	add    %eax,%edx
 6cc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6cf:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d5:	8b 00                	mov    (%eax),%eax
 6d7:	8b 10                	mov    (%eax),%edx
 6d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6dc:	89 10                	mov    %edx,(%eax)
 6de:	eb 0a                	jmp    6ea <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e3:	8b 10                	mov    (%eax),%edx
 6e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e8:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ed:	8b 40 04             	mov    0x4(%eax),%eax
 6f0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fa:	01 d0                	add    %edx,%eax
 6fc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ff:	75 20                	jne    721 <free+0xcf>
    p->s.size += bp->s.size;
 701:	8b 45 fc             	mov    -0x4(%ebp),%eax
 704:	8b 50 04             	mov    0x4(%eax),%edx
 707:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70a:	8b 40 04             	mov    0x4(%eax),%eax
 70d:	01 c2                	add    %eax,%edx
 70f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 712:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 715:	8b 45 f8             	mov    -0x8(%ebp),%eax
 718:	8b 10                	mov    (%eax),%edx
 71a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71d:	89 10                	mov    %edx,(%eax)
 71f:	eb 08                	jmp    729 <free+0xd7>
  } else
    p->s.ptr = bp;
 721:	8b 45 fc             	mov    -0x4(%ebp),%eax
 724:	8b 55 f8             	mov    -0x8(%ebp),%edx
 727:	89 10                	mov    %edx,(%eax)
  freep = p;
 729:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72c:	a3 04 10 00 00       	mov    %eax,0x1004
}
 731:	c9                   	leave  
 732:	c3                   	ret    

00000733 <morecore>:

static Header*
morecore(uint nu)
{
 733:	55                   	push   %ebp
 734:	89 e5                	mov    %esp,%ebp
 736:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 739:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 740:	77 07                	ja     749 <morecore+0x16>
    nu = 4096;
 742:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 749:	8b 45 08             	mov    0x8(%ebp),%eax
 74c:	c1 e0 03             	shl    $0x3,%eax
 74f:	89 04 24             	mov    %eax,(%esp)
 752:	e8 28 fc ff ff       	call   37f <sbrk>
 757:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 75a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 75e:	75 07                	jne    767 <morecore+0x34>
    return 0;
 760:	b8 00 00 00 00       	mov    $0x0,%eax
 765:	eb 22                	jmp    789 <morecore+0x56>
  hp = (Header*)p;
 767:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 76d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 770:	8b 55 08             	mov    0x8(%ebp),%edx
 773:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 776:	8b 45 f0             	mov    -0x10(%ebp),%eax
 779:	83 c0 08             	add    $0x8,%eax
 77c:	89 04 24             	mov    %eax,(%esp)
 77f:	e8 ce fe ff ff       	call   652 <free>
  return freep;
 784:	a1 04 10 00 00       	mov    0x1004,%eax
}
 789:	c9                   	leave  
 78a:	c3                   	ret    

0000078b <malloc>:

void*
malloc(uint nbytes)
{
 78b:	55                   	push   %ebp
 78c:	89 e5                	mov    %esp,%ebp
 78e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 791:	8b 45 08             	mov    0x8(%ebp),%eax
 794:	83 c0 07             	add    $0x7,%eax
 797:	c1 e8 03             	shr    $0x3,%eax
 79a:	83 c0 01             	add    $0x1,%eax
 79d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7a0:	a1 04 10 00 00       	mov    0x1004,%eax
 7a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7a8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7ac:	75 23                	jne    7d1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7ae:	c7 45 f0 fc 0f 00 00 	movl   $0xffc,-0x10(%ebp)
 7b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b8:	a3 04 10 00 00       	mov    %eax,0x1004
 7bd:	a1 04 10 00 00       	mov    0x1004,%eax
 7c2:	a3 fc 0f 00 00       	mov    %eax,0xffc
    base.s.size = 0;
 7c7:	c7 05 00 10 00 00 00 	movl   $0x0,0x1000
 7ce:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d4:	8b 00                	mov    (%eax),%eax
 7d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7dc:	8b 40 04             	mov    0x4(%eax),%eax
 7df:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7e2:	72 4d                	jb     831 <malloc+0xa6>
      if(p->s.size == nunits)
 7e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e7:	8b 40 04             	mov    0x4(%eax),%eax
 7ea:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7ed:	75 0c                	jne    7fb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f2:	8b 10                	mov    (%eax),%edx
 7f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f7:	89 10                	mov    %edx,(%eax)
 7f9:	eb 26                	jmp    821 <malloc+0x96>
      else {
        p->s.size -= nunits;
 7fb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fe:	8b 40 04             	mov    0x4(%eax),%eax
 801:	2b 45 ec             	sub    -0x14(%ebp),%eax
 804:	89 c2                	mov    %eax,%edx
 806:	8b 45 f4             	mov    -0xc(%ebp),%eax
 809:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 80c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80f:	8b 40 04             	mov    0x4(%eax),%eax
 812:	c1 e0 03             	shl    $0x3,%eax
 815:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 818:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 81e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 821:	8b 45 f0             	mov    -0x10(%ebp),%eax
 824:	a3 04 10 00 00       	mov    %eax,0x1004
      return (void*)(p + 1);
 829:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82c:	83 c0 08             	add    $0x8,%eax
 82f:	eb 38                	jmp    869 <malloc+0xde>
    }
    if(p == freep)
 831:	a1 04 10 00 00       	mov    0x1004,%eax
 836:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 839:	75 1b                	jne    856 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 83b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 83e:	89 04 24             	mov    %eax,(%esp)
 841:	e8 ed fe ff ff       	call   733 <morecore>
 846:	89 45 f4             	mov    %eax,-0xc(%ebp)
 849:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 84d:	75 07                	jne    856 <malloc+0xcb>
        return 0;
 84f:	b8 00 00 00 00       	mov    $0x0,%eax
 854:	eb 13                	jmp    869 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 856:	8b 45 f4             	mov    -0xc(%ebp),%eax
 859:	89 45 f0             	mov    %eax,-0x10(%ebp)
 85c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85f:	8b 00                	mov    (%eax),%eax
 861:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 864:	e9 70 ff ff ff       	jmp    7d9 <malloc+0x4e>
}
 869:	c9                   	leave  
 86a:	c3                   	ret    

0000086b <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 86b:	55                   	push   %ebp
 86c:	89 e5                	mov    %esp,%ebp
 86e:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 871:	8b 55 08             	mov    0x8(%ebp),%edx
 874:	8b 45 0c             	mov    0xc(%ebp),%eax
 877:	8b 4d 08             	mov    0x8(%ebp),%ecx
 87a:	f0 87 02             	lock xchg %eax,(%edx)
 87d:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 880:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 883:	c9                   	leave  
 884:	c3                   	ret    

00000885 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 885:	55                   	push   %ebp
 886:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 888:	8b 45 08             	mov    0x8(%ebp),%eax
 88b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 891:	5d                   	pop    %ebp
 892:	c3                   	ret    

00000893 <lock_acquire>:
void lock_acquire(lock_t *lock){
 893:	55                   	push   %ebp
 894:	89 e5                	mov    %esp,%ebp
 896:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 899:	90                   	nop
 89a:	8b 45 08             	mov    0x8(%ebp),%eax
 89d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8a4:	00 
 8a5:	89 04 24             	mov    %eax,(%esp)
 8a8:	e8 be ff ff ff       	call   86b <xchg>
 8ad:	85 c0                	test   %eax,%eax
 8af:	75 e9                	jne    89a <lock_acquire+0x7>
}
 8b1:	c9                   	leave  
 8b2:	c3                   	ret    

000008b3 <lock_release>:
void lock_release(lock_t *lock){
 8b3:	55                   	push   %ebp
 8b4:	89 e5                	mov    %esp,%ebp
 8b6:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 8b9:	8b 45 08             	mov    0x8(%ebp),%eax
 8bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8c3:	00 
 8c4:	89 04 24             	mov    %eax,(%esp)
 8c7:	e8 9f ff ff ff       	call   86b <xchg>
}
 8cc:	c9                   	leave  
 8cd:	c3                   	ret    

000008ce <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 8ce:	55                   	push   %ebp
 8cf:	89 e5                	mov    %esp,%ebp
 8d1:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 8d4:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8db:	e8 ab fe ff ff       	call   78b <malloc>
 8e0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 8e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e6:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 8e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ec:	25 ff 0f 00 00       	and    $0xfff,%eax
 8f1:	85 c0                	test   %eax,%eax
 8f3:	74 14                	je     909 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 8f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f8:	25 ff 0f 00 00       	and    $0xfff,%eax
 8fd:	89 c2                	mov    %eax,%edx
 8ff:	b8 00 10 00 00       	mov    $0x1000,%eax
 904:	29 d0                	sub    %edx,%eax
 906:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 909:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 90d:	75 1b                	jne    92a <thread_create+0x5c>

        printf(1,"malloc fail \n");
 90f:	c7 44 24 04 f8 0b 00 	movl   $0xbf8,0x4(%esp)
 916:	00 
 917:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 91e:	e8 7c fb ff ff       	call   49f <printf>
        return 0;
 923:	b8 00 00 00 00       	mov    $0x0,%eax
 928:	eb 6f                	jmp    999 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 92a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 92d:	8b 55 08             	mov    0x8(%ebp),%edx
 930:	8b 45 f4             	mov    -0xc(%ebp),%eax
 933:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 937:	89 54 24 08          	mov    %edx,0x8(%esp)
 93b:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 942:	00 
 943:	89 04 24             	mov    %eax,(%esp)
 946:	e8 4c fa ff ff       	call   397 <clone>
 94b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 94e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 952:	79 1b                	jns    96f <thread_create+0xa1>
        printf(1,"clone fails\n");
 954:	c7 44 24 04 06 0c 00 	movl   $0xc06,0x4(%esp)
 95b:	00 
 95c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 963:	e8 37 fb ff ff       	call   49f <printf>
        return 0;
 968:	b8 00 00 00 00       	mov    $0x0,%eax
 96d:	eb 2a                	jmp    999 <thread_create+0xcb>
    }
    if(tid > 0){
 96f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 973:	7e 05                	jle    97a <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 975:	8b 45 f0             	mov    -0x10(%ebp),%eax
 978:	eb 1f                	jmp    999 <thread_create+0xcb>
    }
    if(tid == 0){
 97a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 97e:	75 14                	jne    994 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 980:	c7 44 24 04 13 0c 00 	movl   $0xc13,0x4(%esp)
 987:	00 
 988:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 98f:	e8 0b fb ff ff       	call   49f <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 994:	b8 00 00 00 00       	mov    $0x0,%eax
}
 999:	c9                   	leave  
 99a:	c3                   	ret    

0000099b <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 99b:	55                   	push   %ebp
 99c:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 99e:	8b 45 08             	mov    0x8(%ebp),%eax
 9a1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 9a7:	8b 45 08             	mov    0x8(%ebp),%eax
 9aa:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 9b1:	8b 45 08             	mov    0x8(%ebp),%eax
 9b4:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 9bb:	5d                   	pop    %ebp
 9bc:	c3                   	ret    

000009bd <add_q>:

void add_q(struct queue *q, int v){
 9bd:	55                   	push   %ebp
 9be:	89 e5                	mov    %esp,%ebp
 9c0:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 9c3:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 9ca:	e8 bc fd ff ff       	call   78b <malloc>
 9cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 9d2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 9dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9df:	8b 55 0c             	mov    0xc(%ebp),%edx
 9e2:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 9e4:	8b 45 08             	mov    0x8(%ebp),%eax
 9e7:	8b 40 04             	mov    0x4(%eax),%eax
 9ea:	85 c0                	test   %eax,%eax
 9ec:	75 0b                	jne    9f9 <add_q+0x3c>
        q->head = n;
 9ee:	8b 45 08             	mov    0x8(%ebp),%eax
 9f1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9f4:	89 50 04             	mov    %edx,0x4(%eax)
 9f7:	eb 0c                	jmp    a05 <add_q+0x48>
    }else{
        q->tail->next = n;
 9f9:	8b 45 08             	mov    0x8(%ebp),%eax
 9fc:	8b 40 08             	mov    0x8(%eax),%eax
 9ff:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a02:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 a05:	8b 45 08             	mov    0x8(%ebp),%eax
 a08:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a0b:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 a0e:	8b 45 08             	mov    0x8(%ebp),%eax
 a11:	8b 00                	mov    (%eax),%eax
 a13:	8d 50 01             	lea    0x1(%eax),%edx
 a16:	8b 45 08             	mov    0x8(%ebp),%eax
 a19:	89 10                	mov    %edx,(%eax)
}
 a1b:	c9                   	leave  
 a1c:	c3                   	ret    

00000a1d <empty_q>:

int empty_q(struct queue *q){
 a1d:	55                   	push   %ebp
 a1e:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 a20:	8b 45 08             	mov    0x8(%ebp),%eax
 a23:	8b 00                	mov    (%eax),%eax
 a25:	85 c0                	test   %eax,%eax
 a27:	75 07                	jne    a30 <empty_q+0x13>
        return 1;
 a29:	b8 01 00 00 00       	mov    $0x1,%eax
 a2e:	eb 05                	jmp    a35 <empty_q+0x18>
    else
        return 0;
 a30:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 a35:	5d                   	pop    %ebp
 a36:	c3                   	ret    

00000a37 <pop_q>:
int pop_q(struct queue *q){
 a37:	55                   	push   %ebp
 a38:	89 e5                	mov    %esp,%ebp
 a3a:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a3d:	8b 45 08             	mov    0x8(%ebp),%eax
 a40:	89 04 24             	mov    %eax,(%esp)
 a43:	e8 d5 ff ff ff       	call   a1d <empty_q>
 a48:	85 c0                	test   %eax,%eax
 a4a:	75 5d                	jne    aa9 <pop_q+0x72>
       val = q->head->value; 
 a4c:	8b 45 08             	mov    0x8(%ebp),%eax
 a4f:	8b 40 04             	mov    0x4(%eax),%eax
 a52:	8b 00                	mov    (%eax),%eax
 a54:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 a57:	8b 45 08             	mov    0x8(%ebp),%eax
 a5a:	8b 40 04             	mov    0x4(%eax),%eax
 a5d:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 a60:	8b 45 08             	mov    0x8(%ebp),%eax
 a63:	8b 40 04             	mov    0x4(%eax),%eax
 a66:	8b 50 04             	mov    0x4(%eax),%edx
 a69:	8b 45 08             	mov    0x8(%ebp),%eax
 a6c:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a6f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a72:	89 04 24             	mov    %eax,(%esp)
 a75:	e8 d8 fb ff ff       	call   652 <free>
       q->size--;
 a7a:	8b 45 08             	mov    0x8(%ebp),%eax
 a7d:	8b 00                	mov    (%eax),%eax
 a7f:	8d 50 ff             	lea    -0x1(%eax),%edx
 a82:	8b 45 08             	mov    0x8(%ebp),%eax
 a85:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a87:	8b 45 08             	mov    0x8(%ebp),%eax
 a8a:	8b 00                	mov    (%eax),%eax
 a8c:	85 c0                	test   %eax,%eax
 a8e:	75 14                	jne    aa4 <pop_q+0x6d>
            q->head = 0;
 a90:	8b 45 08             	mov    0x8(%ebp),%eax
 a93:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a9a:	8b 45 08             	mov    0x8(%ebp),%eax
 a9d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 aa4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa7:	eb 05                	jmp    aae <pop_q+0x77>
    }
    return -1;
 aa9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 aae:	c9                   	leave  
 aaf:	c3                   	ret    

00000ab0 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 ab6:	8b 45 08             	mov    0x8(%ebp),%eax
 ab9:	8b 55 0c             	mov    0xc(%ebp),%edx
 abc:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 abf:	8b 45 08             	mov    0x8(%ebp),%eax
 ac2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 ac9:	8b 45 08             	mov    0x8(%ebp),%eax
 acc:	89 04 24             	mov    %eax,(%esp)
 acf:	e8 b1 fd ff ff       	call   885 <lock_init>
}
 ad4:	c9                   	leave  
 ad5:	c3                   	ret    

00000ad6 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 ad6:	55                   	push   %ebp
 ad7:	89 e5                	mov    %esp,%ebp
 ad9:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 adc:	8b 45 08             	mov    0x8(%ebp),%eax
 adf:	89 04 24             	mov    %eax,(%esp)
 ae2:	e8 ac fd ff ff       	call   893 <lock_acquire>
	if(s->count  == 0){
 ae7:	8b 45 08             	mov    0x8(%ebp),%eax
 aea:	8b 40 04             	mov    0x4(%eax),%eax
 aed:	85 c0                	test   %eax,%eax
 aef:	75 2f                	jne    b20 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 af1:	e8 81 f8 ff ff       	call   377 <getpid>
 af6:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 af9:	8b 45 08             	mov    0x8(%ebp),%eax
 afc:	8d 50 0c             	lea    0xc(%eax),%edx
 aff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b02:	89 44 24 04          	mov    %eax,0x4(%esp)
 b06:	89 14 24             	mov    %edx,(%esp)
 b09:	e8 af fe ff ff       	call   9bd <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 b0e:	8b 45 08             	mov    0x8(%ebp),%eax
 b11:	89 04 24             	mov    %eax,(%esp)
 b14:	e8 9a fd ff ff       	call   8b3 <lock_release>
		tsleep(); 
 b19:	e8 89 f8 ff ff       	call   3a7 <tsleep>
 b1e:	eb 1a                	jmp    b3a <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 b20:	8b 45 08             	mov    0x8(%ebp),%eax
 b23:	8b 40 04             	mov    0x4(%eax),%eax
 b26:	8d 50 ff             	lea    -0x1(%eax),%edx
 b29:	8b 45 08             	mov    0x8(%ebp),%eax
 b2c:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b2f:	8b 45 08             	mov    0x8(%ebp),%eax
 b32:	89 04 24             	mov    %eax,(%esp)
 b35:	e8 79 fd ff ff       	call   8b3 <lock_release>
	}
}
 b3a:	c9                   	leave  
 b3b:	c3                   	ret    

00000b3c <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b3c:	55                   	push   %ebp
 b3d:	89 e5                	mov    %esp,%ebp
 b3f:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b42:	8b 45 08             	mov    0x8(%ebp),%eax
 b45:	89 04 24             	mov    %eax,(%esp)
 b48:	e8 46 fd ff ff       	call   893 <lock_acquire>
	if(s->count < s->size){
 b4d:	8b 45 08             	mov    0x8(%ebp),%eax
 b50:	8b 50 04             	mov    0x4(%eax),%edx
 b53:	8b 45 08             	mov    0x8(%ebp),%eax
 b56:	8b 40 08             	mov    0x8(%eax),%eax
 b59:	39 c2                	cmp    %eax,%edx
 b5b:	7d 0f                	jge    b6c <sem_signal+0x30>
		s->count++;	
 b5d:	8b 45 08             	mov    0x8(%ebp),%eax
 b60:	8b 40 04             	mov    0x4(%eax),%eax
 b63:	8d 50 01             	lea    0x1(%eax),%edx
 b66:	8b 45 08             	mov    0x8(%ebp),%eax
 b69:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 b6c:	8b 45 08             	mov    0x8(%ebp),%eax
 b6f:	83 c0 0c             	add    $0xc,%eax
 b72:	89 04 24             	mov    %eax,(%esp)
 b75:	e8 bd fe ff ff       	call   a37 <pop_q>
 b7a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 b7d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b81:	74 2e                	je     bb1 <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 b83:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b86:	89 04 24             	mov    %eax,(%esp)
 b89:	e8 21 f8 ff ff       	call   3af <twakeup>
		s->count--;
 b8e:	8b 45 08             	mov    0x8(%ebp),%eax
 b91:	8b 40 04             	mov    0x4(%eax),%eax
 b94:	8d 50 ff             	lea    -0x1(%eax),%edx
 b97:	8b 45 08             	mov    0x8(%ebp),%eax
 b9a:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 b9d:	8b 45 08             	mov    0x8(%ebp),%eax
 ba0:	8b 40 04             	mov    0x4(%eax),%eax
 ba3:	85 c0                	test   %eax,%eax
 ba5:	79 0a                	jns    bb1 <sem_signal+0x75>
 ba7:	8b 45 08             	mov    0x8(%ebp),%eax
 baa:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 bb1:	8b 45 08             	mov    0x8(%ebp),%eax
 bb4:	89 04 24             	mov    %eax,(%esp)
 bb7:	e8 f7 fc ff ff       	call   8b3 <lock_release>

 bbc:	c9                   	leave  
 bbd:	c3                   	ret    
