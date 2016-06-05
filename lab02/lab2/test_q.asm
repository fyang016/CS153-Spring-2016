
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
  10:	e8 62 07 00 00       	call   777 <malloc>
  15:	89 44 24 18          	mov    %eax,0x18(%esp)
    int i;
    init_q(q);
  19:	8b 44 24 18          	mov    0x18(%esp),%eax
  1d:	89 04 24             	mov    %eax,(%esp)
  20:	e8 63 09 00 00       	call   988 <init_q>
    for(i=0;i<10;i++){
  25:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  2c:	00 
  2d:	eb 19                	jmp    48 <main+0x48>
        add_q(q,i);
  2f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  33:	89 44 24 04          	mov    %eax,0x4(%esp)
  37:	8b 44 24 18          	mov    0x18(%esp),%eax
  3b:	89 04 24             	mov    %eax,(%esp)
  3e:	e8 67 09 00 00       	call   9aa <add_q>

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
  58:	e8 c7 09 00 00       	call   a24 <pop_q>
  5d:	89 44 24 08          	mov    %eax,0x8(%esp)
  61:	c7 44 24 04 ea 0b 00 	movl   $0xbea,0x4(%esp)
  68:	00 
  69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  70:	e8 1c 04 00 00       	call   491 <printf>
    int i;
    init_q(q);
    for(i=0;i<10;i++){
        add_q(q,i);
    }
    for(;!empty_q(q);){
  75:	8b 44 24 18          	mov    0x18(%esp),%eax
  79:	89 04 24             	mov    %eax,(%esp)
  7c:	e8 89 09 00 00       	call   a0a <empty_q>
  81:	85 c0                	test   %eax,%eax
  83:	74 cc                	je     51 <main+0x51>
        printf(1,"pop %d\n",pop_q(q));
    }
    exit();
  85:	e8 66 02 00 00       	call   2f0 <exit>
  8a:	90                   	nop
  8b:	90                   	nop

0000008c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  8c:	55                   	push   %ebp
  8d:	89 e5                	mov    %esp,%ebp
  8f:	57                   	push   %edi
  90:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  91:	8b 4d 08             	mov    0x8(%ebp),%ecx
  94:	8b 55 10             	mov    0x10(%ebp),%edx
  97:	8b 45 0c             	mov    0xc(%ebp),%eax
  9a:	89 cb                	mov    %ecx,%ebx
  9c:	89 df                	mov    %ebx,%edi
  9e:	89 d1                	mov    %edx,%ecx
  a0:	fc                   	cld    
  a1:	f3 aa                	rep stos %al,%es:(%edi)
  a3:	89 ca                	mov    %ecx,%edx
  a5:	89 fb                	mov    %edi,%ebx
  a7:	89 5d 08             	mov    %ebx,0x8(%ebp)
  aa:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  ad:	5b                   	pop    %ebx
  ae:	5f                   	pop    %edi
  af:	5d                   	pop    %ebp
  b0:	c3                   	ret    

000000b1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  b1:	55                   	push   %ebp
  b2:	89 e5                	mov    %esp,%ebp
  b4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  b7:	8b 45 08             	mov    0x8(%ebp),%eax
  ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
  bd:	8b 45 0c             	mov    0xc(%ebp),%eax
  c0:	0f b6 10             	movzbl (%eax),%edx
  c3:	8b 45 08             	mov    0x8(%ebp),%eax
  c6:	88 10                	mov    %dl,(%eax)
  c8:	8b 45 08             	mov    0x8(%ebp),%eax
  cb:	0f b6 00             	movzbl (%eax),%eax
  ce:	84 c0                	test   %al,%al
  d0:	0f 95 c0             	setne  %al
  d3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
  d7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
  db:	84 c0                	test   %al,%al
  dd:	75 de                	jne    bd <strcpy+0xc>
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
 11d:	89 d1                	mov    %edx,%ecx
 11f:	29 c1                	sub    %eax,%ecx
 121:	89 c8                	mov    %ecx,%eax
}
 123:	5d                   	pop    %ebp
 124:	c3                   	ret    

00000125 <strlen>:

