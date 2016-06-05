
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
  11:	c7 04 24 79 0c 00 00 	movl   $0xc79,(%esp)
  18:	e8 9f 03 00 00       	call   3bc <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 79 0c 00 00 	movl   $0xc79,(%esp)
  38:	e8 87 03 00 00       	call   3c4 <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 79 0c 00 00 	movl   $0xc79,(%esp)
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
  6c:	c7 44 24 04 81 0c 00 	movl   $0xc81,0x4(%esp)
  73:	00 
  74:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  7b:	e8 9d 04 00 00       	call   51d <printf>
    pid = fork();
  80:	e8 ef 02 00 00       	call   374 <fork>
  85:	89 44 24 18          	mov    %eax,0x18(%esp)
    if(pid < 0){
  89:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  8e:	79 19                	jns    a9 <main+0xa9>
      printf(1, "init: fork failed\n");
  90:	c7 44 24 04 94 0c 00 	movl   $0xc94,0x4(%esp)
  97:	00 
  98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9f:	e8 79 04 00 00       	call   51d <printf>
      exit();
  a4:	e8 d3 02 00 00       	call   37c <exit>
    }
    if(pid == 0){
  a9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  ae:	75 43                	jne    f3 <main+0xf3>
      exec("sh", argv);
  b0:	c7 44 24 04 10 0d 00 	movl   $0xd10,0x4(%esp)
  b7:	00 
  b8:	c7 04 24 76 0c 00 00 	movl   $0xc76,(%esp)
  bf:	e8 f0 02 00 00       	call   3b4 <exec>
      printf(1, "init: exec sh failed\n");
  c4:	c7 44 24 04 a7 0c 00 	movl   $0xca7,0x4(%esp)
  cb:	00 
  cc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d3:	e8 45 04 00 00       	call   51d <printf>
      exit();
  d8:	e8 9f 02 00 00       	call   37c <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
      printf(1, "zombie!\n");
  dd:	c7 44 24 04 bd 0c 00 	movl   $0xcbd,0x4(%esp)
  e4:	00 
  e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ec:	e8 2c 04 00 00       	call   51d <printf>
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

0000042c <tsleep>:
SYSCALL(tsleep)
 42c:	b8 18 00 00 00       	mov    $0x18,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <twakeup>:
SYSCALL(twakeup)
 434:	b8 19 00 00 00       	mov    $0x19,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <test>:
SYSCALL(test)
 43c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 444:	55                   	push   %ebp
 445:	89 e5                	mov    %esp,%ebp
 447:	83 ec 28             	sub    $0x28,%esp
 44a:	8b 45 0c             	mov    0xc(%ebp),%eax
 44d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 450:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 457:	00 
 458:	8d 45 f4             	lea    -0xc(%ebp),%eax
 45b:	89 44 24 04          	mov    %eax,0x4(%esp)
 45f:	8b 45 08             	mov    0x8(%ebp),%eax
 462:	89 04 24             	mov    %eax,(%esp)
 465:	e8 32 ff ff ff       	call   39c <write>
}
 46a:	c9                   	leave  
 46b:	c3                   	ret    

0000046c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 46c:	55                   	push   %ebp
 46d:	89 e5                	mov    %esp,%ebp
 46f:	53                   	push   %ebx
 470:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 473:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 47a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 47e:	74 17                	je     497 <printint+0x2b>
 480:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 484:	79 11                	jns    497 <printint+0x2b>
    neg = 1;
 486:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 48d:	8b 45 0c             	mov    0xc(%ebp),%eax
 490:	f7 d8                	neg    %eax
 492:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 495:	eb 06                	jmp    49d <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 497:	8b 45 0c             	mov    0xc(%ebp),%eax
 49a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 49d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 4a4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 4a7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ad:	ba 00 00 00 00       	mov    $0x0,%edx
 4b2:	f7 f3                	div    %ebx
 4b4:	89 d0                	mov    %edx,%eax
 4b6:	0f b6 80 18 0d 00 00 	movzbl 0xd18(%eax),%eax
 4bd:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 4c1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 4c5:	8b 45 10             	mov    0x10(%ebp),%eax
 4c8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ce:	ba 00 00 00 00       	mov    $0x0,%edx
 4d3:	f7 75 d4             	divl   -0x2c(%ebp)
 4d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4d9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4dd:	75 c5                	jne    4a4 <printint+0x38>
  if(neg)
 4df:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4e3:	74 28                	je     50d <printint+0xa1>
    buf[i++] = '-';
 4e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4e8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4ed:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 4f1:	eb 1a                	jmp    50d <printint+0xa1>
    putc(fd, buf[i]);
 4f3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4f6:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 4fb:	0f be c0             	movsbl %al,%eax
 4fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 502:	8b 45 08             	mov    0x8(%ebp),%eax
 505:	89 04 24             	mov    %eax,(%esp)
 508:	e8 37 ff ff ff       	call   444 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 50d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 511:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 515:	79 dc                	jns    4f3 <printint+0x87>
    putc(fd, buf[i]);
}
 517:	83 c4 44             	add    $0x44,%esp
 51a:	5b                   	pop    %ebx
 51b:	5d                   	pop    %ebp
 51c:	c3                   	ret    

