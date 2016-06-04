
_h2o:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
void hReady();
void oReady();

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
	sem_init(&wait_o, oNum);  //Initialize semaphore with 5 slots
   9:	a1 3c 11 00 00       	mov    0x113c,%eax
   e:	89 44 24 04          	mov    %eax,0x4(%esp)
  12:	c7 04 24 80 11 00 00 	movl   $0x1180,(%esp)
  19:	e8 a8 0b 00 00       	call   bc6 <sem_init>
	sem_init(&wait_h, hNum); //Initialize semaphore with 10 slots
  1e:	a1 40 11 00 00       	mov    0x1140,%eax
  23:	89 44 24 04          	mov    %eax,0x4(%esp)
  27:	c7 04 24 c0 11 00 00 	movl   $0x11c0,(%esp)
  2e:	e8 93 0b 00 00       	call   bc6 <sem_init>
	
	int i;
	for(i = 0; i < 10; i++) thread_create(oReady, 0);
  33:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  3a:	00 
  3b:	eb 19                	jmp    56 <main+0x56>
  3d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  44:	00 
  45:	c7 04 24 e1 00 00 00 	movl   $0xe1,(%esp)
  4c:	e8 93 09 00 00       	call   9e4 <thread_create>
  51:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  56:	83 7c 24 1c 09       	cmpl   $0x9,0x1c(%esp)
  5b:	7e e0                	jle    3d <main+0x3d>
	for(i = 0; i < 20; i++) thread_create(hReady, 0);
  5d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  64:	00 
  65:	eb 19                	jmp    80 <main+0x80>
  67:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  6e:	00 
  6f:	c7 04 24 aa 00 00 00 	movl   $0xaa,(%esp)
  76:	e8 69 09 00 00       	call   9e4 <thread_create>
  7b:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  80:	83 7c 24 1c 13       	cmpl   $0x13,0x1c(%esp)
  85:	7e e0                	jle    67 <main+0x67>
    while(wait()>0);
  87:	90                   	nop
  88:	e8 88 03 00 00       	call   415 <wait>
  8d:	85 c0                	test   %eax,%eax
  8f:	7f f7                	jg     88 <main+0x88>
	printf(1,"Balanced Reaction\n");
  91:	c7 44 24 04 dc 0c 00 	movl   $0xcdc,0x4(%esp)
  98:	00 
  99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a0:	e8 10 05 00 00       	call   5b5 <printf>
	exit();
  a5:	e8 63 03 00 00       	call   40d <exit>

000000aa <hReady>:
}

void hReady(){
  aa:	55                   	push   %ebp
  ab:	89 e5                	mov    %esp,%ebp
  ad:	83 ec 18             	sub    $0x18,%esp
  	printf(1, "H\n");  	
  b0:	c7 44 24 04 ef 0c 00 	movl   $0xcef,0x4(%esp)
  b7:	00 
  b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bf:	e8 f1 04 00 00       	call   5b5 <printf>
	sem_signal(&wait_h);
  c4:	c7 04 24 c0 11 00 00 	movl   $0x11c0,(%esp)
  cb:	e8 82 0b 00 00       	call   c52 <sem_signal>
	sem_aquire(&wait_o);
  d0:	c7 04 24 80 11 00 00 	movl   $0x1180,(%esp)
  d7:	e8 10 0b 00 00       	call   bec <sem_aquire>
	texit();
  dc:	e8 d4 03 00 00       	call   4b5 <texit>

000000e1 <oReady>:
}

//Oxyegn waits untill there are two hydrogens
void oReady(){
  e1:	55                   	push   %ebp
  e2:	89 e5                	mov    %esp,%ebp
  e4:	83 ec 18             	sub    $0x18,%esp
  printf(1, "O\n");
  e7:	c7 44 24 04 f2 0c 00 	movl   $0xcf2,0x4(%esp)
  ee:	00 
  ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f6:	e8 ba 04 00 00       	call   5b5 <printf>
  sem_aquire(&wait_h);
  fb:	c7 04 24 c0 11 00 00 	movl   $0x11c0,(%esp)
 102:	e8 e5 0a 00 00       	call   bec <sem_aquire>
  	printf(1, "H-O %d %d\n", wait_h.count, wait_o.count);  
 107:	8b 15 84 11 00 00    	mov    0x1184,%edx
 10d:	a1 c4 11 00 00       	mov    0x11c4,%eax
 112:	89 54 24 0c          	mov    %edx,0xc(%esp)
 116:	89 44 24 08          	mov    %eax,0x8(%esp)
 11a:	c7 44 24 04 f5 0c 00 	movl   $0xcf5,0x4(%esp)
 121:	00 
 122:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 129:	e8 87 04 00 00       	call   5b5 <printf>
  sem_aquire(&wait_h);
 12e:	c7 04 24 c0 11 00 00 	movl   $0x11c0,(%esp)
 135:	e8 b2 0a 00 00       	call   bec <sem_aquire>
  	printf(1, "H-O %d %d\n", wait_h.count, wait_o.count);  
 13a:	8b 15 84 11 00 00    	mov    0x1184,%edx
 140:	a1 c4 11 00 00       	mov    0x11c4,%eax
 145:	89 54 24 0c          	mov    %edx,0xc(%esp)
 149:	89 44 24 08          	mov    %eax,0x8(%esp)
 14d:	c7 44 24 04 f5 0c 00 	movl   $0xcf5,0x4(%esp)
 154:	00 
 155:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 15c:	e8 54 04 00 00       	call   5b5 <printf>
  sem_signal(&wait_o);
 161:	c7 04 24 80 11 00 00 	movl   $0x1180,(%esp)
 168:	e8 e5 0a 00 00       	call   c52 <sem_signal>
  sem_signal(&wait_o);
 16d:	c7 04 24 80 11 00 00 	movl   $0x1180,(%esp)
 174:	e8 d9 0a 00 00       	call   c52 <sem_signal>
  	printf(1, "H-O-H %d %d\n", wait_h.count, wait_o.count);  
 179:	8b 15 84 11 00 00    	mov    0x1184,%edx
 17f:	a1 c4 11 00 00       	mov    0x11c4,%eax
 184:	89 54 24 0c          	mov    %edx,0xc(%esp)
 188:	89 44 24 08          	mov    %eax,0x8(%esp)
 18c:	c7 44 24 04 00 0d 00 	movl   $0xd00,0x4(%esp)
 193:	00 
 194:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 19b:	e8 15 04 00 00       	call   5b5 <printf>
  texit();
 1a0:	e8 10 03 00 00       	call   4b5 <texit>

000001a5 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1a5:	55                   	push   %ebp
 1a6:	89 e5                	mov    %esp,%ebp
 1a8:	57                   	push   %edi
 1a9:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1aa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1ad:	8b 55 10             	mov    0x10(%ebp),%edx
 1b0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b3:	89 cb                	mov    %ecx,%ebx
 1b5:	89 df                	mov    %ebx,%edi
 1b7:	89 d1                	mov    %edx,%ecx
 1b9:	fc                   	cld    
 1ba:	f3 aa                	rep stos %al,%es:(%edi)
 1bc:	89 ca                	mov    %ecx,%edx
 1be:	89 fb                	mov    %edi,%ebx
 1c0:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1c3:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1c6:	5b                   	pop    %ebx
 1c7:	5f                   	pop    %edi
 1c8:	5d                   	pop    %ebp
 1c9:	c3                   	ret    

000001ca <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1d0:	8b 45 08             	mov    0x8(%ebp),%eax
 1d3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1d6:	90                   	nop
 1d7:	8b 45 08             	mov    0x8(%ebp),%eax
 1da:	8d 50 01             	lea    0x1(%eax),%edx
 1dd:	89 55 08             	mov    %edx,0x8(%ebp)
 1e0:	8b 55 0c             	mov    0xc(%ebp),%edx
 1e3:	8d 4a 01             	lea    0x1(%edx),%ecx
 1e6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 1e9:	0f b6 12             	movzbl (%edx),%edx
 1ec:	88 10                	mov    %dl,(%eax)
 1ee:	0f b6 00             	movzbl (%eax),%eax
 1f1:	84 c0                	test   %al,%al
 1f3:	75 e2                	jne    1d7 <strcpy+0xd>
    ;
  return os;
 1f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f8:	c9                   	leave  
 1f9:	c3                   	ret    

000001fa <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1fa:	55                   	push   %ebp
 1fb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1fd:	eb 08                	jmp    207 <strcmp+0xd>
    p++, q++;
 1ff:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 203:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	0f b6 00             	movzbl (%eax),%eax
 20d:	84 c0                	test   %al,%al
 20f:	74 10                	je     221 <strcmp+0x27>
 211:	8b 45 08             	mov    0x8(%ebp),%eax
 214:	0f b6 10             	movzbl (%eax),%edx
 217:	8b 45 0c             	mov    0xc(%ebp),%eax
 21a:	0f b6 00             	movzbl (%eax),%eax
 21d:	38 c2                	cmp    %al,%dl
 21f:	74 de                	je     1ff <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 221:	8b 45 08             	mov    0x8(%ebp),%eax
 224:	0f b6 00             	movzbl (%eax),%eax
 227:	0f b6 d0             	movzbl %al,%edx
 22a:	8b 45 0c             	mov    0xc(%ebp),%eax
 22d:	0f b6 00             	movzbl (%eax),%eax
 230:	0f b6 c0             	movzbl %al,%eax
 233:	29 c2                	sub    %eax,%edx
 235:	89 d0                	mov    %edx,%eax
}
 237:	5d                   	pop    %ebp
 238:	c3                   	ret    

