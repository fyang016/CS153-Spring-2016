
_monkey:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
void oReady();

void monkey();

int main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
	sem_init(&wait_tree, 3);  //Initialize semaphore with 5 slots
   9:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
  10:	00 
  11:	c7 04 24 40 10 00 00 	movl   $0x1040,(%esp)
  18:	e8 f7 0c 00 00       	call   d14 <sem_init>
	
	int i;
	sem_signal(&wait_tree);
  1d:	c7 04 24 40 10 00 00 	movl   $0x1040,(%esp)
  24:	e8 9f 0d 00 00       	call   dc8 <sem_signal>
	sem_signal(&wait_tree);
  29:	c7 04 24 40 10 00 00 	movl   $0x1040,(%esp)
  30:	e8 93 0d 00 00       	call   dc8 <sem_signal>
	sem_signal(&wait_tree);
  35:	c7 04 24 40 10 00 00 	movl   $0x1040,(%esp)
  3c:	e8 87 0d 00 00       	call   dc8 <sem_signal>
  	printf(1, "\n\nFirst # is the PID\n");
  41:	c7 44 24 04 60 0e 00 	movl   $0xe60,0x4(%esp)
  48:	00 
  49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  50:	e8 b0 06 00 00       	call   705 <printf>
  	printf(1, "\nSecond # is waiting state\n");
  55:	c7 44 24 04 76 0e 00 	movl   $0xe76,0x4(%esp)
  5c:	00 
  5d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  64:	e8 9c 06 00 00       	call   705 <printf>
  	printf(1, "1 - waiting to climb tree\n");
  69:	c7 44 24 04 92 0e 00 	movl   $0xe92,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 88 06 00 00       	call   705 <printf>
  	printf(1, "2 - climbing tree\n");
  7d:	c7 44 24 04 ad 0e 00 	movl   $0xead,0x4(%esp)
  84:	00 
  85:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  8c:	e8 74 06 00 00       	call   705 <printf>
  	printf(1, "3 - Found a banana climbing down\n");
  91:	c7 44 24 04 c0 0e 00 	movl   $0xec0,0x4(%esp)
  98:	00 
  99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  a0:	e8 60 06 00 00       	call   705 <printf>
  	printf(1, "4 - Eating banana\n\n");
  a5:	c7 44 24 04 e2 0e 00 	movl   $0xee2,0x4(%esp)
  ac:	00 
  ad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b4:	e8 4c 06 00 00       	call   705 <printf>
  	printf(1, "Third # is monkeys on tree\n");
  b9:	c7 44 24 04 f6 0e 00 	movl   $0xef6,0x4(%esp)
  c0:	00 
  c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c8:	e8 38 06 00 00       	call   705 <printf>
  	printf(1, "*abreviations\n");
  cd:	c7 44 24 04 12 0f 00 	movl   $0xf12,0x4(%esp)
  d4:	00 
  d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  dc:	e8 24 06 00 00       	call   705 <printf>
  	printf(1, "Sem A - Semaphore Aquired\n");
  e1:	c7 44 24 04 21 0f 00 	movl   $0xf21,0x4(%esp)
  e8:	00 
  e9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f0:	e8 10 06 00 00       	call   705 <printf>
  	printf(1, "Sem R - Sempahore Released\n");
  f5:	c7 44 24 04 3c 0f 00 	movl   $0xf3c,0x4(%esp)
  fc:	00 
  fd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 104:	e8 fc 05 00 00       	call   705 <printf>
  	printf(1, "Sem F - Sempahore Full\n\n");
 109:	c7 44 24 04 58 0f 00 	movl   $0xf58,0x4(%esp)
 110:	00 
 111:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 118:	e8 e8 05 00 00       	call   705 <printf>
	for(i = 0; i < 5; i++) thread_create(monkey, 0);
 11d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
 124:	00 
 125:	eb 1a                	jmp    141 <main+0x141>
 127:	b8 6a 01 00 00       	mov    $0x16a,%eax
 12c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 133:	00 
 134:	89 04 24             	mov    %eax,(%esp)
 137:	e8 f2 09 00 00       	call   b2e <thread_create>
 13c:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 141:	83 7c 24 1c 04       	cmpl   $0x4,0x1c(%esp)
 146:	7e df                	jle    127 <main+0x127>
    while(wait() > 0);
 148:	e8 1f 04 00 00       	call   56c <wait>
 14d:	85 c0                	test   %eax,%eax
 14f:	7f f7                	jg     148 <main+0x148>
	printf(1,"All monkeys are full\n");
 151:	c7 44 24 04 71 0f 00 	movl   $0xf71,0x4(%esp)
 158:	00 
 159:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 160:	e8 a0 05 00 00       	call   705 <printf>
	exit();
 165:	e8 fa 03 00 00       	call   564 <exit>