uint
strlen(char *s)
{
 125:	55                   	push   %ebp
 126:	89 e5                	mov    %esp,%ebp
 128:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 12b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 132:	eb 04                	jmp    138 <strlen+0x13>
 134:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 138:	8b 45 fc             	mov    -0x4(%ebp),%eax
 13b:	03 45 08             	add    0x8(%ebp),%eax
 13e:	0f b6 00             	movzbl (%eax),%eax
 141:	84 c0                	test   %al,%al
 143:	75 ef                	jne    134 <strlen+0xf>
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
 164:	e8 23 ff ff ff       	call   8c <stosb>
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
 1a7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1ae:	eb 44                	jmp    1f4 <gets+0x53>
    cc = read(0, &c, 1);
 1b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1b7:	00 
 1b8:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1c6:	e8 3d 01 00 00       	call   308 <read>
 1cb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 1ce:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 1d2:	7e 2d                	jle    201 <gets+0x60>
      break;
    buf[i++] = c;
 1d4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1d7:	03 45 08             	add    0x8(%ebp),%eax
 1da:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 1de:	88 10                	mov    %dl,(%eax)
 1e0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 1e4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1e8:	3c 0a                	cmp    $0xa,%al
 1ea:	74 16                	je     202 <gets+0x61>
 1ec:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 1f0:	3c 0d                	cmp    $0xd,%al
 1f2:	74 0e                	je     202 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 1f7:	83 c0 01             	add    $0x1,%eax
 1fa:	3b 45 0c             	cmp    0xc(%ebp),%eax
 1fd:	7c b1                	jl     1b0 <gets+0xf>
 1ff:	eb 01                	jmp    202 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 201:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 202:	8b 45 f0             	mov    -0x10(%ebp),%eax
 205:	03 45 08             	add    0x8(%ebp),%eax
 208:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 20e:	c9                   	leave  
 20f:	c3                   	ret    

00000210 <stat>:

int
stat(char *n, struct stat *st)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
 213:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 216:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 21d:	00 
 21e:	8b 45 08             	mov    0x8(%ebp),%eax
 221:	89 04 24             	mov    %eax,(%esp)
 224:	e8 07 01 00 00       	call   330 <open>
 229:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 22c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 230:	79 07                	jns    239 <stat+0x29>
    return -1;
 232:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 237:	eb 23                	jmp    25c <stat+0x4c>
  r = fstat(fd, st);
 239:	8b 45 0c             	mov    0xc(%ebp),%eax
 23c:	89 44 24 04          	mov    %eax,0x4(%esp)
 240:	8b 45 f0             	mov    -0x10(%ebp),%eax
 243:	89 04 24             	mov    %eax,(%esp)
 246:	e8 fd 00 00 00       	call   348 <fstat>
 24b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 24e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 251:	89 04 24             	mov    %eax,(%esp)
 254:	e8 bf 00 00 00       	call   318 <close>
  return r;
 259:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 25c:	c9                   	leave  
 25d:	c3                   	ret    

0000025e <atoi>:

int
atoi(const char *s)
{
 25e:	55                   	push   %ebp
 25f:	89 e5                	mov    %esp,%ebp
 261:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 264:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 26b:	eb 24                	jmp    291 <atoi+0x33>
    n = n*10 + *s++ - '0';
 26d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 270:	89 d0                	mov    %edx,%eax
 272:	c1 e0 02             	shl    $0x2,%eax
 275:	01 d0                	add    %edx,%eax
 277:	01 c0                	add    %eax,%eax
 279:	89 c2                	mov    %eax,%edx
 27b:	8b 45 08             	mov    0x8(%ebp),%eax
 27e:	0f b6 00             	movzbl (%eax),%eax
 281:	0f be c0             	movsbl %al,%eax
 284:	8d 04 02             	lea    (%edx,%eax,1),%eax
 287:	83 e8 30             	sub    $0x30,%eax
 28a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 28d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 291:	8b 45 08             	mov    0x8(%ebp),%eax
 294:	0f b6 00             	movzbl (%eax),%eax
 297:	3c 2f                	cmp    $0x2f,%al
 299:	7e 0a                	jle    2a5 <atoi+0x47>
 29b:	8b 45 08             	mov    0x8(%ebp),%eax
 29e:	0f b6 00             	movzbl (%eax),%eax
 2a1:	3c 39                	cmp    $0x39,%al
 2a3:	7e c8                	jle    26d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a8:	c9                   	leave  
 2a9:	c3                   	ret    

000002aa <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2aa:	55                   	push   %ebp
 2ab:	89 e5                	mov    %esp,%ebp
 2ad:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2b0:	8b 45 08             	mov    0x8(%ebp),%eax
 2b3:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 2b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 2bc:	eb 13                	jmp    2d1 <memmove+0x27>
    *dst++ = *src++;
 2be:	8b 45 fc             	mov    -0x4(%ebp),%eax
 2c1:	0f b6 10             	movzbl (%eax),%edx
 2c4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 2c7:	88 10                	mov    %dl,(%eax)
 2c9:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 2cd:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 2d1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 2d5:	0f 9f c0             	setg   %al
 2d8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 2dc:	84 c0                	test   %al,%al
 2de:	75 de                	jne    2be <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 2e0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    
 2e5:	90                   	nop
 2e6:	90                   	nop
 2e7:	90                   	nop

000002e8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 2e8:	b8 01 00 00 00       	mov    $0x1,%eax
 2ed:	cd 40                	int    $0x40
 2ef:	c3                   	ret    

000002f0 <exit>:
SYSCALL(exit)
 2f0:	b8 02 00 00 00       	mov    $0x2,%eax
 2f5:	cd 40                	int    $0x40
 2f7:	c3                   	ret    

000002f8 <wait>:
SYSCALL(wait)
 2f8:	b8 03 00 00 00       	mov    $0x3,%eax
 2fd:	cd 40                	int    $0x40
 2ff:	c3                   	ret    

00000300 <pipe>:
SYSCALL(pipe)
 300:	b8 04 00 00 00       	mov    $0x4,%eax
 305:	cd 40                	int    $0x40
 307:	c3                   	ret    

00000308 <read>:
SYSCALL(read)
 308:	b8 05 00 00 00       	mov    $0x5,%eax
 30d:	cd 40                	int    $0x40
 30f:	c3                   	ret    

00000310 <write>:
SYSCALL(write)
 310:	b8 10 00 00 00       	mov    $0x10,%eax
 315:	cd 40                	int    $0x40
 317:	c3                   	ret    

00000318 <close>:
SYSCALL(close)
 318:	b8 15 00 00 00       	mov    $0x15,%eax
 31d:	cd 40                	int    $0x40
 31f:	c3                   	ret    

00000320 <kill>:
SYSCALL(kill)
 320:	b8 06 00 00 00       	mov    $0x6,%eax
 325:	cd 40                	int    $0x40
 327:	c3                   	ret    

00000328 <exec>:
SYSCALL(exec)
 328:	b8 07 00 00 00       	mov    $0x7,%eax
 32d:	cd 40                	int    $0x40
 32f:	c3                   	ret    

00000330 <open>:
SYSCALL(open)
 330:	b8 0f 00 00 00       	mov    $0xf,%eax
 335:	cd 40                	int    $0x40
 337:	c3                   	ret    

00000338 <mknod>:
SYSCALL(mknod)
 338:	b8 11 00 00 00       	mov    $0x11,%eax
 33d:	cd 40                	int    $0x40
 33f:	c3                   	ret    

00000340 <unlink>:
SYSCALL(unlink)
 340:	b8 12 00 00 00       	mov    $0x12,%eax
 345:	cd 40                	int    $0x40
 347:	c3                   	ret    

00000348 <fstat>:
SYSCALL(fstat)
 348:	b8 08 00 00 00       	mov    $0x8,%eax
 34d:	cd 40                	int    $0x40
 34f:	c3                   	ret    

00000350 <link>:
SYSCALL(link)
 350:	b8 13 00 00 00       	mov    $0x13,%eax
 355:	cd 40                	int    $0x40
 357:	c3                   	ret    

00000358 <mkdir>:
SYSCALL(mkdir)
 358:	b8 14 00 00 00       	mov    $0x14,%eax
 35d:	cd 40                	int    $0x40
 35f:	c3                   	ret    

00000360 <chdir>:
SYSCALL(chdir)
 360:	b8 09 00 00 00       	mov    $0x9,%eax
 365:	cd 40                	int    $0x40
 367:	c3                   	ret    

00000368 <dup>:
SYSCALL(dup)
 368:	b8 0a 00 00 00       	mov    $0xa,%eax
 36d:	cd 40                	int    $0x40
 36f:	c3                   	ret    

00000370 <getpid>:
SYSCALL(getpid)
 370:	b8 0b 00 00 00       	mov    $0xb,%eax
 375:	cd 40                	int    $0x40
 377:	c3                   	ret    

00000378 <sbrk>:
SYSCALL(sbrk)
 378:	b8 0c 00 00 00       	mov    $0xc,%eax
 37d:	cd 40                	int    $0x40
 37f:	c3                   	ret    

00000380 <sleep>:
SYSCALL(sleep)
 380:	b8 0d 00 00 00       	mov    $0xd,%eax
 385:	cd 40                	int    $0x40
 387:	c3                   	ret    

00000388 <uptime>:
SYSCALL(uptime)
 388:	b8 0e 00 00 00       	mov    $0xe,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <clone>:
SYSCALL(clone)
 390:	b8 16 00 00 00       	mov    $0x16,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <texit>:
SYSCALL(texit)
 398:	b8 17 00 00 00       	mov    $0x17,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <tsleep>:
SYSCALL(tsleep)
 3a0:	b8 18 00 00 00       	mov    $0x18,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <twakeup>:
SYSCALL(twakeup)
 3a8:	b8 19 00 00 00       	mov    $0x19,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <test>:
SYSCALL(test)
 3b0:	b8 1a 00 00 00       	mov    $0x1a,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3b8:	55                   	push   %ebp
 3b9:	89 e5                	mov    %esp,%ebp
 3bb:	83 ec 28             	sub    $0x28,%esp
 3be:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c1:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3c4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3cb:	00 
 3cc:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	89 04 24             	mov    %eax,(%esp)
 3d9:	e8 32 ff ff ff       	call   310 <write>
}
 3de:	c9                   	leave  
 3df:	c3                   	ret    

000003e0 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 3e0:	55                   	push   %ebp
 3e1:	89 e5                	mov    %esp,%ebp
 3e3:	53                   	push   %ebx
 3e4:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 3e7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 3ee:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 3f2:	74 17                	je     40b <printint+0x2b>
 3f4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 3f8:	79 11                	jns    40b <printint+0x2b>
    neg = 1;
 3fa:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 401:	8b 45 0c             	mov    0xc(%ebp),%eax
 404:	f7 d8                	neg    %eax
 406:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 409:	eb 06                	jmp    411 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 40b:	8b 45 0c             	mov    0xc(%ebp),%eax
 40e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 411:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 418:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 41b:	8b 5d 10             	mov    0x10(%ebp),%ebx
 41e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 421:	ba 00 00 00 00       	mov    $0x0,%edx
 426:	f7 f3                	div    %ebx
 428:	89 d0                	mov    %edx,%eax
 42a:	0f b6 80 3c 0c 00 00 	movzbl 0xc3c(%eax),%eax
 431:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 435:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 439:	8b 45 10             	mov    0x10(%ebp),%eax
 43c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 43f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 442:	ba 00 00 00 00       	mov    $0x0,%edx
 447:	f7 75 d4             	divl   -0x2c(%ebp)
 44a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 44d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 451:	75 c5                	jne    418 <printint+0x38>
  if(neg)
 453:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 457:	74 28                	je     481 <printint+0xa1>
    buf[i++] = '-';
 459:	8b 45 ec             	mov    -0x14(%ebp),%eax
 45c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 461:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 465:	eb 1a                	jmp    481 <printint+0xa1>
    putc(fd, buf[i]);
 467:	8b 45 ec             	mov    -0x14(%ebp),%eax
 46a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 46f:	0f be c0             	movsbl %al,%eax
 472:	89 44 24 04          	mov    %eax,0x4(%esp)
 476:	8b 45 08             	mov    0x8(%ebp),%eax
 479:	89 04 24             	mov    %eax,(%esp)
 47c:	e8 37 ff ff ff       	call   3b8 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 481:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 485:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 489:	79 dc                	jns    467 <printint+0x87>
    putc(fd, buf[i]);
}
 48b:	83 c4 44             	add    $0x44,%esp
 48e:	5b                   	pop    %ebx
 48f:	5d                   	pop    %ebp
 490:	c3                   	ret    

