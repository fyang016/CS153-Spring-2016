
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 ea 08 00 00 	movl   $0x8ea,(%esp)
  18:	e8 bb 03 00 00       	call   3d8 <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 ea 08 00 00 	movl   $0x8ea,(%esp)
  38:	e8 a3 03 00 00       	call   3e0 <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 ea 08 00 00 	movl   $0x8ea,(%esp)
  4c:	e8 87 03 00 00       	call   3d8 <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 b3 03 00 00       	call   410 <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 a7 03 00 00       	call   410 <dup>
  69:	eb 01                	jmp    6c <main+0x6c>
      printf(1, "init: exec sh failed\n");
      exit(1);
    }
    while((wpid=wait(0)) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  }
  6b:	90                   	nop
  }
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
  6c:	c7 44 24 04 f2 08 00 	movl   $0x8f2,0x4(%esp)
  73:	00 
  74:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7b:	e8 a1 04 00 00       	call   521 <printf>
    pid = fork();
  80:	e8 03 03 00 00       	call   388 <fork>
  85:	89 44 24 18          	mov    %eax,0x18(%esp)
    if(pid < 0){
  89:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  8e:	79 20                	jns    b0 <main+0xb0>
      printf(1, "init: fork failed\n");
  90:	c7 44 24 04 05 09 00 	movl   $0x905,0x4(%esp)
  97:	00 
  98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9f:	e8 7d 04 00 00       	call   521 <printf>
      exit(1);
  a4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ab:	e8 e0 02 00 00       	call   390 <exit>
    }
    if(pid == 0){
  b0:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  b5:	75 4a                	jne    101 <main+0x101>
      exec("sh", argv);
  b7:	c7 44 24 04 40 09 00 	movl   $0x940,0x4(%esp)
  be:	00 
  bf:	c7 04 24 e7 08 00 00 	movl   $0x8e7,(%esp)
  c6:	e8 05 03 00 00       	call   3d0 <exec>
      printf(1, "init: exec sh failed\n");
  cb:	c7 44 24 04 18 09 00 	movl   $0x918,0x4(%esp)
  d2:	00 
  d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  da:	e8 42 04 00 00       	call   521 <printf>
      exit(1);
  df:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e6:	e8 a5 02 00 00       	call   390 <exit>
    }
    while((wpid=wait(0)) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  eb:	c7 44 24 04 2e 09 00 	movl   $0x92e,0x4(%esp)
  f2:	00 
  f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fa:	e8 22 04 00 00       	call   521 <printf>
  ff:	eb 01                	jmp    102 <main+0x102>
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit(1);
    }
    while((wpid=wait(0)) >= 0 && wpid != pid)
 101:	90                   	nop
 102:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 109:	e8 8a 02 00 00       	call   398 <wait>
 10e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
 112:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 117:	0f 88 4e ff ff ff    	js     6b <main+0x6b>
 11d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 121:	3b 44 24 18          	cmp    0x18(%esp),%eax
 125:	75 c4                	jne    eb <main+0xeb>
      printf(1, "zombie!\n");
  }
 127:	e9 40 ff ff ff       	jmp    6c <main+0x6c>

0000012c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 12c:	55                   	push   %ebp
 12d:	89 e5                	mov    %esp,%ebp
 12f:	57                   	push   %edi
 130:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 131:	8b 4d 08             	mov    0x8(%ebp),%ecx
 134:	8b 55 10             	mov    0x10(%ebp),%edx
 137:	8b 45 0c             	mov    0xc(%ebp),%eax
 13a:	89 cb                	mov    %ecx,%ebx
 13c:	89 df                	mov    %ebx,%edi
 13e:	89 d1                	mov    %edx,%ecx
 140:	fc                   	cld    
 141:	f3 aa                	rep stos %al,%es:(%edi)
 143:	89 ca                	mov    %ecx,%edx
 145:	89 fb                	mov    %edi,%ebx
 147:	89 5d 08             	mov    %ebx,0x8(%ebp)
 14a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 14d:	5b                   	pop    %ebx
 14e:	5f                   	pop    %edi
 14f:	5d                   	pop    %ebp
 150:	c3                   	ret    

00000151 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 151:	55                   	push   %ebp
 152:	89 e5                	mov    %esp,%ebp
 154:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 157:	8b 45 08             	mov    0x8(%ebp),%eax
 15a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 15d:	8b 45 0c             	mov    0xc(%ebp),%eax
 160:	0f b6 10             	movzbl (%eax),%edx
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	88 10                	mov    %dl,(%eax)
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	0f b6 00             	movzbl (%eax),%eax
 16e:	84 c0                	test   %al,%al
 170:	0f 95 c0             	setne  %al
 173:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 177:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 17b:	84 c0                	test   %al,%al
 17d:	75 de                	jne    15d <strcpy+0xc>
    ;
  return os;
 17f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 182:	c9                   	leave  
 183:	c3                   	ret    

