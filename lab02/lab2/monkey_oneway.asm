
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
	sem_init(&wait_tree, 3);
   9:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
  10:	00 
  11:	c7 04 24 20 16 00 00 	movl   $0x1620,(%esp)
  18:	e8 66 0e 00 00       	call   e83 <sem_init>
	sem_init(&mutex1, 1);
  1d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  24:	00 
  25:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
  2c:	e8 52 0e 00 00       	call   e83 <sem_init>
  sem_init(&mutex2, 1);
  31:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  38:	00 
  39:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
  40:	e8 3e 0e 00 00       	call   e83 <sem_init>
  sem_init(&mutex3, 1);
  45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
  54:	e8 2a 0e 00 00       	call   e83 <sem_init>
  sem_init(&climb, 1);
  59:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  60:	00 
  61:	c7 04 24 60 15 00 00 	movl   $0x1560,(%esp)
  68:	e8 16 0e 00 00       	call   e83 <sem_init>
  sem_init(&printer, 1);
  6d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  74:	00 
  75:	c7 04 24 a0 15 00 00 	movl   $0x15a0,(%esp)
  7c:	e8 02 0e 00 00       	call   e83 <sem_init>
  sem_init(&printer_mutex1, 1);
  81:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  88:	00 
  89:	c7 04 24 60 16 00 00 	movl   $0x1660,(%esp)
  90:	e8 ee 0d 00 00       	call   e83 <sem_init>
  sem_init(&printer_mutex2, 1);
  95:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  9c:	00 
  9d:	c7 04 24 a0 16 00 00 	movl   $0x16a0,(%esp)
  a4:	e8 da 0d 00 00       	call   e83 <sem_init>
	
  printf(1,"Creating %d Monkeys\n\n", number_of_monkeys);
  a9:	a1 10 15 00 00       	mov    0x1510,%eax
  ae:	89 44 24 08          	mov    %eax,0x8(%esp)
  b2:	c7 44 24 04 b8 0f 00 	movl   $0xfb8,0x4(%esp)
  b9:	00 
  ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c1:	e8 81 07 00 00       	call   847 <printf>

	int i;
	for(i = 0; i < number_of_monkeys; i++) thread_create(monkey, 0);
  c6:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  cd:	00 
  ce:	eb 19                	jmp    e9 <main+0xe9>
  d0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  d7:	00 
  d8:	c7 04 24 17 01 00 00 	movl   $0x117,(%esp)
  df:	e8 92 0b 00 00       	call   c76 <thread_create>
  e4:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  e9:	a1 10 15 00 00       	mov    0x1510,%eax
  ee:	39 44 24 1c          	cmp    %eax,0x1c(%esp)
  f2:	7c dc                	jl     d0 <main+0xd0>
    while(wait() > 0);
  f4:	90                   	nop
  f5:	e8 ad 05 00 00       	call   6a7 <wait>
  fa:	85 c0                	test   %eax,%eax
  fc:	7f f7                	jg     f5 <main+0xf5>
	printf(1,"All monkeys are full\n");
  fe:	c7 44 24 04 ce 0f 00 	movl   $0xfce,0x4(%esp)
 105:	00 
 106:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 10d:	e8 35 07 00 00       	call   847 <printf>
	exit();
 112:	e8 88 05 00 00       	call   69f <exit>

00000117 <monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
 117:	55                   	push   %ebp
 118:	89 e5                	mov    %esp,%ebp
 11a:	83 ec 28             	sub    $0x28,%esp
  int pid =  getpid();
 11d:	e8 fd 05 00 00       	call   71f <getpid>
 122:	89 45 f4             	mov    %eax,-0xc(%ebp)

  sem_aquire(&printer_mutex1);
 125:	c7 04 24 60 16 00 00 	movl   $0x1660,(%esp)
 12c:	e8 9d 0d 00 00       	call   ece <sem_aquire>
  printMessage(pid, 1);
 131:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 138:	00 
 139:	8b 45 f4             	mov    -0xc(%ebp),%eax
 13c:	89 04 24             	mov    %eax,(%esp)
 13f:	e8 d2 01 00 00       	call   316 <printMessage>
  sem_aquire(&wait_tree);
 144:	c7 04 24 20 16 00 00 	movl   $0x1620,(%esp)
 14b:	e8 7e 0d 00 00       	call   ece <sem_aquire>

  //climb_tree
  sem_aquire(&mutex1);
 150:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
 157:	e8 72 0d 00 00       	call   ece <sem_aquire>
  movingup++;
 15c:	a1 40 15 00 00       	mov    0x1540,%eax
 161:	83 c0 01             	add    $0x1,%eax
 164:	a3 40 15 00 00       	mov    %eax,0x1540
  if(movingup==1)	sem_aquire(&climb);
 169:	a1 40 15 00 00       	mov    0x1540,%eax
 16e:	83 f8 01             	cmp    $0x1,%eax
 171:	75 0c                	jne    17f <monkey+0x68>
 173:	c7 04 24 60 15 00 00 	movl   $0x1560,(%esp)
 17a:	e8 4f 0d 00 00       	call   ece <sem_aquire>
  sem_signal(&mutex1);
 17f:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
 186:	e8 a9 0d 00 00       	call   f34 <sem_signal>

  sem_aquire(&mutex3);
 18b:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
 192:	e8 37 0d 00 00       	call   ece <sem_aquire>
  monkeys_on_tree++;
 197:	a1 48 15 00 00       	mov    0x1548,%eax
 19c:	83 c0 01             	add    $0x1,%eax
 19f:	a3 48 15 00 00       	mov    %eax,0x1548
  sem_signal(&mutex3); 
 1a4:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
 1ab:	e8 84 0d 00 00       	call   f34 <sem_signal>

  printMessage(pid, 2); 
 1b0:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 1b7:	00 
 1b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1bb:	89 04 24             	mov    %eax,(%esp)
 1be:	e8 53 01 00 00       	call   316 <printMessage>
  sem_signal(&printer_mutex1); 
 1c3:	c7 04 24 60 16 00 00 	movl   $0x1660,(%esp)
 1ca:	e8 65 0d 00 00       	call   f34 <sem_signal>

  // Get coconut
  sleep(100); 
 1cf:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1d6:	e8 54 05 00 00       	call   72f <sleep>

  sem_aquire(&mutex3);
 1db:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
 1e2:	e8 e7 0c 00 00       	call   ece <sem_aquire>
  printMessage(pid, 6); // Got a coconut
 1e7:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
 1ee:	00 
 1ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1f2:	89 04 24             	mov    %eax,(%esp)
 1f5:	e8 1c 01 00 00       	call   316 <printMessage>
  sem_signal(&mutex3); 
 1fa:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
 201:	e8 2e 0d 00 00       	call   f34 <sem_signal>

  //got coconut
  sem_aquire(&mutex1);
 206:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
 20d:	e8 bc 0c 00 00       	call   ece <sem_aquire>
  movingup--;
 212:	a1 40 15 00 00       	mov    0x1540,%eax
 217:	83 e8 01             	sub    $0x1,%eax
 21a:	a3 40 15 00 00       	mov    %eax,0x1540
  if(movingup==0)	sem_signal(&climb);
 21f:	a1 40 15 00 00       	mov    0x1540,%eax
 224:	85 c0                	test   %eax,%eax
 226:	75 0c                	jne    234 <monkey+0x11d>
 228:	c7 04 24 60 15 00 00 	movl   $0x1560,(%esp)
 22f:	e8 00 0d 00 00       	call   f34 <sem_signal>
  sem_signal(&mutex1);
 234:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
 23b:	e8 f4 0c 00 00       	call   f34 <sem_signal>


  // Climb Down
  sem_aquire(&mutex2);
 240:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
 247:	e8 82 0c 00 00       	call   ece <sem_aquire>
  movingdown++;
 24c:	a1 44 15 00 00       	mov    0x1544,%eax
 251:	83 c0 01             	add    $0x1,%eax
 254:	a3 44 15 00 00       	mov    %eax,0x1544
  if(movingdown == 1)	sem_aquire(&climb);
 259:	a1 44 15 00 00       	mov    0x1544,%eax
 25e:	83 f8 01             	cmp    $0x1,%eax
 261:	75 0c                	jne    26f <monkey+0x158>
 263:	c7 04 24 60 15 00 00 	movl   $0x1560,(%esp)
 26a:	e8 5f 0c 00 00       	call   ece <sem_aquire>
  sem_signal(&mutex2);
 26f:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
 276:	e8 b9 0c 00 00       	call   f34 <sem_signal>

  //printMessage(pid, 3); //Climbing down tree
  // Climb Down


  sem_aquire(&printer_mutex2);
 27b:	c7 04 24 a0 16 00 00 	movl   $0x16a0,(%esp)
 282:	e8 47 0c 00 00       	call   ece <sem_aquire>
  //printMessage(pid, 5); // On the ground


  sem_aquire(&mutex2);
 287:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
 28e:	e8 3b 0c 00 00       	call   ece <sem_aquire>
  movingdown--;
 293:	a1 44 15 00 00       	mov    0x1544,%eax
 298:	83 e8 01             	sub    $0x1,%eax
 29b:	a3 44 15 00 00       	mov    %eax,0x1544

  sem_aquire(&mutex3);
 2a0:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
 2a7:	e8 22 0c 00 00       	call   ece <sem_aquire>
  monkeys_on_tree--;
 2ac:	a1 48 15 00 00       	mov    0x1548,%eax
 2b1:	83 e8 01             	sub    $0x1,%eax
 2b4:	a3 48 15 00 00       	mov    %eax,0x1548
  sem_signal(&mutex3); 
 2b9:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
 2c0:	e8 6f 0c 00 00       	call   f34 <sem_signal>

  printMessage(pid, 3); // Eating Banana
 2c5:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
 2cc:	00 
 2cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d0:	89 04 24             	mov    %eax,(%esp)
 2d3:	e8 3e 00 00 00       	call   316 <printMessage>
  if(movingdown == 0) sem_signal(&climb);
 2d8:	a1 44 15 00 00       	mov    0x1544,%eax
 2dd:	85 c0                	test   %eax,%eax
 2df:	75 0c                	jne    2ed <monkey+0x1d6>
 2e1:	c7 04 24 60 15 00 00 	movl   $0x1560,(%esp)
 2e8:	e8 47 0c 00 00       	call   f34 <sem_signal>
  sem_signal(&mutex2);
 2ed:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
 2f4:	e8 3b 0c 00 00       	call   f34 <sem_signal>

  sem_signal(&wait_tree);
 2f9:	c7 04 24 20 16 00 00 	movl   $0x1620,(%esp)
 300:	e8 2f 0c 00 00       	call   f34 <sem_signal>
  sem_signal(&printer_mutex2); 
 305:	c7 04 24 a0 16 00 00 	movl   $0x16a0,(%esp)
 30c:	e8 23 0c 00 00       	call   f34 <sem_signal>
  texit();
 311:	e8 31 04 00 00       	call   747 <texit>

