
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
  11:	c7 04 24 80 14 00 00 	movl   $0x1480,(%esp)
  18:	e8 40 0d 00 00       	call   d5d <sem_init>
  sem_init(&printer, 1);
  1d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  24:	00 
  25:	c7 04 24 40 14 00 00 	movl   $0x1440,(%esp)
  2c:	e8 2c 0d 00 00       	call   d5d <sem_init>
  sem_init(&printer_mutex1, 1);
  31:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  38:	00 
  39:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
  40:	e8 18 0d 00 00       	call   d5d <sem_init>
  sem_init(&printer_mutex2, 1);
  45:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  4c:	00 
  4d:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
  54:	e8 04 0d 00 00       	call   d5d <sem_init>
  sem_init(&mutex, 1);
  59:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  60:	00 
  61:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
  68:	e8 f0 0c 00 00       	call   d5d <sem_init>
	  
  printf(1,"Creating %d Monkeys\n\n", number_of_monkeys);
  6d:	a1 e8 13 00 00       	mov    0x13e8,%eax
  72:	89 44 24 08          	mov    %eax,0x8(%esp)
  76:	c7 44 24 04 90 0e 00 	movl   $0xe90,0x4(%esp)
  7d:	00 
  7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  85:	e8 97 06 00 00       	call   721 <printf>
	int i;
	for(i = 0; i < number_of_monkeys; i++) thread_create(monkey, 0);
  8a:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  91:	00 
  92:	eb 19                	jmp    ad <main+0xad>
  94:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  9b:	00 
  9c:	c7 04 24 db 00 00 00 	movl   $0xdb,(%esp)
  a3:	e8 a8 0a 00 00       	call   b50 <thread_create>
  a8:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  ad:	a1 e8 13 00 00       	mov    0x13e8,%eax
  b2:	39 44 24 1c          	cmp    %eax,0x1c(%esp)
  b6:	7c dc                	jl     94 <main+0x94>
    while(wait() > 0);
  b8:	90                   	nop
  b9:	e8 c3 04 00 00       	call   581 <wait>
  be:	85 c0                	test   %eax,%eax
  c0:	7f f7                	jg     b9 <main+0xb9>
	printf(1,"All monkeys are full\n");
  c2:	c7 44 24 04 a6 0e 00 	movl   $0xea6,0x4(%esp)
  c9:	00 
  ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d1:	e8 4b 06 00 00       	call   721 <printf>
	exit();
  d6:	e8 9e 04 00 00       	call   579 <exit>

000000db <monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
  db:	55                   	push   %ebp
  dc:	89 e5                	mov    %esp,%ebp
  de:	83 ec 28             	sub    $0x28,%esp

  int pid =  getpid();
  e1:	e8 13 05 00 00       	call   5f9 <getpid>
  e6:	89 45 f4             	mov    %eax,-0xc(%ebp)

  sem_aquire(&printer_mutex1);
  e9:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
  f0:	e8 b3 0c 00 00       	call   da8 <sem_aquire>
  printMessage(pid, 1);
  f5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  fc:	00 
  fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 100:	89 04 24             	mov    %eax,(%esp)
 103:	e8 e8 00 00 00       	call   1f0 <printMessage>
  sem_aquire(&wait_tree);
 108:	c7 04 24 80 14 00 00 	movl   $0x1480,(%esp)
 10f:	e8 94 0c 00 00       	call   da8 <sem_aquire>

  sem_aquire(&mutex);
 114:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
 11b:	e8 88 0c 00 00       	call   da8 <sem_aquire>
  monkeys_on_tree++;
 120:	a1 20 14 00 00       	mov    0x1420,%eax
 125:	83 c0 01             	add    $0x1,%eax
 128:	a3 20 14 00 00       	mov    %eax,0x1420
  sem_signal(&mutex); 
 12d:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
 134:	e8 d5 0c 00 00       	call   e0e <sem_signal>

  printMessage(pid, 2); 
 139:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
 140:	00 
 141:	8b 45 f4             	mov    -0xc(%ebp),%eax
 144:	89 04 24             	mov    %eax,(%esp)
 147:	e8 a4 00 00 00       	call   1f0 <printMessage>
  sem_signal(&printer_mutex1); 
 14c:	c7 04 24 c0 14 00 00 	movl   $0x14c0,(%esp)
 153:	e8 b6 0c 00 00       	call   e0e <sem_signal>

  sleep(100);   // Get coconut
 158:	c7 04 24 64 00 00 00 	movl   $0x64,(%esp)
 15f:	e8 a5 04 00 00       	call   609 <sleep>

  sem_aquire(&mutex);
 164:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
 16b:	e8 38 0c 00 00       	call   da8 <sem_aquire>
  printMessage(pid, 6); // Got a coconut
 170:	c7 44 24 04 06 00 00 	movl   $0x6,0x4(%esp)
 177:	00 
 178:	8b 45 f4             	mov    -0xc(%ebp),%eax
 17b:	89 04 24             	mov    %eax,(%esp)
 17e:	e8 6d 00 00 00       	call   1f0 <printMessage>
  sem_signal(&mutex); 
 183:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
 18a:	e8 7f 0c 00 00       	call   e0e <sem_signal>

  //printMessage(pid, 3); //Climbing down tree

  sem_aquire(&printer_mutex2);
 18f:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
 196:	e8 0d 0c 00 00       	call   da8 <sem_aquire>
  //printMessage(pid, 5); // On the ground

  sem_signal(&wait_tree);
 19b:	c7 04 24 80 14 00 00 	movl   $0x1480,(%esp)
 1a2:	e8 67 0c 00 00       	call   e0e <sem_signal>


  sem_signal(&printer_mutex2); 
 1a7:	c7 04 24 40 15 00 00 	movl   $0x1540,(%esp)
 1ae:	e8 5b 0c 00 00       	call   e0e <sem_signal>
  
  sem_aquire(&mutex);
 1b3:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
 1ba:	e8 e9 0b 00 00       	call   da8 <sem_aquire>
  monkeys_on_tree--;
 1bf:	a1 20 14 00 00       	mov    0x1420,%eax
 1c4:	83 e8 01             	sub    $0x1,%eax
 1c7:	a3 20 14 00 00       	mov    %eax,0x1420
  sem_signal(&mutex); 
 1cc:	c7 04 24 00 15 00 00 	movl   $0x1500,(%esp)
 1d3:	e8 36 0c 00 00       	call   e0e <sem_signal>
  
  printMessage(pid, 3); // Eating Banana
 1d8:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
 1df:	00 
 1e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1e3:	89 04 24             	mov    %eax,(%esp)
 1e6:	e8 05 00 00 00       	call   1f0 <printMessage>

  texit();
 1eb:	e8 31 04 00 00       	call   621 <texit>

000001f0 <printMessage>:
}

