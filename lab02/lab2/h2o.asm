
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
   9:	a1 80 0d 00 00       	mov    0xd80,%eax
   e:	89 44 24 04          	mov    %eax,0x4(%esp)
  12:	c7 04 24 c0 0d 00 00 	movl   $0xdc0,(%esp)
  19:	e8 9e 0b 00 00       	call   bbc <sem_init>
	sem_init(&wait_h, hNum); //Initialize semaphore with 10 slots
  1e:	a1 84 0d 00 00       	mov    0xd84,%eax
  23:	89 44 24 04          	mov    %eax,0x4(%esp)
  27:	c7 04 24 00 0e 00 00 	movl   $0xe00,(%esp)
  2e:	e8 89 0b 00 00       	call   bbc <sem_init>
	
	int i;
	for(i = 0; i < 5; i++) thread_create(oReady, 0);
  33:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  3a:	00 
  3b:	eb 1a                	jmp    57 <main+0x57>
  3d:	b8 e2 00 00 00       	mov    $0xe2,%eax
  42:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  49:	00 
  4a:	89 04 24             	mov    %eax,(%esp)
  4d:	e8 84 09 00 00       	call   9d6 <thread_create>
  52:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  57:	83 7c 24 1c 04       	cmpl   $0x4,0x1c(%esp)
  5c:	7e df                	jle    3d <main+0x3d>
	for(i = 0; i < 10; i++) thread_create(hReady, 0);
  5e:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  65:	00 
  66:	eb 1a                	jmp    82 <main+0x82>
  68:	b8 ab 00 00 00       	mov    $0xab,%eax
  6d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  74:	00 
  75:	89 04 24             	mov    %eax,(%esp)
  78:	e8 59 09 00 00       	call   9d6 <thread_create>
  7d:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  82:	83 7c 24 1c 09       	cmpl   $0x9,0x1c(%esp)
  87:	7e df                	jle    68 <main+0x68>
    while(wait()>0);
  89:	e8 86 03 00 00       	call   414 <wait>
  8e:	85 c0                	test   %eax,%eax
  90:	7f f7                	jg     89 <main+0x89>
	printf(1,"Balanced Reaction\n");
  92:	c7 44 24 04 06 0d 00 	movl   $0xd06,0x4(%esp)
  99:	00 
  9a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a1:	e8 07 05 00 00       	call   5ad <printf>
	exit();
  a6:	e8 61 03 00 00       	call   40c <exit>

000000ab <hReady>:
}

void hReady(){
  ab:	55                   	push   %ebp
  ac:	89 e5                	mov    %esp,%ebp
  ae:	83 ec 18             	sub    $0x18,%esp
  	printf(1, "H\n");  	
  b1:	c7 44 24 04 19 0d 00 	movl   $0xd19,0x4(%esp)
  b8:	00 
  b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c0:	e8 e8 04 00 00       	call   5ad <printf>
	sem_signal(&wait_h);
  c5:	c7 04 24 00 0e 00 00 	movl   $0xe00,(%esp)
  cc:	e8 9f 0b 00 00       	call   c70 <sem_signal>
	sem_aquire(&wait_o);
  d1:	c7 04 24 c0 0d 00 00 	movl   $0xdc0,(%esp)
  d8:	e8 05 0b 00 00       	call   be2 <sem_aquire>
	texit();
  dd:	e8 d2 03 00 00       	call   4b4 <texit>

000000e2 <oReady>:
}

//Oxyegn waits untill there are two hydrogens
void oReady(){
  e2:	55                   	push   %ebp
  e3:	89 e5                	mov    %esp,%ebp
  e5:	83 ec 18             	sub    $0x18,%esp
  printf(1, "O\n");
  e8:	c7 44 24 04 1c 0d 00 	movl   $0xd1c,0x4(%esp)
  ef:	00 
  f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f7:	e8 b1 04 00 00       	call   5ad <printf>
  sem_aquire(&wait_h);
  fc:	c7 04 24 00 0e 00 00 	movl   $0xe00,(%esp)
 103:	e8 da 0a 00 00       	call   be2 <sem_aquire>
  	printf(1, "H-O %d %d\n", wait_h.count, wait_o.count);  
 108:	8b 15 c4 0d 00 00    	mov    0xdc4,%edx
 10e:	a1 04 0e 00 00       	mov    0xe04,%eax
 113:	89 54 24 0c          	mov    %edx,0xc(%esp)
 117:	89 44 24 08          	mov    %eax,0x8(%esp)
 11b:	c7 44 24 04 1f 0d 00 	movl   $0xd1f,0x4(%esp)
 122:	00 
 123:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 12a:	e8 7e 04 00 00       	call   5ad <printf>
  sem_aquire(&wait_h);
 12f:	c7 04 24 00 0e 00 00 	movl   $0xe00,(%esp)
 136:	e8 a7 0a 00 00       	call   be2 <sem_aquire>
  	printf(1, "H-O %d %d\n", wait_h.count, wait_o.count);  
 13b:	8b 15 c4 0d 00 00    	mov    0xdc4,%edx
 141:	a1 04 0e 00 00       	mov    0xe04,%eax
 146:	89 54 24 0c          	mov    %edx,0xc(%esp)
 14a:	89 44 24 08          	mov    %eax,0x8(%esp)
 14e:	c7 44 24 04 1f 0d 00 	movl   $0xd1f,0x4(%esp)
 155:	00 
 156:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 15d:	e8 4b 04 00 00       	call   5ad <printf>
  sem_signal(&wait_o);
 162:	c7 04 24 c0 0d 00 00 	movl   $0xdc0,(%esp)
 169:	e8 02 0b 00 00       	call   c70 <sem_signal>
  sem_signal(&wait_o);
 16e:	c7 04 24 c0 0d 00 00 	movl   $0xdc0,(%esp)
 175:	e8 f6 0a 00 00       	call   c70 <sem_signal>
  	printf(1, "H-O-H %d %d\n", wait_h.count, wait_o.count);  
 17a:	8b 15 c4 0d 00 00    	mov    0xdc4,%edx
 180:	a1 04 0e 00 00       	mov    0xe04,%eax
 185:	89 54 24 0c          	mov    %edx,0xc(%esp)
 189:	89 44 24 08          	mov    %eax,0x8(%esp)
 18d:	c7 44 24 04 2a 0d 00 	movl   $0xd2a,0x4(%esp)
 194:	00 
 195:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 19c:	e8 0c 04 00 00       	call   5ad <printf>
  texit();
 1a1:	e8 0e 03 00 00       	call   4b4 <texit>
 1a6:	90                   	nop
 1a7:	90                   	nop

000001a8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1a8:	55                   	push   %ebp
 1a9:	89 e5                	mov    %esp,%ebp
 1ab:	57                   	push   %edi
 1ac:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1ad:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1b0:	8b 55 10             	mov    0x10(%ebp),%edx
 1b3:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b6:	89 cb                	mov    %ecx,%ebx
 1b8:	89 df                	mov    %ebx,%edi
 1ba:	89 d1                	mov    %edx,%ecx
 1bc:	fc                   	cld    
 1bd:	f3 aa                	rep stos %al,%es:(%edi)
 1bf:	89 ca                	mov    %ecx,%edx
 1c1:	89 fb                	mov    %edi,%ebx
 1c3:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1c6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1c9:	5b                   	pop    %ebx
 1ca:	5f                   	pop    %edi
 1cb:	5d                   	pop    %ebp
 1cc:	c3                   	ret    

000001cd <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1cd:	55                   	push   %ebp
 1ce:	89 e5                	mov    %esp,%ebp
 1d0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1d3:	8b 45 08             	mov    0x8(%ebp),%eax
 1d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 1dc:	0f b6 10             	movzbl (%eax),%edx
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	88 10                	mov    %dl,(%eax)
 1e4:	8b 45 08             	mov    0x8(%ebp),%eax
 1e7:	0f b6 00             	movzbl (%eax),%eax
 1ea:	84 c0                	test   %al,%al
 1ec:	0f 95 c0             	setne  %al
 1ef:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1f3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 1f7:	84 c0                	test   %al,%al
 1f9:	75 de                	jne    1d9 <strcpy+0xc>
    ;
  return os;
 1fb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1fe:	c9                   	leave  
 1ff:	c3                   	ret    

00000200 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 200:	55                   	push   %ebp
 201:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 203:	eb 08                	jmp    20d <strcmp+0xd>
    p++, q++;
 205:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 209:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 20d:	8b 45 08             	mov    0x8(%ebp),%eax
 210:	0f b6 00             	movzbl (%eax),%eax
 213:	84 c0                	test   %al,%al
 215:	74 10                	je     227 <strcmp+0x27>
 217:	8b 45 08             	mov    0x8(%ebp),%eax
 21a:	0f b6 10             	movzbl (%eax),%edx
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	0f b6 00             	movzbl (%eax),%eax
 223:	38 c2                	cmp    %al,%dl
 225:	74 de                	je     205 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 227:	8b 45 08             	mov    0x8(%ebp),%eax
 22a:	0f b6 00             	movzbl (%eax),%eax
 22d:	0f b6 d0             	movzbl %al,%edx
 230:	8b 45 0c             	mov    0xc(%ebp),%eax
 233:	0f b6 00             	movzbl (%eax),%eax
 236:	0f b6 c0             	movzbl %al,%eax
 239:	89 d1                	mov    %edx,%ecx
 23b:	29 c1                	sub    %eax,%ecx
 23d:	89 c8                	mov    %ecx,%eax
}
 23f:	5d                   	pop    %ebp
 240:	c3                   	ret    

