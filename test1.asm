
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
   9:	e8 be 03 00 00       	call   3cc <fork>
   e:	89 44 24 14          	mov    %eax,0x14(%esp)
    if(pid == 0){
  12:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
  17:	0f 85 a3 00 00 00    	jne    c0 <main+0xc0>
        void *tid = thread_create(test_func,(void *)0);
  1d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  24:	00 
  25:	c7 04 24 56 01 00 00 	movl   $0x156,(%esp)
  2c:	e8 55 09 00 00       	call   986 <thread_create>
  31:	89 44 24 18          	mov    %eax,0x18(%esp)
        tid = thread_create(test_func,(void *)0);
  35:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  3c:	00 
  3d:	c7 04 24 56 01 00 00 	movl   $0x156,(%esp)
  44:	e8 3d 09 00 00       	call   986 <thread_create>
  49:	89 44 24 18          	mov    %eax,0x18(%esp)
        tid = thread_create(test_func,(void *)0);
  4d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  54:	00 
  55:	c7 04 24 56 01 00 00 	movl   $0x156,(%esp)
  5c:	e8 25 09 00 00       	call   986 <thread_create>
  61:	89 44 24 18          	mov    %eax,0x18(%esp)
        tid = thread_create(test_func,(void *)0);
  65:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  6c:	00 
  6d:	c7 04 24 56 01 00 00 	movl   $0x156,(%esp)
  74:	e8 0d 09 00 00       	call   986 <thread_create>
  79:	89 44 24 18          	mov    %eax,0x18(%esp)
        tid = thread_create(test_func,(void *)0);
  7d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  84:	00 
  85:	c7 04 24 56 01 00 00 	movl   $0x156,(%esp)
  8c:	e8 f5 08 00 00       	call   986 <thread_create>
  91:	89 44 24 18          	mov    %eax,0x18(%esp)
        while(wait()>=0);
  95:	e8 42 03 00 00       	call   3dc <wait>
  9a:	85 c0                	test   %eax,%eax
  9c:	79 f7                	jns    95 <main+0x95>
        printf(1,"I am child, [6] n = %d\n",n);
  9e:	a1 bc 0a 00 00       	mov    0xabc,%eax
  a3:	89 44 24 08          	mov    %eax,0x8(%esp)
  a7:	c7 44 24 04 55 0a 00 	movl   $0xa55,0x4(%esp)
  ae:	00 
  af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b6:	e8 a2 04 00 00       	call   55d <printf>
  bb:	e9 91 00 00 00       	jmp    151 <main+0x151>
    }else if(pid > 0){
  c0:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
  c5:	0f 8e 86 00 00 00    	jle    151 <main+0x151>
        void *tid = thread_create(test_func,(void *)0);
  cb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  d2:	00 
  d3:	c7 04 24 56 01 00 00 	movl   $0x156,(%esp)
  da:	e8 a7 08 00 00       	call   986 <thread_create>
  df:	89 44 24 1c          	mov    %eax,0x1c(%esp)
        tid = thread_create(test_func,(void *)0);
  e3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  ea:	00 
  eb:	c7 04 24 56 01 00 00 	movl   $0x156,(%esp)
  f2:	e8 8f 08 00 00       	call   986 <thread_create>
  f7:	89 44 24 1c          	mov    %eax,0x1c(%esp)
        tid = thread_create(test_func,(void *)0);
  fb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 102:	00 
 103:	c7 04 24 56 01 00 00 	movl   $0x156,(%esp)
 10a:	e8 77 08 00 00       	call   986 <thread_create>
 10f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
        tid = thread_create(test_func,(void *)0);
 113:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 11a:	00 
 11b:	c7 04 24 56 01 00 00 	movl   $0x156,(%esp)
 122:	e8 5f 08 00 00       	call   986 <thread_create>
 127:	89 44 24 1c          	mov    %eax,0x1c(%esp)
        while(wait()>=0);
 12b:	e8 ac 02 00 00       	call   3dc <wait>
 130:	85 c0                	test   %eax,%eax
 132:	79 f7                	jns    12b <main+0x12b>
        printf(1,"I am parent, [5] n = %d\n",n);
 134:	a1 bc 0a 00 00       	mov    0xabc,%eax
 139:	89 44 24 08          	mov    %eax,0x8(%esp)
 13d:	c7 44 24 04 6d 0a 00 	movl   $0xa6d,0x4(%esp)
 144:	00 
 145:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 14c:	e8 0c 04 00 00       	call   55d <printf>
    }

   exit();
 151:	e8 7e 02 00 00       	call   3d4 <exit>

00000156 <test_func>:
}

