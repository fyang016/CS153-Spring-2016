
_hello:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
#include "types.h"
#include "user.h"

int main(int argc, char *argv[])
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
	printf(1,"Hello my name is'%s'\n", argv[0]);
   9:	8b 45 0c             	mov    0xc(%ebp),%eax
   c:	8b 00                	mov    (%eax),%eax
   e:	89 44 24 08          	mov    %eax,0x8(%esp)
  12:	c7 44 24 04 f4 08 00 	movl   $0x8f4,0x4(%esp)
  19:	00 
  1a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  21:	e8 07 05 00 00       	call   52d <printf>
	printf(1,"Creating Child Process\n");
  26:	c7 44 24 04 0a 09 00 	movl   $0x90a,0x4(%esp)
  2d:	00 
  2e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  35:	e8 f3 04 00 00       	call   52d <printf>
	int pid = fork(); //Create a child Process
  3a:	e8 55 03 00 00       	call   394 <fork>
  3f:	89 44 24 1c          	mov    %eax,0x1c(%esp)
	if(pid == 0){
  43:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  48:	75 36                	jne    80 <main+0x80>
		printf(1, "I'm the child going to sleep\n");
  4a:	c7 44 24 04 22 09 00 	movl   $0x922,0x4(%esp)
  51:	00 
  52:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  59:	e8 cf 04 00 00       	call   52d <printf>
		sleep(300);
  5e:	c7 04 24 2c 01 00 00 	movl   $0x12c,(%esp)
  65:	e8 ca 03 00 00       	call   434 <sleep>
		printf(1, "Child Process finished\n");
  6a:	c7 44 24 04 40 09 00 	movl   $0x940,0x4(%esp)
  71:	00 
  72:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  79:	e8 af 04 00 00       	call   52d <printf>
  7e:	eb 4c                	jmp    cc <main+0xcc>
	}
	else{
		printf(1, "I'm the parent waiting on child\n");
  80:	c7 44 24 04 58 09 00 	movl   $0x958,0x4(%esp)
  87:	00 
  88:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  8f:	e8 99 04 00 00       	call   52d <printf>
		printf(1, "Result %d\n", wait(0));
  94:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  9b:	e8 04 03 00 00       	call   3a4 <wait>
  a0:	89 44 24 08          	mov    %eax,0x8(%esp)
  a4:	c7 44 24 04 79 09 00 	movl   $0x979,0x4(%esp)
  ab:	00 
  ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  b3:	e8 75 04 00 00       	call   52d <printf>
		printf(1, "Parent Process Has finished\n");
  b8:	c7 44 24 04 84 09 00 	movl   $0x984,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 61 04 00 00       	call   52d <printf>
	}
	int status = 2;
  cc:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
  d3:	00 
	printf(1, "Result from last wait: %d", waitpid(status,&status,status));
  d4:	8b 54 24 18          	mov    0x18(%esp),%edx
  d8:	8b 44 24 18          	mov    0x18(%esp),%eax
  dc:	89 54 24 08          	mov    %edx,0x8(%esp)
  e0:	8d 54 24 18          	lea    0x18(%esp),%edx
  e4:	89 54 24 04          	mov    %edx,0x4(%esp)
  e8:	89 04 24             	mov    %eax,(%esp)
  eb:	e8 bc 02 00 00       	call   3ac <waitpid>
  f0:	89 44 24 08          	mov    %eax,0x8(%esp)
  f4:	c7 44 24 04 a1 09 00 	movl   $0x9a1,0x4(%esp)
  fb:	00 
  fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 103:	e8 25 04 00 00       	call   52d <printf>
	printf(1, "Result from last wait: %d", change_priority(63));
 108:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
 10f:	e8 38 03 00 00       	call   44c <change_priority>
 114:	89 44 24 08          	mov    %eax,0x8(%esp)
 118:	c7 44 24 04 a1 09 00 	movl   $0x9a1,0x4(%esp)
 11f:	00 
 120:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 127:	e8 01 04 00 00       	call   52d <printf>
	exit(0);
 12c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 133:	e8 64 02 00 00       	call   39c <exit>

