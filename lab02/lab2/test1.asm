
_test1:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

int n = 1;

void test_func(void *arg_ptr);

int main(int argc, char *argv[]){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp


   int pid = fork();
   9:	e8 de 04 00 00       	call   4ec <fork>
   e:	89 44 24 14          	mov    %eax,0x14(%esp)
    if(pid == 0){
  12:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
  17:	0f 85 43 01 00 00    	jne    160 <main+0x160>
        void *tid = thread_create(test_func,(void *)0);
  1d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  24:	00 
  25:	c7 04 24 76 02 00 00 	movl   $0x276,(%esp)
  2c:	e8 8d 0a 00 00       	call   abe <thread_create>
  31:	89 44 24 18          	mov    %eax,0x18(%esp)
         if(tid == 0){
  35:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  3a:	75 19                	jne    55 <main+0x55>
            printf(1,"thread_create fails\n");
  3c:	c7 44 24 04 ee 0d 00 	movl   $0xdee,0x4(%esp)
  43:	00 
  44:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4b:	e8 45 06 00 00       	call   695 <printf>
            exit();
  50:	e8 9f 04 00 00       	call   4f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
  55:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  5c:	00 
  5d:	c7 04 24 76 02 00 00 	movl   $0x276,(%esp)
  64:	e8 55 0a 00 00       	call   abe <thread_create>
  69:	89 44 24 18          	mov    %eax,0x18(%esp)
        if(tid == 0){
  6d:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  72:	75 19                	jne    8d <main+0x8d>
            printf(1,"thread_create fails\n");
  74:	c7 44 24 04 ee 0d 00 	movl   $0xdee,0x4(%esp)
  7b:	00 
  7c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  83:	e8 0d 06 00 00       	call   695 <printf>
            exit();
  88:	e8 67 04 00 00       	call   4f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
  8d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  94:	00 
  95:	c7 04 24 76 02 00 00 	movl   $0x276,(%esp)
  9c:	e8 1d 0a 00 00       	call   abe <thread_create>
  a1:	89 44 24 18          	mov    %eax,0x18(%esp)
         if(tid == 0){
  a5:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  aa:	75 19                	jne    c5 <main+0xc5>
            printf(1,"thread_create fails\n");
  ac:	c7 44 24 04 ee 0d 00 	movl   $0xdee,0x4(%esp)
  b3:	00 
  b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bb:	e8 d5 05 00 00       	call   695 <printf>
            exit();
  c0:	e8 2f 04 00 00       	call   4f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
  c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  cc:	00 
  cd:	c7 04 24 76 02 00 00 	movl   $0x276,(%esp)
  d4:	e8 e5 09 00 00       	call   abe <thread_create>
  d9:	89 44 24 18          	mov    %eax,0x18(%esp)
          if(tid == 0){
  dd:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  e2:	75 19                	jne    fd <main+0xfd>
            printf(1,"thread_create fails\n");
  e4:	c7 44 24 04 ee 0d 00 	movl   $0xdee,0x4(%esp)
  eb:	00 
  ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f3:	e8 9d 05 00 00       	call   695 <printf>
            exit();
  f8:	e8 f7 03 00 00       	call   4f4 <exit>
        }
       tid = thread_create(test_func,(void *)0);
  fd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 104:	00 
 105:	c7 04 24 76 02 00 00 	movl   $0x276,(%esp)
 10c:	e8 ad 09 00 00       	call   abe <thread_create>
 111:	89 44 24 18          	mov    %eax,0x18(%esp)
           if(tid == 0){
 115:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 11a:	75 19                	jne    135 <main+0x135>
            printf(1,"thread_create fails\n");
 11c:	c7 44 24 04 ee 0d 00 	movl   $0xdee,0x4(%esp)
 123:	00 
 124:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 12b:	e8 65 05 00 00       	call   695 <printf>
            exit();
 130:	e8 bf 03 00 00       	call   4f4 <exit>
        }
      while(wait()>=0);
 135:	e8 c2 03 00 00       	call   4fc <wait>
 13a:	85 c0                	test   %eax,%eax
 13c:	79 f7                	jns    135 <main+0x135>
        printf(1,"I am child, [6] n = %d\n",n);
 13e:	a1 7c 0e 00 00       	mov    0xe7c,%eax
 143:	89 44 24 08          	mov    %eax,0x8(%esp)
 147:	c7 44 24 04 03 0e 00 	movl   $0xe03,0x4(%esp)
 14e:	00 
 14f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 156:	e8 3a 05 00 00       	call   695 <printf>
 15b:	e9 11 01 00 00       	jmp    271 <main+0x271>
    }else if(pid > 0){
 160:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 165:	0f 8e 06 01 00 00    	jle    271 <main+0x271>
        void *tid = thread_create(test_func,(void *)0);
 16b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 172:	00 
 173:	c7 04 24 76 02 00 00 	movl   $0x276,(%esp)
 17a:	e8 3f 09 00 00       	call   abe <thread_create>
 17f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
         if(tid == 0){
 183:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 188:	75 19                	jne    1a3 <main+0x1a3>
            printf(1,"thread_create fails\n");
 18a:	c7 44 24 04 ee 0d 00 	movl   $0xdee,0x4(%esp)
 191:	00 
 192:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 199:	e8 f7 04 00 00       	call   695 <printf>
            exit();
 19e:	e8 51 03 00 00       	call   4f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
 1a3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1aa:	00 
 1ab:	c7 04 24 76 02 00 00 	movl   $0x276,(%esp)
 1b2:	e8 07 09 00 00       	call   abe <thread_create>
 1b7:	89 44 24 1c          	mov    %eax,0x1c(%esp)
         if(tid == 0){
 1bb:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 1c0:	75 19                	jne    1db <main+0x1db>
            printf(1,"thread_create fails\n");
 1c2:	c7 44 24 04 ee 0d 00 	movl   $0xdee,0x4(%esp)
 1c9:	00 
 1ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1d1:	e8 bf 04 00 00       	call   695 <printf>
            exit();
 1d6:	e8 19 03 00 00       	call   4f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
 1db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1e2:	00 
 1e3:	c7 04 24 76 02 00 00 	movl   $0x276,(%esp)
 1ea:	e8 cf 08 00 00       	call   abe <thread_create>
 1ef:	89 44 24 1c          	mov    %eax,0x1c(%esp)
         if(tid == 0){
 1f3:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 1f8:	75 19                	jne    213 <main+0x213>
            printf(1,"thread_create fails\n");
 1fa:	c7 44 24 04 ee 0d 00 	movl   $0xdee,0x4(%esp)
 201:	00 
 202:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 209:	e8 87 04 00 00       	call   695 <printf>
            exit();
 20e:	e8 e1 02 00 00       	call   4f4 <exit>
        }
        tid = thread_create(test_func,(void *)0);
 213:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 21a:	00 
 21b:	c7 04 24 76 02 00 00 	movl   $0x276,(%esp)
 222:	e8 97 08 00 00       	call   abe <thread_create>
 227:	89 44 24 1c          	mov    %eax,0x1c(%esp)
         if(tid == 0){
 22b:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 230:	75 19                	jne    24b <main+0x24b>
            printf(1,"thread_create fails\n");
 232:	c7 44 24 04 ee 0d 00 	movl   $0xdee,0x4(%esp)
 239:	00 
 23a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 241:	e8 4f 04 00 00       	call   695 <printf>
            exit();
 246:	e8 a9 02 00 00       	call   4f4 <exit>
        }
        while(wait()>=0);
 24b:	e8 ac 02 00 00       	call   4fc <wait>
 250:	85 c0                	test   %eax,%eax
 252:	79 f7                	jns    24b <main+0x24b>
        printf(1,"I am parent, [5] n = %d\n",n);
 254:	a1 7c 0e 00 00       	mov    0xe7c,%eax
 259:	89 44 24 08          	mov    %eax,0x8(%esp)
 25d:	c7 44 24 04 1b 0e 00 	movl   $0xe1b,0x4(%esp)
 264:	00 
 265:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 26c:	e8 24 04 00 00       	call   695 <printf>
    }

   exit();
 271:	e8 7e 02 00 00       	call   4f4 <exit>

00000276 <test_func>:
}

void test_func(void *arg_ptr){
 276:	55                   	push   %ebp
 277:	89 e5                	mov    %esp,%ebp
 279:	83 ec 08             	sub    $0x8,%esp
//    printf(1,"\n n = %d\n",n);
    n++;
 27c:	a1 7c 0e 00 00       	mov    0xe7c,%eax
 281:	83 c0 01             	add    $0x1,%eax
 284:	a3 7c 0e 00 00       	mov    %eax,0xe7c
   // printf(1,"after increase by 1 , n = %d\n\n",n);
    texit();
 289:	e8 0e 03 00 00       	call   59c <texit>
 28e:	90                   	nop
 28f:	90                   	nop

00000290 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 290:	55                   	push   %ebp
 291:	89 e5                	mov    %esp,%ebp
 293:	57                   	push   %edi
 294:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 295:	8b 4d 08             	mov    0x8(%ebp),%ecx
 298:	8b 55 10             	mov    0x10(%ebp),%edx
 29b:	8b 45 0c             	mov    0xc(%ebp),%eax
 29e:	89 cb                	mov    %ecx,%ebx
 2a0:	89 df                	mov    %ebx,%edi
 2a2:	89 d1                	mov    %edx,%ecx
 2a4:	fc                   	cld    
 2a5:	f3 aa                	rep stos %al,%es:(%edi)
 2a7:	89 ca                	mov    %ecx,%edx
 2a9:	89 fb                	mov    %edi,%ebx
 2ab:	89 5d 08             	mov    %ebx,0x8(%ebp)
 2ae:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 2b1:	5b                   	pop    %ebx
 2b2:	5f                   	pop    %edi
 2b3:	5d                   	pop    %ebp
 2b4:	c3                   	ret    

000002b5 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 2b5:	55                   	push   %ebp
 2b6:	89 e5                	mov    %esp,%ebp
 2b8:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 2bb:	8b 45 08             	mov    0x8(%ebp),%eax
 2be:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 2c1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c4:	0f b6 10             	movzbl (%eax),%edx
 2c7:	8b 45 08             	mov    0x8(%ebp),%eax
 2ca:	88 10                	mov    %dl,(%eax)
 2cc:	8b 45 08             	mov    0x8(%ebp),%eax
 2cf:	0f b6 00             	movzbl (%eax),%eax
 2d2:	84 c0                	test   %al,%al
 2d4:	0f 95 c0             	setne  %al
 2d7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2db:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 2df:	84 c0                	test   %al,%al
 2e1:	75 de                	jne    2c1 <strcpy+0xc>
    ;
  return os;
 2e3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2e6:	c9                   	leave  
 2e7:	c3                   	ret    

000002e8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2e8:	55                   	push   %ebp
 2e9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 2eb:	eb 08                	jmp    2f5 <strcmp+0xd>
    p++, q++;
 2ed:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2f1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2f5:	8b 45 08             	mov    0x8(%ebp),%eax
 2f8:	0f b6 00             	movzbl (%eax),%eax
 2fb:	84 c0                	test   %al,%al
 2fd:	74 10                	je     30f <strcmp+0x27>
 2ff:	8b 45 08             	mov    0x8(%ebp),%eax
 302:	0f b6 10             	movzbl (%eax),%edx
 305:	8b 45 0c             	mov    0xc(%ebp),%eax
 308:	0f b6 00             	movzbl (%eax),%eax
 30b:	38 c2                	cmp    %al,%dl
 30d:	74 de                	je     2ed <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 30f:	8b 45 08             	mov    0x8(%ebp),%eax
 312:	0f b6 00             	movzbl (%eax),%eax
 315:	0f b6 d0             	movzbl %al,%edx
 318:	8b 45 0c             	mov    0xc(%ebp),%eax
 31b:	0f b6 00             	movzbl (%eax),%eax
 31e:	0f b6 c0             	movzbl %al,%eax
 321:	89 d1                	mov    %edx,%ecx
 323:	29 c1                	sub    %eax,%ecx
 325:	89 c8                	mov    %ecx,%eax
}
 327:	5d                   	pop    %ebp
 328:	c3                   	ret    

00000329 <strlen>:

uint
strlen(char *s)
{
 329:	55                   	push   %ebp
 32a:	89 e5                	mov    %esp,%ebp
 32c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 32f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 336:	eb 04                	jmp    33c <strlen+0x13>
 338:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 33c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 33f:	03 45 08             	add    0x8(%ebp),%eax
 342:	0f b6 00             	movzbl (%eax),%eax
 345:	84 c0                	test   %al,%al
 347:	75 ef                	jne    338 <strlen+0xf>
    ;
  return n;
 349:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 34c:	c9                   	leave  
 34d:	c3                   	ret    

0000034e <memset>:

void*
memset(void *dst, int c, uint n)
{
 34e:	55                   	push   %ebp
 34f:	89 e5                	mov    %esp,%ebp
 351:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 354:	8b 45 10             	mov    0x10(%ebp),%eax
 357:	89 44 24 08          	mov    %eax,0x8(%esp)
 35b:	8b 45 0c             	mov    0xc(%ebp),%eax
 35e:	89 44 24 04          	mov    %eax,0x4(%esp)
 362:	8b 45 08             	mov    0x8(%ebp),%eax
 365:	89 04 24             	mov    %eax,(%esp)
 368:	e8 23 ff ff ff       	call   290 <stosb>
  return dst;
 36d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 370:	c9                   	leave  
 371:	c3                   	ret    

00000372 <strchr>:

char*
strchr(const char *s, char c)
{
 372:	55                   	push   %ebp
 373:	89 e5                	mov    %esp,%ebp
 375:	83 ec 04             	sub    $0x4,%esp
 378:	8b 45 0c             	mov    0xc(%ebp),%eax
 37b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 37e:	eb 14                	jmp    394 <strchr+0x22>
    if(*s == c)
 380:	8b 45 08             	mov    0x8(%ebp),%eax
 383:	0f b6 00             	movzbl (%eax),%eax
 386:	3a 45 fc             	cmp    -0x4(%ebp),%al
 389:	75 05                	jne    390 <strchr+0x1e>
      return (char*)s;
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	eb 13                	jmp    3a3 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 390:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 394:	8b 45 08             	mov    0x8(%ebp),%eax
 397:	0f b6 00             	movzbl (%eax),%eax
 39a:	84 c0                	test   %al,%al
 39c:	75 e2                	jne    380 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 39e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3a3:	c9                   	leave  
 3a4:	c3                   	ret    

000003a5 <gets>:

char*
gets(char *buf, int max)
{
 3a5:	55                   	push   %ebp
 3a6:	89 e5                	mov    %esp,%ebp
 3a8:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3ab:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 3b2:	eb 44                	jmp    3f8 <gets+0x53>
    cc = read(0, &c, 1);
 3b4:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3bb:	00 
 3bc:	8d 45 ef             	lea    -0x11(%ebp),%eax
 3bf:	89 44 24 04          	mov    %eax,0x4(%esp)
 3c3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3ca:	e8 3d 01 00 00       	call   50c <read>
 3cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 3d2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 3d6:	7e 2d                	jle    405 <gets+0x60>
      break;
    buf[i++] = c;
 3d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 3db:	03 45 08             	add    0x8(%ebp),%eax
 3de:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 3e2:	88 10                	mov    %dl,(%eax)
 3e4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 3e8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3ec:	3c 0a                	cmp    $0xa,%al
 3ee:	74 16                	je     406 <gets+0x61>
 3f0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3f4:	3c 0d                	cmp    $0xd,%al
 3f6:	74 0e                	je     406 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3f8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 3fb:	83 c0 01             	add    $0x1,%eax
 3fe:	3b 45 0c             	cmp    0xc(%ebp),%eax
 401:	7c b1                	jl     3b4 <gets+0xf>
 403:	eb 01                	jmp    406 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 405:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 406:	8b 45 f0             	mov    -0x10(%ebp),%eax
 409:	03 45 08             	add    0x8(%ebp),%eax
 40c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 40f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 412:	c9                   	leave  
 413:	c3                   	ret    

00000414 <stat>:

int
stat(char *n, struct stat *st)
{
 414:	55                   	push   %ebp
 415:	89 e5                	mov    %esp,%ebp
 417:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 41a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 421:	00 
 422:	8b 45 08             	mov    0x8(%ebp),%eax
 425:	89 04 24             	mov    %eax,(%esp)
 428:	e8 07 01 00 00       	call   534 <open>
 42d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 430:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 434:	79 07                	jns    43d <stat+0x29>
    return -1;
 436:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 43b:	eb 23                	jmp    460 <stat+0x4c>
  r = fstat(fd, st);
 43d:	8b 45 0c             	mov    0xc(%ebp),%eax
 440:	89 44 24 04          	mov    %eax,0x4(%esp)
 444:	8b 45 f0             	mov    -0x10(%ebp),%eax
 447:	89 04 24             	mov    %eax,(%esp)
 44a:	e8 fd 00 00 00       	call   54c <fstat>
 44f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 452:	8b 45 f0             	mov    -0x10(%ebp),%eax
 455:	89 04 24             	mov    %eax,(%esp)
 458:	e8 bf 00 00 00       	call   51c <close>
  return r;
 45d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 460:	c9                   	leave  
 461:	c3                   	ret    

00000462 <atoi>:

int
atoi(const char *s)
{
 462:	55                   	push   %ebp
 463:	89 e5                	mov    %esp,%ebp
 465:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 468:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 46f:	eb 24                	jmp    495 <atoi+0x33>
    n = n*10 + *s++ - '0';
 471:	8b 55 fc             	mov    -0x4(%ebp),%edx
 474:	89 d0                	mov    %edx,%eax
 476:	c1 e0 02             	shl    $0x2,%eax
 479:	01 d0                	add    %edx,%eax
 47b:	01 c0                	add    %eax,%eax
 47d:	89 c2                	mov    %eax,%edx
 47f:	8b 45 08             	mov    0x8(%ebp),%eax
 482:	0f b6 00             	movzbl (%eax),%eax
 485:	0f be c0             	movsbl %al,%eax
 488:	8d 04 02             	lea    (%edx,%eax,1),%eax
 48b:	83 e8 30             	sub    $0x30,%eax
 48e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 491:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 495:	8b 45 08             	mov    0x8(%ebp),%eax
 498:	0f b6 00             	movzbl (%eax),%eax
 49b:	3c 2f                	cmp    $0x2f,%al
 49d:	7e 0a                	jle    4a9 <atoi+0x47>
 49f:	8b 45 08             	mov    0x8(%ebp),%eax
 4a2:	0f b6 00             	movzbl (%eax),%eax
 4a5:	3c 39                	cmp    $0x39,%al
 4a7:	7e c8                	jle    471 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 4a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4ac:	c9                   	leave  
 4ad:	c3                   	ret    

000004ae <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 4ae:	55                   	push   %ebp
 4af:	89 e5                	mov    %esp,%ebp
 4b1:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 4b4:	8b 45 08             	mov    0x8(%ebp),%eax
 4b7:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 4ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 4bd:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 4c0:	eb 13                	jmp    4d5 <memmove+0x27>
    *dst++ = *src++;
 4c2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4c5:	0f b6 10             	movzbl (%eax),%edx
 4c8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 4cb:	88 10                	mov    %dl,(%eax)
 4cd:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 4d1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4d5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 4d9:	0f 9f c0             	setg   %al
 4dc:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 4e0:	84 c0                	test   %al,%al
 4e2:	75 de                	jne    4c2 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 4e4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e7:	c9                   	leave  
 4e8:	c3                   	ret    
 4e9:	90                   	nop
 4ea:	90                   	nop
 4eb:	90                   	nop

000004ec <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4ec:	b8 01 00 00 00       	mov    $0x1,%eax
 4f1:	cd 40                	int    $0x40
 4f3:	c3                   	ret    

000004f4 <exit>:
SYSCALL(exit)
 4f4:	b8 02 00 00 00       	mov    $0x2,%eax
 4f9:	cd 40                	int    $0x40
 4fb:	c3                   	ret    

000004fc <wait>:
SYSCALL(wait)
 4fc:	b8 03 00 00 00       	mov    $0x3,%eax
 501:	cd 40                	int    $0x40
 503:	c3                   	ret    

00000504 <pipe>:
SYSCALL(pipe)
 504:	b8 04 00 00 00       	mov    $0x4,%eax
 509:	cd 40                	int    $0x40
 50b:	c3                   	ret    

0000050c <read>:
SYSCALL(read)
 50c:	b8 05 00 00 00       	mov    $0x5,%eax
 511:	cd 40                	int    $0x40
 513:	c3                   	ret    

00000514 <write>:
SYSCALL(write)
 514:	b8 10 00 00 00       	mov    $0x10,%eax
 519:	cd 40                	int    $0x40
 51b:	c3                   	ret    

0000051c <close>:
SYSCALL(close)
 51c:	b8 15 00 00 00       	mov    $0x15,%eax
 521:	cd 40                	int    $0x40
 523:	c3                   	ret    

00000524 <kill>:
SYSCALL(kill)
 524:	b8 06 00 00 00       	mov    $0x6,%eax
 529:	cd 40                	int    $0x40
 52b:	c3                   	ret    

0000052c <exec>:
SYSCALL(exec)
 52c:	b8 07 00 00 00       	mov    $0x7,%eax
 531:	cd 40                	int    $0x40
 533:	c3                   	ret    

00000534 <open>:
SYSCALL(open)
 534:	b8 0f 00 00 00       	mov    $0xf,%eax
 539:	cd 40                	int    $0x40
 53b:	c3                   	ret    

0000053c <mknod>:
SYSCALL(mknod)
 53c:	b8 11 00 00 00       	mov    $0x11,%eax
 541:	cd 40                	int    $0x40
 543:	c3                   	ret    

00000544 <unlink>:
SYSCALL(unlink)
 544:	b8 12 00 00 00       	mov    $0x12,%eax
 549:	cd 40                	int    $0x40
 54b:	c3                   	ret    

0000054c <fstat>:
SYSCALL(fstat)
 54c:	b8 08 00 00 00       	mov    $0x8,%eax
 551:	cd 40                	int    $0x40
 553:	c3                   	ret    

00000554 <link>:
SYSCALL(link)
 554:	b8 13 00 00 00       	mov    $0x13,%eax
 559:	cd 40                	int    $0x40
 55b:	c3                   	ret    

0000055c <mkdir>:
SYSCALL(mkdir)
 55c:	b8 14 00 00 00       	mov    $0x14,%eax
 561:	cd 40                	int    $0x40
 563:	c3                   	ret    

00000564 <chdir>:
SYSCALL(chdir)
 564:	b8 09 00 00 00       	mov    $0x9,%eax
 569:	cd 40                	int    $0x40
 56b:	c3                   	ret    

0000056c <dup>:
SYSCALL(dup)
 56c:	b8 0a 00 00 00       	mov    $0xa,%eax
 571:	cd 40                	int    $0x40
 573:	c3                   	ret    

00000574 <getpid>:
SYSCALL(getpid)
 574:	b8 0b 00 00 00       	mov    $0xb,%eax
 579:	cd 40                	int    $0x40
 57b:	c3                   	ret    

0000057c <sbrk>:
SYSCALL(sbrk)
 57c:	b8 0c 00 00 00       	mov    $0xc,%eax
 581:	cd 40                	int    $0x40
 583:	c3                   	ret    

00000584 <sleep>:
SYSCALL(sleep)
 584:	b8 0d 00 00 00       	mov    $0xd,%eax
 589:	cd 40                	int    $0x40
 58b:	c3                   	ret    

0000058c <uptime>:
SYSCALL(uptime)
 58c:	b8 0e 00 00 00       	mov    $0xe,%eax
 591:	cd 40                	int    $0x40
 593:	c3                   	ret    

00000594 <clone>:
SYSCALL(clone)
 594:	b8 16 00 00 00       	mov    $0x16,%eax
 599:	cd 40                	int    $0x40
 59b:	c3                   	ret    

0000059c <texit>:
SYSCALL(texit)
 59c:	b8 17 00 00 00       	mov    $0x17,%eax
 5a1:	cd 40                	int    $0x40
 5a3:	c3                   	ret    

000005a4 <tsleep>:
SYSCALL(tsleep)
 5a4:	b8 18 00 00 00       	mov    $0x18,%eax
 5a9:	cd 40                	int    $0x40
 5ab:	c3                   	ret    

000005ac <twakeup>:
SYSCALL(twakeup)
 5ac:	b8 19 00 00 00       	mov    $0x19,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <test>:
SYSCALL(test)
 5b4:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5bc:	55                   	push   %ebp
 5bd:	89 e5                	mov    %esp,%ebp
 5bf:	83 ec 28             	sub    $0x28,%esp
 5c2:	8b 45 0c             	mov    0xc(%ebp),%eax
 5c5:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5c8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5cf:	00 
 5d0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5d3:	89 44 24 04          	mov    %eax,0x4(%esp)
 5d7:	8b 45 08             	mov    0x8(%ebp),%eax
 5da:	89 04 24             	mov    %eax,(%esp)
 5dd:	e8 32 ff ff ff       	call   514 <write>
}
 5e2:	c9                   	leave  
 5e3:	c3                   	ret    

000005e4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5e4:	55                   	push   %ebp
 5e5:	89 e5                	mov    %esp,%ebp
 5e7:	53                   	push   %ebx
 5e8:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5f2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5f6:	74 17                	je     60f <printint+0x2b>
 5f8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 5fc:	79 11                	jns    60f <printint+0x2b>
    neg = 1;
 5fe:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 605:	8b 45 0c             	mov    0xc(%ebp),%eax
 608:	f7 d8                	neg    %eax
 60a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 60d:	eb 06                	jmp    615 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 60f:	8b 45 0c             	mov    0xc(%ebp),%eax
 612:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 615:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 61c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 61f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 622:	8b 45 f4             	mov    -0xc(%ebp),%eax
 625:	ba 00 00 00 00       	mov    $0x0,%edx
 62a:	f7 f3                	div    %ebx
 62c:	89 d0                	mov    %edx,%eax
 62e:	0f b6 80 80 0e 00 00 	movzbl 0xe80(%eax),%eax
 635:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 639:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 63d:	8b 45 10             	mov    0x10(%ebp),%eax
 640:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 643:	8b 45 f4             	mov    -0xc(%ebp),%eax
 646:	ba 00 00 00 00       	mov    $0x0,%edx
 64b:	f7 75 d4             	divl   -0x2c(%ebp)
 64e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 651:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 655:	75 c5                	jne    61c <printint+0x38>
  if(neg)
 657:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 65b:	74 28                	je     685 <printint+0xa1>
    buf[i++] = '-';
 65d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 660:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 665:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 669:	eb 1a                	jmp    685 <printint+0xa1>
    putc(fd, buf[i]);
 66b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 66e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 673:	0f be c0             	movsbl %al,%eax
 676:	89 44 24 04          	mov    %eax,0x4(%esp)
 67a:	8b 45 08             	mov    0x8(%ebp),%eax
 67d:	89 04 24             	mov    %eax,(%esp)
 680:	e8 37 ff ff ff       	call   5bc <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 685:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 689:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 68d:	79 dc                	jns    66b <printint+0x87>
    putc(fd, buf[i]);
}
 68f:	83 c4 44             	add    $0x44,%esp
 692:	5b                   	pop    %ebx
 693:	5d                   	pop    %ebp
 694:	c3                   	ret    

00000695 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 695:	55                   	push   %ebp
 696:	89 e5                	mov    %esp,%ebp
 698:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 69b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6a2:	8d 45 0c             	lea    0xc(%ebp),%eax
 6a5:	83 c0 04             	add    $0x4,%eax
 6a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 6ab:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 6b2:	e9 7e 01 00 00       	jmp    835 <printf+0x1a0>
    c = fmt[i] & 0xff;
 6b7:	8b 55 0c             	mov    0xc(%ebp),%edx
 6ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6bd:	8d 04 02             	lea    (%edx,%eax,1),%eax
 6c0:	0f b6 00             	movzbl (%eax),%eax
 6c3:	0f be c0             	movsbl %al,%eax
 6c6:	25 ff 00 00 00       	and    $0xff,%eax
 6cb:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 6ce:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 6d2:	75 2c                	jne    700 <printf+0x6b>
      if(c == '%'){
 6d4:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 6d8:	75 0c                	jne    6e6 <printf+0x51>
        state = '%';
 6da:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 6e1:	e9 4b 01 00 00       	jmp    831 <printf+0x19c>
      } else {
        putc(fd, c);
 6e6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6e9:	0f be c0             	movsbl %al,%eax
 6ec:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f0:	8b 45 08             	mov    0x8(%ebp),%eax
 6f3:	89 04 24             	mov    %eax,(%esp)
 6f6:	e8 c1 fe ff ff       	call   5bc <putc>
 6fb:	e9 31 01 00 00       	jmp    831 <printf+0x19c>
      }
    } else if(state == '%'){
 700:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 704:	0f 85 27 01 00 00    	jne    831 <printf+0x19c>
      if(c == 'd'){
 70a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 70e:	75 2d                	jne    73d <printf+0xa8>
        printint(fd, *ap, 10, 1);
 710:	8b 45 f4             	mov    -0xc(%ebp),%eax
 713:	8b 00                	mov    (%eax),%eax
 715:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 71c:	00 
 71d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 724:	00 
 725:	89 44 24 04          	mov    %eax,0x4(%esp)
 729:	8b 45 08             	mov    0x8(%ebp),%eax
 72c:	89 04 24             	mov    %eax,(%esp)
 72f:	e8 b0 fe ff ff       	call   5e4 <printint>
        ap++;
 734:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 738:	e9 ed 00 00 00       	jmp    82a <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 73d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 741:	74 06                	je     749 <printf+0xb4>
 743:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 747:	75 2d                	jne    776 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 749:	8b 45 f4             	mov    -0xc(%ebp),%eax
 74c:	8b 00                	mov    (%eax),%eax
 74e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 755:	00 
 756:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 75d:	00 
 75e:	89 44 24 04          	mov    %eax,0x4(%esp)
 762:	8b 45 08             	mov    0x8(%ebp),%eax
 765:	89 04 24             	mov    %eax,(%esp)
 768:	e8 77 fe ff ff       	call   5e4 <printint>
        ap++;
 76d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 771:	e9 b4 00 00 00       	jmp    82a <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 776:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 77a:	75 46                	jne    7c2 <printf+0x12d>
        s = (char*)*ap;
 77c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 77f:	8b 00                	mov    (%eax),%eax
 781:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 784:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 788:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 78c:	75 27                	jne    7b5 <printf+0x120>
          s = "(null)";
 78e:	c7 45 e4 34 0e 00 00 	movl   $0xe34,-0x1c(%ebp)
        while(*s != 0){
 795:	eb 1f                	jmp    7b6 <printf+0x121>
          putc(fd, *s);
 797:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 79a:	0f b6 00             	movzbl (%eax),%eax
 79d:	0f be c0             	movsbl %al,%eax
 7a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7a4:	8b 45 08             	mov    0x8(%ebp),%eax
 7a7:	89 04 24             	mov    %eax,(%esp)
 7aa:	e8 0d fe ff ff       	call   5bc <putc>
          s++;
 7af:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 7b3:	eb 01                	jmp    7b6 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7b5:	90                   	nop
 7b6:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7b9:	0f b6 00             	movzbl (%eax),%eax
 7bc:	84 c0                	test   %al,%al
 7be:	75 d7                	jne    797 <printf+0x102>
 7c0:	eb 68                	jmp    82a <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7c2:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 7c6:	75 1d                	jne    7e5 <printf+0x150>
        putc(fd, *ap);
 7c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7cb:	8b 00                	mov    (%eax),%eax
 7cd:	0f be c0             	movsbl %al,%eax
 7d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d4:	8b 45 08             	mov    0x8(%ebp),%eax
 7d7:	89 04 24             	mov    %eax,(%esp)
 7da:	e8 dd fd ff ff       	call   5bc <putc>
        ap++;
 7df:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 7e3:	eb 45                	jmp    82a <printf+0x195>
      } else if(c == '%'){
 7e5:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 7e9:	75 17                	jne    802 <printf+0x16d>
        putc(fd, c);
 7eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7ee:	0f be c0             	movsbl %al,%eax
 7f1:	89 44 24 04          	mov    %eax,0x4(%esp)
 7f5:	8b 45 08             	mov    0x8(%ebp),%eax
 7f8:	89 04 24             	mov    %eax,(%esp)
 7fb:	e8 bc fd ff ff       	call   5bc <putc>
 800:	eb 28                	jmp    82a <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 802:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 809:	00 
 80a:	8b 45 08             	mov    0x8(%ebp),%eax
 80d:	89 04 24             	mov    %eax,(%esp)
 810:	e8 a7 fd ff ff       	call   5bc <putc>
        putc(fd, c);
 815:	8b 45 e8             	mov    -0x18(%ebp),%eax
 818:	0f be c0             	movsbl %al,%eax
 81b:	89 44 24 04          	mov    %eax,0x4(%esp)
 81f:	8b 45 08             	mov    0x8(%ebp),%eax
 822:	89 04 24             	mov    %eax,(%esp)
 825:	e8 92 fd ff ff       	call   5bc <putc>
      }
      state = 0;
 82a:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 831:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 835:	8b 55 0c             	mov    0xc(%ebp),%edx
 838:	8b 45 ec             	mov    -0x14(%ebp),%eax
 83b:	8d 04 02             	lea    (%edx,%eax,1),%eax
 83e:	0f b6 00             	movzbl (%eax),%eax
 841:	84 c0                	test   %al,%al
 843:	0f 85 6e fe ff ff    	jne    6b7 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 849:	c9                   	leave  
 84a:	c3                   	ret    
 84b:	90                   	nop

0000084c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 84c:	55                   	push   %ebp
 84d:	89 e5                	mov    %esp,%ebp
 84f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 852:	8b 45 08             	mov    0x8(%ebp),%eax
 855:	83 e8 08             	sub    $0x8,%eax
 858:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 85b:	a1 9c 0e 00 00       	mov    0xe9c,%eax
 860:	89 45 fc             	mov    %eax,-0x4(%ebp)
 863:	eb 24                	jmp    889 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 865:	8b 45 fc             	mov    -0x4(%ebp),%eax
 868:	8b 00                	mov    (%eax),%eax
 86a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 86d:	77 12                	ja     881 <free+0x35>
 86f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 872:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 875:	77 24                	ja     89b <free+0x4f>
 877:	8b 45 fc             	mov    -0x4(%ebp),%eax
 87a:	8b 00                	mov    (%eax),%eax
 87c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 87f:	77 1a                	ja     89b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 881:	8b 45 fc             	mov    -0x4(%ebp),%eax
 884:	8b 00                	mov    (%eax),%eax
 886:	89 45 fc             	mov    %eax,-0x4(%ebp)
 889:	8b 45 f8             	mov    -0x8(%ebp),%eax
 88c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 88f:	76 d4                	jbe    865 <free+0x19>
 891:	8b 45 fc             	mov    -0x4(%ebp),%eax
 894:	8b 00                	mov    (%eax),%eax
 896:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 899:	76 ca                	jbe    865 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 89b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 89e:	8b 40 04             	mov    0x4(%eax),%eax
 8a1:	c1 e0 03             	shl    $0x3,%eax
 8a4:	89 c2                	mov    %eax,%edx
 8a6:	03 55 f8             	add    -0x8(%ebp),%edx
 8a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ac:	8b 00                	mov    (%eax),%eax
 8ae:	39 c2                	cmp    %eax,%edx
 8b0:	75 24                	jne    8d6 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 8b2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b5:	8b 50 04             	mov    0x4(%eax),%edx
 8b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8bb:	8b 00                	mov    (%eax),%eax
 8bd:	8b 40 04             	mov    0x4(%eax),%eax
 8c0:	01 c2                	add    %eax,%edx
 8c2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c5:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8c8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8cb:	8b 00                	mov    (%eax),%eax
 8cd:	8b 10                	mov    (%eax),%edx
 8cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d2:	89 10                	mov    %edx,(%eax)
 8d4:	eb 0a                	jmp    8e0 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 8d6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d9:	8b 10                	mov    (%eax),%edx
 8db:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8de:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e3:	8b 40 04             	mov    0x4(%eax),%eax
 8e6:	c1 e0 03             	shl    $0x3,%eax
 8e9:	03 45 fc             	add    -0x4(%ebp),%eax
 8ec:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8ef:	75 20                	jne    911 <free+0xc5>
    p->s.size += bp->s.size;
 8f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8f4:	8b 50 04             	mov    0x4(%eax),%edx
 8f7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8fa:	8b 40 04             	mov    0x4(%eax),%eax
 8fd:	01 c2                	add    %eax,%edx
 8ff:	8b 45 fc             	mov    -0x4(%ebp),%eax
 902:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 905:	8b 45 f8             	mov    -0x8(%ebp),%eax
 908:	8b 10                	mov    (%eax),%edx
 90a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 90d:	89 10                	mov    %edx,(%eax)
 90f:	eb 08                	jmp    919 <free+0xcd>
  } else
    p->s.ptr = bp;
 911:	8b 45 fc             	mov    -0x4(%ebp),%eax
 914:	8b 55 f8             	mov    -0x8(%ebp),%edx
 917:	89 10                	mov    %edx,(%eax)
  freep = p;
 919:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91c:	a3 9c 0e 00 00       	mov    %eax,0xe9c
}
 921:	c9                   	leave  
 922:	c3                   	ret    

00000923 <morecore>:

static Header*
morecore(uint nu)
{
 923:	55                   	push   %ebp
 924:	89 e5                	mov    %esp,%ebp
 926:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 929:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 930:	77 07                	ja     939 <morecore+0x16>
    nu = 4096;
 932:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 939:	8b 45 08             	mov    0x8(%ebp),%eax
 93c:	c1 e0 03             	shl    $0x3,%eax
 93f:	89 04 24             	mov    %eax,(%esp)
 942:	e8 35 fc ff ff       	call   57c <sbrk>
 947:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 94a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 94e:	75 07                	jne    957 <morecore+0x34>
    return 0;
 950:	b8 00 00 00 00       	mov    $0x0,%eax
 955:	eb 22                	jmp    979 <morecore+0x56>
  hp = (Header*)p;
 957:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 95d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 960:	8b 55 08             	mov    0x8(%ebp),%edx
 963:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 966:	8b 45 f4             	mov    -0xc(%ebp),%eax
 969:	83 c0 08             	add    $0x8,%eax
 96c:	89 04 24             	mov    %eax,(%esp)
 96f:	e8 d8 fe ff ff       	call   84c <free>
  return freep;
 974:	a1 9c 0e 00 00       	mov    0xe9c,%eax
}
 979:	c9                   	leave  
 97a:	c3                   	ret    

0000097b <malloc>:

void*
malloc(uint nbytes)
{
 97b:	55                   	push   %ebp
 97c:	89 e5                	mov    %esp,%ebp
 97e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 981:	8b 45 08             	mov    0x8(%ebp),%eax
 984:	83 c0 07             	add    $0x7,%eax
 987:	c1 e8 03             	shr    $0x3,%eax
 98a:	83 c0 01             	add    $0x1,%eax
 98d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 990:	a1 9c 0e 00 00       	mov    0xe9c,%eax
 995:	89 45 f0             	mov    %eax,-0x10(%ebp)
 998:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 99c:	75 23                	jne    9c1 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 99e:	c7 45 f0 94 0e 00 00 	movl   $0xe94,-0x10(%ebp)
 9a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a8:	a3 9c 0e 00 00       	mov    %eax,0xe9c
 9ad:	a1 9c 0e 00 00       	mov    0xe9c,%eax
 9b2:	a3 94 0e 00 00       	mov    %eax,0xe94
    base.s.size = 0;
 9b7:	c7 05 98 0e 00 00 00 	movl   $0x0,0xe98
 9be:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9c1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c4:	8b 00                	mov    (%eax),%eax
 9c6:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 9c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9cc:	8b 40 04             	mov    0x4(%eax),%eax
 9cf:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 9d2:	72 4d                	jb     a21 <malloc+0xa6>
      if(p->s.size == nunits)
 9d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9d7:	8b 40 04             	mov    0x4(%eax),%eax
 9da:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 9dd:	75 0c                	jne    9eb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9df:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9e2:	8b 10                	mov    (%eax),%edx
 9e4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e7:	89 10                	mov    %edx,(%eax)
 9e9:	eb 26                	jmp    a11 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9ee:	8b 40 04             	mov    0x4(%eax),%eax
 9f1:	89 c2                	mov    %eax,%edx
 9f3:	2b 55 f4             	sub    -0xc(%ebp),%edx
 9f6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9f9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 9fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 9ff:	8b 40 04             	mov    0x4(%eax),%eax
 a02:	c1 e0 03             	shl    $0x3,%eax
 a05:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 a08:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a0b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a0e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a11:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a14:	a3 9c 0e 00 00       	mov    %eax,0xe9c
      return (void*)(p + 1);
 a19:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a1c:	83 c0 08             	add    $0x8,%eax
 a1f:	eb 38                	jmp    a59 <malloc+0xde>
    }
    if(p == freep)
 a21:	a1 9c 0e 00 00       	mov    0xe9c,%eax
 a26:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 a29:	75 1b                	jne    a46 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a2b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2e:	89 04 24             	mov    %eax,(%esp)
 a31:	e8 ed fe ff ff       	call   923 <morecore>
 a36:	89 45 ec             	mov    %eax,-0x14(%ebp)
 a39:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a3d:	75 07                	jne    a46 <malloc+0xcb>
        return 0;
 a3f:	b8 00 00 00 00       	mov    $0x0,%eax
 a44:	eb 13                	jmp    a59 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a46:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a49:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a4c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a4f:	8b 00                	mov    (%eax),%eax
 a51:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a54:	e9 70 ff ff ff       	jmp    9c9 <malloc+0x4e>
}
 a59:	c9                   	leave  
 a5a:	c3                   	ret    
 a5b:	90                   	nop

00000a5c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 a5c:	55                   	push   %ebp
 a5d:	89 e5                	mov    %esp,%ebp
 a5f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 a62:	8b 55 08             	mov    0x8(%ebp),%edx
 a65:	8b 45 0c             	mov    0xc(%ebp),%eax
 a68:	8b 4d 08             	mov    0x8(%ebp),%ecx
 a6b:	f0 87 02             	lock xchg %eax,(%edx)
 a6e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 a71:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 a74:	c9                   	leave  
 a75:	c3                   	ret    

00000a76 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 a76:	55                   	push   %ebp
 a77:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 a79:	8b 45 08             	mov    0x8(%ebp),%eax
 a7c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 a82:	5d                   	pop    %ebp
 a83:	c3                   	ret    

00000a84 <lock_acquire>:
void lock_acquire(lock_t *lock){
 a84:	55                   	push   %ebp
 a85:	89 e5                	mov    %esp,%ebp
 a87:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 a8a:	8b 45 08             	mov    0x8(%ebp),%eax
 a8d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 a94:	00 
 a95:	89 04 24             	mov    %eax,(%esp)
 a98:	e8 bf ff ff ff       	call   a5c <xchg>
 a9d:	85 c0                	test   %eax,%eax
 a9f:	75 e9                	jne    a8a <lock_acquire+0x6>
}
 aa1:	c9                   	leave  
 aa2:	c3                   	ret    

00000aa3 <lock_release>:
void lock_release(lock_t *lock){
 aa3:	55                   	push   %ebp
 aa4:	89 e5                	mov    %esp,%ebp
 aa6:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 aa9:	8b 45 08             	mov    0x8(%ebp),%eax
 aac:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 ab3:	00 
 ab4:	89 04 24             	mov    %eax,(%esp)
 ab7:	e8 a0 ff ff ff       	call   a5c <xchg>
}
 abc:	c9                   	leave  
 abd:	c3                   	ret    

00000abe <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 abe:	55                   	push   %ebp
 abf:	89 e5                	mov    %esp,%ebp
 ac1:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 ac4:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 acb:	e8 ab fe ff ff       	call   97b <malloc>
 ad0:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 ad3:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ad6:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 ad9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 adc:	25 ff 0f 00 00       	and    $0xfff,%eax
 ae1:	85 c0                	test   %eax,%eax
 ae3:	74 15                	je     afa <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 ae5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ae8:	89 c2                	mov    %eax,%edx
 aea:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 af0:	b8 00 10 00 00       	mov    $0x1000,%eax
 af5:	29 d0                	sub    %edx,%eax
 af7:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 afa:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 afe:	75 1b                	jne    b1b <thread_create+0x5d>

        printf(1,"malloc fail \n");
 b00:	c7 44 24 04 3b 0e 00 	movl   $0xe3b,0x4(%esp)
 b07:	00 
 b08:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b0f:	e8 81 fb ff ff       	call   695 <printf>
        return 0;
 b14:	b8 00 00 00 00       	mov    $0x0,%eax
 b19:	eb 6f                	jmp    b8a <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 b1b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 b1e:	8b 55 08             	mov    0x8(%ebp),%edx
 b21:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b24:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 b28:	89 54 24 08          	mov    %edx,0x8(%esp)
 b2c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 b33:	00 
 b34:	89 04 24             	mov    %eax,(%esp)
 b37:	e8 58 fa ff ff       	call   594 <clone>
 b3c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 b3f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b43:	79 1b                	jns    b60 <thread_create+0xa2>
        printf(1,"clone fails\n");
 b45:	c7 44 24 04 49 0e 00 	movl   $0xe49,0x4(%esp)
 b4c:	00 
 b4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b54:	e8 3c fb ff ff       	call   695 <printf>
        return 0;
 b59:	b8 00 00 00 00       	mov    $0x0,%eax
 b5e:	eb 2a                	jmp    b8a <thread_create+0xcc>
    }
    if(tid > 0){
 b60:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b64:	7e 05                	jle    b6b <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 b66:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b69:	eb 1f                	jmp    b8a <thread_create+0xcc>
    }
    if(tid == 0){
 b6b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b6f:	75 14                	jne    b85 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 b71:	c7 44 24 04 56 0e 00 	movl   $0xe56,0x4(%esp)
 b78:	00 
 b79:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b80:	e8 10 fb ff ff       	call   695 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 b85:	b8 00 00 00 00       	mov    $0x0,%eax
}
 b8a:	c9                   	leave  
 b8b:	c3                   	ret    

00000b8c <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 b8c:	55                   	push   %ebp
 b8d:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 b8f:	8b 45 08             	mov    0x8(%ebp),%eax
 b92:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 b98:	8b 45 08             	mov    0x8(%ebp),%eax
 b9b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 ba2:	8b 45 08             	mov    0x8(%ebp),%eax
 ba5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 bac:	5d                   	pop    %ebp
 bad:	c3                   	ret    

00000bae <add_q>:

void add_q(struct queue *q, int v){
 bae:	55                   	push   %ebp
 baf:	89 e5                	mov    %esp,%ebp
 bb1:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 bb4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 bbb:	e8 bb fd ff ff       	call   97b <malloc>
 bc0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 bc3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 bcd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bd0:	8b 55 0c             	mov    0xc(%ebp),%edx
 bd3:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 bd5:	8b 45 08             	mov    0x8(%ebp),%eax
 bd8:	8b 40 04             	mov    0x4(%eax),%eax
 bdb:	85 c0                	test   %eax,%eax
 bdd:	75 0b                	jne    bea <add_q+0x3c>
        q->head = n;
 bdf:	8b 45 08             	mov    0x8(%ebp),%eax
 be2:	8b 55 f4             	mov    -0xc(%ebp),%edx
 be5:	89 50 04             	mov    %edx,0x4(%eax)
 be8:	eb 0c                	jmp    bf6 <add_q+0x48>
    }else{
        q->tail->next = n;
 bea:	8b 45 08             	mov    0x8(%ebp),%eax
 bed:	8b 40 08             	mov    0x8(%eax),%eax
 bf0:	8b 55 f4             	mov    -0xc(%ebp),%edx
 bf3:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 bf6:	8b 45 08             	mov    0x8(%ebp),%eax
 bf9:	8b 55 f4             	mov    -0xc(%ebp),%edx
 bfc:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 bff:	8b 45 08             	mov    0x8(%ebp),%eax
 c02:	8b 00                	mov    (%eax),%eax
 c04:	8d 50 01             	lea    0x1(%eax),%edx
 c07:	8b 45 08             	mov    0x8(%ebp),%eax
 c0a:	89 10                	mov    %edx,(%eax)
}
 c0c:	c9                   	leave  
 c0d:	c3                   	ret    

00000c0e <empty_q>:

int empty_q(struct queue *q){
 c0e:	55                   	push   %ebp
 c0f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 c11:	8b 45 08             	mov    0x8(%ebp),%eax
 c14:	8b 00                	mov    (%eax),%eax
 c16:	85 c0                	test   %eax,%eax
 c18:	75 07                	jne    c21 <empty_q+0x13>
        return 1;
 c1a:	b8 01 00 00 00       	mov    $0x1,%eax
 c1f:	eb 05                	jmp    c26 <empty_q+0x18>
    else
        return 0;
 c21:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 c26:	5d                   	pop    %ebp
 c27:	c3                   	ret    

00000c28 <pop_q>:
int pop_q(struct queue *q){
 c28:	55                   	push   %ebp
 c29:	89 e5                	mov    %esp,%ebp
 c2b:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 c2e:	8b 45 08             	mov    0x8(%ebp),%eax
 c31:	89 04 24             	mov    %eax,(%esp)
 c34:	e8 d5 ff ff ff       	call   c0e <empty_q>
 c39:	85 c0                	test   %eax,%eax
 c3b:	75 5d                	jne    c9a <pop_q+0x72>
       val = q->head->value; 
 c3d:	8b 45 08             	mov    0x8(%ebp),%eax
 c40:	8b 40 04             	mov    0x4(%eax),%eax
 c43:	8b 00                	mov    (%eax),%eax
 c45:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 c48:	8b 45 08             	mov    0x8(%ebp),%eax
 c4b:	8b 40 04             	mov    0x4(%eax),%eax
 c4e:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 c51:	8b 45 08             	mov    0x8(%ebp),%eax
 c54:	8b 40 04             	mov    0x4(%eax),%eax
 c57:	8b 50 04             	mov    0x4(%eax),%edx
 c5a:	8b 45 08             	mov    0x8(%ebp),%eax
 c5d:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 c60:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c63:	89 04 24             	mov    %eax,(%esp)
 c66:	e8 e1 fb ff ff       	call   84c <free>
       q->size--;
 c6b:	8b 45 08             	mov    0x8(%ebp),%eax
 c6e:	8b 00                	mov    (%eax),%eax
 c70:	8d 50 ff             	lea    -0x1(%eax),%edx
 c73:	8b 45 08             	mov    0x8(%ebp),%eax
 c76:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 c78:	8b 45 08             	mov    0x8(%ebp),%eax
 c7b:	8b 00                	mov    (%eax),%eax
 c7d:	85 c0                	test   %eax,%eax
 c7f:	75 14                	jne    c95 <pop_q+0x6d>
            q->head = 0;
 c81:	8b 45 08             	mov    0x8(%ebp),%eax
 c84:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 c8b:	8b 45 08             	mov    0x8(%ebp),%eax
 c8e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 c95:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c98:	eb 05                	jmp    c9f <pop_q+0x77>
    }
    return -1;
 c9a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 c9f:	c9                   	leave  
 ca0:	c3                   	ret    
 ca1:	90                   	nop
 ca2:	90                   	nop
 ca3:	90                   	nop

00000ca4 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 ca4:	55                   	push   %ebp
 ca5:	89 e5                	mov    %esp,%ebp
 ca7:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 caa:	8b 45 08             	mov    0x8(%ebp),%eax
 cad:	8b 55 0c             	mov    0xc(%ebp),%edx
 cb0:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 cb3:	8b 45 08             	mov    0x8(%ebp),%eax
 cb6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 cbd:	8b 45 08             	mov    0x8(%ebp),%eax
 cc0:	89 04 24             	mov    %eax,(%esp)
 cc3:	e8 ae fd ff ff       	call   a76 <lock_init>
}
 cc8:	c9                   	leave  
 cc9:	c3                   	ret    

00000cca <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 cca:	55                   	push   %ebp
 ccb:	89 e5                	mov    %esp,%ebp
 ccd:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 cd0:	8b 45 08             	mov    0x8(%ebp),%eax
 cd3:	89 04 24             	mov    %eax,(%esp)
 cd6:	e8 a9 fd ff ff       	call   a84 <lock_acquire>
	if(s->count  == 0){
 cdb:	8b 45 08             	mov    0x8(%ebp),%eax
 cde:	8b 40 04             	mov    0x4(%eax),%eax
 ce1:	85 c0                	test   %eax,%eax
 ce3:	75 43                	jne    d28 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 ce5:	c7 44 24 04 67 0e 00 	movl   $0xe67,0x4(%esp)
 cec:	00 
 ced:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 cf4:	e8 9c f9 ff ff       	call   695 <printf>
		//add proc to waiters list
		int tid = getpid();
 cf9:	e8 76 f8 ff ff       	call   574 <getpid>
 cfe:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 d01:	8b 45 08             	mov    0x8(%ebp),%eax
 d04:	8d 50 0c             	lea    0xc(%eax),%edx
 d07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d0a:	89 44 24 04          	mov    %eax,0x4(%esp)
 d0e:	89 14 24             	mov    %edx,(%esp)
 d11:	e8 98 fe ff ff       	call   bae <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 d16:	8b 45 08             	mov    0x8(%ebp),%eax
 d19:	89 04 24             	mov    %eax,(%esp)
 d1c:	e8 82 fd ff ff       	call   aa3 <lock_release>
		tsleep(); 
 d21:	e8 7e f8 ff ff       	call   5a4 <tsleep>
 d26:	eb 2e                	jmp    d56 <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 d28:	c7 44 24 04 6e 0e 00 	movl   $0xe6e,0x4(%esp)
 d2f:	00 
 d30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d37:	e8 59 f9 ff ff       	call   695 <printf>
		s->count--;	
 d3c:	8b 45 08             	mov    0x8(%ebp),%eax
 d3f:	8b 40 04             	mov    0x4(%eax),%eax
 d42:	8d 50 ff             	lea    -0x1(%eax),%edx
 d45:	8b 45 08             	mov    0x8(%ebp),%eax
 d48:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 d4b:	8b 45 08             	mov    0x8(%ebp),%eax
 d4e:	89 04 24             	mov    %eax,(%esp)
 d51:	e8 4d fd ff ff       	call   aa3 <lock_release>
	}
}
 d56:	c9                   	leave  
 d57:	c3                   	ret    

00000d58 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 d58:	55                   	push   %ebp
 d59:	89 e5                	mov    %esp,%ebp
 d5b:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 d5e:	c7 44 24 04 75 0e 00 	movl   $0xe75,0x4(%esp)
 d65:	00 
 d66:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d6d:	e8 23 f9 ff ff       	call   695 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 d72:	8b 45 08             	mov    0x8(%ebp),%eax
 d75:	89 04 24             	mov    %eax,(%esp)
 d78:	e8 07 fd ff ff       	call   a84 <lock_acquire>
	if(s->count < s->size){
 d7d:	8b 45 08             	mov    0x8(%ebp),%eax
 d80:	8b 50 04             	mov    0x4(%eax),%edx
 d83:	8b 45 08             	mov    0x8(%ebp),%eax
 d86:	8b 40 08             	mov    0x8(%eax),%eax
 d89:	39 c2                	cmp    %eax,%edx
 d8b:	7d 0f                	jge    d9c <sem_signal+0x44>
		s->count++;	
 d8d:	8b 45 08             	mov    0x8(%ebp),%eax
 d90:	8b 40 04             	mov    0x4(%eax),%eax
 d93:	8d 50 01             	lea    0x1(%eax),%edx
 d96:	8b 45 08             	mov    0x8(%ebp),%eax
 d99:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 d9c:	8b 45 08             	mov    0x8(%ebp),%eax
 d9f:	83 c0 0c             	add    $0xc,%eax
 da2:	89 04 24             	mov    %eax,(%esp)
 da5:	e8 7e fe ff ff       	call   c28 <pop_q>
 daa:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 dad:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 db1:	74 2e                	je     de1 <sem_signal+0x89>
		printf(1, "Sem A\n");
 db3:	c7 44 24 04 6e 0e 00 	movl   $0xe6e,0x4(%esp)
 dba:	00 
 dbb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 dc2:	e8 ce f8 ff ff       	call   695 <printf>
		twakeup(tid);
 dc7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dca:	89 04 24             	mov    %eax,(%esp)
 dcd:	e8 da f7 ff ff       	call   5ac <twakeup>
		s->count--;
 dd2:	8b 45 08             	mov    0x8(%ebp),%eax
 dd5:	8b 40 04             	mov    0x4(%eax),%eax
 dd8:	8d 50 ff             	lea    -0x1(%eax),%edx
 ddb:	8b 45 08             	mov    0x8(%ebp),%eax
 dde:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 de1:	8b 45 08             	mov    0x8(%ebp),%eax
 de4:	89 04 24             	mov    %eax,(%esp)
 de7:	e8 b7 fc ff ff       	call   aa3 <lock_release>

 dec:	c9                   	leave  
 ded:	c3                   	ret    
