
_monkey:     file format elf32-i386


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
  11:	c7 04 24 20 14 00 00 	movl   $0x1420,(%esp)
  18:	e8 07 0d 00 00       	call   d24 <sem_init>
  sem_init(&printer, 1);
  1d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  24:	00 
  25:	c7 04 24 e0 13 00 00 	movl   $0x13e0,(%esp)
  2c:	e8 f3 0c 00 00       	call   d24 <sem_init>
  sem_init(&printer_mutex1, 1);
  31:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  38:	00 
  39:	c7 04 24 60 14 00 00 	movl   $0x1460,(%esp)
  40:	e8 df 0c 00 00       	call   d24 <sem_init>
  sem_init(&printer_mutex2, 1);
  45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 e0 14 00 00 	movl   $0x14e0,(%esp)
  54:	e8 cb 0c 00 00       	call   d24 <sem_init>
  sem_init(&mutex, 1);
  59:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  60:	00 
  61:	c7 04 24 a0 14 00 00 	movl   $0x14a0,(%esp)
  68:	e8 b7 0c 00 00       	call   d24 <sem_init>
	
	int i;
	for(i = 0; i < 5; i++) thread_create(monkey, 0);
  6d:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  74:	00 
  75:	eb 19                	jmp    90 <main+0x90>
  77:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  7e:	00 
  7f:	c7 04 24 ba 00 00 00 	movl   $0xba,(%esp)
  86:	e8 8c 0a 00 00       	call   b17 <thread_create>
  8b:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  90:	83 7c 24 1c 04       	cmpl   $0x4,0x1c(%esp)
  95:	7e e0                	jle    77 <main+0x77>
    while(wait() > 0);
  97:	90                   	nop
  98:	e8 ab 04 00 00       	call   548 <wait>
  9d:	85 c0                	test   %eax,%eax
  9f:	7f f7                	jg     98 <main+0x98>
	printf(1,"All monkeys are full\n");
  a1:	c7 44 24 04 58 0e 00 	movl   $0xe58,0x4(%esp)
  a8:	00 
  a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b0:	e8 33 06 00 00       	call   6e8 <printf>
	exit();
  b5:	e8 86 04 00 00       	call   540 <exit>

000000ba <monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
  ba:	55                   	push   %ebp
  bb:	89 e5                	mov    %esp,%ebp
  bd:	83 ec 28             	sub    $0x28,%esp

  int pid =  getpid();
  c0:	e8 fb 04 00 00       	call   5c0 <getpid>
  c5:	89 45 f4             	mov    %eax,-0xc(%ebp)

  sem_aquire(&printer_mutex1);
  c8:	c7 04 24 60 14 00 00 	movl   $0x1460,(%esp)
  cf:	e8 9b 0c 00 00       	call   d6f <sem_aquire>
  printMessage(pid, 1);
  d4:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  db:	00 
  dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  df:	89 04 24             	mov    %eax,(%esp)
  e2:	e8 d0 00 00 00       	call   1b7 <printMessage>
  sem_aquire(&wait_tree);
  e7:	c7 04 24 20 14 00 00 	movl   $0x1420,(%esp)
  ee:	e8 7c 0c 00 00       	call   d6f <sem_aquire>

  sem_aquire(&mutex);
  f3:	c7 04 24 a0 14 00 00 	movl   $0x14a0,(%esp)
  fa:	e8 70 0c 00 00       	call   d6f <sem_aquire>
  monkeys_on_tree++;
  ff:	a1 c0 13 00 00       	mov    0x13c0,%eax
 104:	83 c0 01             	add    $0x1,%eax
 107:	a3 c0 13 00 00       	mov    %eax,0x13c0
  sem_signal(&mutex); 
 10c:	c7 04 24 a0 14 00 00 	movl   $0x14a0,(%esp)
 113:	e8 bd 0c 00 00       	call   dd5 <sem_signal>

  printMessage(pid, 2); 
 118:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 11f:	00 
 120:	8b 45 f4             	mov    -0xc(%ebp),%eax
 123:	89 04 24             	mov    %eax,(%esp)
 126:	e8 8c 00 00 00       	call   1b7 <printMessage>
  sem_signal(&printer_mutex1); 
 12b:	c7 04 24 60 14 00 00 	movl   $0x1460,(%esp)
 132:	e8 9e 0c 00 00       	call   dd5 <sem_signal>

  sleep(100);   // Get coconut
 137:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 13e:	e8 8d 04 00 00       	call   5d0 <sleep>

  printMessage(pid, 6); // Got a coconut
 143:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
 14a:	00 
 14b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 14e:	89 04 24             	mov    %eax,(%esp)
 151:	e8 61 00 00 00       	call   1b7 <printMessage>

  //printMessage(pid, 3); //Climbing down tree

  sem_aquire(&printer_mutex2);
 156:	c7 04 24 e0 14 00 00 	movl   $0x14e0,(%esp)
 15d:	e8 0d 0c 00 00       	call   d6f <sem_aquire>
  //printMessage(pid, 5); // On the ground

  sem_signal(&wait_tree);
 162:	c7 04 24 20 14 00 00 	movl   $0x1420,(%esp)
 169:	e8 67 0c 00 00       	call   dd5 <sem_signal>


  sem_signal(&printer_mutex2); 
 16e:	c7 04 24 e0 14 00 00 	movl   $0x14e0,(%esp)
 175:	e8 5b 0c 00 00       	call   dd5 <sem_signal>
  
  sem_aquire(&mutex);
 17a:	c7 04 24 a0 14 00 00 	movl   $0x14a0,(%esp)
 181:	e8 e9 0b 00 00       	call   d6f <sem_aquire>
  monkeys_on_tree--;
 186:	a1 c0 13 00 00       	mov    0x13c0,%eax
 18b:	83 e8 01             	sub    $0x1,%eax
 18e:	a3 c0 13 00 00       	mov    %eax,0x13c0
  sem_signal(&mutex); 
 193:	c7 04 24 a0 14 00 00 	movl   $0x14a0,(%esp)
 19a:	e8 36 0c 00 00       	call   dd5 <sem_signal>
  
  printMessage(pid, 3); // Eating Banana
 19f:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
 1a6:	00 
 1a7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1aa:	89 04 24             	mov    %eax,(%esp)
 1ad:	e8 05 00 00 00       	call   1b7 <printMessage>

  texit();
 1b2:	e8 31 04 00 00       	call   5e8 <texit>

000001b7 <printMessage>:
}