00000239 <strlen>:

uint
strlen(char *s)
{
 239:	55                   	push   %ebp
 23a:	89 e5                	mov    %esp,%ebp
 23c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 23f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 246:	eb 04                	jmp    24c <strlen+0x13>
 248:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 24c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 24f:	8b 45 08             	mov    0x8(%ebp),%eax
 252:	01 d0                	add    %edx,%eax
 254:	0f b6 00             	movzbl (%eax),%eax
 257:	84 c0                	test   %al,%al
 259:	75 ed                	jne    248 <strlen+0xf>
    ;
  return n;
 25b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 25e:	c9                   	leave  
 25f:	c3                   	ret    

00000260 <memset>:

void*
memset(void *dst, int c, uint n)
{
 260:	55                   	push   %ebp
 261:	89 e5                	mov    %esp,%ebp
 263:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 266:	8b 45 10             	mov    0x10(%ebp),%eax
 269:	89 44 24 08          	mov    %eax,0x8(%esp)
 26d:	8b 45 0c             	mov    0xc(%ebp),%eax
 270:	89 44 24 04          	mov    %eax,0x4(%esp)
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	89 04 24             	mov    %eax,(%esp)
 27a:	e8 26 ff ff ff       	call   1a5 <stosb>
  return dst;
 27f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 282:	c9                   	leave  
 283:	c3                   	ret    

00000284 <strchr>:

char*
strchr(const char *s, char c)
{
 284:	55                   	push   %ebp
 285:	89 e5                	mov    %esp,%ebp
 287:	83 ec 04             	sub    $0x4,%esp
 28a:	8b 45 0c             	mov    0xc(%ebp),%eax
 28d:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 290:	eb 14                	jmp    2a6 <strchr+0x22>
    if(*s == c)
 292:	8b 45 08             	mov    0x8(%ebp),%eax
 295:	0f b6 00             	movzbl (%eax),%eax
 298:	3a 45 fc             	cmp    -0x4(%ebp),%al
 29b:	75 05                	jne    2a2 <strchr+0x1e>
      return (char*)s;
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
 2a0:	eb 13                	jmp    2b5 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2a2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2a6:	8b 45 08             	mov    0x8(%ebp),%eax
 2a9:	0f b6 00             	movzbl (%eax),%eax
 2ac:	84 c0                	test   %al,%al
 2ae:	75 e2                	jne    292 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2b0:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2b5:	c9                   	leave  
 2b6:	c3                   	ret    

000002b7 <gets>:

char*
gets(char *buf, int max)
{
 2b7:	55                   	push   %ebp
 2b8:	89 e5                	mov    %esp,%ebp
 2ba:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2bd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2c4:	eb 4c                	jmp    312 <gets+0x5b>
    cc = read(0, &c, 1);
 2c6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2cd:	00 
 2ce:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2dc:	e8 44 01 00 00       	call   425 <read>
 2e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 2e4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2e8:	7f 02                	jg     2ec <gets+0x35>
      break;
 2ea:	eb 31                	jmp    31d <gets+0x66>
    buf[i++] = c;
 2ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ef:	8d 50 01             	lea    0x1(%eax),%edx
 2f2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 2f5:	89 c2                	mov    %eax,%edx
 2f7:	8b 45 08             	mov    0x8(%ebp),%eax
 2fa:	01 c2                	add    %eax,%edx
 2fc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 300:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 302:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 306:	3c 0a                	cmp    $0xa,%al
 308:	74 13                	je     31d <gets+0x66>
 30a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30e:	3c 0d                	cmp    $0xd,%al
 310:	74 0b                	je     31d <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 312:	8b 45 f4             	mov    -0xc(%ebp),%eax
 315:	83 c0 01             	add    $0x1,%eax
 318:	3b 45 0c             	cmp    0xc(%ebp),%eax
 31b:	7c a9                	jl     2c6 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 31d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 320:	8b 45 08             	mov    0x8(%ebp),%eax
 323:	01 d0                	add    %edx,%eax
 325:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 328:	8b 45 08             	mov    0x8(%ebp),%eax
}
 32b:	c9                   	leave  
 32c:	c3                   	ret    

0000032d <stat>:

int
stat(char *n, struct stat *st)
{
 32d:	55                   	push   %ebp
 32e:	89 e5                	mov    %esp,%ebp
 330:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 333:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 33a:	00 
 33b:	8b 45 08             	mov    0x8(%ebp),%eax
 33e:	89 04 24             	mov    %eax,(%esp)
 341:	e8 07 01 00 00       	call   44d <open>
 346:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 349:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 34d:	79 07                	jns    356 <stat+0x29>
    return -1;
 34f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 354:	eb 23                	jmp    379 <stat+0x4c>
  r = fstat(fd, st);
 356:	8b 45 0c             	mov    0xc(%ebp),%eax
 359:	89 44 24 04          	mov    %eax,0x4(%esp)
 35d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 360:	89 04 24             	mov    %eax,(%esp)
 363:	e8 fd 00 00 00       	call   465 <fstat>
 368:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 36b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 36e:	89 04 24             	mov    %eax,(%esp)
 371:	e8 bf 00 00 00       	call   435 <close>
  return r;
 376:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 379:	c9                   	leave  
 37a:	c3                   	ret    

0000037b <atoi>:

int
atoi(const char *s)
{
 37b:	55                   	push   %ebp
 37c:	89 e5                	mov    %esp,%ebp
 37e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 381:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 388:	eb 25                	jmp    3af <atoi+0x34>
    n = n*10 + *s++ - '0';
 38a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 38d:	89 d0                	mov    %edx,%eax
 38f:	c1 e0 02             	shl    $0x2,%eax
 392:	01 d0                	add    %edx,%eax
 394:	01 c0                	add    %eax,%eax
 396:	89 c1                	mov    %eax,%ecx
 398:	8b 45 08             	mov    0x8(%ebp),%eax
 39b:	8d 50 01             	lea    0x1(%eax),%edx
 39e:	89 55 08             	mov    %edx,0x8(%ebp)
 3a1:	0f b6 00             	movzbl (%eax),%eax
 3a4:	0f be c0             	movsbl %al,%eax
 3a7:	01 c8                	add    %ecx,%eax
 3a9:	83 e8 30             	sub    $0x30,%eax
 3ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3af:	8b 45 08             	mov    0x8(%ebp),%eax
 3b2:	0f b6 00             	movzbl (%eax),%eax
 3b5:	3c 2f                	cmp    $0x2f,%al
 3b7:	7e 0a                	jle    3c3 <atoi+0x48>
 3b9:	8b 45 08             	mov    0x8(%ebp),%eax
 3bc:	0f b6 00             	movzbl (%eax),%eax
 3bf:	3c 39                	cmp    $0x39,%al
 3c1:	7e c7                	jle    38a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3c6:	c9                   	leave  
 3c7:	c3                   	ret    

000003c8 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3c8:	55                   	push   %ebp
 3c9:	89 e5                	mov    %esp,%ebp
 3cb:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3ce:	8b 45 08             	mov    0x8(%ebp),%eax
 3d1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 3d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 3da:	eb 17                	jmp    3f3 <memmove+0x2b>
    *dst++ = *src++;
 3dc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3df:	8d 50 01             	lea    0x1(%eax),%edx
 3e2:	89 55 fc             	mov    %edx,-0x4(%ebp)
 3e5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 3e8:	8d 4a 01             	lea    0x1(%edx),%ecx
 3eb:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 3ee:	0f b6 12             	movzbl (%edx),%edx
 3f1:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3f3:	8b 45 10             	mov    0x10(%ebp),%eax
 3f6:	8d 50 ff             	lea    -0x1(%eax),%edx
 3f9:	89 55 10             	mov    %edx,0x10(%ebp)
 3fc:	85 c0                	test   %eax,%eax
 3fe:	7f dc                	jg     3dc <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 400:	8b 45 08             	mov    0x8(%ebp),%eax
}
 403:	c9                   	leave  
 404:	c3                   	ret    

00000405 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 405:	b8 01 00 00 00       	mov    $0x1,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <exit>:
SYSCALL(exit)
 40d:	b8 02 00 00 00       	mov    $0x2,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <wait>:
SYSCALL(wait)
 415:	b8 03 00 00 00       	mov    $0x3,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <pipe>:
SYSCALL(pipe)
 41d:	b8 04 00 00 00       	mov    $0x4,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <read>:
SYSCALL(read)
 425:	b8 05 00 00 00       	mov    $0x5,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <write>:
SYSCALL(write)
 42d:	b8 10 00 00 00       	mov    $0x10,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <close>:
SYSCALL(close)
 435:	b8 15 00 00 00       	mov    $0x15,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <kill>:
SYSCALL(kill)
 43d:	b8 06 00 00 00       	mov    $0x6,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <exec>:
SYSCALL(exec)
 445:	b8 07 00 00 00       	mov    $0x7,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <open>:
SYSCALL(open)
 44d:	b8 0f 00 00 00       	mov    $0xf,%eax
 452:	cd 40                	int    $0x40
 454:	c3                   	ret    

00000455 <mknod>:
SYSCALL(mknod)
 455:	b8 11 00 00 00       	mov    $0x11,%eax
 45a:	cd 40                	int    $0x40
 45c:	c3                   	ret    

0000045d <unlink>:
SYSCALL(unlink)
 45d:	b8 12 00 00 00       	mov    $0x12,%eax
 462:	cd 40                	int    $0x40
 464:	c3                   	ret    

00000465 <fstat>:
SYSCALL(fstat)
 465:	b8 08 00 00 00       	mov    $0x8,%eax
 46a:	cd 40                	int    $0x40
 46c:	c3                   	ret    

0000046d <link>:
SYSCALL(link)
 46d:	b8 13 00 00 00       	mov    $0x13,%eax
 472:	cd 40                	int    $0x40
 474:	c3                   	ret    

00000475 <mkdir>:
SYSCALL(mkdir)
 475:	b8 14 00 00 00       	mov    $0x14,%eax
 47a:	cd 40                	int    $0x40
 47c:	c3                   	ret    

0000047d <chdir>:
SYSCALL(chdir)
 47d:	b8 09 00 00 00       	mov    $0x9,%eax
 482:	cd 40                	int    $0x40
 484:	c3                   	ret    

00000485 <dup>:
SYSCALL(dup)
 485:	b8 0a 00 00 00       	mov    $0xa,%eax
 48a:	cd 40                	int    $0x40
 48c:	c3                   	ret    

0000048d <getpid>:
SYSCALL(getpid)
 48d:	b8 0b 00 00 00       	mov    $0xb,%eax
 492:	cd 40                	int    $0x40
 494:	c3                   	ret    

00000495 <sbrk>:
SYSCALL(sbrk)
 495:	b8 0c 00 00 00       	mov    $0xc,%eax
 49a:	cd 40                	int    $0x40
 49c:	c3                   	ret    

0000049d <sleep>:
SYSCALL(sleep)
 49d:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a2:	cd 40                	int    $0x40
 4a4:	c3                   	ret    

000004a5 <uptime>:
SYSCALL(uptime)
 4a5:	b8 0e 00 00 00       	mov    $0xe,%eax
 4aa:	cd 40                	int    $0x40
 4ac:	c3                   	ret    

000004ad <clone>:
SYSCALL(clone)
 4ad:	b8 16 00 00 00       	mov    $0x16,%eax
 4b2:	cd 40                	int    $0x40
 4b4:	c3                   	ret    

000004b5 <texit>:
SYSCALL(texit)
 4b5:	b8 17 00 00 00       	mov    $0x17,%eax
 4ba:	cd 40                	int    $0x40
 4bc:	c3                   	ret    

000004bd <tsleep>:
SYSCALL(tsleep)
 4bd:	b8 18 00 00 00       	mov    $0x18,%eax
 4c2:	cd 40                	int    $0x40
 4c4:	c3                   	ret    

000004c5 <twakeup>:
SYSCALL(twakeup)
 4c5:	b8 19 00 00 00       	mov    $0x19,%eax
 4ca:	cd 40                	int    $0x40
 4cc:	c3                   	ret    

000004cd <test>:
SYSCALL(test)
 4cd:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4d2:	cd 40                	int    $0x40
 4d4:	c3                   	ret    

000004d5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4d5:	55                   	push   %ebp
 4d6:	89 e5                	mov    %esp,%ebp
 4d8:	83 ec 18             	sub    $0x18,%esp
 4db:	8b 45 0c             	mov    0xc(%ebp),%eax
 4de:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4e1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4e8:	00 
 4e9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 4f0:	8b 45 08             	mov    0x8(%ebp),%eax
 4f3:	89 04 24             	mov    %eax,(%esp)
 4f6:	e8 32 ff ff ff       	call   42d <write>
}
 4fb:	c9                   	leave  
 4fc:	c3                   	ret    

000004fd <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4fd:	55                   	push   %ebp
 4fe:	89 e5                	mov    %esp,%ebp
 500:	56                   	push   %esi
 501:	53                   	push   %ebx
 502:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 505:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 50c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 510:	74 17                	je     529 <printint+0x2c>
 512:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 516:	79 11                	jns    529 <printint+0x2c>
    neg = 1;
 518:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 51f:	8b 45 0c             	mov    0xc(%ebp),%eax
 522:	f7 d8                	neg    %eax
 524:	89 45 ec             	mov    %eax,-0x14(%ebp)
 527:	eb 06                	jmp    52f <printint+0x32>
  } else {
    x = xx;
 529:	8b 45 0c             	mov    0xc(%ebp),%eax
 52c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 52f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 536:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 539:	8d 41 01             	lea    0x1(%ecx),%eax
 53c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 53f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 542:	8b 45 ec             	mov    -0x14(%ebp),%eax
 545:	ba 00 00 00 00       	mov    $0x0,%edx
 54a:	f7 f3                	div    %ebx
 54c:	89 d0                	mov    %edx,%eax
 54e:	0f b6 80 44 11 00 00 	movzbl 0x1144(%eax),%eax
 555:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 559:	8b 75 10             	mov    0x10(%ebp),%esi
 55c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 55f:	ba 00 00 00 00       	mov    $0x0,%edx
 564:	f7 f6                	div    %esi
 566:	89 45 ec             	mov    %eax,-0x14(%ebp)
 569:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 56d:	75 c7                	jne    536 <printint+0x39>
  if(neg)
 56f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 573:	74 10                	je     585 <printint+0x88>
    buf[i++] = '-';
 575:	8b 45 f4             	mov    -0xc(%ebp),%eax
 578:	8d 50 01             	lea    0x1(%eax),%edx
 57b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 57e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 583:	eb 1f                	jmp    5a4 <printint+0xa7>
 585:	eb 1d                	jmp    5a4 <printint+0xa7>
    putc(fd, buf[i]);
 587:	8d 55 dc             	lea    -0x24(%ebp),%edx
 58a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58d:	01 d0                	add    %edx,%eax
 58f:	0f b6 00             	movzbl (%eax),%eax
 592:	0f be c0             	movsbl %al,%eax
 595:	89 44 24 04          	mov    %eax,0x4(%esp)
 599:	8b 45 08             	mov    0x8(%ebp),%eax
 59c:	89 04 24             	mov    %eax,(%esp)
 59f:	e8 31 ff ff ff       	call   4d5 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5a4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5a8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5ac:	79 d9                	jns    587 <printint+0x8a>
    putc(fd, buf[i]);
}
 5ae:	83 c4 30             	add    $0x30,%esp
 5b1:	5b                   	pop    %ebx
 5b2:	5e                   	pop    %esi
 5b3:	5d                   	pop    %ebp
 5b4:	c3                   	ret    

000005b5 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5b5:	55                   	push   %ebp
 5b6:	89 e5                	mov    %esp,%ebp
 5b8:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5bb:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5c2:	8d 45 0c             	lea    0xc(%ebp),%eax
 5c5:	83 c0 04             	add    $0x4,%eax
 5c8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5cb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 5d2:	e9 7c 01 00 00       	jmp    753 <printf+0x19e>
    c = fmt[i] & 0xff;
 5d7:	8b 55 0c             	mov    0xc(%ebp),%edx
 5da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 5dd:	01 d0                	add    %edx,%eax
 5df:	0f b6 00             	movzbl (%eax),%eax
 5e2:	0f be c0             	movsbl %al,%eax
 5e5:	25 ff 00 00 00       	and    $0xff,%eax
 5ea:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 5ed:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5f1:	75 2c                	jne    61f <printf+0x6a>
      if(c == '%'){
 5f3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 5f7:	75 0c                	jne    605 <printf+0x50>
        state = '%';
 5f9:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 600:	e9 4a 01 00 00       	jmp    74f <printf+0x19a>
      } else {
        putc(fd, c);
 605:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 608:	0f be c0             	movsbl %al,%eax
 60b:	89 44 24 04          	mov    %eax,0x4(%esp)
 60f:	8b 45 08             	mov    0x8(%ebp),%eax
 612:	89 04 24             	mov    %eax,(%esp)
 615:	e8 bb fe ff ff       	call   4d5 <putc>
 61a:	e9 30 01 00 00       	jmp    74f <printf+0x19a>
      }
    } else if(state == '%'){
 61f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 623:	0f 85 26 01 00 00    	jne    74f <printf+0x19a>
      if(c == 'd'){
 629:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 62d:	75 2d                	jne    65c <printf+0xa7>
        printint(fd, *ap, 10, 1);
 62f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 632:	8b 00                	mov    (%eax),%eax
 634:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 63b:	00 
 63c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 643:	00 
 644:	89 44 24 04          	mov    %eax,0x4(%esp)
 648:	8b 45 08             	mov    0x8(%ebp),%eax
 64b:	89 04 24             	mov    %eax,(%esp)
 64e:	e8 aa fe ff ff       	call   4fd <printint>
        ap++;
 653:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 657:	e9 ec 00 00 00       	jmp    748 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 65c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 660:	74 06                	je     668 <printf+0xb3>
 662:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 666:	75 2d                	jne    695 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 668:	8b 45 e8             	mov    -0x18(%ebp),%eax
 66b:	8b 00                	mov    (%eax),%eax
 66d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 674:	00 
 675:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 67c:	00 
 67d:	89 44 24 04          	mov    %eax,0x4(%esp)
 681:	8b 45 08             	mov    0x8(%ebp),%eax
 684:	89 04 24             	mov    %eax,(%esp)
 687:	e8 71 fe ff ff       	call   4fd <printint>
        ap++;
 68c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 690:	e9 b3 00 00 00       	jmp    748 <printf+0x193>
      } else if(c == 's'){
 695:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 699:	75 45                	jne    6e0 <printf+0x12b>
        s = (char*)*ap;
 69b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 69e:	8b 00                	mov    (%eax),%eax
 6a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6a3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6a7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6ab:	75 09                	jne    6b6 <printf+0x101>
          s = "(null)";
 6ad:	c7 45 f4 0d 0d 00 00 	movl   $0xd0d,-0xc(%ebp)
        while(*s != 0){
 6b4:	eb 1e                	jmp    6d4 <printf+0x11f>
 6b6:	eb 1c                	jmp    6d4 <printf+0x11f>
          putc(fd, *s);
 6b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6bb:	0f b6 00             	movzbl (%eax),%eax
 6be:	0f be c0             	movsbl %al,%eax
 6c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6c5:	8b 45 08             	mov    0x8(%ebp),%eax
 6c8:	89 04 24             	mov    %eax,(%esp)
 6cb:	e8 05 fe ff ff       	call   4d5 <putc>
          s++;
 6d0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d7:	0f b6 00             	movzbl (%eax),%eax
 6da:	84 c0                	test   %al,%al
 6dc:	75 da                	jne    6b8 <printf+0x103>
 6de:	eb 68                	jmp    748 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6e0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 6e4:	75 1d                	jne    703 <printf+0x14e>
        putc(fd, *ap);
 6e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6e9:	8b 00                	mov    (%eax),%eax
 6eb:	0f be c0             	movsbl %al,%eax
 6ee:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f2:	8b 45 08             	mov    0x8(%ebp),%eax
 6f5:	89 04 24             	mov    %eax,(%esp)
 6f8:	e8 d8 fd ff ff       	call   4d5 <putc>
        ap++;
 6fd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 701:	eb 45                	jmp    748 <printf+0x193>
      } else if(c == '%'){
 703:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 707:	75 17                	jne    720 <printf+0x16b>
        putc(fd, c);
 709:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 70c:	0f be c0             	movsbl %al,%eax
 70f:	89 44 24 04          	mov    %eax,0x4(%esp)
 713:	8b 45 08             	mov    0x8(%ebp),%eax
 716:	89 04 24             	mov    %eax,(%esp)
 719:	e8 b7 fd ff ff       	call   4d5 <putc>
 71e:	eb 28                	jmp    748 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 720:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 727:	00 
 728:	8b 45 08             	mov    0x8(%ebp),%eax
 72b:	89 04 24             	mov    %eax,(%esp)
 72e:	e8 a2 fd ff ff       	call   4d5 <putc>
        putc(fd, c);
 733:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 736:	0f be c0             	movsbl %al,%eax
 739:	89 44 24 04          	mov    %eax,0x4(%esp)
 73d:	8b 45 08             	mov    0x8(%ebp),%eax
 740:	89 04 24             	mov    %eax,(%esp)
 743:	e8 8d fd ff ff       	call   4d5 <putc>
      }
      state = 0;
 748:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 74f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 753:	8b 55 0c             	mov    0xc(%ebp),%edx
 756:	8b 45 f0             	mov    -0x10(%ebp),%eax
 759:	01 d0                	add    %edx,%eax
 75b:	0f b6 00             	movzbl (%eax),%eax
 75e:	84 c0                	test   %al,%al
 760:	0f 85 71 fe ff ff    	jne    5d7 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 766:	c9                   	leave  
 767:	c3                   	ret    

00000768 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 768:	55                   	push   %ebp
 769:	89 e5                	mov    %esp,%ebp
 76b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 76e:	8b 45 08             	mov    0x8(%ebp),%eax
 771:	83 e8 08             	sub    $0x8,%eax
 774:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 777:	a1 68 11 00 00       	mov    0x1168,%eax
 77c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 77f:	eb 24                	jmp    7a5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 781:	8b 45 fc             	mov    -0x4(%ebp),%eax
 784:	8b 00                	mov    (%eax),%eax
 786:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 789:	77 12                	ja     79d <free+0x35>
 78b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 791:	77 24                	ja     7b7 <free+0x4f>
 793:	8b 45 fc             	mov    -0x4(%ebp),%eax
 796:	8b 00                	mov    (%eax),%eax
 798:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 79b:	77 1a                	ja     7b7 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 79d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a0:	8b 00                	mov    (%eax),%eax
 7a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7ab:	76 d4                	jbe    781 <free+0x19>
 7ad:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b0:	8b 00                	mov    (%eax),%eax
 7b2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7b5:	76 ca                	jbe    781 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ba:	8b 40 04             	mov    0x4(%eax),%eax
 7bd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7c4:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c7:	01 c2                	add    %eax,%edx
 7c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7cc:	8b 00                	mov    (%eax),%eax
 7ce:	39 c2                	cmp    %eax,%edx
 7d0:	75 24                	jne    7f6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 7d2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d5:	8b 50 04             	mov    0x4(%eax),%edx
 7d8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7db:	8b 00                	mov    (%eax),%eax
 7dd:	8b 40 04             	mov    0x4(%eax),%eax
 7e0:	01 c2                	add    %eax,%edx
 7e2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7eb:	8b 00                	mov    (%eax),%eax
 7ed:	8b 10                	mov    (%eax),%edx
 7ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f2:	89 10                	mov    %edx,(%eax)
 7f4:	eb 0a                	jmp    800 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 7f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f9:	8b 10                	mov    (%eax),%edx
 7fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fe:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 800:	8b 45 fc             	mov    -0x4(%ebp),%eax
 803:	8b 40 04             	mov    0x4(%eax),%eax
 806:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 80d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 810:	01 d0                	add    %edx,%eax
 812:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 815:	75 20                	jne    837 <free+0xcf>
    p->s.size += bp->s.size;
 817:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81a:	8b 50 04             	mov    0x4(%eax),%edx
 81d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 820:	8b 40 04             	mov    0x4(%eax),%eax
 823:	01 c2                	add    %eax,%edx
 825:	8b 45 fc             	mov    -0x4(%ebp),%eax
 828:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 82b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82e:	8b 10                	mov    (%eax),%edx
 830:	8b 45 fc             	mov    -0x4(%ebp),%eax
 833:	89 10                	mov    %edx,(%eax)
 835:	eb 08                	jmp    83f <free+0xd7>
  } else
    p->s.ptr = bp;
 837:	8b 45 fc             	mov    -0x4(%ebp),%eax
 83a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 83d:	89 10                	mov    %edx,(%eax)
  freep = p;
 83f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 842:	a3 68 11 00 00       	mov    %eax,0x1168
}
 847:	c9                   	leave  
 848:	c3                   	ret    

00000849 <morecore>:

static Header*
morecore(uint nu)
{
 849:	55                   	push   %ebp
 84a:	89 e5                	mov    %esp,%ebp
 84c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 84f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 856:	77 07                	ja     85f <morecore+0x16>
    nu = 4096;
 858:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 85f:	8b 45 08             	mov    0x8(%ebp),%eax
 862:	c1 e0 03             	shl    $0x3,%eax
 865:	89 04 24             	mov    %eax,(%esp)
 868:	e8 28 fc ff ff       	call   495 <sbrk>
 86d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 870:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 874:	75 07                	jne    87d <morecore+0x34>
    return 0;
 876:	b8 00 00 00 00       	mov    $0x0,%eax
 87b:	eb 22                	jmp    89f <morecore+0x56>
  hp = (Header*)p;
 87d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 880:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 883:	8b 45 f0             	mov    -0x10(%ebp),%eax
 886:	8b 55 08             	mov    0x8(%ebp),%edx
 889:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 88c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88f:	83 c0 08             	add    $0x8,%eax
 892:	89 04 24             	mov    %eax,(%esp)
 895:	e8 ce fe ff ff       	call   768 <free>
  return freep;
 89a:	a1 68 11 00 00       	mov    0x1168,%eax
}
 89f:	c9                   	leave  
 8a0:	c3                   	ret    

000008a1 <malloc>:

void*
malloc(uint nbytes)
{
 8a1:	55                   	push   %ebp
 8a2:	89 e5                	mov    %esp,%ebp
 8a4:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8a7:	8b 45 08             	mov    0x8(%ebp),%eax
 8aa:	83 c0 07             	add    $0x7,%eax
 8ad:	c1 e8 03             	shr    $0x3,%eax
 8b0:	83 c0 01             	add    $0x1,%eax
 8b3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8b6:	a1 68 11 00 00       	mov    0x1168,%eax
 8bb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8be:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8c2:	75 23                	jne    8e7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8c4:	c7 45 f0 60 11 00 00 	movl   $0x1160,-0x10(%ebp)
 8cb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ce:	a3 68 11 00 00       	mov    %eax,0x1168
 8d3:	a1 68 11 00 00       	mov    0x1168,%eax
 8d8:	a3 60 11 00 00       	mov    %eax,0x1160
    base.s.size = 0;
 8dd:	c7 05 64 11 00 00 00 	movl   $0x0,0x1164
 8e4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ea:	8b 00                	mov    (%eax),%eax
 8ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 8ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f2:	8b 40 04             	mov    0x4(%eax),%eax
 8f5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 8f8:	72 4d                	jb     947 <malloc+0xa6>
      if(p->s.size == nunits)
 8fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8fd:	8b 40 04             	mov    0x4(%eax),%eax
 900:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 903:	75 0c                	jne    911 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 905:	8b 45 f4             	mov    -0xc(%ebp),%eax
 908:	8b 10                	mov    (%eax),%edx
 90a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90d:	89 10                	mov    %edx,(%eax)
 90f:	eb 26                	jmp    937 <malloc+0x96>
      else {
        p->s.size -= nunits;
 911:	8b 45 f4             	mov    -0xc(%ebp),%eax
 914:	8b 40 04             	mov    0x4(%eax),%eax
 917:	2b 45 ec             	sub    -0x14(%ebp),%eax
 91a:	89 c2                	mov    %eax,%edx
 91c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 91f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 922:	8b 45 f4             	mov    -0xc(%ebp),%eax
 925:	8b 40 04             	mov    0x4(%eax),%eax
 928:	c1 e0 03             	shl    $0x3,%eax
 92b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 92e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 931:	8b 55 ec             	mov    -0x14(%ebp),%edx
 934:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 937:	8b 45 f0             	mov    -0x10(%ebp),%eax
 93a:	a3 68 11 00 00       	mov    %eax,0x1168
      return (void*)(p + 1);
 93f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 942:	83 c0 08             	add    $0x8,%eax
 945:	eb 38                	jmp    97f <malloc+0xde>
    }
    if(p == freep)
 947:	a1 68 11 00 00       	mov    0x1168,%eax
 94c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 94f:	75 1b                	jne    96c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 951:	8b 45 ec             	mov    -0x14(%ebp),%eax
 954:	89 04 24             	mov    %eax,(%esp)
 957:	e8 ed fe ff ff       	call   849 <morecore>
 95c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 95f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 963:	75 07                	jne    96c <malloc+0xcb>
        return 0;
 965:	b8 00 00 00 00       	mov    $0x0,%eax
 96a:	eb 13                	jmp    97f <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 96c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 972:	8b 45 f4             	mov    -0xc(%ebp),%eax
 975:	8b 00                	mov    (%eax),%eax
 977:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 97a:	e9 70 ff ff ff       	jmp    8ef <malloc+0x4e>
}
 97f:	c9                   	leave  
 980:	c3                   	ret    

00000981 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 981:	55                   	push   %ebp
 982:	89 e5                	mov    %esp,%ebp
 984:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 987:	8b 55 08             	mov    0x8(%ebp),%edx
 98a:	8b 45 0c             	mov    0xc(%ebp),%eax
 98d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 990:	f0 87 02             	lock xchg %eax,(%edx)
 993:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 996:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 999:	c9                   	leave  
 99a:	c3                   	ret    

0000099b <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 99b:	55                   	push   %ebp
 99c:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 99e:	8b 45 08             	mov    0x8(%ebp),%eax
 9a1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 9a7:	5d                   	pop    %ebp
 9a8:	c3                   	ret    

000009a9 <lock_acquire>:
void lock_acquire(lock_t *lock){
 9a9:	55                   	push   %ebp
 9aa:	89 e5                	mov    %esp,%ebp
 9ac:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 9af:	90                   	nop
 9b0:	8b 45 08             	mov    0x8(%ebp),%eax
 9b3:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 9ba:	00 
 9bb:	89 04 24             	mov    %eax,(%esp)
 9be:	e8 be ff ff ff       	call   981 <xchg>
 9c3:	85 c0                	test   %eax,%eax
 9c5:	75 e9                	jne    9b0 <lock_acquire+0x7>
}
 9c7:	c9                   	leave  
 9c8:	c3                   	ret    

000009c9 <lock_release>:
void lock_release(lock_t *lock){
 9c9:	55                   	push   %ebp
 9ca:	89 e5                	mov    %esp,%ebp
 9cc:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 9cf:	8b 45 08             	mov    0x8(%ebp),%eax
 9d2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 9d9:	00 
 9da:	89 04 24             	mov    %eax,(%esp)
 9dd:	e8 9f ff ff ff       	call   981 <xchg>
}
 9e2:	c9                   	leave  
 9e3:	c3                   	ret    

000009e4 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 9e4:	55                   	push   %ebp
 9e5:	89 e5                	mov    %esp,%ebp
 9e7:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 9ea:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 9f1:	e8 ab fe ff ff       	call   8a1 <malloc>
 9f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 9f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9fc:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 9ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a02:	25 ff 0f 00 00       	and    $0xfff,%eax
 a07:	85 c0                	test   %eax,%eax
 a09:	74 14                	je     a1f <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 a0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0e:	25 ff 0f 00 00       	and    $0xfff,%eax
 a13:	89 c2                	mov    %eax,%edx
 a15:	b8 00 10 00 00       	mov    $0x1000,%eax
 a1a:	29 d0                	sub    %edx,%eax
 a1c:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 a1f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a23:	75 1b                	jne    a40 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 a25:	c7 44 24 04 14 0d 00 	movl   $0xd14,0x4(%esp)
 a2c:	00 
 a2d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a34:	e8 7c fb ff ff       	call   5b5 <printf>
        return 0;
 a39:	b8 00 00 00 00       	mov    $0x0,%eax
 a3e:	eb 6f                	jmp    aaf <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 a40:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 a43:	8b 55 08             	mov    0x8(%ebp),%edx
 a46:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a49:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 a4d:	89 54 24 08          	mov    %edx,0x8(%esp)
 a51:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 a58:	00 
 a59:	89 04 24             	mov    %eax,(%esp)
 a5c:	e8 4c fa ff ff       	call   4ad <clone>
 a61:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 a64:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a68:	79 1b                	jns    a85 <thread_create+0xa1>
        printf(1,"clone fails\n");
 a6a:	c7 44 24 04 22 0d 00 	movl   $0xd22,0x4(%esp)
 a71:	00 
 a72:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a79:	e8 37 fb ff ff       	call   5b5 <printf>
        return 0;
 a7e:	b8 00 00 00 00       	mov    $0x0,%eax
 a83:	eb 2a                	jmp    aaf <thread_create+0xcb>
    }
    if(tid > 0){
 a85:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a89:	7e 05                	jle    a90 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 a8b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a8e:	eb 1f                	jmp    aaf <thread_create+0xcb>
    }
    if(tid == 0){
 a90:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a94:	75 14                	jne    aaa <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 a96:	c7 44 24 04 2f 0d 00 	movl   $0xd2f,0x4(%esp)
 a9d:	00 
 a9e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 aa5:	e8 0b fb ff ff       	call   5b5 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 aaa:	b8 00 00 00 00       	mov    $0x0,%eax
}
 aaf:	c9                   	leave  
 ab0:	c3                   	ret    

