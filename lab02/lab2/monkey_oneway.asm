
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
  18:	e8 67 0e 00 00       	call   e84 <sem_init>
	sem_init(&mutex1, 1);
  1d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  24:	00 
  25:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
  2c:	e8 53 0e 00 00       	call   e84 <sem_init>
  sem_init(&mutex2, 1);
  31:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  38:	00 
  39:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
  40:	e8 3f 0e 00 00       	call   e84 <sem_init>
  sem_init(&mutex3, 1);
  45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
  54:	e8 2b 0e 00 00       	call   e84 <sem_init>
  sem_init(&climb, 1);
  59:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  60:	00 
  61:	c7 04 24 60 15 00 00 	movl   $0x1560,(%esp)
  68:	e8 17 0e 00 00       	call   e84 <sem_init>
  sem_init(&printer, 1);
  6d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  74:	00 
  75:	c7 04 24 a0 15 00 00 	movl   $0x15a0,(%esp)
  7c:	e8 03 0e 00 00       	call   e84 <sem_init>
  sem_init(&printer_mutex1, 1);
  81:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  88:	00 
  89:	c7 04 24 60 16 00 00 	movl   $0x1660,(%esp)
  90:	e8 ef 0d 00 00       	call   e84 <sem_init>
  sem_init(&printer_mutex2, 1);
  95:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  9c:	00 
  9d:	c7 04 24 a0 16 00 00 	movl   $0x16a0,(%esp)
  a4:	e8 db 0d 00 00       	call   e84 <sem_init>
	
	int i;

	for(i = 0; i < 10; i++) thread_create(monkey, 0);
  a9:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  b0:	00 
  b1:	eb 19                	jmp    cc <main+0xcc>
  b3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  ba:	00 
  bb:	c7 04 24 f6 00 00 00 	movl   $0xf6,(%esp)
  c2:	e8 b0 0b 00 00       	call   c77 <thread_create>
  c7:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  cc:	83 7c 24 1c 09       	cmpl   $0x9,0x1c(%esp)
  d1:	7e e0                	jle    b3 <main+0xb3>
    while(wait() > 0);
  d3:	90                   	nop
  d4:	e8 cf 05 00 00       	call   6a8 <wait>
  d9:	85 c0                	test   %eax,%eax
  db:	7f f7                	jg     d4 <main+0xd4>
	printf(1,"All monkeys are full\n");
  dd:	c7 44 24 04 b8 0f 00 	movl   $0xfb8,0x4(%esp)
  e4:	00 
  e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  ec:	e8 57 07 00 00       	call   848 <printf>
	exit();
  f1:	e8 aa 05 00 00       	call   6a0 <exit>

000000f6 <monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
  f6:	55                   	push   %ebp
  f7:	89 e5                	mov    %esp,%ebp
  f9:	83 ec 28             	sub    $0x28,%esp
  int pid =  getpid();
  fc:	e8 1f 06 00 00       	call   720 <getpid>
 101:	89 45 f4             	mov    %eax,-0xc(%ebp)

  sem_aquire(&printer_mutex1);
 104:	c7 04 24 60 16 00 00 	movl   $0x1660,(%esp)
 10b:	e8 bf 0d 00 00       	call   ecf <sem_aquire>
  printMessage(pid, 1);
 110:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 117:	00 
 118:	8b 45 f4             	mov    -0xc(%ebp),%eax
 11b:	89 04 24             	mov    %eax,(%esp)
 11e:	e8 ba 01 00 00       	call   2dd <printMessage>
  sem_aquire(&wait_tree);
 123:	c7 04 24 20 16 00 00 	movl   $0x1620,(%esp)
 12a:	e8 a0 0d 00 00       	call   ecf <sem_aquire>

  //climb_tree
  sem_aquire(&mutex1);
 12f:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
 136:	e8 94 0d 00 00       	call   ecf <sem_aquire>
  movingup++;
 13b:	a1 40 15 00 00       	mov    0x1540,%eax
 140:	83 c0 01             	add    $0x1,%eax
 143:	a3 40 15 00 00       	mov    %eax,0x1540
  if(movingup==1)	sem_aquire(&climb);
 148:	a1 40 15 00 00       	mov    0x1540,%eax
 14d:	83 f8 01             	cmp    $0x1,%eax
 150:	75 0c                	jne    15e <monkey+0x68>
 152:	c7 04 24 60 15 00 00 	movl   $0x1560,(%esp)
 159:	e8 71 0d 00 00       	call   ecf <sem_aquire>
  sem_signal(&mutex1);
 15e:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
 165:	e8 cb 0d 00 00       	call   f35 <sem_signal>

  sem_aquire(&mutex3);
 16a:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
 171:	e8 59 0d 00 00       	call   ecf <sem_aquire>
  monkeys_on_tree++;
 176:	a1 48 15 00 00       	mov    0x1548,%eax
 17b:	83 c0 01             	add    $0x1,%eax
 17e:	a3 48 15 00 00       	mov    %eax,0x1548
  sem_signal(&mutex3); 
 183:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
 18a:	e8 a6 0d 00 00       	call   f35 <sem_signal>

  printMessage(pid, 2); 
 18f:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 196:	00 
 197:	8b 45 f4             	mov    -0xc(%ebp),%eax
 19a:	89 04 24             	mov    %eax,(%esp)
 19d:	e8 3b 01 00 00       	call   2dd <printMessage>
  sem_signal(&printer_mutex1); 
 1a2:	c7 04 24 60 16 00 00 	movl   $0x1660,(%esp)
 1a9:	e8 87 0d 00 00       	call   f35 <sem_signal>

  // Get coconut
  sleep(100); 
 1ae:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 1b5:	e8 76 05 00 00       	call   730 <sleep>

  printMessage(pid, 6); // Got a coconut
 1ba:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
 1c1:	00 
 1c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1c5:	89 04 24             	mov    %eax,(%esp)
 1c8:	e8 10 01 00 00       	call   2dd <printMessage>

  //got coconut
  sem_aquire(&mutex1);
 1cd:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
 1d4:	e8 f6 0c 00 00       	call   ecf <sem_aquire>
  movingup--;
 1d9:	a1 40 15 00 00       	mov    0x1540,%eax
 1de:	83 e8 01             	sub    $0x1,%eax
 1e1:	a3 40 15 00 00       	mov    %eax,0x1540
  if(movingup==0)	sem_signal(&climb);
 1e6:	a1 40 15 00 00       	mov    0x1540,%eax
 1eb:	85 c0                	test   %eax,%eax
 1ed:	75 0c                	jne    1fb <monkey+0x105>
 1ef:	c7 04 24 60 15 00 00 	movl   $0x1560,(%esp)
 1f6:	e8 3a 0d 00 00       	call   f35 <sem_signal>
  sem_signal(&mutex1);
 1fb:	c7 04 24 20 17 00 00 	movl   $0x1720,(%esp)
 202:	e8 2e 0d 00 00       	call   f35 <sem_signal>


  // Climb Down
  sem_aquire(&mutex2);
 207:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
 20e:	e8 bc 0c 00 00       	call   ecf <sem_aquire>
  movingdown++;
 213:	a1 44 15 00 00       	mov    0x1544,%eax
 218:	83 c0 01             	add    $0x1,%eax
 21b:	a3 44 15 00 00       	mov    %eax,0x1544
  if(movingdown == 1)	sem_aquire(&climb);
 220:	a1 44 15 00 00       	mov    0x1544,%eax
 225:	83 f8 01             	cmp    $0x1,%eax
 228:	75 0c                	jne    236 <monkey+0x140>
 22a:	c7 04 24 60 15 00 00 	movl   $0x1560,(%esp)
 231:	e8 99 0c 00 00       	call   ecf <sem_aquire>
  sem_signal(&mutex2);
 236:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
 23d:	e8 f3 0c 00 00       	call   f35 <sem_signal>

  //printMessage(pid, 3); //Climbing down tree
  // Climb Down


  sem_aquire(&printer_mutex2);
 242:	c7 04 24 a0 16 00 00 	movl   $0x16a0,(%esp)
 249:	e8 81 0c 00 00       	call   ecf <sem_aquire>
  //printMessage(pid, 5); // On the ground


  sem_aquire(&mutex2);
 24e:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
 255:	e8 75 0c 00 00       	call   ecf <sem_aquire>
  movingdown--;
 25a:	a1 44 15 00 00       	mov    0x1544,%eax
 25f:	83 e8 01             	sub    $0x1,%eax
 262:	a3 44 15 00 00       	mov    %eax,0x1544

  sem_aquire(&mutex3);
 267:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
 26e:	e8 5c 0c 00 00       	call   ecf <sem_aquire>
  monkeys_on_tree--;
 273:	a1 48 15 00 00       	mov    0x1548,%eax
 278:	83 e8 01             	sub    $0x1,%eax
 27b:	a3 48 15 00 00       	mov    %eax,0x1548
  sem_signal(&mutex3); 
 280:	c7 04 24 e0 16 00 00 	movl   $0x16e0,(%esp)
 287:	e8 a9 0c 00 00       	call   f35 <sem_signal>

  printMessage(pid, 3); // Eating Banana
 28c:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
 293:	00 
 294:	8b 45 f4             	mov    -0xc(%ebp),%eax
 297:	89 04 24             	mov    %eax,(%esp)
 29a:	e8 3e 00 00 00       	call   2dd <printMessage>
  if(movingdown == 0) sem_signal(&climb);
 29f:	a1 44 15 00 00       	mov    0x1544,%eax
 2a4:	85 c0                	test   %eax,%eax
 2a6:	75 0c                	jne    2b4 <monkey+0x1be>
 2a8:	c7 04 24 60 15 00 00 	movl   $0x1560,(%esp)
 2af:	e8 81 0c 00 00       	call   f35 <sem_signal>
  sem_signal(&mutex2);
 2b4:	c7 04 24 e0 15 00 00 	movl   $0x15e0,(%esp)
 2bb:	e8 75 0c 00 00       	call   f35 <sem_signal>

  sem_signal(&wait_tree);
 2c0:	c7 04 24 20 16 00 00 	movl   $0x1620,(%esp)
 2c7:	e8 69 0c 00 00       	call   f35 <sem_signal>
  sem_signal(&printer_mutex2); 
 2cc:	c7 04 24 a0 16 00 00 	movl   $0x16a0,(%esp)
 2d3:	e8 5d 0c 00 00       	call   f35 <sem_signal>
  texit();
 2d8:	e8 6b 04 00 00       	call   748 <texit>