00000316 <printMessage>:
}

void printMessage(int pid, int state){
 316:	55                   	push   %ebp
 317:	89 e5                	mov    %esp,%ebp
 319:	83 ec 18             	sub    $0x18,%esp
  sem_aquire(&printer);
 31c:	c7 04 24 a0 15 00 00 	movl   $0x15a0,(%esp)
 323:	e8 a6 0b 00 00       	call   ece <sem_aquire>
  printf(1, "Monkey(%d)",pid);
 328:	8b 45 08             	mov    0x8(%ebp),%eax
 32b:	89 44 24 08          	mov    %eax,0x8(%esp)
 32f:	c7 44 24 04 e4 0f 00 	movl   $0xfe4,0x4(%esp)
 336:	00 
 337:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 33e:	e8 04 05 00 00       	call   847 <printf>
  //printf(1, " - %d", state); 
  switch(state){
 343:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
 347:	0f 87 bf 00 00 00    	ja     40c <printMessage+0xf6>
 34d:	8b 45 0c             	mov    0xc(%ebp),%eax
 350:	c1 e0 02             	shl    $0x2,%eax
 353:	05 80 10 00 00       	add    $0x1080,%eax
 358:	8b 00                	mov    (%eax),%eax
 35a:	ff e0                	jmp    *%eax
    case(1):
      printf(1, " Waiting  to  climb", state); 
 35c:	8b 45 0c             	mov    0xc(%ebp),%eax
 35f:	89 44 24 08          	mov    %eax,0x8(%esp)
 363:	c7 44 24 04 ef 0f 00 	movl   $0xfef,0x4(%esp)
 36a:	00 
 36b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 372:	e8 d0 04 00 00       	call   847 <printf>
      break;
 377:	e9 90 00 00 00       	jmp    40c <printMessage+0xf6>
    case(2):
      printf(1, " Climbing  up  tree", state); 
 37c:	8b 45 0c             	mov    0xc(%ebp),%eax
 37f:	89 44 24 08          	mov    %eax,0x8(%esp)
 383:	c7 44 24 04 03 10 00 	movl   $0x1003,0x4(%esp)
 38a:	00 
 38b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 392:	e8 b0 04 00 00       	call   847 <printf>
      break;
 397:	eb 73                	jmp    40c <printMessage+0xf6>
    case(3):
      printf(1, " Climbing down tree", state); 
 399:	8b 45 0c             	mov    0xc(%ebp),%eax
 39c:	89 44 24 08          	mov    %eax,0x8(%esp)
 3a0:	c7 44 24 04 17 10 00 	movl   $0x1017,0x4(%esp)
 3a7:	00 
 3a8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3af:	e8 93 04 00 00       	call   847 <printf>
      break;
 3b4:	eb 56                	jmp    40c <printMessage+0xf6>
    case(4):
      printf(1, " Eating the  banana", state); 
 3b6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3b9:	89 44 24 08          	mov    %eax,0x8(%esp)
 3bd:	c7 44 24 04 2b 10 00 	movl   $0x102b,0x4(%esp)
 3c4:	00 
 3c5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3cc:	e8 76 04 00 00       	call   847 <printf>
      break;
 3d1:	eb 39                	jmp    40c <printMessage+0xf6>
    case(5):
      printf(1, " On the ground safe", state); 
 3d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d6:	89 44 24 08          	mov    %eax,0x8(%esp)
 3da:	c7 44 24 04 3f 10 00 	movl   $0x103f,0x4(%esp)
 3e1:	00 
 3e2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3e9:	e8 59 04 00 00       	call   847 <printf>
      break;
 3ee:	eb 1c                	jmp    40c <printMessage+0xf6>
    case(6):
      printf(1, " Alright a  coconut", state); 
 3f0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f3:	89 44 24 08          	mov    %eax,0x8(%esp)
 3f7:	c7 44 24 04 53 10 00 	movl   $0x1053,0x4(%esp)
 3fe:	00 
 3ff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 406:	e8 3c 04 00 00       	call   847 <printf>
      break;
 40b:	90                   	nop
  }
  printf(1, " - Monkeys on tree: %d\n", monkeys_on_tree);  
 40c:	a1 48 15 00 00       	mov    0x1548,%eax
 411:	89 44 24 08          	mov    %eax,0x8(%esp)
 415:	c7 44 24 04 67 10 00 	movl   $0x1067,0x4(%esp)
 41c:	00 
 41d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 424:	e8 1e 04 00 00       	call   847 <printf>
  //printf(1, " - movingup: %d", movingup);   
  //printf(1, " - movingdown: %d\n", movingdown);  
  sem_signal(&printer);
 429:	c7 04 24 a0 15 00 00 	movl   $0x15a0,(%esp)
 430:	e8 ff 0a 00 00       	call   f34 <sem_signal>
  
 435:	c9                   	leave  
 436:	c3                   	ret    

00000437 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	57                   	push   %edi
 43b:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 43c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 43f:	8b 55 10             	mov    0x10(%ebp),%edx
 442:	8b 45 0c             	mov    0xc(%ebp),%eax
 445:	89 cb                	mov    %ecx,%ebx
 447:	89 df                	mov    %ebx,%edi
 449:	89 d1                	mov    %edx,%ecx
 44b:	fc                   	cld    
 44c:	f3 aa                	rep stos %al,%es:(%edi)
 44e:	89 ca                	mov    %ecx,%edx
 450:	89 fb                	mov    %edi,%ebx
 452:	89 5d 08             	mov    %ebx,0x8(%ebp)
 455:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 458:	5b                   	pop    %ebx
 459:	5f                   	pop    %edi
 45a:	5d                   	pop    %ebp
 45b:	c3                   	ret    

0000045c <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 45c:	55                   	push   %ebp
 45d:	89 e5                	mov    %esp,%ebp
 45f:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 462:	8b 45 08             	mov    0x8(%ebp),%eax
 465:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 468:	90                   	nop
 469:	8b 45 08             	mov    0x8(%ebp),%eax
 46c:	8d 50 01             	lea    0x1(%eax),%edx
 46f:	89 55 08             	mov    %edx,0x8(%ebp)
 472:	8b 55 0c             	mov    0xc(%ebp),%edx
 475:	8d 4a 01             	lea    0x1(%edx),%ecx
 478:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 47b:	0f b6 12             	movzbl (%edx),%edx
 47e:	88 10                	mov    %dl,(%eax)
 480:	0f b6 00             	movzbl (%eax),%eax
 483:	84 c0                	test   %al,%al
 485:	75 e2                	jne    469 <strcpy+0xd>
    ;
  return os;
 487:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 48a:	c9                   	leave  
 48b:	c3                   	ret    

0000048c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 48c:	55                   	push   %ebp
 48d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 48f:	eb 08                	jmp    499 <strcmp+0xd>
    p++, q++;
 491:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 495:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 499:	8b 45 08             	mov    0x8(%ebp),%eax
 49c:	0f b6 00             	movzbl (%eax),%eax
 49f:	84 c0                	test   %al,%al
 4a1:	74 10                	je     4b3 <strcmp+0x27>
 4a3:	8b 45 08             	mov    0x8(%ebp),%eax
 4a6:	0f b6 10             	movzbl (%eax),%edx
 4a9:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ac:	0f b6 00             	movzbl (%eax),%eax
 4af:	38 c2                	cmp    %al,%dl
 4b1:	74 de                	je     491 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 4b3:	8b 45 08             	mov    0x8(%ebp),%eax
 4b6:	0f b6 00             	movzbl (%eax),%eax
 4b9:	0f b6 d0             	movzbl %al,%edx
 4bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 4bf:	0f b6 00             	movzbl (%eax),%eax
 4c2:	0f b6 c0             	movzbl %al,%eax
 4c5:	29 c2                	sub    %eax,%edx
 4c7:	89 d0                	mov    %edx,%eax
}
 4c9:	5d                   	pop    %ebp
 4ca:	c3                   	ret    