void printMessage(int pid, int state){
 1f0:	55                   	push   %ebp
 1f1:	89 e5                	mov    %esp,%ebp
 1f3:	83 ec 18             	sub    $0x18,%esp
  sem_aquire(&printer);
 1f6:	c7 04 24 40 14 00 00 	movl   $0x1440,(%esp)
 1fd:	e8 a6 0b 00 00       	call   da8 <sem_aquire>
  printf(1, "Monkey(%d)",pid);
 202:	8b 45 08             	mov    0x8(%ebp),%eax
 205:	89 44 24 08          	mov    %eax,0x8(%esp)
 209:	c7 44 24 04 bc 0e 00 	movl   $0xebc,0x4(%esp)
 210:	00 
 211:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 218:	e8 04 05 00 00       	call   721 <printf>
  //printf(1, " - %d", state); 
  switch(state){
 21d:	83 7d 0c 06          	cmpl   $0x6,0xc(%ebp)
 221:	0f 87 bf 00 00 00    	ja     2e6 <printMessage+0xf6>
 227:	8b 45 0c             	mov    0xc(%ebp),%eax
 22a:	c1 e0 02             	shl    $0x2,%eax
 22d:	05 58 0f 00 00       	add    $0xf58,%eax
 232:	8b 00                	mov    (%eax),%eax
 234:	ff e0                	jmp    *%eax
    case(1):
      printf(1, " Waiting  to  climb", state); 
 236:	8b 45 0c             	mov    0xc(%ebp),%eax
 239:	89 44 24 08          	mov    %eax,0x8(%esp)
 23d:	c7 44 24 04 c7 0e 00 	movl   $0xec7,0x4(%esp)
 244:	00 
 245:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 24c:	e8 d0 04 00 00       	call   721 <printf>
      break;
 251:	e9 90 00 00 00       	jmp    2e6 <printMessage+0xf6>
    case(2):
      printf(1, " Climbing  up  tree", state); 
 256:	8b 45 0c             	mov    0xc(%ebp),%eax
 259:	89 44 24 08          	mov    %eax,0x8(%esp)
 25d:	c7 44 24 04 db 0e 00 	movl   $0xedb,0x4(%esp)
 264:	00 
 265:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 26c:	e8 b0 04 00 00       	call   721 <printf>
      break;
 271:	eb 73                	jmp    2e6 <printMessage+0xf6>
    case(3):
      printf(1, " Climbing down tree", state); 
 273:	8b 45 0c             	mov    0xc(%ebp),%eax
 276:	89 44 24 08          	mov    %eax,0x8(%esp)
 27a:	c7 44 24 04 ef 0e 00 	movl   $0xeef,0x4(%esp)
 281:	00 
 282:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 289:	e8 93 04 00 00       	call   721 <printf>
      break;
 28e:	eb 56                	jmp    2e6 <printMessage+0xf6>
    case(4):
      printf(1, " Eating the  banana", state); 
 290:	8b 45 0c             	mov    0xc(%ebp),%eax
 293:	89 44 24 08          	mov    %eax,0x8(%esp)
 297:	c7 44 24 04 03 0f 00 	movl   $0xf03,0x4(%esp)
 29e:	00 
 29f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2a6:	e8 76 04 00 00       	call   721 <printf>
      break;
 2ab:	eb 39                	jmp    2e6 <printMessage+0xf6>
    case(5):
      printf(1, " On the ground safe", state); 
 2ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b0:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b4:	c7 44 24 04 17 0f 00 	movl   $0xf17,0x4(%esp)
 2bb:	00 
 2bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c3:	e8 59 04 00 00       	call   721 <printf>
      break;
 2c8:	eb 1c                	jmp    2e6 <printMessage+0xf6>
    case(6):
      printf(1, " Alright a  coconut", state); 
 2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cd:	89 44 24 08          	mov    %eax,0x8(%esp)
 2d1:	c7 44 24 04 2b 0f 00 	movl   $0xf2b,0x4(%esp)
 2d8:	00 
 2d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2e0:	e8 3c 04 00 00       	call   721 <printf>
      break;
 2e5:	90                   	nop
  }
  printf(1, " - Monkeys on tree: %d\n", monkeys_on_tree);  
 2e6:	a1 20 14 00 00       	mov    0x1420,%eax
 2eb:	89 44 24 08          	mov    %eax,0x8(%esp)
 2ef:	c7 44 24 04 3f 0f 00 	movl   $0xf3f,0x4(%esp)
 2f6:	00 
 2f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2fe:	e8 1e 04 00 00       	call   721 <printf>
  sem_signal(&printer);
 303:	c7 04 24 40 14 00 00 	movl   $0x1440,(%esp)
 30a:	e8 ff 0a 00 00       	call   e0e <sem_signal>
  
 30f:	c9                   	leave  
 310:	c3                   	ret    

00000311 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 311:	55                   	push   %ebp
 312:	89 e5                	mov    %esp,%ebp
 314:	57                   	push   %edi
 315:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 316:	8b 4d 08             	mov    0x8(%ebp),%ecx
 319:	8b 55 10             	mov    0x10(%ebp),%edx
 31c:	8b 45 0c             	mov    0xc(%ebp),%eax
 31f:	89 cb                	mov    %ecx,%ebx
 321:	89 df                	mov    %ebx,%edi
 323:	89 d1                	mov    %edx,%ecx
 325:	fc                   	cld    
 326:	f3 aa                	rep stos %al,%es:(%edi)
 328:	89 ca                	mov    %ecx,%edx
 32a:	89 fb                	mov    %edi,%ebx
 32c:	89 5d 08             	mov    %ebx,0x8(%ebp)
 32f:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 332:	5b                   	pop    %ebx
 333:	5f                   	pop    %edi
 334:	5d                   	pop    %ebp
 335:	c3                   	ret    

00000336 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 336:	55                   	push   %ebp
 337:	89 e5                	mov    %esp,%ebp
 339:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 33c:	8b 45 08             	mov    0x8(%ebp),%eax
 33f:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 342:	90                   	nop
 343:	8b 45 08             	mov    0x8(%ebp),%eax
 346:	8d 50 01             	lea    0x1(%eax),%edx
 349:	89 55 08             	mov    %edx,0x8(%ebp)
 34c:	8b 55 0c             	mov    0xc(%ebp),%edx
 34f:	8d 4a 01             	lea    0x1(%edx),%ecx
 352:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 355:	0f b6 12             	movzbl (%edx),%edx
 358:	88 10                	mov    %dl,(%eax)
 35a:	0f b6 00             	movzbl (%eax),%eax
 35d:	84 c0                	test   %al,%al
 35f:	75 e2                	jne    343 <strcpy+0xd>
    ;
  return os;
 361:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 364:	c9                   	leave  
 365:	c3                   	ret    

00000366 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 366:	55                   	push   %ebp
 367:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 369:	eb 08                	jmp    373 <strcmp+0xd>
    p++, q++;
 36b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 36f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 373:	8b 45 08             	mov    0x8(%ebp),%eax
 376:	0f b6 00             	movzbl (%eax),%eax
 379:	84 c0                	test   %al,%al
 37b:	74 10                	je     38d <strcmp+0x27>
 37d:	8b 45 08             	mov    0x8(%ebp),%eax
 380:	0f b6 10             	movzbl (%eax),%edx
 383:	8b 45 0c             	mov    0xc(%ebp),%eax
 386:	0f b6 00             	movzbl (%eax),%eax
 389:	38 c2                	cmp    %al,%dl
 38b:	74 de                	je     36b <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
 390:	0f b6 00             	movzbl (%eax),%eax
 393:	0f b6 d0             	movzbl %al,%edx
 396:	8b 45 0c             	mov    0xc(%ebp),%eax
 399:	0f b6 00             	movzbl (%eax),%eax
 39c:	0f b6 c0             	movzbl %al,%eax
 39f:	29 c2                	sub    %eax,%edx
 3a1:	89 d0                	mov    %edx,%eax
}
 3a3:	5d                   	pop    %ebp
 3a4:	c3                   	ret    

000003a5 <strlen>:

uint
strlen(char *s)
{
 3a5:	55                   	push   %ebp
 3a6:	89 e5                	mov    %esp,%ebp
 3a8:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3ab:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3b2:	eb 04                	jmp    3b8 <strlen+0x13>
 3b4:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3b8:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3bb:	8b 45 08             	mov    0x8(%ebp),%eax
 3be:	01 d0                	add    %edx,%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	84 c0                	test   %al,%al
 3c5:	75 ed                	jne    3b4 <strlen+0xf>
    ;
  return n;
 3c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ca:	c9                   	leave  
 3cb:	c3                   	ret    

000003cc <memset>:

void*
memset(void *dst, int c, uint n)
{
 3cc:	55                   	push   %ebp
 3cd:	89 e5                	mov    %esp,%ebp
 3cf:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 3d2:	8b 45 10             	mov    0x10(%ebp),%eax
 3d5:	89 44 24 08          	mov    %eax,0x8(%esp)
 3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dc:	89 44 24 04          	mov    %eax,0x4(%esp)
 3e0:	8b 45 08             	mov    0x8(%ebp),%eax
 3e3:	89 04 24             	mov    %eax,(%esp)
 3e6:	e8 26 ff ff ff       	call   311 <stosb>
  return dst;
 3eb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3ee:	c9                   	leave  
 3ef:	c3                   	ret    

000003f0 <strchr>:

char*
strchr(const char *s, char c)
{
 3f0:	55                   	push   %ebp
 3f1:	89 e5                	mov    %esp,%ebp
 3f3:	83 ec 04             	sub    $0x4,%esp
 3f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f9:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 3fc:	eb 14                	jmp    412 <strchr+0x22>
    if(*s == c)
 3fe:	8b 45 08             	mov    0x8(%ebp),%eax
 401:	0f b6 00             	movzbl (%eax),%eax
 404:	3a 45 fc             	cmp    -0x4(%ebp),%al
 407:	75 05                	jne    40e <strchr+0x1e>
      return (char*)s;
 409:	8b 45 08             	mov    0x8(%ebp),%eax
 40c:	eb 13                	jmp    421 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 40e:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 412:	8b 45 08             	mov    0x8(%ebp),%eax
 415:	0f b6 00             	movzbl (%eax),%eax
 418:	84 c0                	test   %al,%al
 41a:	75 e2                	jne    3fe <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 41c:	b8 00 00 00 00       	mov    $0x0,%eax
}
 421:	c9                   	leave  
 422:	c3                   	ret    

00000423 <gets>:

char*
gets(char *buf, int max)
{
 423:	55                   	push   %ebp
 424:	89 e5                	mov    %esp,%ebp
 426:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 429:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 430:	eb 4c                	jmp    47e <gets+0x5b>
    cc = read(0, &c, 1);
 432:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 439:	00 
 43a:	8d 45 ef             	lea    -0x11(%ebp),%eax
 43d:	89 44 24 04          	mov    %eax,0x4(%esp)
 441:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 448:	e8 44 01 00 00       	call   591 <read>
 44d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 450:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 454:	7f 02                	jg     458 <gets+0x35>
      break;
 456:	eb 31                	jmp    489 <gets+0x66>
    buf[i++] = c;
 458:	8b 45 f4             	mov    -0xc(%ebp),%eax
 45b:	8d 50 01             	lea    0x1(%eax),%edx
 45e:	89 55 f4             	mov    %edx,-0xc(%ebp)
 461:	89 c2                	mov    %eax,%edx
 463:	8b 45 08             	mov    0x8(%ebp),%eax
 466:	01 c2                	add    %eax,%edx
 468:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 46c:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 46e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 472:	3c 0a                	cmp    $0xa,%al
 474:	74 13                	je     489 <gets+0x66>
 476:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 47a:	3c 0d                	cmp    $0xd,%al
 47c:	74 0b                	je     489 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 47e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 481:	83 c0 01             	add    $0x1,%eax
 484:	3b 45 0c             	cmp    0xc(%ebp),%eax
 487:	7c a9                	jl     432 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 489:	8b 55 f4             	mov    -0xc(%ebp),%edx
 48c:	8b 45 08             	mov    0x8(%ebp),%eax
 48f:	01 d0                	add    %edx,%eax
 491:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 494:	8b 45 08             	mov    0x8(%ebp),%eax
}
 497:	c9                   	leave  
 498:	c3                   	ret    

00000499 <stat>:

int
stat(char *n, struct stat *st)
{
 499:	55                   	push   %ebp
 49a:	89 e5                	mov    %esp,%ebp
 49c:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 49f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4a6:	00 
 4a7:	8b 45 08             	mov    0x8(%ebp),%eax
 4aa:	89 04 24             	mov    %eax,(%esp)
 4ad:	e8 07 01 00 00       	call   5b9 <open>
 4b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4b5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4b9:	79 07                	jns    4c2 <stat+0x29>
    return -1;
 4bb:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4c0:	eb 23                	jmp    4e5 <stat+0x4c>
  r = fstat(fd, st);
 4c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 4c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 4c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4cc:	89 04 24             	mov    %eax,(%esp)
 4cf:	e8 fd 00 00 00       	call   5d1 <fstat>
 4d4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4da:	89 04 24             	mov    %eax,(%esp)
 4dd:	e8 bf 00 00 00       	call   5a1 <close>
  return r;
 4e2:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4e5:	c9                   	leave  
 4e6:	c3                   	ret    

000004e7 <atoi>:

int
atoi(const char *s)
{
 4e7:	55                   	push   %ebp
 4e8:	89 e5                	mov    %esp,%ebp
 4ea:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 4ed:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4f4:	eb 25                	jmp    51b <atoi+0x34>
    n = n*10 + *s++ - '0';
 4f6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4f9:	89 d0                	mov    %edx,%eax
 4fb:	c1 e0 02             	shl    $0x2,%eax
 4fe:	01 d0                	add    %edx,%eax
 500:	01 c0                	add    %eax,%eax
 502:	89 c1                	mov    %eax,%ecx
 504:	8b 45 08             	mov    0x8(%ebp),%eax
 507:	8d 50 01             	lea    0x1(%eax),%edx
 50a:	89 55 08             	mov    %edx,0x8(%ebp)
 50d:	0f b6 00             	movzbl (%eax),%eax
 510:	0f be c0             	movsbl %al,%eax
 513:	01 c8                	add    %ecx,%eax
 515:	83 e8 30             	sub    $0x30,%eax
 518:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 51b:	8b 45 08             	mov    0x8(%ebp),%eax
 51e:	0f b6 00             	movzbl (%eax),%eax
 521:	3c 2f                	cmp    $0x2f,%al
 523:	7e 0a                	jle    52f <atoi+0x48>
 525:	8b 45 08             	mov    0x8(%ebp),%eax
 528:	0f b6 00             	movzbl (%eax),%eax
 52b:	3c 39                	cmp    $0x39,%al
 52d:	7e c7                	jle    4f6 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 52f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 532:	c9                   	leave  
 533:	c3                   	ret    

00000534 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 534:	55                   	push   %ebp
 535:	89 e5                	mov    %esp,%ebp
 537:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 53a:	8b 45 08             	mov    0x8(%ebp),%eax
 53d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 540:	8b 45 0c             	mov    0xc(%ebp),%eax
 543:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 546:	eb 17                	jmp    55f <memmove+0x2b>
    *dst++ = *src++;
 548:	8b 45 fc             	mov    -0x4(%ebp),%eax
 54b:	8d 50 01             	lea    0x1(%eax),%edx
 54e:	89 55 fc             	mov    %edx,-0x4(%ebp)
 551:	8b 55 f8             	mov    -0x8(%ebp),%edx
 554:	8d 4a 01             	lea    0x1(%edx),%ecx
 557:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 55a:	0f b6 12             	movzbl (%edx),%edx
 55d:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 55f:	8b 45 10             	mov    0x10(%ebp),%eax
 562:	8d 50 ff             	lea    -0x1(%eax),%edx
 565:	89 55 10             	mov    %edx,0x10(%ebp)
 568:	85 c0                	test   %eax,%eax
 56a:	7f dc                	jg     548 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 56c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 56f:	c9                   	leave  
 570:	c3                   	ret    

00000571 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 571:	b8 01 00 00 00       	mov    $0x1,%eax
 576:	cd 40                	int    $0x40
 578:	c3                   	ret    

00000579 <exit>:
SYSCALL(exit)
 579:	b8 02 00 00 00       	mov    $0x2,%eax
 57e:	cd 40                	int    $0x40
 580:	c3                   	ret    

00000581 <wait>:
SYSCALL(wait)
 581:	b8 03 00 00 00       	mov    $0x3,%eax
 586:	cd 40                	int    $0x40
 588:	c3                   	ret    

00000589 <pipe>:
SYSCALL(pipe)
 589:	b8 04 00 00 00       	mov    $0x4,%eax
 58e:	cd 40                	int    $0x40
 590:	c3                   	ret    

00000591 <read>:
SYSCALL(read)
 591:	b8 05 00 00 00       	mov    $0x5,%eax
 596:	cd 40                	int    $0x40
 598:	c3                   	ret    

00000599 <write>:
SYSCALL(write)
 599:	b8 10 00 00 00       	mov    $0x10,%eax
 59e:	cd 40                	int    $0x40
 5a0:	c3                   	ret    

000005a1 <close>:
SYSCALL(close)
 5a1:	b8 15 00 00 00       	mov    $0x15,%eax
 5a6:	cd 40                	int    $0x40
 5a8:	c3                   	ret    

000005a9 <kill>:
SYSCALL(kill)
 5a9:	b8 06 00 00 00       	mov    $0x6,%eax
 5ae:	cd 40                	int    $0x40
 5b0:	c3                   	ret    

000005b1 <exec>:
SYSCALL(exec)
 5b1:	b8 07 00 00 00       	mov    $0x7,%eax
 5b6:	cd 40                	int    $0x40
 5b8:	c3                   	ret    

000005b9 <open>:
SYSCALL(open)
 5b9:	b8 0f 00 00 00       	mov    $0xf,%eax
 5be:	cd 40                	int    $0x40
 5c0:	c3                   	ret    

000005c1 <mknod>:
SYSCALL(mknod)
 5c1:	b8 11 00 00 00       	mov    $0x11,%eax
 5c6:	cd 40                	int    $0x40
 5c8:	c3                   	ret    

000005c9 <unlink>:
SYSCALL(unlink)
 5c9:	b8 12 00 00 00       	mov    $0x12,%eax
 5ce:	cd 40                	int    $0x40
 5d0:	c3                   	ret    

000005d1 <fstat>:
SYSCALL(fstat)
 5d1:	b8 08 00 00 00       	mov    $0x8,%eax
 5d6:	cd 40                	int    $0x40
 5d8:	c3                   	ret    

000005d9 <link>:
SYSCALL(link)
 5d9:	b8 13 00 00 00       	mov    $0x13,%eax
 5de:	cd 40                	int    $0x40
 5e0:	c3                   	ret    

000005e1 <mkdir>:
SYSCALL(mkdir)
 5e1:	b8 14 00 00 00       	mov    $0x14,%eax
 5e6:	cd 40                	int    $0x40
 5e8:	c3                   	ret    

000005e9 <chdir>:
SYSCALL(chdir)
 5e9:	b8 09 00 00 00       	mov    $0x9,%eax
 5ee:	cd 40                	int    $0x40
 5f0:	c3                   	ret    

000005f1 <dup>:
SYSCALL(dup)
 5f1:	b8 0a 00 00 00       	mov    $0xa,%eax
 5f6:	cd 40                	int    $0x40
 5f8:	c3                   	ret    

000005f9 <getpid>:
SYSCALL(getpid)
 5f9:	b8 0b 00 00 00       	mov    $0xb,%eax
 5fe:	cd 40                	int    $0x40
 600:	c3                   	ret    

00000601 <sbrk>:
SYSCALL(sbrk)
 601:	b8 0c 00 00 00       	mov    $0xc,%eax
 606:	cd 40                	int    $0x40
 608:	c3                   	ret    

00000609 <sleep>:
SYSCALL(sleep)
 609:	b8 0d 00 00 00       	mov    $0xd,%eax
 60e:	cd 40                	int    $0x40
 610:	c3                   	ret    

00000611 <uptime>:
SYSCALL(uptime)
 611:	b8 0e 00 00 00       	mov    $0xe,%eax
 616:	cd 40                	int    $0x40
 618:	c3                   	ret    

00000619 <clone>:
SYSCALL(clone)
 619:	b8 16 00 00 00       	mov    $0x16,%eax
 61e:	cd 40                	int    $0x40
 620:	c3                   	ret    

00000621 <texit>:
SYSCALL(texit)
 621:	b8 17 00 00 00       	mov    $0x17,%eax
 626:	cd 40                	int    $0x40
 628:	c3                   	ret    

00000629 <tsleep>:
SYSCALL(tsleep)
 629:	b8 18 00 00 00       	mov    $0x18,%eax
 62e:	cd 40                	int    $0x40
 630:	c3                   	ret    

00000631 <twakeup>:
SYSCALL(twakeup)
 631:	b8 19 00 00 00       	mov    $0x19,%eax
 636:	cd 40                	int    $0x40
 638:	c3                   	ret    

00000639 <test>:
SYSCALL(test)
 639:	b8 1a 00 00 00       	mov    $0x1a,%eax
 63e:	cd 40                	int    $0x40
 640:	c3                   	ret    

00000641 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 641:	55                   	push   %ebp
 642:	89 e5                	mov    %esp,%ebp
 644:	83 ec 18             	sub    $0x18,%esp
 647:	8b 45 0c             	mov    0xc(%ebp),%eax
 64a:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 64d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 654:	00 
 655:	8d 45 f4             	lea    -0xc(%ebp),%eax
 658:	89 44 24 04          	mov    %eax,0x4(%esp)
 65c:	8b 45 08             	mov    0x8(%ebp),%eax
 65f:	89 04 24             	mov    %eax,(%esp)
 662:	e8 32 ff ff ff       	call   599 <write>
}
 667:	c9                   	leave  
 668:	c3                   	ret    

00000669 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 669:	55                   	push   %ebp
 66a:	89 e5                	mov    %esp,%ebp
 66c:	56                   	push   %esi
 66d:	53                   	push   %ebx
 66e:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 671:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 678:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 67c:	74 17                	je     695 <printint+0x2c>
 67e:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 682:	79 11                	jns    695 <printint+0x2c>
    neg = 1;
 684:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 68b:	8b 45 0c             	mov    0xc(%ebp),%eax
 68e:	f7 d8                	neg    %eax
 690:	89 45 ec             	mov    %eax,-0x14(%ebp)
 693:	eb 06                	jmp    69b <printint+0x32>
  } else {
    x = xx;
 695:	8b 45 0c             	mov    0xc(%ebp),%eax
 698:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 69b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6a2:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6a5:	8d 41 01             	lea    0x1(%ecx),%eax
 6a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6ab:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6b1:	ba 00 00 00 00       	mov    $0x0,%edx
 6b6:	f7 f3                	div    %ebx
 6b8:	89 d0                	mov    %edx,%eax
 6ba:	0f b6 80 ec 13 00 00 	movzbl 0x13ec(%eax),%eax
 6c1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6c5:	8b 75 10             	mov    0x10(%ebp),%esi
 6c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6cb:	ba 00 00 00 00       	mov    $0x0,%edx
 6d0:	f7 f6                	div    %esi
 6d2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6d9:	75 c7                	jne    6a2 <printint+0x39>
  if(neg)
 6db:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6df:	74 10                	je     6f1 <printint+0x88>
    buf[i++] = '-';
 6e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e4:	8d 50 01             	lea    0x1(%eax),%edx
 6e7:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6ea:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6ef:	eb 1f                	jmp    710 <printint+0xa7>
 6f1:	eb 1d                	jmp    710 <printint+0xa7>
    putc(fd, buf[i]);
 6f3:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6f6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f9:	01 d0                	add    %edx,%eax
 6fb:	0f b6 00             	movzbl (%eax),%eax
 6fe:	0f be c0             	movsbl %al,%eax
 701:	89 44 24 04          	mov    %eax,0x4(%esp)
 705:	8b 45 08             	mov    0x8(%ebp),%eax
 708:	89 04 24             	mov    %eax,(%esp)
 70b:	e8 31 ff ff ff       	call   641 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 710:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 714:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 718:	79 d9                	jns    6f3 <printint+0x8a>
    putc(fd, buf[i]);
}
 71a:	83 c4 30             	add    $0x30,%esp
 71d:	5b                   	pop    %ebx
 71e:	5e                   	pop    %esi
 71f:	5d                   	pop    %ebp
 720:	c3                   	ret    

00000721 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 721:	55                   	push   %ebp
 722:	89 e5                	mov    %esp,%ebp
 724:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 727:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 72e:	8d 45 0c             	lea    0xc(%ebp),%eax
 731:	83 c0 04             	add    $0x4,%eax
 734:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 737:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 73e:	e9 7c 01 00 00       	jmp    8bf <printf+0x19e>
    c = fmt[i] & 0xff;
 743:	8b 55 0c             	mov    0xc(%ebp),%edx
 746:	8b 45 f0             	mov    -0x10(%ebp),%eax
 749:	01 d0                	add    %edx,%eax
 74b:	0f b6 00             	movzbl (%eax),%eax
 74e:	0f be c0             	movsbl %al,%eax
 751:	25 ff 00 00 00       	and    $0xff,%eax
 756:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 759:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 75d:	75 2c                	jne    78b <printf+0x6a>
      if(c == '%'){
 75f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 763:	75 0c                	jne    771 <printf+0x50>
        state = '%';
 765:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 76c:	e9 4a 01 00 00       	jmp    8bb <printf+0x19a>
      } else {
        putc(fd, c);
 771:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 774:	0f be c0             	movsbl %al,%eax
 777:	89 44 24 04          	mov    %eax,0x4(%esp)
 77b:	8b 45 08             	mov    0x8(%ebp),%eax
 77e:	89 04 24             	mov    %eax,(%esp)
 781:	e8 bb fe ff ff       	call   641 <putc>
 786:	e9 30 01 00 00       	jmp    8bb <printf+0x19a>
      }
    } else if(state == '%'){
 78b:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 78f:	0f 85 26 01 00 00    	jne    8bb <printf+0x19a>
      if(c == 'd'){
 795:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 799:	75 2d                	jne    7c8 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 79b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 79e:	8b 00                	mov    (%eax),%eax
 7a0:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7a7:	00 
 7a8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7af:	00 
 7b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b4:	8b 45 08             	mov    0x8(%ebp),%eax
 7b7:	89 04 24             	mov    %eax,(%esp)
 7ba:	e8 aa fe ff ff       	call   669 <printint>
        ap++;
 7bf:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7c3:	e9 ec 00 00 00       	jmp    8b4 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7c8:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7cc:	74 06                	je     7d4 <printf+0xb3>
 7ce:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7d2:	75 2d                	jne    801 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 7d4:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d7:	8b 00                	mov    (%eax),%eax
 7d9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7e0:	00 
 7e1:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7e8:	00 
 7e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ed:	8b 45 08             	mov    0x8(%ebp),%eax
 7f0:	89 04 24             	mov    %eax,(%esp)
 7f3:	e8 71 fe ff ff       	call   669 <printint>
        ap++;
 7f8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7fc:	e9 b3 00 00 00       	jmp    8b4 <printf+0x193>
      } else if(c == 's'){
 801:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 805:	75 45                	jne    84c <printf+0x12b>
        s = (char*)*ap;
 807:	8b 45 e8             	mov    -0x18(%ebp),%eax
 80a:	8b 00                	mov    (%eax),%eax
 80c:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 80f:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 813:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 817:	75 09                	jne    822 <printf+0x101>
          s = "(null)";
 819:	c7 45 f4 74 0f 00 00 	movl   $0xf74,-0xc(%ebp)
        while(*s != 0){
 820:	eb 1e                	jmp    840 <printf+0x11f>
 822:	eb 1c                	jmp    840 <printf+0x11f>
          putc(fd, *s);
 824:	8b 45 f4             	mov    -0xc(%ebp),%eax
 827:	0f b6 00             	movzbl (%eax),%eax
 82a:	0f be c0             	movsbl %al,%eax
 82d:	89 44 24 04          	mov    %eax,0x4(%esp)
 831:	8b 45 08             	mov    0x8(%ebp),%eax
 834:	89 04 24             	mov    %eax,(%esp)
 837:	e8 05 fe ff ff       	call   641 <putc>
          s++;
 83c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 840:	8b 45 f4             	mov    -0xc(%ebp),%eax
 843:	0f b6 00             	movzbl (%eax),%eax
 846:	84 c0                	test   %al,%al
 848:	75 da                	jne    824 <printf+0x103>
 84a:	eb 68                	jmp    8b4 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 84c:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 850:	75 1d                	jne    86f <printf+0x14e>
        putc(fd, *ap);
 852:	8b 45 e8             	mov    -0x18(%ebp),%eax
 855:	8b 00                	mov    (%eax),%eax
 857:	0f be c0             	movsbl %al,%eax
 85a:	89 44 24 04          	mov    %eax,0x4(%esp)
 85e:	8b 45 08             	mov    0x8(%ebp),%eax
 861:	89 04 24             	mov    %eax,(%esp)
 864:	e8 d8 fd ff ff       	call   641 <putc>
        ap++;
 869:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 86d:	eb 45                	jmp    8b4 <printf+0x193>
      } else if(c == '%'){
 86f:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 873:	75 17                	jne    88c <printf+0x16b>
        putc(fd, c);
 875:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 878:	0f be c0             	movsbl %al,%eax
 87b:	89 44 24 04          	mov    %eax,0x4(%esp)
 87f:	8b 45 08             	mov    0x8(%ebp),%eax
 882:	89 04 24             	mov    %eax,(%esp)
 885:	e8 b7 fd ff ff       	call   641 <putc>
 88a:	eb 28                	jmp    8b4 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 88c:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 893:	00 
 894:	8b 45 08             	mov    0x8(%ebp),%eax
 897:	89 04 24             	mov    %eax,(%esp)
 89a:	e8 a2 fd ff ff       	call   641 <putc>
        putc(fd, c);
 89f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8a2:	0f be c0             	movsbl %al,%eax
 8a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a9:	8b 45 08             	mov    0x8(%ebp),%eax
 8ac:	89 04 24             	mov    %eax,(%esp)
 8af:	e8 8d fd ff ff       	call   641 <putc>
      }
      state = 0;
 8b4:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8bb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8bf:	8b 55 0c             	mov    0xc(%ebp),%edx
 8c2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c5:	01 d0                	add    %edx,%eax
 8c7:	0f b6 00             	movzbl (%eax),%eax
 8ca:	84 c0                	test   %al,%al
 8cc:	0f 85 71 fe ff ff    	jne    743 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8d2:	c9                   	leave  
 8d3:	c3                   	ret    

000008d4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8d4:	55                   	push   %ebp
 8d5:	89 e5                	mov    %esp,%ebp
 8d7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8da:	8b 45 08             	mov    0x8(%ebp),%eax
 8dd:	83 e8 08             	sub    $0x8,%eax
 8e0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8e3:	a1 2c 14 00 00       	mov    0x142c,%eax
 8e8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8eb:	eb 24                	jmp    911 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f0:	8b 00                	mov    (%eax),%eax
 8f2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8f5:	77 12                	ja     909 <free+0x35>
 8f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fa:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8fd:	77 24                	ja     923 <free+0x4f>
 8ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 902:	8b 00                	mov    (%eax),%eax
 904:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 907:	77 1a                	ja     923 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 909:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90c:	8b 00                	mov    (%eax),%eax
 90e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 911:	8b 45 f8             	mov    -0x8(%ebp),%eax
 914:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 917:	76 d4                	jbe    8ed <free+0x19>
 919:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91c:	8b 00                	mov    (%eax),%eax
 91e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 921:	76 ca                	jbe    8ed <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 923:	8b 45 f8             	mov    -0x8(%ebp),%eax
 926:	8b 40 04             	mov    0x4(%eax),%eax
 929:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 930:	8b 45 f8             	mov    -0x8(%ebp),%eax
 933:	01 c2                	add    %eax,%edx
 935:	8b 45 fc             	mov    -0x4(%ebp),%eax
 938:	8b 00                	mov    (%eax),%eax
 93a:	39 c2                	cmp    %eax,%edx
 93c:	75 24                	jne    962 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 93e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 941:	8b 50 04             	mov    0x4(%eax),%edx
 944:	8b 45 fc             	mov    -0x4(%ebp),%eax
 947:	8b 00                	mov    (%eax),%eax
 949:	8b 40 04             	mov    0x4(%eax),%eax
 94c:	01 c2                	add    %eax,%edx
 94e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 951:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 954:	8b 45 fc             	mov    -0x4(%ebp),%eax
 957:	8b 00                	mov    (%eax),%eax
 959:	8b 10                	mov    (%eax),%edx
 95b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95e:	89 10                	mov    %edx,(%eax)
 960:	eb 0a                	jmp    96c <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 962:	8b 45 fc             	mov    -0x4(%ebp),%eax
 965:	8b 10                	mov    (%eax),%edx
 967:	8b 45 f8             	mov    -0x8(%ebp),%eax
 96a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 96c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96f:	8b 40 04             	mov    0x4(%eax),%eax
 972:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 979:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97c:	01 d0                	add    %edx,%eax
 97e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 981:	75 20                	jne    9a3 <free+0xcf>
    p->s.size += bp->s.size;
 983:	8b 45 fc             	mov    -0x4(%ebp),%eax
 986:	8b 50 04             	mov    0x4(%eax),%edx
 989:	8b 45 f8             	mov    -0x8(%ebp),%eax
 98c:	8b 40 04             	mov    0x4(%eax),%eax
 98f:	01 c2                	add    %eax,%edx
 991:	8b 45 fc             	mov    -0x4(%ebp),%eax
 994:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 997:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99a:	8b 10                	mov    (%eax),%edx
 99c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99f:	89 10                	mov    %edx,(%eax)
 9a1:	eb 08                	jmp    9ab <free+0xd7>
  } else
    p->s.ptr = bp;
 9a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a6:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9a9:	89 10                	mov    %edx,(%eax)
  freep = p;
 9ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ae:	a3 2c 14 00 00       	mov    %eax,0x142c
}
 9b3:	c9                   	leave  
 9b4:	c3                   	ret    

000009b5 <morecore>:

static Header*
morecore(uint nu)
{
 9b5:	55                   	push   %ebp
 9b6:	89 e5                	mov    %esp,%ebp
 9b8:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9bb:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9c2:	77 07                	ja     9cb <morecore+0x16>
    nu = 4096;
 9c4:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9cb:	8b 45 08             	mov    0x8(%ebp),%eax
 9ce:	c1 e0 03             	shl    $0x3,%eax
 9d1:	89 04 24             	mov    %eax,(%esp)
 9d4:	e8 28 fc ff ff       	call   601 <sbrk>
 9d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9dc:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9e0:	75 07                	jne    9e9 <morecore+0x34>
    return 0;
 9e2:	b8 00 00 00 00       	mov    $0x0,%eax
 9e7:	eb 22                	jmp    a0b <morecore+0x56>
  hp = (Header*)p;
 9e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ec:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f2:	8b 55 08             	mov    0x8(%ebp),%edx
 9f5:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9fb:	83 c0 08             	add    $0x8,%eax
 9fe:	89 04 24             	mov    %eax,(%esp)
 a01:	e8 ce fe ff ff       	call   8d4 <free>
  return freep;
 a06:	a1 2c 14 00 00       	mov    0x142c,%eax
}
 a0b:	c9                   	leave  
 a0c:	c3                   	ret    

00000a0d <malloc>:

void*
malloc(uint nbytes)
{
 a0d:	55                   	push   %ebp
 a0e:	89 e5                	mov    %esp,%ebp
 a10:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a13:	8b 45 08             	mov    0x8(%ebp),%eax
 a16:	83 c0 07             	add    $0x7,%eax
 a19:	c1 e8 03             	shr    $0x3,%eax
 a1c:	83 c0 01             	add    $0x1,%eax
 a1f:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a22:	a1 2c 14 00 00       	mov    0x142c,%eax
 a27:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a2a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a2e:	75 23                	jne    a53 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a30:	c7 45 f0 24 14 00 00 	movl   $0x1424,-0x10(%ebp)
 a37:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a3a:	a3 2c 14 00 00       	mov    %eax,0x142c
 a3f:	a1 2c 14 00 00       	mov    0x142c,%eax
 a44:	a3 24 14 00 00       	mov    %eax,0x1424
    base.s.size = 0;
 a49:	c7 05 28 14 00 00 00 	movl   $0x0,0x1428
 a50:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a53:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a56:	8b 00                	mov    (%eax),%eax
 a58:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5e:	8b 40 04             	mov    0x4(%eax),%eax
 a61:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a64:	72 4d                	jb     ab3 <malloc+0xa6>
      if(p->s.size == nunits)
 a66:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a69:	8b 40 04             	mov    0x4(%eax),%eax
 a6c:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a6f:	75 0c                	jne    a7d <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a71:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a74:	8b 10                	mov    (%eax),%edx
 a76:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a79:	89 10                	mov    %edx,(%eax)
 a7b:	eb 26                	jmp    aa3 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a7d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a80:	8b 40 04             	mov    0x4(%eax),%eax
 a83:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a86:	89 c2                	mov    %eax,%edx
 a88:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a8b:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a8e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a91:	8b 40 04             	mov    0x4(%eax),%eax
 a94:	c1 e0 03             	shl    $0x3,%eax
 a97:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9d:	8b 55 ec             	mov    -0x14(%ebp),%edx
 aa0:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 aa3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aa6:	a3 2c 14 00 00       	mov    %eax,0x142c
      return (void*)(p + 1);
 aab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aae:	83 c0 08             	add    $0x8,%eax
 ab1:	eb 38                	jmp    aeb <malloc+0xde>
    }
    if(p == freep)
 ab3:	a1 2c 14 00 00       	mov    0x142c,%eax
 ab8:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 abb:	75 1b                	jne    ad8 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 abd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ac0:	89 04 24             	mov    %eax,(%esp)
 ac3:	e8 ed fe ff ff       	call   9b5 <morecore>
 ac8:	89 45 f4             	mov    %eax,-0xc(%ebp)
 acb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 acf:	75 07                	jne    ad8 <malloc+0xcb>
        return 0;
 ad1:	b8 00 00 00 00       	mov    $0x0,%eax
 ad6:	eb 13                	jmp    aeb <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 ad8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 adb:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ade:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae1:	8b 00                	mov    (%eax),%eax
 ae3:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 ae6:	e9 70 ff ff ff       	jmp    a5b <malloc+0x4e>
}
 aeb:	c9                   	leave  
 aec:	c3                   	ret    