00000138 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 138:	55                   	push   %ebp
 139:	89 e5                	mov    %esp,%ebp
 13b:	57                   	push   %edi
 13c:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 13d:	8b 4d 08             	mov    0x8(%ebp),%ecx
 140:	8b 55 10             	mov    0x10(%ebp),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	89 cb                	mov    %ecx,%ebx
 148:	89 df                	mov    %ebx,%edi
 14a:	89 d1                	mov    %edx,%ecx
 14c:	fc                   	cld    
 14d:	f3 aa                	rep stos %al,%es:(%edi)
 14f:	89 ca                	mov    %ecx,%edx
 151:	89 fb                	mov    %edi,%ebx
 153:	89 5d 08             	mov    %ebx,0x8(%ebp)
 156:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 159:	5b                   	pop    %ebx
 15a:	5f                   	pop    %edi
 15b:	5d                   	pop    %ebp
 15c:	c3                   	ret    

0000015d <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 15d:	55                   	push   %ebp
 15e:	89 e5                	mov    %esp,%ebp
 160:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 163:	8b 45 08             	mov    0x8(%ebp),%eax
 166:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 169:	8b 45 0c             	mov    0xc(%ebp),%eax
 16c:	0f b6 10             	movzbl (%eax),%edx
 16f:	8b 45 08             	mov    0x8(%ebp),%eax
 172:	88 10                	mov    %dl,(%eax)
 174:	8b 45 08             	mov    0x8(%ebp),%eax
 177:	0f b6 00             	movzbl (%eax),%eax
 17a:	84 c0                	test   %al,%al
 17c:	0f 95 c0             	setne  %al
 17f:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 183:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 187:	84 c0                	test   %al,%al
 189:	75 de                	jne    169 <strcpy+0xc>
    ;
  return os;
 18b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 18e:	c9                   	leave  
 18f:	c3                   	ret    

00000190 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 190:	55                   	push   %ebp
 191:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 193:	eb 08                	jmp    19d <strcmp+0xd>
    p++, q++;
 195:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 199:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 19d:	8b 45 08             	mov    0x8(%ebp),%eax
 1a0:	0f b6 00             	movzbl (%eax),%eax
 1a3:	84 c0                	test   %al,%al
 1a5:	74 10                	je     1b7 <strcmp+0x27>
 1a7:	8b 45 08             	mov    0x8(%ebp),%eax
 1aa:	0f b6 10             	movzbl (%eax),%edx
 1ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 1b0:	0f b6 00             	movzbl (%eax),%eax
 1b3:	38 c2                	cmp    %al,%dl
 1b5:	74 de                	je     195 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 1b7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ba:	0f b6 00             	movzbl (%eax),%eax
 1bd:	0f b6 d0             	movzbl %al,%edx
 1c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 1c3:	0f b6 00             	movzbl (%eax),%eax
 1c6:	0f b6 c0             	movzbl %al,%eax
 1c9:	89 d1                	mov    %edx,%ecx
 1cb:	29 c1                	sub    %eax,%ecx
 1cd:	89 c8                	mov    %ecx,%eax
}
 1cf:	5d                   	pop    %ebp
 1d0:	c3                   	ret    

000001d1 <strlen>:

uint
strlen(char *s)
{
 1d1:	55                   	push   %ebp
 1d2:	89 e5                	mov    %esp,%ebp
 1d4:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1d7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1de:	eb 04                	jmp    1e4 <strlen+0x13>
 1e0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1e4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1e7:	03 45 08             	add    0x8(%ebp),%eax
 1ea:	0f b6 00             	movzbl (%eax),%eax
 1ed:	84 c0                	test   %al,%al
 1ef:	75 ef                	jne    1e0 <strlen+0xf>
    ;
  return n;
 1f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1f4:	c9                   	leave  
 1f5:	c3                   	ret    

000001f6 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1f6:	55                   	push   %ebp
 1f7:	89 e5                	mov    %esp,%ebp
 1f9:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1fc:	8b 45 10             	mov    0x10(%ebp),%eax
 1ff:	89 44 24 08          	mov    %eax,0x8(%esp)
 203:	8b 45 0c             	mov    0xc(%ebp),%eax
 206:	89 44 24 04          	mov    %eax,0x4(%esp)
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	89 04 24             	mov    %eax,(%esp)
 210:	e8 23 ff ff ff       	call   138 <stosb>
  return dst;
 215:	8b 45 08             	mov    0x8(%ebp),%eax
}
 218:	c9                   	leave  
 219:	c3                   	ret    

0000021a <strchr>:

char*
strchr(const char *s, char c)
{
 21a:	55                   	push   %ebp
 21b:	89 e5                	mov    %esp,%ebp
 21d:	83 ec 04             	sub    $0x4,%esp
 220:	8b 45 0c             	mov    0xc(%ebp),%eax
 223:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 226:	eb 14                	jmp    23c <strchr+0x22>
    if(*s == c)
 228:	8b 45 08             	mov    0x8(%ebp),%eax
 22b:	0f b6 00             	movzbl (%eax),%eax
 22e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 231:	75 05                	jne    238 <strchr+0x1e>
      return (char*)s;
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	eb 13                	jmp    24b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 238:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 23c:	8b 45 08             	mov    0x8(%ebp),%eax
 23f:	0f b6 00             	movzbl (%eax),%eax
 242:	84 c0                	test   %al,%al
 244:	75 e2                	jne    228 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 246:	b8 00 00 00 00       	mov    $0x0,%eax
}
 24b:	c9                   	leave  
 24c:	c3                   	ret    

0000024d <gets>:

char*
gets(char *buf, int max)
{
 24d:	55                   	push   %ebp
 24e:	89 e5                	mov    %esp,%ebp
 250:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 253:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 25a:	eb 44                	jmp    2a0 <gets+0x53>
    cc = read(0, &c, 1);
 25c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 263:	00 
 264:	8d 45 ef             	lea    -0x11(%ebp),%eax
 267:	89 44 24 04          	mov    %eax,0x4(%esp)
 26b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 272:	e8 45 01 00 00       	call   3bc <read>
 277:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 27a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 27e:	7e 2d                	jle    2ad <gets+0x60>
      break;
    buf[i++] = c;
 280:	8b 45 f0             	mov    -0x10(%ebp),%eax
 283:	03 45 08             	add    0x8(%ebp),%eax
 286:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 28a:	88 10                	mov    %dl,(%eax)
 28c:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 290:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 294:	3c 0a                	cmp    $0xa,%al
 296:	74 16                	je     2ae <gets+0x61>
 298:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 29c:	3c 0d                	cmp    $0xd,%al
 29e:	74 0e                	je     2ae <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2a3:	83 c0 01             	add    $0x1,%eax
 2a6:	3b 45 0c             	cmp    0xc(%ebp),%eax
 2a9:	7c b1                	jl     25c <gets+0xf>
 2ab:	eb 01                	jmp    2ae <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 2ad:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 2ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2b1:	03 45 08             	add    0x8(%ebp),%eax
 2b4:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2b7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2ba:	c9                   	leave  
 2bb:	c3                   	ret    

000002bc <stat>:

int
stat(char *n, struct stat *st)
{
 2bc:	55                   	push   %ebp
 2bd:	89 e5                	mov    %esp,%ebp
 2bf:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2c2:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2c9:	00 
 2ca:	8b 45 08             	mov    0x8(%ebp),%eax
 2cd:	89 04 24             	mov    %eax,(%esp)
 2d0:	e8 0f 01 00 00       	call   3e4 <open>
 2d5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 2d8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2dc:	79 07                	jns    2e5 <stat+0x29>
    return -1;
 2de:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2e3:	eb 23                	jmp    308 <stat+0x4c>
  r = fstat(fd, st);
 2e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 2e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 2ec:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2ef:	89 04 24             	mov    %eax,(%esp)
 2f2:	e8 05 01 00 00       	call   3fc <fstat>
 2f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 2fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2fd:	89 04 24             	mov    %eax,(%esp)
 300:	e8 c7 00 00 00       	call   3cc <close>
  return r;
 305:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 308:	c9                   	leave  
 309:	c3                   	ret    

0000030a <atoi>:

int
atoi(const char *s)
{
 30a:	55                   	push   %ebp
 30b:	89 e5                	mov    %esp,%ebp
 30d:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 310:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 317:	eb 24                	jmp    33d <atoi+0x33>
    n = n*10 + *s++ - '0';
 319:	8b 55 fc             	mov    -0x4(%ebp),%edx
 31c:	89 d0                	mov    %edx,%eax
 31e:	c1 e0 02             	shl    $0x2,%eax
 321:	01 d0                	add    %edx,%eax
 323:	01 c0                	add    %eax,%eax
 325:	89 c2                	mov    %eax,%edx
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	0f b6 00             	movzbl (%eax),%eax
 32d:	0f be c0             	movsbl %al,%eax
 330:	8d 04 02             	lea    (%edx,%eax,1),%eax
 333:	83 e8 30             	sub    $0x30,%eax
 336:	89 45 fc             	mov    %eax,-0x4(%ebp)
 339:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 33d:	8b 45 08             	mov    0x8(%ebp),%eax
 340:	0f b6 00             	movzbl (%eax),%eax
 343:	3c 2f                	cmp    $0x2f,%al
 345:	7e 0a                	jle    351 <atoi+0x47>
 347:	8b 45 08             	mov    0x8(%ebp),%eax
 34a:	0f b6 00             	movzbl (%eax),%eax
 34d:	3c 39                	cmp    $0x39,%al
 34f:	7e c8                	jle    319 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 351:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 354:	c9                   	leave  
 355:	c3                   	ret    

00000356 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 356:	55                   	push   %ebp
 357:	89 e5                	mov    %esp,%ebp
 359:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
 35f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 362:	8b 45 0c             	mov    0xc(%ebp),%eax
 365:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 368:	eb 13                	jmp    37d <memmove+0x27>
    *dst++ = *src++;
 36a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 36d:	0f b6 10             	movzbl (%eax),%edx
 370:	8b 45 f8             	mov    -0x8(%ebp),%eax
 373:	88 10                	mov    %dl,(%eax)
 375:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 379:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 37d:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 381:	0f 9f c0             	setg   %al
 384:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 388:	84 c0                	test   %al,%al
 38a:	75 de                	jne    36a <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 38c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 38f:	c9                   	leave  
 390:	c3                   	ret    
 391:	90                   	nop
 392:	90                   	nop
 393:	90                   	nop

00000394 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 394:	b8 01 00 00 00       	mov    $0x1,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <exit>:
SYSCALL(exit)
 39c:	b8 02 00 00 00       	mov    $0x2,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <wait>:
SYSCALL(wait)
 3a4:	b8 03 00 00 00       	mov    $0x3,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <waitpid>:
SYSCALL(waitpid)
 3ac:	b8 17 00 00 00       	mov    $0x17,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <pipe>:
SYSCALL(pipe)
 3b4:	b8 04 00 00 00       	mov    $0x4,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <read>:
SYSCALL(read)
 3bc:	b8 05 00 00 00       	mov    $0x5,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <write>:
SYSCALL(write)
 3c4:	b8 10 00 00 00       	mov    $0x10,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <close>:
SYSCALL(close)
 3cc:	b8 15 00 00 00       	mov    $0x15,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <kill>:
SYSCALL(kill)
 3d4:	b8 06 00 00 00       	mov    $0x6,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <exec>:
SYSCALL(exec)
 3dc:	b8 07 00 00 00       	mov    $0x7,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <open>:
SYSCALL(open)
 3e4:	b8 0f 00 00 00       	mov    $0xf,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <mknod>:
SYSCALL(mknod)
 3ec:	b8 11 00 00 00       	mov    $0x11,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <unlink>:
SYSCALL(unlink)
 3f4:	b8 12 00 00 00       	mov    $0x12,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <fstat>:
SYSCALL(fstat)
 3fc:	b8 08 00 00 00       	mov    $0x8,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <link>:
SYSCALL(link)
 404:	b8 13 00 00 00       	mov    $0x13,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <mkdir>:
SYSCALL(mkdir)
 40c:	b8 14 00 00 00       	mov    $0x14,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <chdir>:
SYSCALL(chdir)
 414:	b8 09 00 00 00       	mov    $0x9,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <dup>:
SYSCALL(dup)
 41c:	b8 0a 00 00 00       	mov    $0xa,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <getpid>:
SYSCALL(getpid)
 424:	b8 0b 00 00 00       	mov    $0xb,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <sbrk>:
SYSCALL(sbrk)
 42c:	b8 0c 00 00 00       	mov    $0xc,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <sleep>:
SYSCALL(sleep)
 434:	b8 0d 00 00 00       	mov    $0xd,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <uptime>:
SYSCALL(uptime)
 43c:	b8 0e 00 00 00       	mov    $0xe,%eax
 441:	cd 40                	int    $0x40
 443:	c3                   	ret    

00000444 <count>:
SYSCALL(count)
 444:	b8 16 00 00 00       	mov    $0x16,%eax
 449:	cd 40                	int    $0x40
 44b:	c3                   	ret    

0000044c <change_priority>:
SYSCALL(change_priority)
 44c:	b8 18 00 00 00       	mov    $0x18,%eax
 451:	cd 40                	int    $0x40
 453:	c3                   	ret    

00000454 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 454:	55                   	push   %ebp
 455:	89 e5                	mov    %esp,%ebp
 457:	83 ec 28             	sub    $0x28,%esp
 45a:	8b 45 0c             	mov    0xc(%ebp),%eax
 45d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 460:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 467:	00 
 468:	8d 45 f4             	lea    -0xc(%ebp),%eax
 46b:	89 44 24 04          	mov    %eax,0x4(%esp)
 46f:	8b 45 08             	mov    0x8(%ebp),%eax
 472:	89 04 24             	mov    %eax,(%esp)
 475:	e8 4a ff ff ff       	call   3c4 <write>
}
 47a:	c9                   	leave  
 47b:	c3                   	ret    

0000047c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 47c:	55                   	push   %ebp
 47d:	89 e5                	mov    %esp,%ebp
 47f:	53                   	push   %ebx
 480:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 483:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 48a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 48e:	74 17                	je     4a7 <printint+0x2b>
 490:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 494:	79 11                	jns    4a7 <printint+0x2b>
    neg = 1;
 496:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 49d:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a0:	f7 d8                	neg    %eax
 4a2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 4a5:	eb 06                	jmp    4ad <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 4a7:	8b 45 0c             	mov    0xc(%ebp),%eax
 4aa:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 4ad:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 4b4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 4b7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4ba:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4bd:	ba 00 00 00 00       	mov    $0x0,%edx
 4c2:	f7 f3                	div    %ebx
 4c4:	89 d0                	mov    %edx,%eax
 4c6:	0f b6 80 c4 09 00 00 	movzbl 0x9c4(%eax),%eax
 4cd:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 4d1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 4d5:	8b 45 10             	mov    0x10(%ebp),%eax
 4d8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4db:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4de:	ba 00 00 00 00       	mov    $0x0,%edx
 4e3:	f7 75 d4             	divl   -0x2c(%ebp)
 4e6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4e9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4ed:	75 c5                	jne    4b4 <printint+0x38>
  if(neg)
 4ef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4f3:	74 28                	je     51d <printint+0xa1>
    buf[i++] = '-';
 4f5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4f8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4fd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 501:	eb 1a                	jmp    51d <printint+0xa1>
    putc(fd, buf[i]);
 503:	8b 45 ec             	mov    -0x14(%ebp),%eax
 506:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 50b:	0f be c0             	movsbl %al,%eax
 50e:	89 44 24 04          	mov    %eax,0x4(%esp)
 512:	8b 45 08             	mov    0x8(%ebp),%eax
 515:	89 04 24             	mov    %eax,(%esp)
 518:	e8 37 ff ff ff       	call   454 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 51d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 521:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 525:	79 dc                	jns    503 <printint+0x87>
    putc(fd, buf[i]);
}
 527:	83 c4 44             	add    $0x44,%esp
 52a:	5b                   	pop    %ebx
 52b:	5d                   	pop    %ebp
 52c:	c3                   	ret    

0000052d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 52d:	55                   	push   %ebp
 52e:	89 e5                	mov    %esp,%ebp
 530:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 533:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 53a:	8d 45 0c             	lea    0xc(%ebp),%eax
 53d:	83 c0 04             	add    $0x4,%eax
 540:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 543:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 54a:	e9 7e 01 00 00       	jmp    6cd <printf+0x1a0>
    c = fmt[i] & 0xff;
 54f:	8b 55 0c             	mov    0xc(%ebp),%edx
 552:	8b 45 ec             	mov    -0x14(%ebp),%eax
 555:	8d 04 02             	lea    (%edx,%eax,1),%eax
 558:	0f b6 00             	movzbl (%eax),%eax
 55b:	0f be c0             	movsbl %al,%eax
 55e:	25 ff 00 00 00       	and    $0xff,%eax
 563:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 566:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 56a:	75 2c                	jne    598 <printf+0x6b>
      if(c == '%'){
 56c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 570:	75 0c                	jne    57e <printf+0x51>
        state = '%';
 572:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 579:	e9 4b 01 00 00       	jmp    6c9 <printf+0x19c>
      } else {
        putc(fd, c);
 57e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 581:	0f be c0             	movsbl %al,%eax
 584:	89 44 24 04          	mov    %eax,0x4(%esp)
 588:	8b 45 08             	mov    0x8(%ebp),%eax
 58b:	89 04 24             	mov    %eax,(%esp)
 58e:	e8 c1 fe ff ff       	call   454 <putc>
 593:	e9 31 01 00 00       	jmp    6c9 <printf+0x19c>
      }
    } else if(state == '%'){
 598:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 59c:	0f 85 27 01 00 00    	jne    6c9 <printf+0x19c>
      if(c == 'd'){
 5a2:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 5a6:	75 2d                	jne    5d5 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 5a8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ab:	8b 00                	mov    (%eax),%eax
 5ad:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5b4:	00 
 5b5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5bc:	00 
 5bd:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c1:	8b 45 08             	mov    0x8(%ebp),%eax
 5c4:	89 04 24             	mov    %eax,(%esp)
 5c7:	e8 b0 fe ff ff       	call   47c <printint>
        ap++;
 5cc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5d0:	e9 ed 00 00 00       	jmp    6c2 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 5d5:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 5d9:	74 06                	je     5e1 <printf+0xb4>
 5db:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 5df:	75 2d                	jne    60e <printf+0xe1>
        printint(fd, *ap, 16, 0);
 5e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5e4:	8b 00                	mov    (%eax),%eax
 5e6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5ed:	00 
 5ee:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5f5:	00 
 5f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5fa:	8b 45 08             	mov    0x8(%ebp),%eax
 5fd:	89 04 24             	mov    %eax,(%esp)
 600:	e8 77 fe ff ff       	call   47c <printint>
        ap++;
 605:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 609:	e9 b4 00 00 00       	jmp    6c2 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 60e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 612:	75 46                	jne    65a <printf+0x12d>
        s = (char*)*ap;
 614:	8b 45 f4             	mov    -0xc(%ebp),%eax
 617:	8b 00                	mov    (%eax),%eax
 619:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 61c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 620:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 624:	75 27                	jne    64d <printf+0x120>
          s = "(null)";
 626:	c7 45 e4 bb 09 00 00 	movl   $0x9bb,-0x1c(%ebp)
        while(*s != 0){
 62d:	eb 1f                	jmp    64e <printf+0x121>
          putc(fd, *s);
 62f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 632:	0f b6 00             	movzbl (%eax),%eax
 635:	0f be c0             	movsbl %al,%eax
 638:	89 44 24 04          	mov    %eax,0x4(%esp)
 63c:	8b 45 08             	mov    0x8(%ebp),%eax
 63f:	89 04 24             	mov    %eax,(%esp)
 642:	e8 0d fe ff ff       	call   454 <putc>
          s++;
 647:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 64b:	eb 01                	jmp    64e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 64d:	90                   	nop
 64e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 651:	0f b6 00             	movzbl (%eax),%eax
 654:	84 c0                	test   %al,%al
 656:	75 d7                	jne    62f <printf+0x102>
 658:	eb 68                	jmp    6c2 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 65a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 65e:	75 1d                	jne    67d <printf+0x150>
        putc(fd, *ap);
 660:	8b 45 f4             	mov    -0xc(%ebp),%eax
 663:	8b 00                	mov    (%eax),%eax
 665:	0f be c0             	movsbl %al,%eax
 668:	89 44 24 04          	mov    %eax,0x4(%esp)
 66c:	8b 45 08             	mov    0x8(%ebp),%eax
 66f:	89 04 24             	mov    %eax,(%esp)
 672:	e8 dd fd ff ff       	call   454 <putc>
        ap++;
 677:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 67b:	eb 45                	jmp    6c2 <printf+0x195>
      } else if(c == '%'){
 67d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 681:	75 17                	jne    69a <printf+0x16d>
        putc(fd, c);
 683:	8b 45 e8             	mov    -0x18(%ebp),%eax
 686:	0f be c0             	movsbl %al,%eax
 689:	89 44 24 04          	mov    %eax,0x4(%esp)
 68d:	8b 45 08             	mov    0x8(%ebp),%eax
 690:	89 04 24             	mov    %eax,(%esp)
 693:	e8 bc fd ff ff       	call   454 <putc>
 698:	eb 28                	jmp    6c2 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 69a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 6a1:	00 
 6a2:	8b 45 08             	mov    0x8(%ebp),%eax
 6a5:	89 04 24             	mov    %eax,(%esp)
 6a8:	e8 a7 fd ff ff       	call   454 <putc>
        putc(fd, c);
 6ad:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6b0:	0f be c0             	movsbl %al,%eax
 6b3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b7:	8b 45 08             	mov    0x8(%ebp),%eax
 6ba:	89 04 24             	mov    %eax,(%esp)
 6bd:	e8 92 fd ff ff       	call   454 <putc>
      }
      state = 0;
 6c2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6c9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 6cd:	8b 55 0c             	mov    0xc(%ebp),%edx
 6d0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6d3:	8d 04 02             	lea    (%edx,%eax,1),%eax
 6d6:	0f b6 00             	movzbl (%eax),%eax
 6d9:	84 c0                	test   %al,%al
 6db:	0f 85 6e fe ff ff    	jne    54f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6e1:	c9                   	leave  
 6e2:	c3                   	ret    
 6e3:	90                   	nop

000006e4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e4:	55                   	push   %ebp
 6e5:	89 e5                	mov    %esp,%ebp
 6e7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6ea:	8b 45 08             	mov    0x8(%ebp),%eax
 6ed:	83 e8 08             	sub    $0x8,%eax
 6f0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6f3:	a1 e0 09 00 00       	mov    0x9e0,%eax
 6f8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6fb:	eb 24                	jmp    721 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 700:	8b 00                	mov    (%eax),%eax
 702:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 705:	77 12                	ja     719 <free+0x35>
 707:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 70d:	77 24                	ja     733 <free+0x4f>
 70f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 712:	8b 00                	mov    (%eax),%eax
 714:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 717:	77 1a                	ja     733 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 719:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71c:	8b 00                	mov    (%eax),%eax
 71e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 721:	8b 45 f8             	mov    -0x8(%ebp),%eax
 724:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 727:	76 d4                	jbe    6fd <free+0x19>
 729:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72c:	8b 00                	mov    (%eax),%eax
 72e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 731:	76 ca                	jbe    6fd <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 733:	8b 45 f8             	mov    -0x8(%ebp),%eax
 736:	8b 40 04             	mov    0x4(%eax),%eax
 739:	c1 e0 03             	shl    $0x3,%eax
 73c:	89 c2                	mov    %eax,%edx
 73e:	03 55 f8             	add    -0x8(%ebp),%edx
 741:	8b 45 fc             	mov    -0x4(%ebp),%eax
 744:	8b 00                	mov    (%eax),%eax
 746:	39 c2                	cmp    %eax,%edx
 748:	75 24                	jne    76e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 74a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74d:	8b 50 04             	mov    0x4(%eax),%edx
 750:	8b 45 fc             	mov    -0x4(%ebp),%eax
 753:	8b 00                	mov    (%eax),%eax
 755:	8b 40 04             	mov    0x4(%eax),%eax
 758:	01 c2                	add    %eax,%edx
 75a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 760:	8b 45 fc             	mov    -0x4(%ebp),%eax
 763:	8b 00                	mov    (%eax),%eax
 765:	8b 10                	mov    (%eax),%edx
 767:	8b 45 f8             	mov    -0x8(%ebp),%eax
 76a:	89 10                	mov    %edx,(%eax)
 76c:	eb 0a                	jmp    778 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 76e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 771:	8b 10                	mov    (%eax),%edx
 773:	8b 45 f8             	mov    -0x8(%ebp),%eax
 776:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 778:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77b:	8b 40 04             	mov    0x4(%eax),%eax
 77e:	c1 e0 03             	shl    $0x3,%eax
 781:	03 45 fc             	add    -0x4(%ebp),%eax
 784:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 787:	75 20                	jne    7a9 <free+0xc5>
    p->s.size += bp->s.size;
 789:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78c:	8b 50 04             	mov    0x4(%eax),%edx
 78f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 792:	8b 40 04             	mov    0x4(%eax),%eax
 795:	01 c2                	add    %eax,%edx
 797:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 79d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a0:	8b 10                	mov    (%eax),%edx
 7a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a5:	89 10                	mov    %edx,(%eax)
 7a7:	eb 08                	jmp    7b1 <free+0xcd>
  } else
    p->s.ptr = bp;
 7a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ac:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7af:	89 10                	mov    %edx,(%eax)
  freep = p;
 7b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b4:	a3 e0 09 00 00       	mov    %eax,0x9e0
}
 7b9:	c9                   	leave  
 7ba:	c3                   	ret    

