
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
  11:	c7 04 24 20 14 00 00 	movl   $0x1420,(%esp)
  18:	e8 f9 0c 00 00       	call   d16 <sem_init>
	
	int i;
	sem_signal(&wait_tree);
  1d:	c7 04 24 20 14 00 00 	movl   $0x1420,(%esp)
  24:	e8 a1 0d 00 00       	call   dca <sem_signal>
	sem_signal(&wait_tree);
  29:	c7 04 24 20 14 00 00 	movl   $0x1420,(%esp)
  30:	e8 95 0d 00 00       	call   dca <sem_signal>
	sem_signal(&wait_tree);
  35:	c7 04 24 20 14 00 00 	movl   $0x1420,(%esp)
  3c:	e8 89 0d 00 00       	call   dca <sem_signal>
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
 125:	eb 19                	jmp    140 <main+0x140>
 127:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 12e:	00 
 12f:	c7 04 24 6a 01 00 00 	movl   $0x16a,(%esp)
 136:	e8 f9 09 00 00       	call   b34 <thread_create>
 13b:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 140:	83 7c 24 1c 04       	cmpl   $0x4,0x1c(%esp)
 145:	7e e0                	jle    127 <main+0x127>
    while(wait() > 0);
 147:	90                   	nop
 148:	e8 18 04 00 00       	call   565 <wait>
 14d:	85 c0                	test   %eax,%eax
 14f:	7f f7                	jg     148 <main+0x148>
	printf(1,"All monkeys are full\n");
 151:	c7 44 24 04 71 0f 00 	movl   $0xf71,0x4(%esp)
 158:	00 
 159:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 160:	e8 a0 05 00 00       	call   705 <printf>
	exit();
 165:	e8 f3 03 00 00       	call   55d <exit>

0000016a <monkey>:
}

//Oxyegn waits untill there are two hydrogens
void 
monkey(){
 16a:	55                   	push   %ebp
 16b:	89 e5                	mov    %esp,%ebp
 16d:	83 ec 28             	sub    $0x28,%esp
  int pid =  getpid();
 170:	e8 68 04 00 00       	call   5dd <getpid>
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
 1a7:	a1 24 14 00 00       	mov    0x1424,%eax
 1ac:	ba 03 00 00 00       	mov    $0x3,%edx
 1b1:	29 c2                	sub    %eax,%edx
 1b3:	89 d0                	mov    %edx,%eax
 1b5:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b9:	c7 44 24 04 8f 0f 00 	movl   $0xf8f,0x4(%esp)
 1c0:	00 
 1c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c8:	e8 38 05 00 00       	call   705 <printf>
  sem_aquire(&wait_tree);
 1cd:	c7 04 24 20 14 00 00 	movl   $0x1420,(%esp)
 1d4:	e8 63 0b 00 00       	call   d3c <sem_aquire>
  printf(1, "%d",pid);
 1d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 1dc:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e0:	c7 44 24 04 87 0f 00 	movl   $0xf87,0x4(%esp)
 1e7:	00 
 1e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ef:	e8 11 05 00 00       	call   705 <printf>
  printf(1, " - 2");
 1f4:	c7 44 24 04 96 0f 00 	movl   $0xf96,0x4(%esp)
 1fb:	00 
 1fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 203:	e8 fd 04 00 00       	call   705 <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 208:	a1 24 14 00 00       	mov    0x1424,%eax
 20d:	ba 03 00 00 00       	mov    $0x3,%edx
 212:	29 c2                	sub    %eax,%edx
 214:	89 d0                	mov    %edx,%eax
 216:	89 44 24 08          	mov    %eax,0x8(%esp)
 21a:	c7 44 24 04 8f 0f 00 	movl   $0xf8f,0x4(%esp)
 221:	00 
 222:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 229:	e8 d7 04 00 00       	call   705 <printf>
  sleep(3); 
 22e:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
 235:	e8 b3 03 00 00       	call   5ed <sleep>
  printf(1, "%d",pid);
 23a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 23d:	89 44 24 08          	mov    %eax,0x8(%esp)
 241:	c7 44 24 04 87 0f 00 	movl   $0xf87,0x4(%esp)
 248:	00 
 249:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 250:	e8 b0 04 00 00       	call   705 <printf>
  printf(1, " - 3");
 255:	c7 44 24 04 9b 0f 00 	movl   $0xf9b,0x4(%esp)
 25c:	00 
 25d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 264:	e8 9c 04 00 00       	call   705 <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);
 269:	a1 24 14 00 00       	mov    0x1424,%eax
 26e:	ba 03 00 00 00       	mov    $0x3,%edx
 273:	29 c2                	sub    %eax,%edx
 275:	89 d0                	mov    %edx,%eax
 277:	89 44 24 08          	mov    %eax,0x8(%esp)
 27b:	c7 44 24 04 8f 0f 00 	movl   $0xf8f,0x4(%esp)
 282:	00 
 283:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 28a:	e8 76 04 00 00       	call   705 <printf>
  sem_signal(&wait_tree);
 28f:	c7 04 24 20 14 00 00 	movl   $0x1420,(%esp)
 296:	e8 2f 0b 00 00       	call   dca <sem_signal>
  printf(1, "%d",pid);
 29b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 29e:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a2:	c7 44 24 04 87 0f 00 	movl   $0xf87,0x4(%esp)
 2a9:	00 
 2aa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2b1:	e8 4f 04 00 00       	call   705 <printf>
  printf(1, " - 4"); 
 2b6:	c7 44 24 04 a0 0f 00 	movl   $0xfa0,0x4(%esp)
 2bd:	00 
 2be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c5:	e8 3b 04 00 00       	call   705 <printf>
  printf(1, " - %d\n", 3 - wait_tree.count);  
 2ca:	a1 24 14 00 00       	mov    0x1424,%eax
 2cf:	ba 03 00 00 00       	mov    $0x3,%edx
 2d4:	29 c2                	sub    %eax,%edx
 2d6:	89 d0                	mov    %edx,%eax
 2d8:	89 44 24 08          	mov    %eax,0x8(%esp)
 2dc:	c7 44 24 04 8f 0f 00 	movl   $0xf8f,0x4(%esp)
 2e3:	00 
 2e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2eb:	e8 15 04 00 00       	call   705 <printf>
  texit();
 2f0:	e8 10 03 00 00       	call   605 <texit>

