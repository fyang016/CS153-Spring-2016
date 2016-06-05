
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
   f:	c7 44 24 04 20 0d 00 	movl   $0xd20,0x4(%esp)
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
  2b:	c7 44 24 04 20 0d 00 	movl   $0xd20,0x4(%esp)
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
  4d:	c7 44 24 04 6e 0c 00 	movl   $0xc6e,0x4(%esp)
  54:	00 
  55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5c:	e8 b4 04 00 00       	call   515 <printf>
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
  c9:	c7 44 24 04 7f 0c 00 	movl   $0xc7f,0x4(%esp)
  d0:	00 
  d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  d8:	e8 38 04 00 00       	call   515 <printf>
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

00000424 <tsleep>:
SYSCALL(tsleep)
 424:	b8 18 00 00 00       	mov    $0x18,%eax
 429:	cd 40                	int    $0x40
 42b:	c3                   	ret    

0000042c <twakeup>:
SYSCALL(twakeup)
 42c:	b8 19 00 00 00       	mov    $0x19,%eax
 431:	cd 40                	int    $0x40
 433:	c3                   	ret    

00000434 <test>:
SYSCALL(test)
 434:	b8 1a 00 00 00       	mov    $0x1a,%eax
 439:	cd 40                	int    $0x40
 43b:	c3                   	ret    

0000043c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 43c:	55                   	push   %ebp
 43d:	89 e5                	mov    %esp,%ebp
 43f:	83 ec 28             	sub    $0x28,%esp
 442:	8b 45 0c             	mov    0xc(%ebp),%eax
 445:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 448:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 44f:	00 
 450:	8d 45 f4             	lea    -0xc(%ebp),%eax
 453:	89 44 24 04          	mov    %eax,0x4(%esp)
 457:	8b 45 08             	mov    0x8(%ebp),%eax
 45a:	89 04 24             	mov    %eax,(%esp)
 45d:	e8 32 ff ff ff       	call   394 <write>
}
 462:	c9                   	leave  
 463:	c3                   	ret    

00000464 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 464:	55                   	push   %ebp
 465:	89 e5                	mov    %esp,%ebp
 467:	53                   	push   %ebx
 468:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 46b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 472:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 476:	74 17                	je     48f <printint+0x2b>
 478:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 47c:	79 11                	jns    48f <printint+0x2b>
    neg = 1;
 47e:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 485:	8b 45 0c             	mov    0xc(%ebp),%eax
 488:	f7 d8                	neg    %eax
 48a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 48d:	eb 06                	jmp    495 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 48f:	8b 45 0c             	mov    0xc(%ebp),%eax
 492:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 495:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 49c:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 49f:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a5:	ba 00 00 00 00       	mov    $0x0,%edx
 4aa:	f7 f3                	div    %ebx
 4ac:	89 d0                	mov    %edx,%eax
 4ae:	0f b6 80 dc 0c 00 00 	movzbl 0xcdc(%eax),%eax
 4b5:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 4b9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 4bd:	8b 45 10             	mov    0x10(%ebp),%eax
 4c0:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 4c3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4c6:	ba 00 00 00 00       	mov    $0x0,%edx
 4cb:	f7 75 d4             	divl   -0x2c(%ebp)
 4ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4d1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4d5:	75 c5                	jne    49c <printint+0x38>
  if(neg)
 4d7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4db:	74 28                	je     505 <printint+0xa1>
    buf[i++] = '-';
 4dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4e0:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 4e5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 4e9:	eb 1a                	jmp    505 <printint+0xa1>
    putc(fd, buf[i]);
 4eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4ee:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 4f3:	0f be c0             	movsbl %al,%eax
 4f6:	89 44 24 04          	mov    %eax,0x4(%esp)
 4fa:	8b 45 08             	mov    0x8(%ebp),%eax
 4fd:	89 04 24             	mov    %eax,(%esp)
 500:	e8 37 ff ff ff       	call   43c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 505:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 509:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 50d:	79 dc                	jns    4eb <printint+0x87>
    putc(fd, buf[i]);
}
 50f:	83 c4 44             	add    $0x44,%esp
 512:	5b                   	pop    %ebx
 513:	5d                   	pop    %ebp
 514:	c3                   	ret    