000002dd <printMessage>:
}

void printMessage(int pid, int state){
 2dd:	55                   	push   %ebp
 2de:	89 e5                	mov    %esp,%ebp
 2e0:	83 ec 18             	sub    $0x18,%esp
  sem_aquire(&printer);
 2e3:	c7 04 24 a0 15 00 00 	movl   $0x15a0,(%esp)
 2ea:	e8 e0 0b 00 00       	call   ecf <sem_aquire>
  printf(1, "Monkey(%d)",pid);
 2ef:	8b 45 08             	mov    0x8(%ebp),%eax
 2f2:	89 44 24 08          	mov    %eax,0x8(%esp)
 2f6:	c7 44 24 04 ce 0f 00 	movl   $0xfce,0x4(%esp)
 2fd:	00 
 2fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 305:	e8 3e 05 00 00       	call   848 <printf>
  //printf(1, " - %d", state); 
  switch(state){
 30a:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
 30e:	0f 87 bf 00 00 00    	ja     3d3 <printMessage+0xf6>
 314:	8b 45 0c             	mov    0xc(%ebp),%eax
 317:	c1 e0 02             	shl    $0x2,%eax
 31a:	05 8c 10 00 00       	add    $0x108c,%eax
 31f:	8b 00                	mov    (%eax),%eax
 321:	ff e0                	jmp    *%eax
    case(1):
      printf(1, " Waiting  to  climb", state); 
 323:	8b 45 0c             	mov    0xc(%ebp),%eax
 326:	89 44 24 08          	mov    %eax,0x8(%esp)
 32a:	c7 44 24 04 d9 0f 00 	movl   $0xfd9,0x4(%esp)
 331:	00 
 332:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 339:	e8 0a 05 00 00       	call   848 <printf>
      break;
 33e:	e9 90 00 00 00       	jmp    3d3 <printMessage+0xf6>
    case(2):
      printf(1, " Climbing  up  tree", state); 
 343:	8b 45 0c             	mov    0xc(%ebp),%eax
 346:	89 44 24 08          	mov    %eax,0x8(%esp)
 34a:	c7 44 24 04 ed 0f 00 	movl   $0xfed,0x4(%esp)
 351:	00 
 352:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 359:	e8 ea 04 00 00       	call   848 <printf>
      break;
 35e:	eb 73                	jmp    3d3 <printMessage+0xf6>
    case(3):
      printf(1, " Climbing down tree", state); 
 360:	8b 45 0c             	mov    0xc(%ebp),%eax
 363:	89 44 24 08          	mov    %eax,0x8(%esp)
 367:	c7 44 24 04 01 10 00 	movl   $0x1001,0x4(%esp)
 36e:	00 
 36f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 376:	e8 cd 04 00 00       	call   848 <printf>
      break;
 37b:	eb 56                	jmp    3d3 <printMessage+0xf6>
    case(4):
      printf(1, " Eating the  banana", state); 
 37d:	8b 45 0c             	mov    0xc(%ebp),%eax
 380:	89 44 24 08          	mov    %eax,0x8(%esp)
 384:	c7 44 24 04 15 10 00 	movl   $0x1015,0x4(%esp)
 38b:	00 
 38c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 393:	e8 b0 04 00 00       	call   848 <printf>
      break;
 398:	eb 39                	jmp    3d3 <printMessage+0xf6>
    case(5):
      printf(1, " On the ground safe", state); 
 39a:	8b 45 0c             	mov    0xc(%ebp),%eax
 39d:	89 44 24 08          	mov    %eax,0x8(%esp)
 3a1:	c7 44 24 04 29 10 00 	movl   $0x1029,0x4(%esp)
 3a8:	00 
 3a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3b0:	e8 93 04 00 00       	call   848 <printf>
      break;
 3b5:	eb 1c                	jmp    3d3 <printMessage+0xf6>
    case(6):
      printf(1, " Alright a  coconut", state); 
 3b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ba:	89 44 24 08          	mov    %eax,0x8(%esp)
 3be:	c7 44 24 04 3d 10 00 	movl   $0x103d,0x4(%esp)
 3c5:	00 
 3c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3cd:	e8 76 04 00 00       	call   848 <printf>
      break;
 3d2:	90                   	nop
  }
  printf(1, " - Monkeys on tree: %d", monkeys_on_tree);  
 3d3:	a1 48 15 00 00       	mov    0x1548,%eax
 3d8:	89 44 24 08          	mov    %eax,0x8(%esp)
 3dc:	c7 44 24 04 51 10 00 	movl   $0x1051,0x4(%esp)
 3e3:	00 
 3e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 3eb:	e8 58 04 00 00       	call   848 <printf>
  printf(1, " - movingup: %d", movingup);   
 3f0:	a1 40 15 00 00       	mov    0x1540,%eax
 3f5:	89 44 24 08          	mov    %eax,0x8(%esp)
 3f9:	c7 44 24 04 68 10 00 	movl   $0x1068,0x4(%esp)
 400:	00 
 401:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 408:	e8 3b 04 00 00       	call   848 <printf>
  printf(1, " - movingdown: %d\n", movingdown);  
 40d:	a1 44 15 00 00       	mov    0x1544,%eax
 412:	89 44 24 08          	mov    %eax,0x8(%esp)
 416:	c7 44 24 04 78 10 00 	movl   $0x1078,0x4(%esp)
 41d:	00 
 41e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 425:	e8 1e 04 00 00       	call   848 <printf>
  sem_signal(&printer);
 42a:	c7 04 24 a0 15 00 00 	movl   $0x15a0,(%esp)
 431:	e8 ff 0a 00 00       	call   f35 <sem_signal>
  
 436:	c9                   	leave  
 437:	c3                   	ret    

00000438 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 438:	55                   	push   %ebp
 439:	89 e5                	mov    %esp,%ebp
 43b:	57                   	push   %edi
 43c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 43d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 440:	8b 55 10             	mov    0x10(%ebp),%edx
 443:	8b 45 0c             	mov    0xc(%ebp),%eax
 446:	89 cb                	mov    %ecx,%ebx
 448:	89 df                	mov    %ebx,%edi
 44a:	89 d1                	mov    %edx,%ecx
 44c:	fc                   	cld    
 44d:	f3 aa                	rep stos %al,%es:(%edi)
 44f:	89 ca                	mov    %ecx,%edx
 451:	89 fb                	mov    %edi,%ebx
 453:	89 5d 08             	mov    %ebx,0x8(%ebp)
 456:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 459:	5b                   	pop    %ebx
 45a:	5f                   	pop    %edi
 45b:	5d                   	pop    %ebp
 45c:	c3                   	ret    

0000045d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 45d:	55                   	push   %ebp
 45e:	89 e5                	mov    %esp,%ebp
 460:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 463:	8b 45 08             	mov    0x8(%ebp),%eax
 466:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 469:	90                   	nop
 46a:	8b 45 08             	mov    0x8(%ebp),%eax
 46d:	8d 50 01             	lea    0x1(%eax),%edx
 470:	89 55 08             	mov    %edx,0x8(%ebp)
 473:	8b 55 0c             	mov    0xc(%ebp),%edx
 476:	8d 4a 01             	lea    0x1(%edx),%ecx
 479:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 47c:	0f b6 12             	movzbl (%edx),%edx
 47f:	88 10                	mov    %dl,(%eax)
 481:	0f b6 00             	movzbl (%eax),%eax
 484:	84 c0                	test   %al,%al
 486:	75 e2                	jne    46a <strcpy+0xd>
    ;
  return os;
 488:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 48b:	c9                   	leave  
 48c:	c3                   	ret    

0000048d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 48d:	55                   	push   %ebp
 48e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 490:	eb 08                	jmp    49a <strcmp+0xd>
    p++, q++;
 492:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 496:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 49a:	8b 45 08             	mov    0x8(%ebp),%eax
 49d:	0f b6 00             	movzbl (%eax),%eax
 4a0:	84 c0                	test   %al,%al
 4a2:	74 10                	je     4b4 <strcmp+0x27>
 4a4:	8b 45 08             	mov    0x8(%ebp),%eax
 4a7:	0f b6 10             	movzbl (%eax),%edx
 4aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 4ad:	0f b6 00             	movzbl (%eax),%eax
 4b0:	38 c2                	cmp    %al,%dl
 4b2:	74 de                	je     492 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 4b4:	8b 45 08             	mov    0x8(%ebp),%eax
 4b7:	0f b6 00             	movzbl (%eax),%eax
 4ba:	0f b6 d0             	movzbl %al,%edx
 4bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 4c0:	0f b6 00             	movzbl (%eax),%eax
 4c3:	0f b6 c0             	movzbl %al,%eax
 4c6:	29 c2                	sub    %eax,%edx
 4c8:	89 d0                	mov    %edx,%eax
}
 4ca:	5d                   	pop    %ebp
 4cb:	c3                   	ret    

