
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
   9:	e8 e2 04 00 00       	call   4f0 <fork>
   e:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid == 0){
  12:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  17:	0f 85 44 01 00 00    	jne    161 <main+0x161>
        void *tid = thread_create(test_func,(void *)0);
  1d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  24:	00 
  25:	c7 04 24 78 02 00 00 	movl   $0x278,(%esp)
  2c:	e8 9e 0a 00 00       	call   acf <thread_create>
  31:	89 44 24 18          	mov    %eax,0x18(%esp)
         if(tid == 0){
  35:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  3a:	75 19                	jne    55 <main+0x55>
            printf(1,"thread_create fails\n");
  3c:	c7 44 24 04 0f 0e 00 	movl   $0xe0f,0x4(%esp)
  43:	00 
  44:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  4b:	e8 50 06 00 00       	call   6a0 <printf>
            exit();
  50:	e8 a3 04 00 00       	call   4f8 <exit>
        }
        tid = thread_create(test_func,(void *)0);
  55:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  5c:	00 
  5d:	c7 04 24 78 02 00 00 	movl   $0x278,(%esp)
  64:	e8 66 0a 00 00       	call   acf <thread_create>
  69:	89 44 24 18          	mov    %eax,0x18(%esp)
        if(tid == 0){
  6d:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  72:	75 19                	jne    8d <main+0x8d>
            printf(1,"thread_create fails\n");
  74:	c7 44 24 04 0f 0e 00 	movl   $0xe0f,0x4(%esp)
  7b:	00 
  7c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  83:	e8 18 06 00 00       	call   6a0 <printf>
            exit();
  88:	e8 6b 04 00 00       	call   4f8 <exit>
        }
        tid = thread_create(test_func,(void *)0);
  8d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  94:	00 
  95:	c7 04 24 78 02 00 00 	movl   $0x278,(%esp)
  9c:	e8 2e 0a 00 00       	call   acf <thread_create>
  a1:	89 44 24 18          	mov    %eax,0x18(%esp)
         if(tid == 0){
  a5:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  aa:	75 19                	jne    c5 <main+0xc5>
            printf(1,"thread_create fails\n");
  ac:	c7 44 24 04 0f 0e 00 	movl   $0xe0f,0x4(%esp)
  b3:	00 
  b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  bb:	e8 e0 05 00 00       	call   6a0 <printf>
            exit();
  c0:	e8 33 04 00 00       	call   4f8 <exit>
        }
        tid = thread_create(test_func,(void *)0);
  c5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  cc:	00 
  cd:	c7 04 24 78 02 00 00 	movl   $0x278,(%esp)
  d4:	e8 f6 09 00 00       	call   acf <thread_create>
  d9:	89 44 24 18          	mov    %eax,0x18(%esp)
          if(tid == 0){
  dd:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  e2:	75 19                	jne    fd <main+0xfd>
            printf(1,"thread_create fails\n");
  e4:	c7 44 24 04 0f 0e 00 	movl   $0xe0f,0x4(%esp)
  eb:	00 
  ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  f3:	e8 a8 05 00 00       	call   6a0 <printf>
            exit();
  f8:	e8 fb 03 00 00       	call   4f8 <exit>
        }
       tid = thread_create(test_func,(void *)0);
  fd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 104:	00 
 105:	c7 04 24 78 02 00 00 	movl   $0x278,(%esp)
 10c:	e8 be 09 00 00       	call   acf <thread_create>
 111:	89 44 24 18          	mov    %eax,0x18(%esp)
           if(tid == 0){
 115:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 11a:	75 19                	jne    135 <main+0x135>
            printf(1,"thread_create fails\n");
 11c:	c7 44 24 04 0f 0e 00 	movl   $0xe0f,0x4(%esp)
 123:	00 
 124:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 12b:	e8 70 05 00 00       	call   6a0 <printf>
            exit();
 130:	e8 c3 03 00 00       	call   4f8 <exit>
        }
      while(wait()>=0);
 135:	90                   	nop
 136:	e8 c5 03 00 00       	call   500 <wait>
 13b:	85 c0                	test   %eax,%eax
 13d:	79 f7                	jns    136 <main+0x136>
        printf(1,"I am child, [6] n = %d\n",n);
 13f:	a1 a8 12 00 00       	mov    0x12a8,%eax
 144:	89 44 24 08          	mov    %eax,0x8(%esp)
 148:	c7 44 24 04 24 0e 00 	movl   $0xe24,0x4(%esp)
 14f:	00 
 150:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 157:	e8 44 05 00 00       	call   6a0 <printf>
 15c:	e9 12 01 00 00       	jmp    273 <main+0x273>
    }else if(pid > 0){
 161:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
 166:	0f 8e 07 01 00 00    	jle    273 <main+0x273>
        void *tid = thread_create(test_func,(void *)0);
 16c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 173:	00 
 174:	c7 04 24 78 02 00 00 	movl   $0x278,(%esp)
 17b:	e8 4f 09 00 00       	call   acf <thread_create>
 180:	89 44 24 14          	mov    %eax,0x14(%esp)
         if(tid == 0){
 184:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 189:	75 19                	jne    1a4 <main+0x1a4>
            printf(1,"thread_create fails\n");
 18b:	c7 44 24 04 0f 0e 00 	movl   $0xe0f,0x4(%esp)
 192:	00 
 193:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 19a:	e8 01 05 00 00       	call   6a0 <printf>
            exit();
 19f:	e8 54 03 00 00       	call   4f8 <exit>
        }
        tid = thread_create(test_func,(void *)0);
 1a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1ab:	00 
 1ac:	c7 04 24 78 02 00 00 	movl   $0x278,(%esp)
 1b3:	e8 17 09 00 00       	call   acf <thread_create>
 1b8:	89 44 24 14          	mov    %eax,0x14(%esp)
         if(tid == 0){
 1bc:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 1c1:	75 19                	jne    1dc <main+0x1dc>
            printf(1,"thread_create fails\n");
 1c3:	c7 44 24 04 0f 0e 00 	movl   $0xe0f,0x4(%esp)
 1ca:	00 
 1cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1d2:	e8 c9 04 00 00       	call   6a0 <printf>
            exit();
 1d7:	e8 1c 03 00 00       	call   4f8 <exit>
        }
        tid = thread_create(test_func,(void *)0);
 1dc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 1e3:	00 
 1e4:	c7 04 24 78 02 00 00 	movl   $0x278,(%esp)
 1eb:	e8 df 08 00 00       	call   acf <thread_create>
 1f0:	89 44 24 14          	mov    %eax,0x14(%esp)
         if(tid == 0){
 1f4:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 1f9:	75 19                	jne    214 <main+0x214>
            printf(1,"thread_create fails\n");
 1fb:	c7 44 24 04 0f 0e 00 	movl   $0xe0f,0x4(%esp)
 202:	00 
 203:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 20a:	e8 91 04 00 00       	call   6a0 <printf>
            exit();
 20f:	e8 e4 02 00 00       	call   4f8 <exit>
        }
        tid = thread_create(test_func,(void *)0);
 214:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 21b:	00 
 21c:	c7 04 24 78 02 00 00 	movl   $0x278,(%esp)
 223:	e8 a7 08 00 00       	call   acf <thread_create>
 228:	89 44 24 14          	mov    %eax,0x14(%esp)
         if(tid == 0){
 22c:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 231:	75 19                	jne    24c <main+0x24c>
            printf(1,"thread_create fails\n");
 233:	c7 44 24 04 0f 0e 00 	movl   $0xe0f,0x4(%esp)
 23a:	00 
 23b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 242:	e8 59 04 00 00       	call   6a0 <printf>
            exit();
 247:	e8 ac 02 00 00       	call   4f8 <exit>
        }
        while(wait()>=0);
 24c:	90                   	nop
 24d:	e8 ae 02 00 00       	call   500 <wait>
 252:	85 c0                	test   %eax,%eax
 254:	79 f7                	jns    24d <main+0x24d>
        printf(1,"I am parent, [5] n = %d\n",n);
 256:	a1 a8 12 00 00       	mov    0x12a8,%eax
 25b:	89 44 24 08          	mov    %eax,0x8(%esp)
 25f:	c7 44 24 04 3c 0e 00 	movl   $0xe3c,0x4(%esp)
 266:	00 
 267:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 26e:	e8 2d 04 00 00       	call   6a0 <printf>
    }

   exit();
 273:	e8 80 02 00 00       	call   4f8 <exit>