000004cb <strlen>:

uint
strlen(char *s)
{
 4cb:	55                   	push   %ebp
 4cc:	89 e5                	mov    %esp,%ebp
 4ce:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 4d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 4d8:	eb 04                	jmp    4de <strlen+0x13>
 4da:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 4de:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4e1:	8b 45 08             	mov    0x8(%ebp),%eax
 4e4:	01 d0                	add    %edx,%eax
 4e6:	0f b6 00             	movzbl (%eax),%eax
 4e9:	84 c0                	test   %al,%al
 4eb:	75 ed                	jne    4da <strlen+0xf>
    ;
  return n;
 4ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4f0:	c9                   	leave  
 4f1:	c3                   	ret    

000004f2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4f2:	55                   	push   %ebp
 4f3:	89 e5                	mov    %esp,%ebp
 4f5:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 4f8:	8b 45 10             	mov    0x10(%ebp),%eax
 4fb:	89 44 24 08          	mov    %eax,0x8(%esp)
 4ff:	8b 45 0c             	mov    0xc(%ebp),%eax
 502:	89 44 24 04          	mov    %eax,0x4(%esp)
 506:	8b 45 08             	mov    0x8(%ebp),%eax
 509:	89 04 24             	mov    %eax,(%esp)
 50c:	e8 26 ff ff ff       	call   437 <stosb>
  return dst;
 511:	8b 45 08             	mov    0x8(%ebp),%eax
}
 514:	c9                   	leave  
 515:	c3                   	ret    

00000516 <strchr>:

char*
strchr(const char *s, char c)
{
 516:	55                   	push   %ebp
 517:	89 e5                	mov    %esp,%ebp
 519:	83 ec 04             	sub    $0x4,%esp
 51c:	8b 45 0c             	mov    0xc(%ebp),%eax
 51f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 522:	eb 14                	jmp    538 <strchr+0x22>
    if(*s == c)
 524:	8b 45 08             	mov    0x8(%ebp),%eax
 527:	0f b6 00             	movzbl (%eax),%eax
 52a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 52d:	75 05                	jne    534 <strchr+0x1e>
      return (char*)s;
 52f:	8b 45 08             	mov    0x8(%ebp),%eax
 532:	eb 13                	jmp    547 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 534:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 538:	8b 45 08             	mov    0x8(%ebp),%eax
 53b:	0f b6 00             	movzbl (%eax),%eax
 53e:	84 c0                	test   %al,%al
 540:	75 e2                	jne    524 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 542:	b8 00 00 00 00       	mov    $0x0,%eax
}
 547:	c9                   	leave  
 548:	c3                   	ret    

00000549 <gets>:

char*
gets(char *buf, int max)
{
 549:	55                   	push   %ebp
 54a:	89 e5                	mov    %esp,%ebp
 54c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 54f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 556:	eb 4c                	jmp    5a4 <gets+0x5b>
    cc = read(0, &c, 1);
 558:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 55f:	00 
 560:	8d 45 ef             	lea    -0x11(%ebp),%eax
 563:	89 44 24 04          	mov    %eax,0x4(%esp)
 567:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 56e:	e8 44 01 00 00       	call   6b7 <read>
 573:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 576:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 57a:	7f 02                	jg     57e <gets+0x35>
      break;
 57c:	eb 31                	jmp    5af <gets+0x66>
    buf[i++] = c;
 57e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 581:	8d 50 01             	lea    0x1(%eax),%edx
 584:	89 55 f4             	mov    %edx,-0xc(%ebp)
 587:	89 c2                	mov    %eax,%edx
 589:	8b 45 08             	mov    0x8(%ebp),%eax
 58c:	01 c2                	add    %eax,%edx
 58e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 592:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 594:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 598:	3c 0a                	cmp    $0xa,%al
 59a:	74 13                	je     5af <gets+0x66>
 59c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 5a0:	3c 0d                	cmp    $0xd,%al
 5a2:	74 0b                	je     5af <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a7:	83 c0 01             	add    $0x1,%eax
 5aa:	3b 45 0c             	cmp    0xc(%ebp),%eax
 5ad:	7c a9                	jl     558 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 5af:	8b 55 f4             	mov    -0xc(%ebp),%edx
 5b2:	8b 45 08             	mov    0x8(%ebp),%eax
 5b5:	01 d0                	add    %edx,%eax
 5b7:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 5ba:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5bd:	c9                   	leave  
 5be:	c3                   	ret    

000005bf <stat>:

int
stat(char *n, struct stat *st)
{
 5bf:	55                   	push   %ebp
 5c0:	89 e5                	mov    %esp,%ebp
 5c2:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 5cc:	00 
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
 5d0:	89 04 24             	mov    %eax,(%esp)
 5d3:	e8 07 01 00 00       	call   6df <open>
 5d8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 5db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5df:	79 07                	jns    5e8 <stat+0x29>
    return -1;
 5e1:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 5e6:	eb 23                	jmp    60b <stat+0x4c>
  r = fstat(fd, st);
 5e8:	8b 45 0c             	mov    0xc(%ebp),%eax
 5eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f2:	89 04 24             	mov    %eax,(%esp)
 5f5:	e8 fd 00 00 00       	call   6f7 <fstat>
 5fa:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 5fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 600:	89 04 24             	mov    %eax,(%esp)
 603:	e8 bf 00 00 00       	call   6c7 <close>
  return r;
 608:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 60b:	c9                   	leave  
 60c:	c3                   	ret    

0000060d <atoi>:

int
atoi(const char *s)
{
 60d:	55                   	push   %ebp
 60e:	89 e5                	mov    %esp,%ebp
 610:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 613:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 61a:	eb 25                	jmp    641 <atoi+0x34>
    n = n*10 + *s++ - '0';
 61c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 61f:	89 d0                	mov    %edx,%eax
 621:	c1 e0 02             	shl    $0x2,%eax
 624:	01 d0                	add    %edx,%eax
 626:	01 c0                	add    %eax,%eax
 628:	89 c1                	mov    %eax,%ecx
 62a:	8b 45 08             	mov    0x8(%ebp),%eax
 62d:	8d 50 01             	lea    0x1(%eax),%edx
 630:	89 55 08             	mov    %edx,0x8(%ebp)
 633:	0f b6 00             	movzbl (%eax),%eax
 636:	0f be c0             	movsbl %al,%eax
 639:	01 c8                	add    %ecx,%eax
 63b:	83 e8 30             	sub    $0x30,%eax
 63e:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 641:	8b 45 08             	mov    0x8(%ebp),%eax
 644:	0f b6 00             	movzbl (%eax),%eax
 647:	3c 2f                	cmp    $0x2f,%al
 649:	7e 0a                	jle    655 <atoi+0x48>
 64b:	8b 45 08             	mov    0x8(%ebp),%eax
 64e:	0f b6 00             	movzbl (%eax),%eax
 651:	3c 39                	cmp    $0x39,%al
 653:	7e c7                	jle    61c <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 655:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 658:	c9                   	leave  
 659:	c3                   	ret    

0000065a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 65a:	55                   	push   %ebp
 65b:	89 e5                	mov    %esp,%ebp
 65d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 660:	8b 45 08             	mov    0x8(%ebp),%eax
 663:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 666:	8b 45 0c             	mov    0xc(%ebp),%eax
 669:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 66c:	eb 17                	jmp    685 <memmove+0x2b>
    *dst++ = *src++;
 66e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 671:	8d 50 01             	lea    0x1(%eax),%edx
 674:	89 55 fc             	mov    %edx,-0x4(%ebp)
 677:	8b 55 f8             	mov    -0x8(%ebp),%edx
 67a:	8d 4a 01             	lea    0x1(%edx),%ecx
 67d:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 680:	0f b6 12             	movzbl (%edx),%edx
 683:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 685:	8b 45 10             	mov    0x10(%ebp),%eax
 688:	8d 50 ff             	lea    -0x1(%eax),%edx
 68b:	89 55 10             	mov    %edx,0x10(%ebp)
 68e:	85 c0                	test   %eax,%eax
 690:	7f dc                	jg     66e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 692:	8b 45 08             	mov    0x8(%ebp),%eax
}
 695:	c9                   	leave  
 696:	c3                   	ret    

00000697 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 697:	b8 01 00 00 00       	mov    $0x1,%eax
 69c:	cd 40                	int    $0x40
 69e:	c3                   	ret    

0000069f <exit>:
SYSCALL(exit)
 69f:	b8 02 00 00 00       	mov    $0x2,%eax
 6a4:	cd 40                	int    $0x40
 6a6:	c3                   	ret    

000006a7 <wait>:
SYSCALL(wait)
 6a7:	b8 03 00 00 00       	mov    $0x3,%eax
 6ac:	cd 40                	int    $0x40
 6ae:	c3                   	ret    

000006af <pipe>:
SYSCALL(pipe)
 6af:	b8 04 00 00 00       	mov    $0x4,%eax
 6b4:	cd 40                	int    $0x40
 6b6:	c3                   	ret    

000006b7 <read>:
SYSCALL(read)
 6b7:	b8 05 00 00 00       	mov    $0x5,%eax
 6bc:	cd 40                	int    $0x40
 6be:	c3                   	ret    

000006bf <write>:
SYSCALL(write)
 6bf:	b8 10 00 00 00       	mov    $0x10,%eax
 6c4:	cd 40                	int    $0x40
 6c6:	c3                   	ret    

000006c7 <close>:
SYSCALL(close)
 6c7:	b8 15 00 00 00       	mov    $0x15,%eax
 6cc:	cd 40                	int    $0x40
 6ce:	c3                   	ret    

000006cf <kill>:
SYSCALL(kill)
 6cf:	b8 06 00 00 00       	mov    $0x6,%eax
 6d4:	cd 40                	int    $0x40
 6d6:	c3                   	ret    

000006d7 <exec>:
SYSCALL(exec)
 6d7:	b8 07 00 00 00       	mov    $0x7,%eax
 6dc:	cd 40                	int    $0x40
 6de:	c3                   	ret    

000006df <open>:
SYSCALL(open)
 6df:	b8 0f 00 00 00       	mov    $0xf,%eax
 6e4:	cd 40                	int    $0x40
 6e6:	c3                   	ret    

000006e7 <mknod>:
SYSCALL(mknod)
 6e7:	b8 11 00 00 00       	mov    $0x11,%eax
 6ec:	cd 40                	int    $0x40
 6ee:	c3                   	ret    

000006ef <unlink>:
SYSCALL(unlink)
 6ef:	b8 12 00 00 00       	mov    $0x12,%eax
 6f4:	cd 40                	int    $0x40
 6f6:	c3                   	ret    

000006f7 <fstat>:
SYSCALL(fstat)
 6f7:	b8 08 00 00 00       	mov    $0x8,%eax
 6fc:	cd 40                	int    $0x40
 6fe:	c3                   	ret    

000006ff <link>:
SYSCALL(link)
 6ff:	b8 13 00 00 00       	mov    $0x13,%eax
 704:	cd 40                	int    $0x40
 706:	c3                   	ret    

00000707 <mkdir>:
SYSCALL(mkdir)
 707:	b8 14 00 00 00       	mov    $0x14,%eax
 70c:	cd 40                	int    $0x40
 70e:	c3                   	ret    

0000070f <chdir>:
SYSCALL(chdir)
 70f:	b8 09 00 00 00       	mov    $0x9,%eax
 714:	cd 40                	int    $0x40
 716:	c3                   	ret    

00000717 <dup>:
SYSCALL(dup)
 717:	b8 0a 00 00 00       	mov    $0xa,%eax
 71c:	cd 40                	int    $0x40
 71e:	c3                   	ret    

0000071f <getpid>:
SYSCALL(getpid)
 71f:	b8 0b 00 00 00       	mov    $0xb,%eax
 724:	cd 40                	int    $0x40
 726:	c3                   	ret    

00000727 <sbrk>:
SYSCALL(sbrk)
 727:	b8 0c 00 00 00       	mov    $0xc,%eax
 72c:	cd 40                	int    $0x40
 72e:	c3                   	ret    

0000072f <sleep>:
SYSCALL(sleep)
 72f:	b8 0d 00 00 00       	mov    $0xd,%eax
 734:	cd 40                	int    $0x40
 736:	c3                   	ret    

00000737 <uptime>:
SYSCALL(uptime)
 737:	b8 0e 00 00 00       	mov    $0xe,%eax
 73c:	cd 40                	int    $0x40
 73e:	c3                   	ret    

0000073f <clone>:
SYSCALL(clone)
 73f:	b8 16 00 00 00       	mov    $0x16,%eax
 744:	cd 40                	int    $0x40
 746:	c3                   	ret    

00000747 <texit>:
SYSCALL(texit)
 747:	b8 17 00 00 00       	mov    $0x17,%eax
 74c:	cd 40                	int    $0x40
 74e:	c3                   	ret    

0000074f <tsleep>:
SYSCALL(tsleep)
 74f:	b8 18 00 00 00       	mov    $0x18,%eax
 754:	cd 40                	int    $0x40
 756:	c3                   	ret    

00000757 <twakeup>:
SYSCALL(twakeup)
 757:	b8 19 00 00 00       	mov    $0x19,%eax
 75c:	cd 40                	int    $0x40
 75e:	c3                   	ret    

0000075f <test>:
SYSCALL(test)
 75f:	b8 1a 00 00 00       	mov    $0x1a,%eax
 764:	cd 40                	int    $0x40
 766:	c3                   	ret    

00000767 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 767:	55                   	push   %ebp
 768:	89 e5                	mov    %esp,%ebp
 76a:	83 ec 18             	sub    $0x18,%esp
 76d:	8b 45 0c             	mov    0xc(%ebp),%eax
 770:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 773:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 77a:	00 
 77b:	8d 45 f4             	lea    -0xc(%ebp),%eax
 77e:	89 44 24 04          	mov    %eax,0x4(%esp)
 782:	8b 45 08             	mov    0x8(%ebp),%eax
 785:	89 04 24             	mov    %eax,(%esp)
 788:	e8 32 ff ff ff       	call   6bf <write>
}
 78d:	c9                   	leave  
 78e:	c3                   	ret    

0000078f <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 78f:	55                   	push   %ebp
 790:	89 e5                	mov    %esp,%ebp
 792:	56                   	push   %esi
 793:	53                   	push   %ebx
 794:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 797:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 79e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 7a2:	74 17                	je     7bb <printint+0x2c>
 7a4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7a8:	79 11                	jns    7bb <printint+0x2c>
    neg = 1;
 7aa:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 7b4:	f7 d8                	neg    %eax
 7b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7b9:	eb 06                	jmp    7c1 <printint+0x32>
  } else {
    x = xx;
 7bb:	8b 45 0c             	mov    0xc(%ebp),%eax
 7be:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 7c1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 7c8:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 7cb:	8d 41 01             	lea    0x1(%ecx),%eax
 7ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7d1:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d7:	ba 00 00 00 00       	mov    $0x0,%edx
 7dc:	f7 f3                	div    %ebx
 7de:	89 d0                	mov    %edx,%eax
 7e0:	0f b6 80 14 15 00 00 	movzbl 0x1514(%eax),%eax
 7e7:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 7eb:	8b 75 10             	mov    0x10(%ebp),%esi
 7ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f1:	ba 00 00 00 00       	mov    $0x0,%edx
 7f6:	f7 f6                	div    %esi
 7f8:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7fb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7ff:	75 c7                	jne    7c8 <printint+0x39>
  if(neg)
 801:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 805:	74 10                	je     817 <printint+0x88>
    buf[i++] = '-';
 807:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80a:	8d 50 01             	lea    0x1(%eax),%edx
 80d:	89 55 f4             	mov    %edx,-0xc(%ebp)
 810:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 815:	eb 1f                	jmp    836 <printint+0xa7>
 817:	eb 1d                	jmp    836 <printint+0xa7>
    putc(fd, buf[i]);
 819:	8d 55 dc             	lea    -0x24(%ebp),%edx
 81c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81f:	01 d0                	add    %edx,%eax
 821:	0f b6 00             	movzbl (%eax),%eax
 824:	0f be c0             	movsbl %al,%eax
 827:	89 44 24 04          	mov    %eax,0x4(%esp)
 82b:	8b 45 08             	mov    0x8(%ebp),%eax
 82e:	89 04 24             	mov    %eax,(%esp)
 831:	e8 31 ff ff ff       	call   767 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 836:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 83a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 83e:	79 d9                	jns    819 <printint+0x8a>
    putc(fd, buf[i]);
}
 840:	83 c4 30             	add    $0x30,%esp
 843:	5b                   	pop    %ebx
 844:	5e                   	pop    %esi
 845:	5d                   	pop    %ebp
 846:	c3                   	ret    