00000aed <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 aed:	55                   	push   %ebp
 aee:	89 e5                	mov    %esp,%ebp
 af0:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 af3:	8b 55 08             	mov    0x8(%ebp),%edx
 af6:	8b 45 0c             	mov    0xc(%ebp),%eax
 af9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 afc:	f0 87 02             	lock xchg %eax,(%edx)
 aff:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 b02:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 b05:	c9                   	leave  
 b06:	c3                   	ret    

00000b07 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 b07:	55                   	push   %ebp
 b08:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 b0a:	8b 45 08             	mov    0x8(%ebp),%eax
 b0d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 b13:	5d                   	pop    %ebp
 b14:	c3                   	ret    

00000b15 <lock_acquire>:
void lock_acquire(lock_t *lock){
 b15:	55                   	push   %ebp
 b16:	89 e5                	mov    %esp,%ebp
 b18:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 b1b:	90                   	nop
 b1c:	8b 45 08             	mov    0x8(%ebp),%eax
 b1f:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 b26:	00 
 b27:	89 04 24             	mov    %eax,(%esp)
 b2a:	e8 be ff ff ff       	call   aed <xchg>
 b2f:	85 c0                	test   %eax,%eax
 b31:	75 e9                	jne    b1c <lock_acquire+0x7>
}
 b33:	c9                   	leave  
 b34:	c3                   	ret    