00000515 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 515:	55                   	push   %ebp
 516:	89 e5                	mov    %esp,%ebp
 518:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 51b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 522:	8d 45 0c             	lea    0xc(%ebp),%eax
 525:	83 c0 04             	add    $0x4,%eax
 528:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 52b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 532:	e9 7e 01 00 00       	jmp    6b5 <printf+0x1a0>
    c = fmt[i] & 0xff;
 537:	8b 55 0c             	mov    0xc(%ebp),%edx
 53a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 53d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 540:	0f b6 00             	movzbl (%eax),%eax
 543:	0f be c0             	movsbl %al,%eax
 546:	25 ff 00 00 00       	and    $0xff,%eax
 54b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 54e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 552:	75 2c                	jne    580 <printf+0x6b>
      if(c == '%'){
 554:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 558:	75 0c                	jne    566 <printf+0x51>
        state = '%';
 55a:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 561:	e9 4b 01 00 00       	jmp    6b1 <printf+0x19c>
      } else {
        putc(fd, c);
 566:	8b 45 e8             	mov    -0x18(%ebp),%eax
 569:	0f be c0             	movsbl %al,%eax
 56c:	89 44 24 04          	mov    %eax,0x4(%esp)
 570:	8b 45 08             	mov    0x8(%ebp),%eax
 573:	89 04 24             	mov    %eax,(%esp)
 576:	e8 c1 fe ff ff       	call   43c <putc>
 57b:	e9 31 01 00 00       	jmp    6b1 <printf+0x19c>
      }
    } else if(state == '%'){
 580:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 584:	0f 85 27 01 00 00    	jne    6b1 <printf+0x19c>
      if(c == 'd'){
 58a:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 58e:	75 2d                	jne    5bd <printf+0xa8>
        printint(fd, *ap, 10, 1);
 590:	8b 45 f4             	mov    -0xc(%ebp),%eax
 593:	8b 00                	mov    (%eax),%eax
 595:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 59c:	00 
 59d:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5a4:	00 
 5a5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5a9:	8b 45 08             	mov    0x8(%ebp),%eax
 5ac:	89 04 24             	mov    %eax,(%esp)
 5af:	e8 b0 fe ff ff       	call   464 <printint>
        ap++;
 5b4:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 5b8:	e9 ed 00 00 00       	jmp    6aa <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 5bd:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 5c1:	74 06                	je     5c9 <printf+0xb4>
 5c3:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 5c7:	75 2d                	jne    5f6 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 5c9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5cc:	8b 00                	mov    (%eax),%eax
 5ce:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5d5:	00 
 5d6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5dd:	00 
 5de:	89 44 24 04          	mov    %eax,0x4(%esp)
 5e2:	8b 45 08             	mov    0x8(%ebp),%eax
 5e5:	89 04 24             	mov    %eax,(%esp)
 5e8:	e8 77 fe ff ff       	call   464 <printint>
        ap++;
 5ed:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 5f1:	e9 b4 00 00 00       	jmp    6aa <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 5f6:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 5fa:	75 46                	jne    642 <printf+0x12d>
        s = (char*)*ap;
 5fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ff:	8b 00                	mov    (%eax),%eax
 601:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 604:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 608:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 60c:	75 27                	jne    635 <printf+0x120>
          s = "(null)";
 60e:	c7 45 e4 94 0c 00 00 	movl   $0xc94,-0x1c(%ebp)
        while(*s != 0){
 615:	eb 1f                	jmp    636 <printf+0x121>
          putc(fd, *s);
 617:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 61a:	0f b6 00             	movzbl (%eax),%eax
 61d:	0f be c0             	movsbl %al,%eax
 620:	89 44 24 04          	mov    %eax,0x4(%esp)
 624:	8b 45 08             	mov    0x8(%ebp),%eax
 627:	89 04 24             	mov    %eax,(%esp)
 62a:	e8 0d fe ff ff       	call   43c <putc>
          s++;
 62f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 633:	eb 01                	jmp    636 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 635:	90                   	nop
 636:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 639:	0f b6 00             	movzbl (%eax),%eax
 63c:	84 c0                	test   %al,%al
 63e:	75 d7                	jne    617 <printf+0x102>
 640:	eb 68                	jmp    6aa <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 642:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 646:	75 1d                	jne    665 <printf+0x150>
        putc(fd, *ap);
 648:	8b 45 f4             	mov    -0xc(%ebp),%eax
 64b:	8b 00                	mov    (%eax),%eax
 64d:	0f be c0             	movsbl %al,%eax
 650:	89 44 24 04          	mov    %eax,0x4(%esp)
 654:	8b 45 08             	mov    0x8(%ebp),%eax
 657:	89 04 24             	mov    %eax,(%esp)
 65a:	e8 dd fd ff ff       	call   43c <putc>
        ap++;
 65f:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 663:	eb 45                	jmp    6aa <printf+0x195>
      } else if(c == '%'){
 665:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 669:	75 17                	jne    682 <printf+0x16d>
        putc(fd, c);
 66b:	8b 45 e8             	mov    -0x18(%ebp),%eax
 66e:	0f be c0             	movsbl %al,%eax
 671:	89 44 24 04          	mov    %eax,0x4(%esp)
 675:	8b 45 08             	mov    0x8(%ebp),%eax
 678:	89 04 24             	mov    %eax,(%esp)
 67b:	e8 bc fd ff ff       	call   43c <putc>
 680:	eb 28                	jmp    6aa <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 682:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 689:	00 
 68a:	8b 45 08             	mov    0x8(%ebp),%eax
 68d:	89 04 24             	mov    %eax,(%esp)
 690:	e8 a7 fd ff ff       	call   43c <putc>
        putc(fd, c);
 695:	8b 45 e8             	mov    -0x18(%ebp),%eax
 698:	0f be c0             	movsbl %al,%eax
 69b:	89 44 24 04          	mov    %eax,0x4(%esp)
 69f:	8b 45 08             	mov    0x8(%ebp),%eax
 6a2:	89 04 24             	mov    %eax,(%esp)
 6a5:	e8 92 fd ff ff       	call   43c <putc>
      }
      state = 0;
 6aa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6b1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 6b5:	8b 55 0c             	mov    0xc(%ebp),%edx
 6b8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6bb:	8d 04 02             	lea    (%edx,%eax,1),%eax
 6be:	0f b6 00             	movzbl (%eax),%eax
 6c1:	84 c0                	test   %al,%al
 6c3:	0f 85 6e fe ff ff    	jne    537 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6c9:	c9                   	leave  
 6ca:	c3                   	ret    
 6cb:	90                   	nop

000006cc <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6cc:	55                   	push   %ebp
 6cd:	89 e5                	mov    %esp,%ebp
 6cf:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6d2:	8b 45 08             	mov    0x8(%ebp),%eax
 6d5:	83 e8 08             	sub    $0x8,%eax
 6d8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6db:	a1 08 0d 00 00       	mov    0xd08,%eax
 6e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6e3:	eb 24                	jmp    709 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6e5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6e8:	8b 00                	mov    (%eax),%eax
 6ea:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6ed:	77 12                	ja     701 <free+0x35>
 6ef:	8b 45 f8             	mov    -0x8(%ebp),%eax
 6f2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 6f5:	77 24                	ja     71b <free+0x4f>
 6f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fa:	8b 00                	mov    (%eax),%eax
 6fc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 6ff:	77 1a                	ja     71b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 701:	8b 45 fc             	mov    -0x4(%ebp),%eax
 704:	8b 00                	mov    (%eax),%eax
 706:	89 45 fc             	mov    %eax,-0x4(%ebp)
 709:	8b 45 f8             	mov    -0x8(%ebp),%eax
 70c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 70f:	76 d4                	jbe    6e5 <free+0x19>
 711:	8b 45 fc             	mov    -0x4(%ebp),%eax
 714:	8b 00                	mov    (%eax),%eax
 716:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 719:	76 ca                	jbe    6e5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 71b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 71e:	8b 40 04             	mov    0x4(%eax),%eax
 721:	c1 e0 03             	shl    $0x3,%eax
 724:	89 c2                	mov    %eax,%edx
 726:	03 55 f8             	add    -0x8(%ebp),%edx
 729:	8b 45 fc             	mov    -0x4(%ebp),%eax
 72c:	8b 00                	mov    (%eax),%eax
 72e:	39 c2                	cmp    %eax,%edx
 730:	75 24                	jne    756 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 732:	8b 45 f8             	mov    -0x8(%ebp),%eax
 735:	8b 50 04             	mov    0x4(%eax),%edx
 738:	8b 45 fc             	mov    -0x4(%ebp),%eax
 73b:	8b 00                	mov    (%eax),%eax
 73d:	8b 40 04             	mov    0x4(%eax),%eax
 740:	01 c2                	add    %eax,%edx
 742:	8b 45 f8             	mov    -0x8(%ebp),%eax
 745:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 748:	8b 45 fc             	mov    -0x4(%ebp),%eax
 74b:	8b 00                	mov    (%eax),%eax
 74d:	8b 10                	mov    (%eax),%edx
 74f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 752:	89 10                	mov    %edx,(%eax)
 754:	eb 0a                	jmp    760 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 756:	8b 45 fc             	mov    -0x4(%ebp),%eax
 759:	8b 10                	mov    (%eax),%edx
 75b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 75e:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 760:	8b 45 fc             	mov    -0x4(%ebp),%eax
 763:	8b 40 04             	mov    0x4(%eax),%eax
 766:	c1 e0 03             	shl    $0x3,%eax
 769:	03 45 fc             	add    -0x4(%ebp),%eax
 76c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 76f:	75 20                	jne    791 <free+0xc5>
    p->s.size += bp->s.size;
 771:	8b 45 fc             	mov    -0x4(%ebp),%eax
 774:	8b 50 04             	mov    0x4(%eax),%edx
 777:	8b 45 f8             	mov    -0x8(%ebp),%eax
 77a:	8b 40 04             	mov    0x4(%eax),%eax
 77d:	01 c2                	add    %eax,%edx
 77f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 782:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 785:	8b 45 f8             	mov    -0x8(%ebp),%eax
 788:	8b 10                	mov    (%eax),%edx
 78a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 78d:	89 10                	mov    %edx,(%eax)
 78f:	eb 08                	jmp    799 <free+0xcd>
  } else
    p->s.ptr = bp;
 791:	8b 45 fc             	mov    -0x4(%ebp),%eax
 794:	8b 55 f8             	mov    -0x8(%ebp),%edx
 797:	89 10                	mov    %edx,(%eax)
  freep = p;
 799:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79c:	a3 08 0d 00 00       	mov    %eax,0xd08
}
 7a1:	c9                   	leave  
 7a2:	c3                   	ret    

