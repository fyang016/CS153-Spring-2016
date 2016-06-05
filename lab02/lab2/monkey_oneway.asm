
_monkey_oneway:     file format elf32-i386


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
	sem_init(&wait_tree, 3);  //Initialize semaphore with 5
   9:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
  10:	00 
  11:	c7 04 24 20 11 00 00 	movl   $0x1120,(%esp)
  18:	e8 6f 0d 00 00       	call   d8c <sem_init>
	sem_init(&mutex1, 1);  //Initialize semaphore with 5
  1d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  24:	00 
  25:	c7 04 24 60 11 00 00 	movl   $0x1160,(%esp)
  2c:	e8 5b 0d 00 00       	call   d8c <sem_init>
	sem_init(&mutex2, 1);  //Initialize semaphore with 5
  31:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  38:	00 
  39:	c7 04 24 e0 10 00 00 	movl   $0x10e0,(%esp)
  40:	e8 47 0d 00 00       	call   d8c <sem_init>
	sem_init(&climb, 1);  //Initialize semaphore with 5 slots
  45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 a0 10 00 00 	movl   $0x10a0,(%esp)
  54:	e8 33 0d 00 00       	call   d8c <sem_init>
	
	int i;
	sem_signal(&wait_tree);
  59:	c7 04 24 20 11 00 00 	movl   $0x1120,(%esp)
  60:	e8 db 0d 00 00       	call   e40 <sem_signal>
	sem_signal(&wait_tree);
  65:	c7 04 24 20 11 00 00 	movl   $0x1120,(%esp)
  6c:	e8 cf 0d 00 00       	call   e40 <sem_signal>
	sem_signal(&wait_tree);
  71:	c7 04 24 20 11 00 00 	movl   $0x1120,(%esp)
  78:	e8 c3 0d 00 00       	call   e40 <sem_signal>
	sem_signal(&wait_tree);
  7d:	c7 04 24 20 11 00 00 	movl   $0x1120,(%esp)
  84:	e8 b7 0d 00 00       	call   e40 <sem_signal>

	sem_signal(&mutex1);
  89:	c7 04 24 60 11 00 00 	movl   $0x1160,(%esp)
  90:	e8 ab 0d 00 00       	call   e40 <sem_signal>
	sem_signal(&mutex2);
  95:	c7 04 24 e0 10 00 00 	movl   $0x10e0,(%esp)
  9c:	e8 9f 0d 00 00       	call   e40 <sem_signal>
	sem_signal(&climb);
  a1:	c7 04 24 a0 10 00 00 	movl   $0x10a0,(%esp)
  a8:	e8 93 0d 00 00       	call   e40 <sem_signal>

  	printf(1, "\n\nFirst # is the PID\n");
  ad:	c7 44 24 04 d8 0e 00 	movl   $0xed8,0x4(%esp)
  b4:	00 
  b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bc:	e8 bc 06 00 00       	call   77d <printf>
  	printf(1, "\nSecond # is waiting state\n");
  c1:	c7 44 24 04 ee 0e 00 	movl   $0xeee,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 a8 06 00 00       	call   77d <printf>
  	printf(1, "1 - waiting to climb tree\n");
  d5:	c7 44 24 04 0a 0f 00 	movl   $0xf0a,0x4(%esp)
  dc:	00 
  dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e4:	e8 94 06 00 00       	call   77d <printf>
  	printf(1, "2 - climbing tree\n");
  e9:	c7 44 24 04 25 0f 00 	movl   $0xf25,0x4(%esp)
  f0:	00 
  f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f8:	e8 80 06 00 00       	call   77d <printf>
  	printf(1, "3 - Found a banana climbing down\n");
  fd:	c7 44 24 04 38 0f 00 	movl   $0xf38,0x4(%esp)
 104:	00 
 105:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 10c:	e8 6c 06 00 00       	call   77d <printf>
  	printf(1, "4 - Eating banana\n\n");
 111:	c7 44 24 04 5a 0f 00 	movl   $0xf5a,0x4(%esp)
 118:	00 
 119:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 120:	e8 58 06 00 00       	call   77d <printf>
  	printf(1, "Third # is monkeys on tree\n");
 125:	c7 44 24 04 6e 0f 00 	movl   $0xf6e,0x4(%esp)
 12c:	00 
 12d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 134:	e8 44 06 00 00       	call   77d <printf>
  	printf(1, "*abreviations\n");
 139:	c7 44 24 04 8a 0f 00 	movl   $0xf8a,0x4(%esp)
 140:	00 
 141:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 148:	e8 30 06 00 00       	call   77d <printf>
  	printf(1, "Sem A - Semaphore Aquired\n");
 14d:	c7 44 24 04 99 0f 00 	movl   $0xf99,0x4(%esp)
 154:	00 
 155:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 15c:	e8 1c 06 00 00       	call   77d <printf>
  	printf(1, "Sem R - Sempahore Released\n");
 161:	c7 44 24 04 b4 0f 00 	movl   $0xfb4,0x4(%esp)
 168:	00 
 169:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 170:	e8 08 06 00 00       	call   77d <printf>
  	printf(1, "Sem F - Sempahore Full\n\n");
 175:	c7 44 24 04 d0 0f 00 	movl   $0xfd0,0x4(%esp)
 17c:	00 
 17d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 184:	e8 f4 05 00 00       	call   77d <printf>
	for(i = 0; i < 5; i++) thread_create(monkey, 0);
 189:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
 190:	00 
 191:	eb 1a                	jmp    1ad <main+0x1ad>
 193:	b8 d6 01 00 00       	mov    $0x1d6,%eax
 198:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 19f:	00 
 1a0:	89 04 24             	mov    %eax,(%esp)
 1a3:	e8 fe 09 00 00       	call   ba6 <thread_create>
 1a8:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1ad:	83 7c 24 1c 04       	cmpl   $0x4,0x1c(%esp)
 1b2:	7e df                	jle    193 <main+0x193>
    while(wait() > 0);
 1b4:	e8 2b 04 00 00       	call   5e4 <wait>
 1b9:	85 c0                	test   %eax,%eax
 1bb:	7f f7                	jg     1b4 <main+0x1b4>
	printf(1,"All monkeys are full\n");
 1bd:	c7 44 24 04 e9 0f 00 	movl   $0xfe9,0x4(%esp)
 1c4:	00 
 1c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1cc:	e8 ac 05 00 00       	call   77d <printf>
	exit();
 1d1:	e8 06 04 00 00       	call   5dc <exit>