00000b35 <lock_release>:
void lock_release(lock_t *lock){
 b35:	55                   	push   %ebp
 b36:	89 e5                	mov    %esp,%ebp
 b38:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 b3b:	8b 45 08             	mov    0x8(%ebp),%eax
 b3e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 b45:	00 
 b46:	89 04 24             	mov    %eax,(%esp)
 b49:	e8 9f ff ff ff       	call   aed <xchg>
}
 b4e:	c9                   	leave  
 b4f:	c3                   	ret    

00000b50 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 b50:	55                   	push   %ebp
 b51:	89 e5                	mov    %esp,%ebp
 b53:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 b56:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 b5d:	e8 ab fe ff ff       	call   a0d <malloc>
 b62:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 b65:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b68:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 b6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b6e:	25 ff 0f 00 00       	and    $0xfff,%eax
 b73:	85 c0                	test   %eax,%eax
 b75:	74 14                	je     b8b <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 b77:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b7a:	25 ff 0f 00 00       	and    $0xfff,%eax
 b7f:	89 c2                	mov    %eax,%edx
 b81:	b8 00 10 00 00       	mov    $0x1000,%eax
 b86:	29 d0                	sub    %edx,%eax
 b88:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 b8b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b8f:	75 1b                	jne    bac <thread_create+0x5c>

        printf(1,"malloc fail \n");
 b91:	c7 44 24 04 7b 0f 00 	movl   $0xf7b,0x4(%esp)
 b98:	00 
 b99:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ba0:	e8 7c fb ff ff       	call   721 <printf>
        return 0;
 ba5:	b8 00 00 00 00       	mov    $0x0,%eax
 baa:	eb 6f                	jmp    c1b <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 bac:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 baf:	8b 55 08             	mov    0x8(%ebp),%edx
 bb2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb5:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 bb9:	89 54 24 08          	mov    %edx,0x8(%esp)
 bbd:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 bc4:	00 
 bc5:	89 04 24             	mov    %eax,(%esp)
 bc8:	e8 4c fa ff ff       	call   619 <clone>
 bcd:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 bd0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bd4:	79 1b                	jns    bf1 <thread_create+0xa1>
        printf(1,"clone fails\n");
 bd6:	c7 44 24 04 89 0f 00 	movl   $0xf89,0x4(%esp)
 bdd:	00 
 bde:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 be5:	e8 37 fb ff ff       	call   721 <printf>
        return 0;
 bea:	b8 00 00 00 00       	mov    $0x0,%eax
 bef:	eb 2a                	jmp    c1b <thread_create+0xcb>
    }
    if(tid > 0){
 bf1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bf5:	7e 05                	jle    bfc <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 bf7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bfa:	eb 1f                	jmp    c1b <thread_create+0xcb>
    }
    if(tid == 0){
 bfc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c00:	75 14                	jne    c16 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 c02:	c7 44 24 04 96 0f 00 	movl   $0xf96,0x4(%esp)
 c09:	00 
 c0a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c11:	e8 0b fb ff ff       	call   721 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 c16:	b8 00 00 00 00       	mov    $0x0,%eax
}
 c1b:	c9                   	leave  
 c1c:	c3                   	ret    

