
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
  2c:	c7 44 24 04 32 0d 00 	movl   $0xd32,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 83 05 00 00       	call   5c3 <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 12 02 00 00       	call   26e <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 13                	jmp    7c <main+0x7c>
    if(fork() > 0)
  69:	e8 a5 03 00 00       	call   413 <fork>
  6e:	85 c0                	test   %eax,%eax
  70:	7e 02                	jle    74 <main+0x74>
      break;
  72:	eb 12                	jmp    86 <main+0x86>
  char data[512];

  printf(1, "stressfs starting\n");
  memset(data, 'a', sizeof(data));

  for(i = 0; i < 4; i++)
  74:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
  7b:	01 
  7c:	83 bc 24 2c 02 00 00 	cmpl   $0x3,0x22c(%esp)
  83:	03 
  84:	7e e3                	jle    69 <main+0x69>
    if(fork() > 0)
      break;

  printf(1, "write %d\n", i);
  86:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  8d:	89 44 24 08          	mov    %eax,0x8(%esp)
  91:	c7 44 24 04 45 0d 00 	movl   $0xd45,0x4(%esp)
  98:	00 
  99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a0:	e8 1e 05 00 00       	call   5c3 <printf>

  path[8] += i;
  a5:	0f b6 84 24 26 02 00 	movzbl 0x226(%esp),%eax
  ac:	00 
  ad:	89 c2                	mov    %eax,%edx
  af:	8b 84 24 2c 02 00 00 	mov    0x22c(%esp),%eax
  b6:	01 d0                	add    %edx,%eax
  b8:	88 84 24 26 02 00 00 	mov    %al,0x226(%esp)
  fd = open(path, O_CREATE | O_RDWR);
  bf:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
  c6:	00 
  c7:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
  ce:	89 04 24             	mov    %eax,(%esp)
  d1:	e8 85 03 00 00       	call   45b <open>
  d6:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for(i = 0; i < 20; i++)
  dd:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  e4:	00 00 00 00 
  e8:	eb 27                	jmp    111 <main+0x111>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  ea:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  f1:	00 
  f2:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  fa:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 101:	89 04 24             	mov    %eax,(%esp)
 104:	e8 32 03 00 00       	call   43b <write>

  printf(1, "write %d\n", i);

  path[8] += i;
  fd = open(path, O_CREATE | O_RDWR);
  for(i = 0; i < 20; i++)
 109:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 110:	01 
 111:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 118:	13 
 119:	7e cf                	jle    ea <main+0xea>
//    printf(fd, "%d\n", i);
    write(fd, data, sizeof(data));
  close(fd);
 11b:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 122:	89 04 24             	mov    %eax,(%esp)
 125:	e8 19 03 00 00       	call   443 <close>

  printf(1, "read\n");
 12a:	c7 44 24 04 4f 0d 00 	movl   $0xd4f,0x4(%esp)
 131:	00 
 132:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 139:	e8 85 04 00 00       	call   5c3 <printf>

  fd = open(path, O_RDONLY);
 13e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 145:	00 
 146:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 14d:	89 04 24             	mov    %eax,(%esp)
 150:	e8 06 03 00 00       	call   45b <open>
 155:	89 84 24 28 02 00 00 	mov    %eax,0x228(%esp)
  for (i = 0; i < 20; i++)
 15c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
 163:	00 00 00 00 
 167:	eb 27                	jmp    190 <main+0x190>
    read(fd, data, sizeof(data));
 169:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
 170:	00 
 171:	8d 44 24 1e          	lea    0x1e(%esp),%eax
 175:	89 44 24 04          	mov    %eax,0x4(%esp)
 179:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 180:	89 04 24             	mov    %eax,(%esp)
 183:	e8 ab 02 00 00       	call   433 <read>
  close(fd);

  printf(1, "read\n");

  fd = open(path, O_RDONLY);
  for (i = 0; i < 20; i++)
 188:	83 84 24 2c 02 00 00 	addl   $0x1,0x22c(%esp)
 18f:	01 
 190:	83 bc 24 2c 02 00 00 	cmpl   $0x13,0x22c(%esp)
 197:	13 
 198:	7e cf                	jle    169 <main+0x169>
    read(fd, data, sizeof(data));
  close(fd);
 19a:	8b 84 24 28 02 00 00 	mov    0x228(%esp),%eax
 1a1:	89 04 24             	mov    %eax,(%esp)
 1a4:	e8 9a 02 00 00       	call   443 <close>

  wait();
 1a9:	e8 75 02 00 00       	call   423 <wait>
  
  exit();
 1ae:	e8 68 02 00 00       	call   41b <exit>

000001b3 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1b3:	55                   	push   %ebp
 1b4:	89 e5                	mov    %esp,%ebp
 1b6:	57                   	push   %edi
 1b7:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1b8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1bb:	8b 55 10             	mov    0x10(%ebp),%edx
 1be:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c1:	89 cb                	mov    %ecx,%ebx
 1c3:	89 df                	mov    %ebx,%edi
 1c5:	89 d1                	mov    %edx,%ecx
 1c7:	fc                   	cld    
 1c8:	f3 aa                	rep stos %al,%es:(%edi)
 1ca:	89 ca                	mov    %ecx,%edx
 1cc:	89 fb                	mov    %edi,%ebx
 1ce:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1d1:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1d4:	5b                   	pop    %ebx
 1d5:	5f                   	pop    %edi
 1d6:	5d                   	pop    %ebp
 1d7:	c3                   	ret    

000001d8 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1e4:	90                   	nop
 1e5:	8b 45 08             	mov    0x8(%ebp),%eax
 1e8:	8d 50 01             	lea    0x1(%eax),%edx
 1eb:	89 55 08             	mov    %edx,0x8(%ebp)
 1ee:	8b 55 0c             	mov    0xc(%ebp),%edx
 1f1:	8d 4a 01             	lea    0x1(%edx),%ecx
 1f4:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1f7:	0f b6 12             	movzbl (%edx),%edx
 1fa:	88 10                	mov    %dl,(%eax)
 1fc:	0f b6 00             	movzbl (%eax),%eax
 1ff:	84 c0                	test   %al,%al
 201:	75 e2                	jne    1e5 <strcpy+0xd>
    ;
  return os;
 203:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 206:	c9                   	leave  
 207:	c3                   	ret    

