
_h2o:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
void hReady();
void oReady();

int
main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
	sem_init_full(&wait_o, oNum);  //Initialize semaphore with 5 slots
   9:	a1 04 13 00 00       	mov    0x1304,%eax
   e:	89 44 24 04          	mov    %eax,0x4(%esp)
  12:	c7 04 24 60 13 00 00 	movl   $0x1360,(%esp)
  19:	e8 c8 0c 00 00       	call   ce6 <sem_init_full>
	sem_init_full(&wait_h, hNum); //Initialize semaphore with 10 slots
  1e:	a1 08 13 00 00       	mov    0x1308,%eax
  23:	89 44 24 04          	mov    %eax,0x4(%esp)
  27:	c7 04 24 e0 13 00 00 	movl   $0x13e0,(%esp)
  2e:	e8 b3 0c 00 00       	call   ce6 <sem_init_full>
	sem_init(&printer, 1);
  33:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  3a:	00 
  3b:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
  42:	e8 7a 0c 00 00       	call   cc1 <sem_init>
	

	int i;
	int molecule_length = 15;
  47:	c7 44 24 18 0f 00 00 	movl   $0xf,0x18(%esp)
  4e:	00 
	for(i = 0; i < molecule_length; i++){
  4f:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
  56:	00 
  57:	eb 46                	jmp    9f <main+0x9f>
		int r = random(2);
  59:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  60:	e8 1c 0b 00 00       	call   b81 <random>
  65:	89 44 24 14          	mov    %eax,0x14(%esp)
		if(r) thread_create(oReady, 0);
  69:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
  6e:	74 16                	je     86 <main+0x86>
  70:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  77:	00 
  78:	c7 04 24 59 01 00 00 	movl   $0x159,(%esp)
  7f:	e8 30 0a 00 00       	call   ab4 <thread_create>
  84:	eb 14                	jmp    9a <main+0x9a>
		else thread_create(hReady, 0);
  86:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  8d:	00 
  8e:	c7 04 24 cc 00 00 00 	movl   $0xcc,(%esp)
  95:	e8 1a 0a 00 00       	call   ab4 <thread_create>
	sem_init(&printer, 1);
	

	int i;
	int molecule_length = 15;
	for(i = 0; i < molecule_length; i++){
  9a:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  9f:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  a3:	3b 44 24 18          	cmp    0x18(%esp),%eax
  a7:	7c b0                	jl     59 <main+0x59>
		else thread_create(hReady, 0);
	}

	//for(i = 0; i < 5; i++) thread_create(oReady, 0);
	//for(i = 0; i < 10; i++) thread_create(hReady, 0);
    while(wait()>0);
  a9:	90                   	nop
  aa:	e8 36 04 00 00       	call   4e5 <wait>
  af:	85 c0                	test   %eax,%eax
  b1:	7f f7                	jg     aa <main+0xaa>
	printf(1,"Balanced Reaction\n");
  b3:	c7 44 24 04 f4 0d 00 	movl   $0xdf4,0x4(%esp)
  ba:	00 
  bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c2:	e8 be 05 00 00       	call   685 <printf>
	exit();
  c7:	e8 11 04 00 00       	call   4dd <exit>

000000cc <hReady>:
}

void hReady(){
  cc:	55                   	push   %ebp
  cd:	89 e5                	mov    %esp,%ebp
  cf:	83 ec 18             	sub    $0x18,%esp
	sem_aquire(&printer);
  d2:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
  d9:	e8 2e 0c 00 00       	call   d0c <sem_aquire>
  	printf(1, "Hydrogen(%d) Ready\n", getpid());  	
  de:	e8 7a 04 00 00       	call   55d <getpid>
  e3:	89 44 24 08          	mov    %eax,0x8(%esp)
  e7:	c7 44 24 04 07 0e 00 	movl   $0xe07,0x4(%esp)
  ee:	00 
  ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f6:	e8 8a 05 00 00       	call   685 <printf>
  	sem_signal(&printer);
  fb:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
 102:	e8 6b 0c 00 00       	call   d72 <sem_signal>

	sem_signal(&wait_h);
 107:	c7 04 24 e0 13 00 00 	movl   $0x13e0,(%esp)
 10e:	e8 5f 0c 00 00       	call   d72 <sem_signal>
	sem_aquire(&wait_o);
 113:	c7 04 24 60 13 00 00 	movl   $0x1360,(%esp)
 11a:	e8 ed 0b 00 00       	call   d0c <sem_aquire>
	sem_aquire(&printer);
 11f:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
 126:	e8 e1 0b 00 00       	call   d0c <sem_aquire>
  	printf(1, "Hydrogen(%d) Bonded with Oxygen Ready\n", getpid());  	
 12b:	e8 2d 04 00 00       	call   55d <getpid>
 130:	89 44 24 08          	mov    %eax,0x8(%esp)
 134:	c7 44 24 04 1c 0e 00 	movl   $0xe1c,0x4(%esp)
 13b:	00 
 13c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 143:	e8 3d 05 00 00       	call   685 <printf>
  	sem_signal(&printer);
 148:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
 14f:	e8 1e 0c 00 00       	call   d72 <sem_signal>
	texit();
 154:	e8 2c 04 00 00       	call   585 <texit>

00000159 <oReady>:
}

