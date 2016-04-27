
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
   f:	c7 44 24 04 69 09 00 	movl   $0x969,0x4(%esp)
  16:	00 
  17:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  1e:	e8 4e 04 00 00       	call   471 <printf>
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
  5a:	c7 44 24 04 80 09 00 	movl   $0x980,0x4(%esp)
  61:	00 
  62:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  69:	e8 03 04 00 00       	call   471 <printf>
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

00000398 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 398:	55                   	push   %ebp
 399:	89 e5                	mov    %esp,%ebp
 39b:	83 ec 28             	sub    $0x28,%esp
 39e:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3a4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3ab:	00 
 3ac:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3af:	89 44 24 04          	mov    %eax,0x4(%esp)
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	89 04 24             	mov    %eax,(%esp)
 3b9:	e8 4a ff ff ff       	call   308 <write>
}
 3be:	c9                   	leave  
 3bf:	c3                   	ret    

000003c0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	53                   	push   %ebx
 3c4:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3c7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3ce:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3d2:	74 17                	je     3eb <printint+0x2b>
 3d4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3d8:	79 11                	jns    3eb <printint+0x2b>
    neg = 1;
 3da:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 3e1:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e4:	f7 d8                	neg    %eax
 3e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 3e9:	eb 06                	jmp    3f1 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 3eb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 3f1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 3f8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 3fb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 3fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 401:	ba 00 00 00 00       	mov    $0x0,%edx
 406:	f7 f3                	div    %ebx
 408:	89 d0                	mov    %edx,%eax
 40a:	0f b6 80 d0 09 00 00 	movzbl 0x9d0(%eax),%eax
 411:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 415:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 419:	8b 45 10             	mov    0x10(%ebp),%eax
 41c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 41f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 422:	ba 00 00 00 00       	mov    $0x0,%edx
 427:	f7 75 d4             	divl   -0x2c(%ebp)
 42a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 42d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 431:	75 c5                	jne    3f8 <printint+0x38>
  if(neg)
 433:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 437:	74 28                	je     461 <printint+0xa1>
    buf[i++] = '-';
 439:	8b 45 ec             	mov    -0x14(%ebp),%eax
 43c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 441:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 445:	eb 1a                	jmp    461 <printint+0xa1>
    putc(fd, buf[i]);
 447:	8b 45 ec             	mov    -0x14(%ebp),%eax
 44a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 44f:	0f be c0             	movsbl %al,%eax
 452:	89 44 24 04          	mov    %eax,0x4(%esp)
 456:	8b 45 08             	mov    0x8(%ebp),%eax
 459:	89 04 24             	mov    %eax,(%esp)
 45c:	e8 37 ff ff ff       	call   398 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 461:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 465:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 469:	79 dc                	jns    447 <printint+0x87>
    putc(fd, buf[i]);
}
 46b:	83 c4 44             	add    $0x44,%esp
 46e:	5b                   	pop    %ebx
 46f:	5d                   	pop    %ebp
 470:	c3                   	ret    