000002f5 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 2f5:	55                   	push   %ebp
 2f6:	89 e5                	mov    %esp,%ebp
 2f8:	57                   	push   %edi
 2f9:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 2fa:	8b 4d 08             	mov    0x8(%ebp),%ecx
 2fd:	8b 55 10             	mov    0x10(%ebp),%edx
 300:	8b 45 0c             	mov    0xc(%ebp),%eax
 303:	89 cb                	mov    %ecx,%ebx
 305:	89 df                	mov    %ebx,%edi
 307:	89 d1                	mov    %edx,%ecx
 309:	fc                   	cld    
 30a:	f3 aa                	rep stos %al,%es:(%edi)
 30c:	89 ca                	mov    %ecx,%edx
 30e:	89 fb                	mov    %edi,%ebx
 310:	89 5d 08             	mov    %ebx,0x8(%ebp)
 313:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 316:	5b                   	pop    %ebx
 317:	5f                   	pop    %edi
 318:	5d                   	pop    %ebp
 319:	c3                   	ret    

0000031a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 31a:	55                   	push   %ebp
 31b:	89 e5                	mov    %esp,%ebp
 31d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 320:	8b 45 08             	mov    0x8(%ebp),%eax
 323:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 326:	90                   	nop
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	8d 50 01             	lea    0x1(%eax),%edx
 32d:	89 55 08             	mov    %edx,0x8(%ebp)
 330:	8b 55 0c             	mov    0xc(%ebp),%edx
 333:	8d 4a 01             	lea    0x1(%edx),%ecx
 336:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 339:	0f b6 12             	movzbl (%edx),%edx
 33c:	88 10                	mov    %dl,(%eax)
 33e:	0f b6 00             	movzbl (%eax),%eax
 341:	84 c0                	test   %al,%al
 343:	75 e2                	jne    327 <strcpy+0xd>
    ;
  return os;
 345:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 348:	c9                   	leave  
 349:	c3                   	ret    

0000034a <strcmp>:

int
strcmp(const char *p, const char *q)
{
 34a:	55                   	push   %ebp
 34b:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 34d:	eb 08                	jmp    357 <strcmp+0xd>
    p++, q++;
 34f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 353:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 357:	8b 45 08             	mov    0x8(%ebp),%eax
 35a:	0f b6 00             	movzbl (%eax),%eax
 35d:	84 c0                	test   %al,%al
 35f:	74 10                	je     371 <strcmp+0x27>
 361:	8b 45 08             	mov    0x8(%ebp),%eax
 364:	0f b6 10             	movzbl (%eax),%edx
 367:	8b 45 0c             	mov    0xc(%ebp),%eax
 36a:	0f b6 00             	movzbl (%eax),%eax
 36d:	38 c2                	cmp    %al,%dl
 36f:	74 de                	je     34f <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 371:	8b 45 08             	mov    0x8(%ebp),%eax
 374:	0f b6 00             	movzbl (%eax),%eax
 377:	0f b6 d0             	movzbl %al,%edx
 37a:	8b 45 0c             	mov    0xc(%ebp),%eax
 37d:	0f b6 00             	movzbl (%eax),%eax
 380:	0f b6 c0             	movzbl %al,%eax
 383:	29 c2                	sub    %eax,%edx
 385:	89 d0                	mov    %edx,%eax
}
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <strlen>:

uint
strlen(char *s)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 38f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 396:	eb 04                	jmp    39c <strlen+0x13>
 398:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 39c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 39f:	8b 45 08             	mov    0x8(%ebp),%eax
 3a2:	01 d0                	add    %edx,%eax
 3a4:	0f b6 00             	movzbl (%eax),%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	75 ed                	jne    398 <strlen+0xf>
    ;
  return n;
 3ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ae:	c9                   	leave  
 3af:	c3                   	ret    

000003b0 <memset>:

void*
memset(void *dst, int c, uint n)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
 3b3:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 3b6:	8b 45 10             	mov    0x10(%ebp),%eax
 3b9:	89 44 24 08          	mov    %eax,0x8(%esp)
 3bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 3c4:	8b 45 08             	mov    0x8(%ebp),%eax
 3c7:	89 04 24             	mov    %eax,(%esp)
 3ca:	e8 26 ff ff ff       	call   2f5 <stosb>
  return dst;
 3cf:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3d2:	c9                   	leave  
 3d3:	c3                   	ret    

000003d4 <strchr>:

char*
strchr(const char *s, char c)
{
 3d4:	55                   	push   %ebp
 3d5:	89 e5                	mov    %esp,%ebp
 3d7:	83 ec 04             	sub    $0x4,%esp
 3da:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dd:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 3e0:	eb 14                	jmp    3f6 <strchr+0x22>
    if(*s == c)
 3e2:	8b 45 08             	mov    0x8(%ebp),%eax
 3e5:	0f b6 00             	movzbl (%eax),%eax
 3e8:	3a 45 fc             	cmp    -0x4(%ebp),%al
 3eb:	75 05                	jne    3f2 <strchr+0x1e>
      return (char*)s;
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	eb 13                	jmp    405 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 3f2:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3f6:	8b 45 08             	mov    0x8(%ebp),%eax
 3f9:	0f b6 00             	movzbl (%eax),%eax
 3fc:	84 c0                	test   %al,%al
 3fe:	75 e2                	jne    3e2 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 400:	b8 00 00 00 00       	mov    $0x0,%eax
}
 405:	c9                   	leave  
 406:	c3                   	ret    

00000407 <gets>:

char*
gets(char *buf, int max)
{
 407:	55                   	push   %ebp
 408:	89 e5                	mov    %esp,%ebp
 40a:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 40d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 414:	eb 4c                	jmp    462 <gets+0x5b>
    cc = read(0, &c, 1);
 416:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 41d:	00 
 41e:	8d 45 ef             	lea    -0x11(%ebp),%eax
 421:	89 44 24 04          	mov    %eax,0x4(%esp)
 425:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 42c:	e8 44 01 00 00       	call   575 <read>
 431:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 434:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 438:	7f 02                	jg     43c <gets+0x35>
      break;
 43a:	eb 31                	jmp    46d <gets+0x66>
    buf[i++] = c;
 43c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 43f:	8d 50 01             	lea    0x1(%eax),%edx
 442:	89 55 f4             	mov    %edx,-0xc(%ebp)
 445:	89 c2                	mov    %eax,%edx
 447:	8b 45 08             	mov    0x8(%ebp),%eax
 44a:	01 c2                	add    %eax,%edx
 44c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 450:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 452:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 456:	3c 0a                	cmp    $0xa,%al
 458:	74 13                	je     46d <gets+0x66>
 45a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 45e:	3c 0d                	cmp    $0xd,%al
 460:	74 0b                	je     46d <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 462:	8b 45 f4             	mov    -0xc(%ebp),%eax
 465:	83 c0 01             	add    $0x1,%eax
 468:	3b 45 0c             	cmp    0xc(%ebp),%eax
 46b:	7c a9                	jl     416 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 46d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 470:	8b 45 08             	mov    0x8(%ebp),%eax
 473:	01 d0                	add    %edx,%eax
 475:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 478:	8b 45 08             	mov    0x8(%ebp),%eax
}
 47b:	c9                   	leave  
 47c:	c3                   	ret    

0000047d <stat>:

int
stat(char *n, struct stat *st)
{
 47d:	55                   	push   %ebp
 47e:	89 e5                	mov    %esp,%ebp
 480:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 483:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 48a:	00 
 48b:	8b 45 08             	mov    0x8(%ebp),%eax
 48e:	89 04 24             	mov    %eax,(%esp)
 491:	e8 07 01 00 00       	call   59d <open>
 496:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 499:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 49d:	79 07                	jns    4a6 <stat+0x29>
    return -1;
 49f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4a4:	eb 23                	jmp    4c9 <stat+0x4c>
  r = fstat(fd, st);
 4a6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a9:	89 44 24 04          	mov    %eax,0x4(%esp)
 4ad:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b0:	89 04 24             	mov    %eax,(%esp)
 4b3:	e8 fd 00 00 00       	call   5b5 <fstat>
 4b8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 4bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4be:	89 04 24             	mov    %eax,(%esp)
 4c1:	e8 bf 00 00 00       	call   585 <close>
  return r;
 4c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 4c9:	c9                   	leave  
 4ca:	c3                   	ret    

000004cb <atoi>:

int
atoi(const char *s)
{
 4cb:	55                   	push   %ebp
 4cc:	89 e5                	mov    %esp,%ebp
 4ce:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 4d1:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 4d8:	eb 25                	jmp    4ff <atoi+0x34>
    n = n*10 + *s++ - '0';
 4da:	8b 55 fc             	mov    -0x4(%ebp),%edx
 4dd:	89 d0                	mov    %edx,%eax
 4df:	c1 e0 02             	shl    $0x2,%eax
 4e2:	01 d0                	add    %edx,%eax
 4e4:	01 c0                	add    %eax,%eax
 4e6:	89 c1                	mov    %eax,%ecx
 4e8:	8b 45 08             	mov    0x8(%ebp),%eax
 4eb:	8d 50 01             	lea    0x1(%eax),%edx
 4ee:	89 55 08             	mov    %edx,0x8(%ebp)
 4f1:	0f b6 00             	movzbl (%eax),%eax
 4f4:	0f be c0             	movsbl %al,%eax
 4f7:	01 c8                	add    %ecx,%eax
 4f9:	83 e8 30             	sub    $0x30,%eax
 4fc:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 4ff:	8b 45 08             	mov    0x8(%ebp),%eax
 502:	0f b6 00             	movzbl (%eax),%eax
 505:	3c 2f                	cmp    $0x2f,%al
 507:	7e 0a                	jle    513 <atoi+0x48>
 509:	8b 45 08             	mov    0x8(%ebp),%eax
 50c:	0f b6 00             	movzbl (%eax),%eax
 50f:	3c 39                	cmp    $0x39,%al
 511:	7e c7                	jle    4da <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 513:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 516:	c9                   	leave  
 517:	c3                   	ret    

00000518 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 518:	55                   	push   %ebp
 519:	89 e5                	mov    %esp,%ebp
 51b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 51e:	8b 45 08             	mov    0x8(%ebp),%eax
 521:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 524:	8b 45 0c             	mov    0xc(%ebp),%eax
 527:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 52a:	eb 17                	jmp    543 <memmove+0x2b>
    *dst++ = *src++;
 52c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 52f:	8d 50 01             	lea    0x1(%eax),%edx
 532:	89 55 fc             	mov    %edx,-0x4(%ebp)
 535:	8b 55 f8             	mov    -0x8(%ebp),%edx
 538:	8d 4a 01             	lea    0x1(%edx),%ecx
 53b:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 53e:	0f b6 12             	movzbl (%edx),%edx
 541:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 543:	8b 45 10             	mov    0x10(%ebp),%eax
 546:	8d 50 ff             	lea    -0x1(%eax),%edx
 549:	89 55 10             	mov    %edx,0x10(%ebp)
 54c:	85 c0                	test   %eax,%eax
 54e:	7f dc                	jg     52c <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 550:	8b 45 08             	mov    0x8(%ebp),%eax
}
 553:	c9                   	leave  
 554:	c3                   	ret    

00000555 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 555:	b8 01 00 00 00       	mov    $0x1,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <exit>:
SYSCALL(exit)
 55d:	b8 02 00 00 00       	mov    $0x2,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <wait>:
SYSCALL(wait)
 565:	b8 03 00 00 00       	mov    $0x3,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <pipe>:
SYSCALL(pipe)
 56d:	b8 04 00 00 00       	mov    $0x4,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <read>:
SYSCALL(read)
 575:	b8 05 00 00 00       	mov    $0x5,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <write>:
SYSCALL(write)
 57d:	b8 10 00 00 00       	mov    $0x10,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <close>:
SYSCALL(close)
 585:	b8 15 00 00 00       	mov    $0x15,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <kill>:
SYSCALL(kill)
 58d:	b8 06 00 00 00       	mov    $0x6,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <exec>:
SYSCALL(exec)
 595:	b8 07 00 00 00       	mov    $0x7,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <open>:
SYSCALL(open)
 59d:	b8 0f 00 00 00       	mov    $0xf,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <mknod>:
SYSCALL(mknod)
 5a5:	b8 11 00 00 00       	mov    $0x11,%eax
 5aa:	cd 40                	int    $0x40
 5ac:	c3                   	ret    

000005ad <unlink>:
SYSCALL(unlink)
 5ad:	b8 12 00 00 00       	mov    $0x12,%eax
 5b2:	cd 40                	int    $0x40
 5b4:	c3                   	ret    

000005b5 <fstat>:
SYSCALL(fstat)
 5b5:	b8 08 00 00 00       	mov    $0x8,%eax
 5ba:	cd 40                	int    $0x40
 5bc:	c3                   	ret    

000005bd <link>:
SYSCALL(link)
 5bd:	b8 13 00 00 00       	mov    $0x13,%eax
 5c2:	cd 40                	int    $0x40
 5c4:	c3                   	ret    

000005c5 <mkdir>:
SYSCALL(mkdir)
 5c5:	b8 14 00 00 00       	mov    $0x14,%eax
 5ca:	cd 40                	int    $0x40
 5cc:	c3                   	ret    

000005cd <chdir>:
SYSCALL(chdir)
 5cd:	b8 09 00 00 00       	mov    $0x9,%eax
 5d2:	cd 40                	int    $0x40
 5d4:	c3                   	ret    

000005d5 <dup>:
SYSCALL(dup)
 5d5:	b8 0a 00 00 00       	mov    $0xa,%eax
 5da:	cd 40                	int    $0x40
 5dc:	c3                   	ret    

000005dd <getpid>:
SYSCALL(getpid)
 5dd:	b8 0b 00 00 00       	mov    $0xb,%eax
 5e2:	cd 40                	int    $0x40
 5e4:	c3                   	ret    

000005e5 <sbrk>:
SYSCALL(sbrk)
 5e5:	b8 0c 00 00 00       	mov    $0xc,%eax
 5ea:	cd 40                	int    $0x40
 5ec:	c3                   	ret    

000005ed <sleep>:
SYSCALL(sleep)
 5ed:	b8 0d 00 00 00       	mov    $0xd,%eax
 5f2:	cd 40                	int    $0x40
 5f4:	c3                   	ret    

000005f5 <uptime>:
SYSCALL(uptime)
 5f5:	b8 0e 00 00 00       	mov    $0xe,%eax
 5fa:	cd 40                	int    $0x40
 5fc:	c3                   	ret    

000005fd <clone>:
SYSCALL(clone)
 5fd:	b8 16 00 00 00       	mov    $0x16,%eax
 602:	cd 40                	int    $0x40
 604:	c3                   	ret    

00000605 <texit>:
SYSCALL(texit)
 605:	b8 17 00 00 00       	mov    $0x17,%eax
 60a:	cd 40                	int    $0x40
 60c:	c3                   	ret    

0000060d <tsleep>:
SYSCALL(tsleep)
 60d:	b8 18 00 00 00       	mov    $0x18,%eax
 612:	cd 40                	int    $0x40
 614:	c3                   	ret    

00000615 <twakeup>:
SYSCALL(twakeup)
 615:	b8 19 00 00 00       	mov    $0x19,%eax
 61a:	cd 40                	int    $0x40
 61c:	c3                   	ret    

0000061d <test>:
SYSCALL(test)
 61d:	b8 1a 00 00 00       	mov    $0x1a,%eax
 622:	cd 40                	int    $0x40
 624:	c3                   	ret    

00000625 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 625:	55                   	push   %ebp
 626:	89 e5                	mov    %esp,%ebp
 628:	83 ec 18             	sub    $0x18,%esp
 62b:	8b 45 0c             	mov    0xc(%ebp),%eax
 62e:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 631:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 638:	00 
 639:	8d 45 f4             	lea    -0xc(%ebp),%eax
 63c:	89 44 24 04          	mov    %eax,0x4(%esp)
 640:	8b 45 08             	mov    0x8(%ebp),%eax
 643:	89 04 24             	mov    %eax,(%esp)
 646:	e8 32 ff ff ff       	call   57d <write>
}
 64b:	c9                   	leave  
 64c:	c3                   	ret    