0000051d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 51d:	55                   	push   %ebp
 51e:	89 e5                	mov    %esp,%ebp
 520:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 523:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 52a:	8d 45 0c             	lea    0xc(%ebp),%eax
 52d:	83 c0 04             	add    $0x4,%eax
 530:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 533:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 53a:	e9 7e 01 00 00       	jmp    6bd <printf+0x1a0>
    c = fmt[i] & 0xff;
 53f:	8b 55 0c             	mov    0xc(%ebp),%edx
 542:	8b 45 ec             	mov    -0x14(%ebp),%eax
 545:	8d 04 02             	lea    (%edx,%eax,1),%eax
 548:	0f b6 00             	movzbl (%eax),%eax
 54b:	0f be c0             	movsbl %al,%eax
 54e:	25 ff 00 00 00       	and    $0xff,%eax
 553:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 556:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 55a:	75 2c                	jne    588 <printf+0x6b>
      if(c == '%'){
 55c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 560:	75 0c                	jne    56e <printf+0x51>
        state = '%';
 562:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 569:	e9 4b 01 00 00       	jmp    6b9 <printf+0x19c>
      } else {
        putc(fd, c);
 56e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 571:	0f be c0             	movsbl %al,%eax
 574:	89 44 24 04          	mov    %eax,0x4(%esp)
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	89 04 24             	mov    %eax,(%esp)
 57e:	e8 c1 fe ff ff       	call   444 <putc>
 583:	e9 31 01 00 00       	jmp    6b9 <printf+0x19c>
      }
    } else if(state == '%'){
 588:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 58c:	0f 85 27 01 00 00    	jne    6b9 <printf+0x19c>
      if(c == 'd'){
 592:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 596:	75 2d                	jne    5c5 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 598:	8b 45 f4             	mov    -0xc(%ebp),%eax
 59b:	8b 00                	mov    (%eax),%eax
 59d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5a4:	00 
 5a5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5ac:	00 
 5ad:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b1:	8b 45 08             	mov    0x8(%ebp),%eax
 5b4:	89 04 24             	mov    %eax,(%esp)
 5b7:	e8 b0 fe ff ff       	call   46c <printint>
        ap++;
 5bc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5c0:	e9 ed 00 00 00       	jmp    6b2 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 5c5:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 5c9:	74 06                	je     5d1 <printf+0xb4>
 5cb:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 5cf:	75 2d                	jne    5fe <printf+0xe1>
        printint(fd, *ap, 16, 0);
 5d1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5d4:	8b 00                	mov    (%eax),%eax
 5d6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5dd:	00 
 5de:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5e5:	00 
 5e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ea:	8b 45 08             	mov    0x8(%ebp),%eax
 5ed:	89 04 24             	mov    %eax,(%esp)
 5f0:	e8 77 fe ff ff       	call   46c <printint>
        ap++;
 5f5:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5f9:	e9 b4 00 00 00       	jmp    6b2 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5fe:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 602:	75 46                	jne    64a <printf+0x12d>
        s = (char*)*ap;
 604:	8b 45 f4             	mov    -0xc(%ebp),%eax
 607:	8b 00                	mov    (%eax),%eax
 609:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 60c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 610:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 614:	75 27                	jne    63d <printf+0x120>
          s = "(null)";
 616:	c7 45 e4 c6 0c 00 00 	movl   $0xcc6,-0x1c(%ebp)
        while(*s != 0){
 61d:	eb 1f                	jmp    63e <printf+0x121>
          putc(fd, *s);
 61f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 622:	0f b6 00             	movzbl (%eax),%eax
 625:	0f be c0             	movsbl %al,%eax
 628:	89 44 24 04          	mov    %eax,0x4(%esp)
 62c:	8b 45 08             	mov    0x8(%ebp),%eax
 62f:	89 04 24             	mov    %eax,(%esp)
 632:	e8 0d fe ff ff       	call   444 <putc>
          s++;
 637:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 63b:	eb 01                	jmp    63e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 63d:	90                   	nop
 63e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 641:	0f b6 00             	movzbl (%eax),%eax
 644:	84 c0                	test   %al,%al
 646:	75 d7                	jne    61f <printf+0x102>
 648:	eb 68                	jmp    6b2 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 64a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 64e:	75 1d                	jne    66d <printf+0x150>
        putc(fd, *ap);
 650:	8b 45 f4             	mov    -0xc(%ebp),%eax
 653:	8b 00                	mov    (%eax),%eax
 655:	0f be c0             	movsbl %al,%eax
 658:	89 44 24 04          	mov    %eax,0x4(%esp)
 65c:	8b 45 08             	mov    0x8(%ebp),%eax
 65f:	89 04 24             	mov    %eax,(%esp)
 662:	e8 dd fd ff ff       	call   444 <putc>
        ap++;
 667:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 66b:	eb 45                	jmp    6b2 <printf+0x195>
      } else if(c == '%'){
 66d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 671:	75 17                	jne    68a <printf+0x16d>
        putc(fd, c);
 673:	8b 45 e8             	mov    -0x18(%ebp),%eax
 676:	0f be c0             	movsbl %al,%eax
 679:	89 44 24 04          	mov    %eax,0x4(%esp)
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	89 04 24             	mov    %eax,(%esp)
 683:	e8 bc fd ff ff       	call   444 <putc>
 688:	eb 28                	jmp    6b2 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 68a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 691:	00 
 692:	8b 45 08             	mov    0x8(%ebp),%eax
 695:	89 04 24             	mov    %eax,(%esp)
 698:	e8 a7 fd ff ff       	call   444 <putc>
        putc(fd, c);
 69d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6a0:	0f be c0             	movsbl %al,%eax
 6a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a7:	8b 45 08             	mov    0x8(%ebp),%eax
 6aa:	89 04 24             	mov    %eax,(%esp)
 6ad:	e8 92 fd ff ff       	call   444 <putc>
      }
      state = 0;
 6b2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6b9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 6bd:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6c3:	8d 04 02             	lea    (%edx,%eax,1),%eax
 6c6:	0f b6 00             	movzbl (%eax),%eax
 6c9:	84 c0                	test   %al,%al
 6cb:	0f 85 6e fe ff ff    	jne    53f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6d1:	c9                   	leave  
 6d2:	c3                   	ret    
 6d3:	90                   	nop

000006d4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d4:	55                   	push   %ebp
 6d5:	89 e5                	mov    %esp,%ebp
 6d7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6da:	8b 45 08             	mov    0x8(%ebp),%eax
 6dd:	83 e8 08             	sub    $0x8,%eax
 6e0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e3:	a1 34 0d 00 00       	mov    0xd34,%eax
 6e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6eb:	eb 24                	jmp    711 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6f0:	8b 00                	mov    (%eax),%eax
 6f2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f5:	77 12                	ja     709 <free+0x35>
 6f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6fa:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6fd:	77 24                	ja     723 <free+0x4f>
 6ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 702:	8b 00                	mov    (%eax),%eax
 704:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 707:	77 1a                	ja     723 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 709:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70c:	8b 00                	mov    (%eax),%eax
 70e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 711:	8b 45 f8             	mov    -0x8(%ebp),%eax
 714:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 717:	76 d4                	jbe    6ed <free+0x19>
 719:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71c:	8b 00                	mov    (%eax),%eax
 71e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 721:	76 ca                	jbe    6ed <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 723:	8b 45 f8             	mov    -0x8(%ebp),%eax
 726:	8b 40 04             	mov    0x4(%eax),%eax
 729:	c1 e0 03             	shl    $0x3,%eax
 72c:	89 c2                	mov    %eax,%edx
 72e:	03 55 f8             	add    -0x8(%ebp),%edx
 731:	8b 45 fc             	mov    -0x4(%ebp),%eax
 734:	8b 00                	mov    (%eax),%eax
 736:	39 c2                	cmp    %eax,%edx
 738:	75 24                	jne    75e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 73a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73d:	8b 50 04             	mov    0x4(%eax),%edx
 740:	8b 45 fc             	mov    -0x4(%ebp),%eax
 743:	8b 00                	mov    (%eax),%eax
 745:	8b 40 04             	mov    0x4(%eax),%eax
 748:	01 c2                	add    %eax,%edx
 74a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 750:	8b 45 fc             	mov    -0x4(%ebp),%eax
 753:	8b 00                	mov    (%eax),%eax
 755:	8b 10                	mov    (%eax),%edx
 757:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75a:	89 10                	mov    %edx,(%eax)
 75c:	eb 0a                	jmp    768 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 75e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 761:	8b 10                	mov    (%eax),%edx
 763:	8b 45 f8             	mov    -0x8(%ebp),%eax
 766:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 768:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76b:	8b 40 04             	mov    0x4(%eax),%eax
 76e:	c1 e0 03             	shl    $0x3,%eax
 771:	03 45 fc             	add    -0x4(%ebp),%eax
 774:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 777:	75 20                	jne    799 <free+0xc5>
    p->s.size += bp->s.size;
 779:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77c:	8b 50 04             	mov    0x4(%eax),%edx
 77f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 782:	8b 40 04             	mov    0x4(%eax),%eax
 785:	01 c2                	add    %eax,%edx
 787:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 78d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 790:	8b 10                	mov    (%eax),%edx
 792:	8b 45 fc             	mov    -0x4(%ebp),%eax
 795:	89 10                	mov    %edx,(%eax)
 797:	eb 08                	jmp    7a1 <free+0xcd>
  } else
    p->s.ptr = bp;
 799:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 79f:	89 10                	mov    %edx,(%eax)
  freep = p;
 7a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a4:	a3 34 0d 00 00       	mov    %eax,0xd34
}
 7a9:	c9                   	leave  
 7aa:	c3                   	ret    