000007bb <morecore>:

static Header*
morecore(uint nu)
{
 7bb:	55                   	push   %ebp
 7bc:	89 e5                	mov    %esp,%ebp
 7be:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7c1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7c8:	77 07                	ja     7d1 <morecore+0x16>
    nu = 4096;
 7ca:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7d1:	8b 45 08             	mov    0x8(%ebp),%eax
 7d4:	c1 e0 03             	shl    $0x3,%eax
 7d7:	89 04 24             	mov    %eax,(%esp)
 7da:	e8 4d fc ff ff       	call   42c <sbrk>
 7df:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 7e2:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 7e6:	75 07                	jne    7ef <morecore+0x34>
    return 0;
 7e8:	b8 00 00 00 00       	mov    $0x0,%eax
 7ed:	eb 22                	jmp    811 <morecore+0x56>
  hp = (Header*)p;
 7ef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 7f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f8:	8b 55 08             	mov    0x8(%ebp),%edx
 7fb:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
 801:	83 c0 08             	add    $0x8,%eax
 804:	89 04 24             	mov    %eax,(%esp)
 807:	e8 d8 fe ff ff       	call   6e4 <free>
  return freep;
 80c:	a1 e0 09 00 00       	mov    0x9e0,%eax
}
 811:	c9                   	leave  
 812:	c3                   	ret    

