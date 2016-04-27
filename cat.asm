
_cat:     file format elf32-i386


Disassembly of section .text:

00000000 <cat>:

char buf[512];

void
cat(int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
   6:	eb 1b                	jmp    23 <cat+0x23>
    write(1, buf, n);
   8:	8b 45 f4             	mov    -0xc(%ebp),%eax
   b:	89 44 24 08          	mov    %eax,0x8(%esp)
   f:	c7 44 24 04 a0 0a 00 	movl   $0xaa0,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 71 03 00 00       	call   394 <write>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
  23:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  2a:	00 
  2b:	c7 44 24 04 a0 0a 00 	movl   $0xaa0,0x4(%esp)
  32:	00 
  33:	8b 45 08             	mov    0x8(%ebp),%eax
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 4e 03 00 00       	call   38c <read>
  3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  41:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  45:	7f c1                	jg     8 <cat+0x8>
    write(1, buf, n);
  if(n < 0){
  47:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  4b:	79 19                	jns    66 <cat+0x66>
    printf(1, "cat: read error\n");
  4d:	c7 44 24 04 f5 09 00 	movl   $0x9f5,0x4(%esp)
  54:	00 
  55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5c:	e8 9c 04 00 00       	call   4fd <printf>
    exit();
  61:	e8 0e 03 00 00       	call   374 <exit>
  }
}
  66:	c9                   	leave  
  67:	c3                   	ret    

00000068 <main>:

int
main(int argc, char *argv[])
{
  68:	55                   	push   %ebp
  69:	89 e5                	mov    %esp,%ebp
  6b:	83 e4 f0             	and    $0xfffffff0,%esp
  6e:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
  71:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
  75:	7f 11                	jg     88 <main+0x20>
    cat(0);
  77:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  7e:	e8 7d ff ff ff       	call   0 <cat>
    exit();
  83:	e8 ec 02 00 00       	call   374 <exit>
  }

  for(i = 1; i < argc; i++){
  88:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  8f:	00 
  90:	eb 6d                	jmp    ff <main+0x97>
    if((fd = open(argv[i], 0)) < 0){
  92:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  96:	c1 e0 02             	shl    $0x2,%eax
  99:	03 45 0c             	add    0xc(%ebp),%eax
  9c:	8b 00                	mov    (%eax),%eax
  9e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  a5:	00 
  a6:	89 04 24             	mov    %eax,(%esp)
  a9:	e8 06 03 00 00       	call   3b4 <open>
  ae:	89 44 24 18          	mov    %eax,0x18(%esp)
  b2:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  b7:	79 29                	jns    e2 <main+0x7a>
      printf(1, "cat: cannot open %s\n", argv[i]);
  b9:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  bd:	c1 e0 02             	shl    $0x2,%eax
  c0:	03 45 0c             	add    0xc(%ebp),%eax
  c3:	8b 00                	mov    (%eax),%eax
  c5:	89 44 24 08          	mov    %eax,0x8(%esp)
  c9:	c7 44 24 04 06 0a 00 	movl   $0xa06,0x4(%esp)
  d0:	00 
  d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d8:	e8 20 04 00 00       	call   4fd <printf>
      exit();
  dd:	e8 92 02 00 00       	call   374 <exit>
    }
    cat(fd);
  e2:	8b 44 24 18          	mov    0x18(%esp),%eax
  e6:	89 04 24             	mov    %eax,(%esp)
  e9:	e8 12 ff ff ff       	call   0 <cat>
    close(fd);
  ee:	8b 44 24 18          	mov    0x18(%esp),%eax
  f2:	89 04 24             	mov    %eax,(%esp)
  f5:	e8 a2 02 00 00       	call   39c <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
  fa:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
  ff:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 103:	3b 45 08             	cmp    0x8(%ebp),%eax
 106:	7c 8a                	jl     92 <main+0x2a>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
 108:	e8 67 02 00 00       	call   374 <exit>
 10d:	90                   	nop
 10e:	90                   	nop
 10f:	90                   	nop

00000110 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 110:	55                   	push   %ebp
 111:	89 e5                	mov    %esp,%ebp
 113:	57                   	push   %edi
 114:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 115:	8b 4d 08             	mov    0x8(%ebp),%ecx
 118:	8b 55 10             	mov    0x10(%ebp),%edx
 11b:	8b 45 0c             	mov    0xc(%ebp),%eax
 11e:	89 cb                	mov    %ecx,%ebx
 120:	89 df                	mov    %ebx,%edi
 122:	89 d1                	mov    %edx,%ecx
 124:	fc                   	cld    
 125:	f3 aa                	rep stos %al,%es:(%edi)
 127:	89 ca                	mov    %ecx,%edx
 129:	89 fb                	mov    %edi,%ebx
 12b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 12e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 131:	5b                   	pop    %ebx
 132:	5f                   	pop    %edi
 133:	5d                   	pop    %ebp
 134:	c3                   	ret    

00000135 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 135:	55                   	push   %ebp
 136:	89 e5                	mov    %esp,%ebp
 138:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 13b:	8b 45 08             	mov    0x8(%ebp),%eax
 13e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 141:	8b 45 0c             	mov    0xc(%ebp),%eax
 144:	0f b6 10             	movzbl (%eax),%edx
 147:	8b 45 08             	mov    0x8(%ebp),%eax
 14a:	88 10                	mov    %dl,(%eax)
 14c:	8b 45 08             	mov    0x8(%ebp),%eax
 14f:	0f b6 00             	movzbl (%eax),%eax
 152:	84 c0                	test   %al,%al
 154:	0f 95 c0             	setne  %al
 157:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 15b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 15f:	84 c0                	test   %al,%al
 161:	75 de                	jne    141 <strcpy+0xc>
    ;
  return os;
 163:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 166:	c9                   	leave  
 167:	c3                   	ret    

00000168 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 168:	55                   	push   %ebp
 169:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 16b:	eb 08                	jmp    175 <strcmp+0xd>
    p++, q++;
 16d:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 171:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 175:	8b 45 08             	mov    0x8(%ebp),%eax
 178:	0f b6 00             	movzbl (%eax),%eax
 17b:	84 c0                	test   %al,%al
 17d:	74 10                	je     18f <strcmp+0x27>
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	0f b6 10             	movzbl (%eax),%edx
 185:	8b 45 0c             	mov    0xc(%ebp),%eax
 188:	0f b6 00             	movzbl (%eax),%eax
 18b:	38 c2                	cmp    %al,%dl
 18d:	74 de                	je     16d <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 18f:	8b 45 08             	mov    0x8(%ebp),%eax
 192:	0f b6 00             	movzbl (%eax),%eax
 195:	0f b6 d0             	movzbl %al,%edx
 198:	8b 45 0c             	mov    0xc(%ebp),%eax
 19b:	0f b6 00             	movzbl (%eax),%eax
 19e:	0f b6 c0             	movzbl %al,%eax
 1a1:	89 d1                	mov    %edx,%ecx
 1a3:	29 c1                	sub    %eax,%ecx
 1a5:	89 c8                	mov    %ecx,%eax
}
 1a7:	5d                   	pop    %ebp
 1a8:	c3                   	ret    