00000491 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 491:	55                   	push   %ebp
 492:	89 e5                	mov    %esp,%ebp
 494:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 497:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 49e:	8d 45 0c             	lea    0xc(%ebp),%eax
 4a1:	83 c0 04             	add    $0x4,%eax
 4a4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 4a7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 4ae:	e9 7e 01 00 00       	jmp    631 <printf+0x1a0>
    c = fmt[i] & 0xff;
 4b3:	8b 55 0c             	mov    0xc(%ebp),%edx
 4b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4b9:	8d 04 02             	lea    (%edx,%eax,1),%eax
 4bc:	0f b6 00             	movzbl (%eax),%eax
 4bf:	0f be c0             	movsbl %al,%eax
 4c2:	25 ff 00 00 00       	and    $0xff,%eax
 4c7:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 4ca:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ce:	75 2c                	jne    4fc <printf+0x6b>
      if(c == '%'){
 4d0:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 4d4:	75 0c                	jne    4e2 <printf+0x51>
        state = '%';
 4d6:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 4dd:	e9 4b 01 00 00       	jmp    62d <printf+0x19c>
      } else {
        putc(fd, c);
 4e2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 4e5:	0f be c0             	movsbl %al,%eax
 4e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ec:	8b 45 08             	mov    0x8(%ebp),%eax
 4ef:	89 04 24             	mov    %eax,(%esp)
 4f2:	e8 c1 fe ff ff       	call   3b8 <putc>
 4f7:	e9 31 01 00 00       	jmp    62d <printf+0x19c>
      }
    } else if(state == '%'){
 4fc:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 500:	0f 85 27 01 00 00    	jne    62d <printf+0x19c>
      if(c == 'd'){
 506:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 50a:	75 2d                	jne    539 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 50c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50f:	8b 00                	mov    (%eax),%eax
 511:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 518:	00 
 519:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 520:	00 
 521:	89 44 24 04          	mov    %eax,0x4(%esp)
 525:	8b 45 08             	mov    0x8(%ebp),%eax
 528:	89 04 24             	mov    %eax,(%esp)
 52b:	e8 b0 fe ff ff       	call   3e0 <printint>
        ap++;
 530:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 534:	e9 ed 00 00 00       	jmp    626 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 539:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 53d:	74 06                	je     545 <printf+0xb4>
 53f:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 543:	75 2d                	jne    572 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 545:	8b 45 f4             	mov    -0xc(%ebp),%eax
 548:	8b 00                	mov    (%eax),%eax
 54a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 551:	00 
 552:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 559:	00 
 55a:	89 44 24 04          	mov    %eax,0x4(%esp)
 55e:	8b 45 08             	mov    0x8(%ebp),%eax
 561:	89 04 24             	mov    %eax,(%esp)
 564:	e8 77 fe ff ff       	call   3e0 <printint>
        ap++;
 569:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 56d:	e9 b4 00 00 00       	jmp    626 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 572:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 576:	75 46                	jne    5be <printf+0x12d>
        s = (char*)*ap;
 578:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57b:	8b 00                	mov    (%eax),%eax
 57d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 580:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 584:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 588:	75 27                	jne    5b1 <printf+0x120>
          s = "(null)";
 58a:	c7 45 e4 f2 0b 00 00 	movl   $0xbf2,-0x1c(%ebp)
        while(*s != 0){
 591:	eb 1f                	jmp    5b2 <printf+0x121>
          putc(fd, *s);
 593:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 596:	0f b6 00             	movzbl (%eax),%eax
 599:	0f be c0             	movsbl %al,%eax
 59c:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a0:	8b 45 08             	mov    0x8(%ebp),%eax
 5a3:	89 04 24             	mov    %eax,(%esp)
 5a6:	e8 0d fe ff ff       	call   3b8 <putc>
          s++;
 5ab:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 5af:	eb 01                	jmp    5b2 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5b1:	90                   	nop
 5b2:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5b5:	0f b6 00             	movzbl (%eax),%eax
 5b8:	84 c0                	test   %al,%al
 5ba:	75 d7                	jne    593 <printf+0x102>
 5bc:	eb 68                	jmp    626 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5be:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 5c2:	75 1d                	jne    5e1 <printf+0x150>
        putc(fd, *ap);
 5c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c7:	8b 00                	mov    (%eax),%eax
 5c9:	0f be c0             	movsbl %al,%eax
 5cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d0:	8b 45 08             	mov    0x8(%ebp),%eax
 5d3:	89 04 24             	mov    %eax,(%esp)
 5d6:	e8 dd fd ff ff       	call   3b8 <putc>
        ap++;
 5db:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5df:	eb 45                	jmp    626 <printf+0x195>
      } else if(c == '%'){
 5e1:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5e5:	75 17                	jne    5fe <printf+0x16d>
        putc(fd, c);
 5e7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5ea:	0f be c0             	movsbl %al,%eax
 5ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f1:	8b 45 08             	mov    0x8(%ebp),%eax
 5f4:	89 04 24             	mov    %eax,(%esp)
 5f7:	e8 bc fd ff ff       	call   3b8 <putc>
 5fc:	eb 28                	jmp    626 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 5fe:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 605:	00 
 606:	8b 45 08             	mov    0x8(%ebp),%eax
 609:	89 04 24             	mov    %eax,(%esp)
 60c:	e8 a7 fd ff ff       	call   3b8 <putc>
        putc(fd, c);
 611:	8b 45 e8             	mov    -0x18(%ebp),%eax
 614:	0f be c0             	movsbl %al,%eax
 617:	89 44 24 04          	mov    %eax,0x4(%esp)
 61b:	8b 45 08             	mov    0x8(%ebp),%eax
 61e:	89 04 24             	mov    %eax,(%esp)
 621:	e8 92 fd ff ff       	call   3b8 <putc>
      }
      state = 0;
 626:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 62d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 631:	8b 55 0c             	mov    0xc(%ebp),%edx
 634:	8b 45 ec             	mov    -0x14(%ebp),%eax
 637:	8d 04 02             	lea    (%edx,%eax,1),%eax
 63a:	0f b6 00             	movzbl (%eax),%eax
 63d:	84 c0                	test   %al,%al
 63f:	0f 85 6e fe ff ff    	jne    4b3 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 645:	c9                   	leave  
 646:	c3                   	ret    
 647:	90                   	nop

00000648 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 648:	55                   	push   %ebp
 649:	89 e5                	mov    %esp,%ebp
 64b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 64e:	8b 45 08             	mov    0x8(%ebp),%eax
 651:	83 e8 08             	sub    $0x8,%eax
 654:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 657:	a1 58 0c 00 00       	mov    0xc58,%eax
 65c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 65f:	eb 24                	jmp    685 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 661:	8b 45 fc             	mov    -0x4(%ebp),%eax
 664:	8b 00                	mov    (%eax),%eax
 666:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 669:	77 12                	ja     67d <free+0x35>
 66b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 66e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 671:	77 24                	ja     697 <free+0x4f>
 673:	8b 45 fc             	mov    -0x4(%ebp),%eax
 676:	8b 00                	mov    (%eax),%eax
 678:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 67b:	77 1a                	ja     697 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 67d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 680:	8b 00                	mov    (%eax),%eax
 682:	89 45 fc             	mov    %eax,-0x4(%ebp)
 685:	8b 45 f8             	mov    -0x8(%ebp),%eax
 688:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 68b:	76 d4                	jbe    661 <free+0x19>
 68d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 690:	8b 00                	mov    (%eax),%eax
 692:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 695:	76 ca                	jbe    661 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 697:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69a:	8b 40 04             	mov    0x4(%eax),%eax
 69d:	c1 e0 03             	shl    $0x3,%eax
 6a0:	89 c2                	mov    %eax,%edx
 6a2:	03 55 f8             	add    -0x8(%ebp),%edx
 6a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a8:	8b 00                	mov    (%eax),%eax
 6aa:	39 c2                	cmp    %eax,%edx
 6ac:	75 24                	jne    6d2 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 6ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b1:	8b 50 04             	mov    0x4(%eax),%edx
 6b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b7:	8b 00                	mov    (%eax),%eax
 6b9:	8b 40 04             	mov    0x4(%eax),%eax
 6bc:	01 c2                	add    %eax,%edx
 6be:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c1:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6c7:	8b 00                	mov    (%eax),%eax
 6c9:	8b 10                	mov    (%eax),%edx
 6cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ce:	89 10                	mov    %edx,(%eax)
 6d0:	eb 0a                	jmp    6dc <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 6d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d5:	8b 10                	mov    (%eax),%edx
 6d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6da:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 6dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6df:	8b 40 04             	mov    0x4(%eax),%eax
 6e2:	c1 e0 03             	shl    $0x3,%eax
 6e5:	03 45 fc             	add    -0x4(%ebp),%eax
 6e8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6eb:	75 20                	jne    70d <free+0xc5>
    p->s.size += bp->s.size;
 6ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f0:	8b 50 04             	mov    0x4(%eax),%edx
 6f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f6:	8b 40 04             	mov    0x4(%eax),%eax
 6f9:	01 c2                	add    %eax,%edx
 6fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fe:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 701:	8b 45 f8             	mov    -0x8(%ebp),%eax
 704:	8b 10                	mov    (%eax),%edx
 706:	8b 45 fc             	mov    -0x4(%ebp),%eax
 709:	89 10                	mov    %edx,(%eax)
 70b:	eb 08                	jmp    715 <free+0xcd>
  } else
    p->s.ptr = bp;
 70d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 710:	8b 55 f8             	mov    -0x8(%ebp),%edx
 713:	89 10                	mov    %edx,(%eax)
  freep = p;
 715:	8b 45 fc             	mov    -0x4(%ebp),%eax
 718:	a3 58 0c 00 00       	mov    %eax,0xc58
}
 71d:	c9                   	leave  
 71e:	c3                   	ret    