000004cc <strlen>:

uint
strlen(char *s)
{
 4cc:	55                   	push   %ebp
 4cd:	89 e5                	mov    %esp,%ebp
 4cf:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 4d2:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 4d9:	eb 04                	jmp    4df <strlen+0x13>
 4db:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 4df:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4e2:	8b 45 08             	mov    0x8(%ebp),%eax
 4e5:	01 d0                	add    %edx,%eax
 4e7:	0f b6 00             	movzbl (%eax),%eax
 4ea:	84 c0                	test   %al,%al
 4ec:	75 ed                	jne    4db <strlen+0xf>
    ;
  return n;
 4ee:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4f1:	c9                   	leave  
 4f2:	c3                   	ret    

000004f3 <memset>:

void*
memset(void *dst, int c, uint n)
{
 4f3:	55                   	push   %ebp
 4f4:	89 e5                	mov    %esp,%ebp
 4f6:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 4f9:	8b 45 10             	mov    0x10(%ebp),%eax
 4fc:	89 44 24 08          	mov    %eax,0x8(%esp)
 500:	8b 45 0c             	mov    0xc(%ebp),%eax
 503:	89 44 24 04          	mov    %eax,0x4(%esp)
 507:	8b 45 08             	mov    0x8(%ebp),%eax
 50a:	89 04 24             	mov    %eax,(%esp)
 50d:	e8 26 ff ff ff       	call   438 <stosb>
  return dst;
 512:	8b 45 08             	mov    0x8(%ebp),%eax
}
 515:	c9                   	leave  
 516:	c3                   	ret    

00000517 <strchr>:

char*
strchr(const char *s, char c)
{
 517:	55                   	push   %ebp
 518:	89 e5                	mov    %esp,%ebp
 51a:	83 ec 04             	sub    $0x4,%esp
 51d:	8b 45 0c             	mov    0xc(%ebp),%eax
 520:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 523:	eb 14                	jmp    539 <strchr+0x22>
    if(*s == c)
 525:	8b 45 08             	mov    0x8(%ebp),%eax
 528:	0f b6 00             	movzbl (%eax),%eax
 52b:	3a 45 fc             	cmp    -0x4(%ebp),%al
 52e:	75 05                	jne    535 <strchr+0x1e>
      return (char*)s;
 530:	8b 45 08             	mov    0x8(%ebp),%eax
 533:	eb 13                	jmp    548 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 535:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 539:	8b 45 08             	mov    0x8(%ebp),%eax
 53c:	0f b6 00             	movzbl (%eax),%eax
 53f:	84 c0                	test   %al,%al
 541:	75 e2                	jne    525 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 543:	b8 00 00 00 00       	mov    $0x0,%eax
}
 548:	c9                   	leave  
 549:	c3                   	ret    

0000054a <gets>:

char*
gets(char *buf, int max)
{
 54a:	55                   	push   %ebp
 54b:	89 e5                	mov    %esp,%ebp
 54d:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 550:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 557:	eb 4c                	jmp    5a5 <gets+0x5b>
    cc = read(0, &c, 1);
 559:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 560:	00 
 561:	8d 45 ef             	lea    -0x11(%ebp),%eax
 564:	89 44 24 04          	mov    %eax,0x4(%esp)
 568:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 56f:	e8 44 01 00 00       	call   6b8 <read>
 574:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 577:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 57b:	7f 02                	jg     57f <gets+0x35>
      break;
 57d:	eb 31                	jmp    5b0 <gets+0x66>
    buf[i++] = c;
 57f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 582:	8d 50 01             	lea    0x1(%eax),%edx
 585:	89 55 f4             	mov    %edx,-0xc(%ebp)
 588:	89 c2                	mov    %eax,%edx
 58a:	8b 45 08             	mov    0x8(%ebp),%eax
 58d:	01 c2                	add    %eax,%edx
 58f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 593:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 595:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 599:	3c 0a                	cmp    $0xa,%al
 59b:	74 13                	je     5b0 <gets+0x66>
 59d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 5a1:	3c 0d                	cmp    $0xd,%al
 5a3:	74 0b                	je     5b0 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 5a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5a8:	83 c0 01             	add    $0x1,%eax
 5ab:	3b 45 0c             	cmp    0xc(%ebp),%eax
 5ae:	7c a9                	jl     559 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 5b0:	8b 55 f4             	mov    -0xc(%ebp),%edx
 5b3:	8b 45 08             	mov    0x8(%ebp),%eax
 5b6:	01 d0                	add    %edx,%eax
 5b8:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 5bb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5be:	c9                   	leave  
 5bf:	c3                   	ret    

000005c0 <stat>:

int
stat(char *n, struct stat *st)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 5c6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 5cd:	00 
 5ce:	8b 45 08             	mov    0x8(%ebp),%eax
 5d1:	89 04 24             	mov    %eax,(%esp)
 5d4:	e8 07 01 00 00       	call   6e0 <open>
 5d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 5dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5e0:	79 07                	jns    5e9 <stat+0x29>
    return -1;
 5e2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 5e7:	eb 23                	jmp    60c <stat+0x4c>
  r = fstat(fd, st);
 5e9:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f3:	89 04 24             	mov    %eax,(%esp)
 5f6:	e8 fd 00 00 00       	call   6f8 <fstat>
 5fb:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 5fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 601:	89 04 24             	mov    %eax,(%esp)
 604:	e8 bf 00 00 00       	call   6c8 <close>
  return r;
 609:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 60c:	c9                   	leave  
 60d:	c3                   	ret    

0000060e <atoi>:

int
atoi(const char *s)
{
 60e:	55                   	push   %ebp
 60f:	89 e5                	mov    %esp,%ebp
 611:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 614:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 61b:	eb 25                	jmp    642 <atoi+0x34>
    n = n*10 + *s++ - '0';
 61d:	8b 55 fc             	mov    -0x4(%ebp),%edx
 620:	89 d0                	mov    %edx,%eax
 622:	c1 e0 02             	shl    $0x2,%eax
 625:	01 d0                	add    %edx,%eax
 627:	01 c0                	add    %eax,%eax
 629:	89 c1                	mov    %eax,%ecx
 62b:	8b 45 08             	mov    0x8(%ebp),%eax
 62e:	8d 50 01             	lea    0x1(%eax),%edx
 631:	89 55 08             	mov    %edx,0x8(%ebp)
 634:	0f b6 00             	movzbl (%eax),%eax
 637:	0f be c0             	movsbl %al,%eax
 63a:	01 c8                	add    %ecx,%eax
 63c:	83 e8 30             	sub    $0x30,%eax
 63f:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 642:	8b 45 08             	mov    0x8(%ebp),%eax
 645:	0f b6 00             	movzbl (%eax),%eax
 648:	3c 2f                	cmp    $0x2f,%al
 64a:	7e 0a                	jle    656 <atoi+0x48>
 64c:	8b 45 08             	mov    0x8(%ebp),%eax
 64f:	0f b6 00             	movzbl (%eax),%eax
 652:	3c 39                	cmp    $0x39,%al
 654:	7e c7                	jle    61d <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 656:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 659:	c9                   	leave  
 65a:	c3                   	ret    

0000065b <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 65b:	55                   	push   %ebp
 65c:	89 e5                	mov    %esp,%ebp
 65e:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 661:	8b 45 08             	mov    0x8(%ebp),%eax
 664:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 667:	8b 45 0c             	mov    0xc(%ebp),%eax
 66a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 66d:	eb 17                	jmp    686 <memmove+0x2b>
    *dst++ = *src++;
 66f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 672:	8d 50 01             	lea    0x1(%eax),%edx
 675:	89 55 fc             	mov    %edx,-0x4(%ebp)
 678:	8b 55 f8             	mov    -0x8(%ebp),%edx
 67b:	8d 4a 01             	lea    0x1(%edx),%ecx
 67e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 681:	0f b6 12             	movzbl (%edx),%edx
 684:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 686:	8b 45 10             	mov    0x10(%ebp),%eax
 689:	8d 50 ff             	lea    -0x1(%eax),%edx
 68c:	89 55 10             	mov    %edx,0x10(%ebp)
 68f:	85 c0                	test   %eax,%eax
 691:	7f dc                	jg     66f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 693:	8b 45 08             	mov    0x8(%ebp),%eax
}
 696:	c9                   	leave  
 697:	c3                   	ret    

00000698 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 698:	b8 01 00 00 00       	mov    $0x1,%eax
 69d:	cd 40                	int    $0x40
 69f:	c3                   	ret    

000006a0 <exit>:
SYSCALL(exit)
 6a0:	b8 02 00 00 00       	mov    $0x2,%eax
 6a5:	cd 40                	int    $0x40
 6a7:	c3                   	ret    

000006a8 <wait>:
SYSCALL(wait)
 6a8:	b8 03 00 00 00       	mov    $0x3,%eax
 6ad:	cd 40                	int    $0x40
 6af:	c3                   	ret    

000006b0 <pipe>:
SYSCALL(pipe)
 6b0:	b8 04 00 00 00       	mov    $0x4,%eax
 6b5:	cd 40                	int    $0x40
 6b7:	c3                   	ret    

000006b8 <read>:
SYSCALL(read)
 6b8:	b8 05 00 00 00       	mov    $0x5,%eax
 6bd:	cd 40                	int    $0x40
 6bf:	c3                   	ret    

000006c0 <write>:
SYSCALL(write)
 6c0:	b8 10 00 00 00       	mov    $0x10,%eax
 6c5:	cd 40                	int    $0x40
 6c7:	c3                   	ret    

000006c8 <close>:
SYSCALL(close)
 6c8:	b8 15 00 00 00       	mov    $0x15,%eax
 6cd:	cd 40                	int    $0x40
 6cf:	c3                   	ret    

000006d0 <kill>:
SYSCALL(kill)
 6d0:	b8 06 00 00 00       	mov    $0x6,%eax
 6d5:	cd 40                	int    $0x40
 6d7:	c3                   	ret    

000006d8 <exec>:
SYSCALL(exec)
 6d8:	b8 07 00 00 00       	mov    $0x7,%eax
 6dd:	cd 40                	int    $0x40
 6df:	c3                   	ret    

000006e0 <open>:
SYSCALL(open)
 6e0:	b8 0f 00 00 00       	mov    $0xf,%eax
 6e5:	cd 40                	int    $0x40
 6e7:	c3                   	ret    

000006e8 <mknod>:
SYSCALL(mknod)
 6e8:	b8 11 00 00 00       	mov    $0x11,%eax
 6ed:	cd 40                	int    $0x40
 6ef:	c3                   	ret    

000006f0 <unlink>:
SYSCALL(unlink)
 6f0:	b8 12 00 00 00       	mov    $0x12,%eax
 6f5:	cd 40                	int    $0x40
 6f7:	c3                   	ret    

000006f8 <fstat>:
SYSCALL(fstat)
 6f8:	b8 08 00 00 00       	mov    $0x8,%eax
 6fd:	cd 40                	int    $0x40
 6ff:	c3                   	ret    

00000700 <link>:
SYSCALL(link)
 700:	b8 13 00 00 00       	mov    $0x13,%eax
 705:	cd 40                	int    $0x40
 707:	c3                   	ret    

00000708 <mkdir>:
SYSCALL(mkdir)
 708:	b8 14 00 00 00       	mov    $0x14,%eax
 70d:	cd 40                	int    $0x40
 70f:	c3                   	ret    

00000710 <chdir>:
SYSCALL(chdir)
 710:	b8 09 00 00 00       	mov    $0x9,%eax
 715:	cd 40                	int    $0x40
 717:	c3                   	ret    

00000718 <dup>:
SYSCALL(dup)
 718:	b8 0a 00 00 00       	mov    $0xa,%eax
 71d:	cd 40                	int    $0x40
 71f:	c3                   	ret    

00000720 <getpid>:
SYSCALL(getpid)
 720:	b8 0b 00 00 00       	mov    $0xb,%eax
 725:	cd 40                	int    $0x40
 727:	c3                   	ret    

00000728 <sbrk>:
SYSCALL(sbrk)
 728:	b8 0c 00 00 00       	mov    $0xc,%eax
 72d:	cd 40                	int    $0x40
 72f:	c3                   	ret    

00000730 <sleep>:
SYSCALL(sleep)
 730:	b8 0d 00 00 00       	mov    $0xd,%eax
 735:	cd 40                	int    $0x40
 737:	c3                   	ret    

00000738 <uptime>:
SYSCALL(uptime)
 738:	b8 0e 00 00 00       	mov    $0xe,%eax
 73d:	cd 40                	int    $0x40
 73f:	c3                   	ret    

00000740 <clone>:
SYSCALL(clone)
 740:	b8 16 00 00 00       	mov    $0x16,%eax
 745:	cd 40                	int    $0x40
 747:	c3                   	ret    

00000748 <texit>:
SYSCALL(texit)
 748:	b8 17 00 00 00       	mov    $0x17,%eax
 74d:	cd 40                	int    $0x40
 74f:	c3                   	ret    

00000750 <tsleep>:
SYSCALL(tsleep)
 750:	b8 18 00 00 00       	mov    $0x18,%eax
 755:	cd 40                	int    $0x40
 757:	c3                   	ret    

00000758 <twakeup>:
SYSCALL(twakeup)
 758:	b8 19 00 00 00       	mov    $0x19,%eax
 75d:	cd 40                	int    $0x40
 75f:	c3                   	ret    

00000760 <test>:
SYSCALL(test)
 760:	b8 1a 00 00 00       	mov    $0x1a,%eax
 765:	cd 40                	int    $0x40
 767:	c3                   	ret    

00000768 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 768:	55                   	push   %ebp
 769:	89 e5                	mov    %esp,%ebp
 76b:	83 ec 18             	sub    $0x18,%esp
 76e:	8b 45 0c             	mov    0xc(%ebp),%eax
 771:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 774:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 77b:	00 
 77c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 77f:	89 44 24 04          	mov    %eax,0x4(%esp)
 783:	8b 45 08             	mov    0x8(%ebp),%eax
 786:	89 04 24             	mov    %eax,(%esp)
 789:	e8 32 ff ff ff       	call   6c0 <write>
}
 78e:	c9                   	leave  
 78f:	c3                   	ret    

00000790 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	56                   	push   %esi
 794:	53                   	push   %ebx
 795:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 798:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 79f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 7a3:	74 17                	je     7bc <printint+0x2c>
 7a5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 7a9:	79 11                	jns    7bc <printint+0x2c>
    neg = 1;
 7ab:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 7b2:	8b 45 0c             	mov    0xc(%ebp),%eax
 7b5:	f7 d8                	neg    %eax
 7b7:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7ba:	eb 06                	jmp    7c2 <printint+0x32>
  } else {
    x = xx;
 7bc:	8b 45 0c             	mov    0xc(%ebp),%eax
 7bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 7c2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 7c9:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 7cc:	8d 41 01             	lea    0x1(%ecx),%eax
 7cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
 7d2:	8b 5d 10             	mov    0x10(%ebp),%ebx
 7d5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7d8:	ba 00 00 00 00       	mov    $0x0,%edx
 7dd:	f7 f3                	div    %ebx
 7df:	89 d0                	mov    %edx,%eax
 7e1:	0f b6 80 1c 15 00 00 	movzbl 0x151c(%eax),%eax
 7e8:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 7ec:	8b 75 10             	mov    0x10(%ebp),%esi
 7ef:	8b 45 ec             	mov    -0x14(%ebp),%eax
 7f2:	ba 00 00 00 00       	mov    $0x0,%edx
 7f7:	f7 f6                	div    %esi
 7f9:	89 45 ec             	mov    %eax,-0x14(%ebp)
 7fc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 800:	75 c7                	jne    7c9 <printint+0x39>
  if(neg)
 802:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 806:	74 10                	je     818 <printint+0x88>
    buf[i++] = '-';
 808:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80b:	8d 50 01             	lea    0x1(%eax),%edx
 80e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 811:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 816:	eb 1f                	jmp    837 <printint+0xa7>
 818:	eb 1d                	jmp    837 <printint+0xa7>
    putc(fd, buf[i]);
 81a:	8d 55 dc             	lea    -0x24(%ebp),%edx
 81d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 820:	01 d0                	add    %edx,%eax
 822:	0f b6 00             	movzbl (%eax),%eax
 825:	0f be c0             	movsbl %al,%eax
 828:	89 44 24 04          	mov    %eax,0x4(%esp)
 82c:	8b 45 08             	mov    0x8(%ebp),%eax
 82f:	89 04 24             	mov    %eax,(%esp)
 832:	e8 31 ff ff ff       	call   768 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 837:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 83b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 83f:	79 d9                	jns    81a <printint+0x8a>
    putc(fd, buf[i]);
}
 841:	83 c4 30             	add    $0x30,%esp
 844:	5b                   	pop    %ebx
 845:	5e                   	pop    %esi
 846:	5d                   	pop    %ebp
 847:	c3                   	ret    