00000ab1 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 ab1:	55                   	push   %ebp
 ab2:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 ab4:	8b 45 08             	mov    0x8(%ebp),%eax
 ab7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 abd:	8b 45 08             	mov    0x8(%ebp),%eax
 ac0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 ac7:	8b 45 08             	mov    0x8(%ebp),%eax
 aca:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 ad1:	5d                   	pop    %ebp
 ad2:	c3                   	ret    

00000ad3 <add_q>:

void add_q(struct queue *q, int v){
 ad3:	55                   	push   %ebp
 ad4:	89 e5                	mov    %esp,%ebp
 ad6:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 ad9:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 ae0:	e8 bc fd ff ff       	call   8a1 <malloc>
 ae5:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 ae8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aeb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 af2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af5:	8b 55 0c             	mov    0xc(%ebp),%edx
 af8:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 afa:	8b 45 08             	mov    0x8(%ebp),%eax
 afd:	8b 40 04             	mov    0x4(%eax),%eax
 b00:	85 c0                	test   %eax,%eax
 b02:	75 0b                	jne    b0f <add_q+0x3c>
        q->head = n;
 b04:	8b 45 08             	mov    0x8(%ebp),%eax
 b07:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b0a:	89 50 04             	mov    %edx,0x4(%eax)
 b0d:	eb 0c                	jmp    b1b <add_q+0x48>
    }else{
        q->tail->next = n;
 b0f:	8b 45 08             	mov    0x8(%ebp),%eax
 b12:	8b 40 08             	mov    0x8(%eax),%eax
 b15:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b18:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 b1b:	8b 45 08             	mov    0x8(%ebp),%eax
 b1e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b21:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 b24:	8b 45 08             	mov    0x8(%ebp),%eax
 b27:	8b 00                	mov    (%eax),%eax
 b29:	8d 50 01             	lea    0x1(%eax),%edx
 b2c:	8b 45 08             	mov    0x8(%ebp),%eax
 b2f:	89 10                	mov    %edx,(%eax)
}
 b31:	c9                   	leave  
 b32:	c3                   	ret    