00000847 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 847:	55                   	push   %ebp
 848:	89 e5                	mov    %esp,%ebp
 84a:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 84d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 854:	8d 45 0c             	lea    0xc(%ebp),%eax
 857:	83 c0 04             	add    $0x4,%eax
 85a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 85d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 864:	e9 7c 01 00 00       	jmp    9e5 <printf+0x19e>
    c = fmt[i] & 0xff;
 869:	8b 55 0c             	mov    0xc(%ebp),%edx
 86c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 86f:	01 d0                	add    %edx,%eax
 871:	0f b6 00             	movzbl (%eax),%eax
 874:	0f be c0             	movsbl %al,%eax
 877:	25 ff 00 00 00       	and    $0xff,%eax
 87c:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 87f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 883:	75 2c                	jne    8b1 <printf+0x6a>
      if(c == '%'){
 885:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 889:	75 0c                	jne    897 <printf+0x50>
        state = '%';
 88b:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 892:	e9 4a 01 00 00       	jmp    9e1 <printf+0x19a>
      } else {
        putc(fd, c);
 897:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 89a:	0f be c0             	movsbl %al,%eax
 89d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a1:	8b 45 08             	mov    0x8(%ebp),%eax
 8a4:	89 04 24             	mov    %eax,(%esp)
 8a7:	e8 bb fe ff ff       	call   767 <putc>
 8ac:	e9 30 01 00 00       	jmp    9e1 <printf+0x19a>
      }
    } else if(state == '%'){
 8b1:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 8b5:	0f 85 26 01 00 00    	jne    9e1 <printf+0x19a>
      if(c == 'd'){
 8bb:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 8bf:	75 2d                	jne    8ee <printf+0xa7>
        printint(fd, *ap, 10, 1);
 8c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8c4:	8b 00                	mov    (%eax),%eax
 8c6:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8cd:	00 
 8ce:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8d5:	00 
 8d6:	89 44 24 04          	mov    %eax,0x4(%esp)
 8da:	8b 45 08             	mov    0x8(%ebp),%eax
 8dd:	89 04 24             	mov    %eax,(%esp)
 8e0:	e8 aa fe ff ff       	call   78f <printint>
        ap++;
 8e5:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8e9:	e9 ec 00 00 00       	jmp    9da <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 8ee:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 8f2:	74 06                	je     8fa <printf+0xb3>
 8f4:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 8f8:	75 2d                	jne    927 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 8fa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8fd:	8b 00                	mov    (%eax),%eax
 8ff:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 906:	00 
 907:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 90e:	00 
 90f:	89 44 24 04          	mov    %eax,0x4(%esp)
 913:	8b 45 08             	mov    0x8(%ebp),%eax
 916:	89 04 24             	mov    %eax,(%esp)
 919:	e8 71 fe ff ff       	call   78f <printint>
        ap++;
 91e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 922:	e9 b3 00 00 00       	jmp    9da <printf+0x193>
      } else if(c == 's'){
 927:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 92b:	75 45                	jne    972 <printf+0x12b>
        s = (char*)*ap;
 92d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 930:	8b 00                	mov    (%eax),%eax
 932:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 935:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 939:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 93d:	75 09                	jne    948 <printf+0x101>
          s = "(null)";
 93f:	c7 45 f4 9c 10 00 00 	movl   $0x109c,-0xc(%ebp)
        while(*s != 0){
 946:	eb 1e                	jmp    966 <printf+0x11f>
 948:	eb 1c                	jmp    966 <printf+0x11f>
          putc(fd, *s);
 94a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94d:	0f b6 00             	movzbl (%eax),%eax
 950:	0f be c0             	movsbl %al,%eax
 953:	89 44 24 04          	mov    %eax,0x4(%esp)
 957:	8b 45 08             	mov    0x8(%ebp),%eax
 95a:	89 04 24             	mov    %eax,(%esp)
 95d:	e8 05 fe ff ff       	call   767 <putc>
          s++;
 962:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 966:	8b 45 f4             	mov    -0xc(%ebp),%eax
 969:	0f b6 00             	movzbl (%eax),%eax
 96c:	84 c0                	test   %al,%al
 96e:	75 da                	jne    94a <printf+0x103>
 970:	eb 68                	jmp    9da <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 972:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 976:	75 1d                	jne    995 <printf+0x14e>
        putc(fd, *ap);
 978:	8b 45 e8             	mov    -0x18(%ebp),%eax
 97b:	8b 00                	mov    (%eax),%eax
 97d:	0f be c0             	movsbl %al,%eax
 980:	89 44 24 04          	mov    %eax,0x4(%esp)
 984:	8b 45 08             	mov    0x8(%ebp),%eax
 987:	89 04 24             	mov    %eax,(%esp)
 98a:	e8 d8 fd ff ff       	call   767 <putc>
        ap++;
 98f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 993:	eb 45                	jmp    9da <printf+0x193>
      } else if(c == '%'){
 995:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 999:	75 17                	jne    9b2 <printf+0x16b>
        putc(fd, c);
 99b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 99e:	0f be c0             	movsbl %al,%eax
 9a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 9a5:	8b 45 08             	mov    0x8(%ebp),%eax
 9a8:	89 04 24             	mov    %eax,(%esp)
 9ab:	e8 b7 fd ff ff       	call   767 <putc>
 9b0:	eb 28                	jmp    9da <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9b2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9b9:	00 
 9ba:	8b 45 08             	mov    0x8(%ebp),%eax
 9bd:	89 04 24             	mov    %eax,(%esp)
 9c0:	e8 a2 fd ff ff       	call   767 <putc>
        putc(fd, c);
 9c5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9c8:	0f be c0             	movsbl %al,%eax
 9cb:	89 44 24 04          	mov    %eax,0x4(%esp)
 9cf:	8b 45 08             	mov    0x8(%ebp),%eax
 9d2:	89 04 24             	mov    %eax,(%esp)
 9d5:	e8 8d fd ff ff       	call   767 <putc>
      }
      state = 0;
 9da:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9e1:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 9e5:	8b 55 0c             	mov    0xc(%ebp),%edx
 9e8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9eb:	01 d0                	add    %edx,%eax
 9ed:	0f b6 00             	movzbl (%eax),%eax
 9f0:	84 c0                	test   %al,%al
 9f2:	0f 85 71 fe ff ff    	jne    869 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 9f8:	c9                   	leave  
 9f9:	c3                   	ret    

000009fa <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9fa:	55                   	push   %ebp
 9fb:	89 e5                	mov    %esp,%ebp
 9fd:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a00:	8b 45 08             	mov    0x8(%ebp),%eax
 a03:	83 e8 08             	sub    $0x8,%eax
 a06:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a09:	a1 54 15 00 00       	mov    0x1554,%eax
 a0e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a11:	eb 24                	jmp    a37 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a13:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a16:	8b 00                	mov    (%eax),%eax
 a18:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a1b:	77 12                	ja     a2f <free+0x35>
 a1d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a20:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a23:	77 24                	ja     a49 <free+0x4f>
 a25:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a28:	8b 00                	mov    (%eax),%eax
 a2a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a2d:	77 1a                	ja     a49 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a2f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a32:	8b 00                	mov    (%eax),%eax
 a34:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a37:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a3a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a3d:	76 d4                	jbe    a13 <free+0x19>
 a3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a42:	8b 00                	mov    (%eax),%eax
 a44:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a47:	76 ca                	jbe    a13 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a49:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a4c:	8b 40 04             	mov    0x4(%eax),%eax
 a4f:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a56:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a59:	01 c2                	add    %eax,%edx
 a5b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a5e:	8b 00                	mov    (%eax),%eax
 a60:	39 c2                	cmp    %eax,%edx
 a62:	75 24                	jne    a88 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 a64:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a67:	8b 50 04             	mov    0x4(%eax),%edx
 a6a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a6d:	8b 00                	mov    (%eax),%eax
 a6f:	8b 40 04             	mov    0x4(%eax),%eax
 a72:	01 c2                	add    %eax,%edx
 a74:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a77:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 a7a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a7d:	8b 00                	mov    (%eax),%eax
 a7f:	8b 10                	mov    (%eax),%edx
 a81:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a84:	89 10                	mov    %edx,(%eax)
 a86:	eb 0a                	jmp    a92 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 a88:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a8b:	8b 10                	mov    (%eax),%edx
 a8d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a90:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 a92:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a95:	8b 40 04             	mov    0x4(%eax),%eax
 a98:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a9f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa2:	01 d0                	add    %edx,%eax
 aa4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 aa7:	75 20                	jne    ac9 <free+0xcf>
    p->s.size += bp->s.size;
 aa9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aac:	8b 50 04             	mov    0x4(%eax),%edx
 aaf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ab2:	8b 40 04             	mov    0x4(%eax),%eax
 ab5:	01 c2                	add    %eax,%edx
 ab7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aba:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 abd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ac0:	8b 10                	mov    (%eax),%edx
 ac2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac5:	89 10                	mov    %edx,(%eax)
 ac7:	eb 08                	jmp    ad1 <free+0xd7>
  } else
    p->s.ptr = bp;
 ac9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 acc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 acf:	89 10                	mov    %edx,(%eax)
  freep = p;
 ad1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad4:	a3 54 15 00 00       	mov    %eax,0x1554
}
 ad9:	c9                   	leave  
 ada:	c3                   	ret    

