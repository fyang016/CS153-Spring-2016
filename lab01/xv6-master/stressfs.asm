
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
  2c:	c7 44 24 04 7f 09 00 	movl   $0x97f,0x4(%esp)
  33:	00 
  34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3b:	e8 79 05 00 00       	call   5b9 <printf>
  memset(data, 'a', sizeof(data));
  40:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  47:	00 
  48:	c7 44 24 04 61 00 00 	movl   $0x61,0x4(%esp)
  4f:	00 
  50:	8d 44 24 1e          	lea    0x1e(%esp),%eax
  54:	89 04 24             	mov    %eax,(%esp)
  57:	e8 26 02 00 00       	call   282 <memset>

  for(i = 0; i < 4; i++)
  5c:	c7 84 24 2c 02 00 00 	movl   $0x0,0x22c(%esp)
  63:	00 00 00 00 
  67:	eb 11                	jmp    7a <main+0x7a>
    if(fork() > 0)
  69:	e8 b2 03 00 00       	call   420 <fork>
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
  92:	c7 44 24 04 92 09 00 	movl   $0x992,0x4(%esp)
  99:	00 
  9a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a1:	e8 13 05 00 00       	call   5b9 <printf>

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
  d3:	e8 98 03 00 00       	call   470 <open>
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
 106:	e8 45 03 00 00       	call   450 <write>

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
 127:	e8 2c 03 00 00       	call   458 <close>

  printf(1, "read\n");
 12c:	c7 44 24 04 9c 09 00 	movl   $0x99c,0x4(%esp)
 133:	00 
 134:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 13b:	e8 79 04 00 00       	call   5b9 <printf>

  fd = open(path, O_RDONLY);
 140:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 147:	00 
 148:	8d 84 24 1e 02 00 00 	lea    0x21e(%esp),%eax
 14f:	89 04 24             	mov    %eax,(%esp)
 152:	e8 19 03 00 00       	call   470 <open>
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
 185:	e8 be 02 00 00       	call   448 <read>
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
 1a6:	e8 ad 02 00 00       	call   458 <close>

  wait(0);
 1ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1b2:	e8 79 02 00 00       	call   430 <wait>
  
  exit(0);
 1b7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1be:	e8 65 02 00 00       	call   428 <exit>
 1c3:	90                   	nop

000001c4 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	57                   	push   %edi
 1c8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cc:	8b 55 10             	mov    0x10(%ebp),%edx
 1cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d2:	89 cb                	mov    %ecx,%ebx
 1d4:	89 df                	mov    %ebx,%edi
 1d6:	89 d1                	mov    %edx,%ecx
 1d8:	fc                   	cld    
 1d9:	f3 aa                	rep stos %al,%es:(%edi)
 1db:	89 ca                	mov    %ecx,%edx
 1dd:	89 fb                	mov    %edi,%ebx
 1df:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1e2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1e5:	5b                   	pop    %ebx
 1e6:	5f                   	pop    %edi
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    

000001e9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1e9:	55                   	push   %ebp
 1ea:	89 e5                	mov    %esp,%ebp
 1ec:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
 1f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f8:	0f b6 10             	movzbl (%eax),%edx
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	88 10                	mov    %dl,(%eax)
 200:	8b 45 08             	mov    0x8(%ebp),%eax
 203:	0f b6 00             	movzbl (%eax),%eax
 206:	84 c0                	test   %al,%al
 208:	0f 95 c0             	setne  %al
 20b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 20f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 213:	84 c0                	test   %al,%al
 215:	75 de                	jne    1f5 <strcpy+0xc>
    ;
  return os;
 217:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 21a:	c9                   	leave  
 21b:	c3                   	ret    

