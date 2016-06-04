
_test:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

int n = 1;

void test_func(void * arg_ptr);

int main(int argc, char *argv[]){
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp

   printf(1,"thread_create test begin\n\n");
   9:	c7 44 24 04 16 0c 00 	movl   $0xc16,0x4(%esp)
  10:	00 
  11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  18:	e8 d2 04 00 00       	call   4ef <printf>

   printf(1,"before thread_create n = %d\n",n);
  1d:	a1 9c 10 00 00       	mov    0x109c,%eax
  22:	89 44 24 08          	mov    %eax,0x8(%esp)
  26:	c7 44 24 04 31 0c 00 	movl   $0xc31,0x4(%esp)
  2d:	00 
  2e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  35:	e8 b5 04 00 00       	call   4ef <printf>

   int arg = 10;
  3a:	c7 44 24 18 0a 00 00 	movl   $0xa,0x18(%esp)
  41:	00 
   void *tid = thread_create(test_func, (void *)&arg);
  42:	8d 44 24 18          	lea    0x18(%esp),%eax
  46:	89 44 24 04          	mov    %eax,0x4(%esp)
  4a:	c7 04 24 a7 00 00 00 	movl   $0xa7,(%esp)
  51:	e8 c8 08 00 00       	call   91e <thread_create>
  56:	89 44 24 1c          	mov    %eax,0x1c(%esp)
   if(tid <= 0){
  5a:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  5f:	75 19                	jne    7a <main+0x7a>
       printf(1,"wrong happen");
  61:	c7 44 24 04 4e 0c 00 	movl   $0xc4e,0x4(%esp)
  68:	00 
  69:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  70:	e8 7a 04 00 00       	call   4ef <printf>
       exit();
  75:	e8 cd 02 00 00       	call   347 <exit>
   } 
   while(wait()>= 0)
  7a:	eb 1d                	jmp    99 <main+0x99>
   printf(1,"\nback to parent n = %d\n",n);
  7c:	a1 9c 10 00 00       	mov    0x109c,%eax
  81:	89 44 24 08          	mov    %eax,0x8(%esp)
  85:	c7 44 24 04 5b 0c 00 	movl   $0xc5b,0x4(%esp)
  8c:	00 
  8d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  94:	e8 56 04 00 00       	call   4ef <printf>
   void *tid = thread_create(test_func, (void *)&arg);
   if(tid <= 0){
       printf(1,"wrong happen");
       exit();
   } 
   while(wait()>= 0)
  99:	e8 b1 02 00 00       	call   34f <wait>
  9e:	85 c0                	test   %eax,%eax
  a0:	79 da                	jns    7c <main+0x7c>
   printf(1,"\nback to parent n = %d\n",n);
   
   exit();
  a2:	e8 a0 02 00 00       	call   347 <exit>

000000a7 <test_func>:
}

//void test_func(void *arg_ptr){
void test_func(void *arg_ptr){
  a7:	55                   	push   %ebp
  a8:	89 e5                	mov    %esp,%ebp
  aa:	83 ec 28             	sub    $0x28,%esp
    int * num = (int *)arg_ptr;
  ad:	8b 45 08             	mov    0x8(%ebp),%eax
  b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n = *num; 
  b3:	8b 45 f4             	mov    -0xc(%ebp),%eax
  b6:	8b 00                	mov    (%eax),%eax
  b8:	a3 9c 10 00 00       	mov    %eax,0x109c
    printf(1,"\n n is updated as %d\n",*num);
  bd:	8b 45 f4             	mov    -0xc(%ebp),%eax
  c0:	8b 00                	mov    (%eax),%eax
  c2:	89 44 24 08          	mov    %eax,0x8(%esp)
  c6:	c7 44 24 04 73 0c 00 	movl   $0xc73,0x4(%esp)
  cd:	00 
  ce:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d5:	e8 15 04 00 00       	call   4ef <printf>
    texit();
  da:	e8 10 03 00 00       	call   3ef <texit>

000000df <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
  df:	55                   	push   %ebp
  e0:	89 e5                	mov    %esp,%ebp
  e2:	57                   	push   %edi
  e3:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
  e4:	8b 4d 08             	mov    0x8(%ebp),%ecx
  e7:	8b 55 10             	mov    0x10(%ebp),%edx
  ea:	8b 45 0c             	mov    0xc(%ebp),%eax
  ed:	89 cb                	mov    %ecx,%ebx
  ef:	89 df                	mov    %ebx,%edi
  f1:	89 d1                	mov    %edx,%ecx
  f3:	fc                   	cld    
  f4:	f3 aa                	rep stos %al,%es:(%edi)
  f6:	89 ca                	mov    %ecx,%edx
  f8:	89 fb                	mov    %edi,%ebx
  fa:	89 5d 08             	mov    %ebx,0x8(%ebp)
  fd:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 100:	5b                   	pop    %ebx
 101:	5f                   	pop    %edi
 102:	5d                   	pop    %ebp
 103:	c3                   	ret    

00000104 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 104:	55                   	push   %ebp
 105:	89 e5                	mov    %esp,%ebp
 107:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 10a:	8b 45 08             	mov    0x8(%ebp),%eax
 10d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 110:	90                   	nop
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	8d 50 01             	lea    0x1(%eax),%edx
 117:	89 55 08             	mov    %edx,0x8(%ebp)
 11a:	8b 55 0c             	mov    0xc(%ebp),%edx
 11d:	8d 4a 01             	lea    0x1(%edx),%ecx
 120:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 123:	0f b6 12             	movzbl (%edx),%edx
 126:	88 10                	mov    %dl,(%eax)
 128:	0f b6 00             	movzbl (%eax),%eax
 12b:	84 c0                	test   %al,%al
 12d:	75 e2                	jne    111 <strcpy+0xd>
    ;
  return os;
 12f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 132:	c9                   	leave  
 133:	c3                   	ret    

00000134 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 137:	eb 08                	jmp    141 <strcmp+0xd>
    p++, q++;
 139:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 13d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 141:	8b 45 08             	mov    0x8(%ebp),%eax
 144:	0f b6 00             	movzbl (%eax),%eax
 147:	84 c0                	test   %al,%al
 149:	74 10                	je     15b <strcmp+0x27>
 14b:	8b 45 08             	mov    0x8(%ebp),%eax
 14e:	0f b6 10             	movzbl (%eax),%edx
 151:	8b 45 0c             	mov    0xc(%ebp),%eax
 154:	0f b6 00             	movzbl (%eax),%eax
 157:	38 c2                	cmp    %al,%dl
 159:	74 de                	je     139 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 15b:	8b 45 08             	mov    0x8(%ebp),%eax
 15e:	0f b6 00             	movzbl (%eax),%eax
 161:	0f b6 d0             	movzbl %al,%edx
 164:	8b 45 0c             	mov    0xc(%ebp),%eax
 167:	0f b6 00             	movzbl (%eax),%eax
 16a:	0f b6 c0             	movzbl %al,%eax
 16d:	29 c2                	sub    %eax,%edx
 16f:	89 d0                	mov    %edx,%eax
}
 171:	5d                   	pop    %ebp
 172:	c3                   	ret    

