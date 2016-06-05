
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
  11:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
  18:	e8 71 0d 00 00       	call   d8e <sem_init>
	sem_init(&mutex1, 1);  //Initialize semaphore with 5
  1d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  24:	00 
  25:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
  2c:	e8 5d 0d 00 00       	call   d8e <sem_init>
	sem_init(&mutex2, 1);  //Initialize semaphore with 5
  31:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  38:	00 
  39:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
  40:	e8 49 0d 00 00       	call   d8e <sem_init>
	sem_init(&climb, 1);  //Initialize semaphore with 5 slots
  45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 80 14 00 00 	movl   $0x1480,(%esp)
  54:	e8 35 0d 00 00       	call   d8e <sem_init>
	
	int i;
	sem_signal(&wait_tree);
  59:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
  60:	e8 dd 0d 00 00       	call   e42 <sem_signal>
	sem_signal(&wait_tree);
  65:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
  6c:	e8 d1 0d 00 00       	call   e42 <sem_signal>
	sem_signal(&wait_tree);
  71:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
  78:	e8 c5 0d 00 00       	call   e42 <sem_signal>
	sem_signal(&wait_tree);
  7d:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
  84:	e8 b9 0d 00 00       	call   e42 <sem_signal>

	sem_signal(&mutex1);
  89:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
  90:	e8 ad 0d 00 00       	call   e42 <sem_signal>
	sem_signal(&mutex2);
  95:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
  9c:	e8 a1 0d 00 00       	call   e42 <sem_signal>
	sem_signal(&climb);
  a1:	c7 04 24 80 14 00 00 	movl   $0x1480,(%esp)
  a8:	e8 95 0d 00 00       	call   e42 <sem_signal>

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
 191:	eb 19                	jmp    1ac <main+0x1ac>
 193:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 19a:	00 
 19b:	c7 04 24 d6 01 00 00 	movl   $0x1d6,(%esp)
 1a2:	e8 05 0a 00 00       	call   bac <thread_create>
 1a7:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1ac:	83 7c 24 1c 04       	cmpl   $0x4,0x1c(%esp)
 1b1:	7e e0                	jle    193 <main+0x193>
    while(wait() > 0);
 1b3:	90                   	nop
 1b4:	e8 24 04 00 00       	call   5dd <wait>
 1b9:	85 c0                	test   %eax,%eax
 1bb:	7f f7                	jg     1b4 <main+0x1b4>
	printf(1,"All monkeys are full\n");
 1bd:	c7 44 24 04 e9 0f 00 	movl   $0xfe9,0x4(%esp)
 1c4:	00 
 1c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1cc:	e8 ac 05 00 00       	call   77d <printf>
	exit();
 1d1:	e8 ff 03 00 00       	call   5d5 <exit>

000001d6 <monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
 1d6:	55                   	push   %ebp
 1d7:	89 e5                	mov    %esp,%ebp
 1d9:	83 ec 28             	sub    $0x28,%esp
  int pid =  getpid();
 1dc:	e8 74 04 00 00       	call   655 <getpid>
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
 213:	a1 04 15 00 00       	mov    0x1504,%eax
 218:	ba 03 00 00 00       	mov    $0x3,%edx
 21d:	29 c2                	sub    %eax,%edx
 21f:	89 d0                	mov    %edx,%eax
 221:	89 44 24 08          	mov    %eax,0x8(%esp)
 225:	c7 44 24 04 07 10 00 	movl   $0x1007,0x4(%esp)
 22c:	00 
 22d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 234:	e8 44 05 00 00       	call   77d <printf>
  sem_aquire(&wait_tree);
 239:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
 240:	e8 6f 0b 00 00       	call   db4 <sem_aquire>
  printf(1, "%d",pid);
 245:	8b 45 f4             	mov    -0xc(%ebp),%eax
 248:	89 44 24 08          	mov    %eax,0x8(%esp)
 24c:	c7 44 24 04 ff 0f 00 	movl   $0xfff,0x4(%esp)
 253:	00 
 254:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 25b:	e8 1d 05 00 00       	call   77d <printf>
  printf(1, " - 2");
 260:	c7 44 24 04 0e 10 00 	movl   $0x100e,0x4(%esp)
 267:	00 
 268:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 26f:	e8 09 05 00 00       	call   77d <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 274:	a1 04 15 00 00       	mov    0x1504,%eax
 279:	ba 03 00 00 00       	mov    $0x3,%edx
 27e:	29 c2                	sub    %eax,%edx
 280:	89 d0                	mov    %edx,%eax
 282:	89 44 24 08          	mov    %eax,0x8(%esp)
 286:	c7 44 24 04 07 10 00 	movl   $0x1007,0x4(%esp)
 28d:	00 
 28e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 295:	e8 e3 04 00 00       	call   77d <printf>
  sleep(3); 
 29a:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 2a1:	e8 bf 03 00 00       	call   665 <sleep>
  sem_aquire(&mutex1);
 2a6:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
 2ad:	e8 02 0b 00 00       	call   db4 <sem_aquire>
  printf(1, "%d",pid);
 2b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2b5:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b9:	c7 44 24 04 ff 0f 00 	movl   $0xfff,0x4(%esp)
 2c0:	00 
 2c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c8:	e8 b0 04 00 00       	call   77d <printf>
  printf(1, " - 3");
 2cd:	c7 44 24 04 13 10 00 	movl   $0x1013,0x4(%esp)
 2d4:	00 
 2d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2dc:	e8 9c 04 00 00       	call   77d <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 2e1:	a1 04 15 00 00       	mov    0x1504,%eax
 2e6:	ba 03 00 00 00       	mov    $0x3,%edx
 2eb:	29 c2                	sub    %eax,%edx
 2ed:	89 d0                	mov    %edx,%eax
 2ef:	89 44 24 08          	mov    %eax,0x8(%esp)
 2f3:	c7 44 24 04 07 10 00 	movl   $0x1007,0x4(%esp)
 2fa:	00 
 2fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 302:	e8 76 04 00 00       	call   77d <printf>
  sem_signal(&wait_tree);
 307:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
 30e:	e8 2f 0b 00 00       	call   e42 <sem_signal>
  printf(1, "%d",pid);
 313:	8b 45 f4             	mov    -0xc(%ebp),%eax
 316:	89 44 24 08          	mov    %eax,0x8(%esp)
 31a:	c7 44 24 04 ff 0f 00 	movl   $0xfff,0x4(%esp)
 321:	00 
 322:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 329:	e8 4f 04 00 00       	call   77d <printf>
  printf(1, " - 4"); 
 32e:	c7 44 24 04 18 10 00 	movl   $0x1018,0x4(%esp)
 335:	00 
 336:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 33d:	e8 3b 04 00 00       	call   77d <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);  
 342:	a1 04 15 00 00       	mov    0x1504,%eax
 347:	ba 03 00 00 00       	mov    $0x3,%edx
 34c:	29 c2                	sub    %eax,%edx
 34e:	89 d0                	mov    %edx,%eax
 350:	89 44 24 08          	mov    %eax,0x8(%esp)
 354:	c7 44 24 04 07 10 00 	movl   $0x1007,0x4(%esp)
 35b:	00 
 35c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 363:	e8 15 04 00 00       	call   77d <printf>
  texit();
 368:	e8 10 03 00 00       	call   67d <texit>