000001d6 <monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
 1d6:	55                   	push   %ebp
 1d7:	89 e5                	mov    %esp,%ebp
 1d9:	83 ec 28             	sub    $0x28,%esp
  int pid =  getpid();
 1dc:	e8 7b 04 00 00       	call   65c <getpid>
 1e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1, "%d",pid);
 1e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e7:	89 44 24 08          	mov    %eax,0x8(%esp)
 1eb:	c7 44 24 04 ff 0f 00 	movl   $0xfff,0x4(%esp)
 1f2:	00 
 1f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1fa:	e8 7e 05 00 00       	call   77d <printf>
  printf(1, " - 1");
 1ff:	c7 44 24 04 02 10 00 	movl   $0x1002,0x4(%esp)
 206:	00 
 207:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 20e:	e8 6a 05 00 00       	call   77d <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 213:	a1 24 11 00 00       	mov    0x1124,%eax
 218:	ba 03 00 00 00       	mov    $0x3,%edx
 21d:	89 d1                	mov    %edx,%ecx
 21f:	29 c1                	sub    %eax,%ecx
 221:	89 c8                	mov    %ecx,%eax
 223:	89 44 24 08          	mov    %eax,0x8(%esp)
 227:	c7 44 24 04 07 10 00 	movl   $0x1007,0x4(%esp)
 22e:	00 
 22f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 236:	e8 42 05 00 00       	call   77d <printf>
  sem_aquire(&wait_tree);
 23b:	c7 04 24 20 11 00 00 	movl   $0x1120,(%esp)
 242:	e8 6b 0b 00 00       	call   db2 <sem_aquire>
  printf(1, "%d",pid);
 247:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24a:	89 44 24 08          	mov    %eax,0x8(%esp)
 24e:	c7 44 24 04 ff 0f 00 	movl   $0xfff,0x4(%esp)
 255:	00 
 256:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 25d:	e8 1b 05 00 00       	call   77d <printf>
  printf(1, " - 2");
 262:	c7 44 24 04 0e 10 00 	movl   $0x100e,0x4(%esp)
 269:	00 
 26a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 271:	e8 07 05 00 00       	call   77d <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 276:	a1 24 11 00 00       	mov    0x1124,%eax
 27b:	ba 03 00 00 00       	mov    $0x3,%edx
 280:	89 d1                	mov    %edx,%ecx
 282:	29 c1                	sub    %eax,%ecx
 284:	89 c8                	mov    %ecx,%eax
 286:	89 44 24 08          	mov    %eax,0x8(%esp)
 28a:	c7 44 24 04 07 10 00 	movl   $0x1007,0x4(%esp)
 291:	00 
 292:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 299:	e8 df 04 00 00       	call   77d <printf>
  sleep(3); 
 29e:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 2a5:	e8 c2 03 00 00       	call   66c <sleep>
  sem_aquire(&mutex1);
 2aa:	c7 04 24 60 11 00 00 	movl   $0x1160,(%esp)
 2b1:	e8 fc 0a 00 00       	call   db2 <sem_aquire>
  printf(1, "%d",pid);
 2b6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b9:	89 44 24 08          	mov    %eax,0x8(%esp)
 2bd:	c7 44 24 04 ff 0f 00 	movl   $0xfff,0x4(%esp)
 2c4:	00 
 2c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2cc:	e8 ac 04 00 00       	call   77d <printf>
  printf(1, " - 3");
 2d1:	c7 44 24 04 13 10 00 	movl   $0x1013,0x4(%esp)
 2d8:	00 
 2d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2e0:	e8 98 04 00 00       	call   77d <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 2e5:	a1 24 11 00 00       	mov    0x1124,%eax
 2ea:	ba 03 00 00 00       	mov    $0x3,%edx
 2ef:	89 d1                	mov    %edx,%ecx
 2f1:	29 c1                	sub    %eax,%ecx
 2f3:	89 c8                	mov    %ecx,%eax
 2f5:	89 44 24 08          	mov    %eax,0x8(%esp)
 2f9:	c7 44 24 04 07 10 00 	movl   $0x1007,0x4(%esp)
 300:	00 
 301:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 308:	e8 70 04 00 00       	call   77d <printf>
  sem_signal(&wait_tree);
 30d:	c7 04 24 20 11 00 00 	movl   $0x1120,(%esp)
 314:	e8 27 0b 00 00       	call   e40 <sem_signal>
  printf(1, "%d",pid);
 319:	8b 45 f4             	mov    -0xc(%ebp),%eax
 31c:	89 44 24 08          	mov    %eax,0x8(%esp)
 320:	c7 44 24 04 ff 0f 00 	movl   $0xfff,0x4(%esp)
 327:	00 
 328:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 32f:	e8 49 04 00 00       	call   77d <printf>
  printf(1, " - 4"); 
 334:	c7 44 24 04 18 10 00 	movl   $0x1018,0x4(%esp)
 33b:	00 
 33c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 343:	e8 35 04 00 00       	call   77d <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);  
 348:	a1 24 11 00 00       	mov    0x1124,%eax
 34d:	ba 03 00 00 00       	mov    $0x3,%edx
 352:	89 d1                	mov    %edx,%ecx
 354:	29 c1                	sub    %eax,%ecx
 356:	89 c8                	mov    %ecx,%eax
 358:	89 44 24 08          	mov    %eax,0x8(%esp)
 35c:	c7 44 24 04 07 10 00 	movl   $0x1007,0x4(%esp)
 363:	00 
 364:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 36b:	e8 0d 04 00 00       	call   77d <printf>
  texit();
 370:	e8 0f 03 00 00       	call   684 <texit>
 375:	90                   	nop
 376:	90                   	nop
 377:	90                   	nop

00000378 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 378:	55                   	push   %ebp
 379:	89 e5                	mov    %esp,%ebp
 37b:	57                   	push   %edi
 37c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 37d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 380:	8b 55 10             	mov    0x10(%ebp),%edx
 383:	8b 45 0c             	mov    0xc(%ebp),%eax
 386:	89 cb                	mov    %ecx,%ebx
 388:	89 df                	mov    %ebx,%edi
 38a:	89 d1                	mov    %edx,%ecx
 38c:	fc                   	cld    
 38d:	f3 aa                	rep stos %al,%es:(%edi)
 38f:	89 ca                	mov    %ecx,%edx
 391:	89 fb                	mov    %edi,%ebx
 393:	89 5d 08             	mov    %ebx,0x8(%ebp)
 396:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 399:	5b                   	pop    %ebx
 39a:	5f                   	pop    %edi
 39b:	5d                   	pop    %ebp
 39c:	c3                   	ret    

0000039d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 39d:	55                   	push   %ebp
 39e:	89 e5                	mov    %esp,%ebp
 3a0:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 3a3:	8b 45 08             	mov    0x8(%ebp),%eax
 3a6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 3a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ac:	0f b6 10             	movzbl (%eax),%edx
 3af:	8b 45 08             	mov    0x8(%ebp),%eax
 3b2:	88 10                	mov    %dl,(%eax)
 3b4:	8b 45 08             	mov    0x8(%ebp),%eax
 3b7:	0f b6 00             	movzbl (%eax),%eax
 3ba:	84 c0                	test   %al,%al
 3bc:	0f 95 c0             	setne  %al
 3bf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3c3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 3c7:	84 c0                	test   %al,%al
 3c9:	75 de                	jne    3a9 <strcpy+0xc>
    ;
  return os;
 3cb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ce:	c9                   	leave  
 3cf:	c3                   	ret    

