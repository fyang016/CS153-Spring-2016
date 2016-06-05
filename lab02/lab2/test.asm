
_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

int n = 1;

void test_func(void * arg_ptr);

int main(int argc, char *argv[]){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp

   printf(1,"thread_create test begin\n\n");
   9:	c7 44 24 04 3e 0c 00 	movl   $0xc3e,0x4(%esp)
  10:	00 
  11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  18:	e8 c8 04 00 00       	call   4e5 <printf>

   printf(1,"before thread_create n = %d\n",n);
  1d:	a1 fc 0c 00 00       	mov    0xcfc,%eax
  22:	89 44 24 08          	mov    %eax,0x8(%esp)
  26:	c7 44 24 04 59 0c 00 	movl   $0xc59,0x4(%esp)
  2d:	00 
  2e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  35:	e8 ab 04 00 00       	call   4e5 <printf>

   int arg = 10;
  3a:	c7 44 24 18 0a 00 00 	movl   $0xa,0x18(%esp)
  41:	00 
   void *tid = thread_create(test_func, (void *)&arg);
  42:	8d 44 24 18          	lea    0x18(%esp),%eax
  46:	89 44 24 04          	mov    %eax,0x4(%esp)
  4a:	c7 04 24 a8 00 00 00 	movl   $0xa8,(%esp)
  51:	e8 b8 08 00 00       	call   90e <thread_create>
  56:	89 44 24 1c          	mov    %eax,0x1c(%esp)
   if(tid <= 0){
  5a:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  5f:	75 38                	jne    99 <main+0x99>
       printf(1,"wrong happen");
  61:	c7 44 24 04 76 0c 00 	movl   $0xc76,0x4(%esp)
  68:	00 
  69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  70:	e8 70 04 00 00       	call   4e5 <printf>
       exit();
  75:	e8 ca 02 00 00       	call   344 <exit>
   } 
   while(wait()>= 0)
   printf(1,"\nback to parent n = %d\n",n);
  7a:	a1 fc 0c 00 00       	mov    0xcfc,%eax
  7f:	89 44 24 08          	mov    %eax,0x8(%esp)
  83:	c7 44 24 04 83 0c 00 	movl   $0xc83,0x4(%esp)
  8a:	00 
  8b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  92:	e8 4e 04 00 00       	call   4e5 <printf>
  97:	eb 01                	jmp    9a <main+0x9a>
   void *tid = thread_create(test_func, (void *)&arg);
   if(tid <= 0){
       printf(1,"wrong happen");
       exit();
   } 
   while(wait()>= 0)
  99:	90                   	nop
  9a:	e8 ad 02 00 00       	call   34c <wait>
  9f:	85 c0                	test   %eax,%eax
  a1:	79 d7                	jns    7a <main+0x7a>
   printf(1,"\nback to parent n = %d\n",n);
   
   exit();
  a3:	e8 9c 02 00 00       	call   344 <exit>

000000a8 <test_func>:
}

//void test_func(void *arg_ptr){
void test_func(void *arg_ptr){
  a8:	55                   	push   %ebp
  a9:	89 e5                	mov    %esp,%ebp
  ab:	83 ec 28             	sub    $0x28,%esp
    int * num = (int *)arg_ptr;
  ae:	8b 45 08             	mov    0x8(%ebp),%eax
  b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n = *num; 
  b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
  b7:	8b 00                	mov    (%eax),%eax
  b9:	a3 fc 0c 00 00       	mov    %eax,0xcfc
    printf(1,"\n n is updated as %d\n",*num);
  be:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c1:	8b 00                	mov    (%eax),%eax
  c3:	89 44 24 08          	mov    %eax,0x8(%esp)
  c7:	c7 44 24 04 9b 0c 00 	movl   $0xc9b,0x4(%esp)
  ce:	00 
  cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d6:	e8 0a 04 00 00       	call   4e5 <printf>
    texit();
  db:	e8 0c 03 00 00       	call   3ec <texit>

000000e0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  e0:	55                   	push   %ebp
  e1:	89 e5                	mov    %esp,%ebp
  e3:	57                   	push   %edi
  e4:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  e5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e8:	8b 55 10             	mov    0x10(%ebp),%edx
  eb:	8b 45 0c             	mov    0xc(%ebp),%eax
  ee:	89 cb                	mov    %ecx,%ebx
  f0:	89 df                	mov    %ebx,%edi
  f2:	89 d1                	mov    %edx,%ecx
  f4:	fc                   	cld    
  f5:	f3 aa                	rep stos %al,%es:(%edi)
  f7:	89 ca                	mov    %ecx,%edx
  f9:	89 fb                	mov    %edi,%ebx
  fb:	89 5d 08             	mov    %ebx,0x8(%ebp)
  fe:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 101:	5b                   	pop    %ebx
 102:	5f                   	pop    %edi
 103:	5d                   	pop    %ebp
 104:	c3                   	ret    

00000105 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 105:	55                   	push   %ebp
 106:	89 e5                	mov    %esp,%ebp
 108:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 10b:	8b 45 08             	mov    0x8(%ebp),%eax
 10e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 111:	8b 45 0c             	mov    0xc(%ebp),%eax
 114:	0f b6 10             	movzbl (%eax),%edx
 117:	8b 45 08             	mov    0x8(%ebp),%eax
 11a:	88 10                	mov    %dl,(%eax)
 11c:	8b 45 08             	mov    0x8(%ebp),%eax
 11f:	0f b6 00             	movzbl (%eax),%eax
 122:	84 c0                	test   %al,%al
 124:	0f 95 c0             	setne  %al
 127:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 12b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 12f:	84 c0                	test   %al,%al
 131:	75 de                	jne    111 <strcpy+0xc>
    ;
  return os;
 133:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 136:	c9                   	leave  
 137:	c3                   	ret    

00000138 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 13b:	eb 08                	jmp    145 <strcmp+0xd>
    p++, q++;
 13d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 141:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 145:	8b 45 08             	mov    0x8(%ebp),%eax
 148:	0f b6 00             	movzbl (%eax),%eax
 14b:	84 c0                	test   %al,%al
 14d:	74 10                	je     15f <strcmp+0x27>
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
 152:	0f b6 10             	movzbl (%eax),%edx
 155:	8b 45 0c             	mov    0xc(%ebp),%eax
 158:	0f b6 00             	movzbl (%eax),%eax
 15b:	38 c2                	cmp    %al,%dl
 15d:	74 de                	je     13d <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 15f:	8b 45 08             	mov    0x8(%ebp),%eax
 162:	0f b6 00             	movzbl (%eax),%eax
 165:	0f b6 d0             	movzbl %al,%edx
 168:	8b 45 0c             	mov    0xc(%ebp),%eax
 16b:	0f b6 00             	movzbl (%eax),%eax
 16e:	0f b6 c0             	movzbl %al,%eax
 171:	89 d1                	mov    %edx,%ecx
 173:	29 c1                	sub    %eax,%ecx
 175:	89 c8                	mov    %ecx,%eax
}
 177:	5d                   	pop    %ebp
 178:	c3                   	ret    