0000016a <monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
 16d:	83 ec 28             	sub    $0x28,%esp
  int pid =  getpid();
 170:	e8 6f 04 00 00       	call   5e4 <getpid>
 175:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1, "%d",pid);
 178:	8b 45 f4             	mov    -0xc(%ebp),%eax
 17b:	89 44 24 08          	mov    %eax,0x8(%esp)
 17f:	c7 44 24 04 87 0f 00 	movl   $0xf87,0x4(%esp)
 186:	00 
 187:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18e:	e8 72 05 00 00       	call   705 <printf>
  printf(1, " - 1");
 193:	c7 44 24 04 8a 0f 00 	movl   $0xf8a,0x4(%esp)
 19a:	00 
 19b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1a2:	e8 5e 05 00 00       	call   705 <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 1a7:	a1 44 10 00 00       	mov    0x1044,%eax
 1ac:	ba 03 00 00 00       	mov    $0x3,%edx
 1b1:	89 d1                	mov    %edx,%ecx
 1b3:	29 c1                	sub    %eax,%ecx
 1b5:	89 c8                	mov    %ecx,%eax
 1b7:	89 44 24 08          	mov    %eax,0x8(%esp)
 1bb:	c7 44 24 04 8f 0f 00 	movl   $0xf8f,0x4(%esp)
 1c2:	00 
 1c3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ca:	e8 36 05 00 00       	call   705 <printf>
  sem_aquire(&wait_tree);
 1cf:	c7 04 24 40 10 00 00 	movl   $0x1040,(%esp)
 1d6:	e8 5f 0b 00 00       	call   d3a <sem_aquire>
  printf(1, "%d",pid);
 1db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1de:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e2:	c7 44 24 04 87 0f 00 	movl   $0xf87,0x4(%esp)
 1e9:	00 
 1ea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1f1:	e8 0f 05 00 00       	call   705 <printf>
  printf(1, " - 2");
 1f6:	c7 44 24 04 96 0f 00 	movl   $0xf96,0x4(%esp)
 1fd:	00 
 1fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 205:	e8 fb 04 00 00       	call   705 <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 20a:	a1 44 10 00 00       	mov    0x1044,%eax
 20f:	ba 03 00 00 00       	mov    $0x3,%edx
 214:	89 d1                	mov    %edx,%ecx
 216:	29 c1                	sub    %eax,%ecx
 218:	89 c8                	mov    %ecx,%eax
 21a:	89 44 24 08          	mov    %eax,0x8(%esp)
 21e:	c7 44 24 04 8f 0f 00 	movl   $0xf8f,0x4(%esp)
 225:	00 
 226:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 22d:	e8 d3 04 00 00       	call   705 <printf>
  sleep(3); 
 232:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 239:	e8 b6 03 00 00       	call   5f4 <sleep>
  printf(1, "%d",pid);
 23e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 241:	89 44 24 08          	mov    %eax,0x8(%esp)
 245:	c7 44 24 04 87 0f 00 	movl   $0xf87,0x4(%esp)
 24c:	00 
 24d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 254:	e8 ac 04 00 00       	call   705 <printf>
  printf(1, " - 3");
 259:	c7 44 24 04 9b 0f 00 	movl   $0xf9b,0x4(%esp)
 260:	00 
 261:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 268:	e8 98 04 00 00       	call   705 <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 26d:	a1 44 10 00 00       	mov    0x1044,%eax
 272:	ba 03 00 00 00       	mov    $0x3,%edx
 277:	89 d1                	mov    %edx,%ecx
 279:	29 c1                	sub    %eax,%ecx
 27b:	89 c8                	mov    %ecx,%eax
 27d:	89 44 24 08          	mov    %eax,0x8(%esp)
 281:	c7 44 24 04 8f 0f 00 	movl   $0xf8f,0x4(%esp)
 288:	00 
 289:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 290:	e8 70 04 00 00       	call   705 <printf>
  sem_signal(&wait_tree);
 295:	c7 04 24 40 10 00 00 	movl   $0x1040,(%esp)
 29c:	e8 27 0b 00 00       	call   dc8 <sem_signal>
  printf(1, "%d",pid);
 2a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2a4:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a8:	c7 44 24 04 87 0f 00 	movl   $0xf87,0x4(%esp)
 2af:	00 
 2b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2b7:	e8 49 04 00 00       	call   705 <printf>
  printf(1, " - 4"); 
 2bc:	c7 44 24 04 a0 0f 00 	movl   $0xfa0,0x4(%esp)
 2c3:	00 
 2c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2cb:	e8 35 04 00 00       	call   705 <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);  
 2d0:	a1 44 10 00 00       	mov    0x1044,%eax
 2d5:	ba 03 00 00 00       	mov    $0x3,%edx
 2da:	89 d1                	mov    %edx,%ecx
 2dc:	29 c1                	sub    %eax,%ecx
 2de:	89 c8                	mov    %ecx,%eax
 2e0:	89 44 24 08          	mov    %eax,0x8(%esp)
 2e4:	c7 44 24 04 8f 0f 00 	movl   $0xf8f,0x4(%esp)
 2eb:	00 
 2ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2f3:	e8 0d 04 00 00       	call   705 <printf>
  texit();
 2f8:	e8 0f 03 00 00       	call   60c <texit>
 2fd:	90                   	nop
 2fe:	90                   	nop
 2ff:	90                   	nop

00000300 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 300:	55                   	push   %ebp
 301:	89 e5                	mov    %esp,%ebp
 303:	57                   	push   %edi
 304:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 305:	8b 4d 08             	mov    0x8(%ebp),%ecx
 308:	8b 55 10             	mov    0x10(%ebp),%edx
 30b:	8b 45 0c             	mov    0xc(%ebp),%eax
 30e:	89 cb                	mov    %ecx,%ebx
 310:	89 df                	mov    %ebx,%edi
 312:	89 d1                	mov    %edx,%ecx
 314:	fc                   	cld    
 315:	f3 aa                	rep stos %al,%es:(%edi)
 317:	89 ca                	mov    %ecx,%edx
 319:	89 fb                	mov    %edi,%ebx
 31b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 31e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 321:	5b                   	pop    %ebx
 322:	5f                   	pop    %edi
 323:	5d                   	pop    %ebp
 324:	c3                   	ret    

00000325 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 325:	55                   	push   %ebp
 326:	89 e5                	mov    %esp,%ebp
 328:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 331:	8b 45 0c             	mov    0xc(%ebp),%eax
 334:	0f b6 10             	movzbl (%eax),%edx
 337:	8b 45 08             	mov    0x8(%ebp),%eax
 33a:	88 10                	mov    %dl,(%eax)
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
 33f:	0f b6 00             	movzbl (%eax),%eax
 342:	84 c0                	test   %al,%al
 344:	0f 95 c0             	setne  %al
 347:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 34b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 34f:	84 c0                	test   %al,%al
 351:	75 de                	jne    331 <strcpy+0xc>
    ;
  return os;
 353:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 356:	c9                   	leave  
 357:	c3                   	ret    

00000358 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 358:	55                   	push   %ebp
 359:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 35b:	eb 08                	jmp    365 <strcmp+0xd>
    p++, q++;
 35d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 361:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 365:	8b 45 08             	mov    0x8(%ebp),%eax
 368:	0f b6 00             	movzbl (%eax),%eax
 36b:	84 c0                	test   %al,%al
 36d:	74 10                	je     37f <strcmp+0x27>
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	0f b6 10             	movzbl (%eax),%edx
 375:	8b 45 0c             	mov    0xc(%ebp),%eax
 378:	0f b6 00             	movzbl (%eax),%eax
 37b:	38 c2                	cmp    %al,%dl
 37d:	74 de                	je     35d <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 37f:	8b 45 08             	mov    0x8(%ebp),%eax
 382:	0f b6 00             	movzbl (%eax),%eax
 385:	0f b6 d0             	movzbl %al,%edx
 388:	8b 45 0c             	mov    0xc(%ebp),%eax
 38b:	0f b6 00             	movzbl (%eax),%eax
 38e:	0f b6 c0             	movzbl %al,%eax
 391:	89 d1                	mov    %edx,%ecx
 393:	29 c1                	sub    %eax,%ecx
 395:	89 c8                	mov    %ecx,%eax
}
 397:	5d                   	pop    %ebp
 398:	c3                   	ret    

00000399 <strlen>:

uint
strlen(char *s)
{
 399:	55                   	push   %ebp
 39a:	89 e5                	mov    %esp,%ebp
 39c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 39f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3a6:	eb 04                	jmp    3ac <strlen+0x13>
 3a8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3af:	03 45 08             	add    0x8(%ebp),%eax
 3b2:	0f b6 00             	movzbl (%eax),%eax
 3b5:	84 c0                	test   %al,%al
 3b7:	75 ef                	jne    3a8 <strlen+0xf>
    ;
  return n;
 3b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3bc:	c9                   	leave  
 3bd:	c3                   	ret    

000003be <memset>:

void*
memset(void *dst, int c, uint n)
{
 3be:	55                   	push   %ebp
 3bf:	89 e5                	mov    %esp,%ebp
 3c1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 3c4:	8b 45 10             	mov    0x10(%ebp),%eax
 3c7:	89 44 24 08          	mov    %eax,0x8(%esp)
 3cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 3d2:	8b 45 08             	mov    0x8(%ebp),%eax
 3d5:	89 04 24             	mov    %eax,(%esp)
 3d8:	e8 23 ff ff ff       	call   300 <stosb>
  return dst;
 3dd:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3e0:	c9                   	leave  
 3e1:	c3                   	ret    

000003e2 <strchr>:

char*
strchr(const char *s, char c)
{
 3e2:	55                   	push   %ebp
 3e3:	89 e5                	mov    %esp,%ebp
 3e5:	83 ec 04             	sub    $0x4,%esp
 3e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3eb:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 3ee:	eb 14                	jmp    404 <strchr+0x22>
    if(*s == c)
 3f0:	8b 45 08             	mov    0x8(%ebp),%eax
 3f3:	0f b6 00             	movzbl (%eax),%eax
 3f6:	3a 45 fc             	cmp    -0x4(%ebp),%al
 3f9:	75 05                	jne    400 <strchr+0x1e>
      return (char*)s;
 3fb:	8b 45 08             	mov    0x8(%ebp),%eax
 3fe:	eb 13                	jmp    413 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 400:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 404:	8b 45 08             	mov    0x8(%ebp),%eax
 407:	0f b6 00             	movzbl (%eax),%eax
 40a:	84 c0                	test   %al,%al
 40c:	75 e2                	jne    3f0 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 40e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 413:	c9                   	leave  
 414:	c3                   	ret    

00000415 <gets>:

char*
gets(char *buf, int max)
{
 415:	55                   	push   %ebp
 416:	89 e5                	mov    %esp,%ebp
 418:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 41b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 422:	eb 44                	jmp    468 <gets+0x53>
    cc = read(0, &c, 1);
 424:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 42b:	00 
 42c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 42f:	89 44 24 04          	mov    %eax,0x4(%esp)
 433:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 43a:	e8 3d 01 00 00       	call   57c <read>
 43f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 442:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 446:	7e 2d                	jle    475 <gets+0x60>
      break;
    buf[i++] = c;
 448:	8b 45 f0             	mov    -0x10(%ebp),%eax
 44b:	03 45 08             	add    0x8(%ebp),%eax
 44e:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 452:	88 10                	mov    %dl,(%eax)
 454:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 458:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 45c:	3c 0a                	cmp    $0xa,%al
 45e:	74 16                	je     476 <gets+0x61>
 460:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 464:	3c 0d                	cmp    $0xd,%al
 466:	74 0e                	je     476 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 468:	8b 45 f0             	mov    -0x10(%ebp),%eax
 46b:	83 c0 01             	add    $0x1,%eax
 46e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 471:	7c b1                	jl     424 <gets+0xf>
 473:	eb 01                	jmp    476 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 475:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 476:	8b 45 f0             	mov    -0x10(%ebp),%eax
 479:	03 45 08             	add    0x8(%ebp),%eax
 47c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 47f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 482:	c9                   	leave  
 483:	c3                   	ret    

00000484 <stat>:

int
stat(char *n, struct stat *st)
{
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 48a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 491:	00 
 492:	8b 45 08             	mov    0x8(%ebp),%eax
 495:	89 04 24             	mov    %eax,(%esp)
 498:	e8 07 01 00 00       	call   5a4 <open>
 49d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 4a0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4a4:	79 07                	jns    4ad <stat+0x29>
    return -1;
 4a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4ab:	eb 23                	jmp    4d0 <stat+0x4c>
  r = fstat(fd, st);
 4ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 4b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 4b4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4b7:	89 04 24             	mov    %eax,(%esp)
 4ba:	e8 fd 00 00 00       	call   5bc <fstat>
 4bf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 4c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4c5:	89 04 24             	mov    %eax,(%esp)
 4c8:	e8 bf 00 00 00       	call   58c <close>
  return r;
 4cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 4d0:	c9                   	leave  
 4d1:	c3                   	ret    

000004d2 <atoi>:

int
atoi(const char *s)
{
 4d2:	55                   	push   %ebp
 4d3:	89 e5                	mov    %esp,%ebp
 4d5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 4d8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4df:	eb 24                	jmp    505 <atoi+0x33>
    n = n*10 + *s++ - '0';
 4e1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4e4:	89 d0                	mov    %edx,%eax
 4e6:	c1 e0 02             	shl    $0x2,%eax
 4e9:	01 d0                	add    %edx,%eax
 4eb:	01 c0                	add    %eax,%eax
 4ed:	89 c2                	mov    %eax,%edx
 4ef:	8b 45 08             	mov    0x8(%ebp),%eax
 4f2:	0f b6 00             	movzbl (%eax),%eax
 4f5:	0f be c0             	movsbl %al,%eax
 4f8:	8d 04 02             	lea    (%edx,%eax,1),%eax
 4fb:	83 e8 30             	sub    $0x30,%eax
 4fe:	89 45 fc             	mov    %eax,-0x4(%ebp)
 501:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 505:	8b 45 08             	mov    0x8(%ebp),%eax
 508:	0f b6 00             	movzbl (%eax),%eax
 50b:	3c 2f                	cmp    $0x2f,%al
 50d:	7e 0a                	jle    519 <atoi+0x47>
 50f:	8b 45 08             	mov    0x8(%ebp),%eax
 512:	0f b6 00             	movzbl (%eax),%eax
 515:	3c 39                	cmp    $0x39,%al
 517:	7e c8                	jle    4e1 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 519:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 51c:	c9                   	leave  
 51d:	c3                   	ret    

0000051e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 51e:	55                   	push   %ebp
 51f:	89 e5                	mov    %esp,%ebp
 521:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 524:	8b 45 08             	mov    0x8(%ebp),%eax
 527:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 52a:	8b 45 0c             	mov    0xc(%ebp),%eax
 52d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 530:	eb 13                	jmp    545 <memmove+0x27>
    *dst++ = *src++;
 532:	8b 45 fc             	mov    -0x4(%ebp),%eax
 535:	0f b6 10             	movzbl (%eax),%edx
 538:	8b 45 f8             	mov    -0x8(%ebp),%eax
 53b:	88 10                	mov    %dl,(%eax)
 53d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 541:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 545:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 549:	0f 9f c0             	setg   %al
 54c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 550:	84 c0                	test   %al,%al
 552:	75 de                	jne    532 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 554:	8b 45 08             	mov    0x8(%ebp),%eax
}
 557:	c9                   	leave  
 558:	c3                   	ret    
 559:	90                   	nop
 55a:	90                   	nop
 55b:	90                   	nop

0000055c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 55c:	b8 01 00 00 00       	mov    $0x1,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <exit>:
SYSCALL(exit)
 564:	b8 02 00 00 00       	mov    $0x2,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <wait>:
SYSCALL(wait)
 56c:	b8 03 00 00 00       	mov    $0x3,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <pipe>:
SYSCALL(pipe)
 574:	b8 04 00 00 00       	mov    $0x4,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <read>:
SYSCALL(read)
 57c:	b8 05 00 00 00       	mov    $0x5,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <write>:
SYSCALL(write)
 584:	b8 10 00 00 00       	mov    $0x10,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <close>:
SYSCALL(close)
 58c:	b8 15 00 00 00       	mov    $0x15,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <kill>:
SYSCALL(kill)
 594:	b8 06 00 00 00       	mov    $0x6,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <exec>:
SYSCALL(exec)
 59c:	b8 07 00 00 00       	mov    $0x7,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <open>:
SYSCALL(open)
 5a4:	b8 0f 00 00 00       	mov    $0xf,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <mknod>:
SYSCALL(mknod)
 5ac:	b8 11 00 00 00       	mov    $0x11,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <unlink>:
SYSCALL(unlink)
 5b4:	b8 12 00 00 00       	mov    $0x12,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <fstat>:
SYSCALL(fstat)
 5bc:	b8 08 00 00 00       	mov    $0x8,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <link>:
SYSCALL(link)
 5c4:	b8 13 00 00 00       	mov    $0x13,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <mkdir>:
SYSCALL(mkdir)
 5cc:	b8 14 00 00 00       	mov    $0x14,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <chdir>:
SYSCALL(chdir)
 5d4:	b8 09 00 00 00       	mov    $0x9,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <dup>:
SYSCALL(dup)
 5dc:	b8 0a 00 00 00       	mov    $0xa,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <getpid>:
SYSCALL(getpid)
 5e4:	b8 0b 00 00 00       	mov    $0xb,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <sbrk>:
SYSCALL(sbrk)
 5ec:	b8 0c 00 00 00       	mov    $0xc,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <sleep>:
SYSCALL(sleep)
 5f4:	b8 0d 00 00 00       	mov    $0xd,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <uptime>:
SYSCALL(uptime)
 5fc:	b8 0e 00 00 00       	mov    $0xe,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <clone>:
SYSCALL(clone)
 604:	b8 16 00 00 00       	mov    $0x16,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <texit>:
SYSCALL(texit)
 60c:	b8 17 00 00 00       	mov    $0x17,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <tsleep>:
SYSCALL(tsleep)
 614:	b8 18 00 00 00       	mov    $0x18,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <twakeup>:
SYSCALL(twakeup)
 61c:	b8 19 00 00 00       	mov    $0x19,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <test>:
SYSCALL(test)
 624:	b8 1a 00 00 00       	mov    $0x1a,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 62c:	55                   	push   %ebp
 62d:	89 e5                	mov    %esp,%ebp
 62f:	83 ec 28             	sub    $0x28,%esp
 632:	8b 45 0c             	mov    0xc(%ebp),%eax
 635:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 638:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 63f:	00 
 640:	8d 45 f4             	lea    -0xc(%ebp),%eax
 643:	89 44 24 04          	mov    %eax,0x4(%esp)
 647:	8b 45 08             	mov    0x8(%ebp),%eax
 64a:	89 04 24             	mov    %eax,(%esp)
 64d:	e8 32 ff ff ff       	call   584 <write>
}
 652:	c9                   	leave  
 653:	c3                   	ret    

00000654 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 654:	55                   	push   %ebp
 655:	89 e5                	mov    %esp,%ebp
 657:	53                   	push   %ebx
 658:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 65b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 662:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 666:	74 17                	je     67f <printint+0x2b>
 668:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 66c:	79 11                	jns    67f <printint+0x2b>
    neg = 1;
 66e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 675:	8b 45 0c             	mov    0xc(%ebp),%eax
 678:	f7 d8                	neg    %eax
 67a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 67d:	eb 06                	jmp    685 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 67f:	8b 45 0c             	mov    0xc(%ebp),%eax
 682:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 685:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 68c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 68f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 692:	8b 45 f4             	mov    -0xc(%ebp),%eax
 695:	ba 00 00 00 00       	mov    $0x0,%edx
 69a:	f7 f3                	div    %ebx
 69c:	89 d0                	mov    %edx,%eax
 69e:	0f b6 80 f0 0f 00 00 	movzbl 0xff0(%eax),%eax
 6a5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 6a9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 6ad:	8b 45 10             	mov    0x10(%ebp),%eax
 6b0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6b6:	ba 00 00 00 00       	mov    $0x0,%edx
 6bb:	f7 75 d4             	divl   -0x2c(%ebp)
 6be:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6c5:	75 c5                	jne    68c <printint+0x38>
  if(neg)
 6c7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6cb:	74 28                	je     6f5 <printint+0xa1>
    buf[i++] = '-';
 6cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6d0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 6d5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 6d9:	eb 1a                	jmp    6f5 <printint+0xa1>
    putc(fd, buf[i]);
 6db:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6de:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 6e3:	0f be c0             	movsbl %al,%eax
 6e6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6ea:	8b 45 08             	mov    0x8(%ebp),%eax
 6ed:	89 04 24             	mov    %eax,(%esp)
 6f0:	e8 37 ff ff ff       	call   62c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6f5:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 6f9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6fd:	79 dc                	jns    6db <printint+0x87>
    putc(fd, buf[i]);
}
 6ff:	83 c4 44             	add    $0x44,%esp
 702:	5b                   	pop    %ebx
 703:	5d                   	pop    %ebp
 704:	c3                   	ret    

00000705 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 705:	55                   	push   %ebp
 706:	89 e5                	mov    %esp,%ebp
 708:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 70b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 712:	8d 45 0c             	lea    0xc(%ebp),%eax
 715:	83 c0 04             	add    $0x4,%eax
 718:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 71b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 722:	e9 7e 01 00 00       	jmp    8a5 <printf+0x1a0>
    c = fmt[i] & 0xff;
 727:	8b 55 0c             	mov    0xc(%ebp),%edx
 72a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 72d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 730:	0f b6 00             	movzbl (%eax),%eax
 733:	0f be c0             	movsbl %al,%eax
 736:	25 ff 00 00 00       	and    $0xff,%eax
 73b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 73e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 742:	75 2c                	jne    770 <printf+0x6b>
      if(c == '%'){
 744:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 748:	75 0c                	jne    756 <printf+0x51>
        state = '%';
 74a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 751:	e9 4b 01 00 00       	jmp    8a1 <printf+0x19c>
      } else {
        putc(fd, c);
 756:	8b 45 e8             	mov    -0x18(%ebp),%eax
 759:	0f be c0             	movsbl %al,%eax
 75c:	89 44 24 04          	mov    %eax,0x4(%esp)
 760:	8b 45 08             	mov    0x8(%ebp),%eax
 763:	89 04 24             	mov    %eax,(%esp)
 766:	e8 c1 fe ff ff       	call   62c <putc>
 76b:	e9 31 01 00 00       	jmp    8a1 <printf+0x19c>
      }
    } else if(state == '%'){
 770:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 774:	0f 85 27 01 00 00    	jne    8a1 <printf+0x19c>
      if(c == 'd'){
 77a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 77e:	75 2d                	jne    7ad <printf+0xa8>
        printint(fd, *ap, 10, 1);
 780:	8b 45 f4             	mov    -0xc(%ebp),%eax
 783:	8b 00                	mov    (%eax),%eax
 785:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 78c:	00 
 78d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 794:	00 
 795:	89 44 24 04          	mov    %eax,0x4(%esp)
 799:	8b 45 08             	mov    0x8(%ebp),%eax
 79c:	89 04 24             	mov    %eax,(%esp)
 79f:	e8 b0 fe ff ff       	call   654 <printint>
        ap++;
 7a4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 7a8:	e9 ed 00 00 00       	jmp    89a <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 7ad:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 7b1:	74 06                	je     7b9 <printf+0xb4>
 7b3:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 7b7:	75 2d                	jne    7e6 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 7b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bc:	8b 00                	mov    (%eax),%eax
 7be:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7c5:	00 
 7c6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7cd:	00 
 7ce:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d2:	8b 45 08             	mov    0x8(%ebp),%eax
 7d5:	89 04 24             	mov    %eax,(%esp)
 7d8:	e8 77 fe ff ff       	call   654 <printint>
        ap++;
 7dd:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 7e1:	e9 b4 00 00 00       	jmp    89a <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 7e6:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 7ea:	75 46                	jne    832 <printf+0x12d>
        s = (char*)*ap;
 7ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ef:	8b 00                	mov    (%eax),%eax
 7f1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 7f4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 7f8:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 7fc:	75 27                	jne    825 <printf+0x120>
          s = "(null)";
 7fe:	c7 45 e4 a5 0f 00 00 	movl   $0xfa5,-0x1c(%ebp)
        while(*s != 0){
 805:	eb 1f                	jmp    826 <printf+0x121>
          putc(fd, *s);
 807:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 80a:	0f b6 00             	movzbl (%eax),%eax
 80d:	0f be c0             	movsbl %al,%eax
 810:	89 44 24 04          	mov    %eax,0x4(%esp)
 814:	8b 45 08             	mov    0x8(%ebp),%eax
 817:	89 04 24             	mov    %eax,(%esp)
 81a:	e8 0d fe ff ff       	call   62c <putc>
          s++;
 81f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 823:	eb 01                	jmp    826 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 825:	90                   	nop
 826:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 829:	0f b6 00             	movzbl (%eax),%eax
 82c:	84 c0                	test   %al,%al
 82e:	75 d7                	jne    807 <printf+0x102>
 830:	eb 68                	jmp    89a <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 832:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 836:	75 1d                	jne    855 <printf+0x150>
        putc(fd, *ap);
 838:	8b 45 f4             	mov    -0xc(%ebp),%eax
 83b:	8b 00                	mov    (%eax),%eax
 83d:	0f be c0             	movsbl %al,%eax
 840:	89 44 24 04          	mov    %eax,0x4(%esp)
 844:	8b 45 08             	mov    0x8(%ebp),%eax
 847:	89 04 24             	mov    %eax,(%esp)
 84a:	e8 dd fd ff ff       	call   62c <putc>
        ap++;
 84f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 853:	eb 45                	jmp    89a <printf+0x195>
      } else if(c == '%'){
 855:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 859:	75 17                	jne    872 <printf+0x16d>
        putc(fd, c);
 85b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 85e:	0f be c0             	movsbl %al,%eax
 861:	89 44 24 04          	mov    %eax,0x4(%esp)
 865:	8b 45 08             	mov    0x8(%ebp),%eax
 868:	89 04 24             	mov    %eax,(%esp)
 86b:	e8 bc fd ff ff       	call   62c <putc>
 870:	eb 28                	jmp    89a <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 872:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 879:	00 
 87a:	8b 45 08             	mov    0x8(%ebp),%eax
 87d:	89 04 24             	mov    %eax,(%esp)
 880:	e8 a7 fd ff ff       	call   62c <putc>
        putc(fd, c);
 885:	8b 45 e8             	mov    -0x18(%ebp),%eax
 888:	0f be c0             	movsbl %al,%eax
 88b:	89 44 24 04          	mov    %eax,0x4(%esp)
 88f:	8b 45 08             	mov    0x8(%ebp),%eax
 892:	89 04 24             	mov    %eax,(%esp)
 895:	e8 92 fd ff ff       	call   62c <putc>
      }
      state = 0;
 89a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8a1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 8a5:	8b 55 0c             	mov    0xc(%ebp),%edx
 8a8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8ab:	8d 04 02             	lea    (%edx,%eax,1),%eax
 8ae:	0f b6 00             	movzbl (%eax),%eax
 8b1:	84 c0                	test   %al,%al
 8b3:	0f 85 6e fe ff ff    	jne    727 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8b9:	c9                   	leave  
 8ba:	c3                   	ret    
 8bb:	90                   	nop

000008bc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8bc:	55                   	push   %ebp
 8bd:	89 e5                	mov    %esp,%ebp
 8bf:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8c2:	8b 45 08             	mov    0x8(%ebp),%eax
 8c5:	83 e8 08             	sub    $0x8,%eax
 8c8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8cb:	a1 28 10 00 00       	mov    0x1028,%eax
 8d0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8d3:	eb 24                	jmp    8f9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d8:	8b 00                	mov    (%eax),%eax
 8da:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8dd:	77 12                	ja     8f1 <free+0x35>
 8df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8e5:	77 24                	ja     90b <free+0x4f>
 8e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ea:	8b 00                	mov    (%eax),%eax
 8ec:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8ef:	77 1a                	ja     90b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f4:	8b 00                	mov    (%eax),%eax
 8f6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8f9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8ff:	76 d4                	jbe    8d5 <free+0x19>
 901:	8b 45 fc             	mov    -0x4(%ebp),%eax
 904:	8b 00                	mov    (%eax),%eax
 906:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 909:	76 ca                	jbe    8d5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 90b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90e:	8b 40 04             	mov    0x4(%eax),%eax
 911:	c1 e0 03             	shl    $0x3,%eax
 914:	89 c2                	mov    %eax,%edx
 916:	03 55 f8             	add    -0x8(%ebp),%edx
 919:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91c:	8b 00                	mov    (%eax),%eax
 91e:	39 c2                	cmp    %eax,%edx
 920:	75 24                	jne    946 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 922:	8b 45 f8             	mov    -0x8(%ebp),%eax
 925:	8b 50 04             	mov    0x4(%eax),%edx
 928:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92b:	8b 00                	mov    (%eax),%eax
 92d:	8b 40 04             	mov    0x4(%eax),%eax
 930:	01 c2                	add    %eax,%edx
 932:	8b 45 f8             	mov    -0x8(%ebp),%eax
 935:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 938:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93b:	8b 00                	mov    (%eax),%eax
 93d:	8b 10                	mov    (%eax),%edx
 93f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 942:	89 10                	mov    %edx,(%eax)
 944:	eb 0a                	jmp    950 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 946:	8b 45 fc             	mov    -0x4(%ebp),%eax
 949:	8b 10                	mov    (%eax),%edx
 94b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 94e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 950:	8b 45 fc             	mov    -0x4(%ebp),%eax
 953:	8b 40 04             	mov    0x4(%eax),%eax
 956:	c1 e0 03             	shl    $0x3,%eax
 959:	03 45 fc             	add    -0x4(%ebp),%eax
 95c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 95f:	75 20                	jne    981 <free+0xc5>
    p->s.size += bp->s.size;
 961:	8b 45 fc             	mov    -0x4(%ebp),%eax
 964:	8b 50 04             	mov    0x4(%eax),%edx
 967:	8b 45 f8             	mov    -0x8(%ebp),%eax
 96a:	8b 40 04             	mov    0x4(%eax),%eax
 96d:	01 c2                	add    %eax,%edx
 96f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 972:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 975:	8b 45 f8             	mov    -0x8(%ebp),%eax
 978:	8b 10                	mov    (%eax),%edx
 97a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97d:	89 10                	mov    %edx,(%eax)
 97f:	eb 08                	jmp    989 <free+0xcd>
  } else
    p->s.ptr = bp;
 981:	8b 45 fc             	mov    -0x4(%ebp),%eax
 984:	8b 55 f8             	mov    -0x8(%ebp),%edx
 987:	89 10                	mov    %edx,(%eax)
  freep = p;
 989:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98c:	a3 28 10 00 00       	mov    %eax,0x1028
}
 991:	c9                   	leave  
 992:	c3                   	ret    

00000993 <morecore>:

static Header*
morecore(uint nu)
{
 993:	55                   	push   %ebp
 994:	89 e5                	mov    %esp,%ebp
 996:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 999:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9a0:	77 07                	ja     9a9 <morecore+0x16>
    nu = 4096;
 9a2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9a9:	8b 45 08             	mov    0x8(%ebp),%eax
 9ac:	c1 e0 03             	shl    $0x3,%eax
 9af:	89 04 24             	mov    %eax,(%esp)
 9b2:	e8 35 fc ff ff       	call   5ec <sbrk>
 9b7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 9ba:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 9be:	75 07                	jne    9c7 <morecore+0x34>
    return 0;
 9c0:	b8 00 00 00 00       	mov    $0x0,%eax
 9c5:	eb 22                	jmp    9e9 <morecore+0x56>
  hp = (Header*)p;
 9c7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ca:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 9cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d0:	8b 55 08             	mov    0x8(%ebp),%edx
 9d3:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d9:	83 c0 08             	add    $0x8,%eax
 9dc:	89 04 24             	mov    %eax,(%esp)
 9df:	e8 d8 fe ff ff       	call   8bc <free>
  return freep;
 9e4:	a1 28 10 00 00       	mov    0x1028,%eax
}
 9e9:	c9                   	leave  
 9ea:	c3                   	ret    

000009eb <malloc>:

void*
malloc(uint nbytes)
{
 9eb:	55                   	push   %ebp
 9ec:	89 e5                	mov    %esp,%ebp
 9ee:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9f1:	8b 45 08             	mov    0x8(%ebp),%eax
 9f4:	83 c0 07             	add    $0x7,%eax
 9f7:	c1 e8 03             	shr    $0x3,%eax
 9fa:	83 c0 01             	add    $0x1,%eax
 9fd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 a00:	a1 28 10 00 00       	mov    0x1028,%eax
 a05:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a08:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a0c:	75 23                	jne    a31 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a0e:	c7 45 f0 20 10 00 00 	movl   $0x1020,-0x10(%ebp)
 a15:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a18:	a3 28 10 00 00       	mov    %eax,0x1028
 a1d:	a1 28 10 00 00       	mov    0x1028,%eax
 a22:	a3 20 10 00 00       	mov    %eax,0x1020
    base.s.size = 0;
 a27:	c7 05 24 10 00 00 00 	movl   $0x0,0x1024
 a2e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a31:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a34:	8b 00                	mov    (%eax),%eax
 a36:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 a39:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a3c:	8b 40 04             	mov    0x4(%eax),%eax
 a3f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 a42:	72 4d                	jb     a91 <malloc+0xa6>
      if(p->s.size == nunits)
 a44:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a47:	8b 40 04             	mov    0x4(%eax),%eax
 a4a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 a4d:	75 0c                	jne    a5b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a4f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a52:	8b 10                	mov    (%eax),%edx
 a54:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a57:	89 10                	mov    %edx,(%eax)
 a59:	eb 26                	jmp    a81 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a5b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a5e:	8b 40 04             	mov    0x4(%eax),%eax
 a61:	89 c2                	mov    %eax,%edx
 a63:	2b 55 f4             	sub    -0xc(%ebp),%edx
 a66:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a69:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a6c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a6f:	8b 40 04             	mov    0x4(%eax),%eax
 a72:	c1 e0 03             	shl    $0x3,%eax
 a75:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 a78:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a7b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a7e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a84:	a3 28 10 00 00       	mov    %eax,0x1028
      return (void*)(p + 1);
 a89:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a8c:	83 c0 08             	add    $0x8,%eax
 a8f:	eb 38                	jmp    ac9 <malloc+0xde>
    }
    if(p == freep)
 a91:	a1 28 10 00 00       	mov    0x1028,%eax
 a96:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 a99:	75 1b                	jne    ab6 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a9b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9e:	89 04 24             	mov    %eax,(%esp)
 aa1:	e8 ed fe ff ff       	call   993 <morecore>
 aa6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 aa9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 aad:	75 07                	jne    ab6 <malloc+0xcb>
        return 0;
 aaf:	b8 00 00 00 00       	mov    $0x0,%eax
 ab4:	eb 13                	jmp    ac9 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ab6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ab9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 abc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 abf:	8b 00                	mov    (%eax),%eax
 ac1:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 ac4:	e9 70 ff ff ff       	jmp    a39 <malloc+0x4e>
}
 ac9:	c9                   	leave  
 aca:	c3                   	ret    
 acb:	90                   	nop

00000acc <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 acc:	55                   	push   %ebp
 acd:	89 e5                	mov    %esp,%ebp
 acf:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 ad2:	8b 55 08             	mov    0x8(%ebp),%edx
 ad5:	8b 45 0c             	mov    0xc(%ebp),%eax
 ad8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 adb:	f0 87 02             	lock xchg %eax,(%edx)
 ade:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 ae1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 ae4:	c9                   	leave  
 ae5:	c3                   	ret    

00000ae6 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 ae6:	55                   	push   %ebp
 ae7:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 ae9:	8b 45 08             	mov    0x8(%ebp),%eax
 aec:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 af2:	5d                   	pop    %ebp
 af3:	c3                   	ret    

00000af4 <lock_acquire>:
void lock_acquire(lock_t *lock){
 af4:	55                   	push   %ebp
 af5:	89 e5                	mov    %esp,%ebp
 af7:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 afa:	8b 45 08             	mov    0x8(%ebp),%eax
 afd:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 b04:	00 
 b05:	89 04 24             	mov    %eax,(%esp)
 b08:	e8 bf ff ff ff       	call   acc <xchg>
 b0d:	85 c0                	test   %eax,%eax
 b0f:	75 e9                	jne    afa <lock_acquire+0x6>
}
 b11:	c9                   	leave  
 b12:	c3                   	ret    

00000b13 <lock_release>:
void lock_release(lock_t *lock){
 b13:	55                   	push   %ebp
 b14:	89 e5                	mov    %esp,%ebp
 b16:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 b19:	8b 45 08             	mov    0x8(%ebp),%eax
 b1c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 b23:	00 
 b24:	89 04 24             	mov    %eax,(%esp)
 b27:	e8 a0 ff ff ff       	call   acc <xchg>
}
 b2c:	c9                   	leave  
 b2d:	c3                   	ret    

00000b2e <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 b2e:	55                   	push   %ebp
 b2f:	89 e5                	mov    %esp,%ebp
 b31:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 b34:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 b3b:	e8 ab fe ff ff       	call   9eb <malloc>
 b40:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 b43:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b46:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 b49:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b4c:	25 ff 0f 00 00       	and    $0xfff,%eax
 b51:	85 c0                	test   %eax,%eax
 b53:	74 15                	je     b6a <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 b55:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b58:	89 c2                	mov    %eax,%edx
 b5a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 b60:	b8 00 10 00 00       	mov    $0x1000,%eax
 b65:	29 d0                	sub    %edx,%eax
 b67:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 b6a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b6e:	75 1b                	jne    b8b <thread_create+0x5d>

        printf(1,"malloc fail \n");
 b70:	c7 44 24 04 ac 0f 00 	movl   $0xfac,0x4(%esp)
 b77:	00 
 b78:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b7f:	e8 81 fb ff ff       	call   705 <printf>
        return 0;
 b84:	b8 00 00 00 00       	mov    $0x0,%eax
 b89:	eb 6f                	jmp    bfa <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 b8b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 b8e:	8b 55 08             	mov    0x8(%ebp),%edx
 b91:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b94:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 b98:	89 54 24 08          	mov    %edx,0x8(%esp)
 b9c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 ba3:	00 
 ba4:	89 04 24             	mov    %eax,(%esp)
 ba7:	e8 58 fa ff ff       	call   604 <clone>
 bac:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 baf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bb3:	79 1b                	jns    bd0 <thread_create+0xa2>
        printf(1,"clone fails\n");
 bb5:	c7 44 24 04 ba 0f 00 	movl   $0xfba,0x4(%esp)
 bbc:	00 
 bbd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bc4:	e8 3c fb ff ff       	call   705 <printf>
        return 0;
 bc9:	b8 00 00 00 00       	mov    $0x0,%eax
 bce:	eb 2a                	jmp    bfa <thread_create+0xcc>
    }
    if(tid > 0){
 bd0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bd4:	7e 05                	jle    bdb <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 bd6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd9:	eb 1f                	jmp    bfa <thread_create+0xcc>
    }
    if(tid == 0){
 bdb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bdf:	75 14                	jne    bf5 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 be1:	c7 44 24 04 c7 0f 00 	movl   $0xfc7,0x4(%esp)
 be8:	00 
 be9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bf0:	e8 10 fb ff ff       	call   705 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 bf5:	b8 00 00 00 00       	mov    $0x0,%eax
}
 bfa:	c9                   	leave  
 bfb:	c3                   	ret    

