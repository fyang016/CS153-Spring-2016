
_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

int n = 1;

void test_func(void *arg_ptr);

int main(int argc, char *argv[]){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp

   printf(1,"thread_create test begin\n");
   9:	c7 44 24 04 b8 09 00 	movl   $0x9b8,0x4(%esp)
  10:	00 
  11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  18:	e8 a0 04 00 00       	call   4bd <printf>
   
   void *tid = thread_create(test_func, (void *)0);
  1d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  24:	00 
  25:	c7 04 24 80 00 00 00 	movl   $0x80,(%esp)
  2c:	e8 b5 08 00 00       	call   8e6 <thread_create>
  31:	89 44 24 1c          	mov    %eax,0x1c(%esp)
   if(tid ==0) 
  35:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  3a:	75 35                	jne    71 <main+0x71>
       printf(1,"wrong happen");
  3c:	c7 44 24 04 d2 09 00 	movl   $0x9d2,0x4(%esp)
  43:	00 
  44:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4b:	e8 6d 04 00 00       	call   4bd <printf>
   while(wait()>= 0)
  50:	eb 20                	jmp    72 <main+0x72>
   printf(1,"back to parent n = %d\n",n);
  52:	a1 54 0a 00 00       	mov    0xa54,%eax
  57:	89 44 24 08          	mov    %eax,0x8(%esp)
  5b:	c7 44 24 04 df 09 00 	movl   $0x9df,0x4(%esp)
  62:	00 
  63:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  6a:	e8 4e 04 00 00       	call   4bd <printf>
  6f:	eb 01                	jmp    72 <main+0x72>
   printf(1,"thread_create test begin\n");
   
   void *tid = thread_create(test_func, (void *)0);
   if(tid ==0) 
       printf(1,"wrong happen");
   while(wait()>= 0)
  71:	90                   	nop
  72:	e8 c5 02 00 00       	call   33c <wait>
  77:	85 c0                	test   %eax,%eax
  79:	79 d7                	jns    52 <main+0x52>
   printf(1,"back to parent n = %d\n",n);
   
   exit();
  7b:	e8 b4 02 00 00       	call   334 <exit>

00000080 <test_func>:
}

void test_func(void *arg_ptr){
  80:	55                   	push   %ebp
  81:	89 e5                	mov    %esp,%ebp
  83:	83 ec 18             	sub    $0x18,%esp
    printf(1,"\n n = %d\n",n);
  86:	a1 54 0a 00 00       	mov    0xa54,%eax
  8b:	89 44 24 08          	mov    %eax,0x8(%esp)
  8f:	c7 44 24 04 f6 09 00 	movl   $0x9f6,0x4(%esp)
  96:	00 
  97:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9e:	e8 1a 04 00 00       	call   4bd <printf>
    n = 2;
  a3:	c7 05 54 0a 00 00 02 	movl   $0x2,0xa54
  aa:	00 00 00 
    printf(1,"after increase by 1 , n = %d\n\n",n);
  ad:	a1 54 0a 00 00       	mov    0xa54,%eax
  b2:	89 44 24 08          	mov    %eax,0x8(%esp)
  b6:	c7 44 24 04 00 0a 00 	movl   $0xa00,0x4(%esp)
  bd:	00 
  be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c5:	e8 f3 03 00 00       	call   4bd <printf>
    texit();
  ca:	e8 0d 03 00 00       	call   3dc <texit>
  cf:	90                   	nop

000000d0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  d0:	55                   	push   %ebp
  d1:	89 e5                	mov    %esp,%ebp
  d3:	57                   	push   %edi
  d4:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  d5:	8b 4d 08             	mov    0x8(%ebp),%ecx
  d8:	8b 55 10             	mov    0x10(%ebp),%edx
  db:	8b 45 0c             	mov    0xc(%ebp),%eax
  de:	89 cb                	mov    %ecx,%ebx
  e0:	89 df                	mov    %ebx,%edi
  e2:	89 d1                	mov    %edx,%ecx
  e4:	fc                   	cld    
  e5:	f3 aa                	rep stos %al,%es:(%edi)
  e7:	89 ca                	mov    %ecx,%edx
  e9:	89 fb                	mov    %edi,%ebx
  eb:	89 5d 08             	mov    %ebx,0x8(%ebp)
  ee:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
  f1:	5b                   	pop    %ebx
  f2:	5f                   	pop    %edi
  f3:	5d                   	pop    %ebp
  f4:	c3                   	ret    

000000f5 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
  f5:	55                   	push   %ebp
  f6:	89 e5                	mov    %esp,%ebp
  f8:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
  fb:	8b 45 08             	mov    0x8(%ebp),%eax
  fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 101:	8b 45 0c             	mov    0xc(%ebp),%eax
 104:	0f b6 10             	movzbl (%eax),%edx
 107:	8b 45 08             	mov    0x8(%ebp),%eax
 10a:	88 10                	mov    %dl,(%eax)
 10c:	8b 45 08             	mov    0x8(%ebp),%eax
 10f:	0f b6 00             	movzbl (%eax),%eax
 112:	84 c0                	test   %al,%al
 114:	0f 95 c0             	setne  %al
 117:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 11b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 11f:	84 c0                	test   %al,%al
 121:	75 de                	jne    101 <strcpy+0xc>
    ;
  return os;
 123:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 126:	c9                   	leave  
 127:	c3                   	ret    

00000128 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 128:	55                   	push   %ebp
 129:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 12b:	eb 08                	jmp    135 <strcmp+0xd>
    p++, q++;
 12d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 131:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 135:	8b 45 08             	mov    0x8(%ebp),%eax
 138:	0f b6 00             	movzbl (%eax),%eax
 13b:	84 c0                	test   %al,%al
 13d:	74 10                	je     14f <strcmp+0x27>
 13f:	8b 45 08             	mov    0x8(%ebp),%eax
 142:	0f b6 10             	movzbl (%eax),%edx
 145:	8b 45 0c             	mov    0xc(%ebp),%eax
 148:	0f b6 00             	movzbl (%eax),%eax
 14b:	38 c2                	cmp    %al,%dl
 14d:	74 de                	je     12d <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
 152:	0f b6 00             	movzbl (%eax),%eax
 155:	0f b6 d0             	movzbl %al,%edx
 158:	8b 45 0c             	mov    0xc(%ebp),%eax
 15b:	0f b6 00             	movzbl (%eax),%eax
 15e:	0f b6 c0             	movzbl %al,%eax
 161:	89 d1                	mov    %edx,%ecx
 163:	29 c1                	sub    %eax,%ecx
 165:	89 c8                	mov    %ecx,%eax
}
 167:	5d                   	pop    %ebp
 168:	c3                   	ret    

