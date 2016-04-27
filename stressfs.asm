
_stressfs:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "fs.h"
#include "fcntl.h"

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	81 ec 30 02 00 00    	sub    $0x230,%esp
  int fd, i;
  char path[] = "stressfs0";
   c:	c7 84 24 1e 02 00 00 	movl   $0x65727473,0x21e(%esp)
  13:	73 74 72 65 
  17:	c7 84 24 22 02 00 00 	movl   $0x73667373,0x222(%esp)
  1e:	73 73 66 73 
  22:	66 c7 84 24 26 02 00 	movw   $0x30,0x226(%esp)
  29:	00 30 00 
  char data[512];

  printf(1, "stressfs starting\n");
  2c:	c7 44 24 04 9d 0a 00 	movl   $0xa9d,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 65 05 00 00       	call   5a5 <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 1a 02 00 00       	call   276 <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 11                	jmp    7a <main+0x7a>
    if(fork() > 0)
  69:	e8 a6 03 00 00       	call   414 <fork>
  6e:	85 c0                	test   %eax,%eax
  70:	7f 14                	jg     86 <main+0x86>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  72:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
  79:	01 
  7a:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
  81:	03 
  82:	7e e5                	jle    69 <main+0x69>
  84:	eb 01                	jmp    87 <main+0x87>
    if(fork() > 0)
      break;
  86:	90                   	nop

  printf(1, "write %d\n", i);
  87:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  8e:	89 44 24 08          	mov    %eax,0x8(%esp)
  92:	c7 44 24 04 b0 0a 00 	movl   $0xab0,0x4(%esp)
  99:	00 
  9a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a1:	e8 ff 04 00 00       	call   5a5 <printf>

  path[8] += i;
  a6:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
  ad:	00 
  ae:	89 c2                	mov    %eax,%edx
  b0:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  b7:	8d 04 02             	lea    (%edx,%eax,1),%eax
  ba:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  c1:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  c8:	00 
  c9:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
  d0:	89 04 24             	mov    %eax,(%esp)
  d3:	e8 84 03 00 00       	call   45c <open>
  d8:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
  df:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  e6:	00 00 00 00 
  ea:	eb 27                	jmp    113 <main+0x113>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  ec:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  f3:	00 
  f4:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  f8:	89 44 24 04          	mov    %eax,0x4(%esp)
  fc:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 103:	89 04 24             	mov    %eax,(%esp)
 106:	e8 31 03 00 00       	call   43c <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
 10b:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 112:	01 
 113:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 11a:	13 
 11b:	7e cf                	jle    ec <main+0xec>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
 11d:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 124:	89 04 24             	mov    %eax,(%esp)
 127:	e8 18 03 00 00       	call   444 <close>

  printf(1, "read\n");
 12c:	c7 44 24 04 ba 0a 00 	movl   $0xaba,0x4(%esp)
 133:	00 
 134:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 13b:	e8 65 04 00 00       	call   5a5 <printf>

  fd = open(path, O_RDONLY);
 140:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 147:	00 
 148:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 14f:	89 04 24             	mov    %eax,(%esp)
 152:	e8 05 03 00 00       	call   45c <open>
 157:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
 15e:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 165:	00 00 00 00 
 169:	eb 27                	jmp    192 <main+0x192>
    read(fd, data, sizeof(data));
 16b:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 172:	00 
 173:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 177:	89 44 24 04          	mov    %eax,0x4(%esp)
 17b:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 182:	89 04 24             	mov    %eax,(%esp)
 185:	e8 aa 02 00 00       	call   434 <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 18a:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 191:	01 
 192:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 199:	13 
 19a:	7e cf                	jle    16b <main+0x16b>
    read(fd, data, sizeof(data));
  close(fd);
 19c:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 1a3:	89 04 24             	mov    %eax,(%esp)
 1a6:	e8 99 02 00 00       	call   444 <close>

  wait();
 1ab:	e8 74 02 00 00       	call   424 <wait>
  
  exit();
 1b0:	e8 67 02 00 00       	call   41c <exit>
 1b5:	90                   	nop
 1b6:	90                   	nop
 1b7:	90                   	nop

000001b8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1b8:	55                   	push   %ebp
 1b9:	89 e5                	mov    %esp,%ebp
 1bb:	57                   	push   %edi
 1bc:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1bd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1c0:	8b 55 10             	mov    0x10(%ebp),%edx
 1c3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c6:	89 cb                	mov    %ecx,%ebx
 1c8:	89 df                	mov    %ebx,%edi
 1ca:	89 d1                	mov    %edx,%ecx
 1cc:	fc                   	cld    
 1cd:	f3 aa                	rep stos %al,%es:(%edi)
 1cf:	89 ca                	mov    %ecx,%edx
 1d1:	89 fb                	mov    %edi,%ebx
 1d3:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1d6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1d9:	5b                   	pop    %ebx
 1da:	5f                   	pop    %edi
 1db:	5d                   	pop    %ebp
 1dc:	c3                   	ret    