//Oxyegn waits untill there are two hydrogens
void oReady(){
 159:	55                   	push   %ebp
 15a:	89 e5                	mov    %esp,%ebp
 15c:	83 ec 18             	sub    $0x18,%esp
	sem_aquire(&printer);
 15f:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
 166:	e8 a1 0b 00 00       	call   d0c <sem_aquire>
	printf(1, "Oxygen(%d) Ready\n", getpid());  	
 16b:	e8 ed 03 00 00       	call   55d <getpid>
 170:	89 44 24 08          	mov    %eax,0x8(%esp)
 174:	c7 44 24 04 43 0e 00 	movl   $0xe43,0x4(%esp)
 17b:	00 
 17c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 183:	e8 fd 04 00 00       	call   685 <printf>
	sem_signal(&printer);
 188:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
 18f:	e8 de 0b 00 00       	call   d72 <sem_signal>

  	sem_aquire(&wait_h);
 194:	c7 04 24 e0 13 00 00 	movl   $0x13e0,(%esp)
 19b:	e8 6c 0b 00 00       	call   d0c <sem_aquire>
	sem_aquire(&printer);
 1a0:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
 1a7:	e8 60 0b 00 00       	call   d0c <sem_aquire>
  	printf(1, "Oxygen(%d) bonded with Hydrogen Ready\n", getpid());  	
 1ac:	e8 ac 03 00 00       	call   55d <getpid>
 1b1:	89 44 24 08          	mov    %eax,0x8(%esp)
 1b5:	c7 44 24 04 58 0e 00 	movl   $0xe58,0x4(%esp)
 1bc:	00 
 1bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c4:	e8 bc 04 00 00       	call   685 <printf>
  	sem_signal(&printer);
 1c9:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
 1d0:	e8 9d 0b 00 00       	call   d72 <sem_signal>
  	sem_aquire(&wait_h); 
 1d5:	c7 04 24 e0 13 00 00 	movl   $0x13e0,(%esp)
 1dc:	e8 2b 0b 00 00       	call   d0c <sem_aquire>
	sem_aquire(&printer);
 1e1:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
 1e8:	e8 1f 0b 00 00       	call   d0c <sem_aquire>
  	printf(1, "Oxygen(%d) bonded with Hydrogen Ready\n", getpid());  	
 1ed:	e8 6b 03 00 00       	call   55d <getpid>
 1f2:	89 44 24 08          	mov    %eax,0x8(%esp)
 1f6:	c7 44 24 04 58 0e 00 	movl   $0xe58,0x4(%esp)
 1fd:	00 
 1fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 205:	e8 7b 04 00 00       	call   685 <printf>
  	sem_signal(&printer);
 20a:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
 211:	e8 5c 0b 00 00       	call   d72 <sem_signal>
  	sem_signal(&wait_o);
 216:	c7 04 24 60 13 00 00 	movl   $0x1360,(%esp)
 21d:	e8 50 0b 00 00       	call   d72 <sem_signal>
  	sem_signal(&wait_o);
 222:	c7 04 24 60 13 00 00 	movl   $0x1360,(%esp)
 229:	e8 44 0b 00 00       	call   d72 <sem_signal>

	sem_aquire(&printer);
 22e:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
 235:	e8 d2 0a 00 00       	call   d0c <sem_aquire>
	molecules++;
 23a:	a1 04 14 00 00       	mov    0x1404,%eax
 23f:	83 c0 01             	add    $0x1,%eax
 242:	a3 04 14 00 00       	mov    %eax,0x1404
	printf(1, "Water Molecule %d\n", molecules);  	
 247:	a1 04 14 00 00       	mov    0x1404,%eax
 24c:	89 44 24 08          	mov    %eax,0x8(%esp)
 250:	c7 44 24 04 7f 0e 00 	movl   $0xe7f,0x4(%esp)
 257:	00 
 258:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 25f:	e8 21 04 00 00       	call   685 <printf>
	sem_signal(&printer); 
 264:	c7 04 24 a0 13 00 00 	movl   $0x13a0,(%esp)
 26b:	e8 02 0b 00 00       	call   d72 <sem_signal>
  texit();
 270:	e8 10 03 00 00       	call   585 <texit>

00000275 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 275:	55                   	push   %ebp
 276:	89 e5                	mov    %esp,%ebp
 278:	57                   	push   %edi
 279:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 27a:	8b 4d 08             	mov    0x8(%ebp),%ecx
 27d:	8b 55 10             	mov    0x10(%ebp),%edx
 280:	8b 45 0c             	mov    0xc(%ebp),%eax
 283:	89 cb                	mov    %ecx,%ebx
 285:	89 df                	mov    %ebx,%edi
 287:	89 d1                	mov    %edx,%ecx
 289:	fc                   	cld    
 28a:	f3 aa                	rep stos %al,%es:(%edi)
 28c:	89 ca                	mov    %ecx,%edx
 28e:	89 fb                	mov    %edi,%ebx
 290:	89 5d 08             	mov    %ebx,0x8(%ebp)
 293:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 296:	5b                   	pop    %ebx
 297:	5f                   	pop    %edi
 298:	5d                   	pop    %ebp
 299:	c3                   	ret    

0000029a <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 29a:	55                   	push   %ebp
 29b:	89 e5                	mov    %esp,%ebp
 29d:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
 2a3:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 2a6:	90                   	nop
 2a7:	8b 45 08             	mov    0x8(%ebp),%eax
 2aa:	8d 50 01             	lea    0x1(%eax),%edx
 2ad:	89 55 08             	mov    %edx,0x8(%ebp)
 2b0:	8b 55 0c             	mov    0xc(%ebp),%edx
 2b3:	8d 4a 01             	lea    0x1(%edx),%ecx
 2b6:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 2b9:	0f b6 12             	movzbl (%edx),%edx
 2bc:	88 10                	mov    %dl,(%eax)
 2be:	0f b6 00             	movzbl (%eax),%eax
 2c1:	84 c0                	test   %al,%al
 2c3:	75 e2                	jne    2a7 <strcpy+0xd>
    ;
  return os;
 2c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2c8:	c9                   	leave  
 2c9:	c3                   	ret    

000002ca <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2ca:	55                   	push   %ebp
 2cb:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 2cd:	eb 08                	jmp    2d7 <strcmp+0xd>
    p++, q++;
 2cf:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2d3:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2d7:	8b 45 08             	mov    0x8(%ebp),%eax
 2da:	0f b6 00             	movzbl (%eax),%eax
 2dd:	84 c0                	test   %al,%al
 2df:	74 10                	je     2f1 <strcmp+0x27>
 2e1:	8b 45 08             	mov    0x8(%ebp),%eax
 2e4:	0f b6 10             	movzbl (%eax),%edx
 2e7:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ea:	0f b6 00             	movzbl (%eax),%eax
 2ed:	38 c2                	cmp    %al,%dl
 2ef:	74 de                	je     2cf <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 2f1:	8b 45 08             	mov    0x8(%ebp),%eax
 2f4:	0f b6 00             	movzbl (%eax),%eax
 2f7:	0f b6 d0             	movzbl %al,%edx
 2fa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2fd:	0f b6 00             	movzbl (%eax),%eax
 300:	0f b6 c0             	movzbl %al,%eax
 303:	29 c2                	sub    %eax,%edx
 305:	89 d0                	mov    %edx,%eax
}
 307:	5d                   	pop    %ebp
 308:	c3                   	ret    

00000309 <strlen>:

uint
strlen(char *s)
{
 309:	55                   	push   %ebp
 30a:	89 e5                	mov    %esp,%ebp
 30c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 30f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 316:	eb 04                	jmp    31c <strlen+0x13>
 318:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 31c:	8b 55 fc             	mov    -0x4(%ebp),%edx
 31f:	8b 45 08             	mov    0x8(%ebp),%eax
 322:	01 d0                	add    %edx,%eax
 324:	0f b6 00             	movzbl (%eax),%eax
 327:	84 c0                	test   %al,%al
 329:	75 ed                	jne    318 <strlen+0xf>
    ;
  return n;
 32b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 32e:	c9                   	leave  
 32f:	c3                   	ret    

00000330 <memset>:

void*
memset(void *dst, int c, uint n)
{
 330:	55                   	push   %ebp
 331:	89 e5                	mov    %esp,%ebp
 333:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 336:	8b 45 10             	mov    0x10(%ebp),%eax
 339:	89 44 24 08          	mov    %eax,0x8(%esp)
 33d:	8b 45 0c             	mov    0xc(%ebp),%eax
 340:	89 44 24 04          	mov    %eax,0x4(%esp)
 344:	8b 45 08             	mov    0x8(%ebp),%eax
 347:	89 04 24             	mov    %eax,(%esp)
 34a:	e8 26 ff ff ff       	call   275 <stosb>
  return dst;
 34f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 352:	c9                   	leave  
 353:	c3                   	ret    

00000354 <strchr>:

char*
strchr(const char *s, char c)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	83 ec 04             	sub    $0x4,%esp
 35a:	8b 45 0c             	mov    0xc(%ebp),%eax
 35d:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 360:	eb 14                	jmp    376 <strchr+0x22>
    if(*s == c)
 362:	8b 45 08             	mov    0x8(%ebp),%eax
 365:	0f b6 00             	movzbl (%eax),%eax
 368:	3a 45 fc             	cmp    -0x4(%ebp),%al
 36b:	75 05                	jne    372 <strchr+0x1e>
      return (char*)s;
 36d:	8b 45 08             	mov    0x8(%ebp),%eax
 370:	eb 13                	jmp    385 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 372:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 376:	8b 45 08             	mov    0x8(%ebp),%eax
 379:	0f b6 00             	movzbl (%eax),%eax
 37c:	84 c0                	test   %al,%al
 37e:	75 e2                	jne    362 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 380:	b8 00 00 00 00       	mov    $0x0,%eax
}
 385:	c9                   	leave  
 386:	c3                   	ret    

00000387 <gets>:

char*
gets(char *buf, int max)
{
 387:	55                   	push   %ebp
 388:	89 e5                	mov    %esp,%ebp
 38a:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 38d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 394:	eb 4c                	jmp    3e2 <gets+0x5b>
    cc = read(0, &c, 1);
 396:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 39d:	00 
 39e:	8d 45 ef             	lea    -0x11(%ebp),%eax
 3a1:	89 44 24 04          	mov    %eax,0x4(%esp)
 3a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3ac:	e8 44 01 00 00       	call   4f5 <read>
 3b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 3b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3b8:	7f 02                	jg     3bc <gets+0x35>
      break;
 3ba:	eb 31                	jmp    3ed <gets+0x66>
    buf[i++] = c;
 3bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3bf:	8d 50 01             	lea    0x1(%eax),%edx
 3c2:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3c5:	89 c2                	mov    %eax,%edx
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	01 c2                	add    %eax,%edx
 3cc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3d0:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 3d2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3d6:	3c 0a                	cmp    $0xa,%al
 3d8:	74 13                	je     3ed <gets+0x66>
 3da:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3de:	3c 0d                	cmp    $0xd,%al
 3e0:	74 0b                	je     3ed <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3e5:	83 c0 01             	add    $0x1,%eax
 3e8:	3b 45 0c             	cmp    0xc(%ebp),%eax
 3eb:	7c a9                	jl     396 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 3ed:	8b 55 f4             	mov    -0xc(%ebp),%edx
 3f0:	8b 45 08             	mov    0x8(%ebp),%eax
 3f3:	01 d0                	add    %edx,%eax
 3f5:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 3f8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3fb:	c9                   	leave  
 3fc:	c3                   	ret    

000003fd <stat>:

int
stat(char *n, struct stat *st)
{
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 403:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 40a:	00 
 40b:	8b 45 08             	mov    0x8(%ebp),%eax
 40e:	89 04 24             	mov    %eax,(%esp)
 411:	e8 07 01 00 00       	call   51d <open>
 416:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 419:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 41d:	79 07                	jns    426 <stat+0x29>
    return -1;
 41f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 424:	eb 23                	jmp    449 <stat+0x4c>
  r = fstat(fd, st);
 426:	8b 45 0c             	mov    0xc(%ebp),%eax
 429:	89 44 24 04          	mov    %eax,0x4(%esp)
 42d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 430:	89 04 24             	mov    %eax,(%esp)
 433:	e8 fd 00 00 00       	call   535 <fstat>
 438:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 43b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 43e:	89 04 24             	mov    %eax,(%esp)
 441:	e8 bf 00 00 00       	call   505 <close>
  return r;
 446:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 449:	c9                   	leave  
 44a:	c3                   	ret    

0000044b <atoi>:

int
atoi(const char *s)
{
 44b:	55                   	push   %ebp
 44c:	89 e5                	mov    %esp,%ebp
 44e:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 451:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 458:	eb 25                	jmp    47f <atoi+0x34>
    n = n*10 + *s++ - '0';
 45a:	8b 55 fc             	mov    -0x4(%ebp),%edx
 45d:	89 d0                	mov    %edx,%eax
 45f:	c1 e0 02             	shl    $0x2,%eax
 462:	01 d0                	add    %edx,%eax
 464:	01 c0                	add    %eax,%eax
 466:	89 c1                	mov    %eax,%ecx
 468:	8b 45 08             	mov    0x8(%ebp),%eax
 46b:	8d 50 01             	lea    0x1(%eax),%edx
 46e:	89 55 08             	mov    %edx,0x8(%ebp)
 471:	0f b6 00             	movzbl (%eax),%eax
 474:	0f be c0             	movsbl %al,%eax
 477:	01 c8                	add    %ecx,%eax
 479:	83 e8 30             	sub    $0x30,%eax
 47c:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 47f:	8b 45 08             	mov    0x8(%ebp),%eax
 482:	0f b6 00             	movzbl (%eax),%eax
 485:	3c 2f                	cmp    $0x2f,%al
 487:	7e 0a                	jle    493 <atoi+0x48>
 489:	8b 45 08             	mov    0x8(%ebp),%eax
 48c:	0f b6 00             	movzbl (%eax),%eax
 48f:	3c 39                	cmp    $0x39,%al
 491:	7e c7                	jle    45a <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 493:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 496:	c9                   	leave  
 497:	c3                   	ret    

00000498 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 498:	55                   	push   %ebp
 499:	89 e5                	mov    %esp,%ebp
 49b:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 49e:	8b 45 08             	mov    0x8(%ebp),%eax
 4a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4a4:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4aa:	eb 17                	jmp    4c3 <memmove+0x2b>
    *dst++ = *src++;
 4ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4af:	8d 50 01             	lea    0x1(%eax),%edx
 4b2:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4b5:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4b8:	8d 4a 01             	lea    0x1(%edx),%ecx
 4bb:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4be:	0f b6 12             	movzbl (%edx),%edx
 4c1:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4c3:	8b 45 10             	mov    0x10(%ebp),%eax
 4c6:	8d 50 ff             	lea    -0x1(%eax),%edx
 4c9:	89 55 10             	mov    %edx,0x10(%ebp)
 4cc:	85 c0                	test   %eax,%eax
 4ce:	7f dc                	jg     4ac <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 4d0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4d3:	c9                   	leave  
 4d4:	c3                   	ret    

000004d5 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4d5:	b8 01 00 00 00       	mov    $0x1,%eax
 4da:	cd 40                	int    $0x40
 4dc:	c3                   	ret    

000004dd <exit>:
SYSCALL(exit)
 4dd:	b8 02 00 00 00       	mov    $0x2,%eax
 4e2:	cd 40                	int    $0x40
 4e4:	c3                   	ret    

000004e5 <wait>:
SYSCALL(wait)
 4e5:	b8 03 00 00 00       	mov    $0x3,%eax
 4ea:	cd 40                	int    $0x40
 4ec:	c3                   	ret    

000004ed <pipe>:
SYSCALL(pipe)
 4ed:	b8 04 00 00 00       	mov    $0x4,%eax
 4f2:	cd 40                	int    $0x40
 4f4:	c3                   	ret    

000004f5 <read>:
SYSCALL(read)
 4f5:	b8 05 00 00 00       	mov    $0x5,%eax
 4fa:	cd 40                	int    $0x40
 4fc:	c3                   	ret    

000004fd <write>:
SYSCALL(write)
 4fd:	b8 10 00 00 00       	mov    $0x10,%eax
 502:	cd 40                	int    $0x40
 504:	c3                   	ret    

00000505 <close>:
SYSCALL(close)
 505:	b8 15 00 00 00       	mov    $0x15,%eax
 50a:	cd 40                	int    $0x40
 50c:	c3                   	ret    

0000050d <kill>:
SYSCALL(kill)
 50d:	b8 06 00 00 00       	mov    $0x6,%eax
 512:	cd 40                	int    $0x40
 514:	c3                   	ret    

00000515 <exec>:
SYSCALL(exec)
 515:	b8 07 00 00 00       	mov    $0x7,%eax
 51a:	cd 40                	int    $0x40
 51c:	c3                   	ret    

0000051d <open>:
SYSCALL(open)
 51d:	b8 0f 00 00 00       	mov    $0xf,%eax
 522:	cd 40                	int    $0x40
 524:	c3                   	ret    

00000525 <mknod>:
SYSCALL(mknod)
 525:	b8 11 00 00 00       	mov    $0x11,%eax
 52a:	cd 40                	int    $0x40
 52c:	c3                   	ret    

0000052d <unlink>:
SYSCALL(unlink)
 52d:	b8 12 00 00 00       	mov    $0x12,%eax
 532:	cd 40                	int    $0x40
 534:	c3                   	ret    

00000535 <fstat>:
SYSCALL(fstat)
 535:	b8 08 00 00 00       	mov    $0x8,%eax
 53a:	cd 40                	int    $0x40
 53c:	c3                   	ret    

0000053d <link>:
SYSCALL(link)
 53d:	b8 13 00 00 00       	mov    $0x13,%eax
 542:	cd 40                	int    $0x40
 544:	c3                   	ret    

00000545 <mkdir>:
SYSCALL(mkdir)
 545:	b8 14 00 00 00       	mov    $0x14,%eax
 54a:	cd 40                	int    $0x40
 54c:	c3                   	ret    

0000054d <chdir>:
SYSCALL(chdir)
 54d:	b8 09 00 00 00       	mov    $0x9,%eax
 552:	cd 40                	int    $0x40
 554:	c3                   	ret    

00000555 <dup>:
SYSCALL(dup)
 555:	b8 0a 00 00 00       	mov    $0xa,%eax
 55a:	cd 40                	int    $0x40
 55c:	c3                   	ret    

0000055d <getpid>:
SYSCALL(getpid)
 55d:	b8 0b 00 00 00       	mov    $0xb,%eax
 562:	cd 40                	int    $0x40
 564:	c3                   	ret    

00000565 <sbrk>:
SYSCALL(sbrk)
 565:	b8 0c 00 00 00       	mov    $0xc,%eax
 56a:	cd 40                	int    $0x40
 56c:	c3                   	ret    

0000056d <sleep>:
SYSCALL(sleep)
 56d:	b8 0d 00 00 00       	mov    $0xd,%eax
 572:	cd 40                	int    $0x40
 574:	c3                   	ret    

00000575 <uptime>:
SYSCALL(uptime)
 575:	b8 0e 00 00 00       	mov    $0xe,%eax
 57a:	cd 40                	int    $0x40
 57c:	c3                   	ret    

0000057d <clone>:
SYSCALL(clone)
 57d:	b8 16 00 00 00       	mov    $0x16,%eax
 582:	cd 40                	int    $0x40
 584:	c3                   	ret    

00000585 <texit>:
SYSCALL(texit)
 585:	b8 17 00 00 00       	mov    $0x17,%eax
 58a:	cd 40                	int    $0x40
 58c:	c3                   	ret    

0000058d <tsleep>:
SYSCALL(tsleep)
 58d:	b8 18 00 00 00       	mov    $0x18,%eax
 592:	cd 40                	int    $0x40
 594:	c3                   	ret    

00000595 <twakeup>:
SYSCALL(twakeup)
 595:	b8 19 00 00 00       	mov    $0x19,%eax
 59a:	cd 40                	int    $0x40
 59c:	c3                   	ret    

0000059d <test>:
SYSCALL(test)
 59d:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5a2:	cd 40                	int    $0x40
 5a4:	c3                   	ret    

000005a5 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5a5:	55                   	push   %ebp
 5a6:	89 e5                	mov    %esp,%ebp
 5a8:	83 ec 18             	sub    $0x18,%esp
 5ab:	8b 45 0c             	mov    0xc(%ebp),%eax
 5ae:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5b8:	00 
 5b9:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	89 04 24             	mov    %eax,(%esp)
 5c6:	e8 32 ff ff ff       	call   4fd <write>
}
 5cb:	c9                   	leave  
 5cc:	c3                   	ret    

000005cd <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5cd:	55                   	push   %ebp
 5ce:	89 e5                	mov    %esp,%ebp
 5d0:	56                   	push   %esi
 5d1:	53                   	push   %ebx
 5d2:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5d5:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5dc:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5e0:	74 17                	je     5f9 <printint+0x2c>
 5e2:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5e6:	79 11                	jns    5f9 <printint+0x2c>
    neg = 1;
 5e8:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 5ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 5f2:	f7 d8                	neg    %eax
 5f4:	89 45 ec             	mov    %eax,-0x14(%ebp)
 5f7:	eb 06                	jmp    5ff <printint+0x32>
  } else {
    x = xx;
 5f9:	8b 45 0c             	mov    0xc(%ebp),%eax
 5fc:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 5ff:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 606:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 609:	8d 41 01             	lea    0x1(%ecx),%eax
 60c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 60f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 612:	8b 45 ec             	mov    -0x14(%ebp),%eax
 615:	ba 00 00 00 00       	mov    $0x0,%edx
 61a:	f7 f3                	div    %ebx
 61c:	89 d0                	mov    %edx,%eax
 61e:	0f b6 80 0c 13 00 00 	movzbl 0x130c(%eax),%eax
 625:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 629:	8b 75 10             	mov    0x10(%ebp),%esi
 62c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 62f:	ba 00 00 00 00       	mov    $0x0,%edx
 634:	f7 f6                	div    %esi
 636:	89 45 ec             	mov    %eax,-0x14(%ebp)
 639:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 63d:	75 c7                	jne    606 <printint+0x39>
  if(neg)
 63f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 643:	74 10                	je     655 <printint+0x88>
    buf[i++] = '-';
 645:	8b 45 f4             	mov    -0xc(%ebp),%eax
 648:	8d 50 01             	lea    0x1(%eax),%edx
 64b:	89 55 f4             	mov    %edx,-0xc(%ebp)
 64e:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 653:	eb 1f                	jmp    674 <printint+0xa7>
 655:	eb 1d                	jmp    674 <printint+0xa7>
    putc(fd, buf[i]);
 657:	8d 55 dc             	lea    -0x24(%ebp),%edx
 65a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 65d:	01 d0                	add    %edx,%eax
 65f:	0f b6 00             	movzbl (%eax),%eax
 662:	0f be c0             	movsbl %al,%eax
 665:	89 44 24 04          	mov    %eax,0x4(%esp)
 669:	8b 45 08             	mov    0x8(%ebp),%eax
 66c:	89 04 24             	mov    %eax,(%esp)
 66f:	e8 31 ff ff ff       	call   5a5 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 674:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 678:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 67c:	79 d9                	jns    657 <printint+0x8a>
    putc(fd, buf[i]);
}
 67e:	83 c4 30             	add    $0x30,%esp
 681:	5b                   	pop    %ebx
 682:	5e                   	pop    %esi
 683:	5d                   	pop    %ebp
 684:	c3                   	ret    

00000685 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 685:	55                   	push   %ebp
 686:	89 e5                	mov    %esp,%ebp
 688:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 68b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 692:	8d 45 0c             	lea    0xc(%ebp),%eax
 695:	83 c0 04             	add    $0x4,%eax
 698:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 69b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6a2:	e9 7c 01 00 00       	jmp    823 <printf+0x19e>
    c = fmt[i] & 0xff;
 6a7:	8b 55 0c             	mov    0xc(%ebp),%edx
 6aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6ad:	01 d0                	add    %edx,%eax
 6af:	0f b6 00             	movzbl (%eax),%eax
 6b2:	0f be c0             	movsbl %al,%eax
 6b5:	25 ff 00 00 00       	and    $0xff,%eax
 6ba:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6bd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6c1:	75 2c                	jne    6ef <printf+0x6a>
      if(c == '%'){
 6c3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6c7:	75 0c                	jne    6d5 <printf+0x50>
        state = '%';
 6c9:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6d0:	e9 4a 01 00 00       	jmp    81f <printf+0x19a>
      } else {
        putc(fd, c);
 6d5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6d8:	0f be c0             	movsbl %al,%eax
 6db:	89 44 24 04          	mov    %eax,0x4(%esp)
 6df:	8b 45 08             	mov    0x8(%ebp),%eax
 6e2:	89 04 24             	mov    %eax,(%esp)
 6e5:	e8 bb fe ff ff       	call   5a5 <putc>
 6ea:	e9 30 01 00 00       	jmp    81f <printf+0x19a>
      }
    } else if(state == '%'){
 6ef:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 6f3:	0f 85 26 01 00 00    	jne    81f <printf+0x19a>
      if(c == 'd'){
 6f9:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 6fd:	75 2d                	jne    72c <printf+0xa7>
        printint(fd, *ap, 10, 1);
 6ff:	8b 45 e8             	mov    -0x18(%ebp),%eax
 702:	8b 00                	mov    (%eax),%eax
 704:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 70b:	00 
 70c:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 713:	00 
 714:	89 44 24 04          	mov    %eax,0x4(%esp)
 718:	8b 45 08             	mov    0x8(%ebp),%eax
 71b:	89 04 24             	mov    %eax,(%esp)
 71e:	e8 aa fe ff ff       	call   5cd <printint>
        ap++;
 723:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 727:	e9 ec 00 00 00       	jmp    818 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 72c:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 730:	74 06                	je     738 <printf+0xb3>
 732:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 736:	75 2d                	jne    765 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 738:	8b 45 e8             	mov    -0x18(%ebp),%eax
 73b:	8b 00                	mov    (%eax),%eax
 73d:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 744:	00 
 745:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 74c:	00 
 74d:	89 44 24 04          	mov    %eax,0x4(%esp)
 751:	8b 45 08             	mov    0x8(%ebp),%eax
 754:	89 04 24             	mov    %eax,(%esp)
 757:	e8 71 fe ff ff       	call   5cd <printint>
        ap++;
 75c:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 760:	e9 b3 00 00 00       	jmp    818 <printf+0x193>
      } else if(c == 's'){
 765:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 769:	75 45                	jne    7b0 <printf+0x12b>
        s = (char*)*ap;
 76b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 76e:	8b 00                	mov    (%eax),%eax
 770:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 773:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 777:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 77b:	75 09                	jne    786 <printf+0x101>
          s = "(null)";
 77d:	c7 45 f4 92 0e 00 00 	movl   $0xe92,-0xc(%ebp)
        while(*s != 0){
 784:	eb 1e                	jmp    7a4 <printf+0x11f>
 786:	eb 1c                	jmp    7a4 <printf+0x11f>
          putc(fd, *s);
 788:	8b 45 f4             	mov    -0xc(%ebp),%eax
 78b:	0f b6 00             	movzbl (%eax),%eax
 78e:	0f be c0             	movsbl %al,%eax
 791:	89 44 24 04          	mov    %eax,0x4(%esp)
 795:	8b 45 08             	mov    0x8(%ebp),%eax
 798:	89 04 24             	mov    %eax,(%esp)
 79b:	e8 05 fe ff ff       	call   5a5 <putc>
          s++;
 7a0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a7:	0f b6 00             	movzbl (%eax),%eax
 7aa:	84 c0                	test   %al,%al
 7ac:	75 da                	jne    788 <printf+0x103>
 7ae:	eb 68                	jmp    818 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7b0:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7b4:	75 1d                	jne    7d3 <printf+0x14e>
        putc(fd, *ap);
 7b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b9:	8b 00                	mov    (%eax),%eax
 7bb:	0f be c0             	movsbl %al,%eax
 7be:	89 44 24 04          	mov    %eax,0x4(%esp)
 7c2:	8b 45 08             	mov    0x8(%ebp),%eax
 7c5:	89 04 24             	mov    %eax,(%esp)
 7c8:	e8 d8 fd ff ff       	call   5a5 <putc>
        ap++;
 7cd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7d1:	eb 45                	jmp    818 <printf+0x193>
      } else if(c == '%'){
 7d3:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7d7:	75 17                	jne    7f0 <printf+0x16b>
        putc(fd, c);
 7d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7dc:	0f be c0             	movsbl %al,%eax
 7df:	89 44 24 04          	mov    %eax,0x4(%esp)
 7e3:	8b 45 08             	mov    0x8(%ebp),%eax
 7e6:	89 04 24             	mov    %eax,(%esp)
 7e9:	e8 b7 fd ff ff       	call   5a5 <putc>
 7ee:	eb 28                	jmp    818 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 7f0:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 7f7:	00 
 7f8:	8b 45 08             	mov    0x8(%ebp),%eax
 7fb:	89 04 24             	mov    %eax,(%esp)
 7fe:	e8 a2 fd ff ff       	call   5a5 <putc>
        putc(fd, c);
 803:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 806:	0f be c0             	movsbl %al,%eax
 809:	89 44 24 04          	mov    %eax,0x4(%esp)
 80d:	8b 45 08             	mov    0x8(%ebp),%eax
 810:	89 04 24             	mov    %eax,(%esp)
 813:	e8 8d fd ff ff       	call   5a5 <putc>
      }
      state = 0;
 818:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 81f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 823:	8b 55 0c             	mov    0xc(%ebp),%edx
 826:	8b 45 f0             	mov    -0x10(%ebp),%eax
 829:	01 d0                	add    %edx,%eax
 82b:	0f b6 00             	movzbl (%eax),%eax
 82e:	84 c0                	test   %al,%al
 830:	0f 85 71 fe ff ff    	jne    6a7 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 836:	c9                   	leave  
 837:	c3                   	ret    

00000838 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 838:	55                   	push   %ebp
 839:	89 e5                	mov    %esp,%ebp
 83b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 83e:	8b 45 08             	mov    0x8(%ebp),%eax
 841:	83 e8 08             	sub    $0x8,%eax
 844:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 847:	a1 48 13 00 00       	mov    0x1348,%eax
 84c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 84f:	eb 24                	jmp    875 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 851:	8b 45 fc             	mov    -0x4(%ebp),%eax
 854:	8b 00                	mov    (%eax),%eax
 856:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 859:	77 12                	ja     86d <free+0x35>
 85b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 85e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 861:	77 24                	ja     887 <free+0x4f>
 863:	8b 45 fc             	mov    -0x4(%ebp),%eax
 866:	8b 00                	mov    (%eax),%eax
 868:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 86b:	77 1a                	ja     887 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 86d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 870:	8b 00                	mov    (%eax),%eax
 872:	89 45 fc             	mov    %eax,-0x4(%ebp)
 875:	8b 45 f8             	mov    -0x8(%ebp),%eax
 878:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 87b:	76 d4                	jbe    851 <free+0x19>
 87d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 880:	8b 00                	mov    (%eax),%eax
 882:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 885:	76 ca                	jbe    851 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 887:	8b 45 f8             	mov    -0x8(%ebp),%eax
 88a:	8b 40 04             	mov    0x4(%eax),%eax
 88d:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 894:	8b 45 f8             	mov    -0x8(%ebp),%eax
 897:	01 c2                	add    %eax,%edx
 899:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89c:	8b 00                	mov    (%eax),%eax
 89e:	39 c2                	cmp    %eax,%edx
 8a0:	75 24                	jne    8c6 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a5:	8b 50 04             	mov    0x4(%eax),%edx
 8a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ab:	8b 00                	mov    (%eax),%eax
 8ad:	8b 40 04             	mov    0x4(%eax),%eax
 8b0:	01 c2                	add    %eax,%edx
 8b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8bb:	8b 00                	mov    (%eax),%eax
 8bd:	8b 10                	mov    (%eax),%edx
 8bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c2:	89 10                	mov    %edx,(%eax)
 8c4:	eb 0a                	jmp    8d0 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8c6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c9:	8b 10                	mov    (%eax),%edx
 8cb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8ce:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d3:	8b 40 04             	mov    0x4(%eax),%eax
 8d6:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e0:	01 d0                	add    %edx,%eax
 8e2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8e5:	75 20                	jne    907 <free+0xcf>
    p->s.size += bp->s.size;
 8e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ea:	8b 50 04             	mov    0x4(%eax),%edx
 8ed:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8f0:	8b 40 04             	mov    0x4(%eax),%eax
 8f3:	01 c2                	add    %eax,%edx
 8f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f8:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 8fb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fe:	8b 10                	mov    (%eax),%edx
 900:	8b 45 fc             	mov    -0x4(%ebp),%eax
 903:	89 10                	mov    %edx,(%eax)
 905:	eb 08                	jmp    90f <free+0xd7>
  } else
    p->s.ptr = bp;
 907:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90a:	8b 55 f8             	mov    -0x8(%ebp),%edx
 90d:	89 10                	mov    %edx,(%eax)
  freep = p;
 90f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 912:	a3 48 13 00 00       	mov    %eax,0x1348
}
 917:	c9                   	leave  
 918:	c3                   	ret    

00000919 <morecore>:

static Header*
morecore(uint nu)
{
 919:	55                   	push   %ebp
 91a:	89 e5                	mov    %esp,%ebp
 91c:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 91f:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 926:	77 07                	ja     92f <morecore+0x16>
    nu = 4096;
 928:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 92f:	8b 45 08             	mov    0x8(%ebp),%eax
 932:	c1 e0 03             	shl    $0x3,%eax
 935:	89 04 24             	mov    %eax,(%esp)
 938:	e8 28 fc ff ff       	call   565 <sbrk>
 93d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 940:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 944:	75 07                	jne    94d <morecore+0x34>
    return 0;
 946:	b8 00 00 00 00       	mov    $0x0,%eax
 94b:	eb 22                	jmp    96f <morecore+0x56>
  hp = (Header*)p;
 94d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 950:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 953:	8b 45 f0             	mov    -0x10(%ebp),%eax
 956:	8b 55 08             	mov    0x8(%ebp),%edx
 959:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 95c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95f:	83 c0 08             	add    $0x8,%eax
 962:	89 04 24             	mov    %eax,(%esp)
 965:	e8 ce fe ff ff       	call   838 <free>
  return freep;
 96a:	a1 48 13 00 00       	mov    0x1348,%eax
}
 96f:	c9                   	leave  
 970:	c3                   	ret    

00000971 <malloc>:

void*
malloc(uint nbytes)
{
 971:	55                   	push   %ebp
 972:	89 e5                	mov    %esp,%ebp
 974:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 977:	8b 45 08             	mov    0x8(%ebp),%eax
 97a:	83 c0 07             	add    $0x7,%eax
 97d:	c1 e8 03             	shr    $0x3,%eax
 980:	83 c0 01             	add    $0x1,%eax
 983:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 986:	a1 48 13 00 00       	mov    0x1348,%eax
 98b:	89 45 f0             	mov    %eax,-0x10(%ebp)
 98e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 992:	75 23                	jne    9b7 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 994:	c7 45 f0 40 13 00 00 	movl   $0x1340,-0x10(%ebp)
 99b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 99e:	a3 48 13 00 00       	mov    %eax,0x1348
 9a3:	a1 48 13 00 00       	mov    0x1348,%eax
 9a8:	a3 40 13 00 00       	mov    %eax,0x1340
    base.s.size = 0;
 9ad:	c7 05 44 13 00 00 00 	movl   $0x0,0x1344
 9b4:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9ba:	8b 00                	mov    (%eax),%eax
 9bc:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c2:	8b 40 04             	mov    0x4(%eax),%eax
 9c5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9c8:	72 4d                	jb     a17 <malloc+0xa6>
      if(p->s.size == nunits)
 9ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9cd:	8b 40 04             	mov    0x4(%eax),%eax
 9d0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9d3:	75 0c                	jne    9e1 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d8:	8b 10                	mov    (%eax),%edx
 9da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9dd:	89 10                	mov    %edx,(%eax)
 9df:	eb 26                	jmp    a07 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e4:	8b 40 04             	mov    0x4(%eax),%eax
 9e7:	2b 45 ec             	sub    -0x14(%ebp),%eax
 9ea:	89 c2                	mov    %eax,%edx
 9ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ef:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f5:	8b 40 04             	mov    0x4(%eax),%eax
 9f8:	c1 e0 03             	shl    $0x3,%eax
 9fb:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 9fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a01:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a04:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a07:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0a:	a3 48 13 00 00       	mov    %eax,0x1348
      return (void*)(p + 1);
 a0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a12:	83 c0 08             	add    $0x8,%eax
 a15:	eb 38                	jmp    a4f <malloc+0xde>
    }
    if(p == freep)
 a17:	a1 48 13 00 00       	mov    0x1348,%eax
 a1c:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a1f:	75 1b                	jne    a3c <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a21:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a24:	89 04 24             	mov    %eax,(%esp)
 a27:	e8 ed fe ff ff       	call   919 <morecore>
 a2c:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a2f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a33:	75 07                	jne    a3c <malloc+0xcb>
        return 0;
 a35:	b8 00 00 00 00       	mov    $0x0,%eax
 a3a:	eb 13                	jmp    a4f <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a3c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a3f:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a42:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a45:	8b 00                	mov    (%eax),%eax
 a47:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a4a:	e9 70 ff ff ff       	jmp    9bf <malloc+0x4e>
}
 a4f:	c9                   	leave  
 a50:	c3                   	ret    

