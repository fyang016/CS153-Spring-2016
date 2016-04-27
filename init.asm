
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
  11:	c7 04 24 00 0a 00 00 	movl   $0xa00,(%esp)
  18:	e8 9f 03 00 00       	call   3bc <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 00 0a 00 00 	movl   $0xa00,(%esp)
  38:	e8 87 03 00 00       	call   3c4 <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 00 0a 00 00 	movl   $0xa00,(%esp)
  4c:	e8 6b 03 00 00       	call   3bc <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 97 03 00 00       	call   3f4 <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 8b 03 00 00       	call   3f4 <dup>
  69:	eb 01                	jmp    6c <main+0x6c>
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  }
  6b:	90                   	nop
  }
  dup(0);  // stdout
  dup(0);  // stderr

  for(;;){
    printf(1, "init: starting sh\n");
  6c:	c7 44 24 04 08 0a 00 	movl   $0xa08,0x4(%esp)
  73:	00 
  74:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7b:	e8 85 04 00 00       	call   505 <printf>
    pid = fork();
  80:	e8 ef 02 00 00       	call   374 <fork>
  85:	89 44 24 18          	mov    %eax,0x18(%esp)
    if(pid < 0){
  89:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  8e:	79 19                	jns    a9 <main+0xa9>
      printf(1, "init: fork failed\n");
  90:	c7 44 24 04 1b 0a 00 	movl   $0xa1b,0x4(%esp)
  97:	00 
  98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9f:	e8 61 04 00 00       	call   505 <printf>
      exit();
  a4:	e8 d3 02 00 00       	call   37c <exit>
    }
    if(pid == 0){
  a9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  ae:	75 43                	jne    f3 <main+0xf3>
      exec("sh", argv);
  b0:	c7 44 24 04 80 0a 00 	movl   $0xa80,0x4(%esp)
  b7:	00 
  b8:	c7 04 24 fd 09 00 00 	movl   $0x9fd,(%esp)
  bf:	e8 f0 02 00 00       	call   3b4 <exec>
      printf(1, "init: exec sh failed\n");
  c4:	c7 44 24 04 2e 0a 00 	movl   $0xa2e,0x4(%esp)
  cb:	00 
  cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d3:	e8 2d 04 00 00       	call   505 <printf>
      exit();
  d8:	e8 9f 02 00 00       	call   37c <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  dd:	c7 44 24 04 44 0a 00 	movl   $0xa44,0x4(%esp)
  e4:	00 
  e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ec:	e8 14 04 00 00       	call   505 <printf>
  f1:	eb 01                	jmp    f4 <main+0xf4>
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  f3:	90                   	nop
  f4:	e8 8b 02 00 00       	call   384 <wait>
  f9:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  fd:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 102:	0f 88 63 ff ff ff    	js     6b <main+0x6b>
 108:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 10c:	3b 44 24 18          	cmp    0x18(%esp),%eax
 110:	75 cb                	jne    dd <main+0xdd>
      printf(1, "zombie!\n");
  }
 112:	e9 55 ff ff ff       	jmp    6c <main+0x6c>
 117:	90                   	nop

00000118 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 118:	55                   	push   %ebp
 119:	89 e5                	mov    %esp,%ebp
 11b:	57                   	push   %edi
 11c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 11d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 120:	8b 55 10             	mov    0x10(%ebp),%edx
 123:	8b 45 0c             	mov    0xc(%ebp),%eax
 126:	89 cb                	mov    %ecx,%ebx
 128:	89 df                	mov    %ebx,%edi
 12a:	89 d1                	mov    %edx,%ecx
 12c:	fc                   	cld    
 12d:	f3 aa                	rep stos %al,%es:(%edi)
 12f:	89 ca                	mov    %ecx,%edx
 131:	89 fb                	mov    %edi,%ebx
 133:	89 5d 08             	mov    %ebx,0x8(%ebp)
 136:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 139:	5b                   	pop    %ebx
 13a:	5f                   	pop    %edi
 13b:	5d                   	pop    %ebp
 13c:	c3                   	ret    

0000013d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 13d:	55                   	push   %ebp
 13e:	89 e5                	mov    %esp,%ebp
 140:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 143:	8b 45 08             	mov    0x8(%ebp),%eax
 146:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 149:	8b 45 0c             	mov    0xc(%ebp),%eax
 14c:	0f b6 10             	movzbl (%eax),%edx
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
 152:	88 10                	mov    %dl,(%eax)
 154:	8b 45 08             	mov    0x8(%ebp),%eax
 157:	0f b6 00             	movzbl (%eax),%eax
 15a:	84 c0                	test   %al,%al
 15c:	0f 95 c0             	setne  %al
 15f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 163:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 167:	84 c0                	test   %al,%al
 169:	75 de                	jne    149 <strcpy+0xc>
    ;
  return os;
 16b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 16e:	c9                   	leave  
 16f:	c3                   	ret    

00000170 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 173:	eb 08                	jmp    17d <strcmp+0xd>
    p++, q++;
 175:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 179:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 17d:	8b 45 08             	mov    0x8(%ebp),%eax
 180:	0f b6 00             	movzbl (%eax),%eax
 183:	84 c0                	test   %al,%al
 185:	74 10                	je     197 <strcmp+0x27>
 187:	8b 45 08             	mov    0x8(%ebp),%eax
 18a:	0f b6 10             	movzbl (%eax),%edx
 18d:	8b 45 0c             	mov    0xc(%ebp),%eax
 190:	0f b6 00             	movzbl (%eax),%eax
 193:	38 c2                	cmp    %al,%dl
 195:	74 de                	je     175 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 197:	8b 45 08             	mov    0x8(%ebp),%eax
 19a:	0f b6 00             	movzbl (%eax),%eax
 19d:	0f b6 d0             	movzbl %al,%edx
 1a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a3:	0f b6 00             	movzbl (%eax),%eax
 1a6:	0f b6 c0             	movzbl %al,%eax
 1a9:	89 d1                	mov    %edx,%ecx
 1ab:	29 c1                	sub    %eax,%ecx
 1ad:	89 c8                	mov    %ecx,%eax
}
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    