00000278 <test_func>:
}

void test_func(void *arg_ptr){
 278:	55                   	push   %ebp
 279:	89 e5                	mov    %esp,%ebp
 27b:	83 ec 08             	sub    $0x8,%esp
//    printf(1,"\n n = %d\n",n);
    n++;
 27e:	a1 a8 12 00 00       	mov    0x12a8,%eax
 283:	83 c0 01             	add    $0x1,%eax
 286:	a3 a8 12 00 00       	mov    %eax,0x12a8
   // printf(1,"after increase by 1 , n = %d\n\n",n);
    texit();
 28b:	e8 10 03 00 00       	call   5a0 <texit>

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
 2c1:	90                   	nop
 2c2:	8b 45 08             	mov    0x8(%ebp),%eax
 2c5:	8d 50 01             	lea    0x1(%eax),%edx
 2c8:	89 55 08             	mov    %edx,0x8(%ebp)
 2cb:	8b 55 0c             	mov    0xc(%ebp),%edx
 2ce:	8d 4a 01             	lea    0x1(%edx),%ecx
 2d1:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 2d4:	0f b6 12             	movzbl (%edx),%edx
 2d7:	88 10                	mov    %dl,(%eax)
 2d9:	0f b6 00             	movzbl (%eax),%eax
 2dc:	84 c0                	test   %al,%al
 2de:	75 e2                	jne    2c2 <strcpy+0xd>
    ;
  return os;
 2e0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    

000002e5 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 2e8:	eb 08                	jmp    2f2 <strcmp+0xd>
    p++, q++;
 2ea:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2ee:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 2f2:	8b 45 08             	mov    0x8(%ebp),%eax
 2f5:	0f b6 00             	movzbl (%eax),%eax
 2f8:	84 c0                	test   %al,%al
 2fa:	74 10                	je     30c <strcmp+0x27>
 2fc:	8b 45 08             	mov    0x8(%ebp),%eax
 2ff:	0f b6 10             	movzbl (%eax),%edx
 302:	8b 45 0c             	mov    0xc(%ebp),%eax
 305:	0f b6 00             	movzbl (%eax),%eax
 308:	38 c2                	cmp    %al,%dl
 30a:	74 de                	je     2ea <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 30c:	8b 45 08             	mov    0x8(%ebp),%eax
 30f:	0f b6 00             	movzbl (%eax),%eax
 312:	0f b6 d0             	movzbl %al,%edx
 315:	8b 45 0c             	mov    0xc(%ebp),%eax
 318:	0f b6 00             	movzbl (%eax),%eax
 31b:	0f b6 c0             	movzbl %al,%eax
 31e:	29 c2                	sub    %eax,%edx
 320:	89 d0                	mov    %edx,%eax
}
 322:	5d                   	pop    %ebp
 323:	c3                   	ret    

00000324 <strlen>:

uint
strlen(char *s)
{
 324:	55                   	push   %ebp
 325:	89 e5                	mov    %esp,%ebp
 327:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 32a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 331:	eb 04                	jmp    337 <strlen+0x13>
 333:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 337:	8b 55 fc             	mov    -0x4(%ebp),%edx
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
 33d:	01 d0                	add    %edx,%eax
 33f:	0f b6 00             	movzbl (%eax),%eax
 342:	84 c0                	test   %al,%al
 344:	75 ed                	jne    333 <strlen+0xf>
    ;
  return n;
 346:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 349:	c9                   	leave  
 34a:	c3                   	ret    

0000034b <memset>:

void*
memset(void *dst, int c, uint n)
{
 34b:	55                   	push   %ebp
 34c:	89 e5                	mov    %esp,%ebp
 34e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 351:	8b 45 10             	mov    0x10(%ebp),%eax
 354:	89 44 24 08          	mov    %eax,0x8(%esp)
 358:	8b 45 0c             	mov    0xc(%ebp),%eax
 35b:	89 44 24 04          	mov    %eax,0x4(%esp)
 35f:	8b 45 08             	mov    0x8(%ebp),%eax
 362:	89 04 24             	mov    %eax,(%esp)
 365:	e8 26 ff ff ff       	call   290 <stosb>
  return dst;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36d:	c9                   	leave  
 36e:	c3                   	ret    

0000036f <strchr>:

char*
strchr(const char *s, char c)
{
 36f:	55                   	push   %ebp
 370:	89 e5                	mov    %esp,%ebp
 372:	83 ec 04             	sub    $0x4,%esp
 375:	8b 45 0c             	mov    0xc(%ebp),%eax
 378:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 37b:	eb 14                	jmp    391 <strchr+0x22>
    if(*s == c)
 37d:	8b 45 08             	mov    0x8(%ebp),%eax
 380:	0f b6 00             	movzbl (%eax),%eax
 383:	3a 45 fc             	cmp    -0x4(%ebp),%al
 386:	75 05                	jne    38d <strchr+0x1e>
      return (char*)s;
 388:	8b 45 08             	mov    0x8(%ebp),%eax
 38b:	eb 13                	jmp    3a0 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 38d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 391:	8b 45 08             	mov    0x8(%ebp),%eax
 394:	0f b6 00             	movzbl (%eax),%eax
 397:	84 c0                	test   %al,%al
 399:	75 e2                	jne    37d <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 39b:	b8 00 00 00 00       	mov    $0x0,%eax
}
 3a0:	c9                   	leave  
 3a1:	c3                   	ret    

000003a2 <gets>:

char*
gets(char *buf, int max)
{
 3a2:	55                   	push   %ebp
 3a3:	89 e5                	mov    %esp,%ebp
 3a5:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 3af:	eb 4c                	jmp    3fd <gets+0x5b>
    cc = read(0, &c, 1);
 3b1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 3b8:	00 
 3b9:	8d 45 ef             	lea    -0x11(%ebp),%eax
 3bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 3c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 3c7:	e8 44 01 00 00       	call   510 <read>
 3cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 3cf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 3d3:	7f 02                	jg     3d7 <gets+0x35>
      break;
 3d5:	eb 31                	jmp    408 <gets+0x66>
    buf[i++] = c;
 3d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3da:	8d 50 01             	lea    0x1(%eax),%edx
 3dd:	89 55 f4             	mov    %edx,-0xc(%ebp)
 3e0:	89 c2                	mov    %eax,%edx
 3e2:	8b 45 08             	mov    0x8(%ebp),%eax
 3e5:	01 c2                	add    %eax,%edx
 3e7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3eb:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 3ed:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3f1:	3c 0a                	cmp    $0xa,%al
 3f3:	74 13                	je     408 <gets+0x66>
 3f5:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 3f9:	3c 0d                	cmp    $0xd,%al
 3fb:	74 0b                	je     408 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 3fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 400:	83 c0 01             	add    $0x1,%eax
 403:	3b 45 0c             	cmp    0xc(%ebp),%eax
 406:	7c a9                	jl     3b1 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 408:	8b 55 f4             	mov    -0xc(%ebp),%edx
 40b:	8b 45 08             	mov    0x8(%ebp),%eax
 40e:	01 d0                	add    %edx,%eax
 410:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 413:	8b 45 08             	mov    0x8(%ebp),%eax
}
 416:	c9                   	leave  
 417:	c3                   	ret    

00000418 <stat>:

int
stat(char *n, struct stat *st)
{
 418:	55                   	push   %ebp
 419:	89 e5                	mov    %esp,%ebp
 41b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 41e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 425:	00 
 426:	8b 45 08             	mov    0x8(%ebp),%eax
 429:	89 04 24             	mov    %eax,(%esp)
 42c:	e8 07 01 00 00       	call   538 <open>
 431:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 434:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 438:	79 07                	jns    441 <stat+0x29>
    return -1;
 43a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 43f:	eb 23                	jmp    464 <stat+0x4c>
  r = fstat(fd, st);
 441:	8b 45 0c             	mov    0xc(%ebp),%eax
 444:	89 44 24 04          	mov    %eax,0x4(%esp)
 448:	8b 45 f4             	mov    -0xc(%ebp),%eax
 44b:	89 04 24             	mov    %eax,(%esp)
 44e:	e8 fd 00 00 00       	call   550 <fstat>
 453:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 456:	8b 45 f4             	mov    -0xc(%ebp),%eax
 459:	89 04 24             	mov    %eax,(%esp)
 45c:	e8 bf 00 00 00       	call   520 <close>
  return r;
 461:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 464:	c9                   	leave  
 465:	c3                   	ret    

00000466 <atoi>:

int
atoi(const char *s)
{
 466:	55                   	push   %ebp
 467:	89 e5                	mov    %esp,%ebp
 469:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 46c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 473:	eb 25                	jmp    49a <atoi+0x34>
    n = n*10 + *s++ - '0';
 475:	8b 55 fc             	mov    -0x4(%ebp),%edx
 478:	89 d0                	mov    %edx,%eax
 47a:	c1 e0 02             	shl    $0x2,%eax
 47d:	01 d0                	add    %edx,%eax
 47f:	01 c0                	add    %eax,%eax
 481:	89 c1                	mov    %eax,%ecx
 483:	8b 45 08             	mov    0x8(%ebp),%eax
 486:	8d 50 01             	lea    0x1(%eax),%edx
 489:	89 55 08             	mov    %edx,0x8(%ebp)
 48c:	0f b6 00             	movzbl (%eax),%eax
 48f:	0f be c0             	movsbl %al,%eax
 492:	01 c8                	add    %ecx,%eax
 494:	83 e8 30             	sub    $0x30,%eax
 497:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 49a:	8b 45 08             	mov    0x8(%ebp),%eax
 49d:	0f b6 00             	movzbl (%eax),%eax
 4a0:	3c 2f                	cmp    $0x2f,%al
 4a2:	7e 0a                	jle    4ae <atoi+0x48>
 4a4:	8b 45 08             	mov    0x8(%ebp),%eax
 4a7:	0f b6 00             	movzbl (%eax),%eax
 4aa:	3c 39                	cmp    $0x39,%al
 4ac:	7e c7                	jle    475 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 4ae:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 4b1:	c9                   	leave  
 4b2:	c3                   	ret    

000004b3 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 4b3:	55                   	push   %ebp
 4b4:	89 e5                	mov    %esp,%ebp
 4b6:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 4b9:	8b 45 08             	mov    0x8(%ebp),%eax
 4bc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 4bf:	8b 45 0c             	mov    0xc(%ebp),%eax
 4c2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 4c5:	eb 17                	jmp    4de <memmove+0x2b>
    *dst++ = *src++;
 4c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 4ca:	8d 50 01             	lea    0x1(%eax),%edx
 4cd:	89 55 fc             	mov    %edx,-0x4(%ebp)
 4d0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 4d3:	8d 4a 01             	lea    0x1(%edx),%ecx
 4d6:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 4d9:	0f b6 12             	movzbl (%edx),%edx
 4dc:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 4de:	8b 45 10             	mov    0x10(%ebp),%eax
 4e1:	8d 50 ff             	lea    -0x1(%eax),%edx
 4e4:	89 55 10             	mov    %edx,0x10(%ebp)
 4e7:	85 c0                	test   %eax,%eax
 4e9:	7f dc                	jg     4c7 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 4eb:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4ee:	c9                   	leave  
 4ef:	c3                   	ret    

000004f0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 4f0:	b8 01 00 00 00       	mov    $0x1,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <exit>:
SYSCALL(exit)
 4f8:	b8 02 00 00 00       	mov    $0x2,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <wait>:
SYSCALL(wait)
 500:	b8 03 00 00 00       	mov    $0x3,%eax
 505:	cd 40                	int    $0x40
 507:	c3                   	ret    

00000508 <pipe>:
SYSCALL(pipe)
 508:	b8 04 00 00 00       	mov    $0x4,%eax
 50d:	cd 40                	int    $0x40
 50f:	c3                   	ret    

00000510 <read>:
SYSCALL(read)
 510:	b8 05 00 00 00       	mov    $0x5,%eax
 515:	cd 40                	int    $0x40
 517:	c3                   	ret    

00000518 <write>:
SYSCALL(write)
 518:	b8 10 00 00 00       	mov    $0x10,%eax
 51d:	cd 40                	int    $0x40
 51f:	c3                   	ret    

00000520 <close>:
SYSCALL(close)
 520:	b8 15 00 00 00       	mov    $0x15,%eax
 525:	cd 40                	int    $0x40
 527:	c3                   	ret    

00000528 <kill>:
SYSCALL(kill)
 528:	b8 06 00 00 00       	mov    $0x6,%eax
 52d:	cd 40                	int    $0x40
 52f:	c3                   	ret    

00000530 <exec>:
SYSCALL(exec)
 530:	b8 07 00 00 00       	mov    $0x7,%eax
 535:	cd 40                	int    $0x40
 537:	c3                   	ret    

00000538 <open>:
SYSCALL(open)
 538:	b8 0f 00 00 00       	mov    $0xf,%eax
 53d:	cd 40                	int    $0x40
 53f:	c3                   	ret    

00000540 <mknod>:
SYSCALL(mknod)
 540:	b8 11 00 00 00       	mov    $0x11,%eax
 545:	cd 40                	int    $0x40
 547:	c3                   	ret    

00000548 <unlink>:
SYSCALL(unlink)
 548:	b8 12 00 00 00       	mov    $0x12,%eax
 54d:	cd 40                	int    $0x40
 54f:	c3                   	ret    

00000550 <fstat>:
SYSCALL(fstat)
 550:	b8 08 00 00 00       	mov    $0x8,%eax
 555:	cd 40                	int    $0x40
 557:	c3                   	ret    

00000558 <link>:
SYSCALL(link)
 558:	b8 13 00 00 00       	mov    $0x13,%eax
 55d:	cd 40                	int    $0x40
 55f:	c3                   	ret    

00000560 <mkdir>:
SYSCALL(mkdir)
 560:	b8 14 00 00 00       	mov    $0x14,%eax
 565:	cd 40                	int    $0x40
 567:	c3                   	ret    

00000568 <chdir>:
SYSCALL(chdir)
 568:	b8 09 00 00 00       	mov    $0x9,%eax
 56d:	cd 40                	int    $0x40
 56f:	c3                   	ret    

00000570 <dup>:
SYSCALL(dup)
 570:	b8 0a 00 00 00       	mov    $0xa,%eax
 575:	cd 40                	int    $0x40
 577:	c3                   	ret    

00000578 <getpid>:
SYSCALL(getpid)
 578:	b8 0b 00 00 00       	mov    $0xb,%eax
 57d:	cd 40                	int    $0x40
 57f:	c3                   	ret    

00000580 <sbrk>:
SYSCALL(sbrk)
 580:	b8 0c 00 00 00       	mov    $0xc,%eax
 585:	cd 40                	int    $0x40
 587:	c3                   	ret    

00000588 <sleep>:
SYSCALL(sleep)
 588:	b8 0d 00 00 00       	mov    $0xd,%eax
 58d:	cd 40                	int    $0x40
 58f:	c3                   	ret    

00000590 <uptime>:
SYSCALL(uptime)
 590:	b8 0e 00 00 00       	mov    $0xe,%eax
 595:	cd 40                	int    $0x40
 597:	c3                   	ret    

00000598 <clone>:
SYSCALL(clone)
 598:	b8 16 00 00 00       	mov    $0x16,%eax
 59d:	cd 40                	int    $0x40
 59f:	c3                   	ret    

000005a0 <texit>:
SYSCALL(texit)
 5a0:	b8 17 00 00 00       	mov    $0x17,%eax
 5a5:	cd 40                	int    $0x40
 5a7:	c3                   	ret    

000005a8 <tsleep>:
SYSCALL(tsleep)
 5a8:	b8 18 00 00 00       	mov    $0x18,%eax
 5ad:	cd 40                	int    $0x40
 5af:	c3                   	ret    

000005b0 <twakeup>:
SYSCALL(twakeup)
 5b0:	b8 19 00 00 00       	mov    $0x19,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <test>:
SYSCALL(test)
 5b8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 5c0:	55                   	push   %ebp
 5c1:	89 e5                	mov    %esp,%ebp
 5c3:	83 ec 18             	sub    $0x18,%esp
 5c6:	8b 45 0c             	mov    0xc(%ebp),%eax
 5c9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 5cc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 5d3:	00 
 5d4:	8d 45 f4             	lea    -0xc(%ebp),%eax
 5d7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5db:	8b 45 08             	mov    0x8(%ebp),%eax
 5de:	89 04 24             	mov    %eax,(%esp)
 5e1:	e8 32 ff ff ff       	call   518 <write>
}
 5e6:	c9                   	leave  
 5e7:	c3                   	ret    

000005e8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 5e8:	55                   	push   %ebp
 5e9:	89 e5                	mov    %esp,%ebp
 5eb:	56                   	push   %esi
 5ec:	53                   	push   %ebx
 5ed:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 5f0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 5f7:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 5fb:	74 17                	je     614 <printint+0x2c>
 5fd:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 601:	79 11                	jns    614 <printint+0x2c>
    neg = 1;
 603:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 60a:	8b 45 0c             	mov    0xc(%ebp),%eax
 60d:	f7 d8                	neg    %eax
 60f:	89 45 ec             	mov    %eax,-0x14(%ebp)
 612:	eb 06                	jmp    61a <printint+0x32>
  } else {
    x = xx;
 614:	8b 45 0c             	mov    0xc(%ebp),%eax
 617:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 61a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 621:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 624:	8d 41 01             	lea    0x1(%ecx),%eax
 627:	89 45 f4             	mov    %eax,-0xc(%ebp)
 62a:	8b 5d 10             	mov    0x10(%ebp),%ebx
 62d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 630:	ba 00 00 00 00       	mov    $0x0,%edx
 635:	f7 f3                	div    %ebx
 637:	89 d0                	mov    %edx,%eax
 639:	0f b6 80 ac 12 00 00 	movzbl 0x12ac(%eax),%eax
 640:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 644:	8b 75 10             	mov    0x10(%ebp),%esi
 647:	8b 45 ec             	mov    -0x14(%ebp),%eax
 64a:	ba 00 00 00 00       	mov    $0x0,%edx
 64f:	f7 f6                	div    %esi
 651:	89 45 ec             	mov    %eax,-0x14(%ebp)
 654:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 658:	75 c7                	jne    621 <printint+0x39>
  if(neg)
 65a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 65e:	74 10                	je     670 <printint+0x88>
    buf[i++] = '-';
 660:	8b 45 f4             	mov    -0xc(%ebp),%eax
 663:	8d 50 01             	lea    0x1(%eax),%edx
 666:	89 55 f4             	mov    %edx,-0xc(%ebp)
 669:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 66e:	eb 1f                	jmp    68f <printint+0xa7>
 670:	eb 1d                	jmp    68f <printint+0xa7>
    putc(fd, buf[i]);
 672:	8d 55 dc             	lea    -0x24(%ebp),%edx
 675:	8b 45 f4             	mov    -0xc(%ebp),%eax
 678:	01 d0                	add    %edx,%eax
 67a:	0f b6 00             	movzbl (%eax),%eax
 67d:	0f be c0             	movsbl %al,%eax
 680:	89 44 24 04          	mov    %eax,0x4(%esp)
 684:	8b 45 08             	mov    0x8(%ebp),%eax
 687:	89 04 24             	mov    %eax,(%esp)
 68a:	e8 31 ff ff ff       	call   5c0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 68f:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 693:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 697:	79 d9                	jns    672 <printint+0x8a>
    putc(fd, buf[i]);
}
 699:	83 c4 30             	add    $0x30,%esp
 69c:	5b                   	pop    %ebx
 69d:	5e                   	pop    %esi
 69e:	5d                   	pop    %ebp
 69f:	c3                   	ret    

000006a0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 6a0:	55                   	push   %ebp
 6a1:	89 e5                	mov    %esp,%ebp
 6a3:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 6a6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 6ad:	8d 45 0c             	lea    0xc(%ebp),%eax
 6b0:	83 c0 04             	add    $0x4,%eax
 6b3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 6b6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 6bd:	e9 7c 01 00 00       	jmp    83e <printf+0x19e>
    c = fmt[i] & 0xff;
 6c2:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6c8:	01 d0                	add    %edx,%eax
 6ca:	0f b6 00             	movzbl (%eax),%eax
 6cd:	0f be c0             	movsbl %al,%eax
 6d0:	25 ff 00 00 00       	and    $0xff,%eax
 6d5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 6d8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 6dc:	75 2c                	jne    70a <printf+0x6a>
      if(c == '%'){
 6de:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 6e2:	75 0c                	jne    6f0 <printf+0x50>
        state = '%';
 6e4:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 6eb:	e9 4a 01 00 00       	jmp    83a <printf+0x19a>
      } else {
        putc(fd, c);
 6f0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6f3:	0f be c0             	movsbl %al,%eax
 6f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 6fa:	8b 45 08             	mov    0x8(%ebp),%eax
 6fd:	89 04 24             	mov    %eax,(%esp)
 700:	e8 bb fe ff ff       	call   5c0 <putc>
 705:	e9 30 01 00 00       	jmp    83a <printf+0x19a>
      }
    } else if(state == '%'){
 70a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 70e:	0f 85 26 01 00 00    	jne    83a <printf+0x19a>
      if(c == 'd'){
 714:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 718:	75 2d                	jne    747 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 71a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 71d:	8b 00                	mov    (%eax),%eax
 71f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 726:	00 
 727:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 72e:	00 
 72f:	89 44 24 04          	mov    %eax,0x4(%esp)
 733:	8b 45 08             	mov    0x8(%ebp),%eax
 736:	89 04 24             	mov    %eax,(%esp)
 739:	e8 aa fe ff ff       	call   5e8 <printint>
        ap++;
 73e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 742:	e9 ec 00 00 00       	jmp    833 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 747:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 74b:	74 06                	je     753 <printf+0xb3>
 74d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 751:	75 2d                	jne    780 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 753:	8b 45 e8             	mov    -0x18(%ebp),%eax
 756:	8b 00                	mov    (%eax),%eax
 758:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 75f:	00 
 760:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 767:	00 
 768:	89 44 24 04          	mov    %eax,0x4(%esp)
 76c:	8b 45 08             	mov    0x8(%ebp),%eax
 76f:	89 04 24             	mov    %eax,(%esp)
 772:	e8 71 fe ff ff       	call   5e8 <printint>
        ap++;
 777:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 77b:	e9 b3 00 00 00       	jmp    833 <printf+0x193>
      } else if(c == 's'){
 780:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 784:	75 45                	jne    7cb <printf+0x12b>
        s = (char*)*ap;
 786:	8b 45 e8             	mov    -0x18(%ebp),%eax
 789:	8b 00                	mov    (%eax),%eax
 78b:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 78e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 792:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 796:	75 09                	jne    7a1 <printf+0x101>
          s = "(null)";
 798:	c7 45 f4 55 0e 00 00 	movl   $0xe55,-0xc(%ebp)
        while(*s != 0){
 79f:	eb 1e                	jmp    7bf <printf+0x11f>
 7a1:	eb 1c                	jmp    7bf <printf+0x11f>
          putc(fd, *s);
 7a3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7a6:	0f b6 00             	movzbl (%eax),%eax
 7a9:	0f be c0             	movsbl %al,%eax
 7ac:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b0:	8b 45 08             	mov    0x8(%ebp),%eax
 7b3:	89 04 24             	mov    %eax,(%esp)
 7b6:	e8 05 fe ff ff       	call   5c0 <putc>
          s++;
 7bb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 7bf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c2:	0f b6 00             	movzbl (%eax),%eax
 7c5:	84 c0                	test   %al,%al
 7c7:	75 da                	jne    7a3 <printf+0x103>
 7c9:	eb 68                	jmp    833 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 7cb:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 7cf:	75 1d                	jne    7ee <printf+0x14e>
        putc(fd, *ap);
 7d1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7d4:	8b 00                	mov    (%eax),%eax
 7d6:	0f be c0             	movsbl %al,%eax
 7d9:	89 44 24 04          	mov    %eax,0x4(%esp)
 7dd:	8b 45 08             	mov    0x8(%ebp),%eax
 7e0:	89 04 24             	mov    %eax,(%esp)
 7e3:	e8 d8 fd ff ff       	call   5c0 <putc>
        ap++;
 7e8:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 7ec:	eb 45                	jmp    833 <printf+0x193>
      } else if(c == '%'){
 7ee:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7f2:	75 17                	jne    80b <printf+0x16b>
        putc(fd, c);
 7f4:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7f7:	0f be c0             	movsbl %al,%eax
 7fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 7fe:	8b 45 08             	mov    0x8(%ebp),%eax
 801:	89 04 24             	mov    %eax,(%esp)
 804:	e8 b7 fd ff ff       	call   5c0 <putc>
 809:	eb 28                	jmp    833 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 80b:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 812:	00 
 813:	8b 45 08             	mov    0x8(%ebp),%eax
 816:	89 04 24             	mov    %eax,(%esp)
 819:	e8 a2 fd ff ff       	call   5c0 <putc>
        putc(fd, c);
 81e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 821:	0f be c0             	movsbl %al,%eax
 824:	89 44 24 04          	mov    %eax,0x4(%esp)
 828:	8b 45 08             	mov    0x8(%ebp),%eax
 82b:	89 04 24             	mov    %eax,(%esp)
 82e:	e8 8d fd ff ff       	call   5c0 <putc>
      }
      state = 0;
 833:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 83a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 83e:	8b 55 0c             	mov    0xc(%ebp),%edx
 841:	8b 45 f0             	mov    -0x10(%ebp),%eax
 844:	01 d0                	add    %edx,%eax
 846:	0f b6 00             	movzbl (%eax),%eax
 849:	84 c0                	test   %al,%al
 84b:	0f 85 71 fe ff ff    	jne    6c2 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 851:	c9                   	leave  
 852:	c3                   	ret    

00000853 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 853:	55                   	push   %ebp
 854:	89 e5                	mov    %esp,%ebp
 856:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 859:	8b 45 08             	mov    0x8(%ebp),%eax
 85c:	83 e8 08             	sub    $0x8,%eax
 85f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 862:	a1 cc 12 00 00       	mov    0x12cc,%eax
 867:	89 45 fc             	mov    %eax,-0x4(%ebp)
 86a:	eb 24                	jmp    890 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 86c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86f:	8b 00                	mov    (%eax),%eax
 871:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 874:	77 12                	ja     888 <free+0x35>
 876:	8b 45 f8             	mov    -0x8(%ebp),%eax
 879:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 87c:	77 24                	ja     8a2 <free+0x4f>
 87e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 881:	8b 00                	mov    (%eax),%eax
 883:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 886:	77 1a                	ja     8a2 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 888:	8b 45 fc             	mov    -0x4(%ebp),%eax
 88b:	8b 00                	mov    (%eax),%eax
 88d:	89 45 fc             	mov    %eax,-0x4(%ebp)
 890:	8b 45 f8             	mov    -0x8(%ebp),%eax
 893:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 896:	76 d4                	jbe    86c <free+0x19>
 898:	8b 45 fc             	mov    -0x4(%ebp),%eax
 89b:	8b 00                	mov    (%eax),%eax
 89d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 8a0:	76 ca                	jbe    86c <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 8a2:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8a5:	8b 40 04             	mov    0x4(%eax),%eax
 8a8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8af:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8b2:	01 c2                	add    %eax,%edx
 8b4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8b7:	8b 00                	mov    (%eax),%eax
 8b9:	39 c2                	cmp    %eax,%edx
 8bb:	75 24                	jne    8e1 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 8bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8c0:	8b 50 04             	mov    0x4(%eax),%edx
 8c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8c6:	8b 00                	mov    (%eax),%eax
 8c8:	8b 40 04             	mov    0x4(%eax),%eax
 8cb:	01 c2                	add    %eax,%edx
 8cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8d0:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 8d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8d6:	8b 00                	mov    (%eax),%eax
 8d8:	8b 10                	mov    (%eax),%edx
 8da:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8dd:	89 10                	mov    %edx,(%eax)
 8df:	eb 0a                	jmp    8eb <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 8e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8e4:	8b 10                	mov    (%eax),%edx
 8e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 8e9:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 8eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8ee:	8b 40 04             	mov    0x4(%eax),%eax
 8f1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 8f8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 8fb:	01 d0                	add    %edx,%eax
 8fd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 900:	75 20                	jne    922 <free+0xcf>
    p->s.size += bp->s.size;
 902:	8b 45 fc             	mov    -0x4(%ebp),%eax
 905:	8b 50 04             	mov    0x4(%eax),%edx
 908:	8b 45 f8             	mov    -0x8(%ebp),%eax
 90b:	8b 40 04             	mov    0x4(%eax),%eax
 90e:	01 c2                	add    %eax,%edx
 910:	8b 45 fc             	mov    -0x4(%ebp),%eax
 913:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 916:	8b 45 f8             	mov    -0x8(%ebp),%eax
 919:	8b 10                	mov    (%eax),%edx
 91b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 91e:	89 10                	mov    %edx,(%eax)
 920:	eb 08                	jmp    92a <free+0xd7>
  } else
    p->s.ptr = bp;
 922:	8b 45 fc             	mov    -0x4(%ebp),%eax
 925:	8b 55 f8             	mov    -0x8(%ebp),%edx
 928:	89 10                	mov    %edx,(%eax)
  freep = p;
 92a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92d:	a3 cc 12 00 00       	mov    %eax,0x12cc
}
 932:	c9                   	leave  
 933:	c3                   	ret    

00000934 <morecore>:

static Header*
morecore(uint nu)
{
 934:	55                   	push   %ebp
 935:	89 e5                	mov    %esp,%ebp
 937:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 93a:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 941:	77 07                	ja     94a <morecore+0x16>
    nu = 4096;
 943:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 94a:	8b 45 08             	mov    0x8(%ebp),%eax
 94d:	c1 e0 03             	shl    $0x3,%eax
 950:	89 04 24             	mov    %eax,(%esp)
 953:	e8 28 fc ff ff       	call   580 <sbrk>
 958:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 95b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 95f:	75 07                	jne    968 <morecore+0x34>
    return 0;
 961:	b8 00 00 00 00       	mov    $0x0,%eax
 966:	eb 22                	jmp    98a <morecore+0x56>
  hp = (Header*)p;
 968:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 96e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 971:	8b 55 08             	mov    0x8(%ebp),%edx
 974:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 977:	8b 45 f0             	mov    -0x10(%ebp),%eax
 97a:	83 c0 08             	add    $0x8,%eax
 97d:	89 04 24             	mov    %eax,(%esp)
 980:	e8 ce fe ff ff       	call   853 <free>
  return freep;
 985:	a1 cc 12 00 00       	mov    0x12cc,%eax
}
 98a:	c9                   	leave  
 98b:	c3                   	ret    

0000098c <malloc>:

void*
malloc(uint nbytes)
{
 98c:	55                   	push   %ebp
 98d:	89 e5                	mov    %esp,%ebp
 98f:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 992:	8b 45 08             	mov    0x8(%ebp),%eax
 995:	83 c0 07             	add    $0x7,%eax
 998:	c1 e8 03             	shr    $0x3,%eax
 99b:	83 c0 01             	add    $0x1,%eax
 99e:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 9a1:	a1 cc 12 00 00       	mov    0x12cc,%eax
 9a6:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9a9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9ad:	75 23                	jne    9d2 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 9af:	c7 45 f0 c4 12 00 00 	movl   $0x12c4,-0x10(%ebp)
 9b6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b9:	a3 cc 12 00 00       	mov    %eax,0x12cc
 9be:	a1 cc 12 00 00       	mov    0x12cc,%eax
 9c3:	a3 c4 12 00 00       	mov    %eax,0x12c4
    base.s.size = 0;
 9c8:	c7 05 c8 12 00 00 00 	movl   $0x0,0x12c8
 9cf:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9d5:	8b 00                	mov    (%eax),%eax
 9d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 9da:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9dd:	8b 40 04             	mov    0x4(%eax),%eax
 9e0:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9e3:	72 4d                	jb     a32 <malloc+0xa6>
      if(p->s.size == nunits)
 9e5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e8:	8b 40 04             	mov    0x4(%eax),%eax
 9eb:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 9ee:	75 0c                	jne    9fc <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 9f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9f3:	8b 10                	mov    (%eax),%edx
 9f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f8:	89 10                	mov    %edx,(%eax)
 9fa:	eb 26                	jmp    a22 <malloc+0x96>
      else {
        p->s.size -= nunits;
 9fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9ff:	8b 40 04             	mov    0x4(%eax),%eax
 a02:	2b 45 ec             	sub    -0x14(%ebp),%eax
 a05:	89 c2                	mov    %eax,%edx
 a07:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 a0d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a10:	8b 40 04             	mov    0x4(%eax),%eax
 a13:	c1 e0 03             	shl    $0x3,%eax
 a16:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 a19:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a1c:	8b 55 ec             	mov    -0x14(%ebp),%edx
 a1f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 a22:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a25:	a3 cc 12 00 00       	mov    %eax,0x12cc
      return (void*)(p + 1);
 a2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2d:	83 c0 08             	add    $0x8,%eax
 a30:	eb 38                	jmp    a6a <malloc+0xde>
    }
    if(p == freep)
 a32:	a1 cc 12 00 00       	mov    0x12cc,%eax
 a37:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 a3a:	75 1b                	jne    a57 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 a3c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a3f:	89 04 24             	mov    %eax,(%esp)
 a42:	e8 ed fe ff ff       	call   934 <morecore>
 a47:	89 45 f4             	mov    %eax,-0xc(%ebp)
 a4a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a4e:	75 07                	jne    a57 <malloc+0xcb>
        return 0;
 a50:	b8 00 00 00 00       	mov    $0x0,%eax
 a55:	eb 13                	jmp    a6a <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a57:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5a:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a60:	8b 00                	mov    (%eax),%eax
 a62:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 a65:	e9 70 ff ff ff       	jmp    9da <malloc+0x4e>
}
 a6a:	c9                   	leave  
 a6b:	c3                   	ret    

00000a6c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 a6c:	55                   	push   %ebp
 a6d:	89 e5                	mov    %esp,%ebp
 a6f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 a72:	8b 55 08             	mov    0x8(%ebp),%edx
 a75:	8b 45 0c             	mov    0xc(%ebp),%eax
 a78:	8b 4d 08             	mov    0x8(%ebp),%ecx
 a7b:	f0 87 02             	lock xchg %eax,(%edx)
 a7e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 a81:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 a84:	c9                   	leave  
 a85:	c3                   	ret    

00000a86 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 a86:	55                   	push   %ebp
 a87:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 a89:	8b 45 08             	mov    0x8(%ebp),%eax
 a8c:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 a92:	5d                   	pop    %ebp
 a93:	c3                   	ret    

00000a94 <lock_acquire>:
void lock_acquire(lock_t *lock){
 a94:	55                   	push   %ebp
 a95:	89 e5                	mov    %esp,%ebp
 a97:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 a9a:	90                   	nop
 a9b:	8b 45 08             	mov    0x8(%ebp),%eax
 a9e:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 aa5:	00 
 aa6:	89 04 24             	mov    %eax,(%esp)
 aa9:	e8 be ff ff ff       	call   a6c <xchg>
 aae:	85 c0                	test   %eax,%eax
 ab0:	75 e9                	jne    a9b <lock_acquire+0x7>
}
 ab2:	c9                   	leave  
 ab3:	c3                   	ret    

00000ab4 <lock_release>:
void lock_release(lock_t *lock){
 ab4:	55                   	push   %ebp
 ab5:	89 e5                	mov    %esp,%ebp
 ab7:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 aba:	8b 45 08             	mov    0x8(%ebp),%eax
 abd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 ac4:	00 
 ac5:	89 04 24             	mov    %eax,(%esp)
 ac8:	e8 9f ff ff ff       	call   a6c <xchg>
}
 acd:	c9                   	leave  
 ace:	c3                   	ret    

00000acf <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 acf:	55                   	push   %ebp
 ad0:	89 e5                	mov    %esp,%ebp
 ad2:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 ad5:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 adc:	e8 ab fe ff ff       	call   98c <malloc>
 ae1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 ae4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae7:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 aea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aed:	25 ff 0f 00 00       	and    $0xfff,%eax
 af2:	85 c0                	test   %eax,%eax
 af4:	74 14                	je     b0a <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 af6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af9:	25 ff 0f 00 00       	and    $0xfff,%eax
 afe:	89 c2                	mov    %eax,%edx
 b00:	b8 00 10 00 00       	mov    $0x1000,%eax
 b05:	29 d0                	sub    %edx,%eax
 b07:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 b0a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b0e:	75 1b                	jne    b2b <thread_create+0x5c>

        printf(1,"malloc fail \n");
 b10:	c7 44 24 04 5c 0e 00 	movl   $0xe5c,0x4(%esp)
 b17:	00 
 b18:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b1f:	e8 7c fb ff ff       	call   6a0 <printf>
        return 0;
 b24:	b8 00 00 00 00       	mov    $0x0,%eax
 b29:	eb 6f                	jmp    b9a <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 b2b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 b2e:	8b 55 08             	mov    0x8(%ebp),%edx
 b31:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b34:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 b38:	89 54 24 08          	mov    %edx,0x8(%esp)
 b3c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 b43:	00 
 b44:	89 04 24             	mov    %eax,(%esp)
 b47:	e8 4c fa ff ff       	call   598 <clone>
 b4c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 b4f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b53:	79 1b                	jns    b70 <thread_create+0xa1>
        printf(1,"clone fails\n");
 b55:	c7 44 24 04 6a 0e 00 	movl   $0xe6a,0x4(%esp)
 b5c:	00 
 b5d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b64:	e8 37 fb ff ff       	call   6a0 <printf>
        return 0;
 b69:	b8 00 00 00 00       	mov    $0x0,%eax
 b6e:	eb 2a                	jmp    b9a <thread_create+0xcb>
    }
    if(tid > 0){
 b70:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b74:	7e 05                	jle    b7b <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 b76:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b79:	eb 1f                	jmp    b9a <thread_create+0xcb>
    }
    if(tid == 0){
 b7b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b7f:	75 14                	jne    b95 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 b81:	c7 44 24 04 77 0e 00 	movl   $0xe77,0x4(%esp)
 b88:	00 
 b89:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b90:	e8 0b fb ff ff       	call   6a0 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 b95:	b8 00 00 00 00       	mov    $0x0,%eax
}
 b9a:	c9                   	leave  
 b9b:	c3                   	ret    

