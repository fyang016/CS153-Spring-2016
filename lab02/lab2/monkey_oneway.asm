
_monkey_oneway:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

void monkey();
void printMessage(int, int);

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
  18:	e8 9f 0d 00 00       	call   dbc <sem_init>
	sem_init(&mutex1, 1);  //Initialize semaphore with 5
  1d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  24:	00 
  25:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
  2c:	e8 8b 0d 00 00       	call   dbc <sem_init>
	sem_init(&mutex2, 1);  //Initialize semaphore with 5
  31:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  38:	00 
  39:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
  40:	e8 77 0d 00 00       	call   dbc <sem_init>
	sem_init(&climb, 1);  //Initialize semaphore with 5 slots
  45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 80 14 00 00 	movl   $0x1480,(%esp)
  54:	e8 63 0d 00 00       	call   dbc <sem_init>
	
	int i;
	sem_signal(&wait_tree);
  59:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
  60:	e8 e3 0d 00 00       	call   e48 <sem_signal>
	sem_signal(&wait_tree);
  65:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
  6c:	e8 d7 0d 00 00       	call   e48 <sem_signal>
	sem_signal(&wait_tree);
  71:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
  78:	e8 cb 0d 00 00       	call   e48 <sem_signal>

	sem_signal(&mutex1);
  7d:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
  84:	e8 bf 0d 00 00       	call   e48 <sem_signal>
	sem_signal(&mutex2);
  89:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
  90:	e8 b3 0d 00 00       	call   e48 <sem_signal>
	sem_signal(&climb);
  95:	c7 04 24 80 14 00 00 	movl   $0x1480,(%esp)
  9c:	e8 a7 0d 00 00       	call   e48 <sem_signal>

  	printf(1, "\n\nFirst # is the PID\n");
  a1:	c7 44 24 04 cc 0e 00 	movl   $0xecc,0x4(%esp)
  a8:	00 
  a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b0:	e8 f6 06 00 00       	call   7ab <printf>
  	printf(1, "\nSecond # is waiting state\n");
  b5:	c7 44 24 04 e2 0e 00 	movl   $0xee2,0x4(%esp)
  bc:	00 
  bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c4:	e8 e2 06 00 00       	call   7ab <printf>
  	printf(1, "1 - waiting to climb tree\n");
  c9:	c7 44 24 04 fe 0e 00 	movl   $0xefe,0x4(%esp)
  d0:	00 
  d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d8:	e8 ce 06 00 00       	call   7ab <printf>
  	printf(1, "2 - climbing tree\n");
  dd:	c7 44 24 04 19 0f 00 	movl   $0xf19,0x4(%esp)
  e4:	00 
  e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ec:	e8 ba 06 00 00       	call   7ab <printf>
  	printf(1, "3 - Found a banana climbing down\n");
  f1:	c7 44 24 04 2c 0f 00 	movl   $0xf2c,0x4(%esp)
  f8:	00 
  f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 100:	e8 a6 06 00 00       	call   7ab <printf>
  	printf(1, "4 - Eating banana\n\n");
 105:	c7 44 24 04 4e 0f 00 	movl   $0xf4e,0x4(%esp)
 10c:	00 
 10d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 114:	e8 92 06 00 00       	call   7ab <printf>
  	printf(1, "Third # is monkeys on tree\n");
 119:	c7 44 24 04 62 0f 00 	movl   $0xf62,0x4(%esp)
 120:	00 
 121:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 128:	e8 7e 06 00 00       	call   7ab <printf>
  	printf(1, "*abreviations\n");
 12d:	c7 44 24 04 7e 0f 00 	movl   $0xf7e,0x4(%esp)
 134:	00 
 135:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 13c:	e8 6a 06 00 00       	call   7ab <printf>
  	printf(1, "Sem A - Semaphore Aquired\n");
 141:	c7 44 24 04 8d 0f 00 	movl   $0xf8d,0x4(%esp)
 148:	00 
 149:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 150:	e8 56 06 00 00       	call   7ab <printf>
  	printf(1, "Sem R - Sempahore Released\n");
 155:	c7 44 24 04 a8 0f 00 	movl   $0xfa8,0x4(%esp)
 15c:	00 
 15d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 164:	e8 42 06 00 00       	call   7ab <printf>
  	printf(1, "Sem F - Sempahore Full\n\n");
 169:	c7 44 24 04 c4 0f 00 	movl   $0xfc4,0x4(%esp)
 170:	00 
 171:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 178:	e8 2e 06 00 00       	call   7ab <printf>
	for(i = 0; i < 5; i++) thread_create(monkey, 0);
 17d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
 184:	00 
 185:	eb 19                	jmp    1a0 <main+0x1a0>
 187:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 18e:	00 
 18f:	c7 04 24 ca 01 00 00 	movl   $0x1ca,(%esp)
 196:	e8 3f 0a 00 00       	call   bda <thread_create>
 19b:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1a0:	83 7c 24 1c 04       	cmpl   $0x4,0x1c(%esp)
 1a5:	7e e0                	jle    187 <main+0x187>
    while(wait() > 0);
 1a7:	90                   	nop
 1a8:	e8 5e 04 00 00       	call   60b <wait>
 1ad:	85 c0                	test   %eax,%eax
 1af:	7f f7                	jg     1a8 <main+0x1a8>
	printf(1,"All monkeys are full\n");
 1b1:	c7 44 24 04 dd 0f 00 	movl   $0xfdd,0x4(%esp)
 1b8:	00 
 1b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c0:	e8 e6 05 00 00       	call   7ab <printf>
	exit();
 1c5:	e8 39 04 00 00       	call   603 <exit>

