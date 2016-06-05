
_init:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:

char *argv[] = { "sh", 0 };

int
main(void)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 e4 f0             	and    $0xfffffff0,%esp
   6:	83 ec 20             	sub    $0x20,%esp
  int pid, wpid;

  if(open("console", O_RDWR) < 0){
   9:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  10:	00 
  11:	c7 04 24 7d 0c 00 00 	movl   $0xc7d,(%esp)
  18:	e8 9a 03 00 00       	call   3b7 <open>
  1d:	85 c0                	test   %eax,%eax
  1f:	79 30                	jns    51 <main+0x51>
    mknod("console", 1, 1);
  21:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
  28:	00 
  29:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
  30:	00 
  31:	c7 04 24 7d 0c 00 00 	movl   $0xc7d,(%esp)
  38:	e8 82 03 00 00       	call   3bf <mknod>
    open("console", O_RDWR);
  3d:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
  44:	00 
  45:	c7 04 24 7d 0c 00 00 	movl   $0xc7d,(%esp)
  4c:	e8 66 03 00 00       	call   3b7 <open>
  }
  dup(0);  // stdout
  51:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  58:	e8 92 03 00 00       	call   3ef <dup>
  dup(0);  // stderr
  5d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  64:	e8 86 03 00 00       	call   3ef <dup>

  for(;;){
    printf(1, "init: starting sh\n");
  69:	c7 44 24 04 85 0c 00 	movl   $0xc85,0x4(%esp)
  70:	00 
  71:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  78:	e8 a2 04 00 00       	call   51f <printf>
    pid = fork();
  7d:	e8 ed 02 00 00       	call   36f <fork>
  82:	89 44 24 1c          	mov    %eax,0x1c(%esp)
    if(pid < 0){
  86:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  8b:	79 19                	jns    a6 <main+0xa6>
      printf(1, "init: fork failed\n");
  8d:	c7 44 24 04 98 0c 00 	movl   $0xc98,0x4(%esp)
  94:	00 
  95:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  9c:	e8 7e 04 00 00       	call   51f <printf>
      exit();
  a1:	e8 d1 02 00 00       	call   377 <exit>
    }
    if(pid == 0){
  a6:	83 7c 24 1c 00       	cmpl   $0x0,0x1c(%esp)
  ab:	75 2d                	jne    da <main+0xda>
      exec("sh", argv);
  ad:	c7 44 24 04 d8 10 00 	movl   $0x10d8,0x4(%esp)
  b4:	00 
  b5:	c7 04 24 7a 0c 00 00 	movl   $0xc7a,(%esp)
  bc:	e8 ee 02 00 00       	call   3af <exec>
      printf(1, "init: exec sh failed\n");
  c1:	c7 44 24 04 ab 0c 00 	movl   $0xcab,0x4(%esp)
  c8:	00 
  c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d0:	e8 4a 04 00 00       	call   51f <printf>
      exit();
  d5:	e8 9d 02 00 00       	call   377 <exit>
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  da:	eb 14                	jmp    f0 <main+0xf0>
      printf(1, "zombie!\n");
  dc:	c7 44 24 04 c1 0c 00 	movl   $0xcc1,0x4(%esp)
  e3:	00 
  e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  eb:	e8 2f 04 00 00       	call   51f <printf>
    if(pid == 0){
      exec("sh", argv);
      printf(1, "init: exec sh failed\n");
      exit();
    }
    while((wpid=wait()) >= 0 && wpid != pid)
  f0:	e8 8a 02 00 00       	call   37f <wait>
  f5:	89 44 24 18          	mov    %eax,0x18(%esp)
  f9:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  fe:	78 0a                	js     10a <main+0x10a>
 100:	8b 44 24 18          	mov    0x18(%esp),%eax
 104:	3b 44 24 1c          	cmp    0x1c(%esp),%eax
 108:	75 d2                	jne    dc <main+0xdc>
      printf(1, "zombie!\n");
  }
 10a:	e9 5a ff ff ff       	jmp    69 <main+0x69>

0000010f <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 10f:	55                   	push   %ebp
 110:	89 e5                	mov    %esp,%ebp
 112:	57                   	push   %edi
 113:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 114:	8b 4d 08             	mov    0x8(%ebp),%ecx
 117:	8b 55 10             	mov    0x10(%ebp),%edx
 11a:	8b 45 0c             	mov    0xc(%ebp),%eax
 11d:	89 cb                	mov    %ecx,%ebx
 11f:	89 df                	mov    %ebx,%edi
 121:	89 d1                	mov    %edx,%ecx
 123:	fc                   	cld    
 124:	f3 aa                	rep stos %al,%es:(%edi)
 126:	89 ca                	mov    %ecx,%edx
 128:	89 fb                	mov    %edi,%ebx
 12a:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12d:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 130:	5b                   	pop    %ebx
 131:	5f                   	pop    %edi
 132:	5d                   	pop    %ebp
 133:	c3                   	ret    

00000134 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 134:	55                   	push   %ebp
 135:	89 e5                	mov    %esp,%ebp
 137:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13a:	8b 45 08             	mov    0x8(%ebp),%eax
 13d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 140:	90                   	nop
 141:	8b 45 08             	mov    0x8(%ebp),%eax
 144:	8d 50 01             	lea    0x1(%eax),%edx
 147:	89 55 08             	mov    %edx,0x8(%ebp)
 14a:	8b 55 0c             	mov    0xc(%ebp),%edx
 14d:	8d 4a 01             	lea    0x1(%edx),%ecx
 150:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 153:	0f b6 12             	movzbl (%edx),%edx
 156:	88 10                	mov    %dl,(%eax)
 158:	0f b6 00             	movzbl (%eax),%eax
 15b:	84 c0                	test   %al,%al
 15d:	75 e2                	jne    141 <strcpy+0xd>
    ;
  return os;
 15f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 162:	c9                   	leave  
 163:	c3                   	ret    

00000164 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 164:	55                   	push   %ebp
 165:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 167:	eb 08                	jmp    171 <strcmp+0xd>
    p++, q++;
 169:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 16d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 171:	8b 45 08             	mov    0x8(%ebp),%eax
 174:	0f b6 00             	movzbl (%eax),%eax
 177:	84 c0                	test   %al,%al
 179:	74 10                	je     18b <strcmp+0x27>
 17b:	8b 45 08             	mov    0x8(%ebp),%eax
 17e:	0f b6 10             	movzbl (%eax),%edx
 181:	8b 45 0c             	mov    0xc(%ebp),%eax
 184:	0f b6 00             	movzbl (%eax),%eax
 187:	38 c2                	cmp    %al,%dl
 189:	74 de                	je     169 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 18b:	8b 45 08             	mov    0x8(%ebp),%eax
 18e:	0f b6 00             	movzbl (%eax),%eax
 191:	0f b6 d0             	movzbl %al,%edx
 194:	8b 45 0c             	mov    0xc(%ebp),%eax
 197:	0f b6 00             	movzbl (%eax),%eax
 19a:	0f b6 c0             	movzbl %al,%eax
 19d:	29 c2                	sub    %eax,%edx
 19f:	89 d0                	mov    %edx,%eax
}
 1a1:	5d                   	pop    %ebp
 1a2:	c3                   	ret    