000003d0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3d0:	55                   	push   %ebp
 3d1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3d3:	eb 08                	jmp    3dd <strcmp+0xd>
    p++, q++;
 3d5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3d9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3dd:	8b 45 08             	mov    0x8(%ebp),%eax
 3e0:	0f b6 00             	movzbl (%eax),%eax
 3e3:	84 c0                	test   %al,%al
 3e5:	74 10                	je     3f7 <strcmp+0x27>
 3e7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ea:	0f b6 10             	movzbl (%eax),%edx
 3ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f0:	0f b6 00             	movzbl (%eax),%eax
 3f3:	38 c2                	cmp    %al,%dl
 3f5:	74 de                	je     3d5 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3f7:	8b 45 08             	mov    0x8(%ebp),%eax
 3fa:	0f b6 00             	movzbl (%eax),%eax
 3fd:	0f b6 d0             	movzbl %al,%edx
 400:	8b 45 0c             	mov    0xc(%ebp),%eax
 403:	0f b6 00             	movzbl (%eax),%eax
 406:	0f b6 c0             	movzbl %al,%eax
 409:	89 d1                	mov    %edx,%ecx
 40b:	29 c1                	sub    %eax,%ecx
 40d:	89 c8                	mov    %ecx,%eax
}
 40f:	5d                   	pop    %ebp
 410:	c3                   	ret    

00000411 <strlen>:

uint
strlen(char *s)
{
 411:	55                   	push   %ebp
 412:	89 e5                	mov    %esp,%ebp
 414:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 417:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 41e:	eb 04                	jmp    424 <strlen+0x13>
 420:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 424:	8b 45 fc             	mov    -0x4(%ebp),%eax
 427:	03 45 08             	add    0x8(%ebp),%eax
 42a:	0f b6 00             	movzbl (%eax),%eax
 42d:	84 c0                	test   %al,%al
 42f:	75 ef                	jne    420 <strlen+0xf>
    ;
  return n;
 431:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 434:	c9                   	leave  
 435:	c3                   	ret    

00000436 <memset>:

void*
memset(void *dst, int c, uint n)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 43c:	8b 45 10             	mov    0x10(%ebp),%eax
 43f:	89 44 24 08          	mov    %eax,0x8(%esp)
 443:	8b 45 0c             	mov    0xc(%ebp),%eax
 446:	89 44 24 04          	mov    %eax,0x4(%esp)
 44a:	8b 45 08             	mov    0x8(%ebp),%eax
 44d:	89 04 24             	mov    %eax,(%esp)
 450:	e8 23 ff ff ff       	call   378 <stosb>
  return dst;
 455:	8b 45 08             	mov    0x8(%ebp),%eax
}
 458:	c9                   	leave  
 459:	c3                   	ret    

0000045a <strchr>:

char*
strchr(const char *s, char c)
{
 45a:	55                   	push   %ebp
 45b:	89 e5                	mov    %esp,%ebp
 45d:	83 ec 04             	sub    $0x4,%esp
 460:	8b 45 0c             	mov    0xc(%ebp),%eax
 463:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 466:	eb 14                	jmp    47c <strchr+0x22>
    if(*s == c)
 468:	8b 45 08             	mov    0x8(%ebp),%eax
 46b:	0f b6 00             	movzbl (%eax),%eax
 46e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 471:	75 05                	jne    478 <strchr+0x1e>
      return (char*)s;
 473:	8b 45 08             	mov    0x8(%ebp),%eax
 476:	eb 13                	jmp    48b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 478:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 47c:	8b 45 08             	mov    0x8(%ebp),%eax
 47f:	0f b6 00             	movzbl (%eax),%eax
 482:	84 c0                	test   %al,%al
 484:	75 e2                	jne    468 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 486:	b8 00 00 00 00       	mov    $0x0,%eax
}
 48b:	c9                   	leave  
 48c:	c3                   	ret    

0000048d <gets>:

char*
gets(char *buf, int max)
{
 48d:	55                   	push   %ebp
 48e:	89 e5                	mov    %esp,%ebp
 490:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 493:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 49a:	eb 44                	jmp    4e0 <gets+0x53>
    cc = read(0, &c, 1);
 49c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4a3:	00 
 4a4:	8d 45 ef             	lea    -0x11(%ebp),%eax
 4a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ab:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4b2:	e8 3d 01 00 00       	call   5f4 <read>
 4b7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 4ba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4be:	7e 2d                	jle    4ed <gets+0x60>
      break;
    buf[i++] = c;
 4c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4c3:	03 45 08             	add    0x8(%ebp),%eax
 4c6:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 4ca:	88 10                	mov    %dl,(%eax)
 4cc:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 4d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4d4:	3c 0a                	cmp    $0xa,%al
 4d6:	74 16                	je     4ee <gets+0x61>
 4d8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4dc:	3c 0d                	cmp    $0xd,%al
 4de:	74 0e                	je     4ee <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4e3:	83 c0 01             	add    $0x1,%eax
 4e6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4e9:	7c b1                	jl     49c <gets+0xf>
 4eb:	eb 01                	jmp    4ee <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 4ed:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4f1:	03 45 08             	add    0x8(%ebp),%eax
 4f4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4f7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4fa:	c9                   	leave  
 4fb:	c3                   	ret    

000004fc <stat>:

int
stat(char *n, struct stat *st)
{
 4fc:	55                   	push   %ebp
 4fd:	89 e5                	mov    %esp,%ebp
 4ff:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 502:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 509:	00 
 50a:	8b 45 08             	mov    0x8(%ebp),%eax
 50d:	89 04 24             	mov    %eax,(%esp)
 510:	e8 07 01 00 00       	call   61c <open>
 515:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 518:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 51c:	79 07                	jns    525 <stat+0x29>
    return -1;
 51e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 523:	eb 23                	jmp    548 <stat+0x4c>
  r = fstat(fd, st);
 525:	8b 45 0c             	mov    0xc(%ebp),%eax
 528:	89 44 24 04          	mov    %eax,0x4(%esp)
 52c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 52f:	89 04 24             	mov    %eax,(%esp)
 532:	e8 fd 00 00 00       	call   634 <fstat>
 537:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 53a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 53d:	89 04 24             	mov    %eax,(%esp)
 540:	e8 bf 00 00 00       	call   604 <close>
  return r;
 545:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 548:	c9                   	leave  
 549:	c3                   	ret    

0000054a <atoi>:

int
atoi(const char *s)
{
 54a:	55                   	push   %ebp
 54b:	89 e5                	mov    %esp,%ebp
 54d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 550:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 557:	eb 24                	jmp    57d <atoi+0x33>
    n = n*10 + *s++ - '0';
 559:	8b 55 fc             	mov    -0x4(%ebp),%edx
 55c:	89 d0                	mov    %edx,%eax
 55e:	c1 e0 02             	shl    $0x2,%eax
 561:	01 d0                	add    %edx,%eax
 563:	01 c0                	add    %eax,%eax
 565:	89 c2                	mov    %eax,%edx
 567:	8b 45 08             	mov    0x8(%ebp),%eax
 56a:	0f b6 00             	movzbl (%eax),%eax
 56d:	0f be c0             	movsbl %al,%eax
 570:	8d 04 02             	lea    (%edx,%eax,1),%eax
 573:	83 e8 30             	sub    $0x30,%eax
 576:	89 45 fc             	mov    %eax,-0x4(%ebp)
 579:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 57d:	8b 45 08             	mov    0x8(%ebp),%eax
 580:	0f b6 00             	movzbl (%eax),%eax
 583:	3c 2f                	cmp    $0x2f,%al
 585:	7e 0a                	jle    591 <atoi+0x47>
 587:	8b 45 08             	mov    0x8(%ebp),%eax
 58a:	0f b6 00             	movzbl (%eax),%eax
 58d:	3c 39                	cmp    $0x39,%al
 58f:	7e c8                	jle    559 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 591:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 594:	c9                   	leave  
 595:	c3                   	ret    

00000596 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 596:	55                   	push   %ebp
 597:	89 e5                	mov    %esp,%ebp
 599:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 59c:	8b 45 08             	mov    0x8(%ebp),%eax
 59f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 5a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 5a5:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 5a8:	eb 13                	jmp    5bd <memmove+0x27>
    *dst++ = *src++;
 5aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5ad:	0f b6 10             	movzbl (%eax),%edx
 5b0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5b3:	88 10                	mov    %dl,(%eax)
 5b5:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 5b9:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5bd:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 5c1:	0f 9f c0             	setg   %al
 5c4:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 5c8:	84 c0                	test   %al,%al
 5ca:	75 de                	jne    5aa <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5cc:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5cf:	c9                   	leave  
 5d0:	c3                   	ret    
 5d1:	90                   	nop
 5d2:	90                   	nop
 5d3:	90                   	nop

000005d4 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5d4:	b8 01 00 00 00       	mov    $0x1,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <exit>:
SYSCALL(exit)
 5dc:	b8 02 00 00 00       	mov    $0x2,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <wait>:
SYSCALL(wait)
 5e4:	b8 03 00 00 00       	mov    $0x3,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <pipe>:
SYSCALL(pipe)
 5ec:	b8 04 00 00 00       	mov    $0x4,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <read>:
SYSCALL(read)
 5f4:	b8 05 00 00 00       	mov    $0x5,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <write>:
SYSCALL(write)
 5fc:	b8 10 00 00 00       	mov    $0x10,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <close>:
SYSCALL(close)
 604:	b8 15 00 00 00       	mov    $0x15,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <kill>:
SYSCALL(kill)
 60c:	b8 06 00 00 00       	mov    $0x6,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <exec>:
SYSCALL(exec)
 614:	b8 07 00 00 00       	mov    $0x7,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <open>:
SYSCALL(open)
 61c:	b8 0f 00 00 00       	mov    $0xf,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <mknod>:
SYSCALL(mknod)
 624:	b8 11 00 00 00       	mov    $0x11,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <unlink>:
SYSCALL(unlink)
 62c:	b8 12 00 00 00       	mov    $0x12,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <fstat>:
SYSCALL(fstat)
 634:	b8 08 00 00 00       	mov    $0x8,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <link>:
SYSCALL(link)
 63c:	b8 13 00 00 00       	mov    $0x13,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <mkdir>:
SYSCALL(mkdir)
 644:	b8 14 00 00 00       	mov    $0x14,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <chdir>:
SYSCALL(chdir)
 64c:	b8 09 00 00 00       	mov    $0x9,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <dup>:
SYSCALL(dup)
 654:	b8 0a 00 00 00       	mov    $0xa,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <getpid>:
SYSCALL(getpid)
 65c:	b8 0b 00 00 00       	mov    $0xb,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <sbrk>:
SYSCALL(sbrk)
 664:	b8 0c 00 00 00       	mov    $0xc,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <sleep>:
SYSCALL(sleep)
 66c:	b8 0d 00 00 00       	mov    $0xd,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <uptime>:
SYSCALL(uptime)
 674:	b8 0e 00 00 00       	mov    $0xe,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <clone>:
SYSCALL(clone)
 67c:	b8 16 00 00 00       	mov    $0x16,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <texit>:
SYSCALL(texit)
 684:	b8 17 00 00 00       	mov    $0x17,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <tsleep>:
SYSCALL(tsleep)
 68c:	b8 18 00 00 00       	mov    $0x18,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <twakeup>:
SYSCALL(twakeup)
 694:	b8 19 00 00 00       	mov    $0x19,%eax
 699:	cd 40                	int    $0x40
 69b:	c3                   	ret    

0000069c <test>:
SYSCALL(test)
 69c:	b8 1a 00 00 00       	mov    $0x1a,%eax
 6a1:	cd 40                	int    $0x40
 6a3:	c3                   	ret    

000006a4 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6a4:	55                   	push   %ebp
 6a5:	89 e5                	mov    %esp,%ebp
 6a7:	83 ec 28             	sub    $0x28,%esp
 6aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ad:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 6b0:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b7:	00 
 6b8:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bf:	8b 45 08             	mov    0x8(%ebp),%eax
 6c2:	89 04 24             	mov    %eax,(%esp)
 6c5:	e8 32 ff ff ff       	call   5fc <write>
}
 6ca:	c9                   	leave  
 6cb:	c3                   	ret    

000006cc <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6cc:	55                   	push   %ebp
 6cd:	89 e5                	mov    %esp,%ebp
 6cf:	53                   	push   %ebx
 6d0:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6d3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6da:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6de:	74 17                	je     6f7 <printint+0x2b>
 6e0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6e4:	79 11                	jns    6f7 <printint+0x2b>
    neg = 1;
 6e6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6ed:	8b 45 0c             	mov    0xc(%ebp),%eax
 6f0:	f7 d8                	neg    %eax
 6f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6f5:	eb 06                	jmp    6fd <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6f7:	8b 45 0c             	mov    0xc(%ebp),%eax
 6fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 6fd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 704:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 707:	8b 5d 10             	mov    0x10(%ebp),%ebx
 70a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70d:	ba 00 00 00 00       	mov    $0x0,%edx
 712:	f7 f3                	div    %ebx
 714:	89 d0                	mov    %edx,%eax
 716:	0f b6 80 68 10 00 00 	movzbl 0x1068(%eax),%eax
 71d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 721:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 725:	8b 45 10             	mov    0x10(%ebp),%eax
 728:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 72b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 72e:	ba 00 00 00 00       	mov    $0x0,%edx
 733:	f7 75 d4             	divl   -0x2c(%ebp)
 736:	89 45 f4             	mov    %eax,-0xc(%ebp)
 739:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 73d:	75 c5                	jne    704 <printint+0x38>
  if(neg)
 73f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 743:	74 28                	je     76d <printint+0xa1>
    buf[i++] = '-';
 745:	8b 45 ec             	mov    -0x14(%ebp),%eax
 748:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 74d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 751:	eb 1a                	jmp    76d <printint+0xa1>
    putc(fd, buf[i]);
 753:	8b 45 ec             	mov    -0x14(%ebp),%eax
 756:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 75b:	0f be c0             	movsbl %al,%eax
 75e:	89 44 24 04          	mov    %eax,0x4(%esp)
 762:	8b 45 08             	mov    0x8(%ebp),%eax
 765:	89 04 24             	mov    %eax,(%esp)
 768:	e8 37 ff ff ff       	call   6a4 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 76d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 771:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 775:	79 dc                	jns    753 <printint+0x87>
    putc(fd, buf[i]);
}
 777:	83 c4 44             	add    $0x44,%esp
 77a:	5b                   	pop    %ebx
 77b:	5d                   	pop    %ebp
 77c:	c3                   	ret    

0000077d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 77d:	55                   	push   %ebp
 77e:	89 e5                	mov    %esp,%ebp
 780:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 783:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 78a:	8d 45 0c             	lea    0xc(%ebp),%eax
 78d:	83 c0 04             	add    $0x4,%eax
 790:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 793:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 79a:	e9 7e 01 00 00       	jmp    91d <printf+0x1a0>
    c = fmt[i] & 0xff;
 79f:	8b 55 0c             	mov    0xc(%ebp),%edx
 7a2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7a5:	8d 04 02             	lea    (%edx,%eax,1),%eax
 7a8:	0f b6 00             	movzbl (%eax),%eax
 7ab:	0f be c0             	movsbl %al,%eax
 7ae:	25 ff 00 00 00       	and    $0xff,%eax
 7b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 7b6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7ba:	75 2c                	jne    7e8 <printf+0x6b>
      if(c == '%'){
 7bc:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 7c0:	75 0c                	jne    7ce <printf+0x51>
        state = '%';
 7c2:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 7c9:	e9 4b 01 00 00       	jmp    919 <printf+0x19c>
      } else {
        putc(fd, c);
 7ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d1:	0f be c0             	movsbl %al,%eax
 7d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d8:	8b 45 08             	mov    0x8(%ebp),%eax
 7db:	89 04 24             	mov    %eax,(%esp)
 7de:	e8 c1 fe ff ff       	call   6a4 <putc>
 7e3:	e9 31 01 00 00       	jmp    919 <printf+0x19c>
      }
    } else if(state == '%'){
 7e8:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 7ec:	0f 85 27 01 00 00    	jne    919 <printf+0x19c>
      if(c == 'd'){
 7f2:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 7f6:	75 2d                	jne    825 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 7f8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7fb:	8b 00                	mov    (%eax),%eax
 7fd:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 804:	00 
 805:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 80c:	00 
 80d:	89 44 24 04          	mov    %eax,0x4(%esp)
 811:	8b 45 08             	mov    0x8(%ebp),%eax
 814:	89 04 24             	mov    %eax,(%esp)
 817:	e8 b0 fe ff ff       	call   6cc <printint>
        ap++;
 81c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 820:	e9 ed 00 00 00       	jmp    912 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 825:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 829:	74 06                	je     831 <printf+0xb4>
 82b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 82f:	75 2d                	jne    85e <printf+0xe1>
        printint(fd, *ap, 16, 0);
 831:	8b 45 f4             	mov    -0xc(%ebp),%eax
 834:	8b 00                	mov    (%eax),%eax
 836:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 83d:	00 
 83e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 845:	00 
 846:	89 44 24 04          	mov    %eax,0x4(%esp)
 84a:	8b 45 08             	mov    0x8(%ebp),%eax
 84d:	89 04 24             	mov    %eax,(%esp)
 850:	e8 77 fe ff ff       	call   6cc <printint>
        ap++;
 855:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 859:	e9 b4 00 00 00       	jmp    912 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 85e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 862:	75 46                	jne    8aa <printf+0x12d>
        s = (char*)*ap;
 864:	8b 45 f4             	mov    -0xc(%ebp),%eax
 867:	8b 00                	mov    (%eax),%eax
 869:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 86c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 870:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 874:	75 27                	jne    89d <printf+0x120>
          s = "(null)";
 876:	c7 45 e4 1d 10 00 00 	movl   $0x101d,-0x1c(%ebp)
        while(*s != 0){
 87d:	eb 1f                	jmp    89e <printf+0x121>
          putc(fd, *s);
 87f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 882:	0f b6 00             	movzbl (%eax),%eax
 885:	0f be c0             	movsbl %al,%eax
 888:	89 44 24 04          	mov    %eax,0x4(%esp)
 88c:	8b 45 08             	mov    0x8(%ebp),%eax
 88f:	89 04 24             	mov    %eax,(%esp)
 892:	e8 0d fe ff ff       	call   6a4 <putc>
          s++;
 897:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 89b:	eb 01                	jmp    89e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 89d:	90                   	nop
 89e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8a1:	0f b6 00             	movzbl (%eax),%eax
 8a4:	84 c0                	test   %al,%al
 8a6:	75 d7                	jne    87f <printf+0x102>
 8a8:	eb 68                	jmp    912 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8aa:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 8ae:	75 1d                	jne    8cd <printf+0x150>
        putc(fd, *ap);
 8b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b3:	8b 00                	mov    (%eax),%eax
 8b5:	0f be c0             	movsbl %al,%eax
 8b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 8bc:	8b 45 08             	mov    0x8(%ebp),%eax
 8bf:	89 04 24             	mov    %eax,(%esp)
 8c2:	e8 dd fd ff ff       	call   6a4 <putc>
        ap++;
 8c7:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 8cb:	eb 45                	jmp    912 <printf+0x195>
      } else if(c == '%'){
 8cd:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 8d1:	75 17                	jne    8ea <printf+0x16d>
        putc(fd, c);
 8d3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8d6:	0f be c0             	movsbl %al,%eax
 8d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 8dd:	8b 45 08             	mov    0x8(%ebp),%eax
 8e0:	89 04 24             	mov    %eax,(%esp)
 8e3:	e8 bc fd ff ff       	call   6a4 <putc>
 8e8:	eb 28                	jmp    912 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8ea:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8f1:	00 
 8f2:	8b 45 08             	mov    0x8(%ebp),%eax
 8f5:	89 04 24             	mov    %eax,(%esp)
 8f8:	e8 a7 fd ff ff       	call   6a4 <putc>
        putc(fd, c);
 8fd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 900:	0f be c0             	movsbl %al,%eax
 903:	89 44 24 04          	mov    %eax,0x4(%esp)
 907:	8b 45 08             	mov    0x8(%ebp),%eax
 90a:	89 04 24             	mov    %eax,(%esp)
 90d:	e8 92 fd ff ff       	call   6a4 <putc>
      }
      state = 0;
 912:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 919:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 91d:	8b 55 0c             	mov    0xc(%ebp),%edx
 920:	8b 45 ec             	mov    -0x14(%ebp),%eax
 923:	8d 04 02             	lea    (%edx,%eax,1),%eax
 926:	0f b6 00             	movzbl (%eax),%eax
 929:	84 c0                	test   %al,%al
 92b:	0f 85 6e fe ff ff    	jne    79f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 931:	c9                   	leave  
 932:	c3                   	ret    
 933:	90                   	nop

00000934 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 934:	55                   	push   %ebp
 935:	89 e5                	mov    %esp,%ebp
 937:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 93a:	8b 45 08             	mov    0x8(%ebp),%eax
 93d:	83 e8 08             	sub    $0x8,%eax
 940:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 943:	a1 90 10 00 00       	mov    0x1090,%eax
 948:	89 45 fc             	mov    %eax,-0x4(%ebp)
 94b:	eb 24                	jmp    971 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 94d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 950:	8b 00                	mov    (%eax),%eax
 952:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 955:	77 12                	ja     969 <free+0x35>
 957:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 95d:	77 24                	ja     983 <free+0x4f>
 95f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 962:	8b 00                	mov    (%eax),%eax
 964:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 967:	77 1a                	ja     983 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 969:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96c:	8b 00                	mov    (%eax),%eax
 96e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 971:	8b 45 f8             	mov    -0x8(%ebp),%eax
 974:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 977:	76 d4                	jbe    94d <free+0x19>
 979:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97c:	8b 00                	mov    (%eax),%eax
 97e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 981:	76 ca                	jbe    94d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 983:	8b 45 f8             	mov    -0x8(%ebp),%eax
 986:	8b 40 04             	mov    0x4(%eax),%eax
 989:	c1 e0 03             	shl    $0x3,%eax
 98c:	89 c2                	mov    %eax,%edx
 98e:	03 55 f8             	add    -0x8(%ebp),%edx
 991:	8b 45 fc             	mov    -0x4(%ebp),%eax
 994:	8b 00                	mov    (%eax),%eax
 996:	39 c2                	cmp    %eax,%edx
 998:	75 24                	jne    9be <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 99a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99d:	8b 50 04             	mov    0x4(%eax),%edx
 9a0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a3:	8b 00                	mov    (%eax),%eax
 9a5:	8b 40 04             	mov    0x4(%eax),%eax
 9a8:	01 c2                	add    %eax,%edx
 9aa:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ad:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 9b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b3:	8b 00                	mov    (%eax),%eax
 9b5:	8b 10                	mov    (%eax),%edx
 9b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ba:	89 10                	mov    %edx,(%eax)
 9bc:	eb 0a                	jmp    9c8 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 9be:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c1:	8b 10                	mov    (%eax),%edx
 9c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9c6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9cb:	8b 40 04             	mov    0x4(%eax),%eax
 9ce:	c1 e0 03             	shl    $0x3,%eax
 9d1:	03 45 fc             	add    -0x4(%ebp),%eax
 9d4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9d7:	75 20                	jne    9f9 <free+0xc5>
    p->s.size += bp->s.size;
 9d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9dc:	8b 50 04             	mov    0x4(%eax),%edx
 9df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9e2:	8b 40 04             	mov    0x4(%eax),%eax
 9e5:	01 c2                	add    %eax,%edx
 9e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ea:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9f0:	8b 10                	mov    (%eax),%edx
 9f2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9f5:	89 10                	mov    %edx,(%eax)
 9f7:	eb 08                	jmp    a01 <free+0xcd>
  } else
    p->s.ptr = bp;
 9f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9fc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9ff:	89 10                	mov    %edx,(%eax)
  freep = p;
 a01:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a04:	a3 90 10 00 00       	mov    %eax,0x1090
}
 a09:	c9                   	leave  
 a0a:	c3                   	ret    