void test_func(void *arg_ptr){
 156:	55                   	push   %ebp
 157:	89 e5                	mov    %esp,%ebp
 159:	83 ec 08             	sub    $0x8,%esp
//    printf(1,"\n n = %d\n",n);
    n++;
 15c:	a1 bc 0a 00 00       	mov    0xabc,%eax
 161:	83 c0 01             	add    $0x1,%eax
 164:	a3 bc 0a 00 00       	mov    %eax,0xabc
   // printf(1,"after increase by 1 , n = %d\n\n",n);
    texit();
 169:	e8 0e 03 00 00       	call   47c <texit>
 16e:	90                   	nop
 16f:	90                   	nop

00000170 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 170:	55                   	push   %ebp
 171:	89 e5                	mov    %esp,%ebp
 173:	57                   	push   %edi
 174:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 175:	8b 4d 08             	mov    0x8(%ebp),%ecx
 178:	8b 55 10             	mov    0x10(%ebp),%edx
 17b:	8b 45 0c             	mov    0xc(%ebp),%eax
 17e:	89 cb                	mov    %ecx,%ebx
 180:	89 df                	mov    %ebx,%edi
 182:	89 d1                	mov    %edx,%ecx
 184:	fc                   	cld    
 185:	f3 aa                	rep stos %al,%es:(%edi)
 187:	89 ca                	mov    %ecx,%edx
 189:	89 fb                	mov    %edi,%ebx
 18b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 18e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 191:	5b                   	pop    %ebx
 192:	5f                   	pop    %edi
 193:	5d                   	pop    %ebp
 194:	c3                   	ret    

00000195 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 195:	55                   	push   %ebp
 196:	89 e5                	mov    %esp,%ebp
 198:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 19b:	8b 45 08             	mov    0x8(%ebp),%eax
 19e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a4:	0f b6 10             	movzbl (%eax),%edx
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	88 10                	mov    %dl,(%eax)
 1ac:	8b 45 08             	mov    0x8(%ebp),%eax
 1af:	0f b6 00             	movzbl (%eax),%eax
 1b2:	84 c0                	test   %al,%al
 1b4:	0f 95 c0             	setne  %al
 1b7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1bb:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 1bf:	84 c0                	test   %al,%al
 1c1:	75 de                	jne    1a1 <strcpy+0xc>
    ;
  return os;
 1c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c6:	c9                   	leave  
 1c7:	c3                   	ret    

000001c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 1c8:	55                   	push   %ebp
 1c9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 1cb:	eb 08                	jmp    1d5 <strcmp+0xd>
    p++, q++;
 1cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1d1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 1d5:	8b 45 08             	mov    0x8(%ebp),%eax
 1d8:	0f b6 00             	movzbl (%eax),%eax
 1db:	84 c0                	test   %al,%al
 1dd:	74 10                	je     1ef <strcmp+0x27>
 1df:	8b 45 08             	mov    0x8(%ebp),%eax
 1e2:	0f b6 10             	movzbl (%eax),%edx
 1e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e8:	0f b6 00             	movzbl (%eax),%eax
 1eb:	38 c2                	cmp    %al,%dl
 1ed:	74 de                	je     1cd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
 1f2:	0f b6 00             	movzbl (%eax),%eax
 1f5:	0f b6 d0             	movzbl %al,%edx
 1f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fb:	0f b6 00             	movzbl (%eax),%eax
 1fe:	0f b6 c0             	movzbl %al,%eax
 201:	89 d1                	mov    %edx,%ecx
 203:	29 c1                	sub    %eax,%ecx
 205:	89 c8                	mov    %ecx,%eax
}
 207:	5d                   	pop    %ebp
 208:	c3                   	ret    

00000209 <strlen>:

uint
strlen(char *s)
{
 209:	55                   	push   %ebp
 20a:	89 e5                	mov    %esp,%ebp
 20c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 20f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 216:	eb 04                	jmp    21c <strlen+0x13>
 218:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 21c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 21f:	03 45 08             	add    0x8(%ebp),%eax
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 ef                	jne    218 <strlen+0xf>
    ;
  return n;
 229:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <memset>:

void*
memset(void *dst, int c, uint n)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
 231:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 234:	8b 45 10             	mov    0x10(%ebp),%eax
 237:	89 44 24 08          	mov    %eax,0x8(%esp)
 23b:	8b 45 0c             	mov    0xc(%ebp),%eax
 23e:	89 44 24 04          	mov    %eax,0x4(%esp)
 242:	8b 45 08             	mov    0x8(%ebp),%eax
 245:	89 04 24             	mov    %eax,(%esp)
 248:	e8 23 ff ff ff       	call   170 <stosb>
  return dst;
 24d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 250:	c9                   	leave  
 251:	c3                   	ret    

00000252 <strchr>:

char*
strchr(const char *s, char c)
{
 252:	55                   	push   %ebp
 253:	89 e5                	mov    %esp,%ebp
 255:	83 ec 04             	sub    $0x4,%esp
 258:	8b 45 0c             	mov    0xc(%ebp),%eax
 25b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 25e:	eb 14                	jmp    274 <strchr+0x22>
    if(*s == c)
 260:	8b 45 08             	mov    0x8(%ebp),%eax
 263:	0f b6 00             	movzbl (%eax),%eax
 266:	3a 45 fc             	cmp    -0x4(%ebp),%al
 269:	75 05                	jne    270 <strchr+0x1e>
      return (char*)s;
 26b:	8b 45 08             	mov    0x8(%ebp),%eax
 26e:	eb 13                	jmp    283 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 270:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 274:	8b 45 08             	mov    0x8(%ebp),%eax
 277:	0f b6 00             	movzbl (%eax),%eax
 27a:	84 c0                	test   %al,%al
 27c:	75 e2                	jne    260 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 27e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 283:	c9                   	leave  
 284:	c3                   	ret    

00000285 <gets>:

char*
gets(char *buf, int max)
{
 285:	55                   	push   %ebp
 286:	89 e5                	mov    %esp,%ebp
 288:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 28b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 292:	eb 44                	jmp    2d8 <gets+0x53>
    cc = read(0, &c, 1);
 294:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 29b:	00 
 29c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 29f:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2aa:	e8 3d 01 00 00       	call   3ec <read>
 2af:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 2b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2b6:	7e 2d                	jle    2e5 <gets+0x60>
      break;
    buf[i++] = c;
 2b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2bb:	03 45 08             	add    0x8(%ebp),%eax
 2be:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 2c2:	88 10                	mov    %dl,(%eax)
 2c4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 2c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2cc:	3c 0a                	cmp    $0xa,%al
 2ce:	74 16                	je     2e6 <gets+0x61>
 2d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 2d4:	3c 0d                	cmp    $0xd,%al
 2d6:	74 0e                	je     2e6 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2db:	83 c0 01             	add    $0x1,%eax
 2de:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2e1:	7c b1                	jl     294 <gets+0xf>
 2e3:	eb 01                	jmp    2e6 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 2e5:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2e9:	03 45 08             	add    0x8(%ebp),%eax
 2ec:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2f2:	c9                   	leave  
 2f3:	c3                   	ret    

000002f4 <stat>:

int
stat(char *n, struct stat *st)
{
 2f4:	55                   	push   %ebp
 2f5:	89 e5                	mov    %esp,%ebp
 2f7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 301:	00 
 302:	8b 45 08             	mov    0x8(%ebp),%eax
 305:	89 04 24             	mov    %eax,(%esp)
 308:	e8 07 01 00 00       	call   414 <open>
 30d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 310:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 314:	79 07                	jns    31d <stat+0x29>
    return -1;
 316:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 31b:	eb 23                	jmp    340 <stat+0x4c>
  r = fstat(fd, st);
 31d:	8b 45 0c             	mov    0xc(%ebp),%eax
 320:	89 44 24 04          	mov    %eax,0x4(%esp)
 324:	8b 45 f0             	mov    -0x10(%ebp),%eax
 327:	89 04 24             	mov    %eax,(%esp)
 32a:	e8 fd 00 00 00       	call   42c <fstat>
 32f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 332:	8b 45 f0             	mov    -0x10(%ebp),%eax
 335:	89 04 24             	mov    %eax,(%esp)
 338:	e8 bf 00 00 00       	call   3fc <close>
  return r;
 33d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 340:	c9                   	leave  
 341:	c3                   	ret    

00000342 <atoi>:

int
atoi(const char *s)
{
 342:	55                   	push   %ebp
 343:	89 e5                	mov    %esp,%ebp
 345:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 348:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 34f:	eb 24                	jmp    375 <atoi+0x33>
    n = n*10 + *s++ - '0';
 351:	8b 55 fc             	mov    -0x4(%ebp),%edx
 354:	89 d0                	mov    %edx,%eax
 356:	c1 e0 02             	shl    $0x2,%eax
 359:	01 d0                	add    %edx,%eax
 35b:	01 c0                	add    %eax,%eax
 35d:	89 c2                	mov    %eax,%edx
 35f:	8b 45 08             	mov    0x8(%ebp),%eax
 362:	0f b6 00             	movzbl (%eax),%eax
 365:	0f be c0             	movsbl %al,%eax
 368:	8d 04 02             	lea    (%edx,%eax,1),%eax
 36b:	83 e8 30             	sub    $0x30,%eax
 36e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 371:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 375:	8b 45 08             	mov    0x8(%ebp),%eax
 378:	0f b6 00             	movzbl (%eax),%eax
 37b:	3c 2f                	cmp    $0x2f,%al
 37d:	7e 0a                	jle    389 <atoi+0x47>
 37f:	8b 45 08             	mov    0x8(%ebp),%eax
 382:	0f b6 00             	movzbl (%eax),%eax
 385:	3c 39                	cmp    $0x39,%al
 387:	7e c8                	jle    351 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 389:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 38c:	c9                   	leave  
 38d:	c3                   	ret    

0000038e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 38e:	55                   	push   %ebp
 38f:	89 e5                	mov    %esp,%ebp
 391:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 394:	8b 45 08             	mov    0x8(%ebp),%eax
 397:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 39a:	8b 45 0c             	mov    0xc(%ebp),%eax
 39d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 3a0:	eb 13                	jmp    3b5 <memmove+0x27>
    *dst++ = *src++;
 3a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3a5:	0f b6 10             	movzbl (%eax),%edx
 3a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3ab:	88 10                	mov    %dl,(%eax)
 3ad:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 3b1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 3b5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 3b9:	0f 9f c0             	setg   %al
 3bc:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 3c0:	84 c0                	test   %al,%al
 3c2:	75 de                	jne    3a2 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 3c4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 3c7:	c9                   	leave  
 3c8:	c3                   	ret    
 3c9:	90                   	nop
 3ca:	90                   	nop
 3cb:	90                   	nop

000003cc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 3cc:	b8 01 00 00 00       	mov    $0x1,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <exit>:
SYSCALL(exit)
 3d4:	b8 02 00 00 00       	mov    $0x2,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <wait>:
SYSCALL(wait)
 3dc:	b8 03 00 00 00       	mov    $0x3,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <pipe>:
SYSCALL(pipe)
 3e4:	b8 04 00 00 00       	mov    $0x4,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <read>:
SYSCALL(read)
 3ec:	b8 05 00 00 00       	mov    $0x5,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <write>:
SYSCALL(write)
 3f4:	b8 10 00 00 00       	mov    $0x10,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <close>:
SYSCALL(close)
 3fc:	b8 15 00 00 00       	mov    $0x15,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <kill>:
SYSCALL(kill)
 404:	b8 06 00 00 00       	mov    $0x6,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <exec>:
SYSCALL(exec)
 40c:	b8 07 00 00 00       	mov    $0x7,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <open>:
SYSCALL(open)
 414:	b8 0f 00 00 00       	mov    $0xf,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <mknod>:
SYSCALL(mknod)
 41c:	b8 11 00 00 00       	mov    $0x11,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <unlink>:
SYSCALL(unlink)
 424:	b8 12 00 00 00       	mov    $0x12,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <fstat>:
SYSCALL(fstat)
 42c:	b8 08 00 00 00       	mov    $0x8,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <link>:
SYSCALL(link)
 434:	b8 13 00 00 00       	mov    $0x13,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <mkdir>:
SYSCALL(mkdir)
 43c:	b8 14 00 00 00       	mov    $0x14,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <chdir>:
SYSCALL(chdir)
 444:	b8 09 00 00 00       	mov    $0x9,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <dup>:
SYSCALL(dup)
 44c:	b8 0a 00 00 00       	mov    $0xa,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <getpid>:
SYSCALL(getpid)
 454:	b8 0b 00 00 00       	mov    $0xb,%eax
 459:	cd 40                	int    $0x40
 45b:	c3                   	ret    

0000045c <sbrk>:
SYSCALL(sbrk)
 45c:	b8 0c 00 00 00       	mov    $0xc,%eax
 461:	cd 40                	int    $0x40
 463:	c3                   	ret    

00000464 <sleep>:
SYSCALL(sleep)
 464:	b8 0d 00 00 00       	mov    $0xd,%eax
 469:	cd 40                	int    $0x40
 46b:	c3                   	ret    

0000046c <uptime>:
SYSCALL(uptime)
 46c:	b8 0e 00 00 00       	mov    $0xe,%eax
 471:	cd 40                	int    $0x40
 473:	c3                   	ret    

00000474 <clone>:
SYSCALL(clone)
 474:	b8 16 00 00 00       	mov    $0x16,%eax
 479:	cd 40                	int    $0x40
 47b:	c3                   	ret    

0000047c <texit>:
SYSCALL(texit)
 47c:	b8 17 00 00 00       	mov    $0x17,%eax
 481:	cd 40                	int    $0x40
 483:	c3                   	ret    

00000484 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 484:	55                   	push   %ebp
 485:	89 e5                	mov    %esp,%ebp
 487:	83 ec 28             	sub    $0x28,%esp
 48a:	8b 45 0c             	mov    0xc(%ebp),%eax
 48d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 490:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 497:	00 
 498:	8d 45 f4             	lea    -0xc(%ebp),%eax
 49b:	89 44 24 04          	mov    %eax,0x4(%esp)
 49f:	8b 45 08             	mov    0x8(%ebp),%eax
 4a2:	89 04 24             	mov    %eax,(%esp)
 4a5:	e8 4a ff ff ff       	call   3f4 <write>
}
 4aa:	c9                   	leave  
 4ab:	c3                   	ret    

000004ac <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 4ac:	55                   	push   %ebp
 4ad:	89 e5                	mov    %esp,%ebp
 4af:	53                   	push   %ebx
 4b0:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 4b3:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 4ba:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 4be:	74 17                	je     4d7 <printint+0x2b>
 4c0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 4c4:	79 11                	jns    4d7 <printint+0x2b>
    neg = 1;
 4c6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 4cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 4d0:	f7 d8                	neg    %eax
 4d2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4d5:	eb 06                	jmp    4dd <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 4dd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 4e4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 4e7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ed:	ba 00 00 00 00       	mov    $0x0,%edx
 4f2:	f7 f3                	div    %ebx
 4f4:	89 d0                	mov    %edx,%eax
 4f6:	0f b6 80 c0 0a 00 00 	movzbl 0xac0(%eax),%eax
 4fd:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 501:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 505:	8b 45 10             	mov    0x10(%ebp),%eax
 508:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 50b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 50e:	ba 00 00 00 00       	mov    $0x0,%edx
 513:	f7 75 d4             	divl   -0x2c(%ebp)
 516:	89 45 f4             	mov    %eax,-0xc(%ebp)
 519:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 51d:	75 c5                	jne    4e4 <printint+0x38>
  if(neg)
 51f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 523:	74 28                	je     54d <printint+0xa1>
    buf[i++] = '-';
 525:	8b 45 ec             	mov    -0x14(%ebp),%eax
 528:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 52d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 531:	eb 1a                	jmp    54d <printint+0xa1>
    putc(fd, buf[i]);
 533:	8b 45 ec             	mov    -0x14(%ebp),%eax
 536:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 53b:	0f be c0             	movsbl %al,%eax
 53e:	89 44 24 04          	mov    %eax,0x4(%esp)
 542:	8b 45 08             	mov    0x8(%ebp),%eax
 545:	89 04 24             	mov    %eax,(%esp)
 548:	e8 37 ff ff ff       	call   484 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 54d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 551:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 555:	79 dc                	jns    533 <printint+0x87>
    putc(fd, buf[i]);
}
 557:	83 c4 44             	add    $0x44,%esp
 55a:	5b                   	pop    %ebx
 55b:	5d                   	pop    %ebp
 55c:	c3                   	ret    

0000055d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 55d:	55                   	push   %ebp
 55e:	89 e5                	mov    %esp,%ebp
 560:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 563:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 56a:	8d 45 0c             	lea    0xc(%ebp),%eax
 56d:	83 c0 04             	add    $0x4,%eax
 570:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 573:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 57a:	e9 7e 01 00 00       	jmp    6fd <printf+0x1a0>
    c = fmt[i] & 0xff;
 57f:	8b 55 0c             	mov    0xc(%ebp),%edx
 582:	8b 45 ec             	mov    -0x14(%ebp),%eax
 585:	8d 04 02             	lea    (%edx,%eax,1),%eax
 588:	0f b6 00             	movzbl (%eax),%eax
 58b:	0f be c0             	movsbl %al,%eax
 58e:	25 ff 00 00 00       	and    $0xff,%eax
 593:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 596:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 59a:	75 2c                	jne    5c8 <printf+0x6b>
      if(c == '%'){
 59c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 5a0:	75 0c                	jne    5ae <printf+0x51>
        state = '%';
 5a2:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 5a9:	e9 4b 01 00 00       	jmp    6f9 <printf+0x19c>
      } else {
        putc(fd, c);
 5ae:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5b1:	0f be c0             	movsbl %al,%eax
 5b4:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b8:	8b 45 08             	mov    0x8(%ebp),%eax
 5bb:	89 04 24             	mov    %eax,(%esp)
 5be:	e8 c1 fe ff ff       	call   484 <putc>
 5c3:	e9 31 01 00 00       	jmp    6f9 <printf+0x19c>
      }
    } else if(state == '%'){
 5c8:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 5cc:	0f 85 27 01 00 00    	jne    6f9 <printf+0x19c>
      if(c == 'd'){
 5d2:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 5d6:	75 2d                	jne    605 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 5d8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5db:	8b 00                	mov    (%eax),%eax
 5dd:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5e4:	00 
 5e5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5ec:	00 
 5ed:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f1:	8b 45 08             	mov    0x8(%ebp),%eax
 5f4:	89 04 24             	mov    %eax,(%esp)
 5f7:	e8 b0 fe ff ff       	call   4ac <printint>
        ap++;
 5fc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 600:	e9 ed 00 00 00       	jmp    6f2 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 605:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 609:	74 06                	je     611 <printf+0xb4>
 60b:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 60f:	75 2d                	jne    63e <printf+0xe1>
        printint(fd, *ap, 16, 0);
 611:	8b 45 f4             	mov    -0xc(%ebp),%eax
 614:	8b 00                	mov    (%eax),%eax
 616:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 61d:	00 
 61e:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 625:	00 
 626:	89 44 24 04          	mov    %eax,0x4(%esp)
 62a:	8b 45 08             	mov    0x8(%ebp),%eax
 62d:	89 04 24             	mov    %eax,(%esp)
 630:	e8 77 fe ff ff       	call   4ac <printint>
        ap++;
 635:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 639:	e9 b4 00 00 00       	jmp    6f2 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 63e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 642:	75 46                	jne    68a <printf+0x12d>
        s = (char*)*ap;
 644:	8b 45 f4             	mov    -0xc(%ebp),%eax
 647:	8b 00                	mov    (%eax),%eax
 649:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 64c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 650:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 654:	75 27                	jne    67d <printf+0x120>
          s = "(null)";
 656:	c7 45 e4 86 0a 00 00 	movl   $0xa86,-0x1c(%ebp)
        while(*s != 0){
 65d:	eb 1f                	jmp    67e <printf+0x121>
          putc(fd, *s);
 65f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 662:	0f b6 00             	movzbl (%eax),%eax
 665:	0f be c0             	movsbl %al,%eax
 668:	89 44 24 04          	mov    %eax,0x4(%esp)
 66c:	8b 45 08             	mov    0x8(%ebp),%eax
 66f:	89 04 24             	mov    %eax,(%esp)
 672:	e8 0d fe ff ff       	call   484 <putc>
          s++;
 677:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 67b:	eb 01                	jmp    67e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 67d:	90                   	nop
 67e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 681:	0f b6 00             	movzbl (%eax),%eax
 684:	84 c0                	test   %al,%al
 686:	75 d7                	jne    65f <printf+0x102>
 688:	eb 68                	jmp    6f2 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 68a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 68e:	75 1d                	jne    6ad <printf+0x150>
        putc(fd, *ap);
 690:	8b 45 f4             	mov    -0xc(%ebp),%eax
 693:	8b 00                	mov    (%eax),%eax
 695:	0f be c0             	movsbl %al,%eax
 698:	89 44 24 04          	mov    %eax,0x4(%esp)
 69c:	8b 45 08             	mov    0x8(%ebp),%eax
 69f:	89 04 24             	mov    %eax,(%esp)
 6a2:	e8 dd fd ff ff       	call   484 <putc>
        ap++;
 6a7:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 6ab:	eb 45                	jmp    6f2 <printf+0x195>
      } else if(c == '%'){
 6ad:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 6b1:	75 17                	jne    6ca <printf+0x16d>
        putc(fd, c);
 6b3:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b6:	0f be c0             	movsbl %al,%eax
 6b9:	89 44 24 04          	mov    %eax,0x4(%esp)
 6bd:	8b 45 08             	mov    0x8(%ebp),%eax
 6c0:	89 04 24             	mov    %eax,(%esp)
 6c3:	e8 bc fd ff ff       	call   484 <putc>
 6c8:	eb 28                	jmp    6f2 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 6ca:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6d1:	00 
 6d2:	8b 45 08             	mov    0x8(%ebp),%eax
 6d5:	89 04 24             	mov    %eax,(%esp)
 6d8:	e8 a7 fd ff ff       	call   484 <putc>
        putc(fd, c);
 6dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6e0:	0f be c0             	movsbl %al,%eax
 6e3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ea:	89 04 24             	mov    %eax,(%esp)
 6ed:	e8 92 fd ff ff       	call   484 <putc>
      }
      state = 0;
 6f2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6f9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 6fd:	8b 55 0c             	mov    0xc(%ebp),%edx
 700:	8b 45 ec             	mov    -0x14(%ebp),%eax
 703:	8d 04 02             	lea    (%edx,%eax,1),%eax
 706:	0f b6 00             	movzbl (%eax),%eax
 709:	84 c0                	test   %al,%al
 70b:	0f 85 6e fe ff ff    	jne    57f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 711:	c9                   	leave  
 712:	c3                   	ret    
 713:	90                   	nop

00000714 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 714:	55                   	push   %ebp
 715:	89 e5                	mov    %esp,%ebp
 717:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 71a:	8b 45 08             	mov    0x8(%ebp),%eax
 71d:	83 e8 08             	sub    $0x8,%eax
 720:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 723:	a1 dc 0a 00 00       	mov    0xadc,%eax
 728:	89 45 fc             	mov    %eax,-0x4(%ebp)
 72b:	eb 24                	jmp    751 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 72d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 730:	8b 00                	mov    (%eax),%eax
 732:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 735:	77 12                	ja     749 <free+0x35>
 737:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 73d:	77 24                	ja     763 <free+0x4f>
 73f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 742:	8b 00                	mov    (%eax),%eax
 744:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 747:	77 1a                	ja     763 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 749:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74c:	8b 00                	mov    (%eax),%eax
 74e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 751:	8b 45 f8             	mov    -0x8(%ebp),%eax
 754:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 757:	76 d4                	jbe    72d <free+0x19>
 759:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75c:	8b 00                	mov    (%eax),%eax
 75e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 761:	76 ca                	jbe    72d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 763:	8b 45 f8             	mov    -0x8(%ebp),%eax
 766:	8b 40 04             	mov    0x4(%eax),%eax
 769:	c1 e0 03             	shl    $0x3,%eax
 76c:	89 c2                	mov    %eax,%edx
 76e:	03 55 f8             	add    -0x8(%ebp),%edx
 771:	8b 45 fc             	mov    -0x4(%ebp),%eax
 774:	8b 00                	mov    (%eax),%eax
 776:	39 c2                	cmp    %eax,%edx
 778:	75 24                	jne    79e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 77a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77d:	8b 50 04             	mov    0x4(%eax),%edx
 780:	8b 45 fc             	mov    -0x4(%ebp),%eax
 783:	8b 00                	mov    (%eax),%eax
 785:	8b 40 04             	mov    0x4(%eax),%eax
 788:	01 c2                	add    %eax,%edx
 78a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 790:	8b 45 fc             	mov    -0x4(%ebp),%eax
 793:	8b 00                	mov    (%eax),%eax
 795:	8b 10                	mov    (%eax),%edx
 797:	8b 45 f8             	mov    -0x8(%ebp),%eax
 79a:	89 10                	mov    %edx,(%eax)
 79c:	eb 0a                	jmp    7a8 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 79e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a1:	8b 10                	mov    (%eax),%edx
 7a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a6:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 7a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ab:	8b 40 04             	mov    0x4(%eax),%eax
 7ae:	c1 e0 03             	shl    $0x3,%eax
 7b1:	03 45 fc             	add    -0x4(%ebp),%eax
 7b4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7b7:	75 20                	jne    7d9 <free+0xc5>
    p->s.size += bp->s.size;
 7b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7bc:	8b 50 04             	mov    0x4(%eax),%edx
 7bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c2:	8b 40 04             	mov    0x4(%eax),%eax
 7c5:	01 c2                	add    %eax,%edx
 7c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ca:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d0:	8b 10                	mov    (%eax),%edx
 7d2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d5:	89 10                	mov    %edx,(%eax)
 7d7:	eb 08                	jmp    7e1 <free+0xcd>
  } else
    p->s.ptr = bp;
 7d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7dc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7df:	89 10                	mov    %edx,(%eax)
  freep = p;
 7e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e4:	a3 dc 0a 00 00       	mov    %eax,0xadc
}
 7e9:	c9                   	leave  
 7ea:	c3                   	ret    

000007eb <morecore>:

static Header*
morecore(uint nu)
{
 7eb:	55                   	push   %ebp
 7ec:	89 e5                	mov    %esp,%ebp
 7ee:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7f1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7f8:	77 07                	ja     801 <morecore+0x16>
    nu = 4096;
 7fa:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 801:	8b 45 08             	mov    0x8(%ebp),%eax
 804:	c1 e0 03             	shl    $0x3,%eax
 807:	89 04 24             	mov    %eax,(%esp)
 80a:	e8 4d fc ff ff       	call   45c <sbrk>
 80f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 812:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 816:	75 07                	jne    81f <morecore+0x34>
    return 0;
 818:	b8 00 00 00 00       	mov    $0x0,%eax
 81d:	eb 22                	jmp    841 <morecore+0x56>
  hp = (Header*)p;
 81f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 822:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 825:	8b 45 f4             	mov    -0xc(%ebp),%eax
 828:	8b 55 08             	mov    0x8(%ebp),%edx
 82b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 82e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 831:	83 c0 08             	add    $0x8,%eax
 834:	89 04 24             	mov    %eax,(%esp)
 837:	e8 d8 fe ff ff       	call   714 <free>
  return freep;
 83c:	a1 dc 0a 00 00       	mov    0xadc,%eax
}
 841:	c9                   	leave  
 842:	c3                   	ret    

00000843 <malloc>:

void*
malloc(uint nbytes)
{
 843:	55                   	push   %ebp
 844:	89 e5                	mov    %esp,%ebp
 846:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 849:	8b 45 08             	mov    0x8(%ebp),%eax
 84c:	83 c0 07             	add    $0x7,%eax
 84f:	c1 e8 03             	shr    $0x3,%eax
 852:	83 c0 01             	add    $0x1,%eax
 855:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 858:	a1 dc 0a 00 00       	mov    0xadc,%eax
 85d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 860:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 864:	75 23                	jne    889 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 866:	c7 45 f0 d4 0a 00 00 	movl   $0xad4,-0x10(%ebp)
 86d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 870:	a3 dc 0a 00 00       	mov    %eax,0xadc
 875:	a1 dc 0a 00 00       	mov    0xadc,%eax
 87a:	a3 d4 0a 00 00       	mov    %eax,0xad4
    base.s.size = 0;
 87f:	c7 05 d8 0a 00 00 00 	movl   $0x0,0xad8
 886:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 889:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88c:	8b 00                	mov    (%eax),%eax
 88e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 891:	8b 45 ec             	mov    -0x14(%ebp),%eax
 894:	8b 40 04             	mov    0x4(%eax),%eax
 897:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 89a:	72 4d                	jb     8e9 <malloc+0xa6>
      if(p->s.size == nunits)
 89c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 89f:	8b 40 04             	mov    0x4(%eax),%eax
 8a2:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 8a5:	75 0c                	jne    8b3 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 8a7:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8aa:	8b 10                	mov    (%eax),%edx
 8ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8af:	89 10                	mov    %edx,(%eax)
 8b1:	eb 26                	jmp    8d9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 8b3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8b6:	8b 40 04             	mov    0x4(%eax),%eax
 8b9:	89 c2                	mov    %eax,%edx
 8bb:	2b 55 f4             	sub    -0xc(%ebp),%edx
 8be:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8c1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 8c4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8c7:	8b 40 04             	mov    0x4(%eax),%eax
 8ca:	c1 e0 03             	shl    $0x3,%eax
 8cd:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 8d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8d6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dc:	a3 dc 0a 00 00       	mov    %eax,0xadc
      return (void*)(p + 1);
 8e1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8e4:	83 c0 08             	add    $0x8,%eax
 8e7:	eb 38                	jmp    921 <malloc+0xde>
    }
    if(p == freep)
 8e9:	a1 dc 0a 00 00       	mov    0xadc,%eax
 8ee:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 8f1:	75 1b                	jne    90e <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8f6:	89 04 24             	mov    %eax,(%esp)
 8f9:	e8 ed fe ff ff       	call   7eb <morecore>
 8fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
 901:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 905:	75 07                	jne    90e <malloc+0xcb>
        return 0;
 907:	b8 00 00 00 00       	mov    $0x0,%eax
 90c:	eb 13                	jmp    921 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 90e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 911:	89 45 f0             	mov    %eax,-0x10(%ebp)
 914:	8b 45 ec             	mov    -0x14(%ebp),%eax
 917:	8b 00                	mov    (%eax),%eax
 919:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 91c:	e9 70 ff ff ff       	jmp    891 <malloc+0x4e>
}
 921:	c9                   	leave  
 922:	c3                   	ret    
 923:	90                   	nop

00000924 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 924:	55                   	push   %ebp
 925:	89 e5                	mov    %esp,%ebp
 927:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 92a:	8b 55 08             	mov    0x8(%ebp),%edx
 92d:	8b 45 0c             	mov    0xc(%ebp),%eax
 930:	8b 4d 08             	mov    0x8(%ebp),%ecx
 933:	f0 87 02             	lock xchg %eax,(%edx)
 936:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 939:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 93c:	c9                   	leave  
 93d:	c3                   	ret    

0000093e <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 93e:	55                   	push   %ebp
 93f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 941:	8b 45 08             	mov    0x8(%ebp),%eax
 944:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 94a:	5d                   	pop    %ebp
 94b:	c3                   	ret    

0000094c <lock_acquire>:
void lock_acquire(lock_t *lock){
 94c:	55                   	push   %ebp
 94d:	89 e5                	mov    %esp,%ebp
 94f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 952:	8b 45 08             	mov    0x8(%ebp),%eax
 955:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 95c:	00 
 95d:	89 04 24             	mov    %eax,(%esp)
 960:	e8 bf ff ff ff       	call   924 <xchg>
 965:	85 c0                	test   %eax,%eax
 967:	75 e9                	jne    952 <lock_acquire+0x6>
}
 969:	c9                   	leave  
 96a:	c3                   	ret    

0000096b <lock_release>:
void lock_release(lock_t *lock){
 96b:	55                   	push   %ebp
 96c:	89 e5                	mov    %esp,%ebp
 96e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 971:	8b 45 08             	mov    0x8(%ebp),%eax
 974:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 97b:	00 
 97c:	89 04 24             	mov    %eax,(%esp)
 97f:	e8 a0 ff ff ff       	call   924 <xchg>
}
 984:	c9                   	leave  
 985:	c3                   	ret    

00000986 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 986:	55                   	push   %ebp
 987:	89 e5                	mov    %esp,%ebp
 989:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 98c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 993:	e8 ab fe ff ff       	call   843 <malloc>
 998:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 99b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 99e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 9a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a4:	25 ff 0f 00 00       	and    $0xfff,%eax
 9a9:	85 c0                	test   %eax,%eax
 9ab:	74 15                	je     9c2 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 9ad:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9b0:	89 c2                	mov    %eax,%edx
 9b2:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 9b8:	b8 00 10 00 00       	mov    $0x1000,%eax
 9bd:	29 d0                	sub    %edx,%eax
 9bf:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 9c2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 9c6:	75 1b                	jne    9e3 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 9c8:	c7 44 24 04 8d 0a 00 	movl   $0xa8d,0x4(%esp)
 9cf:	00 
 9d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9d7:	e8 81 fb ff ff       	call   55d <printf>
        return 0;
 9dc:	b8 00 00 00 00       	mov    $0x0,%eax
 9e1:	eb 70                	jmp    a53 <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 9e3:	8b 55 08             	mov    0x8(%ebp),%edx
 9e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9e9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 9f0:	00 
 9f1:	89 54 24 08          	mov    %edx,0x8(%esp)
 9f5:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 9fc:	00 
 9fd:	89 04 24             	mov    %eax,(%esp)
 a00:	e8 6f fa ff ff       	call   474 <clone>
 a05:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 a08:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a0c:	79 1b                	jns    a29 <thread_create+0xa3>
        printf(1,"clone fails\n");
 a0e:	c7 44 24 04 9b 0a 00 	movl   $0xa9b,0x4(%esp)
 a15:	00 
 a16:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a1d:	e8 3b fb ff ff       	call   55d <printf>
        return 0;
 a22:	b8 00 00 00 00       	mov    $0x0,%eax
 a27:	eb 2a                	jmp    a53 <thread_create+0xcd>
    }
    if(tid > 0){
 a29:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a2d:	7e 05                	jle    a34 <thread_create+0xae>
        return garbage_stack;
 a2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a32:	eb 1f                	jmp    a53 <thread_create+0xcd>
    }
    if(tid == 0){
 a34:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a38:	75 14                	jne    a4e <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 a3a:	c7 44 24 04 a8 0a 00 	movl   $0xaa8,0x4(%esp)
 a41:	00 
 a42:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a49:	e8 0f fb ff ff       	call   55d <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 a4e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 a53:	c9                   	leave  
 a54:	c3                   	ret    