00000169 <strlen>:

uint
strlen(char *s)
{
 169:	55                   	push   %ebp
 16a:	89 e5                	mov    %esp,%ebp
 16c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 16f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 176:	eb 04                	jmp    17c <strlen+0x13>
 178:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 17c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 17f:	03 45 08             	add    0x8(%ebp),%eax
 182:	0f b6 00             	movzbl (%eax),%eax
 185:	84 c0                	test   %al,%al
 187:	75 ef                	jne    178 <strlen+0xf>
    ;
  return n;
 189:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18c:	c9                   	leave  
 18d:	c3                   	ret    

0000018e <memset>:

void*
memset(void *dst, int c, uint n)
{
 18e:	55                   	push   %ebp
 18f:	89 e5                	mov    %esp,%ebp
 191:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 194:	8b 45 10             	mov    0x10(%ebp),%eax
 197:	89 44 24 08          	mov    %eax,0x8(%esp)
 19b:	8b 45 0c             	mov    0xc(%ebp),%eax
 19e:	89 44 24 04          	mov    %eax,0x4(%esp)
 1a2:	8b 45 08             	mov    0x8(%ebp),%eax
 1a5:	89 04 24             	mov    %eax,(%esp)
 1a8:	e8 23 ff ff ff       	call   d0 <stosb>
  return dst;
 1ad:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1b0:	c9                   	leave  
 1b1:	c3                   	ret    

000001b2 <strchr>:

char*
strchr(const char *s, char c)
{
 1b2:	55                   	push   %ebp
 1b3:	89 e5                	mov    %esp,%ebp
 1b5:	83 ec 04             	sub    $0x4,%esp
 1b8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1bb:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1be:	eb 14                	jmp    1d4 <strchr+0x22>
    if(*s == c)
 1c0:	8b 45 08             	mov    0x8(%ebp),%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1c9:	75 05                	jne    1d0 <strchr+0x1e>
      return (char*)s;
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ce:	eb 13                	jmp    1e3 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1d0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1d4:	8b 45 08             	mov    0x8(%ebp),%eax
 1d7:	0f b6 00             	movzbl (%eax),%eax
 1da:	84 c0                	test   %al,%al
 1dc:	75 e2                	jne    1c0 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1de:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1e3:	c9                   	leave  
 1e4:	c3                   	ret    

000001e5 <gets>:

char*
gets(char *buf, int max)
{
 1e5:	55                   	push   %ebp
 1e6:	89 e5                	mov    %esp,%ebp
 1e8:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 1f2:	eb 44                	jmp    238 <gets+0x53>
    cc = read(0, &c, 1);
 1f4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 1fb:	00 
 1fc:	8d 45 ef             	lea    -0x11(%ebp),%eax
 1ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 203:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 20a:	e8 3d 01 00 00       	call   34c <read>
 20f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 212:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 216:	7e 2d                	jle    245 <gets+0x60>
      break;
    buf[i++] = c;
 218:	8b 45 f0             	mov    -0x10(%ebp),%eax
 21b:	03 45 08             	add    0x8(%ebp),%eax
 21e:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 222:	88 10                	mov    %dl,(%eax)
 224:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 228:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 22c:	3c 0a                	cmp    $0xa,%al
 22e:	74 16                	je     246 <gets+0x61>
 230:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 234:	3c 0d                	cmp    $0xd,%al
 236:	74 0e                	je     246 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 238:	8b 45 f0             	mov    -0x10(%ebp),%eax
 23b:	83 c0 01             	add    $0x1,%eax
 23e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 241:	7c b1                	jl     1f4 <gets+0xf>
 243:	eb 01                	jmp    246 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 245:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 246:	8b 45 f0             	mov    -0x10(%ebp),%eax
 249:	03 45 08             	add    0x8(%ebp),%eax
 24c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 24f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 252:	c9                   	leave  
 253:	c3                   	ret    

00000254 <stat>:

int
stat(char *n, struct stat *st)
{
 254:	55                   	push   %ebp
 255:	89 e5                	mov    %esp,%ebp
 257:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 25a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 261:	00 
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	89 04 24             	mov    %eax,(%esp)
 268:	e8 07 01 00 00       	call   374 <open>
 26d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 270:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 274:	79 07                	jns    27d <stat+0x29>
    return -1;
 276:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 27b:	eb 23                	jmp    2a0 <stat+0x4c>
  r = fstat(fd, st);
 27d:	8b 45 0c             	mov    0xc(%ebp),%eax
 280:	89 44 24 04          	mov    %eax,0x4(%esp)
 284:	8b 45 f0             	mov    -0x10(%ebp),%eax
 287:	89 04 24             	mov    %eax,(%esp)
 28a:	e8 fd 00 00 00       	call   38c <fstat>
 28f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 292:	8b 45 f0             	mov    -0x10(%ebp),%eax
 295:	89 04 24             	mov    %eax,(%esp)
 298:	e8 bf 00 00 00       	call   35c <close>
  return r;
 29d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 2a0:	c9                   	leave  
 2a1:	c3                   	ret    

000002a2 <atoi>:

int
atoi(const char *s)
{
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2a8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2af:	eb 24                	jmp    2d5 <atoi+0x33>
    n = n*10 + *s++ - '0';
 2b1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2b4:	89 d0                	mov    %edx,%eax
 2b6:	c1 e0 02             	shl    $0x2,%eax
 2b9:	01 d0                	add    %edx,%eax
 2bb:	01 c0                	add    %eax,%eax
 2bd:	89 c2                	mov    %eax,%edx
 2bf:	8b 45 08             	mov    0x8(%ebp),%eax
 2c2:	0f b6 00             	movzbl (%eax),%eax
 2c5:	0f be c0             	movsbl %al,%eax
 2c8:	8d 04 02             	lea    (%edx,%eax,1),%eax
 2cb:	83 e8 30             	sub    $0x30,%eax
 2ce:	89 45 fc             	mov    %eax,-0x4(%ebp)
 2d1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2d5:	8b 45 08             	mov    0x8(%ebp),%eax
 2d8:	0f b6 00             	movzbl (%eax),%eax
 2db:	3c 2f                	cmp    $0x2f,%al
 2dd:	7e 0a                	jle    2e9 <atoi+0x47>
 2df:	8b 45 08             	mov    0x8(%ebp),%eax
 2e2:	0f b6 00             	movzbl (%eax),%eax
 2e5:	3c 39                	cmp    $0x39,%al
 2e7:	7e c8                	jle    2b1 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2ec:	c9                   	leave  
 2ed:	c3                   	ret    

000002ee <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 2ee:	55                   	push   %ebp
 2ef:	89 e5                	mov    %esp,%ebp
 2f1:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 2f4:	8b 45 08             	mov    0x8(%ebp),%eax
 2f7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 2fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2fd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 300:	eb 13                	jmp    315 <memmove+0x27>
    *dst++ = *src++;
 302:	8b 45 fc             	mov    -0x4(%ebp),%eax
 305:	0f b6 10             	movzbl (%eax),%edx
 308:	8b 45 f8             	mov    -0x8(%ebp),%eax
 30b:	88 10                	mov    %dl,(%eax)
 30d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 311:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 315:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 319:	0f 9f c0             	setg   %al
 31c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 320:	84 c0                	test   %al,%al
 322:	75 de                	jne    302 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 324:	8b 45 08             	mov    0x8(%ebp),%eax
}
 327:	c9                   	leave  
 328:	c3                   	ret    
 329:	90                   	nop
 32a:	90                   	nop
 32b:	90                   	nop

0000032c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 32c:	b8 01 00 00 00       	mov    $0x1,%eax
 331:	cd 40                	int    $0x40
 333:	c3                   	ret    

00000334 <exit>:
SYSCALL(exit)
 334:	b8 02 00 00 00       	mov    $0x2,%eax
 339:	cd 40                	int    $0x40
 33b:	c3                   	ret    

0000033c <wait>:
SYSCALL(wait)
 33c:	b8 03 00 00 00       	mov    $0x3,%eax
 341:	cd 40                	int    $0x40
 343:	c3                   	ret    

00000344 <pipe>:
SYSCALL(pipe)
 344:	b8 04 00 00 00       	mov    $0x4,%eax
 349:	cd 40                	int    $0x40
 34b:	c3                   	ret    

0000034c <read>:
SYSCALL(read)
 34c:	b8 05 00 00 00       	mov    $0x5,%eax
 351:	cd 40                	int    $0x40
 353:	c3                   	ret    

00000354 <write>:
SYSCALL(write)
 354:	b8 10 00 00 00       	mov    $0x10,%eax
 359:	cd 40                	int    $0x40
 35b:	c3                   	ret    

0000035c <close>:
SYSCALL(close)
 35c:	b8 15 00 00 00       	mov    $0x15,%eax
 361:	cd 40                	int    $0x40
 363:	c3                   	ret    

00000364 <kill>:
SYSCALL(kill)
 364:	b8 06 00 00 00       	mov    $0x6,%eax
 369:	cd 40                	int    $0x40
 36b:	c3                   	ret    

0000036c <exec>:
SYSCALL(exec)
 36c:	b8 07 00 00 00       	mov    $0x7,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <open>:
SYSCALL(open)
 374:	b8 0f 00 00 00       	mov    $0xf,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <mknod>:
SYSCALL(mknod)
 37c:	b8 11 00 00 00       	mov    $0x11,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <unlink>:
SYSCALL(unlink)
 384:	b8 12 00 00 00       	mov    $0x12,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <fstat>:
SYSCALL(fstat)
 38c:	b8 08 00 00 00       	mov    $0x8,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <link>:
SYSCALL(link)
 394:	b8 13 00 00 00       	mov    $0x13,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <mkdir>:
SYSCALL(mkdir)
 39c:	b8 14 00 00 00       	mov    $0x14,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <chdir>:
SYSCALL(chdir)
 3a4:	b8 09 00 00 00       	mov    $0x9,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <dup>:
SYSCALL(dup)
 3ac:	b8 0a 00 00 00       	mov    $0xa,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <getpid>:
SYSCALL(getpid)
 3b4:	b8 0b 00 00 00       	mov    $0xb,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <sbrk>:
SYSCALL(sbrk)
 3bc:	b8 0c 00 00 00       	mov    $0xc,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <sleep>:
SYSCALL(sleep)
 3c4:	b8 0d 00 00 00       	mov    $0xd,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <uptime>:
SYSCALL(uptime)
 3cc:	b8 0e 00 00 00       	mov    $0xe,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <clone>:
SYSCALL(clone)
 3d4:	b8 16 00 00 00       	mov    $0x16,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <texit>:
SYSCALL(texit)
 3dc:	b8 17 00 00 00       	mov    $0x17,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 3e4:	55                   	push   %ebp
 3e5:	89 e5                	mov    %esp,%ebp
 3e7:	83 ec 28             	sub    $0x28,%esp
 3ea:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ed:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 3f0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3f7:	00 
 3f8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 3fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 3ff:	8b 45 08             	mov    0x8(%ebp),%eax
 402:	89 04 24             	mov    %eax,(%esp)
 405:	e8 4a ff ff ff       	call   354 <write>
}
 40a:	c9                   	leave  
 40b:	c3                   	ret    

0000040c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 40c:	55                   	push   %ebp
 40d:	89 e5                	mov    %esp,%ebp
 40f:	53                   	push   %ebx
 410:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 413:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 41a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 41e:	74 17                	je     437 <printint+0x2b>
 420:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 424:	79 11                	jns    437 <printint+0x2b>
    neg = 1;
 426:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 42d:	8b 45 0c             	mov    0xc(%ebp),%eax
 430:	f7 d8                	neg    %eax
 432:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 435:	eb 06                	jmp    43d <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 437:	8b 45 0c             	mov    0xc(%ebp),%eax
 43a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 43d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 444:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 447:	8b 5d 10             	mov    0x10(%ebp),%ebx
 44a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 44d:	ba 00 00 00 00       	mov    $0x0,%edx
 452:	f7 f3                	div    %ebx
 454:	89 d0                	mov    %edx,%eax
 456:	0f b6 80 58 0a 00 00 	movzbl 0xa58(%eax),%eax
 45d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 461:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 465:	8b 45 10             	mov    0x10(%ebp),%eax
 468:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 46b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 46e:	ba 00 00 00 00       	mov    $0x0,%edx
 473:	f7 75 d4             	divl   -0x2c(%ebp)
 476:	89 45 f4             	mov    %eax,-0xc(%ebp)
 479:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 47d:	75 c5                	jne    444 <printint+0x38>
  if(neg)
 47f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 483:	74 28                	je     4ad <printint+0xa1>
    buf[i++] = '-';
 485:	8b 45 ec             	mov    -0x14(%ebp),%eax
 488:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 48d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 491:	eb 1a                	jmp    4ad <printint+0xa1>
    putc(fd, buf[i]);
 493:	8b 45 ec             	mov    -0x14(%ebp),%eax
 496:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 49b:	0f be c0             	movsbl %al,%eax
 49e:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a2:	8b 45 08             	mov    0x8(%ebp),%eax
 4a5:	89 04 24             	mov    %eax,(%esp)
 4a8:	e8 37 ff ff ff       	call   3e4 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4ad:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 4b1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4b5:	79 dc                	jns    493 <printint+0x87>
    putc(fd, buf[i]);
}
 4b7:	83 c4 44             	add    $0x44,%esp
 4ba:	5b                   	pop    %ebx
 4bb:	5d                   	pop    %ebp
 4bc:	c3                   	ret    

000004bd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4bd:	55                   	push   %ebp
 4be:	89 e5                	mov    %esp,%ebp
 4c0:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4c3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4ca:	8d 45 0c             	lea    0xc(%ebp),%eax
 4cd:	83 c0 04             	add    $0x4,%eax
 4d0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 4d3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 4da:	e9 7e 01 00 00       	jmp    65d <printf+0x1a0>
    c = fmt[i] & 0xff;
 4df:	8b 55 0c             	mov    0xc(%ebp),%edx
 4e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4e5:	8d 04 02             	lea    (%edx,%eax,1),%eax
 4e8:	0f b6 00             	movzbl (%eax),%eax
 4eb:	0f be c0             	movsbl %al,%eax
 4ee:	25 ff 00 00 00       	and    $0xff,%eax
 4f3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 4f6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4fa:	75 2c                	jne    528 <printf+0x6b>
      if(c == '%'){
 4fc:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 500:	75 0c                	jne    50e <printf+0x51>
        state = '%';
 502:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 509:	e9 4b 01 00 00       	jmp    659 <printf+0x19c>
      } else {
        putc(fd, c);
 50e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 511:	0f be c0             	movsbl %al,%eax
 514:	89 44 24 04          	mov    %eax,0x4(%esp)
 518:	8b 45 08             	mov    0x8(%ebp),%eax
 51b:	89 04 24             	mov    %eax,(%esp)
 51e:	e8 c1 fe ff ff       	call   3e4 <putc>
 523:	e9 31 01 00 00       	jmp    659 <printf+0x19c>
      }
    } else if(state == '%'){
 528:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 52c:	0f 85 27 01 00 00    	jne    659 <printf+0x19c>
      if(c == 'd'){
 532:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 536:	75 2d                	jne    565 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 538:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53b:	8b 00                	mov    (%eax),%eax
 53d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 544:	00 
 545:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 54c:	00 
 54d:	89 44 24 04          	mov    %eax,0x4(%esp)
 551:	8b 45 08             	mov    0x8(%ebp),%eax
 554:	89 04 24             	mov    %eax,(%esp)
 557:	e8 b0 fe ff ff       	call   40c <printint>
        ap++;
 55c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 560:	e9 ed 00 00 00       	jmp    652 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 565:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 569:	74 06                	je     571 <printf+0xb4>
 56b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 56f:	75 2d                	jne    59e <printf+0xe1>
        printint(fd, *ap, 16, 0);
 571:	8b 45 f4             	mov    -0xc(%ebp),%eax
 574:	8b 00                	mov    (%eax),%eax
 576:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 57d:	00 
 57e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 585:	00 
 586:	89 44 24 04          	mov    %eax,0x4(%esp)
 58a:	8b 45 08             	mov    0x8(%ebp),%eax
 58d:	89 04 24             	mov    %eax,(%esp)
 590:	e8 77 fe ff ff       	call   40c <printint>
        ap++;
 595:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 599:	e9 b4 00 00 00       	jmp    652 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 59e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 5a2:	75 46                	jne    5ea <printf+0x12d>
        s = (char*)*ap;
 5a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a7:	8b 00                	mov    (%eax),%eax
 5a9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 5ac:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 5b0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 5b4:	75 27                	jne    5dd <printf+0x120>
          s = "(null)";
 5b6:	c7 45 e4 1f 0a 00 00 	movl   $0xa1f,-0x1c(%ebp)
        while(*s != 0){
 5bd:	eb 1f                	jmp    5de <printf+0x121>
          putc(fd, *s);
 5bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5c2:	0f b6 00             	movzbl (%eax),%eax
 5c5:	0f be c0             	movsbl %al,%eax
 5c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5cc:	8b 45 08             	mov    0x8(%ebp),%eax
 5cf:	89 04 24             	mov    %eax,(%esp)
 5d2:	e8 0d fe ff ff       	call   3e4 <putc>
          s++;
 5d7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 5db:	eb 01                	jmp    5de <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 5dd:	90                   	nop
 5de:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 5e1:	0f b6 00             	movzbl (%eax),%eax
 5e4:	84 c0                	test   %al,%al
 5e6:	75 d7                	jne    5bf <printf+0x102>
 5e8:	eb 68                	jmp    652 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 5ea:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 5ee:	75 1d                	jne    60d <printf+0x150>
        putc(fd, *ap);
 5f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f3:	8b 00                	mov    (%eax),%eax
 5f5:	0f be c0             	movsbl %al,%eax
 5f8:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fc:	8b 45 08             	mov    0x8(%ebp),%eax
 5ff:	89 04 24             	mov    %eax,(%esp)
 602:	e8 dd fd ff ff       	call   3e4 <putc>
        ap++;
 607:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 60b:	eb 45                	jmp    652 <printf+0x195>
      } else if(c == '%'){
 60d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 611:	75 17                	jne    62a <printf+0x16d>
        putc(fd, c);
 613:	8b 45 e8             	mov    -0x18(%ebp),%eax
 616:	0f be c0             	movsbl %al,%eax
 619:	89 44 24 04          	mov    %eax,0x4(%esp)
 61d:	8b 45 08             	mov    0x8(%ebp),%eax
 620:	89 04 24             	mov    %eax,(%esp)
 623:	e8 bc fd ff ff       	call   3e4 <putc>
 628:	eb 28                	jmp    652 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 62a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 631:	00 
 632:	8b 45 08             	mov    0x8(%ebp),%eax
 635:	89 04 24             	mov    %eax,(%esp)
 638:	e8 a7 fd ff ff       	call   3e4 <putc>
        putc(fd, c);
 63d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 640:	0f be c0             	movsbl %al,%eax
 643:	89 44 24 04          	mov    %eax,0x4(%esp)
 647:	8b 45 08             	mov    0x8(%ebp),%eax
 64a:	89 04 24             	mov    %eax,(%esp)
 64d:	e8 92 fd ff ff       	call   3e4 <putc>
      }
      state = 0;
 652:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 659:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 65d:	8b 55 0c             	mov    0xc(%ebp),%edx
 660:	8b 45 ec             	mov    -0x14(%ebp),%eax
 663:	8d 04 02             	lea    (%edx,%eax,1),%eax
 666:	0f b6 00             	movzbl (%eax),%eax
 669:	84 c0                	test   %al,%al
 66b:	0f 85 6e fe ff ff    	jne    4df <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 671:	c9                   	leave  
 672:	c3                   	ret    
 673:	90                   	nop

00000674 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 674:	55                   	push   %ebp
 675:	89 e5                	mov    %esp,%ebp
 677:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 67a:	8b 45 08             	mov    0x8(%ebp),%eax
 67d:	83 e8 08             	sub    $0x8,%eax
 680:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 683:	a1 74 0a 00 00       	mov    0xa74,%eax
 688:	89 45 fc             	mov    %eax,-0x4(%ebp)
 68b:	eb 24                	jmp    6b1 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 68d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 690:	8b 00                	mov    (%eax),%eax
 692:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 695:	77 12                	ja     6a9 <free+0x35>
 697:	8b 45 f8             	mov    -0x8(%ebp),%eax
 69a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 69d:	77 24                	ja     6c3 <free+0x4f>
 69f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6a2:	8b 00                	mov    (%eax),%eax
 6a4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6a7:	77 1a                	ja     6c3 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ac:	8b 00                	mov    (%eax),%eax
 6ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6b4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6b7:	76 d4                	jbe    68d <free+0x19>
 6b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6bc:	8b 00                	mov    (%eax),%eax
 6be:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6c1:	76 ca                	jbe    68d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c6:	8b 40 04             	mov    0x4(%eax),%eax
 6c9:	c1 e0 03             	shl    $0x3,%eax
 6cc:	89 c2                	mov    %eax,%edx
 6ce:	03 55 f8             	add    -0x8(%ebp),%edx
 6d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d4:	8b 00                	mov    (%eax),%eax
 6d6:	39 c2                	cmp    %eax,%edx
 6d8:	75 24                	jne    6fe <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 6da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6dd:	8b 50 04             	mov    0x4(%eax),%edx
 6e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e3:	8b 00                	mov    (%eax),%eax
 6e5:	8b 40 04             	mov    0x4(%eax),%eax
 6e8:	01 c2                	add    %eax,%edx
 6ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6ed:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 6f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f3:	8b 00                	mov    (%eax),%eax
 6f5:	8b 10                	mov    (%eax),%edx
 6f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fa:	89 10                	mov    %edx,(%eax)
 6fc:	eb 0a                	jmp    708 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 6fe:	8b 45 fc             	mov    -0x4(%ebp),%eax
 701:	8b 10                	mov    (%eax),%edx
 703:	8b 45 f8             	mov    -0x8(%ebp),%eax
 706:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 708:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70b:	8b 40 04             	mov    0x4(%eax),%eax
 70e:	c1 e0 03             	shl    $0x3,%eax
 711:	03 45 fc             	add    -0x4(%ebp),%eax
 714:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 717:	75 20                	jne    739 <free+0xc5>
    p->s.size += bp->s.size;
 719:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71c:	8b 50 04             	mov    0x4(%eax),%edx
 71f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 722:	8b 40 04             	mov    0x4(%eax),%eax
 725:	01 c2                	add    %eax,%edx
 727:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 72d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 730:	8b 10                	mov    (%eax),%edx
 732:	8b 45 fc             	mov    -0x4(%ebp),%eax
 735:	89 10                	mov    %edx,(%eax)
 737:	eb 08                	jmp    741 <free+0xcd>
  } else
    p->s.ptr = bp;
 739:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 73f:	89 10                	mov    %edx,(%eax)
  freep = p;
 741:	8b 45 fc             	mov    -0x4(%ebp),%eax
 744:	a3 74 0a 00 00       	mov    %eax,0xa74
}
 749:	c9                   	leave  
 74a:	c3                   	ret    

0000074b <morecore>:

static Header*
morecore(uint nu)
{
 74b:	55                   	push   %ebp
 74c:	89 e5                	mov    %esp,%ebp
 74e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 751:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 758:	77 07                	ja     761 <morecore+0x16>
    nu = 4096;
 75a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 761:	8b 45 08             	mov    0x8(%ebp),%eax
 764:	c1 e0 03             	shl    $0x3,%eax
 767:	89 04 24             	mov    %eax,(%esp)
 76a:	e8 4d fc ff ff       	call   3bc <sbrk>
 76f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 772:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 776:	75 07                	jne    77f <morecore+0x34>
    return 0;
 778:	b8 00 00 00 00       	mov    $0x0,%eax
 77d:	eb 22                	jmp    7a1 <morecore+0x56>
  hp = (Header*)p;
 77f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 782:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 785:	8b 45 f4             	mov    -0xc(%ebp),%eax
 788:	8b 55 08             	mov    0x8(%ebp),%edx
 78b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 78e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 791:	83 c0 08             	add    $0x8,%eax
 794:	89 04 24             	mov    %eax,(%esp)
 797:	e8 d8 fe ff ff       	call   674 <free>
  return freep;
 79c:	a1 74 0a 00 00       	mov    0xa74,%eax
}
 7a1:	c9                   	leave  
 7a2:	c3                   	ret    

000007a3 <malloc>:

void*
malloc(uint nbytes)
{
 7a3:	55                   	push   %ebp
 7a4:	89 e5                	mov    %esp,%ebp
 7a6:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ac:	83 c0 07             	add    $0x7,%eax
 7af:	c1 e8 03             	shr    $0x3,%eax
 7b2:	83 c0 01             	add    $0x1,%eax
 7b5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 7b8:	a1 74 0a 00 00       	mov    0xa74,%eax
 7bd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7c0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7c4:	75 23                	jne    7e9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7c6:	c7 45 f0 6c 0a 00 00 	movl   $0xa6c,-0x10(%ebp)
 7cd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d0:	a3 74 0a 00 00       	mov    %eax,0xa74
 7d5:	a1 74 0a 00 00       	mov    0xa74,%eax
 7da:	a3 6c 0a 00 00       	mov    %eax,0xa6c
    base.s.size = 0;
 7df:	c7 05 70 0a 00 00 00 	movl   $0x0,0xa70
 7e6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 7e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ec:	8b 00                	mov    (%eax),%eax
 7ee:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 7f1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f4:	8b 40 04             	mov    0x4(%eax),%eax
 7f7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 7fa:	72 4d                	jb     849 <malloc+0xa6>
      if(p->s.size == nunits)
 7fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7ff:	8b 40 04             	mov    0x4(%eax),%eax
 802:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 805:	75 0c                	jne    813 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 807:	8b 45 ec             	mov    -0x14(%ebp),%eax
 80a:	8b 10                	mov    (%eax),%edx
 80c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 80f:	89 10                	mov    %edx,(%eax)
 811:	eb 26                	jmp    839 <malloc+0x96>
      else {
        p->s.size -= nunits;
 813:	8b 45 ec             	mov    -0x14(%ebp),%eax
 816:	8b 40 04             	mov    0x4(%eax),%eax
 819:	89 c2                	mov    %eax,%edx
 81b:	2b 55 f4             	sub    -0xc(%ebp),%edx
 81e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 821:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 824:	8b 45 ec             	mov    -0x14(%ebp),%eax
 827:	8b 40 04             	mov    0x4(%eax),%eax
 82a:	c1 e0 03             	shl    $0x3,%eax
 82d:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 830:	8b 45 ec             	mov    -0x14(%ebp),%eax
 833:	8b 55 f4             	mov    -0xc(%ebp),%edx
 836:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 839:	8b 45 f0             	mov    -0x10(%ebp),%eax
 83c:	a3 74 0a 00 00       	mov    %eax,0xa74
      return (void*)(p + 1);
 841:	8b 45 ec             	mov    -0x14(%ebp),%eax
 844:	83 c0 08             	add    $0x8,%eax
 847:	eb 38                	jmp    881 <malloc+0xde>
    }
    if(p == freep)
 849:	a1 74 0a 00 00       	mov    0xa74,%eax
 84e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 851:	75 1b                	jne    86e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 853:	8b 45 f4             	mov    -0xc(%ebp),%eax
 856:	89 04 24             	mov    %eax,(%esp)
 859:	e8 ed fe ff ff       	call   74b <morecore>
 85e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 861:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 865:	75 07                	jne    86e <malloc+0xcb>
        return 0;
 867:	b8 00 00 00 00       	mov    $0x0,%eax
 86c:	eb 13                	jmp    881 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 86e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 871:	89 45 f0             	mov    %eax,-0x10(%ebp)
 874:	8b 45 ec             	mov    -0x14(%ebp),%eax
 877:	8b 00                	mov    (%eax),%eax
 879:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 87c:	e9 70 ff ff ff       	jmp    7f1 <malloc+0x4e>
}
 881:	c9                   	leave  
 882:	c3                   	ret    
 883:	90                   	nop

00000884 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 884:	55                   	push   %ebp
 885:	89 e5                	mov    %esp,%ebp
 887:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 88a:	8b 55 08             	mov    0x8(%ebp),%edx
 88d:	8b 45 0c             	mov    0xc(%ebp),%eax
 890:	8b 4d 08             	mov    0x8(%ebp),%ecx
 893:	f0 87 02             	lock xchg %eax,(%edx)
 896:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 899:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 89c:	c9                   	leave  
 89d:	c3                   	ret    

0000089e <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 89e:	55                   	push   %ebp
 89f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 8a1:	8b 45 08             	mov    0x8(%ebp),%eax
 8a4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 8aa:	5d                   	pop    %ebp
 8ab:	c3                   	ret    

000008ac <lock_acquire>:
void lock_acquire(lock_t *lock){
 8ac:	55                   	push   %ebp
 8ad:	89 e5                	mov    %esp,%ebp
 8af:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 8b2:	8b 45 08             	mov    0x8(%ebp),%eax
 8b5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8bc:	00 
 8bd:	89 04 24             	mov    %eax,(%esp)
 8c0:	e8 bf ff ff ff       	call   884 <xchg>
 8c5:	85 c0                	test   %eax,%eax
 8c7:	75 e9                	jne    8b2 <lock_acquire+0x6>
}
 8c9:	c9                   	leave  
 8ca:	c3                   	ret    

000008cb <lock_release>:
void lock_release(lock_t *lock){
 8cb:	55                   	push   %ebp
 8cc:	89 e5                	mov    %esp,%ebp
 8ce:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 8d1:	8b 45 08             	mov    0x8(%ebp),%eax
 8d4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 8db:	00 
 8dc:	89 04 24             	mov    %eax,(%esp)
 8df:	e8 a0 ff ff ff       	call   884 <xchg>
}
 8e4:	c9                   	leave  
 8e5:	c3                   	ret    

000008e6 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 8e6:	55                   	push   %ebp
 8e7:	89 e5                	mov    %esp,%ebp
 8e9:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 8ec:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 8f3:	e8 ab fe ff ff       	call   7a3 <malloc>
 8f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 8fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8fe:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 901:	8b 45 f0             	mov    -0x10(%ebp),%eax
 904:	25 ff 0f 00 00       	and    $0xfff,%eax
 909:	85 c0                	test   %eax,%eax
 90b:	74 15                	je     922 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 90d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 910:	89 c2                	mov    %eax,%edx
 912:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 918:	b8 00 10 00 00       	mov    $0x1000,%eax
 91d:	29 d0                	sub    %edx,%eax
 91f:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 922:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 926:	75 1b                	jne    943 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 928:	c7 44 24 04 26 0a 00 	movl   $0xa26,0x4(%esp)
 92f:	00 
 930:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 937:	e8 81 fb ff ff       	call   4bd <printf>
        return 0;
 93c:	b8 00 00 00 00       	mov    $0x0,%eax
 941:	eb 70                	jmp    9b3 <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 943:	8b 55 08             	mov    0x8(%ebp),%edx
 946:	8b 45 f0             	mov    -0x10(%ebp),%eax
 949:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 950:	00 
 951:	89 54 24 08          	mov    %edx,0x8(%esp)
 955:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 95c:	00 
 95d:	89 04 24             	mov    %eax,(%esp)
 960:	e8 6f fa ff ff       	call   3d4 <clone>
 965:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 968:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 96c:	79 1b                	jns    989 <thread_create+0xa3>
        printf(1,"clone fails\n");
 96e:	c7 44 24 04 34 0a 00 	movl   $0xa34,0x4(%esp)
 975:	00 
 976:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 97d:	e8 3b fb ff ff       	call   4bd <printf>
        return 0;
 982:	b8 00 00 00 00       	mov    $0x0,%eax
 987:	eb 2a                	jmp    9b3 <thread_create+0xcd>
    }
    if(tid > 0){
 989:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 98d:	7e 05                	jle    994 <thread_create+0xae>
        return garbage_stack;
 98f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 992:	eb 1f                	jmp    9b3 <thread_create+0xcd>
    }
    if(tid == 0){
 994:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 998:	75 14                	jne    9ae <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 99a:	c7 44 24 04 41 0a 00 	movl   $0xa41,0x4(%esp)
 9a1:	00 
 9a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9a9:	e8 0f fb ff ff       	call   4bd <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 9ae:	b8 00 00 00 00       	mov    $0x0,%eax
}
 9b3:	c9                   	leave  
 9b4:	c3                   	ret    
