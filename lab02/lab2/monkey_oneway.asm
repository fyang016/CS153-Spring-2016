
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
  11:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
  18:	e8 a0 0d 00 00       	call   dbd <sem_init>
	sem_init(&mutex1, 1);  //Initialize semaphore with 5
  1d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  24:	00 
  25:	c7 04 24 80 15 00 00 	movl   $0x1580,(%esp)
  2c:	e8 8c 0d 00 00       	call   dbd <sem_init>
	sem_init(&mutex2, 1);  //Initialize semaphore with 5
  31:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  38:	00 
  39:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
  40:	e8 78 0d 00 00       	call   dbd <sem_init>
	sem_init(&climb, 1);  //Initialize semaphore with 5 slots
  45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
  54:	e8 64 0d 00 00       	call   dbd <sem_init>
	
	int i;
	sem_signal(&wait_tree);
  59:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
  60:	e8 0c 0e 00 00       	call   e71 <sem_signal>
	sem_signal(&wait_tree);
  65:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
  6c:	e8 00 0e 00 00       	call   e71 <sem_signal>
	sem_signal(&wait_tree);
  71:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
  78:	e8 f4 0d 00 00       	call   e71 <sem_signal>
	sem_signal(&wait_tree);
  7d:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
  84:	e8 e8 0d 00 00       	call   e71 <sem_signal>

	sem_signal(&mutex1);
  89:	c7 04 24 80 15 00 00 	movl   $0x1580,(%esp)
  90:	e8 dc 0d 00 00       	call   e71 <sem_signal>
	sem_signal(&mutex2);
  95:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
  9c:	e8 d0 0d 00 00       	call   e71 <sem_signal>
	sem_signal(&climb);
  a1:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
  a8:	e8 c4 0d 00 00       	call   e71 <sem_signal>

  	printf(1, "\n\nFirst # is the PID\n");
  ad:	c7 44 24 04 08 0f 00 	movl   $0xf08,0x4(%esp)
  b4:	00 
  b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bc:	e8 eb 06 00 00       	call   7ac <printf>
  	printf(1, "\nSecond # is waiting state\n");
  c1:	c7 44 24 04 1e 0f 00 	movl   $0xf1e,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 d7 06 00 00       	call   7ac <printf>
  	printf(1, "1 - waiting to climb tree\n");
  d5:	c7 44 24 04 3a 0f 00 	movl   $0xf3a,0x4(%esp)
  dc:	00 
  dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e4:	e8 c3 06 00 00       	call   7ac <printf>
  	printf(1, "2 - climbing tree\n");
  e9:	c7 44 24 04 55 0f 00 	movl   $0xf55,0x4(%esp)
  f0:	00 
  f1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f8:	e8 af 06 00 00       	call   7ac <printf>
  	printf(1, "3 - Found a banana climbing down\n");
  fd:	c7 44 24 04 68 0f 00 	movl   $0xf68,0x4(%esp)
 104:	00 
 105:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 10c:	e8 9b 06 00 00       	call   7ac <printf>
  	printf(1, "4 - Eating banana\n\n");
 111:	c7 44 24 04 8a 0f 00 	movl   $0xf8a,0x4(%esp)
 118:	00 
 119:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 120:	e8 87 06 00 00       	call   7ac <printf>
  	printf(1, "Third # is monkeys on tree\n");
 125:	c7 44 24 04 9e 0f 00 	movl   $0xf9e,0x4(%esp)
 12c:	00 
 12d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 134:	e8 73 06 00 00       	call   7ac <printf>
  	printf(1, "*abreviations\n");
 139:	c7 44 24 04 ba 0f 00 	movl   $0xfba,0x4(%esp)
 140:	00 
 141:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 148:	e8 5f 06 00 00       	call   7ac <printf>
  	printf(1, "Sem A - Semaphore Aquired\n");
 14d:	c7 44 24 04 c9 0f 00 	movl   $0xfc9,0x4(%esp)
 154:	00 
 155:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 15c:	e8 4b 06 00 00       	call   7ac <printf>
  	printf(1, "Sem R - Sempahore Released\n");
 161:	c7 44 24 04 e4 0f 00 	movl   $0xfe4,0x4(%esp)
 168:	00 
 169:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 170:	e8 37 06 00 00       	call   7ac <printf>
  	printf(1, "Sem F - Sempahore Full\n\n");
 175:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 17c:	00 
 17d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 184:	e8 23 06 00 00       	call   7ac <printf>
	for(i = 0; i < 5; i++) thread_create(monkey, 0);
 189:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
 190:	00 
 191:	eb 19                	jmp    1ac <main+0x1ac>
 193:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 19a:	00 
 19b:	c7 04 24 d6 01 00 00 	movl   $0x1d6,(%esp)
 1a2:	e8 34 0a 00 00       	call   bdb <thread_create>
 1a7:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1ac:	83 7c 24 1c 04       	cmpl   $0x4,0x1c(%esp)
 1b1:	7e e0                	jle    193 <main+0x193>
    while(wait() > 0);
 1b3:	90                   	nop
 1b4:	e8 53 04 00 00       	call   60c <wait>
 1b9:	85 c0                	test   %eax,%eax
 1bb:	7f f7                	jg     1b4 <main+0x1b4>
	printf(1,"All monkeys are full\n");
 1bd:	c7 44 24 04 19 10 00 	movl   $0x1019,0x4(%esp)
 1c4:	00 
 1c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1cc:	e8 db 05 00 00       	call   7ac <printf>
	exit();
 1d1:	e8 2e 04 00 00       	call   604 <exit>