000001a3 <strlen>:

uint
strlen(char *s)
{
 1a3:	55                   	push   %ebp
 1a4:	89 e5                	mov    %esp,%ebp
 1a6:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1a9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b0:	eb 04                	jmp    1b6 <strlen+0x13>
 1b2:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1b9:	8b 45 08             	mov    0x8(%ebp),%eax
 1bc:	01 d0                	add    %edx,%eax
 1be:	0f b6 00             	movzbl (%eax),%eax
 1c1:	84 c0                	test   %al,%al
 1c3:	75 ed                	jne    1b2 <strlen+0xf>
    ;
  return n;
 1c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1c8:	c9                   	leave  
 1c9:	c3                   	ret    

000001ca <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ca:	55                   	push   %ebp
 1cb:	89 e5                	mov    %esp,%ebp
 1cd:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d0:	8b 45 10             	mov    0x10(%ebp),%eax
 1d3:	89 44 24 08          	mov    %eax,0x8(%esp)
 1d7:	8b 45 0c             	mov    0xc(%ebp),%eax
 1da:	89 44 24 04          	mov    %eax,0x4(%esp)
 1de:	8b 45 08             	mov    0x8(%ebp),%eax
 1e1:	89 04 24             	mov    %eax,(%esp)
 1e4:	e8 26 ff ff ff       	call   10f <stosb>
  return dst;
 1e9:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1ec:	c9                   	leave  
 1ed:	c3                   	ret    

000001ee <strchr>:

char*
strchr(const char *s, char c)
{
 1ee:	55                   	push   %ebp
 1ef:	89 e5                	mov    %esp,%ebp
 1f1:	83 ec 04             	sub    $0x4,%esp
 1f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1fa:	eb 14                	jmp    210 <strchr+0x22>
    if(*s == c)
 1fc:	8b 45 08             	mov    0x8(%ebp),%eax
 1ff:	0f b6 00             	movzbl (%eax),%eax
 202:	3a 45 fc             	cmp    -0x4(%ebp),%al
 205:	75 05                	jne    20c <strchr+0x1e>
      return (char*)s;
 207:	8b 45 08             	mov    0x8(%ebp),%eax
 20a:	eb 13                	jmp    21f <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 20c:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	0f b6 00             	movzbl (%eax),%eax
 216:	84 c0                	test   %al,%al
 218:	75 e2                	jne    1fc <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 21a:	b8 00 00 00 00       	mov    $0x0,%eax
}
 21f:	c9                   	leave  
 220:	c3                   	ret    

00000221 <gets>:

char*
gets(char *buf, int max)
{
 221:	55                   	push   %ebp
 222:	89 e5                	mov    %esp,%ebp
 224:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 227:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 22e:	eb 4c                	jmp    27c <gets+0x5b>
    cc = read(0, &c, 1);
 230:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 237:	00 
 238:	8d 45 ef             	lea    -0x11(%ebp),%eax
 23b:	89 44 24 04          	mov    %eax,0x4(%esp)
 23f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 246:	e8 44 01 00 00       	call   38f <read>
 24b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 24e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 252:	7f 02                	jg     256 <gets+0x35>
      break;
 254:	eb 31                	jmp    287 <gets+0x66>
    buf[i++] = c;
 256:	8b 45 f4             	mov    -0xc(%ebp),%eax
 259:	8d 50 01             	lea    0x1(%eax),%edx
 25c:	89 55 f4             	mov    %edx,-0xc(%ebp)
 25f:	89 c2                	mov    %eax,%edx
 261:	8b 45 08             	mov    0x8(%ebp),%eax
 264:	01 c2                	add    %eax,%edx
 266:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 26a:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 26c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 270:	3c 0a                	cmp    $0xa,%al
 272:	74 13                	je     287 <gets+0x66>
 274:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 278:	3c 0d                	cmp    $0xd,%al
 27a:	74 0b                	je     287 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 27c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 27f:	83 c0 01             	add    $0x1,%eax
 282:	3b 45 0c             	cmp    0xc(%ebp),%eax
 285:	7c a9                	jl     230 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 287:	8b 55 f4             	mov    -0xc(%ebp),%edx
 28a:	8b 45 08             	mov    0x8(%ebp),%eax
 28d:	01 d0                	add    %edx,%eax
 28f:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 292:	8b 45 08             	mov    0x8(%ebp),%eax
}
 295:	c9                   	leave  
 296:	c3                   	ret    

00000297 <stat>:

int
stat(char *n, struct stat *st)
{
 297:	55                   	push   %ebp
 298:	89 e5                	mov    %esp,%ebp
 29a:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a4:	00 
 2a5:	8b 45 08             	mov    0x8(%ebp),%eax
 2a8:	89 04 24             	mov    %eax,(%esp)
 2ab:	e8 07 01 00 00       	call   3b7 <open>
 2b0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2b3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2b7:	79 07                	jns    2c0 <stat+0x29>
    return -1;
 2b9:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2be:	eb 23                	jmp    2e3 <stat+0x4c>
  r = fstat(fd, st);
 2c0:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2ca:	89 04 24             	mov    %eax,(%esp)
 2cd:	e8 fd 00 00 00       	call   3cf <fstat>
 2d2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d8:	89 04 24             	mov    %eax,(%esp)
 2db:	e8 bf 00 00 00       	call   39f <close>
  return r;
 2e0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2e3:	c9                   	leave  
 2e4:	c3                   	ret    

000002e5 <atoi>:

int
atoi(const char *s)
{
 2e5:	55                   	push   %ebp
 2e6:	89 e5                	mov    %esp,%ebp
 2e8:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2eb:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2f2:	eb 25                	jmp    319 <atoi+0x34>
    n = n*10 + *s++ - '0';
 2f4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2f7:	89 d0                	mov    %edx,%eax
 2f9:	c1 e0 02             	shl    $0x2,%eax
 2fc:	01 d0                	add    %edx,%eax
 2fe:	01 c0                	add    %eax,%eax
 300:	89 c1                	mov    %eax,%ecx
 302:	8b 45 08             	mov    0x8(%ebp),%eax
 305:	8d 50 01             	lea    0x1(%eax),%edx
 308:	89 55 08             	mov    %edx,0x8(%ebp)
 30b:	0f b6 00             	movzbl (%eax),%eax
 30e:	0f be c0             	movsbl %al,%eax
 311:	01 c8                	add    %ecx,%eax
 313:	83 e8 30             	sub    $0x30,%eax
 316:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 319:	8b 45 08             	mov    0x8(%ebp),%eax
 31c:	0f b6 00             	movzbl (%eax),%eax
 31f:	3c 2f                	cmp    $0x2f,%al
 321:	7e 0a                	jle    32d <atoi+0x48>
 323:	8b 45 08             	mov    0x8(%ebp),%eax
 326:	0f b6 00             	movzbl (%eax),%eax
 329:	3c 39                	cmp    $0x39,%al
 32b:	7e c7                	jle    2f4 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 32d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 330:	c9                   	leave  
 331:	c3                   	ret    

00000332 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 332:	55                   	push   %ebp
 333:	89 e5                	mov    %esp,%ebp
 335:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 338:	8b 45 08             	mov    0x8(%ebp),%eax
 33b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 33e:	8b 45 0c             	mov    0xc(%ebp),%eax
 341:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 344:	eb 17                	jmp    35d <memmove+0x2b>
    *dst++ = *src++;
 346:	8b 45 fc             	mov    -0x4(%ebp),%eax
 349:	8d 50 01             	lea    0x1(%eax),%edx
 34c:	89 55 fc             	mov    %edx,-0x4(%ebp)
 34f:	8b 55 f8             	mov    -0x8(%ebp),%edx
 352:	8d 4a 01             	lea    0x1(%edx),%ecx
 355:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 358:	0f b6 12             	movzbl (%edx),%edx
 35b:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 35d:	8b 45 10             	mov    0x10(%ebp),%eax
 360:	8d 50 ff             	lea    -0x1(%eax),%edx
 363:	89 55 10             	mov    %edx,0x10(%ebp)
 366:	85 c0                	test   %eax,%eax
 368:	7f dc                	jg     346 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 36a:	8b 45 08             	mov    0x8(%ebp),%eax
}
 36d:	c9                   	leave  
 36e:	c3                   	ret    

0000036f <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 36f:	b8 01 00 00 00       	mov    $0x1,%eax
 374:	cd 40                	int    $0x40
 376:	c3                   	ret    

00000377 <exit>:
SYSCALL(exit)
 377:	b8 02 00 00 00       	mov    $0x2,%eax
 37c:	cd 40                	int    $0x40
 37e:	c3                   	ret    

0000037f <wait>:
SYSCALL(wait)
 37f:	b8 03 00 00 00       	mov    $0x3,%eax
 384:	cd 40                	int    $0x40
 386:	c3                   	ret    

00000387 <pipe>:
SYSCALL(pipe)
 387:	b8 04 00 00 00       	mov    $0x4,%eax
 38c:	cd 40                	int    $0x40
 38e:	c3                   	ret    

0000038f <read>:
SYSCALL(read)
 38f:	b8 05 00 00 00       	mov    $0x5,%eax
 394:	cd 40                	int    $0x40
 396:	c3                   	ret    

00000397 <write>:
SYSCALL(write)
 397:	b8 10 00 00 00       	mov    $0x10,%eax
 39c:	cd 40                	int    $0x40
 39e:	c3                   	ret    

0000039f <close>:
SYSCALL(close)
 39f:	b8 15 00 00 00       	mov    $0x15,%eax
 3a4:	cd 40                	int    $0x40
 3a6:	c3                   	ret    

000003a7 <kill>:
SYSCALL(kill)
 3a7:	b8 06 00 00 00       	mov    $0x6,%eax
 3ac:	cd 40                	int    $0x40
 3ae:	c3                   	ret    

000003af <exec>:
SYSCALL(exec)
 3af:	b8 07 00 00 00       	mov    $0x7,%eax
 3b4:	cd 40                	int    $0x40
 3b6:	c3                   	ret    

000003b7 <open>:
SYSCALL(open)
 3b7:	b8 0f 00 00 00       	mov    $0xf,%eax
 3bc:	cd 40                	int    $0x40
 3be:	c3                   	ret    

000003bf <mknod>:
SYSCALL(mknod)
 3bf:	b8 11 00 00 00       	mov    $0x11,%eax
 3c4:	cd 40                	int    $0x40
 3c6:	c3                   	ret    

000003c7 <unlink>:
SYSCALL(unlink)
 3c7:	b8 12 00 00 00       	mov    $0x12,%eax
 3cc:	cd 40                	int    $0x40
 3ce:	c3                   	ret    

000003cf <fstat>:
SYSCALL(fstat)
 3cf:	b8 08 00 00 00       	mov    $0x8,%eax
 3d4:	cd 40                	int    $0x40
 3d6:	c3                   	ret    

000003d7 <link>:
SYSCALL(link)
 3d7:	b8 13 00 00 00       	mov    $0x13,%eax
 3dc:	cd 40                	int    $0x40
 3de:	c3                   	ret    

000003df <mkdir>:
SYSCALL(mkdir)
 3df:	b8 14 00 00 00       	mov    $0x14,%eax
 3e4:	cd 40                	int    $0x40
 3e6:	c3                   	ret    

000003e7 <chdir>:
SYSCALL(chdir)
 3e7:	b8 09 00 00 00       	mov    $0x9,%eax
 3ec:	cd 40                	int    $0x40
 3ee:	c3                   	ret    

000003ef <dup>:
SYSCALL(dup)
 3ef:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f4:	cd 40                	int    $0x40
 3f6:	c3                   	ret    

000003f7 <getpid>:
SYSCALL(getpid)
 3f7:	b8 0b 00 00 00       	mov    $0xb,%eax
 3fc:	cd 40                	int    $0x40
 3fe:	c3                   	ret    

000003ff <sbrk>:
SYSCALL(sbrk)
 3ff:	b8 0c 00 00 00       	mov    $0xc,%eax
 404:	cd 40                	int    $0x40
 406:	c3                   	ret    

00000407 <sleep>:
SYSCALL(sleep)
 407:	b8 0d 00 00 00       	mov    $0xd,%eax
 40c:	cd 40                	int    $0x40
 40e:	c3                   	ret    

0000040f <uptime>:
SYSCALL(uptime)
 40f:	b8 0e 00 00 00       	mov    $0xe,%eax
 414:	cd 40                	int    $0x40
 416:	c3                   	ret    

00000417 <clone>:
SYSCALL(clone)
 417:	b8 16 00 00 00       	mov    $0x16,%eax
 41c:	cd 40                	int    $0x40
 41e:	c3                   	ret    

0000041f <texit>:
SYSCALL(texit)
 41f:	b8 17 00 00 00       	mov    $0x17,%eax
 424:	cd 40                	int    $0x40
 426:	c3                   	ret    

00000427 <tsleep>:
SYSCALL(tsleep)
 427:	b8 18 00 00 00       	mov    $0x18,%eax
 42c:	cd 40                	int    $0x40
 42e:	c3                   	ret    

0000042f <twakeup>:
SYSCALL(twakeup)
 42f:	b8 19 00 00 00       	mov    $0x19,%eax
 434:	cd 40                	int    $0x40
 436:	c3                   	ret    

00000437 <test>:
SYSCALL(test)
 437:	b8 1a 00 00 00       	mov    $0x1a,%eax
 43c:	cd 40                	int    $0x40
 43e:	c3                   	ret    

0000043f <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 43f:	55                   	push   %ebp
 440:	89 e5                	mov    %esp,%ebp
 442:	83 ec 18             	sub    $0x18,%esp
 445:	8b 45 0c             	mov    0xc(%ebp),%eax
 448:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 44b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 452:	00 
 453:	8d 45 f4             	lea    -0xc(%ebp),%eax
 456:	89 44 24 04          	mov    %eax,0x4(%esp)
 45a:	8b 45 08             	mov    0x8(%ebp),%eax
 45d:	89 04 24             	mov    %eax,(%esp)
 460:	e8 32 ff ff ff       	call   397 <write>
}
 465:	c9                   	leave  
 466:	c3                   	ret    

00000467 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 467:	55                   	push   %ebp
 468:	89 e5                	mov    %esp,%ebp
 46a:	56                   	push   %esi
 46b:	53                   	push   %ebx
 46c:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 46f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 476:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 47a:	74 17                	je     493 <printint+0x2c>
 47c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 480:	79 11                	jns    493 <printint+0x2c>
    neg = 1;
 482:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 489:	8b 45 0c             	mov    0xc(%ebp),%eax
 48c:	f7 d8                	neg    %eax
 48e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 491:	eb 06                	jmp    499 <printint+0x32>
  } else {
    x = xx;
 493:	8b 45 0c             	mov    0xc(%ebp),%eax
 496:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 499:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4a0:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4a3:	8d 41 01             	lea    0x1(%ecx),%eax
 4a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4a9:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4ac:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4af:	ba 00 00 00 00       	mov    $0x0,%edx
 4b4:	f7 f3                	div    %ebx
 4b6:	89 d0                	mov    %edx,%eax
 4b8:	0f b6 80 e0 10 00 00 	movzbl 0x10e0(%eax),%eax
 4bf:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4c3:	8b 75 10             	mov    0x10(%ebp),%esi
 4c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c9:	ba 00 00 00 00       	mov    $0x0,%edx
 4ce:	f7 f6                	div    %esi
 4d0:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4d3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4d7:	75 c7                	jne    4a0 <printint+0x39>
  if(neg)
 4d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4dd:	74 10                	je     4ef <printint+0x88>
    buf[i++] = '-';
 4df:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4e2:	8d 50 01             	lea    0x1(%eax),%edx
 4e5:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4e8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4ed:	eb 1f                	jmp    50e <printint+0xa7>
 4ef:	eb 1d                	jmp    50e <printint+0xa7>
    putc(fd, buf[i]);
 4f1:	8d 55 dc             	lea    -0x24(%ebp),%edx
 4f4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f7:	01 d0                	add    %edx,%eax
 4f9:	0f b6 00             	movzbl (%eax),%eax
 4fc:	0f be c0             	movsbl %al,%eax
 4ff:	89 44 24 04          	mov    %eax,0x4(%esp)
 503:	8b 45 08             	mov    0x8(%ebp),%eax
 506:	89 04 24             	mov    %eax,(%esp)
 509:	e8 31 ff ff ff       	call   43f <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 50e:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 512:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 516:	79 d9                	jns    4f1 <printint+0x8a>
    putc(fd, buf[i]);
}
 518:	83 c4 30             	add    $0x30,%esp
 51b:	5b                   	pop    %ebx
 51c:	5e                   	pop    %esi
 51d:	5d                   	pop    %ebp
 51e:	c3                   	ret    