0000036d <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 36d:	55                   	push   %ebp
 36e:	89 e5                	mov    %esp,%ebp
 370:	57                   	push   %edi
 371:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 372:	8b 4d 08             	mov    0x8(%ebp),%ecx
 375:	8b 55 10             	mov    0x10(%ebp),%edx
 378:	8b 45 0c             	mov    0xc(%ebp),%eax
 37b:	89 cb                	mov    %ecx,%ebx
 37d:	89 df                	mov    %ebx,%edi
 37f:	89 d1                	mov    %edx,%ecx
 381:	fc                   	cld    
 382:	f3 aa                	rep stos %al,%es:(%edi)
 384:	89 ca                	mov    %ecx,%edx
 386:	89 fb                	mov    %edi,%ebx
 388:	89 5d 08             	mov    %ebx,0x8(%ebp)
 38b:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 38e:	5b                   	pop    %ebx
 38f:	5f                   	pop    %edi
 390:	5d                   	pop    %ebp
 391:	c3                   	ret    

00000392 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 392:	55                   	push   %ebp
 393:	89 e5                	mov    %esp,%ebp
 395:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 398:	8b 45 08             	mov    0x8(%ebp),%eax
 39b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 39e:	90                   	nop
 39f:	8b 45 08             	mov    0x8(%ebp),%eax
 3a2:	8d 50 01             	lea    0x1(%eax),%edx
 3a5:	89 55 08             	mov    %edx,0x8(%ebp)
 3a8:	8b 55 0c             	mov    0xc(%ebp),%edx
 3ab:	8d 4a 01             	lea    0x1(%edx),%ecx
 3ae:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 3b1:	0f b6 12             	movzbl (%edx),%edx
 3b4:	88 10                	mov    %dl,(%eax)
 3b6:	0f b6 00             	movzbl (%eax),%eax
 3b9:	84 c0                	test   %al,%al
 3bb:	75 e2                	jne    39f <strcpy+0xd>
    ;
  return os;
 3bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3c0:	c9                   	leave  
 3c1:	c3                   	ret    

000003c2 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3c2:	55                   	push   %ebp
 3c3:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3c5:	eb 08                	jmp    3cf <strcmp+0xd>
    p++, q++;
 3c7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3cb:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3cf:	8b 45 08             	mov    0x8(%ebp),%eax
 3d2:	0f b6 00             	movzbl (%eax),%eax
 3d5:	84 c0                	test   %al,%al
 3d7:	74 10                	je     3e9 <strcmp+0x27>
 3d9:	8b 45 08             	mov    0x8(%ebp),%eax
 3dc:	0f b6 10             	movzbl (%eax),%edx
 3df:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e2:	0f b6 00             	movzbl (%eax),%eax
 3e5:	38 c2                	cmp    %al,%dl
 3e7:	74 de                	je     3c7 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3e9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ec:	0f b6 00             	movzbl (%eax),%eax
 3ef:	0f b6 d0             	movzbl %al,%edx
 3f2:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f5:	0f b6 00             	movzbl (%eax),%eax
 3f8:	0f b6 c0             	movzbl %al,%eax
 3fb:	29 c2                	sub    %eax,%edx
 3fd:	89 d0                	mov    %edx,%eax
}
 3ff:	5d                   	pop    %ebp
 400:	c3                   	ret    

00000401 <strlen>:

uint
strlen(char *s)
{
 401:	55                   	push   %ebp
 402:	89 e5                	mov    %esp,%ebp
 404:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 407:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 40e:	eb 04                	jmp    414 <strlen+0x13>
 410:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 414:	8b 55 fc             	mov    -0x4(%ebp),%edx
 417:	8b 45 08             	mov    0x8(%ebp),%eax
 41a:	01 d0                	add    %edx,%eax
 41c:	0f b6 00             	movzbl (%eax),%eax
 41f:	84 c0                	test   %al,%al
 421:	75 ed                	jne    410 <strlen+0xf>
    ;
  return n;
 423:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 426:	c9                   	leave  
 427:	c3                   	ret    

00000428 <memset>:

void*
memset(void *dst, int c, uint n)
{
 428:	55                   	push   %ebp
 429:	89 e5                	mov    %esp,%ebp
 42b:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 42e:	8b 45 10             	mov    0x10(%ebp),%eax
 431:	89 44 24 08          	mov    %eax,0x8(%esp)
 435:	8b 45 0c             	mov    0xc(%ebp),%eax
 438:	89 44 24 04          	mov    %eax,0x4(%esp)
 43c:	8b 45 08             	mov    0x8(%ebp),%eax
 43f:	89 04 24             	mov    %eax,(%esp)
 442:	e8 26 ff ff ff       	call   36d <stosb>
  return dst;
 447:	8b 45 08             	mov    0x8(%ebp),%eax
}
 44a:	c9                   	leave  
 44b:	c3                   	ret    

0000044c <strchr>:

char*
strchr(const char *s, char c)
{
 44c:	55                   	push   %ebp
 44d:	89 e5                	mov    %esp,%ebp
 44f:	83 ec 04             	sub    $0x4,%esp
 452:	8b 45 0c             	mov    0xc(%ebp),%eax
 455:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 458:	eb 14                	jmp    46e <strchr+0x22>
    if(*s == c)
 45a:	8b 45 08             	mov    0x8(%ebp),%eax
 45d:	0f b6 00             	movzbl (%eax),%eax
 460:	3a 45 fc             	cmp    -0x4(%ebp),%al
 463:	75 05                	jne    46a <strchr+0x1e>
      return (char*)s;
 465:	8b 45 08             	mov    0x8(%ebp),%eax
 468:	eb 13                	jmp    47d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 46a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 46e:	8b 45 08             	mov    0x8(%ebp),%eax
 471:	0f b6 00             	movzbl (%eax),%eax
 474:	84 c0                	test   %al,%al
 476:	75 e2                	jne    45a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 478:	b8 00 00 00 00       	mov    $0x0,%eax
}
 47d:	c9                   	leave  
 47e:	c3                   	ret    

0000047f <gets>:

char*
gets(char *buf, int max)
{
 47f:	55                   	push   %ebp
 480:	89 e5                	mov    %esp,%ebp
 482:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 485:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 48c:	eb 4c                	jmp    4da <gets+0x5b>
    cc = read(0, &c, 1);
 48e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 495:	00 
 496:	8d 45 ef             	lea    -0x11(%ebp),%eax
 499:	89 44 24 04          	mov    %eax,0x4(%esp)
 49d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4a4:	e8 44 01 00 00       	call   5ed <read>
 4a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 4ac:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4b0:	7f 02                	jg     4b4 <gets+0x35>
      break;
 4b2:	eb 31                	jmp    4e5 <gets+0x66>
    buf[i++] = c;
 4b4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b7:	8d 50 01             	lea    0x1(%eax),%edx
 4ba:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4bd:	89 c2                	mov    %eax,%edx
 4bf:	8b 45 08             	mov    0x8(%ebp),%eax
 4c2:	01 c2                	add    %eax,%edx
 4c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c8:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4ca:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4ce:	3c 0a                	cmp    $0xa,%al
 4d0:	74 13                	je     4e5 <gets+0x66>
 4d2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4d6:	3c 0d                	cmp    $0xd,%al
 4d8:	74 0b                	je     4e5 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4dd:	83 c0 01             	add    $0x1,%eax
 4e0:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4e3:	7c a9                	jl     48e <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4e5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4e8:	8b 45 08             	mov    0x8(%ebp),%eax
 4eb:	01 d0                	add    %edx,%eax
 4ed:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4f0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4f3:	c9                   	leave  
 4f4:	c3                   	ret    

000004f5 <stat>:

int
stat(char *n, struct stat *st)
{
 4f5:	55                   	push   %ebp
 4f6:	89 e5                	mov    %esp,%ebp
 4f8:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 502:	00 
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	89 04 24             	mov    %eax,(%esp)
 509:	e8 07 01 00 00       	call   615 <open>
 50e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 511:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 515:	79 07                	jns    51e <stat+0x29>
    return -1;
 517:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 51c:	eb 23                	jmp    541 <stat+0x4c>
  r = fstat(fd, st);
 51e:	8b 45 0c             	mov    0xc(%ebp),%eax
 521:	89 44 24 04          	mov    %eax,0x4(%esp)
 525:	8b 45 f4             	mov    -0xc(%ebp),%eax
 528:	89 04 24             	mov    %eax,(%esp)
 52b:	e8 fd 00 00 00       	call   62d <fstat>
 530:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 533:	8b 45 f4             	mov    -0xc(%ebp),%eax
 536:	89 04 24             	mov    %eax,(%esp)
 539:	e8 bf 00 00 00       	call   5fd <close>
  return r;
 53e:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 541:	c9                   	leave  
 542:	c3                   	ret    

00000543 <atoi>:

int
atoi(const char *s)
{
 543:	55                   	push   %ebp
 544:	89 e5                	mov    %esp,%ebp
 546:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 549:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 550:	eb 25                	jmp    577 <atoi+0x34>
    n = n*10 + *s++ - '0';
 552:	8b 55 fc             	mov    -0x4(%ebp),%edx
 555:	89 d0                	mov    %edx,%eax
 557:	c1 e0 02             	shl    $0x2,%eax
 55a:	01 d0                	add    %edx,%eax
 55c:	01 c0                	add    %eax,%eax
 55e:	89 c1                	mov    %eax,%ecx
 560:	8b 45 08             	mov    0x8(%ebp),%eax
 563:	8d 50 01             	lea    0x1(%eax),%edx
 566:	89 55 08             	mov    %edx,0x8(%ebp)
 569:	0f b6 00             	movzbl (%eax),%eax
 56c:	0f be c0             	movsbl %al,%eax
 56f:	01 c8                	add    %ecx,%eax
 571:	83 e8 30             	sub    $0x30,%eax
 574:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 577:	8b 45 08             	mov    0x8(%ebp),%eax
 57a:	0f b6 00             	movzbl (%eax),%eax
 57d:	3c 2f                	cmp    $0x2f,%al
 57f:	7e 0a                	jle    58b <atoi+0x48>
 581:	8b 45 08             	mov    0x8(%ebp),%eax
 584:	0f b6 00             	movzbl (%eax),%eax
 587:	3c 39                	cmp    $0x39,%al
 589:	7e c7                	jle    552 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 58b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 58e:	c9                   	leave  
 58f:	c3                   	ret    

00000590 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 590:	55                   	push   %ebp
 591:	89 e5                	mov    %esp,%ebp
 593:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 596:	8b 45 08             	mov    0x8(%ebp),%eax
 599:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 59c:	8b 45 0c             	mov    0xc(%ebp),%eax
 59f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 5a2:	eb 17                	jmp    5bb <memmove+0x2b>
    *dst++ = *src++;
 5a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5a7:	8d 50 01             	lea    0x1(%eax),%edx
 5aa:	89 55 fc             	mov    %edx,-0x4(%ebp)
 5ad:	8b 55 f8             	mov    -0x8(%ebp),%edx
 5b0:	8d 4a 01             	lea    0x1(%edx),%ecx
 5b3:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5b6:	0f b6 12             	movzbl (%edx),%edx
 5b9:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5bb:	8b 45 10             	mov    0x10(%ebp),%eax
 5be:	8d 50 ff             	lea    -0x1(%eax),%edx
 5c1:	89 55 10             	mov    %edx,0x10(%ebp)
 5c4:	85 c0                	test   %eax,%eax
 5c6:	7f dc                	jg     5a4 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5c8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5cb:	c9                   	leave  
 5cc:	c3                   	ret    

000005cd <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5cd:	b8 01 00 00 00       	mov    $0x1,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <exit>:
SYSCALL(exit)
 5d5:	b8 02 00 00 00       	mov    $0x2,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <wait>:
SYSCALL(wait)
 5dd:	b8 03 00 00 00       	mov    $0x3,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <pipe>:
SYSCALL(pipe)
 5e5:	b8 04 00 00 00       	mov    $0x4,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <read>:
SYSCALL(read)
 5ed:	b8 05 00 00 00       	mov    $0x5,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <write>:
SYSCALL(write)
 5f5:	b8 10 00 00 00       	mov    $0x10,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <close>:
SYSCALL(close)
 5fd:	b8 15 00 00 00       	mov    $0x15,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <kill>:
SYSCALL(kill)
 605:	b8 06 00 00 00       	mov    $0x6,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <exec>:
SYSCALL(exec)
 60d:	b8 07 00 00 00       	mov    $0x7,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <open>:
SYSCALL(open)
 615:	b8 0f 00 00 00       	mov    $0xf,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <mknod>:
SYSCALL(mknod)
 61d:	b8 11 00 00 00       	mov    $0x11,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <unlink>:
SYSCALL(unlink)
 625:	b8 12 00 00 00       	mov    $0x12,%eax
 62a:	cd 40                	int    $0x40
 62c:	c3                   	ret    

0000062d <fstat>:
SYSCALL(fstat)
 62d:	b8 08 00 00 00       	mov    $0x8,%eax
 632:	cd 40                	int    $0x40
 634:	c3                   	ret    

00000635 <link>:
SYSCALL(link)
 635:	b8 13 00 00 00       	mov    $0x13,%eax
 63a:	cd 40                	int    $0x40
 63c:	c3                   	ret    

0000063d <mkdir>:
SYSCALL(mkdir)
 63d:	b8 14 00 00 00       	mov    $0x14,%eax
 642:	cd 40                	int    $0x40
 644:	c3                   	ret    

00000645 <chdir>:
SYSCALL(chdir)
 645:	b8 09 00 00 00       	mov    $0x9,%eax
 64a:	cd 40                	int    $0x40
 64c:	c3                   	ret    

0000064d <dup>:
SYSCALL(dup)
 64d:	b8 0a 00 00 00       	mov    $0xa,%eax
 652:	cd 40                	int    $0x40
 654:	c3                   	ret    

00000655 <getpid>:
SYSCALL(getpid)
 655:	b8 0b 00 00 00       	mov    $0xb,%eax
 65a:	cd 40                	int    $0x40
 65c:	c3                   	ret    

0000065d <sbrk>:
SYSCALL(sbrk)
 65d:	b8 0c 00 00 00       	mov    $0xc,%eax
 662:	cd 40                	int    $0x40
 664:	c3                   	ret    

00000665 <sleep>:
SYSCALL(sleep)
 665:	b8 0d 00 00 00       	mov    $0xd,%eax
 66a:	cd 40                	int    $0x40
 66c:	c3                   	ret    

0000066d <uptime>:
SYSCALL(uptime)
 66d:	b8 0e 00 00 00       	mov    $0xe,%eax
 672:	cd 40                	int    $0x40
 674:	c3                   	ret    

00000675 <clone>:
SYSCALL(clone)
 675:	b8 16 00 00 00       	mov    $0x16,%eax
 67a:	cd 40                	int    $0x40
 67c:	c3                   	ret    

0000067d <texit>:
SYSCALL(texit)
 67d:	b8 17 00 00 00       	mov    $0x17,%eax
 682:	cd 40                	int    $0x40
 684:	c3                   	ret    

00000685 <tsleep>:
SYSCALL(tsleep)
 685:	b8 18 00 00 00       	mov    $0x18,%eax
 68a:	cd 40                	int    $0x40
 68c:	c3                   	ret    

0000068d <twakeup>:
SYSCALL(twakeup)
 68d:	b8 19 00 00 00       	mov    $0x19,%eax
 692:	cd 40                	int    $0x40
 694:	c3                   	ret    

00000695 <test>:
SYSCALL(test)
 695:	b8 1a 00 00 00       	mov    $0x1a,%eax
 69a:	cd 40                	int    $0x40
 69c:	c3                   	ret    

0000069d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 69d:	55                   	push   %ebp
 69e:	89 e5                	mov    %esp,%ebp
 6a0:	83 ec 18             	sub    $0x18,%esp
 6a3:	8b 45 0c             	mov    0xc(%ebp),%eax
 6a6:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 6a9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6b0:	00 
 6b1:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b8:	8b 45 08             	mov    0x8(%ebp),%eax
 6bb:	89 04 24             	mov    %eax,(%esp)
 6be:	e8 32 ff ff ff       	call   5f5 <write>
}
 6c3:	c9                   	leave  
 6c4:	c3                   	ret    

000006c5 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6c5:	55                   	push   %ebp
 6c6:	89 e5                	mov    %esp,%ebp
 6c8:	56                   	push   %esi
 6c9:	53                   	push   %ebx
 6ca:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6cd:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6d4:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6d8:	74 17                	je     6f1 <printint+0x2c>
 6da:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6de:	79 11                	jns    6f1 <printint+0x2c>
    neg = 1;
 6e0:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ea:	f7 d8                	neg    %eax
 6ec:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6ef:	eb 06                	jmp    6f7 <printint+0x32>
  } else {
    x = xx;
 6f1:	8b 45 0c             	mov    0xc(%ebp),%eax
 6f4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6fe:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 701:	8d 41 01             	lea    0x1(%ecx),%eax
 704:	89 45 f4             	mov    %eax,-0xc(%ebp)
 707:	8b 5d 10             	mov    0x10(%ebp),%ebx
 70a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 70d:	ba 00 00 00 00       	mov    $0x0,%edx
 712:	f7 f3                	div    %ebx
 714:	89 d0                	mov    %edx,%eax
 716:	0f b6 80 48 14 00 00 	movzbl 0x1448(%eax),%eax
 71d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 721:	8b 75 10             	mov    0x10(%ebp),%esi
 724:	8b 45 ec             	mov    -0x14(%ebp),%eax
 727:	ba 00 00 00 00       	mov    $0x0,%edx
 72c:	f7 f6                	div    %esi
 72e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 731:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 735:	75 c7                	jne    6fe <printint+0x39>
  if(neg)
 737:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 73b:	74 10                	je     74d <printint+0x88>
    buf[i++] = '-';
 73d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 740:	8d 50 01             	lea    0x1(%eax),%edx
 743:	89 55 f4             	mov    %edx,-0xc(%ebp)
 746:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 74b:	eb 1f                	jmp    76c <printint+0xa7>
 74d:	eb 1d                	jmp    76c <printint+0xa7>
    putc(fd, buf[i]);
 74f:	8d 55 dc             	lea    -0x24(%ebp),%edx
 752:	8b 45 f4             	mov    -0xc(%ebp),%eax
 755:	01 d0                	add    %edx,%eax
 757:	0f b6 00             	movzbl (%eax),%eax
 75a:	0f be c0             	movsbl %al,%eax
 75d:	89 44 24 04          	mov    %eax,0x4(%esp)
 761:	8b 45 08             	mov    0x8(%ebp),%eax
 764:	89 04 24             	mov    %eax,(%esp)
 767:	e8 31 ff ff ff       	call   69d <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 76c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 770:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 774:	79 d9                	jns    74f <printint+0x8a>
    putc(fd, buf[i]);
}
 776:	83 c4 30             	add    $0x30,%esp
 779:	5b                   	pop    %ebx
 77a:	5e                   	pop    %esi
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
 783:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 78a:	8d 45 0c             	lea    0xc(%ebp),%eax
 78d:	83 c0 04             	add    $0x4,%eax
 790:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 793:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 79a:	e9 7c 01 00 00       	jmp    91b <printf+0x19e>
    c = fmt[i] & 0xff;
 79f:	8b 55 0c             	mov    0xc(%ebp),%edx
 7a2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7a5:	01 d0                	add    %edx,%eax
 7a7:	0f b6 00             	movzbl (%eax),%eax
 7aa:	0f be c0             	movsbl %al,%eax
 7ad:	25 ff 00 00 00       	and    $0xff,%eax
 7b2:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 7b5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7b9:	75 2c                	jne    7e7 <printf+0x6a>
      if(c == '%'){
 7bb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7bf:	75 0c                	jne    7cd <printf+0x50>
        state = '%';
 7c1:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 7c8:	e9 4a 01 00 00       	jmp    917 <printf+0x19a>
      } else {
        putc(fd, c);
 7cd:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7d0:	0f be c0             	movsbl %al,%eax
 7d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d7:	8b 45 08             	mov    0x8(%ebp),%eax
 7da:	89 04 24             	mov    %eax,(%esp)
 7dd:	e8 bb fe ff ff       	call   69d <putc>
 7e2:	e9 30 01 00 00       	jmp    917 <printf+0x19a>
      }
    } else if(state == '%'){
 7e7:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7eb:	0f 85 26 01 00 00    	jne    917 <printf+0x19a>
      if(c == 'd'){
 7f1:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7f5:	75 2d                	jne    824 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7fa:	8b 00                	mov    (%eax),%eax
 7fc:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 803:	00 
 804:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 80b:	00 
 80c:	89 44 24 04          	mov    %eax,0x4(%esp)
 810:	8b 45 08             	mov    0x8(%ebp),%eax
 813:	89 04 24             	mov    %eax,(%esp)
 816:	e8 aa fe ff ff       	call   6c5 <printint>
        ap++;
 81b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 81f:	e9 ec 00 00 00       	jmp    910 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 824:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 828:	74 06                	je     830 <printf+0xb3>
 82a:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 82e:	75 2d                	jne    85d <printf+0xe0>
        printint(fd, *ap, 16, 0);
 830:	8b 45 e8             	mov    -0x18(%ebp),%eax
 833:	8b 00                	mov    (%eax),%eax
 835:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 83c:	00 
 83d:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 844:	00 
 845:	89 44 24 04          	mov    %eax,0x4(%esp)
 849:	8b 45 08             	mov    0x8(%ebp),%eax
 84c:	89 04 24             	mov    %eax,(%esp)
 84f:	e8 71 fe ff ff       	call   6c5 <printint>
        ap++;
 854:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 858:	e9 b3 00 00 00       	jmp    910 <printf+0x193>
      } else if(c == 's'){
 85d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 861:	75 45                	jne    8a8 <printf+0x12b>
        s = (char*)*ap;
 863:	8b 45 e8             	mov    -0x18(%ebp),%eax
 866:	8b 00                	mov    (%eax),%eax
 868:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 86b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 86f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 873:	75 09                	jne    87e <printf+0x101>
          s = "(null)";
 875:	c7 45 f4 1d 10 00 00 	movl   $0x101d,-0xc(%ebp)
        while(*s != 0){
 87c:	eb 1e                	jmp    89c <printf+0x11f>
 87e:	eb 1c                	jmp    89c <printf+0x11f>
          putc(fd, *s);
 880:	8b 45 f4             	mov    -0xc(%ebp),%eax
 883:	0f b6 00             	movzbl (%eax),%eax
 886:	0f be c0             	movsbl %al,%eax
 889:	89 44 24 04          	mov    %eax,0x4(%esp)
 88d:	8b 45 08             	mov    0x8(%ebp),%eax
 890:	89 04 24             	mov    %eax,(%esp)
 893:	e8 05 fe ff ff       	call   69d <putc>
          s++;
 898:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 89c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89f:	0f b6 00             	movzbl (%eax),%eax
 8a2:	84 c0                	test   %al,%al
 8a4:	75 da                	jne    880 <printf+0x103>
 8a6:	eb 68                	jmp    910 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8a8:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 8ac:	75 1d                	jne    8cb <printf+0x14e>
        putc(fd, *ap);
 8ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8b1:	8b 00                	mov    (%eax),%eax
 8b3:	0f be c0             	movsbl %al,%eax
 8b6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ba:	8b 45 08             	mov    0x8(%ebp),%eax
 8bd:	89 04 24             	mov    %eax,(%esp)
 8c0:	e8 d8 fd ff ff       	call   69d <putc>
        ap++;
 8c5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8c9:	eb 45                	jmp    910 <printf+0x193>
      } else if(c == '%'){
 8cb:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8cf:	75 17                	jne    8e8 <printf+0x16b>
        putc(fd, c);
 8d1:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8d4:	0f be c0             	movsbl %al,%eax
 8d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8db:	8b 45 08             	mov    0x8(%ebp),%eax
 8de:	89 04 24             	mov    %eax,(%esp)
 8e1:	e8 b7 fd ff ff       	call   69d <putc>
 8e6:	eb 28                	jmp    910 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8e8:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8ef:	00 
 8f0:	8b 45 08             	mov    0x8(%ebp),%eax
 8f3:	89 04 24             	mov    %eax,(%esp)
 8f6:	e8 a2 fd ff ff       	call   69d <putc>
        putc(fd, c);
 8fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8fe:	0f be c0             	movsbl %al,%eax
 901:	89 44 24 04          	mov    %eax,0x4(%esp)
 905:	8b 45 08             	mov    0x8(%ebp),%eax
 908:	89 04 24             	mov    %eax,(%esp)
 90b:	e8 8d fd ff ff       	call   69d <putc>
      }
      state = 0;
 910:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 917:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 91b:	8b 55 0c             	mov    0xc(%ebp),%edx
 91e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 921:	01 d0                	add    %edx,%eax
 923:	0f b6 00             	movzbl (%eax),%eax
 926:	84 c0                	test   %al,%al
 928:	0f 85 71 fe ff ff    	jne    79f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 92e:	c9                   	leave  
 92f:	c3                   	ret    

00000930 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 930:	55                   	push   %ebp
 931:	89 e5                	mov    %esp,%ebp
 933:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 936:	8b 45 08             	mov    0x8(%ebp),%eax
 939:	83 e8 08             	sub    $0x8,%eax
 93c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 93f:	a1 70 14 00 00       	mov    0x1470,%eax
 944:	89 45 fc             	mov    %eax,-0x4(%ebp)
 947:	eb 24                	jmp    96d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 949:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94c:	8b 00                	mov    (%eax),%eax
 94e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 951:	77 12                	ja     965 <free+0x35>
 953:	8b 45 f8             	mov    -0x8(%ebp),%eax
 956:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 959:	77 24                	ja     97f <free+0x4f>
 95b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95e:	8b 00                	mov    (%eax),%eax
 960:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 963:	77 1a                	ja     97f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 965:	8b 45 fc             	mov    -0x4(%ebp),%eax
 968:	8b 00                	mov    (%eax),%eax
 96a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 96d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 970:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 973:	76 d4                	jbe    949 <free+0x19>
 975:	8b 45 fc             	mov    -0x4(%ebp),%eax
 978:	8b 00                	mov    (%eax),%eax
 97a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 97d:	76 ca                	jbe    949 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 97f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 982:	8b 40 04             	mov    0x4(%eax),%eax
 985:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 98c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 98f:	01 c2                	add    %eax,%edx
 991:	8b 45 fc             	mov    -0x4(%ebp),%eax
 994:	8b 00                	mov    (%eax),%eax
 996:	39 c2                	cmp    %eax,%edx
 998:	75 24                	jne    9be <free+0x8e>
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
 9bc:	eb 0a                	jmp    9c8 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 9be:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c1:	8b 10                	mov    (%eax),%edx
 9c3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9c6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9cb:	8b 40 04             	mov    0x4(%eax),%eax
 9ce:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d8:	01 d0                	add    %edx,%eax
 9da:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9dd:	75 20                	jne    9ff <free+0xcf>
    p->s.size += bp->s.size;
 9df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e2:	8b 50 04             	mov    0x4(%eax),%edx
 9e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9e8:	8b 40 04             	mov    0x4(%eax),%eax
 9eb:	01 c2                	add    %eax,%edx
 9ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9f0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9f3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9f6:	8b 10                	mov    (%eax),%edx
 9f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9fb:	89 10                	mov    %edx,(%eax)
 9fd:	eb 08                	jmp    a07 <free+0xd7>
  } else
    p->s.ptr = bp;
 9ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a02:	8b 55 f8             	mov    -0x8(%ebp),%edx
 a05:	89 10                	mov    %edx,(%eax)
  freep = p;
 a07:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a0a:	a3 70 14 00 00       	mov    %eax,0x1470
}
 a0f:	c9                   	leave  
 a10:	c3                   	ret    

00000a11 <morecore>:

static Header*
morecore(uint nu)
{
 a11:	55                   	push   %ebp
 a12:	89 e5                	mov    %esp,%ebp
 a14:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 a17:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 a1e:	77 07                	ja     a27 <morecore+0x16>
    nu = 4096;
 a20:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a27:	8b 45 08             	mov    0x8(%ebp),%eax
 a2a:	c1 e0 03             	shl    $0x3,%eax
 a2d:	89 04 24             	mov    %eax,(%esp)
 a30:	e8 28 fc ff ff       	call   65d <sbrk>
 a35:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a38:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a3c:	75 07                	jne    a45 <morecore+0x34>
    return 0;
 a3e:	b8 00 00 00 00       	mov    $0x0,%eax
 a43:	eb 22                	jmp    a67 <morecore+0x56>
  hp = (Header*)p;
 a45:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a48:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a4e:	8b 55 08             	mov    0x8(%ebp),%edx
 a51:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a54:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a57:	83 c0 08             	add    $0x8,%eax
 a5a:	89 04 24             	mov    %eax,(%esp)
 a5d:	e8 ce fe ff ff       	call   930 <free>
  return freep;
 a62:	a1 70 14 00 00       	mov    0x1470,%eax
}
 a67:	c9                   	leave  
 a68:	c3                   	ret    

00000a69 <malloc>:

void*
malloc(uint nbytes)
{
 a69:	55                   	push   %ebp
 a6a:	89 e5                	mov    %esp,%ebp
 a6c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a6f:	8b 45 08             	mov    0x8(%ebp),%eax
 a72:	83 c0 07             	add    $0x7,%eax
 a75:	c1 e8 03             	shr    $0x3,%eax
 a78:	83 c0 01             	add    $0x1,%eax
 a7b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a7e:	a1 70 14 00 00       	mov    0x1470,%eax
 a83:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a86:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a8a:	75 23                	jne    aaf <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a8c:	c7 45 f0 68 14 00 00 	movl   $0x1468,-0x10(%ebp)
 a93:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a96:	a3 70 14 00 00       	mov    %eax,0x1470
 a9b:	a1 70 14 00 00       	mov    0x1470,%eax
 aa0:	a3 68 14 00 00       	mov    %eax,0x1468
    base.s.size = 0;
 aa5:	c7 05 6c 14 00 00 00 	movl   $0x0,0x146c
 aac:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aaf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ab2:	8b 00                	mov    (%eax),%eax
 ab4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 ab7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aba:	8b 40 04             	mov    0x4(%eax),%eax
 abd:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 ac0:	72 4d                	jb     b0f <malloc+0xa6>
      if(p->s.size == nunits)
 ac2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac5:	8b 40 04             	mov    0x4(%eax),%eax
 ac8:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 acb:	75 0c                	jne    ad9 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 acd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad0:	8b 10                	mov    (%eax),%edx
 ad2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ad5:	89 10                	mov    %edx,(%eax)
 ad7:	eb 26                	jmp    aff <malloc+0x96>
      else {
        p->s.size -= nunits;
 ad9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 adc:	8b 40 04             	mov    0x4(%eax),%eax
 adf:	2b 45 ec             	sub    -0x14(%ebp),%eax
 ae2:	89 c2                	mov    %eax,%edx
 ae4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae7:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aed:	8b 40 04             	mov    0x4(%eax),%eax
 af0:	c1 e0 03             	shl    $0x3,%eax
 af3:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 af6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af9:	8b 55 ec             	mov    -0x14(%ebp),%edx
 afc:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 aff:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b02:	a3 70 14 00 00       	mov    %eax,0x1470
      return (void*)(p + 1);
 b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b0a:	83 c0 08             	add    $0x8,%eax
 b0d:	eb 38                	jmp    b47 <malloc+0xde>
    }
    if(p == freep)
 b0f:	a1 70 14 00 00       	mov    0x1470,%eax
 b14:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 b17:	75 1b                	jne    b34 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 b19:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b1c:	89 04 24             	mov    %eax,(%esp)
 b1f:	e8 ed fe ff ff       	call   a11 <morecore>
 b24:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b27:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b2b:	75 07                	jne    b34 <malloc+0xcb>
        return 0;
 b2d:	b8 00 00 00 00       	mov    $0x0,%eax
 b32:	eb 13                	jmp    b47 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b34:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b37:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b3a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b3d:	8b 00                	mov    (%eax),%eax
 b3f:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b42:	e9 70 ff ff ff       	jmp    ab7 <malloc+0x4e>
}
 b47:	c9                   	leave  
 b48:	c3                   	ret    

00000b49 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 b49:	55                   	push   %ebp
 b4a:	89 e5                	mov    %esp,%ebp
 b4c:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 b4f:	8b 55 08             	mov    0x8(%ebp),%edx
 b52:	8b 45 0c             	mov    0xc(%ebp),%eax
 b55:	8b 4d 08             	mov    0x8(%ebp),%ecx
 b58:	f0 87 02             	lock xchg %eax,(%edx)
 b5b:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 b5e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 b61:	c9                   	leave  
 b62:	c3                   	ret    

00000b63 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 b63:	55                   	push   %ebp
 b64:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 b66:	8b 45 08             	mov    0x8(%ebp),%eax
 b69:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 b6f:	5d                   	pop    %ebp
 b70:	c3                   	ret    

00000b71 <lock_acquire>:
void lock_acquire(lock_t *lock){
 b71:	55                   	push   %ebp
 b72:	89 e5                	mov    %esp,%ebp
 b74:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 b77:	90                   	nop
 b78:	8b 45 08             	mov    0x8(%ebp),%eax
 b7b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 b82:	00 
 b83:	89 04 24             	mov    %eax,(%esp)
 b86:	e8 be ff ff ff       	call   b49 <xchg>
 b8b:	85 c0                	test   %eax,%eax
 b8d:	75 e9                	jne    b78 <lock_acquire+0x7>
}
 b8f:	c9                   	leave  
 b90:	c3                   	ret    

00000b91 <lock_release>:
void lock_release(lock_t *lock){
 b91:	55                   	push   %ebp
 b92:	89 e5                	mov    %esp,%ebp
 b94:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 b97:	8b 45 08             	mov    0x8(%ebp),%eax
 b9a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 ba1:	00 
 ba2:	89 04 24             	mov    %eax,(%esp)
 ba5:	e8 9f ff ff ff       	call   b49 <xchg>
}
 baa:	c9                   	leave  
 bab:	c3                   	ret    

00000bac <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 bac:	55                   	push   %ebp
 bad:	89 e5                	mov    %esp,%ebp
 baf:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 bb2:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 bb9:	e8 ab fe ff ff       	call   a69 <malloc>
 bbe:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 bc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc4:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 bc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bca:	25 ff 0f 00 00       	and    $0xfff,%eax
 bcf:	85 c0                	test   %eax,%eax
 bd1:	74 14                	je     be7 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 bd3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd6:	25 ff 0f 00 00       	and    $0xfff,%eax
 bdb:	89 c2                	mov    %eax,%edx
 bdd:	b8 00 10 00 00       	mov    $0x1000,%eax
 be2:	29 d0                	sub    %edx,%eax
 be4:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 be7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 beb:	75 1b                	jne    c08 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 bed:	c7 44 24 04 24 10 00 	movl   $0x1024,0x4(%esp)
 bf4:	00 
 bf5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bfc:	e8 7c fb ff ff       	call   77d <printf>
        return 0;
 c01:	b8 00 00 00 00       	mov    $0x0,%eax
 c06:	eb 6f                	jmp    c77 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 c08:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 c0b:	8b 55 08             	mov    0x8(%ebp),%edx
 c0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c11:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 c15:	89 54 24 08          	mov    %edx,0x8(%esp)
 c19:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 c20:	00 
 c21:	89 04 24             	mov    %eax,(%esp)
 c24:	e8 4c fa ff ff       	call   675 <clone>
 c29:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 c2c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c30:	79 1b                	jns    c4d <thread_create+0xa1>
        printf(1,"clone fails\n");
 c32:	c7 44 24 04 32 10 00 	movl   $0x1032,0x4(%esp)
 c39:	00 
 c3a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c41:	e8 37 fb ff ff       	call   77d <printf>
        return 0;
 c46:	b8 00 00 00 00       	mov    $0x0,%eax
 c4b:	eb 2a                	jmp    c77 <thread_create+0xcb>
    }
    if(tid > 0){
 c4d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c51:	7e 05                	jle    c58 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 c53:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c56:	eb 1f                	jmp    c77 <thread_create+0xcb>
    }
    if(tid == 0){
 c58:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c5c:	75 14                	jne    c72 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 c5e:	c7 44 24 04 3f 10 00 	movl   $0x103f,0x4(%esp)
 c65:	00 
 c66:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c6d:	e8 0b fb ff ff       	call   77d <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 c72:	b8 00 00 00 00       	mov    $0x0,%eax
}
 c77:	c9                   	leave  
 c78:	c3                   	ret    