000001ca <monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	83 ec 28             	sub    $0x28,%esp
  int pid =  getpid();
 1d0:	e8 ae 04 00 00       	call   683 <getpid>
 1d5:	89 45 f4             	mov    %eax,-0xc(%ebp)

  printMessage(pid, 1);
 1d8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 1df:	00 
 1e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e3:	89 04 24             	mov    %eax,(%esp)
 1e6:	e8 4c 01 00 00       	call   337 <printMessage>
  sem_aquire(&wait_tree);
 1eb:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
 1f2:	e8 eb 0b 00 00       	call   de2 <sem_aquire>

  printMessage(pid, 2);  
 1f7:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 1fe:	00 
 1ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 202:	89 04 24             	mov    %eax,(%esp)
 205:	e8 2d 01 00 00       	call   337 <printMessage>
  //climb_tree
  sem_aquire(&mutex1);
 20a:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
 211:	e8 cc 0b 00 00       	call   de2 <sem_aquire>
  movingup++;
 216:	a1 60 14 00 00       	mov    0x1460,%eax
 21b:	83 c0 01             	add    $0x1,%eax
 21e:	a3 60 14 00 00       	mov    %eax,0x1460
  if(movingup==1)	sem_aquire(&climb);
 223:	a1 60 14 00 00       	mov    0x1460,%eax
 228:	83 f8 01             	cmp    $0x1,%eax
 22b:	75 0c                	jne    239 <monkey+0x6f>
 22d:	c7 04 24 80 14 00 00 	movl   $0x1480,(%esp)
 234:	e8 a9 0b 00 00       	call   de2 <sem_aquire>
  sem_signal(&mutex1);
 239:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
 240:	e8 03 0c 00 00       	call   e48 <sem_signal>

  // Get coconut
  sleep(3); 
 245:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 24c:	e8 42 04 00 00       	call   693 <sleep>

  //got coconut
  sem_aquire(&mutex1);
 251:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
 258:	e8 85 0b 00 00       	call   de2 <sem_aquire>
  movingup--;
 25d:	a1 60 14 00 00       	mov    0x1460,%eax
 262:	83 e8 01             	sub    $0x1,%eax
 265:	a3 60 14 00 00       	mov    %eax,0x1460
  if(movingup==0)	sem_signal(&climb);
 26a:	a1 60 14 00 00       	mov    0x1460,%eax
 26f:	85 c0                	test   %eax,%eax
 271:	75 0c                	jne    27f <monkey+0xb5>
 273:	c7 04 24 80 14 00 00 	movl   $0x1480,(%esp)
 27a:	e8 c9 0b 00 00       	call   e48 <sem_signal>
  sem_signal(&mutex1);
 27f:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
 286:	e8 bd 0b 00 00       	call   e48 <sem_signal>

  // Climb Down
  sem_aquire(&mutex2);
 28b:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
 292:	e8 4b 0b 00 00       	call   de2 <sem_aquire>
  movingdown++;
 297:	a1 64 14 00 00       	mov    0x1464,%eax
 29c:	83 c0 01             	add    $0x1,%eax
 29f:	a3 64 14 00 00       	mov    %eax,0x1464
  if(movingdown == 1)	sem_aquire(&climb);
 2a4:	a1 64 14 00 00       	mov    0x1464,%eax
 2a9:	83 f8 01             	cmp    $0x1,%eax
 2ac:	75 0c                	jne    2ba <monkey+0xf0>
 2ae:	c7 04 24 80 14 00 00 	movl   $0x1480,(%esp)
 2b5:	e8 28 0b 00 00       	call   de2 <sem_aquire>
  sem_signal(&mutex2);
 2ba:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
 2c1:	e8 82 0b 00 00       	call   e48 <sem_signal>

  printMessage(pid, 3);
 2c6:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
 2cd:	00 
 2ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d1:	89 04 24             	mov    %eax,(%esp)
 2d4:	e8 5e 00 00 00       	call   337 <printMessage>
  // Climb Down
  sem_aquire(&mutex2);
 2d9:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
 2e0:	e8 fd 0a 00 00       	call   de2 <sem_aquire>
  movingdown--;
 2e5:	a1 64 14 00 00       	mov    0x1464,%eax
 2ea:	83 e8 01             	sub    $0x1,%eax
 2ed:	a3 64 14 00 00       	mov    %eax,0x1464
  if(movingdown == 0)	sem_signal(&climb);
 2f2:	a1 64 14 00 00       	mov    0x1464,%eax
 2f7:	85 c0                	test   %eax,%eax
 2f9:	75 0c                	jne    307 <monkey+0x13d>
 2fb:	c7 04 24 80 14 00 00 	movl   $0x1480,(%esp)
 302:	e8 41 0b 00 00       	call   e48 <sem_signal>
  sem_signal(&mutex2);
 307:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
 30e:	e8 35 0b 00 00       	call   e48 <sem_signal>

  sem_signal(&wait_tree);
 313:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
 31a:	e8 29 0b 00 00       	call   e48 <sem_signal>
  printMessage(pid, 4);
 31f:	c7 44 24 04 04 00 00 	movl   $0x4,0x4(%esp)
 326:	00 
 327:	8b 45 f4             	mov    -0xc(%ebp),%eax
 32a:	89 04 24             	mov    %eax,(%esp)
 32d:	e8 05 00 00 00       	call   337 <printMessage>
  texit();
 332:	e8 74 03 00 00       	call   6ab <texit>

00000337 <printMessage>:
}

void printMessage(int pid, int state){
 337:	55                   	push   %ebp
 338:	89 e5                	mov    %esp,%ebp
 33a:	83 ec 18             	sub    $0x18,%esp
  printf(1, "%d",pid);
 33d:	8b 45 08             	mov    0x8(%ebp),%eax
 340:	89 44 24 08          	mov    %eax,0x8(%esp)
 344:	c7 44 24 04 f3 0f 00 	movl   $0xff3,0x4(%esp)
 34b:	00 
 34c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 353:	e8 53 04 00 00       	call   7ab <printf>
  printf(1, " - %d", state); 
 358:	8b 45 0c             	mov    0xc(%ebp),%eax
 35b:	89 44 24 08          	mov    %eax,0x8(%esp)
 35f:	c7 44 24 04 f6 0f 00 	movl   $0xff6,0x4(%esp)
 366:	00 
 367:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 36e:	e8 38 04 00 00       	call   7ab <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);  
 373:	a1 04 15 00 00       	mov    0x1504,%eax
 378:	ba 03 00 00 00       	mov    $0x3,%edx
 37d:	29 c2                	sub    %eax,%edx
 37f:	89 d0                	mov    %edx,%eax
 381:	89 44 24 08          	mov    %eax,0x8(%esp)
 385:	c7 44 24 04 fc 0f 00 	movl   $0xffc,0x4(%esp)
 38c:	00 
 38d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 394:	e8 12 04 00 00       	call   7ab <printf>
  
 399:	c9                   	leave  
 39a:	c3                   	ret    

0000039b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 39b:	55                   	push   %ebp
 39c:	89 e5                	mov    %esp,%ebp
 39e:	57                   	push   %edi
 39f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 3a0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3a3:	8b 55 10             	mov    0x10(%ebp),%edx
 3a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a9:	89 cb                	mov    %ecx,%ebx
 3ab:	89 df                	mov    %ebx,%edi
 3ad:	89 d1                	mov    %edx,%ecx
 3af:	fc                   	cld    
 3b0:	f3 aa                	rep stos %al,%es:(%edi)
 3b2:	89 ca                	mov    %ecx,%edx
 3b4:	89 fb                	mov    %edi,%ebx
 3b6:	89 5d 08             	mov    %ebx,0x8(%ebp)
 3b9:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 3bc:	5b                   	pop    %ebx
 3bd:	5f                   	pop    %edi
 3be:	5d                   	pop    %ebp
 3bf:	c3                   	ret    

000003c0 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 3c0:	55                   	push   %ebp
 3c1:	89 e5                	mov    %esp,%ebp
 3c3:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 3c6:	8b 45 08             	mov    0x8(%ebp),%eax
 3c9:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 3cc:	90                   	nop
 3cd:	8b 45 08             	mov    0x8(%ebp),%eax
 3d0:	8d 50 01             	lea    0x1(%eax),%edx
 3d3:	89 55 08             	mov    %edx,0x8(%ebp)
 3d6:	8b 55 0c             	mov    0xc(%ebp),%edx
 3d9:	8d 4a 01             	lea    0x1(%edx),%ecx
 3dc:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 3df:	0f b6 12             	movzbl (%edx),%edx
 3e2:	88 10                	mov    %dl,(%eax)
 3e4:	0f b6 00             	movzbl (%eax),%eax
 3e7:	84 c0                	test   %al,%al
 3e9:	75 e2                	jne    3cd <strcpy+0xd>
    ;
  return os;
 3eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ee:	c9                   	leave  
 3ef:	c3                   	ret    