00000471 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 471:	55                   	push   %ebp
 472:	89 e5                	mov    %esp,%ebp
 474:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 477:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 47e:	8d 45 0c             	lea    0xc(%ebp),%eax
 481:	83 c0 04             	add    $0x4,%eax
 484:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 487:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 48e:	e9 7e 01 00 00       	jmp    611 <printf+0x1a0>
    c = fmt[i] & 0xff;
 493:	8b 55 0c             	mov    0xc(%ebp),%edx
 496:	8b 45 ec             	mov    -0x14(%ebp),%eax
 499:	8d 04 02             	lea    (%edx,%eax,1),%eax
 49c:	0f b6 00             	movzbl (%eax),%eax
 49f:	0f be c0             	movsbl %al,%eax
 4a2:	25 ff 00 00 00       	and    $0xff,%eax
 4a7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 4aa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ae:	75 2c                	jne    4dc <printf+0x6b>
      if(c == '%'){
 4b0:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 4b4:	75 0c                	jne    4c2 <printf+0x51>
        state = '%';
 4b6:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 4bd:	e9 4b 01 00 00       	jmp    60d <printf+0x19c>
      } else {
        putc(fd, c);
 4c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4c5:	0f be c0             	movsbl %al,%eax
 4c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4cc:	8b 45 08             	mov    0x8(%ebp),%eax
 4cf:	89 04 24             	mov    %eax,(%esp)
 4d2:	e8 c1 fe ff ff       	call   398 <putc>
 4d7:	e9 31 01 00 00       	jmp    60d <printf+0x19c>
      }
    } else if(state == '%'){
 4dc:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 4e0:	0f 85 27 01 00 00    	jne    60d <printf+0x19c>
      if(c == 'd'){
 4e6:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 4ea:	75 2d                	jne    519 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 4ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ef:	8b 00                	mov    (%eax),%eax
 4f1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 4f8:	00 
 4f9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 500:	00 
 501:	89 44 24 04          	mov    %eax,0x4(%esp)
 505:	8b 45 08             	mov    0x8(%ebp),%eax
 508:	89 04 24             	mov    %eax,(%esp)
 50b:	e8 b0 fe ff ff       	call   3c0 <printint>
        ap++;
 510:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 514:	e9 ed 00 00 00       	jmp    606 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 519:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 51d:	74 06                	je     525 <printf+0xb4>
 51f:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 523:	75 2d                	jne    552 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 525:	8b 45 f4             	mov    -0xc(%ebp),%eax
 528:	8b 00                	mov    (%eax),%eax
 52a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 531:	00 
 532:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 539:	00 
 53a:	89 44 24 04          	mov    %eax,0x4(%esp)
 53e:	8b 45 08             	mov    0x8(%ebp),%eax
 541:	89 04 24             	mov    %eax,(%esp)
 544:	e8 77 fe ff ff       	call   3c0 <printint>
        ap++;
 549:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 54d:	e9 b4 00 00 00       	jmp    606 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 552:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 556:	75 46                	jne    59e <printf+0x12d>
        s = (char*)*ap;
 558:	8b 45 f4             	mov    -0xc(%ebp),%eax
 55b:	8b 00                	mov    (%eax),%eax
 55d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 560:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 564:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 568:	75 27                	jne    591 <printf+0x120>
          s = "(null)";
 56a:	c7 45 e4 9c 09 00 00 	movl   $0x99c,-0x1c(%ebp)
        while(*s != 0){
 571:	eb 1f                	jmp    592 <printf+0x121>
          putc(fd, *s);
 573:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 576:	0f b6 00             	movzbl (%eax),%eax
 579:	0f be c0             	movsbl %al,%eax
 57c:	89 44 24 04          	mov    %eax,0x4(%esp)
 580:	8b 45 08             	mov    0x8(%ebp),%eax
 583:	89 04 24             	mov    %eax,(%esp)
 586:	e8 0d fe ff ff       	call   398 <putc>
          s++;
 58b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 58f:	eb 01                	jmp    592 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 591:	90                   	nop
 592:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 595:	0f b6 00             	movzbl (%eax),%eax
 598:	84 c0                	test   %al,%al
 59a:	75 d7                	jne    573 <printf+0x102>
 59c:	eb 68                	jmp    606 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 59e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 5a2:	75 1d                	jne    5c1 <printf+0x150>
        putc(fd, *ap);
 5a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a7:	8b 00                	mov    (%eax),%eax
 5a9:	0f be c0             	movsbl %al,%eax
 5ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b0:	8b 45 08             	mov    0x8(%ebp),%eax
 5b3:	89 04 24             	mov    %eax,(%esp)
 5b6:	e8 dd fd ff ff       	call   398 <putc>
        ap++;
 5bb:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5bf:	eb 45                	jmp    606 <printf+0x195>
      } else if(c == '%'){
 5c1:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5c5:	75 17                	jne    5de <printf+0x16d>
        putc(fd, c);
 5c7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ca:	0f be c0             	movsbl %al,%eax
 5cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d1:	8b 45 08             	mov    0x8(%ebp),%eax
 5d4:	89 04 24             	mov    %eax,(%esp)
 5d7:	e8 bc fd ff ff       	call   398 <putc>
 5dc:	eb 28                	jmp    606 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5de:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 5e5:	00 
 5e6:	8b 45 08             	mov    0x8(%ebp),%eax
 5e9:	89 04 24             	mov    %eax,(%esp)
 5ec:	e8 a7 fd ff ff       	call   398 <putc>
        putc(fd, c);
 5f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f4:	0f be c0             	movsbl %al,%eax
 5f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fb:	8b 45 08             	mov    0x8(%ebp),%eax
 5fe:	89 04 24             	mov    %eax,(%esp)
 601:	e8 92 fd ff ff       	call   398 <putc>
      }
      state = 0;
 606:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 60d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 611:	8b 55 0c             	mov    0xc(%ebp),%edx
 614:	8b 45 ec             	mov    -0x14(%ebp),%eax
 617:	8d 04 02             	lea    (%edx,%eax,1),%eax
 61a:	0f b6 00             	movzbl (%eax),%eax
 61d:	84 c0                	test   %al,%al
 61f:	0f 85 6e fe ff ff    	jne    493 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 625:	c9                   	leave  
 626:	c3                   	ret    
 627:	90                   	nop

00000628 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 628:	55                   	push   %ebp
 629:	89 e5                	mov    %esp,%ebp
 62b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 62e:	8b 45 08             	mov    0x8(%ebp),%eax
 631:	83 e8 08             	sub    $0x8,%eax
 634:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 637:	a1 ec 09 00 00       	mov    0x9ec,%eax
 63c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 63f:	eb 24                	jmp    665 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 641:	8b 45 fc             	mov    -0x4(%ebp),%eax
 644:	8b 00                	mov    (%eax),%eax
 646:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 649:	77 12                	ja     65d <free+0x35>
 64b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 64e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 651:	77 24                	ja     677 <free+0x4f>
 653:	8b 45 fc             	mov    -0x4(%ebp),%eax
 656:	8b 00                	mov    (%eax),%eax
 658:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 65b:	77 1a                	ja     677 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 660:	8b 00                	mov    (%eax),%eax
 662:	89 45 fc             	mov    %eax,-0x4(%ebp)
 665:	8b 45 f8             	mov    -0x8(%ebp),%eax
 668:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 66b:	76 d4                	jbe    641 <free+0x19>
 66d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 670:	8b 00                	mov    (%eax),%eax
 672:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 675:	76 ca                	jbe    641 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 677:	8b 45 f8             	mov    -0x8(%ebp),%eax
 67a:	8b 40 04             	mov    0x4(%eax),%eax
 67d:	c1 e0 03             	shl    $0x3,%eax
 680:	89 c2                	mov    %eax,%edx
 682:	03 55 f8             	add    -0x8(%ebp),%edx
 685:	8b 45 fc             	mov    -0x4(%ebp),%eax
 688:	8b 00                	mov    (%eax),%eax
 68a:	39 c2                	cmp    %eax,%edx
 68c:	75 24                	jne    6b2 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 68e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 691:	8b 50 04             	mov    0x4(%eax),%edx
 694:	8b 45 fc             	mov    -0x4(%ebp),%eax
 697:	8b 00                	mov    (%eax),%eax
 699:	8b 40 04             	mov    0x4(%eax),%eax
 69c:	01 c2                	add    %eax,%edx
 69e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6a1:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a7:	8b 00                	mov    (%eax),%eax
 6a9:	8b 10                	mov    (%eax),%edx
 6ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ae:	89 10                	mov    %edx,(%eax)
 6b0:	eb 0a                	jmp    6bc <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 6b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b5:	8b 10                	mov    (%eax),%edx
 6b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ba:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bf:	8b 40 04             	mov    0x4(%eax),%eax
 6c2:	c1 e0 03             	shl    $0x3,%eax
 6c5:	03 45 fc             	add    -0x4(%ebp),%eax
 6c8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6cb:	75 20                	jne    6ed <free+0xc5>
    p->s.size += bp->s.size;
 6cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d0:	8b 50 04             	mov    0x4(%eax),%edx
 6d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d6:	8b 40 04             	mov    0x4(%eax),%eax
 6d9:	01 c2                	add    %eax,%edx
 6db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6de:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 6e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e4:	8b 10                	mov    (%eax),%edx
 6e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e9:	89 10                	mov    %edx,(%eax)
 6eb:	eb 08                	jmp    6f5 <free+0xcd>
  } else
    p->s.ptr = bp;
 6ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 6f3:	89 10                	mov    %edx,(%eax)
  freep = p;
 6f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f8:	a3 ec 09 00 00       	mov    %eax,0x9ec
}
 6fd:	c9                   	leave  
 6fe:	c3                   	ret    

