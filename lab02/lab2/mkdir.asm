
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
   f:	c7 44 24 04 e2 0b 00 	movl   $0xbe2,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 66 04 00 00       	call   489 <printf>
    exit();
  23:	e8 c0 02 00 00       	call   2e8 <exit>
  }

  for(i = 1; i < argc; i++){
  28:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  2f:	00 
  30:	eb 43                	jmp    75 <main+0x75>
    if(mkdir(argv[i]) < 0){
  32:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  36:	c1 e0 02             	shl    $0x2,%eax
  39:	03 45 0c             	add    0xc(%ebp),%eax
  3c:	8b 00                	mov    (%eax),%eax
  3e:	89 04 24             	mov    %eax,(%esp)
  41:	e8 0a 03 00 00       	call   350 <mkdir>
  46:	85 c0                	test   %eax,%eax
  48:	79 26                	jns    70 <main+0x70>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
  4a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  4e:	c1 e0 02             	shl    $0x2,%eax
  51:	03 45 0c             	add    0xc(%ebp),%eax
  54:	8b 00                	mov    (%eax),%eax
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	c7 44 24 04 f9 0b 00 	movl   $0xbf9,0x4(%esp)
  61:	00 
  62:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  69:	e8 1b 04 00 00       	call   489 <printf>
      break;
  6e:	eb 0e                	jmp    7e <main+0x7e>
  if(argc < 2){
    printf(2, "Usage: mkdir files...\n");
    exit();
  }

  for(i = 1; i < argc; i++){
  70:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  75:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  79:	3b 45 08             	cmp    0x8(%ebp),%eax
  7c:	7c b4                	jl     32 <main+0x32>
      printf(2, "mkdir: %s failed to create\n", argv[i]);
      break;
    }
  }

  exit();
  7e:	e8 65 02 00 00       	call   2e8 <exit>
  83:	90                   	nop

00000084 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  84:	55                   	push   %ebp
  85:	89 e5                	mov    %esp,%ebp
  87:	57                   	push   %edi
  88:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  89:	8b 4d 08             	mov    0x8(%ebp),%ecx
  8c:	8b 55 10             	mov    0x10(%ebp),%edx
  8f:	8b 45 0c             	mov    0xc(%ebp),%eax
  92:	89 cb                	mov    %ecx,%ebx
  94:	89 df                	mov    %ebx,%edi
  96:	89 d1                	mov    %edx,%ecx
  98:	fc                   	cld    
  99:	f3 aa                	rep stos %al,%es:(%edi)
  9b:	89 ca                	mov    %ecx,%edx
  9d:	89 fb                	mov    %edi,%ebx
  9f:	89 5d 08             	mov    %ebx,0x8(%ebp)
  a2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  a5:	5b                   	pop    %ebx
  a6:	5f                   	pop    %edi
  a7:	5d                   	pop    %ebp
  a8:	c3                   	ret    

000000a9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  a9:	55                   	push   %ebp
  aa:	89 e5                	mov    %esp,%ebp
  ac:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  af:	8b 45 08             	mov    0x8(%ebp),%eax
  b2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  b5:	8b 45 0c             	mov    0xc(%ebp),%eax
  b8:	0f b6 10             	movzbl (%eax),%edx
  bb:	8b 45 08             	mov    0x8(%ebp),%eax
  be:	88 10                	mov    %dl,(%eax)
  c0:	8b 45 08             	mov    0x8(%ebp),%eax
  c3:	0f b6 00             	movzbl (%eax),%eax
  c6:	84 c0                	test   %al,%al
  c8:	0f 95 c0             	setne  %al
  cb:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  cf:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  d3:	84 c0                	test   %al,%al
  d5:	75 de                	jne    b5 <strcpy+0xc>
    ;
  return os;
  d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  da:	c9                   	leave  
  db:	c3                   	ret    

000000dc <strcmp>:

int
strcmp(const char *p, const char *q)
{
  dc:	55                   	push   %ebp
  dd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  df:	eb 08                	jmp    e9 <strcmp+0xd>
    p++, q++;
  e1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  e5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  e9:	8b 45 08             	mov    0x8(%ebp),%eax
  ec:	0f b6 00             	movzbl (%eax),%eax
  ef:	84 c0                	test   %al,%al
  f1:	74 10                	je     103 <strcmp+0x27>
  f3:	8b 45 08             	mov    0x8(%ebp),%eax
  f6:	0f b6 10             	movzbl (%eax),%edx
  f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  fc:	0f b6 00             	movzbl (%eax),%eax
  ff:	38 c2                	cmp    %al,%dl
 101:	74 de                	je     e1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 103:	8b 45 08             	mov    0x8(%ebp),%eax
 106:	0f b6 00             	movzbl (%eax),%eax
 109:	0f b6 d0             	movzbl %al,%edx
 10c:	8b 45 0c             	mov    0xc(%ebp),%eax
 10f:	0f b6 00             	movzbl (%eax),%eax
 112:	0f b6 c0             	movzbl %al,%eax
 115:	89 d1                	mov    %edx,%ecx
 117:	29 c1                	sub    %eax,%ecx
 119:	89 c8                	mov    %ecx,%eax
}
 11b:	5d                   	pop    %ebp
 11c:	c3                   	ret    

0000011d <strlen>:

uint
strlen(char *s)
{
 11d:	55                   	push   %ebp
 11e:	89 e5                	mov    %esp,%ebp
 120:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 123:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 12a:	eb 04                	jmp    130 <strlen+0x13>
 12c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 130:	8b 45 fc             	mov    -0x4(%ebp),%eax
 133:	03 45 08             	add    0x8(%ebp),%eax
 136:	0f b6 00             	movzbl (%eax),%eax
 139:	84 c0                	test   %al,%al
 13b:	75 ef                	jne    12c <strlen+0xf>
    ;
  return n;
 13d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 140:	c9                   	leave  
 141:	c3                   	ret    

00000142 <memset>:

void*
memset(void *dst, int c, uint n)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 148:	8b 45 10             	mov    0x10(%ebp),%eax
 14b:	89 44 24 08          	mov    %eax,0x8(%esp)
 14f:	8b 45 0c             	mov    0xc(%ebp),%eax
 152:	89 44 24 04          	mov    %eax,0x4(%esp)
 156:	8b 45 08             	mov    0x8(%ebp),%eax
 159:	89 04 24             	mov    %eax,(%esp)
 15c:	e8 23 ff ff ff       	call   84 <stosb>
  return dst;
 161:	8b 45 08             	mov    0x8(%ebp),%eax
}
 164:	c9                   	leave  
 165:	c3                   	ret    

00000166 <strchr>:

char*
strchr(const char *s, char c)
{
 166:	55                   	push   %ebp
 167:	89 e5                	mov    %esp,%ebp
 169:	83 ec 04             	sub    $0x4,%esp
 16c:	8b 45 0c             	mov    0xc(%ebp),%eax
 16f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 172:	eb 14                	jmp    188 <strchr+0x22>
    if(*s == c)
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 17d:	75 05                	jne    184 <strchr+0x1e>
      return (char*)s;
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	eb 13                	jmp    197 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 184:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 188:	8b 45 08             	mov    0x8(%ebp),%eax
 18b:	0f b6 00             	movzbl (%eax),%eax
 18e:	84 c0                	test   %al,%al
 190:	75 e2                	jne    174 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 192:	b8 00 00 00 00       	mov    $0x0,%eax
}
 197:	c9                   	leave  
 198:	c3                   	ret    

00000199 <gets>:

char*
gets(char *buf, int max)
{
 199:	55                   	push   %ebp
 19a:	89 e5                	mov    %esp,%ebp
 19c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 19f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1a6:	eb 44                	jmp    1ec <gets+0x53>
    cc = read(0, &c, 1);
 1a8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1af:	00 
 1b0:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 1b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1be:	e8 3d 01 00 00       	call   300 <read>
 1c3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 1c6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1ca:	7e 2d                	jle    1f9 <gets+0x60>
      break;
    buf[i++] = c;
 1cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1cf:	03 45 08             	add    0x8(%ebp),%eax
 1d2:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1d6:	88 10                	mov    %dl,(%eax)
 1d8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 1dc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e0:	3c 0a                	cmp    $0xa,%al
 1e2:	74 16                	je     1fa <gets+0x61>
 1e4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e8:	3c 0d                	cmp    $0xd,%al
 1ea:	74 0e                	je     1fa <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1ef:	83 c0 01             	add    $0x1,%eax
 1f2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1f5:	7c b1                	jl     1a8 <gets+0xf>
 1f7:	eb 01                	jmp    1fa <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 1f9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 1fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1fd:	03 45 08             	add    0x8(%ebp),%eax
 200:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 203:	8b 45 08             	mov    0x8(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <stat>:

int
stat(char *n, struct stat *st)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
 20b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 20e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 215:	00 
 216:	8b 45 08             	mov    0x8(%ebp),%eax
 219:	89 04 24             	mov    %eax,(%esp)
 21c:	e8 07 01 00 00       	call   328 <open>
 221:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 224:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 228:	79 07                	jns    231 <stat+0x29>
    return -1;
 22a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 22f:	eb 23                	jmp    254 <stat+0x4c>
  r = fstat(fd, st);
 231:	8b 45 0c             	mov    0xc(%ebp),%eax
 234:	89 44 24 04          	mov    %eax,0x4(%esp)
 238:	8b 45 f0             	mov    -0x10(%ebp),%eax
 23b:	89 04 24             	mov    %eax,(%esp)
 23e:	e8 fd 00 00 00       	call   340 <fstat>
 243:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 246:	8b 45 f0             	mov    -0x10(%ebp),%eax
 249:	89 04 24             	mov    %eax,(%esp)
 24c:	e8 bf 00 00 00       	call   310 <close>
  return r;
 251:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 254:	c9                   	leave  
 255:	c3                   	ret    

00000256 <atoi>:

int
atoi(const char *s)
{
 256:	55                   	push   %ebp
 257:	89 e5                	mov    %esp,%ebp
 259:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 25c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 263:	eb 24                	jmp    289 <atoi+0x33>
    n = n*10 + *s++ - '0';
 265:	8b 55 fc             	mov    -0x4(%ebp),%edx
 268:	89 d0                	mov    %edx,%eax
 26a:	c1 e0 02             	shl    $0x2,%eax
 26d:	01 d0                	add    %edx,%eax
 26f:	01 c0                	add    %eax,%eax
 271:	89 c2                	mov    %eax,%edx
 273:	8b 45 08             	mov    0x8(%ebp),%eax
 276:	0f b6 00             	movzbl (%eax),%eax
 279:	0f be c0             	movsbl %al,%eax
 27c:	8d 04 02             	lea    (%edx,%eax,1),%eax
 27f:	83 e8 30             	sub    $0x30,%eax
 282:	89 45 fc             	mov    %eax,-0x4(%ebp)
 285:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 289:	8b 45 08             	mov    0x8(%ebp),%eax
 28c:	0f b6 00             	movzbl (%eax),%eax
 28f:	3c 2f                	cmp    $0x2f,%al
 291:	7e 0a                	jle    29d <atoi+0x47>
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	0f b6 00             	movzbl (%eax),%eax
 299:	3c 39                	cmp    $0x39,%al
 29b:	7e c8                	jle    265 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 29d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a0:	c9                   	leave  
 2a1:	c3                   	ret    

000002a2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 2ae:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 2b4:	eb 13                	jmp    2c9 <memmove+0x27>
    *dst++ = *src++;
 2b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2b9:	0f b6 10             	movzbl (%eax),%edx
 2bc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2bf:	88 10                	mov    %dl,(%eax)
 2c1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 2c5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2c9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2cd:	0f 9f c0             	setg   %al
 2d0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2d4:	84 c0                	test   %al,%al
 2d6:	75 de                	jne    2b6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2d8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2db:	c9                   	leave  
 2dc:	c3                   	ret    
 2dd:	90                   	nop
 2de:	90                   	nop
 2df:	90                   	nop

000002e0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2e0:	b8 01 00 00 00       	mov    $0x1,%eax
 2e5:	cd 40                	int    $0x40
 2e7:	c3                   	ret    

000002e8 <exit>:
SYSCALL(exit)
 2e8:	b8 02 00 00 00       	mov    $0x2,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <wait>:
SYSCALL(wait)
 2f0:	b8 03 00 00 00       	mov    $0x3,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <pipe>:
SYSCALL(pipe)
 2f8:	b8 04 00 00 00       	mov    $0x4,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <read>:
SYSCALL(read)
 300:	b8 05 00 00 00       	mov    $0x5,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <write>:
SYSCALL(write)
 308:	b8 10 00 00 00       	mov    $0x10,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <close>:
SYSCALL(close)
 310:	b8 15 00 00 00       	mov    $0x15,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <kill>:
SYSCALL(kill)
 318:	b8 06 00 00 00       	mov    $0x6,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <exec>:
SYSCALL(exec)
 320:	b8 07 00 00 00       	mov    $0x7,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <open>:
SYSCALL(open)
 328:	b8 0f 00 00 00       	mov    $0xf,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <mknod>:
SYSCALL(mknod)
 330:	b8 11 00 00 00       	mov    $0x11,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <unlink>:
SYSCALL(unlink)
 338:	b8 12 00 00 00       	mov    $0x12,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <fstat>:
SYSCALL(fstat)
 340:	b8 08 00 00 00       	mov    $0x8,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <link>:
SYSCALL(link)
 348:	b8 13 00 00 00       	mov    $0x13,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <mkdir>:
SYSCALL(mkdir)
 350:	b8 14 00 00 00       	mov    $0x14,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <chdir>:
SYSCALL(chdir)
 358:	b8 09 00 00 00       	mov    $0x9,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <dup>:
SYSCALL(dup)
 360:	b8 0a 00 00 00       	mov    $0xa,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <getpid>:
SYSCALL(getpid)
 368:	b8 0b 00 00 00       	mov    $0xb,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <sbrk>:
SYSCALL(sbrk)
 370:	b8 0c 00 00 00       	mov    $0xc,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <sleep>:
SYSCALL(sleep)
 378:	b8 0d 00 00 00       	mov    $0xd,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <uptime>:
SYSCALL(uptime)
 380:	b8 0e 00 00 00       	mov    $0xe,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <clone>:
SYSCALL(clone)
 388:	b8 16 00 00 00       	mov    $0x16,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <texit>:
SYSCALL(texit)
 390:	b8 17 00 00 00       	mov    $0x17,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <tsleep>:
SYSCALL(tsleep)
 398:	b8 18 00 00 00       	mov    $0x18,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <twakeup>:
SYSCALL(twakeup)
 3a0:	b8 19 00 00 00       	mov    $0x19,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <test>:
SYSCALL(test)
 3a8:	b8 1a 00 00 00       	mov    $0x1a,%eax
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
 3d1:	e8 32 ff ff ff       	call   308 <write>
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
 422:	0f b6 80 60 0c 00 00 	movzbl 0xc60(%eax),%eax
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
 582:	c7 45 e4 15 0c 00 00 	movl   $0xc15,-0x1c(%ebp)
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
 64f:	a1 7c 0c 00 00       	mov    0xc7c,%eax
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
 710:	a3 7c 0c 00 00       	mov    %eax,0xc7c
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
 736:	e8 35 fc ff ff       	call   370 <sbrk>
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
 768:	a1 7c 0c 00 00       	mov    0xc7c,%eax
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
 784:	a1 7c 0c 00 00       	mov    0xc7c,%eax
 789:	89 45 f0             	mov    %eax,-0x10(%ebp)
 78c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 790:	75 23                	jne    7b5 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 792:	c7 45 f0 74 0c 00 00 	movl   $0xc74,-0x10(%ebp)
 799:	8b 45 f0             	mov    -0x10(%ebp),%eax
 79c:	a3 7c 0c 00 00       	mov    %eax,0xc7c
 7a1:	a1 7c 0c 00 00       	mov    0xc7c,%eax
 7a6:	a3 74 0c 00 00       	mov    %eax,0xc74
    base.s.size = 0;
 7ab:	c7 05 78 0c 00 00 00 	movl   $0x0,0xc78
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
 808:	a3 7c 0c 00 00       	mov    %eax,0xc7c
      return (void*)(p + 1);
 80d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 810:	83 c0 08             	add    $0x8,%eax
 813:	eb 38                	jmp    84d <malloc+0xde>
    }
    if(p == freep)
 815:	a1 7c 0c 00 00       	mov    0xc7c,%eax
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
 84f:	90                   	nop

00000850 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 850:	55                   	push   %ebp
 851:	89 e5                	mov    %esp,%ebp
 853:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 856:	8b 55 08             	mov    0x8(%ebp),%edx
 859:	8b 45 0c             	mov    0xc(%ebp),%eax
 85c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 85f:	f0 87 02             	lock xchg %eax,(%edx)
 862:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 865:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 868:	c9                   	leave  
 869:	c3                   	ret    

0000086a <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 86a:	55                   	push   %ebp
 86b:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 86d:	8b 45 08             	mov    0x8(%ebp),%eax
 870:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 876:	5d                   	pop    %ebp
 877:	c3                   	ret    

00000878 <lock_acquire>:
void lock_acquire(lock_t *lock){
 878:	55                   	push   %ebp
 879:	89 e5                	mov    %esp,%ebp
 87b:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 87e:	8b 45 08             	mov    0x8(%ebp),%eax
 881:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 888:	00 
 889:	89 04 24             	mov    %eax,(%esp)
 88c:	e8 bf ff ff ff       	call   850 <xchg>
 891:	85 c0                	test   %eax,%eax
 893:	75 e9                	jne    87e <lock_acquire+0x6>
}
 895:	c9                   	leave  
 896:	c3                   	ret    

00000897 <lock_release>:
void lock_release(lock_t *lock){
 897:	55                   	push   %ebp
 898:	89 e5                	mov    %esp,%ebp
 89a:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 89d:	8b 45 08             	mov    0x8(%ebp),%eax
 8a0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8a7:	00 
 8a8:	89 04 24             	mov    %eax,(%esp)
 8ab:	e8 a0 ff ff ff       	call   850 <xchg>
}
 8b0:	c9                   	leave  
 8b1:	c3                   	ret    

000008b2 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 8b2:	55                   	push   %ebp
 8b3:	89 e5                	mov    %esp,%ebp
 8b5:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 8b8:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8bf:	e8 ab fe ff ff       	call   76f <malloc>
 8c4:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 8c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 8cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d0:	25 ff 0f 00 00       	and    $0xfff,%eax
 8d5:	85 c0                	test   %eax,%eax
 8d7:	74 15                	je     8ee <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 8d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dc:	89 c2                	mov    %eax,%edx
 8de:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 8e4:	b8 00 10 00 00       	mov    $0x1000,%eax
 8e9:	29 d0                	sub    %edx,%eax
 8eb:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 8ee:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8f2:	75 1b                	jne    90f <thread_create+0x5d>

        printf(1,"malloc fail \n");
 8f4:	c7 44 24 04 1c 0c 00 	movl   $0xc1c,0x4(%esp)
 8fb:	00 
 8fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 903:	e8 81 fb ff ff       	call   489 <printf>
        return 0;
 908:	b8 00 00 00 00       	mov    $0x0,%eax
 90d:	eb 6f                	jmp    97e <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 90f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 912:	8b 55 08             	mov    0x8(%ebp),%edx
 915:	8b 45 f0             	mov    -0x10(%ebp),%eax
 918:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 91c:	89 54 24 08          	mov    %edx,0x8(%esp)
 920:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 927:	00 
 928:	89 04 24             	mov    %eax,(%esp)
 92b:	e8 58 fa ff ff       	call   388 <clone>
 930:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 933:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 937:	79 1b                	jns    954 <thread_create+0xa2>
        printf(1,"clone fails\n");
 939:	c7 44 24 04 2a 0c 00 	movl   $0xc2a,0x4(%esp)
 940:	00 
 941:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 948:	e8 3c fb ff ff       	call   489 <printf>
        return 0;
 94d:	b8 00 00 00 00       	mov    $0x0,%eax
 952:	eb 2a                	jmp    97e <thread_create+0xcc>
    }
    if(tid > 0){
 954:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 958:	7e 05                	jle    95f <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 95a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 95d:	eb 1f                	jmp    97e <thread_create+0xcc>
    }
    if(tid == 0){
 95f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 963:	75 14                	jne    979 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 965:	c7 44 24 04 37 0c 00 	movl   $0xc37,0x4(%esp)
 96c:	00 
 96d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 974:	e8 10 fb ff ff       	call   489 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 979:	b8 00 00 00 00       	mov    $0x0,%eax
}
 97e:	c9                   	leave  
 97f:	c3                   	ret    

00000980 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 980:	55                   	push   %ebp
 981:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 983:	8b 45 08             	mov    0x8(%ebp),%eax
 986:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 98c:	8b 45 08             	mov    0x8(%ebp),%eax
 98f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 996:	8b 45 08             	mov    0x8(%ebp),%eax
 999:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 9a0:	5d                   	pop    %ebp
 9a1:	c3                   	ret    

000009a2 <add_q>:

void add_q(struct queue *q, int v){
 9a2:	55                   	push   %ebp
 9a3:	89 e5                	mov    %esp,%ebp
 9a5:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 9a8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 9af:	e8 bb fd ff ff       	call   76f <malloc>
 9b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 9b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ba:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 9c1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c4:	8b 55 0c             	mov    0xc(%ebp),%edx
 9c7:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 9c9:	8b 45 08             	mov    0x8(%ebp),%eax
 9cc:	8b 40 04             	mov    0x4(%eax),%eax
 9cf:	85 c0                	test   %eax,%eax
 9d1:	75 0b                	jne    9de <add_q+0x3c>
        q->head = n;
 9d3:	8b 45 08             	mov    0x8(%ebp),%eax
 9d6:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9d9:	89 50 04             	mov    %edx,0x4(%eax)
 9dc:	eb 0c                	jmp    9ea <add_q+0x48>
    }else{
        q->tail->next = n;
 9de:	8b 45 08             	mov    0x8(%ebp),%eax
 9e1:	8b 40 08             	mov    0x8(%eax),%eax
 9e4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9e7:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 9ea:	8b 45 08             	mov    0x8(%ebp),%eax
 9ed:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9f0:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 9f3:	8b 45 08             	mov    0x8(%ebp),%eax
 9f6:	8b 00                	mov    (%eax),%eax
 9f8:	8d 50 01             	lea    0x1(%eax),%edx
 9fb:	8b 45 08             	mov    0x8(%ebp),%eax
 9fe:	89 10                	mov    %edx,(%eax)
}
 a00:	c9                   	leave  
 a01:	c3                   	ret    

00000a02 <empty_q>:

int empty_q(struct queue *q){
 a02:	55                   	push   %ebp
 a03:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 a05:	8b 45 08             	mov    0x8(%ebp),%eax
 a08:	8b 00                	mov    (%eax),%eax
 a0a:	85 c0                	test   %eax,%eax
 a0c:	75 07                	jne    a15 <empty_q+0x13>
        return 1;
 a0e:	b8 01 00 00 00       	mov    $0x1,%eax
 a13:	eb 05                	jmp    a1a <empty_q+0x18>
    else
        return 0;
 a15:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 a1a:	5d                   	pop    %ebp
 a1b:	c3                   	ret    

00000a1c <pop_q>:
int pop_q(struct queue *q){
 a1c:	55                   	push   %ebp
 a1d:	89 e5                	mov    %esp,%ebp
 a1f:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a22:	8b 45 08             	mov    0x8(%ebp),%eax
 a25:	89 04 24             	mov    %eax,(%esp)
 a28:	e8 d5 ff ff ff       	call   a02 <empty_q>
 a2d:	85 c0                	test   %eax,%eax
 a2f:	75 5d                	jne    a8e <pop_q+0x72>
       val = q->head->value; 
 a31:	8b 45 08             	mov    0x8(%ebp),%eax
 a34:	8b 40 04             	mov    0x4(%eax),%eax
 a37:	8b 00                	mov    (%eax),%eax
 a39:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 a3c:	8b 45 08             	mov    0x8(%ebp),%eax
 a3f:	8b 40 04             	mov    0x4(%eax),%eax
 a42:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 a45:	8b 45 08             	mov    0x8(%ebp),%eax
 a48:	8b 40 04             	mov    0x4(%eax),%eax
 a4b:	8b 50 04             	mov    0x4(%eax),%edx
 a4e:	8b 45 08             	mov    0x8(%ebp),%eax
 a51:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a54:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a57:	89 04 24             	mov    %eax,(%esp)
 a5a:	e8 e1 fb ff ff       	call   640 <free>
       q->size--;
 a5f:	8b 45 08             	mov    0x8(%ebp),%eax
 a62:	8b 00                	mov    (%eax),%eax
 a64:	8d 50 ff             	lea    -0x1(%eax),%edx
 a67:	8b 45 08             	mov    0x8(%ebp),%eax
 a6a:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a6c:	8b 45 08             	mov    0x8(%ebp),%eax
 a6f:	8b 00                	mov    (%eax),%eax
 a71:	85 c0                	test   %eax,%eax
 a73:	75 14                	jne    a89 <pop_q+0x6d>
            q->head = 0;
 a75:	8b 45 08             	mov    0x8(%ebp),%eax
 a78:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a7f:	8b 45 08             	mov    0x8(%ebp),%eax
 a82:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a89:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a8c:	eb 05                	jmp    a93 <pop_q+0x77>
    }
    return -1;
 a8e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a93:	c9                   	leave  
 a94:	c3                   	ret    
 a95:	90                   	nop
 a96:	90                   	nop
 a97:	90                   	nop

00000a98 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 a98:	55                   	push   %ebp
 a99:	89 e5                	mov    %esp,%ebp
 a9b:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 a9e:	8b 45 08             	mov    0x8(%ebp),%eax
 aa1:	8b 55 0c             	mov    0xc(%ebp),%edx
 aa4:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 aa7:	8b 45 08             	mov    0x8(%ebp),%eax
 aaa:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 ab1:	8b 45 08             	mov    0x8(%ebp),%eax
 ab4:	89 04 24             	mov    %eax,(%esp)
 ab7:	e8 ae fd ff ff       	call   86a <lock_init>
}
 abc:	c9                   	leave  
 abd:	c3                   	ret    

00000abe <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 abe:	55                   	push   %ebp
 abf:	89 e5                	mov    %esp,%ebp
 ac1:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 ac4:	8b 45 08             	mov    0x8(%ebp),%eax
 ac7:	89 04 24             	mov    %eax,(%esp)
 aca:	e8 a9 fd ff ff       	call   878 <lock_acquire>
	if(s->count  == 0){
 acf:	8b 45 08             	mov    0x8(%ebp),%eax
 ad2:	8b 40 04             	mov    0x4(%eax),%eax
 ad5:	85 c0                	test   %eax,%eax
 ad7:	75 43                	jne    b1c <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 ad9:	c7 44 24 04 48 0c 00 	movl   $0xc48,0x4(%esp)
 ae0:	00 
 ae1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ae8:	e8 9c f9 ff ff       	call   489 <printf>
		//add proc to waiters list
		int tid = getpid();
 aed:	e8 76 f8 ff ff       	call   368 <getpid>
 af2:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 af5:	8b 45 08             	mov    0x8(%ebp),%eax
 af8:	8d 50 0c             	lea    0xc(%eax),%edx
 afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 afe:	89 44 24 04          	mov    %eax,0x4(%esp)
 b02:	89 14 24             	mov    %edx,(%esp)
 b05:	e8 98 fe ff ff       	call   9a2 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 b0a:	8b 45 08             	mov    0x8(%ebp),%eax
 b0d:	89 04 24             	mov    %eax,(%esp)
 b10:	e8 82 fd ff ff       	call   897 <lock_release>
		tsleep(); 
 b15:	e8 7e f8 ff ff       	call   398 <tsleep>
 b1a:	eb 2e                	jmp    b4a <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 b1c:	c7 44 24 04 4f 0c 00 	movl   $0xc4f,0x4(%esp)
 b23:	00 
 b24:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b2b:	e8 59 f9 ff ff       	call   489 <printf>
		s->count--;	
 b30:	8b 45 08             	mov    0x8(%ebp),%eax
 b33:	8b 40 04             	mov    0x4(%eax),%eax
 b36:	8d 50 ff             	lea    -0x1(%eax),%edx
 b39:	8b 45 08             	mov    0x8(%ebp),%eax
 b3c:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b3f:	8b 45 08             	mov    0x8(%ebp),%eax
 b42:	89 04 24             	mov    %eax,(%esp)
 b45:	e8 4d fd ff ff       	call   897 <lock_release>
	}
}
 b4a:	c9                   	leave  
 b4b:	c3                   	ret    

00000b4c <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b4c:	55                   	push   %ebp
 b4d:	89 e5                	mov    %esp,%ebp
 b4f:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 b52:	c7 44 24 04 56 0c 00 	movl   $0xc56,0x4(%esp)
 b59:	00 
 b5a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b61:	e8 23 f9 ff ff       	call   489 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b66:	8b 45 08             	mov    0x8(%ebp),%eax
 b69:	89 04 24             	mov    %eax,(%esp)
 b6c:	e8 07 fd ff ff       	call   878 <lock_acquire>
	if(s->count < s->size){
 b71:	8b 45 08             	mov    0x8(%ebp),%eax
 b74:	8b 50 04             	mov    0x4(%eax),%edx
 b77:	8b 45 08             	mov    0x8(%ebp),%eax
 b7a:	8b 40 08             	mov    0x8(%eax),%eax
 b7d:	39 c2                	cmp    %eax,%edx
 b7f:	7d 0f                	jge    b90 <sem_signal+0x44>
		s->count++;	
 b81:	8b 45 08             	mov    0x8(%ebp),%eax
 b84:	8b 40 04             	mov    0x4(%eax),%eax
 b87:	8d 50 01             	lea    0x1(%eax),%edx
 b8a:	8b 45 08             	mov    0x8(%ebp),%eax
 b8d:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 b90:	8b 45 08             	mov    0x8(%ebp),%eax
 b93:	83 c0 0c             	add    $0xc,%eax
 b96:	89 04 24             	mov    %eax,(%esp)
 b99:	e8 7e fe ff ff       	call   a1c <pop_q>
 b9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 ba1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 ba5:	74 2e                	je     bd5 <sem_signal+0x89>
		printf(1, "Sem A\n");
 ba7:	c7 44 24 04 4f 0c 00 	movl   $0xc4f,0x4(%esp)
 bae:	00 
 baf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bb6:	e8 ce f8 ff ff       	call   489 <printf>
		twakeup(tid);
 bbb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bbe:	89 04 24             	mov    %eax,(%esp)
 bc1:	e8 da f7 ff ff       	call   3a0 <twakeup>
		s->count--;
 bc6:	8b 45 08             	mov    0x8(%ebp),%eax
 bc9:	8b 40 04             	mov    0x4(%eax),%eax
 bcc:	8d 50 ff             	lea    -0x1(%eax),%edx
 bcf:	8b 45 08             	mov    0x8(%ebp),%eax
 bd2:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 bd5:	8b 45 08             	mov    0x8(%ebp),%eax
 bd8:	89 04 24             	mov    %eax,(%esp)
 bdb:	e8 b7 fc ff ff       	call   897 <lock_release>

 be0:	c9                   	leave  
 be1:	c3                   	ret    