000007ab <morecore>:

static Header*
morecore(uint nu)
{
 7ab:	55                   	push   %ebp
 7ac:	89 e5                	mov    %esp,%ebp
 7ae:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7b1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7b8:	77 07                	ja     7c1 <morecore+0x16>
    nu = 4096;
 7ba:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7c1:	8b 45 08             	mov    0x8(%ebp),%eax
 7c4:	c1 e0 03             	shl    $0x3,%eax
 7c7:	89 04 24             	mov    %eax,(%esp)
 7ca:	e8 35 fc ff ff       	call   404 <sbrk>
 7cf:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 7d2:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 7d6:	75 07                	jne    7df <morecore+0x34>
    return 0;
 7d8:	b8 00 00 00 00       	mov    $0x0,%eax
 7dd:	eb 22                	jmp    801 <morecore+0x56>
  hp = (Header*)p;
 7df:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 7e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e8:	8b 55 08             	mov    0x8(%ebp),%edx
 7eb:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f1:	83 c0 08             	add    $0x8,%eax
 7f4:	89 04 24             	mov    %eax,(%esp)
 7f7:	e8 d8 fe ff ff       	call   6d4 <free>
  return freep;
 7fc:	a1 34 0d 00 00       	mov    0xd34,%eax
}
 801:	c9                   	leave  
 802:	c3                   	ret    