000001b1 <strlen>:

uint
strlen(char *s)
{
 1b1:	55                   	push   %ebp
 1b2:	89 e5                	mov    %esp,%ebp
 1b4:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1be:	eb 04                	jmp    1c4 <strlen+0x13>
 1c0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1c4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1c7:	03 45 08             	add    0x8(%ebp),%eax
 1ca:	0f b6 00             	movzbl (%eax),%eax
 1cd:	84 c0                	test   %al,%al
 1cf:	75 ef                	jne    1c0 <strlen+0xf>
    ;
  return n;
 1d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1d4:	c9                   	leave  
 1d5:	c3                   	ret    

000001d6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d6:	55                   	push   %ebp
 1d7:	89 e5                	mov    %esp,%ebp
 1d9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1dc:	8b 45 10             	mov    0x10(%ebp),%eax
 1df:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ea:	8b 45 08             	mov    0x8(%ebp),%eax
 1ed:	89 04 24             	mov    %eax,(%esp)
 1f0:	e8 23 ff ff ff       	call   118 <stosb>
  return dst;
 1f5:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f8:	c9                   	leave  
 1f9:	c3                   	ret    

000001fa <strchr>:

char*
strchr(const char *s, char c)
{
 1fa:	55                   	push   %ebp
 1fb:	89 e5                	mov    %esp,%ebp
 1fd:	83 ec 04             	sub    $0x4,%esp
 200:	8b 45 0c             	mov    0xc(%ebp),%eax
 203:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 206:	eb 14                	jmp    21c <strchr+0x22>
    if(*s == c)
 208:	8b 45 08             	mov    0x8(%ebp),%eax
 20b:	0f b6 00             	movzbl (%eax),%eax
 20e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 211:	75 05                	jne    218 <strchr+0x1e>
      return (char*)s;
 213:	8b 45 08             	mov    0x8(%ebp),%eax
 216:	eb 13                	jmp    22b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 218:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21c:	8b 45 08             	mov    0x8(%ebp),%eax
 21f:	0f b6 00             	movzbl (%eax),%eax
 222:	84 c0                	test   %al,%al
 224:	75 e2                	jne    208 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 226:	b8 00 00 00 00       	mov    $0x0,%eax
}
 22b:	c9                   	leave  
 22c:	c3                   	ret    

0000022d <gets>:

char*
gets(char *buf, int max)
{
 22d:	55                   	push   %ebp
 22e:	89 e5                	mov    %esp,%ebp
 230:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 233:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 23a:	eb 44                	jmp    280 <gets+0x53>
    cc = read(0, &c, 1);
 23c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 243:	00 
 244:	8d 45 ef             	lea    -0x11(%ebp),%eax
 247:	89 44 24 04          	mov    %eax,0x4(%esp)
 24b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 252:	e8 3d 01 00 00       	call   394 <read>
 257:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 25a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 25e:	7e 2d                	jle    28d <gets+0x60>
      break;
    buf[i++] = c;
 260:	8b 45 f0             	mov    -0x10(%ebp),%eax
 263:	03 45 08             	add    0x8(%ebp),%eax
 266:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 26a:	88 10                	mov    %dl,(%eax)
 26c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 270:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 274:	3c 0a                	cmp    $0xa,%al
 276:	74 16                	je     28e <gets+0x61>
 278:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27c:	3c 0d                	cmp    $0xd,%al
 27e:	74 0e                	je     28e <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 280:	8b 45 f0             	mov    -0x10(%ebp),%eax
 283:	83 c0 01             	add    $0x1,%eax
 286:	3b 45 0c             	cmp    0xc(%ebp),%eax
 289:	7c b1                	jl     23c <gets+0xf>
 28b:	eb 01                	jmp    28e <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 28d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 28e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 291:	03 45 08             	add    0x8(%ebp),%eax
 294:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 297:	8b 45 08             	mov    0x8(%ebp),%eax
}
 29a:	c9                   	leave  
 29b:	c3                   	ret    

0000029c <stat>:

int
stat(char *n, struct stat *st)
{
 29c:	55                   	push   %ebp
 29d:	89 e5                	mov    %esp,%ebp
 29f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2a2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a9:	00 
 2aa:	8b 45 08             	mov    0x8(%ebp),%eax
 2ad:	89 04 24             	mov    %eax,(%esp)
 2b0:	e8 07 01 00 00       	call   3bc <open>
 2b5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 2b8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2bc:	79 07                	jns    2c5 <stat+0x29>
    return -1;
 2be:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2c3:	eb 23                	jmp    2e8 <stat+0x4c>
  r = fstat(fd, st);
 2c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 2cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2cf:	89 04 24             	mov    %eax,(%esp)
 2d2:	e8 fd 00 00 00       	call   3d4 <fstat>
 2d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 2da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2dd:	89 04 24             	mov    %eax,(%esp)
 2e0:	e8 bf 00 00 00       	call   3a4 <close>
  return r;
 2e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 2e8:	c9                   	leave  
 2e9:	c3                   	ret    

000002ea <atoi>:

int
atoi(const char *s)
{
 2ea:	55                   	push   %ebp
 2eb:	89 e5                	mov    %esp,%ebp
 2ed:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2f0:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f7:	eb 24                	jmp    31d <atoi+0x33>
    n = n*10 + *s++ - '0';
 2f9:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2fc:	89 d0                	mov    %edx,%eax
 2fe:	c1 e0 02             	shl    $0x2,%eax
 301:	01 d0                	add    %edx,%eax
 303:	01 c0                	add    %eax,%eax
 305:	89 c2                	mov    %eax,%edx
 307:	8b 45 08             	mov    0x8(%ebp),%eax
 30a:	0f b6 00             	movzbl (%eax),%eax
 30d:	0f be c0             	movsbl %al,%eax
 310:	8d 04 02             	lea    (%edx,%eax,1),%eax
 313:	83 e8 30             	sub    $0x30,%eax
 316:	89 45 fc             	mov    %eax,-0x4(%ebp)
 319:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 31d:	8b 45 08             	mov    0x8(%ebp),%eax
 320:	0f b6 00             	movzbl (%eax),%eax
 323:	3c 2f                	cmp    $0x2f,%al
 325:	7e 0a                	jle    331 <atoi+0x47>
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	0f b6 00             	movzbl (%eax),%eax
 32d:	3c 39                	cmp    $0x39,%al
 32f:	7e c8                	jle    2f9 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 331:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 334:	c9                   	leave  
 335:	c3                   	ret    

00000336 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
 33f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 342:	8b 45 0c             	mov    0xc(%ebp),%eax
 345:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 348:	eb 13                	jmp    35d <memmove+0x27>
    *dst++ = *src++;
 34a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 34d:	0f b6 10             	movzbl (%eax),%edx
 350:	8b 45 f8             	mov    -0x8(%ebp),%eax
 353:	88 10                	mov    %dl,(%eax)
 355:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 359:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 361:	0f 9f c0             	setg   %al
 364:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 368:	84 c0                	test   %al,%al
 36a:	75 de                	jne    34a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 36c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36f:	c9                   	leave  
 370:	c3                   	ret    
 371:	90                   	nop
 372:	90                   	nop
 373:	90                   	nop

00000374 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 374:	b8 01 00 00 00       	mov    $0x1,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <exit>:
SYSCALL(exit)
 37c:	b8 02 00 00 00       	mov    $0x2,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <wait>:
SYSCALL(wait)
 384:	b8 03 00 00 00       	mov    $0x3,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <pipe>:
SYSCALL(pipe)
 38c:	b8 04 00 00 00       	mov    $0x4,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <read>:
SYSCALL(read)
 394:	b8 05 00 00 00       	mov    $0x5,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <write>:
SYSCALL(write)
 39c:	b8 10 00 00 00       	mov    $0x10,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <close>:
SYSCALL(close)
 3a4:	b8 15 00 00 00       	mov    $0x15,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <kill>:
SYSCALL(kill)
 3ac:	b8 06 00 00 00       	mov    $0x6,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <exec>:
SYSCALL(exec)
 3b4:	b8 07 00 00 00       	mov    $0x7,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <open>:
SYSCALL(open)
 3bc:	b8 0f 00 00 00       	mov    $0xf,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <mknod>:
SYSCALL(mknod)
 3c4:	b8 11 00 00 00       	mov    $0x11,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <unlink>:
SYSCALL(unlink)
 3cc:	b8 12 00 00 00       	mov    $0x12,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <fstat>:
SYSCALL(fstat)
 3d4:	b8 08 00 00 00       	mov    $0x8,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <link>:
SYSCALL(link)
 3dc:	b8 13 00 00 00       	mov    $0x13,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <mkdir>:
SYSCALL(mkdir)
 3e4:	b8 14 00 00 00       	mov    $0x14,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <chdir>:
SYSCALL(chdir)
 3ec:	b8 09 00 00 00       	mov    $0x9,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <dup>:
SYSCALL(dup)
 3f4:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <getpid>:
SYSCALL(getpid)
 3fc:	b8 0b 00 00 00       	mov    $0xb,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <sbrk>:
SYSCALL(sbrk)
 404:	b8 0c 00 00 00       	mov    $0xc,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <sleep>:
SYSCALL(sleep)
 40c:	b8 0d 00 00 00       	mov    $0xd,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <uptime>:
SYSCALL(uptime)
 414:	b8 0e 00 00 00       	mov    $0xe,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <clone>:
SYSCALL(clone)
 41c:	b8 16 00 00 00       	mov    $0x16,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <texit>:
SYSCALL(texit)
 424:	b8 17 00 00 00       	mov    $0x17,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 42c:	55                   	push   %ebp
 42d:	89 e5                	mov    %esp,%ebp
 42f:	83 ec 28             	sub    $0x28,%esp
 432:	8b 45 0c             	mov    0xc(%ebp),%eax
 435:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 438:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 43f:	00 
 440:	8d 45 f4             	lea    -0xc(%ebp),%eax
 443:	89 44 24 04          	mov    %eax,0x4(%esp)
 447:	8b 45 08             	mov    0x8(%ebp),%eax
 44a:	89 04 24             	mov    %eax,(%esp)
 44d:	e8 4a ff ff ff       	call   39c <write>
}
 452:	c9                   	leave  
 453:	c3                   	ret    

00000454 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	53                   	push   %ebx
 458:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 45b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 462:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 466:	74 17                	je     47f <printint+0x2b>
 468:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 46c:	79 11                	jns    47f <printint+0x2b>
    neg = 1;
 46e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 475:	8b 45 0c             	mov    0xc(%ebp),%eax
 478:	f7 d8                	neg    %eax
 47a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 47d:	eb 06                	jmp    485 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 47f:	8b 45 0c             	mov    0xc(%ebp),%eax
 482:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 485:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 48c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 48f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 492:	8b 45 f4             	mov    -0xc(%ebp),%eax
 495:	ba 00 00 00 00       	mov    $0x0,%edx
 49a:	f7 f3                	div    %ebx
 49c:	89 d0                	mov    %edx,%eax
 49e:	0f b6 80 88 0a 00 00 	movzbl 0xa88(%eax),%eax
 4a5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 4a9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 4ad:	8b 45 10             	mov    0x10(%ebp),%eax
 4b0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b6:	ba 00 00 00 00       	mov    $0x0,%edx
 4bb:	f7 75 d4             	divl   -0x2c(%ebp)
 4be:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4c5:	75 c5                	jne    48c <printint+0x38>
  if(neg)
 4c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4cb:	74 28                	je     4f5 <printint+0xa1>
    buf[i++] = '-';
 4cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4d0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4d5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 4d9:	eb 1a                	jmp    4f5 <printint+0xa1>
    putc(fd, buf[i]);
 4db:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4de:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 4e3:	0f be c0             	movsbl %al,%eax
 4e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ea:	8b 45 08             	mov    0x8(%ebp),%eax
 4ed:	89 04 24             	mov    %eax,(%esp)
 4f0:	e8 37 ff ff ff       	call   42c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4f5:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 4f9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4fd:	79 dc                	jns    4db <printint+0x87>
    putc(fd, buf[i]);
}
 4ff:	83 c4 44             	add    $0x44,%esp
 502:	5b                   	pop    %ebx
 503:	5d                   	pop    %ebp
 504:	c3                   	ret    

00000505 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 505:	55                   	push   %ebp
 506:	89 e5                	mov    %esp,%ebp
 508:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 50b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 512:	8d 45 0c             	lea    0xc(%ebp),%eax
 515:	83 c0 04             	add    $0x4,%eax
 518:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 51b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 522:	e9 7e 01 00 00       	jmp    6a5 <printf+0x1a0>
    c = fmt[i] & 0xff;
 527:	8b 55 0c             	mov    0xc(%ebp),%edx
 52a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 52d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 530:	0f b6 00             	movzbl (%eax),%eax
 533:	0f be c0             	movsbl %al,%eax
 536:	25 ff 00 00 00       	and    $0xff,%eax
 53b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 53e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 542:	75 2c                	jne    570 <printf+0x6b>
      if(c == '%'){
 544:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 548:	75 0c                	jne    556 <printf+0x51>
        state = '%';
 54a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 551:	e9 4b 01 00 00       	jmp    6a1 <printf+0x19c>
      } else {
        putc(fd, c);
 556:	8b 45 e8             	mov    -0x18(%ebp),%eax
 559:	0f be c0             	movsbl %al,%eax
 55c:	89 44 24 04          	mov    %eax,0x4(%esp)
 560:	8b 45 08             	mov    0x8(%ebp),%eax
 563:	89 04 24             	mov    %eax,(%esp)
 566:	e8 c1 fe ff ff       	call   42c <putc>
 56b:	e9 31 01 00 00       	jmp    6a1 <printf+0x19c>
      }
    } else if(state == '%'){
 570:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 574:	0f 85 27 01 00 00    	jne    6a1 <printf+0x19c>
      if(c == 'd'){
 57a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 57e:	75 2d                	jne    5ad <printf+0xa8>
        printint(fd, *ap, 10, 1);
 580:	8b 45 f4             	mov    -0xc(%ebp),%eax
 583:	8b 00                	mov    (%eax),%eax
 585:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 58c:	00 
 58d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 594:	00 
 595:	89 44 24 04          	mov    %eax,0x4(%esp)
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	89 04 24             	mov    %eax,(%esp)
 59f:	e8 b0 fe ff ff       	call   454 <printint>
        ap++;
 5a4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5a8:	e9 ed 00 00 00       	jmp    69a <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 5ad:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 5b1:	74 06                	je     5b9 <printf+0xb4>
 5b3:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 5b7:	75 2d                	jne    5e6 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 5b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5bc:	8b 00                	mov    (%eax),%eax
 5be:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5c5:	00 
 5c6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5cd:	00 
 5ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d2:	8b 45 08             	mov    0x8(%ebp),%eax
 5d5:	89 04 24             	mov    %eax,(%esp)
 5d8:	e8 77 fe ff ff       	call   454 <printint>
        ap++;
 5dd:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5e1:	e9 b4 00 00 00       	jmp    69a <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5e6:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 5ea:	75 46                	jne    632 <printf+0x12d>
        s = (char*)*ap;
 5ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ef:	8b 00                	mov    (%eax),%eax
 5f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 5f4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 5f8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 5fc:	75 27                	jne    625 <printf+0x120>
          s = "(null)";
 5fe:	c7 45 e4 4d 0a 00 00 	movl   $0xa4d,-0x1c(%ebp)
        while(*s != 0){
 605:	eb 1f                	jmp    626 <printf+0x121>
          putc(fd, *s);
 607:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 60a:	0f b6 00             	movzbl (%eax),%eax
 60d:	0f be c0             	movsbl %al,%eax
 610:	89 44 24 04          	mov    %eax,0x4(%esp)
 614:	8b 45 08             	mov    0x8(%ebp),%eax
 617:	89 04 24             	mov    %eax,(%esp)
 61a:	e8 0d fe ff ff       	call   42c <putc>
          s++;
 61f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 623:	eb 01                	jmp    626 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 625:	90                   	nop
 626:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 629:	0f b6 00             	movzbl (%eax),%eax
 62c:	84 c0                	test   %al,%al
 62e:	75 d7                	jne    607 <printf+0x102>
 630:	eb 68                	jmp    69a <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 632:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 636:	75 1d                	jne    655 <printf+0x150>
        putc(fd, *ap);
 638:	8b 45 f4             	mov    -0xc(%ebp),%eax
 63b:	8b 00                	mov    (%eax),%eax
 63d:	0f be c0             	movsbl %al,%eax
 640:	89 44 24 04          	mov    %eax,0x4(%esp)
 644:	8b 45 08             	mov    0x8(%ebp),%eax
 647:	89 04 24             	mov    %eax,(%esp)
 64a:	e8 dd fd ff ff       	call   42c <putc>
        ap++;
 64f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 653:	eb 45                	jmp    69a <printf+0x195>
      } else if(c == '%'){
 655:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 659:	75 17                	jne    672 <printf+0x16d>
        putc(fd, c);
 65b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 65e:	0f be c0             	movsbl %al,%eax
 661:	89 44 24 04          	mov    %eax,0x4(%esp)
 665:	8b 45 08             	mov    0x8(%ebp),%eax
 668:	89 04 24             	mov    %eax,(%esp)
 66b:	e8 bc fd ff ff       	call   42c <putc>
 670:	eb 28                	jmp    69a <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 672:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 679:	00 
 67a:	8b 45 08             	mov    0x8(%ebp),%eax
 67d:	89 04 24             	mov    %eax,(%esp)
 680:	e8 a7 fd ff ff       	call   42c <putc>
        putc(fd, c);
 685:	8b 45 e8             	mov    -0x18(%ebp),%eax
 688:	0f be c0             	movsbl %al,%eax
 68b:	89 44 24 04          	mov    %eax,0x4(%esp)
 68f:	8b 45 08             	mov    0x8(%ebp),%eax
 692:	89 04 24             	mov    %eax,(%esp)
 695:	e8 92 fd ff ff       	call   42c <putc>
      }
      state = 0;
 69a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6a1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 6a5:	8b 55 0c             	mov    0xc(%ebp),%edx
 6a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6ab:	8d 04 02             	lea    (%edx,%eax,1),%eax
 6ae:	0f b6 00             	movzbl (%eax),%eax
 6b1:	84 c0                	test   %al,%al
 6b3:	0f 85 6e fe ff ff    	jne    527 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6b9:	c9                   	leave  
 6ba:	c3                   	ret    
 6bb:	90                   	nop

000006bc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6bc:	55                   	push   %ebp
 6bd:	89 e5                	mov    %esp,%ebp
 6bf:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6c2:	8b 45 08             	mov    0x8(%ebp),%eax
 6c5:	83 e8 08             	sub    $0x8,%eax
 6c8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6cb:	a1 a4 0a 00 00       	mov    0xaa4,%eax
 6d0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6d3:	eb 24                	jmp    6f9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d8:	8b 00                	mov    (%eax),%eax
 6da:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6dd:	77 12                	ja     6f1 <free+0x35>
 6df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e5:	77 24                	ja     70b <free+0x4f>
 6e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ea:	8b 00                	mov    (%eax),%eax
 6ec:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ef:	77 1a                	ja     70b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f4:	8b 00                	mov    (%eax),%eax
 6f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ff:	76 d4                	jbe    6d5 <free+0x19>
 701:	8b 45 fc             	mov    -0x4(%ebp),%eax
 704:	8b 00                	mov    (%eax),%eax
 706:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 709:	76 ca                	jbe    6d5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 70b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70e:	8b 40 04             	mov    0x4(%eax),%eax
 711:	c1 e0 03             	shl    $0x3,%eax
 714:	89 c2                	mov    %eax,%edx
 716:	03 55 f8             	add    -0x8(%ebp),%edx
 719:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71c:	8b 00                	mov    (%eax),%eax
 71e:	39 c2                	cmp    %eax,%edx
 720:	75 24                	jne    746 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 722:	8b 45 f8             	mov    -0x8(%ebp),%eax
 725:	8b 50 04             	mov    0x4(%eax),%edx
 728:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72b:	8b 00                	mov    (%eax),%eax
 72d:	8b 40 04             	mov    0x4(%eax),%eax
 730:	01 c2                	add    %eax,%edx
 732:	8b 45 f8             	mov    -0x8(%ebp),%eax
 735:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 738:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73b:	8b 00                	mov    (%eax),%eax
 73d:	8b 10                	mov    (%eax),%edx
 73f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 742:	89 10                	mov    %edx,(%eax)
 744:	eb 0a                	jmp    750 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 746:	8b 45 fc             	mov    -0x4(%ebp),%eax
 749:	8b 10                	mov    (%eax),%edx
 74b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 750:	8b 45 fc             	mov    -0x4(%ebp),%eax
 753:	8b 40 04             	mov    0x4(%eax),%eax
 756:	c1 e0 03             	shl    $0x3,%eax
 759:	03 45 fc             	add    -0x4(%ebp),%eax
 75c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 75f:	75 20                	jne    781 <free+0xc5>
    p->s.size += bp->s.size;
 761:	8b 45 fc             	mov    -0x4(%ebp),%eax
 764:	8b 50 04             	mov    0x4(%eax),%edx
 767:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76a:	8b 40 04             	mov    0x4(%eax),%eax
 76d:	01 c2                	add    %eax,%edx
 76f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 772:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 775:	8b 45 f8             	mov    -0x8(%ebp),%eax
 778:	8b 10                	mov    (%eax),%edx
 77a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77d:	89 10                	mov    %edx,(%eax)
 77f:	eb 08                	jmp    789 <free+0xcd>
  } else
    p->s.ptr = bp;
 781:	8b 45 fc             	mov    -0x4(%ebp),%eax
 784:	8b 55 f8             	mov    -0x8(%ebp),%edx
 787:	89 10                	mov    %edx,(%eax)
  freep = p;
 789:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78c:	a3 a4 0a 00 00       	mov    %eax,0xaa4
}
 791:	c9                   	leave  
 792:	c3                   	ret    