00000bfc <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 bfc:	55                   	push   %ebp
 bfd:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 bff:	8b 45 08             	mov    0x8(%ebp),%eax
 c02:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 c08:	8b 45 08             	mov    0x8(%ebp),%eax
 c0b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 c12:	8b 45 08             	mov    0x8(%ebp),%eax
 c15:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 c1c:	5d                   	pop    %ebp
 c1d:	c3                   	ret    

00000c1e <add_q>:

void add_q(struct queue *q, int v){
 c1e:	55                   	push   %ebp
 c1f:	89 e5                	mov    %esp,%ebp
 c21:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 c24:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 c2b:	e8 bb fd ff ff       	call   9eb <malloc>
 c30:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 c33:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c36:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 c3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c40:	8b 55 0c             	mov    0xc(%ebp),%edx
 c43:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 c45:	8b 45 08             	mov    0x8(%ebp),%eax
 c48:	8b 40 04             	mov    0x4(%eax),%eax
 c4b:	85 c0                	test   %eax,%eax
 c4d:	75 0b                	jne    c5a <add_q+0x3c>
        q->head = n;
 c4f:	8b 45 08             	mov    0x8(%ebp),%eax
 c52:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c55:	89 50 04             	mov    %edx,0x4(%eax)
 c58:	eb 0c                	jmp    c66 <add_q+0x48>
    }else{
        q->tail->next = n;
 c5a:	8b 45 08             	mov    0x8(%ebp),%eax
 c5d:	8b 40 08             	mov    0x8(%eax),%eax
 c60:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c63:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 c66:	8b 45 08             	mov    0x8(%ebp),%eax
 c69:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c6c:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 c6f:	8b 45 08             	mov    0x8(%ebp),%eax
 c72:	8b 00                	mov    (%eax),%eax
 c74:	8d 50 01             	lea    0x1(%eax),%edx
 c77:	8b 45 08             	mov    0x8(%ebp),%eax
 c7a:	89 10                	mov    %edx,(%eax)
}
 c7c:	c9                   	leave  
 c7d:	c3                   	ret    