00000a51 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 a51:	55                   	push   %ebp
 a52:	89 e5                	mov    %esp,%ebp
 a54:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 a57:	8b 55 08             	mov    0x8(%ebp),%edx
 a5a:	8b 45 0c             	mov    0xc(%ebp),%eax
 a5d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 a60:	f0 87 02             	lock xchg %eax,(%edx)
 a63:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 a66:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 a69:	c9                   	leave  
 a6a:	c3                   	ret    

00000a6b <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 a6b:	55                   	push   %ebp
 a6c:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 a6e:	8b 45 08             	mov    0x8(%ebp),%eax
 a71:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 a77:	5d                   	pop    %ebp
 a78:	c3                   	ret    

00000a79 <lock_acquire>:
void lock_acquire(lock_t *lock){
 a79:	55                   	push   %ebp
 a7a:	89 e5                	mov    %esp,%ebp
 a7c:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 a7f:	90                   	nop
 a80:	8b 45 08             	mov    0x8(%ebp),%eax
 a83:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 a8a:	00 
 a8b:	89 04 24             	mov    %eax,(%esp)
 a8e:	e8 be ff ff ff       	call   a51 <xchg>
 a93:	85 c0                	test   %eax,%eax
 a95:	75 e9                	jne    a80 <lock_acquire+0x7>
}
 a97:	c9                   	leave  
 a98:	c3                   	ret    