000003f0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3f3:	eb 08                	jmp    3fd <strcmp+0xd>
    p++, q++;
 3f5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3f9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3fd:	8b 45 08             	mov    0x8(%ebp),%eax
 400:	0f b6 00             	movzbl (%eax),%eax
 403:	84 c0                	test   %al,%al
 405:	74 10                	je     417 <strcmp+0x27>
 407:	8b 45 08             	mov    0x8(%ebp),%eax
 40a:	0f b6 10             	movzbl (%eax),%edx
 40d:	8b 45 0c             	mov    0xc(%ebp),%eax
 410:	0f b6 00             	movzbl (%eax),%eax
 413:	38 c2                	cmp    %al,%dl
 415:	74 de                	je     3f5 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 417:	8b 45 08             	mov    0x8(%ebp),%eax
 41a:	0f b6 00             	movzbl (%eax),%eax
 41d:	0f b6 d0             	movzbl %al,%edx
 420:	8b 45 0c             	mov    0xc(%ebp),%eax
 423:	0f b6 00             	movzbl (%eax),%eax
 426:	0f b6 c0             	movzbl %al,%eax
 429:	29 c2                	sub    %eax,%edx
 42b:	89 d0                	mov    %edx,%eax
}
 42d:	5d                   	pop    %ebp
 42e:	c3                   	ret    

0000042f <strlen>:

uint
strlen(char *s)
{
 42f:	55                   	push   %ebp
 430:	89 e5                	mov    %esp,%ebp
 432:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 435:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 43c:	eb 04                	jmp    442 <strlen+0x13>
 43e:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 442:	8b 55 fc             	mov    -0x4(%ebp),%edx
 445:	8b 45 08             	mov    0x8(%ebp),%eax
 448:	01 d0                	add    %edx,%eax
 44a:	0f b6 00             	movzbl (%eax),%eax
 44d:	84 c0                	test   %al,%al
 44f:	75 ed                	jne    43e <strlen+0xf>
    ;
  return n;
 451:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 454:	c9                   	leave  
 455:	c3                   	ret    

00000456 <memset>:

void*
memset(void *dst, int c, uint n)
{
 456:	55                   	push   %ebp
 457:	89 e5                	mov    %esp,%ebp
 459:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 45c:	8b 45 10             	mov    0x10(%ebp),%eax
 45f:	89 44 24 08          	mov    %eax,0x8(%esp)
 463:	8b 45 0c             	mov    0xc(%ebp),%eax
 466:	89 44 24 04          	mov    %eax,0x4(%esp)
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	89 04 24             	mov    %eax,(%esp)
 470:	e8 26 ff ff ff       	call   39b <stosb>
  return dst;
 475:	8b 45 08             	mov    0x8(%ebp),%eax
}
 478:	c9                   	leave  
 479:	c3                   	ret    

0000047a <strchr>:

char*
strchr(const char *s, char c)
{
 47a:	55                   	push   %ebp
 47b:	89 e5                	mov    %esp,%ebp
 47d:	83 ec 04             	sub    $0x4,%esp
 480:	8b 45 0c             	mov    0xc(%ebp),%eax
 483:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 486:	eb 14                	jmp    49c <strchr+0x22>
    if(*s == c)
 488:	8b 45 08             	mov    0x8(%ebp),%eax
 48b:	0f b6 00             	movzbl (%eax),%eax
 48e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 491:	75 05                	jne    498 <strchr+0x1e>
      return (char*)s;
 493:	8b 45 08             	mov    0x8(%ebp),%eax
 496:	eb 13                	jmp    4ab <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 498:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 49c:	8b 45 08             	mov    0x8(%ebp),%eax
 49f:	0f b6 00             	movzbl (%eax),%eax
 4a2:	84 c0                	test   %al,%al
 4a4:	75 e2                	jne    488 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 4a6:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4ab:	c9                   	leave  
 4ac:	c3                   	ret    

000004ad <gets>:

char*
gets(char *buf, int max)
{
 4ad:	55                   	push   %ebp
 4ae:	89 e5                	mov    %esp,%ebp
 4b0:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4b3:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 4ba:	eb 4c                	jmp    508 <gets+0x5b>
    cc = read(0, &c, 1);
 4bc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4c3:	00 
 4c4:	8d 45 ef             	lea    -0x11(%ebp),%eax
 4c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 4cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4d2:	e8 44 01 00 00       	call   61b <read>
 4d7:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 4da:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4de:	7f 02                	jg     4e2 <gets+0x35>
      break;
 4e0:	eb 31                	jmp    513 <gets+0x66>
    buf[i++] = c;
 4e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e5:	8d 50 01             	lea    0x1(%eax),%edx
 4e8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4eb:	89 c2                	mov    %eax,%edx
 4ed:	8b 45 08             	mov    0x8(%ebp),%eax
 4f0:	01 c2                	add    %eax,%edx
 4f2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4f6:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4f8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4fc:	3c 0a                	cmp    $0xa,%al
 4fe:	74 13                	je     513 <gets+0x66>
 500:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 504:	3c 0d                	cmp    $0xd,%al
 506:	74 0b                	je     513 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 508:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50b:	83 c0 01             	add    $0x1,%eax
 50e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 511:	7c a9                	jl     4bc <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 513:	8b 55 f4             	mov    -0xc(%ebp),%edx
 516:	8b 45 08             	mov    0x8(%ebp),%eax
 519:	01 d0                	add    %edx,%eax
 51b:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 51e:	8b 45 08             	mov    0x8(%ebp),%eax
}
 521:	c9                   	leave  
 522:	c3                   	ret    

00000523 <stat>:

int
stat(char *n, struct stat *st)
{
 523:	55                   	push   %ebp
 524:	89 e5                	mov    %esp,%ebp
 526:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 529:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 530:	00 
 531:	8b 45 08             	mov    0x8(%ebp),%eax
 534:	89 04 24             	mov    %eax,(%esp)
 537:	e8 07 01 00 00       	call   643 <open>
 53c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 53f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 543:	79 07                	jns    54c <stat+0x29>
    return -1;
 545:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 54a:	eb 23                	jmp    56f <stat+0x4c>
  r = fstat(fd, st);
 54c:	8b 45 0c             	mov    0xc(%ebp),%eax
 54f:	89 44 24 04          	mov    %eax,0x4(%esp)
 553:	8b 45 f4             	mov    -0xc(%ebp),%eax
 556:	89 04 24             	mov    %eax,(%esp)
 559:	e8 fd 00 00 00       	call   65b <fstat>
 55e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 561:	8b 45 f4             	mov    -0xc(%ebp),%eax
 564:	89 04 24             	mov    %eax,(%esp)
 567:	e8 bf 00 00 00       	call   62b <close>
  return r;
 56c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 56f:	c9                   	leave  
 570:	c3                   	ret    

00000571 <atoi>:

int
atoi(const char *s)
{
 571:	55                   	push   %ebp
 572:	89 e5                	mov    %esp,%ebp
 574:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 577:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 57e:	eb 25                	jmp    5a5 <atoi+0x34>
    n = n*10 + *s++ - '0';
 580:	8b 55 fc             	mov    -0x4(%ebp),%edx
 583:	89 d0                	mov    %edx,%eax
 585:	c1 e0 02             	shl    $0x2,%eax
 588:	01 d0                	add    %edx,%eax
 58a:	01 c0                	add    %eax,%eax
 58c:	89 c1                	mov    %eax,%ecx
 58e:	8b 45 08             	mov    0x8(%ebp),%eax
 591:	8d 50 01             	lea    0x1(%eax),%edx
 594:	89 55 08             	mov    %edx,0x8(%ebp)
 597:	0f b6 00             	movzbl (%eax),%eax
 59a:	0f be c0             	movsbl %al,%eax
 59d:	01 c8                	add    %ecx,%eax
 59f:	83 e8 30             	sub    $0x30,%eax
 5a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5a5:	8b 45 08             	mov    0x8(%ebp),%eax
 5a8:	0f b6 00             	movzbl (%eax),%eax
 5ab:	3c 2f                	cmp    $0x2f,%al
 5ad:	7e 0a                	jle    5b9 <atoi+0x48>
 5af:	8b 45 08             	mov    0x8(%ebp),%eax
 5b2:	0f b6 00             	movzbl (%eax),%eax
 5b5:	3c 39                	cmp    $0x39,%al
 5b7:	7e c7                	jle    580 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 5b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 5bc:	c9                   	leave  
 5bd:	c3                   	ret    

000005be <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 5be:	55                   	push   %ebp
 5bf:	89 e5                	mov    %esp,%ebp
 5c1:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 5c4:	8b 45 08             	mov    0x8(%ebp),%eax
 5c7:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 5ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 5cd:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 5d0:	eb 17                	jmp    5e9 <memmove+0x2b>
    *dst++ = *src++;
 5d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5d5:	8d 50 01             	lea    0x1(%eax),%edx
 5d8:	89 55 fc             	mov    %edx,-0x4(%ebp)
 5db:	8b 55 f8             	mov    -0x8(%ebp),%edx
 5de:	8d 4a 01             	lea    0x1(%edx),%ecx
 5e1:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5e4:	0f b6 12             	movzbl (%edx),%edx
 5e7:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5e9:	8b 45 10             	mov    0x10(%ebp),%eax
 5ec:	8d 50 ff             	lea    -0x1(%eax),%edx
 5ef:	89 55 10             	mov    %edx,0x10(%ebp)
 5f2:	85 c0                	test   %eax,%eax
 5f4:	7f dc                	jg     5d2 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5f6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5f9:	c9                   	leave  
 5fa:	c3                   	ret    

000005fb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5fb:	b8 01 00 00 00       	mov    $0x1,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <exit>:
SYSCALL(exit)
 603:	b8 02 00 00 00       	mov    $0x2,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <wait>:
SYSCALL(wait)
 60b:	b8 03 00 00 00       	mov    $0x3,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <pipe>:
SYSCALL(pipe)
 613:	b8 04 00 00 00       	mov    $0x4,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <read>:
SYSCALL(read)
 61b:	b8 05 00 00 00       	mov    $0x5,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <write>:
SYSCALL(write)
 623:	b8 10 00 00 00       	mov    $0x10,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <close>:
SYSCALL(close)
 62b:	b8 15 00 00 00       	mov    $0x15,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <kill>:
SYSCALL(kill)
 633:	b8 06 00 00 00       	mov    $0x6,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <exec>:
SYSCALL(exec)
 63b:	b8 07 00 00 00       	mov    $0x7,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <open>:
SYSCALL(open)
 643:	b8 0f 00 00 00       	mov    $0xf,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <mknod>:
SYSCALL(mknod)
 64b:	b8 11 00 00 00       	mov    $0x11,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <unlink>:
SYSCALL(unlink)
 653:	b8 12 00 00 00       	mov    $0x12,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <fstat>:
SYSCALL(fstat)
 65b:	b8 08 00 00 00       	mov    $0x8,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <link>:
SYSCALL(link)
 663:	b8 13 00 00 00       	mov    $0x13,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <mkdir>:
SYSCALL(mkdir)
 66b:	b8 14 00 00 00       	mov    $0x14,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <chdir>:
SYSCALL(chdir)
 673:	b8 09 00 00 00       	mov    $0x9,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <dup>:
SYSCALL(dup)
 67b:	b8 0a 00 00 00       	mov    $0xa,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <getpid>:
SYSCALL(getpid)
 683:	b8 0b 00 00 00       	mov    $0xb,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <sbrk>:
SYSCALL(sbrk)
 68b:	b8 0c 00 00 00       	mov    $0xc,%eax
 690:	cd 40                	int    $0x40
 692:	c3                   	ret    

00000693 <sleep>:
SYSCALL(sleep)
 693:	b8 0d 00 00 00       	mov    $0xd,%eax
 698:	cd 40                	int    $0x40
 69a:	c3                   	ret    

0000069b <uptime>:
SYSCALL(uptime)
 69b:	b8 0e 00 00 00       	mov    $0xe,%eax
 6a0:	cd 40                	int    $0x40
 6a2:	c3                   	ret    

000006a3 <clone>:
SYSCALL(clone)
 6a3:	b8 16 00 00 00       	mov    $0x16,%eax
 6a8:	cd 40                	int    $0x40
 6aa:	c3                   	ret    

000006ab <texit>:
SYSCALL(texit)
 6ab:	b8 17 00 00 00       	mov    $0x17,%eax
 6b0:	cd 40                	int    $0x40
 6b2:	c3                   	ret    

000006b3 <tsleep>:
SYSCALL(tsleep)
 6b3:	b8 18 00 00 00       	mov    $0x18,%eax
 6b8:	cd 40                	int    $0x40
 6ba:	c3                   	ret    

000006bb <twakeup>:
SYSCALL(twakeup)
 6bb:	b8 19 00 00 00       	mov    $0x19,%eax
 6c0:	cd 40                	int    $0x40
 6c2:	c3                   	ret    

000006c3 <test>:
SYSCALL(test)
 6c3:	b8 1a 00 00 00       	mov    $0x1a,%eax
 6c8:	cd 40                	int    $0x40
 6ca:	c3                   	ret    

000006cb <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6cb:	55                   	push   %ebp
 6cc:	89 e5                	mov    %esp,%ebp
 6ce:	83 ec 18             	sub    $0x18,%esp
 6d1:	8b 45 0c             	mov    0xc(%ebp),%eax
 6d4:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 6d7:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6de:	00 
 6df:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6e2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e6:	8b 45 08             	mov    0x8(%ebp),%eax
 6e9:	89 04 24             	mov    %eax,(%esp)
 6ec:	e8 32 ff ff ff       	call   623 <write>
}
 6f1:	c9                   	leave  
 6f2:	c3                   	ret    

000006f3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6f3:	55                   	push   %ebp
 6f4:	89 e5                	mov    %esp,%ebp
 6f6:	56                   	push   %esi
 6f7:	53                   	push   %ebx
 6f8:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6fb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 702:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 706:	74 17                	je     71f <printint+0x2c>
 708:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 70c:	79 11                	jns    71f <printint+0x2c>
    neg = 1;
 70e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 715:	8b 45 0c             	mov    0xc(%ebp),%eax
 718:	f7 d8                	neg    %eax
 71a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 71d:	eb 06                	jmp    725 <printint+0x32>
  } else {
    x = xx;
 71f:	8b 45 0c             	mov    0xc(%ebp),%eax
 722:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 725:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 72c:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 72f:	8d 41 01             	lea    0x1(%ecx),%eax
 732:	89 45 f4             	mov    %eax,-0xc(%ebp)
 735:	8b 5d 10             	mov    0x10(%ebp),%ebx
 738:	8b 45 ec             	mov    -0x14(%ebp),%eax
 73b:	ba 00 00 00 00       	mov    $0x0,%edx
 740:	f7 f3                	div    %ebx
 742:	89 d0                	mov    %edx,%eax
 744:	0f b6 80 38 14 00 00 	movzbl 0x1438(%eax),%eax
 74b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 74f:	8b 75 10             	mov    0x10(%ebp),%esi
 752:	8b 45 ec             	mov    -0x14(%ebp),%eax
 755:	ba 00 00 00 00       	mov    $0x0,%edx
 75a:	f7 f6                	div    %esi
 75c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 75f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 763:	75 c7                	jne    72c <printint+0x39>
  if(neg)
 765:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 769:	74 10                	je     77b <printint+0x88>
    buf[i++] = '-';
 76b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76e:	8d 50 01             	lea    0x1(%eax),%edx
 771:	89 55 f4             	mov    %edx,-0xc(%ebp)
 774:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 779:	eb 1f                	jmp    79a <printint+0xa7>
 77b:	eb 1d                	jmp    79a <printint+0xa7>
    putc(fd, buf[i]);
 77d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 780:	8b 45 f4             	mov    -0xc(%ebp),%eax
 783:	01 d0                	add    %edx,%eax
 785:	0f b6 00             	movzbl (%eax),%eax
 788:	0f be c0             	movsbl %al,%eax
 78b:	89 44 24 04          	mov    %eax,0x4(%esp)
 78f:	8b 45 08             	mov    0x8(%ebp),%eax
 792:	89 04 24             	mov    %eax,(%esp)
 795:	e8 31 ff ff ff       	call   6cb <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 79a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 79e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7a2:	79 d9                	jns    77d <printint+0x8a>
    putc(fd, buf[i]);
}
 7a4:	83 c4 30             	add    $0x30,%esp
 7a7:	5b                   	pop    %ebx
 7a8:	5e                   	pop    %esi
 7a9:	5d                   	pop    %ebp
 7aa:	c3                   	ret    

000007ab <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 7ab:	55                   	push   %ebp
 7ac:	89 e5                	mov    %esp,%ebp
 7ae:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 7b1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 7b8:	8d 45 0c             	lea    0xc(%ebp),%eax
 7bb:	83 c0 04             	add    $0x4,%eax
 7be:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 7c1:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 7c8:	e9 7c 01 00 00       	jmp    949 <printf+0x19e>
    c = fmt[i] & 0xff;
 7cd:	8b 55 0c             	mov    0xc(%ebp),%edx
 7d0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d3:	01 d0                	add    %edx,%eax
 7d5:	0f b6 00             	movzbl (%eax),%eax
 7d8:	0f be c0             	movsbl %al,%eax
 7db:	25 ff 00 00 00       	and    $0xff,%eax
 7e0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 7e3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7e7:	75 2c                	jne    815 <printf+0x6a>
      if(c == '%'){
 7e9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7ed:	75 0c                	jne    7fb <printf+0x50>
        state = '%';
 7ef:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 7f6:	e9 4a 01 00 00       	jmp    945 <printf+0x19a>
      } else {
        putc(fd, c);
 7fb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7fe:	0f be c0             	movsbl %al,%eax
 801:	89 44 24 04          	mov    %eax,0x4(%esp)
 805:	8b 45 08             	mov    0x8(%ebp),%eax
 808:	89 04 24             	mov    %eax,(%esp)
 80b:	e8 bb fe ff ff       	call   6cb <putc>
 810:	e9 30 01 00 00       	jmp    945 <printf+0x19a>
      }
    } else if(state == '%'){
 815:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 819:	0f 85 26 01 00 00    	jne    945 <printf+0x19a>
      if(c == 'd'){
 81f:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 823:	75 2d                	jne    852 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 825:	8b 45 e8             	mov    -0x18(%ebp),%eax
 828:	8b 00                	mov    (%eax),%eax
 82a:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 831:	00 
 832:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 839:	00 
 83a:	89 44 24 04          	mov    %eax,0x4(%esp)
 83e:	8b 45 08             	mov    0x8(%ebp),%eax
 841:	89 04 24             	mov    %eax,(%esp)
 844:	e8 aa fe ff ff       	call   6f3 <printint>
        ap++;
 849:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 84d:	e9 ec 00 00 00       	jmp    93e <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 852:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 856:	74 06                	je     85e <printf+0xb3>
 858:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 85c:	75 2d                	jne    88b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 85e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 861:	8b 00                	mov    (%eax),%eax
 863:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 86a:	00 
 86b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 872:	00 
 873:	89 44 24 04          	mov    %eax,0x4(%esp)
 877:	8b 45 08             	mov    0x8(%ebp),%eax
 87a:	89 04 24             	mov    %eax,(%esp)
 87d:	e8 71 fe ff ff       	call   6f3 <printint>
        ap++;
 882:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 886:	e9 b3 00 00 00       	jmp    93e <printf+0x193>
      } else if(c == 's'){
 88b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 88f:	75 45                	jne    8d6 <printf+0x12b>
        s = (char*)*ap;
 891:	8b 45 e8             	mov    -0x18(%ebp),%eax
 894:	8b 00                	mov    (%eax),%eax
 896:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 899:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 89d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8a1:	75 09                	jne    8ac <printf+0x101>
          s = "(null)";
 8a3:	c7 45 f4 03 10 00 00 	movl   $0x1003,-0xc(%ebp)
        while(*s != 0){
 8aa:	eb 1e                	jmp    8ca <printf+0x11f>
 8ac:	eb 1c                	jmp    8ca <printf+0x11f>
          putc(fd, *s);
 8ae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b1:	0f b6 00             	movzbl (%eax),%eax
 8b4:	0f be c0             	movsbl %al,%eax
 8b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8bb:	8b 45 08             	mov    0x8(%ebp),%eax
 8be:	89 04 24             	mov    %eax,(%esp)
 8c1:	e8 05 fe ff ff       	call   6cb <putc>
          s++;
 8c6:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 8ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8cd:	0f b6 00             	movzbl (%eax),%eax
 8d0:	84 c0                	test   %al,%al
 8d2:	75 da                	jne    8ae <printf+0x103>
 8d4:	eb 68                	jmp    93e <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8d6:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 8da:	75 1d                	jne    8f9 <printf+0x14e>
        putc(fd, *ap);
 8dc:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8df:	8b 00                	mov    (%eax),%eax
 8e1:	0f be c0             	movsbl %al,%eax
 8e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8e8:	8b 45 08             	mov    0x8(%ebp),%eax
 8eb:	89 04 24             	mov    %eax,(%esp)
 8ee:	e8 d8 fd ff ff       	call   6cb <putc>
        ap++;
 8f3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8f7:	eb 45                	jmp    93e <printf+0x193>
      } else if(c == '%'){
 8f9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8fd:	75 17                	jne    916 <printf+0x16b>
        putc(fd, c);
 8ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 902:	0f be c0             	movsbl %al,%eax
 905:	89 44 24 04          	mov    %eax,0x4(%esp)
 909:	8b 45 08             	mov    0x8(%ebp),%eax
 90c:	89 04 24             	mov    %eax,(%esp)
 90f:	e8 b7 fd ff ff       	call   6cb <putc>
 914:	eb 28                	jmp    93e <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 916:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 91d:	00 
 91e:	8b 45 08             	mov    0x8(%ebp),%eax
 921:	89 04 24             	mov    %eax,(%esp)
 924:	e8 a2 fd ff ff       	call   6cb <putc>
        putc(fd, c);
 929:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 92c:	0f be c0             	movsbl %al,%eax
 92f:	89 44 24 04          	mov    %eax,0x4(%esp)
 933:	8b 45 08             	mov    0x8(%ebp),%eax
 936:	89 04 24             	mov    %eax,(%esp)
 939:	e8 8d fd ff ff       	call   6cb <putc>
      }
      state = 0;
 93e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 945:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 949:	8b 55 0c             	mov    0xc(%ebp),%edx
 94c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 94f:	01 d0                	add    %edx,%eax
 951:	0f b6 00             	movzbl (%eax),%eax
 954:	84 c0                	test   %al,%al
 956:	0f 85 71 fe ff ff    	jne    7cd <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 95c:	c9                   	leave  
 95d:	c3                   	ret    

0000095e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 95e:	55                   	push   %ebp
 95f:	89 e5                	mov    %esp,%ebp
 961:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 964:	8b 45 08             	mov    0x8(%ebp),%eax
 967:	83 e8 08             	sub    $0x8,%eax
 96a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96d:	a1 70 14 00 00       	mov    0x1470,%eax
 972:	89 45 fc             	mov    %eax,-0x4(%ebp)
 975:	eb 24                	jmp    99b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 977:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97a:	8b 00                	mov    (%eax),%eax
 97c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 97f:	77 12                	ja     993 <free+0x35>
 981:	8b 45 f8             	mov    -0x8(%ebp),%eax
 984:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 987:	77 24                	ja     9ad <free+0x4f>
 989:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98c:	8b 00                	mov    (%eax),%eax
 98e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 991:	77 1a                	ja     9ad <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 993:	8b 45 fc             	mov    -0x4(%ebp),%eax
 996:	8b 00                	mov    (%eax),%eax
 998:	89 45 fc             	mov    %eax,-0x4(%ebp)
 99b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 9a1:	76 d4                	jbe    977 <free+0x19>
 9a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a6:	8b 00                	mov    (%eax),%eax
 9a8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9ab:	76 ca                	jbe    977 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 9ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9b0:	8b 40 04             	mov    0x4(%eax),%eax
 9b3:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9ba:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9bd:	01 c2                	add    %eax,%edx
 9bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c2:	8b 00                	mov    (%eax),%eax
 9c4:	39 c2                	cmp    %eax,%edx
 9c6:	75 24                	jne    9ec <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 9c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9cb:	8b 50 04             	mov    0x4(%eax),%edx
 9ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d1:	8b 00                	mov    (%eax),%eax
 9d3:	8b 40 04             	mov    0x4(%eax),%eax
 9d6:	01 c2                	add    %eax,%edx
 9d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9db:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 9de:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e1:	8b 00                	mov    (%eax),%eax
 9e3:	8b 10                	mov    (%eax),%edx
 9e5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9e8:	89 10                	mov    %edx,(%eax)
 9ea:	eb 0a                	jmp    9f6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 9ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ef:	8b 10                	mov    (%eax),%edx
 9f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9f4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9f9:	8b 40 04             	mov    0x4(%eax),%eax
 9fc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a03:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a06:	01 d0                	add    %edx,%eax
 a08:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a0b:	75 20                	jne    a2d <free+0xcf>
    p->s.size += bp->s.size;
 a0d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a10:	8b 50 04             	mov    0x4(%eax),%edx
 a13:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a16:	8b 40 04             	mov    0x4(%eax),%eax
 a19:	01 c2                	add    %eax,%edx
 a1b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a1e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a21:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a24:	8b 10                	mov    (%eax),%edx
 a26:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a29:	89 10                	mov    %edx,(%eax)
 a2b:	eb 08                	jmp    a35 <free+0xd7>
  } else
    p->s.ptr = bp;
 a2d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a30:	8b 55 f8             	mov    -0x8(%ebp),%edx
 a33:	89 10                	mov    %edx,(%eax)
  freep = p;
 a35:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a38:	a3 70 14 00 00       	mov    %eax,0x1470
}
 a3d:	c9                   	leave  
 a3e:	c3                   	ret    

00000a3f <morecore>:

static Header*
morecore(uint nu)
{
 a3f:	55                   	push   %ebp
 a40:	89 e5                	mov    %esp,%ebp
 a42:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 a45:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 a4c:	77 07                	ja     a55 <morecore+0x16>
    nu = 4096;
 a4e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a55:	8b 45 08             	mov    0x8(%ebp),%eax
 a58:	c1 e0 03             	shl    $0x3,%eax
 a5b:	89 04 24             	mov    %eax,(%esp)
 a5e:	e8 28 fc ff ff       	call   68b <sbrk>
 a63:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a66:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a6a:	75 07                	jne    a73 <morecore+0x34>
    return 0;
 a6c:	b8 00 00 00 00       	mov    $0x0,%eax
 a71:	eb 22                	jmp    a95 <morecore+0x56>
  hp = (Header*)p;
 a73:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a76:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a79:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a7c:	8b 55 08             	mov    0x8(%ebp),%edx
 a7f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a82:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a85:	83 c0 08             	add    $0x8,%eax
 a88:	89 04 24             	mov    %eax,(%esp)
 a8b:	e8 ce fe ff ff       	call   95e <free>
  return freep;
 a90:	a1 70 14 00 00       	mov    0x1470,%eax
}
 a95:	c9                   	leave  
 a96:	c3                   	ret    

00000a97 <malloc>:

void*
malloc(uint nbytes)
{
 a97:	55                   	push   %ebp
 a98:	89 e5                	mov    %esp,%ebp
 a9a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a9d:	8b 45 08             	mov    0x8(%ebp),%eax
 aa0:	83 c0 07             	add    $0x7,%eax
 aa3:	c1 e8 03             	shr    $0x3,%eax
 aa6:	83 c0 01             	add    $0x1,%eax
 aa9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 aac:	a1 70 14 00 00       	mov    0x1470,%eax
 ab1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ab4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 ab8:	75 23                	jne    add <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 aba:	c7 45 f0 68 14 00 00 	movl   $0x1468,-0x10(%ebp)
 ac1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac4:	a3 70 14 00 00       	mov    %eax,0x1470
 ac9:	a1 70 14 00 00       	mov    0x1470,%eax
 ace:	a3 68 14 00 00       	mov    %eax,0x1468
    base.s.size = 0;
 ad3:	c7 05 6c 14 00 00 00 	movl   $0x0,0x146c
 ada:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 add:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ae0:	8b 00                	mov    (%eax),%eax
 ae2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 ae5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae8:	8b 40 04             	mov    0x4(%eax),%eax
 aeb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 aee:	72 4d                	jb     b3d <malloc+0xa6>
      if(p->s.size == nunits)
 af0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af3:	8b 40 04             	mov    0x4(%eax),%eax
 af6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 af9:	75 0c                	jne    b07 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 afe:	8b 10                	mov    (%eax),%edx
 b00:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b03:	89 10                	mov    %edx,(%eax)
 b05:	eb 26                	jmp    b2d <malloc+0x96>
      else {
        p->s.size -= nunits;
 b07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b0a:	8b 40 04             	mov    0x4(%eax),%eax
 b0d:	2b 45 ec             	sub    -0x14(%ebp),%eax
 b10:	89 c2                	mov    %eax,%edx
 b12:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b15:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 b18:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b1b:	8b 40 04             	mov    0x4(%eax),%eax
 b1e:	c1 e0 03             	shl    $0x3,%eax
 b21:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 b24:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b27:	8b 55 ec             	mov    -0x14(%ebp),%edx
 b2a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 b2d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b30:	a3 70 14 00 00       	mov    %eax,0x1470
      return (void*)(p + 1);
 b35:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b38:	83 c0 08             	add    $0x8,%eax
 b3b:	eb 38                	jmp    b75 <malloc+0xde>
    }
    if(p == freep)
 b3d:	a1 70 14 00 00       	mov    0x1470,%eax
 b42:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 b45:	75 1b                	jne    b62 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 b47:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b4a:	89 04 24             	mov    %eax,(%esp)
 b4d:	e8 ed fe ff ff       	call   a3f <morecore>
 b52:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b55:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b59:	75 07                	jne    b62 <malloc+0xcb>
        return 0;
 b5b:	b8 00 00 00 00       	mov    $0x0,%eax
 b60:	eb 13                	jmp    b75 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b62:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b65:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b68:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b6b:	8b 00                	mov    (%eax),%eax
 b6d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b70:	e9 70 ff ff ff       	jmp    ae5 <malloc+0x4e>
}
 b75:	c9                   	leave  
 b76:	c3                   	ret    

00000b77 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 b77:	55                   	push   %ebp
 b78:	89 e5                	mov    %esp,%ebp
 b7a:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 b7d:	8b 55 08             	mov    0x8(%ebp),%edx
 b80:	8b 45 0c             	mov    0xc(%ebp),%eax
 b83:	8b 4d 08             	mov    0x8(%ebp),%ecx
 b86:	f0 87 02             	lock xchg %eax,(%edx)
 b89:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 b8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 b8f:	c9                   	leave  
 b90:	c3                   	ret    

00000b91 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 b91:	55                   	push   %ebp
 b92:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 b94:	8b 45 08             	mov    0x8(%ebp),%eax
 b97:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 b9d:	5d                   	pop    %ebp
 b9e:	c3                   	ret    

00000b9f <lock_acquire>:
void lock_acquire(lock_t *lock){
 b9f:	55                   	push   %ebp
 ba0:	89 e5                	mov    %esp,%ebp
 ba2:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 ba5:	90                   	nop
 ba6:	8b 45 08             	mov    0x8(%ebp),%eax
 ba9:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 bb0:	00 
 bb1:	89 04 24             	mov    %eax,(%esp)
 bb4:	e8 be ff ff ff       	call   b77 <xchg>
 bb9:	85 c0                	test   %eax,%eax
 bbb:	75 e9                	jne    ba6 <lock_acquire+0x7>
}
 bbd:	c9                   	leave  
 bbe:	c3                   	ret    

00000bbf <lock_release>:
void lock_release(lock_t *lock){
 bbf:	55                   	push   %ebp
 bc0:	89 e5                	mov    %esp,%ebp
 bc2:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 bc5:	8b 45 08             	mov    0x8(%ebp),%eax
 bc8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 bcf:	00 
 bd0:	89 04 24             	mov    %eax,(%esp)
 bd3:	e8 9f ff ff ff       	call   b77 <xchg>
}
 bd8:	c9                   	leave  
 bd9:	c3                   	ret    

00000bda <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 bda:	55                   	push   %ebp
 bdb:	89 e5                	mov    %esp,%ebp
 bdd:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 be0:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 be7:	e8 ab fe ff ff       	call   a97 <malloc>
 bec:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 bef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf2:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 bf5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf8:	25 ff 0f 00 00       	and    $0xfff,%eax
 bfd:	85 c0                	test   %eax,%eax
 bff:	74 14                	je     c15 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 c01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c04:	25 ff 0f 00 00       	and    $0xfff,%eax
 c09:	89 c2                	mov    %eax,%edx
 c0b:	b8 00 10 00 00       	mov    $0x1000,%eax
 c10:	29 d0                	sub    %edx,%eax
 c12:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 c15:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c19:	75 1b                	jne    c36 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 c1b:	c7 44 24 04 0a 10 00 	movl   $0x100a,0x4(%esp)
 c22:	00 
 c23:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c2a:	e8 7c fb ff ff       	call   7ab <printf>
        return 0;
 c2f:	b8 00 00 00 00       	mov    $0x0,%eax
 c34:	eb 6f                	jmp    ca5 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 c36:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 c39:	8b 55 08             	mov    0x8(%ebp),%edx
 c3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c3f:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 c43:	89 54 24 08          	mov    %edx,0x8(%esp)
 c47:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 c4e:	00 
 c4f:	89 04 24             	mov    %eax,(%esp)
 c52:	e8 4c fa ff ff       	call   6a3 <clone>
 c57:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 c5a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c5e:	79 1b                	jns    c7b <thread_create+0xa1>
        printf(1,"clone fails\n");
 c60:	c7 44 24 04 18 10 00 	movl   $0x1018,0x4(%esp)
 c67:	00 
 c68:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c6f:	e8 37 fb ff ff       	call   7ab <printf>
        return 0;
 c74:	b8 00 00 00 00       	mov    $0x0,%eax
 c79:	eb 2a                	jmp    ca5 <thread_create+0xcb>
    }
    if(tid > 0){
 c7b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c7f:	7e 05                	jle    c86 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 c81:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c84:	eb 1f                	jmp    ca5 <thread_create+0xcb>
    }
    if(tid == 0){
 c86:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c8a:	75 14                	jne    ca0 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 c8c:	c7 44 24 04 25 10 00 	movl   $0x1025,0x4(%esp)
 c93:	00 
 c94:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c9b:	e8 0b fb ff ff       	call   7ab <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 ca0:	b8 00 00 00 00       	mov    $0x0,%eax
}
 ca5:	c9                   	leave  
 ca6:	c3                   	ret    