0000064d <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 64d:	55                   	push   %ebp
 64e:	89 e5                	mov    %esp,%ebp
 650:	56                   	push   %esi
 651:	53                   	push   %ebx
 652:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 655:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 65c:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 660:	74 17                	je     679 <printint+0x2c>
 662:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 666:	79 11                	jns    679 <printint+0x2c>
    neg = 1;
 668:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 66f:	8b 45 0c             	mov    0xc(%ebp),%eax
 672:	f7 d8                	neg    %eax
 674:	89 45 ec             	mov    %eax,-0x14(%ebp)
 677:	eb 06                	jmp    67f <printint+0x32>
  } else {
    x = xx;
 679:	8b 45 0c             	mov    0xc(%ebp),%eax
 67c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 67f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 686:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 689:	8d 41 01             	lea    0x1(%ecx),%eax
 68c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 68f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 692:	8b 45 ec             	mov    -0x14(%ebp),%eax
 695:	ba 00 00 00 00       	mov    $0x0,%edx
 69a:	f7 f3                	div    %ebx
 69c:	89 d0                	mov    %edx,%eax
 69e:	0f b6 80 d0 13 00 00 	movzbl 0x13d0(%eax),%eax
 6a5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 6a9:	8b 75 10             	mov    0x10(%ebp),%esi
 6ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6af:	ba 00 00 00 00       	mov    $0x0,%edx
 6b4:	f7 f6                	div    %esi
 6b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6b9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6bd:	75 c7                	jne    686 <printint+0x39>
  if(neg)
 6bf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6c3:	74 10                	je     6d5 <printint+0x88>
    buf[i++] = '-';
 6c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c8:	8d 50 01             	lea    0x1(%eax),%edx
 6cb:	89 55 f4             	mov    %edx,-0xc(%ebp)
 6ce:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 6d3:	eb 1f                	jmp    6f4 <printint+0xa7>
 6d5:	eb 1d                	jmp    6f4 <printint+0xa7>
    putc(fd, buf[i]);
 6d7:	8d 55 dc             	lea    -0x24(%ebp),%edx
 6da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6dd:	01 d0                	add    %edx,%eax
 6df:	0f b6 00             	movzbl (%eax),%eax
 6e2:	0f be c0             	movsbl %al,%eax
 6e5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e9:	8b 45 08             	mov    0x8(%ebp),%eax
 6ec:	89 04 24             	mov    %eax,(%esp)
 6ef:	e8 31 ff ff ff       	call   625 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 6f4:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 6f8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6fc:	79 d9                	jns    6d7 <printint+0x8a>
    putc(fd, buf[i]);
}
 6fe:	83 c4 30             	add    $0x30,%esp
 701:	5b                   	pop    %ebx
 702:	5e                   	pop    %esi
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
 70b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 712:	8d 45 0c             	lea    0xc(%ebp),%eax
 715:	83 c0 04             	add    $0x4,%eax
 718:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 71b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 722:	e9 7c 01 00 00       	jmp    8a3 <printf+0x19e>
    c = fmt[i] & 0xff;
 727:	8b 55 0c             	mov    0xc(%ebp),%edx
 72a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 72d:	01 d0                	add    %edx,%eax
 72f:	0f b6 00             	movzbl (%eax),%eax
 732:	0f be c0             	movsbl %al,%eax
 735:	25 ff 00 00 00       	and    $0xff,%eax
 73a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 73d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 741:	75 2c                	jne    76f <printf+0x6a>
      if(c == '%'){
 743:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 747:	75 0c                	jne    755 <printf+0x50>
        state = '%';
 749:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 750:	e9 4a 01 00 00       	jmp    89f <printf+0x19a>
      } else {
        putc(fd, c);
 755:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 758:	0f be c0             	movsbl %al,%eax
 75b:	89 44 24 04          	mov    %eax,0x4(%esp)
 75f:	8b 45 08             	mov    0x8(%ebp),%eax
 762:	89 04 24             	mov    %eax,(%esp)
 765:	e8 bb fe ff ff       	call   625 <putc>
 76a:	e9 30 01 00 00       	jmp    89f <printf+0x19a>
      }
    } else if(state == '%'){
 76f:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 773:	0f 85 26 01 00 00    	jne    89f <printf+0x19a>
      if(c == 'd'){
 779:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 77d:	75 2d                	jne    7ac <printf+0xa7>
        printint(fd, *ap, 10, 1);
 77f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 782:	8b 00                	mov    (%eax),%eax
 784:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 78b:	00 
 78c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 793:	00 
 794:	89 44 24 04          	mov    %eax,0x4(%esp)
 798:	8b 45 08             	mov    0x8(%ebp),%eax
 79b:	89 04 24             	mov    %eax,(%esp)
 79e:	e8 aa fe ff ff       	call   64d <printint>
        ap++;
 7a3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7a7:	e9 ec 00 00 00       	jmp    898 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 7ac:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 7b0:	74 06                	je     7b8 <printf+0xb3>
 7b2:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 7b6:	75 2d                	jne    7e5 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 7b8:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7bb:	8b 00                	mov    (%eax),%eax
 7bd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7c4:	00 
 7c5:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 7cc:	00 
 7cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d1:	8b 45 08             	mov    0x8(%ebp),%eax
 7d4:	89 04 24             	mov    %eax,(%esp)
 7d7:	e8 71 fe ff ff       	call   64d <printint>
        ap++;
 7dc:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7e0:	e9 b3 00 00 00       	jmp    898 <printf+0x193>
      } else if(c == 's'){
 7e5:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 7e9:	75 45                	jne    830 <printf+0x12b>
        s = (char*)*ap;
 7eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7ee:	8b 00                	mov    (%eax),%eax
 7f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 7f3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 7f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 7fb:	75 09                	jne    806 <printf+0x101>
          s = "(null)";
 7fd:	c7 45 f4 a5 0f 00 00 	movl   $0xfa5,-0xc(%ebp)
        while(*s != 0){
 804:	eb 1e                	jmp    824 <printf+0x11f>
 806:	eb 1c                	jmp    824 <printf+0x11f>
          putc(fd, *s);
 808:	8b 45 f4             	mov    -0xc(%ebp),%eax
 80b:	0f b6 00             	movzbl (%eax),%eax
 80e:	0f be c0             	movsbl %al,%eax
 811:	89 44 24 04          	mov    %eax,0x4(%esp)
 815:	8b 45 08             	mov    0x8(%ebp),%eax
 818:	89 04 24             	mov    %eax,(%esp)
 81b:	e8 05 fe ff ff       	call   625 <putc>
          s++;
 820:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 824:	8b 45 f4             	mov    -0xc(%ebp),%eax
 827:	0f b6 00             	movzbl (%eax),%eax
 82a:	84 c0                	test   %al,%al
 82c:	75 da                	jne    808 <printf+0x103>
 82e:	eb 68                	jmp    898 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 830:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 834:	75 1d                	jne    853 <printf+0x14e>
        putc(fd, *ap);
 836:	8b 45 e8             	mov    -0x18(%ebp),%eax
 839:	8b 00                	mov    (%eax),%eax
 83b:	0f be c0             	movsbl %al,%eax
 83e:	89 44 24 04          	mov    %eax,0x4(%esp)
 842:	8b 45 08             	mov    0x8(%ebp),%eax
 845:	89 04 24             	mov    %eax,(%esp)
 848:	e8 d8 fd ff ff       	call   625 <putc>
        ap++;
 84d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 851:	eb 45                	jmp    898 <printf+0x193>
      } else if(c == '%'){
 853:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 857:	75 17                	jne    870 <printf+0x16b>
        putc(fd, c);
 859:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 85c:	0f be c0             	movsbl %al,%eax
 85f:	89 44 24 04          	mov    %eax,0x4(%esp)
 863:	8b 45 08             	mov    0x8(%ebp),%eax
 866:	89 04 24             	mov    %eax,(%esp)
 869:	e8 b7 fd ff ff       	call   625 <putc>
 86e:	eb 28                	jmp    898 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 870:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 877:	00 
 878:	8b 45 08             	mov    0x8(%ebp),%eax
 87b:	89 04 24             	mov    %eax,(%esp)
 87e:	e8 a2 fd ff ff       	call   625 <putc>
        putc(fd, c);
 883:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 886:	0f be c0             	movsbl %al,%eax
 889:	89 44 24 04          	mov    %eax,0x4(%esp)
 88d:	8b 45 08             	mov    0x8(%ebp),%eax
 890:	89 04 24             	mov    %eax,(%esp)
 893:	e8 8d fd ff ff       	call   625 <putc>
      }
      state = 0;
 898:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 89f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 8a3:	8b 55 0c             	mov    0xc(%ebp),%edx
 8a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a9:	01 d0                	add    %edx,%eax
 8ab:	0f b6 00             	movzbl (%eax),%eax
 8ae:	84 c0                	test   %al,%al
 8b0:	0f 85 71 fe ff ff    	jne    727 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8b6:	c9                   	leave  
 8b7:	c3                   	ret    

000008b8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8b8:	55                   	push   %ebp
 8b9:	89 e5                	mov    %esp,%ebp
 8bb:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8be:	8b 45 08             	mov    0x8(%ebp),%eax
 8c1:	83 e8 08             	sub    $0x8,%eax
 8c4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8c7:	a1 08 14 00 00       	mov    0x1408,%eax
 8cc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8cf:	eb 24                	jmp    8f5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 8d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d4:	8b 00                	mov    (%eax),%eax
 8d6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8d9:	77 12                	ja     8ed <free+0x35>
 8db:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8de:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8e1:	77 24                	ja     907 <free+0x4f>
 8e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e6:	8b 00                	mov    (%eax),%eax
 8e8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8eb:	77 1a                	ja     907 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 8ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f0:	8b 00                	mov    (%eax),%eax
 8f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 8f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 8fb:	76 d4                	jbe    8d1 <free+0x19>
 8fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 900:	8b 00                	mov    (%eax),%eax
 902:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 905:	76 ca                	jbe    8d1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 907:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90a:	8b 40 04             	mov    0x4(%eax),%eax
 90d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 914:	8b 45 f8             	mov    -0x8(%ebp),%eax
 917:	01 c2                	add    %eax,%edx
 919:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91c:	8b 00                	mov    (%eax),%eax
 91e:	39 c2                	cmp    %eax,%edx
 920:	75 24                	jne    946 <free+0x8e>
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
 944:	eb 0a                	jmp    950 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 946:	8b 45 fc             	mov    -0x4(%ebp),%eax
 949:	8b 10                	mov    (%eax),%edx
 94b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 94e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 950:	8b 45 fc             	mov    -0x4(%ebp),%eax
 953:	8b 40 04             	mov    0x4(%eax),%eax
 956:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 95d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 960:	01 d0                	add    %edx,%eax
 962:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 965:	75 20                	jne    987 <free+0xcf>
    p->s.size += bp->s.size;
 967:	8b 45 fc             	mov    -0x4(%ebp),%eax
 96a:	8b 50 04             	mov    0x4(%eax),%edx
 96d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 970:	8b 40 04             	mov    0x4(%eax),%eax
 973:	01 c2                	add    %eax,%edx
 975:	8b 45 fc             	mov    -0x4(%ebp),%eax
 978:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 97b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97e:	8b 10                	mov    (%eax),%edx
 980:	8b 45 fc             	mov    -0x4(%ebp),%eax
 983:	89 10                	mov    %edx,(%eax)
 985:	eb 08                	jmp    98f <free+0xd7>
  } else
    p->s.ptr = bp;
 987:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 98d:	89 10                	mov    %edx,(%eax)
  freep = p;
 98f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 992:	a3 08 14 00 00       	mov    %eax,0x1408
}
 997:	c9                   	leave  
 998:	c3                   	ret    