000001d6 <monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
 1d6:	55                   	push   %ebp
 1d7:	89 e5                	mov    %esp,%ebp
 1d9:	83 ec 28             	sub    $0x28,%esp
  int pid =  getpid();
 1dc:	e8 a3 04 00 00       	call   684 <getpid>
 1e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  printf(1, "%d",pid);
 1e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e7:	89 44 24 08          	mov    %eax,0x8(%esp)
 1eb:	c7 44 24 04 2f 10 00 	movl   $0x102f,0x4(%esp)
 1f2:	00 
 1f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1fa:	e8 ad 05 00 00       	call   7ac <printf>
  printf(1, " - 1");
 1ff:	c7 44 24 04 32 10 00 	movl   $0x1032,0x4(%esp)
 206:	00 
 207:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 20e:	e8 99 05 00 00       	call   7ac <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 213:	a1 44 15 00 00       	mov    0x1544,%eax
 218:	ba 03 00 00 00       	mov    $0x3,%edx
 21d:	29 c2                	sub    %eax,%edx
 21f:	89 d0                	mov    %edx,%eax
 221:	89 44 24 08          	mov    %eax,0x8(%esp)
 225:	c7 44 24 04 37 10 00 	movl   $0x1037,0x4(%esp)
 22c:	00 
 22d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 234:	e8 73 05 00 00       	call   7ac <printf>
  sem_aquire(&wait_tree);
 239:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
 240:	e8 9e 0b 00 00       	call   de3 <sem_aquire>
  printf(1, "%d",pid);
 245:	8b 45 f4             	mov    -0xc(%ebp),%eax
 248:	89 44 24 08          	mov    %eax,0x8(%esp)
 24c:	c7 44 24 04 2f 10 00 	movl   $0x102f,0x4(%esp)
 253:	00 
 254:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 25b:	e8 4c 05 00 00       	call   7ac <printf>
  printf(1, " - 2");
 260:	c7 44 24 04 3e 10 00 	movl   $0x103e,0x4(%esp)
 267:	00 
 268:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 26f:	e8 38 05 00 00       	call   7ac <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 274:	a1 44 15 00 00       	mov    0x1544,%eax
 279:	ba 03 00 00 00       	mov    $0x3,%edx
 27e:	29 c2                	sub    %eax,%edx
 280:	89 d0                	mov    %edx,%eax
 282:	89 44 24 08          	mov    %eax,0x8(%esp)
 286:	c7 44 24 04 37 10 00 	movl   $0x1037,0x4(%esp)
 28d:	00 
 28e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 295:	e8 12 05 00 00       	call   7ac <printf>
  sem_aquire(&mutex1);
 29a:	c7 04 24 80 15 00 00 	movl   $0x1580,(%esp)
 2a1:	e8 3d 0b 00 00       	call   de3 <sem_aquire>
  movingup++;
 2a6:	a1 a0 14 00 00       	mov    0x14a0,%eax
 2ab:	83 c0 01             	add    $0x1,%eax
 2ae:	a3 a0 14 00 00       	mov    %eax,0x14a0
  if(movingup==1){
 2b3:	a1 a0 14 00 00       	mov    0x14a0,%eax
 2b8:	83 f8 01             	cmp    $0x1,%eax
 2bb:	75 0c                	jne    2c9 <monkey+0xf3>
  	sem_aquire(&climb);
 2bd:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
 2c4:	e8 1a 0b 00 00       	call   de3 <sem_aquire>
  }
  sem_signal(&mutex1);
 2c9:	c7 04 24 80 15 00 00 	movl   $0x1580,(%esp)
 2d0:	e8 9c 0b 00 00       	call   e71 <sem_signal>
  sleep(3); 
 2d5:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 2dc:	e8 b3 03 00 00       	call   694 <sleep>
  printf(1, "%d",pid);
 2e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2e4:	89 44 24 08          	mov    %eax,0x8(%esp)
 2e8:	c7 44 24 04 2f 10 00 	movl   $0x102f,0x4(%esp)
 2ef:	00 
 2f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2f7:	e8 b0 04 00 00       	call   7ac <printf>
  printf(1, " - 3");
 2fc:	c7 44 24 04 43 10 00 	movl   $0x1043,0x4(%esp)
 303:	00 
 304:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 30b:	e8 9c 04 00 00       	call   7ac <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 310:	a1 44 15 00 00       	mov    0x1544,%eax
 315:	ba 03 00 00 00       	mov    $0x3,%edx
 31a:	29 c2                	sub    %eax,%edx
 31c:	89 d0                	mov    %edx,%eax
 31e:	89 44 24 08          	mov    %eax,0x8(%esp)
 322:	c7 44 24 04 37 10 00 	movl   $0x1037,0x4(%esp)
 329:	00 
 32a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 331:	e8 76 04 00 00       	call   7ac <printf>
  sem_signal(&wait_tree);
 336:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
 33d:	e8 2f 0b 00 00       	call   e71 <sem_signal>
  printf(1, "%d",pid);
 342:	8b 45 f4             	mov    -0xc(%ebp),%eax
 345:	89 44 24 08          	mov    %eax,0x8(%esp)
 349:	c7 44 24 04 2f 10 00 	movl   $0x102f,0x4(%esp)
 350:	00 
 351:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 358:	e8 4f 04 00 00       	call   7ac <printf>
  printf(1, " - 4"); 
 35d:	c7 44 24 04 48 10 00 	movl   $0x1048,0x4(%esp)
 364:	00 
 365:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 36c:	e8 3b 04 00 00       	call   7ac <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);  
 371:	a1 44 15 00 00       	mov    0x1544,%eax
 376:	ba 03 00 00 00       	mov    $0x3,%edx
 37b:	29 c2                	sub    %eax,%edx
 37d:	89 d0                	mov    %edx,%eax
 37f:	89 44 24 08          	mov    %eax,0x8(%esp)
 383:	c7 44 24 04 37 10 00 	movl   $0x1037,0x4(%esp)
 38a:	00 
 38b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 392:	e8 15 04 00 00       	call   7ac <printf>
  texit();
 397:	e8 10 03 00 00       	call   6ac <texit>

0000039c <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 39c:	55                   	push   %ebp
 39d:	89 e5                	mov    %esp,%ebp
 39f:	57                   	push   %edi
 3a0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 3a1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 3a4:	8b 55 10             	mov    0x10(%ebp),%edx
 3a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3aa:	89 cb                	mov    %ecx,%ebx
 3ac:	89 df                	mov    %ebx,%edi
 3ae:	89 d1                	mov    %edx,%ecx
 3b0:	fc                   	cld    
 3b1:	f3 aa                	rep stos %al,%es:(%edi)
 3b3:	89 ca                	mov    %ecx,%edx
 3b5:	89 fb                	mov    %edi,%ebx
 3b7:	89 5d 08             	mov    %ebx,0x8(%ebp)
 3ba:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 3bd:	5b                   	pop    %ebx
 3be:	5f                   	pop    %edi
 3bf:	5d                   	pop    %ebp
 3c0:	c3                   	ret    

000003c1 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 3c1:	55                   	push   %ebp
 3c2:	89 e5                	mov    %esp,%ebp
 3c4:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 3cd:	90                   	nop
 3ce:	8b 45 08             	mov    0x8(%ebp),%eax
 3d1:	8d 50 01             	lea    0x1(%eax),%edx
 3d4:	89 55 08             	mov    %edx,0x8(%ebp)
 3d7:	8b 55 0c             	mov    0xc(%ebp),%edx
 3da:	8d 4a 01             	lea    0x1(%edx),%ecx
 3dd:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 3e0:	0f b6 12             	movzbl (%edx),%edx
 3e3:	88 10                	mov    %dl,(%eax)
 3e5:	0f b6 00             	movzbl (%eax),%eax
 3e8:	84 c0                	test   %al,%al
 3ea:	75 e2                	jne    3ce <strcpy+0xd>
    ;
  return os;
 3ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ef:	c9                   	leave  
 3f0:	c3                   	ret    

000003f1 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3f1:	55                   	push   %ebp
 3f2:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3f4:	eb 08                	jmp    3fe <strcmp+0xd>
    p++, q++;
 3f6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3fa:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3fe:	8b 45 08             	mov    0x8(%ebp),%eax
 401:	0f b6 00             	movzbl (%eax),%eax
 404:	84 c0                	test   %al,%al
 406:	74 10                	je     418 <strcmp+0x27>
 408:	8b 45 08             	mov    0x8(%ebp),%eax
 40b:	0f b6 10             	movzbl (%eax),%edx
 40e:	8b 45 0c             	mov    0xc(%ebp),%eax
 411:	0f b6 00             	movzbl (%eax),%eax
 414:	38 c2                	cmp    %al,%dl
 416:	74 de                	je     3f6 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 418:	8b 45 08             	mov    0x8(%ebp),%eax
 41b:	0f b6 00             	movzbl (%eax),%eax
 41e:	0f b6 d0             	movzbl %al,%edx
 421:	8b 45 0c             	mov    0xc(%ebp),%eax
 424:	0f b6 00             	movzbl (%eax),%eax
 427:	0f b6 c0             	movzbl %al,%eax
 42a:	29 c2                	sub    %eax,%edx
 42c:	89 d0                	mov    %edx,%eax
}
 42e:	5d                   	pop    %ebp
 42f:	c3                   	ret    

00000430 <strlen>:

uint
strlen(char *s)
{
 430:	55                   	push   %ebp
 431:	89 e5                	mov    %esp,%ebp
 433:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 436:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 43d:	eb 04                	jmp    443 <strlen+0x13>
 43f:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 443:	8b 55 fc             	mov    -0x4(%ebp),%edx
 446:	8b 45 08             	mov    0x8(%ebp),%eax
 449:	01 d0                	add    %edx,%eax
 44b:	0f b6 00             	movzbl (%eax),%eax
 44e:	84 c0                	test   %al,%al
 450:	75 ed                	jne    43f <strlen+0xf>
    ;
  return n;
 452:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 455:	c9                   	leave  
 456:	c3                   	ret    

00000457 <memset>:

void*
memset(void *dst, int c, uint n)
{
 457:	55                   	push   %ebp
 458:	89 e5                	mov    %esp,%ebp
 45a:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 45d:	8b 45 10             	mov    0x10(%ebp),%eax
 460:	89 44 24 08          	mov    %eax,0x8(%esp)
 464:	8b 45 0c             	mov    0xc(%ebp),%eax
 467:	89 44 24 04          	mov    %eax,0x4(%esp)
 46b:	8b 45 08             	mov    0x8(%ebp),%eax
 46e:	89 04 24             	mov    %eax,(%esp)
 471:	e8 26 ff ff ff       	call   39c <stosb>
  return dst;
 476:	8b 45 08             	mov    0x8(%ebp),%eax
}
 479:	c9                   	leave  
 47a:	c3                   	ret    

0000047b <strchr>:

char*
strchr(const char *s, char c)
{
 47b:	55                   	push   %ebp
 47c:	89 e5                	mov    %esp,%ebp
 47e:	83 ec 04             	sub    $0x4,%esp
 481:	8b 45 0c             	mov    0xc(%ebp),%eax
 484:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 487:	eb 14                	jmp    49d <strchr+0x22>
    if(*s == c)
 489:	8b 45 08             	mov    0x8(%ebp),%eax
 48c:	0f b6 00             	movzbl (%eax),%eax
 48f:	3a 45 fc             	cmp    -0x4(%ebp),%al
 492:	75 05                	jne    499 <strchr+0x1e>
      return (char*)s;
 494:	8b 45 08             	mov    0x8(%ebp),%eax
 497:	eb 13                	jmp    4ac <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 499:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 49d:	8b 45 08             	mov    0x8(%ebp),%eax
 4a0:	0f b6 00             	movzbl (%eax),%eax
 4a3:	84 c0                	test   %al,%al
 4a5:	75 e2                	jne    489 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 4a7:	b8 00 00 00 00       	mov    $0x0,%eax
}
 4ac:	c9                   	leave  
 4ad:	c3                   	ret    

000004ae <gets>:

char*
gets(char *buf, int max)
{
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4b4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 4bb:	eb 4c                	jmp    509 <gets+0x5b>
    cc = read(0, &c, 1);
 4bd:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 4c4:	00 
 4c5:	8d 45 ef             	lea    -0x11(%ebp),%eax
 4c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 4cc:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4d3:	e8 44 01 00 00       	call   61c <read>
 4d8:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 4db:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4df:	7f 02                	jg     4e3 <gets+0x35>
      break;
 4e1:	eb 31                	jmp    514 <gets+0x66>
    buf[i++] = c;
 4e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e6:	8d 50 01             	lea    0x1(%eax),%edx
 4e9:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4ec:	89 c2                	mov    %eax,%edx
 4ee:	8b 45 08             	mov    0x8(%ebp),%eax
 4f1:	01 c2                	add    %eax,%edx
 4f3:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4f7:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4f9:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4fd:	3c 0a                	cmp    $0xa,%al
 4ff:	74 13                	je     514 <gets+0x66>
 501:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 505:	3c 0d                	cmp    $0xd,%al
 507:	74 0b                	je     514 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 509:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50c:	83 c0 01             	add    $0x1,%eax
 50f:	3b 45 0c             	cmp    0xc(%ebp),%eax
 512:	7c a9                	jl     4bd <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 514:	8b 55 f4             	mov    -0xc(%ebp),%edx
 517:	8b 45 08             	mov    0x8(%ebp),%eax
 51a:	01 d0                	add    %edx,%eax
 51c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 51f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 522:	c9                   	leave  
 523:	c3                   	ret    

00000524 <stat>:

int
stat(char *n, struct stat *st)
{
 524:	55                   	push   %ebp
 525:	89 e5                	mov    %esp,%ebp
 527:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 52a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 531:	00 
 532:	8b 45 08             	mov    0x8(%ebp),%eax
 535:	89 04 24             	mov    %eax,(%esp)
 538:	e8 07 01 00 00       	call   644 <open>
 53d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 540:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 544:	79 07                	jns    54d <stat+0x29>
    return -1;
 546:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 54b:	eb 23                	jmp    570 <stat+0x4c>
  r = fstat(fd, st);
 54d:	8b 45 0c             	mov    0xc(%ebp),%eax
 550:	89 44 24 04          	mov    %eax,0x4(%esp)
 554:	8b 45 f4             	mov    -0xc(%ebp),%eax
 557:	89 04 24             	mov    %eax,(%esp)
 55a:	e8 fd 00 00 00       	call   65c <fstat>
 55f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 562:	8b 45 f4             	mov    -0xc(%ebp),%eax
 565:	89 04 24             	mov    %eax,(%esp)
 568:	e8 bf 00 00 00       	call   62c <close>
  return r;
 56d:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 570:	c9                   	leave  
 571:	c3                   	ret    

00000572 <atoi>:

int
atoi(const char *s)
{
 572:	55                   	push   %ebp
 573:	89 e5                	mov    %esp,%ebp
 575:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 578:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 57f:	eb 25                	jmp    5a6 <atoi+0x34>
    n = n*10 + *s++ - '0';
 581:	8b 55 fc             	mov    -0x4(%ebp),%edx
 584:	89 d0                	mov    %edx,%eax
 586:	c1 e0 02             	shl    $0x2,%eax
 589:	01 d0                	add    %edx,%eax
 58b:	01 c0                	add    %eax,%eax
 58d:	89 c1                	mov    %eax,%ecx
 58f:	8b 45 08             	mov    0x8(%ebp),%eax
 592:	8d 50 01             	lea    0x1(%eax),%edx
 595:	89 55 08             	mov    %edx,0x8(%ebp)
 598:	0f b6 00             	movzbl (%eax),%eax
 59b:	0f be c0             	movsbl %al,%eax
 59e:	01 c8                	add    %ecx,%eax
 5a0:	83 e8 30             	sub    $0x30,%eax
 5a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 5a6:	8b 45 08             	mov    0x8(%ebp),%eax
 5a9:	0f b6 00             	movzbl (%eax),%eax
 5ac:	3c 2f                	cmp    $0x2f,%al
 5ae:	7e 0a                	jle    5ba <atoi+0x48>
 5b0:	8b 45 08             	mov    0x8(%ebp),%eax
 5b3:	0f b6 00             	movzbl (%eax),%eax
 5b6:	3c 39                	cmp    $0x39,%al
 5b8:	7e c7                	jle    581 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 5ba:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 5bd:	c9                   	leave  
 5be:	c3                   	ret    

000005bf <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 5bf:	55                   	push   %ebp
 5c0:	89 e5                	mov    %esp,%ebp
 5c2:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 5c5:	8b 45 08             	mov    0x8(%ebp),%eax
 5c8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 5cb:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ce:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 5d1:	eb 17                	jmp    5ea <memmove+0x2b>
    *dst++ = *src++;
 5d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5d6:	8d 50 01             	lea    0x1(%eax),%edx
 5d9:	89 55 fc             	mov    %edx,-0x4(%ebp)
 5dc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 5df:	8d 4a 01             	lea    0x1(%edx),%ecx
 5e2:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5e5:	0f b6 12             	movzbl (%edx),%edx
 5e8:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5ea:	8b 45 10             	mov    0x10(%ebp),%eax
 5ed:	8d 50 ff             	lea    -0x1(%eax),%edx
 5f0:	89 55 10             	mov    %edx,0x10(%ebp)
 5f3:	85 c0                	test   %eax,%eax
 5f5:	7f dc                	jg     5d3 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5f7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5fa:	c9                   	leave  
 5fb:	c3                   	ret    

000005fc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5fc:	b8 01 00 00 00       	mov    $0x1,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <exit>:
SYSCALL(exit)
 604:	b8 02 00 00 00       	mov    $0x2,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <wait>:
SYSCALL(wait)
 60c:	b8 03 00 00 00       	mov    $0x3,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <pipe>:
SYSCALL(pipe)
 614:	b8 04 00 00 00       	mov    $0x4,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <read>:
SYSCALL(read)
 61c:	b8 05 00 00 00       	mov    $0x5,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <write>:
SYSCALL(write)
 624:	b8 10 00 00 00       	mov    $0x10,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <close>:
SYSCALL(close)
 62c:	b8 15 00 00 00       	mov    $0x15,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <kill>:
SYSCALL(kill)
 634:	b8 06 00 00 00       	mov    $0x6,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <exec>:
SYSCALL(exec)
 63c:	b8 07 00 00 00       	mov    $0x7,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <open>:
SYSCALL(open)
 644:	b8 0f 00 00 00       	mov    $0xf,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <mknod>:
SYSCALL(mknod)
 64c:	b8 11 00 00 00       	mov    $0x11,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <unlink>:
SYSCALL(unlink)
 654:	b8 12 00 00 00       	mov    $0x12,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <fstat>:
SYSCALL(fstat)
 65c:	b8 08 00 00 00       	mov    $0x8,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <link>:
SYSCALL(link)
 664:	b8 13 00 00 00       	mov    $0x13,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <mkdir>:
SYSCALL(mkdir)
 66c:	b8 14 00 00 00       	mov    $0x14,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <chdir>:
SYSCALL(chdir)
 674:	b8 09 00 00 00       	mov    $0x9,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <dup>:
SYSCALL(dup)
 67c:	b8 0a 00 00 00       	mov    $0xa,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <getpid>:
SYSCALL(getpid)
 684:	b8 0b 00 00 00       	mov    $0xb,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <sbrk>:
SYSCALL(sbrk)
 68c:	b8 0c 00 00 00       	mov    $0xc,%eax
 691:	cd 40                	int    $0x40
 693:	c3                   	ret    

00000694 <sleep>:
SYSCALL(sleep)
 694:	b8 0d 00 00 00       	mov    $0xd,%eax
 699:	cd 40                	int    $0x40
 69b:	c3                   	ret    

0000069c <uptime>:
SYSCALL(uptime)
 69c:	b8 0e 00 00 00       	mov    $0xe,%eax
 6a1:	cd 40                	int    $0x40
 6a3:	c3                   	ret    

000006a4 <clone>:
SYSCALL(clone)
 6a4:	b8 16 00 00 00       	mov    $0x16,%eax
 6a9:	cd 40                	int    $0x40
 6ab:	c3                   	ret    

000006ac <texit>:
SYSCALL(texit)
 6ac:	b8 17 00 00 00       	mov    $0x17,%eax
 6b1:	cd 40                	int    $0x40
 6b3:	c3                   	ret    

000006b4 <tsleep>:
SYSCALL(tsleep)
 6b4:	b8 18 00 00 00       	mov    $0x18,%eax
 6b9:	cd 40                	int    $0x40
 6bb:	c3                   	ret    

000006bc <twakeup>:
SYSCALL(twakeup)
 6bc:	b8 19 00 00 00       	mov    $0x19,%eax
 6c1:	cd 40                	int    $0x40
 6c3:	c3                   	ret    

000006c4 <test>:
SYSCALL(test)
 6c4:	b8 1a 00 00 00       	mov    $0x1a,%eax
 6c9:	cd 40                	int    $0x40
 6cb:	c3                   	ret    

000006cc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 6cc:	55                   	push   %ebp
 6cd:	89 e5                	mov    %esp,%ebp
 6cf:	83 ec 18             	sub    $0x18,%esp
 6d2:	8b 45 0c             	mov    0xc(%ebp),%eax
 6d5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 6d8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 6df:	00 
 6e0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	89 04 24             	mov    %eax,(%esp)
 6ed:	e8 32 ff ff ff       	call   624 <write>
}
 6f2:	c9                   	leave  
 6f3:	c3                   	ret    

000006f4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6f4:	55                   	push   %ebp
 6f5:	89 e5                	mov    %esp,%ebp
 6f7:	56                   	push   %esi
 6f8:	53                   	push   %ebx
 6f9:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6fc:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 703:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 707:	74 17                	je     720 <printint+0x2c>
 709:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 70d:	79 11                	jns    720 <printint+0x2c>
    neg = 1;
 70f:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 716:	8b 45 0c             	mov    0xc(%ebp),%eax
 719:	f7 d8                	neg    %eax
 71b:	89 45 ec             	mov    %eax,-0x14(%ebp)
 71e:	eb 06                	jmp    726 <printint+0x32>
  } else {
    x = xx;
 720:	8b 45 0c             	mov    0xc(%ebp),%eax
 723:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 726:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 72d:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 730:	8d 41 01             	lea    0x1(%ecx),%eax
 733:	89 45 f4             	mov    %eax,-0xc(%ebp)
 736:	8b 5d 10             	mov    0x10(%ebp),%ebx
 739:	8b 45 ec             	mov    -0x14(%ebp),%eax
 73c:	ba 00 00 00 00       	mov    $0x0,%edx
 741:	f7 f3                	div    %ebx
 743:	89 d0                	mov    %edx,%eax
 745:	0f b6 80 78 14 00 00 	movzbl 0x1478(%eax),%eax
 74c:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 750:	8b 75 10             	mov    0x10(%ebp),%esi
 753:	8b 45 ec             	mov    -0x14(%ebp),%eax
 756:	ba 00 00 00 00       	mov    $0x0,%edx
 75b:	f7 f6                	div    %esi
 75d:	89 45 ec             	mov    %eax,-0x14(%ebp)
 760:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 764:	75 c7                	jne    72d <printint+0x39>
  if(neg)
 766:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 76a:	74 10                	je     77c <printint+0x88>
    buf[i++] = '-';
 76c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 76f:	8d 50 01             	lea    0x1(%eax),%edx
 772:	89 55 f4             	mov    %edx,-0xc(%ebp)
 775:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 77a:	eb 1f                	jmp    79b <printint+0xa7>
 77c:	eb 1d                	jmp    79b <printint+0xa7>
    putc(fd, buf[i]);
 77e:	8d 55 dc             	lea    -0x24(%ebp),%edx
 781:	8b 45 f4             	mov    -0xc(%ebp),%eax
 784:	01 d0                	add    %edx,%eax
 786:	0f b6 00             	movzbl (%eax),%eax
 789:	0f be c0             	movsbl %al,%eax
 78c:	89 44 24 04          	mov    %eax,0x4(%esp)
 790:	8b 45 08             	mov    0x8(%ebp),%eax
 793:	89 04 24             	mov    %eax,(%esp)
 796:	e8 31 ff ff ff       	call   6cc <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 79b:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 79f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7a3:	79 d9                	jns    77e <printint+0x8a>
    putc(fd, buf[i]);
}
 7a5:	83 c4 30             	add    $0x30,%esp
 7a8:	5b                   	pop    %ebx
 7a9:	5e                   	pop    %esi
 7aa:	5d                   	pop    %ebp
 7ab:	c3                   	ret    

000007ac <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 7ac:	55                   	push   %ebp
 7ad:	89 e5                	mov    %esp,%ebp
 7af:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 7b2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 7b9:	8d 45 0c             	lea    0xc(%ebp),%eax
 7bc:	83 c0 04             	add    $0x4,%eax
 7bf:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 7c2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 7c9:	e9 7c 01 00 00       	jmp    94a <printf+0x19e>
    c = fmt[i] & 0xff;
 7ce:	8b 55 0c             	mov    0xc(%ebp),%edx
 7d1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7d4:	01 d0                	add    %edx,%eax
 7d6:	0f b6 00             	movzbl (%eax),%eax
 7d9:	0f be c0             	movsbl %al,%eax
 7dc:	25 ff 00 00 00       	and    $0xff,%eax
 7e1:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 7e4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7e8:	75 2c                	jne    816 <printf+0x6a>
      if(c == '%'){
 7ea:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7ee:	75 0c                	jne    7fc <printf+0x50>
        state = '%';
 7f0:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 7f7:	e9 4a 01 00 00       	jmp    946 <printf+0x19a>
      } else {
        putc(fd, c);
 7fc:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7ff:	0f be c0             	movsbl %al,%eax
 802:	89 44 24 04          	mov    %eax,0x4(%esp)
 806:	8b 45 08             	mov    0x8(%ebp),%eax
 809:	89 04 24             	mov    %eax,(%esp)
 80c:	e8 bb fe ff ff       	call   6cc <putc>
 811:	e9 30 01 00 00       	jmp    946 <printf+0x19a>
      }
    } else if(state == '%'){
 816:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 81a:	0f 85 26 01 00 00    	jne    946 <printf+0x19a>
      if(c == 'd'){
 820:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 824:	75 2d                	jne    853 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 826:	8b 45 e8             	mov    -0x18(%ebp),%eax
 829:	8b 00                	mov    (%eax),%eax
 82b:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 832:	00 
 833:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 83a:	00 
 83b:	89 44 24 04          	mov    %eax,0x4(%esp)
 83f:	8b 45 08             	mov    0x8(%ebp),%eax
 842:	89 04 24             	mov    %eax,(%esp)
 845:	e8 aa fe ff ff       	call   6f4 <printint>
        ap++;
 84a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 84e:	e9 ec 00 00 00       	jmp    93f <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 853:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 857:	74 06                	je     85f <printf+0xb3>
 859:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 85d:	75 2d                	jne    88c <printf+0xe0>
        printint(fd, *ap, 16, 0);
 85f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 862:	8b 00                	mov    (%eax),%eax
 864:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 86b:	00 
 86c:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 873:	00 
 874:	89 44 24 04          	mov    %eax,0x4(%esp)
 878:	8b 45 08             	mov    0x8(%ebp),%eax
 87b:	89 04 24             	mov    %eax,(%esp)
 87e:	e8 71 fe ff ff       	call   6f4 <printint>
        ap++;
 883:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 887:	e9 b3 00 00 00       	jmp    93f <printf+0x193>
      } else if(c == 's'){
 88c:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 890:	75 45                	jne    8d7 <printf+0x12b>
        s = (char*)*ap;
 892:	8b 45 e8             	mov    -0x18(%ebp),%eax
 895:	8b 00                	mov    (%eax),%eax
 897:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 89a:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 89e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8a2:	75 09                	jne    8ad <printf+0x101>
          s = "(null)";
 8a4:	c7 45 f4 4d 10 00 00 	movl   $0x104d,-0xc(%ebp)
        while(*s != 0){
 8ab:	eb 1e                	jmp    8cb <printf+0x11f>
 8ad:	eb 1c                	jmp    8cb <printf+0x11f>
          putc(fd, *s);
 8af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b2:	0f b6 00             	movzbl (%eax),%eax
 8b5:	0f be c0             	movsbl %al,%eax
 8b8:	89 44 24 04          	mov    %eax,0x4(%esp)
 8bc:	8b 45 08             	mov    0x8(%ebp),%eax
 8bf:	89 04 24             	mov    %eax,(%esp)
 8c2:	e8 05 fe ff ff       	call   6cc <putc>
          s++;
 8c7:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 8cb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ce:	0f b6 00             	movzbl (%eax),%eax
 8d1:	84 c0                	test   %al,%al
 8d3:	75 da                	jne    8af <printf+0x103>
 8d5:	eb 68                	jmp    93f <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 8d7:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 8db:	75 1d                	jne    8fa <printf+0x14e>
        putc(fd, *ap);
 8dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8e0:	8b 00                	mov    (%eax),%eax
 8e2:	0f be c0             	movsbl %al,%eax
 8e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8e9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ec:	89 04 24             	mov    %eax,(%esp)
 8ef:	e8 d8 fd ff ff       	call   6cc <putc>
        ap++;
 8f4:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8f8:	eb 45                	jmp    93f <printf+0x193>
      } else if(c == '%'){
 8fa:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8fe:	75 17                	jne    917 <printf+0x16b>
        putc(fd, c);
 900:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 903:	0f be c0             	movsbl %al,%eax
 906:	89 44 24 04          	mov    %eax,0x4(%esp)
 90a:	8b 45 08             	mov    0x8(%ebp),%eax
 90d:	89 04 24             	mov    %eax,(%esp)
 910:	e8 b7 fd ff ff       	call   6cc <putc>
 915:	eb 28                	jmp    93f <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 917:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 91e:	00 
 91f:	8b 45 08             	mov    0x8(%ebp),%eax
 922:	89 04 24             	mov    %eax,(%esp)
 925:	e8 a2 fd ff ff       	call   6cc <putc>
        putc(fd, c);
 92a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 92d:	0f be c0             	movsbl %al,%eax
 930:	89 44 24 04          	mov    %eax,0x4(%esp)
 934:	8b 45 08             	mov    0x8(%ebp),%eax
 937:	89 04 24             	mov    %eax,(%esp)
 93a:	e8 8d fd ff ff       	call   6cc <putc>
      }
      state = 0;
 93f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 946:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 94a:	8b 55 0c             	mov    0xc(%ebp),%edx
 94d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 950:	01 d0                	add    %edx,%eax
 952:	0f b6 00             	movzbl (%eax),%eax
 955:	84 c0                	test   %al,%al
 957:	0f 85 71 fe ff ff    	jne    7ce <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 95d:	c9                   	leave  
 95e:	c3                   	ret    

0000095f <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 95f:	55                   	push   %ebp
 960:	89 e5                	mov    %esp,%ebp
 962:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 965:	8b 45 08             	mov    0x8(%ebp),%eax
 968:	83 e8 08             	sub    $0x8,%eax
 96b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 96e:	a1 b0 14 00 00       	mov    0x14b0,%eax
 973:	89 45 fc             	mov    %eax,-0x4(%ebp)
 976:	eb 24                	jmp    99c <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 978:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97b:	8b 00                	mov    (%eax),%eax
 97d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 980:	77 12                	ja     994 <free+0x35>
 982:	8b 45 f8             	mov    -0x8(%ebp),%eax
 985:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 988:	77 24                	ja     9ae <free+0x4f>
 98a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98d:	8b 00                	mov    (%eax),%eax
 98f:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 992:	77 1a                	ja     9ae <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 994:	8b 45 fc             	mov    -0x4(%ebp),%eax
 997:	8b 00                	mov    (%eax),%eax
 999:	89 45 fc             	mov    %eax,-0x4(%ebp)
 99c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99f:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 9a2:	76 d4                	jbe    978 <free+0x19>
 9a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a7:	8b 00                	mov    (%eax),%eax
 9a9:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9ac:	76 ca                	jbe    978 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 9ae:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9b1:	8b 40 04             	mov    0x4(%eax),%eax
 9b4:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9be:	01 c2                	add    %eax,%edx
 9c0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c3:	8b 00                	mov    (%eax),%eax
 9c5:	39 c2                	cmp    %eax,%edx
 9c7:	75 24                	jne    9ed <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 9c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9cc:	8b 50 04             	mov    0x4(%eax),%edx
 9cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d2:	8b 00                	mov    (%eax),%eax
 9d4:	8b 40 04             	mov    0x4(%eax),%eax
 9d7:	01 c2                	add    %eax,%edx
 9d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9dc:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 9df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e2:	8b 00                	mov    (%eax),%eax
 9e4:	8b 10                	mov    (%eax),%edx
 9e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9e9:	89 10                	mov    %edx,(%eax)
 9eb:	eb 0a                	jmp    9f7 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 9ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9f0:	8b 10                	mov    (%eax),%edx
 9f2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9f5:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9fa:	8b 40 04             	mov    0x4(%eax),%eax
 9fd:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a04:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a07:	01 d0                	add    %edx,%eax
 a09:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a0c:	75 20                	jne    a2e <free+0xcf>
    p->s.size += bp->s.size;
 a0e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a11:	8b 50 04             	mov    0x4(%eax),%edx
 a14:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a17:	8b 40 04             	mov    0x4(%eax),%eax
 a1a:	01 c2                	add    %eax,%edx
 a1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a1f:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 a22:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a25:	8b 10                	mov    (%eax),%edx
 a27:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a2a:	89 10                	mov    %edx,(%eax)
 a2c:	eb 08                	jmp    a36 <free+0xd7>
  } else
    p->s.ptr = bp;
 a2e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a31:	8b 55 f8             	mov    -0x8(%ebp),%edx
 a34:	89 10                	mov    %edx,(%eax)
  freep = p;
 a36:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a39:	a3 b0 14 00 00       	mov    %eax,0x14b0
}
 a3e:	c9                   	leave  
 a3f:	c3                   	ret    

00000a40 <morecore>:

static Header*
morecore(uint nu)
{
 a40:	55                   	push   %ebp
 a41:	89 e5                	mov    %esp,%ebp
 a43:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 a46:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 a4d:	77 07                	ja     a56 <morecore+0x16>
    nu = 4096;
 a4f:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a56:	8b 45 08             	mov    0x8(%ebp),%eax
 a59:	c1 e0 03             	shl    $0x3,%eax
 a5c:	89 04 24             	mov    %eax,(%esp)
 a5f:	e8 28 fc ff ff       	call   68c <sbrk>
 a64:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a67:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a6b:	75 07                	jne    a74 <morecore+0x34>
    return 0;
 a6d:	b8 00 00 00 00       	mov    $0x0,%eax
 a72:	eb 22                	jmp    a96 <morecore+0x56>
  hp = (Header*)p;
 a74:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a77:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a7d:	8b 55 08             	mov    0x8(%ebp),%edx
 a80:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a83:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a86:	83 c0 08             	add    $0x8,%eax
 a89:	89 04 24             	mov    %eax,(%esp)
 a8c:	e8 ce fe ff ff       	call   95f <free>
  return freep;
 a91:	a1 b0 14 00 00       	mov    0x14b0,%eax
}
 a96:	c9                   	leave  
 a97:	c3                   	ret    

00000a98 <malloc>:

void*
malloc(uint nbytes)
{
 a98:	55                   	push   %ebp
 a99:	89 e5                	mov    %esp,%ebp
 a9b:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a9e:	8b 45 08             	mov    0x8(%ebp),%eax
 aa1:	83 c0 07             	add    $0x7,%eax
 aa4:	c1 e8 03             	shr    $0x3,%eax
 aa7:	83 c0 01             	add    $0x1,%eax
 aaa:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 aad:	a1 b0 14 00 00       	mov    0x14b0,%eax
 ab2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ab5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 ab9:	75 23                	jne    ade <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 abb:	c7 45 f0 a8 14 00 00 	movl   $0x14a8,-0x10(%ebp)
 ac2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac5:	a3 b0 14 00 00       	mov    %eax,0x14b0
 aca:	a1 b0 14 00 00       	mov    0x14b0,%eax
 acf:	a3 a8 14 00 00       	mov    %eax,0x14a8
    base.s.size = 0;
 ad4:	c7 05 ac 14 00 00 00 	movl   $0x0,0x14ac
 adb:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ade:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ae1:	8b 00                	mov    (%eax),%eax
 ae3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 ae6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae9:	8b 40 04             	mov    0x4(%eax),%eax
 aec:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 aef:	72 4d                	jb     b3e <malloc+0xa6>
      if(p->s.size == nunits)
 af1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af4:	8b 40 04             	mov    0x4(%eax),%eax
 af7:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 afa:	75 0c                	jne    b08 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 afc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aff:	8b 10                	mov    (%eax),%edx
 b01:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b04:	89 10                	mov    %edx,(%eax)
 b06:	eb 26                	jmp    b2e <malloc+0x96>
      else {
        p->s.size -= nunits;
 b08:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b0b:	8b 40 04             	mov    0x4(%eax),%eax
 b0e:	2b 45 ec             	sub    -0x14(%ebp),%eax
 b11:	89 c2                	mov    %eax,%edx
 b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b16:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 b19:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b1c:	8b 40 04             	mov    0x4(%eax),%eax
 b1f:	c1 e0 03             	shl    $0x3,%eax
 b22:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 b25:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b28:	8b 55 ec             	mov    -0x14(%ebp),%edx
 b2b:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 b2e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b31:	a3 b0 14 00 00       	mov    %eax,0x14b0
      return (void*)(p + 1);
 b36:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b39:	83 c0 08             	add    $0x8,%eax
 b3c:	eb 38                	jmp    b76 <malloc+0xde>
    }
    if(p == freep)
 b3e:	a1 b0 14 00 00       	mov    0x14b0,%eax
 b43:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 b46:	75 1b                	jne    b63 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 b48:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b4b:	89 04 24             	mov    %eax,(%esp)
 b4e:	e8 ed fe ff ff       	call   a40 <morecore>
 b53:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b56:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b5a:	75 07                	jne    b63 <malloc+0xcb>
        return 0;
 b5c:	b8 00 00 00 00       	mov    $0x0,%eax
 b61:	eb 13                	jmp    b76 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b63:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b66:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b69:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b6c:	8b 00                	mov    (%eax),%eax
 b6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b71:	e9 70 ff ff ff       	jmp    ae6 <malloc+0x4e>
}
 b76:	c9                   	leave  
 b77:	c3                   	ret    

00000b78 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 b78:	55                   	push   %ebp
 b79:	89 e5                	mov    %esp,%ebp
 b7b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 b7e:	8b 55 08             	mov    0x8(%ebp),%edx
 b81:	8b 45 0c             	mov    0xc(%ebp),%eax
 b84:	8b 4d 08             	mov    0x8(%ebp),%ecx
 b87:	f0 87 02             	lock xchg %eax,(%edx)
 b8a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 b8d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 b90:	c9                   	leave  
 b91:	c3                   	ret    

00000b92 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 b92:	55                   	push   %ebp
 b93:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 b95:	8b 45 08             	mov    0x8(%ebp),%eax
 b98:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 b9e:	5d                   	pop    %ebp
 b9f:	c3                   	ret    

00000ba0 <lock_acquire>:
void lock_acquire(lock_t *lock){
 ba0:	55                   	push   %ebp
 ba1:	89 e5                	mov    %esp,%ebp
 ba3:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 ba6:	90                   	nop
 ba7:	8b 45 08             	mov    0x8(%ebp),%eax
 baa:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 bb1:	00 
 bb2:	89 04 24             	mov    %eax,(%esp)
 bb5:	e8 be ff ff ff       	call   b78 <xchg>
 bba:	85 c0                	test   %eax,%eax
 bbc:	75 e9                	jne    ba7 <lock_acquire+0x7>
}
 bbe:	c9                   	leave  
 bbf:	c3                   	ret    

00000bc0 <lock_release>:
void lock_release(lock_t *lock){
 bc0:	55                   	push   %ebp
 bc1:	89 e5                	mov    %esp,%ebp
 bc3:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 bc6:	8b 45 08             	mov    0x8(%ebp),%eax
 bc9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 bd0:	00 
 bd1:	89 04 24             	mov    %eax,(%esp)
 bd4:	e8 9f ff ff ff       	call   b78 <xchg>
}
 bd9:	c9                   	leave  
 bda:	c3                   	ret    

00000bdb <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 bdb:	55                   	push   %ebp
 bdc:	89 e5                	mov    %esp,%ebp
 bde:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 be1:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 be8:	e8 ab fe ff ff       	call   a98 <malloc>
 bed:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 bf0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf3:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 bf6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf9:	25 ff 0f 00 00       	and    $0xfff,%eax
 bfe:	85 c0                	test   %eax,%eax
 c00:	74 14                	je     c16 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 c02:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c05:	25 ff 0f 00 00       	and    $0xfff,%eax
 c0a:	89 c2                	mov    %eax,%edx
 c0c:	b8 00 10 00 00       	mov    $0x1000,%eax
 c11:	29 d0                	sub    %edx,%eax
 c13:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 c16:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 c1a:	75 1b                	jne    c37 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 c1c:	c7 44 24 04 54 10 00 	movl   $0x1054,0x4(%esp)
 c23:	00 
 c24:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c2b:	e8 7c fb ff ff       	call   7ac <printf>
        return 0;
 c30:	b8 00 00 00 00       	mov    $0x0,%eax
 c35:	eb 6f                	jmp    ca6 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 c37:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 c3a:	8b 55 08             	mov    0x8(%ebp),%edx
 c3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c40:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 c44:	89 54 24 08          	mov    %edx,0x8(%esp)
 c48:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 c4f:	00 
 c50:	89 04 24             	mov    %eax,(%esp)
 c53:	e8 4c fa ff ff       	call   6a4 <clone>
 c58:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 c5b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c5f:	79 1b                	jns    c7c <thread_create+0xa1>
        printf(1,"clone fails\n");
 c61:	c7 44 24 04 62 10 00 	movl   $0x1062,0x4(%esp)
 c68:	00 
 c69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c70:	e8 37 fb ff ff       	call   7ac <printf>
        return 0;
 c75:	b8 00 00 00 00       	mov    $0x0,%eax
 c7a:	eb 2a                	jmp    ca6 <thread_create+0xcb>
    }
    if(tid > 0){
 c7c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c80:	7e 05                	jle    c87 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 c82:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c85:	eb 1f                	jmp    ca6 <thread_create+0xcb>
    }
    if(tid == 0){
 c87:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c8b:	75 14                	jne    ca1 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 c8d:	c7 44 24 04 6f 10 00 	movl   $0x106f,0x4(%esp)
 c94:	00 
 c95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c9c:	e8 0b fb ff ff       	call   7ac <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 ca1:	b8 00 00 00 00       	mov    $0x0,%eax
}
 ca6:	c9                   	leave  
 ca7:	c3                   	ret    