00000803 <malloc>:

void*
malloc(uint nbytes)
{
 803:	55                   	push   %ebp
 804:	89 e5                	mov    %esp,%ebp
 806:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 809:	8b 45 08             	mov    0x8(%ebp),%eax
 80c:	83 c0 07             	add    $0x7,%eax
 80f:	c1 e8 03             	shr    $0x3,%eax
 812:	83 c0 01             	add    $0x1,%eax
 815:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 818:	a1 34 0d 00 00       	mov    0xd34,%eax
 81d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 820:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 824:	75 23                	jne    849 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 826:	c7 45 f0 2c 0d 00 00 	movl   $0xd2c,-0x10(%ebp)
 82d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 830:	a3 34 0d 00 00       	mov    %eax,0xd34
 835:	a1 34 0d 00 00       	mov    0xd34,%eax
 83a:	a3 2c 0d 00 00       	mov    %eax,0xd2c
    base.s.size = 0;
 83f:	c7 05 30 0d 00 00 00 	movl   $0x0,0xd30
 846:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 849:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84c:	8b 00                	mov    (%eax),%eax
 84e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 851:	8b 45 ec             	mov    -0x14(%ebp),%eax
 854:	8b 40 04             	mov    0x4(%eax),%eax
 857:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 85a:	72 4d                	jb     8a9 <malloc+0xa6>
      if(p->s.size == nunits)
 85c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 85f:	8b 40 04             	mov    0x4(%eax),%eax
 862:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 865:	75 0c                	jne    873 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 867:	8b 45 ec             	mov    -0x14(%ebp),%eax
 86a:	8b 10                	mov    (%eax),%edx
 86c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86f:	89 10                	mov    %edx,(%eax)
 871:	eb 26                	jmp    899 <malloc+0x96>
      else {
        p->s.size -= nunits;
 873:	8b 45 ec             	mov    -0x14(%ebp),%eax
 876:	8b 40 04             	mov    0x4(%eax),%eax
 879:	89 c2                	mov    %eax,%edx
 87b:	2b 55 f4             	sub    -0xc(%ebp),%edx
 87e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 881:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 884:	8b 45 ec             	mov    -0x14(%ebp),%eax
 887:	8b 40 04             	mov    0x4(%eax),%eax
 88a:	c1 e0 03             	shl    $0x3,%eax
 88d:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 890:	8b 45 ec             	mov    -0x14(%ebp),%eax
 893:	8b 55 f4             	mov    -0xc(%ebp),%edx
 896:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 899:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89c:	a3 34 0d 00 00       	mov    %eax,0xd34
      return (void*)(p + 1);
 8a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8a4:	83 c0 08             	add    $0x8,%eax
 8a7:	eb 38                	jmp    8e1 <malloc+0xde>
    }
    if(p == freep)
 8a9:	a1 34 0d 00 00       	mov    0xd34,%eax
 8ae:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 8b1:	75 1b                	jne    8ce <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b6:	89 04 24             	mov    %eax,(%esp)
 8b9:	e8 ed fe ff ff       	call   7ab <morecore>
 8be:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8c1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8c5:	75 07                	jne    8ce <malloc+0xcb>
        return 0;
 8c7:	b8 00 00 00 00       	mov    $0x0,%eax
 8cc:	eb 13                	jmp    8e1 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ce:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8d1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8d7:	8b 00                	mov    (%eax),%eax
 8d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8dc:	e9 70 ff ff ff       	jmp    851 <malloc+0x4e>
}
 8e1:	c9                   	leave  
 8e2:	c3                   	ret    
 8e3:	90                   	nop