00000848 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 848:	55                   	push   %ebp
 849:	89 e5                	mov    %esp,%ebp
 84b:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 84e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 855:	8d 45 0c             	lea    0xc(%ebp),%eax
 858:	83 c0 04             	add    $0x4,%eax
 85b:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 85e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 865:	e9 7c 01 00 00       	jmp    9e6 <printf+0x19e>
    c = fmt[i] & 0xff;
 86a:	8b 55 0c             	mov    0xc(%ebp),%edx
 86d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 870:	01 d0                	add    %edx,%eax
 872:	0f b6 00             	movzbl (%eax),%eax
 875:	0f be c0             	movsbl %al,%eax
 878:	25 ff 00 00 00       	and    $0xff,%eax
 87d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 880:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 884:	75 2c                	jne    8b2 <printf+0x6a>
      if(c == '%'){
 886:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 88a:	75 0c                	jne    898 <printf+0x50>
        state = '%';
 88c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 893:	e9 4a 01 00 00       	jmp    9e2 <printf+0x19a>
      } else {
        putc(fd, c);
 898:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 89b:	0f be c0             	movsbl %al,%eax
 89e:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a2:	8b 45 08             	mov    0x8(%ebp),%eax
 8a5:	89 04 24             	mov    %eax,(%esp)
 8a8:	e8 bb fe ff ff       	call   768 <putc>
 8ad:	e9 30 01 00 00       	jmp    9e2 <printf+0x19a>
      }
    } else if(state == '%'){
 8b2:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 8b6:	0f 85 26 01 00 00    	jne    9e2 <printf+0x19a>
      if(c == 'd'){
 8bc:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 8c0:	75 2d                	jne    8ef <printf+0xa7>
        printint(fd, *ap, 10, 1);
 8c2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8c5:	8b 00                	mov    (%eax),%eax
 8c7:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 8ce:	00 
 8cf:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 8d6:	00 
 8d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8db:	8b 45 08             	mov    0x8(%ebp),%eax
 8de:	89 04 24             	mov    %eax,(%esp)
 8e1:	e8 aa fe ff ff       	call   790 <printint>
        ap++;
 8e6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8ea:	e9 ec 00 00 00       	jmp    9db <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 8ef:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 8f3:	74 06                	je     8fb <printf+0xb3>
 8f5:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 8f9:	75 2d                	jne    928 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 8fb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8fe:	8b 00                	mov    (%eax),%eax
 900:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 907:	00 
 908:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 90f:	00 
 910:	89 44 24 04          	mov    %eax,0x4(%esp)
 914:	8b 45 08             	mov    0x8(%ebp),%eax
 917:	89 04 24             	mov    %eax,(%esp)
 91a:	e8 71 fe ff ff       	call   790 <printint>
        ap++;
 91f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 923:	e9 b3 00 00 00       	jmp    9db <printf+0x193>
      } else if(c == 's'){
 928:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 92c:	75 45                	jne    973 <printf+0x12b>
        s = (char*)*ap;
 92e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 931:	8b 00                	mov    (%eax),%eax
 933:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 936:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 93a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 93e:	75 09                	jne    949 <printf+0x101>
          s = "(null)";
 940:	c7 45 f4 a8 10 00 00 	movl   $0x10a8,-0xc(%ebp)
        while(*s != 0){
 947:	eb 1e                	jmp    967 <printf+0x11f>
 949:	eb 1c                	jmp    967 <printf+0x11f>
          putc(fd, *s);
 94b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 94e:	0f b6 00             	movzbl (%eax),%eax
 951:	0f be c0             	movsbl %al,%eax
 954:	89 44 24 04          	mov    %eax,0x4(%esp)
 958:	8b 45 08             	mov    0x8(%ebp),%eax
 95b:	89 04 24             	mov    %eax,(%esp)
 95e:	e8 05 fe ff ff       	call   768 <putc>
          s++;
 963:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 967:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96a:	0f b6 00             	movzbl (%eax),%eax
 96d:	84 c0                	test   %al,%al
 96f:	75 da                	jne    94b <printf+0x103>
 971:	eb 68                	jmp    9db <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 973:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 977:	75 1d                	jne    996 <printf+0x14e>
        putc(fd, *ap);
 979:	8b 45 e8             	mov    -0x18(%ebp),%eax
 97c:	8b 00                	mov    (%eax),%eax
 97e:	0f be c0             	movsbl %al,%eax
 981:	89 44 24 04          	mov    %eax,0x4(%esp)
 985:	8b 45 08             	mov    0x8(%ebp),%eax
 988:	89 04 24             	mov    %eax,(%esp)
 98b:	e8 d8 fd ff ff       	call   768 <putc>
        ap++;
 990:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 994:	eb 45                	jmp    9db <printf+0x193>
      } else if(c == '%'){
 996:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 99a:	75 17                	jne    9b3 <printf+0x16b>
        putc(fd, c);
 99c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 99f:	0f be c0             	movsbl %al,%eax
 9a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 9a6:	8b 45 08             	mov    0x8(%ebp),%eax
 9a9:	89 04 24             	mov    %eax,(%esp)
 9ac:	e8 b7 fd ff ff       	call   768 <putc>
 9b1:	eb 28                	jmp    9db <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 9b3:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 9ba:	00 
 9bb:	8b 45 08             	mov    0x8(%ebp),%eax
 9be:	89 04 24             	mov    %eax,(%esp)
 9c1:	e8 a2 fd ff ff       	call   768 <putc>
        putc(fd, c);
 9c6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 9c9:	0f be c0             	movsbl %al,%eax
 9cc:	89 44 24 04          	mov    %eax,0x4(%esp)
 9d0:	8b 45 08             	mov    0x8(%ebp),%eax
 9d3:	89 04 24             	mov    %eax,(%esp)
 9d6:	e8 8d fd ff ff       	call   768 <putc>
      }
      state = 0;
 9db:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 9e2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 9e6:	8b 55 0c             	mov    0xc(%ebp),%edx
 9e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ec:	01 d0                	add    %edx,%eax
 9ee:	0f b6 00             	movzbl (%eax),%eax
 9f1:	84 c0                	test   %al,%al
 9f3:	0f 85 71 fe ff ff    	jne    86a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 9f9:	c9                   	leave  
 9fa:	c3                   	ret    

000009fb <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 9fb:	55                   	push   %ebp
 9fc:	89 e5                	mov    %esp,%ebp
 9fe:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 a01:	8b 45 08             	mov    0x8(%ebp),%eax
 a04:	83 e8 08             	sub    $0x8,%eax
 a07:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a0a:	a1 54 15 00 00       	mov    0x1554,%eax
 a0f:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a12:	eb 24                	jmp    a38 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 a14:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a17:	8b 00                	mov    (%eax),%eax
 a19:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a1c:	77 12                	ja     a30 <free+0x35>
 a1e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a21:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a24:	77 24                	ja     a4a <free+0x4f>
 a26:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a29:	8b 00                	mov    (%eax),%eax
 a2b:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a2e:	77 1a                	ja     a4a <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 a30:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a33:	8b 00                	mov    (%eax),%eax
 a35:	89 45 fc             	mov    %eax,-0x4(%ebp)
 a38:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a3b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 a3e:	76 d4                	jbe    a14 <free+0x19>
 a40:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a43:	8b 00                	mov    (%eax),%eax
 a45:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 a48:	76 ca                	jbe    a14 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 a4a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a4d:	8b 40 04             	mov    0x4(%eax),%eax
 a50:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 a57:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a5a:	01 c2                	add    %eax,%edx
 a5c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a5f:	8b 00                	mov    (%eax),%eax
 a61:	39 c2                	cmp    %eax,%edx
 a63:	75 24                	jne    a89 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 a65:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a68:	8b 50 04             	mov    0x4(%eax),%edx
 a6b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a6e:	8b 00                	mov    (%eax),%eax
 a70:	8b 40 04             	mov    0x4(%eax),%eax
 a73:	01 c2                	add    %eax,%edx
 a75:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a78:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 a7b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a7e:	8b 00                	mov    (%eax),%eax
 a80:	8b 10                	mov    (%eax),%edx
 a82:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a85:	89 10                	mov    %edx,(%eax)
 a87:	eb 0a                	jmp    a93 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 a89:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a8c:	8b 10                	mov    (%eax),%edx
 a8e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 a91:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 a93:	8b 45 fc             	mov    -0x4(%ebp),%eax
 a96:	8b 40 04             	mov    0x4(%eax),%eax
 a99:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 aa0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aa3:	01 d0                	add    %edx,%eax
 aa5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 aa8:	75 20                	jne    aca <free+0xcf>
    p->s.size += bp->s.size;
 aaa:	8b 45 fc             	mov    -0x4(%ebp),%eax
 aad:	8b 50 04             	mov    0x4(%eax),%edx
 ab0:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ab3:	8b 40 04             	mov    0x4(%eax),%eax
 ab6:	01 c2                	add    %eax,%edx
 ab8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 abb:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 abe:	8b 45 f8             	mov    -0x8(%ebp),%eax
 ac1:	8b 10                	mov    (%eax),%edx
 ac3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ac6:	89 10                	mov    %edx,(%eax)
 ac8:	eb 08                	jmp    ad2 <free+0xd7>
  } else
    p->s.ptr = bp;
 aca:	8b 45 fc             	mov    -0x4(%ebp),%eax
 acd:	8b 55 f8             	mov    -0x8(%ebp),%edx
 ad0:	89 10                	mov    %edx,(%eax)
  freep = p;
 ad2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 ad5:	a3 54 15 00 00       	mov    %eax,0x1554
}
 ada:	c9                   	leave  
 adb:	c3                   	ret    