00000ca8 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 ca8:	55                   	push   %ebp
 ca9:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 cab:	8b 45 08             	mov    0x8(%ebp),%eax
 cae:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 cb4:	8b 45 08             	mov    0x8(%ebp),%eax
 cb7:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 cbe:	8b 45 08             	mov    0x8(%ebp),%eax
 cc1:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 cc8:	5d                   	pop    %ebp
 cc9:	c3                   	ret    

00000cca <add_q>:

void add_q(struct queue *q, int v){
 cca:	55                   	push   %ebp
 ccb:	89 e5                	mov    %esp,%ebp
 ccd:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 cd0:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 cd7:	e8 bc fd ff ff       	call   a98 <malloc>
 cdc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 cdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ce2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 ce9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cec:	8b 55 0c             	mov    0xc(%ebp),%edx
 cef:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 cf1:	8b 45 08             	mov    0x8(%ebp),%eax
 cf4:	8b 40 04             	mov    0x4(%eax),%eax
 cf7:	85 c0                	test   %eax,%eax
 cf9:	75 0b                	jne    d06 <add_q+0x3c>
        q->head = n;
 cfb:	8b 45 08             	mov    0x8(%ebp),%eax
 cfe:	8b 55 f4             	mov    -0xc(%ebp),%edx
 d01:	89 50 04             	mov    %edx,0x4(%eax)
 d04:	eb 0c                	jmp    d12 <add_q+0x48>
    }else{
        q->tail->next = n;
 d06:	8b 45 08             	mov    0x8(%ebp),%eax
 d09:	8b 40 08             	mov    0x8(%eax),%eax
 d0c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 d0f:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 d12:	8b 45 08             	mov    0x8(%ebp),%eax
 d15:	8b 55 f4             	mov    -0xc(%ebp),%edx
 d18:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 d1b:	8b 45 08             	mov    0x8(%ebp),%eax
 d1e:	8b 00                	mov    (%eax),%eax
 d20:	8d 50 01             	lea    0x1(%eax),%edx
 d23:	8b 45 08             	mov    0x8(%ebp),%eax
 d26:	89 10                	mov    %edx,(%eax)
}
 d28:	c9                   	leave  
 d29:	c3                   	ret    