void printMessage(int pid, int state){
 1b7:	55                   	push   %ebp
 1b8:	89 e5                	mov    %esp,%ebp
 1ba:	83 ec 18             	sub    $0x18,%esp
  sem_aquire(&printer);
 1bd:	c7 04 24 e0 13 00 00 	movl   $0x13e0,(%esp)
 1c4:	e8 a6 0b 00 00       	call   d6f <sem_aquire>
  printf(1, "Monkey(%d)",pid);
 1c9:	8b 45 08             	mov    0x8(%ebp),%eax
 1cc:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d0:	c7 44 24 04 6e 0e 00 	movl   $0xe6e,0x4(%esp)
 1d7:	00 
 1d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1df:	e8 04 05 00 00       	call   6e8 <printf>
  //printf(1, " - %d", state); 
  switch(state){
 1e4:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
 1e8:	0f 87 bf 00 00 00    	ja     2ad <printMessage+0xf6>
 1ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f1:	c1 e0 02             	shl    $0x2,%eax
 1f4:	05 0c 0f 00 00       	add    $0xf0c,%eax
 1f9:	8b 00                	mov    (%eax),%eax
 1fb:	ff e0                	jmp    *%eax
    case(1):
      printf(1, " Waiting  to  climb", state); 
 1fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 200:	89 44 24 08          	mov    %eax,0x8(%esp)
 204:	c7 44 24 04 79 0e 00 	movl   $0xe79,0x4(%esp)
 20b:	00 
 20c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 213:	e8 d0 04 00 00       	call   6e8 <printf>
      break;
 218:	e9 90 00 00 00       	jmp    2ad <printMessage+0xf6>
    case(2):
      printf(1, " Climbing the  tree", state); 
 21d:	8b 45 0c             	mov    0xc(%ebp),%eax
 220:	89 44 24 08          	mov    %eax,0x8(%esp)
 224:	c7 44 24 04 8d 0e 00 	movl   $0xe8d,0x4(%esp)
 22b:	00 
 22c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 233:	e8 b0 04 00 00       	call   6e8 <printf>
      break;
 238:	eb 73                	jmp    2ad <printMessage+0xf6>
    case(3):
      printf(1, " Climbing down tree", state); 
 23a:	8b 45 0c             	mov    0xc(%ebp),%eax
 23d:	89 44 24 08          	mov    %eax,0x8(%esp)
 241:	c7 44 24 04 a1 0e 00 	movl   $0xea1,0x4(%esp)
 248:	00 
 249:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 250:	e8 93 04 00 00       	call   6e8 <printf>
      break;
 255:	eb 56                	jmp    2ad <printMessage+0xf6>
    case(4):
      printf(1, " Eating the  banana", state); 
 257:	8b 45 0c             	mov    0xc(%ebp),%eax
 25a:	89 44 24 08          	mov    %eax,0x8(%esp)
 25e:	c7 44 24 04 b5 0e 00 	movl   $0xeb5,0x4(%esp)
 265:	00 
 266:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 26d:	e8 76 04 00 00       	call   6e8 <printf>
      break;
 272:	eb 39                	jmp    2ad <printMessage+0xf6>
    case(5):
      printf(1, " On the ground safe", state); 
 274:	8b 45 0c             	mov    0xc(%ebp),%eax
 277:	89 44 24 08          	mov    %eax,0x8(%esp)
 27b:	c7 44 24 04 c9 0e 00 	movl   $0xec9,0x4(%esp)
 282:	00 
 283:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 28a:	e8 59 04 00 00       	call   6e8 <printf>
      break;
 28f:	eb 1c                	jmp    2ad <printMessage+0xf6>
    case(6):
      printf(1, " Alright a  coconut", state); 
 291:	8b 45 0c             	mov    0xc(%ebp),%eax
 294:	89 44 24 08          	mov    %eax,0x8(%esp)
 298:	c7 44 24 04 dd 0e 00 	movl   $0xedd,0x4(%esp)
 29f:	00 
 2a0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2a7:	e8 3c 04 00 00       	call   6e8 <printf>
      break;
 2ac:	90                   	nop
  }
  printf(1, " - Monkeys on tree: %d\n", monkeys_on_tree);  
 2ad:	a1 c0 13 00 00       	mov    0x13c0,%eax
 2b2:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b6:	c7 44 24 04 f1 0e 00 	movl   $0xef1,0x4(%esp)
 2bd:	00 
 2be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c5:	e8 1e 04 00 00       	call   6e8 <printf>
  sem_signal(&printer);
 2ca:	c7 04 24 e0 13 00 00 	movl   $0x13e0,(%esp)
 2d1:	e8 ff 0a 00 00       	call   dd5 <sem_signal>
  
 2d6:	c9                   	leave  
 2d7:	c3                   	ret    

000002d8 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 2d8:	55                   	push   %ebp
 2d9:	89 e5                	mov    %esp,%ebp
 2db:	57                   	push   %edi
 2dc:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 2dd:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2e0:	8b 55 10             	mov    0x10(%ebp),%edx
 2e3:	8b 45 0c             	mov    0xc(%ebp),%eax
 2e6:	89 cb                	mov    %ecx,%ebx
 2e8:	89 df                	mov    %ebx,%edi
 2ea:	89 d1                	mov    %edx,%ecx
 2ec:	fc                   	cld    
 2ed:	f3 aa                	rep stos %al,%es:(%edi)
 2ef:	89 ca                	mov    %ecx,%edx
 2f1:	89 fb                	mov    %edi,%ebx
 2f3:	89 5d 08             	mov    %ebx,0x8(%ebp)
 2f6:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 2f9:	5b                   	pop    %ebx
 2fa:	5f                   	pop    %edi
 2fb:	5d                   	pop    %ebp
 2fc:	c3                   	ret    

000002fd <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 2fd:	55                   	push   %ebp
 2fe:	89 e5                	mov    %esp,%ebp
 300:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 303:	8b 45 08             	mov    0x8(%ebp),%eax
 306:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 309:	90                   	nop
 30a:	8b 45 08             	mov    0x8(%ebp),%eax
 30d:	8d 50 01             	lea    0x1(%eax),%edx
 310:	89 55 08             	mov    %edx,0x8(%ebp)
 313:	8b 55 0c             	mov    0xc(%ebp),%edx
 316:	8d 4a 01             	lea    0x1(%edx),%ecx
 319:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 31c:	0f b6 12             	movzbl (%edx),%edx
 31f:	88 10                	mov    %dl,(%eax)
 321:	0f b6 00             	movzbl (%eax),%eax
 324:	84 c0                	test   %al,%al
 326:	75 e2                	jne    30a <strcpy+0xd>
    ;
  return os;
 328:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 32b:	c9                   	leave  
 32c:	c3                   	ret    

0000032d <strcmp>:

int
strcmp(const char *p, const char *q)
{
 32d:	55                   	push   %ebp
 32e:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 330:	eb 08                	jmp    33a <strcmp+0xd>
    p++, q++;
 332:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 336:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
 33d:	0f b6 00             	movzbl (%eax),%eax
 340:	84 c0                	test   %al,%al
 342:	74 10                	je     354 <strcmp+0x27>
 344:	8b 45 08             	mov    0x8(%ebp),%eax
 347:	0f b6 10             	movzbl (%eax),%edx
 34a:	8b 45 0c             	mov    0xc(%ebp),%eax
 34d:	0f b6 00             	movzbl (%eax),%eax
 350:	38 c2                	cmp    %al,%dl
 352:	74 de                	je     332 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	0f b6 00             	movzbl (%eax),%eax
 35a:	0f b6 d0             	movzbl %al,%edx
 35d:	8b 45 0c             	mov    0xc(%ebp),%eax
 360:	0f b6 00             	movzbl (%eax),%eax
 363:	0f b6 c0             	movzbl %al,%eax
 366:	29 c2                	sub    %eax,%edx
 368:	89 d0                	mov    %edx,%eax
}
 36a:	5d                   	pop    %ebp
 36b:	c3                   	ret    

0000036c <strlen>:

uint
strlen(char *s)
{
 36c:	55                   	push   %ebp
 36d:	89 e5                	mov    %esp,%ebp
 36f:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 372:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 379:	eb 04                	jmp    37f <strlen+0x13>
 37b:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 37f:	8b 55 fc             	mov    -0x4(%ebp),%edx
 382:	8b 45 08             	mov    0x8(%ebp),%eax
 385:	01 d0                	add    %edx,%eax
 387:	0f b6 00             	movzbl (%eax),%eax
 38a:	84 c0                	test   %al,%al
 38c:	75 ed                	jne    37b <strlen+0xf>
    ;
  return n;
 38e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 391:	c9                   	leave  
 392:	c3                   	ret    

00000393 <memset>:

void*
memset(void *dst, int c, uint n)
{
 393:	55                   	push   %ebp
 394:	89 e5                	mov    %esp,%ebp
 396:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 399:	8b 45 10             	mov    0x10(%ebp),%eax
 39c:	89 44 24 08          	mov    %eax,0x8(%esp)
 3a0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
 3aa:	89 04 24             	mov    %eax,(%esp)
 3ad:	e8 26 ff ff ff       	call   2d8 <stosb>
  return dst;
 3b2:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3b5:	c9                   	leave  
 3b6:	c3                   	ret    

000003b7 <strchr>:

char*
strchr(const char *s, char c)
{
 3b7:	55                   	push   %ebp
 3b8:	89 e5                	mov    %esp,%ebp
 3ba:	83 ec 04             	sub    $0x4,%esp
 3bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c0:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 3c3:	eb 14                	jmp    3d9 <strchr+0x22>
    if(*s == c)
 3c5:	8b 45 08             	mov    0x8(%ebp),%eax
 3c8:	0f b6 00             	movzbl (%eax),%eax
 3cb:	3a 45 fc             	cmp    -0x4(%ebp),%al
 3ce:	75 05                	jne    3d5 <strchr+0x1e>
      return (char*)s;
 3d0:	8b 45 08             	mov    0x8(%ebp),%eax
 3d3:	eb 13                	jmp    3e8 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 3d5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3d9:	8b 45 08             	mov    0x8(%ebp),%eax
 3dc:	0f b6 00             	movzbl (%eax),%eax
 3df:	84 c0                	test   %al,%al
 3e1:	75 e2                	jne    3c5 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 3e3:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3e8:	c9                   	leave  
 3e9:	c3                   	ret    

000003ea <gets>:

char*
gets(char *buf, int max)
{
 3ea:	55                   	push   %ebp
 3eb:	89 e5                	mov    %esp,%ebp
 3ed:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3f0:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 3f7:	eb 4c                	jmp    445 <gets+0x5b>
    cc = read(0, &c, 1);
 3f9:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 400:	00 
 401:	8d 45 ef             	lea    -0x11(%ebp),%eax
 404:	89 44 24 04          	mov    %eax,0x4(%esp)
 408:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 40f:	e8 44 01 00 00       	call   558 <read>
 414:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 417:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 41b:	7f 02                	jg     41f <gets+0x35>
      break;
 41d:	eb 31                	jmp    450 <gets+0x66>
    buf[i++] = c;
 41f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 422:	8d 50 01             	lea    0x1(%eax),%edx
 425:	89 55 f4             	mov    %edx,-0xc(%ebp)
 428:	89 c2                	mov    %eax,%edx
 42a:	8b 45 08             	mov    0x8(%ebp),%eax
 42d:	01 c2                	add    %eax,%edx
 42f:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 433:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 435:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 439:	3c 0a                	cmp    $0xa,%al
 43b:	74 13                	je     450 <gets+0x66>
 43d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 441:	3c 0d                	cmp    $0xd,%al
 443:	74 0b                	je     450 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 445:	8b 45 f4             	mov    -0xc(%ebp),%eax
 448:	83 c0 01             	add    $0x1,%eax
 44b:	3b 45 0c             	cmp    0xc(%ebp),%eax
 44e:	7c a9                	jl     3f9 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 450:	8b 55 f4             	mov    -0xc(%ebp),%edx
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	01 d0                	add    %edx,%eax
 458:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 45b:	8b 45 08             	mov    0x8(%ebp),%eax
}
 45e:	c9                   	leave  
 45f:	c3                   	ret    

00000460 <stat>:

int
stat(char *n, struct stat *st)
{
 460:	55                   	push   %ebp
 461:	89 e5                	mov    %esp,%ebp
 463:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 466:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 46d:	00 
 46e:	8b 45 08             	mov    0x8(%ebp),%eax
 471:	89 04 24             	mov    %eax,(%esp)
 474:	e8 07 01 00 00       	call   580 <open>
 479:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 47c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 480:	79 07                	jns    489 <stat+0x29>
    return -1;
 482:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 487:	eb 23                	jmp    4ac <stat+0x4c>
  r = fstat(fd, st);
 489:	8b 45 0c             	mov    0xc(%ebp),%eax
 48c:	89 44 24 04          	mov    %eax,0x4(%esp)
 490:	8b 45 f4             	mov    -0xc(%ebp),%eax
 493:	89 04 24             	mov    %eax,(%esp)
 496:	e8 fd 00 00 00       	call   598 <fstat>
 49b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 49e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a1:	89 04 24             	mov    %eax,(%esp)
 4a4:	e8 bf 00 00 00       	call   568 <close>
  return r;
 4a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4ac:	c9                   	leave  
 4ad:	c3                   	ret    

000004ae <atoi>:

int
atoi(const char *s)
{
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 4b4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4bb:	eb 25                	jmp    4e2 <atoi+0x34>
    n = n*10 + *s++ - '0';
 4bd:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4c0:	89 d0                	mov    %edx,%eax
 4c2:	c1 e0 02             	shl    $0x2,%eax
 4c5:	01 d0                	add    %edx,%eax
 4c7:	01 c0                	add    %eax,%eax
 4c9:	89 c1                	mov    %eax,%ecx
 4cb:	8b 45 08             	mov    0x8(%ebp),%eax
 4ce:	8d 50 01             	lea    0x1(%eax),%edx
 4d1:	89 55 08             	mov    %edx,0x8(%ebp)
 4d4:	0f b6 00             	movzbl (%eax),%eax
 4d7:	0f be c0             	movsbl %al,%eax
 4da:	01 c8                	add    %ecx,%eax
 4dc:	83 e8 30             	sub    $0x30,%eax
 4df:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4e2:	8b 45 08             	mov    0x8(%ebp),%eax
 4e5:	0f b6 00             	movzbl (%eax),%eax
 4e8:	3c 2f                	cmp    $0x2f,%al
 4ea:	7e 0a                	jle    4f6 <atoi+0x48>
 4ec:	8b 45 08             	mov    0x8(%ebp),%eax
 4ef:	0f b6 00             	movzbl (%eax),%eax
 4f2:	3c 39                	cmp    $0x39,%al
 4f4:	7e c7                	jle    4bd <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 4f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4f9:	c9                   	leave  
 4fa:	c3                   	ret    

000004fb <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 4fb:	55                   	push   %ebp
 4fc:	89 e5                	mov    %esp,%ebp
 4fe:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 501:	8b 45 08             	mov    0x8(%ebp),%eax
 504:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 507:	8b 45 0c             	mov    0xc(%ebp),%eax
 50a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 50d:	eb 17                	jmp    526 <memmove+0x2b>
    *dst++ = *src++;
 50f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 512:	8d 50 01             	lea    0x1(%eax),%edx
 515:	89 55 fc             	mov    %edx,-0x4(%ebp)
 518:	8b 55 f8             	mov    -0x8(%ebp),%edx
 51b:	8d 4a 01             	lea    0x1(%edx),%ecx
 51e:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 521:	0f b6 12             	movzbl (%edx),%edx
 524:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 526:	8b 45 10             	mov    0x10(%ebp),%eax
 529:	8d 50 ff             	lea    -0x1(%eax),%edx
 52c:	89 55 10             	mov    %edx,0x10(%ebp)
 52f:	85 c0                	test   %eax,%eax
 531:	7f dc                	jg     50f <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 533:	8b 45 08             	mov    0x8(%ebp),%eax
}
 536:	c9                   	leave  
 537:	c3                   	ret    

00000538 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 538:	b8 01 00 00 00       	mov    $0x1,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <exit>:
SYSCALL(exit)
 540:	b8 02 00 00 00       	mov    $0x2,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <wait>:
SYSCALL(wait)
 548:	b8 03 00 00 00       	mov    $0x3,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <pipe>:
SYSCALL(pipe)
 550:	b8 04 00 00 00       	mov    $0x4,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <read>:
SYSCALL(read)
 558:	b8 05 00 00 00       	mov    $0x5,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <write>:
SYSCALL(write)
 560:	b8 10 00 00 00       	mov    $0x10,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <close>:
SYSCALL(close)
 568:	b8 15 00 00 00       	mov    $0x15,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <kill>:
SYSCALL(kill)
 570:	b8 06 00 00 00       	mov    $0x6,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <exec>:
SYSCALL(exec)
 578:	b8 07 00 00 00       	mov    $0x7,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <open>:
SYSCALL(open)
 580:	b8 0f 00 00 00       	mov    $0xf,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <mknod>:
SYSCALL(mknod)
 588:	b8 11 00 00 00       	mov    $0x11,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <unlink>:
SYSCALL(unlink)
 590:	b8 12 00 00 00       	mov    $0x12,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <fstat>:
SYSCALL(fstat)
 598:	b8 08 00 00 00       	mov    $0x8,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <link>:
SYSCALL(link)
 5a0:	b8 13 00 00 00       	mov    $0x13,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <mkdir>:
SYSCALL(mkdir)
 5a8:	b8 14 00 00 00       	mov    $0x14,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <chdir>:
SYSCALL(chdir)
 5b0:	b8 09 00 00 00       	mov    $0x9,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <dup>:
SYSCALL(dup)
 5b8:	b8 0a 00 00 00       	mov    $0xa,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <getpid>:
SYSCALL(getpid)
 5c0:	b8 0b 00 00 00       	mov    $0xb,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <sbrk>:
SYSCALL(sbrk)
 5c8:	b8 0c 00 00 00       	mov    $0xc,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <sleep>:
SYSCALL(sleep)
 5d0:	b8 0d 00 00 00       	mov    $0xd,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <uptime>:
SYSCALL(uptime)
 5d8:	b8 0e 00 00 00       	mov    $0xe,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <clone>:
SYSCALL(clone)
 5e0:	b8 16 00 00 00       	mov    $0x16,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <texit>:
SYSCALL(texit)
 5e8:	b8 17 00 00 00       	mov    $0x17,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <tsleep>:
SYSCALL(tsleep)
 5f0:	b8 18 00 00 00       	mov    $0x18,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <twakeup>:
SYSCALL(twakeup)
 5f8:	b8 19 00 00 00       	mov    $0x19,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <test>:
SYSCALL(test)
 600:	b8 1a 00 00 00       	mov    $0x1a,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 608:	55                   	push   %ebp
 609:	89 e5                	mov    %esp,%ebp
 60b:	83 ec 18             	sub    $0x18,%esp
 60e:	8b 45 0c             	mov    0xc(%ebp),%eax
 611:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 614:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 61b:	00 
 61c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 61f:	89 44 24 04          	mov    %eax,0x4(%esp)
 623:	8b 45 08             	mov    0x8(%ebp),%eax
 626:	89 04 24             	mov    %eax,(%esp)
 629:	e8 32 ff ff ff       	call   560 <write>
}
 62e:	c9                   	leave  
 62f:	c3                   	ret    

00000630 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 630:	55                   	push   %ebp
 631:	89 e5                	mov    %esp,%ebp
 633:	56                   	push   %esi
 634:	53                   	push   %ebx
 635:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 638:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 63f:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 643:	74 17                	je     65c <printint+0x2c>
 645:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 649:	79 11                	jns    65c <printint+0x2c>
    neg = 1;
 64b:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 652:	8b 45 0c             	mov    0xc(%ebp),%eax
 655:	f7 d8                	neg    %eax
 657:	89 45 ec             	mov    %eax,-0x14(%ebp)
 65a:	eb 06                	jmp    662 <printint+0x32>
  } else {
    x = xx;
 65c:	8b 45 0c             	mov    0xc(%ebp),%eax
 65f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 662:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 669:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 66c:	8d 41 01             	lea    0x1(%ecx),%eax
 66f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 672:	8b 5d 10             	mov    0x10(%ebp),%ebx
 675:	8b 45 ec             	mov    -0x14(%ebp),%eax
 678:	ba 00 00 00 00       	mov    $0x0,%edx
 67d:	f7 f3                	div    %ebx
 67f:	89 d0                	mov    %edx,%eax
 681:	0f b6 80 9c 13 00 00 	movzbl 0x139c(%eax),%eax
 688:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 68c:	8b 75 10             	mov    0x10(%ebp),%esi
 68f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 692:	ba 00 00 00 00       	mov    $0x0,%edx
 697:	f7 f6                	div    %esi
 699:	89 45 ec             	mov    %eax,-0x14(%ebp)
 69c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6a0:	75 c7                	jne    669 <printint+0x39>
  if(neg)
 6a2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6a6:	74 10                	je     6b8 <printint+0x88>
    buf[i++] = '-';
 6a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ab:	8d 50 01             	lea    0x1(%eax),%edx
 6ae:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6b1:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6b6:	eb 1f                	jmp    6d7 <printint+0xa7>
 6b8:	eb 1d                	jmp    6d7 <printint+0xa7>
    putc(fd, buf[i]);
 6ba:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c0:	01 d0                	add    %edx,%eax
 6c2:	0f b6 00             	movzbl (%eax),%eax
 6c5:	0f be c0             	movsbl %al,%eax
 6c8:	89 44 24 04          	mov    %eax,0x4(%esp)
 6cc:	8b 45 08             	mov    0x8(%ebp),%eax
 6cf:	89 04 24             	mov    %eax,(%esp)
 6d2:	e8 31 ff ff ff       	call   608 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6d7:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6df:	79 d9                	jns    6ba <printint+0x8a>
    putc(fd, buf[i]);
}
 6e1:	83 c4 30             	add    $0x30,%esp
 6e4:	5b                   	pop    %ebx
 6e5:	5e                   	pop    %esi
 6e6:	5d                   	pop    %ebp
 6e7:	c3                   	ret    

000006e8 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6e8:	55                   	push   %ebp
 6e9:	89 e5                	mov    %esp,%ebp
 6eb:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6ee:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6f5:	8d 45 0c             	lea    0xc(%ebp),%eax
 6f8:	83 c0 04             	add    $0x4,%eax
 6fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6fe:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 705:	e9 7c 01 00 00       	jmp    886 <printf+0x19e>
    c = fmt[i] & 0xff;
 70a:	8b 55 0c             	mov    0xc(%ebp),%edx
 70d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 710:	01 d0                	add    %edx,%eax
 712:	0f b6 00             	movzbl (%eax),%eax
 715:	0f be c0             	movsbl %al,%eax
 718:	25 ff 00 00 00       	and    $0xff,%eax
 71d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 720:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 724:	75 2c                	jne    752 <printf+0x6a>
      if(c == '%'){
 726:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 72a:	75 0c                	jne    738 <printf+0x50>
        state = '%';
 72c:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 733:	e9 4a 01 00 00       	jmp    882 <printf+0x19a>
      } else {
        putc(fd, c);
 738:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 73b:	0f be c0             	movsbl %al,%eax
 73e:	89 44 24 04          	mov    %eax,0x4(%esp)
 742:	8b 45 08             	mov    0x8(%ebp),%eax
 745:	89 04 24             	mov    %eax,(%esp)
 748:	e8 bb fe ff ff       	call   608 <putc>
 74d:	e9 30 01 00 00       	jmp    882 <printf+0x19a>
      }
    } else if(state == '%'){
 752:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 756:	0f 85 26 01 00 00    	jne    882 <printf+0x19a>
      if(c == 'd'){
 75c:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 760:	75 2d                	jne    78f <printf+0xa7>
        printint(fd, *ap, 10, 1);
 762:	8b 45 e8             	mov    -0x18(%ebp),%eax
 765:	8b 00                	mov    (%eax),%eax
 767:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 76e:	00 
 76f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 776:	00 
 777:	89 44 24 04          	mov    %eax,0x4(%esp)
 77b:	8b 45 08             	mov    0x8(%ebp),%eax
 77e:	89 04 24             	mov    %eax,(%esp)
 781:	e8 aa fe ff ff       	call   630 <printint>
        ap++;
 786:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 78a:	e9 ec 00 00 00       	jmp    87b <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 78f:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 793:	74 06                	je     79b <printf+0xb3>
 795:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 799:	75 2d                	jne    7c8 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 79b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 79e:	8b 00                	mov    (%eax),%eax
 7a0:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7a7:	00 
 7a8:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7af:	00 
 7b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b4:	8b 45 08             	mov    0x8(%ebp),%eax
 7b7:	89 04 24             	mov    %eax,(%esp)
 7ba:	e8 71 fe ff ff       	call   630 <printint>
        ap++;
 7bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7c3:	e9 b3 00 00 00       	jmp    87b <printf+0x193>
      } else if(c == 's'){
 7c8:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7cc:	75 45                	jne    813 <printf+0x12b>
        s = (char*)*ap;
 7ce:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d1:	8b 00                	mov    (%eax),%eax
 7d3:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7d6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7da:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7de:	75 09                	jne    7e9 <printf+0x101>
          s = "(null)";
 7e0:	c7 45 f4 28 0f 00 00 	movl   $0xf28,-0xc(%ebp)
        while(*s != 0){
 7e7:	eb 1e                	jmp    807 <printf+0x11f>
 7e9:	eb 1c                	jmp    807 <printf+0x11f>
          putc(fd, *s);
 7eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ee:	0f b6 00             	movzbl (%eax),%eax
 7f1:	0f be c0             	movsbl %al,%eax
 7f4:	89 44 24 04          	mov    %eax,0x4(%esp)
 7f8:	8b 45 08             	mov    0x8(%ebp),%eax
 7fb:	89 04 24             	mov    %eax,(%esp)
 7fe:	e8 05 fe ff ff       	call   608 <putc>
          s++;
 803:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 807:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80a:	0f b6 00             	movzbl (%eax),%eax
 80d:	84 c0                	test   %al,%al
 80f:	75 da                	jne    7eb <printf+0x103>
 811:	eb 68                	jmp    87b <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 813:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 817:	75 1d                	jne    836 <printf+0x14e>
        putc(fd, *ap);
 819:	8b 45 e8             	mov    -0x18(%ebp),%eax
 81c:	8b 00                	mov    (%eax),%eax
 81e:	0f be c0             	movsbl %al,%eax
 821:	89 44 24 04          	mov    %eax,0x4(%esp)
 825:	8b 45 08             	mov    0x8(%ebp),%eax
 828:	89 04 24             	mov    %eax,(%esp)
 82b:	e8 d8 fd ff ff       	call   608 <putc>
        ap++;
 830:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 834:	eb 45                	jmp    87b <printf+0x193>
      } else if(c == '%'){
 836:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 83a:	75 17                	jne    853 <printf+0x16b>
        putc(fd, c);
 83c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 83f:	0f be c0             	movsbl %al,%eax
 842:	89 44 24 04          	mov    %eax,0x4(%esp)
 846:	8b 45 08             	mov    0x8(%ebp),%eax
 849:	89 04 24             	mov    %eax,(%esp)
 84c:	e8 b7 fd ff ff       	call   608 <putc>
 851:	eb 28                	jmp    87b <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 853:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 85a:	00 
 85b:	8b 45 08             	mov    0x8(%ebp),%eax
 85e:	89 04 24             	mov    %eax,(%esp)
 861:	e8 a2 fd ff ff       	call   608 <putc>
        putc(fd, c);
 866:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 869:	0f be c0             	movsbl %al,%eax
 86c:	89 44 24 04          	mov    %eax,0x4(%esp)
 870:	8b 45 08             	mov    0x8(%ebp),%eax
 873:	89 04 24             	mov    %eax,(%esp)
 876:	e8 8d fd ff ff       	call   608 <putc>
      }
      state = 0;
 87b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 882:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 886:	8b 55 0c             	mov    0xc(%ebp),%edx
 889:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88c:	01 d0                	add    %edx,%eax
 88e:	0f b6 00             	movzbl (%eax),%eax
 891:	84 c0                	test   %al,%al
 893:	0f 85 71 fe ff ff    	jne    70a <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 899:	c9                   	leave  
 89a:	c3                   	ret    

0000089b <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 89b:	55                   	push   %ebp
 89c:	89 e5                	mov    %esp,%ebp
 89e:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8a1:	8b 45 08             	mov    0x8(%ebp),%eax
 8a4:	83 e8 08             	sub    $0x8,%eax
 8a7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8aa:	a1 cc 13 00 00       	mov    0x13cc,%eax
 8af:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8b2:	eb 24                	jmp    8d8 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b7:	8b 00                	mov    (%eax),%eax
 8b9:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8bc:	77 12                	ja     8d0 <free+0x35>
 8be:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8c4:	77 24                	ja     8ea <free+0x4f>
 8c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c9:	8b 00                	mov    (%eax),%eax
 8cb:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8ce:	77 1a                	ja     8ea <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d3:	8b 00                	mov    (%eax),%eax
 8d5:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8d8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8db:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8de:	76 d4                	jbe    8b4 <free+0x19>
 8e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e3:	8b 00                	mov    (%eax),%eax
 8e5:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8e8:	76 ca                	jbe    8b4 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 8ea:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ed:	8b 40 04             	mov    0x4(%eax),%eax
 8f0:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fa:	01 c2                	add    %eax,%edx
 8fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ff:	8b 00                	mov    (%eax),%eax
 901:	39 c2                	cmp    %eax,%edx
 903:	75 24                	jne    929 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 905:	8b 45 f8             	mov    -0x8(%ebp),%eax
 908:	8b 50 04             	mov    0x4(%eax),%edx
 90b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90e:	8b 00                	mov    (%eax),%eax
 910:	8b 40 04             	mov    0x4(%eax),%eax
 913:	01 c2                	add    %eax,%edx
 915:	8b 45 f8             	mov    -0x8(%ebp),%eax
 918:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 91b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91e:	8b 00                	mov    (%eax),%eax
 920:	8b 10                	mov    (%eax),%edx
 922:	8b 45 f8             	mov    -0x8(%ebp),%eax
 925:	89 10                	mov    %edx,(%eax)
 927:	eb 0a                	jmp    933 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 929:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92c:	8b 10                	mov    (%eax),%edx
 92e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 931:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 933:	8b 45 fc             	mov    -0x4(%ebp),%eax
 936:	8b 40 04             	mov    0x4(%eax),%eax
 939:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 940:	8b 45 fc             	mov    -0x4(%ebp),%eax
 943:	01 d0                	add    %edx,%eax
 945:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 948:	75 20                	jne    96a <free+0xcf>
    p->s.size += bp->s.size;
 94a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94d:	8b 50 04             	mov    0x4(%eax),%edx
 950:	8b 45 f8             	mov    -0x8(%ebp),%eax
 953:	8b 40 04             	mov    0x4(%eax),%eax
 956:	01 c2                	add    %eax,%edx
 958:	8b 45 fc             	mov    -0x4(%ebp),%eax
 95b:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 95e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 961:	8b 10                	mov    (%eax),%edx
 963:	8b 45 fc             	mov    -0x4(%ebp),%eax
 966:	89 10                	mov    %edx,(%eax)
 968:	eb 08                	jmp    972 <free+0xd7>
  } else
    p->s.ptr = bp;
 96a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 970:	89 10                	mov    %edx,(%eax)
  freep = p;
 972:	8b 45 fc             	mov    -0x4(%ebp),%eax
 975:	a3 cc 13 00 00       	mov    %eax,0x13cc
}
 97a:	c9                   	leave  
 97b:	c3                   	ret    

0000097c <morecore>:

static Header*
morecore(uint nu)
{
 97c:	55                   	push   %ebp
 97d:	89 e5                	mov    %esp,%ebp
 97f:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 982:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 989:	77 07                	ja     992 <morecore+0x16>
    nu = 4096;
 98b:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 992:	8b 45 08             	mov    0x8(%ebp),%eax
 995:	c1 e0 03             	shl    $0x3,%eax
 998:	89 04 24             	mov    %eax,(%esp)
 99b:	e8 28 fc ff ff       	call   5c8 <sbrk>
 9a0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9a3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9a7:	75 07                	jne    9b0 <morecore+0x34>
    return 0;
 9a9:	b8 00 00 00 00       	mov    $0x0,%eax
 9ae:	eb 22                	jmp    9d2 <morecore+0x56>
  hp = (Header*)p;
 9b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b9:	8b 55 08             	mov    0x8(%ebp),%edx
 9bc:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c2:	83 c0 08             	add    $0x8,%eax
 9c5:	89 04 24             	mov    %eax,(%esp)
 9c8:	e8 ce fe ff ff       	call   89b <free>
  return freep;
 9cd:	a1 cc 13 00 00       	mov    0x13cc,%eax
}
 9d2:	c9                   	leave  
 9d3:	c3                   	ret    

000009d4 <malloc>:

void*
malloc(uint nbytes)
{
 9d4:	55                   	push   %ebp
 9d5:	89 e5                	mov    %esp,%ebp
 9d7:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9da:	8b 45 08             	mov    0x8(%ebp),%eax
 9dd:	83 c0 07             	add    $0x7,%eax
 9e0:	c1 e8 03             	shr    $0x3,%eax
 9e3:	83 c0 01             	add    $0x1,%eax
 9e6:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9e9:	a1 cc 13 00 00       	mov    0x13cc,%eax
 9ee:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9f1:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9f5:	75 23                	jne    a1a <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9f7:	c7 45 f0 c4 13 00 00 	movl   $0x13c4,-0x10(%ebp)
 9fe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a01:	a3 cc 13 00 00       	mov    %eax,0x13cc
 a06:	a1 cc 13 00 00       	mov    0x13cc,%eax
 a0b:	a3 c4 13 00 00       	mov    %eax,0x13c4
    base.s.size = 0;
 a10:	c7 05 c8 13 00 00 00 	movl   $0x0,0x13c8
 a17:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a1d:	8b 00                	mov    (%eax),%eax
 a1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a22:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a25:	8b 40 04             	mov    0x4(%eax),%eax
 a28:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a2b:	72 4d                	jb     a7a <malloc+0xa6>
      if(p->s.size == nunits)
 a2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a30:	8b 40 04             	mov    0x4(%eax),%eax
 a33:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a36:	75 0c                	jne    a44 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a38:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3b:	8b 10                	mov    (%eax),%edx
 a3d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a40:	89 10                	mov    %edx,(%eax)
 a42:	eb 26                	jmp    a6a <malloc+0x96>
      else {
        p->s.size -= nunits;
 a44:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a47:	8b 40 04             	mov    0x4(%eax),%eax
 a4a:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a4d:	89 c2                	mov    %eax,%edx
 a4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a52:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a55:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a58:	8b 40 04             	mov    0x4(%eax),%eax
 a5b:	c1 e0 03             	shl    $0x3,%eax
 a5e:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a64:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a67:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a6a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a6d:	a3 cc 13 00 00       	mov    %eax,0x13cc
      return (void*)(p + 1);
 a72:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a75:	83 c0 08             	add    $0x8,%eax
 a78:	eb 38                	jmp    ab2 <malloc+0xde>
    }
    if(p == freep)
 a7a:	a1 cc 13 00 00       	mov    0x13cc,%eax
 a7f:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a82:	75 1b                	jne    a9f <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a84:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a87:	89 04 24             	mov    %eax,(%esp)
 a8a:	e8 ed fe ff ff       	call   97c <morecore>
 a8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a92:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a96:	75 07                	jne    a9f <malloc+0xcb>
        return 0;
 a98:	b8 00 00 00 00       	mov    $0x0,%eax
 a9d:	eb 13                	jmp    ab2 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa2:	89 45 f0             	mov    %eax,-0x10(%ebp)
 aa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa8:	8b 00                	mov    (%eax),%eax
 aaa:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 aad:	e9 70 ff ff ff       	jmp    a22 <malloc+0x4e>
}
 ab2:	c9                   	leave  
 ab3:	c3                   	ret    

00000ab4 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 ab4:	55                   	push   %ebp
 ab5:	89 e5                	mov    %esp,%ebp
 ab7:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 aba:	8b 55 08             	mov    0x8(%ebp),%edx
 abd:	8b 45 0c             	mov    0xc(%ebp),%eax
 ac0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 ac3:	f0 87 02             	lock xchg %eax,(%edx)
 ac6:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 ac9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 acc:	c9                   	leave  
 acd:	c3                   	ret    

00000ace <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 ace:	55                   	push   %ebp
 acf:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 ad1:	8b 45 08             	mov    0x8(%ebp),%eax
 ad4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 ada:	5d                   	pop    %ebp
 adb:	c3                   	ret    

00000adc <lock_acquire>:
void lock_acquire(lock_t *lock){
 adc:	55                   	push   %ebp
 add:	89 e5                	mov    %esp,%ebp
 adf:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 ae2:	90                   	nop
 ae3:	8b 45 08             	mov    0x8(%ebp),%eax
 ae6:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 aed:	00 
 aee:	89 04 24             	mov    %eax,(%esp)
 af1:	e8 be ff ff ff       	call   ab4 <xchg>
 af6:	85 c0                	test   %eax,%eax
 af8:	75 e9                	jne    ae3 <lock_acquire+0x7>
}
 afa:	c9                   	leave  
 afb:	c3                   	ret    

00000afc <lock_release>:
void lock_release(lock_t *lock){
 afc:	55                   	push   %ebp
 afd:	89 e5                	mov    %esp,%ebp
 aff:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 b02:	8b 45 08             	mov    0x8(%ebp),%eax
 b05:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 b0c:	00 
 b0d:	89 04 24             	mov    %eax,(%esp)
 b10:	e8 9f ff ff ff       	call   ab4 <xchg>
}
 b15:	c9                   	leave  
 b16:	c3                   	ret    

00000b17 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 b17:	55                   	push   %ebp
 b18:	89 e5                	mov    %esp,%ebp
 b1a:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 b1d:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 b24:	e8 ab fe ff ff       	call   9d4 <malloc>
 b29:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 b2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b2f:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 b32:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b35:	25 ff 0f 00 00       	and    $0xfff,%eax
 b3a:	85 c0                	test   %eax,%eax
 b3c:	74 14                	je     b52 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 b3e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b41:	25 ff 0f 00 00       	and    $0xfff,%eax
 b46:	89 c2                	mov    %eax,%edx
 b48:	b8 00 10 00 00       	mov    $0x1000,%eax
 b4d:	29 d0                	sub    %edx,%eax
 b4f:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 b52:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b56:	75 1b                	jne    b73 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 b58:	c7 44 24 04 2f 0f 00 	movl   $0xf2f,0x4(%esp)
 b5f:	00 
 b60:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b67:	e8 7c fb ff ff       	call   6e8 <printf>
        return 0;
 b6c:	b8 00 00 00 00       	mov    $0x0,%eax
 b71:	eb 6f                	jmp    be2 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 b73:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 b76:	8b 55 08             	mov    0x8(%ebp),%edx
 b79:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b7c:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 b80:	89 54 24 08          	mov    %edx,0x8(%esp)
 b84:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 b8b:	00 
 b8c:	89 04 24             	mov    %eax,(%esp)
 b8f:	e8 4c fa ff ff       	call   5e0 <clone>
 b94:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 b97:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b9b:	79 1b                	jns    bb8 <thread_create+0xa1>
        printf(1,"clone fails\n");
 b9d:	c7 44 24 04 3d 0f 00 	movl   $0xf3d,0x4(%esp)
 ba4:	00 
 ba5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bac:	e8 37 fb ff ff       	call   6e8 <printf>
        return 0;
 bb1:	b8 00 00 00 00       	mov    $0x0,%eax
 bb6:	eb 2a                	jmp    be2 <thread_create+0xcb>
    }
    if(tid > 0){
 bb8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bbc:	7e 05                	jle    bc3 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 bbe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bc1:	eb 1f                	jmp    be2 <thread_create+0xcb>
    }
    if(tid == 0){
 bc3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bc7:	75 14                	jne    bdd <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 bc9:	c7 44 24 04 4a 0f 00 	movl   $0xf4a,0x4(%esp)
 bd0:	00 
 bd1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bd8:	e8 0b fb ff ff       	call   6e8 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 bdd:	b8 00 00 00 00       	mov    $0x0,%eax
}
 be2:	c9                   	leave  
 be3:	c3                   	ret    

00000be4 <random>:

unsigned long rands = 1;
// generate 0 -> max random number exclude max.
int random(int max){
 be4:	55                   	push   %ebp
 be5:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
 be7:	a1 b0 13 00 00       	mov    0x13b0,%eax
 bec:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
 bf2:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
 bf7:	a3 b0 13 00 00       	mov    %eax,0x13b0
    return (int)(rands % max);
 bfc:	a1 b0 13 00 00       	mov    0x13b0,%eax
 c01:	8b 4d 08             	mov    0x8(%ebp),%ecx
 c04:	ba 00 00 00 00       	mov    $0x0,%edx
 c09:	f7 f1                	div    %ecx
 c0b:	89 d0                	mov    %edx,%eax
 c0d:	5d                   	pop    %ebp
 c0e:	c3                   	ret    

00000c0f <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 c0f:	55                   	push   %ebp
 c10:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 c12:	8b 45 08             	mov    0x8(%ebp),%eax
 c15:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 c1b:	8b 45 08             	mov    0x8(%ebp),%eax
 c1e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 c25:	8b 45 08             	mov    0x8(%ebp),%eax
 c28:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 c2f:	5d                   	pop    %ebp
 c30:	c3                   	ret    

00000c31 <add_q>:

void add_q(struct queue *q, int v){
 c31:	55                   	push   %ebp
 c32:	89 e5                	mov    %esp,%ebp
 c34:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 c37:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 c3e:	e8 91 fd ff ff       	call   9d4 <malloc>
 c43:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 c46:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c49:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 c50:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c53:	8b 55 0c             	mov    0xc(%ebp),%edx
 c56:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 c58:	8b 45 08             	mov    0x8(%ebp),%eax
 c5b:	8b 40 04             	mov    0x4(%eax),%eax
 c5e:	85 c0                	test   %eax,%eax
 c60:	75 0b                	jne    c6d <add_q+0x3c>
        q->head = n;
 c62:	8b 45 08             	mov    0x8(%ebp),%eax
 c65:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c68:	89 50 04             	mov    %edx,0x4(%eax)
 c6b:	eb 0c                	jmp    c79 <add_q+0x48>
    }else{
        q->tail->next = n;
 c6d:	8b 45 08             	mov    0x8(%ebp),%eax
 c70:	8b 40 08             	mov    0x8(%eax),%eax
 c73:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c76:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 c79:	8b 45 08             	mov    0x8(%ebp),%eax
 c7c:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c7f:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 c82:	8b 45 08             	mov    0x8(%ebp),%eax
 c85:	8b 00                	mov    (%eax),%eax
 c87:	8d 50 01             	lea    0x1(%eax),%edx
 c8a:	8b 45 08             	mov    0x8(%ebp),%eax
 c8d:	89 10                	mov    %edx,(%eax)
}
 c8f:	c9                   	leave  
 c90:	c3                   	ret    

00000c91 <empty_q>:

int empty_q(struct queue *q){
 c91:	55                   	push   %ebp
 c92:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 c94:	8b 45 08             	mov    0x8(%ebp),%eax
 c97:	8b 00                	mov    (%eax),%eax
 c99:	85 c0                	test   %eax,%eax
 c9b:	75 07                	jne    ca4 <empty_q+0x13>
        return 1;
 c9d:	b8 01 00 00 00       	mov    $0x1,%eax
 ca2:	eb 05                	jmp    ca9 <empty_q+0x18>
    else
        return 0;
 ca4:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 ca9:	5d                   	pop    %ebp
 caa:	c3                   	ret    

00000cab <pop_q>:
int pop_q(struct queue *q){
 cab:	55                   	push   %ebp
 cac:	89 e5                	mov    %esp,%ebp
 cae:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 cb1:	8b 45 08             	mov    0x8(%ebp),%eax
 cb4:	89 04 24             	mov    %eax,(%esp)
 cb7:	e8 d5 ff ff ff       	call   c91 <empty_q>
 cbc:	85 c0                	test   %eax,%eax
 cbe:	75 5d                	jne    d1d <pop_q+0x72>
       val = q->head->value; 
 cc0:	8b 45 08             	mov    0x8(%ebp),%eax
 cc3:	8b 40 04             	mov    0x4(%eax),%eax
 cc6:	8b 00                	mov    (%eax),%eax
 cc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 ccb:	8b 45 08             	mov    0x8(%ebp),%eax
 cce:	8b 40 04             	mov    0x4(%eax),%eax
 cd1:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 cd4:	8b 45 08             	mov    0x8(%ebp),%eax
 cd7:	8b 40 04             	mov    0x4(%eax),%eax
 cda:	8b 50 04             	mov    0x4(%eax),%edx
 cdd:	8b 45 08             	mov    0x8(%ebp),%eax
 ce0:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 ce3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ce6:	89 04 24             	mov    %eax,(%esp)
 ce9:	e8 ad fb ff ff       	call   89b <free>
       q->size--;
 cee:	8b 45 08             	mov    0x8(%ebp),%eax
 cf1:	8b 00                	mov    (%eax),%eax
 cf3:	8d 50 ff             	lea    -0x1(%eax),%edx
 cf6:	8b 45 08             	mov    0x8(%ebp),%eax
 cf9:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 cfb:	8b 45 08             	mov    0x8(%ebp),%eax
 cfe:	8b 00                	mov    (%eax),%eax
 d00:	85 c0                	test   %eax,%eax
 d02:	75 14                	jne    d18 <pop_q+0x6d>
            q->head = 0;
 d04:	8b 45 08             	mov    0x8(%ebp),%eax
 d07:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 d0e:	8b 45 08             	mov    0x8(%ebp),%eax
 d11:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 d18:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d1b:	eb 05                	jmp    d22 <pop_q+0x77>
    }
    return -1;
 d1d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 d22:	c9                   	leave  
 d23:	c3                   	ret    

00000d24 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 d24:	55                   	push   %ebp
 d25:	89 e5                	mov    %esp,%ebp
 d27:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 d2a:	8b 45 08             	mov    0x8(%ebp),%eax
 d2d:	8b 55 0c             	mov    0xc(%ebp),%edx
 d30:	89 50 08             	mov    %edx,0x8(%eax)
	s->count = size;
 d33:	8b 45 08             	mov    0x8(%ebp),%eax
 d36:	8b 55 0c             	mov    0xc(%ebp),%edx
 d39:	89 50 04             	mov    %edx,0x4(%eax)
	lock_init(&s->lock);
 d3c:	8b 45 08             	mov    0x8(%ebp),%eax
 d3f:	89 04 24             	mov    %eax,(%esp)
 d42:	e8 87 fd ff ff       	call   ace <lock_init>
}
 d47:	c9                   	leave  
 d48:	c3                   	ret    

00000d49 <sem_init_full>:

void 
sem_init_full(struct semaphore *s, int size){
 d49:	55                   	push   %ebp
 d4a:	89 e5                	mov    %esp,%ebp
 d4c:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 d4f:	8b 45 08             	mov    0x8(%ebp),%eax
 d52:	8b 55 0c             	mov    0xc(%ebp),%edx
 d55:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 d58:	8b 45 08             	mov    0x8(%ebp),%eax
 d5b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock);
 d62:	8b 45 08             	mov    0x8(%ebp),%eax
 d65:	89 04 24             	mov    %eax,(%esp)
 d68:	e8 61 fd ff ff       	call   ace <lock_init>
}
 d6d:	c9                   	leave  
 d6e:	c3                   	ret    

00000d6f <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 d6f:	55                   	push   %ebp
 d70:	89 e5                	mov    %esp,%ebp
 d72:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 d75:	8b 45 08             	mov    0x8(%ebp),%eax
 d78:	89 04 24             	mov    %eax,(%esp)
 d7b:	e8 5c fd ff ff       	call   adc <lock_acquire>
	if(s->count  == 0){
 d80:	8b 45 08             	mov    0x8(%ebp),%eax
 d83:	8b 40 04             	mov    0x4(%eax),%eax
 d86:	85 c0                	test   %eax,%eax
 d88:	75 2f                	jne    db9 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 d8a:	e8 31 f8 ff ff       	call   5c0 <getpid>
 d8f:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 d92:	8b 45 08             	mov    0x8(%ebp),%eax
 d95:	8d 50 0c             	lea    0xc(%eax),%edx
 d98:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d9b:	89 44 24 04          	mov    %eax,0x4(%esp)
 d9f:	89 14 24             	mov    %edx,(%esp)
 da2:	e8 8a fe ff ff       	call   c31 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 da7:	8b 45 08             	mov    0x8(%ebp),%eax
 daa:	89 04 24             	mov    %eax,(%esp)
 dad:	e8 4a fd ff ff       	call   afc <lock_release>
		tsleep(); 
 db2:	e8 39 f8 ff ff       	call   5f0 <tsleep>
 db7:	eb 1a                	jmp    dd3 <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 db9:	8b 45 08             	mov    0x8(%ebp),%eax
 dbc:	8b 40 04             	mov    0x4(%eax),%eax
 dbf:	8d 50 ff             	lea    -0x1(%eax),%edx
 dc2:	8b 45 08             	mov    0x8(%ebp),%eax
 dc5:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 dc8:	8b 45 08             	mov    0x8(%ebp),%eax
 dcb:	89 04 24             	mov    %eax,(%esp)
 dce:	e8 29 fd ff ff       	call   afc <lock_release>
	}
}
 dd3:	c9                   	leave  
 dd4:	c3                   	ret    