000007a3 <morecore>:

static Header*
morecore(uint nu)
{
 7a3:	55                   	push   %ebp
 7a4:	89 e5                	mov    %esp,%ebp
 7a6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7a9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7b0:	77 07                	ja     7b9 <morecore+0x16>
    nu = 4096;
 7b2:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7b9:	8b 45 08             	mov    0x8(%ebp),%eax
 7bc:	c1 e0 03             	shl    $0x3,%eax
 7bf:	89 04 24             	mov    %eax,(%esp)
 7c2:	e8 35 fc ff ff       	call   3fc <sbrk>
 7c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 7ca:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 7ce:	75 07                	jne    7d7 <morecore+0x34>
    return 0;
 7d0:	b8 00 00 00 00       	mov    $0x0,%eax
 7d5:	eb 22                	jmp    7f9 <morecore+0x56>
  hp = (Header*)p;
 7d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 7dd:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e0:	8b 55 08             	mov    0x8(%ebp),%edx
 7e3:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 7e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e9:	83 c0 08             	add    $0x8,%eax
 7ec:	89 04 24             	mov    %eax,(%esp)
 7ef:	e8 d8 fe ff ff       	call   6cc <free>
  return freep;
 7f4:	a1 08 0d 00 00       	mov    0xd08,%eax
}
 7f9:	c9                   	leave  
 7fa:	c3                   	ret    