0000071f <morecore>:

static Header*
morecore(uint nu)
{
 71f:	55                   	push   %ebp
 720:	89 e5                	mov    %esp,%ebp
 722:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 725:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 72c:	77 07                	ja     735 <morecore+0x16>
    nu = 4096;
 72e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 735:	8b 45 08             	mov    0x8(%ebp),%eax
 738:	c1 e0 03             	shl    $0x3,%eax
 73b:	89 04 24             	mov    %eax,(%esp)
 73e:	e8 35 fc ff ff       	call   378 <sbrk>
 743:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 746:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 74a:	75 07                	jne    753 <morecore+0x34>
    return 0;
 74c:	b8 00 00 00 00       	mov    $0x0,%eax
 751:	eb 22                	jmp    775 <morecore+0x56>
  hp = (Header*)p;
 753:	8b 45 f0             	mov    -0x10(%ebp),%eax
 756:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 759:	8b 45 f4             	mov    -0xc(%ebp),%eax
 75c:	8b 55 08             	mov    0x8(%ebp),%edx
 75f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 762:	8b 45 f4             	mov    -0xc(%ebp),%eax
 765:	83 c0 08             	add    $0x8,%eax
 768:	89 04 24             	mov    %eax,(%esp)
 76b:	e8 d8 fe ff ff       	call   648 <free>
  return freep;
 770:	a1 58 0c 00 00       	mov    0xc58,%eax
}
 775:	c9                   	leave  
 776:	c3                   	ret    