00000adc <morecore>:

static Header*
morecore(uint nu)
{
 adc:	55                   	push   %ebp
 add:	89 e5                	mov    %esp,%ebp
 adf:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 ae2:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 ae9:	77 07                	ja     af2 <morecore+0x16>
    nu = 4096;
 aeb:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 af2:	8b 45 08             	mov    0x8(%ebp),%eax
 af5:	c1 e0 03             	shl    $0x3,%eax
 af8:	89 04 24             	mov    %eax,(%esp)
 afb:	e8 28 fc ff ff       	call   728 <sbrk>
 b00:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 b03:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 b07:	75 07                	jne    b10 <morecore+0x34>
    return 0;
 b09:	b8 00 00 00 00       	mov    $0x0,%eax
 b0e:	eb 22                	jmp    b32 <morecore+0x56>
  hp = (Header*)p;
 b10:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b13:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 b16:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b19:	8b 55 08             	mov    0x8(%ebp),%edx
 b1c:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 b1f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b22:	83 c0 08             	add    $0x8,%eax
 b25:	89 04 24             	mov    %eax,(%esp)
 b28:	e8 ce fe ff ff       	call   9fb <free>
  return freep;
 b2d:	a1 54 15 00 00       	mov    0x1554,%eax
}
 b32:	c9                   	leave  
 b33:	c3                   	ret    