00000999 <morecore>:

static Header*
morecore(uint nu)
{
 999:	55                   	push   %ebp
 99a:	89 e5                	mov    %esp,%ebp
 99c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 99f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9a6:	77 07                	ja     9af <morecore+0x16>
    nu = 4096;
 9a8:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9af:	8b 45 08             	mov    0x8(%ebp),%eax
 9b2:	c1 e0 03             	shl    $0x3,%eax
 9b5:	89 04 24             	mov    %eax,(%esp)
 9b8:	e8 28 fc ff ff       	call   5e5 <sbrk>
 9bd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 9c0:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 9c4:	75 07                	jne    9cd <morecore+0x34>
    return 0;
 9c6:	b8 00 00 00 00       	mov    $0x0,%eax
 9cb:	eb 22                	jmp    9ef <morecore+0x56>
  hp = (Header*)p;
 9cd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 9d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d6:	8b 55 08             	mov    0x8(%ebp),%edx
 9d9:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 9dc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9df:	83 c0 08             	add    $0x8,%eax
 9e2:	89 04 24             	mov    %eax,(%esp)
 9e5:	e8 ce fe ff ff       	call   8b8 <free>
  return freep;
 9ea:	a1 08 14 00 00       	mov    0x1408,%eax
}
 9ef:	c9                   	leave  
 9f0:	c3                   	ret    