000001dd <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1dd:	55                   	push   %ebp
 1de:	89 e5                	mov    %esp,%ebp
 1e0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1e3:	8b 45 08             	mov    0x8(%ebp),%eax
 1e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1ec:	0f b6 10             	movzbl (%eax),%edx
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
 1f2:	88 10                	mov    %dl,(%eax)
 1f4:	8b 45 08             	mov    0x8(%ebp),%eax
 1f7:	0f b6 00             	movzbl (%eax),%eax
 1fa:	84 c0                	test   %al,%al
 1fc:	0f 95 c0             	setne  %al
 1ff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 203:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 207:	84 c0                	test   %al,%al
 209:	75 de                	jne    1e9 <strcpy+0xc>
    ;
  return os;
 20b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 20e:	c9                   	leave  
 20f:	c3                   	ret    

00000210 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 210:	55                   	push   %ebp
 211:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 213:	eb 08                	jmp    21d <strcmp+0xd>
    p++, q++;
 215:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 219:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 21d:	8b 45 08             	mov    0x8(%ebp),%eax
 220:	0f b6 00             	movzbl (%eax),%eax
 223:	84 c0                	test   %al,%al
 225:	74 10                	je     237 <strcmp+0x27>
 227:	8b 45 08             	mov    0x8(%ebp),%eax
 22a:	0f b6 10             	movzbl (%eax),%edx
 22d:	8b 45 0c             	mov    0xc(%ebp),%eax
 230:	0f b6 00             	movzbl (%eax),%eax
 233:	38 c2                	cmp    %al,%dl
 235:	74 de                	je     215 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 237:	8b 45 08             	mov    0x8(%ebp),%eax
 23a:	0f b6 00             	movzbl (%eax),%eax
 23d:	0f b6 d0             	movzbl %al,%edx
 240:	8b 45 0c             	mov    0xc(%ebp),%eax
 243:	0f b6 00             	movzbl (%eax),%eax
 246:	0f b6 c0             	movzbl %al,%eax
 249:	89 d1                	mov    %edx,%ecx
 24b:	29 c1                	sub    %eax,%ecx
 24d:	89 c8                	mov    %ecx,%eax
}
 24f:	5d                   	pop    %ebp
 250:	c3                   	ret    

00000251 <strlen>:

uint
strlen(char *s)
{
 251:	55                   	push   %ebp
 252:	89 e5                	mov    %esp,%ebp
 254:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 257:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 25e:	eb 04                	jmp    264 <strlen+0x13>
 260:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 264:	8b 45 fc             	mov    -0x4(%ebp),%eax
 267:	03 45 08             	add    0x8(%ebp),%eax
 26a:	0f b6 00             	movzbl (%eax),%eax
 26d:	84 c0                	test   %al,%al
 26f:	75 ef                	jne    260 <strlen+0xf>
    ;
  return n;
 271:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 274:	c9                   	leave  
 275:	c3                   	ret    

00000276 <memset>:

void*
memset(void *dst, int c, uint n)
{
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 27c:	8b 45 10             	mov    0x10(%ebp),%eax
 27f:	89 44 24 08          	mov    %eax,0x8(%esp)
 283:	8b 45 0c             	mov    0xc(%ebp),%eax
 286:	89 44 24 04          	mov    %eax,0x4(%esp)
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	89 04 24             	mov    %eax,(%esp)
 290:	e8 23 ff ff ff       	call   1b8 <stosb>
  return dst;
 295:	8b 45 08             	mov    0x8(%ebp),%eax
}
 298:	c9                   	leave  
 299:	c3                   	ret    

0000029a <strchr>:

char*
strchr(const char *s, char c)
{
 29a:	55                   	push   %ebp
 29b:	89 e5                	mov    %esp,%ebp
 29d:	83 ec 04             	sub    $0x4,%esp
 2a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a3:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2a6:	eb 14                	jmp    2bc <strchr+0x22>
    if(*s == c)
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	0f b6 00             	movzbl (%eax),%eax
 2ae:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2b1:	75 05                	jne    2b8 <strchr+0x1e>
      return (char*)s;
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	eb 13                	jmp    2cb <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2b8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2bc:	8b 45 08             	mov    0x8(%ebp),%eax
 2bf:	0f b6 00             	movzbl (%eax),%eax
 2c2:	84 c0                	test   %al,%al
 2c4:	75 e2                	jne    2a8 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2c6:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2cb:	c9                   	leave  
 2cc:	c3                   	ret    

000002cd <gets>:

char*
gets(char *buf, int max)
{
 2cd:	55                   	push   %ebp
 2ce:	89 e5                	mov    %esp,%ebp
 2d0:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 2da:	eb 44                	jmp    320 <gets+0x53>
    cc = read(0, &c, 1);
 2dc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2e3:	00 
 2e4:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2e7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2eb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2f2:	e8 3d 01 00 00       	call   434 <read>
 2f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 2fa:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2fe:	7e 2d                	jle    32d <gets+0x60>
      break;
    buf[i++] = c;
 300:	8b 45 f0             	mov    -0x10(%ebp),%eax
 303:	03 45 08             	add    0x8(%ebp),%eax
 306:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 30a:	88 10                	mov    %dl,(%eax)
 30c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 310:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 314:	3c 0a                	cmp    $0xa,%al
 316:	74 16                	je     32e <gets+0x61>
 318:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 31c:	3c 0d                	cmp    $0xd,%al
 31e:	74 0e                	je     32e <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 320:	8b 45 f0             	mov    -0x10(%ebp),%eax
 323:	83 c0 01             	add    $0x1,%eax
 326:	3b 45 0c             	cmp    0xc(%ebp),%eax
 329:	7c b1                	jl     2dc <gets+0xf>
 32b:	eb 01                	jmp    32e <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 32d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 32e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 331:	03 45 08             	add    0x8(%ebp),%eax
 334:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 337:	8b 45 08             	mov    0x8(%ebp),%eax
}
 33a:	c9                   	leave  
 33b:	c3                   	ret    

0000033c <stat>:

int
stat(char *n, struct stat *st)
{
 33c:	55                   	push   %ebp
 33d:	89 e5                	mov    %esp,%ebp
 33f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 342:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 349:	00 
 34a:	8b 45 08             	mov    0x8(%ebp),%eax
 34d:	89 04 24             	mov    %eax,(%esp)
 350:	e8 07 01 00 00       	call   45c <open>
 355:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 358:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 35c:	79 07                	jns    365 <stat+0x29>
    return -1;
 35e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 363:	eb 23                	jmp    388 <stat+0x4c>
  r = fstat(fd, st);
 365:	8b 45 0c             	mov    0xc(%ebp),%eax
 368:	89 44 24 04          	mov    %eax,0x4(%esp)
 36c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 36f:	89 04 24             	mov    %eax,(%esp)
 372:	e8 fd 00 00 00       	call   474 <fstat>
 377:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 37a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 37d:	89 04 24             	mov    %eax,(%esp)
 380:	e8 bf 00 00 00       	call   444 <close>
  return r;
 385:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 388:	c9                   	leave  
 389:	c3                   	ret    

0000038a <atoi>:

int
atoi(const char *s)
{
 38a:	55                   	push   %ebp
 38b:	89 e5                	mov    %esp,%ebp
 38d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 390:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 397:	eb 24                	jmp    3bd <atoi+0x33>
    n = n*10 + *s++ - '0';
 399:	8b 55 fc             	mov    -0x4(%ebp),%edx
 39c:	89 d0                	mov    %edx,%eax
 39e:	c1 e0 02             	shl    $0x2,%eax
 3a1:	01 d0                	add    %edx,%eax
 3a3:	01 c0                	add    %eax,%eax
 3a5:	89 c2                	mov    %eax,%edx
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
 3aa:	0f b6 00             	movzbl (%eax),%eax
 3ad:	0f be c0             	movsbl %al,%eax
 3b0:	8d 04 02             	lea    (%edx,%eax,1),%eax
 3b3:	83 e8 30             	sub    $0x30,%eax
 3b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 3b9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	3c 2f                	cmp    $0x2f,%al
 3c5:	7e 0a                	jle    3d1 <atoi+0x47>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 00             	movzbl (%eax),%eax
 3cd:	3c 39                	cmp    $0x39,%al
 3cf:	7e c8                	jle    399 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3d4:	c9                   	leave  
 3d5:	c3                   	ret    

000003d6 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3d6:	55                   	push   %ebp
 3d7:	89 e5                	mov    %esp,%ebp
 3d9:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3dc:	8b 45 08             	mov    0x8(%ebp),%eax
 3df:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 3e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 3e8:	eb 13                	jmp    3fd <memmove+0x27>
    *dst++ = *src++;
 3ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ed:	0f b6 10             	movzbl (%eax),%edx
 3f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3f3:	88 10                	mov    %dl,(%eax)
 3f5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 3f9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3fd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 401:	0f 9f c0             	setg   %al
 404:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 408:	84 c0                	test   %al,%al
 40a:	75 de                	jne    3ea <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 40c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 40f:	c9                   	leave  
 410:	c3                   	ret    
 411:	90                   	nop
 412:	90                   	nop
 413:	90                   	nop

00000414 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 414:	b8 01 00 00 00       	mov    $0x1,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <exit>:
SYSCALL(exit)
 41c:	b8 02 00 00 00       	mov    $0x2,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <wait>:
SYSCALL(wait)
 424:	b8 03 00 00 00       	mov    $0x3,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <pipe>:
SYSCALL(pipe)
 42c:	b8 04 00 00 00       	mov    $0x4,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <read>:
SYSCALL(read)
 434:	b8 05 00 00 00       	mov    $0x5,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <write>:
SYSCALL(write)
 43c:	b8 10 00 00 00       	mov    $0x10,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <close>:
SYSCALL(close)
 444:	b8 15 00 00 00       	mov    $0x15,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <kill>:
SYSCALL(kill)
 44c:	b8 06 00 00 00       	mov    $0x6,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <exec>:
SYSCALL(exec)
 454:	b8 07 00 00 00       	mov    $0x7,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <open>:
SYSCALL(open)
 45c:	b8 0f 00 00 00       	mov    $0xf,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <mknod>:
SYSCALL(mknod)
 464:	b8 11 00 00 00       	mov    $0x11,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <unlink>:
SYSCALL(unlink)
 46c:	b8 12 00 00 00       	mov    $0x12,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <fstat>:
SYSCALL(fstat)
 474:	b8 08 00 00 00       	mov    $0x8,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <link>:
SYSCALL(link)
 47c:	b8 13 00 00 00       	mov    $0x13,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <mkdir>:
SYSCALL(mkdir)
 484:	b8 14 00 00 00       	mov    $0x14,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <chdir>:
SYSCALL(chdir)
 48c:	b8 09 00 00 00       	mov    $0x9,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <dup>:
SYSCALL(dup)
 494:	b8 0a 00 00 00       	mov    $0xa,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <getpid>:
SYSCALL(getpid)
 49c:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <sbrk>:
SYSCALL(sbrk)
 4a4:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <sleep>:
SYSCALL(sleep)
 4ac:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <uptime>:
SYSCALL(uptime)
 4b4:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <clone>:
SYSCALL(clone)
 4bc:	b8 16 00 00 00       	mov    $0x16,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <texit>:
SYSCALL(texit)
 4c4:	b8 17 00 00 00       	mov    $0x17,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	83 ec 28             	sub    $0x28,%esp
 4d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4d8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4df:	00 
 4e0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e7:	8b 45 08             	mov    0x8(%ebp),%eax
 4ea:	89 04 24             	mov    %eax,(%esp)
 4ed:	e8 4a ff ff ff       	call   43c <write>
}
 4f2:	c9                   	leave  
 4f3:	c3                   	ret    

000004f4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	53                   	push   %ebx
 4f8:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 502:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 506:	74 17                	je     51f <printint+0x2b>
 508:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 50c:	79 11                	jns    51f <printint+0x2b>
    neg = 1;
 50e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 515:	8b 45 0c             	mov    0xc(%ebp),%eax
 518:	f7 d8                	neg    %eax
 51a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 51d:	eb 06                	jmp    525 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 51f:	8b 45 0c             	mov    0xc(%ebp),%eax
 522:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 525:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 52c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 52f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 532:	8b 45 f4             	mov    -0xc(%ebp),%eax
 535:	ba 00 00 00 00       	mov    $0x0,%edx
 53a:	f7 f3                	div    %ebx
 53c:	89 d0                	mov    %edx,%eax
 53e:	0f b6 80 f4 0a 00 00 	movzbl 0xaf4(%eax),%eax
 545:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 549:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 54d:	8b 45 10             	mov    0x10(%ebp),%eax
 550:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 553:	8b 45 f4             	mov    -0xc(%ebp),%eax
 556:	ba 00 00 00 00       	mov    $0x0,%edx
 55b:	f7 75 d4             	divl   -0x2c(%ebp)
 55e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 561:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 565:	75 c5                	jne    52c <printint+0x38>
  if(neg)
 567:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 56b:	74 28                	je     595 <printint+0xa1>
    buf[i++] = '-';
 56d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 570:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 575:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 579:	eb 1a                	jmp    595 <printint+0xa1>
    putc(fd, buf[i]);
 57b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 57e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 583:	0f be c0             	movsbl %al,%eax
 586:	89 44 24 04          	mov    %eax,0x4(%esp)
 58a:	8b 45 08             	mov    0x8(%ebp),%eax
 58d:	89 04 24             	mov    %eax,(%esp)
 590:	e8 37 ff ff ff       	call   4cc <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 595:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 599:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 59d:	79 dc                	jns    57b <printint+0x87>
    putc(fd, buf[i]);
}
 59f:	83 c4 44             	add    $0x44,%esp
 5a2:	5b                   	pop    %ebx
 5a3:	5d                   	pop    %ebp
 5a4:	c3                   	ret    

000005a5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5a5:	55                   	push   %ebp
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5ab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5b2:	8d 45 0c             	lea    0xc(%ebp),%eax
 5b5:	83 c0 04             	add    $0x4,%eax
 5b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 5bb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 5c2:	e9 7e 01 00 00       	jmp    745 <printf+0x1a0>
    c = fmt[i] & 0xff;
 5c7:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ca:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5cd:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5d0:	0f b6 00             	movzbl (%eax),%eax
 5d3:	0f be c0             	movsbl %al,%eax
 5d6:	25 ff 00 00 00       	and    $0xff,%eax
 5db:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 5de:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5e2:	75 2c                	jne    610 <printf+0x6b>
      if(c == '%'){
 5e4:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5e8:	75 0c                	jne    5f6 <printf+0x51>
        state = '%';
 5ea:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 5f1:	e9 4b 01 00 00       	jmp    741 <printf+0x19c>
      } else {
        putc(fd, c);
 5f6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5f9:	0f be c0             	movsbl %al,%eax
 5fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 600:	8b 45 08             	mov    0x8(%ebp),%eax
 603:	89 04 24             	mov    %eax,(%esp)
 606:	e8 c1 fe ff ff       	call   4cc <putc>
 60b:	e9 31 01 00 00       	jmp    741 <printf+0x19c>
      }
    } else if(state == '%'){
 610:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 614:	0f 85 27 01 00 00    	jne    741 <printf+0x19c>
      if(c == 'd'){
 61a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 61e:	75 2d                	jne    64d <printf+0xa8>
        printint(fd, *ap, 10, 1);
 620:	8b 45 f4             	mov    -0xc(%ebp),%eax
 623:	8b 00                	mov    (%eax),%eax
 625:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 62c:	00 
 62d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 634:	00 
 635:	89 44 24 04          	mov    %eax,0x4(%esp)
 639:	8b 45 08             	mov    0x8(%ebp),%eax
 63c:	89 04 24             	mov    %eax,(%esp)
 63f:	e8 b0 fe ff ff       	call   4f4 <printint>
        ap++;
 644:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 648:	e9 ed 00 00 00       	jmp    73a <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 64d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 651:	74 06                	je     659 <printf+0xb4>
 653:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 657:	75 2d                	jne    686 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 659:	8b 45 f4             	mov    -0xc(%ebp),%eax
 65c:	8b 00                	mov    (%eax),%eax
 65e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 665:	00 
 666:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 66d:	00 
 66e:	89 44 24 04          	mov    %eax,0x4(%esp)
 672:	8b 45 08             	mov    0x8(%ebp),%eax
 675:	89 04 24             	mov    %eax,(%esp)
 678:	e8 77 fe ff ff       	call   4f4 <printint>
        ap++;
 67d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 681:	e9 b4 00 00 00       	jmp    73a <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 686:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 68a:	75 46                	jne    6d2 <printf+0x12d>
        s = (char*)*ap;
 68c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 68f:	8b 00                	mov    (%eax),%eax
 691:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 694:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 698:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 69c:	75 27                	jne    6c5 <printf+0x120>
          s = "(null)";
 69e:	c7 45 e4 c0 0a 00 00 	movl   $0xac0,-0x1c(%ebp)
        while(*s != 0){
 6a5:	eb 1f                	jmp    6c6 <printf+0x121>
          putc(fd, *s);
 6a7:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6aa:	0f b6 00             	movzbl (%eax),%eax
 6ad:	0f be c0             	movsbl %al,%eax
 6b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b4:	8b 45 08             	mov    0x8(%ebp),%eax
 6b7:	89 04 24             	mov    %eax,(%esp)
 6ba:	e8 0d fe ff ff       	call   4cc <putc>
          s++;
 6bf:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 6c3:	eb 01                	jmp    6c6 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6c5:	90                   	nop
 6c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6c9:	0f b6 00             	movzbl (%eax),%eax
 6cc:	84 c0                	test   %al,%al
 6ce:	75 d7                	jne    6a7 <printf+0x102>
 6d0:	eb 68                	jmp    73a <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6d2:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 6d6:	75 1d                	jne    6f5 <printf+0x150>
        putc(fd, *ap);
 6d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6db:	8b 00                	mov    (%eax),%eax
 6dd:	0f be c0             	movsbl %al,%eax
 6e0:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e4:	8b 45 08             	mov    0x8(%ebp),%eax
 6e7:	89 04 24             	mov    %eax,(%esp)
 6ea:	e8 dd fd ff ff       	call   4cc <putc>
        ap++;
 6ef:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 6f3:	eb 45                	jmp    73a <printf+0x195>
      } else if(c == '%'){
 6f5:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 6f9:	75 17                	jne    712 <printf+0x16d>
        putc(fd, c);
 6fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6fe:	0f be c0             	movsbl %al,%eax
 701:	89 44 24 04          	mov    %eax,0x4(%esp)
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	89 04 24             	mov    %eax,(%esp)
 70b:	e8 bc fd ff ff       	call   4cc <putc>
 710:	eb 28                	jmp    73a <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 712:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 719:	00 
 71a:	8b 45 08             	mov    0x8(%ebp),%eax
 71d:	89 04 24             	mov    %eax,(%esp)
 720:	e8 a7 fd ff ff       	call   4cc <putc>
        putc(fd, c);
 725:	8b 45 e8             	mov    -0x18(%ebp),%eax
 728:	0f be c0             	movsbl %al,%eax
 72b:	89 44 24 04          	mov    %eax,0x4(%esp)
 72f:	8b 45 08             	mov    0x8(%ebp),%eax
 732:	89 04 24             	mov    %eax,(%esp)
 735:	e8 92 fd ff ff       	call   4cc <putc>
      }
      state = 0;
 73a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 741:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 745:	8b 55 0c             	mov    0xc(%ebp),%edx
 748:	8b 45 ec             	mov    -0x14(%ebp),%eax
 74b:	8d 04 02             	lea    (%edx,%eax,1),%eax
 74e:	0f b6 00             	movzbl (%eax),%eax
 751:	84 c0                	test   %al,%al
 753:	0f 85 6e fe ff ff    	jne    5c7 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 759:	c9                   	leave  
 75a:	c3                   	ret    
 75b:	90                   	nop

0000075c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 75c:	55                   	push   %ebp
 75d:	89 e5                	mov    %esp,%ebp
 75f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 762:	8b 45 08             	mov    0x8(%ebp),%eax
 765:	83 e8 08             	sub    $0x8,%eax
 768:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 76b:	a1 10 0b 00 00       	mov    0xb10,%eax
 770:	89 45 fc             	mov    %eax,-0x4(%ebp)
 773:	eb 24                	jmp    799 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 775:	8b 45 fc             	mov    -0x4(%ebp),%eax
 778:	8b 00                	mov    (%eax),%eax
 77a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 77d:	77 12                	ja     791 <free+0x35>
 77f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 782:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 785:	77 24                	ja     7ab <free+0x4f>
 787:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78a:	8b 00                	mov    (%eax),%eax
 78c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 78f:	77 1a                	ja     7ab <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 791:	8b 45 fc             	mov    -0x4(%ebp),%eax
 794:	8b 00                	mov    (%eax),%eax
 796:	89 45 fc             	mov    %eax,-0x4(%ebp)
 799:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 79f:	76 d4                	jbe    775 <free+0x19>
 7a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a4:	8b 00                	mov    (%eax),%eax
 7a6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7a9:	76 ca                	jbe    775 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ae:	8b 40 04             	mov    0x4(%eax),%eax
 7b1:	c1 e0 03             	shl    $0x3,%eax
 7b4:	89 c2                	mov    %eax,%edx
 7b6:	03 55 f8             	add    -0x8(%ebp),%edx
 7b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bc:	8b 00                	mov    (%eax),%eax
 7be:	39 c2                	cmp    %eax,%edx
 7c0:	75 24                	jne    7e6 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 7c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c5:	8b 50 04             	mov    0x4(%eax),%edx
 7c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cb:	8b 00                	mov    (%eax),%eax
 7cd:	8b 40 04             	mov    0x4(%eax),%eax
 7d0:	01 c2                	add    %eax,%edx
 7d2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7db:	8b 00                	mov    (%eax),%eax
 7dd:	8b 10                	mov    (%eax),%edx
 7df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e2:	89 10                	mov    %edx,(%eax)
 7e4:	eb 0a                	jmp    7f0 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 7e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e9:	8b 10                	mov    (%eax),%edx
 7eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ee:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7f0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f3:	8b 40 04             	mov    0x4(%eax),%eax
 7f6:	c1 e0 03             	shl    $0x3,%eax
 7f9:	03 45 fc             	add    -0x4(%ebp),%eax
 7fc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7ff:	75 20                	jne    821 <free+0xc5>
    p->s.size += bp->s.size;
 801:	8b 45 fc             	mov    -0x4(%ebp),%eax
 804:	8b 50 04             	mov    0x4(%eax),%edx
 807:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80a:	8b 40 04             	mov    0x4(%eax),%eax
 80d:	01 c2                	add    %eax,%edx
 80f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 812:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 815:	8b 45 f8             	mov    -0x8(%ebp),%eax
 818:	8b 10                	mov    (%eax),%edx
 81a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81d:	89 10                	mov    %edx,(%eax)
 81f:	eb 08                	jmp    829 <free+0xcd>
  } else
    p->s.ptr = bp;
 821:	8b 45 fc             	mov    -0x4(%ebp),%eax
 824:	8b 55 f8             	mov    -0x8(%ebp),%edx
 827:	89 10                	mov    %edx,(%eax)
  freep = p;
 829:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82c:	a3 10 0b 00 00       	mov    %eax,0xb10
}
 831:	c9                   	leave  
 832:	c3                   	ret    

00000833 <morecore>:

static Header*
morecore(uint nu)
{
 833:	55                   	push   %ebp
 834:	89 e5                	mov    %esp,%ebp
 836:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 839:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 840:	77 07                	ja     849 <morecore+0x16>
    nu = 4096;
 842:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 849:	8b 45 08             	mov    0x8(%ebp),%eax
 84c:	c1 e0 03             	shl    $0x3,%eax
 84f:	89 04 24             	mov    %eax,(%esp)
 852:	e8 4d fc ff ff       	call   4a4 <sbrk>
 857:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 85a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 85e:	75 07                	jne    867 <morecore+0x34>
    return 0;
 860:	b8 00 00 00 00       	mov    $0x0,%eax
 865:	eb 22                	jmp    889 <morecore+0x56>
  hp = (Header*)p;
 867:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 86d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 870:	8b 55 08             	mov    0x8(%ebp),%edx
 873:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 876:	8b 45 f4             	mov    -0xc(%ebp),%eax
 879:	83 c0 08             	add    $0x8,%eax
 87c:	89 04 24             	mov    %eax,(%esp)
 87f:	e8 d8 fe ff ff       	call   75c <free>
  return freep;
 884:	a1 10 0b 00 00       	mov    0xb10,%eax
}
 889:	c9                   	leave  
 88a:	c3                   	ret    

0000088b <malloc>:

void*
malloc(uint nbytes)
{
 88b:	55                   	push   %ebp
 88c:	89 e5                	mov    %esp,%ebp
 88e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 891:	8b 45 08             	mov    0x8(%ebp),%eax
 894:	83 c0 07             	add    $0x7,%eax
 897:	c1 e8 03             	shr    $0x3,%eax
 89a:	83 c0 01             	add    $0x1,%eax
 89d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 8a0:	a1 10 0b 00 00       	mov    0xb10,%eax
 8a5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8a8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8ac:	75 23                	jne    8d1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8ae:	c7 45 f0 08 0b 00 00 	movl   $0xb08,-0x10(%ebp)
 8b5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b8:	a3 10 0b 00 00       	mov    %eax,0xb10
 8bd:	a1 10 0b 00 00       	mov    0xb10,%eax
 8c2:	a3 08 0b 00 00       	mov    %eax,0xb08
    base.s.size = 0;
 8c7:	c7 05 0c 0b 00 00 00 	movl   $0x0,0xb0c
 8ce:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8d4:	8b 00                	mov    (%eax),%eax
 8d6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 8d9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8dc:	8b 40 04             	mov    0x4(%eax),%eax
 8df:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8e2:	72 4d                	jb     931 <malloc+0xa6>
      if(p->s.size == nunits)
 8e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8e7:	8b 40 04             	mov    0x4(%eax),%eax
 8ea:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8ed:	75 0c                	jne    8fb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8f2:	8b 10                	mov    (%eax),%edx
 8f4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f7:	89 10                	mov    %edx,(%eax)
 8f9:	eb 26                	jmp    921 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8fb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8fe:	8b 40 04             	mov    0x4(%eax),%eax
 901:	89 c2                	mov    %eax,%edx
 903:	2b 55 f4             	sub    -0xc(%ebp),%edx
 906:	8b 45 ec             	mov    -0x14(%ebp),%eax
 909:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 90c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 90f:	8b 40 04             	mov    0x4(%eax),%eax
 912:	c1 e0 03             	shl    $0x3,%eax
 915:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 918:	8b 45 ec             	mov    -0x14(%ebp),%eax
 91b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 91e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 921:	8b 45 f0             	mov    -0x10(%ebp),%eax
 924:	a3 10 0b 00 00       	mov    %eax,0xb10
      return (void*)(p + 1);
 929:	8b 45 ec             	mov    -0x14(%ebp),%eax
 92c:	83 c0 08             	add    $0x8,%eax
 92f:	eb 38                	jmp    969 <malloc+0xde>
    }
    if(p == freep)
 931:	a1 10 0b 00 00       	mov    0xb10,%eax
 936:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 939:	75 1b                	jne    956 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 93b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93e:	89 04 24             	mov    %eax,(%esp)
 941:	e8 ed fe ff ff       	call   833 <morecore>
 946:	89 45 ec             	mov    %eax,-0x14(%ebp)
 949:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 94d:	75 07                	jne    956 <malloc+0xcb>
        return 0;
 94f:	b8 00 00 00 00       	mov    $0x0,%eax
 954:	eb 13                	jmp    969 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 956:	8b 45 ec             	mov    -0x14(%ebp),%eax
 959:	89 45 f0             	mov    %eax,-0x10(%ebp)
 95c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 95f:	8b 00                	mov    (%eax),%eax
 961:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 964:	e9 70 ff ff ff       	jmp    8d9 <malloc+0x4e>
}
 969:	c9                   	leave  
 96a:	c3                   	ret    
 96b:	90                   	nop