000006ff <morecore>:

static Header*
morecore(uint nu)
{
 6ff:	55                   	push   %ebp
 700:	89 e5                	mov    %esp,%ebp
 702:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 705:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 70c:	77 07                	ja     715 <morecore+0x16>
    nu = 4096;
 70e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 715:	8b 45 08             	mov    0x8(%ebp),%eax
 718:	c1 e0 03             	shl    $0x3,%eax
 71b:	89 04 24             	mov    %eax,(%esp)
 71e:	e8 4d fc ff ff       	call   370 <sbrk>
 723:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 726:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 72a:	75 07                	jne    733 <morecore+0x34>
    return 0;
 72c:	b8 00 00 00 00       	mov    $0x0,%eax
 731:	eb 22                	jmp    755 <morecore+0x56>
  hp = (Header*)p;
 733:	8b 45 f0             	mov    -0x10(%ebp),%eax
 736:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 739:	8b 45 f4             	mov    -0xc(%ebp),%eax
 73c:	8b 55 08             	mov    0x8(%ebp),%edx
 73f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 742:	8b 45 f4             	mov    -0xc(%ebp),%eax
 745:	83 c0 08             	add    $0x8,%eax
 748:	89 04 24             	mov    %eax,(%esp)
 74b:	e8 d8 fe ff ff       	call   628 <free>
  return freep;
 750:	a1 ec 09 00 00       	mov    0x9ec,%eax
}
 755:	c9                   	leave  
 756:	c3                   	ret    