000007fb <malloc>:

void*
malloc(uint nbytes)
{
 7fb:	55                   	push   %ebp
 7fc:	89 e5                	mov    %esp,%ebp
 7fe:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 801:	8b 45 08             	mov    0x8(%ebp),%eax
 804:	83 c0 07             	add    $0x7,%eax
 807:	c1 e8 03             	shr    $0x3,%eax
 80a:	83 c0 01             	add    $0x1,%eax
 80d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 810:	a1 08 0d 00 00       	mov    0xd08,%eax
 815:	89 45 f0             	mov    %eax,-0x10(%ebp)
 818:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 81c:	75 23                	jne    841 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 81e:	c7 45 f0 00 0d 00 00 	movl   $0xd00,-0x10(%ebp)
 825:	8b 45 f0             	mov    -0x10(%ebp),%eax
 828:	a3 08 0d 00 00       	mov    %eax,0xd08
 82d:	a1 08 0d 00 00       	mov    0xd08,%eax
 832:	a3 00 0d 00 00       	mov    %eax,0xd00
    base.s.size = 0;
 837:	c7 05 04 0d 00 00 00 	movl   $0x0,0xd04
 83e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 841:	8b 45 f0             	mov    -0x10(%ebp),%eax
 844:	8b 00                	mov    (%eax),%eax
 846:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 849:	8b 45 ec             	mov    -0x14(%ebp),%eax
 84c:	8b 40 04             	mov    0x4(%eax),%eax
 84f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 852:	72 4d                	jb     8a1 <malloc+0xa6>
      if(p->s.size == nunits)
 854:	8b 45 ec             	mov    -0x14(%ebp),%eax
 857:	8b 40 04             	mov    0x4(%eax),%eax
 85a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 85d:	75 0c                	jne    86b <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 85f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 862:	8b 10                	mov    (%eax),%edx
 864:	8b 45 f0             	mov    -0x10(%ebp),%eax
 867:	89 10                	mov    %edx,(%eax)
 869:	eb 26                	jmp    891 <malloc+0x96>
      else {
        p->s.size -= nunits;
 86b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 86e:	8b 40 04             	mov    0x4(%eax),%eax
 871:	89 c2                	mov    %eax,%edx
 873:	2b 55 f4             	sub    -0xc(%ebp),%edx
 876:	8b 45 ec             	mov    -0x14(%ebp),%eax
 879:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 87c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 87f:	8b 40 04             	mov    0x4(%eax),%eax
 882:	c1 e0 03             	shl    $0x3,%eax
 885:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 888:	8b 45 ec             	mov    -0x14(%ebp),%eax
 88b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 88e:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 891:	8b 45 f0             	mov    -0x10(%ebp),%eax
 894:	a3 08 0d 00 00       	mov    %eax,0xd08
      return (void*)(p + 1);
 899:	8b 45 ec             	mov    -0x14(%ebp),%eax
 89c:	83 c0 08             	add    $0x8,%eax
 89f:	eb 38                	jmp    8d9 <malloc+0xde>
    }
    if(p == freep)
 8a1:	a1 08 0d 00 00       	mov    0xd08,%eax
 8a6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 8a9:	75 1b                	jne    8c6 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ae:	89 04 24             	mov    %eax,(%esp)
 8b1:	e8 ed fe ff ff       	call   7a3 <morecore>
 8b6:	89 45 ec             	mov    %eax,-0x14(%ebp)
 8b9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 8bd:	75 07                	jne    8c6 <malloc+0xcb>
        return 0;
 8bf:	b8 00 00 00 00       	mov    $0x0,%eax
 8c4:	eb 13                	jmp    8d9 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8c6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8cf:	8b 00                	mov    (%eax),%eax
 8d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8d4:	e9 70 ff ff ff       	jmp    849 <malloc+0x4e>
}
 8d9:	c9                   	leave  
 8da:	c3                   	ret    
 8db:	90                   	nop