00000a0b <morecore>:

static Header*
morecore(uint nu)
{
 a0b:	55                   	push   %ebp
 a0c:	89 e5                	mov    %esp,%ebp
 a0e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 a11:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 a18:	77 07                	ja     a21 <morecore+0x16>
    nu = 4096;
 a1a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a21:	8b 45 08             	mov    0x8(%ebp),%eax
 a24:	c1 e0 03             	shl    $0x3,%eax
 a27:	89 04 24             	mov    %eax,(%esp)
 a2a:	e8 35 fc ff ff       	call   664 <sbrk>
 a2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 a32:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 a36:	75 07                	jne    a3f <morecore+0x34>
    return 0;
 a38:	b8 00 00 00 00       	mov    $0x0,%eax
 a3d:	eb 22                	jmp    a61 <morecore+0x56>
  hp = (Header*)p;
 a3f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a42:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 a45:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a48:	8b 55 08             	mov    0x8(%ebp),%edx
 a4b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a51:	83 c0 08             	add    $0x8,%eax
 a54:	89 04 24             	mov    %eax,(%esp)
 a57:	e8 d8 fe ff ff       	call   934 <free>
  return freep;
 a5c:	a1 90 10 00 00       	mov    0x1090,%eax
}
 a61:	c9                   	leave  
 a62:	c3                   	ret    