0000051f <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 51f:	55                   	push   %ebp
 520:	89 e5                	mov    %esp,%ebp
 522:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 525:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 52c:	8d 45 0c             	lea    0xc(%ebp),%eax
 52f:	83 c0 04             	add    $0x4,%eax
 532:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 535:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 53c:	e9 7c 01 00 00       	jmp    6bd <printf+0x19e>
    c = fmt[i] & 0xff;
 541:	8b 55 0c             	mov    0xc(%ebp),%edx
 544:	8b 45 f0             	mov    -0x10(%ebp),%eax
 547:	01 d0                	add    %edx,%eax
 549:	0f b6 00             	movzbl (%eax),%eax
 54c:	0f be c0             	movsbl %al,%eax
 54f:	25 ff 00 00 00       	and    $0xff,%eax
 554:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 557:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 55b:	75 2c                	jne    589 <printf+0x6a>
      if(c == '%'){
 55d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 561:	75 0c                	jne    56f <printf+0x50>
        state = '%';
 563:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 56a:	e9 4a 01 00 00       	jmp    6b9 <printf+0x19a>
      } else {
        putc(fd, c);
 56f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 572:	0f be c0             	movsbl %al,%eax
 575:	89 44 24 04          	mov    %eax,0x4(%esp)
 579:	8b 45 08             	mov    0x8(%ebp),%eax
 57c:	89 04 24             	mov    %eax,(%esp)
 57f:	e8 bb fe ff ff       	call   43f <putc>
 584:	e9 30 01 00 00       	jmp    6b9 <printf+0x19a>
      }
    } else if(state == '%'){
 589:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 58d:	0f 85 26 01 00 00    	jne    6b9 <printf+0x19a>
      if(c == 'd'){
 593:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 597:	75 2d                	jne    5c6 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 599:	8b 45 e8             	mov    -0x18(%ebp),%eax
 59c:	8b 00                	mov    (%eax),%eax
 59e:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5a5:	00 
 5a6:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5ad:	00 
 5ae:	89 44 24 04          	mov    %eax,0x4(%esp)
 5b2:	8b 45 08             	mov    0x8(%ebp),%eax
 5b5:	89 04 24             	mov    %eax,(%esp)
 5b8:	e8 aa fe ff ff       	call   467 <printint>
        ap++;
 5bd:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5c1:	e9 ec 00 00 00       	jmp    6b2 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5c6:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5ca:	74 06                	je     5d2 <printf+0xb3>
 5cc:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5d0:	75 2d                	jne    5ff <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5d2:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5d5:	8b 00                	mov    (%eax),%eax
 5d7:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5de:	00 
 5df:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5e6:	00 
 5e7:	89 44 24 04          	mov    %eax,0x4(%esp)
 5eb:	8b 45 08             	mov    0x8(%ebp),%eax
 5ee:	89 04 24             	mov    %eax,(%esp)
 5f1:	e8 71 fe ff ff       	call   467 <printint>
        ap++;
 5f6:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5fa:	e9 b3 00 00 00       	jmp    6b2 <printf+0x193>
      } else if(c == 's'){
 5ff:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 603:	75 45                	jne    64a <printf+0x12b>
        s = (char*)*ap;
 605:	8b 45 e8             	mov    -0x18(%ebp),%eax
 608:	8b 00                	mov    (%eax),%eax
 60a:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 60d:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 611:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 615:	75 09                	jne    620 <printf+0x101>
          s = "(null)";
 617:	c7 45 f4 ca 0c 00 00 	movl   $0xcca,-0xc(%ebp)
        while(*s != 0){
 61e:	eb 1e                	jmp    63e <printf+0x11f>
 620:	eb 1c                	jmp    63e <printf+0x11f>
          putc(fd, *s);
 622:	8b 45 f4             	mov    -0xc(%ebp),%eax
 625:	0f b6 00             	movzbl (%eax),%eax
 628:	0f be c0             	movsbl %al,%eax
 62b:	89 44 24 04          	mov    %eax,0x4(%esp)
 62f:	8b 45 08             	mov    0x8(%ebp),%eax
 632:	89 04 24             	mov    %eax,(%esp)
 635:	e8 05 fe ff ff       	call   43f <putc>
          s++;
 63a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 63e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 641:	0f b6 00             	movzbl (%eax),%eax
 644:	84 c0                	test   %al,%al
 646:	75 da                	jne    622 <printf+0x103>
 648:	eb 68                	jmp    6b2 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 64a:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 64e:	75 1d                	jne    66d <printf+0x14e>
        putc(fd, *ap);
 650:	8b 45 e8             	mov    -0x18(%ebp),%eax
 653:	8b 00                	mov    (%eax),%eax
 655:	0f be c0             	movsbl %al,%eax
 658:	89 44 24 04          	mov    %eax,0x4(%esp)
 65c:	8b 45 08             	mov    0x8(%ebp),%eax
 65f:	89 04 24             	mov    %eax,(%esp)
 662:	e8 d8 fd ff ff       	call   43f <putc>
        ap++;
 667:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 66b:	eb 45                	jmp    6b2 <printf+0x193>
      } else if(c == '%'){
 66d:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 671:	75 17                	jne    68a <printf+0x16b>
        putc(fd, c);
 673:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 676:	0f be c0             	movsbl %al,%eax
 679:	89 44 24 04          	mov    %eax,0x4(%esp)
 67d:	8b 45 08             	mov    0x8(%ebp),%eax
 680:	89 04 24             	mov    %eax,(%esp)
 683:	e8 b7 fd ff ff       	call   43f <putc>
 688:	eb 28                	jmp    6b2 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 68a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 691:	00 
 692:	8b 45 08             	mov    0x8(%ebp),%eax
 695:	89 04 24             	mov    %eax,(%esp)
 698:	e8 a2 fd ff ff       	call   43f <putc>
        putc(fd, c);
 69d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6a0:	0f be c0             	movsbl %al,%eax
 6a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a7:	8b 45 08             	mov    0x8(%ebp),%eax
 6aa:	89 04 24             	mov    %eax,(%esp)
 6ad:	e8 8d fd ff ff       	call   43f <putc>
      }
      state = 0;
 6b2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6b9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6bd:	8b 55 0c             	mov    0xc(%ebp),%edx
 6c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6c3:	01 d0                	add    %edx,%eax
 6c5:	0f b6 00             	movzbl (%eax),%eax
 6c8:	84 c0                	test   %al,%al
 6ca:	0f 85 71 fe ff ff    	jne    541 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6d0:	c9                   	leave  
 6d1:	c3                   	ret    

000006d2 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6d2:	55                   	push   %ebp
 6d3:	89 e5                	mov    %esp,%ebp
 6d5:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	83 e8 08             	sub    $0x8,%eax
 6de:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e1:	a1 fc 10 00 00       	mov    0x10fc,%eax
 6e6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6e9:	eb 24                	jmp    70f <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6eb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ee:	8b 00                	mov    (%eax),%eax
 6f0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f3:	77 12                	ja     707 <free+0x35>
 6f5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6fb:	77 24                	ja     721 <free+0x4f>
 6fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 700:	8b 00                	mov    (%eax),%eax
 702:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 705:	77 1a                	ja     721 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 707:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70a:	8b 00                	mov    (%eax),%eax
 70c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 70f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 712:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 715:	76 d4                	jbe    6eb <free+0x19>
 717:	8b 45 fc             	mov    -0x4(%ebp),%eax
 71a:	8b 00                	mov    (%eax),%eax
 71c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 71f:	76 ca                	jbe    6eb <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 721:	8b 45 f8             	mov    -0x8(%ebp),%eax
 724:	8b 40 04             	mov    0x4(%eax),%eax
 727:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 72e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 731:	01 c2                	add    %eax,%edx
 733:	8b 45 fc             	mov    -0x4(%ebp),%eax
 736:	8b 00                	mov    (%eax),%eax
 738:	39 c2                	cmp    %eax,%edx
 73a:	75 24                	jne    760 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 73c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73f:	8b 50 04             	mov    0x4(%eax),%edx
 742:	8b 45 fc             	mov    -0x4(%ebp),%eax
 745:	8b 00                	mov    (%eax),%eax
 747:	8b 40 04             	mov    0x4(%eax),%eax
 74a:	01 c2                	add    %eax,%edx
 74c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 74f:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 752:	8b 45 fc             	mov    -0x4(%ebp),%eax
 755:	8b 00                	mov    (%eax),%eax
 757:	8b 10                	mov    (%eax),%edx
 759:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75c:	89 10                	mov    %edx,(%eax)
 75e:	eb 0a                	jmp    76a <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 760:	8b 45 fc             	mov    -0x4(%ebp),%eax
 763:	8b 10                	mov    (%eax),%edx
 765:	8b 45 f8             	mov    -0x8(%ebp),%eax
 768:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 76a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76d:	8b 40 04             	mov    0x4(%eax),%eax
 770:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 777:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77a:	01 d0                	add    %edx,%eax
 77c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 77f:	75 20                	jne    7a1 <free+0xcf>
    p->s.size += bp->s.size;
 781:	8b 45 fc             	mov    -0x4(%ebp),%eax
 784:	8b 50 04             	mov    0x4(%eax),%edx
 787:	8b 45 f8             	mov    -0x8(%ebp),%eax
 78a:	8b 40 04             	mov    0x4(%eax),%eax
 78d:	01 c2                	add    %eax,%edx
 78f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 792:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 795:	8b 45 f8             	mov    -0x8(%ebp),%eax
 798:	8b 10                	mov    (%eax),%edx
 79a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79d:	89 10                	mov    %edx,(%eax)
 79f:	eb 08                	jmp    7a9 <free+0xd7>
  } else
    p->s.ptr = bp;
 7a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7a7:	89 10                	mov    %edx,(%eax)
  freep = p;
 7a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ac:	a3 fc 10 00 00       	mov    %eax,0x10fc
}
 7b1:	c9                   	leave  
 7b2:	c3                   	ret    