00000b9c <random>:

unsigned long rands = 1;
// generate 0 -> max random number exclude max.
int random(int max){
 b9c:	55                   	push   %ebp
 b9d:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
 b9f:	a1 c0 12 00 00       	mov    0x12c0,%eax
 ba4:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
 baa:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
 baf:	a3 c0 12 00 00       	mov    %eax,0x12c0
    return (int)(rands % max);
 bb4:	a1 c0 12 00 00       	mov    0x12c0,%eax
 bb9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 bbc:	ba 00 00 00 00       	mov    $0x0,%edx
 bc1:	f7 f1                	div    %ecx
 bc3:	89 d0                	mov    %edx,%eax
 bc5:	5d                   	pop    %ebp
 bc6:	c3                   	ret    

00000bc7 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 bc7:	55                   	push   %ebp
 bc8:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 bca:	8b 45 08             	mov    0x8(%ebp),%eax
 bcd:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 bd3:	8b 45 08             	mov    0x8(%ebp),%eax
 bd6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 bdd:	8b 45 08             	mov    0x8(%ebp),%eax
 be0:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 be7:	5d                   	pop    %ebp
 be8:	c3                   	ret    

00000be9 <add_q>:

void add_q(struct queue *q, int v){
 be9:	55                   	push   %ebp
 bea:	89 e5                	mov    %esp,%ebp
 bec:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 bef:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 bf6:	e8 91 fd ff ff       	call   98c <malloc>
 bfb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 bfe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c01:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 c08:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c0b:	8b 55 0c             	mov    0xc(%ebp),%edx
 c0e:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 c10:	8b 45 08             	mov    0x8(%ebp),%eax
 c13:	8b 40 04             	mov    0x4(%eax),%eax
 c16:	85 c0                	test   %eax,%eax
 c18:	75 0b                	jne    c25 <add_q+0x3c>
        q->head = n;
 c1a:	8b 45 08             	mov    0x8(%ebp),%eax
 c1d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c20:	89 50 04             	mov    %edx,0x4(%eax)
 c23:	eb 0c                	jmp    c31 <add_q+0x48>
    }else{
        q->tail->next = n;
 c25:	8b 45 08             	mov    0x8(%ebp),%eax
 c28:	8b 40 08             	mov    0x8(%eax),%eax
 c2b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c2e:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 c31:	8b 45 08             	mov    0x8(%ebp),%eax
 c34:	8b 55 f4             	mov    -0xc(%ebp),%edx
 c37:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 c3a:	8b 45 08             	mov    0x8(%ebp),%eax
 c3d:	8b 00                	mov    (%eax),%eax
 c3f:	8d 50 01             	lea    0x1(%eax),%edx
 c42:	8b 45 08             	mov    0x8(%ebp),%eax
 c45:	89 10                	mov    %edx,(%eax)
}
 c47:	c9                   	leave  
 c48:	c3                   	ret    

00000c49 <empty_q>:

int empty_q(struct queue *q){
 c49:	55                   	push   %ebp
 c4a:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 c4c:	8b 45 08             	mov    0x8(%ebp),%eax
 c4f:	8b 00                	mov    (%eax),%eax
 c51:	85 c0                	test   %eax,%eax
 c53:	75 07                	jne    c5c <empty_q+0x13>
        return 1;
 c55:	b8 01 00 00 00       	mov    $0x1,%eax
 c5a:	eb 05                	jmp    c61 <empty_q+0x18>
    else
        return 0;
 c5c:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 c61:	5d                   	pop    %ebp
 c62:	c3                   	ret    

00000c63 <pop_q>:
int pop_q(struct queue *q){
 c63:	55                   	push   %ebp
 c64:	89 e5                	mov    %esp,%ebp
 c66:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 c69:	8b 45 08             	mov    0x8(%ebp),%eax
 c6c:	89 04 24             	mov    %eax,(%esp)
 c6f:	e8 d5 ff ff ff       	call   c49 <empty_q>
 c74:	85 c0                	test   %eax,%eax
 c76:	75 5d                	jne    cd5 <pop_q+0x72>
       val = q->head->value; 
 c78:	8b 45 08             	mov    0x8(%ebp),%eax
 c7b:	8b 40 04             	mov    0x4(%eax),%eax
 c7e:	8b 00                	mov    (%eax),%eax
 c80:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 c83:	8b 45 08             	mov    0x8(%ebp),%eax
 c86:	8b 40 04             	mov    0x4(%eax),%eax
 c89:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 c8c:	8b 45 08             	mov    0x8(%ebp),%eax
 c8f:	8b 40 04             	mov    0x4(%eax),%eax
 c92:	8b 50 04             	mov    0x4(%eax),%edx
 c95:	8b 45 08             	mov    0x8(%ebp),%eax
 c98:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 c9b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c9e:	89 04 24             	mov    %eax,(%esp)
 ca1:	e8 ad fb ff ff       	call   853 <free>
       q->size--;
 ca6:	8b 45 08             	mov    0x8(%ebp),%eax
 ca9:	8b 00                	mov    (%eax),%eax
 cab:	8d 50 ff             	lea    -0x1(%eax),%edx
 cae:	8b 45 08             	mov    0x8(%ebp),%eax
 cb1:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 cb3:	8b 45 08             	mov    0x8(%ebp),%eax
 cb6:	8b 00                	mov    (%eax),%eax
 cb8:	85 c0                	test   %eax,%eax
 cba:	75 14                	jne    cd0 <pop_q+0x6d>
            q->head = 0;
 cbc:	8b 45 08             	mov    0x8(%ebp),%eax
 cbf:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 cc6:	8b 45 08             	mov    0x8(%ebp),%eax
 cc9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 cd0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cd3:	eb 05                	jmp    cda <pop_q+0x77>
    }
    return -1;
 cd5:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 cda:	c9                   	leave  
 cdb:	c3                   	ret    

00000cdc <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 cdc:	55                   	push   %ebp
 cdd:	89 e5                	mov    %esp,%ebp
 cdf:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 ce2:	8b 45 08             	mov    0x8(%ebp),%eax
 ce5:	8b 55 0c             	mov    0xc(%ebp),%edx
 ce8:	89 50 08             	mov    %edx,0x8(%eax)
	s->count = size;
 ceb:	8b 45 08             	mov    0x8(%ebp),%eax
 cee:	8b 55 0c             	mov    0xc(%ebp),%edx
 cf1:	89 50 04             	mov    %edx,0x4(%eax)
	lock_init(&s->lock);
 cf4:	8b 45 08             	mov    0x8(%ebp),%eax
 cf7:	89 04 24             	mov    %eax,(%esp)
 cfa:	e8 87 fd ff ff       	call   a86 <lock_init>
}
 cff:	c9                   	leave  
 d00:	c3                   	ret    

00000d01 <sem_init_full>:

void 
sem_init_full(struct semaphore *s, int size){
 d01:	55                   	push   %ebp
 d02:	89 e5                	mov    %esp,%ebp
 d04:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 d07:	8b 45 08             	mov    0x8(%ebp),%eax
 d0a:	8b 55 0c             	mov    0xc(%ebp),%edx
 d0d:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 d10:	8b 45 08             	mov    0x8(%ebp),%eax
 d13:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock);
 d1a:	8b 45 08             	mov    0x8(%ebp),%eax
 d1d:	89 04 24             	mov    %eax,(%esp)
 d20:	e8 61 fd ff ff       	call   a86 <lock_init>
}
 d25:	c9                   	leave  
 d26:	c3                   	ret    