0000021c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 21c:	55                   	push   %ebp
 21d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 21f:	eb 08                	jmp    229 <strcmp+0xd>
    p++, q++;
 221:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 225:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 229:	8b 45 08             	mov    0x8(%ebp),%eax
 22c:	0f b6 00             	movzbl (%eax),%eax
 22f:	84 c0                	test   %al,%al
 231:	74 10                	je     243 <strcmp+0x27>
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	0f b6 10             	movzbl (%eax),%edx
 239:	8b 45 0c             	mov    0xc(%ebp),%eax
 23c:	0f b6 00             	movzbl (%eax),%eax
 23f:	38 c2                	cmp    %al,%dl
 241:	74 de                	je     221 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 243:	8b 45 08             	mov    0x8(%ebp),%eax
 246:	0f b6 00             	movzbl (%eax),%eax
 249:	0f b6 d0             	movzbl %al,%edx
 24c:	8b 45 0c             	mov    0xc(%ebp),%eax
 24f:	0f b6 00             	movzbl (%eax),%eax
 252:	0f b6 c0             	movzbl %al,%eax
 255:	89 d1                	mov    %edx,%ecx
 257:	29 c1                	sub    %eax,%ecx
 259:	89 c8                	mov    %ecx,%eax
}
 25b:	5d                   	pop    %ebp
 25c:	c3                   	ret    

0000025d <strlen>:

uint
strlen(char *s)
{
 25d:	55                   	push   %ebp
 25e:	89 e5                	mov    %esp,%ebp
 260:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 263:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 26a:	eb 04                	jmp    270 <strlen+0x13>
 26c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 270:	8b 45 fc             	mov    -0x4(%ebp),%eax
 273:	03 45 08             	add    0x8(%ebp),%eax
 276:	0f b6 00             	movzbl (%eax),%eax
 279:	84 c0                	test   %al,%al
 27b:	75 ef                	jne    26c <strlen+0xf>
    ;
  return n;
 27d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 280:	c9                   	leave  
 281:	c3                   	ret    

00000282 <memset>:

void*
memset(void *dst, int c, uint n)
{
 282:	55                   	push   %ebp
 283:	89 e5                	mov    %esp,%ebp
 285:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 288:	8b 45 10             	mov    0x10(%ebp),%eax
 28b:	89 44 24 08          	mov    %eax,0x8(%esp)
 28f:	8b 45 0c             	mov    0xc(%ebp),%eax
 292:	89 44 24 04          	mov    %eax,0x4(%esp)
 296:	8b 45 08             	mov    0x8(%ebp),%eax
 299:	89 04 24             	mov    %eax,(%esp)
 29c:	e8 23 ff ff ff       	call   1c4 <stosb>
  return dst;
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    

000002a6 <strchr>:

char*
strchr(const char *s, char c)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	83 ec 04             	sub    $0x4,%esp
 2ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 2af:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2b2:	eb 14                	jmp    2c8 <strchr+0x22>
    if(*s == c)
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	0f b6 00             	movzbl (%eax),%eax
 2ba:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2bd:	75 05                	jne    2c4 <strchr+0x1e>
      return (char*)s;
 2bf:	8b 45 08             	mov    0x8(%ebp),%eax
 2c2:	eb 13                	jmp    2d7 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2c4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2c8:	8b 45 08             	mov    0x8(%ebp),%eax
 2cb:	0f b6 00             	movzbl (%eax),%eax
 2ce:	84 c0                	test   %al,%al
 2d0:	75 e2                	jne    2b4 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2d2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <gets>:

char*
gets(char *buf, int max)
{
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 2e6:	eb 44                	jmp    32c <gets+0x53>
    cc = read(0, &c, 1);
 2e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2ef:	00 
 2f0:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2fe:	e8 45 01 00 00       	call   448 <read>
 303:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 306:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 30a:	7e 2d                	jle    339 <gets+0x60>
      break;
    buf[i++] = c;
 30c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 30f:	03 45 08             	add    0x8(%ebp),%eax
 312:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 316:	88 10                	mov    %dl,(%eax)
 318:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 31c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 320:	3c 0a                	cmp    $0xa,%al
 322:	74 16                	je     33a <gets+0x61>
 324:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 328:	3c 0d                	cmp    $0xd,%al
 32a:	74 0e                	je     33a <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 32c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 32f:	83 c0 01             	add    $0x1,%eax
 332:	3b 45 0c             	cmp    0xc(%ebp),%eax
 335:	7c b1                	jl     2e8 <gets+0xf>
 337:	eb 01                	jmp    33a <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 339:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 33a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 33d:	03 45 08             	add    0x8(%ebp),%eax
 340:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 343:	8b 45 08             	mov    0x8(%ebp),%eax
}
 346:	c9                   	leave  
 347:	c3                   	ret    

00000348 <stat>:

int
stat(char *n, struct stat *st)
{
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 34e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 355:	00 
 356:	8b 45 08             	mov    0x8(%ebp),%eax
 359:	89 04 24             	mov    %eax,(%esp)
 35c:	e8 0f 01 00 00       	call   470 <open>
 361:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 364:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 368:	79 07                	jns    371 <stat+0x29>
    return -1;
 36a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 36f:	eb 23                	jmp    394 <stat+0x4c>
  r = fstat(fd, st);
 371:	8b 45 0c             	mov    0xc(%ebp),%eax
 374:	89 44 24 04          	mov    %eax,0x4(%esp)
 378:	8b 45 f0             	mov    -0x10(%ebp),%eax
 37b:	89 04 24             	mov    %eax,(%esp)
 37e:	e8 05 01 00 00       	call   488 <fstat>
 383:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 386:	8b 45 f0             	mov    -0x10(%ebp),%eax
 389:	89 04 24             	mov    %eax,(%esp)
 38c:	e8 c7 00 00 00       	call   458 <close>
  return r;
 391:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 394:	c9                   	leave  
 395:	c3                   	ret    

00000396 <atoi>:

int
atoi(const char *s)
{
 396:	55                   	push   %ebp
 397:	89 e5                	mov    %esp,%ebp
 399:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 39c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3a3:	eb 24                	jmp    3c9 <atoi+0x33>
    n = n*10 + *s++ - '0';
 3a5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3a8:	89 d0                	mov    %edx,%eax
 3aa:	c1 e0 02             	shl    $0x2,%eax
 3ad:	01 d0                	add    %edx,%eax
 3af:	01 c0                	add    %eax,%eax
 3b1:	89 c2                	mov    %eax,%edx
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	0f b6 00             	movzbl (%eax),%eax
 3b9:	0f be c0             	movsbl %al,%eax
 3bc:	8d 04 02             	lea    (%edx,%eax,1),%eax
 3bf:	83 e8 30             	sub    $0x30,%eax
 3c2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 3c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3c9:	8b 45 08             	mov    0x8(%ebp),%eax
 3cc:	0f b6 00             	movzbl (%eax),%eax
 3cf:	3c 2f                	cmp    $0x2f,%al
 3d1:	7e 0a                	jle    3dd <atoi+0x47>
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	0f b6 00             	movzbl (%eax),%eax
 3d9:	3c 39                	cmp    $0x39,%al
 3db:	7e c8                	jle    3a5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3e0:	c9                   	leave  
 3e1:	c3                   	ret    

000003e2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3e2:	55                   	push   %ebp
 3e3:	89 e5                	mov    %esp,%ebp
 3e5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3e8:	8b 45 08             	mov    0x8(%ebp),%eax
 3eb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 3ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 3f4:	eb 13                	jmp    409 <memmove+0x27>
    *dst++ = *src++;
 3f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3f9:	0f b6 10             	movzbl (%eax),%edx
 3fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3ff:	88 10                	mov    %dl,(%eax)
 401:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 405:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 409:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 40d:	0f 9f c0             	setg   %al
 410:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 414:	84 c0                	test   %al,%al
 416:	75 de                	jne    3f6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 418:	8b 45 08             	mov    0x8(%ebp),%eax
}
 41b:	c9                   	leave  
 41c:	c3                   	ret    
 41d:	90                   	nop
 41e:	90                   	nop
 41f:	90                   	nop

00000420 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 420:	b8 01 00 00 00       	mov    $0x1,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <exit>:
SYSCALL(exit)
 428:	b8 02 00 00 00       	mov    $0x2,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <wait>:
SYSCALL(wait)
 430:	b8 03 00 00 00       	mov    $0x3,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <waitpid>:
SYSCALL(waitpid)
 438:	b8 17 00 00 00       	mov    $0x17,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <pipe>:
SYSCALL(pipe)
 440:	b8 04 00 00 00       	mov    $0x4,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <read>:
SYSCALL(read)
 448:	b8 05 00 00 00       	mov    $0x5,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <write>:
SYSCALL(write)
 450:	b8 10 00 00 00       	mov    $0x10,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <close>:
SYSCALL(close)
 458:	b8 15 00 00 00       	mov    $0x15,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <kill>:
SYSCALL(kill)
 460:	b8 06 00 00 00       	mov    $0x6,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <exec>:
SYSCALL(exec)
 468:	b8 07 00 00 00       	mov    $0x7,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <open>:
SYSCALL(open)
 470:	b8 0f 00 00 00       	mov    $0xf,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <mknod>:
SYSCALL(mknod)
 478:	b8 11 00 00 00       	mov    $0x11,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <unlink>:
SYSCALL(unlink)
 480:	b8 12 00 00 00       	mov    $0x12,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <fstat>:
SYSCALL(fstat)
 488:	b8 08 00 00 00       	mov    $0x8,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <link>:
SYSCALL(link)
 490:	b8 13 00 00 00       	mov    $0x13,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <mkdir>:
SYSCALL(mkdir)
 498:	b8 14 00 00 00       	mov    $0x14,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <chdir>:
SYSCALL(chdir)
 4a0:	b8 09 00 00 00       	mov    $0x9,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <dup>:
SYSCALL(dup)
 4a8:	b8 0a 00 00 00       	mov    $0xa,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <getpid>:
SYSCALL(getpid)
 4b0:	b8 0b 00 00 00       	mov    $0xb,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <sbrk>:
SYSCALL(sbrk)
 4b8:	b8 0c 00 00 00       	mov    $0xc,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <sleep>:
SYSCALL(sleep)
 4c0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <uptime>:
SYSCALL(uptime)
 4c8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <count>:
SYSCALL(count)
 4d0:	b8 16 00 00 00       	mov    $0x16,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <change_priority>:
SYSCALL(change_priority)
 4d8:	b8 18 00 00 00       	mov    $0x18,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4e0:	55                   	push   %ebp
 4e1:	89 e5                	mov    %esp,%ebp
 4e3:	83 ec 28             	sub    $0x28,%esp
 4e6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4e9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4ec:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4f3:	00 
 4f4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4f7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fb:	8b 45 08             	mov    0x8(%ebp),%eax
 4fe:	89 04 24             	mov    %eax,(%esp)
 501:	e8 4a ff ff ff       	call   450 <write>
}
 506:	c9                   	leave  
 507:	c3                   	ret    

00000508 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 508:	55                   	push   %ebp
 509:	89 e5                	mov    %esp,%ebp
 50b:	53                   	push   %ebx
 50c:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 50f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 516:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 51a:	74 17                	je     533 <printint+0x2b>
 51c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 520:	79 11                	jns    533 <printint+0x2b>
    neg = 1;
 522:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 529:	8b 45 0c             	mov    0xc(%ebp),%eax
 52c:	f7 d8                	neg    %eax
 52e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 531:	eb 06                	jmp    539 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 533:	8b 45 0c             	mov    0xc(%ebp),%eax
 536:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 539:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 540:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 543:	8b 5d 10             	mov    0x10(%ebp),%ebx
 546:	8b 45 f4             	mov    -0xc(%ebp),%eax
 549:	ba 00 00 00 00       	mov    $0x0,%edx
 54e:	f7 f3                	div    %ebx
 550:	89 d0                	mov    %edx,%eax
 552:	0f b6 80 ac 09 00 00 	movzbl 0x9ac(%eax),%eax
 559:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 55d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 561:	8b 45 10             	mov    0x10(%ebp),%eax
 564:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 567:	8b 45 f4             	mov    -0xc(%ebp),%eax
 56a:	ba 00 00 00 00       	mov    $0x0,%edx
 56f:	f7 75 d4             	divl   -0x2c(%ebp)
 572:	89 45 f4             	mov    %eax,-0xc(%ebp)
 575:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 579:	75 c5                	jne    540 <printint+0x38>
  if(neg)
 57b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 57f:	74 28                	je     5a9 <printint+0xa1>
    buf[i++] = '-';
 581:	8b 45 ec             	mov    -0x14(%ebp),%eax
 584:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 589:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 58d:	eb 1a                	jmp    5a9 <printint+0xa1>
    putc(fd, buf[i]);
 58f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 592:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 597:	0f be c0             	movsbl %al,%eax
 59a:	89 44 24 04          	mov    %eax,0x4(%esp)
 59e:	8b 45 08             	mov    0x8(%ebp),%eax
 5a1:	89 04 24             	mov    %eax,(%esp)
 5a4:	e8 37 ff ff ff       	call   4e0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5a9:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 5ad:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5b1:	79 dc                	jns    58f <printint+0x87>
    putc(fd, buf[i]);
}
 5b3:	83 c4 44             	add    $0x44,%esp
 5b6:	5b                   	pop    %ebx
 5b7:	5d                   	pop    %ebp
 5b8:	c3                   	ret    

000005b9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5b9:	55                   	push   %ebp
 5ba:	89 e5                	mov    %esp,%ebp
 5bc:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5bf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5c6:	8d 45 0c             	lea    0xc(%ebp),%eax
 5c9:	83 c0 04             	add    $0x4,%eax
 5cc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 5cf:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 5d6:	e9 7e 01 00 00       	jmp    759 <printf+0x1a0>
    c = fmt[i] & 0xff;
 5db:	8b 55 0c             	mov    0xc(%ebp),%edx
 5de:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5e1:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5e4:	0f b6 00             	movzbl (%eax),%eax
 5e7:	0f be c0             	movsbl %al,%eax
 5ea:	25 ff 00 00 00       	and    $0xff,%eax
 5ef:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 5f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5f6:	75 2c                	jne    624 <printf+0x6b>
      if(c == '%'){
 5f8:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5fc:	75 0c                	jne    60a <printf+0x51>
        state = '%';
 5fe:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 605:	e9 4b 01 00 00       	jmp    755 <printf+0x19c>
      } else {
        putc(fd, c);
 60a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 60d:	0f be c0             	movsbl %al,%eax
 610:	89 44 24 04          	mov    %eax,0x4(%esp)
 614:	8b 45 08             	mov    0x8(%ebp),%eax
 617:	89 04 24             	mov    %eax,(%esp)
 61a:	e8 c1 fe ff ff       	call   4e0 <putc>
 61f:	e9 31 01 00 00       	jmp    755 <printf+0x19c>
      }
    } else if(state == '%'){
 624:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 628:	0f 85 27 01 00 00    	jne    755 <printf+0x19c>
      if(c == 'd'){
 62e:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 632:	75 2d                	jne    661 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 634:	8b 45 f4             	mov    -0xc(%ebp),%eax
 637:	8b 00                	mov    (%eax),%eax
 639:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 640:	00 
 641:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 648:	00 
 649:	89 44 24 04          	mov    %eax,0x4(%esp)
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
 650:	89 04 24             	mov    %eax,(%esp)
 653:	e8 b0 fe ff ff       	call   508 <printint>
        ap++;
 658:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 65c:	e9 ed 00 00 00       	jmp    74e <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 661:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 665:	74 06                	je     66d <printf+0xb4>
 667:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 66b:	75 2d                	jne    69a <printf+0xe1>
        printint(fd, *ap, 16, 0);
 66d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 670:	8b 00                	mov    (%eax),%eax
 672:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 679:	00 
 67a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 681:	00 
 682:	89 44 24 04          	mov    %eax,0x4(%esp)
 686:	8b 45 08             	mov    0x8(%ebp),%eax
 689:	89 04 24             	mov    %eax,(%esp)
 68c:	e8 77 fe ff ff       	call   508 <printint>
        ap++;
 691:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 695:	e9 b4 00 00 00       	jmp    74e <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 69a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 69e:	75 46                	jne    6e6 <printf+0x12d>
        s = (char*)*ap;
 6a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6a3:	8b 00                	mov    (%eax),%eax
 6a5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 6a8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 6ac:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 6b0:	75 27                	jne    6d9 <printf+0x120>
          s = "(null)";
 6b2:	c7 45 e4 a2 09 00 00 	movl   $0x9a2,-0x1c(%ebp)
        while(*s != 0){
 6b9:	eb 1f                	jmp    6da <printf+0x121>
          putc(fd, *s);
 6bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6be:	0f b6 00             	movzbl (%eax),%eax
 6c1:	0f be c0             	movsbl %al,%eax
 6c4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c8:	8b 45 08             	mov    0x8(%ebp),%eax
 6cb:	89 04 24             	mov    %eax,(%esp)
 6ce:	e8 0d fe ff ff       	call   4e0 <putc>
          s++;
 6d3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 6d7:	eb 01                	jmp    6da <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6d9:	90                   	nop
 6da:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6dd:	0f b6 00             	movzbl (%eax),%eax
 6e0:	84 c0                	test   %al,%al
 6e2:	75 d7                	jne    6bb <printf+0x102>
 6e4:	eb 68                	jmp    74e <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6e6:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 6ea:	75 1d                	jne    709 <printf+0x150>
        putc(fd, *ap);
 6ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ef:	8b 00                	mov    (%eax),%eax
 6f1:	0f be c0             	movsbl %al,%eax
 6f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f8:	8b 45 08             	mov    0x8(%ebp),%eax
 6fb:	89 04 24             	mov    %eax,(%esp)
 6fe:	e8 dd fd ff ff       	call   4e0 <putc>
        ap++;
 703:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 707:	eb 45                	jmp    74e <printf+0x195>
      } else if(c == '%'){
 709:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 70d:	75 17                	jne    726 <printf+0x16d>
        putc(fd, c);
 70f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 712:	0f be c0             	movsbl %al,%eax
 715:	89 44 24 04          	mov    %eax,0x4(%esp)
 719:	8b 45 08             	mov    0x8(%ebp),%eax
 71c:	89 04 24             	mov    %eax,(%esp)
 71f:	e8 bc fd ff ff       	call   4e0 <putc>
 724:	eb 28                	jmp    74e <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 726:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 72d:	00 
 72e:	8b 45 08             	mov    0x8(%ebp),%eax
 731:	89 04 24             	mov    %eax,(%esp)
 734:	e8 a7 fd ff ff       	call   4e0 <putc>
        putc(fd, c);
 739:	8b 45 e8             	mov    -0x18(%ebp),%eax
 73c:	0f be c0             	movsbl %al,%eax
 73f:	89 44 24 04          	mov    %eax,0x4(%esp)
 743:	8b 45 08             	mov    0x8(%ebp),%eax
 746:	89 04 24             	mov    %eax,(%esp)
 749:	e8 92 fd ff ff       	call   4e0 <putc>
      }
      state = 0;
 74e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 755:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 759:	8b 55 0c             	mov    0xc(%ebp),%edx
 75c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 75f:	8d 04 02             	lea    (%edx,%eax,1),%eax
 762:	0f b6 00             	movzbl (%eax),%eax
 765:	84 c0                	test   %al,%al
 767:	0f 85 6e fe ff ff    	jne    5db <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 76d:	c9                   	leave  
 76e:	c3                   	ret    
 76f:	90                   	nop

00000770 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 770:	55                   	push   %ebp
 771:	89 e5                	mov    %esp,%ebp
 773:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 776:	8b 45 08             	mov    0x8(%ebp),%eax
 779:	83 e8 08             	sub    $0x8,%eax
 77c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 77f:	a1 c8 09 00 00       	mov    0x9c8,%eax
 784:	89 45 fc             	mov    %eax,-0x4(%ebp)
 787:	eb 24                	jmp    7ad <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 789:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78c:	8b 00                	mov    (%eax),%eax
 78e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 791:	77 12                	ja     7a5 <free+0x35>
 793:	8b 45 f8             	mov    -0x8(%ebp),%eax
 796:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 799:	77 24                	ja     7bf <free+0x4f>
 79b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79e:	8b 00                	mov    (%eax),%eax
 7a0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7a3:	77 1a                	ja     7bf <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a8:	8b 00                	mov    (%eax),%eax
 7aa:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b3:	76 d4                	jbe    789 <free+0x19>
 7b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b8:	8b 00                	mov    (%eax),%eax
 7ba:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7bd:	76 ca                	jbe    789 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c2:	8b 40 04             	mov    0x4(%eax),%eax
 7c5:	c1 e0 03             	shl    $0x3,%eax
 7c8:	89 c2                	mov    %eax,%edx
 7ca:	03 55 f8             	add    -0x8(%ebp),%edx
 7cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d0:	8b 00                	mov    (%eax),%eax
 7d2:	39 c2                	cmp    %eax,%edx
 7d4:	75 24                	jne    7fa <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 7d6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d9:	8b 50 04             	mov    0x4(%eax),%edx
 7dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7df:	8b 00                	mov    (%eax),%eax
 7e1:	8b 40 04             	mov    0x4(%eax),%eax
 7e4:	01 c2                	add    %eax,%edx
 7e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ef:	8b 00                	mov    (%eax),%eax
 7f1:	8b 10                	mov    (%eax),%edx
 7f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f6:	89 10                	mov    %edx,(%eax)
 7f8:	eb 0a                	jmp    804 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 7fa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fd:	8b 10                	mov    (%eax),%edx
 7ff:	8b 45 f8             	mov    -0x8(%ebp),%eax
 802:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 804:	8b 45 fc             	mov    -0x4(%ebp),%eax
 807:	8b 40 04             	mov    0x4(%eax),%eax
 80a:	c1 e0 03             	shl    $0x3,%eax
 80d:	03 45 fc             	add    -0x4(%ebp),%eax
 810:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 813:	75 20                	jne    835 <free+0xc5>
    p->s.size += bp->s.size;
 815:	8b 45 fc             	mov    -0x4(%ebp),%eax
 818:	8b 50 04             	mov    0x4(%eax),%edx
 81b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 81e:	8b 40 04             	mov    0x4(%eax),%eax
 821:	01 c2                	add    %eax,%edx
 823:	8b 45 fc             	mov    -0x4(%ebp),%eax
 826:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 829:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82c:	8b 10                	mov    (%eax),%edx
 82e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 831:	89 10                	mov    %edx,(%eax)
 833:	eb 08                	jmp    83d <free+0xcd>
  } else
    p->s.ptr = bp;
 835:	8b 45 fc             	mov    -0x4(%ebp),%eax
 838:	8b 55 f8             	mov    -0x8(%ebp),%edx
 83b:	89 10                	mov    %edx,(%eax)
  freep = p;
 83d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 840:	a3 c8 09 00 00       	mov    %eax,0x9c8
}
 845:	c9                   	leave  
 846:	c3                   	ret    