00000179 <strlen>:

uint
strlen(char *s)
{
 179:	55                   	push   %ebp
 17a:	89 e5                	mov    %esp,%ebp
 17c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 17f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 186:	eb 04                	jmp    18c <strlen+0x13>
 188:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 18c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 18f:	03 45 08             	add    0x8(%ebp),%eax
 192:	0f b6 00             	movzbl (%eax),%eax
 195:	84 c0                	test   %al,%al
 197:	75 ef                	jne    188 <strlen+0xf>
    ;
  return n;
 199:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 19c:	c9                   	leave  
 19d:	c3                   	ret    

0000019e <memset>:

void*
memset(void *dst, int c, uint n)
{
 19e:	55                   	push   %ebp
 19f:	89 e5                	mov    %esp,%ebp
 1a1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1a4:	8b 45 10             	mov    0x10(%ebp),%eax
 1a7:	89 44 24 08          	mov    %eax,0x8(%esp)
 1ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 1b2:	8b 45 08             	mov    0x8(%ebp),%eax
 1b5:	89 04 24             	mov    %eax,(%esp)
 1b8:	e8 23 ff ff ff       	call   e0 <stosb>
  return dst;
 1bd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1c0:	c9                   	leave  
 1c1:	c3                   	ret    

000001c2 <strchr>:

char*
strchr(const char *s, char c)
{
 1c2:	55                   	push   %ebp
 1c3:	89 e5                	mov    %esp,%ebp
 1c5:	83 ec 04             	sub    $0x4,%esp
 1c8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1cb:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1ce:	eb 14                	jmp    1e4 <strchr+0x22>
    if(*s == c)
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	0f b6 00             	movzbl (%eax),%eax
 1d6:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1d9:	75 05                	jne    1e0 <strchr+0x1e>
      return (char*)s;
 1db:	8b 45 08             	mov    0x8(%ebp),%eax
 1de:	eb 13                	jmp    1f3 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1e0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	0f b6 00             	movzbl (%eax),%eax
 1ea:	84 c0                	test   %al,%al
 1ec:	75 e2                	jne    1d0 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1ee:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1f3:	c9                   	leave  
 1f4:	c3                   	ret    

000001f5 <gets>:

char*
gets(char *buf, int max)
{
 1f5:	55                   	push   %ebp
 1f6:	89 e5                	mov    %esp,%ebp
 1f8:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 202:	eb 44                	jmp    248 <gets+0x53>
    cc = read(0, &c, 1);
 204:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 20b:	00 
 20c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 20f:	89 44 24 04          	mov    %eax,0x4(%esp)
 213:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 21a:	e8 3d 01 00 00       	call   35c <read>
 21f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 222:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 226:	7e 2d                	jle    255 <gets+0x60>
      break;
    buf[i++] = c;
 228:	8b 45 f0             	mov    -0x10(%ebp),%eax
 22b:	03 45 08             	add    0x8(%ebp),%eax
 22e:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 232:	88 10                	mov    %dl,(%eax)
 234:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 238:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 23c:	3c 0a                	cmp    $0xa,%al
 23e:	74 16                	je     256 <gets+0x61>
 240:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 244:	3c 0d                	cmp    $0xd,%al
 246:	74 0e                	je     256 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 248:	8b 45 f0             	mov    -0x10(%ebp),%eax
 24b:	83 c0 01             	add    $0x1,%eax
 24e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 251:	7c b1                	jl     204 <gets+0xf>
 253:	eb 01                	jmp    256 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 255:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 256:	8b 45 f0             	mov    -0x10(%ebp),%eax
 259:	03 45 08             	add    0x8(%ebp),%eax
 25c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 25f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 262:	c9                   	leave  
 263:	c3                   	ret    

00000264 <stat>:

int
stat(char *n, struct stat *st)
{
 264:	55                   	push   %ebp
 265:	89 e5                	mov    %esp,%ebp
 267:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 26a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 271:	00 
 272:	8b 45 08             	mov    0x8(%ebp),%eax
 275:	89 04 24             	mov    %eax,(%esp)
 278:	e8 07 01 00 00       	call   384 <open>
 27d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 280:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 284:	79 07                	jns    28d <stat+0x29>
    return -1;
 286:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 28b:	eb 23                	jmp    2b0 <stat+0x4c>
  r = fstat(fd, st);
 28d:	8b 45 0c             	mov    0xc(%ebp),%eax
 290:	89 44 24 04          	mov    %eax,0x4(%esp)
 294:	8b 45 f0             	mov    -0x10(%ebp),%eax
 297:	89 04 24             	mov    %eax,(%esp)
 29a:	e8 fd 00 00 00       	call   39c <fstat>
 29f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 2a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2a5:	89 04 24             	mov    %eax,(%esp)
 2a8:	e8 bf 00 00 00       	call   36c <close>
  return r;
 2ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 2b0:	c9                   	leave  
 2b1:	c3                   	ret    

000002b2 <atoi>:

int
atoi(const char *s)
{
 2b2:	55                   	push   %ebp
 2b3:	89 e5                	mov    %esp,%ebp
 2b5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2b8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2bf:	eb 24                	jmp    2e5 <atoi+0x33>
    n = n*10 + *s++ - '0';
 2c1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2c4:	89 d0                	mov    %edx,%eax
 2c6:	c1 e0 02             	shl    $0x2,%eax
 2c9:	01 d0                	add    %edx,%eax
 2cb:	01 c0                	add    %eax,%eax
 2cd:	89 c2                	mov    %eax,%edx
 2cf:	8b 45 08             	mov    0x8(%ebp),%eax
 2d2:	0f b6 00             	movzbl (%eax),%eax
 2d5:	0f be c0             	movsbl %al,%eax
 2d8:	8d 04 02             	lea    (%edx,%eax,1),%eax
 2db:	83 e8 30             	sub    $0x30,%eax
 2de:	89 45 fc             	mov    %eax,-0x4(%ebp)
 2e1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e5:	8b 45 08             	mov    0x8(%ebp),%eax
 2e8:	0f b6 00             	movzbl (%eax),%eax
 2eb:	3c 2f                	cmp    $0x2f,%al
 2ed:	7e 0a                	jle    2f9 <atoi+0x47>
 2ef:	8b 45 08             	mov    0x8(%ebp),%eax
 2f2:	0f b6 00             	movzbl (%eax),%eax
 2f5:	3c 39                	cmp    $0x39,%al
 2f7:	7e c8                	jle    2c1 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2fc:	c9                   	leave  
 2fd:	c3                   	ret    

000002fe <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2fe:	55                   	push   %ebp
 2ff:	89 e5                	mov    %esp,%ebp
 301:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 304:	8b 45 08             	mov    0x8(%ebp),%eax
 307:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 30a:	8b 45 0c             	mov    0xc(%ebp),%eax
 30d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 310:	eb 13                	jmp    325 <memmove+0x27>
    *dst++ = *src++;
 312:	8b 45 fc             	mov    -0x4(%ebp),%eax
 315:	0f b6 10             	movzbl (%eax),%edx
 318:	8b 45 f8             	mov    -0x8(%ebp),%eax
 31b:	88 10                	mov    %dl,(%eax)
 31d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 321:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 325:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 329:	0f 9f c0             	setg   %al
 32c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 330:	84 c0                	test   %al,%al
 332:	75 de                	jne    312 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 334:	8b 45 08             	mov    0x8(%ebp),%eax
}
 337:	c9                   	leave  
 338:	c3                   	ret    
 339:	90                   	nop
 33a:	90                   	nop
 33b:	90                   	nop

0000033c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33c:	b8 01 00 00 00       	mov    $0x1,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <exit>:
SYSCALL(exit)
 344:	b8 02 00 00 00       	mov    $0x2,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <wait>:
SYSCALL(wait)
 34c:	b8 03 00 00 00       	mov    $0x3,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <pipe>:
SYSCALL(pipe)
 354:	b8 04 00 00 00       	mov    $0x4,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <read>:
SYSCALL(read)
 35c:	b8 05 00 00 00       	mov    $0x5,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <write>:
SYSCALL(write)
 364:	b8 10 00 00 00       	mov    $0x10,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <close>:
SYSCALL(close)
 36c:	b8 15 00 00 00       	mov    $0x15,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <kill>:
SYSCALL(kill)
 374:	b8 06 00 00 00       	mov    $0x6,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <exec>:
SYSCALL(exec)
 37c:	b8 07 00 00 00       	mov    $0x7,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <open>:
SYSCALL(open)
 384:	b8 0f 00 00 00       	mov    $0xf,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <mknod>:
SYSCALL(mknod)
 38c:	b8 11 00 00 00       	mov    $0x11,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <unlink>:
SYSCALL(unlink)
 394:	b8 12 00 00 00       	mov    $0x12,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <fstat>:
SYSCALL(fstat)
 39c:	b8 08 00 00 00       	mov    $0x8,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <link>:
SYSCALL(link)
 3a4:	b8 13 00 00 00       	mov    $0x13,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <mkdir>:
SYSCALL(mkdir)
 3ac:	b8 14 00 00 00       	mov    $0x14,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <chdir>:
SYSCALL(chdir)
 3b4:	b8 09 00 00 00       	mov    $0x9,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <dup>:
SYSCALL(dup)
 3bc:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <getpid>:
SYSCALL(getpid)
 3c4:	b8 0b 00 00 00       	mov    $0xb,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <sbrk>:
SYSCALL(sbrk)
 3cc:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <sleep>:
SYSCALL(sleep)
 3d4:	b8 0d 00 00 00       	mov    $0xd,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <uptime>:
SYSCALL(uptime)
 3dc:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <clone>:
SYSCALL(clone)
 3e4:	b8 16 00 00 00       	mov    $0x16,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <texit>:
SYSCALL(texit)
 3ec:	b8 17 00 00 00       	mov    $0x17,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <tsleep>:
SYSCALL(tsleep)
 3f4:	b8 18 00 00 00       	mov    $0x18,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <twakeup>:
SYSCALL(twakeup)
 3fc:	b8 19 00 00 00       	mov    $0x19,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <test>:
SYSCALL(test)
 404:	b8 1a 00 00 00       	mov    $0x1a,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	83 ec 28             	sub    $0x28,%esp
 412:	8b 45 0c             	mov    0xc(%ebp),%eax
 415:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 418:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 41f:	00 
 420:	8d 45 f4             	lea    -0xc(%ebp),%eax
 423:	89 44 24 04          	mov    %eax,0x4(%esp)
 427:	8b 45 08             	mov    0x8(%ebp),%eax
 42a:	89 04 24             	mov    %eax,(%esp)
 42d:	e8 32 ff ff ff       	call   364 <write>
}
 432:	c9                   	leave  
 433:	c3                   	ret    

00000434 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 434:	55                   	push   %ebp
 435:	89 e5                	mov    %esp,%ebp
 437:	53                   	push   %ebx
 438:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 43b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 442:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 446:	74 17                	je     45f <printint+0x2b>
 448:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 44c:	79 11                	jns    45f <printint+0x2b>
    neg = 1;
 44e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 455:	8b 45 0c             	mov    0xc(%ebp),%eax
 458:	f7 d8                	neg    %eax
 45a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 45d:	eb 06                	jmp    465 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 45f:	8b 45 0c             	mov    0xc(%ebp),%eax
 462:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 465:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 46c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 46f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 472:	8b 45 f4             	mov    -0xc(%ebp),%eax
 475:	ba 00 00 00 00       	mov    $0x0,%edx
 47a:	f7 f3                	div    %ebx
 47c:	89 d0                	mov    %edx,%eax
 47e:	0f b6 80 00 0d 00 00 	movzbl 0xd00(%eax),%eax
 485:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 489:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 48d:	8b 45 10             	mov    0x10(%ebp),%eax
 490:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 493:	8b 45 f4             	mov    -0xc(%ebp),%eax
 496:	ba 00 00 00 00       	mov    $0x0,%edx
 49b:	f7 75 d4             	divl   -0x2c(%ebp)
 49e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4a1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4a5:	75 c5                	jne    46c <printint+0x38>
  if(neg)
 4a7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ab:	74 28                	je     4d5 <printint+0xa1>
    buf[i++] = '-';
 4ad:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4b0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4b5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 4b9:	eb 1a                	jmp    4d5 <printint+0xa1>
    putc(fd, buf[i]);
 4bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4be:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 4c3:	0f be c0             	movsbl %al,%eax
 4c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ca:	8b 45 08             	mov    0x8(%ebp),%eax
 4cd:	89 04 24             	mov    %eax,(%esp)
 4d0:	e8 37 ff ff ff       	call   40c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4d5:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 4d9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4dd:	79 dc                	jns    4bb <printint+0x87>
    putc(fd, buf[i]);
}
 4df:	83 c4 44             	add    $0x44,%esp
 4e2:	5b                   	pop    %ebx
 4e3:	5d                   	pop    %ebp
 4e4:	c3                   	ret    

000004e5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4e5:	55                   	push   %ebp
 4e6:	89 e5                	mov    %esp,%ebp
 4e8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4f2:	8d 45 0c             	lea    0xc(%ebp),%eax
 4f5:	83 c0 04             	add    $0x4,%eax
 4f8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 4fb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 502:	e9 7e 01 00 00       	jmp    685 <printf+0x1a0>
    c = fmt[i] & 0xff;
 507:	8b 55 0c             	mov    0xc(%ebp),%edx
 50a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 50d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 510:	0f b6 00             	movzbl (%eax),%eax
 513:	0f be c0             	movsbl %al,%eax
 516:	25 ff 00 00 00       	and    $0xff,%eax
 51b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 51e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 522:	75 2c                	jne    550 <printf+0x6b>
      if(c == '%'){
 524:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 528:	75 0c                	jne    536 <printf+0x51>
        state = '%';
 52a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 531:	e9 4b 01 00 00       	jmp    681 <printf+0x19c>
      } else {
        putc(fd, c);
 536:	8b 45 e8             	mov    -0x18(%ebp),%eax
 539:	0f be c0             	movsbl %al,%eax
 53c:	89 44 24 04          	mov    %eax,0x4(%esp)
 540:	8b 45 08             	mov    0x8(%ebp),%eax
 543:	89 04 24             	mov    %eax,(%esp)
 546:	e8 c1 fe ff ff       	call   40c <putc>
 54b:	e9 31 01 00 00       	jmp    681 <printf+0x19c>
      }
    } else if(state == '%'){
 550:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 554:	0f 85 27 01 00 00    	jne    681 <printf+0x19c>
      if(c == 'd'){
 55a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 55e:	75 2d                	jne    58d <printf+0xa8>
        printint(fd, *ap, 10, 1);
 560:	8b 45 f4             	mov    -0xc(%ebp),%eax
 563:	8b 00                	mov    (%eax),%eax
 565:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 56c:	00 
 56d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 574:	00 
 575:	89 44 24 04          	mov    %eax,0x4(%esp)
 579:	8b 45 08             	mov    0x8(%ebp),%eax
 57c:	89 04 24             	mov    %eax,(%esp)
 57f:	e8 b0 fe ff ff       	call   434 <printint>
        ap++;
 584:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 588:	e9 ed 00 00 00       	jmp    67a <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 58d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 591:	74 06                	je     599 <printf+0xb4>
 593:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 597:	75 2d                	jne    5c6 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 599:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59c:	8b 00                	mov    (%eax),%eax
 59e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5a5:	00 
 5a6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5ad:	00 
 5ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b2:	8b 45 08             	mov    0x8(%ebp),%eax
 5b5:	89 04 24             	mov    %eax,(%esp)
 5b8:	e8 77 fe ff ff       	call   434 <printint>
        ap++;
 5bd:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5c1:	e9 b4 00 00 00       	jmp    67a <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5c6:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 5ca:	75 46                	jne    612 <printf+0x12d>
        s = (char*)*ap;
 5cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5cf:	8b 00                	mov    (%eax),%eax
 5d1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 5d4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 5d8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 5dc:	75 27                	jne    605 <printf+0x120>
          s = "(null)";
 5de:	c7 45 e4 b1 0c 00 00 	movl   $0xcb1,-0x1c(%ebp)
        while(*s != 0){
 5e5:	eb 1f                	jmp    606 <printf+0x121>
          putc(fd, *s);
 5e7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5ea:	0f b6 00             	movzbl (%eax),%eax
 5ed:	0f be c0             	movsbl %al,%eax
 5f0:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f4:	8b 45 08             	mov    0x8(%ebp),%eax
 5f7:	89 04 24             	mov    %eax,(%esp)
 5fa:	e8 0d fe ff ff       	call   40c <putc>
          s++;
 5ff:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 603:	eb 01                	jmp    606 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 605:	90                   	nop
 606:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 609:	0f b6 00             	movzbl (%eax),%eax
 60c:	84 c0                	test   %al,%al
 60e:	75 d7                	jne    5e7 <printf+0x102>
 610:	eb 68                	jmp    67a <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 612:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 616:	75 1d                	jne    635 <printf+0x150>
        putc(fd, *ap);
 618:	8b 45 f4             	mov    -0xc(%ebp),%eax
 61b:	8b 00                	mov    (%eax),%eax
 61d:	0f be c0             	movsbl %al,%eax
 620:	89 44 24 04          	mov    %eax,0x4(%esp)
 624:	8b 45 08             	mov    0x8(%ebp),%eax
 627:	89 04 24             	mov    %eax,(%esp)
 62a:	e8 dd fd ff ff       	call   40c <putc>
        ap++;
 62f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 633:	eb 45                	jmp    67a <printf+0x195>
      } else if(c == '%'){
 635:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 639:	75 17                	jne    652 <printf+0x16d>
        putc(fd, c);
 63b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 63e:	0f be c0             	movsbl %al,%eax
 641:	89 44 24 04          	mov    %eax,0x4(%esp)
 645:	8b 45 08             	mov    0x8(%ebp),%eax
 648:	89 04 24             	mov    %eax,(%esp)
 64b:	e8 bc fd ff ff       	call   40c <putc>
 650:	eb 28                	jmp    67a <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 652:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 659:	00 
 65a:	8b 45 08             	mov    0x8(%ebp),%eax
 65d:	89 04 24             	mov    %eax,(%esp)
 660:	e8 a7 fd ff ff       	call   40c <putc>
        putc(fd, c);
 665:	8b 45 e8             	mov    -0x18(%ebp),%eax
 668:	0f be c0             	movsbl %al,%eax
 66b:	89 44 24 04          	mov    %eax,0x4(%esp)
 66f:	8b 45 08             	mov    0x8(%ebp),%eax
 672:	89 04 24             	mov    %eax,(%esp)
 675:	e8 92 fd ff ff       	call   40c <putc>
      }
      state = 0;
 67a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 681:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 685:	8b 55 0c             	mov    0xc(%ebp),%edx
 688:	8b 45 ec             	mov    -0x14(%ebp),%eax
 68b:	8d 04 02             	lea    (%edx,%eax,1),%eax
 68e:	0f b6 00             	movzbl (%eax),%eax
 691:	84 c0                	test   %al,%al
 693:	0f 85 6e fe ff ff    	jne    507 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 699:	c9                   	leave  
 69a:	c3                   	ret    
 69b:	90                   	nop

0000069c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 69c:	55                   	push   %ebp
 69d:	89 e5                	mov    %esp,%ebp
 69f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6a2:	8b 45 08             	mov    0x8(%ebp),%eax
 6a5:	83 e8 08             	sub    $0x8,%eax
 6a8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ab:	a1 1c 0d 00 00       	mov    0xd1c,%eax
 6b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6b3:	eb 24                	jmp    6d9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6b8:	8b 00                	mov    (%eax),%eax
 6ba:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6bd:	77 12                	ja     6d1 <free+0x35>
 6bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c5:	77 24                	ja     6eb <free+0x4f>
 6c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ca:	8b 00                	mov    (%eax),%eax
 6cc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6cf:	77 1a                	ja     6eb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d4:	8b 00                	mov    (%eax),%eax
 6d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6dc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6df:	76 d4                	jbe    6b5 <free+0x19>
 6e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e4:	8b 00                	mov    (%eax),%eax
 6e6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6e9:	76 ca                	jbe    6b5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ee:	8b 40 04             	mov    0x4(%eax),%eax
 6f1:	c1 e0 03             	shl    $0x3,%eax
 6f4:	89 c2                	mov    %eax,%edx
 6f6:	03 55 f8             	add    -0x8(%ebp),%edx
 6f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fc:	8b 00                	mov    (%eax),%eax
 6fe:	39 c2                	cmp    %eax,%edx
 700:	75 24                	jne    726 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 702:	8b 45 f8             	mov    -0x8(%ebp),%eax
 705:	8b 50 04             	mov    0x4(%eax),%edx
 708:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70b:	8b 00                	mov    (%eax),%eax
 70d:	8b 40 04             	mov    0x4(%eax),%eax
 710:	01 c2                	add    %eax,%edx
 712:	8b 45 f8             	mov    -0x8(%ebp),%eax
 715:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 718:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71b:	8b 00                	mov    (%eax),%eax
 71d:	8b 10                	mov    (%eax),%edx
 71f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 722:	89 10                	mov    %edx,(%eax)
 724:	eb 0a                	jmp    730 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 726:	8b 45 fc             	mov    -0x4(%ebp),%eax
 729:	8b 10                	mov    (%eax),%edx
 72b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 730:	8b 45 fc             	mov    -0x4(%ebp),%eax
 733:	8b 40 04             	mov    0x4(%eax),%eax
 736:	c1 e0 03             	shl    $0x3,%eax
 739:	03 45 fc             	add    -0x4(%ebp),%eax
 73c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 73f:	75 20                	jne    761 <free+0xc5>
    p->s.size += bp->s.size;
 741:	8b 45 fc             	mov    -0x4(%ebp),%eax
 744:	8b 50 04             	mov    0x4(%eax),%edx
 747:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74a:	8b 40 04             	mov    0x4(%eax),%eax
 74d:	01 c2                	add    %eax,%edx
 74f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 752:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 755:	8b 45 f8             	mov    -0x8(%ebp),%eax
 758:	8b 10                	mov    (%eax),%edx
 75a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75d:	89 10                	mov    %edx,(%eax)
 75f:	eb 08                	jmp    769 <free+0xcd>
  } else
    p->s.ptr = bp;
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	8b 55 f8             	mov    -0x8(%ebp),%edx
 767:	89 10                	mov    %edx,(%eax)
  freep = p;
 769:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76c:	a3 1c 0d 00 00       	mov    %eax,0xd1c
}
 771:	c9                   	leave  
 772:	c3                   	ret    

00000773 <morecore>:

static Header*
morecore(uint nu)
{
 773:	55                   	push   %ebp
 774:	89 e5                	mov    %esp,%ebp
 776:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 779:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 780:	77 07                	ja     789 <morecore+0x16>
    nu = 4096;
 782:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 789:	8b 45 08             	mov    0x8(%ebp),%eax
 78c:	c1 e0 03             	shl    $0x3,%eax
 78f:	89 04 24             	mov    %eax,(%esp)
 792:	e8 35 fc ff ff       	call   3cc <sbrk>
 797:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 79a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 79e:	75 07                	jne    7a7 <morecore+0x34>
    return 0;
 7a0:	b8 00 00 00 00       	mov    $0x0,%eax
 7a5:	eb 22                	jmp    7c9 <morecore+0x56>
  hp = (Header*)p;
 7a7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 7ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b0:	8b 55 08             	mov    0x8(%ebp),%edx
 7b3:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7b9:	83 c0 08             	add    $0x8,%eax
 7bc:	89 04 24             	mov    %eax,(%esp)
 7bf:	e8 d8 fe ff ff       	call   69c <free>
  return freep;
 7c4:	a1 1c 0d 00 00       	mov    0xd1c,%eax
}
 7c9:	c9                   	leave  
 7ca:	c3                   	ret    

000007cb <malloc>:

void*
malloc(uint nbytes)
{
 7cb:	55                   	push   %ebp
 7cc:	89 e5                	mov    %esp,%ebp
 7ce:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7d1:	8b 45 08             	mov    0x8(%ebp),%eax
 7d4:	83 c0 07             	add    $0x7,%eax
 7d7:	c1 e8 03             	shr    $0x3,%eax
 7da:	83 c0 01             	add    $0x1,%eax
 7dd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 7e0:	a1 1c 0d 00 00       	mov    0xd1c,%eax
 7e5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7e8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7ec:	75 23                	jne    811 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7ee:	c7 45 f0 14 0d 00 00 	movl   $0xd14,-0x10(%ebp)
 7f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f8:	a3 1c 0d 00 00       	mov    %eax,0xd1c
 7fd:	a1 1c 0d 00 00       	mov    0xd1c,%eax
 802:	a3 14 0d 00 00       	mov    %eax,0xd14
    base.s.size = 0;
 807:	c7 05 18 0d 00 00 00 	movl   $0x0,0xd18
 80e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 811:	8b 45 f0             	mov    -0x10(%ebp),%eax
 814:	8b 00                	mov    (%eax),%eax
 816:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 819:	8b 45 ec             	mov    -0x14(%ebp),%eax
 81c:	8b 40 04             	mov    0x4(%eax),%eax
 81f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 822:	72 4d                	jb     871 <malloc+0xa6>
      if(p->s.size == nunits)
 824:	8b 45 ec             	mov    -0x14(%ebp),%eax
 827:	8b 40 04             	mov    0x4(%eax),%eax
 82a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 82d:	75 0c                	jne    83b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 82f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 832:	8b 10                	mov    (%eax),%edx
 834:	8b 45 f0             	mov    -0x10(%ebp),%eax
 837:	89 10                	mov    %edx,(%eax)
 839:	eb 26                	jmp    861 <malloc+0x96>
      else {
        p->s.size -= nunits;
 83b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 83e:	8b 40 04             	mov    0x4(%eax),%eax
 841:	89 c2                	mov    %eax,%edx
 843:	2b 55 f4             	sub    -0xc(%ebp),%edx
 846:	8b 45 ec             	mov    -0x14(%ebp),%eax
 849:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 84c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 84f:	8b 40 04             	mov    0x4(%eax),%eax
 852:	c1 e0 03             	shl    $0x3,%eax
 855:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 858:	8b 45 ec             	mov    -0x14(%ebp),%eax
 85b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 85e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 861:	8b 45 f0             	mov    -0x10(%ebp),%eax
 864:	a3 1c 0d 00 00       	mov    %eax,0xd1c
      return (void*)(p + 1);
 869:	8b 45 ec             	mov    -0x14(%ebp),%eax
 86c:	83 c0 08             	add    $0x8,%eax
 86f:	eb 38                	jmp    8a9 <malloc+0xde>
    }
    if(p == freep)
 871:	a1 1c 0d 00 00       	mov    0xd1c,%eax
 876:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 879:	75 1b                	jne    896 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 87b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87e:	89 04 24             	mov    %eax,(%esp)
 881:	e8 ed fe ff ff       	call   773 <morecore>
 886:	89 45 ec             	mov    %eax,-0x14(%ebp)
 889:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 88d:	75 07                	jne    896 <malloc+0xcb>
        return 0;
 88f:	b8 00 00 00 00       	mov    $0x0,%eax
 894:	eb 13                	jmp    8a9 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 896:	8b 45 ec             	mov    -0x14(%ebp),%eax
 899:	89 45 f0             	mov    %eax,-0x10(%ebp)
 89c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 89f:	8b 00                	mov    (%eax),%eax
 8a1:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8a4:	e9 70 ff ff ff       	jmp    819 <malloc+0x4e>
}
 8a9:	c9                   	leave  
 8aa:	c3                   	ret    
 8ab:	90                   	nop

000008ac <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 8ac:	55                   	push   %ebp
 8ad:	89 e5                	mov    %esp,%ebp
 8af:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8b2:	8b 55 08             	mov    0x8(%ebp),%edx
 8b5:	8b 45 0c             	mov    0xc(%ebp),%eax
 8b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8bb:	f0 87 02             	lock xchg %eax,(%edx)
 8be:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 8c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8c4:	c9                   	leave  
 8c5:	c3                   	ret    

000008c6 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 8c6:	55                   	push   %ebp
 8c7:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 8c9:	8b 45 08             	mov    0x8(%ebp),%eax
 8cc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 8d2:	5d                   	pop    %ebp
 8d3:	c3                   	ret    

000008d4 <lock_acquire>:
void lock_acquire(lock_t *lock){
 8d4:	55                   	push   %ebp
 8d5:	89 e5                	mov    %esp,%ebp
 8d7:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 8da:	8b 45 08             	mov    0x8(%ebp),%eax
 8dd:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8e4:	00 
 8e5:	89 04 24             	mov    %eax,(%esp)
 8e8:	e8 bf ff ff ff       	call   8ac <xchg>
 8ed:	85 c0                	test   %eax,%eax
 8ef:	75 e9                	jne    8da <lock_acquire+0x6>
}
 8f1:	c9                   	leave  
 8f2:	c3                   	ret    

000008f3 <lock_release>:
void lock_release(lock_t *lock){
 8f3:	55                   	push   %ebp
 8f4:	89 e5                	mov    %esp,%ebp
 8f6:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 8f9:	8b 45 08             	mov    0x8(%ebp),%eax
 8fc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 903:	00 
 904:	89 04 24             	mov    %eax,(%esp)
 907:	e8 a0 ff ff ff       	call   8ac <xchg>
}
 90c:	c9                   	leave  
 90d:	c3                   	ret    

0000090e <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 90e:	55                   	push   %ebp
 90f:	89 e5                	mov    %esp,%ebp
 911:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 914:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 91b:	e8 ab fe ff ff       	call   7cb <malloc>
 920:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 923:	8b 45 f0             	mov    -0x10(%ebp),%eax
 926:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 929:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92c:	25 ff 0f 00 00       	and    $0xfff,%eax
 931:	85 c0                	test   %eax,%eax
 933:	74 15                	je     94a <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 935:	8b 45 f0             	mov    -0x10(%ebp),%eax
 938:	89 c2                	mov    %eax,%edx
 93a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 940:	b8 00 10 00 00       	mov    $0x1000,%eax
 945:	29 d0                	sub    %edx,%eax
 947:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 94a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 94e:	75 1b                	jne    96b <thread_create+0x5d>

        printf(1,"malloc fail \n");
 950:	c7 44 24 04 b8 0c 00 	movl   $0xcb8,0x4(%esp)
 957:	00 
 958:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 95f:	e8 81 fb ff ff       	call   4e5 <printf>
        return 0;
 964:	b8 00 00 00 00       	mov    $0x0,%eax
 969:	eb 6f                	jmp    9da <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 96b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 96e:	8b 55 08             	mov    0x8(%ebp),%edx
 971:	8b 45 f0             	mov    -0x10(%ebp),%eax
 974:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 978:	89 54 24 08          	mov    %edx,0x8(%esp)
 97c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 983:	00 
 984:	89 04 24             	mov    %eax,(%esp)
 987:	e8 58 fa ff ff       	call   3e4 <clone>
 98c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 98f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 993:	79 1b                	jns    9b0 <thread_create+0xa2>
        printf(1,"clone fails\n");
 995:	c7 44 24 04 c6 0c 00 	movl   $0xcc6,0x4(%esp)
 99c:	00 
 99d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9a4:	e8 3c fb ff ff       	call   4e5 <printf>
        return 0;
 9a9:	b8 00 00 00 00       	mov    $0x0,%eax
 9ae:	eb 2a                	jmp    9da <thread_create+0xcc>
    }
    if(tid > 0){
 9b0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9b4:	7e 05                	jle    9bb <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 9b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b9:	eb 1f                	jmp    9da <thread_create+0xcc>
    }
    if(tid == 0){
 9bb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9bf:	75 14                	jne    9d5 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 9c1:	c7 44 24 04 d3 0c 00 	movl   $0xcd3,0x4(%esp)
 9c8:	00 
 9c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9d0:	e8 10 fb ff ff       	call   4e5 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 9d5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 9da:	c9                   	leave  
 9db:	c3                   	ret    

000009dc <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 9dc:	55                   	push   %ebp
 9dd:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 9df:	8b 45 08             	mov    0x8(%ebp),%eax
 9e2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 9e8:	8b 45 08             	mov    0x8(%ebp),%eax
 9eb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 9f2:	8b 45 08             	mov    0x8(%ebp),%eax
 9f5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 9fc:	5d                   	pop    %ebp
 9fd:	c3                   	ret    

000009fe <add_q>:

void add_q(struct queue *q, int v){
 9fe:	55                   	push   %ebp
 9ff:	89 e5                	mov    %esp,%ebp
 a01:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 a04:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 a0b:	e8 bb fd ff ff       	call   7cb <malloc>
 a10:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 a13:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a16:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 a1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a20:	8b 55 0c             	mov    0xc(%ebp),%edx
 a23:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 a25:	8b 45 08             	mov    0x8(%ebp),%eax
 a28:	8b 40 04             	mov    0x4(%eax),%eax
 a2b:	85 c0                	test   %eax,%eax
 a2d:	75 0b                	jne    a3a <add_q+0x3c>
        q->head = n;
 a2f:	8b 45 08             	mov    0x8(%ebp),%eax
 a32:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a35:	89 50 04             	mov    %edx,0x4(%eax)
 a38:	eb 0c                	jmp    a46 <add_q+0x48>
    }else{
        q->tail->next = n;
 a3a:	8b 45 08             	mov    0x8(%ebp),%eax
 a3d:	8b 40 08             	mov    0x8(%eax),%eax
 a40:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a43:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 a46:	8b 45 08             	mov    0x8(%ebp),%eax
 a49:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a4c:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 a4f:	8b 45 08             	mov    0x8(%ebp),%eax
 a52:	8b 00                	mov    (%eax),%eax
 a54:	8d 50 01             	lea    0x1(%eax),%edx
 a57:	8b 45 08             	mov    0x8(%ebp),%eax
 a5a:	89 10                	mov    %edx,(%eax)
}
 a5c:	c9                   	leave  
 a5d:	c3                   	ret    

00000a5e <empty_q>:

int empty_q(struct queue *q){
 a5e:	55                   	push   %ebp
 a5f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 a61:	8b 45 08             	mov    0x8(%ebp),%eax
 a64:	8b 00                	mov    (%eax),%eax
 a66:	85 c0                	test   %eax,%eax
 a68:	75 07                	jne    a71 <empty_q+0x13>
        return 1;
 a6a:	b8 01 00 00 00       	mov    $0x1,%eax
 a6f:	eb 05                	jmp    a76 <empty_q+0x18>
    else
        return 0;
 a71:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 a76:	5d                   	pop    %ebp
 a77:	c3                   	ret    

00000a78 <pop_q>:
int pop_q(struct queue *q){
 a78:	55                   	push   %ebp
 a79:	89 e5                	mov    %esp,%ebp
 a7b:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a7e:	8b 45 08             	mov    0x8(%ebp),%eax
 a81:	89 04 24             	mov    %eax,(%esp)
 a84:	e8 d5 ff ff ff       	call   a5e <empty_q>
 a89:	85 c0                	test   %eax,%eax
 a8b:	75 5d                	jne    aea <pop_q+0x72>
       val = q->head->value; 
 a8d:	8b 45 08             	mov    0x8(%ebp),%eax
 a90:	8b 40 04             	mov    0x4(%eax),%eax
 a93:	8b 00                	mov    (%eax),%eax
 a95:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 a98:	8b 45 08             	mov    0x8(%ebp),%eax
 a9b:	8b 40 04             	mov    0x4(%eax),%eax
 a9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 aa1:	8b 45 08             	mov    0x8(%ebp),%eax
 aa4:	8b 40 04             	mov    0x4(%eax),%eax
 aa7:	8b 50 04             	mov    0x4(%eax),%edx
 aaa:	8b 45 08             	mov    0x8(%ebp),%eax
 aad:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 ab0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab3:	89 04 24             	mov    %eax,(%esp)
 ab6:	e8 e1 fb ff ff       	call   69c <free>
       q->size--;
 abb:	8b 45 08             	mov    0x8(%ebp),%eax
 abe:	8b 00                	mov    (%eax),%eax
 ac0:	8d 50 ff             	lea    -0x1(%eax),%edx
 ac3:	8b 45 08             	mov    0x8(%ebp),%eax
 ac6:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 ac8:	8b 45 08             	mov    0x8(%ebp),%eax
 acb:	8b 00                	mov    (%eax),%eax
 acd:	85 c0                	test   %eax,%eax
 acf:	75 14                	jne    ae5 <pop_q+0x6d>
            q->head = 0;
 ad1:	8b 45 08             	mov    0x8(%ebp),%eax
 ad4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 adb:	8b 45 08             	mov    0x8(%ebp),%eax
 ade:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 ae5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ae8:	eb 05                	jmp    aef <pop_q+0x77>
    }
    return -1;
 aea:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 aef:	c9                   	leave  
 af0:	c3                   	ret    
 af1:	90                   	nop
 af2:	90                   	nop
 af3:	90                   	nop

00000af4 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 af4:	55                   	push   %ebp
 af5:	89 e5                	mov    %esp,%ebp
 af7:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 afa:	8b 45 08             	mov    0x8(%ebp),%eax
 afd:	8b 55 0c             	mov    0xc(%ebp),%edx
 b00:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 b03:	8b 45 08             	mov    0x8(%ebp),%eax
 b06:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 b0d:	8b 45 08             	mov    0x8(%ebp),%eax
 b10:	89 04 24             	mov    %eax,(%esp)
 b13:	e8 ae fd ff ff       	call   8c6 <lock_init>
}
 b18:	c9                   	leave  
 b19:	c3                   	ret    

00000b1a <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 b1a:	55                   	push   %ebp
 b1b:	89 e5                	mov    %esp,%ebp
 b1d:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 b20:	8b 45 08             	mov    0x8(%ebp),%eax
 b23:	89 04 24             	mov    %eax,(%esp)
 b26:	e8 a9 fd ff ff       	call   8d4 <lock_acquire>
	if(s->count  == 0){
 b2b:	8b 45 08             	mov    0x8(%ebp),%eax
 b2e:	8b 40 04             	mov    0x4(%eax),%eax
 b31:	85 c0                	test   %eax,%eax
 b33:	75 43                	jne    b78 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 b35:	c7 44 24 04 e4 0c 00 	movl   $0xce4,0x4(%esp)
 b3c:	00 
 b3d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b44:	e8 9c f9 ff ff       	call   4e5 <printf>
		//add proc to waiters list
		int tid = getpid();
 b49:	e8 76 f8 ff ff       	call   3c4 <getpid>
 b4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 b51:	8b 45 08             	mov    0x8(%ebp),%eax
 b54:	8d 50 0c             	lea    0xc(%eax),%edx
 b57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b5a:	89 44 24 04          	mov    %eax,0x4(%esp)
 b5e:	89 14 24             	mov    %edx,(%esp)
 b61:	e8 98 fe ff ff       	call   9fe <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 b66:	8b 45 08             	mov    0x8(%ebp),%eax
 b69:	89 04 24             	mov    %eax,(%esp)
 b6c:	e8 82 fd ff ff       	call   8f3 <lock_release>
		tsleep(); 
 b71:	e8 7e f8 ff ff       	call   3f4 <tsleep>
 b76:	eb 2e                	jmp    ba6 <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 b78:	c7 44 24 04 eb 0c 00 	movl   $0xceb,0x4(%esp)
 b7f:	00 
 b80:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b87:	e8 59 f9 ff ff       	call   4e5 <printf>
		s->count--;	
 b8c:	8b 45 08             	mov    0x8(%ebp),%eax
 b8f:	8b 40 04             	mov    0x4(%eax),%eax
 b92:	8d 50 ff             	lea    -0x1(%eax),%edx
 b95:	8b 45 08             	mov    0x8(%ebp),%eax
 b98:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b9b:	8b 45 08             	mov    0x8(%ebp),%eax
 b9e:	89 04 24             	mov    %eax,(%esp)
 ba1:	e8 4d fd ff ff       	call   8f3 <lock_release>
	}
}
 ba6:	c9                   	leave  
 ba7:	c3                   	ret    

00000ba8 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 ba8:	55                   	push   %ebp
 ba9:	89 e5                	mov    %esp,%ebp
 bab:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 bae:	c7 44 24 04 f2 0c 00 	movl   $0xcf2,0x4(%esp)
 bb5:	00 
 bb6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bbd:	e8 23 f9 ff ff       	call   4e5 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 bc2:	8b 45 08             	mov    0x8(%ebp),%eax
 bc5:	89 04 24             	mov    %eax,(%esp)
 bc8:	e8 07 fd ff ff       	call   8d4 <lock_acquire>
	if(s->count < s->size){
 bcd:	8b 45 08             	mov    0x8(%ebp),%eax
 bd0:	8b 50 04             	mov    0x4(%eax),%edx
 bd3:	8b 45 08             	mov    0x8(%ebp),%eax
 bd6:	8b 40 08             	mov    0x8(%eax),%eax
 bd9:	39 c2                	cmp    %eax,%edx
 bdb:	7d 0f                	jge    bec <sem_signal+0x44>
		s->count++;	
 bdd:	8b 45 08             	mov    0x8(%ebp),%eax
 be0:	8b 40 04             	mov    0x4(%eax),%eax
 be3:	8d 50 01             	lea    0x1(%eax),%edx
 be6:	8b 45 08             	mov    0x8(%ebp),%eax
 be9:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 bec:	8b 45 08             	mov    0x8(%ebp),%eax
 bef:	83 c0 0c             	add    $0xc,%eax
 bf2:	89 04 24             	mov    %eax,(%esp)
 bf5:	e8 7e fe ff ff       	call   a78 <pop_q>
 bfa:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 bfd:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 c01:	74 2e                	je     c31 <sem_signal+0x89>
		printf(1, "Sem A\n");
 c03:	c7 44 24 04 eb 0c 00 	movl   $0xceb,0x4(%esp)
 c0a:	00 
 c0b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c12:	e8 ce f8 ff ff       	call   4e5 <printf>
		twakeup(tid);
 c17:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c1a:	89 04 24             	mov    %eax,(%esp)
 c1d:	e8 da f7 ff ff       	call   3fc <twakeup>
		s->count--;
 c22:	8b 45 08             	mov    0x8(%ebp),%eax
 c25:	8b 40 04             	mov    0x4(%eax),%eax
 c28:	8d 50 ff             	lea    -0x1(%eax),%edx
 c2b:	8b 45 08             	mov    0x8(%ebp),%eax
 c2e:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 c31:	8b 45 08             	mov    0x8(%ebp),%eax
 c34:	89 04 24             	mov    %eax,(%esp)
 c37:	e8 b7 fc ff ff       	call   8f3 <lock_release>

 c3c:	c9                   	leave  
 c3d:	c3                   	ret    