00000813 <malloc>:

void*
malloc(uint nbytes)
{
 813:	55                   	push   %ebp
 814:	89 e5                	mov    %esp,%ebp
 816:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 819:	8b 45 08             	mov    0x8(%ebp),%eax
 81c:	83 c0 07             	add    $0x7,%eax
 81f:	c1 e8 03             	shr    $0x3,%eax
 822:	83 c0 01             	add    $0x1,%eax
 825:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 828:	a1 e0 09 00 00       	mov    0x9e0,%eax
 82d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 830:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 834:	75 23                	jne    859 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 836:	c7 45 f0 d8 09 00 00 	movl   $0x9d8,-0x10(%ebp)
 83d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 840:	a3 e0 09 00 00       	mov    %eax,0x9e0
 845:	a1 e0 09 00 00       	mov    0x9e0,%eax
 84a:	a3 d8 09 00 00       	mov    %eax,0x9d8
    base.s.size = 0;
 84f:	c7 05 dc 09 00 00 00 	movl   $0x0,0x9dc
 856:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 859:	8b 45 f0             	mov    -0x10(%ebp),%eax
 85c:	8b 00                	mov    (%eax),%eax
 85e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 861:	8b 45 ec             	mov    -0x14(%ebp),%eax
 864:	8b 40 04             	mov    0x4(%eax),%eax
 867:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 86a:	72 4d                	jb     8b9 <malloc+0xa6>
      if(p->s.size == nunits)
 86c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 86f:	8b 40 04             	mov    0x4(%eax),%eax
 872:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 875:	75 0c                	jne    883 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 877:	8b 45 ec             	mov    -0x14(%ebp),%eax
 87a:	8b 10                	mov    (%eax),%edx
 87c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87f:	89 10                	mov    %edx,(%eax)
 881:	eb 26                	jmp    8a9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 883:	8b 45 ec             	mov    -0x14(%ebp),%eax
 886:	8b 40 04             	mov    0x4(%eax),%eax
 889:	89 c2                	mov    %eax,%edx
 88b:	2b 55 f4             	sub    -0xc(%ebp),%edx
 88e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 891:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 894:	8b 45 ec             	mov    -0x14(%ebp),%eax
 897:	8b 40 04             	mov    0x4(%eax),%eax
 89a:	c1 e0 03             	shl    $0x3,%eax
 89d:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 8a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8a3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 8a6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ac:	a3 e0 09 00 00       	mov    %eax,0x9e0
      return (void*)(p + 1);
 8b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8b4:	83 c0 08             	add    $0x8,%eax
 8b7:	eb 38                	jmp    8f1 <malloc+0xde>
    }
    if(p == freep)
 8b9:	a1 e0 09 00 00       	mov    0x9e0,%eax
 8be:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 8c1:	75 1b                	jne    8de <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8c6:	89 04 24             	mov    %eax,(%esp)
 8c9:	e8 ed fe ff ff       	call   7bb <morecore>
 8ce:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8d1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8d5:	75 07                	jne    8de <malloc+0xcb>
        return 0;
 8d7:	b8 00 00 00 00       	mov    $0x0,%eax
 8dc:	eb 13                	jmp    8f1 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8de:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8e7:	8b 00                	mov    (%eax),%eax
 8e9:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8ec:	e9 70 ff ff ff       	jmp    861 <malloc+0x4e>
}
 8f1:	c9                   	leave  
 8f2:	c3                   	ret    