00000ca7 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 ca7:	55                   	push   %ebp
 ca8:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 caa:	8b 45 08             	mov    0x8(%ebp),%eax
 cad:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 cb3:	8b 45 08             	mov    0x8(%ebp),%eax
 cb6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 cbd:	8b 45 08             	mov    0x8(%ebp),%eax
 cc0:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 cc7:	5d                   	pop    %ebp
 cc8:	c3                   	ret    

00000cc9 <add_q>:

void add_q(struct queue *q, int v){
 cc9:	55                   	push   %ebp
 cca:	89 e5                	mov    %esp,%ebp
 ccc:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 ccf:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 cd6:	e8 bc fd ff ff       	call   a97 <malloc>
 cdb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 cde:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ce1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 ce8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ceb:	8b 55 0c             	mov    0xc(%ebp),%edx
 cee:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 cf0:	8b 45 08             	mov    0x8(%ebp),%eax
 cf3:	8b 40 04             	mov    0x4(%eax),%eax
 cf6:	85 c0                	test   %eax,%eax
 cf8:	75 0b                	jne    d05 <add_q+0x3c>
        q->head = n;
 cfa:	8b 45 08             	mov    0x8(%ebp),%eax
 cfd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 d00:	89 50 04             	mov    %edx,0x4(%eax)
 d03:	eb 0c                	jmp    d11 <add_q+0x48>
    }else{
        q->tail->next = n;
 d05:	8b 45 08             	mov    0x8(%ebp),%eax
 d08:	8b 40 08             	mov    0x8(%eax),%eax
 d0b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 d0e:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 d11:	8b 45 08             	mov    0x8(%ebp),%eax
 d14:	8b 55 f4             	mov    -0xc(%ebp),%edx
 d17:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 d1a:	8b 45 08             	mov    0x8(%ebp),%eax
 d1d:	8b 00                	mov    (%eax),%eax
 d1f:	8d 50 01             	lea    0x1(%eax),%edx
 d22:	8b 45 08             	mov    0x8(%ebp),%eax
 d25:	89 10                	mov    %edx,(%eax)
}
 d27:	c9                   	leave  
 d28:	c3                   	ret    