00000b33 <empty_q>:

int empty_q(struct queue *q){
 b33:	55                   	push   %ebp
 b34:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 b36:	8b 45 08             	mov    0x8(%ebp),%eax
 b39:	8b 00                	mov    (%eax),%eax
 b3b:	85 c0                	test   %eax,%eax
 b3d:	75 07                	jne    b46 <empty_q+0x13>
        return 1;
 b3f:	b8 01 00 00 00       	mov    $0x1,%eax
 b44:	eb 05                	jmp    b4b <empty_q+0x18>
    else
        return 0;
 b46:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 b4b:	5d                   	pop    %ebp
 b4c:	c3                   	ret    

00000b4d <pop_q>:
int pop_q(struct queue *q){
 b4d:	55                   	push   %ebp
 b4e:	89 e5                	mov    %esp,%ebp
 b50:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 b53:	8b 45 08             	mov    0x8(%ebp),%eax
 b56:	89 04 24             	mov    %eax,(%esp)
 b59:	e8 d5 ff ff ff       	call   b33 <empty_q>
 b5e:	85 c0                	test   %eax,%eax
 b60:	75 5d                	jne    bbf <pop_q+0x72>
       val = q->head->value; 
 b62:	8b 45 08             	mov    0x8(%ebp),%eax
 b65:	8b 40 04             	mov    0x4(%eax),%eax
 b68:	8b 00                	mov    (%eax),%eax
 b6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 b6d:	8b 45 08             	mov    0x8(%ebp),%eax
 b70:	8b 40 04             	mov    0x4(%eax),%eax
 b73:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 b76:	8b 45 08             	mov    0x8(%ebp),%eax
 b79:	8b 40 04             	mov    0x4(%eax),%eax
 b7c:	8b 50 04             	mov    0x4(%eax),%edx
 b7f:	8b 45 08             	mov    0x8(%ebp),%eax
 b82:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 b85:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b88:	89 04 24             	mov    %eax,(%esp)
 b8b:	e8 d8 fb ff ff       	call   768 <free>
       q->size--;
 b90:	8b 45 08             	mov    0x8(%ebp),%eax
 b93:	8b 00                	mov    (%eax),%eax
 b95:	8d 50 ff             	lea    -0x1(%eax),%edx
 b98:	8b 45 08             	mov    0x8(%ebp),%eax
 b9b:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 b9d:	8b 45 08             	mov    0x8(%ebp),%eax
 ba0:	8b 00                	mov    (%eax),%eax
 ba2:	85 c0                	test   %eax,%eax
 ba4:	75 14                	jne    bba <pop_q+0x6d>
            q->head = 0;
 ba6:	8b 45 08             	mov    0x8(%ebp),%eax
 ba9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 bb0:	8b 45 08             	mov    0x8(%ebp),%eax
 bb3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 bba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bbd:	eb 05                	jmp    bc4 <pop_q+0x77>
    }
    return -1;
 bbf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 bc4:	c9                   	leave  
 bc5:	c3                   	ret    

00000bc6 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 bc6:	55                   	push   %ebp
 bc7:	89 e5                	mov    %esp,%ebp
 bc9:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 bcc:	8b 45 08             	mov    0x8(%ebp),%eax
 bcf:	8b 55 0c             	mov    0xc(%ebp),%edx
 bd2:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 bd5:	8b 45 08             	mov    0x8(%ebp),%eax
 bd8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 bdf:	8b 45 08             	mov    0x8(%ebp),%eax
 be2:	89 04 24             	mov    %eax,(%esp)
 be5:	e8 b1 fd ff ff       	call   99b <lock_init>
}
 bea:	c9                   	leave  
 beb:	c3                   	ret    