000007b3 <morecore>:

static Header*
morecore(uint nu)
{
 7b3:	55                   	push   %ebp
 7b4:	89 e5                	mov    %esp,%ebp
 7b6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7b9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7c0:	77 07                	ja     7c9 <morecore+0x16>
    nu = 4096;
 7c2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7c9:	8b 45 08             	mov    0x8(%ebp),%eax
 7cc:	c1 e0 03             	shl    $0x3,%eax
 7cf:	89 04 24             	mov    %eax,(%esp)
 7d2:	e8 28 fc ff ff       	call   3ff <sbrk>
 7d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7da:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7de:	75 07                	jne    7e7 <morecore+0x34>
    return 0;
 7e0:	b8 00 00 00 00       	mov    $0x0,%eax
 7e5:	eb 22                	jmp    809 <morecore+0x56>
  hp = (Header*)p;
 7e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7ea:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7ed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f0:	8b 55 08             	mov    0x8(%ebp),%edx
 7f3:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7f6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7f9:	83 c0 08             	add    $0x8,%eax
 7fc:	89 04 24             	mov    %eax,(%esp)
 7ff:	e8 ce fe ff ff       	call   6d2 <free>
  return freep;
 804:	a1 fc 10 00 00       	mov    0x10fc,%eax
}
 809:	c9                   	leave  
 80a:	c3                   	ret    