00000a63 <malloc>:

void*
malloc(uint nbytes)
{
 a63:	55                   	push   %ebp
 a64:	89 e5                	mov    %esp,%ebp
 a66:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a69:	8b 45 08             	mov    0x8(%ebp),%eax
 a6c:	83 c0 07             	add    $0x7,%eax
 a6f:	c1 e8 03             	shr    $0x3,%eax
 a72:	83 c0 01             	add    $0x1,%eax
 a75:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 a78:	a1 90 10 00 00       	mov    0x1090,%eax
 a7d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a80:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a84:	75 23                	jne    aa9 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a86:	c7 45 f0 88 10 00 00 	movl   $0x1088,-0x10(%ebp)
 a8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a90:	a3 90 10 00 00       	mov    %eax,0x1090
 a95:	a1 90 10 00 00       	mov    0x1090,%eax
 a9a:	a3 88 10 00 00       	mov    %eax,0x1088
    base.s.size = 0;
 a9f:	c7 05 8c 10 00 00 00 	movl   $0x0,0x108c
 aa6:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aa9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aac:	8b 00                	mov    (%eax),%eax
 aae:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 ab1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ab4:	8b 40 04             	mov    0x4(%eax),%eax
 ab7:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 aba:	72 4d                	jb     b09 <malloc+0xa6>
      if(p->s.size == nunits)
 abc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 abf:	8b 40 04             	mov    0x4(%eax),%eax
 ac2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 ac5:	75 0c                	jne    ad3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 ac7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aca:	8b 10                	mov    (%eax),%edx
 acc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 acf:	89 10                	mov    %edx,(%eax)
 ad1:	eb 26                	jmp    af9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 ad3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ad6:	8b 40 04             	mov    0x4(%eax),%eax
 ad9:	89 c2                	mov    %eax,%edx
 adb:	2b 55 f4             	sub    -0xc(%ebp),%edx
 ade:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ae1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ae4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ae7:	8b 40 04             	mov    0x4(%eax),%eax
 aea:	c1 e0 03             	shl    $0x3,%eax
 aed:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 af0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 af3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 af6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 af9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 afc:	a3 90 10 00 00       	mov    %eax,0x1090
      return (void*)(p + 1);
 b01:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b04:	83 c0 08             	add    $0x8,%eax
 b07:	eb 38                	jmp    b41 <malloc+0xde>
    }
    if(p == freep)
 b09:	a1 90 10 00 00       	mov    0x1090,%eax
 b0e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 b11:	75 1b                	jne    b2e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b16:	89 04 24             	mov    %eax,(%esp)
 b19:	e8 ed fe ff ff       	call   a0b <morecore>
 b1e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 b21:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b25:	75 07                	jne    b2e <malloc+0xcb>
        return 0;
 b27:	b8 00 00 00 00       	mov    $0x0,%eax
 b2c:	eb 13                	jmp    b41 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b2e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b31:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b34:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b37:	8b 00                	mov    (%eax),%eax
 b39:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b3c:	e9 70 ff ff ff       	jmp    ab1 <malloc+0x4e>
}
 b41:	c9                   	leave  
 b42:	c3                   	ret    
 b43:	90                   	nop

00000b44 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 b44:	55                   	push   %ebp
 b45:	89 e5                	mov    %esp,%ebp
 b47:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 b4a:	8b 55 08             	mov    0x8(%ebp),%edx
 b4d:	8b 45 0c             	mov    0xc(%ebp),%eax
 b50:	8b 4d 08             	mov    0x8(%ebp),%ecx
 b53:	f0 87 02             	lock xchg %eax,(%edx)
 b56:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 b59:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 b5c:	c9                   	leave  
 b5d:	c3                   	ret    

00000b5e <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 b5e:	55                   	push   %ebp
 b5f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 b61:	8b 45 08             	mov    0x8(%ebp),%eax
 b64:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 b6a:	5d                   	pop    %ebp
 b6b:	c3                   	ret    