00000777 <malloc>:

void*
malloc(uint nbytes)
{
 777:	55                   	push   %ebp
 778:	89 e5                	mov    %esp,%ebp
 77a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 77d:	8b 45 08             	mov    0x8(%ebp),%eax
 780:	83 c0 07             	add    $0x7,%eax
 783:	c1 e8 03             	shr    $0x3,%eax
 786:	83 c0 01             	add    $0x1,%eax
 789:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 78c:	a1 58 0c 00 00       	mov    0xc58,%eax
 791:	89 45 f0             	mov    %eax,-0x10(%ebp)
 794:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 798:	75 23                	jne    7bd <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 79a:	c7 45 f0 50 0c 00 00 	movl   $0xc50,-0x10(%ebp)
 7a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a4:	a3 58 0c 00 00       	mov    %eax,0xc58
 7a9:	a1 58 0c 00 00       	mov    0xc58,%eax
 7ae:	a3 50 0c 00 00       	mov    %eax,0xc50
    base.s.size = 0;
 7b3:	c7 05 54 0c 00 00 00 	movl   $0x0,0xc54
 7ba:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c0:	8b 00                	mov    (%eax),%eax
 7c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 7c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7c8:	8b 40 04             	mov    0x4(%eax),%eax
 7cb:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7ce:	72 4d                	jb     81d <malloc+0xa6>
      if(p->s.size == nunits)
 7d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d3:	8b 40 04             	mov    0x4(%eax),%eax
 7d6:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7d9:	75 0c                	jne    7e7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 7db:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7de:	8b 10                	mov    (%eax),%edx
 7e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e3:	89 10                	mov    %edx,(%eax)
 7e5:	eb 26                	jmp    80d <malloc+0x96>
      else {
        p->s.size -= nunits;
 7e7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ea:	8b 40 04             	mov    0x4(%eax),%eax
 7ed:	89 c2                	mov    %eax,%edx
 7ef:	2b 55 f4             	sub    -0xc(%ebp),%edx
 7f2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 7f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7fb:	8b 40 04             	mov    0x4(%eax),%eax
 7fe:	c1 e0 03             	shl    $0x3,%eax
 801:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 804:	8b 45 ec             	mov    -0x14(%ebp),%eax
 807:	8b 55 f4             	mov    -0xc(%ebp),%edx
 80a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 80d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 810:	a3 58 0c 00 00       	mov    %eax,0xc58
      return (void*)(p + 1);
 815:	8b 45 ec             	mov    -0x14(%ebp),%eax
 818:	83 c0 08             	add    $0x8,%eax
 81b:	eb 38                	jmp    855 <malloc+0xde>
    }
    if(p == freep)
 81d:	a1 58 0c 00 00       	mov    0xc58,%eax
 822:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 825:	75 1b                	jne    842 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 827:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82a:	89 04 24             	mov    %eax,(%esp)
 82d:	e8 ed fe ff ff       	call   71f <morecore>
 832:	89 45 ec             	mov    %eax,-0x14(%ebp)
 835:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 839:	75 07                	jne    842 <malloc+0xcb>
        return 0;
 83b:	b8 00 00 00 00       	mov    $0x0,%eax
 840:	eb 13                	jmp    855 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 842:	8b 45 ec             	mov    -0x14(%ebp),%eax
 845:	89 45 f0             	mov    %eax,-0x10(%ebp)
 848:	8b 45 ec             	mov    -0x14(%ebp),%eax
 84b:	8b 00                	mov    (%eax),%eax
 84d:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 850:	e9 70 ff ff ff       	jmp    7c5 <malloc+0x4e>
}
 855:	c9                   	leave  
 856:	c3                   	ret    
 857:	90                   	nop