00000173 <strlen>:

uint
strlen(char *s)
{
 173:	55                   	push   %ebp
 174:	89 e5                	mov    %esp,%ebp
 176:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 179:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 180:	eb 04                	jmp    186 <strlen+0x13>
 182:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 186:	8b 55 fc             	mov    -0x4(%ebp),%edx
 189:	8b 45 08             	mov    0x8(%ebp),%eax
 18c:	01 d0                	add    %edx,%eax
 18e:	0f b6 00             	movzbl (%eax),%eax
 191:	84 c0                	test   %al,%al
 193:	75 ed                	jne    182 <strlen+0xf>
    ;
  return n;
 195:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 198:	c9                   	leave  
 199:	c3                   	ret    

0000019a <memset>:

void*
memset(void *dst, int c, uint n)
{
 19a:	55                   	push   %ebp
 19b:	89 e5                	mov    %esp,%ebp
 19d:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1a0:	8b 45 10             	mov    0x10(%ebp),%eax
 1a3:	89 44 24 08          	mov    %eax,0x8(%esp)
 1a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ae:	8b 45 08             	mov    0x8(%ebp),%eax
 1b1:	89 04 24             	mov    %eax,(%esp)
 1b4:	e8 26 ff ff ff       	call   df <stosb>
  return dst;
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1bc:	c9                   	leave  
 1bd:	c3                   	ret    

000001be <strchr>:

char*
strchr(const char *s, char c)
{
 1be:	55                   	push   %ebp
 1bf:	89 e5                	mov    %esp,%ebp
 1c1:	83 ec 04             	sub    $0x4,%esp
 1c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1ca:	eb 14                	jmp    1e0 <strchr+0x22>
    if(*s == c)
 1cc:	8b 45 08             	mov    0x8(%ebp),%eax
 1cf:	0f b6 00             	movzbl (%eax),%eax
 1d2:	3a 45 fc             	cmp    -0x4(%ebp),%al
 1d5:	75 05                	jne    1dc <strchr+0x1e>
      return (char*)s;
 1d7:	8b 45 08             	mov    0x8(%ebp),%eax
 1da:	eb 13                	jmp    1ef <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 1dc:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 1e0:	8b 45 08             	mov    0x8(%ebp),%eax
 1e3:	0f b6 00             	movzbl (%eax),%eax
 1e6:	84 c0                	test   %al,%al
 1e8:	75 e2                	jne    1cc <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 1ea:	b8 00 00 00 00       	mov    $0x0,%eax
}
 1ef:	c9                   	leave  
 1f0:	c3                   	ret    

000001f1 <gets>:

char*
gets(char *buf, int max)
{
 1f1:	55                   	push   %ebp
 1f2:	89 e5                	mov    %esp,%ebp
 1f4:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 1f7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 1fe:	eb 4c                	jmp    24c <gets+0x5b>
    cc = read(0, &c, 1);
 200:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 207:	00 
 208:	8d 45 ef             	lea    -0x11(%ebp),%eax
 20b:	89 44 24 04          	mov    %eax,0x4(%esp)
 20f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 216:	e8 44 01 00 00       	call   35f <read>
 21b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 21e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 222:	7f 02                	jg     226 <gets+0x35>
      break;
 224:	eb 31                	jmp    257 <gets+0x66>
    buf[i++] = c;
 226:	8b 45 f4             	mov    -0xc(%ebp),%eax
 229:	8d 50 01             	lea    0x1(%eax),%edx
 22c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 22f:	89 c2                	mov    %eax,%edx
 231:	8b 45 08             	mov    0x8(%ebp),%eax
 234:	01 c2                	add    %eax,%edx
 236:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 23a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 23c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 240:	3c 0a                	cmp    $0xa,%al
 242:	74 13                	je     257 <gets+0x66>
 244:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 248:	3c 0d                	cmp    $0xd,%al
 24a:	74 0b                	je     257 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 24c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 24f:	83 c0 01             	add    $0x1,%eax
 252:	3b 45 0c             	cmp    0xc(%ebp),%eax
 255:	7c a9                	jl     200 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 257:	8b 55 f4             	mov    -0xc(%ebp),%edx
 25a:	8b 45 08             	mov    0x8(%ebp),%eax
 25d:	01 d0                	add    %edx,%eax
 25f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 262:	8b 45 08             	mov    0x8(%ebp),%eax
}
 265:	c9                   	leave  
 266:	c3                   	ret    

00000267 <stat>:

int
stat(char *n, struct stat *st)
{
 267:	55                   	push   %ebp
 268:	89 e5                	mov    %esp,%ebp
 26a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 26d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 274:	00 
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	89 04 24             	mov    %eax,(%esp)
 27b:	e8 07 01 00 00       	call   387 <open>
 280:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 283:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 287:	79 07                	jns    290 <stat+0x29>
    return -1;
 289:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 28e:	eb 23                	jmp    2b3 <stat+0x4c>
  r = fstat(fd, st);
 290:	8b 45 0c             	mov    0xc(%ebp),%eax
 293:	89 44 24 04          	mov    %eax,0x4(%esp)
 297:	8b 45 f4             	mov    -0xc(%ebp),%eax
 29a:	89 04 24             	mov    %eax,(%esp)
 29d:	e8 fd 00 00 00       	call   39f <fstat>
 2a2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2a5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2a8:	89 04 24             	mov    %eax,(%esp)
 2ab:	e8 bf 00 00 00       	call   36f <close>
  return r;
 2b0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2b3:	c9                   	leave  
 2b4:	c3                   	ret    

000002b5 <atoi>:

int
atoi(const char *s)
{
 2b5:	55                   	push   %ebp
 2b6:	89 e5                	mov    %esp,%ebp
 2b8:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2bb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2c2:	eb 25                	jmp    2e9 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2c4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2c7:	89 d0                	mov    %edx,%eax
 2c9:	c1 e0 02             	shl    $0x2,%eax
 2cc:	01 d0                	add    %edx,%eax
 2ce:	01 c0                	add    %eax,%eax
 2d0:	89 c1                	mov    %eax,%ecx
 2d2:	8b 45 08             	mov    0x8(%ebp),%eax
 2d5:	8d 50 01             	lea    0x1(%eax),%edx
 2d8:	89 55 08             	mov    %edx,0x8(%ebp)
 2db:	0f b6 00             	movzbl (%eax),%eax
 2de:	0f be c0             	movsbl %al,%eax
 2e1:	01 c8                	add    %ecx,%eax
 2e3:	83 e8 30             	sub    $0x30,%eax
 2e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 2e9:	8b 45 08             	mov    0x8(%ebp),%eax
 2ec:	0f b6 00             	movzbl (%eax),%eax
 2ef:	3c 2f                	cmp    $0x2f,%al
 2f1:	7e 0a                	jle    2fd <atoi+0x48>
 2f3:	8b 45 08             	mov    0x8(%ebp),%eax
 2f6:	0f b6 00             	movzbl (%eax),%eax
 2f9:	3c 39                	cmp    $0x39,%al
 2fb:	7e c7                	jle    2c4 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 2fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 300:	c9                   	leave  
 301:	c3                   	ret    

00000302 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 302:	55                   	push   %ebp
 303:	89 e5                	mov    %esp,%ebp
 305:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 308:	8b 45 08             	mov    0x8(%ebp),%eax
 30b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 30e:	8b 45 0c             	mov    0xc(%ebp),%eax
 311:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 314:	eb 17                	jmp    32d <memmove+0x2b>
    *dst++ = *src++;
 316:	8b 45 fc             	mov    -0x4(%ebp),%eax
 319:	8d 50 01             	lea    0x1(%eax),%edx
 31c:	89 55 fc             	mov    %edx,-0x4(%ebp)
 31f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 322:	8d 4a 01             	lea    0x1(%edx),%ecx
 325:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 328:	0f b6 12             	movzbl (%edx),%edx
 32b:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 32d:	8b 45 10             	mov    0x10(%ebp),%eax
 330:	8d 50 ff             	lea    -0x1(%eax),%edx
 333:	89 55 10             	mov    %edx,0x10(%ebp)
 336:	85 c0                	test   %eax,%eax
 338:	7f dc                	jg     316 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 33a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 33d:	c9                   	leave  
 33e:	c3                   	ret    

0000033f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 33f:	b8 01 00 00 00       	mov    $0x1,%eax
 344:	cd 40                	int    $0x40
 346:	c3                   	ret    

00000347 <exit>:
SYSCALL(exit)
 347:	b8 02 00 00 00       	mov    $0x2,%eax
 34c:	cd 40                	int    $0x40
 34e:	c3                   	ret    

0000034f <wait>:
SYSCALL(wait)
 34f:	b8 03 00 00 00       	mov    $0x3,%eax
 354:	cd 40                	int    $0x40
 356:	c3                   	ret    

00000357 <pipe>:
SYSCALL(pipe)
 357:	b8 04 00 00 00       	mov    $0x4,%eax
 35c:	cd 40                	int    $0x40
 35e:	c3                   	ret    

0000035f <read>:
SYSCALL(read)
 35f:	b8 05 00 00 00       	mov    $0x5,%eax
 364:	cd 40                	int    $0x40
 366:	c3                   	ret    

00000367 <write>:
SYSCALL(write)
 367:	b8 10 00 00 00       	mov    $0x10,%eax
 36c:	cd 40                	int    $0x40
 36e:	c3                   	ret    

0000036f <close>:
SYSCALL(close)
 36f:	b8 15 00 00 00       	mov    $0x15,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <kill>:
SYSCALL(kill)
 377:	b8 06 00 00 00       	mov    $0x6,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <exec>:
SYSCALL(exec)
 37f:	b8 07 00 00 00       	mov    $0x7,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <open>:
SYSCALL(open)
 387:	b8 0f 00 00 00       	mov    $0xf,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <mknod>:
SYSCALL(mknod)
 38f:	b8 11 00 00 00       	mov    $0x11,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <unlink>:
SYSCALL(unlink)
 397:	b8 12 00 00 00       	mov    $0x12,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <fstat>:
SYSCALL(fstat)
 39f:	b8 08 00 00 00       	mov    $0x8,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <link>:
SYSCALL(link)
 3a7:	b8 13 00 00 00       	mov    $0x13,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <mkdir>:
SYSCALL(mkdir)
 3af:	b8 14 00 00 00       	mov    $0x14,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <chdir>:
SYSCALL(chdir)
 3b7:	b8 09 00 00 00       	mov    $0x9,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <dup>:
SYSCALL(dup)
 3bf:	b8 0a 00 00 00       	mov    $0xa,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <getpid>:
SYSCALL(getpid)
 3c7:	b8 0b 00 00 00       	mov    $0xb,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <sbrk>:
SYSCALL(sbrk)
 3cf:	b8 0c 00 00 00       	mov    $0xc,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <sleep>:
SYSCALL(sleep)
 3d7:	b8 0d 00 00 00       	mov    $0xd,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <uptime>:
SYSCALL(uptime)
 3df:	b8 0e 00 00 00       	mov    $0xe,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <clone>:
SYSCALL(clone)
 3e7:	b8 16 00 00 00       	mov    $0x16,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <texit>:
SYSCALL(texit)
 3ef:	b8 17 00 00 00       	mov    $0x17,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <tsleep>:
SYSCALL(tsleep)
 3f7:	b8 18 00 00 00       	mov    $0x18,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <twakeup>:
SYSCALL(twakeup)
 3ff:	b8 19 00 00 00       	mov    $0x19,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <test>:
SYSCALL(test)
 407:	b8 1a 00 00 00       	mov    $0x1a,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 40f:	55                   	push   %ebp
 410:	89 e5                	mov    %esp,%ebp
 412:	83 ec 18             	sub    $0x18,%esp
 415:	8b 45 0c             	mov    0xc(%ebp),%eax
 418:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 41b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 422:	00 
 423:	8d 45 f4             	lea    -0xc(%ebp),%eax
 426:	89 44 24 04          	mov    %eax,0x4(%esp)
 42a:	8b 45 08             	mov    0x8(%ebp),%eax
 42d:	89 04 24             	mov    %eax,(%esp)
 430:	e8 32 ff ff ff       	call   367 <write>
}
 435:	c9                   	leave  
 436:	c3                   	ret    

00000437 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 437:	55                   	push   %ebp
 438:	89 e5                	mov    %esp,%ebp
 43a:	56                   	push   %esi
 43b:	53                   	push   %ebx
 43c:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 43f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 446:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 44a:	74 17                	je     463 <printint+0x2c>
 44c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 450:	79 11                	jns    463 <printint+0x2c>
    neg = 1;
 452:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 459:	8b 45 0c             	mov    0xc(%ebp),%eax
 45c:	f7 d8                	neg    %eax
 45e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 461:	eb 06                	jmp    469 <printint+0x32>
  } else {
    x = xx;
 463:	8b 45 0c             	mov    0xc(%ebp),%eax
 466:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 469:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 470:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 473:	8d 41 01             	lea    0x1(%ecx),%eax
 476:	89 45 f4             	mov    %eax,-0xc(%ebp)
 479:	8b 5d 10             	mov    0x10(%ebp),%ebx
 47c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 47f:	ba 00 00 00 00       	mov    $0x0,%edx
 484:	f7 f3                	div    %ebx
 486:	89 d0                	mov    %edx,%eax
 488:	0f b6 80 a0 10 00 00 	movzbl 0x10a0(%eax),%eax
 48f:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 493:	8b 75 10             	mov    0x10(%ebp),%esi
 496:	8b 45 ec             	mov    -0x14(%ebp),%eax
 499:	ba 00 00 00 00       	mov    $0x0,%edx
 49e:	f7 f6                	div    %esi
 4a0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4a3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4a7:	75 c7                	jne    470 <printint+0x39>
  if(neg)
 4a9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4ad:	74 10                	je     4bf <printint+0x88>
    buf[i++] = '-';
 4af:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4b2:	8d 50 01             	lea    0x1(%eax),%edx
 4b5:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4b8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4bd:	eb 1f                	jmp    4de <printint+0xa7>
 4bf:	eb 1d                	jmp    4de <printint+0xa7>
    putc(fd, buf[i]);
 4c1:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c7:	01 d0                	add    %edx,%eax
 4c9:	0f b6 00             	movzbl (%eax),%eax
 4cc:	0f be c0             	movsbl %al,%eax
 4cf:	89 44 24 04          	mov    %eax,0x4(%esp)
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
 4d6:	89 04 24             	mov    %eax,(%esp)
 4d9:	e8 31 ff ff ff       	call   40f <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4de:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 4e2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4e6:	79 d9                	jns    4c1 <printint+0x8a>
    putc(fd, buf[i]);
}
 4e8:	83 c4 30             	add    $0x30,%esp
 4eb:	5b                   	pop    %ebx
 4ec:	5e                   	pop    %esi
 4ed:	5d                   	pop    %ebp
 4ee:	c3                   	ret    

000004ef <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4ef:	55                   	push   %ebp
 4f0:	89 e5                	mov    %esp,%ebp
 4f2:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 4f5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 4fc:	8d 45 0c             	lea    0xc(%ebp),%eax
 4ff:	83 c0 04             	add    $0x4,%eax
 502:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 505:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 50c:	e9 7c 01 00 00       	jmp    68d <printf+0x19e>
    c = fmt[i] & 0xff;
 511:	8b 55 0c             	mov    0xc(%ebp),%edx
 514:	8b 45 f0             	mov    -0x10(%ebp),%eax
 517:	01 d0                	add    %edx,%eax
 519:	0f b6 00             	movzbl (%eax),%eax
 51c:	0f be c0             	movsbl %al,%eax
 51f:	25 ff 00 00 00       	and    $0xff,%eax
 524:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 527:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 52b:	75 2c                	jne    559 <printf+0x6a>
      if(c == '%'){
 52d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 531:	75 0c                	jne    53f <printf+0x50>
        state = '%';
 533:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 53a:	e9 4a 01 00 00       	jmp    689 <printf+0x19a>
      } else {
        putc(fd, c);
 53f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 542:	0f be c0             	movsbl %al,%eax
 545:	89 44 24 04          	mov    %eax,0x4(%esp)
 549:	8b 45 08             	mov    0x8(%ebp),%eax
 54c:	89 04 24             	mov    %eax,(%esp)
 54f:	e8 bb fe ff ff       	call   40f <putc>
 554:	e9 30 01 00 00       	jmp    689 <printf+0x19a>
      }
    } else if(state == '%'){
 559:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 55d:	0f 85 26 01 00 00    	jne    689 <printf+0x19a>
      if(c == 'd'){
 563:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 567:	75 2d                	jne    596 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 569:	8b 45 e8             	mov    -0x18(%ebp),%eax
 56c:	8b 00                	mov    (%eax),%eax
 56e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 575:	00 
 576:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 57d:	00 
 57e:	89 44 24 04          	mov    %eax,0x4(%esp)
 582:	8b 45 08             	mov    0x8(%ebp),%eax
 585:	89 04 24             	mov    %eax,(%esp)
 588:	e8 aa fe ff ff       	call   437 <printint>
        ap++;
 58d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 591:	e9 ec 00 00 00       	jmp    682 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 596:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 59a:	74 06                	je     5a2 <printf+0xb3>
 59c:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5a0:	75 2d                	jne    5cf <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5a2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5a5:	8b 00                	mov    (%eax),%eax
 5a7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5ae:	00 
 5af:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5b6:	00 
 5b7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5bb:	8b 45 08             	mov    0x8(%ebp),%eax
 5be:	89 04 24             	mov    %eax,(%esp)
 5c1:	e8 71 fe ff ff       	call   437 <printint>
        ap++;
 5c6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5ca:	e9 b3 00 00 00       	jmp    682 <printf+0x193>
      } else if(c == 's'){
 5cf:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 5d3:	75 45                	jne    61a <printf+0x12b>
        s = (char*)*ap;
 5d5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d8:	8b 00                	mov    (%eax),%eax
 5da:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 5dd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 5e1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5e5:	75 09                	jne    5f0 <printf+0x101>
          s = "(null)";
 5e7:	c7 45 f4 89 0c 00 00 	movl   $0xc89,-0xc(%ebp)
        while(*s != 0){
 5ee:	eb 1e                	jmp    60e <printf+0x11f>
 5f0:	eb 1c                	jmp    60e <printf+0x11f>
          putc(fd, *s);
 5f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5f5:	0f b6 00             	movzbl (%eax),%eax
 5f8:	0f be c0             	movsbl %al,%eax
 5fb:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ff:	8b 45 08             	mov    0x8(%ebp),%eax
 602:	89 04 24             	mov    %eax,(%esp)
 605:	e8 05 fe ff ff       	call   40f <putc>
          s++;
 60a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 60e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 611:	0f b6 00             	movzbl (%eax),%eax
 614:	84 c0                	test   %al,%al
 616:	75 da                	jne    5f2 <printf+0x103>
 618:	eb 68                	jmp    682 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 61a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 61e:	75 1d                	jne    63d <printf+0x14e>
        putc(fd, *ap);
 620:	8b 45 e8             	mov    -0x18(%ebp),%eax
 623:	8b 00                	mov    (%eax),%eax
 625:	0f be c0             	movsbl %al,%eax
 628:	89 44 24 04          	mov    %eax,0x4(%esp)
 62c:	8b 45 08             	mov    0x8(%ebp),%eax
 62f:	89 04 24             	mov    %eax,(%esp)
 632:	e8 d8 fd ff ff       	call   40f <putc>
        ap++;
 637:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 63b:	eb 45                	jmp    682 <printf+0x193>
      } else if(c == '%'){
 63d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 641:	75 17                	jne    65a <printf+0x16b>
        putc(fd, c);
 643:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 646:	0f be c0             	movsbl %al,%eax
 649:	89 44 24 04          	mov    %eax,0x4(%esp)
 64d:	8b 45 08             	mov    0x8(%ebp),%eax
 650:	89 04 24             	mov    %eax,(%esp)
 653:	e8 b7 fd ff ff       	call   40f <putc>
 658:	eb 28                	jmp    682 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 65a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 661:	00 
 662:	8b 45 08             	mov    0x8(%ebp),%eax
 665:	89 04 24             	mov    %eax,(%esp)
 668:	e8 a2 fd ff ff       	call   40f <putc>
        putc(fd, c);
 66d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 670:	0f be c0             	movsbl %al,%eax
 673:	89 44 24 04          	mov    %eax,0x4(%esp)
 677:	8b 45 08             	mov    0x8(%ebp),%eax
 67a:	89 04 24             	mov    %eax,(%esp)
 67d:	e8 8d fd ff ff       	call   40f <putc>
      }
      state = 0;
 682:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 689:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 68d:	8b 55 0c             	mov    0xc(%ebp),%edx
 690:	8b 45 f0             	mov    -0x10(%ebp),%eax
 693:	01 d0                	add    %edx,%eax
 695:	0f b6 00             	movzbl (%eax),%eax
 698:	84 c0                	test   %al,%al
 69a:	0f 85 71 fe ff ff    	jne    511 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6a0:	c9                   	leave  
 6a1:	c3                   	ret    

000006a2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6a2:	55                   	push   %ebp
 6a3:	89 e5                	mov    %esp,%ebp
 6a5:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6a8:	8b 45 08             	mov    0x8(%ebp),%eax
 6ab:	83 e8 08             	sub    $0x8,%eax
 6ae:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6b1:	a1 bc 10 00 00       	mov    0x10bc,%eax
 6b6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6b9:	eb 24                	jmp    6df <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6be:	8b 00                	mov    (%eax),%eax
 6c0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6c3:	77 12                	ja     6d7 <free+0x35>
 6c5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6c8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6cb:	77 24                	ja     6f1 <free+0x4f>
 6cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d0:	8b 00                	mov    (%eax),%eax
 6d2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6d5:	77 1a                	ja     6f1 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6d7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6da:	8b 00                	mov    (%eax),%eax
 6dc:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6e2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6e5:	76 d4                	jbe    6bb <free+0x19>
 6e7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ea:	8b 00                	mov    (%eax),%eax
 6ec:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ef:	76 ca                	jbe    6bb <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 6f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f4:	8b 40 04             	mov    0x4(%eax),%eax
 6f7:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 6fe:	8b 45 f8             	mov    -0x8(%ebp),%eax
 701:	01 c2                	add    %eax,%edx
 703:	8b 45 fc             	mov    -0x4(%ebp),%eax
 706:	8b 00                	mov    (%eax),%eax
 708:	39 c2                	cmp    %eax,%edx
 70a:	75 24                	jne    730 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 70c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70f:	8b 50 04             	mov    0x4(%eax),%edx
 712:	8b 45 fc             	mov    -0x4(%ebp),%eax
 715:	8b 00                	mov    (%eax),%eax
 717:	8b 40 04             	mov    0x4(%eax),%eax
 71a:	01 c2                	add    %eax,%edx
 71c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 722:	8b 45 fc             	mov    -0x4(%ebp),%eax
 725:	8b 00                	mov    (%eax),%eax
 727:	8b 10                	mov    (%eax),%edx
 729:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72c:	89 10                	mov    %edx,(%eax)
 72e:	eb 0a                	jmp    73a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 730:	8b 45 fc             	mov    -0x4(%ebp),%eax
 733:	8b 10                	mov    (%eax),%edx
 735:	8b 45 f8             	mov    -0x8(%ebp),%eax
 738:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 73a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73d:	8b 40 04             	mov    0x4(%eax),%eax
 740:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 747:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74a:	01 d0                	add    %edx,%eax
 74c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 74f:	75 20                	jne    771 <free+0xcf>
    p->s.size += bp->s.size;
 751:	8b 45 fc             	mov    -0x4(%ebp),%eax
 754:	8b 50 04             	mov    0x4(%eax),%edx
 757:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75a:	8b 40 04             	mov    0x4(%eax),%eax
 75d:	01 c2                	add    %eax,%edx
 75f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 762:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 765:	8b 45 f8             	mov    -0x8(%ebp),%eax
 768:	8b 10                	mov    (%eax),%edx
 76a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76d:	89 10                	mov    %edx,(%eax)
 76f:	eb 08                	jmp    779 <free+0xd7>
  } else
    p->s.ptr = bp;
 771:	8b 45 fc             	mov    -0x4(%ebp),%eax
 774:	8b 55 f8             	mov    -0x8(%ebp),%edx
 777:	89 10                	mov    %edx,(%eax)
  freep = p;
 779:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77c:	a3 bc 10 00 00       	mov    %eax,0x10bc
}
 781:	c9                   	leave  
 782:	c3                   	ret    

00000783 <morecore>:

static Header*
morecore(uint nu)
{
 783:	55                   	push   %ebp
 784:	89 e5                	mov    %esp,%ebp
 786:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 789:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 790:	77 07                	ja     799 <morecore+0x16>
    nu = 4096;
 792:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 799:	8b 45 08             	mov    0x8(%ebp),%eax
 79c:	c1 e0 03             	shl    $0x3,%eax
 79f:	89 04 24             	mov    %eax,(%esp)
 7a2:	e8 28 fc ff ff       	call   3cf <sbrk>
 7a7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7aa:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7ae:	75 07                	jne    7b7 <morecore+0x34>
    return 0;
 7b0:	b8 00 00 00 00       	mov    $0x0,%eax
 7b5:	eb 22                	jmp    7d9 <morecore+0x56>
  hp = (Header*)p;
 7b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ba:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7bd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c0:	8b 55 08             	mov    0x8(%ebp),%edx
 7c3:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c9:	83 c0 08             	add    $0x8,%eax
 7cc:	89 04 24             	mov    %eax,(%esp)
 7cf:	e8 ce fe ff ff       	call   6a2 <free>
  return freep;
 7d4:	a1 bc 10 00 00       	mov    0x10bc,%eax
}
 7d9:	c9                   	leave  
 7da:	c3                   	ret    

000007db <malloc>:

void*
malloc(uint nbytes)
{
 7db:	55                   	push   %ebp
 7dc:	89 e5                	mov    %esp,%ebp
 7de:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e1:	8b 45 08             	mov    0x8(%ebp),%eax
 7e4:	83 c0 07             	add    $0x7,%eax
 7e7:	c1 e8 03             	shr    $0x3,%eax
 7ea:	83 c0 01             	add    $0x1,%eax
 7ed:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 7f0:	a1 bc 10 00 00       	mov    0x10bc,%eax
 7f5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 7f8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7fc:	75 23                	jne    821 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 7fe:	c7 45 f0 b4 10 00 00 	movl   $0x10b4,-0x10(%ebp)
 805:	8b 45 f0             	mov    -0x10(%ebp),%eax
 808:	a3 bc 10 00 00       	mov    %eax,0x10bc
 80d:	a1 bc 10 00 00       	mov    0x10bc,%eax
 812:	a3 b4 10 00 00       	mov    %eax,0x10b4
    base.s.size = 0;
 817:	c7 05 b8 10 00 00 00 	movl   $0x0,0x10b8
 81e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 821:	8b 45 f0             	mov    -0x10(%ebp),%eax
 824:	8b 00                	mov    (%eax),%eax
 826:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 829:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82c:	8b 40 04             	mov    0x4(%eax),%eax
 82f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 832:	72 4d                	jb     881 <malloc+0xa6>
      if(p->s.size == nunits)
 834:	8b 45 f4             	mov    -0xc(%ebp),%eax
 837:	8b 40 04             	mov    0x4(%eax),%eax
 83a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 83d:	75 0c                	jne    84b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 83f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 842:	8b 10                	mov    (%eax),%edx
 844:	8b 45 f0             	mov    -0x10(%ebp),%eax
 847:	89 10                	mov    %edx,(%eax)
 849:	eb 26                	jmp    871 <malloc+0x96>
      else {
        p->s.size -= nunits;
 84b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84e:	8b 40 04             	mov    0x4(%eax),%eax
 851:	2b 45 ec             	sub    -0x14(%ebp),%eax
 854:	89 c2                	mov    %eax,%edx
 856:	8b 45 f4             	mov    -0xc(%ebp),%eax
 859:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 85c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85f:	8b 40 04             	mov    0x4(%eax),%eax
 862:	c1 e0 03             	shl    $0x3,%eax
 865:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 868:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 86e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 871:	8b 45 f0             	mov    -0x10(%ebp),%eax
 874:	a3 bc 10 00 00       	mov    %eax,0x10bc
      return (void*)(p + 1);
 879:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87c:	83 c0 08             	add    $0x8,%eax
 87f:	eb 38                	jmp    8b9 <malloc+0xde>
    }
    if(p == freep)
 881:	a1 bc 10 00 00       	mov    0x10bc,%eax
 886:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 889:	75 1b                	jne    8a6 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 88b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 88e:	89 04 24             	mov    %eax,(%esp)
 891:	e8 ed fe ff ff       	call   783 <morecore>
 896:	89 45 f4             	mov    %eax,-0xc(%ebp)
 899:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 89d:	75 07                	jne    8a6 <malloc+0xcb>
        return 0;
 89f:	b8 00 00 00 00       	mov    $0x0,%eax
 8a4:	eb 13                	jmp    8b9 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8ac:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8af:	8b 00                	mov    (%eax),%eax
 8b1:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8b4:	e9 70 ff ff ff       	jmp    829 <malloc+0x4e>
}
 8b9:	c9                   	leave  
 8ba:	c3                   	ret    

000008bb <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 8bb:	55                   	push   %ebp
 8bc:	89 e5                	mov    %esp,%ebp
 8be:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8c1:	8b 55 08             	mov    0x8(%ebp),%edx
 8c4:	8b 45 0c             	mov    0xc(%ebp),%eax
 8c7:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8ca:	f0 87 02             	lock xchg %eax,(%edx)
 8cd:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 8d0:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8d3:	c9                   	leave  
 8d4:	c3                   	ret    

000008d5 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 8d5:	55                   	push   %ebp
 8d6:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 8d8:	8b 45 08             	mov    0x8(%ebp),%eax
 8db:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 8e1:	5d                   	pop    %ebp
 8e2:	c3                   	ret    

000008e3 <lock_acquire>:
void lock_acquire(lock_t *lock){
 8e3:	55                   	push   %ebp
 8e4:	89 e5                	mov    %esp,%ebp
 8e6:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 8e9:	90                   	nop
 8ea:	8b 45 08             	mov    0x8(%ebp),%eax
 8ed:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8f4:	00 
 8f5:	89 04 24             	mov    %eax,(%esp)
 8f8:	e8 be ff ff ff       	call   8bb <xchg>
 8fd:	85 c0                	test   %eax,%eax
 8ff:	75 e9                	jne    8ea <lock_acquire+0x7>
}
 901:	c9                   	leave  
 902:	c3                   	ret    

00000903 <lock_release>:
void lock_release(lock_t *lock){
 903:	55                   	push   %ebp
 904:	89 e5                	mov    %esp,%ebp
 906:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 909:	8b 45 08             	mov    0x8(%ebp),%eax
 90c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 913:	00 
 914:	89 04 24             	mov    %eax,(%esp)
 917:	e8 9f ff ff ff       	call   8bb <xchg>
}
 91c:	c9                   	leave  
 91d:	c3                   	ret    

0000091e <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 91e:	55                   	push   %ebp
 91f:	89 e5                	mov    %esp,%ebp
 921:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 924:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 92b:	e8 ab fe ff ff       	call   7db <malloc>
 930:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 933:	8b 45 f4             	mov    -0xc(%ebp),%eax
 936:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 939:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93c:	25 ff 0f 00 00       	and    $0xfff,%eax
 941:	85 c0                	test   %eax,%eax
 943:	74 14                	je     959 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 945:	8b 45 f4             	mov    -0xc(%ebp),%eax
 948:	25 ff 0f 00 00       	and    $0xfff,%eax
 94d:	89 c2                	mov    %eax,%edx
 94f:	b8 00 10 00 00       	mov    $0x1000,%eax
 954:	29 d0                	sub    %edx,%eax
 956:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 959:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 95d:	75 1b                	jne    97a <thread_create+0x5c>

        printf(1,"malloc fail \n");
 95f:	c7 44 24 04 90 0c 00 	movl   $0xc90,0x4(%esp)
 966:	00 
 967:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 96e:	e8 7c fb ff ff       	call   4ef <printf>
        return 0;
 973:	b8 00 00 00 00       	mov    $0x0,%eax
 978:	eb 6f                	jmp    9e9 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 97a:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 97d:	8b 55 08             	mov    0x8(%ebp),%edx
 980:	8b 45 f4             	mov    -0xc(%ebp),%eax
 983:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 987:	89 54 24 08          	mov    %edx,0x8(%esp)
 98b:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 992:	00 
 993:	89 04 24             	mov    %eax,(%esp)
 996:	e8 4c fa ff ff       	call   3e7 <clone>
 99b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 99e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9a2:	79 1b                	jns    9bf <thread_create+0xa1>
        printf(1,"clone fails\n");
 9a4:	c7 44 24 04 9e 0c 00 	movl   $0xc9e,0x4(%esp)
 9ab:	00 
 9ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9b3:	e8 37 fb ff ff       	call   4ef <printf>
        return 0;
 9b8:	b8 00 00 00 00       	mov    $0x0,%eax
 9bd:	eb 2a                	jmp    9e9 <thread_create+0xcb>
    }
    if(tid > 0){
 9bf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9c3:	7e 05                	jle    9ca <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 9c5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9c8:	eb 1f                	jmp    9e9 <thread_create+0xcb>
    }
    if(tid == 0){
 9ca:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9ce:	75 14                	jne    9e4 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 9d0:	c7 44 24 04 ab 0c 00 	movl   $0xcab,0x4(%esp)
 9d7:	00 
 9d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9df:	e8 0b fb ff ff       	call   4ef <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 9e4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 9e9:	c9                   	leave  
 9ea:	c3                   	ret    

000009eb <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 9eb:	55                   	push   %ebp
 9ec:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 9ee:	8b 45 08             	mov    0x8(%ebp),%eax
 9f1:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 9f7:	8b 45 08             	mov    0x8(%ebp),%eax
 9fa:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 a01:	8b 45 08             	mov    0x8(%ebp),%eax
 a04:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 a0b:	5d                   	pop    %ebp
 a0c:	c3                   	ret    

00000a0d <add_q>:

void add_q(struct queue *q, int v){
 a0d:	55                   	push   %ebp
 a0e:	89 e5                	mov    %esp,%ebp
 a10:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 a13:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 a1a:	e8 bc fd ff ff       	call   7db <malloc>
 a1f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 a22:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a25:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 a2c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2f:	8b 55 0c             	mov    0xc(%ebp),%edx
 a32:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 a34:	8b 45 08             	mov    0x8(%ebp),%eax
 a37:	8b 40 04             	mov    0x4(%eax),%eax
 a3a:	85 c0                	test   %eax,%eax
 a3c:	75 0b                	jne    a49 <add_q+0x3c>
        q->head = n;
 a3e:	8b 45 08             	mov    0x8(%ebp),%eax
 a41:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a44:	89 50 04             	mov    %edx,0x4(%eax)
 a47:	eb 0c                	jmp    a55 <add_q+0x48>
    }else{
        q->tail->next = n;
 a49:	8b 45 08             	mov    0x8(%ebp),%eax
 a4c:	8b 40 08             	mov    0x8(%eax),%eax
 a4f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a52:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 a55:	8b 45 08             	mov    0x8(%ebp),%eax
 a58:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a5b:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 a5e:	8b 45 08             	mov    0x8(%ebp),%eax
 a61:	8b 00                	mov    (%eax),%eax
 a63:	8d 50 01             	lea    0x1(%eax),%edx
 a66:	8b 45 08             	mov    0x8(%ebp),%eax
 a69:	89 10                	mov    %edx,(%eax)
}
 a6b:	c9                   	leave  
 a6c:	c3                   	ret    

00000a6d <empty_q>:

int empty_q(struct queue *q){
 a6d:	55                   	push   %ebp
 a6e:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 a70:	8b 45 08             	mov    0x8(%ebp),%eax
 a73:	8b 00                	mov    (%eax),%eax
 a75:	85 c0                	test   %eax,%eax
 a77:	75 07                	jne    a80 <empty_q+0x13>
        return 1;
 a79:	b8 01 00 00 00       	mov    $0x1,%eax
 a7e:	eb 05                	jmp    a85 <empty_q+0x18>
    else
        return 0;
 a80:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 a85:	5d                   	pop    %ebp
 a86:	c3                   	ret    

00000a87 <pop_q>:
int pop_q(struct queue *q){
 a87:	55                   	push   %ebp
 a88:	89 e5                	mov    %esp,%ebp
 a8a:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 a8d:	8b 45 08             	mov    0x8(%ebp),%eax
 a90:	89 04 24             	mov    %eax,(%esp)
 a93:	e8 d5 ff ff ff       	call   a6d <empty_q>
 a98:	85 c0                	test   %eax,%eax
 a9a:	75 5d                	jne    af9 <pop_q+0x72>
       val = q->head->value; 
 a9c:	8b 45 08             	mov    0x8(%ebp),%eax
 a9f:	8b 40 04             	mov    0x4(%eax),%eax
 aa2:	8b 00                	mov    (%eax),%eax
 aa4:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 aa7:	8b 45 08             	mov    0x8(%ebp),%eax
 aaa:	8b 40 04             	mov    0x4(%eax),%eax
 aad:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 ab0:	8b 45 08             	mov    0x8(%ebp),%eax
 ab3:	8b 40 04             	mov    0x4(%eax),%eax
 ab6:	8b 50 04             	mov    0x4(%eax),%edx
 ab9:	8b 45 08             	mov    0x8(%ebp),%eax
 abc:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 abf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac2:	89 04 24             	mov    %eax,(%esp)
 ac5:	e8 d8 fb ff ff       	call   6a2 <free>
       q->size--;
 aca:	8b 45 08             	mov    0x8(%ebp),%eax
 acd:	8b 00                	mov    (%eax),%eax
 acf:	8d 50 ff             	lea    -0x1(%eax),%edx
 ad2:	8b 45 08             	mov    0x8(%ebp),%eax
 ad5:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 ad7:	8b 45 08             	mov    0x8(%ebp),%eax
 ada:	8b 00                	mov    (%eax),%eax
 adc:	85 c0                	test   %eax,%eax
 ade:	75 14                	jne    af4 <pop_q+0x6d>
            q->head = 0;
 ae0:	8b 45 08             	mov    0x8(%ebp),%eax
 ae3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 aea:	8b 45 08             	mov    0x8(%ebp),%eax
 aed:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 af4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af7:	eb 05                	jmp    afe <pop_q+0x77>
    }
    return -1;
 af9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 afe:	c9                   	leave  
 aff:	c3                   	ret    

00000b00 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 b00:	55                   	push   %ebp
 b01:	89 e5                	mov    %esp,%ebp
 b03:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 b06:	8b 45 08             	mov    0x8(%ebp),%eax
 b09:	8b 55 0c             	mov    0xc(%ebp),%edx
 b0c:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 b0f:	8b 45 08             	mov    0x8(%ebp),%eax
 b12:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 b19:	8b 45 08             	mov    0x8(%ebp),%eax
 b1c:	89 04 24             	mov    %eax,(%esp)
 b1f:	e8 b1 fd ff ff       	call   8d5 <lock_init>
}
 b24:	c9                   	leave  
 b25:	c3                   	ret    

00000b26 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 b26:	55                   	push   %ebp
 b27:	89 e5                	mov    %esp,%ebp
 b29:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 b2c:	8b 45 08             	mov    0x8(%ebp),%eax
 b2f:	89 04 24             	mov    %eax,(%esp)
 b32:	e8 ac fd ff ff       	call   8e3 <lock_acquire>
	if(s->count  == 0){
 b37:	8b 45 08             	mov    0x8(%ebp),%eax
 b3a:	8b 40 04             	mov    0x4(%eax),%eax
 b3d:	85 c0                	test   %eax,%eax
 b3f:	75 2f                	jne    b70 <sem_aquire+0x4a>
		//add proc to waiters list
		int tid = getpid();
 b41:	e8 81 f8 ff ff       	call   3c7 <getpid>
 b46:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 b49:	8b 45 08             	mov    0x8(%ebp),%eax
 b4c:	8d 50 0c             	lea    0xc(%eax),%edx
 b4f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b52:	89 44 24 04          	mov    %eax,0x4(%esp)
 b56:	89 14 24             	mov    %edx,(%esp)
 b59:	e8 af fe ff ff       	call   a0d <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 b5e:	8b 45 08             	mov    0x8(%ebp),%eax
 b61:	89 04 24             	mov    %eax,(%esp)
 b64:	e8 9a fd ff ff       	call   903 <lock_release>
		tsleep(); 
 b69:	e8 89 f8 ff ff       	call   3f7 <tsleep>
 b6e:	eb 1a                	jmp    b8a <sem_aquire+0x64>
	}
	else{
		s->count--;	
 b70:	8b 45 08             	mov    0x8(%ebp),%eax
 b73:	8b 40 04             	mov    0x4(%eax),%eax
 b76:	8d 50 ff             	lea    -0x1(%eax),%edx
 b79:	8b 45 08             	mov    0x8(%ebp),%eax
 b7c:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 b7f:	8b 45 08             	mov    0x8(%ebp),%eax
 b82:	89 04 24             	mov    %eax,(%esp)
 b85:	e8 79 fd ff ff       	call   903 <lock_release>
	}
}
 b8a:	c9                   	leave  
 b8b:	c3                   	ret    