00000793 <morecore>:

static Header*
morecore(uint nu)
{
 793:	55                   	push   %ebp
 794:	89 e5                	mov    %esp,%ebp
 796:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 799:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7a0:	77 07                	ja     7a9 <morecore+0x16>
    nu = 4096;
 7a2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7a9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ac:	c1 e0 03             	shl    $0x3,%eax
 7af:	89 04 24             	mov    %eax,(%esp)
 7b2:	e8 4d fc ff ff       	call   404 <sbrk>
 7b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 7ba:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 7be:	75 07                	jne    7c7 <morecore+0x34>
    return 0;
 7c0:	b8 00 00 00 00       	mov    $0x0,%eax
 7c5:	eb 22                	jmp    7e9 <morecore+0x56>
  hp = (Header*)p;
 7c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 7cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d0:	8b 55 08             	mov    0x8(%ebp),%edx
 7d3:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d9:	83 c0 08             	add    $0x8,%eax
 7dc:	89 04 24             	mov    %eax,(%esp)
 7df:	e8 d8 fe ff ff       	call   6bc <free>
  return freep;
 7e4:	a1 a4 0a 00 00       	mov    0xaa4,%eax
}
 7e9:	c9                   	leave  
 7ea:	c3                   	ret    

000007eb <malloc>:

void*
malloc(uint nbytes)
{
 7eb:	55                   	push   %ebp
 7ec:	89 e5                	mov    %esp,%ebp
 7ee:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7f1:	8b 45 08             	mov    0x8(%ebp),%eax
 7f4:	83 c0 07             	add    $0x7,%eax
 7f7:	c1 e8 03             	shr    $0x3,%eax
 7fa:	83 c0 01             	add    $0x1,%eax
 7fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 800:	a1 a4 0a 00 00       	mov    0xaa4,%eax
 805:	89 45 f0             	mov    %eax,-0x10(%ebp)
 808:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 80c:	75 23                	jne    831 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 80e:	c7 45 f0 9c 0a 00 00 	movl   $0xa9c,-0x10(%ebp)
 815:	8b 45 f0             	mov    -0x10(%ebp),%eax
 818:	a3 a4 0a 00 00       	mov    %eax,0xaa4
 81d:	a1 a4 0a 00 00       	mov    0xaa4,%eax
 822:	a3 9c 0a 00 00       	mov    %eax,0xa9c
    base.s.size = 0;
 827:	c7 05 a0 0a 00 00 00 	movl   $0x0,0xaa0
 82e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 831:	8b 45 f0             	mov    -0x10(%ebp),%eax
 834:	8b 00                	mov    (%eax),%eax
 836:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 839:	8b 45 ec             	mov    -0x14(%ebp),%eax
 83c:	8b 40 04             	mov    0x4(%eax),%eax
 83f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 842:	72 4d                	jb     891 <malloc+0xa6>
      if(p->s.size == nunits)
 844:	8b 45 ec             	mov    -0x14(%ebp),%eax
 847:	8b 40 04             	mov    0x4(%eax),%eax
 84a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 84d:	75 0c                	jne    85b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 84f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 852:	8b 10                	mov    (%eax),%edx
 854:	8b 45 f0             	mov    -0x10(%ebp),%eax
 857:	89 10                	mov    %edx,(%eax)
 859:	eb 26                	jmp    881 <malloc+0x96>
      else {
        p->s.size -= nunits;
 85b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 85e:	8b 40 04             	mov    0x4(%eax),%eax
 861:	89 c2                	mov    %eax,%edx
 863:	2b 55 f4             	sub    -0xc(%ebp),%edx
 866:	8b 45 ec             	mov    -0x14(%ebp),%eax
 869:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 86c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 86f:	8b 40 04             	mov    0x4(%eax),%eax
 872:	c1 e0 03             	shl    $0x3,%eax
 875:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 878:	8b 45 ec             	mov    -0x14(%ebp),%eax
 87b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 87e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 881:	8b 45 f0             	mov    -0x10(%ebp),%eax
 884:	a3 a4 0a 00 00       	mov    %eax,0xaa4
      return (void*)(p + 1);
 889:	8b 45 ec             	mov    -0x14(%ebp),%eax
 88c:	83 c0 08             	add    $0x8,%eax
 88f:	eb 38                	jmp    8c9 <malloc+0xde>
    }
    if(p == freep)
 891:	a1 a4 0a 00 00       	mov    0xaa4,%eax
 896:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 899:	75 1b                	jne    8b6 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 89b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89e:	89 04 24             	mov    %eax,(%esp)
 8a1:	e8 ed fe ff ff       	call   793 <morecore>
 8a6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8a9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8ad:	75 07                	jne    8b6 <malloc+0xcb>
        return 0;
 8af:	b8 00 00 00 00       	mov    $0x0,%eax
 8b4:	eb 13                	jmp    8c9 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8b9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8bc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8bf:	8b 00                	mov    (%eax),%eax
 8c1:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8c4:	e9 70 ff ff ff       	jmp    839 <malloc+0x4e>
}
 8c9:	c9                   	leave  
 8ca:	c3                   	ret    
 8cb:	90                   	nop