000008e4 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 8e4:	55                   	push   %ebp
 8e5:	89 e5                	mov    %esp,%ebp
 8e7:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8ea:	8b 55 08             	mov    0x8(%ebp),%edx
 8ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 8f0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8f3:	f0 87 02             	lock xchg %eax,(%edx)
 8f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 8f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8fc:	c9                   	leave  
 8fd:	c3                   	ret    

000008fe <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 8fe:	55                   	push   %ebp
 8ff:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 901:	8b 45 08             	mov    0x8(%ebp),%eax
 904:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 90a:	5d                   	pop    %ebp
 90b:	c3                   	ret    

0000090c <lock_acquire>:
void lock_acquire(lock_t *lock){
 90c:	55                   	push   %ebp
 90d:	89 e5                	mov    %esp,%ebp
 90f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 912:	8b 45 08             	mov    0x8(%ebp),%eax
 915:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 91c:	00 
 91d:	89 04 24             	mov    %eax,(%esp)
 920:	e8 bf ff ff ff       	call   8e4 <xchg>
 925:	85 c0                	test   %eax,%eax
 927:	75 e9                	jne    912 <lock_acquire+0x6>
}
 929:	c9                   	leave  
 92a:	c3                   	ret    

0000092b <lock_release>:
void lock_release(lock_t *lock){
 92b:	55                   	push   %ebp
 92c:	89 e5                	mov    %esp,%ebp
 92e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 931:	8b 45 08             	mov    0x8(%ebp),%eax
 934:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 93b:	00 
 93c:	89 04 24             	mov    %eax,(%esp)
 93f:	e8 a0 ff ff ff       	call   8e4 <xchg>
}
 944:	c9                   	leave  
 945:	c3                   	ret    