00000184 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 184:	55                   	push   %ebp
 185:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 187:	eb 08                	jmp    191 <strcmp+0xd>
    p++, q++;
 189:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 18d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 191:	8b 45 08             	mov    0x8(%ebp),%eax
 194:	0f b6 00             	movzbl (%eax),%eax
 197:	84 c0                	test   %al,%al
 199:	74 10                	je     1ab <strcmp+0x27>
 19b:	8b 45 08             	mov    0x8(%ebp),%eax
 19e:	0f b6 10             	movzbl (%eax),%edx
 1a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a4:	0f b6 00             	movzbl (%eax),%eax
 1a7:	38 c2                	cmp    %al,%dl
 1a9:	74 de                	je     189 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1ab:	8b 45 08             	mov    0x8(%ebp),%eax
 1ae:	0f b6 00             	movzbl (%eax),%eax
 1b1:	0f b6 d0             	movzbl %al,%edx
 1b4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b7:	0f b6 00             	movzbl (%eax),%eax
 1ba:	0f b6 c0             	movzbl %al,%eax
 1bd:	89 d1                	mov    %edx,%ecx
 1bf:	29 c1                	sub    %eax,%ecx
 1c1:	89 c8                	mov    %ecx,%eax
}
 1c3:	5d                   	pop    %ebp
 1c4:	c3                   	ret    

000001c5 <strlen>:

uint
strlen(char *s)
{
 1c5:	55                   	push   %ebp
 1c6:	89 e5                	mov    %esp,%ebp
 1c8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1cb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1d2:	eb 04                	jmp    1d8 <strlen+0x13>
 1d4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1db:	03 45 08             	add    0x8(%ebp),%eax
 1de:	0f b6 00             	movzbl (%eax),%eax
 1e1:	84 c0                	test   %al,%al
 1e3:	75 ef                	jne    1d4 <strlen+0xf>
    ;
  return n;
 1e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1e8:	c9                   	leave  
 1e9:	c3                   	ret    

000001ea <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ea:	55                   	push   %ebp
 1eb:	89 e5                	mov    %esp,%ebp
 1ed:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1f0:	8b 45 10             	mov    0x10(%ebp),%eax
 1f3:	89 44 24 08          	mov    %eax,0x8(%esp)
 1f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 1fe:	8b 45 08             	mov    0x8(%ebp),%eax
 201:	89 04 24             	mov    %eax,(%esp)
 204:	e8 23 ff ff ff       	call   12c <stosb>
  return dst;
 209:	8b 45 08             	mov    0x8(%ebp),%eax
}
 20c:	c9                   	leave  
 20d:	c3                   	ret    

0000020e <strchr>:

char*
strchr(const char *s, char c)
{
 20e:	55                   	push   %ebp
 20f:	89 e5                	mov    %esp,%ebp
 211:	83 ec 04             	sub    $0x4,%esp
 214:	8b 45 0c             	mov    0xc(%ebp),%eax
 217:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 21a:	eb 14                	jmp    230 <strchr+0x22>
    if(*s == c)
 21c:	8b 45 08             	mov    0x8(%ebp),%eax
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	3a 45 fc             	cmp    -0x4(%ebp),%al
 225:	75 05                	jne    22c <strchr+0x1e>
      return (char*)s;
 227:	8b 45 08             	mov    0x8(%ebp),%eax
 22a:	eb 13                	jmp    23f <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 22c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 230:	8b 45 08             	mov    0x8(%ebp),%eax
 233:	0f b6 00             	movzbl (%eax),%eax
 236:	84 c0                	test   %al,%al
 238:	75 e2                	jne    21c <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 23a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 23f:	c9                   	leave  
 240:	c3                   	ret    

00000241 <gets>:

char*
gets(char *buf, int max)
{
 241:	55                   	push   %ebp
 242:	89 e5                	mov    %esp,%ebp
 244:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 247:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 24e:	eb 44                	jmp    294 <gets+0x53>
    cc = read(0, &c, 1);
 250:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 257:	00 
 258:	8d 45 ef             	lea    -0x11(%ebp),%eax
 25b:	89 44 24 04          	mov    %eax,0x4(%esp)
 25f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 266:	e8 45 01 00 00       	call   3b0 <read>
 26b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 26e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 272:	7e 2d                	jle    2a1 <gets+0x60>
      break;
    buf[i++] = c;
 274:	8b 45 f0             	mov    -0x10(%ebp),%eax
 277:	03 45 08             	add    0x8(%ebp),%eax
 27a:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 27e:	88 10                	mov    %dl,(%eax)
 280:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 284:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 288:	3c 0a                	cmp    $0xa,%al
 28a:	74 16                	je     2a2 <gets+0x61>
 28c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 290:	3c 0d                	cmp    $0xd,%al
 292:	74 0e                	je     2a2 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 294:	8b 45 f0             	mov    -0x10(%ebp),%eax
 297:	83 c0 01             	add    $0x1,%eax
 29a:	3b 45 0c             	cmp    0xc(%ebp),%eax
 29d:	7c b1                	jl     250 <gets+0xf>
 29f:	eb 01                	jmp    2a2 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 2a1:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2a5:	03 45 08             	add    0x8(%ebp),%eax
 2a8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2ab:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ae:	c9                   	leave  
 2af:	c3                   	ret    

000002b0 <stat>:

int
stat(char *n, struct stat *st)
{
 2b0:	55                   	push   %ebp
 2b1:	89 e5                	mov    %esp,%ebp
 2b3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2b6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2bd:	00 
 2be:	8b 45 08             	mov    0x8(%ebp),%eax
 2c1:	89 04 24             	mov    %eax,(%esp)
 2c4:	e8 0f 01 00 00       	call   3d8 <open>
 2c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 2cc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2d0:	79 07                	jns    2d9 <stat+0x29>
    return -1;
 2d2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2d7:	eb 23                	jmp    2fc <stat+0x4c>
  r = fstat(fd, st);
 2d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2e3:	89 04 24             	mov    %eax,(%esp)
 2e6:	e8 05 01 00 00       	call   3f0 <fstat>
 2eb:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 2ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2f1:	89 04 24             	mov    %eax,(%esp)
 2f4:	e8 c7 00 00 00       	call   3c0 <close>
  return r;
 2f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 2fc:	c9                   	leave  
 2fd:	c3                   	ret    

000002fe <atoi>:

int
atoi(const char *s)
{
 2fe:	55                   	push   %ebp
 2ff:	89 e5                	mov    %esp,%ebp
 301:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 304:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 30b:	eb 24                	jmp    331 <atoi+0x33>
    n = n*10 + *s++ - '0';
 30d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 310:	89 d0                	mov    %edx,%eax
 312:	c1 e0 02             	shl    $0x2,%eax
 315:	01 d0                	add    %edx,%eax
 317:	01 c0                	add    %eax,%eax
 319:	89 c2                	mov    %eax,%edx
 31b:	8b 45 08             	mov    0x8(%ebp),%eax
 31e:	0f b6 00             	movzbl (%eax),%eax
 321:	0f be c0             	movsbl %al,%eax
 324:	8d 04 02             	lea    (%edx,%eax,1),%eax
 327:	83 e8 30             	sub    $0x30,%eax
 32a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 32d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 331:	8b 45 08             	mov    0x8(%ebp),%eax
 334:	0f b6 00             	movzbl (%eax),%eax
 337:	3c 2f                	cmp    $0x2f,%al
 339:	7e 0a                	jle    345 <atoi+0x47>
 33b:	8b 45 08             	mov    0x8(%ebp),%eax
 33e:	0f b6 00             	movzbl (%eax),%eax
 341:	3c 39                	cmp    $0x39,%al
 343:	7e c8                	jle    30d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 345:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 348:	c9                   	leave  
 349:	c3                   	ret    

0000034a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
 34d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 350:	8b 45 08             	mov    0x8(%ebp),%eax
 353:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 356:	8b 45 0c             	mov    0xc(%ebp),%eax
 359:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 35c:	eb 13                	jmp    371 <memmove+0x27>
    *dst++ = *src++;
 35e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 361:	0f b6 10             	movzbl (%eax),%edx
 364:	8b 45 f8             	mov    -0x8(%ebp),%eax
 367:	88 10                	mov    %dl,(%eax)
 369:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 36d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 371:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 375:	0f 9f c0             	setg   %al
 378:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 37c:	84 c0                	test   %al,%al
 37e:	75 de                	jne    35e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 380:	8b 45 08             	mov    0x8(%ebp),%eax
}
 383:	c9                   	leave  
 384:	c3                   	ret    
 385:	90                   	nop
 386:	90                   	nop
 387:	90                   	nop

00000388 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 388:	b8 01 00 00 00       	mov    $0x1,%eax
 38d:	cd 40                	int    $0x40
 38f:	c3                   	ret    

00000390 <exit>:
SYSCALL(exit)
 390:	b8 02 00 00 00       	mov    $0x2,%eax
 395:	cd 40                	int    $0x40
 397:	c3                   	ret    

00000398 <wait>:
SYSCALL(wait)
 398:	b8 03 00 00 00       	mov    $0x3,%eax
 39d:	cd 40                	int    $0x40
 39f:	c3                   	ret    

000003a0 <waitpid>:
SYSCALL(waitpid)
 3a0:	b8 17 00 00 00       	mov    $0x17,%eax
 3a5:	cd 40                	int    $0x40
 3a7:	c3                   	ret    

000003a8 <pipe>:
SYSCALL(pipe)
 3a8:	b8 04 00 00 00       	mov    $0x4,%eax
 3ad:	cd 40                	int    $0x40
 3af:	c3                   	ret    

000003b0 <read>:
SYSCALL(read)
 3b0:	b8 05 00 00 00       	mov    $0x5,%eax
 3b5:	cd 40                	int    $0x40
 3b7:	c3                   	ret    

000003b8 <write>:
SYSCALL(write)
 3b8:	b8 10 00 00 00       	mov    $0x10,%eax
 3bd:	cd 40                	int    $0x40
 3bf:	c3                   	ret    

000003c0 <close>:
SYSCALL(close)
 3c0:	b8 15 00 00 00       	mov    $0x15,%eax
 3c5:	cd 40                	int    $0x40
 3c7:	c3                   	ret    

000003c8 <kill>:
SYSCALL(kill)
 3c8:	b8 06 00 00 00       	mov    $0x6,%eax
 3cd:	cd 40                	int    $0x40
 3cf:	c3                   	ret    

000003d0 <exec>:
SYSCALL(exec)
 3d0:	b8 07 00 00 00       	mov    $0x7,%eax
 3d5:	cd 40                	int    $0x40
 3d7:	c3                   	ret    

000003d8 <open>:
SYSCALL(open)
 3d8:	b8 0f 00 00 00       	mov    $0xf,%eax
 3dd:	cd 40                	int    $0x40
 3df:	c3                   	ret    

000003e0 <mknod>:
SYSCALL(mknod)
 3e0:	b8 11 00 00 00       	mov    $0x11,%eax
 3e5:	cd 40                	int    $0x40
 3e7:	c3                   	ret    

000003e8 <unlink>:
SYSCALL(unlink)
 3e8:	b8 12 00 00 00       	mov    $0x12,%eax
 3ed:	cd 40                	int    $0x40
 3ef:	c3                   	ret    

000003f0 <fstat>:
SYSCALL(fstat)
 3f0:	b8 08 00 00 00       	mov    $0x8,%eax
 3f5:	cd 40                	int    $0x40
 3f7:	c3                   	ret    

000003f8 <link>:
SYSCALL(link)
 3f8:	b8 13 00 00 00       	mov    $0x13,%eax
 3fd:	cd 40                	int    $0x40
 3ff:	c3                   	ret    

00000400 <mkdir>:
SYSCALL(mkdir)
 400:	b8 14 00 00 00       	mov    $0x14,%eax
 405:	cd 40                	int    $0x40
 407:	c3                   	ret    

00000408 <chdir>:
SYSCALL(chdir)
 408:	b8 09 00 00 00       	mov    $0x9,%eax
 40d:	cd 40                	int    $0x40
 40f:	c3                   	ret    

00000410 <dup>:
SYSCALL(dup)
 410:	b8 0a 00 00 00       	mov    $0xa,%eax
 415:	cd 40                	int    $0x40
 417:	c3                   	ret    

00000418 <getpid>:
SYSCALL(getpid)
 418:	b8 0b 00 00 00       	mov    $0xb,%eax
 41d:	cd 40                	int    $0x40
 41f:	c3                   	ret    

00000420 <sbrk>:
SYSCALL(sbrk)
 420:	b8 0c 00 00 00       	mov    $0xc,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <sleep>:
SYSCALL(sleep)
 428:	b8 0d 00 00 00       	mov    $0xd,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <uptime>:
SYSCALL(uptime)
 430:	b8 0e 00 00 00       	mov    $0xe,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <count>:
SYSCALL(count)
 438:	b8 16 00 00 00       	mov    $0x16,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <change_priority>:
SYSCALL(change_priority)
 440:	b8 18 00 00 00       	mov    $0x18,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 448:	55                   	push   %ebp
 449:	89 e5                	mov    %esp,%ebp
 44b:	83 ec 28             	sub    $0x28,%esp
 44e:	8b 45 0c             	mov    0xc(%ebp),%eax
 451:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 454:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 45b:	00 
 45c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 45f:	89 44 24 04          	mov    %eax,0x4(%esp)
 463:	8b 45 08             	mov    0x8(%ebp),%eax
 466:	89 04 24             	mov    %eax,(%esp)
 469:	e8 4a ff ff ff       	call   3b8 <write>
}
 46e:	c9                   	leave  
 46f:	c3                   	ret    

00000470 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 470:	55                   	push   %ebp
 471:	89 e5                	mov    %esp,%ebp
 473:	53                   	push   %ebx
 474:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 477:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 47e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 482:	74 17                	je     49b <printint+0x2b>
 484:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 488:	79 11                	jns    49b <printint+0x2b>
    neg = 1;
 48a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 491:	8b 45 0c             	mov    0xc(%ebp),%eax
 494:	f7 d8                	neg    %eax
 496:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 499:	eb 06                	jmp    4a1 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 49b:	8b 45 0c             	mov    0xc(%ebp),%eax
 49e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 4a1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 4a8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 4ab:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b1:	ba 00 00 00 00       	mov    $0x0,%edx
 4b6:	f7 f3                	div    %ebx
 4b8:	89 d0                	mov    %edx,%eax
 4ba:	0f b6 80 48 09 00 00 	movzbl 0x948(%eax),%eax
 4c1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 4c5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 4c9:	8b 45 10             	mov    0x10(%ebp),%eax
 4cc:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4d2:	ba 00 00 00 00       	mov    $0x0,%edx
 4d7:	f7 75 d4             	divl   -0x2c(%ebp)
 4da:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4e1:	75 c5                	jne    4a8 <printint+0x38>
  if(neg)
 4e3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4e7:	74 28                	je     511 <printint+0xa1>
    buf[i++] = '-';
 4e9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ec:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4f1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 4f5:	eb 1a                	jmp    511 <printint+0xa1>
    putc(fd, buf[i]);
 4f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4fa:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 4ff:	0f be c0             	movsbl %al,%eax
 502:	89 44 24 04          	mov    %eax,0x4(%esp)
 506:	8b 45 08             	mov    0x8(%ebp),%eax
 509:	89 04 24             	mov    %eax,(%esp)
 50c:	e8 37 ff ff ff       	call   448 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 511:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 515:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 519:	79 dc                	jns    4f7 <printint+0x87>
    putc(fd, buf[i]);
}
 51b:	83 c4 44             	add    $0x44,%esp
 51e:	5b                   	pop    %ebx
 51f:	5d                   	pop    %ebp
 520:	c3                   	ret    

00000521 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 521:	55                   	push   %ebp
 522:	89 e5                	mov    %esp,%ebp
 524:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 527:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 52e:	8d 45 0c             	lea    0xc(%ebp),%eax
 531:	83 c0 04             	add    $0x4,%eax
 534:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 537:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 53e:	e9 7e 01 00 00       	jmp    6c1 <printf+0x1a0>
    c = fmt[i] & 0xff;
 543:	8b 55 0c             	mov    0xc(%ebp),%edx
 546:	8b 45 ec             	mov    -0x14(%ebp),%eax
 549:	8d 04 02             	lea    (%edx,%eax,1),%eax
 54c:	0f b6 00             	movzbl (%eax),%eax
 54f:	0f be c0             	movsbl %al,%eax
 552:	25 ff 00 00 00       	and    $0xff,%eax
 557:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 55a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 55e:	75 2c                	jne    58c <printf+0x6b>
      if(c == '%'){
 560:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 564:	75 0c                	jne    572 <printf+0x51>
        state = '%';
 566:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 56d:	e9 4b 01 00 00       	jmp    6bd <printf+0x19c>
      } else {
        putc(fd, c);
 572:	8b 45 e8             	mov    -0x18(%ebp),%eax
 575:	0f be c0             	movsbl %al,%eax
 578:	89 44 24 04          	mov    %eax,0x4(%esp)
 57c:	8b 45 08             	mov    0x8(%ebp),%eax
 57f:	89 04 24             	mov    %eax,(%esp)
 582:	e8 c1 fe ff ff       	call   448 <putc>
 587:	e9 31 01 00 00       	jmp    6bd <printf+0x19c>
      }
    } else if(state == '%'){
 58c:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 590:	0f 85 27 01 00 00    	jne    6bd <printf+0x19c>
      if(c == 'd'){
 596:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 59a:	75 2d                	jne    5c9 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 59c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59f:	8b 00                	mov    (%eax),%eax
 5a1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5a8:	00 
 5a9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5b0:	00 
 5b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b5:	8b 45 08             	mov    0x8(%ebp),%eax
 5b8:	89 04 24             	mov    %eax,(%esp)
 5bb:	e8 b0 fe ff ff       	call   470 <printint>
        ap++;
 5c0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5c4:	e9 ed 00 00 00       	jmp    6b6 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 5c9:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 5cd:	74 06                	je     5d5 <printf+0xb4>
 5cf:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 5d3:	75 2d                	jne    602 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 5d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d8:	8b 00                	mov    (%eax),%eax
 5da:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5e1:	00 
 5e2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5e9:	00 
 5ea:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ee:	8b 45 08             	mov    0x8(%ebp),%eax
 5f1:	89 04 24             	mov    %eax,(%esp)
 5f4:	e8 77 fe ff ff       	call   470 <printint>
        ap++;
 5f9:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5fd:	e9 b4 00 00 00       	jmp    6b6 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 602:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 606:	75 46                	jne    64e <printf+0x12d>
        s = (char*)*ap;
 608:	8b 45 f4             	mov    -0xc(%ebp),%eax
 60b:	8b 00                	mov    (%eax),%eax
 60d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 610:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 614:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 618:	75 27                	jne    641 <printf+0x120>
          s = "(null)";
 61a:	c7 45 e4 37 09 00 00 	movl   $0x937,-0x1c(%ebp)
        while(*s != 0){
 621:	eb 1f                	jmp    642 <printf+0x121>
          putc(fd, *s);
 623:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 626:	0f b6 00             	movzbl (%eax),%eax
 629:	0f be c0             	movsbl %al,%eax
 62c:	89 44 24 04          	mov    %eax,0x4(%esp)
 630:	8b 45 08             	mov    0x8(%ebp),%eax
 633:	89 04 24             	mov    %eax,(%esp)
 636:	e8 0d fe ff ff       	call   448 <putc>
          s++;
 63b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 63f:	eb 01                	jmp    642 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 641:	90                   	nop
 642:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 645:	0f b6 00             	movzbl (%eax),%eax
 648:	84 c0                	test   %al,%al
 64a:	75 d7                	jne    623 <printf+0x102>
 64c:	eb 68                	jmp    6b6 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 64e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 652:	75 1d                	jne    671 <printf+0x150>
        putc(fd, *ap);
 654:	8b 45 f4             	mov    -0xc(%ebp),%eax
 657:	8b 00                	mov    (%eax),%eax
 659:	0f be c0             	movsbl %al,%eax
 65c:	89 44 24 04          	mov    %eax,0x4(%esp)
 660:	8b 45 08             	mov    0x8(%ebp),%eax
 663:	89 04 24             	mov    %eax,(%esp)
 666:	e8 dd fd ff ff       	call   448 <putc>
        ap++;
 66b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 66f:	eb 45                	jmp    6b6 <printf+0x195>
      } else if(c == '%'){
 671:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 675:	75 17                	jne    68e <printf+0x16d>
        putc(fd, c);
 677:	8b 45 e8             	mov    -0x18(%ebp),%eax
 67a:	0f be c0             	movsbl %al,%eax
 67d:	89 44 24 04          	mov    %eax,0x4(%esp)
 681:	8b 45 08             	mov    0x8(%ebp),%eax
 684:	89 04 24             	mov    %eax,(%esp)
 687:	e8 bc fd ff ff       	call   448 <putc>
 68c:	eb 28                	jmp    6b6 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 68e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 695:	00 
 696:	8b 45 08             	mov    0x8(%ebp),%eax
 699:	89 04 24             	mov    %eax,(%esp)
 69c:	e8 a7 fd ff ff       	call   448 <putc>
        putc(fd, c);
 6a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a4:	0f be c0             	movsbl %al,%eax
 6a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ab:	8b 45 08             	mov    0x8(%ebp),%eax
 6ae:	89 04 24             	mov    %eax,(%esp)
 6b1:	e8 92 fd ff ff       	call   448 <putc>
      }
      state = 0;
 6b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6bd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 6c1:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6c7:	8d 04 02             	lea    (%edx,%eax,1),%eax
 6ca:	0f b6 00             	movzbl (%eax),%eax
 6cd:	84 c0                	test   %al,%al
 6cf:	0f 85 6e fe ff ff    	jne    543 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6d5:	c9                   	leave  
 6d6:	c3                   	ret    
 6d7:	90                   	nop

000006d8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d8:	55                   	push   %ebp
 6d9:	89 e5                	mov    %esp,%ebp
 6db:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6de:	8b 45 08             	mov    0x8(%ebp),%eax
 6e1:	83 e8 08             	sub    $0x8,%eax
 6e4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e7:	a1 64 09 00 00       	mov    0x964,%eax
 6ec:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6ef:	eb 24                	jmp    715 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f4:	8b 00                	mov    (%eax),%eax
 6f6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f9:	77 12                	ja     70d <free+0x35>
 6fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fe:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 701:	77 24                	ja     727 <free+0x4f>
 703:	8b 45 fc             	mov    -0x4(%ebp),%eax
 706:	8b 00                	mov    (%eax),%eax
 708:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 70b:	77 1a                	ja     727 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 70d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 710:	8b 00                	mov    (%eax),%eax
 712:	89 45 fc             	mov    %eax,-0x4(%ebp)
 715:	8b 45 f8             	mov    -0x8(%ebp),%eax
 718:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 71b:	76 d4                	jbe    6f1 <free+0x19>
 71d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 720:	8b 00                	mov    (%eax),%eax
 722:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 725:	76 ca                	jbe    6f1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 727:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72a:	8b 40 04             	mov    0x4(%eax),%eax
 72d:	c1 e0 03             	shl    $0x3,%eax
 730:	89 c2                	mov    %eax,%edx
 732:	03 55 f8             	add    -0x8(%ebp),%edx
 735:	8b 45 fc             	mov    -0x4(%ebp),%eax
 738:	8b 00                	mov    (%eax),%eax
 73a:	39 c2                	cmp    %eax,%edx
 73c:	75 24                	jne    762 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 73e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 741:	8b 50 04             	mov    0x4(%eax),%edx
 744:	8b 45 fc             	mov    -0x4(%ebp),%eax
 747:	8b 00                	mov    (%eax),%eax
 749:	8b 40 04             	mov    0x4(%eax),%eax
 74c:	01 c2                	add    %eax,%edx
 74e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 751:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 754:	8b 45 fc             	mov    -0x4(%ebp),%eax
 757:	8b 00                	mov    (%eax),%eax
 759:	8b 10                	mov    (%eax),%edx
 75b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75e:	89 10                	mov    %edx,(%eax)
 760:	eb 0a                	jmp    76c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 762:	8b 45 fc             	mov    -0x4(%ebp),%eax
 765:	8b 10                	mov    (%eax),%edx
 767:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 76c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76f:	8b 40 04             	mov    0x4(%eax),%eax
 772:	c1 e0 03             	shl    $0x3,%eax
 775:	03 45 fc             	add    -0x4(%ebp),%eax
 778:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 77b:	75 20                	jne    79d <free+0xc5>
    p->s.size += bp->s.size;
 77d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 780:	8b 50 04             	mov    0x4(%eax),%edx
 783:	8b 45 f8             	mov    -0x8(%ebp),%eax
 786:	8b 40 04             	mov    0x4(%eax),%eax
 789:	01 c2                	add    %eax,%edx
 78b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 791:	8b 45 f8             	mov    -0x8(%ebp),%eax
 794:	8b 10                	mov    (%eax),%edx
 796:	8b 45 fc             	mov    -0x4(%ebp),%eax
 799:	89 10                	mov    %edx,(%eax)
 79b:	eb 08                	jmp    7a5 <free+0xcd>
  } else
    p->s.ptr = bp;
 79d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7a3:	89 10                	mov    %edx,(%eax)
  freep = p;
 7a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a8:	a3 64 09 00 00       	mov    %eax,0x964
}
 7ad:	c9                   	leave  
 7ae:	c3                   	ret    