00000208 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 208:	55                   	push   %ebp
 209:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 20b:	eb 08                	jmp    215 <strcmp+0xd>
    p++, q++;
 20d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 211:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	0f b6 00             	movzbl (%eax),%eax
 21b:	84 c0                	test   %al,%al
 21d:	74 10                	je     22f <strcmp+0x27>
 21f:	8b 45 08             	mov    0x8(%ebp),%eax
 222:	0f b6 10             	movzbl (%eax),%edx
 225:	8b 45 0c             	mov    0xc(%ebp),%eax
 228:	0f b6 00             	movzbl (%eax),%eax
 22b:	38 c2                	cmp    %al,%dl
 22d:	74 de                	je     20d <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 22f:	8b 45 08             	mov    0x8(%ebp),%eax
 232:	0f b6 00             	movzbl (%eax),%eax
 235:	0f b6 d0             	movzbl %al,%edx
 238:	8b 45 0c             	mov    0xc(%ebp),%eax
 23b:	0f b6 00             	movzbl (%eax),%eax
 23e:	0f b6 c0             	movzbl %al,%eax
 241:	29 c2                	sub    %eax,%edx
 243:	89 d0                	mov    %edx,%eax
}
 245:	5d                   	pop    %ebp
 246:	c3                   	ret    

00000247 <strlen>:

uint
strlen(char *s)
{
 247:	55                   	push   %ebp
 248:	89 e5                	mov    %esp,%ebp
 24a:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 24d:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 254:	eb 04                	jmp    25a <strlen+0x13>
 256:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 25a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 25d:	8b 45 08             	mov    0x8(%ebp),%eax
 260:	01 d0                	add    %edx,%eax
 262:	0f b6 00             	movzbl (%eax),%eax
 265:	84 c0                	test   %al,%al
 267:	75 ed                	jne    256 <strlen+0xf>
    ;
  return n;
 269:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 26c:	c9                   	leave  
 26d:	c3                   	ret    

0000026e <memset>:

void*
memset(void *dst, int c, uint n)
{
 26e:	55                   	push   %ebp
 26f:	89 e5                	mov    %esp,%ebp
 271:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 274:	8b 45 10             	mov    0x10(%ebp),%eax
 277:	89 44 24 08          	mov    %eax,0x8(%esp)
 27b:	8b 45 0c             	mov    0xc(%ebp),%eax
 27e:	89 44 24 04          	mov    %eax,0x4(%esp)
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	89 04 24             	mov    %eax,(%esp)
 288:	e8 26 ff ff ff       	call   1b3 <stosb>
  return dst;
 28d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 290:	c9                   	leave  
 291:	c3                   	ret    

00000292 <strchr>:

char*
strchr(const char *s, char c)
{
 292:	55                   	push   %ebp
 293:	89 e5                	mov    %esp,%ebp
 295:	83 ec 04             	sub    $0x4,%esp
 298:	8b 45 0c             	mov    0xc(%ebp),%eax
 29b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 29e:	eb 14                	jmp    2b4 <strchr+0x22>
    if(*s == c)
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	0f b6 00             	movzbl (%eax),%eax
 2a6:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2a9:	75 05                	jne    2b0 <strchr+0x1e>
      return (char*)s;
 2ab:	8b 45 08             	mov    0x8(%ebp),%eax
 2ae:	eb 13                	jmp    2c3 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2b0:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	0f b6 00             	movzbl (%eax),%eax
 2ba:	84 c0                	test   %al,%al
 2bc:	75 e2                	jne    2a0 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2be:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2c3:	c9                   	leave  
 2c4:	c3                   	ret    

000002c5 <gets>:

char*
gets(char *buf, int max)
{
 2c5:	55                   	push   %ebp
 2c6:	89 e5                	mov    %esp,%ebp
 2c8:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2cb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2d2:	eb 4c                	jmp    320 <gets+0x5b>
    cc = read(0, &c, 1);
 2d4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2db:	00 
 2dc:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2df:	89 44 24 04          	mov    %eax,0x4(%esp)
 2e3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2ea:	e8 44 01 00 00       	call   433 <read>
 2ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2f6:	7f 02                	jg     2fa <gets+0x35>
      break;
 2f8:	eb 31                	jmp    32b <gets+0x66>
    buf[i++] = c;
 2fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2fd:	8d 50 01             	lea    0x1(%eax),%edx
 300:	89 55 f4             	mov    %edx,-0xc(%ebp)
 303:	89 c2                	mov    %eax,%edx
 305:	8b 45 08             	mov    0x8(%ebp),%eax
 308:	01 c2                	add    %eax,%edx
 30a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30e:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 310:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 314:	3c 0a                	cmp    $0xa,%al
 316:	74 13                	je     32b <gets+0x66>
 318:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 31c:	3c 0d                	cmp    $0xd,%al
 31e:	74 0b                	je     32b <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	83 c0 01             	add    $0x1,%eax
 326:	3b 45 0c             	cmp    0xc(%ebp),%eax
 329:	7c a9                	jl     2d4 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 32b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 32e:	8b 45 08             	mov    0x8(%ebp),%eax
 331:	01 d0                	add    %edx,%eax
 333:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 336:	8b 45 08             	mov    0x8(%ebp),%eax
}
 339:	c9                   	leave  
 33a:	c3                   	ret    

0000033b <stat>:

int
stat(char *n, struct stat *st)
{
 33b:	55                   	push   %ebp
 33c:	89 e5                	mov    %esp,%ebp
 33e:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 341:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 348:	00 
 349:	8b 45 08             	mov    0x8(%ebp),%eax
 34c:	89 04 24             	mov    %eax,(%esp)
 34f:	e8 07 01 00 00       	call   45b <open>
 354:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 357:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 35b:	79 07                	jns    364 <stat+0x29>
    return -1;
 35d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 362:	eb 23                	jmp    387 <stat+0x4c>
  r = fstat(fd, st);
 364:	8b 45 0c             	mov    0xc(%ebp),%eax
 367:	89 44 24 04          	mov    %eax,0x4(%esp)
 36b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 36e:	89 04 24             	mov    %eax,(%esp)
 371:	e8 fd 00 00 00       	call   473 <fstat>
 376:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 379:	8b 45 f4             	mov    -0xc(%ebp),%eax
 37c:	89 04 24             	mov    %eax,(%esp)
 37f:	e8 bf 00 00 00       	call   443 <close>
  return r;
 384:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 387:	c9                   	leave  
 388:	c3                   	ret    

00000389 <atoi>:

int
atoi(const char *s)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 38f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 396:	eb 25                	jmp    3bd <atoi+0x34>
    n = n*10 + *s++ - '0';
 398:	8b 55 fc             	mov    -0x4(%ebp),%edx
 39b:	89 d0                	mov    %edx,%eax
 39d:	c1 e0 02             	shl    $0x2,%eax
 3a0:	01 d0                	add    %edx,%eax
 3a2:	01 c0                	add    %eax,%eax
 3a4:	89 c1                	mov    %eax,%ecx
 3a6:	8b 45 08             	mov    0x8(%ebp),%eax
 3a9:	8d 50 01             	lea    0x1(%eax),%edx
 3ac:	89 55 08             	mov    %edx,0x8(%ebp)
 3af:	0f b6 00             	movzbl (%eax),%eax
 3b2:	0f be c0             	movsbl %al,%eax
 3b5:	01 c8                	add    %ecx,%eax
 3b7:	83 e8 30             	sub    $0x30,%eax
 3ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	3c 2f                	cmp    $0x2f,%al
 3c5:	7e 0a                	jle    3d1 <atoi+0x48>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 00             	movzbl (%eax),%eax
 3cd:	3c 39                	cmp    $0x39,%al
 3cf:	7e c7                	jle    398 <atoi+0xf>
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
 3df:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3e2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3e8:	eb 17                	jmp    401 <memmove+0x2b>
    *dst++ = *src++;
 3ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ed:	8d 50 01             	lea    0x1(%eax),%edx
 3f0:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3f3:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3f6:	8d 4a 01             	lea    0x1(%edx),%ecx
 3f9:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3fc:	0f b6 12             	movzbl (%edx),%edx
 3ff:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 401:	8b 45 10             	mov    0x10(%ebp),%eax
 404:	8d 50 ff             	lea    -0x1(%eax),%edx
 407:	89 55 10             	mov    %edx,0x10(%ebp)
 40a:	85 c0                	test   %eax,%eax
 40c:	7f dc                	jg     3ea <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 40e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 411:	c9                   	leave  
 412:	c3                   	ret    

00000413 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 413:	b8 01 00 00 00       	mov    $0x1,%eax
 418:	cd 40                	int    $0x40
 41a:	c3                   	ret    

0000041b <exit>:
SYSCALL(exit)
 41b:	b8 02 00 00 00       	mov    $0x2,%eax
 420:	cd 40                	int    $0x40
 422:	c3                   	ret    

00000423 <wait>:
SYSCALL(wait)
 423:	b8 03 00 00 00       	mov    $0x3,%eax
 428:	cd 40                	int    $0x40
 42a:	c3                   	ret    

0000042b <pipe>:
SYSCALL(pipe)
 42b:	b8 04 00 00 00       	mov    $0x4,%eax
 430:	cd 40                	int    $0x40
 432:	c3                   	ret    

00000433 <read>:
SYSCALL(read)
 433:	b8 05 00 00 00       	mov    $0x5,%eax
 438:	cd 40                	int    $0x40
 43a:	c3                   	ret    

0000043b <write>:
SYSCALL(write)
 43b:	b8 10 00 00 00       	mov    $0x10,%eax
 440:	cd 40                	int    $0x40
 442:	c3                   	ret    

00000443 <close>:
SYSCALL(close)
 443:	b8 15 00 00 00       	mov    $0x15,%eax
 448:	cd 40                	int    $0x40
 44a:	c3                   	ret    

0000044b <kill>:
SYSCALL(kill)
 44b:	b8 06 00 00 00       	mov    $0x6,%eax
 450:	cd 40                	int    $0x40
 452:	c3                   	ret    

00000453 <exec>:
SYSCALL(exec)
 453:	b8 07 00 00 00       	mov    $0x7,%eax
 458:	cd 40                	int    $0x40
 45a:	c3                   	ret    

0000045b <open>:
SYSCALL(open)
 45b:	b8 0f 00 00 00       	mov    $0xf,%eax
 460:	cd 40                	int    $0x40
 462:	c3                   	ret    

00000463 <mknod>:
SYSCALL(mknod)
 463:	b8 11 00 00 00       	mov    $0x11,%eax
 468:	cd 40                	int    $0x40
 46a:	c3                   	ret    

0000046b <unlink>:
SYSCALL(unlink)
 46b:	b8 12 00 00 00       	mov    $0x12,%eax
 470:	cd 40                	int    $0x40
 472:	c3                   	ret    

00000473 <fstat>:
SYSCALL(fstat)
 473:	b8 08 00 00 00       	mov    $0x8,%eax
 478:	cd 40                	int    $0x40
 47a:	c3                   	ret    

0000047b <link>:
SYSCALL(link)
 47b:	b8 13 00 00 00       	mov    $0x13,%eax
 480:	cd 40                	int    $0x40
 482:	c3                   	ret    

00000483 <mkdir>:
SYSCALL(mkdir)
 483:	b8 14 00 00 00       	mov    $0x14,%eax
 488:	cd 40                	int    $0x40
 48a:	c3                   	ret    

0000048b <chdir>:
SYSCALL(chdir)
 48b:	b8 09 00 00 00       	mov    $0x9,%eax
 490:	cd 40                	int    $0x40
 492:	c3                   	ret    

00000493 <dup>:
SYSCALL(dup)
 493:	b8 0a 00 00 00       	mov    $0xa,%eax
 498:	cd 40                	int    $0x40
 49a:	c3                   	ret    

0000049b <getpid>:
SYSCALL(getpid)
 49b:	b8 0b 00 00 00       	mov    $0xb,%eax
 4a0:	cd 40                	int    $0x40
 4a2:	c3                   	ret    

000004a3 <sbrk>:
SYSCALL(sbrk)
 4a3:	b8 0c 00 00 00       	mov    $0xc,%eax
 4a8:	cd 40                	int    $0x40
 4aa:	c3                   	ret    

000004ab <sleep>:
SYSCALL(sleep)
 4ab:	b8 0d 00 00 00       	mov    $0xd,%eax
 4b0:	cd 40                	int    $0x40
 4b2:	c3                   	ret    

000004b3 <uptime>:
SYSCALL(uptime)
 4b3:	b8 0e 00 00 00       	mov    $0xe,%eax
 4b8:	cd 40                	int    $0x40
 4ba:	c3                   	ret    

000004bb <clone>:
SYSCALL(clone)
 4bb:	b8 16 00 00 00       	mov    $0x16,%eax
 4c0:	cd 40                	int    $0x40
 4c2:	c3                   	ret    

000004c3 <texit>:
SYSCALL(texit)
 4c3:	b8 17 00 00 00       	mov    $0x17,%eax
 4c8:	cd 40                	int    $0x40
 4ca:	c3                   	ret    

000004cb <tsleep>:
SYSCALL(tsleep)
 4cb:	b8 18 00 00 00       	mov    $0x18,%eax
 4d0:	cd 40                	int    $0x40
 4d2:	c3                   	ret    

000004d3 <twakeup>:
SYSCALL(twakeup)
 4d3:	b8 19 00 00 00       	mov    $0x19,%eax
 4d8:	cd 40                	int    $0x40
 4da:	c3                   	ret    

000004db <test>:
SYSCALL(test)
 4db:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4e0:	cd 40                	int    $0x40
 4e2:	c3                   	ret    

000004e3 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4e3:	55                   	push   %ebp
 4e4:	89 e5                	mov    %esp,%ebp
 4e6:	83 ec 18             	sub    $0x18,%esp
 4e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ec:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4ef:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4f6:	00 
 4f7:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fe:	8b 45 08             	mov    0x8(%ebp),%eax
 501:	89 04 24             	mov    %eax,(%esp)
 504:	e8 32 ff ff ff       	call   43b <write>
}
 509:	c9                   	leave  
 50a:	c3                   	ret    

0000050b <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 50b:	55                   	push   %ebp
 50c:	89 e5                	mov    %esp,%ebp
 50e:	56                   	push   %esi
 50f:	53                   	push   %ebx
 510:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 513:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 51a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 51e:	74 17                	je     537 <printint+0x2c>
 520:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 524:	79 11                	jns    537 <printint+0x2c>
    neg = 1;
 526:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 52d:	8b 45 0c             	mov    0xc(%ebp),%eax
 530:	f7 d8                	neg    %eax
 532:	89 45 ec             	mov    %eax,-0x14(%ebp)
 535:	eb 06                	jmp    53d <printint+0x32>
  } else {
    x = xx;
 537:	8b 45 0c             	mov    0xc(%ebp),%eax
 53a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 53d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 544:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 547:	8d 41 01             	lea    0x1(%ecx),%eax
 54a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 54d:	8b 5d 10             	mov    0x10(%ebp),%ebx
 550:	8b 45 ec             	mov    -0x14(%ebp),%eax
 553:	ba 00 00 00 00       	mov    $0x0,%edx
 558:	f7 f3                	div    %ebx
 55a:	89 d0                	mov    %edx,%eax
 55c:	0f b6 80 8c 11 00 00 	movzbl 0x118c(%eax),%eax
 563:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 567:	8b 75 10             	mov    0x10(%ebp),%esi
 56a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 56d:	ba 00 00 00 00       	mov    $0x0,%edx
 572:	f7 f6                	div    %esi
 574:	89 45 ec             	mov    %eax,-0x14(%ebp)
 577:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 57b:	75 c7                	jne    544 <printint+0x39>
  if(neg)
 57d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 581:	74 10                	je     593 <printint+0x88>
    buf[i++] = '-';
 583:	8b 45 f4             	mov    -0xc(%ebp),%eax
 586:	8d 50 01             	lea    0x1(%eax),%edx
 589:	89 55 f4             	mov    %edx,-0xc(%ebp)
 58c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 591:	eb 1f                	jmp    5b2 <printint+0xa7>
 593:	eb 1d                	jmp    5b2 <printint+0xa7>
    putc(fd, buf[i]);
 595:	8d 55 dc             	lea    -0x24(%ebp),%edx
 598:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59b:	01 d0                	add    %edx,%eax
 59d:	0f b6 00             	movzbl (%eax),%eax
 5a0:	0f be c0             	movsbl %al,%eax
 5a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a7:	8b 45 08             	mov    0x8(%ebp),%eax
 5aa:	89 04 24             	mov    %eax,(%esp)
 5ad:	e8 31 ff ff ff       	call   4e3 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5b2:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5b6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5ba:	79 d9                	jns    595 <printint+0x8a>
    putc(fd, buf[i]);
}
 5bc:	83 c4 30             	add    $0x30,%esp
 5bf:	5b                   	pop    %ebx
 5c0:	5e                   	pop    %esi
 5c1:	5d                   	pop    %ebp
 5c2:	c3                   	ret    

000005c3 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5c3:	55                   	push   %ebp
 5c4:	89 e5                	mov    %esp,%ebp
 5c6:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5c9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5d0:	8d 45 0c             	lea    0xc(%ebp),%eax
 5d3:	83 c0 04             	add    $0x4,%eax
 5d6:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5d9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5e0:	e9 7c 01 00 00       	jmp    761 <printf+0x19e>
    c = fmt[i] & 0xff;
 5e5:	8b 55 0c             	mov    0xc(%ebp),%edx
 5e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5eb:	01 d0                	add    %edx,%eax
 5ed:	0f b6 00             	movzbl (%eax),%eax
 5f0:	0f be c0             	movsbl %al,%eax
 5f3:	25 ff 00 00 00       	and    $0xff,%eax
 5f8:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5fb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5ff:	75 2c                	jne    62d <printf+0x6a>
      if(c == '%'){
 601:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 605:	75 0c                	jne    613 <printf+0x50>
        state = '%';
 607:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 60e:	e9 4a 01 00 00       	jmp    75d <printf+0x19a>
      } else {
        putc(fd, c);
 613:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 616:	0f be c0             	movsbl %al,%eax
 619:	89 44 24 04          	mov    %eax,0x4(%esp)
 61d:	8b 45 08             	mov    0x8(%ebp),%eax
 620:	89 04 24             	mov    %eax,(%esp)
 623:	e8 bb fe ff ff       	call   4e3 <putc>
 628:	e9 30 01 00 00       	jmp    75d <printf+0x19a>
      }
    } else if(state == '%'){
 62d:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 631:	0f 85 26 01 00 00    	jne    75d <printf+0x19a>
      if(c == 'd'){
 637:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 63b:	75 2d                	jne    66a <printf+0xa7>
        printint(fd, *ap, 10, 1);
 63d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 640:	8b 00                	mov    (%eax),%eax
 642:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 649:	00 
 64a:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 651:	00 
 652:	89 44 24 04          	mov    %eax,0x4(%esp)
 656:	8b 45 08             	mov    0x8(%ebp),%eax
 659:	89 04 24             	mov    %eax,(%esp)
 65c:	e8 aa fe ff ff       	call   50b <printint>
        ap++;
 661:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 665:	e9 ec 00 00 00       	jmp    756 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 66a:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 66e:	74 06                	je     676 <printf+0xb3>
 670:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 674:	75 2d                	jne    6a3 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 676:	8b 45 e8             	mov    -0x18(%ebp),%eax
 679:	8b 00                	mov    (%eax),%eax
 67b:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 682:	00 
 683:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 68a:	00 
 68b:	89 44 24 04          	mov    %eax,0x4(%esp)
 68f:	8b 45 08             	mov    0x8(%ebp),%eax
 692:	89 04 24             	mov    %eax,(%esp)
 695:	e8 71 fe ff ff       	call   50b <printint>
        ap++;
 69a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 69e:	e9 b3 00 00 00       	jmp    756 <printf+0x193>
      } else if(c == 's'){
 6a3:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6a7:	75 45                	jne    6ee <printf+0x12b>
        s = (char*)*ap;
 6a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6ac:	8b 00                	mov    (%eax),%eax
 6ae:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6b1:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6b9:	75 09                	jne    6c4 <printf+0x101>
          s = "(null)";
 6bb:	c7 45 f4 55 0d 00 00 	movl   $0xd55,-0xc(%ebp)
        while(*s != 0){
 6c2:	eb 1e                	jmp    6e2 <printf+0x11f>
 6c4:	eb 1c                	jmp    6e2 <printf+0x11f>
          putc(fd, *s);
 6c6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c9:	0f b6 00             	movzbl (%eax),%eax
 6cc:	0f be c0             	movsbl %al,%eax
 6cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d3:	8b 45 08             	mov    0x8(%ebp),%eax
 6d6:	89 04 24             	mov    %eax,(%esp)
 6d9:	e8 05 fe ff ff       	call   4e3 <putc>
          s++;
 6de:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e5:	0f b6 00             	movzbl (%eax),%eax
 6e8:	84 c0                	test   %al,%al
 6ea:	75 da                	jne    6c6 <printf+0x103>
 6ec:	eb 68                	jmp    756 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6ee:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6f2:	75 1d                	jne    711 <printf+0x14e>
        putc(fd, *ap);
 6f4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6f7:	8b 00                	mov    (%eax),%eax
 6f9:	0f be c0             	movsbl %al,%eax
 6fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 700:	8b 45 08             	mov    0x8(%ebp),%eax
 703:	89 04 24             	mov    %eax,(%esp)
 706:	e8 d8 fd ff ff       	call   4e3 <putc>
        ap++;
 70b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 70f:	eb 45                	jmp    756 <printf+0x193>
      } else if(c == '%'){
 711:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 715:	75 17                	jne    72e <printf+0x16b>
        putc(fd, c);
 717:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 71a:	0f be c0             	movsbl %al,%eax
 71d:	89 44 24 04          	mov    %eax,0x4(%esp)
 721:	8b 45 08             	mov    0x8(%ebp),%eax
 724:	89 04 24             	mov    %eax,(%esp)
 727:	e8 b7 fd ff ff       	call   4e3 <putc>
 72c:	eb 28                	jmp    756 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 72e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 735:	00 
 736:	8b 45 08             	mov    0x8(%ebp),%eax
 739:	89 04 24             	mov    %eax,(%esp)
 73c:	e8 a2 fd ff ff       	call   4e3 <putc>
        putc(fd, c);
 741:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 744:	0f be c0             	movsbl %al,%eax
 747:	89 44 24 04          	mov    %eax,0x4(%esp)
 74b:	8b 45 08             	mov    0x8(%ebp),%eax
 74e:	89 04 24             	mov    %eax,(%esp)
 751:	e8 8d fd ff ff       	call   4e3 <putc>
      }
      state = 0;
 756:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 75d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 761:	8b 55 0c             	mov    0xc(%ebp),%edx
 764:	8b 45 f0             	mov    -0x10(%ebp),%eax
 767:	01 d0                	add    %edx,%eax
 769:	0f b6 00             	movzbl (%eax),%eax
 76c:	84 c0                	test   %al,%al
 76e:	0f 85 71 fe ff ff    	jne    5e5 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 774:	c9                   	leave  
 775:	c3                   	ret    

00000776 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 776:	55                   	push   %ebp
 777:	89 e5                	mov    %esp,%ebp
 779:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 77c:	8b 45 08             	mov    0x8(%ebp),%eax
 77f:	83 e8 08             	sub    $0x8,%eax
 782:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 785:	a1 ac 11 00 00       	mov    0x11ac,%eax
 78a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 78d:	eb 24                	jmp    7b3 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 78f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 792:	8b 00                	mov    (%eax),%eax
 794:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 797:	77 12                	ja     7ab <free+0x35>
 799:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 79f:	77 24                	ja     7c5 <free+0x4f>
 7a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a4:	8b 00                	mov    (%eax),%eax
 7a6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7a9:	77 1a                	ja     7c5 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ae:	8b 00                	mov    (%eax),%eax
 7b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b9:	76 d4                	jbe    78f <free+0x19>
 7bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7be:	8b 00                	mov    (%eax),%eax
 7c0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7c3:	76 ca                	jbe    78f <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c8:	8b 40 04             	mov    0x4(%eax),%eax
 7cb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7d2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d5:	01 c2                	add    %eax,%edx
 7d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7da:	8b 00                	mov    (%eax),%eax
 7dc:	39 c2                	cmp    %eax,%edx
 7de:	75 24                	jne    804 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e3:	8b 50 04             	mov    0x4(%eax),%edx
 7e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e9:	8b 00                	mov    (%eax),%eax
 7eb:	8b 40 04             	mov    0x4(%eax),%eax
 7ee:	01 c2                	add    %eax,%edx
 7f0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f3:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f9:	8b 00                	mov    (%eax),%eax
 7fb:	8b 10                	mov    (%eax),%edx
 7fd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 800:	89 10                	mov    %edx,(%eax)
 802:	eb 0a                	jmp    80e <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 804:	8b 45 fc             	mov    -0x4(%ebp),%eax
 807:	8b 10                	mov    (%eax),%edx
 809:	8b 45 f8             	mov    -0x8(%ebp),%eax
 80c:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 80e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 811:	8b 40 04             	mov    0x4(%eax),%eax
 814:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 81b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81e:	01 d0                	add    %edx,%eax
 820:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 823:	75 20                	jne    845 <free+0xcf>
    p->s.size += bp->s.size;
 825:	8b 45 fc             	mov    -0x4(%ebp),%eax
 828:	8b 50 04             	mov    0x4(%eax),%edx
 82b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82e:	8b 40 04             	mov    0x4(%eax),%eax
 831:	01 c2                	add    %eax,%edx
 833:	8b 45 fc             	mov    -0x4(%ebp),%eax
 836:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 839:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83c:	8b 10                	mov    (%eax),%edx
 83e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 841:	89 10                	mov    %edx,(%eax)
 843:	eb 08                	jmp    84d <free+0xd7>
  } else
    p->s.ptr = bp;
 845:	8b 45 fc             	mov    -0x4(%ebp),%eax
 848:	8b 55 f8             	mov    -0x8(%ebp),%edx
 84b:	89 10                	mov    %edx,(%eax)
  freep = p;
 84d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 850:	a3 ac 11 00 00       	mov    %eax,0x11ac
}
 855:	c9                   	leave  
 856:	c3                   	ret    

00000857 <morecore>:

static Header*
morecore(uint nu)
{
 857:	55                   	push   %ebp
 858:	89 e5                	mov    %esp,%ebp
 85a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 85d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 864:	77 07                	ja     86d <morecore+0x16>
    nu = 4096;
 866:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 86d:	8b 45 08             	mov    0x8(%ebp),%eax
 870:	c1 e0 03             	shl    $0x3,%eax
 873:	89 04 24             	mov    %eax,(%esp)
 876:	e8 28 fc ff ff       	call   4a3 <sbrk>
 87b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 87e:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 882:	75 07                	jne    88b <morecore+0x34>
    return 0;
 884:	b8 00 00 00 00       	mov    $0x0,%eax
 889:	eb 22                	jmp    8ad <morecore+0x56>
  hp = (Header*)p;
 88b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 891:	8b 45 f0             	mov    -0x10(%ebp),%eax
 894:	8b 55 08             	mov    0x8(%ebp),%edx
 897:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 89a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89d:	83 c0 08             	add    $0x8,%eax
 8a0:	89 04 24             	mov    %eax,(%esp)
 8a3:	e8 ce fe ff ff       	call   776 <free>
  return freep;
 8a8:	a1 ac 11 00 00       	mov    0x11ac,%eax
}
 8ad:	c9                   	leave  
 8ae:	c3                   	ret    

000008af <malloc>:

void*
malloc(uint nbytes)
{
 8af:	55                   	push   %ebp
 8b0:	89 e5                	mov    %esp,%ebp
 8b2:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b5:	8b 45 08             	mov    0x8(%ebp),%eax
 8b8:	83 c0 07             	add    $0x7,%eax
 8bb:	c1 e8 03             	shr    $0x3,%eax
 8be:	83 c0 01             	add    $0x1,%eax
 8c1:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8c4:	a1 ac 11 00 00       	mov    0x11ac,%eax
 8c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8cc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8d0:	75 23                	jne    8f5 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8d2:	c7 45 f0 a4 11 00 00 	movl   $0x11a4,-0x10(%ebp)
 8d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dc:	a3 ac 11 00 00       	mov    %eax,0x11ac
 8e1:	a1 ac 11 00 00       	mov    0x11ac,%eax
 8e6:	a3 a4 11 00 00       	mov    %eax,0x11a4
    base.s.size = 0;
 8eb:	c7 05 a8 11 00 00 00 	movl   $0x0,0x11a8
 8f2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f8:	8b 00                	mov    (%eax),%eax
 8fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 900:	8b 40 04             	mov    0x4(%eax),%eax
 903:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 906:	72 4d                	jb     955 <malloc+0xa6>
      if(p->s.size == nunits)
 908:	8b 45 f4             	mov    -0xc(%ebp),%eax
 90b:	8b 40 04             	mov    0x4(%eax),%eax
 90e:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 911:	75 0c                	jne    91f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 913:	8b 45 f4             	mov    -0xc(%ebp),%eax
 916:	8b 10                	mov    (%eax),%edx
 918:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91b:	89 10                	mov    %edx,(%eax)
 91d:	eb 26                	jmp    945 <malloc+0x96>
      else {
        p->s.size -= nunits;
 91f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 922:	8b 40 04             	mov    0x4(%eax),%eax
 925:	2b 45 ec             	sub    -0x14(%ebp),%eax
 928:	89 c2                	mov    %eax,%edx
 92a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 92d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 930:	8b 45 f4             	mov    -0xc(%ebp),%eax
 933:	8b 40 04             	mov    0x4(%eax),%eax
 936:	c1 e0 03             	shl    $0x3,%eax
 939:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 93c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93f:	8b 55 ec             	mov    -0x14(%ebp),%edx
 942:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 945:	8b 45 f0             	mov    -0x10(%ebp),%eax
 948:	a3 ac 11 00 00       	mov    %eax,0x11ac
      return (void*)(p + 1);
 94d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 950:	83 c0 08             	add    $0x8,%eax
 953:	eb 38                	jmp    98d <malloc+0xde>
    }
    if(p == freep)
 955:	a1 ac 11 00 00       	mov    0x11ac,%eax
 95a:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 95d:	75 1b                	jne    97a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 95f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 962:	89 04 24             	mov    %eax,(%esp)
 965:	e8 ed fe ff ff       	call   857 <morecore>
 96a:	89 45 f4             	mov    %eax,-0xc(%ebp)
 96d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 971:	75 07                	jne    97a <malloc+0xcb>
        return 0;
 973:	b8 00 00 00 00       	mov    $0x0,%eax
 978:	eb 13                	jmp    98d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 97a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 980:	8b 45 f4             	mov    -0xc(%ebp),%eax
 983:	8b 00                	mov    (%eax),%eax
 985:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 988:	e9 70 ff ff ff       	jmp    8fd <malloc+0x4e>
}
 98d:	c9                   	leave  
 98e:	c3                   	ret    

0000098f <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 98f:	55                   	push   %ebp
 990:	89 e5                	mov    %esp,%ebp
 992:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 995:	8b 55 08             	mov    0x8(%ebp),%edx
 998:	8b 45 0c             	mov    0xc(%ebp),%eax
 99b:	8b 4d 08             	mov    0x8(%ebp),%ecx
 99e:	f0 87 02             	lock xchg %eax,(%edx)
 9a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 9a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 9a7:	c9                   	leave  
 9a8:	c3                   	ret    

000009a9 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 9a9:	55                   	push   %ebp
 9aa:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 9ac:	8b 45 08             	mov    0x8(%ebp),%eax
 9af:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 9b5:	5d                   	pop    %ebp
 9b6:	c3                   	ret    

000009b7 <lock_acquire>:
void lock_acquire(lock_t *lock){
 9b7:	55                   	push   %ebp
 9b8:	89 e5                	mov    %esp,%ebp
 9ba:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 9bd:	90                   	nop
 9be:	8b 45 08             	mov    0x8(%ebp),%eax
 9c1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 9c8:	00 
 9c9:	89 04 24             	mov    %eax,(%esp)
 9cc:	e8 be ff ff ff       	call   98f <xchg>
 9d1:	85 c0                	test   %eax,%eax
 9d3:	75 e9                	jne    9be <lock_acquire+0x7>
}
 9d5:	c9                   	leave  
 9d6:	c3                   	ret    

000009d7 <lock_release>:
void lock_release(lock_t *lock){
 9d7:	55                   	push   %ebp
 9d8:	89 e5                	mov    %esp,%ebp
 9da:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 9dd:	8b 45 08             	mov    0x8(%ebp),%eax
 9e0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 9e7:	00 
 9e8:	89 04 24             	mov    %eax,(%esp)
 9eb:	e8 9f ff ff ff       	call   98f <xchg>
}
 9f0:	c9                   	leave  
 9f1:	c3                   	ret    

000009f2 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 9f2:	55                   	push   %ebp
 9f3:	89 e5                	mov    %esp,%ebp
 9f5:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 9f8:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 9ff:	e8 ab fe ff ff       	call   8af <malloc>
 a04:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 a07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 a0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a10:	25 ff 0f 00 00       	and    $0xfff,%eax
 a15:	85 c0                	test   %eax,%eax
 a17:	74 14                	je     a2d <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1c:	25 ff 0f 00 00       	and    $0xfff,%eax
 a21:	89 c2                	mov    %eax,%edx
 a23:	b8 00 10 00 00       	mov    $0x1000,%eax
 a28:	29 d0                	sub    %edx,%eax
 a2a:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 a2d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a31:	75 1b                	jne    a4e <thread_create+0x5c>

        printf(1,"malloc fail \n");
 a33:	c7 44 24 04 5c 0d 00 	movl   $0xd5c,0x4(%esp)
 a3a:	00 
 a3b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a42:	e8 7c fb ff ff       	call   5c3 <printf>
        return 0;
 a47:	b8 00 00 00 00       	mov    $0x0,%eax
 a4c:	eb 6f                	jmp    abd <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 a4e:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 a51:	8b 55 08             	mov    0x8(%ebp),%edx
 a54:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a57:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 a5b:	89 54 24 08          	mov    %edx,0x8(%esp)
 a5f:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 a66:	00 
 a67:	89 04 24             	mov    %eax,(%esp)
 a6a:	e8 4c fa ff ff       	call   4bb <clone>
 a6f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 a72:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a76:	79 1b                	jns    a93 <thread_create+0xa1>
        printf(1,"clone fails\n");
 a78:	c7 44 24 04 6a 0d 00 	movl   $0xd6a,0x4(%esp)
 a7f:	00 
 a80:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a87:	e8 37 fb ff ff       	call   5c3 <printf>
        return 0;
 a8c:	b8 00 00 00 00       	mov    $0x0,%eax
 a91:	eb 2a                	jmp    abd <thread_create+0xcb>
    }
    if(tid > 0){
 a93:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a97:	7e 05                	jle    a9e <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 a99:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a9c:	eb 1f                	jmp    abd <thread_create+0xcb>
    }
    if(tid == 0){
 a9e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 aa2:	75 14                	jne    ab8 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 aa4:	c7 44 24 04 77 0d 00 	movl   $0xd77,0x4(%esp)
 aab:	00 
 aac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ab3:	e8 0b fb ff ff       	call   5c3 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 ab8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 abd:	c9                   	leave  
 abe:	c3                   	ret    

00000abf <random>:

unsigned long rands = 1;
// generate 0 -> max random number exclude max.
int random(int max){
 abf:	55                   	push   %ebp
 ac0:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
 ac2:	a1 a0 11 00 00       	mov    0x11a0,%eax
 ac7:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
 acd:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
 ad2:	a3 a0 11 00 00       	mov    %eax,0x11a0
    return (int)(rands % max);
 ad7:	a1 a0 11 00 00       	mov    0x11a0,%eax
 adc:	8b 4d 08             	mov    0x8(%ebp),%ecx
 adf:	ba 00 00 00 00       	mov    $0x0,%edx
 ae4:	f7 f1                	div    %ecx
 ae6:	89 d0                	mov    %edx,%eax
 ae8:	5d                   	pop    %ebp
 ae9:	c3                   	ret    

00000aea <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 aea:	55                   	push   %ebp
 aeb:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 aed:	8b 45 08             	mov    0x8(%ebp),%eax
 af0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 af6:	8b 45 08             	mov    0x8(%ebp),%eax
 af9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 b00:	8b 45 08             	mov    0x8(%ebp),%eax
 b03:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 b0a:	5d                   	pop    %ebp
 b0b:	c3                   	ret    

00000b0c <add_q>:

void add_q(struct queue *q, int v){
 b0c:	55                   	push   %ebp
 b0d:	89 e5                	mov    %esp,%ebp
 b0f:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 b12:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 b19:	e8 91 fd ff ff       	call   8af <malloc>
 b1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 b21:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b24:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 b2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b2e:	8b 55 0c             	mov    0xc(%ebp),%edx
 b31:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 b33:	8b 45 08             	mov    0x8(%ebp),%eax
 b36:	8b 40 04             	mov    0x4(%eax),%eax
 b39:	85 c0                	test   %eax,%eax
 b3b:	75 0b                	jne    b48 <add_q+0x3c>
        q->head = n;
 b3d:	8b 45 08             	mov    0x8(%ebp),%eax
 b40:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b43:	89 50 04             	mov    %edx,0x4(%eax)
 b46:	eb 0c                	jmp    b54 <add_q+0x48>
    }else{
        q->tail->next = n;
 b48:	8b 45 08             	mov    0x8(%ebp),%eax
 b4b:	8b 40 08             	mov    0x8(%eax),%eax
 b4e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b51:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 b54:	8b 45 08             	mov    0x8(%ebp),%eax
 b57:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b5a:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 b5d:	8b 45 08             	mov    0x8(%ebp),%eax
 b60:	8b 00                	mov    (%eax),%eax
 b62:	8d 50 01             	lea    0x1(%eax),%edx
 b65:	8b 45 08             	mov    0x8(%ebp),%eax
 b68:	89 10                	mov    %edx,(%eax)
}
 b6a:	c9                   	leave  
 b6b:	c3                   	ret    

00000b6c <empty_q>:

int empty_q(struct queue *q){
 b6c:	55                   	push   %ebp
 b6d:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 b6f:	8b 45 08             	mov    0x8(%ebp),%eax
 b72:	8b 00                	mov    (%eax),%eax
 b74:	85 c0                	test   %eax,%eax
 b76:	75 07                	jne    b7f <empty_q+0x13>
        return 1;
 b78:	b8 01 00 00 00       	mov    $0x1,%eax
 b7d:	eb 05                	jmp    b84 <empty_q+0x18>
    else
        return 0;
 b7f:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 b84:	5d                   	pop    %ebp
 b85:	c3                   	ret    

00000b86 <pop_q>:
int pop_q(struct queue *q){
 b86:	55                   	push   %ebp
 b87:	89 e5                	mov    %esp,%ebp
 b89:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 b8c:	8b 45 08             	mov    0x8(%ebp),%eax
 b8f:	89 04 24             	mov    %eax,(%esp)
 b92:	e8 d5 ff ff ff       	call   b6c <empty_q>
 b97:	85 c0                	test   %eax,%eax
 b99:	75 5d                	jne    bf8 <pop_q+0x72>
       val = q->head->value; 
 b9b:	8b 45 08             	mov    0x8(%ebp),%eax
 b9e:	8b 40 04             	mov    0x4(%eax),%eax
 ba1:	8b 00                	mov    (%eax),%eax
 ba3:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 ba6:	8b 45 08             	mov    0x8(%ebp),%eax
 ba9:	8b 40 04             	mov    0x4(%eax),%eax
 bac:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 baf:	8b 45 08             	mov    0x8(%ebp),%eax
 bb2:	8b 40 04             	mov    0x4(%eax),%eax
 bb5:	8b 50 04             	mov    0x4(%eax),%edx
 bb8:	8b 45 08             	mov    0x8(%ebp),%eax
 bbb:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 bbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bc1:	89 04 24             	mov    %eax,(%esp)
 bc4:	e8 ad fb ff ff       	call   776 <free>
       q->size--;
 bc9:	8b 45 08             	mov    0x8(%ebp),%eax
 bcc:	8b 00                	mov    (%eax),%eax
 bce:	8d 50 ff             	lea    -0x1(%eax),%edx
 bd1:	8b 45 08             	mov    0x8(%ebp),%eax
 bd4:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 bd6:	8b 45 08             	mov    0x8(%ebp),%eax
 bd9:	8b 00                	mov    (%eax),%eax
 bdb:	85 c0                	test   %eax,%eax
 bdd:	75 14                	jne    bf3 <pop_q+0x6d>
            q->head = 0;
 bdf:	8b 45 08             	mov    0x8(%ebp),%eax
 be2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 be9:	8b 45 08             	mov    0x8(%ebp),%eax
 bec:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 bf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf6:	eb 05                	jmp    bfd <pop_q+0x77>
    }
    return -1;
 bf8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 bfd:	c9                   	leave  
 bfe:	c3                   	ret    

00000bff <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 bff:	55                   	push   %ebp
 c00:	89 e5                	mov    %esp,%ebp
 c02:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 c05:	8b 45 08             	mov    0x8(%ebp),%eax
 c08:	8b 55 0c             	mov    0xc(%ebp),%edx
 c0b:	89 50 08             	mov    %edx,0x8(%eax)
	s->count = size;
 c0e:	8b 45 08             	mov    0x8(%ebp),%eax
 c11:	8b 55 0c             	mov    0xc(%ebp),%edx
 c14:	89 50 04             	mov    %edx,0x4(%eax)
	lock_init(&s->lock);
 c17:	8b 45 08             	mov    0x8(%ebp),%eax
 c1a:	89 04 24             	mov    %eax,(%esp)
 c1d:	e8 87 fd ff ff       	call   9a9 <lock_init>
}
 c22:	c9                   	leave  
 c23:	c3                   	ret    

00000c24 <sem_init_full>:

void 
sem_init_full(struct semaphore *s, int size){
 c24:	55                   	push   %ebp
 c25:	89 e5                	mov    %esp,%ebp
 c27:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 c2a:	8b 45 08             	mov    0x8(%ebp),%eax
 c2d:	8b 55 0c             	mov    0xc(%ebp),%edx
 c30:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 c33:	8b 45 08             	mov    0x8(%ebp),%eax
 c36:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock);
 c3d:	8b 45 08             	mov    0x8(%ebp),%eax
 c40:	89 04 24             	mov    %eax,(%esp)
 c43:	e8 61 fd ff ff       	call   9a9 <lock_init>
}
 c48:	c9                   	leave  
 c49:	c3                   	ret    

00000c4a <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 c4a:	55                   	push   %ebp
 c4b:	89 e5                	mov    %esp,%ebp
 c4d:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 c50:	8b 45 08             	mov    0x8(%ebp),%eax
 c53:	89 04 24             	mov    %eax,(%esp)
 c56:	e8 5c fd ff ff       	call   9b7 <lock_acquire>
	if(s->count  == 0){
 c5b:	8b 45 08             	mov    0x8(%ebp),%eax
 c5e:	8b 40 04             	mov    0x4(%eax),%eax
 c61:	85 c0                	test   %eax,%eax
 c63:	75 2f                	jne    c94 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 c65:	e8 31 f8 ff ff       	call   49b <getpid>
 c6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 c6d:	8b 45 08             	mov    0x8(%ebp),%eax
 c70:	8d 50 0c             	lea    0xc(%eax),%edx
 c73:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c76:	89 44 24 04          	mov    %eax,0x4(%esp)
 c7a:	89 14 24             	mov    %edx,(%esp)
 c7d:	e8 8a fe ff ff       	call   b0c <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 c82:	8b 45 08             	mov    0x8(%ebp),%eax
 c85:	89 04 24             	mov    %eax,(%esp)
 c88:	e8 4a fd ff ff       	call   9d7 <lock_release>
		tsleep(); 
 c8d:	e8 39 f8 ff ff       	call   4cb <tsleep>
 c92:	eb 1a                	jmp    cae <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 c94:	8b 45 08             	mov    0x8(%ebp),%eax
 c97:	8b 40 04             	mov    0x4(%eax),%eax
 c9a:	8d 50 ff             	lea    -0x1(%eax),%edx
 c9d:	8b 45 08             	mov    0x8(%ebp),%eax
 ca0:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 ca3:	8b 45 08             	mov    0x8(%ebp),%eax
 ca6:	89 04 24             	mov    %eax,(%esp)
 ca9:	e8 29 fd ff ff       	call   9d7 <lock_release>
	}
}
 cae:	c9                   	leave  
 caf:	c3                   	ret    