000001a9 <strlen>:

uint
strlen(char *s)
{
 1a9:	55                   	push   %ebp
 1aa:	89 e5                	mov    %esp,%ebp
 1ac:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1af:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1b6:	eb 04                	jmp    1bc <strlen+0x13>
 1b8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1bc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 1bf:	03 45 08             	add    0x8(%ebp),%eax
 1c2:	0f b6 00             	movzbl (%eax),%eax
 1c5:	84 c0                	test   %al,%al
 1c7:	75 ef                	jne    1b8 <strlen+0xf>
    ;
  return n;
 1c9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1cc:	c9                   	leave  
 1cd:	c3                   	ret    

000001ce <memset>:

void*
memset(void *dst, int c, uint n)
{
 1ce:	55                   	push   %ebp
 1cf:	89 e5                	mov    %esp,%ebp
 1d1:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1d4:	8b 45 10             	mov    0x10(%ebp),%eax
 1d7:	89 44 24 08          	mov    %eax,0x8(%esp)
 1db:	8b 45 0c             	mov    0xc(%ebp),%eax
 1de:	89 44 24 04          	mov    %eax,0x4(%esp)
 1e2:	8b 45 08             	mov    0x8(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 23 ff ff ff       	call   110 <stosb>
  return dst;
 1ed:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1f0:	c9                   	leave  
 1f1:	c3                   	ret    

000001f2 <strchr>:

char*
strchr(const char *s, char c)
{
 1f2:	55                   	push   %ebp
 1f3:	89 e5                	mov    %esp,%ebp
 1f5:	83 ec 04             	sub    $0x4,%esp
 1f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 1fb:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 1fe:	eb 14                	jmp    214 <strchr+0x22>
    if(*s == c)
 200:	8b 45 08             	mov    0x8(%ebp),%eax
 203:	0f b6 00             	movzbl (%eax),%eax
 206:	3a 45 fc             	cmp    -0x4(%ebp),%al
 209:	75 05                	jne    210 <strchr+0x1e>
      return (char*)s;
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	eb 13                	jmp    223 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 210:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 214:	8b 45 08             	mov    0x8(%ebp),%eax
 217:	0f b6 00             	movzbl (%eax),%eax
 21a:	84 c0                	test   %al,%al
 21c:	75 e2                	jne    200 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 21e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 223:	c9                   	leave  
 224:	c3                   	ret    

00000225 <gets>:

char*
gets(char *buf, int max)
{
 225:	55                   	push   %ebp
 226:	89 e5                	mov    %esp,%ebp
 228:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 22b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 232:	eb 44                	jmp    278 <gets+0x53>
    cc = read(0, &c, 1);
 234:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 23b:	00 
 23c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 23f:	89 44 24 04          	mov    %eax,0x4(%esp)
 243:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 24a:	e8 3d 01 00 00       	call   38c <read>
 24f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 252:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 256:	7e 2d                	jle    285 <gets+0x60>
      break;
    buf[i++] = c;
 258:	8b 45 f0             	mov    -0x10(%ebp),%eax
 25b:	03 45 08             	add    0x8(%ebp),%eax
 25e:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 262:	88 10                	mov    %dl,(%eax)
 264:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 268:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 26c:	3c 0a                	cmp    $0xa,%al
 26e:	74 16                	je     286 <gets+0x61>
 270:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 274:	3c 0d                	cmp    $0xd,%al
 276:	74 0e                	je     286 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 278:	8b 45 f0             	mov    -0x10(%ebp),%eax
 27b:	83 c0 01             	add    $0x1,%eax
 27e:	3b 45 0c             	cmp    0xc(%ebp),%eax
 281:	7c b1                	jl     234 <gets+0xf>
 283:	eb 01                	jmp    286 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 285:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 286:	8b 45 f0             	mov    -0x10(%ebp),%eax
 289:	03 45 08             	add    0x8(%ebp),%eax
 28c:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 28f:	8b 45 08             	mov    0x8(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <stat>:

int
stat(char *n, struct stat *st)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 29a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2a1:	00 
 2a2:	8b 45 08             	mov    0x8(%ebp),%eax
 2a5:	89 04 24             	mov    %eax,(%esp)
 2a8:	e8 07 01 00 00       	call   3b4 <open>
 2ad:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 2b0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 2b4:	79 07                	jns    2bd <stat+0x29>
    return -1;
 2b6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2bb:	eb 23                	jmp    2e0 <stat+0x4c>
  r = fstat(fd, st);
 2bd:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c0:	89 44 24 04          	mov    %eax,0x4(%esp)
 2c4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2c7:	89 04 24             	mov    %eax,(%esp)
 2ca:	e8 fd 00 00 00       	call   3cc <fstat>
 2cf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 2d2:	8b 45 f0             	mov    -0x10(%ebp),%eax
 2d5:	89 04 24             	mov    %eax,(%esp)
 2d8:	e8 bf 00 00 00       	call   39c <close>
  return r;
 2dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 2e0:	c9                   	leave  
 2e1:	c3                   	ret    

000002e2 <atoi>:

int
atoi(const char *s)
{
 2e2:	55                   	push   %ebp
 2e3:	89 e5                	mov    %esp,%ebp
 2e5:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2e8:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 2ef:	eb 24                	jmp    315 <atoi+0x33>
    n = n*10 + *s++ - '0';
 2f1:	8b 55 fc             	mov    -0x4(%ebp),%edx
 2f4:	89 d0                	mov    %edx,%eax
 2f6:	c1 e0 02             	shl    $0x2,%eax
 2f9:	01 d0                	add    %edx,%eax
 2fb:	01 c0                	add    %eax,%eax
 2fd:	89 c2                	mov    %eax,%edx
 2ff:	8b 45 08             	mov    0x8(%ebp),%eax
 302:	0f b6 00             	movzbl (%eax),%eax
 305:	0f be c0             	movsbl %al,%eax
 308:	8d 04 02             	lea    (%edx,%eax,1),%eax
 30b:	83 e8 30             	sub    $0x30,%eax
 30e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 311:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 315:	8b 45 08             	mov    0x8(%ebp),%eax
 318:	0f b6 00             	movzbl (%eax),%eax
 31b:	3c 2f                	cmp    $0x2f,%al
 31d:	7e 0a                	jle    329 <atoi+0x47>
 31f:	8b 45 08             	mov    0x8(%ebp),%eax
 322:	0f b6 00             	movzbl (%eax),%eax
 325:	3c 39                	cmp    $0x39,%al
 327:	7e c8                	jle    2f1 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 329:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 32c:	c9                   	leave  
 32d:	c3                   	ret    

0000032e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 32e:	55                   	push   %ebp
 32f:	89 e5                	mov    %esp,%ebp
 331:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 334:	8b 45 08             	mov    0x8(%ebp),%eax
 337:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 33a:	8b 45 0c             	mov    0xc(%ebp),%eax
 33d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 340:	eb 13                	jmp    355 <memmove+0x27>
    *dst++ = *src++;
 342:	8b 45 fc             	mov    -0x4(%ebp),%eax
 345:	0f b6 10             	movzbl (%eax),%edx
 348:	8b 45 f8             	mov    -0x8(%ebp),%eax
 34b:	88 10                	mov    %dl,(%eax)
 34d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 351:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 355:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 359:	0f 9f c0             	setg   %al
 35c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 360:	84 c0                	test   %al,%al
 362:	75 de                	jne    342 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 364:	8b 45 08             	mov    0x8(%ebp),%eax
}
 367:	c9                   	leave  
 368:	c3                   	ret    
 369:	90                   	nop
 36a:	90                   	nop
 36b:	90                   	nop

0000036c <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 36c:	b8 01 00 00 00       	mov    $0x1,%eax
 371:	cd 40                	int    $0x40
 373:	c3                   	ret    

00000374 <exit>:
SYSCALL(exit)
 374:	b8 02 00 00 00       	mov    $0x2,%eax
 379:	cd 40                	int    $0x40
 37b:	c3                   	ret    

0000037c <wait>:
SYSCALL(wait)
 37c:	b8 03 00 00 00       	mov    $0x3,%eax
 381:	cd 40                	int    $0x40
 383:	c3                   	ret    

00000384 <pipe>:
SYSCALL(pipe)
 384:	b8 04 00 00 00       	mov    $0x4,%eax
 389:	cd 40                	int    $0x40
 38b:	c3                   	ret    

0000038c <read>:
SYSCALL(read)
 38c:	b8 05 00 00 00       	mov    $0x5,%eax
 391:	cd 40                	int    $0x40
 393:	c3                   	ret    

00000394 <write>:
SYSCALL(write)
 394:	b8 10 00 00 00       	mov    $0x10,%eax
 399:	cd 40                	int    $0x40
 39b:	c3                   	ret    

0000039c <close>:
SYSCALL(close)
 39c:	b8 15 00 00 00       	mov    $0x15,%eax
 3a1:	cd 40                	int    $0x40
 3a3:	c3                   	ret    

000003a4 <kill>:
SYSCALL(kill)
 3a4:	b8 06 00 00 00       	mov    $0x6,%eax
 3a9:	cd 40                	int    $0x40
 3ab:	c3                   	ret    

000003ac <exec>:
SYSCALL(exec)
 3ac:	b8 07 00 00 00       	mov    $0x7,%eax
 3b1:	cd 40                	int    $0x40
 3b3:	c3                   	ret    

000003b4 <open>:
SYSCALL(open)
 3b4:	b8 0f 00 00 00       	mov    $0xf,%eax
 3b9:	cd 40                	int    $0x40
 3bb:	c3                   	ret    

000003bc <mknod>:
SYSCALL(mknod)
 3bc:	b8 11 00 00 00       	mov    $0x11,%eax
 3c1:	cd 40                	int    $0x40
 3c3:	c3                   	ret    

000003c4 <unlink>:
SYSCALL(unlink)
 3c4:	b8 12 00 00 00       	mov    $0x12,%eax
 3c9:	cd 40                	int    $0x40
 3cb:	c3                   	ret    

000003cc <fstat>:
SYSCALL(fstat)
 3cc:	b8 08 00 00 00       	mov    $0x8,%eax
 3d1:	cd 40                	int    $0x40
 3d3:	c3                   	ret    

000003d4 <link>:
SYSCALL(link)
 3d4:	b8 13 00 00 00       	mov    $0x13,%eax
 3d9:	cd 40                	int    $0x40
 3db:	c3                   	ret    

000003dc <mkdir>:
SYSCALL(mkdir)
 3dc:	b8 14 00 00 00       	mov    $0x14,%eax
 3e1:	cd 40                	int    $0x40
 3e3:	c3                   	ret    

000003e4 <chdir>:
SYSCALL(chdir)
 3e4:	b8 09 00 00 00       	mov    $0x9,%eax
 3e9:	cd 40                	int    $0x40
 3eb:	c3                   	ret    

000003ec <dup>:
SYSCALL(dup)
 3ec:	b8 0a 00 00 00       	mov    $0xa,%eax
 3f1:	cd 40                	int    $0x40
 3f3:	c3                   	ret    

000003f4 <getpid>:
SYSCALL(getpid)
 3f4:	b8 0b 00 00 00       	mov    $0xb,%eax
 3f9:	cd 40                	int    $0x40
 3fb:	c3                   	ret    

000003fc <sbrk>:
SYSCALL(sbrk)
 3fc:	b8 0c 00 00 00       	mov    $0xc,%eax
 401:	cd 40                	int    $0x40
 403:	c3                   	ret    

00000404 <sleep>:
SYSCALL(sleep)
 404:	b8 0d 00 00 00       	mov    $0xd,%eax
 409:	cd 40                	int    $0x40
 40b:	c3                   	ret    

0000040c <uptime>:
SYSCALL(uptime)
 40c:	b8 0e 00 00 00       	mov    $0xe,%eax
 411:	cd 40                	int    $0x40
 413:	c3                   	ret    

00000414 <clone>:
SYSCALL(clone)
 414:	b8 16 00 00 00       	mov    $0x16,%eax
 419:	cd 40                	int    $0x40
 41b:	c3                   	ret    

0000041c <texit>:
SYSCALL(texit)
 41c:	b8 17 00 00 00       	mov    $0x17,%eax
 421:	cd 40                	int    $0x40
 423:	c3                   	ret    

00000424 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 424:	55                   	push   %ebp
 425:	89 e5                	mov    %esp,%ebp
 427:	83 ec 28             	sub    $0x28,%esp
 42a:	8b 45 0c             	mov    0xc(%ebp),%eax
 42d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 430:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 437:	00 
 438:	8d 45 f4             	lea    -0xc(%ebp),%eax
 43b:	89 44 24 04          	mov    %eax,0x4(%esp)
 43f:	8b 45 08             	mov    0x8(%ebp),%eax
 442:	89 04 24             	mov    %eax,(%esp)
 445:	e8 4a ff ff ff       	call   394 <write>
}
 44a:	c9                   	leave  
 44b:	c3                   	ret    

0000044c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 44c:	55                   	push   %ebp
 44d:	89 e5                	mov    %esp,%ebp
 44f:	53                   	push   %ebx
 450:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 453:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 45a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 45e:	74 17                	je     477 <printint+0x2b>
 460:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 464:	79 11                	jns    477 <printint+0x2b>
    neg = 1;
 466:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 46d:	8b 45 0c             	mov    0xc(%ebp),%eax
 470:	f7 d8                	neg    %eax
 472:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 475:	eb 06                	jmp    47d <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 477:	8b 45 0c             	mov    0xc(%ebp),%eax
 47a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 47d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 484:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 487:	8b 5d 10             	mov    0x10(%ebp),%ebx
 48a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 48d:	ba 00 00 00 00       	mov    $0x0,%edx
 492:	f7 f3                	div    %ebx
 494:	89 d0                	mov    %edx,%eax
 496:	0f b6 80 50 0a 00 00 	movzbl 0xa50(%eax),%eax
 49d:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 4a1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 4a5:	8b 45 10             	mov    0x10(%ebp),%eax
 4a8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4ae:	ba 00 00 00 00       	mov    $0x0,%edx
 4b3:	f7 75 d4             	divl   -0x2c(%ebp)
 4b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4b9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4bd:	75 c5                	jne    484 <printint+0x38>
  if(neg)
 4bf:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4c3:	74 28                	je     4ed <printint+0xa1>
    buf[i++] = '-';
 4c5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4c8:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4cd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 4d1:	eb 1a                	jmp    4ed <printint+0xa1>
    putc(fd, buf[i]);
 4d3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4d6:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 4db:	0f be c0             	movsbl %al,%eax
 4de:	89 44 24 04          	mov    %eax,0x4(%esp)
 4e2:	8b 45 08             	mov    0x8(%ebp),%eax
 4e5:	89 04 24             	mov    %eax,(%esp)
 4e8:	e8 37 ff ff ff       	call   424 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 4ed:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 4f1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4f5:	79 dc                	jns    4d3 <printint+0x87>
    putc(fd, buf[i]);
}
 4f7:	83 c4 44             	add    $0x44,%esp
 4fa:	5b                   	pop    %ebx
 4fb:	5d                   	pop    %ebp
 4fc:	c3                   	ret    

000004fd <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 4fd:	55                   	push   %ebp
 4fe:	89 e5                	mov    %esp,%ebp
 500:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 503:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 50a:	8d 45 0c             	lea    0xc(%ebp),%eax
 50d:	83 c0 04             	add    $0x4,%eax
 510:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 513:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 51a:	e9 7e 01 00 00       	jmp    69d <printf+0x1a0>
    c = fmt[i] & 0xff;
 51f:	8b 55 0c             	mov    0xc(%ebp),%edx
 522:	8b 45 ec             	mov    -0x14(%ebp),%eax
 525:	8d 04 02             	lea    (%edx,%eax,1),%eax
 528:	0f b6 00             	movzbl (%eax),%eax
 52b:	0f be c0             	movsbl %al,%eax
 52e:	25 ff 00 00 00       	and    $0xff,%eax
 533:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 536:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 53a:	75 2c                	jne    568 <printf+0x6b>
      if(c == '%'){
 53c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 540:	75 0c                	jne    54e <printf+0x51>
        state = '%';
 542:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 549:	e9 4b 01 00 00       	jmp    699 <printf+0x19c>
      } else {
        putc(fd, c);
 54e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 551:	0f be c0             	movsbl %al,%eax
 554:	89 44 24 04          	mov    %eax,0x4(%esp)
 558:	8b 45 08             	mov    0x8(%ebp),%eax
 55b:	89 04 24             	mov    %eax,(%esp)
 55e:	e8 c1 fe ff ff       	call   424 <putc>
 563:	e9 31 01 00 00       	jmp    699 <printf+0x19c>
      }
    } else if(state == '%'){
 568:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 56c:	0f 85 27 01 00 00    	jne    699 <printf+0x19c>
      if(c == 'd'){
 572:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 576:	75 2d                	jne    5a5 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 578:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57b:	8b 00                	mov    (%eax),%eax
 57d:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 584:	00 
 585:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 58c:	00 
 58d:	89 44 24 04          	mov    %eax,0x4(%esp)
 591:	8b 45 08             	mov    0x8(%ebp),%eax
 594:	89 04 24             	mov    %eax,(%esp)
 597:	e8 b0 fe ff ff       	call   44c <printint>
        ap++;
 59c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5a0:	e9 ed 00 00 00       	jmp    692 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 5a5:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 5a9:	74 06                	je     5b1 <printf+0xb4>
 5ab:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 5af:	75 2d                	jne    5de <printf+0xe1>
        printint(fd, *ap, 16, 0);
 5b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5b4:	8b 00                	mov    (%eax),%eax
 5b6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5bd:	00 
 5be:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5c5:	00 
 5c6:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ca:	8b 45 08             	mov    0x8(%ebp),%eax
 5cd:	89 04 24             	mov    %eax,(%esp)
 5d0:	e8 77 fe ff ff       	call   44c <printint>
        ap++;
 5d5:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5d9:	e9 b4 00 00 00       	jmp    692 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5de:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 5e2:	75 46                	jne    62a <printf+0x12d>
        s = (char*)*ap;
 5e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5e7:	8b 00                	mov    (%eax),%eax
 5e9:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 5ec:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 5f0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 5f4:	75 27                	jne    61d <printf+0x120>
          s = "(null)";
 5f6:	c7 45 e4 1b 0a 00 00 	movl   $0xa1b,-0x1c(%ebp)
        while(*s != 0){
 5fd:	eb 1f                	jmp    61e <printf+0x121>
          putc(fd, *s);
 5ff:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 602:	0f b6 00             	movzbl (%eax),%eax
 605:	0f be c0             	movsbl %al,%eax
 608:	89 44 24 04          	mov    %eax,0x4(%esp)
 60c:	8b 45 08             	mov    0x8(%ebp),%eax
 60f:	89 04 24             	mov    %eax,(%esp)
 612:	e8 0d fe ff ff       	call   424 <putc>
          s++;
 617:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 61b:	eb 01                	jmp    61e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 61d:	90                   	nop
 61e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 621:	0f b6 00             	movzbl (%eax),%eax
 624:	84 c0                	test   %al,%al
 626:	75 d7                	jne    5ff <printf+0x102>
 628:	eb 68                	jmp    692 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 62a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 62e:	75 1d                	jne    64d <printf+0x150>
        putc(fd, *ap);
 630:	8b 45 f4             	mov    -0xc(%ebp),%eax
 633:	8b 00                	mov    (%eax),%eax
 635:	0f be c0             	movsbl %al,%eax
 638:	89 44 24 04          	mov    %eax,0x4(%esp)
 63c:	8b 45 08             	mov    0x8(%ebp),%eax
 63f:	89 04 24             	mov    %eax,(%esp)
 642:	e8 dd fd ff ff       	call   424 <putc>
        ap++;
 647:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 64b:	eb 45                	jmp    692 <printf+0x195>
      } else if(c == '%'){
 64d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 651:	75 17                	jne    66a <printf+0x16d>
        putc(fd, c);
 653:	8b 45 e8             	mov    -0x18(%ebp),%eax
 656:	0f be c0             	movsbl %al,%eax
 659:	89 44 24 04          	mov    %eax,0x4(%esp)
 65d:	8b 45 08             	mov    0x8(%ebp),%eax
 660:	89 04 24             	mov    %eax,(%esp)
 663:	e8 bc fd ff ff       	call   424 <putc>
 668:	eb 28                	jmp    692 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 66a:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 671:	00 
 672:	8b 45 08             	mov    0x8(%ebp),%eax
 675:	89 04 24             	mov    %eax,(%esp)
 678:	e8 a7 fd ff ff       	call   424 <putc>
        putc(fd, c);
 67d:	8b 45 e8             	mov    -0x18(%ebp),%eax
 680:	0f be c0             	movsbl %al,%eax
 683:	89 44 24 04          	mov    %eax,0x4(%esp)
 687:	8b 45 08             	mov    0x8(%ebp),%eax
 68a:	89 04 24             	mov    %eax,(%esp)
 68d:	e8 92 fd ff ff       	call   424 <putc>
      }
      state = 0;
 692:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 699:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 69d:	8b 55 0c             	mov    0xc(%ebp),%edx
 6a0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6a3:	8d 04 02             	lea    (%edx,%eax,1),%eax
 6a6:	0f b6 00             	movzbl (%eax),%eax
 6a9:	84 c0                	test   %al,%al
 6ab:	0f 85 6e fe ff ff    	jne    51f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6b1:	c9                   	leave  
 6b2:	c3                   	ret    
 6b3:	90                   	nop

000006b4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6ba:	8b 45 08             	mov    0x8(%ebp),%eax
 6bd:	83 e8 08             	sub    $0x8,%eax
 6c0:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6c3:	a1 88 0a 00 00       	mov    0xa88,%eax
 6c8:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6cb:	eb 24                	jmp    6f1 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6d0:	8b 00                	mov    (%eax),%eax
 6d2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6d5:	77 12                	ja     6e9 <free+0x35>
 6d7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6da:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6dd:	77 24                	ja     703 <free+0x4f>
 6df:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e2:	8b 00                	mov    (%eax),%eax
 6e4:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6e7:	77 1a                	ja     703 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6ec:	8b 00                	mov    (%eax),%eax
 6ee:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6f1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f4:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f7:	76 d4                	jbe    6cd <free+0x19>
 6f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fc:	8b 00                	mov    (%eax),%eax
 6fe:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 701:	76 ca                	jbe    6cd <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 703:	8b 45 f8             	mov    -0x8(%ebp),%eax
 706:	8b 40 04             	mov    0x4(%eax),%eax
 709:	c1 e0 03             	shl    $0x3,%eax
 70c:	89 c2                	mov    %eax,%edx
 70e:	03 55 f8             	add    -0x8(%ebp),%edx
 711:	8b 45 fc             	mov    -0x4(%ebp),%eax
 714:	8b 00                	mov    (%eax),%eax
 716:	39 c2                	cmp    %eax,%edx
 718:	75 24                	jne    73e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 71a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71d:	8b 50 04             	mov    0x4(%eax),%edx
 720:	8b 45 fc             	mov    -0x4(%ebp),%eax
 723:	8b 00                	mov    (%eax),%eax
 725:	8b 40 04             	mov    0x4(%eax),%eax
 728:	01 c2                	add    %eax,%edx
 72a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 72d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 730:	8b 45 fc             	mov    -0x4(%ebp),%eax
 733:	8b 00                	mov    (%eax),%eax
 735:	8b 10                	mov    (%eax),%edx
 737:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73a:	89 10                	mov    %edx,(%eax)
 73c:	eb 0a                	jmp    748 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 73e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 741:	8b 10                	mov    (%eax),%edx
 743:	8b 45 f8             	mov    -0x8(%ebp),%eax
 746:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 748:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74b:	8b 40 04             	mov    0x4(%eax),%eax
 74e:	c1 e0 03             	shl    $0x3,%eax
 751:	03 45 fc             	add    -0x4(%ebp),%eax
 754:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 757:	75 20                	jne    779 <free+0xc5>
    p->s.size += bp->s.size;
 759:	8b 45 fc             	mov    -0x4(%ebp),%eax
 75c:	8b 50 04             	mov    0x4(%eax),%edx
 75f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 762:	8b 40 04             	mov    0x4(%eax),%eax
 765:	01 c2                	add    %eax,%edx
 767:	8b 45 fc             	mov    -0x4(%ebp),%eax
 76a:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 76d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 770:	8b 10                	mov    (%eax),%edx
 772:	8b 45 fc             	mov    -0x4(%ebp),%eax
 775:	89 10                	mov    %edx,(%eax)
 777:	eb 08                	jmp    781 <free+0xcd>
  } else
    p->s.ptr = bp;
 779:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77c:	8b 55 f8             	mov    -0x8(%ebp),%edx
 77f:	89 10                	mov    %edx,(%eax)
  freep = p;
 781:	8b 45 fc             	mov    -0x4(%ebp),%eax
 784:	a3 88 0a 00 00       	mov    %eax,0xa88
}
 789:	c9                   	leave  
 78a:	c3                   	ret    

0000078b <morecore>:

static Header*
morecore(uint nu)
{
 78b:	55                   	push   %ebp
 78c:	89 e5                	mov    %esp,%ebp
 78e:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 791:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 798:	77 07                	ja     7a1 <morecore+0x16>
    nu = 4096;
 79a:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7a1:	8b 45 08             	mov    0x8(%ebp),%eax
 7a4:	c1 e0 03             	shl    $0x3,%eax
 7a7:	89 04 24             	mov    %eax,(%esp)
 7aa:	e8 4d fc ff ff       	call   3fc <sbrk>
 7af:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 7b2:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 7b6:	75 07                	jne    7bf <morecore+0x34>
    return 0;
 7b8:	b8 00 00 00 00       	mov    $0x0,%eax
 7bd:	eb 22                	jmp    7e1 <morecore+0x56>
  hp = (Header*)p;
 7bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7c2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 7c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7c8:	8b 55 08             	mov    0x8(%ebp),%edx
 7cb:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d1:	83 c0 08             	add    $0x8,%eax
 7d4:	89 04 24             	mov    %eax,(%esp)
 7d7:	e8 d8 fe ff ff       	call   6b4 <free>
  return freep;
 7dc:	a1 88 0a 00 00       	mov    0xa88,%eax
}
 7e1:	c9                   	leave  
 7e2:	c3                   	ret    

000007e3 <malloc>:

void*
malloc(uint nbytes)
{
 7e3:	55                   	push   %ebp
 7e4:	89 e5                	mov    %esp,%ebp
 7e6:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 7e9:	8b 45 08             	mov    0x8(%ebp),%eax
 7ec:	83 c0 07             	add    $0x7,%eax
 7ef:	c1 e8 03             	shr    $0x3,%eax
 7f2:	83 c0 01             	add    $0x1,%eax
 7f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 7f8:	a1 88 0a 00 00       	mov    0xa88,%eax
 7fd:	89 45 f0             	mov    %eax,-0x10(%ebp)
 800:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 804:	75 23                	jne    829 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 806:	c7 45 f0 80 0a 00 00 	movl   $0xa80,-0x10(%ebp)
 80d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 810:	a3 88 0a 00 00       	mov    %eax,0xa88
 815:	a1 88 0a 00 00       	mov    0xa88,%eax
 81a:	a3 80 0a 00 00       	mov    %eax,0xa80
    base.s.size = 0;
 81f:	c7 05 84 0a 00 00 00 	movl   $0x0,0xa84
 826:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 829:	8b 45 f0             	mov    -0x10(%ebp),%eax
 82c:	8b 00                	mov    (%eax),%eax
 82e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 831:	8b 45 ec             	mov    -0x14(%ebp),%eax
 834:	8b 40 04             	mov    0x4(%eax),%eax
 837:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 83a:	72 4d                	jb     889 <malloc+0xa6>
      if(p->s.size == nunits)
 83c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 83f:	8b 40 04             	mov    0x4(%eax),%eax
 842:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 845:	75 0c                	jne    853 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 847:	8b 45 ec             	mov    -0x14(%ebp),%eax
 84a:	8b 10                	mov    (%eax),%edx
 84c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 84f:	89 10                	mov    %edx,(%eax)
 851:	eb 26                	jmp    879 <malloc+0x96>
      else {
        p->s.size -= nunits;
 853:	8b 45 ec             	mov    -0x14(%ebp),%eax
 856:	8b 40 04             	mov    0x4(%eax),%eax
 859:	89 c2                	mov    %eax,%edx
 85b:	2b 55 f4             	sub    -0xc(%ebp),%edx
 85e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 861:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 864:	8b 45 ec             	mov    -0x14(%ebp),%eax
 867:	8b 40 04             	mov    0x4(%eax),%eax
 86a:	c1 e0 03             	shl    $0x3,%eax
 86d:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 870:	8b 45 ec             	mov    -0x14(%ebp),%eax
 873:	8b 55 f4             	mov    -0xc(%ebp),%edx
 876:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 879:	8b 45 f0             	mov    -0x10(%ebp),%eax
 87c:	a3 88 0a 00 00       	mov    %eax,0xa88
      return (void*)(p + 1);
 881:	8b 45 ec             	mov    -0x14(%ebp),%eax
 884:	83 c0 08             	add    $0x8,%eax
 887:	eb 38                	jmp    8c1 <malloc+0xde>
    }
    if(p == freep)
 889:	a1 88 0a 00 00       	mov    0xa88,%eax
 88e:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 891:	75 1b                	jne    8ae <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 893:	8b 45 f4             	mov    -0xc(%ebp),%eax
 896:	89 04 24             	mov    %eax,(%esp)
 899:	e8 ed fe ff ff       	call   78b <morecore>
 89e:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8a1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8a5:	75 07                	jne    8ae <malloc+0xcb>
        return 0;
 8a7:	b8 00 00 00 00       	mov    $0x0,%eax
 8ac:	eb 13                	jmp    8c1 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8b4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8b7:	8b 00                	mov    (%eax),%eax
 8b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8bc:	e9 70 ff ff ff       	jmp    831 <malloc+0x4e>
}
 8c1:	c9                   	leave  
 8c2:	c3                   	ret    
 8c3:	90                   	nop

000008c4 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 8c4:	55                   	push   %ebp
 8c5:	89 e5                	mov    %esp,%ebp
 8c7:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8ca:	8b 55 08             	mov    0x8(%ebp),%edx
 8cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 8d0:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8d3:	f0 87 02             	lock xchg %eax,(%edx)
 8d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 8d9:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8dc:	c9                   	leave  
 8dd:	c3                   	ret    

000008de <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 8de:	55                   	push   %ebp
 8df:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 8e1:	8b 45 08             	mov    0x8(%ebp),%eax
 8e4:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 8ea:	5d                   	pop    %ebp
 8eb:	c3                   	ret    

000008ec <lock_acquire>:
void lock_acquire(lock_t *lock){
 8ec:	55                   	push   %ebp
 8ed:	89 e5                	mov    %esp,%ebp
 8ef:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 8f2:	8b 45 08             	mov    0x8(%ebp),%eax
 8f5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 8fc:	00 
 8fd:	89 04 24             	mov    %eax,(%esp)
 900:	e8 bf ff ff ff       	call   8c4 <xchg>
 905:	85 c0                	test   %eax,%eax
 907:	75 e9                	jne    8f2 <lock_acquire+0x6>
}
 909:	c9                   	leave  
 90a:	c3                   	ret    

0000090b <lock_release>:
void lock_release(lock_t *lock){
 90b:	55                   	push   %ebp
 90c:	89 e5                	mov    %esp,%ebp
 90e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 911:	8b 45 08             	mov    0x8(%ebp),%eax
 914:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 91b:	00 
 91c:	89 04 24             	mov    %eax,(%esp)
 91f:	e8 a0 ff ff ff       	call   8c4 <xchg>
}
 924:	c9                   	leave  
 925:	c3                   	ret    

00000926 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 926:	55                   	push   %ebp
 927:	89 e5                	mov    %esp,%ebp
 929:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 92c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 933:	e8 ab fe ff ff       	call   7e3 <malloc>
 938:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 93b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 93e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 941:	8b 45 f0             	mov    -0x10(%ebp),%eax
 944:	25 ff 0f 00 00       	and    $0xfff,%eax
 949:	85 c0                	test   %eax,%eax
 94b:	74 15                	je     962 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 94d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 950:	89 c2                	mov    %eax,%edx
 952:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 958:	b8 00 10 00 00       	mov    $0x1000,%eax
 95d:	29 d0                	sub    %edx,%eax
 95f:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 962:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 966:	75 1b                	jne    983 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 968:	c7 44 24 04 22 0a 00 	movl   $0xa22,0x4(%esp)
 96f:	00 
 970:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 977:	e8 81 fb ff ff       	call   4fd <printf>
        return 0;
 97c:	b8 00 00 00 00       	mov    $0x0,%eax
 981:	eb 70                	jmp    9f3 <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 983:	8b 55 08             	mov    0x8(%ebp),%edx
 986:	8b 45 f0             	mov    -0x10(%ebp),%eax
 989:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 990:	00 
 991:	89 54 24 08          	mov    %edx,0x8(%esp)
 995:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 99c:	00 
 99d:	89 04 24             	mov    %eax,(%esp)
 9a0:	e8 6f fa ff ff       	call   414 <clone>
 9a5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 9a8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9ac:	79 1b                	jns    9c9 <thread_create+0xa3>
        printf(1,"clone fails\n");
 9ae:	c7 44 24 04 30 0a 00 	movl   $0xa30,0x4(%esp)
 9b5:	00 
 9b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9bd:	e8 3b fb ff ff       	call   4fd <printf>
        return 0;
 9c2:	b8 00 00 00 00       	mov    $0x0,%eax
 9c7:	eb 2a                	jmp    9f3 <thread_create+0xcd>
    }
    if(tid > 0){
 9c9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9cd:	7e 05                	jle    9d4 <thread_create+0xae>
        return garbage_stack;
 9cf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9d2:	eb 1f                	jmp    9f3 <thread_create+0xcd>
    }
    if(tid == 0){
 9d4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9d8:	75 14                	jne    9ee <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 9da:	c7 44 24 04 3d 0a 00 	movl   $0xa3d,0x4(%esp)
 9e1:	00 
 9e2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9e9:	e8 0f fb ff ff       	call   4fd <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 9ee:	b8 00 00 00 00       	mov    $0x0,%eax
}
 9f3:	c9                   	leave  
 9f4:	c3                   	ret    