00000c79 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 c79:	55                   	push   %ebp
 c7a:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 c7c:	8b 45 08             	mov    0x8(%ebp),%eax
 c7f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 c85:	8b 45 08             	mov    0x8(%ebp),%eax
 c88:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 c8f:	8b 45 08             	mov    0x8(%ebp),%eax
 c92:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 c99:	5d                   	pop    %ebp
 c9a:	c3                   	ret    

00000c9b <add_q>:

void add_q(struct queue *q, int v){
 c9b:	55                   	push   %ebp
 c9c:	89 e5                	mov    %esp,%ebp
 c9e:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 ca1:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 ca8:	e8 bc fd ff ff       	call   a69 <malloc>
 cad:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 cb0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cb3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 cba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cbd:	8b 55 0c             	mov    0xc(%ebp),%edx
 cc0:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 cc2:	8b 45 08             	mov    0x8(%ebp),%eax
 cc5:	8b 40 04             	mov    0x4(%eax),%eax
 cc8:	85 c0                	test   %eax,%eax
 cca:	75 0b                	jne    cd7 <add_q+0x3c>
        q->head = n;
 ccc:	8b 45 08             	mov    0x8(%ebp),%eax
 ccf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 cd2:	89 50 04             	mov    %edx,0x4(%eax)
 cd5:	eb 0c                	jmp    ce3 <add_q+0x48>
    }else{
        q->tail->next = n;
 cd7:	8b 45 08             	mov    0x8(%ebp),%eax
 cda:	8b 40 08             	mov    0x8(%eax),%eax
 cdd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 ce0:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 ce3:	8b 45 08             	mov    0x8(%ebp),%eax
 ce6:	8b 55 f4             	mov    -0xc(%ebp),%edx
 ce9:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 cec:	8b 45 08             	mov    0x8(%ebp),%eax
 cef:	8b 00                	mov    (%eax),%eax
 cf1:	8d 50 01             	lea    0x1(%eax),%edx
 cf4:	8b 45 08             	mov    0x8(%ebp),%eax
 cf7:	89 10                	mov    %edx,(%eax)
}
 cf9:	c9                   	leave  
 cfa:	c3                   	ret    

