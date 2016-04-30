
_forktest:     file format elf32-i386


Disassembly of section .text:

00000000 <printf>:

#define N  1000

void
printf(int fd, char *s, ...)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 18             	sub    $0x18,%esp
  write(fd, s, strlen(s));
   6:	8b 45 0c             	mov    0xc(%ebp),%eax
   9:	89 04 24             	mov    %eax,(%esp)
   c:	e8 e4 01 00 00       	call   1f5 <strlen>
  11:	89 44 24 08          	mov    %eax,0x8(%esp)
  15:	8b 45 0c             	mov    0xc(%ebp),%eax
  18:	89 44 24 04          	mov    %eax,0x4(%esp)
  1c:	8b 45 08             	mov    0x8(%ebp),%eax
  1f:	89 04 24             	mov    %eax,(%esp)
  22:	e8 c1 03 00 00       	call   3e8 <write>
}
  27:	c9                   	leave  
  28:	c3                   	ret    

00000029 <forktest>:

void
forktest(void)
{
  29:	55                   	push   %ebp
  2a:	89 e5                	mov    %esp,%ebp
  2c:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
  2f:	c7 44 24 04 78 04 00 	movl   $0x478,0x4(%esp)
  36:	00 
  37:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  3e:	e8 bd ff ff ff       	call   0 <printf>

  printf(1, "fork test\n");
  43:	c7 44 24 04 78 04 00 	movl   $0x478,0x4(%esp)
  4a:	00 
  4b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  52:	e8 a9 ff ff ff       	call   0 <printf>

  for(n=0; n<N; n++){
  57:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  5e:	eb 24                	jmp    84 <forktest+0x5b>
    pid = fork();
  60:	e8 53 03 00 00       	call   3b8 <fork>
  65:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(pid < 0)
  68:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  6c:	78 21                	js     8f <forktest+0x66>
      break;
    if(pid == 0)
  6e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  72:	75 0c                	jne    80 <forktest+0x57>
      exit(0);
  74:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  7b:	e8 40 03 00 00       	call   3c0 <exit>

  printf(1, "fork test\n");

  printf(1, "fork test\n");

  for(n=0; n<N; n++){
  80:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  84:	81 7d f0 e7 03 00 00 	cmpl   $0x3e7,-0x10(%ebp)
  8b:	7e d3                	jle    60 <forktest+0x37>
  8d:	eb 01                	jmp    90 <forktest+0x67>
    pid = fork();
    if(pid < 0)
      break;
  8f:	90                   	nop
    if(pid == 0)
      exit(0);
  }
  
  if(n == N){
  90:	81 7d f0 e8 03 00 00 	cmpl   $0x3e8,-0x10(%ebp)
  97:	75 5c                	jne    f5 <forktest+0xcc>
    printf(1, "fork claimed to work N times!\n", N);
  99:	c7 44 24 08 e8 03 00 	movl   $0x3e8,0x8(%esp)
  a0:	00 
  a1:	c7 44 24 04 84 04 00 	movl   $0x484,0x4(%esp)
  a8:	00 
  a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b0:	e8 4b ff ff ff       	call   0 <printf>
    exit(1);
  b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bc:	e8 ff 02 00 00       	call   3c0 <exit>
  }
  
  for(; n > 0; n--){
    if(wait(0) < 0){
  c1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  c8:	e8 fb 02 00 00       	call   3c8 <wait>
  cd:	85 c0                	test   %eax,%eax
  cf:	79 20                	jns    f1 <forktest+0xc8>
      printf(1, "wait stopped early\n");
  d1:	c7 44 24 04 a3 04 00 	movl   $0x4a3,0x4(%esp)
  d8:	00 
  d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e0:	e8 1b ff ff ff       	call   0 <printf>
      exit(1);
  e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ec:	e8 cf 02 00 00       	call   3c0 <exit>
  if(n == N){
    printf(1, "fork claimed to work N times!\n", N);
    exit(1);
  }
  
  for(; n > 0; n--){
  f1:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
  f5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  f9:	7f c6                	jg     c1 <forktest+0x98>
      printf(1, "wait stopped early\n");
      exit(1);
    }
  }
  
  if(wait(0) != -1){
  fb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 102:	e8 c1 02 00 00       	call   3c8 <wait>
 107:	83 f8 ff             	cmp    $0xffffffff,%eax
 10a:	74 20                	je     12c <forktest+0x103>
    printf(1, "wait got too many\n");
 10c:	c7 44 24 04 b7 04 00 	movl   $0x4b7,0x4(%esp)
 113:	00 
 114:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 11b:	e8 e0 fe ff ff       	call   0 <printf>
    exit(1);
 120:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 127:	e8 94 02 00 00       	call   3c0 <exit>
  }
  
  printf(1, "fork test OK\n");
 12c:	c7 44 24 04 ca 04 00 	movl   $0x4ca,0x4(%esp)
 133:	00 
 134:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 13b:	e8 c0 fe ff ff       	call   0 <printf>
}
 140:	c9                   	leave  
 141:	c3                   	ret    

00000142 <main>:

int
main(void)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	83 e4 f0             	and    $0xfffffff0,%esp
 148:	83 ec 10             	sub    $0x10,%esp
  forktest();
 14b:	e8 d9 fe ff ff       	call   29 <forktest>
  exit(0);
 150:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 157:	e8 64 02 00 00       	call   3c0 <exit>

0000015c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 15c:	55                   	push   %ebp
 15d:	89 e5                	mov    %esp,%ebp
 15f:	57                   	push   %edi
 160:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 161:	8b 4d 08             	mov    0x8(%ebp),%ecx
 164:	8b 55 10             	mov    0x10(%ebp),%edx
 167:	8b 45 0c             	mov    0xc(%ebp),%eax
 16a:	89 cb                	mov    %ecx,%ebx
 16c:	89 df                	mov    %ebx,%edi
 16e:	89 d1                	mov    %edx,%ecx
 170:	fc                   	cld    
 171:	f3 aa                	rep stos %al,%es:(%edi)
 173:	89 ca                	mov    %ecx,%edx
 175:	89 fb                	mov    %edi,%ebx
 177:	89 5d 08             	mov    %ebx,0x8(%ebp)
 17a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 17d:	5b                   	pop    %ebx
 17e:	5f                   	pop    %edi
 17f:	5d                   	pop    %ebp
 180:	c3                   	ret    

00000181 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 181:	55                   	push   %ebp
 182:	89 e5                	mov    %esp,%ebp
 184:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 18d:	8b 45 0c             	mov    0xc(%ebp),%eax
 190:	0f b6 10             	movzbl (%eax),%edx
 193:	8b 45 08             	mov    0x8(%ebp),%eax
 196:	88 10                	mov    %dl,(%eax)
 198:	8b 45 08             	mov    0x8(%ebp),%eax
 19b:	0f b6 00             	movzbl (%eax),%eax
 19e:	84 c0                	test   %al,%al
 1a0:	0f 95 c0             	setne  %al
 1a3:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1a7:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 1ab:	84 c0                	test   %al,%al
 1ad:	75 de                	jne    18d <strcpy+0xc>
    ;
  return os;
 1af:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1b2:	c9                   	leave  
 1b3:	c3                   	ret    

000001b4 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1b4:	55                   	push   %ebp
 1b5:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1b7:	eb 08                	jmp    1c1 <strcmp+0xd>
    p++, q++;
 1b9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1bd:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1c1:	8b 45 08             	mov    0x8(%ebp),%eax
 1c4:	0f b6 00             	movzbl (%eax),%eax
 1c7:	84 c0                	test   %al,%al
 1c9:	74 10                	je     1db <strcmp+0x27>
 1cb:	8b 45 08             	mov    0x8(%ebp),%eax
 1ce:	0f b6 10             	movzbl (%eax),%edx
 1d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d4:	0f b6 00             	movzbl (%eax),%eax
 1d7:	38 c2                	cmp    %al,%dl
 1d9:	74 de                	je     1b9 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1db:	8b 45 08             	mov    0x8(%ebp),%eax
 1de:	0f b6 00             	movzbl (%eax),%eax
 1e1:	0f b6 d0             	movzbl %al,%edx
 1e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e7:	0f b6 00             	movzbl (%eax),%eax
 1ea:	0f b6 c0             	movzbl %al,%eax
 1ed:	89 d1                	mov    %edx,%ecx
 1ef:	29 c1                	sub    %eax,%ecx
 1f1:	89 c8                	mov    %ecx,%eax
}
 1f3:	5d                   	pop    %ebp
 1f4:	c3                   	ret    

000001f5 <strlen>:

uint
strlen(char *s)
{
 1f5:	55                   	push   %ebp
 1f6:	89 e5                	mov    %esp,%ebp
 1f8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1fb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 202:	eb 04                	jmp    208 <strlen+0x13>
 204:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 208:	8b 45 fc             	mov    -0x4(%ebp),%eax
 20b:	03 45 08             	add    0x8(%ebp),%eax
 20e:	0f b6 00             	movzbl (%eax),%eax
 211:	84 c0                	test   %al,%al
 213:	75 ef                	jne    204 <strlen+0xf>
    ;
  return n;
 215:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 218:	c9                   	leave  
 219:	c3                   	ret    

0000021a <memset>:

void*
memset(void *dst, int c, uint n)
{
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 220:	8b 45 10             	mov    0x10(%ebp),%eax
 223:	89 44 24 08          	mov    %eax,0x8(%esp)
 227:	8b 45 0c             	mov    0xc(%ebp),%eax
 22a:	89 44 24 04          	mov    %eax,0x4(%esp)
 22e:	8b 45 08             	mov    0x8(%ebp),%eax
 231:	89 04 24             	mov    %eax,(%esp)
 234:	e8 23 ff ff ff       	call   15c <stosb>
  return dst;
 239:	8b 45 08             	mov    0x8(%ebp),%eax
}
 23c:	c9                   	leave  
 23d:	c3                   	ret    

0000023e <strchr>:

char*
strchr(const char *s, char c)
{
 23e:	55                   	push   %ebp
 23f:	89 e5                	mov    %esp,%ebp
 241:	83 ec 04             	sub    $0x4,%esp
 244:	8b 45 0c             	mov    0xc(%ebp),%eax
 247:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 24a:	eb 14                	jmp    260 <strchr+0x22>
    if(*s == c)
 24c:	8b 45 08             	mov    0x8(%ebp),%eax
 24f:	0f b6 00             	movzbl (%eax),%eax
 252:	3a 45 fc             	cmp    -0x4(%ebp),%al
 255:	75 05                	jne    25c <strchr+0x1e>
      return (char*)s;
 257:	8b 45 08             	mov    0x8(%ebp),%eax
 25a:	eb 13                	jmp    26f <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 25c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	84 c0                	test   %al,%al
 268:	75 e2                	jne    24c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 26a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 26f:	c9                   	leave  
 270:	c3                   	ret    

00000271 <gets>:

char*
gets(char *buf, int max)
{
 271:	55                   	push   %ebp
 272:	89 e5                	mov    %esp,%ebp
 274:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 277:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 27e:	eb 44                	jmp    2c4 <gets+0x53>
    cc = read(0, &c, 1);
 280:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 287:	00 
 288:	8d 45 ef             	lea    -0x11(%ebp),%eax
 28b:	89 44 24 04          	mov    %eax,0x4(%esp)
 28f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 296:	e8 45 01 00 00       	call   3e0 <read>
 29b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 29e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2a2:	7e 2d                	jle    2d1 <gets+0x60>
      break;
    buf[i++] = c;
 2a4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2a7:	03 45 08             	add    0x8(%ebp),%eax
 2aa:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 2ae:	88 10                	mov    %dl,(%eax)
 2b0:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 2b4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2b8:	3c 0a                	cmp    $0xa,%al
 2ba:	74 16                	je     2d2 <gets+0x61>
 2bc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2c0:	3c 0d                	cmp    $0xd,%al
 2c2:	74 0e                	je     2d2 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2c7:	83 c0 01             	add    $0x1,%eax
 2ca:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2cd:	7c b1                	jl     280 <gets+0xf>
 2cf:	eb 01                	jmp    2d2 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 2d1:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2d5:	03 45 08             	add    0x8(%ebp),%eax
 2d8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2db:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2de:	c9                   	leave  
 2df:	c3                   	ret    

000002e0 <stat>:

int
stat(char *n, struct stat *st)
{
 2e0:	55                   	push   %ebp
 2e1:	89 e5                	mov    %esp,%ebp
 2e3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2e6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2ed:	00 
 2ee:	8b 45 08             	mov    0x8(%ebp),%eax
 2f1:	89 04 24             	mov    %eax,(%esp)
 2f4:	e8 0f 01 00 00       	call   408 <open>
 2f9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 2fc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 300:	79 07                	jns    309 <stat+0x29>
    return -1;
 302:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 307:	eb 23                	jmp    32c <stat+0x4c>
  r = fstat(fd, st);
 309:	8b 45 0c             	mov    0xc(%ebp),%eax
 30c:	89 44 24 04          	mov    %eax,0x4(%esp)
 310:	8b 45 f0             	mov    -0x10(%ebp),%eax
 313:	89 04 24             	mov    %eax,(%esp)
 316:	e8 05 01 00 00       	call   420 <fstat>
 31b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 31e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 321:	89 04 24             	mov    %eax,(%esp)
 324:	e8 c7 00 00 00       	call   3f0 <close>
  return r;
 329:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 32c:	c9                   	leave  
 32d:	c3                   	ret    

0000032e <atoi>:

int
atoi(const char *s)
{
 32e:	55                   	push   %ebp
 32f:	89 e5                	mov    %esp,%ebp
 331:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 334:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 33b:	eb 24                	jmp    361 <atoi+0x33>
    n = n*10 + *s++ - '0';
 33d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 340:	89 d0                	mov    %edx,%eax
 342:	c1 e0 02             	shl    $0x2,%eax
 345:	01 d0                	add    %edx,%eax
 347:	01 c0                	add    %eax,%eax
 349:	89 c2                	mov    %eax,%edx
 34b:	8b 45 08             	mov    0x8(%ebp),%eax
 34e:	0f b6 00             	movzbl (%eax),%eax
 351:	0f be c0             	movsbl %al,%eax
 354:	8d 04 02             	lea    (%edx,%eax,1),%eax
 357:	83 e8 30             	sub    $0x30,%eax
 35a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 35d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 361:	8b 45 08             	mov    0x8(%ebp),%eax
 364:	0f b6 00             	movzbl (%eax),%eax
 367:	3c 2f                	cmp    $0x2f,%al
 369:	7e 0a                	jle    375 <atoi+0x47>
 36b:	8b 45 08             	mov    0x8(%ebp),%eax
 36e:	0f b6 00             	movzbl (%eax),%eax
 371:	3c 39                	cmp    $0x39,%al
 373:	7e c8                	jle    33d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 375:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 378:	c9                   	leave  
 379:	c3                   	ret    

0000037a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 380:	8b 45 08             	mov    0x8(%ebp),%eax
 383:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 386:	8b 45 0c             	mov    0xc(%ebp),%eax
 389:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 38c:	eb 13                	jmp    3a1 <memmove+0x27>
    *dst++ = *src++;
 38e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 391:	0f b6 10             	movzbl (%eax),%edx
 394:	8b 45 f8             	mov    -0x8(%ebp),%eax
 397:	88 10                	mov    %dl,(%eax)
 399:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 39d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3a1:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 3a5:	0f 9f c0             	setg   %al
 3a8:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 3ac:	84 c0                	test   %al,%al
 3ae:	75 de                	jne    38e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 3b0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3b3:	c9                   	leave  
 3b4:	c3                   	ret    
 3b5:	90                   	nop
 3b6:	90                   	nop
 3b7:	90                   	nop

000003b8 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3b8:	b8 01 00 00 00       	mov    $0x1,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <exit>:
SYSCALL(exit)
 3c0:	b8 02 00 00 00       	mov    $0x2,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <wait>:
SYSCALL(wait)
 3c8:	b8 03 00 00 00       	mov    $0x3,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <waitpid>:
SYSCALL(waitpid)
 3d0:	b8 17 00 00 00       	mov    $0x17,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <pipe>:
SYSCALL(pipe)
 3d8:	b8 04 00 00 00       	mov    $0x4,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <read>:
SYSCALL(read)
 3e0:	b8 05 00 00 00       	mov    $0x5,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <write>:
SYSCALL(write)
 3e8:	b8 10 00 00 00       	mov    $0x10,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <close>:
SYSCALL(close)
 3f0:	b8 15 00 00 00       	mov    $0x15,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <kill>:
SYSCALL(kill)
 3f8:	b8 06 00 00 00       	mov    $0x6,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <exec>:
SYSCALL(exec)
 400:	b8 07 00 00 00       	mov    $0x7,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <open>:
SYSCALL(open)
 408:	b8 0f 00 00 00       	mov    $0xf,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <mknod>:
SYSCALL(mknod)
 410:	b8 11 00 00 00       	mov    $0x11,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <unlink>:
SYSCALL(unlink)
 418:	b8 12 00 00 00       	mov    $0x12,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <fstat>:
SYSCALL(fstat)
 420:	b8 08 00 00 00       	mov    $0x8,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <link>:
SYSCALL(link)
 428:	b8 13 00 00 00       	mov    $0x13,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <mkdir>:
SYSCALL(mkdir)
 430:	b8 14 00 00 00       	mov    $0x14,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <chdir>:
SYSCALL(chdir)
 438:	b8 09 00 00 00       	mov    $0x9,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <dup>:
SYSCALL(dup)
 440:	b8 0a 00 00 00       	mov    $0xa,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <getpid>:
SYSCALL(getpid)
 448:	b8 0b 00 00 00       	mov    $0xb,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <sbrk>:
SYSCALL(sbrk)
 450:	b8 0c 00 00 00       	mov    $0xc,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <sleep>:
SYSCALL(sleep)
 458:	b8 0d 00 00 00       	mov    $0xd,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <uptime>:
SYSCALL(uptime)
 460:	b8 0e 00 00 00       	mov    $0xe,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <count>:
SYSCALL(count)
 468:	b8 16 00 00 00       	mov    $0x16,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <change_priority>:
SYSCALL(change_priority)
 470:	b8 18 00 00 00       	mov    $0x18,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    