00000241 <strlen>:

uint
strlen(char *s)
{
 241:	55                   	push   %ebp
 242:	89 e5                	mov    %esp,%ebp
 244:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 247:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 24e:	eb 04                	jmp    254 <strlen+0x13>
 250:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 254:	8b 45 fc             	mov    -0x4(%ebp),%eax
 257:	03 45 08             	add    0x8(%ebp),%eax
 25a:	0f b6 00             	movzbl (%eax),%eax
 25d:	84 c0                	test   %al,%al
 25f:	75 ef                	jne    250 <strlen+0xf>
    ;
  return n;
 261:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 264:	c9                   	leave  
 265:	c3                   	ret    

00000266 <memset>:

void*
memset(void *dst, int c, uint n)
{
 266:	55                   	push   %ebp
 267:	89 e5                	mov    %esp,%ebp
 269:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 26c:	8b 45 10             	mov    0x10(%ebp),%eax
 26f:	89 44 24 08          	mov    %eax,0x8(%esp)
 273:	8b 45 0c             	mov    0xc(%ebp),%eax
 276:	89 44 24 04          	mov    %eax,0x4(%esp)
 27a:	8b 45 08             	mov    0x8(%ebp),%eax
 27d:	89 04 24             	mov    %eax,(%esp)
 280:	e8 23 ff ff ff       	call   1a8 <stosb>
  return dst;
 285:	8b 45 08             	mov    0x8(%ebp),%eax
}
 288:	c9                   	leave  
 289:	c3                   	ret    

0000028a <strchr>:

char*
strchr(const char *s, char c)
{
 28a:	55                   	push   %ebp
 28b:	89 e5                	mov    %esp,%ebp
 28d:	83 ec 04             	sub    $0x4,%esp
 290:	8b 45 0c             	mov    0xc(%ebp),%eax
 293:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 296:	eb 14                	jmp    2ac <strchr+0x22>
    if(*s == c)
 298:	8b 45 08             	mov    0x8(%ebp),%eax
 29b:	0f b6 00             	movzbl (%eax),%eax
 29e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2a1:	75 05                	jne    2a8 <strchr+0x1e>
      return (char*)s;
 2a3:	8b 45 08             	mov    0x8(%ebp),%eax
 2a6:	eb 13                	jmp    2bb <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2a8:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2ac:	8b 45 08             	mov    0x8(%ebp),%eax
 2af:	0f b6 00             	movzbl (%eax),%eax
 2b2:	84 c0                	test   %al,%al
 2b4:	75 e2                	jne    298 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2b6:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2bb:	c9                   	leave  
 2bc:	c3                   	ret    

000002bd <gets>:

char*
gets(char *buf, int max)
{
 2bd:	55                   	push   %ebp
 2be:	89 e5                	mov    %esp,%ebp
 2c0:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2c3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 2ca:	eb 44                	jmp    310 <gets+0x53>
    cc = read(0, &c, 1);
 2cc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2d3:	00 
 2d4:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 2db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2e2:	e8 3d 01 00 00       	call   424 <read>
 2e7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 2ea:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2ee:	7e 2d                	jle    31d <gets+0x60>
      break;
    buf[i++] = c;
 2f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2f3:	03 45 08             	add    0x8(%ebp),%eax
 2f6:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 2fa:	88 10                	mov    %dl,(%eax)
 2fc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 300:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 304:	3c 0a                	cmp    $0xa,%al
 306:	74 16                	je     31e <gets+0x61>
 308:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 30c:	3c 0d                	cmp    $0xd,%al
 30e:	74 0e                	je     31e <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 310:	8b 45 f0             	mov    -0x10(%ebp),%eax
 313:	83 c0 01             	add    $0x1,%eax
 316:	3b 45 0c             	cmp    0xc(%ebp),%eax
 319:	7c b1                	jl     2cc <gets+0xf>
 31b:	eb 01                	jmp    31e <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 31d:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 31e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 321:	03 45 08             	add    0x8(%ebp),%eax
 324:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 327:	8b 45 08             	mov    0x8(%ebp),%eax
}
 32a:	c9                   	leave  
 32b:	c3                   	ret    

0000032c <stat>:

int
stat(char *n, struct stat *st)
{
 32c:	55                   	push   %ebp
 32d:	89 e5                	mov    %esp,%ebp
 32f:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 332:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 339:	00 
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
 33d:	89 04 24             	mov    %eax,(%esp)
 340:	e8 07 01 00 00       	call   44c <open>
 345:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 348:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 34c:	79 07                	jns    355 <stat+0x29>
    return -1;
 34e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 353:	eb 23                	jmp    378 <stat+0x4c>
  r = fstat(fd, st);
 355:	8b 45 0c             	mov    0xc(%ebp),%eax
 358:	89 44 24 04          	mov    %eax,0x4(%esp)
 35c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 35f:	89 04 24             	mov    %eax,(%esp)
 362:	e8 fd 00 00 00       	call   464 <fstat>
 367:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 36a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 36d:	89 04 24             	mov    %eax,(%esp)
 370:	e8 bf 00 00 00       	call   434 <close>
  return r;
 375:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 378:	c9                   	leave  
 379:	c3                   	ret    

0000037a <atoi>:

int
atoi(const char *s)
{
 37a:	55                   	push   %ebp
 37b:	89 e5                	mov    %esp,%ebp
 37d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 380:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 387:	eb 24                	jmp    3ad <atoi+0x33>
    n = n*10 + *s++ - '0';
 389:	8b 55 fc             	mov    -0x4(%ebp),%edx
 38c:	89 d0                	mov    %edx,%eax
 38e:	c1 e0 02             	shl    $0x2,%eax
 391:	01 d0                	add    %edx,%eax
 393:	01 c0                	add    %eax,%eax
 395:	89 c2                	mov    %eax,%edx
 397:	8b 45 08             	mov    0x8(%ebp),%eax
 39a:	0f b6 00             	movzbl (%eax),%eax
 39d:	0f be c0             	movsbl %al,%eax
 3a0:	8d 04 02             	lea    (%edx,%eax,1),%eax
 3a3:	83 e8 30             	sub    $0x30,%eax
 3a6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 3a9:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3ad:	8b 45 08             	mov    0x8(%ebp),%eax
 3b0:	0f b6 00             	movzbl (%eax),%eax
 3b3:	3c 2f                	cmp    $0x2f,%al
 3b5:	7e 0a                	jle    3c1 <atoi+0x47>
 3b7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ba:	0f b6 00             	movzbl (%eax),%eax
 3bd:	3c 39                	cmp    $0x39,%al
 3bf:	7e c8                	jle    389 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3c4:	c9                   	leave  
 3c5:	c3                   	ret    

000003c6 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3c6:	55                   	push   %ebp
 3c7:	89 e5                	mov    %esp,%ebp
 3c9:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 3d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 3d8:	eb 13                	jmp    3ed <memmove+0x27>
    *dst++ = *src++;
 3da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3dd:	0f b6 10             	movzbl (%eax),%edx
 3e0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3e3:	88 10                	mov    %dl,(%eax)
 3e5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 3e9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3ed:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 3f1:	0f 9f c0             	setg   %al
 3f4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 3f8:	84 c0                	test   %al,%al
 3fa:	75 de                	jne    3da <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 3fc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3ff:	c9                   	leave  
 400:	c3                   	ret    
 401:	90                   	nop
 402:	90                   	nop
 403:	90                   	nop

00000404 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 404:	b8 01 00 00 00       	mov    $0x1,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <exit>:
SYSCALL(exit)
 40c:	b8 02 00 00 00       	mov    $0x2,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <wait>:
SYSCALL(wait)
 414:	b8 03 00 00 00       	mov    $0x3,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <pipe>:
SYSCALL(pipe)
 41c:	b8 04 00 00 00       	mov    $0x4,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <read>:
SYSCALL(read)
 424:	b8 05 00 00 00       	mov    $0x5,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <write>:
SYSCALL(write)
 42c:	b8 10 00 00 00       	mov    $0x10,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <close>:
SYSCALL(close)
 434:	b8 15 00 00 00       	mov    $0x15,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <kill>:
SYSCALL(kill)
 43c:	b8 06 00 00 00       	mov    $0x6,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <exec>:
SYSCALL(exec)
 444:	b8 07 00 00 00       	mov    $0x7,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <open>:
SYSCALL(open)
 44c:	b8 0f 00 00 00       	mov    $0xf,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <mknod>:
SYSCALL(mknod)
 454:	b8 11 00 00 00       	mov    $0x11,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <unlink>:
SYSCALL(unlink)
 45c:	b8 12 00 00 00       	mov    $0x12,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <fstat>:
SYSCALL(fstat)
 464:	b8 08 00 00 00       	mov    $0x8,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <link>:
SYSCALL(link)
 46c:	b8 13 00 00 00       	mov    $0x13,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <mkdir>:
SYSCALL(mkdir)
 474:	b8 14 00 00 00       	mov    $0x14,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <chdir>:
SYSCALL(chdir)
 47c:	b8 09 00 00 00       	mov    $0x9,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <dup>:
SYSCALL(dup)
 484:	b8 0a 00 00 00       	mov    $0xa,%eax
 489:	cd 40                	int    $0x40
 48b:	c3                   	ret    

0000048c <getpid>:
SYSCALL(getpid)
 48c:	b8 0b 00 00 00       	mov    $0xb,%eax
 491:	cd 40                	int    $0x40
 493:	c3                   	ret    

00000494 <sbrk>:
SYSCALL(sbrk)
 494:	b8 0c 00 00 00       	mov    $0xc,%eax
 499:	cd 40                	int    $0x40
 49b:	c3                   	ret    

0000049c <sleep>:
SYSCALL(sleep)
 49c:	b8 0d 00 00 00       	mov    $0xd,%eax
 4a1:	cd 40                	int    $0x40
 4a3:	c3                   	ret    

000004a4 <uptime>:
SYSCALL(uptime)
 4a4:	b8 0e 00 00 00       	mov    $0xe,%eax
 4a9:	cd 40                	int    $0x40
 4ab:	c3                   	ret    

000004ac <clone>:
SYSCALL(clone)
 4ac:	b8 16 00 00 00       	mov    $0x16,%eax
 4b1:	cd 40                	int    $0x40
 4b3:	c3                   	ret    

000004b4 <texit>:
SYSCALL(texit)
 4b4:	b8 17 00 00 00       	mov    $0x17,%eax
 4b9:	cd 40                	int    $0x40
 4bb:	c3                   	ret    

000004bc <tsleep>:
SYSCALL(tsleep)
 4bc:	b8 18 00 00 00       	mov    $0x18,%eax
 4c1:	cd 40                	int    $0x40
 4c3:	c3                   	ret    

000004c4 <twakeup>:
SYSCALL(twakeup)
 4c4:	b8 19 00 00 00       	mov    $0x19,%eax
 4c9:	cd 40                	int    $0x40
 4cb:	c3                   	ret    

000004cc <test>:
SYSCALL(test)
 4cc:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4d1:	cd 40                	int    $0x40
 4d3:	c3                   	ret    

000004d4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	83 ec 28             	sub    $0x28,%esp
 4da:	8b 45 0c             	mov    0xc(%ebp),%eax
 4dd:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4e0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4e7:	00 
 4e8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 4eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ef:	8b 45 08             	mov    0x8(%ebp),%eax
 4f2:	89 04 24             	mov    %eax,(%esp)
 4f5:	e8 32 ff ff ff       	call   42c <write>
}
 4fa:	c9                   	leave  
 4fb:	c3                   	ret    

000004fc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4fc:	55                   	push   %ebp
 4fd:	89 e5                	mov    %esp,%ebp
 4ff:	53                   	push   %ebx
 500:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 503:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 50a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 50e:	74 17                	je     527 <printint+0x2b>
 510:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 514:	79 11                	jns    527 <printint+0x2b>
    neg = 1;
 516:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 51d:	8b 45 0c             	mov    0xc(%ebp),%eax
 520:	f7 d8                	neg    %eax
 522:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 525:	eb 06                	jmp    52d <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 527:	8b 45 0c             	mov    0xc(%ebp),%eax
 52a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 52d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 534:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 537:	8b 5d 10             	mov    0x10(%ebp),%ebx
 53a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 53d:	ba 00 00 00 00       	mov    $0x0,%edx
 542:	f7 f3                	div    %ebx
 544:	89 d0                	mov    %edx,%eax
 546:	0f b6 80 88 0d 00 00 	movzbl 0xd88(%eax),%eax
 54d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 551:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 555:	8b 45 10             	mov    0x10(%ebp),%eax
 558:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 55b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 55e:	ba 00 00 00 00       	mov    $0x0,%edx
 563:	f7 75 d4             	divl   -0x2c(%ebp)
 566:	89 45 f4             	mov    %eax,-0xc(%ebp)
 569:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 56d:	75 c5                	jne    534 <printint+0x38>
  if(neg)
 56f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 573:	74 28                	je     59d <printint+0xa1>
    buf[i++] = '-';
 575:	8b 45 ec             	mov    -0x14(%ebp),%eax
 578:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 57d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 581:	eb 1a                	jmp    59d <printint+0xa1>
    putc(fd, buf[i]);
 583:	8b 45 ec             	mov    -0x14(%ebp),%eax
 586:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 58b:	0f be c0             	movsbl %al,%eax
 58e:	89 44 24 04          	mov    %eax,0x4(%esp)
 592:	8b 45 08             	mov    0x8(%ebp),%eax
 595:	89 04 24             	mov    %eax,(%esp)
 598:	e8 37 ff ff ff       	call   4d4 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 59d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 5a1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5a5:	79 dc                	jns    583 <printint+0x87>
    putc(fd, buf[i]);
}
 5a7:	83 c4 44             	add    $0x44,%esp
 5aa:	5b                   	pop    %ebx
 5ab:	5d                   	pop    %ebp
 5ac:	c3                   	ret    

000005ad <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5ad:	55                   	push   %ebp
 5ae:	89 e5                	mov    %esp,%ebp
 5b0:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5b3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5ba:	8d 45 0c             	lea    0xc(%ebp),%eax
 5bd:	83 c0 04             	add    $0x4,%eax
 5c0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 5c3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 5ca:	e9 7e 01 00 00       	jmp    74d <printf+0x1a0>
    c = fmt[i] & 0xff;
 5cf:	8b 55 0c             	mov    0xc(%ebp),%edx
 5d2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5d5:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5d8:	0f b6 00             	movzbl (%eax),%eax
 5db:	0f be c0             	movsbl %al,%eax
 5de:	25 ff 00 00 00       	and    $0xff,%eax
 5e3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 5e6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5ea:	75 2c                	jne    618 <printf+0x6b>
      if(c == '%'){
 5ec:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5f0:	75 0c                	jne    5fe <printf+0x51>
        state = '%';
 5f2:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 5f9:	e9 4b 01 00 00       	jmp    749 <printf+0x19c>
      } else {
        putc(fd, c);
 5fe:	8b 45 e8             	mov    -0x18(%ebp),%eax
 601:	0f be c0             	movsbl %al,%eax
 604:	89 44 24 04          	mov    %eax,0x4(%esp)
 608:	8b 45 08             	mov    0x8(%ebp),%eax
 60b:	89 04 24             	mov    %eax,(%esp)
 60e:	e8 c1 fe ff ff       	call   4d4 <putc>
 613:	e9 31 01 00 00       	jmp    749 <printf+0x19c>
      }
    } else if(state == '%'){
 618:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 61c:	0f 85 27 01 00 00    	jne    749 <printf+0x19c>
      if(c == 'd'){
 622:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 626:	75 2d                	jne    655 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 628:	8b 45 f4             	mov    -0xc(%ebp),%eax
 62b:	8b 00                	mov    (%eax),%eax
 62d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 634:	00 
 635:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 63c:	00 
 63d:	89 44 24 04          	mov    %eax,0x4(%esp)
 641:	8b 45 08             	mov    0x8(%ebp),%eax
 644:	89 04 24             	mov    %eax,(%esp)
 647:	e8 b0 fe ff ff       	call   4fc <printint>
        ap++;
 64c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 650:	e9 ed 00 00 00       	jmp    742 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 655:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 659:	74 06                	je     661 <printf+0xb4>
 65b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 65f:	75 2d                	jne    68e <printf+0xe1>
        printint(fd, *ap, 16, 0);
 661:	8b 45 f4             	mov    -0xc(%ebp),%eax
 664:	8b 00                	mov    (%eax),%eax
 666:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 66d:	00 
 66e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 675:	00 
 676:	89 44 24 04          	mov    %eax,0x4(%esp)
 67a:	8b 45 08             	mov    0x8(%ebp),%eax
 67d:	89 04 24             	mov    %eax,(%esp)
 680:	e8 77 fe ff ff       	call   4fc <printint>
        ap++;
 685:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 689:	e9 b4 00 00 00       	jmp    742 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 68e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 692:	75 46                	jne    6da <printf+0x12d>
        s = (char*)*ap;
 694:	8b 45 f4             	mov    -0xc(%ebp),%eax
 697:	8b 00                	mov    (%eax),%eax
 699:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 69c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 6a0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 6a4:	75 27                	jne    6cd <printf+0x120>
          s = "(null)";
 6a6:	c7 45 e4 37 0d 00 00 	movl   $0xd37,-0x1c(%ebp)
        while(*s != 0){
 6ad:	eb 1f                	jmp    6ce <printf+0x121>
          putc(fd, *s);
 6af:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6b2:	0f b6 00             	movzbl (%eax),%eax
 6b5:	0f be c0             	movsbl %al,%eax
 6b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bc:	8b 45 08             	mov    0x8(%ebp),%eax
 6bf:	89 04 24             	mov    %eax,(%esp)
 6c2:	e8 0d fe ff ff       	call   4d4 <putc>
          s++;
 6c7:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 6cb:	eb 01                	jmp    6ce <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6cd:	90                   	nop
 6ce:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d1:	0f b6 00             	movzbl (%eax),%eax
 6d4:	84 c0                	test   %al,%al
 6d6:	75 d7                	jne    6af <printf+0x102>
 6d8:	eb 68                	jmp    742 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6da:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 6de:	75 1d                	jne    6fd <printf+0x150>
        putc(fd, *ap);
 6e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e3:	8b 00                	mov    (%eax),%eax
 6e5:	0f be c0             	movsbl %al,%eax
 6e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ec:	8b 45 08             	mov    0x8(%ebp),%eax
 6ef:	89 04 24             	mov    %eax,(%esp)
 6f2:	e8 dd fd ff ff       	call   4d4 <putc>
        ap++;
 6f7:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 6fb:	eb 45                	jmp    742 <printf+0x195>
      } else if(c == '%'){
 6fd:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 701:	75 17                	jne    71a <printf+0x16d>
        putc(fd, c);
 703:	8b 45 e8             	mov    -0x18(%ebp),%eax
 706:	0f be c0             	movsbl %al,%eax
 709:	89 44 24 04          	mov    %eax,0x4(%esp)
 70d:	8b 45 08             	mov    0x8(%ebp),%eax
 710:	89 04 24             	mov    %eax,(%esp)
 713:	e8 bc fd ff ff       	call   4d4 <putc>
 718:	eb 28                	jmp    742 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 71a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 721:	00 
 722:	8b 45 08             	mov    0x8(%ebp),%eax
 725:	89 04 24             	mov    %eax,(%esp)
 728:	e8 a7 fd ff ff       	call   4d4 <putc>
        putc(fd, c);
 72d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 730:	0f be c0             	movsbl %al,%eax
 733:	89 44 24 04          	mov    %eax,0x4(%esp)
 737:	8b 45 08             	mov    0x8(%ebp),%eax
 73a:	89 04 24             	mov    %eax,(%esp)
 73d:	e8 92 fd ff ff       	call   4d4 <putc>
      }
      state = 0;
 742:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 749:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 74d:	8b 55 0c             	mov    0xc(%ebp),%edx
 750:	8b 45 ec             	mov    -0x14(%ebp),%eax
 753:	8d 04 02             	lea    (%edx,%eax,1),%eax
 756:	0f b6 00             	movzbl (%eax),%eax
 759:	84 c0                	test   %al,%al
 75b:	0f 85 6e fe ff ff    	jne    5cf <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 761:	c9                   	leave  
 762:	c3                   	ret    
 763:	90                   	nop

00000764 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 764:	55                   	push   %ebp
 765:	89 e5                	mov    %esp,%ebp
 767:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 76a:	8b 45 08             	mov    0x8(%ebp),%eax
 76d:	83 e8 08             	sub    $0x8,%eax
 770:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 773:	a1 a8 0d 00 00       	mov    0xda8,%eax
 778:	89 45 fc             	mov    %eax,-0x4(%ebp)
 77b:	eb 24                	jmp    7a1 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 77d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 780:	8b 00                	mov    (%eax),%eax
 782:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 785:	77 12                	ja     799 <free+0x35>
 787:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 78d:	77 24                	ja     7b3 <free+0x4f>
 78f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 792:	8b 00                	mov    (%eax),%eax
 794:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 797:	77 1a                	ja     7b3 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 799:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79c:	8b 00                	mov    (%eax),%eax
 79e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7a1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a7:	76 d4                	jbe    77d <free+0x19>
 7a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ac:	8b 00                	mov    (%eax),%eax
 7ae:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7b1:	76 ca                	jbe    77d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b6:	8b 40 04             	mov    0x4(%eax),%eax
 7b9:	c1 e0 03             	shl    $0x3,%eax
 7bc:	89 c2                	mov    %eax,%edx
 7be:	03 55 f8             	add    -0x8(%ebp),%edx
 7c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c4:	8b 00                	mov    (%eax),%eax
 7c6:	39 c2                	cmp    %eax,%edx
 7c8:	75 24                	jne    7ee <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 7ca:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7cd:	8b 50 04             	mov    0x4(%eax),%edx
 7d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d3:	8b 00                	mov    (%eax),%eax
 7d5:	8b 40 04             	mov    0x4(%eax),%eax
 7d8:	01 c2                	add    %eax,%edx
 7da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7dd:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e3:	8b 00                	mov    (%eax),%eax
 7e5:	8b 10                	mov    (%eax),%edx
 7e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ea:	89 10                	mov    %edx,(%eax)
 7ec:	eb 0a                	jmp    7f8 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 7ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f1:	8b 10                	mov    (%eax),%edx
 7f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7fb:	8b 40 04             	mov    0x4(%eax),%eax
 7fe:	c1 e0 03             	shl    $0x3,%eax
 801:	03 45 fc             	add    -0x4(%ebp),%eax
 804:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 807:	75 20                	jne    829 <free+0xc5>
    p->s.size += bp->s.size;
 809:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80c:	8b 50 04             	mov    0x4(%eax),%edx
 80f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 812:	8b 40 04             	mov    0x4(%eax),%eax
 815:	01 c2                	add    %eax,%edx
 817:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 81d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 820:	8b 10                	mov    (%eax),%edx
 822:	8b 45 fc             	mov    -0x4(%ebp),%eax
 825:	89 10                	mov    %edx,(%eax)
 827:	eb 08                	jmp    831 <free+0xcd>
  } else
    p->s.ptr = bp;
 829:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 82f:	89 10                	mov    %edx,(%eax)
  freep = p;
 831:	8b 45 fc             	mov    -0x4(%ebp),%eax
 834:	a3 a8 0d 00 00       	mov    %eax,0xda8
}
 839:	c9                   	leave  
 83a:	c3                   	ret    

0000083b <morecore>:

static Header*
morecore(uint nu)
{
 83b:	55                   	push   %ebp
 83c:	89 e5                	mov    %esp,%ebp
 83e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 841:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 848:	77 07                	ja     851 <morecore+0x16>
    nu = 4096;
 84a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 851:	8b 45 08             	mov    0x8(%ebp),%eax
 854:	c1 e0 03             	shl    $0x3,%eax
 857:	89 04 24             	mov    %eax,(%esp)
 85a:	e8 35 fc ff ff       	call   494 <sbrk>
 85f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 862:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 866:	75 07                	jne    86f <morecore+0x34>
    return 0;
 868:	b8 00 00 00 00       	mov    $0x0,%eax
 86d:	eb 22                	jmp    891 <morecore+0x56>
  hp = (Header*)p;
 86f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 872:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 875:	8b 45 f4             	mov    -0xc(%ebp),%eax
 878:	8b 55 08             	mov    0x8(%ebp),%edx
 87b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 87e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 881:	83 c0 08             	add    $0x8,%eax
 884:	89 04 24             	mov    %eax,(%esp)
 887:	e8 d8 fe ff ff       	call   764 <free>
  return freep;
 88c:	a1 a8 0d 00 00       	mov    0xda8,%eax
}
 891:	c9                   	leave  
 892:	c3                   	ret    

00000893 <malloc>:

void*
malloc(uint nbytes)
{
 893:	55                   	push   %ebp
 894:	89 e5                	mov    %esp,%ebp
 896:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 899:	8b 45 08             	mov    0x8(%ebp),%eax
 89c:	83 c0 07             	add    $0x7,%eax
 89f:	c1 e8 03             	shr    $0x3,%eax
 8a2:	83 c0 01             	add    $0x1,%eax
 8a5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 8a8:	a1 a8 0d 00 00       	mov    0xda8,%eax
 8ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8b0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8b4:	75 23                	jne    8d9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8b6:	c7 45 f0 a0 0d 00 00 	movl   $0xda0,-0x10(%ebp)
 8bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c0:	a3 a8 0d 00 00       	mov    %eax,0xda8
 8c5:	a1 a8 0d 00 00       	mov    0xda8,%eax
 8ca:	a3 a0 0d 00 00       	mov    %eax,0xda0
    base.s.size = 0;
 8cf:	c7 05 a4 0d 00 00 00 	movl   $0x0,0xda4
 8d6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dc:	8b 00                	mov    (%eax),%eax
 8de:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 8e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8e4:	8b 40 04             	mov    0x4(%eax),%eax
 8e7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8ea:	72 4d                	jb     939 <malloc+0xa6>
      if(p->s.size == nunits)
 8ec:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8ef:	8b 40 04             	mov    0x4(%eax),%eax
 8f2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8f5:	75 0c                	jne    903 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8f7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8fa:	8b 10                	mov    (%eax),%edx
 8fc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ff:	89 10                	mov    %edx,(%eax)
 901:	eb 26                	jmp    929 <malloc+0x96>
      else {
        p->s.size -= nunits;
 903:	8b 45 ec             	mov    -0x14(%ebp),%eax
 906:	8b 40 04             	mov    0x4(%eax),%eax
 909:	89 c2                	mov    %eax,%edx
 90b:	2b 55 f4             	sub    -0xc(%ebp),%edx
 90e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 911:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 914:	8b 45 ec             	mov    -0x14(%ebp),%eax
 917:	8b 40 04             	mov    0x4(%eax),%eax
 91a:	c1 e0 03             	shl    $0x3,%eax
 91d:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 920:	8b 45 ec             	mov    -0x14(%ebp),%eax
 923:	8b 55 f4             	mov    -0xc(%ebp),%edx
 926:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 929:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92c:	a3 a8 0d 00 00       	mov    %eax,0xda8
      return (void*)(p + 1);
 931:	8b 45 ec             	mov    -0x14(%ebp),%eax
 934:	83 c0 08             	add    $0x8,%eax
 937:	eb 38                	jmp    971 <malloc+0xde>
    }
    if(p == freep)
 939:	a1 a8 0d 00 00       	mov    0xda8,%eax
 93e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 941:	75 1b                	jne    95e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 943:	8b 45 f4             	mov    -0xc(%ebp),%eax
 946:	89 04 24             	mov    %eax,(%esp)
 949:	e8 ed fe ff ff       	call   83b <morecore>
 94e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 951:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 955:	75 07                	jne    95e <malloc+0xcb>
        return 0;
 957:	b8 00 00 00 00       	mov    $0x0,%eax
 95c:	eb 13                	jmp    971 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 95e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 961:	89 45 f0             	mov    %eax,-0x10(%ebp)
 964:	8b 45 ec             	mov    -0x14(%ebp),%eax
 967:	8b 00                	mov    (%eax),%eax
 969:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 96c:	e9 70 ff ff ff       	jmp    8e1 <malloc+0x4e>
}
 971:	c9                   	leave  
 972:	c3                   	ret    
 973:	90                   	nop

00000974 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 974:	55                   	push   %ebp
 975:	89 e5                	mov    %esp,%ebp
 977:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 97a:	8b 55 08             	mov    0x8(%ebp),%edx
 97d:	8b 45 0c             	mov    0xc(%ebp),%eax
 980:	8b 4d 08             	mov    0x8(%ebp),%ecx
 983:	f0 87 02             	lock xchg %eax,(%edx)
 986:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 989:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 98c:	c9                   	leave  
 98d:	c3                   	ret    

0000098e <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 98e:	55                   	push   %ebp
 98f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 991:	8b 45 08             	mov    0x8(%ebp),%eax
 994:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 99a:	5d                   	pop    %ebp
 99b:	c3                   	ret    

0000099c <lock_acquire>:
void lock_acquire(lock_t *lock){
 99c:	55                   	push   %ebp
 99d:	89 e5                	mov    %esp,%ebp
 99f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 9a2:	8b 45 08             	mov    0x8(%ebp),%eax
 9a5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 9ac:	00 
 9ad:	89 04 24             	mov    %eax,(%esp)
 9b0:	e8 bf ff ff ff       	call   974 <xchg>
 9b5:	85 c0                	test   %eax,%eax
 9b7:	75 e9                	jne    9a2 <lock_acquire+0x6>
}
 9b9:	c9                   	leave  
 9ba:	c3                   	ret    

000009bb <lock_release>:
void lock_release(lock_t *lock){
 9bb:	55                   	push   %ebp
 9bc:	89 e5                	mov    %esp,%ebp
 9be:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 9c1:	8b 45 08             	mov    0x8(%ebp),%eax
 9c4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 9cb:	00 
 9cc:	89 04 24             	mov    %eax,(%esp)
 9cf:	e8 a0 ff ff ff       	call   974 <xchg>
}
 9d4:	c9                   	leave  
 9d5:	c3                   	ret    

000009d6 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 9d6:	55                   	push   %ebp
 9d7:	89 e5                	mov    %esp,%ebp
 9d9:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 9dc:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 9e3:	e8 ab fe ff ff       	call   893 <malloc>
 9e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 9eb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 9f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f4:	25 ff 0f 00 00       	and    $0xfff,%eax
 9f9:	85 c0                	test   %eax,%eax
 9fb:	74 15                	je     a12 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 9fd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a00:	89 c2                	mov    %eax,%edx
 a02:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 a08:	b8 00 10 00 00       	mov    $0x1000,%eax
 a0d:	29 d0                	sub    %edx,%eax
 a0f:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 a12:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a16:	75 1b                	jne    a33 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 a18:	c7 44 24 04 3e 0d 00 	movl   $0xd3e,0x4(%esp)
 a1f:	00 
 a20:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a27:	e8 81 fb ff ff       	call   5ad <printf>
        return 0;
 a2c:	b8 00 00 00 00       	mov    $0x0,%eax
 a31:	eb 6f                	jmp    aa2 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 a33:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 a36:	8b 55 08             	mov    0x8(%ebp),%edx
 a39:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a3c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 a40:	89 54 24 08          	mov    %edx,0x8(%esp)
 a44:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 a4b:	00 
 a4c:	89 04 24             	mov    %eax,(%esp)
 a4f:	e8 58 fa ff ff       	call   4ac <clone>
 a54:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 a57:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a5b:	79 1b                	jns    a78 <thread_create+0xa2>
        printf(1,"clone fails\n");
 a5d:	c7 44 24 04 4c 0d 00 	movl   $0xd4c,0x4(%esp)
 a64:	00 
 a65:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a6c:	e8 3c fb ff ff       	call   5ad <printf>
        return 0;
 a71:	b8 00 00 00 00       	mov    $0x0,%eax
 a76:	eb 2a                	jmp    aa2 <thread_create+0xcc>
    }
    if(tid > 0){
 a78:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a7c:	7e 05                	jle    a83 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 a7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a81:	eb 1f                	jmp    aa2 <thread_create+0xcc>
    }
    if(tid == 0){
 a83:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a87:	75 14                	jne    a9d <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 a89:	c7 44 24 04 59 0d 00 	movl   $0xd59,0x4(%esp)
 a90:	00 
 a91:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a98:	e8 10 fb ff ff       	call   5ad <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 a9d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 aa2:	c9                   	leave  
 aa3:	c3                   	ret    

00000aa4 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 aa4:	55                   	push   %ebp
 aa5:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 aa7:	8b 45 08             	mov    0x8(%ebp),%eax
 aaa:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 ab0:	8b 45 08             	mov    0x8(%ebp),%eax
 ab3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 aba:	8b 45 08             	mov    0x8(%ebp),%eax
 abd:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 ac4:	5d                   	pop    %ebp
 ac5:	c3                   	ret    

00000ac6 <add_q>:

void add_q(struct queue *q, int v){
 ac6:	55                   	push   %ebp
 ac7:	89 e5                	mov    %esp,%ebp
 ac9:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 acc:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 ad3:	e8 bb fd ff ff       	call   893 <malloc>
 ad8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 adb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ade:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 ae5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae8:	8b 55 0c             	mov    0xc(%ebp),%edx
 aeb:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 aed:	8b 45 08             	mov    0x8(%ebp),%eax
 af0:	8b 40 04             	mov    0x4(%eax),%eax
 af3:	85 c0                	test   %eax,%eax
 af5:	75 0b                	jne    b02 <add_q+0x3c>
        q->head = n;
 af7:	8b 45 08             	mov    0x8(%ebp),%eax
 afa:	8b 55 f4             	mov    -0xc(%ebp),%edx
 afd:	89 50 04             	mov    %edx,0x4(%eax)
 b00:	eb 0c                	jmp    b0e <add_q+0x48>
    }else{
        q->tail->next = n;
 b02:	8b 45 08             	mov    0x8(%ebp),%eax
 b05:	8b 40 08             	mov    0x8(%eax),%eax
 b08:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b0b:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 b0e:	8b 45 08             	mov    0x8(%ebp),%eax
 b11:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b14:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 b17:	8b 45 08             	mov    0x8(%ebp),%eax
 b1a:	8b 00                	mov    (%eax),%eax
 b1c:	8d 50 01             	lea    0x1(%eax),%edx
 b1f:	8b 45 08             	mov    0x8(%ebp),%eax
 b22:	89 10                	mov    %edx,(%eax)
}
 b24:	c9                   	leave  
 b25:	c3                   	ret    

00000b26 <empty_q>:

int empty_q(struct queue *q){
 b26:	55                   	push   %ebp
 b27:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 b29:	8b 45 08             	mov    0x8(%ebp),%eax
 b2c:	8b 00                	mov    (%eax),%eax
 b2e:	85 c0                	test   %eax,%eax
 b30:	75 07                	jne    b39 <empty_q+0x13>
        return 1;
 b32:	b8 01 00 00 00       	mov    $0x1,%eax
 b37:	eb 05                	jmp    b3e <empty_q+0x18>
    else
        return 0;
 b39:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 b3e:	5d                   	pop    %ebp
 b3f:	c3                   	ret    

00000b40 <pop_q>:
int pop_q(struct queue *q){
 b40:	55                   	push   %ebp
 b41:	89 e5                	mov    %esp,%ebp
 b43:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 b46:	8b 45 08             	mov    0x8(%ebp),%eax
 b49:	89 04 24             	mov    %eax,(%esp)
 b4c:	e8 d5 ff ff ff       	call   b26 <empty_q>
 b51:	85 c0                	test   %eax,%eax
 b53:	75 5d                	jne    bb2 <pop_q+0x72>
       val = q->head->value; 
 b55:	8b 45 08             	mov    0x8(%ebp),%eax
 b58:	8b 40 04             	mov    0x4(%eax),%eax
 b5b:	8b 00                	mov    (%eax),%eax
 b5d:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 b60:	8b 45 08             	mov    0x8(%ebp),%eax
 b63:	8b 40 04             	mov    0x4(%eax),%eax
 b66:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 b69:	8b 45 08             	mov    0x8(%ebp),%eax
 b6c:	8b 40 04             	mov    0x4(%eax),%eax
 b6f:	8b 50 04             	mov    0x4(%eax),%edx
 b72:	8b 45 08             	mov    0x8(%ebp),%eax
 b75:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 b78:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b7b:	89 04 24             	mov    %eax,(%esp)
 b7e:	e8 e1 fb ff ff       	call   764 <free>
       q->size--;
 b83:	8b 45 08             	mov    0x8(%ebp),%eax
 b86:	8b 00                	mov    (%eax),%eax
 b88:	8d 50 ff             	lea    -0x1(%eax),%edx
 b8b:	8b 45 08             	mov    0x8(%ebp),%eax
 b8e:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 b90:	8b 45 08             	mov    0x8(%ebp),%eax
 b93:	8b 00                	mov    (%eax),%eax
 b95:	85 c0                	test   %eax,%eax
 b97:	75 14                	jne    bad <pop_q+0x6d>
            q->head = 0;
 b99:	8b 45 08             	mov    0x8(%ebp),%eax
 b9c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 ba3:	8b 45 08             	mov    0x8(%ebp),%eax
 ba6:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 bad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bb0:	eb 05                	jmp    bb7 <pop_q+0x77>
    }
    return -1;
 bb2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 bb7:	c9                   	leave  
 bb8:	c3                   	ret    
 bb9:	90                   	nop
 bba:	90                   	nop
 bbb:	90                   	nop

00000bbc <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 bbc:	55                   	push   %ebp
 bbd:	89 e5                	mov    %esp,%ebp
 bbf:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 bc2:	8b 45 08             	mov    0x8(%ebp),%eax
 bc5:	8b 55 0c             	mov    0xc(%ebp),%edx
 bc8:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 bcb:	8b 45 08             	mov    0x8(%ebp),%eax
 bce:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 bd5:	8b 45 08             	mov    0x8(%ebp),%eax
 bd8:	89 04 24             	mov    %eax,(%esp)
 bdb:	e8 ae fd ff ff       	call   98e <lock_init>
}
 be0:	c9                   	leave  
 be1:	c3                   	ret    

00000be2 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 be2:	55                   	push   %ebp
 be3:	89 e5                	mov    %esp,%ebp
 be5:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 be8:	8b 45 08             	mov    0x8(%ebp),%eax
 beb:	89 04 24             	mov    %eax,(%esp)
 bee:	e8 a9 fd ff ff       	call   99c <lock_acquire>
	if(s->count  == 0){
 bf3:	8b 45 08             	mov    0x8(%ebp),%eax
 bf6:	8b 40 04             	mov    0x4(%eax),%eax
 bf9:	85 c0                	test   %eax,%eax
 bfb:	75 43                	jne    c40 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 bfd:	c7 44 24 04 6a 0d 00 	movl   $0xd6a,0x4(%esp)
 c04:	00 
 c05:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c0c:	e8 9c f9 ff ff       	call   5ad <printf>
		//add proc to waiters list
		int tid = getpid();
 c11:	e8 76 f8 ff ff       	call   48c <getpid>
 c16:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 c19:	8b 45 08             	mov    0x8(%ebp),%eax
 c1c:	8d 50 0c             	lea    0xc(%eax),%edx
 c1f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c22:	89 44 24 04          	mov    %eax,0x4(%esp)
 c26:	89 14 24             	mov    %edx,(%esp)
 c29:	e8 98 fe ff ff       	call   ac6 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 c2e:	8b 45 08             	mov    0x8(%ebp),%eax
 c31:	89 04 24             	mov    %eax,(%esp)
 c34:	e8 82 fd ff ff       	call   9bb <lock_release>
		tsleep(); 
 c39:	e8 7e f8 ff ff       	call   4bc <tsleep>
 c3e:	eb 2e                	jmp    c6e <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 c40:	c7 44 24 04 71 0d 00 	movl   $0xd71,0x4(%esp)
 c47:	00 
 c48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c4f:	e8 59 f9 ff ff       	call   5ad <printf>
		s->count--;	
 c54:	8b 45 08             	mov    0x8(%ebp),%eax
 c57:	8b 40 04             	mov    0x4(%eax),%eax
 c5a:	8d 50 ff             	lea    -0x1(%eax),%edx
 c5d:	8b 45 08             	mov    0x8(%ebp),%eax
 c60:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 c63:	8b 45 08             	mov    0x8(%ebp),%eax
 c66:	89 04 24             	mov    %eax,(%esp)
 c69:	e8 4d fd ff ff       	call   9bb <lock_release>
	}
}
 c6e:	c9                   	leave  
 c6f:	c3                   	ret    