00000d29 <empty_q>:

int empty_q(struct queue *q){
 d29:	55                   	push   %ebp
 d2a:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 d2c:	8b 45 08             	mov    0x8(%ebp),%eax
 d2f:	8b 00                	mov    (%eax),%eax
 d31:	85 c0                	test   %eax,%eax
 d33:	75 07                	jne    d3c <empty_q+0x13>
        return 1;
 d35:	b8 01 00 00 00       	mov    $0x1,%eax
 d3a:	eb 05                	jmp    d41 <empty_q+0x18>
    else
        return 0;
 d3c:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 d41:	5d                   	pop    %ebp
 d42:	c3                   	ret    

00000d43 <pop_q>:
int pop_q(struct queue *q){
 d43:	55                   	push   %ebp
 d44:	89 e5                	mov    %esp,%ebp
 d46:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 d49:	8b 45 08             	mov    0x8(%ebp),%eax
 d4c:	89 04 24             	mov    %eax,(%esp)
 d4f:	e8 d5 ff ff ff       	call   d29 <empty_q>
 d54:	85 c0                	test   %eax,%eax
 d56:	75 5d                	jne    db5 <pop_q+0x72>
       val = q->head->value; 
 d58:	8b 45 08             	mov    0x8(%ebp),%eax
 d5b:	8b 40 04             	mov    0x4(%eax),%eax
 d5e:	8b 00                	mov    (%eax),%eax
 d60:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 d63:	8b 45 08             	mov    0x8(%ebp),%eax
 d66:	8b 40 04             	mov    0x4(%eax),%eax
 d69:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 d6c:	8b 45 08             	mov    0x8(%ebp),%eax
 d6f:	8b 40 04             	mov    0x4(%eax),%eax
 d72:	8b 50 04             	mov    0x4(%eax),%edx
 d75:	8b 45 08             	mov    0x8(%ebp),%eax
 d78:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 d7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d7e:	89 04 24             	mov    %eax,(%esp)
 d81:	e8 d8 fb ff ff       	call   95e <free>
       q->size--;
 d86:	8b 45 08             	mov    0x8(%ebp),%eax
 d89:	8b 00                	mov    (%eax),%eax
 d8b:	8d 50 ff             	lea    -0x1(%eax),%edx
 d8e:	8b 45 08             	mov    0x8(%ebp),%eax
 d91:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 d93:	8b 45 08             	mov    0x8(%ebp),%eax
 d96:	8b 00                	mov    (%eax),%eax
 d98:	85 c0                	test   %eax,%eax
 d9a:	75 14                	jne    db0 <pop_q+0x6d>
            q->head = 0;
 d9c:	8b 45 08             	mov    0x8(%ebp),%eax
 d9f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 da6:	8b 45 08             	mov    0x8(%ebp),%eax
 da9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 db0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 db3:	eb 05                	jmp    dba <pop_q+0x77>
    }
    return -1;
 db5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 dba:	c9                   	leave  
 dbb:	c3                   	ret    

00000dbc <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 dbc:	55                   	push   %ebp
 dbd:	89 e5                	mov    %esp,%ebp
 dbf:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 dc2:	8b 45 08             	mov    0x8(%ebp),%eax
 dc5:	8b 55 0c             	mov    0xc(%ebp),%edx
 dc8:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 dcb:	8b 45 08             	mov    0x8(%ebp),%eax
 dce:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 dd5:	8b 45 08             	mov    0x8(%ebp),%eax
 dd8:	89 04 24             	mov    %eax,(%esp)
 ddb:	e8 b1 fd ff ff       	call   b91 <lock_init>
}
 de0:	c9                   	leave  
 de1:	c3                   	ret    