0000096c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 96c:	55                   	push   %ebp
 96d:	89 e5                	mov    %esp,%ebp
 96f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 972:	8b 55 08             	mov    0x8(%ebp),%edx
 975:	8b 45 0c             	mov    0xc(%ebp),%eax
 978:	8b 4d 08             	mov    0x8(%ebp),%ecx
 97b:	f0 87 02             	lock xchg %eax,(%edx)
 97e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 981:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 984:	c9                   	leave  
 985:	c3                   	ret    

00000986 <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 986:	55                   	push   %ebp
 987:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 989:	8b 45 08             	mov    0x8(%ebp),%eax
 98c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 992:	5d                   	pop    %ebp
 993:	c3                   	ret    

00000994 <lock_acquire>:
void lock_acquire(lock_t *lock){
 994:	55                   	push   %ebp
 995:	89 e5                	mov    %esp,%ebp
 997:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 99a:	8b 45 08             	mov    0x8(%ebp),%eax
 99d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 9a4:	00 
 9a5:	89 04 24             	mov    %eax,(%esp)
 9a8:	e8 bf ff ff ff       	call   96c <xchg>
 9ad:	85 c0                	test   %eax,%eax
 9af:	75 e9                	jne    99a <lock_acquire+0x6>
}
 9b1:	c9                   	leave  
 9b2:	c3                   	ret    