000008dc <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 8dc:	55                   	push   %ebp
 8dd:	89 e5                	mov    %esp,%ebp
 8df:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8e2:	8b 55 08             	mov    0x8(%ebp),%edx
 8e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 8e8:	8b 4d 08             	mov    0x8(%ebp),%ecx
 8eb:	f0 87 02             	lock xchg %eax,(%edx)
 8ee:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 8f1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 8f4:	c9                   	leave  
 8f5:	c3                   	ret    

000008f6 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 8f6:	55                   	push   %ebp
 8f7:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 8f9:	8b 45 08             	mov    0x8(%ebp),%eax
 8fc:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 902:	5d                   	pop    %ebp
 903:	c3                   	ret    

00000904 <lock_acquire>:
void lock_acquire(lock_t *lock){
 904:	55                   	push   %ebp
 905:	89 e5                	mov    %esp,%ebp
 907:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 90a:	8b 45 08             	mov    0x8(%ebp),%eax
 90d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 914:	00 
 915:	89 04 24             	mov    %eax,(%esp)
 918:	e8 bf ff ff ff       	call   8dc <xchg>
 91d:	85 c0                	test   %eax,%eax
 91f:	75 e9                	jne    90a <lock_acquire+0x6>
}
 921:	c9                   	leave  
 922:	c3                   	ret    

00000923 <lock_release>:
void lock_release(lock_t *lock){
 923:	55                   	push   %ebp
 924:	89 e5                	mov    %esp,%ebp
 926:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 929:	8b 45 08             	mov    0x8(%ebp),%eax
 92c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 933:	00 
 934:	89 04 24             	mov    %eax,(%esp)
 937:	e8 a0 ff ff ff       	call   8dc <xchg>
}
 93c:	c9                   	leave  
 93d:	c3                   	ret    