00000c7e <empty_q>:

int empty_q(struct queue *q){
 c7e:	55                   	push   %ebp
 c7f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 c81:	8b 45 08             	mov    0x8(%ebp),%eax
 c84:	8b 00                	mov    (%eax),%eax
 c86:	85 c0                	test   %eax,%eax
 c88:	75 07                	jne    c91 <empty_q+0x13>
        return 1;
 c8a:	b8 01 00 00 00       	mov    $0x1,%eax
 c8f:	eb 05                	jmp    c96 <empty_q+0x18>
    else
        return 0;
 c91:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 c96:	5d                   	pop    %ebp
 c97:	c3                   	ret    

00000c98 <pop_q>:
int pop_q(struct queue *q){
 c98:	55                   	push   %ebp
 c99:	89 e5                	mov    %esp,%ebp
 c9b:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 c9e:	8b 45 08             	mov    0x8(%ebp),%eax
 ca1:	89 04 24             	mov    %eax,(%esp)
 ca4:	e8 d5 ff ff ff       	call   c7e <empty_q>
 ca9:	85 c0                	test   %eax,%eax
 cab:	75 5d                	jne    d0a <pop_q+0x72>
       val = q->head->value; 
 cad:	8b 45 08             	mov    0x8(%ebp),%eax
 cb0:	8b 40 04             	mov    0x4(%eax),%eax
 cb3:	8b 00                	mov    (%eax),%eax
 cb5:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 cb8:	8b 45 08             	mov    0x8(%ebp),%eax
 cbb:	8b 40 04             	mov    0x4(%eax),%eax
 cbe:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 cc1:	8b 45 08             	mov    0x8(%ebp),%eax
 cc4:	8b 40 04             	mov    0x4(%eax),%eax
 cc7:	8b 50 04             	mov    0x4(%eax),%edx
 cca:	8b 45 08             	mov    0x8(%ebp),%eax
 ccd:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 cd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cd3:	89 04 24             	mov    %eax,(%esp)
 cd6:	e8 e1 fb ff ff       	call   8bc <free>
       q->size--;
 cdb:	8b 45 08             	mov    0x8(%ebp),%eax
 cde:	8b 00                	mov    (%eax),%eax
 ce0:	8d 50 ff             	lea    -0x1(%eax),%edx
 ce3:	8b 45 08             	mov    0x8(%ebp),%eax
 ce6:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 ce8:	8b 45 08             	mov    0x8(%ebp),%eax
 ceb:	8b 00                	mov    (%eax),%eax
 ced:	85 c0                	test   %eax,%eax
 cef:	75 14                	jne    d05 <pop_q+0x6d>
            q->head = 0;
 cf1:	8b 45 08             	mov    0x8(%ebp),%eax
 cf4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 cfb:	8b 45 08             	mov    0x8(%ebp),%eax
 cfe:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 d05:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d08:	eb 05                	jmp    d0f <pop_q+0x77>
    }
    return -1;
 d0a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 d0f:	c9                   	leave  
 d10:	c3                   	ret    
 d11:	90                   	nop
 d12:	90                   	nop
 d13:	90                   	nop

00000d14 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 d14:	55                   	push   %ebp
 d15:	89 e5                	mov    %esp,%ebp
 d17:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 d1a:	8b 45 08             	mov    0x8(%ebp),%eax
 d1d:	8b 55 0c             	mov    0xc(%ebp),%edx
 d20:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 d23:	8b 45 08             	mov    0x8(%ebp),%eax
 d26:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 d2d:	8b 45 08             	mov    0x8(%ebp),%eax
 d30:	89 04 24             	mov    %eax,(%esp)
 d33:	e8 ae fd ff ff       	call   ae6 <lock_init>
}
 d38:	c9                   	leave  
 d39:	c3                   	ret    