00000a99 <lock_release>:
void lock_release(lock_t *lock){
 a99:	55                   	push   %ebp
 a9a:	89 e5                	mov    %esp,%ebp
 a9c:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 a9f:	8b 45 08             	mov    0x8(%ebp),%eax
 aa2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 aa9:	00 
 aaa:	89 04 24             	mov    %eax,(%esp)
 aad:	e8 9f ff ff ff       	call   a51 <xchg>
}
 ab2:	c9                   	leave  
 ab3:	c3                   	ret    

00000ab4 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 ab4:	55                   	push   %ebp
 ab5:	89 e5                	mov    %esp,%ebp
 ab7:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 aba:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 ac1:	e8 ab fe ff ff       	call   971 <malloc>
 ac6:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 ac9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 acc:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 acf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad2:	25 ff 0f 00 00       	and    $0xfff,%eax
 ad7:	85 c0                	test   %eax,%eax
 ad9:	74 14                	je     aef <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 adb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ade:	25 ff 0f 00 00       	and    $0xfff,%eax
 ae3:	89 c2                	mov    %eax,%edx
 ae5:	b8 00 10 00 00       	mov    $0x1000,%eax
 aea:	29 d0                	sub    %edx,%eax
 aec:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 aef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 af3:	75 1b                	jne    b10 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 af5:	c7 44 24 04 99 0e 00 	movl   $0xe99,0x4(%esp)
 afc:	00 
 afd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b04:	e8 7c fb ff ff       	call   685 <printf>
        return 0;
 b09:	b8 00 00 00 00       	mov    $0x0,%eax
 b0e:	eb 6f                	jmp    b7f <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 b10:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 b13:	8b 55 08             	mov    0x8(%ebp),%edx
 b16:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b19:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 b1d:	89 54 24 08          	mov    %edx,0x8(%esp)
 b21:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 b28:	00 
 b29:	89 04 24             	mov    %eax,(%esp)
 b2c:	e8 4c fa ff ff       	call   57d <clone>
 b31:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 b34:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b38:	79 1b                	jns    b55 <thread_create+0xa1>
        printf(1,"clone fails\n");
 b3a:	c7 44 24 04 a7 0e 00 	movl   $0xea7,0x4(%esp)
 b41:	00 
 b42:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b49:	e8 37 fb ff ff       	call   685 <printf>
        return 0;
 b4e:	b8 00 00 00 00       	mov    $0x0,%eax
 b53:	eb 2a                	jmp    b7f <thread_create+0xcb>
    }
    if(tid > 0){
 b55:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b59:	7e 05                	jle    b60 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 b5b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b5e:	eb 1f                	jmp    b7f <thread_create+0xcb>
    }
    if(tid == 0){
 b60:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b64:	75 14                	jne    b7a <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 b66:	c7 44 24 04 b4 0e 00 	movl   $0xeb4,0x4(%esp)
 b6d:	00 
 b6e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b75:	e8 0b fb ff ff       	call   685 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 b7a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 b7f:	c9                   	leave  
 b80:	c3                   	ret    

00000b81 <random>:

unsigned long rands = 1;
// generate 0 -> max random number exclude max.
int random(int max){
 b81:	55                   	push   %ebp
 b82:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
 b84:	a1 20 13 00 00       	mov    0x1320,%eax
 b89:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
 b8f:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
 b94:	a3 20 13 00 00       	mov    %eax,0x1320
    return (int)(rands % max);
 b99:	a1 20 13 00 00       	mov    0x1320,%eax
 b9e:	8b 4d 08             	mov    0x8(%ebp),%ecx
 ba1:	ba 00 00 00 00       	mov    $0x0,%edx
 ba6:	f7 f1                	div    %ecx
 ba8:	89 d0                	mov    %edx,%eax
 baa:	5d                   	pop    %ebp
 bab:	c3                   	ret    

00000bac <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 bac:	55                   	push   %ebp
 bad:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 baf:	8b 45 08             	mov    0x8(%ebp),%eax
 bb2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 bb8:	8b 45 08             	mov    0x8(%ebp),%eax
 bbb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 bc2:	8b 45 08             	mov    0x8(%ebp),%eax
 bc5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 bcc:	5d                   	pop    %ebp
 bcd:	c3                   	ret    

00000bce <add_q>:

void add_q(struct queue *q, int v){
 bce:	55                   	push   %ebp
 bcf:	89 e5                	mov    %esp,%ebp
 bd1:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 bd4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 bdb:	e8 91 fd ff ff       	call   971 <malloc>
 be0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 be3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 be6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 bed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf0:	8b 55 0c             	mov    0xc(%ebp),%edx
 bf3:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 bf5:	8b 45 08             	mov    0x8(%ebp),%eax
 bf8:	8b 40 04             	mov    0x4(%eax),%eax
 bfb:	85 c0                	test   %eax,%eax
 bfd:	75 0b                	jne    c0a <add_q+0x3c>
        q->head = n;
 bff:	8b 45 08             	mov    0x8(%ebp),%eax
 c02:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c05:	89 50 04             	mov    %edx,0x4(%eax)
 c08:	eb 0c                	jmp    c16 <add_q+0x48>
    }else{
        q->tail->next = n;
 c0a:	8b 45 08             	mov    0x8(%ebp),%eax
 c0d:	8b 40 08             	mov    0x8(%eax),%eax
 c10:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c13:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 c16:	8b 45 08             	mov    0x8(%ebp),%eax
 c19:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c1c:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 c1f:	8b 45 08             	mov    0x8(%ebp),%eax
 c22:	8b 00                	mov    (%eax),%eax
 c24:	8d 50 01             	lea    0x1(%eax),%edx
 c27:	8b 45 08             	mov    0x8(%ebp),%eax
 c2a:	89 10                	mov    %edx,(%eax)
}
 c2c:	c9                   	leave  
 c2d:	c3                   	ret    

00000c2e <empty_q>:

int empty_q(struct queue *q){
 c2e:	55                   	push   %ebp
 c2f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 c31:	8b 45 08             	mov    0x8(%ebp),%eax
 c34:	8b 00                	mov    (%eax),%eax
 c36:	85 c0                	test   %eax,%eax
 c38:	75 07                	jne    c41 <empty_q+0x13>
        return 1;
 c3a:	b8 01 00 00 00       	mov    $0x1,%eax
 c3f:	eb 05                	jmp    c46 <empty_q+0x18>
    else
        return 0;
 c41:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 c46:	5d                   	pop    %ebp
 c47:	c3                   	ret    

00000c48 <pop_q>:
int pop_q(struct queue *q){
 c48:	55                   	push   %ebp
 c49:	89 e5                	mov    %esp,%ebp
 c4b:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 c4e:	8b 45 08             	mov    0x8(%ebp),%eax
 c51:	89 04 24             	mov    %eax,(%esp)
 c54:	e8 d5 ff ff ff       	call   c2e <empty_q>
 c59:	85 c0                	test   %eax,%eax
 c5b:	75 5d                	jne    cba <pop_q+0x72>
       val = q->head->value; 
 c5d:	8b 45 08             	mov    0x8(%ebp),%eax
 c60:	8b 40 04             	mov    0x4(%eax),%eax
 c63:	8b 00                	mov    (%eax),%eax
 c65:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 c68:	8b 45 08             	mov    0x8(%ebp),%eax
 c6b:	8b 40 04             	mov    0x4(%eax),%eax
 c6e:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 c71:	8b 45 08             	mov    0x8(%ebp),%eax
 c74:	8b 40 04             	mov    0x4(%eax),%eax
 c77:	8b 50 04             	mov    0x4(%eax),%edx
 c7a:	8b 45 08             	mov    0x8(%ebp),%eax
 c7d:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 c80:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c83:	89 04 24             	mov    %eax,(%esp)
 c86:	e8 ad fb ff ff       	call   838 <free>
       q->size--;
 c8b:	8b 45 08             	mov    0x8(%ebp),%eax
 c8e:	8b 00                	mov    (%eax),%eax
 c90:	8d 50 ff             	lea    -0x1(%eax),%edx
 c93:	8b 45 08             	mov    0x8(%ebp),%eax
 c96:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 c98:	8b 45 08             	mov    0x8(%ebp),%eax
 c9b:	8b 00                	mov    (%eax),%eax
 c9d:	85 c0                	test   %eax,%eax
 c9f:	75 14                	jne    cb5 <pop_q+0x6d>
            q->head = 0;
 ca1:	8b 45 08             	mov    0x8(%ebp),%eax
 ca4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 cab:	8b 45 08             	mov    0x8(%ebp),%eax
 cae:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 cb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cb8:	eb 05                	jmp    cbf <pop_q+0x77>
    }
    return -1;
 cba:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 cbf:	c9                   	leave  
 cc0:	c3                   	ret    

00000cc1 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 cc1:	55                   	push   %ebp
 cc2:	89 e5                	mov    %esp,%ebp
 cc4:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 cc7:	8b 45 08             	mov    0x8(%ebp),%eax
 cca:	8b 55 0c             	mov    0xc(%ebp),%edx
 ccd:	89 50 08             	mov    %edx,0x8(%eax)
	s->count = size;
 cd0:	8b 45 08             	mov    0x8(%ebp),%eax
 cd3:	8b 55 0c             	mov    0xc(%ebp),%edx
 cd6:	89 50 04             	mov    %edx,0x4(%eax)
	lock_init(&s->lock);
 cd9:	8b 45 08             	mov    0x8(%ebp),%eax
 cdc:	89 04 24             	mov    %eax,(%esp)
 cdf:	e8 87 fd ff ff       	call   a6b <lock_init>
}
 ce4:	c9                   	leave  
 ce5:	c3                   	ret    

00000ce6 <sem_init_full>:

void 
sem_init_full(struct semaphore *s, int size){
 ce6:	55                   	push   %ebp
 ce7:	89 e5                	mov    %esp,%ebp
 ce9:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 cec:	8b 45 08             	mov    0x8(%ebp),%eax
 cef:	8b 55 0c             	mov    0xc(%ebp),%edx
 cf2:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 cf5:	8b 45 08             	mov    0x8(%ebp),%eax
 cf8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock);
 cff:	8b 45 08             	mov    0x8(%ebp),%eax
 d02:	89 04 24             	mov    %eax,(%esp)
 d05:	e8 61 fd ff ff       	call   a6b <lock_init>
}
 d0a:	c9                   	leave  
 d0b:	c3                   	ret    

00000d0c <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 d0c:	55                   	push   %ebp
 d0d:	89 e5                	mov    %esp,%ebp
 d0f:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 d12:	8b 45 08             	mov    0x8(%ebp),%eax
 d15:	89 04 24             	mov    %eax,(%esp)
 d18:	e8 5c fd ff ff       	call   a79 <lock_acquire>
	if(s->count  == 0){
 d1d:	8b 45 08             	mov    0x8(%ebp),%eax
 d20:	8b 40 04             	mov    0x4(%eax),%eax
 d23:	85 c0                	test   %eax,%eax
 d25:	75 2f                	jne    d56 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 d27:	e8 31 f8 ff ff       	call   55d <getpid>
 d2c:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 d2f:	8b 45 08             	mov    0x8(%ebp),%eax
 d32:	8d 50 0c             	lea    0xc(%eax),%edx
 d35:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d38:	89 44 24 04          	mov    %eax,0x4(%esp)
 d3c:	89 14 24             	mov    %edx,(%esp)
 d3f:	e8 8a fe ff ff       	call   bce <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 d44:	8b 45 08             	mov    0x8(%ebp),%eax
 d47:	89 04 24             	mov    %eax,(%esp)
 d4a:	e8 4a fd ff ff       	call   a99 <lock_release>
		tsleep(); 
 d4f:	e8 39 f8 ff ff       	call   58d <tsleep>
 d54:	eb 1a                	jmp    d70 <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 d56:	8b 45 08             	mov    0x8(%ebp),%eax
 d59:	8b 40 04             	mov    0x4(%eax),%eax
 d5c:	8d 50 ff             	lea    -0x1(%eax),%edx
 d5f:	8b 45 08             	mov    0x8(%ebp),%eax
 d62:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 d65:	8b 45 08             	mov    0x8(%ebp),%eax
 d68:	89 04 24             	mov    %eax,(%esp)
 d6b:	e8 29 fd ff ff       	call   a99 <lock_release>
	}
}
 d70:	c9                   	leave  
 d71:	c3                   	ret    