00000847 <morecore>:

static Header*
morecore(uint nu)
{
 847:	55                   	push   %ebp
 848:	89 e5                	mov    %esp,%ebp
 84a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 84d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 854:	77 07                	ja     85d <morecore+0x16>
    nu = 4096;
 856:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 85d:	8b 45 08             	mov    0x8(%ebp),%eax
 860:	c1 e0 03             	shl    $0x3,%eax
 863:	89 04 24             	mov    %eax,(%esp)
 866:	e8 4d fc ff ff       	call   4b8 <sbrk>
 86b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 86e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 872:	75 07                	jne    87b <morecore+0x34>
    return 0;
 874:	b8 00 00 00 00       	mov    $0x0,%eax
 879:	eb 22                	jmp    89d <morecore+0x56>
  hp = (Header*)p;
 87b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 881:	8b 45 f4             	mov    -0xc(%ebp),%eax
 884:	8b 55 08             	mov    0x8(%ebp),%edx
 887:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 88a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88d:	83 c0 08             	add    $0x8,%eax
 890:	89 04 24             	mov    %eax,(%esp)
 893:	e8 d8 fe ff ff       	call   770 <free>
  return freep;
 898:	a1 c8 09 00 00       	mov    0x9c8,%eax
}
 89d:	c9                   	leave  
 89e:	c3                   	ret    