0000080b <malloc>:

void*
malloc(uint nbytes)
{
 80b:	55                   	push   %ebp
 80c:	89 e5                	mov    %esp,%ebp
 80e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 811:	8b 45 08             	mov    0x8(%ebp),%eax
 814:	83 c0 07             	add    $0x7,%eax
 817:	c1 e8 03             	shr    $0x3,%eax
 81a:	83 c0 01             	add    $0x1,%eax
 81d:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 820:	a1 fc 10 00 00       	mov    0x10fc,%eax
 825:	89 45 f0             	mov    %eax,-0x10(%ebp)
 828:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 82c:	75 23                	jne    851 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 82e:	c7 45 f0 f4 10 00 00 	movl   $0x10f4,-0x10(%ebp)
 835:	8b 45 f0             	mov    -0x10(%ebp),%eax
 838:	a3 fc 10 00 00       	mov    %eax,0x10fc
 83d:	a1 fc 10 00 00       	mov    0x10fc,%eax
 842:	a3 f4 10 00 00       	mov    %eax,0x10f4
    base.s.size = 0;
 847:	c7 05 f8 10 00 00 00 	movl   $0x0,0x10f8
 84e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 851:	8b 45 f0             	mov    -0x10(%ebp),%eax
 854:	8b 00                	mov    (%eax),%eax
 856:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 859:	8b 45 f4             	mov    -0xc(%ebp),%eax
 85c:	8b 40 04             	mov    0x4(%eax),%eax
 85f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 862:	72 4d                	jb     8b1 <malloc+0xa6>
      if(p->s.size == nunits)
 864:	8b 45 f4             	mov    -0xc(%ebp),%eax
 867:	8b 40 04             	mov    0x4(%eax),%eax
 86a:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 86d:	75 0c                	jne    87b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 86f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 872:	8b 10                	mov    (%eax),%edx
 874:	8b 45 f0             	mov    -0x10(%ebp),%eax
 877:	89 10                	mov    %edx,(%eax)
 879:	eb 26                	jmp    8a1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 87b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 87e:	8b 40 04             	mov    0x4(%eax),%eax
 881:	2b 45 ec             	sub    -0x14(%ebp),%eax
 884:	89 c2                	mov    %eax,%edx
 886:	8b 45 f4             	mov    -0xc(%ebp),%eax
 889:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 88c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88f:	8b 40 04             	mov    0x4(%eax),%eax
 892:	c1 e0 03             	shl    $0x3,%eax
 895:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 898:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89b:	8b 55 ec             	mov    -0x14(%ebp),%edx
 89e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8a4:	a3 fc 10 00 00       	mov    %eax,0x10fc
      return (void*)(p + 1);
 8a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ac:	83 c0 08             	add    $0x8,%eax
 8af:	eb 38                	jmp    8e9 <malloc+0xde>
    }
    if(p == freep)
 8b1:	a1 fc 10 00 00       	mov    0x10fc,%eax
 8b6:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8b9:	75 1b                	jne    8d6 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8bb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8be:	89 04 24             	mov    %eax,(%esp)
 8c1:	e8 ed fe ff ff       	call   7b3 <morecore>
 8c6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8c9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8cd:	75 07                	jne    8d6 <malloc+0xcb>
        return 0;
 8cf:	b8 00 00 00 00       	mov    $0x0,%eax
 8d4:	eb 13                	jmp    8e9 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8d6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8df:	8b 00                	mov    (%eax),%eax
 8e1:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8e4:	e9 70 ff ff ff       	jmp    859 <malloc+0x4e>
}
 8e9:	c9                   	leave  
 8ea:	c3                   	ret    