00000cfb <empty_q>:

int empty_q(struct queue *q){
 cfb:	55                   	push   %ebp
 cfc:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 cfe:	8b 45 08             	mov    0x8(%ebp),%eax
 d01:	8b 00                	mov    (%eax),%eax
 d03:	85 c0                	test   %eax,%eax
 d05:	75 07                	jne    d0e <empty_q+0x13>
        return 1;
 d07:	b8 01 00 00 00       	mov    $0x1,%eax
 d0c:	eb 05                	jmp    d13 <empty_q+0x18>
    else
        return 0;
 d0e:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 d13:	5d                   	pop    %ebp
 d14:	c3                   	ret    

00000d15 <pop_q>:
int pop_q(struct queue *q){
 d15:	55                   	push   %ebp
 d16:	89 e5                	mov    %esp,%ebp
 d18:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 d1b:	8b 45 08             	mov    0x8(%ebp),%eax
 d1e:	89 04 24             	mov    %eax,(%esp)
 d21:	e8 d5 ff ff ff       	call   cfb <empty_q>
 d26:	85 c0                	test   %eax,%eax
 d28:	75 5d                	jne    d87 <pop_q+0x72>
       val = q->head->value; 
 d2a:	8b 45 08             	mov    0x8(%ebp),%eax
 d2d:	8b 40 04             	mov    0x4(%eax),%eax
 d30:	8b 00                	mov    (%eax),%eax
 d32:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 d35:	8b 45 08             	mov    0x8(%ebp),%eax
 d38:	8b 40 04             	mov    0x4(%eax),%eax
 d3b:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 d3e:	8b 45 08             	mov    0x8(%ebp),%eax
 d41:	8b 40 04             	mov    0x4(%eax),%eax
 d44:	8b 50 04             	mov    0x4(%eax),%edx
 d47:	8b 45 08             	mov    0x8(%ebp),%eax
 d4a:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 d4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d50:	89 04 24             	mov    %eax,(%esp)
 d53:	e8 d8 fb ff ff       	call   930 <free>
       q->size--;
 d58:	8b 45 08             	mov    0x8(%ebp),%eax
 d5b:	8b 00                	mov    (%eax),%eax
 d5d:	8d 50 ff             	lea    -0x1(%eax),%edx
 d60:	8b 45 08             	mov    0x8(%ebp),%eax
 d63:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 d65:	8b 45 08             	mov    0x8(%ebp),%eax
 d68:	8b 00                	mov    (%eax),%eax
 d6a:	85 c0                	test   %eax,%eax
 d6c:	75 14                	jne    d82 <pop_q+0x6d>
            q->head = 0;
 d6e:	8b 45 08             	mov    0x8(%ebp),%eax
 d71:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 d78:	8b 45 08             	mov    0x8(%ebp),%eax
 d7b:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 d82:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d85:	eb 05                	jmp    d8c <pop_q+0x77>
    }
    return -1;
 d87:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 d8c:	c9                   	leave  
 d8d:	c3                   	ret    

00000d8e <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 d8e:	55                   	push   %ebp
 d8f:	89 e5                	mov    %esp,%ebp
 d91:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 d94:	8b 45 08             	mov    0x8(%ebp),%eax
 d97:	8b 55 0c             	mov    0xc(%ebp),%edx
 d9a:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 d9d:	8b 45 08             	mov    0x8(%ebp),%eax
 da0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 da7:	8b 45 08             	mov    0x8(%ebp),%eax
 daa:	89 04 24             	mov    %eax,(%esp)
 dad:	e8 b1 fd ff ff       	call   b63 <lock_init>
}
 db2:	c9                   	leave  
 db3:	c3                   	ret    