00000757 <malloc>:

void*
malloc(uint nbytes)
{
 757:	55                   	push   %ebp
 758:	89 e5                	mov    %esp,%ebp
 75a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 75d:	8b 45 08             	mov    0x8(%ebp),%eax
 760:	83 c0 07             	add    $0x7,%eax
 763:	c1 e8 03             	shr    $0x3,%eax
 766:	83 c0 01             	add    $0x1,%eax
 769:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 76c:	a1 ec 09 00 00       	mov    0x9ec,%eax
 771:	89 45 f0             	mov    %eax,-0x10(%ebp)
 774:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 778:	75 23                	jne    79d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 77a:	c7 45 f0 e4 09 00 00 	movl   $0x9e4,-0x10(%ebp)
 781:	8b 45 f0             	mov    -0x10(%ebp),%eax
 784:	a3 ec 09 00 00       	mov    %eax,0x9ec
 789:	a1 ec 09 00 00       	mov    0x9ec,%eax
 78e:	a3 e4 09 00 00       	mov    %eax,0x9e4
    base.s.size = 0;
 793:	c7 05 e8 09 00 00 00 	movl   $0x0,0x9e8
 79a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 79d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a0:	8b 00                	mov    (%eax),%eax
 7a2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 7a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a8:	8b 40 04             	mov    0x4(%eax),%eax
 7ab:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7ae:	72 4d                	jb     7fd <malloc+0xa6>
      if(p->s.size == nunits)
 7b0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7b3:	8b 40 04             	mov    0x4(%eax),%eax
 7b6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7b9:	75 0c                	jne    7c7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7be:	8b 10                	mov    (%eax),%edx
 7c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c3:	89 10                	mov    %edx,(%eax)
 7c5:	eb 26                	jmp    7ed <malloc+0x96>
      else {
        p->s.size -= nunits;
 7c7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ca:	8b 40 04             	mov    0x4(%eax),%eax
 7cd:	89 c2                	mov    %eax,%edx
 7cf:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7db:	8b 40 04             	mov    0x4(%eax),%eax
 7de:	c1 e0 03             	shl    $0x3,%eax
 7e1:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 7e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7e7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 7ea:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 7ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f0:	a3 ec 09 00 00       	mov    %eax,0x9ec
      return (void*)(p + 1);
 7f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f8:	83 c0 08             	add    $0x8,%eax
 7fb:	eb 38                	jmp    835 <malloc+0xde>
    }
    if(p == freep)
 7fd:	a1 ec 09 00 00       	mov    0x9ec,%eax
 802:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 805:	75 1b                	jne    822 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 807:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80a:	89 04 24             	mov    %eax,(%esp)
 80d:	e8 ed fe ff ff       	call   6ff <morecore>
 812:	89 45 ec             	mov    %eax,-0x14(%ebp)
 815:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 819:	75 07                	jne    822 <malloc+0xcb>
        return 0;
 81b:	b8 00 00 00 00       	mov    $0x0,%eax
 820:	eb 13                	jmp    835 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 822:	8b 45 ec             	mov    -0x14(%ebp),%eax
 825:	89 45 f0             	mov    %eax,-0x10(%ebp)
 828:	8b 45 ec             	mov    -0x14(%ebp),%eax
 82b:	8b 00                	mov    (%eax),%eax
 82d:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 830:	e9 70 ff ff ff       	jmp    7a5 <malloc+0x4e>
}
 835:	c9                   	leave  
 836:	c3                   	ret    
 837:	90                   	nop