00000858 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 858:	55                   	push   %ebp
 859:	89 e5                	mov    %esp,%ebp
 85b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 85e:	8b 55 08             	mov    0x8(%ebp),%edx
 861:	8b 45 0c             	mov    0xc(%ebp),%eax
 864:	8b 4d 08             	mov    0x8(%ebp),%ecx
 867:	f0 87 02             	lock xchg %eax,(%edx)
 86a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 86d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 870:	c9                   	leave  
 871:	c3                   	ret    

00000872 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 872:	55                   	push   %ebp
 873:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 875:	8b 45 08             	mov    0x8(%ebp),%eax
 878:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 87e:	5d                   	pop    %ebp
 87f:	c3                   	ret    

00000880 <lock_acquire>:
void lock_acquire(lock_t *lock){
 880:	55                   	push   %ebp
 881:	89 e5                	mov    %esp,%ebp
 883:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 886:	8b 45 08             	mov    0x8(%ebp),%eax
 889:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 890:	00 
 891:	89 04 24             	mov    %eax,(%esp)
 894:	e8 bf ff ff ff       	call   858 <xchg>
 899:	85 c0                	test   %eax,%eax
 89b:	75 e9                	jne    886 <lock_acquire+0x6>
}
 89d:	c9                   	leave  
 89e:	c3                   	ret    

0000089f <lock_release>:
void lock_release(lock_t *lock){
 89f:	55                   	push   %ebp
 8a0:	89 e5                	mov    %esp,%ebp
 8a2:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 8a5:	8b 45 08             	mov    0x8(%ebp),%eax
 8a8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8af:	00 
 8b0:	89 04 24             	mov    %eax,(%esp)
 8b3:	e8 a0 ff ff ff       	call   858 <xchg>
}
 8b8:	c9                   	leave  
 8b9:	c3                   	ret    

000008ba <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 8ba:	55                   	push   %ebp
 8bb:	89 e5                	mov    %esp,%ebp
 8bd:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 8c0:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8c7:	e8 ab fe ff ff       	call   777 <malloc>
 8cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 8cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 8d5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d8:	25 ff 0f 00 00       	and    $0xfff,%eax
 8dd:	85 c0                	test   %eax,%eax
 8df:	74 15                	je     8f6 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 8e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e4:	89 c2                	mov    %eax,%edx
 8e6:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 8ec:	b8 00 10 00 00       	mov    $0x1000,%eax
 8f1:	29 d0                	sub    %edx,%eax
 8f3:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 8f6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8fa:	75 1b                	jne    917 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 8fc:	c7 44 24 04 f9 0b 00 	movl   $0xbf9,0x4(%esp)
 903:	00 
 904:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 90b:	e8 81 fb ff ff       	call   491 <printf>
        return 0;
 910:	b8 00 00 00 00       	mov    $0x0,%eax
 915:	eb 6f                	jmp    986 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 917:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 91a:	8b 55 08             	mov    0x8(%ebp),%edx
 91d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 920:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 924:	89 54 24 08          	mov    %edx,0x8(%esp)
 928:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 92f:	00 
 930:	89 04 24             	mov    %eax,(%esp)
 933:	e8 58 fa ff ff       	call   390 <clone>
 938:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 93b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 93f:	79 1b                	jns    95c <thread_create+0xa2>
        printf(1,"clone fails\n");
 941:	c7 44 24 04 07 0c 00 	movl   $0xc07,0x4(%esp)
 948:	00 
 949:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 950:	e8 3c fb ff ff       	call   491 <printf>
        return 0;
 955:	b8 00 00 00 00       	mov    $0x0,%eax
 95a:	eb 2a                	jmp    986 <thread_create+0xcc>
    }
    if(tid > 0){
 95c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 960:	7e 05                	jle    967 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 962:	8b 45 f4             	mov    -0xc(%ebp),%eax
 965:	eb 1f                	jmp    986 <thread_create+0xcc>
    }
    if(tid == 0){
 967:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 96b:	75 14                	jne    981 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 96d:	c7 44 24 04 14 0c 00 	movl   $0xc14,0x4(%esp)
 974:	00 
 975:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 97c:	e8 10 fb ff ff       	call   491 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 981:	b8 00 00 00 00       	mov    $0x0,%eax
}
 986:	c9                   	leave  
 987:	c3                   	ret    