00000dd5 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 dd5:	55                   	push   %ebp
 dd6:	89 e5                	mov    %esp,%ebp
 dd8:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 ddb:	8b 45 08             	mov    0x8(%ebp),%eax
 dde:	89 04 24             	mov    %eax,(%esp)
 de1:	e8 f6 fc ff ff       	call   adc <lock_acquire>
	if(s->count < s->size){
 de6:	8b 45 08             	mov    0x8(%ebp),%eax
 de9:	8b 50 04             	mov    0x4(%eax),%edx
 dec:	8b 45 08             	mov    0x8(%ebp),%eax
 def:	8b 40 08             	mov    0x8(%eax),%eax
 df2:	39 c2                	cmp    %eax,%edx
 df4:	7d 0f                	jge    e05 <sem_signal+0x30>
		s->count++;	
 df6:	8b 45 08             	mov    0x8(%ebp),%eax
 df9:	8b 40 04             	mov    0x4(%eax),%eax
 dfc:	8d 50 01             	lea    0x1(%eax),%edx
 dff:	8b 45 08             	mov    0x8(%ebp),%eax
 e02:	89 50 04             	mov    %edx,0x4(%eax)
	}

	int tid;
	tid = pop_q(&s->waiters);
 e05:	8b 45 08             	mov    0x8(%ebp),%eax
 e08:	83 c0 0c             	add    $0xc,%eax
 e0b:	89 04 24             	mov    %eax,(%esp)
 e0e:	e8 98 fe ff ff       	call   cab <pop_q>
 e13:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 e16:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 e1a:	74 2e                	je     e4a <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 e1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e1f:	89 04 24             	mov    %eax,(%esp)
 e22:	e8 d1 f7 ff ff       	call   5f8 <twakeup>
		s->count--;
 e27:	8b 45 08             	mov    0x8(%ebp),%eax
 e2a:	8b 40 04             	mov    0x4(%eax),%eax
 e2d:	8d 50 ff             	lea    -0x1(%eax),%edx
 e30:	8b 45 08             	mov    0x8(%ebp),%eax
 e33:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 e36:	8b 45 08             	mov    0x8(%ebp),%eax
 e39:	8b 40 04             	mov    0x4(%eax),%eax
 e3c:	85 c0                	test   %eax,%eax
 e3e:	79 0a                	jns    e4a <sem_signal+0x75>
 e40:	8b 45 08             	mov    0x8(%ebp),%eax
 e43:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 e4a:	8b 45 08             	mov    0x8(%ebp),%eax
 e4d:	89 04 24             	mov    %eax,(%esp)
 e50:	e8 a7 fc ff ff       	call   afc <lock_release>

 e55:	c9                   	leave  
 e56:	c3                   	ret    