000009f1 <malloc>:

void*
malloc(uint nbytes)
{
 9f1:	55                   	push   %ebp
 9f2:	89 e5                	mov    %esp,%ebp
 9f4:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 9f7:	8b 45 08             	mov    0x8(%ebp),%eax
 9fa:	83 c0 07             	add    $0x7,%eax
 9fd:	c1 e8 03             	shr    $0x3,%eax
 a00:	83 c0 01             	add    $0x1,%eax
 a03:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a06:	a1 08 14 00 00       	mov    0x1408,%eax
 a0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a0e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a12:	75 23                	jne    a37 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a14:	c7 45 f0 00 14 00 00 	movl   $0x1400,-0x10(%ebp)
 a1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a1e:	a3 08 14 00 00       	mov    %eax,0x1408
 a23:	a1 08 14 00 00       	mov    0x1408,%eax
 a28:	a3 00 14 00 00       	mov    %eax,0x1400
    base.s.size = 0;
 a2d:	c7 05 04 14 00 00 00 	movl   $0x0,0x1404
 a34:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a37:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a3a:	8b 00                	mov    (%eax),%eax
 a3c:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a42:	8b 40 04             	mov    0x4(%eax),%eax
 a45:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a48:	72 4d                	jb     a97 <malloc+0xa6>
      if(p->s.size == nunits)
 a4a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a4d:	8b 40 04             	mov    0x4(%eax),%eax
 a50:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 a53:	75 0c                	jne    a61 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a55:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a58:	8b 10                	mov    (%eax),%edx
 a5a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a5d:	89 10                	mov    %edx,(%eax)
 a5f:	eb 26                	jmp    a87 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a61:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a64:	8b 40 04             	mov    0x4(%eax),%eax
 a67:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a6a:	89 c2                	mov    %eax,%edx
 a6c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6f:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a72:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a75:	8b 40 04             	mov    0x4(%eax),%eax
 a78:	c1 e0 03             	shl    $0x3,%eax
 a7b:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a7e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a81:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a84:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a87:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a8a:	a3 08 14 00 00       	mov    %eax,0x1408
      return (void*)(p + 1);
 a8f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a92:	83 c0 08             	add    $0x8,%eax
 a95:	eb 38                	jmp    acf <malloc+0xde>
    }
    if(p == freep)
 a97:	a1 08 14 00 00       	mov    0x1408,%eax
 a9c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a9f:	75 1b                	jne    abc <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 aa1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aa4:	89 04 24             	mov    %eax,(%esp)
 aa7:	e8 ed fe ff ff       	call   999 <morecore>
 aac:	89 45 f4             	mov    %eax,-0xc(%ebp)
 aaf:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 ab3:	75 07                	jne    abc <malloc+0xcb>
        return 0;
 ab5:	b8 00 00 00 00       	mov    $0x0,%eax
 aba:	eb 13                	jmp    acf <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 abc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 abf:	89 45 f0             	mov    %eax,-0x10(%ebp)
 ac2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ac5:	8b 00                	mov    (%eax),%eax
 ac7:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 aca:	e9 70 ff ff ff       	jmp    a3f <malloc+0x4e>
}
 acf:	c9                   	leave  
 ad0:	c3                   	ret    

00000ad1 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 ad1:	55                   	push   %ebp
 ad2:	89 e5                	mov    %esp,%ebp
 ad4:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 ad7:	8b 55 08             	mov    0x8(%ebp),%edx
 ada:	8b 45 0c             	mov    0xc(%ebp),%eax
 add:	8b 4d 08             	mov    0x8(%ebp),%ecx
 ae0:	f0 87 02             	lock xchg %eax,(%edx)
 ae3:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 ae6:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 ae9:	c9                   	leave  
 aea:	c3                   	ret    

00000aeb <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 aeb:	55                   	push   %ebp
 aec:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 aee:	8b 45 08             	mov    0x8(%ebp),%eax
 af1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 af7:	5d                   	pop    %ebp
 af8:	c3                   	ret    

00000af9 <lock_acquire>:
void lock_acquire(lock_t *lock){
 af9:	55                   	push   %ebp
 afa:	89 e5                	mov    %esp,%ebp
 afc:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 aff:	90                   	nop
 b00:	8b 45 08             	mov    0x8(%ebp),%eax
 b03:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 b0a:	00 
 b0b:	89 04 24             	mov    %eax,(%esp)
 b0e:	e8 be ff ff ff       	call   ad1 <xchg>
 b13:	85 c0                	test   %eax,%eax
 b15:	75 e9                	jne    b00 <lock_acquire+0x7>
}
 b17:	c9                   	leave  
 b18:	c3                   	ret    

00000b19 <lock_release>:
void lock_release(lock_t *lock){
 b19:	55                   	push   %ebp
 b1a:	89 e5                	mov    %esp,%ebp
 b1c:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 b1f:	8b 45 08             	mov    0x8(%ebp),%eax
 b22:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 b29:	00 
 b2a:	89 04 24             	mov    %eax,(%esp)
 b2d:	e8 9f ff ff ff       	call   ad1 <xchg>
}
 b32:	c9                   	leave  
 b33:	c3                   	ret    