00000bec <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 bec:	55                   	push   %ebp
 bed:	89 e5                	mov    %esp,%ebp
 bef:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 bf2:	8b 45 08             	mov    0x8(%ebp),%eax
 bf5:	89 04 24             	mov    %eax,(%esp)
 bf8:	e8 ac fd ff ff       	call   9a9 <lock_acquire>
	if(s->count  == 0){
 bfd:	8b 45 08             	mov    0x8(%ebp),%eax
 c00:	8b 40 04             	mov    0x4(%eax),%eax
 c03:	85 c0                	test   %eax,%eax
 c05:	75 2f                	jne    c36 <sem_aquire+0x4a>
		//add proc to waiters list
		int tid = getpid();
 c07:	e8 81 f8 ff ff       	call   48d <getpid>
 c0c:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 c0f:	8b 45 08             	mov    0x8(%ebp),%eax
 c12:	8d 50 0c             	lea    0xc(%eax),%edx
 c15:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c18:	89 44 24 04          	mov    %eax,0x4(%esp)
 c1c:	89 14 24             	mov    %edx,(%esp)
 c1f:	e8 af fe ff ff       	call   ad3 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 c24:	8b 45 08             	mov    0x8(%ebp),%eax
 c27:	89 04 24             	mov    %eax,(%esp)
 c2a:	e8 9a fd ff ff       	call   9c9 <lock_release>
		tsleep(); 
 c2f:	e8 89 f8 ff ff       	call   4bd <tsleep>
 c34:	eb 1a                	jmp    c50 <sem_aquire+0x64>
	}
	else{
		s->count--;	
 c36:	8b 45 08             	mov    0x8(%ebp),%eax
 c39:	8b 40 04             	mov    0x4(%eax),%eax
 c3c:	8d 50 ff             	lea    -0x1(%eax),%edx
 c3f:	8b 45 08             	mov    0x8(%ebp),%eax
 c42:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 c45:	8b 45 08             	mov    0x8(%ebp),%eax
 c48:	89 04 24             	mov    %eax,(%esp)
 c4b:	e8 79 fd ff ff       	call   9c9 <lock_release>
	}
}
 c50:	c9                   	leave  
 c51:	c3                   	ret    