00000de2 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 de2:	55                   	push   %ebp
 de3:	89 e5                	mov    %esp,%ebp
 de5:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 de8:	8b 45 08             	mov    0x8(%ebp),%eax
 deb:	89 04 24             	mov    %eax,(%esp)
 dee:	e8 ac fd ff ff       	call   b9f <lock_acquire>
	if(s->count  == 0){
 df3:	8b 45 08             	mov    0x8(%ebp),%eax
 df6:	8b 40 04             	mov    0x4(%eax),%eax
 df9:	85 c0                	test   %eax,%eax
 dfb:	75 2f                	jne    e2c <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 dfd:	e8 81 f8 ff ff       	call   683 <getpid>
 e02:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 e05:	8b 45 08             	mov    0x8(%ebp),%eax
 e08:	8d 50 0c             	lea    0xc(%eax),%edx
 e0b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e0e:	89 44 24 04          	mov    %eax,0x4(%esp)
 e12:	89 14 24             	mov    %edx,(%esp)
 e15:	e8 af fe ff ff       	call   cc9 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 e1a:	8b 45 08             	mov    0x8(%ebp),%eax
 e1d:	89 04 24             	mov    %eax,(%esp)
 e20:	e8 9a fd ff ff       	call   bbf <lock_release>
		tsleep(); 
 e25:	e8 89 f8 ff ff       	call   6b3 <tsleep>
 e2a:	eb 1a                	jmp    e46 <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 e2c:	8b 45 08             	mov    0x8(%ebp),%eax
 e2f:	8b 40 04             	mov    0x4(%eax),%eax
 e32:	8d 50 ff             	lea    -0x1(%eax),%edx
 e35:	8b 45 08             	mov    0x8(%ebp),%eax
 e38:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 e3b:	8b 45 08             	mov    0x8(%ebp),%eax
 e3e:	89 04 24             	mov    %eax,(%esp)
 e41:	e8 79 fd ff ff       	call   bbf <lock_release>
	}
}
 e46:	c9                   	leave  
 e47:	c3                   	ret    