000009b3 <lock_release>:
void lock_release(lock_t *lock){
 9b3:	55                   	push   %ebp
 9b4:	89 e5                	mov    %esp,%ebp
 9b6:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 9b9:	8b 45 08             	mov    0x8(%ebp),%eax
 9bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 9c3:	00 
 9c4:	89 04 24             	mov    %eax,(%esp)
 9c7:	e8 a0 ff ff ff       	call   96c <xchg>
}
 9cc:	c9                   	leave  
 9cd:	c3                   	ret    

000009ce <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 9ce:	55                   	push   %ebp
 9cf:	89 e5                	mov    %esp,%ebp
 9d1:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 9d4:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 9db:	e8 ab fe ff ff       	call   88b <malloc>
 9e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 9e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 9e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ec:	25 ff 0f 00 00       	and    $0xfff,%eax
 9f1:	85 c0                	test   %eax,%eax
 9f3:	74 15                	je     a0a <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 9f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f8:	89 c2                	mov    %eax,%edx
 9fa:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 a00:	b8 00 10 00 00       	mov    $0x1000,%eax
 a05:	29 d0                	sub    %edx,%eax
 a07:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 a0a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a0e:	75 1b                	jne    a2b <thread_create+0x5d>

        printf(1,"malloc fail \n");
 a10:	c7 44 24 04 c7 0a 00 	movl   $0xac7,0x4(%esp)
 a17:	00 
 a18:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a1f:	e8 81 fb ff ff       	call   5a5 <printf>
        return 0;
 a24:	b8 00 00 00 00       	mov    $0x0,%eax
 a29:	eb 70                	jmp    a9b <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 a2b:	8b 55 08             	mov    0x8(%ebp),%edx
 a2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a31:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 a38:	00 
 a39:	89 54 24 08          	mov    %edx,0x8(%esp)
 a3d:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 a44:	00 
 a45:	89 04 24             	mov    %eax,(%esp)
 a48:	e8 6f fa ff ff       	call   4bc <clone>
 a4d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 a50:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a54:	79 1b                	jns    a71 <thread_create+0xa3>
        printf(1,"clone fails\n");
 a56:	c7 44 24 04 d5 0a 00 	movl   $0xad5,0x4(%esp)
 a5d:	00 
 a5e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a65:	e8 3b fb ff ff       	call   5a5 <printf>
        return 0;
 a6a:	b8 00 00 00 00       	mov    $0x0,%eax
 a6f:	eb 2a                	jmp    a9b <thread_create+0xcd>
    }
    if(tid > 0){
 a71:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a75:	7e 05                	jle    a7c <thread_create+0xae>
        return garbage_stack;
 a77:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7a:	eb 1f                	jmp    a9b <thread_create+0xcd>
    }
    if(tid == 0){
 a7c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a80:	75 14                	jne    a96 <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 a82:	c7 44 24 04 e2 0a 00 	movl   $0xae2,0x4(%esp)
 a89:	00 
 a8a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a91:	e8 0f fb ff ff       	call   5a5 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 a96:	b8 00 00 00 00       	mov    $0x0,%eax
}
 a9b:	c9                   	leave  
 a9c:	c3                   	ret    