00000988 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 988:	55                   	push   %ebp
 989:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 98b:	8b 45 08             	mov    0x8(%ebp),%eax
 98e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 994:	8b 45 08             	mov    0x8(%ebp),%eax
 997:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 99e:	8b 45 08             	mov    0x8(%ebp),%eax
 9a1:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 9a8:	5d                   	pop    %ebp
 9a9:	c3                   	ret    

000009aa <add_q>:

void add_q(struct queue *q, int v){
 9aa:	55                   	push   %ebp
 9ab:	89 e5                	mov    %esp,%ebp
 9ad:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 9b0:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 9b7:	e8 bb fd ff ff       	call   777 <malloc>
 9bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 9bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 9c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9cc:	8b 55 0c             	mov    0xc(%ebp),%edx
 9cf:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 9d1:	8b 45 08             	mov    0x8(%ebp),%eax
 9d4:	8b 40 04             	mov    0x4(%eax),%eax
 9d7:	85 c0                	test   %eax,%eax
 9d9:	75 0b                	jne    9e6 <add_q+0x3c>
        q->head = n;
 9db:	8b 45 08             	mov    0x8(%ebp),%eax
 9de:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9e1:	89 50 04             	mov    %edx,0x4(%eax)
 9e4:	eb 0c                	jmp    9f2 <add_q+0x48>
    }else{
        q->tail->next = n;
 9e6:	8b 45 08             	mov    0x8(%ebp),%eax
 9e9:	8b 40 08             	mov    0x8(%eax),%eax
 9ec:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9ef:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 9f2:	8b 45 08             	mov    0x8(%ebp),%eax
 9f5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 9f8:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 9fb:	8b 45 08             	mov    0x8(%ebp),%eax
 9fe:	8b 00                	mov    (%eax),%eax
 a00:	8d 50 01             	lea    0x1(%eax),%edx
 a03:	8b 45 08             	mov    0x8(%ebp),%eax
 a06:	89 10                	mov    %edx,(%eax)
}
 a08:	c9                   	leave  
 a09:	c3                   	ret    

00000a0a <empty_q>:

int empty_q(struct queue *q){
 a0a:	55                   	push   %ebp
 a0b:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 a0d:	8b 45 08             	mov    0x8(%ebp),%eax
 a10:	8b 00                	mov    (%eax),%eax
 a12:	85 c0                	test   %eax,%eax
 a14:	75 07                	jne    a1d <empty_q+0x13>
        return 1;
 a16:	b8 01 00 00 00       	mov    $0x1,%eax
 a1b:	eb 05                	jmp    a22 <empty_q+0x18>
    else
        return 0;
 a1d:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 a22:	5d                   	pop    %ebp
 a23:	c3                   	ret    

00000a24 <pop_q>:
int pop_q(struct queue *q){
 a24:	55                   	push   %ebp
 a25:	89 e5                	mov    %esp,%ebp
 a27:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a2a:	8b 45 08             	mov    0x8(%ebp),%eax
 a2d:	89 04 24             	mov    %eax,(%esp)
 a30:	e8 d5 ff ff ff       	call   a0a <empty_q>
 a35:	85 c0                	test   %eax,%eax
 a37:	75 5d                	jne    a96 <pop_q+0x72>
       val = q->head->value; 
 a39:	8b 45 08             	mov    0x8(%ebp),%eax
 a3c:	8b 40 04             	mov    0x4(%eax),%eax
 a3f:	8b 00                	mov    (%eax),%eax
 a41:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 a44:	8b 45 08             	mov    0x8(%ebp),%eax
 a47:	8b 40 04             	mov    0x4(%eax),%eax
 a4a:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 a4d:	8b 45 08             	mov    0x8(%ebp),%eax
 a50:	8b 40 04             	mov    0x4(%eax),%eax
 a53:	8b 50 04             	mov    0x4(%eax),%edx
 a56:	8b 45 08             	mov    0x8(%ebp),%eax
 a59:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5f:	89 04 24             	mov    %eax,(%esp)
 a62:	e8 e1 fb ff ff       	call   648 <free>
       q->size--;
 a67:	8b 45 08             	mov    0x8(%ebp),%eax
 a6a:	8b 00                	mov    (%eax),%eax
 a6c:	8d 50 ff             	lea    -0x1(%eax),%edx
 a6f:	8b 45 08             	mov    0x8(%ebp),%eax
 a72:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 a74:	8b 45 08             	mov    0x8(%ebp),%eax
 a77:	8b 00                	mov    (%eax),%eax
 a79:	85 c0                	test   %eax,%eax
 a7b:	75 14                	jne    a91 <pop_q+0x6d>
            q->head = 0;
 a7d:	8b 45 08             	mov    0x8(%ebp),%eax
 a80:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 a87:	8b 45 08             	mov    0x8(%ebp),%eax
 a8a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 a91:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a94:	eb 05                	jmp    a9b <pop_q+0x77>
    }
    return -1;
 a96:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 a9b:	c9                   	leave  
 a9c:	c3                   	ret    
 a9d:	90                   	nop
 a9e:	90                   	nop
 a9f:	90                   	nop

00000aa0 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 aa0:	55                   	push   %ebp
 aa1:	89 e5                	mov    %esp,%ebp
 aa3:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 aa6:	8b 45 08             	mov    0x8(%ebp),%eax
 aa9:	8b 55 0c             	mov    0xc(%ebp),%edx
 aac:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 aaf:	8b 45 08             	mov    0x8(%ebp),%eax
 ab2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 ab9:	8b 45 08             	mov    0x8(%ebp),%eax
 abc:	89 04 24             	mov    %eax,(%esp)
 abf:	e8 ae fd ff ff       	call   872 <lock_init>
}
 ac4:	c9                   	leave  
 ac5:	c3                   	ret    