00000b34 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 b34:	55                   	push   %ebp
 b35:	89 e5                	mov    %esp,%ebp
 b37:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 b3a:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 b41:	e8 ab fe ff ff       	call   9f1 <malloc>
 b46:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 b49:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b4c:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 b4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b52:	25 ff 0f 00 00       	and    $0xfff,%eax
 b57:	85 c0                	test   %eax,%eax
 b59:	74 14                	je     b6f <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 b5b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b5e:	25 ff 0f 00 00       	and    $0xfff,%eax
 b63:	89 c2                	mov    %eax,%edx
 b65:	b8 00 10 00 00       	mov    $0x1000,%eax
 b6a:	29 d0                	sub    %edx,%eax
 b6c:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 b6f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b73:	75 1b                	jne    b90 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 b75:	c7 44 24 04 ac 0f 00 	movl   $0xfac,0x4(%esp)
 b7c:	00 
 b7d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b84:	e8 7c fb ff ff       	call   705 <printf>
        return 0;
 b89:	b8 00 00 00 00       	mov    $0x0,%eax
 b8e:	eb 6f                	jmp    bff <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 b90:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 b93:	8b 55 08             	mov    0x8(%ebp),%edx
 b96:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b99:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 b9d:	89 54 24 08          	mov    %edx,0x8(%esp)
 ba1:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 ba8:	00 
 ba9:	89 04 24             	mov    %eax,(%esp)
 bac:	e8 4c fa ff ff       	call   5fd <clone>
 bb1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 bb4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bb8:	79 1b                	jns    bd5 <thread_create+0xa1>
        printf(1,"clone fails\n");
 bba:	c7 44 24 04 ba 0f 00 	movl   $0xfba,0x4(%esp)
 bc1:	00 
 bc2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bc9:	e8 37 fb ff ff       	call   705 <printf>
        return 0;
 bce:	b8 00 00 00 00       	mov    $0x0,%eax
 bd3:	eb 2a                	jmp    bff <thread_create+0xcb>
    }
    if(tid > 0){
 bd5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bd9:	7e 05                	jle    be0 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 bdb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bde:	eb 1f                	jmp    bff <thread_create+0xcb>
    }
    if(tid == 0){
 be0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 be4:	75 14                	jne    bfa <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 be6:	c7 44 24 04 c7 0f 00 	movl   $0xfc7,0x4(%esp)
 bed:	00 
 bee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bf5:	e8 0b fb ff ff       	call   705 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 bfa:	b8 00 00 00 00       	mov    $0x0,%eax
}
 bff:	c9                   	leave  
 c00:	c3                   	ret    

00000c01 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 c01:	55                   	push   %ebp
 c02:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 c04:	8b 45 08             	mov    0x8(%ebp),%eax
 c07:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 c0d:	8b 45 08             	mov    0x8(%ebp),%eax
 c10:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 c17:	8b 45 08             	mov    0x8(%ebp),%eax
 c1a:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 c21:	5d                   	pop    %ebp
 c22:	c3                   	ret    

00000c23 <add_q>:

void add_q(struct queue *q, int v){
 c23:	55                   	push   %ebp
 c24:	89 e5                	mov    %esp,%ebp
 c26:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 c29:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 c30:	e8 bc fd ff ff       	call   9f1 <malloc>
 c35:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 c38:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c3b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 c42:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c45:	8b 55 0c             	mov    0xc(%ebp),%edx
 c48:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 c4a:	8b 45 08             	mov    0x8(%ebp),%eax
 c4d:	8b 40 04             	mov    0x4(%eax),%eax
 c50:	85 c0                	test   %eax,%eax
 c52:	75 0b                	jne    c5f <add_q+0x3c>
        q->head = n;
 c54:	8b 45 08             	mov    0x8(%ebp),%eax
 c57:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c5a:	89 50 04             	mov    %edx,0x4(%eax)
 c5d:	eb 0c                	jmp    c6b <add_q+0x48>
    }else{
        q->tail->next = n;
 c5f:	8b 45 08             	mov    0x8(%ebp),%eax
 c62:	8b 40 08             	mov    0x8(%eax),%eax
 c65:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c68:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 c6b:	8b 45 08             	mov    0x8(%ebp),%eax
 c6e:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c71:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 c74:	8b 45 08             	mov    0x8(%ebp),%eax
 c77:	8b 00                	mov    (%eax),%eax
 c79:	8d 50 01             	lea    0x1(%eax),%edx
 c7c:	8b 45 08             	mov    0x8(%ebp),%eax
 c7f:	89 10                	mov    %edx,(%eax)
}
 c81:	c9                   	leave  
 c82:	c3                   	ret    

00000c83 <empty_q>:

int empty_q(struct queue *q){
 c83:	55                   	push   %ebp
 c84:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 c86:	8b 45 08             	mov    0x8(%ebp),%eax
 c89:	8b 00                	mov    (%eax),%eax
 c8b:	85 c0                	test   %eax,%eax
 c8d:	75 07                	jne    c96 <empty_q+0x13>
        return 1;
 c8f:	b8 01 00 00 00       	mov    $0x1,%eax
 c94:	eb 05                	jmp    c9b <empty_q+0x18>
    else
        return 0;
 c96:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 c9b:	5d                   	pop    %ebp
 c9c:	c3                   	ret    

00000c9d <pop_q>:
int pop_q(struct queue *q){
 c9d:	55                   	push   %ebp
 c9e:	89 e5                	mov    %esp,%ebp
 ca0:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 ca3:	8b 45 08             	mov    0x8(%ebp),%eax
 ca6:	89 04 24             	mov    %eax,(%esp)
 ca9:	e8 d5 ff ff ff       	call   c83 <empty_q>
 cae:	85 c0                	test   %eax,%eax
 cb0:	75 5d                	jne    d0f <pop_q+0x72>
       val = q->head->value; 
 cb2:	8b 45 08             	mov    0x8(%ebp),%eax
 cb5:	8b 40 04             	mov    0x4(%eax),%eax
 cb8:	8b 00                	mov    (%eax),%eax
 cba:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 cbd:	8b 45 08             	mov    0x8(%ebp),%eax
 cc0:	8b 40 04             	mov    0x4(%eax),%eax
 cc3:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 cc6:	8b 45 08             	mov    0x8(%ebp),%eax
 cc9:	8b 40 04             	mov    0x4(%eax),%eax
 ccc:	8b 50 04             	mov    0x4(%eax),%edx
 ccf:	8b 45 08             	mov    0x8(%ebp),%eax
 cd2:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 cd5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 cd8:	89 04 24             	mov    %eax,(%esp)
 cdb:	e8 d8 fb ff ff       	call   8b8 <free>
       q->size--;
 ce0:	8b 45 08             	mov    0x8(%ebp),%eax
 ce3:	8b 00                	mov    (%eax),%eax
 ce5:	8d 50 ff             	lea    -0x1(%eax),%edx
 ce8:	8b 45 08             	mov    0x8(%ebp),%eax
 ceb:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 ced:	8b 45 08             	mov    0x8(%ebp),%eax
 cf0:	8b 00                	mov    (%eax),%eax
 cf2:	85 c0                	test   %eax,%eax
 cf4:	75 14                	jne    d0a <pop_q+0x6d>
            q->head = 0;
 cf6:	8b 45 08             	mov    0x8(%ebp),%eax
 cf9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 d00:	8b 45 08             	mov    0x8(%ebp),%eax
 d03:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 d0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d0d:	eb 05                	jmp    d14 <pop_q+0x77>
    }
    return -1;
 d0f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 d14:	c9                   	leave  
 d15:	c3                   	ret    

00000d16 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 d16:	55                   	push   %ebp
 d17:	89 e5                	mov    %esp,%ebp
 d19:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 d1c:	8b 45 08             	mov    0x8(%ebp),%eax
 d1f:	8b 55 0c             	mov    0xc(%ebp),%edx
 d22:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 d25:	8b 45 08             	mov    0x8(%ebp),%eax
 d28:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 d2f:	8b 45 08             	mov    0x8(%ebp),%eax
 d32:	89 04 24             	mov    %eax,(%esp)
 d35:	e8 b1 fd ff ff       	call   aeb <lock_init>
}
 d3a:	c9                   	leave  
 d3b:	c3                   	ret    