00000c52 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 c52:	55                   	push   %ebp
 c53:	89 e5                	mov    %esp,%ebp
 c55:	83 ec 28             	sub    $0x28,%esp
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 c58:	8b 45 08             	mov    0x8(%ebp),%eax
 c5b:	89 04 24             	mov    %eax,(%esp)
 c5e:	e8 46 fd ff ff       	call   9a9 <lock_acquire>
	if(s->count < s->size){
 c63:	8b 45 08             	mov    0x8(%ebp),%eax
 c66:	8b 50 04             	mov    0x4(%eax),%edx
 c69:	8b 45 08             	mov    0x8(%ebp),%eax
 c6c:	8b 40 08             	mov    0x8(%eax),%eax
 c6f:	39 c2                	cmp    %eax,%edx
 c71:	7d 40                	jge    cb3 <sem_signal+0x61>
		int tid;
		tid = pop_q(&s->waiters);
 c73:	8b 45 08             	mov    0x8(%ebp),%eax
 c76:	83 c0 0c             	add    $0xc,%eax
 c79:	89 04 24             	mov    %eax,(%esp)
 c7c:	e8 cc fe ff ff       	call   b4d <pop_q>
 c81:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if(tid != -1) twakeup(tid);
 c84:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 c88:	74 0d                	je     c97 <sem_signal+0x45>
 c8a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c8d:	89 04 24             	mov    %eax,(%esp)
 c90:	e8 30 f8 ff ff       	call   4c5 <twakeup>
 c95:	eb 0f                	jmp    ca6 <sem_signal+0x54>
		else s->count++;	
 c97:	8b 45 08             	mov    0x8(%ebp),%eax
 c9a:	8b 40 04             	mov    0x4(%eax),%eax
 c9d:	8d 50 01             	lea    0x1(%eax),%edx
 ca0:	8b 45 08             	mov    0x8(%ebp),%eax
 ca3:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 ca6:	8b 45 08             	mov    0x8(%ebp),%eax
 ca9:	89 04 24             	mov    %eax,(%esp)
 cac:	e8 18 fd ff ff       	call   9c9 <lock_release>
 cb1:	eb 27                	jmp    cda <sem_signal+0x88>
	}
	else{
		int tid;
		tid = pop_q(&s->waiters);
 cb3:	8b 45 08             	mov    0x8(%ebp),%eax
 cb6:	83 c0 0c             	add    $0xc,%eax
 cb9:	89 04 24             	mov    %eax,(%esp)
 cbc:	e8 8c fe ff ff       	call   b4d <pop_q>
 cc1:	89 45 f0             	mov    %eax,-0x10(%ebp)
		twakeup(tid);
 cc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cc7:	89 04 24             	mov    %eax,(%esp)
 cca:	e8 f6 f7 ff ff       	call   4c5 <twakeup>
		lock_release(&s->lock);
 ccf:	8b 45 08             	mov    0x8(%ebp),%eax
 cd2:	89 04 24             	mov    %eax,(%esp)
 cd5:	e8 ef fc ff ff       	call   9c9 <lock_release>
	}

 cda:	c9                   	leave  
 cdb:	c3                   	ret    