00000b34 <malloc>:

void*
malloc(uint nbytes)
{
 b34:	55                   	push   %ebp
 b35:	89 e5                	mov    %esp,%ebp
 b37:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 b3a:	8b 45 08             	mov    0x8(%ebp),%eax
 b3d:	83 c0 07             	add    $0x7,%eax
 b40:	c1 e8 03             	shr    $0x3,%eax
 b43:	83 c0 01             	add    $0x1,%eax
 b46:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 b49:	a1 54 15 00 00       	mov    0x1554,%eax
 b4e:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b51:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 b55:	75 23                	jne    b7a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 b57:	c7 45 f0 4c 15 00 00 	movl   $0x154c,-0x10(%ebp)
 b5e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b61:	a3 54 15 00 00       	mov    %eax,0x1554
 b66:	a1 54 15 00 00       	mov    0x1554,%eax
 b6b:	a3 4c 15 00 00       	mov    %eax,0x154c
    base.s.size = 0;
 b70:	c7 05 50 15 00 00 00 	movl   $0x0,0x1550
 b77:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b7d:	8b 00                	mov    (%eax),%eax
 b7f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 b82:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b85:	8b 40 04             	mov    0x4(%eax),%eax
 b88:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 b8b:	72 4d                	jb     bda <malloc+0xa6>
      if(p->s.size == nunits)
 b8d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b90:	8b 40 04             	mov    0x4(%eax),%eax
 b93:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 b96:	75 0c                	jne    ba4 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 b98:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b9b:	8b 10                	mov    (%eax),%edx
 b9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ba0:	89 10                	mov    %edx,(%eax)
 ba2:	eb 26                	jmp    bca <malloc+0x96>
      else {
        p->s.size -= nunits;
 ba4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba7:	8b 40 04             	mov    0x4(%eax),%eax
 baa:	2b 45 ec             	sub    -0x14(%ebp),%eax
 bad:	89 c2                	mov    %eax,%edx
 baf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb2:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 bb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb8:	8b 40 04             	mov    0x4(%eax),%eax
 bbb:	c1 e0 03             	shl    $0x3,%eax
 bbe:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 bc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc4:	8b 55 ec             	mov    -0x14(%ebp),%edx
 bc7:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 bca:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bcd:	a3 54 15 00 00       	mov    %eax,0x1554
      return (void*)(p + 1);
 bd2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd5:	83 c0 08             	add    $0x8,%eax
 bd8:	eb 38                	jmp    c12 <malloc+0xde>
    }
    if(p == freep)
 bda:	a1 54 15 00 00       	mov    0x1554,%eax
 bdf:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 be2:	75 1b                	jne    bff <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 be4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 be7:	89 04 24             	mov    %eax,(%esp)
 bea:	e8 ed fe ff ff       	call   adc <morecore>
 bef:	89 45 f4             	mov    %eax,-0xc(%ebp)
 bf2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 bf6:	75 07                	jne    bff <malloc+0xcb>
        return 0;
 bf8:	b8 00 00 00 00       	mov    $0x0,%eax
 bfd:	eb 13                	jmp    c12 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 bff:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c02:	89 45 f0             	mov    %eax,-0x10(%ebp)
 c05:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c08:	8b 00                	mov    (%eax),%eax
 c0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 c0d:	e9 70 ff ff ff       	jmp    b82 <malloc+0x4e>
}
 c12:	c9                   	leave  
 c13:	c3                   	ret    