00000946 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 946:	55                   	push   %ebp
 947:	89 e5                	mov    %esp,%ebp
 949:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 94c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 953:	e8 ab fe ff ff       	call   803 <malloc>
 958:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 95b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 961:	8b 45 f0             	mov    -0x10(%ebp),%eax
 964:	25 ff 0f 00 00       	and    $0xfff,%eax
 969:	85 c0                	test   %eax,%eax
 96b:	74 15                	je     982 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 96d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 970:	89 c2                	mov    %eax,%edx
 972:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 978:	b8 00 10 00 00       	mov    $0x1000,%eax
 97d:	29 d0                	sub    %edx,%eax
 97f:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 982:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 986:	75 1b                	jne    9a3 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 988:	c7 44 24 04 cd 0c 00 	movl   $0xccd,0x4(%esp)
 98f:	00 
 990:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 997:	e8 81 fb ff ff       	call   51d <printf>
        return 0;
 99c:	b8 00 00 00 00       	mov    $0x0,%eax
 9a1:	eb 6f                	jmp    a12 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 9a3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 9a6:	8b 55 08             	mov    0x8(%ebp),%edx
 9a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ac:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 9b0:	89 54 24 08          	mov    %edx,0x8(%esp)
 9b4:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 9bb:	00 
 9bc:	89 04 24             	mov    %eax,(%esp)
 9bf:	e8 58 fa ff ff       	call   41c <clone>
 9c4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 9c7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9cb:	79 1b                	jns    9e8 <thread_create+0xa2>
        printf(1,"clone fails\n");
 9cd:	c7 44 24 04 db 0c 00 	movl   $0xcdb,0x4(%esp)
 9d4:	00 
 9d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9dc:	e8 3c fb ff ff       	call   51d <printf>
        return 0;
 9e1:	b8 00 00 00 00       	mov    $0x0,%eax
 9e6:	eb 2a                	jmp    a12 <thread_create+0xcc>
    }
    if(tid > 0){
 9e8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9ec:	7e 05                	jle    9f3 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 9ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f1:	eb 1f                	jmp    a12 <thread_create+0xcc>
    }
    if(tid == 0){
 9f3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9f7:	75 14                	jne    a0d <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 9f9:	c7 44 24 04 e8 0c 00 	movl   $0xce8,0x4(%esp)
 a00:	00 
 a01:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a08:	e8 10 fb ff ff       	call   51d <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 a0d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 a12:	c9                   	leave  
 a13:	c3                   	ret    

00000a14 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 a14:	55                   	push   %ebp
 a15:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 a17:	8b 45 08             	mov    0x8(%ebp),%eax
 a1a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 a20:	8b 45 08             	mov    0x8(%ebp),%eax
 a23:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 a2a:	8b 45 08             	mov    0x8(%ebp),%eax
 a2d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 a34:	5d                   	pop    %ebp
 a35:	c3                   	ret    

00000a36 <add_q>:

void add_q(struct queue *q, int v){
 a36:	55                   	push   %ebp
 a37:	89 e5                	mov    %esp,%ebp
 a39:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 a3c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 a43:	e8 bb fd ff ff       	call   803 <malloc>
 a48:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 a4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 a55:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a58:	8b 55 0c             	mov    0xc(%ebp),%edx
 a5b:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 a5d:	8b 45 08             	mov    0x8(%ebp),%eax
 a60:	8b 40 04             	mov    0x4(%eax),%eax
 a63:	85 c0                	test   %eax,%eax
 a65:	75 0b                	jne    a72 <add_q+0x3c>
        q->head = n;
 a67:	8b 45 08             	mov    0x8(%ebp),%eax
 a6a:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a6d:	89 50 04             	mov    %edx,0x4(%eax)
 a70:	eb 0c                	jmp    a7e <add_q+0x48>
    }else{
        q->tail->next = n;
 a72:	8b 45 08             	mov    0x8(%ebp),%eax
 a75:	8b 40 08             	mov    0x8(%eax),%eax
 a78:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a7b:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 a7e:	8b 45 08             	mov    0x8(%ebp),%eax
 a81:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a84:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 a87:	8b 45 08             	mov    0x8(%ebp),%eax
 a8a:	8b 00                	mov    (%eax),%eax
 a8c:	8d 50 01             	lea    0x1(%eax),%edx
 a8f:	8b 45 08             	mov    0x8(%ebp),%eax
 a92:	89 10                	mov    %edx,(%eax)
}
 a94:	c9                   	leave  
 a95:	c3                   	ret    

00000a96 <empty_q>:

int empty_q(struct queue *q){
 a96:	55                   	push   %ebp
 a97:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 a99:	8b 45 08             	mov    0x8(%ebp),%eax
 a9c:	8b 00                	mov    (%eax),%eax
 a9e:	85 c0                	test   %eax,%eax
 aa0:	75 07                	jne    aa9 <empty_q+0x13>
        return 1;
 aa2:	b8 01 00 00 00       	mov    $0x1,%eax
 aa7:	eb 05                	jmp    aae <empty_q+0x18>
    else
        return 0;
 aa9:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 aae:	5d                   	pop    %ebp
 aaf:	c3                   	ret    

00000ab0 <pop_q>:
int pop_q(struct queue *q){
 ab0:	55                   	push   %ebp
 ab1:	89 e5                	mov    %esp,%ebp
 ab3:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 ab6:	8b 45 08             	mov    0x8(%ebp),%eax
 ab9:	89 04 24             	mov    %eax,(%esp)
 abc:	e8 d5 ff ff ff       	call   a96 <empty_q>
 ac1:	85 c0                	test   %eax,%eax
 ac3:	75 5d                	jne    b22 <pop_q+0x72>
       val = q->head->value; 
 ac5:	8b 45 08             	mov    0x8(%ebp),%eax
 ac8:	8b 40 04             	mov    0x4(%eax),%eax
 acb:	8b 00                	mov    (%eax),%eax
 acd:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 ad0:	8b 45 08             	mov    0x8(%ebp),%eax
 ad3:	8b 40 04             	mov    0x4(%eax),%eax
 ad6:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 ad9:	8b 45 08             	mov    0x8(%ebp),%eax
 adc:	8b 40 04             	mov    0x4(%eax),%eax
 adf:	8b 50 04             	mov    0x4(%eax),%edx
 ae2:	8b 45 08             	mov    0x8(%ebp),%eax
 ae5:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aeb:	89 04 24             	mov    %eax,(%esp)
 aee:	e8 e1 fb ff ff       	call   6d4 <free>
       q->size--;
 af3:	8b 45 08             	mov    0x8(%ebp),%eax
 af6:	8b 00                	mov    (%eax),%eax
 af8:	8d 50 ff             	lea    -0x1(%eax),%edx
 afb:	8b 45 08             	mov    0x8(%ebp),%eax
 afe:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 b00:	8b 45 08             	mov    0x8(%ebp),%eax
 b03:	8b 00                	mov    (%eax),%eax
 b05:	85 c0                	test   %eax,%eax
 b07:	75 14                	jne    b1d <pop_q+0x6d>
            q->head = 0;
 b09:	8b 45 08             	mov    0x8(%ebp),%eax
 b0c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 b13:	8b 45 08             	mov    0x8(%ebp),%eax
 b16:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 b1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b20:	eb 05                	jmp    b27 <pop_q+0x77>
    }
    return -1;
 b22:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 b27:	c9                   	leave  
 b28:	c3                   	ret    
 b29:	90                   	nop
 b2a:	90                   	nop
 b2b:	90                   	nop

00000b2c <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 b2c:	55                   	push   %ebp
 b2d:	89 e5                	mov    %esp,%ebp
 b2f:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 b32:	8b 45 08             	mov    0x8(%ebp),%eax
 b35:	8b 55 0c             	mov    0xc(%ebp),%edx
 b38:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 b3b:	8b 45 08             	mov    0x8(%ebp),%eax
 b3e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 b45:	8b 45 08             	mov    0x8(%ebp),%eax
 b48:	89 04 24             	mov    %eax,(%esp)
 b4b:	e8 ae fd ff ff       	call   8fe <lock_init>
}
 b50:	c9                   	leave  
 b51:	c3                   	ret    

00000b52 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 b52:	55                   	push   %ebp
 b53:	89 e5                	mov    %esp,%ebp
 b55:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 b58:	8b 45 08             	mov    0x8(%ebp),%eax
 b5b:	89 04 24             	mov    %eax,(%esp)
 b5e:	e8 a9 fd ff ff       	call   90c <lock_acquire>
	if(s->count  == 0){
 b63:	8b 45 08             	mov    0x8(%ebp),%eax
 b66:	8b 40 04             	mov    0x4(%eax),%eax
 b69:	85 c0                	test   %eax,%eax
 b6b:	75 43                	jne    bb0 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 b6d:	c7 44 24 04 f9 0c 00 	movl   $0xcf9,0x4(%esp)
 b74:	00 
 b75:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b7c:	e8 9c f9 ff ff       	call   51d <printf>
		//add proc to waiters list
		int tid = getpid();
 b81:	e8 76 f8 ff ff       	call   3fc <getpid>
 b86:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 b89:	8b 45 08             	mov    0x8(%ebp),%eax
 b8c:	8d 50 0c             	lea    0xc(%eax),%edx
 b8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b92:	89 44 24 04          	mov    %eax,0x4(%esp)
 b96:	89 14 24             	mov    %edx,(%esp)
 b99:	e8 98 fe ff ff       	call   a36 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 b9e:	8b 45 08             	mov    0x8(%ebp),%eax
 ba1:	89 04 24             	mov    %eax,(%esp)
 ba4:	e8 82 fd ff ff       	call   92b <lock_release>
		tsleep(); 
 ba9:	e8 7e f8 ff ff       	call   42c <tsleep>
 bae:	eb 2e                	jmp    bde <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 bb0:	c7 44 24 04 00 0d 00 	movl   $0xd00,0x4(%esp)
 bb7:	00 
 bb8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bbf:	e8 59 f9 ff ff       	call   51d <printf>
		s->count--;	
 bc4:	8b 45 08             	mov    0x8(%ebp),%eax
 bc7:	8b 40 04             	mov    0x4(%eax),%eax
 bca:	8d 50 ff             	lea    -0x1(%eax),%edx
 bcd:	8b 45 08             	mov    0x8(%ebp),%eax
 bd0:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 bd3:	8b 45 08             	mov    0x8(%ebp),%eax
 bd6:	89 04 24             	mov    %eax,(%esp)
 bd9:	e8 4d fd ff ff       	call   92b <lock_release>
	}
}
 bde:	c9                   	leave  
 bdf:	c3                   	ret    