00000c1d <random>:

unsigned long rands = 1;
// generate 0 -> max random number exclude max.
int random(int max){
 c1d:	55                   	push   %ebp
 c1e:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
 c20:	a1 00 14 00 00       	mov    0x1400,%eax
 c25:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
 c2b:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
 c30:	a3 00 14 00 00       	mov    %eax,0x1400
    return (int)(rands % max);
 c35:	a1 00 14 00 00       	mov    0x1400,%eax
 c3a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 c3d:	ba 00 00 00 00       	mov    $0x0,%edx
 c42:	f7 f1                	div    %ecx
 c44:	89 d0                	mov    %edx,%eax
 c46:	5d                   	pop    %ebp
 c47:	c3                   	ret    

00000c48 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 c48:	55                   	push   %ebp
 c49:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 c4b:	8b 45 08             	mov    0x8(%ebp),%eax
 c4e:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 c54:	8b 45 08             	mov    0x8(%ebp),%eax
 c57:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 c5e:	8b 45 08             	mov    0x8(%ebp),%eax
 c61:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 c68:	5d                   	pop    %ebp
 c69:	c3                   	ret    

00000c6a <add_q>:

void add_q(struct queue *q, int v){
 c6a:	55                   	push   %ebp
 c6b:	89 e5                	mov    %esp,%ebp
 c6d:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 c70:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 c77:	e8 91 fd ff ff       	call   a0d <malloc>
 c7c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 c7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c82:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 c89:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c8c:	8b 55 0c             	mov    0xc(%ebp),%edx
 c8f:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 c91:	8b 45 08             	mov    0x8(%ebp),%eax
 c94:	8b 40 04             	mov    0x4(%eax),%eax
 c97:	85 c0                	test   %eax,%eax
 c99:	75 0b                	jne    ca6 <add_q+0x3c>
        q->head = n;
 c9b:	8b 45 08             	mov    0x8(%ebp),%eax
 c9e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 ca1:	89 50 04             	mov    %edx,0x4(%eax)
 ca4:	eb 0c                	jmp    cb2 <add_q+0x48>
    }else{
        q->tail->next = n;
 ca6:	8b 45 08             	mov    0x8(%ebp),%eax
 ca9:	8b 40 08             	mov    0x8(%eax),%eax
 cac:	8b 55 f4             	mov    -0xc(%ebp),%edx
 caf:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 cb2:	8b 45 08             	mov    0x8(%ebp),%eax
 cb5:	8b 55 f4             	mov    -0xc(%ebp),%edx
 cb8:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 cbb:	8b 45 08             	mov    0x8(%ebp),%eax
 cbe:	8b 00                	mov    (%eax),%eax
 cc0:	8d 50 01             	lea    0x1(%eax),%edx
 cc3:	8b 45 08             	mov    0x8(%ebp),%eax
 cc6:	89 10                	mov    %edx,(%eax)
}
 cc8:	c9                   	leave  
 cc9:	c3                   	ret    

00000cca <empty_q>:

int empty_q(struct queue *q){
 cca:	55                   	push   %ebp
 ccb:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 ccd:	8b 45 08             	mov    0x8(%ebp),%eax
 cd0:	8b 00                	mov    (%eax),%eax
 cd2:	85 c0                	test   %eax,%eax
 cd4:	75 07                	jne    cdd <empty_q+0x13>
        return 1;
 cd6:	b8 01 00 00 00       	mov    $0x1,%eax
 cdb:	eb 05                	jmp    ce2 <empty_q+0x18>
    else
        return 0;
 cdd:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 ce2:	5d                   	pop    %ebp
 ce3:	c3                   	ret    

00000ce4 <pop_q>:
int pop_q(struct queue *q){
 ce4:	55                   	push   %ebp
 ce5:	89 e5                	mov    %esp,%ebp
 ce7:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 cea:	8b 45 08             	mov    0x8(%ebp),%eax
 ced:	89 04 24             	mov    %eax,(%esp)
 cf0:	e8 d5 ff ff ff       	call   cca <empty_q>
 cf5:	85 c0                	test   %eax,%eax
 cf7:	75 5d                	jne    d56 <pop_q+0x72>
       val = q->head->value; 
 cf9:	8b 45 08             	mov    0x8(%ebp),%eax
 cfc:	8b 40 04             	mov    0x4(%eax),%eax
 cff:	8b 00                	mov    (%eax),%eax
 d01:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 d04:	8b 45 08             	mov    0x8(%ebp),%eax
 d07:	8b 40 04             	mov    0x4(%eax),%eax
 d0a:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 d0d:	8b 45 08             	mov    0x8(%ebp),%eax
 d10:	8b 40 04             	mov    0x4(%eax),%eax
 d13:	8b 50 04             	mov    0x4(%eax),%edx
 d16:	8b 45 08             	mov    0x8(%ebp),%eax
 d19:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 d1c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d1f:	89 04 24             	mov    %eax,(%esp)
 d22:	e8 ad fb ff ff       	call   8d4 <free>
       q->size--;
 d27:	8b 45 08             	mov    0x8(%ebp),%eax
 d2a:	8b 00                	mov    (%eax),%eax
 d2c:	8d 50 ff             	lea    -0x1(%eax),%edx
 d2f:	8b 45 08             	mov    0x8(%ebp),%eax
 d32:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 d34:	8b 45 08             	mov    0x8(%ebp),%eax
 d37:	8b 00                	mov    (%eax),%eax
 d39:	85 c0                	test   %eax,%eax
 d3b:	75 14                	jne    d51 <pop_q+0x6d>
            q->head = 0;
 d3d:	8b 45 08             	mov    0x8(%ebp),%eax
 d40:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 d47:	8b 45 08             	mov    0x8(%ebp),%eax
 d4a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 d51:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d54:	eb 05                	jmp    d5b <pop_q+0x77>
    }
    return -1;
 d56:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 d5b:	c9                   	leave  
 d5c:	c3                   	ret    

00000d5d <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 d5d:	55                   	push   %ebp
 d5e:	89 e5                	mov    %esp,%ebp
 d60:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 d63:	8b 45 08             	mov    0x8(%ebp),%eax
 d66:	8b 55 0c             	mov    0xc(%ebp),%edx
 d69:	89 50 08             	mov    %edx,0x8(%eax)
	s->count = size;
 d6c:	8b 45 08             	mov    0x8(%ebp),%eax
 d6f:	8b 55 0c             	mov    0xc(%ebp),%edx
 d72:	89 50 04             	mov    %edx,0x4(%eax)
	lock_init(&s->lock);
 d75:	8b 45 08             	mov    0x8(%ebp),%eax
 d78:	89 04 24             	mov    %eax,(%esp)
 d7b:	e8 87 fd ff ff       	call   b07 <lock_init>
}
 d80:	c9                   	leave  
 d81:	c3                   	ret    

00000d82 <sem_init_full>:

void 
sem_init_full(struct semaphore *s, int size){
 d82:	55                   	push   %ebp
 d83:	89 e5                	mov    %esp,%ebp
 d85:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 d88:	8b 45 08             	mov    0x8(%ebp),%eax
 d8b:	8b 55 0c             	mov    0xc(%ebp),%edx
 d8e:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 d91:	8b 45 08             	mov    0x8(%ebp),%eax
 d94:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock);
 d9b:	8b 45 08             	mov    0x8(%ebp),%eax
 d9e:	89 04 24             	mov    %eax,(%esp)
 da1:	e8 61 fd ff ff       	call   b07 <lock_init>
}
 da6:	c9                   	leave  
 da7:	c3                   	ret    