00000b6c <lock_acquire>:
void lock_acquire(lock_t *lock){
 b6c:	55                   	push   %ebp
 b6d:	89 e5                	mov    %esp,%ebp
 b6f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 b72:	8b 45 08             	mov    0x8(%ebp),%eax
 b75:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 b7c:	00 
 b7d:	89 04 24             	mov    %eax,(%esp)
 b80:	e8 bf ff ff ff       	call   b44 <xchg>
 b85:	85 c0                	test   %eax,%eax
 b87:	75 e9                	jne    b72 <lock_acquire+0x6>
}
 b89:	c9                   	leave  
 b8a:	c3                   	ret    

00000b8b <lock_release>:
void lock_release(lock_t *lock){
 b8b:	55                   	push   %ebp
 b8c:	89 e5                	mov    %esp,%ebp
 b8e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 b91:	8b 45 08             	mov    0x8(%ebp),%eax
 b94:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 b9b:	00 
 b9c:	89 04 24             	mov    %eax,(%esp)
 b9f:	e8 a0 ff ff ff       	call   b44 <xchg>
}
 ba4:	c9                   	leave  
 ba5:	c3                   	ret    

00000ba6 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 ba6:	55                   	push   %ebp
 ba7:	89 e5                	mov    %esp,%ebp
 ba9:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 bac:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 bb3:	e8 ab fe ff ff       	call   a63 <malloc>
 bb8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 bbb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bbe:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 bc1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bc4:	25 ff 0f 00 00       	and    $0xfff,%eax
 bc9:	85 c0                	test   %eax,%eax
 bcb:	74 15                	je     be2 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 bcd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bd0:	89 c2                	mov    %eax,%edx
 bd2:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 bd8:	b8 00 10 00 00       	mov    $0x1000,%eax
 bdd:	29 d0                	sub    %edx,%eax
 bdf:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 be2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 be6:	75 1b                	jne    c03 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 be8:	c7 44 24 04 24 10 00 	movl   $0x1024,0x4(%esp)
 bef:	00 
 bf0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bf7:	e8 81 fb ff ff       	call   77d <printf>
        return 0;
 bfc:	b8 00 00 00 00       	mov    $0x0,%eax
 c01:	eb 6f                	jmp    c72 <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 c03:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 c06:	8b 55 08             	mov    0x8(%ebp),%edx
 c09:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c0c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 c10:	89 54 24 08          	mov    %edx,0x8(%esp)
 c14:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 c1b:	00 
 c1c:	89 04 24             	mov    %eax,(%esp)
 c1f:	e8 58 fa ff ff       	call   67c <clone>
 c24:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 c27:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c2b:	79 1b                	jns    c48 <thread_create+0xa2>
        printf(1,"clone fails\n");
 c2d:	c7 44 24 04 32 10 00 	movl   $0x1032,0x4(%esp)
 c34:	00 
 c35:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c3c:	e8 3c fb ff ff       	call   77d <printf>
        return 0;
 c41:	b8 00 00 00 00       	mov    $0x0,%eax
 c46:	eb 2a                	jmp    c72 <thread_create+0xcc>
    }
    if(tid > 0){
 c48:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c4c:	7e 05                	jle    c53 <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 c4e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c51:	eb 1f                	jmp    c72 <thread_create+0xcc>
    }
    if(tid == 0){
 c53:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c57:	75 14                	jne    c6d <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 c59:	c7 44 24 04 3f 10 00 	movl   $0x103f,0x4(%esp)
 c60:	00 
 c61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c68:	e8 10 fb ff ff       	call   77d <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 c6d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 c72:	c9                   	leave  
 c73:	c3                   	ret    

00000c74 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 c74:	55                   	push   %ebp
 c75:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 c77:	8b 45 08             	mov    0x8(%ebp),%eax
 c7a:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 c80:	8b 45 08             	mov    0x8(%ebp),%eax
 c83:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 c8a:	8b 45 08             	mov    0x8(%ebp),%eax
 c8d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 c94:	5d                   	pop    %ebp
 c95:	c3                   	ret    

00000c96 <add_q>:

void add_q(struct queue *q, int v){
 c96:	55                   	push   %ebp
 c97:	89 e5                	mov    %esp,%ebp
 c99:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 c9c:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 ca3:	e8 bb fd ff ff       	call   a63 <malloc>
 ca8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 cab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cae:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 cb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cb8:	8b 55 0c             	mov    0xc(%ebp),%edx
 cbb:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 cbd:	8b 45 08             	mov    0x8(%ebp),%eax
 cc0:	8b 40 04             	mov    0x4(%eax),%eax
 cc3:	85 c0                	test   %eax,%eax
 cc5:	75 0b                	jne    cd2 <add_q+0x3c>
        q->head = n;
 cc7:	8b 45 08             	mov    0x8(%ebp),%eax
 cca:	8b 55 f4             	mov    -0xc(%ebp),%edx
 ccd:	89 50 04             	mov    %edx,0x4(%eax)
 cd0:	eb 0c                	jmp    cde <add_q+0x48>
    }else{
        q->tail->next = n;
 cd2:	8b 45 08             	mov    0x8(%ebp),%eax
 cd5:	8b 40 08             	mov    0x8(%eax),%eax
 cd8:	8b 55 f4             	mov    -0xc(%ebp),%edx
 cdb:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 cde:	8b 45 08             	mov    0x8(%ebp),%eax
 ce1:	8b 55 f4             	mov    -0xc(%ebp),%edx
 ce4:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 ce7:	8b 45 08             	mov    0x8(%ebp),%eax
 cea:	8b 00                	mov    (%eax),%eax
 cec:	8d 50 01             	lea    0x1(%eax),%edx
 cef:	8b 45 08             	mov    0x8(%ebp),%eax
 cf2:	89 10                	mov    %edx,(%eax)
}
 cf4:	c9                   	leave  
 cf5:	c3                   	ret    

00000cf6 <empty_q>:

int empty_q(struct queue *q){
 cf6:	55                   	push   %ebp
 cf7:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 cf9:	8b 45 08             	mov    0x8(%ebp),%eax
 cfc:	8b 00                	mov    (%eax),%eax
 cfe:	85 c0                	test   %eax,%eax
 d00:	75 07                	jne    d09 <empty_q+0x13>
        return 1;
 d02:	b8 01 00 00 00       	mov    $0x1,%eax
 d07:	eb 05                	jmp    d0e <empty_q+0x18>
    else
        return 0;
 d09:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 d0e:	5d                   	pop    %ebp
 d0f:	c3                   	ret    

00000d10 <pop_q>:
int pop_q(struct queue *q){
 d10:	55                   	push   %ebp
 d11:	89 e5                	mov    %esp,%ebp
 d13:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 d16:	8b 45 08             	mov    0x8(%ebp),%eax
 d19:	89 04 24             	mov    %eax,(%esp)
 d1c:	e8 d5 ff ff ff       	call   cf6 <empty_q>
 d21:	85 c0                	test   %eax,%eax
 d23:	75 5d                	jne    d82 <pop_q+0x72>
       val = q->head->value; 
 d25:	8b 45 08             	mov    0x8(%ebp),%eax
 d28:	8b 40 04             	mov    0x4(%eax),%eax
 d2b:	8b 00                	mov    (%eax),%eax
 d2d:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 d30:	8b 45 08             	mov    0x8(%ebp),%eax
 d33:	8b 40 04             	mov    0x4(%eax),%eax
 d36:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 d39:	8b 45 08             	mov    0x8(%ebp),%eax
 d3c:	8b 40 04             	mov    0x4(%eax),%eax
 d3f:	8b 50 04             	mov    0x4(%eax),%edx
 d42:	8b 45 08             	mov    0x8(%ebp),%eax
 d45:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 d48:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d4b:	89 04 24             	mov    %eax,(%esp)
 d4e:	e8 e1 fb ff ff       	call   934 <free>
       q->size--;
 d53:	8b 45 08             	mov    0x8(%ebp),%eax
 d56:	8b 00                	mov    (%eax),%eax
 d58:	8d 50 ff             	lea    -0x1(%eax),%edx
 d5b:	8b 45 08             	mov    0x8(%ebp),%eax
 d5e:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 d60:	8b 45 08             	mov    0x8(%ebp),%eax
 d63:	8b 00                	mov    (%eax),%eax
 d65:	85 c0                	test   %eax,%eax
 d67:	75 14                	jne    d7d <pop_q+0x6d>
            q->head = 0;
 d69:	8b 45 08             	mov    0x8(%ebp),%eax
 d6c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 d73:	8b 45 08             	mov    0x8(%ebp),%eax
 d76:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 d7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d80:	eb 05                	jmp    d87 <pop_q+0x77>
    }
    return -1;
 d82:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 d87:	c9                   	leave  
 d88:	c3                   	ret    
 d89:	90                   	nop
 d8a:	90                   	nop
 d8b:	90                   	nop

00000d8c <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 d8c:	55                   	push   %ebp
 d8d:	89 e5                	mov    %esp,%ebp
 d8f:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 d92:	8b 45 08             	mov    0x8(%ebp),%eax
 d95:	8b 55 0c             	mov    0xc(%ebp),%edx
 d98:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 d9b:	8b 45 08             	mov    0x8(%ebp),%eax
 d9e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 da5:	8b 45 08             	mov    0x8(%ebp),%eax
 da8:	89 04 24             	mov    %eax,(%esp)
 dab:	e8 ae fd ff ff       	call   b5e <lock_init>
}
 db0:	c9                   	leave  
 db1:	c3                   	ret    

00000db2 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 db2:	55                   	push   %ebp
 db3:	89 e5                	mov    %esp,%ebp
 db5:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 db8:	8b 45 08             	mov    0x8(%ebp),%eax
 dbb:	89 04 24             	mov    %eax,(%esp)
 dbe:	e8 a9 fd ff ff       	call   b6c <lock_acquire>
	if(s->count  == 0){
 dc3:	8b 45 08             	mov    0x8(%ebp),%eax
 dc6:	8b 40 04             	mov    0x4(%eax),%eax
 dc9:	85 c0                	test   %eax,%eax
 dcb:	75 43                	jne    e10 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 dcd:	c7 44 24 04 50 10 00 	movl   $0x1050,0x4(%esp)
 dd4:	00 
 dd5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ddc:	e8 9c f9 ff ff       	call   77d <printf>
		//add proc to waiters list
		int tid = getpid();
 de1:	e8 76 f8 ff ff       	call   65c <getpid>
 de6:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 de9:	8b 45 08             	mov    0x8(%ebp),%eax
 dec:	8d 50 0c             	lea    0xc(%eax),%edx
 def:	8b 45 f4             	mov    -0xc(%ebp),%eax
 df2:	89 44 24 04          	mov    %eax,0x4(%esp)
 df6:	89 14 24             	mov    %edx,(%esp)
 df9:	e8 98 fe ff ff       	call   c96 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 dfe:	8b 45 08             	mov    0x8(%ebp),%eax
 e01:	89 04 24             	mov    %eax,(%esp)
 e04:	e8 82 fd ff ff       	call   b8b <lock_release>
		tsleep(); 
 e09:	e8 7e f8 ff ff       	call   68c <tsleep>
 e0e:	eb 2e                	jmp    e3e <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 e10:	c7 44 24 04 57 10 00 	movl   $0x1057,0x4(%esp)
 e17:	00 
 e18:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 e1f:	e8 59 f9 ff ff       	call   77d <printf>
		s->count--;	
 e24:	8b 45 08             	mov    0x8(%ebp),%eax
 e27:	8b 40 04             	mov    0x4(%eax),%eax
 e2a:	8d 50 ff             	lea    -0x1(%eax),%edx
 e2d:	8b 45 08             	mov    0x8(%ebp),%eax
 e30:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 e33:	8b 45 08             	mov    0x8(%ebp),%eax
 e36:	89 04 24             	mov    %eax,(%esp)
 e39:	e8 4d fd ff ff       	call   b8b <lock_release>
	}
}
 e3e:	c9                   	leave  
 e3f:	c3                   	ret    

