
_test_q:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"
#include "queue.h"

int main(){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
    struct queue *q = malloc(sizeof(struct queue));
   9:	c7 04 24 0c 00 00 00 	movl   $0xc,(%esp)
  10:	e8 71 07 00 00       	call   786 <malloc>
  15:	89 44 24 18          	mov    %eax,0x18(%esp)
    int i;
    init_q(q);
  19:	8b 44 24 18          	mov    0x18(%esp),%eax
  1d:	89 04 24             	mov    %eax,(%esp)
  20:	e8 71 09 00 00       	call   996 <init_q>
    for(i=0;i<10;i++){
  25:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  2c:	00 
  2d:	eb 19                	jmp    48 <main+0x48>
        add_q(q,i);
  2f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  33:	89 44 24 04          	mov    %eax,0x4(%esp)
  37:	8b 44 24 18          	mov    0x18(%esp),%eax
  3b:	89 04 24             	mov    %eax,(%esp)
  3e:	e8 75 09 00 00       	call   9b8 <add_q>

int main(){
    struct queue *q = malloc(sizeof(struct queue));
    int i;
    init_q(q);
    for(i=0;i<10;i++){
  43:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  48:	83 7c 24 1c 09       	cmpl   $0x9,0x1c(%esp)
  4d:	7e e0                	jle    2f <main+0x2f>
        add_q(q,i);
    }
    for(;!empty_q(q);){
  4f:	eb 24                	jmp    75 <main+0x75>
        printf(1,"pop %d\n",pop_q(q));
  51:	8b 44 24 18          	mov    0x18(%esp),%eax
  55:	89 04 24             	mov    %eax,(%esp)
  58:	e8 d5 09 00 00       	call   a32 <pop_q>
  5d:	89 44 24 08          	mov    %eax,0x8(%esp)
  61:	c7 44 24 04 f5 0b 00 	movl   $0xbf5,0x4(%esp)
  68:	00 
  69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  70:	e8 25 04 00 00       	call   49a <printf>
    int i;
    init_q(q);
    for(i=0;i<10;i++){
        add_q(q,i);
    }
    for(;!empty_q(q);){
  75:	8b 44 24 18          	mov    0x18(%esp),%eax
  79:	89 04 24             	mov    %eax,(%esp)
  7c:	e8 97 09 00 00       	call   a18 <empty_q>
  81:	85 c0                	test   %eax,%eax
  83:	74 cc                	je     51 <main+0x51>
        printf(1,"pop %d\n",pop_q(q));
    }
    exit();
  85:	e8 68 02 00 00       	call   2f2 <exit>

0000008a <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  8a:	55                   	push   %ebp
  8b:	89 e5                	mov    %esp,%ebp
  8d:	57                   	push   %edi
  8e:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  8f:	8b 4d 08             	mov    0x8(%ebp),%ecx
  92:	8b 55 10             	mov    0x10(%ebp),%edx
  95:	8b 45 0c             	mov    0xc(%ebp),%eax
  98:	89 cb                	mov    %ecx,%ebx
  9a:	89 df                	mov    %ebx,%edi
  9c:	89 d1                	mov    %edx,%ecx
  9e:	fc                   	cld    
  9f:	f3 aa                	rep stos %al,%es:(%edi)
  a1:	89 ca                	mov    %ecx,%edx
  a3:	89 fb                	mov    %edi,%ebx
  a5:	89 5d 08             	mov    %ebx,0x8(%ebp)
  a8:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  ab:	5b                   	pop    %ebx
  ac:	5f                   	pop    %edi
  ad:	5d                   	pop    %ebp
  ae:	c3                   	ret    

000000af <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  af:	55                   	push   %ebp
  b0:	89 e5                	mov    %esp,%ebp
  b2:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  b5:	8b 45 08             	mov    0x8(%ebp),%eax
  b8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  bb:	90                   	nop
  bc:	8b 45 08             	mov    0x8(%ebp),%eax
  bf:	8d 50 01             	lea    0x1(%eax),%edx
  c2:	89 55 08             	mov    %edx,0x8(%ebp)
  c5:	8b 55 0c             	mov    0xc(%ebp),%edx
  c8:	8d 4a 01             	lea    0x1(%edx),%ecx
  cb:	89 4d 0c             	mov    %ecx,0xc(%ebp)
  ce:	0f b6 12             	movzbl (%edx),%edx
  d1:	88 10                	mov    %dl,(%eax)
  d3:	0f b6 00             	movzbl (%eax),%eax
  d6:	84 c0                	test   %al,%al
  d8:	75 e2                	jne    bc <strcpy+0xd>
    ;
  return os;
  da:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  dd:	c9                   	leave  
  de:	c3                   	ret    

000000df <strcmp>:

int
strcmp(const char *p, const char *q)
{
  df:	55                   	push   %ebp
  e0:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
  e2:	eb 08                	jmp    ec <strcmp+0xd>
    p++, q++;
  e4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  e8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
  ec:	8b 45 08             	mov    0x8(%ebp),%eax
  ef:	0f b6 00             	movzbl (%eax),%eax
  f2:	84 c0                	test   %al,%al
  f4:	74 10                	je     106 <strcmp+0x27>
  f6:	8b 45 08             	mov    0x8(%ebp),%eax
  f9:	0f b6 10             	movzbl (%eax),%edx
  fc:	8b 45 0c             	mov    0xc(%ebp),%eax
  ff:	0f b6 00             	movzbl (%eax),%eax
 102:	38 c2                	cmp    %al,%dl
 104:	74 de                	je     e4 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 106:	8b 45 08             	mov    0x8(%ebp),%eax
 109:	0f b6 00             	movzbl (%eax),%eax
 10c:	0f b6 d0             	movzbl %al,%edx
 10f:	8b 45 0c             	mov    0xc(%ebp),%eax
 112:	0f b6 00             	movzbl (%eax),%eax
 115:	0f b6 c0             	movzbl %al,%eax
 118:	29 c2                	sub    %eax,%edx
 11a:	89 d0                	mov    %edx,%eax
}
 11c:	5d                   	pop    %ebp
 11d:	c3                   	ret    

0000011e <strlen>:

uint
strlen(char *s)
{
 11e:	55                   	push   %ebp
 11f:	89 e5                	mov    %esp,%ebp
 121:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 124:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 12b:	eb 04                	jmp    131 <strlen+0x13>
 12d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 131:	8b 55 fc             	mov    -0x4(%ebp),%edx
 134:	8b 45 08             	mov    0x8(%ebp),%eax
 137:	01 d0                	add    %edx,%eax
 139:	0f b6 00             	movzbl (%eax),%eax
 13c:	84 c0                	test   %al,%al
 13e:	75 ed                	jne    12d <strlen+0xf>
    ;
  return n;
 140:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 143:	c9                   	leave  
 144:	c3                   	ret    

00000145 <memset>:

void*
memset(void *dst, int c, uint n)
{
 145:	55                   	push   %ebp
 146:	89 e5                	mov    %esp,%ebp
 148:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 14b:	8b 45 10             	mov    0x10(%ebp),%eax
 14e:	89 44 24 08          	mov    %eax,0x8(%esp)
 152:	8b 45 0c             	mov    0xc(%ebp),%eax
 155:	89 44 24 04          	mov    %eax,0x4(%esp)
 159:	8b 45 08             	mov    0x8(%ebp),%eax
 15c:	89 04 24             	mov    %eax,(%esp)
 15f:	e8 26 ff ff ff       	call   8a <stosb>
  return dst;
 164:	8b 45 08             	mov    0x8(%ebp),%eax
}
 167:	c9                   	leave  
 168:	c3                   	ret    

00000169 <strchr>:

char*
strchr(const char *s, char c)
{
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	83 ec 04             	sub    $0x4,%esp
 16f:	8b 45 0c             	mov    0xc(%ebp),%eax
 172:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 175:	eb 14                	jmp    18b <strchr+0x22>
    if(*s == c)
 177:	8b 45 08             	mov    0x8(%ebp),%eax
 17a:	0f b6 00             	movzbl (%eax),%eax
 17d:	3a 45 fc             	cmp    -0x4(%ebp),%al
 180:	75 05                	jne    187 <strchr+0x1e>
      return (char*)s;
 182:	8b 45 08             	mov    0x8(%ebp),%eax
 185:	eb 13                	jmp    19a <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 187:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	0f b6 00             	movzbl (%eax),%eax
 191:	84 c0                	test   %al,%al
 193:	75 e2                	jne    177 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 195:	b8 00 00 00 00       	mov    $0x0,%eax
}
 19a:	c9                   	leave  
 19b:	c3                   	ret    

0000019c <gets>:

char*
gets(char *buf, int max)
{
 19c:	55                   	push   %ebp
 19d:	89 e5                	mov    %esp,%ebp
 19f:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1a2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1a9:	eb 4c                	jmp    1f7 <gets+0x5b>
    cc = read(0, &c, 1);
 1ab:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b2:	00 
 1b3:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c1:	e8 44 01 00 00       	call   30a <read>
 1c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 1c9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 1cd:	7f 02                	jg     1d1 <gets+0x35>
      break;
 1cf:	eb 31                	jmp    202 <gets+0x66>
    buf[i++] = c;
 1d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1d4:	8d 50 01             	lea    0x1(%eax),%edx
 1d7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 1da:	89 c2                	mov    %eax,%edx
 1dc:	8b 45 08             	mov    0x8(%ebp),%eax
 1df:	01 c2                	add    %eax,%edx
 1e1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e5:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 1e7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1eb:	3c 0a                	cmp    $0xa,%al
 1ed:	74 13                	je     202 <gets+0x66>
 1ef:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f3:	3c 0d                	cmp    $0xd,%al
 1f5:	74 0b                	je     202 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1fa:	83 c0 01             	add    $0x1,%eax
 1fd:	3b 45 0c             	cmp    0xc(%ebp),%eax
 200:	7c a9                	jl     1ab <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 202:	8b 55 f4             	mov    -0xc(%ebp),%edx
 205:	8b 45 08             	mov    0x8(%ebp),%eax
 208:	01 d0                	add    %edx,%eax
 20a:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 20d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 210:	c9                   	leave  
 211:	c3                   	ret    

00000212 <stat>:

int
stat(char *n, struct stat *st)
{
 212:	55                   	push   %ebp
 213:	89 e5                	mov    %esp,%ebp
 215:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 218:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 21f:	00 
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	89 04 24             	mov    %eax,(%esp)
 226:	e8 07 01 00 00       	call   332 <open>
 22b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 22e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 232:	79 07                	jns    23b <stat+0x29>
    return -1;
 234:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 239:	eb 23                	jmp    25e <stat+0x4c>
  r = fstat(fd, st);
 23b:	8b 45 0c             	mov    0xc(%ebp),%eax
 23e:	89 44 24 04          	mov    %eax,0x4(%esp)
 242:	8b 45 f4             	mov    -0xc(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 fd 00 00 00       	call   34a <fstat>
 24d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 250:	8b 45 f4             	mov    -0xc(%ebp),%eax
 253:	89 04 24             	mov    %eax,(%esp)
 256:	e8 bf 00 00 00       	call   31a <close>
  return r;
 25b:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 25e:	c9                   	leave  
 25f:	c3                   	ret    

00000260 <atoi>:

int
atoi(const char *s)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 266:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 26d:	eb 25                	jmp    294 <atoi+0x34>
    n = n*10 + *s++ - '0';
 26f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 272:	89 d0                	mov    %edx,%eax
 274:	c1 e0 02             	shl    $0x2,%eax
 277:	01 d0                	add    %edx,%eax
 279:	01 c0                	add    %eax,%eax
 27b:	89 c1                	mov    %eax,%ecx
 27d:	8b 45 08             	mov    0x8(%ebp),%eax
 280:	8d 50 01             	lea    0x1(%eax),%edx
 283:	89 55 08             	mov    %edx,0x8(%ebp)
 286:	0f b6 00             	movzbl (%eax),%eax
 289:	0f be c0             	movsbl %al,%eax
 28c:	01 c8                	add    %ecx,%eax
 28e:	83 e8 30             	sub    $0x30,%eax
 291:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 294:	8b 45 08             	mov    0x8(%ebp),%eax
 297:	0f b6 00             	movzbl (%eax),%eax
 29a:	3c 2f                	cmp    $0x2f,%al
 29c:	7e 0a                	jle    2a8 <atoi+0x48>
 29e:	8b 45 08             	mov    0x8(%ebp),%eax
 2a1:	0f b6 00             	movzbl (%eax),%eax
 2a4:	3c 39                	cmp    $0x39,%al
 2a6:	7e c7                	jle    26f <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2ab:	c9                   	leave  
 2ac:	c3                   	ret    

000002ad <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2ad:	55                   	push   %ebp
 2ae:	89 e5                	mov    %esp,%ebp
 2b0:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 2b9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 2bf:	eb 17                	jmp    2d8 <memmove+0x2b>
    *dst++ = *src++;
 2c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c4:	8d 50 01             	lea    0x1(%eax),%edx
 2c7:	89 55 fc             	mov    %edx,-0x4(%ebp)
 2ca:	8b 55 f8             	mov    -0x8(%ebp),%edx
 2cd:	8d 4a 01             	lea    0x1(%edx),%ecx
 2d0:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 2d3:	0f b6 12             	movzbl (%edx),%edx
 2d6:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d8:	8b 45 10             	mov    0x10(%ebp),%eax
 2db:	8d 50 ff             	lea    -0x1(%eax),%edx
 2de:	89 55 10             	mov    %edx,0x10(%ebp)
 2e1:	85 c0                	test   %eax,%eax
 2e3:	7f dc                	jg     2c1 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2e5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2e8:	c9                   	leave  
 2e9:	c3                   	ret    

000002ea <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2ea:	b8 01 00 00 00       	mov    $0x1,%eax
 2ef:	cd 40                	int    $0x40
 2f1:	c3                   	ret    

000002f2 <exit>:
SYSCALL(exit)
 2f2:	b8 02 00 00 00       	mov    $0x2,%eax
 2f7:	cd 40                	int    $0x40
 2f9:	c3                   	ret    

000002fa <wait>:
SYSCALL(wait)
 2fa:	b8 03 00 00 00       	mov    $0x3,%eax
 2ff:	cd 40                	int    $0x40
 301:	c3                   	ret    

00000302 <pipe>:
SYSCALL(pipe)
 302:	b8 04 00 00 00       	mov    $0x4,%eax
 307:	cd 40                	int    $0x40
 309:	c3                   	ret    

0000030a <read>:
SYSCALL(read)
 30a:	b8 05 00 00 00       	mov    $0x5,%eax
 30f:	cd 40                	int    $0x40
 311:	c3                   	ret    

00000312 <write>:
SYSCALL(write)
 312:	b8 10 00 00 00       	mov    $0x10,%eax
 317:	cd 40                	int    $0x40
 319:	c3                   	ret    

0000031a <close>:
SYSCALL(close)
 31a:	b8 15 00 00 00       	mov    $0x15,%eax
 31f:	cd 40                	int    $0x40
 321:	c3                   	ret    

00000322 <kill>:
SYSCALL(kill)
 322:	b8 06 00 00 00       	mov    $0x6,%eax
 327:	cd 40                	int    $0x40
 329:	c3                   	ret    

0000032a <exec>:
SYSCALL(exec)
 32a:	b8 07 00 00 00       	mov    $0x7,%eax
 32f:	cd 40                	int    $0x40
 331:	c3                   	ret    

00000332 <open>:
SYSCALL(open)
 332:	b8 0f 00 00 00       	mov    $0xf,%eax
 337:	cd 40                	int    $0x40
 339:	c3                   	ret    

0000033a <mknod>:
SYSCALL(mknod)
 33a:	b8 11 00 00 00       	mov    $0x11,%eax
 33f:	cd 40                	int    $0x40
 341:	c3                   	ret    

00000342 <unlink>:
SYSCALL(unlink)
 342:	b8 12 00 00 00       	mov    $0x12,%eax
 347:	cd 40                	int    $0x40
 349:	c3                   	ret    

0000034a <fstat>:
SYSCALL(fstat)
 34a:	b8 08 00 00 00       	mov    $0x8,%eax
 34f:	cd 40                	int    $0x40
 351:	c3                   	ret    

00000352 <link>:
SYSCALL(link)
 352:	b8 13 00 00 00       	mov    $0x13,%eax
 357:	cd 40                	int    $0x40
 359:	c3                   	ret    

0000035a <mkdir>:
SYSCALL(mkdir)
 35a:	b8 14 00 00 00       	mov    $0x14,%eax
 35f:	cd 40                	int    $0x40
 361:	c3                   	ret    

00000362 <chdir>:
SYSCALL(chdir)
 362:	b8 09 00 00 00       	mov    $0x9,%eax
 367:	cd 40                	int    $0x40
 369:	c3                   	ret    

0000036a <dup>:
SYSCALL(dup)
 36a:	b8 0a 00 00 00       	mov    $0xa,%eax
 36f:	cd 40                	int    $0x40
 371:	c3                   	ret    

00000372 <getpid>:
SYSCALL(getpid)
 372:	b8 0b 00 00 00       	mov    $0xb,%eax
 377:	cd 40                	int    $0x40
 379:	c3                   	ret    

0000037a <sbrk>:
SYSCALL(sbrk)
 37a:	b8 0c 00 00 00       	mov    $0xc,%eax
 37f:	cd 40                	int    $0x40
 381:	c3                   	ret    

00000382 <sleep>:
SYSCALL(sleep)
 382:	b8 0d 00 00 00       	mov    $0xd,%eax
 387:	cd 40                	int    $0x40
 389:	c3                   	ret    

0000038a <uptime>:
SYSCALL(uptime)
 38a:	b8 0e 00 00 00       	mov    $0xe,%eax
 38f:	cd 40                	int    $0x40
 391:	c3                   	ret    

00000392 <clone>:
SYSCALL(clone)
 392:	b8 16 00 00 00       	mov    $0x16,%eax
 397:	cd 40                	int    $0x40
 399:	c3                   	ret    

0000039a <texit>:
SYSCALL(texit)
 39a:	b8 17 00 00 00       	mov    $0x17,%eax
 39f:	cd 40                	int    $0x40
 3a1:	c3                   	ret    

000003a2 <tsleep>:
SYSCALL(tsleep)
 3a2:	b8 18 00 00 00       	mov    $0x18,%eax
 3a7:	cd 40                	int    $0x40
 3a9:	c3                   	ret    

000003aa <twakeup>:
SYSCALL(twakeup)
 3aa:	b8 19 00 00 00       	mov    $0x19,%eax
 3af:	cd 40                	int    $0x40
 3b1:	c3                   	ret    

000003b2 <test>:
SYSCALL(test)
 3b2:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3b7:	cd 40                	int    $0x40
 3b9:	c3                   	ret    

000003ba <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3ba:	55                   	push   %ebp
 3bb:	89 e5                	mov    %esp,%ebp
 3bd:	83 ec 18             	sub    $0x18,%esp
 3c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c3:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3c6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3cd:	00 
 3ce:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 3d5:	8b 45 08             	mov    0x8(%ebp),%eax
 3d8:	89 04 24             	mov    %eax,(%esp)
 3db:	e8 32 ff ff ff       	call   312 <write>
}
 3e0:	c9                   	leave  
 3e1:	c3                   	ret    

000003e2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3e2:	55                   	push   %ebp
 3e3:	89 e5                	mov    %esp,%ebp
 3e5:	56                   	push   %esi
 3e6:	53                   	push   %ebx
 3e7:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3ea:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3f1:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3f5:	74 17                	je     40e <printint+0x2c>
 3f7:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3fb:	79 11                	jns    40e <printint+0x2c>
    neg = 1;
 3fd:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 404:	8b 45 0c             	mov    0xc(%ebp),%eax
 407:	f7 d8                	neg    %eax
 409:	89 45 ec             	mov    %eax,-0x14(%ebp)
 40c:	eb 06                	jmp    414 <printint+0x32>
  } else {
    x = xx;
 40e:	8b 45 0c             	mov    0xc(%ebp),%eax
 411:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 414:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 41b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 41e:	8d 41 01             	lea    0x1(%ecx),%eax
 421:	89 45 f4             	mov    %eax,-0xc(%ebp)
 424:	8b 5d 10             	mov    0x10(%ebp),%ebx
 427:	8b 45 ec             	mov    -0x14(%ebp),%eax
 42a:	ba 00 00 00 00       	mov    $0x0,%edx
 42f:	f7 f3                	div    %ebx
 431:	89 d0                	mov    %edx,%eax
 433:	0f b6 80 0c 10 00 00 	movzbl 0x100c(%eax),%eax
 43a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 43e:	8b 75 10             	mov    0x10(%ebp),%esi
 441:	8b 45 ec             	mov    -0x14(%ebp),%eax
 444:	ba 00 00 00 00       	mov    $0x0,%edx
 449:	f7 f6                	div    %esi
 44b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 44e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 452:	75 c7                	jne    41b <printint+0x39>
  if(neg)
 454:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 458:	74 10                	je     46a <printint+0x88>
    buf[i++] = '-';
 45a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 45d:	8d 50 01             	lea    0x1(%eax),%edx
 460:	89 55 f4             	mov    %edx,-0xc(%ebp)
 463:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 468:	eb 1f                	jmp    489 <printint+0xa7>
 46a:	eb 1d                	jmp    489 <printint+0xa7>
    putc(fd, buf[i]);
 46c:	8d 55 dc             	lea    -0x24(%ebp),%edx
 46f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 472:	01 d0                	add    %edx,%eax
 474:	0f b6 00             	movzbl (%eax),%eax
 477:	0f be c0             	movsbl %al,%eax
 47a:	89 44 24 04          	mov    %eax,0x4(%esp)
 47e:	8b 45 08             	mov    0x8(%ebp),%eax
 481:	89 04 24             	mov    %eax,(%esp)
 484:	e8 31 ff ff ff       	call   3ba <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 489:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 48d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 491:	79 d9                	jns    46c <printint+0x8a>
    putc(fd, buf[i]);
}
 493:	83 c4 30             	add    $0x30,%esp
 496:	5b                   	pop    %ebx
 497:	5e                   	pop    %esi
 498:	5d                   	pop    %ebp
 499:	c3                   	ret    

0000049a <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 49a:	55                   	push   %ebp
 49b:	89 e5                	mov    %esp,%ebp
 49d:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4a0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4a7:	8d 45 0c             	lea    0xc(%ebp),%eax
 4aa:	83 c0 04             	add    $0x4,%eax
 4ad:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 4b0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 4b7:	e9 7c 01 00 00       	jmp    638 <printf+0x19e>
    c = fmt[i] & 0xff;
 4bc:	8b 55 0c             	mov    0xc(%ebp),%edx
 4bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4c2:	01 d0                	add    %edx,%eax
 4c4:	0f b6 00             	movzbl (%eax),%eax
 4c7:	0f be c0             	movsbl %al,%eax
 4ca:	25 ff 00 00 00       	and    $0xff,%eax
 4cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 4d2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4d6:	75 2c                	jne    504 <printf+0x6a>
      if(c == '%'){
 4d8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 4dc:	75 0c                	jne    4ea <printf+0x50>
        state = '%';
 4de:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 4e5:	e9 4a 01 00 00       	jmp    634 <printf+0x19a>
      } else {
        putc(fd, c);
 4ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 4ed:	0f be c0             	movsbl %al,%eax
 4f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f4:	8b 45 08             	mov    0x8(%ebp),%eax
 4f7:	89 04 24             	mov    %eax,(%esp)
 4fa:	e8 bb fe ff ff       	call   3ba <putc>
 4ff:	e9 30 01 00 00       	jmp    634 <printf+0x19a>
      }
    } else if(state == '%'){
 504:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 508:	0f 85 26 01 00 00    	jne    634 <printf+0x19a>
      if(c == 'd'){
 50e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 512:	75 2d                	jne    541 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 514:	8b 45 e8             	mov    -0x18(%ebp),%eax
 517:	8b 00                	mov    (%eax),%eax
 519:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 520:	00 
 521:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 528:	00 
 529:	89 44 24 04          	mov    %eax,0x4(%esp)
 52d:	8b 45 08             	mov    0x8(%ebp),%eax
 530:	89 04 24             	mov    %eax,(%esp)
 533:	e8 aa fe ff ff       	call   3e2 <printint>
        ap++;
 538:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 53c:	e9 ec 00 00 00       	jmp    62d <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 541:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 545:	74 06                	je     54d <printf+0xb3>
 547:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 54b:	75 2d                	jne    57a <printf+0xe0>
        printint(fd, *ap, 16, 0);
 54d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 550:	8b 00                	mov    (%eax),%eax
 552:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 559:	00 
 55a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 561:	00 
 562:	89 44 24 04          	mov    %eax,0x4(%esp)
 566:	8b 45 08             	mov    0x8(%ebp),%eax
 569:	89 04 24             	mov    %eax,(%esp)
 56c:	e8 71 fe ff ff       	call   3e2 <printint>
        ap++;
 571:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 575:	e9 b3 00 00 00       	jmp    62d <printf+0x193>
      } else if(c == 's'){
 57a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 57e:	75 45                	jne    5c5 <printf+0x12b>
        s = (char*)*ap;
 580:	8b 45 e8             	mov    -0x18(%ebp),%eax
 583:	8b 00                	mov    (%eax),%eax
 585:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 588:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 58c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 590:	75 09                	jne    59b <printf+0x101>
          s = "(null)";
 592:	c7 45 f4 fd 0b 00 00 	movl   $0xbfd,-0xc(%ebp)
        while(*s != 0){
 599:	eb 1e                	jmp    5b9 <printf+0x11f>
 59b:	eb 1c                	jmp    5b9 <printf+0x11f>
          putc(fd, *s);
 59d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a0:	0f b6 00             	movzbl (%eax),%eax
 5a3:	0f be c0             	movsbl %al,%eax
 5a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5aa:	8b 45 08             	mov    0x8(%ebp),%eax
 5ad:	89 04 24             	mov    %eax,(%esp)
 5b0:	e8 05 fe ff ff       	call   3ba <putc>
          s++;
 5b5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5bc:	0f b6 00             	movzbl (%eax),%eax
 5bf:	84 c0                	test   %al,%al
 5c1:	75 da                	jne    59d <printf+0x103>
 5c3:	eb 68                	jmp    62d <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5c5:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 5c9:	75 1d                	jne    5e8 <printf+0x14e>
        putc(fd, *ap);
 5cb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ce:	8b 00                	mov    (%eax),%eax
 5d0:	0f be c0             	movsbl %al,%eax
 5d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d7:	8b 45 08             	mov    0x8(%ebp),%eax
 5da:	89 04 24             	mov    %eax,(%esp)
 5dd:	e8 d8 fd ff ff       	call   3ba <putc>
        ap++;
 5e2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5e6:	eb 45                	jmp    62d <printf+0x193>
      } else if(c == '%'){
 5e8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5ec:	75 17                	jne    605 <printf+0x16b>
        putc(fd, c);
 5ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5f1:	0f be c0             	movsbl %al,%eax
 5f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f8:	8b 45 08             	mov    0x8(%ebp),%eax
 5fb:	89 04 24             	mov    %eax,(%esp)
 5fe:	e8 b7 fd ff ff       	call   3ba <putc>
 603:	eb 28                	jmp    62d <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 605:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 60c:	00 
 60d:	8b 45 08             	mov    0x8(%ebp),%eax
 610:	89 04 24             	mov    %eax,(%esp)
 613:	e8 a2 fd ff ff       	call   3ba <putc>
        putc(fd, c);
 618:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 61b:	0f be c0             	movsbl %al,%eax
 61e:	89 44 24 04          	mov    %eax,0x4(%esp)
 622:	8b 45 08             	mov    0x8(%ebp),%eax
 625:	89 04 24             	mov    %eax,(%esp)
 628:	e8 8d fd ff ff       	call   3ba <putc>
      }
      state = 0;
 62d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 634:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 638:	8b 55 0c             	mov    0xc(%ebp),%edx
 63b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 63e:	01 d0                	add    %edx,%eax
 640:	0f b6 00             	movzbl (%eax),%eax
 643:	84 c0                	test   %al,%al
 645:	0f 85 71 fe ff ff    	jne    4bc <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 64b:	c9                   	leave  
 64c:	c3                   	ret    

0000064d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 64d:	55                   	push   %ebp
 64e:	89 e5                	mov    %esp,%ebp
 650:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 653:	8b 45 08             	mov    0x8(%ebp),%eax
 656:	83 e8 08             	sub    $0x8,%eax
 659:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 65c:	a1 28 10 00 00       	mov    0x1028,%eax
 661:	89 45 fc             	mov    %eax,-0x4(%ebp)
 664:	eb 24                	jmp    68a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 666:	8b 45 fc             	mov    -0x4(%ebp),%eax
 669:	8b 00                	mov    (%eax),%eax
 66b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 66e:	77 12                	ja     682 <free+0x35>
 670:	8b 45 f8             	mov    -0x8(%ebp),%eax
 673:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 676:	77 24                	ja     69c <free+0x4f>
 678:	8b 45 fc             	mov    -0x4(%ebp),%eax
 67b:	8b 00                	mov    (%eax),%eax
 67d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 680:	77 1a                	ja     69c <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 682:	8b 45 fc             	mov    -0x4(%ebp),%eax
 685:	8b 00                	mov    (%eax),%eax
 687:	89 45 fc             	mov    %eax,-0x4(%ebp)
 68a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 68d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 690:	76 d4                	jbe    666 <free+0x19>
 692:	8b 45 fc             	mov    -0x4(%ebp),%eax
 695:	8b 00                	mov    (%eax),%eax
 697:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 69a:	76 ca                	jbe    666 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 69c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69f:	8b 40 04             	mov    0x4(%eax),%eax
 6a2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6a9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ac:	01 c2                	add    %eax,%edx
 6ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b1:	8b 00                	mov    (%eax),%eax
 6b3:	39 c2                	cmp    %eax,%edx
 6b5:	75 24                	jne    6db <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 6b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ba:	8b 50 04             	mov    0x4(%eax),%edx
 6bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c0:	8b 00                	mov    (%eax),%eax
 6c2:	8b 40 04             	mov    0x4(%eax),%eax
 6c5:	01 c2                	add    %eax,%edx
 6c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ca:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d0:	8b 00                	mov    (%eax),%eax
 6d2:	8b 10                	mov    (%eax),%edx
 6d4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6d7:	89 10                	mov    %edx,(%eax)
 6d9:	eb 0a                	jmp    6e5 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 6db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6de:	8b 10                	mov    (%eax),%edx
 6e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e3:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e8:	8b 40 04             	mov    0x4(%eax),%eax
 6eb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f5:	01 d0                	add    %edx,%eax
 6f7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6fa:	75 20                	jne    71c <free+0xcf>
    p->s.size += bp->s.size;
 6fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ff:	8b 50 04             	mov    0x4(%eax),%edx
 702:	8b 45 f8             	mov    -0x8(%ebp),%eax
 705:	8b 40 04             	mov    0x4(%eax),%eax
 708:	01 c2                	add    %eax,%edx
 70a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 710:	8b 45 f8             	mov    -0x8(%ebp),%eax
 713:	8b 10                	mov    (%eax),%edx
 715:	8b 45 fc             	mov    -0x4(%ebp),%eax
 718:	89 10                	mov    %edx,(%eax)
 71a:	eb 08                	jmp    724 <free+0xd7>
  } else
    p->s.ptr = bp;
 71c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 722:	89 10                	mov    %edx,(%eax)
  freep = p;
 724:	8b 45 fc             	mov    -0x4(%ebp),%eax
 727:	a3 28 10 00 00       	mov    %eax,0x1028
}
 72c:	c9                   	leave  
 72d:	c3                   	ret    

0000072e <morecore>:

static Header*
morecore(uint nu)
{
 72e:	55                   	push   %ebp
 72f:	89 e5                	mov    %esp,%ebp
 731:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 734:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 73b:	77 07                	ja     744 <morecore+0x16>
    nu = 4096;
 73d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 744:	8b 45 08             	mov    0x8(%ebp),%eax
 747:	c1 e0 03             	shl    $0x3,%eax
 74a:	89 04 24             	mov    %eax,(%esp)
 74d:	e8 28 fc ff ff       	call   37a <sbrk>
 752:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 755:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 759:	75 07                	jne    762 <morecore+0x34>
    return 0;
 75b:	b8 00 00 00 00       	mov    $0x0,%eax
 760:	eb 22                	jmp    784 <morecore+0x56>
  hp = (Header*)p;
 762:	8b 45 f4             	mov    -0xc(%ebp),%eax
 765:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 768:	8b 45 f0             	mov    -0x10(%ebp),%eax
 76b:	8b 55 08             	mov    0x8(%ebp),%edx
 76e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 771:	8b 45 f0             	mov    -0x10(%ebp),%eax
 774:	83 c0 08             	add    $0x8,%eax
 777:	89 04 24             	mov    %eax,(%esp)
 77a:	e8 ce fe ff ff       	call   64d <free>
  return freep;
 77f:	a1 28 10 00 00       	mov    0x1028,%eax
}
 784:	c9                   	leave  
 785:	c3                   	ret    

00000786 <malloc>:

void*
malloc(uint nbytes)
{
 786:	55                   	push   %ebp
 787:	89 e5                	mov    %esp,%ebp
 789:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 78c:	8b 45 08             	mov    0x8(%ebp),%eax
 78f:	83 c0 07             	add    $0x7,%eax
 792:	c1 e8 03             	shr    $0x3,%eax
 795:	83 c0 01             	add    $0x1,%eax
 798:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 79b:	a1 28 10 00 00       	mov    0x1028,%eax
 7a0:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7a3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7a7:	75 23                	jne    7cc <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7a9:	c7 45 f0 20 10 00 00 	movl   $0x1020,-0x10(%ebp)
 7b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7b3:	a3 28 10 00 00       	mov    %eax,0x1028
 7b8:	a1 28 10 00 00       	mov    0x1028,%eax
 7bd:	a3 20 10 00 00       	mov    %eax,0x1020
    base.s.size = 0;
 7c2:	c7 05 24 10 00 00 00 	movl   $0x0,0x1024
 7c9:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7cf:	8b 00                	mov    (%eax),%eax
 7d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 7d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d7:	8b 40 04             	mov    0x4(%eax),%eax
 7da:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7dd:	72 4d                	jb     82c <malloc+0xa6>
      if(p->s.size == nunits)
 7df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e2:	8b 40 04             	mov    0x4(%eax),%eax
 7e5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 7e8:	75 0c                	jne    7f6 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ed:	8b 10                	mov    (%eax),%edx
 7ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f2:	89 10                	mov    %edx,(%eax)
 7f4:	eb 26                	jmp    81c <malloc+0x96>
      else {
        p->s.size -= nunits;
 7f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f9:	8b 40 04             	mov    0x4(%eax),%eax
 7fc:	2b 45 ec             	sub    -0x14(%ebp),%eax
 7ff:	89 c2                	mov    %eax,%edx
 801:	8b 45 f4             	mov    -0xc(%ebp),%eax
 804:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 807:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80a:	8b 40 04             	mov    0x4(%eax),%eax
 80d:	c1 e0 03             	shl    $0x3,%eax
 810:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 813:	8b 45 f4             	mov    -0xc(%ebp),%eax
 816:	8b 55 ec             	mov    -0x14(%ebp),%edx
 819:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 81c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 81f:	a3 28 10 00 00       	mov    %eax,0x1028
      return (void*)(p + 1);
 824:	8b 45 f4             	mov    -0xc(%ebp),%eax
 827:	83 c0 08             	add    $0x8,%eax
 82a:	eb 38                	jmp    864 <malloc+0xde>
    }
    if(p == freep)
 82c:	a1 28 10 00 00       	mov    0x1028,%eax
 831:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 834:	75 1b                	jne    851 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 836:	8b 45 ec             	mov    -0x14(%ebp),%eax
 839:	89 04 24             	mov    %eax,(%esp)
 83c:	e8 ed fe ff ff       	call   72e <morecore>
 841:	89 45 f4             	mov    %eax,-0xc(%ebp)
 844:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 848:	75 07                	jne    851 <malloc+0xcb>
        return 0;
 84a:	b8 00 00 00 00       	mov    $0x0,%eax
 84f:	eb 13                	jmp    864 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 851:	8b 45 f4             	mov    -0xc(%ebp),%eax
 854:	89 45 f0             	mov    %eax,-0x10(%ebp)
 857:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85a:	8b 00                	mov    (%eax),%eax
 85c:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 85f:	e9 70 ff ff ff       	jmp    7d4 <malloc+0x4e>
}
 864:	c9                   	leave  
 865:	c3                   	ret    

00000866 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 866:	55                   	push   %ebp
 867:	89 e5                	mov    %esp,%ebp
 869:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 86c:	8b 55 08             	mov    0x8(%ebp),%edx
 86f:	8b 45 0c             	mov    0xc(%ebp),%eax
 872:	8b 4d 08             	mov    0x8(%ebp),%ecx
 875:	f0 87 02             	lock xchg %eax,(%edx)
 878:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 87b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 87e:	c9                   	leave  
 87f:	c3                   	ret    

00000880 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 883:	8b 45 08             	mov    0x8(%ebp),%eax
 886:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 88c:	5d                   	pop    %ebp
 88d:	c3                   	ret    

0000088e <lock_acquire>:
void lock_acquire(lock_t *lock){
 88e:	55                   	push   %ebp
 88f:	89 e5                	mov    %esp,%ebp
 891:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 894:	90                   	nop
 895:	8b 45 08             	mov    0x8(%ebp),%eax
 898:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 89f:	00 
 8a0:	89 04 24             	mov    %eax,(%esp)
 8a3:	e8 be ff ff ff       	call   866 <xchg>
 8a8:	85 c0                	test   %eax,%eax
 8aa:	75 e9                	jne    895 <lock_acquire+0x7>
}
 8ac:	c9                   	leave  
 8ad:	c3                   	ret    

000008ae <lock_release>:
void lock_release(lock_t *lock){
 8ae:	55                   	push   %ebp
 8af:	89 e5                	mov    %esp,%ebp
 8b1:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 8b4:	8b 45 08             	mov    0x8(%ebp),%eax
 8b7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8be:	00 
 8bf:	89 04 24             	mov    %eax,(%esp)
 8c2:	e8 9f ff ff ff       	call   866 <xchg>
}
 8c7:	c9                   	leave  
 8c8:	c3                   	ret    

000008c9 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 8c9:	55                   	push   %ebp
 8ca:	89 e5                	mov    %esp,%ebp
 8cc:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 8cf:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8d6:	e8 ab fe ff ff       	call   786 <malloc>
 8db:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 8de:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 8e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e7:	25 ff 0f 00 00       	and    $0xfff,%eax
 8ec:	85 c0                	test   %eax,%eax
 8ee:	74 14                	je     904 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 8f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f3:	25 ff 0f 00 00       	and    $0xfff,%eax
 8f8:	89 c2                	mov    %eax,%edx
 8fa:	b8 00 10 00 00       	mov    $0x1000,%eax
 8ff:	29 d0                	sub    %edx,%eax
 901:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 904:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 908:	75 1b                	jne    925 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 90a:	c7 44 24 04 04 0c 00 	movl   $0xc04,0x4(%esp)
 911:	00 
 912:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 919:	e8 7c fb ff ff       	call   49a <printf>
        return 0;
 91e:	b8 00 00 00 00       	mov    $0x0,%eax
 923:	eb 6f                	jmp    994 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 925:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 928:	8b 55 08             	mov    0x8(%ebp),%edx
 92b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 932:	89 54 24 08          	mov    %edx,0x8(%esp)
 936:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 93d:	00 
 93e:	89 04 24             	mov    %eax,(%esp)
 941:	e8 4c fa ff ff       	call   392 <clone>
 946:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 949:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 94d:	79 1b                	jns    96a <thread_create+0xa1>
        printf(1,"clone fails\n");
 94f:	c7 44 24 04 12 0c 00 	movl   $0xc12,0x4(%esp)
 956:	00 
 957:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 95e:	e8 37 fb ff ff       	call   49a <printf>
        return 0;
 963:	b8 00 00 00 00       	mov    $0x0,%eax
 968:	eb 2a                	jmp    994 <thread_create+0xcb>
    }
    if(tid > 0){
 96a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 96e:	7e 05                	jle    975 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 970:	8b 45 f0             	mov    -0x10(%ebp),%eax
 973:	eb 1f                	jmp    994 <thread_create+0xcb>
    }
    if(tid == 0){
 975:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 979:	75 14                	jne    98f <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 97b:	c7 44 24 04 1f 0c 00 	movl   $0xc1f,0x4(%esp)
 982:	00 
 983:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 98a:	e8 0b fb ff ff       	call   49a <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 98f:	b8 00 00 00 00       	mov    $0x0,%eax
}
 994:	c9                   	leave  
 995:	c3                   	ret    

00000996 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 996:	55                   	push   %ebp
 997:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 999:	8b 45 08             	mov    0x8(%ebp),%eax
 99c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 9a2:	8b 45 08             	mov    0x8(%ebp),%eax
 9a5:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 9ac:	8b 45 08             	mov    0x8(%ebp),%eax
 9af:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 9b6:	5d                   	pop    %ebp
 9b7:	c3                   	ret    

000009b8 <add_q>:

void add_q(struct queue *q, int v){
 9b8:	55                   	push   %ebp
 9b9:	89 e5                	mov    %esp,%ebp
 9bb:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 9be:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 9c5:	e8 bc fd ff ff       	call   786 <malloc>
 9ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 9cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 9d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9da:	8b 55 0c             	mov    0xc(%ebp),%edx
 9dd:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 9df:	8b 45 08             	mov    0x8(%ebp),%eax
 9e2:	8b 40 04             	mov    0x4(%eax),%eax
 9e5:	85 c0                	test   %eax,%eax
 9e7:	75 0b                	jne    9f4 <add_q+0x3c>
        q->head = n;
 9e9:	8b 45 08             	mov    0x8(%ebp),%eax
 9ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9ef:	89 50 04             	mov    %edx,0x4(%eax)
 9f2:	eb 0c                	jmp    a00 <add_q+0x48>
    }else{
        q->tail->next = n;
 9f4:	8b 45 08             	mov    0x8(%ebp),%eax
 9f7:	8b 40 08             	mov    0x8(%eax),%eax
 9fa:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9fd:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 a00:	8b 45 08             	mov    0x8(%ebp),%eax
 a03:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a06:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 a09:	8b 45 08             	mov    0x8(%ebp),%eax
 a0c:	8b 00                	mov    (%eax),%eax
 a0e:	8d 50 01             	lea    0x1(%eax),%edx
 a11:	8b 45 08             	mov    0x8(%ebp),%eax
 a14:	89 10                	mov    %edx,(%eax)
}
 a16:	c9                   	leave  
 a17:	c3                   	ret    

00000a18 <empty_q>:

int empty_q(struct queue *q){
 a18:	55                   	push   %ebp
 a19:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 a1b:	8b 45 08             	mov    0x8(%ebp),%eax
 a1e:	8b 00                	mov    (%eax),%eax
 a20:	85 c0                	test   %eax,%eax
 a22:	75 07                	jne    a2b <empty_q+0x13>
        return 1;
 a24:	b8 01 00 00 00       	mov    $0x1,%eax
 a29:	eb 05                	jmp    a30 <empty_q+0x18>
    else
        return 0;
 a2b:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 a30:	5d                   	pop    %ebp
 a31:	c3                   	ret    

00000a32 <pop_q>:
int pop_q(struct queue *q){
 a32:	55                   	push   %ebp
 a33:	89 e5                	mov    %esp,%ebp
 a35:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a38:	8b 45 08             	mov    0x8(%ebp),%eax
 a3b:	89 04 24             	mov    %eax,(%esp)
 a3e:	e8 d5 ff ff ff       	call   a18 <empty_q>
 a43:	85 c0                	test   %eax,%eax
 a45:	75 5d                	jne    aa4 <pop_q+0x72>
       val = q->head->value; 
 a47:	8b 45 08             	mov    0x8(%ebp),%eax
 a4a:	8b 40 04             	mov    0x4(%eax),%eax
 a4d:	8b 00                	mov    (%eax),%eax
 a4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 a52:	8b 45 08             	mov    0x8(%ebp),%eax
 a55:	8b 40 04             	mov    0x4(%eax),%eax
 a58:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 a5b:	8b 45 08             	mov    0x8(%ebp),%eax
 a5e:	8b 40 04             	mov    0x4(%eax),%eax
 a61:	8b 50 04             	mov    0x4(%eax),%edx
 a64:	8b 45 08             	mov    0x8(%ebp),%eax
 a67:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a6d:	89 04 24             	mov    %eax,(%esp)
 a70:	e8 d8 fb ff ff       	call   64d <free>
       q->size--;
 a75:	8b 45 08             	mov    0x8(%ebp),%eax
 a78:	8b 00                	mov    (%eax),%eax
 a7a:	8d 50 ff             	lea    -0x1(%eax),%edx
 a7d:	8b 45 08             	mov    0x8(%ebp),%eax
 a80:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a82:	8b 45 08             	mov    0x8(%ebp),%eax
 a85:	8b 00                	mov    (%eax),%eax
 a87:	85 c0                	test   %eax,%eax
 a89:	75 14                	jne    a9f <pop_q+0x6d>
            q->head = 0;
 a8b:	8b 45 08             	mov    0x8(%ebp),%eax
 a8e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a95:	8b 45 08             	mov    0x8(%ebp),%eax
 a98:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa2:	eb 05                	jmp    aa9 <pop_q+0x77>
    }
    return -1;
 aa4:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 aa9:	c9                   	leave  
 aaa:	c3                   	ret    

00000aab <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 aab:	55                   	push   %ebp
 aac:	89 e5                	mov    %esp,%ebp
 aae:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 ab1:	8b 45 08             	mov    0x8(%ebp),%eax
 ab4:	8b 55 0c             	mov    0xc(%ebp),%edx
 ab7:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 aba:	8b 45 08             	mov    0x8(%ebp),%eax
 abd:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 ac4:	8b 45 08             	mov    0x8(%ebp),%eax
 ac7:	89 04 24             	mov    %eax,(%esp)
 aca:	e8 b1 fd ff ff       	call   880 <lock_init>
}
 acf:	c9                   	leave  
 ad0:	c3                   	ret    

00000ad1 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 ad1:	55                   	push   %ebp
 ad2:	89 e5                	mov    %esp,%ebp
 ad4:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 ad7:	8b 45 08             	mov    0x8(%ebp),%eax
 ada:	89 04 24             	mov    %eax,(%esp)
 add:	e8 ac fd ff ff       	call   88e <lock_acquire>
	if(s->count  == 0){
 ae2:	8b 45 08             	mov    0x8(%ebp),%eax
 ae5:	8b 40 04             	mov    0x4(%eax),%eax
 ae8:	85 c0                	test   %eax,%eax
 aea:	75 43                	jne    b2f <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 aec:	c7 44 24 04 30 0c 00 	movl   $0xc30,0x4(%esp)
 af3:	00 
 af4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 afb:	e8 9a f9 ff ff       	call   49a <printf>
		//add proc to waiters list
		int tid = getpid();
 b00:	e8 6d f8 ff ff       	call   372 <getpid>
 b05:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 b08:	8b 45 08             	mov    0x8(%ebp),%eax
 b0b:	8d 50 0c             	lea    0xc(%eax),%edx
 b0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b11:	89 44 24 04          	mov    %eax,0x4(%esp)
 b15:	89 14 24             	mov    %edx,(%esp)
 b18:	e8 9b fe ff ff       	call   9b8 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 b1d:	8b 45 08             	mov    0x8(%ebp),%eax
 b20:	89 04 24             	mov    %eax,(%esp)
 b23:	e8 86 fd ff ff       	call   8ae <lock_release>
		tsleep(); 
 b28:	e8 75 f8 ff ff       	call   3a2 <tsleep>
 b2d:	eb 2e                	jmp    b5d <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 b2f:	c7 44 24 04 37 0c 00 	movl   $0xc37,0x4(%esp)
 b36:	00 
 b37:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b3e:	e8 57 f9 ff ff       	call   49a <printf>
		s->count--;	
 b43:	8b 45 08             	mov    0x8(%ebp),%eax
 b46:	8b 40 04             	mov    0x4(%eax),%eax
 b49:	8d 50 ff             	lea    -0x1(%eax),%edx
 b4c:	8b 45 08             	mov    0x8(%ebp),%eax
 b4f:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b52:	8b 45 08             	mov    0x8(%ebp),%eax
 b55:	89 04 24             	mov    %eax,(%esp)
 b58:	e8 51 fd ff ff       	call   8ae <lock_release>
	}
}
 b5d:	c9                   	leave  
 b5e:	c3                   	ret    

00000b5f <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b5f:	55                   	push   %ebp
 b60:	89 e5                	mov    %esp,%ebp
 b62:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 b65:	c7 44 24 04 3e 0c 00 	movl   $0xc3e,0x4(%esp)
 b6c:	00 
 b6d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b74:	e8 21 f9 ff ff       	call   49a <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b79:	8b 45 08             	mov    0x8(%ebp),%eax
 b7c:	89 04 24             	mov    %eax,(%esp)
 b7f:	e8 0a fd ff ff       	call   88e <lock_acquire>
	if(s->count < s->size){
 b84:	8b 45 08             	mov    0x8(%ebp),%eax
 b87:	8b 50 04             	mov    0x4(%eax),%edx
 b8a:	8b 45 08             	mov    0x8(%ebp),%eax
 b8d:	8b 40 08             	mov    0x8(%eax),%eax
 b90:	39 c2                	cmp    %eax,%edx
 b92:	7d 0f                	jge    ba3 <sem_signal+0x44>
		s->count++;	
 b94:	8b 45 08             	mov    0x8(%ebp),%eax
 b97:	8b 40 04             	mov    0x4(%eax),%eax
 b9a:	8d 50 01             	lea    0x1(%eax),%edx
 b9d:	8b 45 08             	mov    0x8(%ebp),%eax
 ba0:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 ba3:	8b 45 08             	mov    0x8(%ebp),%eax
 ba6:	83 c0 0c             	add    $0xc,%eax
 ba9:	89 04 24             	mov    %eax,(%esp)
 bac:	e8 81 fe ff ff       	call   a32 <pop_q>
 bb1:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 bb4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 bb8:	74 2e                	je     be8 <sem_signal+0x89>
		printf(1, "Sem A\n");
 bba:	c7 44 24 04 37 0c 00 	movl   $0xc37,0x4(%esp)
 bc1:	00 
 bc2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bc9:	e8 cc f8 ff ff       	call   49a <printf>
		twakeup(tid);
 bce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd1:	89 04 24             	mov    %eax,(%esp)
 bd4:	e8 d1 f7 ff ff       	call   3aa <twakeup>
		s->count--;
 bd9:	8b 45 08             	mov    0x8(%ebp),%eax
 bdc:	8b 40 04             	mov    0x4(%eax),%eax
 bdf:	8d 50 ff             	lea    -0x1(%eax),%edx
 be2:	8b 45 08             	mov    0x8(%ebp),%eax
 be5:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 be8:	8b 45 08             	mov    0x8(%ebp),%eax
 beb:	89 04 24             	mov    %eax,(%esp)
 bee:	e8 bb fc ff ff       	call   8ae <lock_release>

 bf3:	c9                   	leave  
 bf4:	c3                   	ret    