00000be0 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 be0:	55                   	push   %ebp
 be1:	89 e5                	mov    %esp,%ebp
 be3:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 be6:	c7 44 24 04 07 0d 00 	movl   $0xd07,0x4(%esp)
 bed:	00 
 bee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bf5:	e8 23 f9 ff ff       	call   51d <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 bfa:	8b 45 08             	mov    0x8(%ebp),%eax
 bfd:	89 04 24             	mov    %eax,(%esp)
 c00:	e8 07 fd ff ff       	call   90c <lock_acquire>
	if(s->count < s->size){
 c05:	8b 45 08             	mov    0x8(%ebp),%eax
 c08:	8b 50 04             	mov    0x4(%eax),%edx
 c0b:	8b 45 08             	mov    0x8(%ebp),%eax
 c0e:	8b 40 08             	mov    0x8(%eax),%eax
 c11:	39 c2                	cmp    %eax,%edx
 c13:	7d 0f                	jge    c24 <sem_signal+0x44>
		s->count++;	
 c15:	8b 45 08             	mov    0x8(%ebp),%eax
 c18:	8b 40 04             	mov    0x4(%eax),%eax
 c1b:	8d 50 01             	lea    0x1(%eax),%edx
 c1e:	8b 45 08             	mov    0x8(%ebp),%eax
 c21:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 c24:	8b 45 08             	mov    0x8(%ebp),%eax
 c27:	83 c0 0c             	add    $0xc,%eax
 c2a:	89 04 24             	mov    %eax,(%esp)
 c2d:	e8 7e fe ff ff       	call   ab0 <pop_q>
 c32:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 c35:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 c39:	74 2e                	je     c69 <sem_signal+0x89>
		printf(1, "Sem A\n");
 c3b:	c7 44 24 04 00 0d 00 	movl   $0xd00,0x4(%esp)
 c42:	00 
 c43:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c4a:	e8 ce f8 ff ff       	call   51d <printf>
		twakeup(tid);
 c4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c52:	89 04 24             	mov    %eax,(%esp)
 c55:	e8 da f7 ff ff       	call   434 <twakeup>
		s->count--;
 c5a:	8b 45 08             	mov    0x8(%ebp),%eax
 c5d:	8b 40 04             	mov    0x4(%eax),%eax
 c60:	8d 50 ff             	lea    -0x1(%eax),%edx
 c63:	8b 45 08             	mov    0x8(%ebp),%eax
 c66:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 c69:	8b 45 08             	mov    0x8(%ebp),%eax
 c6c:	89 04 24             	mov    %eax,(%esp)
 c6f:	e8 b7 fc ff ff       	call   92b <lock_release>

 c74:	c9                   	leave  
 c75:	c3                   	ret    