00000adb <morecore>:

static Header*
morecore(uint nu)
{
 adb:	55                   	push   %ebp
 adc:	89 e5                	mov    %esp,%ebp
 ade:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 ae1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 ae8:	77 07                	ja     af1 <morecore+0x16>
    nu = 4096;
 aea:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 af1:	8b 45 08             	mov    0x8(%ebp),%eax
 af4:	c1 e0 03             	shl    $0x3,%eax
 af7:	89 04 24             	mov    %eax,(%esp)
 afa:	e8 28 fc ff ff       	call   727 <sbrk>
 aff:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b02:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b06:	75 07                	jne    b0f <morecore+0x34>
    return 0;
 b08:	b8 00 00 00 00       	mov    $0x0,%eax
 b0d:	eb 22                	jmp    b31 <morecore+0x56>
  hp = (Header*)p;
 b0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b12:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b15:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b18:	8b 55 08             	mov    0x8(%ebp),%edx
 b1b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b21:	83 c0 08             	add    $0x8,%eax
 b24:	89 04 24             	mov    %eax,(%esp)
 b27:	e8 ce fe ff ff       	call   9fa <free>
  return freep;
 b2c:	a1 54 15 00 00       	mov    0x1554,%eax
}
 b31:	c9                   	leave  
 b32:	c3                   	ret    

00000b33 <malloc>:

void*
malloc(uint nbytes)
{
 b33:	55                   	push   %ebp
 b34:	89 e5                	mov    %esp,%ebp
 b36:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b39:	8b 45 08             	mov    0x8(%ebp),%eax
 b3c:	83 c0 07             	add    $0x7,%eax
 b3f:	c1 e8 03             	shr    $0x3,%eax
 b42:	83 c0 01             	add    $0x1,%eax
 b45:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b48:	a1 54 15 00 00       	mov    0x1554,%eax
 b4d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b50:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b54:	75 23                	jne    b79 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b56:	c7 45 f0 4c 15 00 00 	movl   $0x154c,-0x10(%ebp)
 b5d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b60:	a3 54 15 00 00       	mov    %eax,0x1554
 b65:	a1 54 15 00 00       	mov    0x1554,%eax
 b6a:	a3 4c 15 00 00       	mov    %eax,0x154c
    base.s.size = 0;
 b6f:	c7 05 50 15 00 00 00 	movl   $0x0,0x1550
 b76:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b79:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b7c:	8b 00                	mov    (%eax),%eax
 b7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 b81:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b84:	8b 40 04             	mov    0x4(%eax),%eax
 b87:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 b8a:	72 4d                	jb     bd9 <malloc+0xa6>
      if(p->s.size == nunits)
 b8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b8f:	8b 40 04             	mov    0x4(%eax),%eax
 b92:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 b95:	75 0c                	jne    ba3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 b97:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b9a:	8b 10                	mov    (%eax),%edx
 b9c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b9f:	89 10                	mov    %edx,(%eax)
 ba1:	eb 26                	jmp    bc9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 ba3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba6:	8b 40 04             	mov    0x4(%eax),%eax
 ba9:	2b 45 ec             	sub    -0x14(%ebp),%eax
 bac:	89 c2                	mov    %eax,%edx
 bae:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 bb4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb7:	8b 40 04             	mov    0x4(%eax),%eax
 bba:	c1 e0 03             	shl    $0x3,%eax
 bbd:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 bc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc3:	8b 55 ec             	mov    -0x14(%ebp),%edx
 bc6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 bc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bcc:	a3 54 15 00 00       	mov    %eax,0x1554
      return (void*)(p + 1);
 bd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd4:	83 c0 08             	add    $0x8,%eax
 bd7:	eb 38                	jmp    c11 <malloc+0xde>
    }
    if(p == freep)
 bd9:	a1 54 15 00 00       	mov    0x1554,%eax
 bde:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 be1:	75 1b                	jne    bfe <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 be3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 be6:	89 04 24             	mov    %eax,(%esp)
 be9:	e8 ed fe ff ff       	call   adb <morecore>
 bee:	89 45 f4             	mov    %eax,-0xc(%ebp)
 bf1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 bf5:	75 07                	jne    bfe <malloc+0xcb>
        return 0;
 bf7:	b8 00 00 00 00       	mov    $0x0,%eax
 bfc:	eb 13                	jmp    c11 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c01:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c04:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c07:	8b 00                	mov    (%eax),%eax
 c09:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 c0c:	e9 70 ff ff ff       	jmp    b81 <malloc+0x4e>
}
 c11:	c9                   	leave  
 c12:	c3                   	ret    