00000b8c <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 b8c:	55                   	push   %ebp
 b8d:	89 e5                	mov    %esp,%ebp
 b8f:	83 ec 28             	sub    $0x28,%esp
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 b92:	8b 45 08             	mov    0x8(%ebp),%eax
 b95:	89 04 24             	mov    %eax,(%esp)
 b98:	e8 46 fd ff ff       	call   8e3 <lock_acquire>
	if(s->count < s->size){
 b9d:	8b 45 08             	mov    0x8(%ebp),%eax
 ba0:	8b 50 04             	mov    0x4(%eax),%edx
 ba3:	8b 45 08             	mov    0x8(%ebp),%eax
 ba6:	8b 40 08             	mov    0x8(%eax),%eax
 ba9:	39 c2                	cmp    %eax,%edx
 bab:	7d 40                	jge    bed <sem_signal+0x61>
		int tid;
		tid = pop_q(&s->waiters);
 bad:	8b 45 08             	mov    0x8(%ebp),%eax
 bb0:	83 c0 0c             	add    $0xc,%eax
 bb3:	89 04 24             	mov    %eax,(%esp)
 bb6:	e8 cc fe ff ff       	call   a87 <pop_q>
 bbb:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if(tid != -1) twakeup(tid);
 bbe:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 bc2:	74 0d                	je     bd1 <sem_signal+0x45>
 bc4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc7:	89 04 24             	mov    %eax,(%esp)
 bca:	e8 30 f8 ff ff       	call   3ff <twakeup>
 bcf:	eb 0f                	jmp    be0 <sem_signal+0x54>
		else s->count++;	
 bd1:	8b 45 08             	mov    0x8(%ebp),%eax
 bd4:	8b 40 04             	mov    0x4(%eax),%eax
 bd7:	8d 50 01             	lea    0x1(%eax),%edx
 bda:	8b 45 08             	mov    0x8(%ebp),%eax
 bdd:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 be0:	8b 45 08             	mov    0x8(%ebp),%eax
 be3:	89 04 24             	mov    %eax,(%esp)
 be6:	e8 18 fd ff ff       	call   903 <lock_release>
 beb:	eb 27                	jmp    c14 <sem_signal+0x88>
	}
	else{
		int tid;
		tid = pop_q(&s->waiters);
 bed:	8b 45 08             	mov    0x8(%ebp),%eax
 bf0:	83 c0 0c             	add    $0xc,%eax
 bf3:	89 04 24             	mov    %eax,(%esp)
 bf6:	e8 8c fe ff ff       	call   a87 <pop_q>
 bfb:	89 45 f0             	mov    %eax,-0x10(%ebp)
		twakeup(tid);
 bfe:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c01:	89 04 24             	mov    %eax,(%esp)
 c04:	e8 f6 f7 ff ff       	call   3ff <twakeup>
		lock_release(&s->lock);
 c09:	8b 45 08             	mov    0x8(%ebp),%eax
 c0c:	89 04 24             	mov    %eax,(%esp)
 c0f:	e8 ef fc ff ff       	call   903 <lock_release>
	}

 c14:	c9                   	leave  
 c15:	c3                   	ret    