0000093e <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 93e:	55                   	push   %ebp
 93f:	89 e5                	mov    %esp,%ebp
 941:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 944:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 94b:	e8 ab fe ff ff       	call   7fb <malloc>
 950:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 953:	8b 45 f0             	mov    -0x10(%ebp),%eax
 956:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 959:	8b 45 f0             	mov    -0x10(%ebp),%eax
 95c:	25 ff 0f 00 00       	and    $0xfff,%eax
 961:	85 c0                	test   %eax,%eax
 963:	74 15                	je     97a <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 965:	8b 45 f0             	mov    -0x10(%ebp),%eax
 968:	89 c2                	mov    %eax,%edx
 96a:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 970:	b8 00 10 00 00       	mov    $0x1000,%eax
 975:	29 d0                	sub    %edx,%eax
 977:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 97a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 97e:	75 1b                	jne    99b <thread_create+0x5d>

        printf(1,"malloc fail \n");
 980:	c7 44 24 04 9b 0c 00 	movl   $0xc9b,0x4(%esp)
 987:	00 
 988:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 98f:	e8 81 fb ff ff       	call   515 <printf>
        return 0;
 994:	b8 00 00 00 00       	mov    $0x0,%eax
 999:	eb 6f                	jmp    a0a <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 99b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 99e:	8b 55 08             	mov    0x8(%ebp),%edx
 9a1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 9a4:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 9a8:	89 54 24 08          	mov    %edx,0x8(%esp)
 9ac:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 9b3:	00 
 9b4:	89 04 24             	mov    %eax,(%esp)
 9b7:	e8 58 fa ff ff       	call   414 <clone>
 9bc:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 9bf:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9c3:	79 1b                	jns    9e0 <thread_create+0xa2>
        printf(1,"clone fails\n");
 9c5:	c7 44 24 04 a9 0c 00 	movl   $0xca9,0x4(%esp)
 9cc:	00 
 9cd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9d4:	e8 3c fb ff ff       	call   515 <printf>
        return 0;
 9d9:	b8 00 00 00 00       	mov    $0x0,%eax
 9de:	eb 2a                	jmp    a0a <thread_create+0xcc>
    }
    if(tid > 0){
 9e0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9e4:	7e 05                	jle    9eb <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 9e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9e9:	eb 1f                	jmp    a0a <thread_create+0xcc>
    }
    if(tid == 0){
 9eb:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9ef:	75 14                	jne    a05 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 9f1:	c7 44 24 04 b6 0c 00 	movl   $0xcb6,0x4(%esp)
 9f8:	00 
 9f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a00:	e8 10 fb ff ff       	call   515 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 a05:	b8 00 00 00 00       	mov    $0x0,%eax
}
 a0a:	c9                   	leave  
 a0b:	c3                   	ret    

00000a0c <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 a0c:	55                   	push   %ebp
 a0d:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 a0f:	8b 45 08             	mov    0x8(%ebp),%eax
 a12:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 a18:	8b 45 08             	mov    0x8(%ebp),%eax
 a1b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 a22:	8b 45 08             	mov    0x8(%ebp),%eax
 a25:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 a2c:	5d                   	pop    %ebp
 a2d:	c3                   	ret    

00000a2e <add_q>:

void add_q(struct queue *q, int v){
 a2e:	55                   	push   %ebp
 a2f:	89 e5                	mov    %esp,%ebp
 a31:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 a34:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 a3b:	e8 bb fd ff ff       	call   7fb <malloc>
 a40:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 a43:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a46:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 a4d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a50:	8b 55 0c             	mov    0xc(%ebp),%edx
 a53:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 a55:	8b 45 08             	mov    0x8(%ebp),%eax
 a58:	8b 40 04             	mov    0x4(%eax),%eax
 a5b:	85 c0                	test   %eax,%eax
 a5d:	75 0b                	jne    a6a <add_q+0x3c>
        q->head = n;
 a5f:	8b 45 08             	mov    0x8(%ebp),%eax
 a62:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a65:	89 50 04             	mov    %edx,0x4(%eax)
 a68:	eb 0c                	jmp    a76 <add_q+0x48>
    }else{
        q->tail->next = n;
 a6a:	8b 45 08             	mov    0x8(%ebp),%eax
 a6d:	8b 40 08             	mov    0x8(%eax),%eax
 a70:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a73:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 a76:	8b 45 08             	mov    0x8(%ebp),%eax
 a79:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a7c:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 a7f:	8b 45 08             	mov    0x8(%ebp),%eax
 a82:	8b 00                	mov    (%eax),%eax
 a84:	8d 50 01             	lea    0x1(%eax),%edx
 a87:	8b 45 08             	mov    0x8(%ebp),%eax
 a8a:	89 10                	mov    %edx,(%eax)
}
 a8c:	c9                   	leave  
 a8d:	c3                   	ret    

00000a8e <empty_q>:

int empty_q(struct queue *q){
 a8e:	55                   	push   %ebp
 a8f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 a91:	8b 45 08             	mov    0x8(%ebp),%eax
 a94:	8b 00                	mov    (%eax),%eax
 a96:	85 c0                	test   %eax,%eax
 a98:	75 07                	jne    aa1 <empty_q+0x13>
        return 1;
 a9a:	b8 01 00 00 00       	mov    $0x1,%eax
 a9f:	eb 05                	jmp    aa6 <empty_q+0x18>
    else
        return 0;
 aa1:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 aa6:	5d                   	pop    %ebp
 aa7:	c3                   	ret    

00000aa8 <pop_q>:
int pop_q(struct queue *q){
 aa8:	55                   	push   %ebp
 aa9:	89 e5                	mov    %esp,%ebp
 aab:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 aae:	8b 45 08             	mov    0x8(%ebp),%eax
 ab1:	89 04 24             	mov    %eax,(%esp)
 ab4:	e8 d5 ff ff ff       	call   a8e <empty_q>
 ab9:	85 c0                	test   %eax,%eax
 abb:	75 5d                	jne    b1a <pop_q+0x72>
       val = q->head->value; 
 abd:	8b 45 08             	mov    0x8(%ebp),%eax
 ac0:	8b 40 04             	mov    0x4(%eax),%eax
 ac3:	8b 00                	mov    (%eax),%eax
 ac5:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 ac8:	8b 45 08             	mov    0x8(%ebp),%eax
 acb:	8b 40 04             	mov    0x4(%eax),%eax
 ace:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 ad1:	8b 45 08             	mov    0x8(%ebp),%eax
 ad4:	8b 40 04             	mov    0x4(%eax),%eax
 ad7:	8b 50 04             	mov    0x4(%eax),%edx
 ada:	8b 45 08             	mov    0x8(%ebp),%eax
 add:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 ae0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae3:	89 04 24             	mov    %eax,(%esp)
 ae6:	e8 e1 fb ff ff       	call   6cc <free>
       q->size--;
 aeb:	8b 45 08             	mov    0x8(%ebp),%eax
 aee:	8b 00                	mov    (%eax),%eax
 af0:	8d 50 ff             	lea    -0x1(%eax),%edx
 af3:	8b 45 08             	mov    0x8(%ebp),%eax
 af6:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 af8:	8b 45 08             	mov    0x8(%ebp),%eax
 afb:	8b 00                	mov    (%eax),%eax
 afd:	85 c0                	test   %eax,%eax
 aff:	75 14                	jne    b15 <pop_q+0x6d>
            q->head = 0;
 b01:	8b 45 08             	mov    0x8(%ebp),%eax
 b04:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 b0b:	8b 45 08             	mov    0x8(%ebp),%eax
 b0e:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 b15:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b18:	eb 05                	jmp    b1f <pop_q+0x77>
    }
    return -1;
 b1a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 b1f:	c9                   	leave  
 b20:	c3                   	ret    
 b21:	90                   	nop
 b22:	90                   	nop
 b23:	90                   	nop

00000b24 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 b24:	55                   	push   %ebp
 b25:	89 e5                	mov    %esp,%ebp
 b27:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 b2a:	8b 45 08             	mov    0x8(%ebp),%eax
 b2d:	8b 55 0c             	mov    0xc(%ebp),%edx
 b30:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 b33:	8b 45 08             	mov    0x8(%ebp),%eax
 b36:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 b3d:	8b 45 08             	mov    0x8(%ebp),%eax
 b40:	89 04 24             	mov    %eax,(%esp)
 b43:	e8 ae fd ff ff       	call   8f6 <lock_init>
}
 b48:	c9                   	leave  
 b49:	c3                   	ret    