00000d72 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 d72:	55                   	push   %ebp
 d73:	89 e5                	mov    %esp,%ebp
 d75:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 d78:	8b 45 08             	mov    0x8(%ebp),%eax
 d7b:	89 04 24             	mov    %eax,(%esp)
 d7e:	e8 f6 fc ff ff       	call   a79 <lock_acquire>
	if(s->count < s->size){
 d83:	8b 45 08             	mov    0x8(%ebp),%eax
 d86:	8b 50 04             	mov    0x4(%eax),%edx
 d89:	8b 45 08             	mov    0x8(%ebp),%eax
 d8c:	8b 40 08             	mov    0x8(%eax),%eax
 d8f:	39 c2                	cmp    %eax,%edx
 d91:	7d 0f                	jge    da2 <sem_signal+0x30>
		s->count++;	
 d93:	8b 45 08             	mov    0x8(%ebp),%eax
 d96:	8b 40 04             	mov    0x4(%eax),%eax
 d99:	8d 50 01             	lea    0x1(%eax),%edx
 d9c:	8b 45 08             	mov    0x8(%ebp),%eax
 d9f:	89 50 04             	mov    %edx,0x4(%eax)
	}

	int tid;
	tid = pop_q(&s->waiters);
 da2:	8b 45 08             	mov    0x8(%ebp),%eax
 da5:	83 c0 0c             	add    $0xc,%eax
 da8:	89 04 24             	mov    %eax,(%esp)
 dab:	e8 98 fe ff ff       	call   c48 <pop_q>
 db0:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 db3:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 db7:	74 2e                	je     de7 <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 db9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dbc:	89 04 24             	mov    %eax,(%esp)
 dbf:	e8 d1 f7 ff ff       	call   595 <twakeup>
		s->count--;
 dc4:	8b 45 08             	mov    0x8(%ebp),%eax
 dc7:	8b 40 04             	mov    0x4(%eax),%eax
 dca:	8d 50 ff             	lea    -0x1(%eax),%edx
 dcd:	8b 45 08             	mov    0x8(%ebp),%eax
 dd0:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 dd3:	8b 45 08             	mov    0x8(%ebp),%eax
 dd6:	8b 40 04             	mov    0x4(%eax),%eax
 dd9:	85 c0                	test   %eax,%eax
 ddb:	79 0a                	jns    de7 <sem_signal+0x75>
 ddd:	8b 45 08             	mov    0x8(%ebp),%eax
 de0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 de7:	8b 45 08             	mov    0x8(%ebp),%eax
 dea:	89 04 24             	mov    %eax,(%esp)
 ded:	e8 a7 fc ff ff       	call   a99 <lock_release>

 df2:	c9                   	leave  
 df3:	c3                   	ret    