00000c13 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 c13:	55                   	push   %ebp
 c14:	89 e5                	mov    %esp,%ebp
 c16:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 c19:	8b 55 08             	mov    0x8(%ebp),%edx
 c1c:	8b 45 0c             	mov    0xc(%ebp),%eax
 c1f:	8b 4d 08             	mov    0x8(%ebp),%ecx
 c22:	f0 87 02             	lock xchg %eax,(%edx)
 c25:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 c28:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 c2b:	c9                   	leave  
 c2c:	c3                   	ret    

00000c2d <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 c2d:	55                   	push   %ebp
 c2e:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 c30:	8b 45 08             	mov    0x8(%ebp),%eax
 c33:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 c39:	5d                   	pop    %ebp
 c3a:	c3                   	ret    

00000c3b <lock_acquire>:
void lock_acquire(lock_t *lock){
 c3b:	55                   	push   %ebp
 c3c:	89 e5                	mov    %esp,%ebp
 c3e:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 c41:	90                   	nop
 c42:	8b 45 08             	mov    0x8(%ebp),%eax
 c45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 c4c:	00 
 c4d:	89 04 24             	mov    %eax,(%esp)
 c50:	e8 be ff ff ff       	call   c13 <xchg>
 c55:	85 c0                	test   %eax,%eax
 c57:	75 e9                	jne    c42 <lock_acquire+0x7>
}
 c59:	c9                   	leave  
 c5a:	c3                   	ret    

00000c5b <lock_release>:
void lock_release(lock_t *lock){
 c5b:	55                   	push   %ebp
 c5c:	89 e5                	mov    %esp,%ebp
 c5e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 c61:	8b 45 08             	mov    0x8(%ebp),%eax
 c64:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 c6b:	00 
 c6c:	89 04 24             	mov    %eax,(%esp)
 c6f:	e8 9f ff ff ff       	call   c13 <xchg>
}
 c74:	c9                   	leave  
 c75:	c3                   	ret    

00000c76 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 c76:	55                   	push   %ebp
 c77:	89 e5                	mov    %esp,%ebp
 c79:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 c7c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 c83:	e8 ab fe ff ff       	call   b33 <malloc>
 c88:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 c8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c8e:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 c91:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c94:	25 ff 0f 00 00       	and    $0xfff,%eax
 c99:	85 c0                	test   %eax,%eax
 c9b:	74 14                	je     cb1 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 c9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ca0:	25 ff 0f 00 00       	and    $0xfff,%eax
 ca5:	89 c2                	mov    %eax,%edx
 ca7:	b8 00 10 00 00       	mov    $0x1000,%eax
 cac:	29 d0                	sub    %edx,%eax
 cae:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 cb1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 cb5:	75 1b                	jne    cd2 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 cb7:	c7 44 24 04 a3 10 00 	movl   $0x10a3,0x4(%esp)
 cbe:	00 
 cbf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 cc6:	e8 7c fb ff ff       	call   847 <printf>
        return 0;
 ccb:	b8 00 00 00 00       	mov    $0x0,%eax
 cd0:	eb 6f                	jmp    d41 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 cd2:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 cd5:	8b 55 08             	mov    0x8(%ebp),%edx
 cd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cdb:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 cdf:	89 54 24 08          	mov    %edx,0x8(%esp)
 ce3:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 cea:	00 
 ceb:	89 04 24             	mov    %eax,(%esp)
 cee:	e8 4c fa ff ff       	call   73f <clone>
 cf3:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 cf6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 cfa:	79 1b                	jns    d17 <thread_create+0xa1>
        printf(1,"clone fails\n");
 cfc:	c7 44 24 04 b1 10 00 	movl   $0x10b1,0x4(%esp)
 d03:	00 
 d04:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d0b:	e8 37 fb ff ff       	call   847 <printf>
        return 0;
 d10:	b8 00 00 00 00       	mov    $0x0,%eax
 d15:	eb 2a                	jmp    d41 <thread_create+0xcb>
    }
    if(tid > 0){
 d17:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 d1b:	7e 05                	jle    d22 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 d1d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d20:	eb 1f                	jmp    d41 <thread_create+0xcb>
    }
    if(tid == 0){
 d22:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 d26:	75 14                	jne    d3c <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 d28:	c7 44 24 04 be 10 00 	movl   $0x10be,0x4(%esp)
 d2f:	00 
 d30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d37:	e8 0b fb ff ff       	call   847 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 d3c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 d41:	c9                   	leave  
 d42:	c3                   	ret    

00000d43 <random>:

unsigned long rands = 1;
// generate 0 -> max random number exclude max.
int random(int max){
 d43:	55                   	push   %ebp
 d44:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
 d46:	a1 28 15 00 00       	mov    0x1528,%eax
 d4b:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
 d51:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
 d56:	a3 28 15 00 00       	mov    %eax,0x1528
    return (int)(rands % max);
 d5b:	a1 28 15 00 00       	mov    0x1528,%eax
 d60:	8b 4d 08             	mov    0x8(%ebp),%ecx
 d63:	ba 00 00 00 00       	mov    $0x0,%edx
 d68:	f7 f1                	div    %ecx
 d6a:	89 d0                	mov    %edx,%eax
 d6c:	5d                   	pop    %ebp
 d6d:	c3                   	ret    

00000d6e <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 d6e:	55                   	push   %ebp
 d6f:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 d71:	8b 45 08             	mov    0x8(%ebp),%eax
 d74:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 d7a:	8b 45 08             	mov    0x8(%ebp),%eax
 d7d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 d84:	8b 45 08             	mov    0x8(%ebp),%eax
 d87:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 d8e:	5d                   	pop    %ebp
 d8f:	c3                   	ret    

00000d90 <add_q>:

void add_q(struct queue *q, int v){
 d90:	55                   	push   %ebp
 d91:	89 e5                	mov    %esp,%ebp
 d93:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 d96:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 d9d:	e8 91 fd ff ff       	call   b33 <malloc>
 da2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 da5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 da8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 daf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 db2:	8b 55 0c             	mov    0xc(%ebp),%edx
 db5:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 db7:	8b 45 08             	mov    0x8(%ebp),%eax
 dba:	8b 40 04             	mov    0x4(%eax),%eax
 dbd:	85 c0                	test   %eax,%eax
 dbf:	75 0b                	jne    dcc <add_q+0x3c>
        q->head = n;
 dc1:	8b 45 08             	mov    0x8(%ebp),%eax
 dc4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 dc7:	89 50 04             	mov    %edx,0x4(%eax)
 dca:	eb 0c                	jmp    dd8 <add_q+0x48>
    }else{
        q->tail->next = n;
 dcc:	8b 45 08             	mov    0x8(%ebp),%eax
 dcf:	8b 40 08             	mov    0x8(%eax),%eax
 dd2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 dd5:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 dd8:	8b 45 08             	mov    0x8(%ebp),%eax
 ddb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 dde:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 de1:	8b 45 08             	mov    0x8(%ebp),%eax
 de4:	8b 00                	mov    (%eax),%eax
 de6:	8d 50 01             	lea    0x1(%eax),%edx
 de9:	8b 45 08             	mov    0x8(%ebp),%eax
 dec:	89 10                	mov    %edx,(%eax)
}
 dee:	c9                   	leave  
 def:	c3                   	ret    

00000df0 <empty_q>:

int empty_q(struct queue *q){
 df0:	55                   	push   %ebp
 df1:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 df3:	8b 45 08             	mov    0x8(%ebp),%eax
 df6:	8b 00                	mov    (%eax),%eax
 df8:	85 c0                	test   %eax,%eax
 dfa:	75 07                	jne    e03 <empty_q+0x13>
        return 1;
 dfc:	b8 01 00 00 00       	mov    $0x1,%eax
 e01:	eb 05                	jmp    e08 <empty_q+0x18>
    else
        return 0;
 e03:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 e08:	5d                   	pop    %ebp
 e09:	c3                   	ret    

00000e0a <pop_q>:
int pop_q(struct queue *q){
 e0a:	55                   	push   %ebp
 e0b:	89 e5                	mov    %esp,%ebp
 e0d:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 e10:	8b 45 08             	mov    0x8(%ebp),%eax
 e13:	89 04 24             	mov    %eax,(%esp)
 e16:	e8 d5 ff ff ff       	call   df0 <empty_q>
 e1b:	85 c0                	test   %eax,%eax
 e1d:	75 5d                	jne    e7c <pop_q+0x72>
       val = q->head->value; 
 e1f:	8b 45 08             	mov    0x8(%ebp),%eax
 e22:	8b 40 04             	mov    0x4(%eax),%eax
 e25:	8b 00                	mov    (%eax),%eax
 e27:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 e2a:	8b 45 08             	mov    0x8(%ebp),%eax
 e2d:	8b 40 04             	mov    0x4(%eax),%eax
 e30:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 e33:	8b 45 08             	mov    0x8(%ebp),%eax
 e36:	8b 40 04             	mov    0x4(%eax),%eax
 e39:	8b 50 04             	mov    0x4(%eax),%edx
 e3c:	8b 45 08             	mov    0x8(%ebp),%eax
 e3f:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 e42:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e45:	89 04 24             	mov    %eax,(%esp)
 e48:	e8 ad fb ff ff       	call   9fa <free>
       q->size--;
 e4d:	8b 45 08             	mov    0x8(%ebp),%eax
 e50:	8b 00                	mov    (%eax),%eax
 e52:	8d 50 ff             	lea    -0x1(%eax),%edx
 e55:	8b 45 08             	mov    0x8(%ebp),%eax
 e58:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 e5a:	8b 45 08             	mov    0x8(%ebp),%eax
 e5d:	8b 00                	mov    (%eax),%eax
 e5f:	85 c0                	test   %eax,%eax
 e61:	75 14                	jne    e77 <pop_q+0x6d>
            q->head = 0;
 e63:	8b 45 08             	mov    0x8(%ebp),%eax
 e66:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 e6d:	8b 45 08             	mov    0x8(%ebp),%eax
 e70:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 e77:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e7a:	eb 05                	jmp    e81 <pop_q+0x77>
    }
    return -1;
 e7c:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 e81:	c9                   	leave  
 e82:	c3                   	ret    

00000e83 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 e83:	55                   	push   %ebp
 e84:	89 e5                	mov    %esp,%ebp
 e86:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 e89:	8b 45 08             	mov    0x8(%ebp),%eax
 e8c:	8b 55 0c             	mov    0xc(%ebp),%edx
 e8f:	89 50 08             	mov    %edx,0x8(%eax)
	s->count = size;
 e92:	8b 45 08             	mov    0x8(%ebp),%eax
 e95:	8b 55 0c             	mov    0xc(%ebp),%edx
 e98:	89 50 04             	mov    %edx,0x4(%eax)
	lock_init(&s->lock);
 e9b:	8b 45 08             	mov    0x8(%ebp),%eax
 e9e:	89 04 24             	mov    %eax,(%esp)
 ea1:	e8 87 fd ff ff       	call   c2d <lock_init>
}
 ea6:	c9                   	leave  
 ea7:	c3                   	ret    

00000ea8 <sem_init_full>:

void 
sem_init_full(struct semaphore *s, int size){
 ea8:	55                   	push   %ebp
 ea9:	89 e5                	mov    %esp,%ebp
 eab:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 eae:	8b 45 08             	mov    0x8(%ebp),%eax
 eb1:	8b 55 0c             	mov    0xc(%ebp),%edx
 eb4:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 eb7:	8b 45 08             	mov    0x8(%ebp),%eax
 eba:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock);
 ec1:	8b 45 08             	mov    0x8(%ebp),%eax
 ec4:	89 04 24             	mov    %eax,(%esp)
 ec7:	e8 61 fd ff ff       	call   c2d <lock_init>
}
 ecc:	c9                   	leave  
 ecd:	c3                   	ret    

00000ece <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 ece:	55                   	push   %ebp
 ecf:	89 e5                	mov    %esp,%ebp
 ed1:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 ed4:	8b 45 08             	mov    0x8(%ebp),%eax
 ed7:	89 04 24             	mov    %eax,(%esp)
 eda:	e8 5c fd ff ff       	call   c3b <lock_acquire>
	if(s->count  == 0){
 edf:	8b 45 08             	mov    0x8(%ebp),%eax
 ee2:	8b 40 04             	mov    0x4(%eax),%eax
 ee5:	85 c0                	test   %eax,%eax
 ee7:	75 2f                	jne    f18 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 ee9:	e8 31 f8 ff ff       	call   71f <getpid>
 eee:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 ef1:	8b 45 08             	mov    0x8(%ebp),%eax
 ef4:	8d 50 0c             	lea    0xc(%eax),%edx
 ef7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 efa:	89 44 24 04          	mov    %eax,0x4(%esp)
 efe:	89 14 24             	mov    %edx,(%esp)
 f01:	e8 8a fe ff ff       	call   d90 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 f06:	8b 45 08             	mov    0x8(%ebp),%eax
 f09:	89 04 24             	mov    %eax,(%esp)
 f0c:	e8 4a fd ff ff       	call   c5b <lock_release>
		tsleep(); 
 f11:	e8 39 f8 ff ff       	call   74f <tsleep>
 f16:	eb 1a                	jmp    f32 <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 f18:	8b 45 08             	mov    0x8(%ebp),%eax
 f1b:	8b 40 04             	mov    0x4(%eax),%eax
 f1e:	8d 50 ff             	lea    -0x1(%eax),%edx
 f21:	8b 45 08             	mov    0x8(%ebp),%eax
 f24:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 f27:	8b 45 08             	mov    0x8(%ebp),%eax
 f2a:	89 04 24             	mov    %eax,(%esp)
 f2d:	e8 29 fd ff ff       	call   c5b <lock_release>
	}
}
 f32:	c9                   	leave  
 f33:	c3                   	ret    