000008cc <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 8cc:	55                   	push   %ebp
 8cd:	89 e5                	mov    %esp,%ebp
 8cf:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8d2:	8b 55 08             	mov    0x8(%ebp),%edx
 8d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 8d8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8db:	f0 87 02             	lock xchg %eax,(%edx)
 8de:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 8e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8e4:	c9                   	leave  
 8e5:	c3                   	ret    

000008e6 <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 8e6:	55                   	push   %ebp
 8e7:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 8e9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ec:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 8f2:	5d                   	pop    %ebp
 8f3:	c3                   	ret    

000008f4 <lock_acquire>:
void lock_acquire(lock_t *lock){
 8f4:	55                   	push   %ebp
 8f5:	89 e5                	mov    %esp,%ebp
 8f7:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 8fa:	8b 45 08             	mov    0x8(%ebp),%eax
 8fd:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 904:	00 
 905:	89 04 24             	mov    %eax,(%esp)
 908:	e8 bf ff ff ff       	call   8cc <xchg>
 90d:	85 c0                	test   %eax,%eax
 90f:	75 e9                	jne    8fa <lock_acquire+0x6>
}
 911:	c9                   	leave  
 912:	c3                   	ret    

00000913 <lock_release>:
void lock_release(lock_t *lock){
 913:	55                   	push   %ebp
 914:	89 e5                	mov    %esp,%ebp
 916:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 919:	8b 45 08             	mov    0x8(%ebp),%eax
 91c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 923:	00 
 924:	89 04 24             	mov    %eax,(%esp)
 927:	e8 a0 ff ff ff       	call   8cc <xchg>
}
 92c:	c9                   	leave  
 92d:	c3                   	ret    