00000d3a <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 d3a:	55                   	push   %ebp
 d3b:	89 e5                	mov    %esp,%ebp
 d3d:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 d40:	8b 45 08             	mov    0x8(%ebp),%eax
 d43:	89 04 24             	mov    %eax,(%esp)
 d46:	e8 a9 fd ff ff       	call   af4 <lock_acquire>
	if(s->count  == 0){
 d4b:	8b 45 08             	mov    0x8(%ebp),%eax
 d4e:	8b 40 04             	mov    0x4(%eax),%eax
 d51:	85 c0                	test   %eax,%eax
 d53:	75 43                	jne    d98 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 d55:	c7 44 24 04 d8 0f 00 	movl   $0xfd8,0x4(%esp)
 d5c:	00 
 d5d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d64:	e8 9c f9 ff ff       	call   705 <printf>
		//add proc to waiters list
		int tid = getpid();
 d69:	e8 76 f8 ff ff       	call   5e4 <getpid>
 d6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 d71:	8b 45 08             	mov    0x8(%ebp),%eax
 d74:	8d 50 0c             	lea    0xc(%eax),%edx
 d77:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d7a:	89 44 24 04          	mov    %eax,0x4(%esp)
 d7e:	89 14 24             	mov    %edx,(%esp)
 d81:	e8 98 fe ff ff       	call   c1e <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 d86:	8b 45 08             	mov    0x8(%ebp),%eax
 d89:	89 04 24             	mov    %eax,(%esp)
 d8c:	e8 82 fd ff ff       	call   b13 <lock_release>
		tsleep(); 
 d91:	e8 7e f8 ff ff       	call   614 <tsleep>
 d96:	eb 2e                	jmp    dc6 <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 d98:	c7 44 24 04 df 0f 00 	movl   $0xfdf,0x4(%esp)
 d9f:	00 
 da0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 da7:	e8 59 f9 ff ff       	call   705 <printf>
		s->count--;	
 dac:	8b 45 08             	mov    0x8(%ebp),%eax
 daf:	8b 40 04             	mov    0x4(%eax),%eax
 db2:	8d 50 ff             	lea    -0x1(%eax),%edx
 db5:	8b 45 08             	mov    0x8(%ebp),%eax
 db8:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 dbb:	8b 45 08             	mov    0x8(%ebp),%eax
 dbe:	89 04 24             	mov    %eax,(%esp)
 dc1:	e8 4d fd ff ff       	call   b13 <lock_release>
	}
}
 dc6:	c9                   	leave  
 dc7:	c3                   	ret    