00000838 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 838:	55                   	push   %ebp
 839:	89 e5                	mov    %esp,%ebp
 83b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 83e:	8b 55 08             	mov    0x8(%ebp),%edx
 841:	8b 45 0c             	mov    0xc(%ebp),%eax
 844:	8b 4d 08             	mov    0x8(%ebp),%ecx
 847:	f0 87 02             	lock xchg %eax,(%edx)
 84a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 84d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 850:	c9                   	leave  
 851:	c3                   	ret    

00000852 <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 852:	55                   	push   %ebp
 853:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 855:	8b 45 08             	mov    0x8(%ebp),%eax
 858:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 85e:	5d                   	pop    %ebp
 85f:	c3                   	ret    

00000860 <lock_acquire>:
void lock_acquire(lock_t *lock){
 860:	55                   	push   %ebp
 861:	89 e5                	mov    %esp,%ebp
 863:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 866:	8b 45 08             	mov    0x8(%ebp),%eax
 869:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 870:	00 
 871:	89 04 24             	mov    %eax,(%esp)
 874:	e8 bf ff ff ff       	call   838 <xchg>
 879:	85 c0                	test   %eax,%eax
 87b:	75 e9                	jne    866 <lock_acquire+0x6>
}
 87d:	c9                   	leave  
 87e:	c3                   	ret    

0000087f <lock_release>:
void lock_release(lock_t *lock){
 87f:	55                   	push   %ebp
 880:	89 e5                	mov    %esp,%ebp
 882:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 885:	8b 45 08             	mov    0x8(%ebp),%eax
 888:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 88f:	00 
 890:	89 04 24             	mov    %eax,(%esp)
 893:	e8 a0 ff ff ff       	call   838 <xchg>
}
 898:	c9                   	leave  
 899:	c3                   	ret    

0000089a <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 89a:	55                   	push   %ebp
 89b:	89 e5                	mov    %esp,%ebp
 89d:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 8a0:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8a7:	e8 ab fe ff ff       	call   757 <malloc>
 8ac:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 8af:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 8b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b8:	25 ff 0f 00 00       	and    $0xfff,%eax
 8bd:	85 c0                	test   %eax,%eax
 8bf:	74 15                	je     8d6 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 8c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c4:	89 c2                	mov    %eax,%edx
 8c6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 8cc:	b8 00 10 00 00       	mov    $0x1000,%eax
 8d1:	29 d0                	sub    %edx,%eax
 8d3:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 8d6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8da:	75 1b                	jne    8f7 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 8dc:	c7 44 24 04 a3 09 00 	movl   $0x9a3,0x4(%esp)
 8e3:	00 
 8e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 8eb:	e8 81 fb ff ff       	call   471 <printf>
        return 0;
 8f0:	b8 00 00 00 00       	mov    $0x0,%eax
 8f5:	eb 70                	jmp    967 <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 8f7:	8b 55 08             	mov    0x8(%ebp),%edx
 8fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 904:	00 
 905:	89 54 24 08          	mov    %edx,0x8(%esp)
 909:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 910:	00 
 911:	89 04 24             	mov    %eax,(%esp)
 914:	e8 6f fa ff ff       	call   388 <clone>
 919:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 91c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 920:	79 1b                	jns    93d <thread_create+0xa3>
        printf(1,"clone fails\n");
 922:	c7 44 24 04 b1 09 00 	movl   $0x9b1,0x4(%esp)
 929:	00 
 92a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 931:	e8 3b fb ff ff       	call   471 <printf>
        return 0;
 936:	b8 00 00 00 00       	mov    $0x0,%eax
 93b:	eb 2a                	jmp    967 <thread_create+0xcd>
    }
    if(tid > 0){
 93d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 941:	7e 05                	jle    948 <thread_create+0xae>
        return garbage_stack;
 943:	8b 45 f4             	mov    -0xc(%ebp),%eax
 946:	eb 1f                	jmp    967 <thread_create+0xcd>
    }
    if(tid == 0){
 948:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 94c:	75 14                	jne    962 <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 94e:	c7 44 24 04 be 09 00 	movl   $0x9be,0x4(%esp)
 955:	00 
 956:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 95d:	e8 0f fb ff ff       	call   471 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 962:	b8 00 00 00 00       	mov    $0x0,%eax
}
 967:	c9                   	leave  
 968:	c3                   	ret    