00000db4 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 db4:	55                   	push   %ebp
 db5:	89 e5                	mov    %esp,%ebp
 db7:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 dba:	8b 45 08             	mov    0x8(%ebp),%eax
 dbd:	89 04 24             	mov    %eax,(%esp)
 dc0:	e8 ac fd ff ff       	call   b71 <lock_acquire>
	if(s->count  == 0){
 dc5:	8b 45 08             	mov    0x8(%ebp),%eax
 dc8:	8b 40 04             	mov    0x4(%eax),%eax
 dcb:	85 c0                	test   %eax,%eax
 dcd:	75 43                	jne    e12 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 dcf:	c7 44 24 04 50 10 00 	movl   $0x1050,0x4(%esp)
 dd6:	00 
 dd7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 dde:	e8 9a f9 ff ff       	call   77d <printf>
		//add proc to waiters list
		int tid = getpid();
 de3:	e8 6d f8 ff ff       	call   655 <getpid>
 de8:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 deb:	8b 45 08             	mov    0x8(%ebp),%eax
 dee:	8d 50 0c             	lea    0xc(%eax),%edx
 df1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 df4:	89 44 24 04          	mov    %eax,0x4(%esp)
 df8:	89 14 24             	mov    %edx,(%esp)
 dfb:	e8 9b fe ff ff       	call   c9b <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 e00:	8b 45 08             	mov    0x8(%ebp),%eax
 e03:	89 04 24             	mov    %eax,(%esp)
 e06:	e8 86 fd ff ff       	call   b91 <lock_release>
		tsleep(); 
 e0b:	e8 75 f8 ff ff       	call   685 <tsleep>
 e10:	eb 2e                	jmp    e40 <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 e12:	c7 44 24 04 57 10 00 	movl   $0x1057,0x4(%esp)
 e19:	00 
 e1a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 e21:	e8 57 f9 ff ff       	call   77d <printf>
		s->count--;	
 e26:	8b 45 08             	mov    0x8(%ebp),%eax
 e29:	8b 40 04             	mov    0x4(%eax),%eax
 e2c:	8d 50 ff             	lea    -0x1(%eax),%edx
 e2f:	8b 45 08             	mov    0x8(%ebp),%eax
 e32:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 e35:	8b 45 08             	mov    0x8(%ebp),%eax
 e38:	89 04 24             	mov    %eax,(%esp)
 e3b:	e8 51 fd ff ff       	call   b91 <lock_release>
	}
}
 e40:	c9                   	leave  
 e41:	c3                   	ret    