000007af <morecore>:

static Header*
morecore(uint nu)
{
 7af:	55                   	push   %ebp
 7b0:	89 e5                	mov    %esp,%ebp
 7b2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7b5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7bc:	77 07                	ja     7c5 <morecore+0x16>
    nu = 4096;
 7be:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7c5:	8b 45 08             	mov    0x8(%ebp),%eax
 7c8:	c1 e0 03             	shl    $0x3,%eax
 7cb:	89 04 24             	mov    %eax,(%esp)
 7ce:	e8 4d fc ff ff       	call   420 <sbrk>
 7d3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 7d6:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 7da:	75 07                	jne    7e3 <morecore+0x34>
    return 0;
 7dc:	b8 00 00 00 00       	mov    $0x0,%eax
 7e1:	eb 22                	jmp    805 <morecore+0x56>
  hp = (Header*)p;
 7e3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 7e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ec:	8b 55 08             	mov    0x8(%ebp),%edx
 7ef:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f5:	83 c0 08             	add    $0x8,%eax
 7f8:	89 04 24             	mov    %eax,(%esp)
 7fb:	e8 d8 fe ff ff       	call   6d8 <free>
  return freep;
 800:	a1 64 09 00 00       	mov    0x964,%eax
}
 805:	c9                   	leave  
 806:	c3                   	ret    