00000da8 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 da8:	55                   	push   %ebp
 da9:	89 e5                	mov    %esp,%ebp
 dab:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 dae:	8b 45 08             	mov    0x8(%ebp),%eax
 db1:	89 04 24             	mov    %eax,(%esp)
 db4:	e8 5c fd ff ff       	call   b15 <lock_acquire>
	if(s->count  == 0){
 db9:	8b 45 08             	mov    0x8(%ebp),%eax
 dbc:	8b 40 04             	mov    0x4(%eax),%eax
 dbf:	85 c0                	test   %eax,%eax
 dc1:	75 2f                	jne    df2 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 dc3:	e8 31 f8 ff ff       	call   5f9 <getpid>
 dc8:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 dcb:	8b 45 08             	mov    0x8(%ebp),%eax
 dce:	8d 50 0c             	lea    0xc(%eax),%edx
 dd1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dd4:	89 44 24 04          	mov    %eax,0x4(%esp)
 dd8:	89 14 24             	mov    %edx,(%esp)
 ddb:	e8 8a fe ff ff       	call   c6a <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 de0:	8b 45 08             	mov    0x8(%ebp),%eax
 de3:	89 04 24             	mov    %eax,(%esp)
 de6:	e8 4a fd ff ff       	call   b35 <lock_release>
		tsleep(); 
 deb:	e8 39 f8 ff ff       	call   629 <tsleep>
 df0:	eb 1a                	jmp    e0c <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 df2:	8b 45 08             	mov    0x8(%ebp),%eax
 df5:	8b 40 04             	mov    0x4(%eax),%eax
 df8:	8d 50 ff             	lea    -0x1(%eax),%edx
 dfb:	8b 45 08             	mov    0x8(%ebp),%eax
 dfe:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 e01:	8b 45 08             	mov    0x8(%ebp),%eax
 e04:	89 04 24             	mov    %eax,(%esp)
 e07:	e8 29 fd ff ff       	call   b35 <lock_release>
	}
}
 e0c:	c9                   	leave  
 e0d:	c3                   	ret    