00000e42 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 e42:	55                   	push   %ebp
 e43:	89 e5                	mov    %esp,%ebp
 e45:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 e48:	c7 44 24 04 5e 10 00 	movl   $0x105e,0x4(%esp)
 e4f:	00 
 e50:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 e57:	e8 21 f9 ff ff       	call   77d <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 e5c:	8b 45 08             	mov    0x8(%ebp),%eax
 e5f:	89 04 24             	mov    %eax,(%esp)
 e62:	e8 0a fd ff ff       	call   b71 <lock_acquire>
	if(s->count < s->size){
 e67:	8b 45 08             	mov    0x8(%ebp),%eax
 e6a:	8b 50 04             	mov    0x4(%eax),%edx
 e6d:	8b 45 08             	mov    0x8(%ebp),%eax
 e70:	8b 40 08             	mov    0x8(%eax),%eax
 e73:	39 c2                	cmp    %eax,%edx
 e75:	7d 0f                	jge    e86 <sem_signal+0x44>
		s->count++;	
 e77:	8b 45 08             	mov    0x8(%ebp),%eax
 e7a:	8b 40 04             	mov    0x4(%eax),%eax
 e7d:	8d 50 01             	lea    0x1(%eax),%edx
 e80:	8b 45 08             	mov    0x8(%ebp),%eax
 e83:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 e86:	8b 45 08             	mov    0x8(%ebp),%eax
 e89:	83 c0 0c             	add    $0xc,%eax
 e8c:	89 04 24             	mov    %eax,(%esp)
 e8f:	e8 81 fe ff ff       	call   d15 <pop_q>
 e94:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 e97:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 e9b:	74 2e                	je     ecb <sem_signal+0x89>
		printf(1, "Sem A\n");
 e9d:	c7 44 24 04 57 10 00 	movl   $0x1057,0x4(%esp)
 ea4:	00 
 ea5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 eac:	e8 cc f8 ff ff       	call   77d <printf>
		twakeup(tid);
 eb1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 eb4:	89 04 24             	mov    %eax,(%esp)
 eb7:	e8 d1 f7 ff ff       	call   68d <twakeup>
		s->count--;
 ebc:	8b 45 08             	mov    0x8(%ebp),%eax
 ebf:	8b 40 04             	mov    0x4(%eax),%eax
 ec2:	8d 50 ff             	lea    -0x1(%eax),%edx
 ec5:	8b 45 08             	mov    0x8(%ebp),%eax
 ec8:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 ecb:	8b 45 08             	mov    0x8(%ebp),%eax
 ece:	89 04 24             	mov    %eax,(%esp)
 ed1:	e8 bb fc ff ff       	call   b91 <lock_release>

 ed6:	c9                   	leave  
 ed7:	c3                   	ret    