0000089f <malloc>:

void*
malloc(uint nbytes)
{
 89f:	55                   	push   %ebp
 8a0:	89 e5                	mov    %esp,%ebp
 8a2:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a5:	8b 45 08             	mov    0x8(%ebp),%eax
 8a8:	83 c0 07             	add    $0x7,%eax
 8ab:	c1 e8 03             	shr    $0x3,%eax
 8ae:	83 c0 01             	add    $0x1,%eax
 8b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 8b4:	a1 c8 09 00 00       	mov    0x9c8,%eax
 8b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8bc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8c0:	75 23                	jne    8e5 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8c2:	c7 45 f0 c0 09 00 00 	movl   $0x9c0,-0x10(%ebp)
 8c9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8cc:	a3 c8 09 00 00       	mov    %eax,0x9c8
 8d1:	a1 c8 09 00 00       	mov    0x9c8,%eax
 8d6:	a3 c0 09 00 00       	mov    %eax,0x9c0
    base.s.size = 0;
 8db:	c7 05 c4 09 00 00 00 	movl   $0x0,0x9c4
 8e2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8e8:	8b 00                	mov    (%eax),%eax
 8ea:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 8ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8f0:	8b 40 04             	mov    0x4(%eax),%eax
 8f3:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8f6:	72 4d                	jb     945 <malloc+0xa6>
      if(p->s.size == nunits)
 8f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8fb:	8b 40 04             	mov    0x4(%eax),%eax
 8fe:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 901:	75 0c                	jne    90f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 903:	8b 45 ec             	mov    -0x14(%ebp),%eax
 906:	8b 10                	mov    (%eax),%edx
 908:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90b:	89 10                	mov    %edx,(%eax)
 90d:	eb 26                	jmp    935 <malloc+0x96>
      else {
        p->s.size -= nunits;
 90f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 912:	8b 40 04             	mov    0x4(%eax),%eax
 915:	89 c2                	mov    %eax,%edx
 917:	2b 55 f4             	sub    -0xc(%ebp),%edx
 91a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 91d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 920:	8b 45 ec             	mov    -0x14(%ebp),%eax
 923:	8b 40 04             	mov    0x4(%eax),%eax
 926:	c1 e0 03             	shl    $0x3,%eax
 929:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 92c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 92f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 932:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 935:	8b 45 f0             	mov    -0x10(%ebp),%eax
 938:	a3 c8 09 00 00       	mov    %eax,0x9c8
      return (void*)(p + 1);
 93d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 940:	83 c0 08             	add    $0x8,%eax
 943:	eb 38                	jmp    97d <malloc+0xde>
    }
    if(p == freep)
 945:	a1 c8 09 00 00       	mov    0x9c8,%eax
 94a:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 94d:	75 1b                	jne    96a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 94f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 952:	89 04 24             	mov    %eax,(%esp)
 955:	e8 ed fe ff ff       	call   847 <morecore>
 95a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 95d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 961:	75 07                	jne    96a <malloc+0xcb>
        return 0;
 963:	b8 00 00 00 00       	mov    $0x0,%eax
 968:	eb 13                	jmp    97d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 96a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 96d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 970:	8b 45 ec             	mov    -0x14(%ebp),%eax
 973:	8b 00                	mov    (%eax),%eax
 975:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 978:	e9 70 ff ff ff       	jmp    8ed <malloc+0x4e>
}
 97d:	c9                   	leave  
 97e:	c3                   	ret    