00000e0e <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 e0e:	55                   	push   %ebp
 e0f:	89 e5                	mov    %esp,%ebp
 e11:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 e14:	8b 45 08             	mov    0x8(%ebp),%eax
 e17:	89 04 24             	mov    %eax,(%esp)
 e1a:	e8 f6 fc ff ff       	call   b15 <lock_acquire>
	if(s->count < s->size){
 e1f:	8b 45 08             	mov    0x8(%ebp),%eax
 e22:	8b 50 04             	mov    0x4(%eax),%edx
 e25:	8b 45 08             	mov    0x8(%ebp),%eax
 e28:	8b 40 08             	mov    0x8(%eax),%eax
 e2b:	39 c2                	cmp    %eax,%edx
 e2d:	7d 0f                	jge    e3e <sem_signal+0x30>
		s->count++;	
 e2f:	8b 45 08             	mov    0x8(%ebp),%eax
 e32:	8b 40 04             	mov    0x4(%eax),%eax
 e35:	8d 50 01             	lea    0x1(%eax),%edx
 e38:	8b 45 08             	mov    0x8(%ebp),%eax
 e3b:	89 50 04             	mov    %edx,0x4(%eax)
	}

	int tid;
	tid = pop_q(&s->waiters);
 e3e:	8b 45 08             	mov    0x8(%ebp),%eax
 e41:	83 c0 0c             	add    $0xc,%eax
 e44:	89 04 24             	mov    %eax,(%esp)
 e47:	e8 98 fe ff ff       	call   ce4 <pop_q>
 e4c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 e4f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 e53:	74 2e                	je     e83 <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 e55:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e58:	89 04 24             	mov    %eax,(%esp)
 e5b:	e8 d1 f7 ff ff       	call   631 <twakeup>
		s->count--;
 e60:	8b 45 08             	mov    0x8(%ebp),%eax
 e63:	8b 40 04             	mov    0x4(%eax),%eax
 e66:	8d 50 ff             	lea    -0x1(%eax),%edx
 e69:	8b 45 08             	mov    0x8(%ebp),%eax
 e6c:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 e6f:	8b 45 08             	mov    0x8(%ebp),%eax
 e72:	8b 40 04             	mov    0x4(%eax),%eax
 e75:	85 c0                	test   %eax,%eax
 e77:	79 0a                	jns    e83 <sem_signal+0x75>
 e79:	8b 45 08             	mov    0x8(%ebp),%eax
 e7c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 e83:	8b 45 08             	mov    0x8(%ebp),%eax
 e86:	89 04 24             	mov    %eax,(%esp)
 e89:	e8 a7 fc ff ff       	call   b35 <lock_release>

 e8e:	c9                   	leave  
 e8f:	c3                   	ret    