00000d27 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 d27:	55                   	push   %ebp
 d28:	89 e5                	mov    %esp,%ebp
 d2a:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 d2d:	8b 45 08             	mov    0x8(%ebp),%eax
 d30:	89 04 24             	mov    %eax,(%esp)
 d33:	e8 5c fd ff ff       	call   a94 <lock_acquire>
	if(s->count  == 0){
 d38:	8b 45 08             	mov    0x8(%ebp),%eax
 d3b:	8b 40 04             	mov    0x4(%eax),%eax
 d3e:	85 c0                	test   %eax,%eax
 d40:	75 2f                	jne    d71 <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
 d42:	e8 31 f8 ff ff       	call   578 <getpid>
 d47:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 d4a:	8b 45 08             	mov    0x8(%ebp),%eax
 d4d:	8d 50 0c             	lea    0xc(%eax),%edx
 d50:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d53:	89 44 24 04          	mov    %eax,0x4(%esp)
 d57:	89 14 24             	mov    %edx,(%esp)
 d5a:	e8 8a fe ff ff       	call   be9 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 d5f:	8b 45 08             	mov    0x8(%ebp),%eax
 d62:	89 04 24             	mov    %eax,(%esp)
 d65:	e8 4a fd ff ff       	call   ab4 <lock_release>
		tsleep(); 
 d6a:	e8 39 f8 ff ff       	call   5a8 <tsleep>
 d6f:	eb 1a                	jmp    d8b <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
 d71:	8b 45 08             	mov    0x8(%ebp),%eax
 d74:	8b 40 04             	mov    0x4(%eax),%eax
 d77:	8d 50 ff             	lea    -0x1(%eax),%edx
 d7a:	8b 45 08             	mov    0x8(%ebp),%eax
 d7d:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 d80:	8b 45 08             	mov    0x8(%ebp),%eax
 d83:	89 04 24             	mov    %eax,(%esp)
 d86:	e8 29 fd ff ff       	call   ab4 <lock_release>
	}
}
 d8b:	c9                   	leave  
 d8c:	c3                   	ret    