00000807 <malloc>:

void*
malloc(uint nbytes)
{
 807:	55                   	push   %ebp
 808:	89 e5                	mov    %esp,%ebp
 80a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 80d:	8b 45 08             	mov    0x8(%ebp),%eax
 810:	83 c0 07             	add    $0x7,%eax
 813:	c1 e8 03             	shr    $0x3,%eax
 816:	83 c0 01             	add    $0x1,%eax
 819:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 81c:	a1 64 09 00 00       	mov    0x964,%eax
 821:	89 45 f0             	mov    %eax,-0x10(%ebp)
 824:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 828:	75 23                	jne    84d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 82a:	c7 45 f0 5c 09 00 00 	movl   $0x95c,-0x10(%ebp)
 831:	8b 45 f0             	mov    -0x10(%ebp),%eax
 834:	a3 64 09 00 00       	mov    %eax,0x964
 839:	a1 64 09 00 00       	mov    0x964,%eax
 83e:	a3 5c 09 00 00       	mov    %eax,0x95c
    base.s.size = 0;
 843:	c7 05 60 09 00 00 00 	movl   $0x0,0x960
 84a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 84d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 850:	8b 00                	mov    (%eax),%eax
 852:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 855:	8b 45 ec             	mov    -0x14(%ebp),%eax
 858:	8b 40 04             	mov    0x4(%eax),%eax
 85b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 85e:	72 4d                	jb     8ad <malloc+0xa6>
      if(p->s.size == nunits)
 860:	8b 45 ec             	mov    -0x14(%ebp),%eax
 863:	8b 40 04             	mov    0x4(%eax),%eax
 866:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 869:	75 0c                	jne    877 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 86b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 86e:	8b 10                	mov    (%eax),%edx
 870:	8b 45 f0             	mov    -0x10(%ebp),%eax
 873:	89 10                	mov    %edx,(%eax)
 875:	eb 26                	jmp    89d <malloc+0x96>
      else {
        p->s.size -= nunits;
 877:	8b 45 ec             	mov    -0x14(%ebp),%eax
 87a:	8b 40 04             	mov    0x4(%eax),%eax
 87d:	89 c2                	mov    %eax,%edx
 87f:	2b 55 f4             	sub    -0xc(%ebp),%edx
 882:	8b 45 ec             	mov    -0x14(%ebp),%eax
 885:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 888:	8b 45 ec             	mov    -0x14(%ebp),%eax
 88b:	8b 40 04             	mov    0x4(%eax),%eax
 88e:	c1 e0 03             	shl    $0x3,%eax
 891:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 894:	8b 45 ec             	mov    -0x14(%ebp),%eax
 897:	8b 55 f4             	mov    -0xc(%ebp),%edx
 89a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 89d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a0:	a3 64 09 00 00       	mov    %eax,0x964
      return (void*)(p + 1);
 8a5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8a8:	83 c0 08             	add    $0x8,%eax
 8ab:	eb 38                	jmp    8e5 <malloc+0xde>
    }
    if(p == freep)
 8ad:	a1 64 09 00 00       	mov    0x964,%eax
 8b2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 8b5:	75 1b                	jne    8d2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ba:	89 04 24             	mov    %eax,(%esp)
 8bd:	e8 ed fe ff ff       	call   7af <morecore>
 8c2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8c5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8c9:	75 07                	jne    8d2 <malloc+0xcb>
        return 0;
 8cb:	b8 00 00 00 00       	mov    $0x0,%eax
 8d0:	eb 13                	jmp    8e5 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8db:	8b 00                	mov    (%eax),%eax
 8dd:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8e0:	e9 70 ff ff ff       	jmp    855 <malloc+0x4e>
}
 8e5:	c9                   	leave  
 8e6:	c3                   	ret    