00000f34 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 f34:	55                   	push   %ebp
 f35:	89 e5                	mov    %esp,%ebp
 f37:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 f3a:	8b 45 08             	mov    0x8(%ebp),%eax
 f3d:	89 04 24             	mov    %eax,(%esp)
 f40:	e8 f6 fc ff ff       	call   c3b <lock_acquire>
	if(s->count < s->size){
 f45:	8b 45 08             	mov    0x8(%ebp),%eax
 f48:	8b 50 04             	mov    0x4(%eax),%edx
 f4b:	8b 45 08             	mov    0x8(%ebp),%eax
 f4e:	8b 40 08             	mov    0x8(%eax),%eax
 f51:	39 c2                	cmp    %eax,%edx
 f53:	7d 0f                	jge    f64 <sem_signal+0x30>
		s->count++;	
 f55:	8b 45 08             	mov    0x8(%ebp),%eax
 f58:	8b 40 04             	mov    0x4(%eax),%eax
 f5b:	8d 50 01             	lea    0x1(%eax),%edx
 f5e:	8b 45 08             	mov    0x8(%ebp),%eax
 f61:	89 50 04             	mov    %edx,0x4(%eax)
	}

	int tid;
	tid = pop_q(&s->waiters);
 f64:	8b 45 08             	mov    0x8(%ebp),%eax
 f67:	83 c0 0c             	add    $0xc,%eax
 f6a:	89 04 24             	mov    %eax,(%esp)
 f6d:	e8 98 fe ff ff       	call   e0a <pop_q>
 f72:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 f75:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 f79:	74 2e                	je     fa9 <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 f7b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f7e:	89 04 24             	mov    %eax,(%esp)
 f81:	e8 d1 f7 ff ff       	call   757 <twakeup>
		s->count--;
 f86:	8b 45 08             	mov    0x8(%ebp),%eax
 f89:	8b 40 04             	mov    0x4(%eax),%eax
 f8c:	8d 50 ff             	lea    -0x1(%eax),%edx
 f8f:	8b 45 08             	mov    0x8(%ebp),%eax
 f92:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 f95:	8b 45 08             	mov    0x8(%ebp),%eax
 f98:	8b 40 04             	mov    0x4(%eax),%eax
 f9b:	85 c0                	test   %eax,%eax
 f9d:	79 0a                	jns    fa9 <sem_signal+0x75>
 f9f:	8b 45 08             	mov    0x8(%ebp),%eax
 fa2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 fa9:	8b 45 08             	mov    0x8(%ebp),%eax
 fac:	89 04 24             	mov    %eax,(%esp)
 faf:	e8 a7 fc ff ff       	call   c5b <lock_release>

 fb4:	c9                   	leave  
 fb5:	c3                   	ret    