00000d8d <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 d8d:	55                   	push   %ebp
 d8e:	89 e5                	mov    %esp,%ebp
 d90:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 d93:	8b 45 08             	mov    0x8(%ebp),%eax
 d96:	89 04 24             	mov    %eax,(%esp)
 d99:	e8 f6 fc ff ff       	call   a94 <lock_acquire>
	if(s->count < s->size){
 d9e:	8b 45 08             	mov    0x8(%ebp),%eax
 da1:	8b 50 04             	mov    0x4(%eax),%edx
 da4:	8b 45 08             	mov    0x8(%ebp),%eax
 da7:	8b 40 08             	mov    0x8(%eax),%eax
 daa:	39 c2                	cmp    %eax,%edx
 dac:	7d 0f                	jge    dbd <sem_signal+0x30>
		s->count++;	
 dae:	8b 45 08             	mov    0x8(%ebp),%eax
 db1:	8b 40 04             	mov    0x4(%eax),%eax
 db4:	8d 50 01             	lea    0x1(%eax),%edx
 db7:	8b 45 08             	mov    0x8(%ebp),%eax
 dba:	89 50 04             	mov    %edx,0x4(%eax)
	}

	int tid;
	tid = pop_q(&s->waiters);
 dbd:	8b 45 08             	mov    0x8(%ebp),%eax
 dc0:	83 c0 0c             	add    $0xc,%eax
 dc3:	89 04 24             	mov    %eax,(%esp)
 dc6:	e8 98 fe ff ff       	call   c63 <pop_q>
 dcb:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 dce:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 dd2:	74 2e                	je     e02 <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
 dd4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dd7:	89 04 24             	mov    %eax,(%esp)
 dda:	e8 d1 f7 ff ff       	call   5b0 <twakeup>
		s->count--;
 ddf:	8b 45 08             	mov    0x8(%ebp),%eax
 de2:	8b 40 04             	mov    0x4(%eax),%eax
 de5:	8d 50 ff             	lea    -0x1(%eax),%edx
 de8:	8b 45 08             	mov    0x8(%ebp),%eax
 deb:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
 dee:	8b 45 08             	mov    0x8(%ebp),%eax
 df1:	8b 40 04             	mov    0x4(%eax),%eax
 df4:	85 c0                	test   %eax,%eax
 df6:	79 0a                	jns    e02 <sem_signal+0x75>
 df8:	8b 45 08             	mov    0x8(%ebp),%eax
 dfb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
 e02:	8b 45 08             	mov    0x8(%ebp),%eax
 e05:	89 04 24             	mov    %eax,(%esp)
 e08:	e8 a7 fc ff ff       	call   ab4 <lock_release>

 e0d:	c9                   	leave  
 e0e:	c3                   	ret    