00000b4a <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 b4a:	55                   	push   %ebp
 b4b:	89 e5                	mov    %esp,%ebp
 b4d:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 b50:	8b 45 08             	mov    0x8(%ebp),%eax
 b53:	89 04 24             	mov    %eax,(%esp)
 b56:	e8 a9 fd ff ff       	call   904 <lock_acquire>
	if(s->count  == 0){
 b5b:	8b 45 08             	mov    0x8(%ebp),%eax
 b5e:	8b 40 04             	mov    0x4(%eax),%eax
 b61:	85 c0                	test   %eax,%eax
 b63:	75 43                	jne    ba8 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 b65:	c7 44 24 04 c7 0c 00 	movl   $0xcc7,0x4(%esp)
 b6c:	00 
 b6d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b74:	e8 9c f9 ff ff       	call   515 <printf>
		//add proc to waiters list
		int tid = getpid();
 b79:	e8 76 f8 ff ff       	call   3f4 <getpid>
 b7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 b81:	8b 45 08             	mov    0x8(%ebp),%eax
 b84:	8d 50 0c             	lea    0xc(%eax),%edx
 b87:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b8a:	89 44 24 04          	mov    %eax,0x4(%esp)
 b8e:	89 14 24             	mov    %edx,(%esp)
 b91:	e8 98 fe ff ff       	call   a2e <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 b96:	8b 45 08             	mov    0x8(%ebp),%eax
 b99:	89 04 24             	mov    %eax,(%esp)
 b9c:	e8 82 fd ff ff       	call   923 <lock_release>
		tsleep(); 
 ba1:	e8 7e f8 ff ff       	call   424 <tsleep>
 ba6:	eb 2e                	jmp    bd6 <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 ba8:	c7 44 24 04 ce 0c 00 	movl   $0xcce,0x4(%esp)
 baf:	00 
 bb0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bb7:	e8 59 f9 ff ff       	call   515 <printf>
		s->count--;	
 bbc:	8b 45 08             	mov    0x8(%ebp),%eax
 bbf:	8b 40 04             	mov    0x4(%eax),%eax
 bc2:	8d 50 ff             	lea    -0x1(%eax),%edx
 bc5:	8b 45 08             	mov    0x8(%ebp),%eax
 bc8:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 bcb:	8b 45 08             	mov    0x8(%ebp),%eax
 bce:	89 04 24             	mov    %eax,(%esp)
 bd1:	e8 4d fd ff ff       	call   923 <lock_release>
	}
}
 bd6:	c9                   	leave  
 bd7:	c3                   	ret    

00000bd8 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 bd8:	55                   	push   %ebp
 bd9:	89 e5                	mov    %esp,%ebp
 bdb:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 bde:	c7 44 24 04 d5 0c 00 	movl   $0xcd5,0x4(%esp)
 be5:	00 
 be6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bed:	e8 23 f9 ff ff       	call   515 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 bf2:	8b 45 08             	mov    0x8(%ebp),%eax
 bf5:	89 04 24             	mov    %eax,(%esp)
 bf8:	e8 07 fd ff ff       	call   904 <lock_acquire>
	if(s->count < s->size){
 bfd:	8b 45 08             	mov    0x8(%ebp),%eax
 c00:	8b 50 04             	mov    0x4(%eax),%edx
 c03:	8b 45 08             	mov    0x8(%ebp),%eax
 c06:	8b 40 08             	mov    0x8(%eax),%eax
 c09:	39 c2                	cmp    %eax,%edx
 c0b:	7d 0f                	jge    c1c <sem_signal+0x44>
		s->count++;	
 c0d:	8b 45 08             	mov    0x8(%ebp),%eax
 c10:	8b 40 04             	mov    0x4(%eax),%eax
 c13:	8d 50 01             	lea    0x1(%eax),%edx
 c16:	8b 45 08             	mov    0x8(%ebp),%eax
 c19:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 c1c:	8b 45 08             	mov    0x8(%ebp),%eax
 c1f:	83 c0 0c             	add    $0xc,%eax
 c22:	89 04 24             	mov    %eax,(%esp)
 c25:	e8 7e fe ff ff       	call   aa8 <pop_q>
 c2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 c2d:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 c31:	74 2e                	je     c61 <sem_signal+0x89>
		printf(1, "Sem A\n");
 c33:	c7 44 24 04 ce 0c 00 	movl   $0xcce,0x4(%esp)
 c3a:	00 
 c3b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c42:	e8 ce f8 ff ff       	call   515 <printf>
		twakeup(tid);
 c47:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c4a:	89 04 24             	mov    %eax,(%esp)
 c4d:	e8 da f7 ff ff       	call   42c <twakeup>
		s->count--;
 c52:	8b 45 08             	mov    0x8(%ebp),%eax
 c55:	8b 40 04             	mov    0x4(%eax),%eax
 c58:	8d 50 ff             	lea    -0x1(%eax),%edx
 c5b:	8b 45 08             	mov    0x8(%ebp),%eax
 c5e:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 c61:	8b 45 08             	mov    0x8(%ebp),%eax
 c64:	89 04 24             	mov    %eax,(%esp)
 c67:	e8 b7 fc ff ff       	call   923 <lock_release>

 c6c:	c9                   	leave  
 c6d:	c3                   	ret    