00000dc8 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 dc8:	55                   	push   %ebp
 dc9:	89 e5                	mov    %esp,%ebp
 dcb:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 dce:	c7 44 24 04 e6 0f 00 	movl   $0xfe6,0x4(%esp)
 dd5:	00 
 dd6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ddd:	e8 23 f9 ff ff       	call   705 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 de2:	8b 45 08             	mov    0x8(%ebp),%eax
 de5:	89 04 24             	mov    %eax,(%esp)
 de8:	e8 07 fd ff ff       	call   af4 <lock_acquire>
	if(s->count < s->size){
 ded:	8b 45 08             	mov    0x8(%ebp),%eax
 df0:	8b 50 04             	mov    0x4(%eax),%edx
 df3:	8b 45 08             	mov    0x8(%ebp),%eax
 df6:	8b 40 08             	mov    0x8(%eax),%eax
 df9:	39 c2                	cmp    %eax,%edx
 dfb:	7d 0f                	jge    e0c <sem_signal+0x44>
		s->count++;	
 dfd:	8b 45 08             	mov    0x8(%ebp),%eax
 e00:	8b 40 04             	mov    0x4(%eax),%eax
 e03:	8d 50 01             	lea    0x1(%eax),%edx
 e06:	8b 45 08             	mov    0x8(%ebp),%eax
 e09:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 e0c:	8b 45 08             	mov    0x8(%ebp),%eax
 e0f:	83 c0 0c             	add    $0xc,%eax
 e12:	89 04 24             	mov    %eax,(%esp)
 e15:	e8 7e fe ff ff       	call   c98 <pop_q>
 e1a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 e1d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 e21:	74 2e                	je     e51 <sem_signal+0x89>
		printf(1, "Sem A\n");
 e23:	c7 44 24 04 df 0f 00 	movl   $0xfdf,0x4(%esp)
 e2a:	00 
 e2b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 e32:	e8 ce f8 ff ff       	call   705 <printf>
		twakeup(tid);
 e37:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e3a:	89 04 24             	mov    %eax,(%esp)
 e3d:	e8 da f7 ff ff       	call   61c <twakeup>
		s->count--;
 e42:	8b 45 08             	mov    0x8(%ebp),%eax
 e45:	8b 40 04             	mov    0x4(%eax),%eax
 e48:	8d 50 ff             	lea    -0x1(%eax),%edx
 e4b:	8b 45 08             	mov    0x8(%ebp),%eax
 e4e:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 e51:	8b 45 08             	mov    0x8(%ebp),%eax
 e54:	89 04 24             	mov    %eax,(%esp)
 e57:	e8 b7 fc ff ff       	call   b13 <lock_release>

 e5c:	c9                   	leave  
 e5d:	c3                   	ret    