000008eb <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 8eb:	55                   	push   %ebp
 8ec:	89 e5                	mov    %esp,%ebp
 8ee:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8f1:	8b 55 08             	mov    0x8(%ebp),%edx
 8f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 8f7:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8fa:	f0 87 02             	lock xchg %eax,(%edx)
 8fd:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 900:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 903:	c9                   	leave  
 904:	c3                   	ret    

00000905 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 905:	55                   	push   %ebp
 906:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 908:	8b 45 08             	mov    0x8(%ebp),%eax
 90b:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 911:	5d                   	pop    %ebp
 912:	c3                   	ret    

00000913 <lock_acquire>:
void lock_acquire(lock_t *lock){
 913:	55                   	push   %ebp
 914:	89 e5                	mov    %esp,%ebp
 916:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 919:	90                   	nop
 91a:	8b 45 08             	mov    0x8(%ebp),%eax
 91d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 924:	00 
 925:	89 04 24             	mov    %eax,(%esp)
 928:	e8 be ff ff ff       	call   8eb <xchg>
 92d:	85 c0                	test   %eax,%eax
 92f:	75 e9                	jne    91a <lock_acquire+0x7>
}
 931:	c9                   	leave  
 932:	c3                   	ret    

00000933 <lock_release>:
void lock_release(lock_t *lock){
 933:	55                   	push   %ebp
 934:	89 e5                	mov    %esp,%ebp
 936:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 939:	8b 45 08             	mov    0x8(%ebp),%eax
 93c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 943:	00 
 944:	89 04 24             	mov    %eax,(%esp)
 947:	e8 9f ff ff ff       	call   8eb <xchg>
}
 94c:	c9                   	leave  
 94d:	c3                   	ret    