00000cb0 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 cb0:	55                   	push   %ebp
 cb1:	89 e5                	mov    %esp,%ebp
 cb3:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 cb6:	8b 45 08             	mov    0x8(%ebp),%eax
 cb9:	89 04 24             	mov    %eax,(%esp)
 cbc:	e8 f6 fc ff ff       	call   9b7 <lock_acquire>
	if(s->count < s->size){
 cc1:	8b 45 08             	mov    0x8(%ebp),%eax
 cc4:	8b 50 04             	mov    0x4(%eax),%edx
 cc7:	8b 45 08             	mov    0x8(%ebp),%eax
 cca:	8b 40 08             	mov    0x8(%eax),%eax
 ccd:	39 c2                	cmp    %eax,%edx
 ccf:	7d 0f                	jge    ce0 <sem_signal+0x30>
		s->count++;	
 cd1:	8b 45 08             	mov    0x8(%ebp),%eax
 cd4:	8b 40 04             	mov    0x4(%eax),%eax
 cd7:	8d 50 01             	lea    0x1(%eax),%edx
 cda:	8b 45 08             	mov    0x8(%ebp),%eax
 cdd:	89 50 04             	mov    %edx,0x4(%eax)
	}

	int tid;
	tid = pop_q(&s->waiters);
 ce0:	8b 45 08             	mov    0x8(%ebp),%eax
 ce3:	83 c0 0c             	add    $0xc,%eax
 ce6:	89 04 24             	mov    %eax,(%esp)
 ce9:	e8 98 fe ff ff       	call   b86 <pop_q>
 cee:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 cf1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 cf5:	74 2e                	je     d25 <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 cf7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cfa:	89 04 24             	mov    %eax,(%esp)
 cfd:	e8 d1 f7 ff ff       	call   4d3 <twakeup>
		s->count--;
 d02:	8b 45 08             	mov    0x8(%ebp),%eax
 d05:	8b 40 04             	mov    0x4(%eax),%eax
 d08:	8d 50 ff             	lea    -0x1(%eax),%edx
 d0b:	8b 45 08             	mov    0x8(%ebp),%eax
 d0e:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 d11:	8b 45 08             	mov    0x8(%ebp),%eax
 d14:	8b 40 04             	mov    0x4(%eax),%eax
 d17:	85 c0                	test   %eax,%eax
 d19:	79 0a                	jns    d25 <sem_signal+0x75>
 d1b:	8b 45 08             	mov    0x8(%ebp),%eax
 d1e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 d25:	8b 45 08             	mov    0x8(%ebp),%eax
 d28:	89 04 24             	mov    %eax,(%esp)
 d2b:	e8 a7 fc ff ff       	call   9d7 <lock_release>

 d30:	c9                   	leave  
 d31:	c3                   	ret    