00000d2a <empty_q>:

int empty_q(struct queue *q){
 d2a:	55                   	push   %ebp
 d2b:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 d2d:	8b 45 08             	mov    0x8(%ebp),%eax
 d30:	8b 00                	mov    (%eax),%eax
 d32:	85 c0                	test   %eax,%eax
 d34:	75 07                	jne    d3d <empty_q+0x13>
        return 1;
 d36:	b8 01 00 00 00       	mov    $0x1,%eax
 d3b:	eb 05                	jmp    d42 <empty_q+0x18>
    else
        return 0;
 d3d:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 d42:	5d                   	pop    %ebp
 d43:	c3                   	ret    

00000d44 <pop_q>:
int pop_q(struct queue *q){
 d44:	55                   	push   %ebp
 d45:	89 e5                	mov    %esp,%ebp
 d47:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 d4a:	8b 45 08             	mov    0x8(%ebp),%eax
 d4d:	89 04 24             	mov    %eax,(%esp)
 d50:	e8 d5 ff ff ff       	call   d2a <empty_q>
 d55:	85 c0                	test   %eax,%eax
 d57:	75 5d                	jne    db6 <pop_q+0x72>
       val = q->head->value; 
 d59:	8b 45 08             	mov    0x8(%ebp),%eax
 d5c:	8b 40 04             	mov    0x4(%eax),%eax
 d5f:	8b 00                	mov    (%eax),%eax
 d61:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 d64:	8b 45 08             	mov    0x8(%ebp),%eax
 d67:	8b 40 04             	mov    0x4(%eax),%eax
 d6a:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 d6d:	8b 45 08             	mov    0x8(%ebp),%eax
 d70:	8b 40 04             	mov    0x4(%eax),%eax
 d73:	8b 50 04             	mov    0x4(%eax),%edx
 d76:	8b 45 08             	mov    0x8(%ebp),%eax
 d79:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 d7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d7f:	89 04 24             	mov    %eax,(%esp)
 d82:	e8 d8 fb ff ff       	call   95f <free>
       q->size--;
 d87:	8b 45 08             	mov    0x8(%ebp),%eax
 d8a:	8b 00                	mov    (%eax),%eax
 d8c:	8d 50 ff             	lea    -0x1(%eax),%edx
 d8f:	8b 45 08             	mov    0x8(%ebp),%eax
 d92:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 d94:	8b 45 08             	mov    0x8(%ebp),%eax
 d97:	8b 00                	mov    (%eax),%eax
 d99:	85 c0                	test   %eax,%eax
 d9b:	75 14                	jne    db1 <pop_q+0x6d>
            q->head = 0;
 d9d:	8b 45 08             	mov    0x8(%ebp),%eax
 da0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 da7:	8b 45 08             	mov    0x8(%ebp),%eax
 daa:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 db1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 db4:	eb 05                	jmp    dbb <pop_q+0x77>
    }
    return -1;
 db6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 dbb:	c9                   	leave  
 dbc:	c3                   	ret    

00000dbd <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 dbd:	55                   	push   %ebp
 dbe:	89 e5                	mov    %esp,%ebp
 dc0:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 dc3:	8b 45 08             	mov    0x8(%ebp),%eax
 dc6:	8b 55 0c             	mov    0xc(%ebp),%edx
 dc9:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 dcc:	8b 45 08             	mov    0x8(%ebp),%eax
 dcf:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 dd6:	8b 45 08             	mov    0x8(%ebp),%eax
 dd9:	89 04 24             	mov    %eax,(%esp)
 ddc:	e8 b1 fd ff ff       	call   b92 <lock_init>
}
 de1:	c9                   	leave  
 de2:	c3                   	ret    