0000092e <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 92e:	55                   	push   %ebp
 92f:	89 e5                	mov    %esp,%ebp
 931:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 934:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 93b:	e8 ab fe ff ff       	call   7eb <malloc>
 940:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 943:	8b 45 f0             	mov    -0x10(%ebp),%eax
 946:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 949:	8b 45 f0             	mov    -0x10(%ebp),%eax
 94c:	25 ff 0f 00 00       	and    $0xfff,%eax
 951:	85 c0                	test   %eax,%eax
 953:	74 15                	je     96a <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 955:	8b 45 f0             	mov    -0x10(%ebp),%eax
 958:	89 c2                	mov    %eax,%edx
 95a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 960:	b8 00 10 00 00       	mov    $0x1000,%eax
 965:	29 d0                	sub    %edx,%eax
 967:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 96a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 96e:	75 1b                	jne    98b <thread_create+0x5d>

        printf(1,"malloc fail \n");
 970:	c7 44 24 04 54 0a 00 	movl   $0xa54,0x4(%esp)
 977:	00 
 978:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 97f:	e8 81 fb ff ff       	call   505 <printf>
        return 0;
 984:	b8 00 00 00 00       	mov    $0x0,%eax
 989:	eb 70                	jmp    9fb <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 98b:	8b 55 08             	mov    0x8(%ebp),%edx
 98e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 991:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 998:	00 
 999:	89 54 24 08          	mov    %edx,0x8(%esp)
 99d:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 9a4:	00 
 9a5:	89 04 24             	mov    %eax,(%esp)
 9a8:	e8 6f fa ff ff       	call   41c <clone>
 9ad:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 9b0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9b4:	79 1b                	jns    9d1 <thread_create+0xa3>
        printf(1,"clone fails\n");
 9b6:	c7 44 24 04 62 0a 00 	movl   $0xa62,0x4(%esp)
 9bd:	00 
 9be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9c5:	e8 3b fb ff ff       	call   505 <printf>
        return 0;
 9ca:	b8 00 00 00 00       	mov    $0x0,%eax
 9cf:	eb 2a                	jmp    9fb <thread_create+0xcd>
    }
    if(tid > 0){
 9d1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9d5:	7e 05                	jle    9dc <thread_create+0xae>
        return garbage_stack;
 9d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9da:	eb 1f                	jmp    9fb <thread_create+0xcd>
    }
    if(tid == 0){
 9dc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9e0:	75 14                	jne    9f6 <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 9e2:	c7 44 24 04 6f 0a 00 	movl   $0xa6f,0x4(%esp)
 9e9:	00 
 9ea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9f1:	e8 0f fb ff ff       	call   505 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 9f6:	b8 00 00 00 00       	mov    $0x0,%eax
}
 9fb:	c9                   	leave  
 9fc:	c3                   	ret    