00000ac6 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 ac6:	55                   	push   %ebp
 ac7:	89 e5                	mov    %esp,%ebp
 ac9:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 acc:	8b 45 08             	mov    0x8(%ebp),%eax
 acf:	89 04 24             	mov    %eax,(%esp)
 ad2:	e8 a9 fd ff ff       	call   880 <lock_acquire>
	if(s->count  == 0){
 ad7:	8b 45 08             	mov    0x8(%ebp),%eax
 ada:	8b 40 04             	mov    0x4(%eax),%eax
 add:	85 c0                	test   %eax,%eax
 adf:	75 43                	jne    b24 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 ae1:	c7 44 24 04 25 0c 00 	movl   $0xc25,0x4(%esp)
 ae8:	00 
 ae9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 af0:	e8 9c f9 ff ff       	call   491 <printf>
		//add proc to waiters list
		int tid = getpid();
 af5:	e8 76 f8 ff ff       	call   370 <getpid>
 afa:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 afd:	8b 45 08             	mov    0x8(%ebp),%eax
 b00:	8d 50 0c             	lea    0xc(%eax),%edx
 b03:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b06:	89 44 24 04          	mov    %eax,0x4(%esp)
 b0a:	89 14 24             	mov    %edx,(%esp)
 b0d:	e8 98 fe ff ff       	call   9aa <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 b12:	8b 45 08             	mov    0x8(%ebp),%eax
 b15:	89 04 24             	mov    %eax,(%esp)
 b18:	e8 82 fd ff ff       	call   89f <lock_release>
		tsleep(); 
 b1d:	e8 7e f8 ff ff       	call   3a0 <tsleep>
 b22:	eb 2e                	jmp    b52 <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 b24:	c7 44 24 04 2c 0c 00 	movl   $0xc2c,0x4(%esp)
 b2b:	00 
 b2c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b33:	e8 59 f9 ff ff       	call   491 <printf>
		s->count--;	
 b38:	8b 45 08             	mov    0x8(%ebp),%eax
 b3b:	8b 40 04             	mov    0x4(%eax),%eax
 b3e:	8d 50 ff             	lea    -0x1(%eax),%edx
 b41:	8b 45 08             	mov    0x8(%ebp),%eax
 b44:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b47:	8b 45 08             	mov    0x8(%ebp),%eax
 b4a:	89 04 24             	mov    %eax,(%esp)
 b4d:	e8 4d fd ff ff       	call   89f <lock_release>
	}
}
 b52:	c9                   	leave  
 b53:	c3                   	ret    

00000b54 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b54:	55                   	push   %ebp
 b55:	89 e5                	mov    %esp,%ebp
 b57:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 b5a:	c7 44 24 04 33 0c 00 	movl   $0xc33,0x4(%esp)
 b61:	00 
 b62:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b69:	e8 23 f9 ff ff       	call   491 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b6e:	8b 45 08             	mov    0x8(%ebp),%eax
 b71:	89 04 24             	mov    %eax,(%esp)
 b74:	e8 07 fd ff ff       	call   880 <lock_acquire>
	if(s->count < s->size){
 b79:	8b 45 08             	mov    0x8(%ebp),%eax
 b7c:	8b 50 04             	mov    0x4(%eax),%edx
 b7f:	8b 45 08             	mov    0x8(%ebp),%eax
 b82:	8b 40 08             	mov    0x8(%eax),%eax
 b85:	39 c2                	cmp    %eax,%edx
 b87:	7d 0f                	jge    b98 <sem_signal+0x44>
		s->count++;	
 b89:	8b 45 08             	mov    0x8(%ebp),%eax
 b8c:	8b 40 04             	mov    0x4(%eax),%eax
 b8f:	8d 50 01             	lea    0x1(%eax),%edx
 b92:	8b 45 08             	mov    0x8(%ebp),%eax
 b95:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 b98:	8b 45 08             	mov    0x8(%ebp),%eax
 b9b:	83 c0 0c             	add    $0xc,%eax
 b9e:	89 04 24             	mov    %eax,(%esp)
 ba1:	e8 7e fe ff ff       	call   a24 <pop_q>
 ba6:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 ba9:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 bad:	74 2e                	je     bdd <sem_signal+0x89>
		printf(1, "Sem A\n");
 baf:	c7 44 24 04 2c 0c 00 	movl   $0xc2c,0x4(%esp)
 bb6:	00 
 bb7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bbe:	e8 ce f8 ff ff       	call   491 <printf>
		twakeup(tid);
 bc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc6:	89 04 24             	mov    %eax,(%esp)
 bc9:	e8 da f7 ff ff       	call   3a8 <twakeup>
		s->count--;
 bce:	8b 45 08             	mov    0x8(%ebp),%eax
 bd1:	8b 40 04             	mov    0x4(%eax),%eax
 bd4:	8d 50 ff             	lea    -0x1(%eax),%edx
 bd7:	8b 45 08             	mov    0x8(%ebp),%eax
 bda:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 bdd:	8b 45 08             	mov    0x8(%ebp),%eax
 be0:	89 04 24             	mov    %eax,(%esp)
 be3:	e8 b7 fc ff ff       	call   89f <lock_release>

 be8:	c9                   	leave  
 be9:	c3                   	ret    