0000094e <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 94e:	55                   	push   %ebp
 94f:	89 e5                	mov    %esp,%ebp
 951:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 954:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 95b:	e8 ab fe ff ff       	call   80b <malloc>
 960:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 963:	8b 45 f4             	mov    -0xc(%ebp),%eax
 966:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 969:	8b 45 f4             	mov    -0xc(%ebp),%eax
 96c:	25 ff 0f 00 00       	and    $0xfff,%eax
 971:	85 c0                	test   %eax,%eax
 973:	74 14                	je     989 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 975:	8b 45 f4             	mov    -0xc(%ebp),%eax
 978:	25 ff 0f 00 00       	and    $0xfff,%eax
 97d:	89 c2                	mov    %eax,%edx
 97f:	b8 00 10 00 00       	mov    $0x1000,%eax
 984:	29 d0                	sub    %edx,%eax
 986:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 989:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 98d:	75 1b                	jne    9aa <thread_create+0x5c>

        printf(1,"malloc fail \n");
 98f:	c7 44 24 04 d1 0c 00 	movl   $0xcd1,0x4(%esp)
 996:	00 
 997:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 99e:	e8 7c fb ff ff       	call   51f <printf>
        return 0;
 9a3:	b8 00 00 00 00       	mov    $0x0,%eax
 9a8:	eb 6f                	jmp    a19 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 9aa:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 9ad:	8b 55 08             	mov    0x8(%ebp),%edx
 9b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9b3:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 9b7:	89 54 24 08          	mov    %edx,0x8(%esp)
 9bb:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 9c2:	00 
 9c3:	89 04 24             	mov    %eax,(%esp)
 9c6:	e8 4c fa ff ff       	call   417 <clone>
 9cb:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 9ce:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9d2:	79 1b                	jns    9ef <thread_create+0xa1>
        printf(1,"clone fails\n");
 9d4:	c7 44 24 04 df 0c 00 	movl   $0xcdf,0x4(%esp)
 9db:	00 
 9dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9e3:	e8 37 fb ff ff       	call   51f <printf>
        return 0;
 9e8:	b8 00 00 00 00       	mov    $0x0,%eax
 9ed:	eb 2a                	jmp    a19 <thread_create+0xcb>
    }
    if(tid > 0){
 9ef:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9f3:	7e 05                	jle    9fa <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 9f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9f8:	eb 1f                	jmp    a19 <thread_create+0xcb>
    }
    if(tid == 0){
 9fa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9fe:	75 14                	jne    a14 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 a00:	c7 44 24 04 ec 0c 00 	movl   $0xcec,0x4(%esp)
 a07:	00 
 a08:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a0f:	e8 0b fb ff ff       	call   51f <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 a14:	b8 00 00 00 00       	mov    $0x0,%eax
}
 a19:	c9                   	leave  
 a1a:	c3                   	ret    

00000a1b <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 a1b:	55                   	push   %ebp
 a1c:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 a1e:	8b 45 08             	mov    0x8(%ebp),%eax
 a21:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 a27:	8b 45 08             	mov    0x8(%ebp),%eax
 a2a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 a31:	8b 45 08             	mov    0x8(%ebp),%eax
 a34:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 a3b:	5d                   	pop    %ebp
 a3c:	c3                   	ret    

00000a3d <add_q>:

void add_q(struct queue *q, int v){
 a3d:	55                   	push   %ebp
 a3e:	89 e5                	mov    %esp,%ebp
 a40:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 a43:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 a4a:	e8 bc fd ff ff       	call   80b <malloc>
 a4f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 a52:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a55:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 a5c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a5f:	8b 55 0c             	mov    0xc(%ebp),%edx
 a62:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 a64:	8b 45 08             	mov    0x8(%ebp),%eax
 a67:	8b 40 04             	mov    0x4(%eax),%eax
 a6a:	85 c0                	test   %eax,%eax
 a6c:	75 0b                	jne    a79 <add_q+0x3c>
        q->head = n;
 a6e:	8b 45 08             	mov    0x8(%ebp),%eax
 a71:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a74:	89 50 04             	mov    %edx,0x4(%eax)
 a77:	eb 0c                	jmp    a85 <add_q+0x48>
    }else{
        q->tail->next = n;
 a79:	8b 45 08             	mov    0x8(%ebp),%eax
 a7c:	8b 40 08             	mov    0x8(%eax),%eax
 a7f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a82:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 a85:	8b 45 08             	mov    0x8(%ebp),%eax
 a88:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a8b:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 a8e:	8b 45 08             	mov    0x8(%ebp),%eax
 a91:	8b 00                	mov    (%eax),%eax
 a93:	8d 50 01             	lea    0x1(%eax),%edx
 a96:	8b 45 08             	mov    0x8(%ebp),%eax
 a99:	89 10                	mov    %edx,(%eax)
}
 a9b:	c9                   	leave  
 a9c:	c3                   	ret    

00000a9d <empty_q>:

int empty_q(struct queue *q){
 a9d:	55                   	push   %ebp
 a9e:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 aa0:	8b 45 08             	mov    0x8(%ebp),%eax
 aa3:	8b 00                	mov    (%eax),%eax
 aa5:	85 c0                	test   %eax,%eax
 aa7:	75 07                	jne    ab0 <empty_q+0x13>
        return 1;
 aa9:	b8 01 00 00 00       	mov    $0x1,%eax
 aae:	eb 05                	jmp    ab5 <empty_q+0x18>
    else
        return 0;
 ab0:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 ab5:	5d                   	pop    %ebp
 ab6:	c3                   	ret    

00000ab7 <pop_q>:
int pop_q(struct queue *q){
 ab7:	55                   	push   %ebp
 ab8:	89 e5                	mov    %esp,%ebp
 aba:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 abd:	8b 45 08             	mov    0x8(%ebp),%eax
 ac0:	89 04 24             	mov    %eax,(%esp)
 ac3:	e8 d5 ff ff ff       	call   a9d <empty_q>
 ac8:	85 c0                	test   %eax,%eax
 aca:	75 5d                	jne    b29 <pop_q+0x72>
       val = q->head->value; 
 acc:	8b 45 08             	mov    0x8(%ebp),%eax
 acf:	8b 40 04             	mov    0x4(%eax),%eax
 ad2:	8b 00                	mov    (%eax),%eax
 ad4:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 ad7:	8b 45 08             	mov    0x8(%ebp),%eax
 ada:	8b 40 04             	mov    0x4(%eax),%eax
 add:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 ae0:	8b 45 08             	mov    0x8(%ebp),%eax
 ae3:	8b 40 04             	mov    0x4(%eax),%eax
 ae6:	8b 50 04             	mov    0x4(%eax),%edx
 ae9:	8b 45 08             	mov    0x8(%ebp),%eax
 aec:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 aef:	8b 45 f0             	mov    -0x10(%ebp),%eax
 af2:	89 04 24             	mov    %eax,(%esp)
 af5:	e8 d8 fb ff ff       	call   6d2 <free>
       q->size--;
 afa:	8b 45 08             	mov    0x8(%ebp),%eax
 afd:	8b 00                	mov    (%eax),%eax
 aff:	8d 50 ff             	lea    -0x1(%eax),%edx
 b02:	8b 45 08             	mov    0x8(%ebp),%eax
 b05:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 b07:	8b 45 08             	mov    0x8(%ebp),%eax
 b0a:	8b 00                	mov    (%eax),%eax
 b0c:	85 c0                	test   %eax,%eax
 b0e:	75 14                	jne    b24 <pop_q+0x6d>
            q->head = 0;
 b10:	8b 45 08             	mov    0x8(%ebp),%eax
 b13:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 b1a:	8b 45 08             	mov    0x8(%ebp),%eax
 b1d:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 b24:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b27:	eb 05                	jmp    b2e <pop_q+0x77>
    }
    return -1;
 b29:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 b2e:	c9                   	leave  
 b2f:	c3                   	ret    

00000b30 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 b36:	8b 45 08             	mov    0x8(%ebp),%eax
 b39:	8b 55 0c             	mov    0xc(%ebp),%edx
 b3c:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 b3f:	8b 45 08             	mov    0x8(%ebp),%eax
 b42:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 b49:	8b 45 08             	mov    0x8(%ebp),%eax
 b4c:	89 04 24             	mov    %eax,(%esp)
 b4f:	e8 b1 fd ff ff       	call   905 <lock_init>
}
 b54:	c9                   	leave  
 b55:	c3                   	ret    