00000c14 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 c14:	55                   	push   %ebp
 c15:	89 e5                	mov    %esp,%ebp
 c17:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 c1a:	8b 55 08             	mov    0x8(%ebp),%edx
 c1d:	8b 45 0c             	mov    0xc(%ebp),%eax
 c20:	8b 4d 08             	mov    0x8(%ebp),%ecx
 c23:	f0 87 02             	lock xchg %eax,(%edx)
 c26:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 c29:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 c2c:	c9                   	leave  
 c2d:	c3                   	ret    

00000c2e <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 c2e:	55                   	push   %ebp
 c2f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 c31:	8b 45 08             	mov    0x8(%ebp),%eax
 c34:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 c3a:	5d                   	pop    %ebp
 c3b:	c3                   	ret    

00000c3c <lock_acquire>:
void lock_acquire(lock_t *lock){
 c3c:	55                   	push   %ebp
 c3d:	89 e5                	mov    %esp,%ebp
 c3f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 c42:	90                   	nop
 c43:	8b 45 08             	mov    0x8(%ebp),%eax
 c46:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 c4d:	00 
 c4e:	89 04 24             	mov    %eax,(%esp)
 c51:	e8 be ff ff ff       	call   c14 <xchg>
 c56:	85 c0                	test   %eax,%eax
 c58:	75 e9                	jne    c43 <lock_acquire+0x7>
}
 c5a:	c9                   	leave  
 c5b:	c3                   	ret    

00000c5c <lock_release>:
void lock_release(lock_t *lock){
 c5c:	55                   	push   %ebp
 c5d:	89 e5                	mov    %esp,%ebp
 c5f:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 c62:	8b 45 08             	mov    0x8(%ebp),%eax
 c65:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 c6c:	00 
 c6d:	89 04 24             	mov    %eax,(%esp)
 c70:	e8 9f ff ff ff       	call   c14 <xchg>
}
 c75:	c9                   	leave  
 c76:	c3                   	ret    

00000c77 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 c77:	55                   	push   %ebp
 c78:	89 e5                	mov    %esp,%ebp
 c7a:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 c7d:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 c84:	e8 ab fe ff ff       	call   b34 <malloc>
 c89:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 c8c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 c92:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c95:	25 ff 0f 00 00       	and    $0xfff,%eax
 c9a:	85 c0                	test   %eax,%eax
 c9c:	74 14                	je     cb2 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 c9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ca1:	25 ff 0f 00 00       	and    $0xfff,%eax
 ca6:	89 c2                	mov    %eax,%edx
 ca8:	b8 00 10 00 00       	mov    $0x1000,%eax
 cad:	29 d0                	sub    %edx,%eax
 caf:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 cb2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 cb6:	75 1b                	jne    cd3 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 cb8:	c7 44 24 04 af 10 00 	movl   $0x10af,0x4(%esp)
 cbf:	00 
 cc0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 cc7:	e8 7c fb ff ff       	call   848 <printf>
        return 0;
 ccc:	b8 00 00 00 00       	mov    $0x0,%eax
 cd1:	eb 6f                	jmp    d42 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 cd3:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 cd6:	8b 55 08             	mov    0x8(%ebp),%edx
 cd9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cdc:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 ce0:	89 54 24 08          	mov    %edx,0x8(%esp)
 ce4:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 ceb:	00 
 cec:	89 04 24             	mov    %eax,(%esp)
 cef:	e8 4c fa ff ff       	call   740 <clone>
 cf4:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 cf7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 cfb:	79 1b                	jns    d18 <thread_create+0xa1>
        printf(1,"clone fails\n");
 cfd:	c7 44 24 04 bd 10 00 	movl   $0x10bd,0x4(%esp)
 d04:	00 
 d05:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d0c:	e8 37 fb ff ff       	call   848 <printf>
        return 0;
 d11:	b8 00 00 00 00       	mov    $0x0,%eax
 d16:	eb 2a                	jmp    d42 <thread_create+0xcb>
    }
    if(tid > 0){
 d18:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 d1c:	7e 05                	jle    d23 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 d1e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d21:	eb 1f                	jmp    d42 <thread_create+0xcb>
    }
    if(tid == 0){
 d23:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 d27:	75 14                	jne    d3d <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 d29:	c7 44 24 04 ca 10 00 	movl   $0x10ca,0x4(%esp)
 d30:	00 
 d31:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d38:	e8 0b fb ff ff       	call   848 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 d3d:	b8 00 00 00 00       	mov    $0x0,%eax
}
 d42:	c9                   	leave  
 d43:	c3                   	ret    

00000d44 <random>:

unsigned long rands = 1;
// generate 0 -> max random number exclude max.
int random(int max){
 d44:	55                   	push   %ebp
 d45:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
 d47:	a1 30 15 00 00       	mov    0x1530,%eax
 d4c:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
 d52:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
 d57:	a3 30 15 00 00       	mov    %eax,0x1530
    return (int)(rands % max);
 d5c:	a1 30 15 00 00       	mov    0x1530,%eax
 d61:	8b 4d 08             	mov    0x8(%ebp),%ecx
 d64:	ba 00 00 00 00       	mov    $0x0,%edx
 d69:	f7 f1                	div    %ecx
 d6b:	89 d0                	mov    %edx,%eax
 d6d:	5d                   	pop    %ebp
 d6e:	c3                   	ret    

00000d6f <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 d6f:	55                   	push   %ebp
 d70:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 d72:	8b 45 08             	mov    0x8(%ebp),%eax
 d75:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 d7b:	8b 45 08             	mov    0x8(%ebp),%eax
 d7e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 d85:	8b 45 08             	mov    0x8(%ebp),%eax
 d88:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 d8f:	5d                   	pop    %ebp
 d90:	c3                   	ret    

00000d91 <add_q>:

void add_q(struct queue *q, int v){
 d91:	55                   	push   %ebp
 d92:	89 e5                	mov    %esp,%ebp
 d94:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 d97:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 d9e:	e8 91 fd ff ff       	call   b34 <malloc>
 da3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 da6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 da9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 db0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 db3:	8b 55 0c             	mov    0xc(%ebp),%edx
 db6:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 db8:	8b 45 08             	mov    0x8(%ebp),%eax
 dbb:	8b 40 04             	mov    0x4(%eax),%eax
 dbe:	85 c0                	test   %eax,%eax
 dc0:	75 0b                	jne    dcd <add_q+0x3c>
        q->head = n;
 dc2:	8b 45 08             	mov    0x8(%ebp),%eax
 dc5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 dc8:	89 50 04             	mov    %edx,0x4(%eax)
 dcb:	eb 0c                	jmp    dd9 <add_q+0x48>
    }else{
        q->tail->next = n;
 dcd:	8b 45 08             	mov    0x8(%ebp),%eax
 dd0:	8b 40 08             	mov    0x8(%eax),%eax
 dd3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 dd6:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 dd9:	8b 45 08             	mov    0x8(%ebp),%eax
 ddc:	8b 55 f4             	mov    -0xc(%ebp),%edx
 ddf:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 de2:	8b 45 08             	mov    0x8(%ebp),%eax
 de5:	8b 00                	mov    (%eax),%eax
 de7:	8d 50 01             	lea    0x1(%eax),%edx
 dea:	8b 45 08             	mov    0x8(%ebp),%eax
 ded:	89 10                	mov    %edx,(%eax)
}
 def:	c9                   	leave  
 df0:	c3                   	ret    

00000df1 <empty_q>:

int empty_q(struct queue *q){
 df1:	55                   	push   %ebp
 df2:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 df4:	8b 45 08             	mov    0x8(%ebp),%eax
 df7:	8b 00                	mov    (%eax),%eax
 df9:	85 c0                	test   %eax,%eax
 dfb:	75 07                	jne    e04 <empty_q+0x13>
        return 1;
 dfd:	b8 01 00 00 00       	mov    $0x1,%eax
 e02:	eb 05                	jmp    e09 <empty_q+0x18>
    else
        return 0;
 e04:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 e09:	5d                   	pop    %ebp
 e0a:	c3                   	ret    

00000e0b <pop_q>:
int pop_q(struct queue *q){
 e0b:	55                   	push   %ebp
 e0c:	89 e5                	mov    %esp,%ebp
 e0e:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 e11:	8b 45 08             	mov    0x8(%ebp),%eax
 e14:	89 04 24             	mov    %eax,(%esp)
 e17:	e8 d5 ff ff ff       	call   df1 <empty_q>
 e1c:	85 c0                	test   %eax,%eax
 e1e:	75 5d                	jne    e7d <pop_q+0x72>
       val = q->head->value; 
 e20:	8b 45 08             	mov    0x8(%ebp),%eax
 e23:	8b 40 04             	mov    0x4(%eax),%eax
 e26:	8b 00                	mov    (%eax),%eax
 e28:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 e2b:	8b 45 08             	mov    0x8(%ebp),%eax
 e2e:	8b 40 04             	mov    0x4(%eax),%eax
 e31:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 e34:	8b 45 08             	mov    0x8(%ebp),%eax
 e37:	8b 40 04             	mov    0x4(%eax),%eax
 e3a:	8b 50 04             	mov    0x4(%eax),%edx
 e3d:	8b 45 08             	mov    0x8(%ebp),%eax
 e40:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 e43:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e46:	89 04 24             	mov    %eax,(%esp)
 e49:	e8 ad fb ff ff       	call   9fb <free>
       q->size--;
 e4e:	8b 45 08             	mov    0x8(%ebp),%eax
 e51:	8b 00                	mov    (%eax),%eax
 e53:	8d 50 ff             	lea    -0x1(%eax),%edx
 e56:	8b 45 08             	mov    0x8(%ebp),%eax
 e59:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 e5b:	8b 45 08             	mov    0x8(%ebp),%eax
 e5e:	8b 00                	mov    (%eax),%eax
 e60:	85 c0                	test   %eax,%eax
 e62:	75 14                	jne    e78 <pop_q+0x6d>
            q->head = 0;
 e64:	8b 45 08             	mov    0x8(%ebp),%eax
 e67:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 e6e:	8b 45 08             	mov    0x8(%ebp),%eax
 e71:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 e78:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e7b:	eb 05                	jmp    e82 <pop_q+0x77>
    }
    return -1;
 e7d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 e82:	c9                   	leave  
 e83:	c3                   	ret    

00000e84 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 e84:	55                   	push   %ebp
 e85:	89 e5                	mov    %esp,%ebp
 e87:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 e8a:	8b 45 08             	mov    0x8(%ebp),%eax
 e8d:	8b 55 0c             	mov    0xc(%ebp),%edx
 e90:	89 50 08             	mov    %edx,0x8(%eax)
	s->count = size;
 e93:	8b 45 08             	mov    0x8(%ebp),%eax
 e96:	8b 55 0c             	mov    0xc(%ebp),%edx
 e99:	89 50 04             	mov    %edx,0x4(%eax)
	lock_init(&s->lock);
 e9c:	8b 45 08             	mov    0x8(%ebp),%eax
 e9f:	89 04 24             	mov    %eax,(%esp)
 ea2:	e8 87 fd ff ff       	call   c2e <lock_init>
}
 ea7:	c9                   	leave  
 ea8:	c3                   	ret    

00000ea9 <sem_init_full>:

void 
sem_init_full(struct semaphore *s, int size){
 ea9:	55                   	push   %ebp
 eaa:	89 e5                	mov    %esp,%ebp
 eac:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 eaf:	8b 45 08             	mov    0x8(%ebp),%eax
 eb2:	8b 55 0c             	mov    0xc(%ebp),%edx
 eb5:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 eb8:	8b 45 08             	mov    0x8(%ebp),%eax
 ebb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock);
 ec2:	8b 45 08             	mov    0x8(%ebp),%eax
 ec5:	89 04 24             	mov    %eax,(%esp)
 ec8:	e8 61 fd ff ff       	call   c2e <lock_init>
}
 ecd:	c9                   	leave  
 ece:	c3                   	ret    