00000de3 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 de3:	55                   	push   %ebp
 de4:	89 e5                	mov    %esp,%ebp
 de6:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 de9:	8b 45 08             	mov    0x8(%ebp),%eax
 dec:	89 04 24             	mov    %eax,(%esp)
 def:	e8 ac fd ff ff       	call   ba0 <lock_acquire>
	if(s->count  == 0){
 df4:	8b 45 08             	mov    0x8(%ebp),%eax
 df7:	8b 40 04             	mov    0x4(%eax),%eax
 dfa:	85 c0                	test   %eax,%eax
 dfc:	75 43                	jne    e41 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 dfe:	c7 44 24 04 80 10 00 	movl   $0x1080,0x4(%esp)
 e05:	00 
 e06:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 e0d:	e8 9a f9 ff ff       	call   7ac <printf>
		//add proc to waiters list
		int tid = getpid();
 e12:	e8 6d f8 ff ff       	call   684 <getpid>
 e17:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 e1a:	8b 45 08             	mov    0x8(%ebp),%eax
 e1d:	8d 50 0c             	lea    0xc(%eax),%edx
 e20:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e23:	89 44 24 04          	mov    %eax,0x4(%esp)
 e27:	89 14 24             	mov    %edx,(%esp)
 e2a:	e8 9b fe ff ff       	call   cca <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 e2f:	8b 45 08             	mov    0x8(%ebp),%eax
 e32:	89 04 24             	mov    %eax,(%esp)
 e35:	e8 86 fd ff ff       	call   bc0 <lock_release>
		tsleep(); 
 e3a:	e8 75 f8 ff ff       	call   6b4 <tsleep>
 e3f:	eb 2e                	jmp    e6f <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 e41:	c7 44 24 04 87 10 00 	movl   $0x1087,0x4(%esp)
 e48:	00 
 e49:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 e50:	e8 57 f9 ff ff       	call   7ac <printf>
		s->count--;	
 e55:	8b 45 08             	mov    0x8(%ebp),%eax
 e58:	8b 40 04             	mov    0x4(%eax),%eax
 e5b:	8d 50 ff             	lea    -0x1(%eax),%edx
 e5e:	8b 45 08             	mov    0x8(%ebp),%eax
 e61:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 e64:	8b 45 08             	mov    0x8(%ebp),%eax
 e67:	89 04 24             	mov    %eax,(%esp)
 e6a:	e8 51 fd ff ff       	call   bc0 <lock_release>
	}
}
 e6f:	c9                   	leave  
 e70:	c3                   	ret    