00000d3c <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 d3c:	55                   	push   %ebp
 d3d:	89 e5                	mov    %esp,%ebp
 d3f:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 d42:	8b 45 08             	mov    0x8(%ebp),%eax
 d45:	89 04 24             	mov    %eax,(%esp)
 d48:	e8 ac fd ff ff       	call   af9 <lock_acquire>
	if(s->count  == 0){
 d4d:	8b 45 08             	mov    0x8(%ebp),%eax
 d50:	8b 40 04             	mov    0x4(%eax),%eax
 d53:	85 c0                	test   %eax,%eax
 d55:	75 43                	jne    d9a <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 d57:	c7 44 24 04 d8 0f 00 	movl   $0xfd8,0x4(%esp)
 d5e:	00 
 d5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d66:	e8 9a f9 ff ff       	call   705 <printf>
		//add proc to waiters list
		int tid = getpid();
 d6b:	e8 6d f8 ff ff       	call   5dd <getpid>
 d70:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 d73:	8b 45 08             	mov    0x8(%ebp),%eax
 d76:	8d 50 0c             	lea    0xc(%eax),%edx
 d79:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d7c:	89 44 24 04          	mov    %eax,0x4(%esp)
 d80:	89 14 24             	mov    %edx,(%esp)
 d83:	e8 9b fe ff ff       	call   c23 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 d88:	8b 45 08             	mov    0x8(%ebp),%eax
 d8b:	89 04 24             	mov    %eax,(%esp)
 d8e:	e8 86 fd ff ff       	call   b19 <lock_release>
		tsleep(); 
 d93:	e8 75 f8 ff ff       	call   60d <tsleep>
 d98:	eb 2e                	jmp    dc8 <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 d9a:	c7 44 24 04 df 0f 00 	movl   $0xfdf,0x4(%esp)
 da1:	00 
 da2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 da9:	e8 57 f9 ff ff       	call   705 <printf>
		s->count--;	
 dae:	8b 45 08             	mov    0x8(%ebp),%eax
 db1:	8b 40 04             	mov    0x4(%eax),%eax
 db4:	8d 50 ff             	lea    -0x1(%eax),%edx
 db7:	8b 45 08             	mov    0x8(%ebp),%eax
 dba:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 dbd:	8b 45 08             	mov    0x8(%ebp),%eax
 dc0:	89 04 24             	mov    %eax,(%esp)
 dc3:	e8 51 fd ff ff       	call   b19 <lock_release>
	}
}
 dc8:	c9                   	leave  
 dc9:	c3                   	ret    

00000dca <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 dca:	55                   	push   %ebp
 dcb:	89 e5                	mov    %esp,%ebp
 dcd:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 dd0:	c7 44 24 04 e6 0f 00 	movl   $0xfe6,0x4(%esp)
 dd7:	00 
 dd8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ddf:	e8 21 f9 ff ff       	call   705 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 de4:	8b 45 08             	mov    0x8(%ebp),%eax
 de7:	89 04 24             	mov    %eax,(%esp)
 dea:	e8 0a fd ff ff       	call   af9 <lock_acquire>
	if(s->count < s->size){
 def:	8b 45 08             	mov    0x8(%ebp),%eax
 df2:	8b 50 04             	mov    0x4(%eax),%edx
 df5:	8b 45 08             	mov    0x8(%ebp),%eax
 df8:	8b 40 08             	mov    0x8(%eax),%eax
 dfb:	39 c2                	cmp    %eax,%edx
 dfd:	7d 0f                	jge    e0e <sem_signal+0x44>
		s->count++;	
 dff:	8b 45 08             	mov    0x8(%ebp),%eax
 e02:	8b 40 04             	mov    0x4(%eax),%eax
 e05:	8d 50 01             	lea    0x1(%eax),%edx
 e08:	8b 45 08             	mov    0x8(%ebp),%eax
 e0b:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 e0e:	8b 45 08             	mov    0x8(%ebp),%eax
 e11:	83 c0 0c             	add    $0xc,%eax
 e14:	89 04 24             	mov    %eax,(%esp)
 e17:	e8 81 fe ff ff       	call   c9d <pop_q>
 e1c:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 e1f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 e23:	74 2e                	je     e53 <sem_signal+0x89>
		printf(1, "Sem A\n");
 e25:	c7 44 24 04 df 0f 00 	movl   $0xfdf,0x4(%esp)
 e2c:	00 
 e2d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 e34:	e8 cc f8 ff ff       	call   705 <printf>
		twakeup(tid);
 e39:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e3c:	89 04 24             	mov    %eax,(%esp)
 e3f:	e8 d1 f7 ff ff       	call   615 <twakeup>
		s->count--;
 e44:	8b 45 08             	mov    0x8(%ebp),%eax
 e47:	8b 40 04             	mov    0x4(%eax),%eax
 e4a:	8d 50 ff             	lea    -0x1(%eax),%edx
 e4d:	8b 45 08             	mov    0x8(%ebp),%eax
 e50:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 e53:	8b 45 08             	mov    0x8(%ebp),%eax
 e56:	89 04 24             	mov    %eax,(%esp)
 e59:	e8 bb fc ff ff       	call   b19 <lock_release>

 e5e:	c9                   	leave  
 e5f:	c3                   	ret    