00000e40 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 e40:	55                   	push   %ebp
 e41:	89 e5                	mov    %esp,%ebp
 e43:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 e46:	c7 44 24 04 5e 10 00 	movl   $0x105e,0x4(%esp)
 e4d:	00 
 e4e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 e55:	e8 23 f9 ff ff       	call   77d <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 e5a:	8b 45 08             	mov    0x8(%ebp),%eax
 e5d:	89 04 24             	mov    %eax,(%esp)
 e60:	e8 07 fd ff ff       	call   b6c <lock_acquire>
	if(s->count < s->size){
 e65:	8b 45 08             	mov    0x8(%ebp),%eax
 e68:	8b 50 04             	mov    0x4(%eax),%edx
 e6b:	8b 45 08             	mov    0x8(%ebp),%eax
 e6e:	8b 40 08             	mov    0x8(%eax),%eax
 e71:	39 c2                	cmp    %eax,%edx
 e73:	7d 0f                	jge    e84 <sem_signal+0x44>
		s->count++;	
 e75:	8b 45 08             	mov    0x8(%ebp),%eax
 e78:	8b 40 04             	mov    0x4(%eax),%eax
 e7b:	8d 50 01             	lea    0x1(%eax),%edx
 e7e:	8b 45 08             	mov    0x8(%ebp),%eax
 e81:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 e84:	8b 45 08             	mov    0x8(%ebp),%eax
 e87:	83 c0 0c             	add    $0xc,%eax
 e8a:	89 04 24             	mov    %eax,(%esp)
 e8d:	e8 7e fe ff ff       	call   d10 <pop_q>
 e92:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 e95:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 e99:	74 2e                	je     ec9 <sem_signal+0x89>
		printf(1, "Sem A\n");
 e9b:	c7 44 24 04 57 10 00 	movl   $0x1057,0x4(%esp)
 ea2:	00 
 ea3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 eaa:	e8 ce f8 ff ff       	call   77d <printf>
		twakeup(tid);
 eaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 eb2:	89 04 24             	mov    %eax,(%esp)
 eb5:	e8 da f7 ff ff       	call   694 <twakeup>
		s->count--;
 eba:	8b 45 08             	mov    0x8(%ebp),%eax
 ebd:	8b 40 04             	mov    0x4(%eax),%eax
 ec0:	8d 50 ff             	lea    -0x1(%eax),%edx
 ec3:	8b 45 08             	mov    0x8(%ebp),%eax
 ec6:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 ec9:	8b 45 08             	mov    0x8(%ebp),%eax
 ecc:	89 04 24             	mov    %eax,(%esp)
 ecf:	e8 b7 fc ff ff       	call   b8b <lock_release>

 ed4:	c9                   	leave  
 ed5:	c3                   	ret    