00000e48 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 e48:	55                   	push   %ebp
 e49:	89 e5                	mov    %esp,%ebp
 e4b:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 e4e:	8b 45 08             	mov    0x8(%ebp),%eax
 e51:	89 04 24             	mov    %eax,(%esp)
 e54:	e8 46 fd ff ff       	call   b9f <lock_acquire>
	if(s->count < s->size){
 e59:	8b 45 08             	mov    0x8(%ebp),%eax
 e5c:	8b 50 04             	mov    0x4(%eax),%edx
 e5f:	8b 45 08             	mov    0x8(%ebp),%eax
 e62:	8b 40 08             	mov    0x8(%eax),%eax
 e65:	39 c2                	cmp    %eax,%edx
 e67:	7d 0f                	jge    e78 <sem_signal+0x30>
		s->count++;	
 e69:	8b 45 08             	mov    0x8(%ebp),%eax
 e6c:	8b 40 04             	mov    0x4(%eax),%eax
 e6f:	8d 50 01             	lea    0x1(%eax),%edx
 e72:	8b 45 08             	mov    0x8(%ebp),%eax
 e75:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 e78:	8b 45 08             	mov    0x8(%ebp),%eax
 e7b:	83 c0 0c             	add    $0xc,%eax
 e7e:	89 04 24             	mov    %eax,(%esp)
 e81:	e8 bd fe ff ff       	call   d43 <pop_q>
 e86:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 e89:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 e8d:	74 2e                	je     ebd <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 e8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e92:	89 04 24             	mov    %eax,(%esp)
 e95:	e8 21 f8 ff ff       	call   6bb <twakeup>
		s->count--;
 e9a:	8b 45 08             	mov    0x8(%ebp),%eax
 e9d:	8b 40 04             	mov    0x4(%eax),%eax
 ea0:	8d 50 ff             	lea    -0x1(%eax),%edx
 ea3:	8b 45 08             	mov    0x8(%ebp),%eax
 ea6:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 ea9:	8b 45 08             	mov    0x8(%ebp),%eax
 eac:	8b 40 04             	mov    0x4(%eax),%eax
 eaf:	85 c0                	test   %eax,%eax
 eb1:	79 0a                	jns    ebd <sem_signal+0x75>
 eb3:	8b 45 08             	mov    0x8(%ebp),%eax
 eb6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 ebd:	8b 45 08             	mov    0x8(%ebp),%eax
 ec0:	89 04 24             	mov    %eax,(%esp)
 ec3:	e8 f7 fc ff ff       	call   bbf <lock_release>

 ec8:	c9                   	leave  
 ec9:	c3                   	ret    