00000e71 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 e71:	55                   	push   %ebp
 e72:	89 e5                	mov    %esp,%ebp
 e74:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 e77:	c7 44 24 04 8e 10 00 	movl   $0x108e,0x4(%esp)
 e7e:	00 
 e7f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 e86:	e8 21 f9 ff ff       	call   7ac <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 e8b:	8b 45 08             	mov    0x8(%ebp),%eax
 e8e:	89 04 24             	mov    %eax,(%esp)
 e91:	e8 0a fd ff ff       	call   ba0 <lock_acquire>
	if(s->count < s->size){
 e96:	8b 45 08             	mov    0x8(%ebp),%eax
 e99:	8b 50 04             	mov    0x4(%eax),%edx
 e9c:	8b 45 08             	mov    0x8(%ebp),%eax
 e9f:	8b 40 08             	mov    0x8(%eax),%eax
 ea2:	39 c2                	cmp    %eax,%edx
 ea4:	7d 0f                	jge    eb5 <sem_signal+0x44>
		s->count++;	
 ea6:	8b 45 08             	mov    0x8(%ebp),%eax
 ea9:	8b 40 04             	mov    0x4(%eax),%eax
 eac:	8d 50 01             	lea    0x1(%eax),%edx
 eaf:	8b 45 08             	mov    0x8(%ebp),%eax
 eb2:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 eb5:	8b 45 08             	mov    0x8(%ebp),%eax
 eb8:	83 c0 0c             	add    $0xc,%eax
 ebb:	89 04 24             	mov    %eax,(%esp)
 ebe:	e8 81 fe ff ff       	call   d44 <pop_q>
 ec3:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 ec6:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 eca:	74 2e                	je     efa <sem_signal+0x89>
		printf(1, "Sem A\n");
 ecc:	c7 44 24 04 87 10 00 	movl   $0x1087,0x4(%esp)
 ed3:	00 
 ed4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 edb:	e8 cc f8 ff ff       	call   7ac <printf>
		twakeup(tid);
 ee0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ee3:	89 04 24             	mov    %eax,(%esp)
 ee6:	e8 d1 f7 ff ff       	call   6bc <twakeup>
		s->count--;
 eeb:	8b 45 08             	mov    0x8(%ebp),%eax
 eee:	8b 40 04             	mov    0x4(%eax),%eax
 ef1:	8d 50 ff             	lea    -0x1(%eax),%edx
 ef4:	8b 45 08             	mov    0x8(%ebp),%eax
 ef7:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 efa:	8b 45 08             	mov    0x8(%ebp),%eax
 efd:	89 04 24             	mov    %eax,(%esp)
 f00:	e8 bb fc ff ff       	call   bc0 <lock_release>

 f05:	c9                   	leave  
 f06:	c3                   	ret    