00000ecf <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 ecf:	55                   	push   %ebp
 ed0:	89 e5                	mov    %esp,%ebp
 ed2:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 ed5:	8b 45 08             	mov    0x8(%ebp),%eax
 ed8:	89 04 24             	mov    %eax,(%esp)
 edb:	e8 5c fd ff ff       	call   c3c <lock_acquire>
	if(s->count  == 0){
 ee0:	8b 45 08             	mov    0x8(%ebp),%eax
 ee3:	8b 40 04             	mov    0x4(%eax),%eax
 ee6:	85 c0                	test   %eax,%eax
 ee8:	75 2f                	jne    f19 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 eea:	e8 31 f8 ff ff       	call   720 <getpid>
 eef:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 ef2:	8b 45 08             	mov    0x8(%ebp),%eax
 ef5:	8d 50 0c             	lea    0xc(%eax),%edx
 ef8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 efb:	89 44 24 04          	mov    %eax,0x4(%esp)
 eff:	89 14 24             	mov    %edx,(%esp)
 f02:	e8 8a fe ff ff       	call   d91 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 f07:	8b 45 08             	mov    0x8(%ebp),%eax
 f0a:	89 04 24             	mov    %eax,(%esp)
 f0d:	e8 4a fd ff ff       	call   c5c <lock_release>
		tsleep(); 
 f12:	e8 39 f8 ff ff       	call   750 <tsleep>
 f17:	eb 1a                	jmp    f33 <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 f19:	8b 45 08             	mov    0x8(%ebp),%eax
 f1c:	8b 40 04             	mov    0x4(%eax),%eax
 f1f:	8d 50 ff             	lea    -0x1(%eax),%edx
 f22:	8b 45 08             	mov    0x8(%ebp),%eax
 f25:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 f28:	8b 45 08             	mov    0x8(%ebp),%eax
 f2b:	89 04 24             	mov    %eax,(%esp)
 f2e:	e8 29 fd ff ff       	call   c5c <lock_release>
	}
}
 f33:	c9                   	leave  
 f34:	c3                   	ret    

00000f35 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 f35:	55                   	push   %ebp
 f36:	89 e5                	mov    %esp,%ebp
 f38:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 f3b:	8b 45 08             	mov    0x8(%ebp),%eax
 f3e:	89 04 24             	mov    %eax,(%esp)
 f41:	e8 f6 fc ff ff       	call   c3c <lock_acquire>
	if(s->count < s->size){
 f46:	8b 45 08             	mov    0x8(%ebp),%eax
 f49:	8b 50 04             	mov    0x4(%eax),%edx
 f4c:	8b 45 08             	mov    0x8(%ebp),%eax
 f4f:	8b 40 08             	mov    0x8(%eax),%eax
 f52:	39 c2                	cmp    %eax,%edx
 f54:	7d 0f                	jge    f65 <sem_signal+0x30>
		s->count++;	
 f56:	8b 45 08             	mov    0x8(%ebp),%eax
 f59:	8b 40 04             	mov    0x4(%eax),%eax
 f5c:	8d 50 01             	lea    0x1(%eax),%edx
 f5f:	8b 45 08             	mov    0x8(%ebp),%eax
 f62:	89 50 04             	mov    %edx,0x4(%eax)
	}

	int tid;
	tid = pop_q(&s->waiters);
 f65:	8b 45 08             	mov    0x8(%ebp),%eax
 f68:	83 c0 0c             	add    $0xc,%eax
 f6b:	89 04 24             	mov    %eax,(%esp)
 f6e:	e8 98 fe ff ff       	call   e0b <pop_q>
 f73:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 f76:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 f7a:	74 2e                	je     faa <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 f7c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 f7f:	89 04 24             	mov    %eax,(%esp)
 f82:	e8 d1 f7 ff ff       	call   758 <twakeup>
		s->count--;
 f87:	8b 45 08             	mov    0x8(%ebp),%eax
 f8a:	8b 40 04             	mov    0x4(%eax),%eax
 f8d:	8d 50 ff             	lea    -0x1(%eax),%edx
 f90:	8b 45 08             	mov    0x8(%ebp),%eax
 f93:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 f96:	8b 45 08             	mov    0x8(%ebp),%eax
 f99:	8b 40 04             	mov    0x4(%eax),%eax
 f9c:	85 c0                	test   %eax,%eax
 f9e:	79 0a                	jns    faa <sem_signal+0x75>
 fa0:	8b 45 08             	mov    0x8(%ebp),%eax
 fa3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 faa:	8b 45 08             	mov    0x8(%ebp),%eax
 fad:	89 04 24             	mov    %eax,(%esp)
 fb0:	e8 a7 fc ff ff       	call   c5c <lock_release>

 fb5:	c9                   	leave  
 fb6:	c3                   	ret    