00000b56 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 b56:	55                   	push   %ebp
 b57:	89 e5                	mov    %esp,%ebp
 b59:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 b5c:	8b 45 08             	mov    0x8(%ebp),%eax
 b5f:	89 04 24             	mov    %eax,(%esp)
 b62:	e8 ac fd ff ff       	call   913 <lock_acquire>
	if(s->count  == 0){
 b67:	8b 45 08             	mov    0x8(%ebp),%eax
 b6a:	8b 40 04             	mov    0x4(%eax),%eax
 b6d:	85 c0                	test   %eax,%eax
 b6f:	75 43                	jne    bb4 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 b71:	c7 44 24 04 fd 0c 00 	movl   $0xcfd,0x4(%esp)
 b78:	00 
 b79:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b80:	e8 9a f9 ff ff       	call   51f <printf>
		//add proc to waiters list
		int tid = getpid();
 b85:	e8 6d f8 ff ff       	call   3f7 <getpid>
 b8a:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 b8d:	8b 45 08             	mov    0x8(%ebp),%eax
 b90:	8d 50 0c             	lea    0xc(%eax),%edx
 b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b96:	89 44 24 04          	mov    %eax,0x4(%esp)
 b9a:	89 14 24             	mov    %edx,(%esp)
 b9d:	e8 9b fe ff ff       	call   a3d <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 ba2:	8b 45 08             	mov    0x8(%ebp),%eax
 ba5:	89 04 24             	mov    %eax,(%esp)
 ba8:	e8 86 fd ff ff       	call   933 <lock_release>
		tsleep(); 
 bad:	e8 75 f8 ff ff       	call   427 <tsleep>
 bb2:	eb 2e                	jmp    be2 <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 bb4:	c7 44 24 04 04 0d 00 	movl   $0xd04,0x4(%esp)
 bbb:	00 
 bbc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bc3:	e8 57 f9 ff ff       	call   51f <printf>
		s->count--;	
 bc8:	8b 45 08             	mov    0x8(%ebp),%eax
 bcb:	8b 40 04             	mov    0x4(%eax),%eax
 bce:	8d 50 ff             	lea    -0x1(%eax),%edx
 bd1:	8b 45 08             	mov    0x8(%ebp),%eax
 bd4:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 bd7:	8b 45 08             	mov    0x8(%ebp),%eax
 bda:	89 04 24             	mov    %eax,(%esp)
 bdd:	e8 51 fd ff ff       	call   933 <lock_release>
	}
}
 be2:	c9                   	leave  
 be3:	c3                   	ret    

00000be4 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 be4:	55                   	push   %ebp
 be5:	89 e5                	mov    %esp,%ebp
 be7:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 bea:	c7 44 24 04 0b 0d 00 	movl   $0xd0b,0x4(%esp)
 bf1:	00 
 bf2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bf9:	e8 21 f9 ff ff       	call   51f <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 bfe:	8b 45 08             	mov    0x8(%ebp),%eax
 c01:	89 04 24             	mov    %eax,(%esp)
 c04:	e8 0a fd ff ff       	call   913 <lock_acquire>
	if(s->count < s->size){
 c09:	8b 45 08             	mov    0x8(%ebp),%eax
 c0c:	8b 50 04             	mov    0x4(%eax),%edx
 c0f:	8b 45 08             	mov    0x8(%ebp),%eax
 c12:	8b 40 08             	mov    0x8(%eax),%eax
 c15:	39 c2                	cmp    %eax,%edx
 c17:	7d 0f                	jge    c28 <sem_signal+0x44>
		s->count++;	
 c19:	8b 45 08             	mov    0x8(%ebp),%eax
 c1c:	8b 40 04             	mov    0x4(%eax),%eax
 c1f:	8d 50 01             	lea    0x1(%eax),%edx
 c22:	8b 45 08             	mov    0x8(%ebp),%eax
 c25:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 c28:	8b 45 08             	mov    0x8(%ebp),%eax
 c2b:	83 c0 0c             	add    $0xc,%eax
 c2e:	89 04 24             	mov    %eax,(%esp)
 c31:	e8 81 fe ff ff       	call   ab7 <pop_q>
 c36:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 c39:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 c3d:	74 2e                	je     c6d <sem_signal+0x89>
		printf(1, "Sem A\n");
 c3f:	c7 44 24 04 04 0d 00 	movl   $0xd04,0x4(%esp)
 c46:	00 
 c47:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c4e:	e8 cc f8 ff ff       	call   51f <printf>
		twakeup(tid);
 c53:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c56:	89 04 24             	mov    %eax,(%esp)
 c59:	e8 d1 f7 ff ff       	call   42f <twakeup>
		s->count--;
 c5e:	8b 45 08             	mov    0x8(%ebp),%eax
 c61:	8b 40 04             	mov    0x4(%eax),%eax
 c64:	8d 50 ff             	lea    -0x1(%eax),%edx
 c67:	8b 45 08             	mov    0x8(%ebp),%eax
 c6a:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 c6d:	8b 45 08             	mov    0x8(%ebp),%eax
 c70:	89 04 24             	mov    %eax,(%esp)
 c73:	e8 bb fc ff ff       	call   933 <lock_release>

 c78:	c9                   	leave  
 c79:	c3                   	ret    