00000c70 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 c70:	55                   	push   %ebp
 c71:	89 e5                	mov    %esp,%ebp
 c73:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 c76:	c7 44 24 04 78 0d 00 	movl   $0xd78,0x4(%esp)
 c7d:	00 
 c7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c85:	e8 23 f9 ff ff       	call   5ad <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 c8a:	8b 45 08             	mov    0x8(%ebp),%eax
 c8d:	89 04 24             	mov    %eax,(%esp)
 c90:	e8 07 fd ff ff       	call   99c <lock_acquire>
	if(s->count < s->size){
 c95:	8b 45 08             	mov    0x8(%ebp),%eax
 c98:	8b 50 04             	mov    0x4(%eax),%edx
 c9b:	8b 45 08             	mov    0x8(%ebp),%eax
 c9e:	8b 40 08             	mov    0x8(%eax),%eax
 ca1:	39 c2                	cmp    %eax,%edx
 ca3:	7d 0f                	jge    cb4 <sem_signal+0x44>
		s->count++;	
 ca5:	8b 45 08             	mov    0x8(%ebp),%eax
 ca8:	8b 40 04             	mov    0x4(%eax),%eax
 cab:	8d 50 01             	lea    0x1(%eax),%edx
 cae:	8b 45 08             	mov    0x8(%ebp),%eax
 cb1:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 cb4:	8b 45 08             	mov    0x8(%ebp),%eax
 cb7:	83 c0 0c             	add    $0xc,%eax
 cba:	89 04 24             	mov    %eax,(%esp)
 cbd:	e8 7e fe ff ff       	call   b40 <pop_q>
 cc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 cc5:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 cc9:	74 2e                	je     cf9 <sem_signal+0x89>
		printf(1, "Sem A\n");
 ccb:	c7 44 24 04 71 0d 00 	movl   $0xd71,0x4(%esp)
 cd2:	00 
 cd3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 cda:	e8 ce f8 ff ff       	call   5ad <printf>
		twakeup(tid);
 cdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ce2:	89 04 24             	mov    %eax,(%esp)
 ce5:	e8 da f7 ff ff       	call   4c4 <twakeup>
		s->count--;
 cea:	8b 45 08             	mov    0x8(%ebp),%eax
 ced:	8b 40 04             	mov    0x4(%eax),%eax
 cf0:	8d 50 ff             	lea    -0x1(%eax),%edx
 cf3:	8b 45 08             	mov    0x8(%ebp),%eax
 cf6:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 cf9:	8b 45 08             	mov    0x8(%ebp),%eax
 cfc:	89 04 24             	mov    %eax,(%esp)
 cff:	e8 b7 fc ff ff       	call   9bb <lock_release>

 d04:	c9                   	leave  
 d05:	c3                   	ret    
