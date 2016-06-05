
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
   f:	c7 44 24 04 20 11 00 	movl   $0x1120,0x4(%esp)
  16:	00 
  17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  1e:	e8 82 03 00 00       	call   3a5 <write>
void
cat(int fd)
{
  int n;

  while((n = read(fd, buf, sizeof(buf))) > 0)
  23:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  2a:	00 
  2b:	c7 44 24 04 20 11 00 	movl   $0x1120,0x4(%esp)
  32:	00 
  33:	8b 45 08             	mov    0x8(%ebp),%eax
  36:	89 04 24             	mov    %eax,(%esp)
  39:	e8 5f 03 00 00       	call   39d <read>
  3e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  41:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  45:	7f c1                	jg     8 <cat+0x8>
    write(1, buf, n);
  if(n < 0){
  47:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  4b:	79 19                	jns    66 <cat+0x66>
    printf(1, "cat: read error\n");
  4d:	c7 44 24 04 88 0c 00 	movl   $0xc88,0x4(%esp)
  54:	00 
  55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  5c:	e8 cc 04 00 00       	call   52d <printf>
    exit();
  61:	e8 1f 03 00 00       	call   385 <exit>
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
  83:	e8 fd 02 00 00       	call   385 <exit>
  }

  for(i = 1; i < argc; i++){
  88:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
  8f:	00 
  90:	eb 79                	jmp    10b <main+0xa3>
    if((fd = open(argv[i], 0)) < 0){
  92:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  96:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  9d:	8b 45 0c             	mov    0xc(%ebp),%eax
  a0:	01 d0                	add    %edx,%eax
  a2:	8b 00                	mov    (%eax),%eax
  a4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  ab:	00 
  ac:	89 04 24             	mov    %eax,(%esp)
  af:	e8 11 03 00 00       	call   3c5 <open>
  b4:	89 44 24 18          	mov    %eax,0x18(%esp)
  b8:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
  bd:	79 2f                	jns    ee <main+0x86>
      printf(1, "cat: cannot open %s\n", argv[i]);
  bf:	8b 44 24 1c          	mov    0x1c(%esp),%eax
  c3:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  ca:	8b 45 0c             	mov    0xc(%ebp),%eax
  cd:	01 d0                	add    %edx,%eax
  cf:	8b 00                	mov    (%eax),%eax
  d1:	89 44 24 08          	mov    %eax,0x8(%esp)
  d5:	c7 44 24 04 99 0c 00 	movl   $0xc99,0x4(%esp)
  dc:	00 
  dd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  e4:	e8 44 04 00 00       	call   52d <printf>
      exit();
  e9:	e8 97 02 00 00       	call   385 <exit>
    }
    cat(fd);
  ee:	8b 44 24 18          	mov    0x18(%esp),%eax
  f2:	89 04 24             	mov    %eax,(%esp)
  f5:	e8 06 ff ff ff       	call   0 <cat>
    close(fd);
  fa:	8b 44 24 18          	mov    0x18(%esp),%eax
  fe:	89 04 24             	mov    %eax,(%esp)
 101:	e8 a7 02 00 00       	call   3ad <close>
  if(argc <= 1){
    cat(0);
    exit();
  }

  for(i = 1; i < argc; i++){
 106:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 10b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 10f:	3b 45 08             	cmp    0x8(%ebp),%eax
 112:	0f 8c 7a ff ff ff    	jl     92 <main+0x2a>
      exit();
    }
    cat(fd);
    close(fd);
  }
  exit();
 118:	e8 68 02 00 00       	call   385 <exit>

0000011d <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 11d:	55                   	push   %ebp
 11e:	89 e5                	mov    %esp,%ebp
 120:	57                   	push   %edi
 121:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 122:	8b 4d 08             	mov    0x8(%ebp),%ecx
 125:	8b 55 10             	mov    0x10(%ebp),%edx
 128:	8b 45 0c             	mov    0xc(%ebp),%eax
 12b:	89 cb                	mov    %ecx,%ebx
 12d:	89 df                	mov    %ebx,%edi
 12f:	89 d1                	mov    %edx,%ecx
 131:	fc                   	cld    
 132:	f3 aa                	rep stos %al,%es:(%edi)
 134:	89 ca                	mov    %ecx,%edx
 136:	89 fb                	mov    %edi,%ebx
 138:	89 5d 08             	mov    %ebx,0x8(%ebp)
 13b:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 13e:	5b                   	pop    %ebx
 13f:	5f                   	pop    %edi
 140:	5d                   	pop    %ebp
 141:	c3                   	ret    

00000142 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 142:	55                   	push   %ebp
 143:	89 e5                	mov    %esp,%ebp
 145:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 148:	8b 45 08             	mov    0x8(%ebp),%eax
 14b:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 14e:	90                   	nop
 14f:	8b 45 08             	mov    0x8(%ebp),%eax
 152:	8d 50 01             	lea    0x1(%eax),%edx
 155:	89 55 08             	mov    %edx,0x8(%ebp)
 158:	8b 55 0c             	mov    0xc(%ebp),%edx
 15b:	8d 4a 01             	lea    0x1(%edx),%ecx
 15e:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 161:	0f b6 12             	movzbl (%edx),%edx
 164:	88 10                	mov    %dl,(%eax)
 166:	0f b6 00             	movzbl (%eax),%eax
 169:	84 c0                	test   %al,%al
 16b:	75 e2                	jne    14f <strcpy+0xd>
    ;
  return os;
 16d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 170:	c9                   	leave  
 171:	c3                   	ret    

00000172 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 172:	55                   	push   %ebp
 173:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 175:	eb 08                	jmp    17f <strcmp+0xd>
    p++, q++;
 177:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 17b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 17f:	8b 45 08             	mov    0x8(%ebp),%eax
 182:	0f b6 00             	movzbl (%eax),%eax
 185:	84 c0                	test   %al,%al
 187:	74 10                	je     199 <strcmp+0x27>
 189:	8b 45 08             	mov    0x8(%ebp),%eax
 18c:	0f b6 10             	movzbl (%eax),%edx
 18f:	8b 45 0c             	mov    0xc(%ebp),%eax
 192:	0f b6 00             	movzbl (%eax),%eax
 195:	38 c2                	cmp    %al,%dl
 197:	74 de                	je     177 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 199:	8b 45 08             	mov    0x8(%ebp),%eax
 19c:	0f b6 00             	movzbl (%eax),%eax
 19f:	0f b6 d0             	movzbl %al,%edx
 1a2:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a5:	0f b6 00             	movzbl (%eax),%eax
 1a8:	0f b6 c0             	movzbl %al,%eax
 1ab:	29 c2                	sub    %eax,%edx
 1ad:	89 d0                	mov    %edx,%eax
}
 1af:	5d                   	pop    %ebp
 1b0:	c3                   	ret    

000001b1 <strlen>:

uint
strlen(char *s)
{
 1b1:	55                   	push   %ebp
 1b2:	89 e5                	mov    %esp,%ebp
 1b4:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 1b7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 1be:	eb 04                	jmp    1c4 <strlen+0x13>
 1c0:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 1c4:	8b 55 fc             	mov    -0x4(%ebp),%edx
 1c7:	8b 45 08             	mov    0x8(%ebp),%eax
 1ca:	01 d0                	add    %edx,%eax
 1cc:	0f b6 00             	movzbl (%eax),%eax
 1cf:	84 c0                	test   %al,%al
 1d1:	75 ed                	jne    1c0 <strlen+0xf>
    ;
  return n;
 1d3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 1d6:	c9                   	leave  
 1d7:	c3                   	ret    

000001d8 <memset>:

void*
memset(void *dst, int c, uint n)
{
 1d8:	55                   	push   %ebp
 1d9:	89 e5                	mov    %esp,%ebp
 1db:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 1de:	8b 45 10             	mov    0x10(%ebp),%eax
 1e1:	89 44 24 08          	mov    %eax,0x8(%esp)
 1e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e8:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ec:	8b 45 08             	mov    0x8(%ebp),%eax
 1ef:	89 04 24             	mov    %eax,(%esp)
 1f2:	e8 26 ff ff ff       	call   11d <stosb>
  return dst;
 1f7:	8b 45 08             	mov    0x8(%ebp),%eax
}
 1fa:	c9                   	leave  
 1fb:	c3                   	ret    

000001fc <strchr>:

char*
strchr(const char *s, char c)
{
 1fc:	55                   	push   %ebp
 1fd:	89 e5                	mov    %esp,%ebp
 1ff:	83 ec 04             	sub    $0x4,%esp
 202:	8b 45 0c             	mov    0xc(%ebp),%eax
 205:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 208:	eb 14                	jmp    21e <strchr+0x22>
    if(*s == c)
 20a:	8b 45 08             	mov    0x8(%ebp),%eax
 20d:	0f b6 00             	movzbl (%eax),%eax
 210:	3a 45 fc             	cmp    -0x4(%ebp),%al
 213:	75 05                	jne    21a <strchr+0x1e>
      return (char*)s;
 215:	8b 45 08             	mov    0x8(%ebp),%eax
 218:	eb 13                	jmp    22d <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 21a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 21e:	8b 45 08             	mov    0x8(%ebp),%eax
 221:	0f b6 00             	movzbl (%eax),%eax
 224:	84 c0                	test   %al,%al
 226:	75 e2                	jne    20a <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 228:	b8 00 00 00 00       	mov    $0x0,%eax
}
 22d:	c9                   	leave  
 22e:	c3                   	ret    

0000022f <gets>:

char*
gets(char *buf, int max)
{
 22f:	55                   	push   %ebp
 230:	89 e5                	mov    %esp,%ebp
 232:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 235:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 23c:	eb 4c                	jmp    28a <gets+0x5b>
    cc = read(0, &c, 1);
 23e:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 245:	00 
 246:	8d 45 ef             	lea    -0x11(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 254:	e8 44 01 00 00       	call   39d <read>
 259:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 25c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 260:	7f 02                	jg     264 <gets+0x35>
      break;
 262:	eb 31                	jmp    295 <gets+0x66>
    buf[i++] = c;
 264:	8b 45 f4             	mov    -0xc(%ebp),%eax
 267:	8d 50 01             	lea    0x1(%eax),%edx
 26a:	89 55 f4             	mov    %edx,-0xc(%ebp)
 26d:	89 c2                	mov    %eax,%edx
 26f:	8b 45 08             	mov    0x8(%ebp),%eax
 272:	01 c2                	add    %eax,%edx
 274:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 278:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 27a:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 27e:	3c 0a                	cmp    $0xa,%al
 280:	74 13                	je     295 <gets+0x66>
 282:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 286:	3c 0d                	cmp    $0xd,%al
 288:	74 0b                	je     295 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 28a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 28d:	83 c0 01             	add    $0x1,%eax
 290:	3b 45 0c             	cmp    0xc(%ebp),%eax
 293:	7c a9                	jl     23e <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 295:	8b 55 f4             	mov    -0xc(%ebp),%edx
 298:	8b 45 08             	mov    0x8(%ebp),%eax
 29b:	01 d0                	add    %edx,%eax
 29d:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 2a0:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2a3:	c9                   	leave  
 2a4:	c3                   	ret    

000002a5 <stat>:

int
stat(char *n, struct stat *st)
{
 2a5:	55                   	push   %ebp
 2a6:	89 e5                	mov    %esp,%ebp
 2a8:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 2ab:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 2b2:	00 
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	89 04 24             	mov    %eax,(%esp)
 2b9:	e8 07 01 00 00       	call   3c5 <open>
 2be:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 2c1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 2c5:	79 07                	jns    2ce <stat+0x29>
    return -1;
 2c7:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 2cc:	eb 23                	jmp    2f1 <stat+0x4c>
  r = fstat(fd, st);
 2ce:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2d8:	89 04 24             	mov    %eax,(%esp)
 2db:	e8 fd 00 00 00       	call   3dd <fstat>
 2e0:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 2e3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 2e6:	89 04 24             	mov    %eax,(%esp)
 2e9:	e8 bf 00 00 00       	call   3ad <close>
  return r;
 2ee:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 2f1:	c9                   	leave  
 2f2:	c3                   	ret    

000002f3 <atoi>:

int
atoi(const char *s)
{
 2f3:	55                   	push   %ebp
 2f4:	89 e5                	mov    %esp,%ebp
 2f6:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 2f9:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 300:	eb 25                	jmp    327 <atoi+0x34>
    n = n*10 + *s++ - '0';
 302:	8b 55 fc             	mov    -0x4(%ebp),%edx
 305:	89 d0                	mov    %edx,%eax
 307:	c1 e0 02             	shl    $0x2,%eax
 30a:	01 d0                	add    %edx,%eax
 30c:	01 c0                	add    %eax,%eax
 30e:	89 c1                	mov    %eax,%ecx
 310:	8b 45 08             	mov    0x8(%ebp),%eax
 313:	8d 50 01             	lea    0x1(%eax),%edx
 316:	89 55 08             	mov    %edx,0x8(%ebp)
 319:	0f b6 00             	movzbl (%eax),%eax
 31c:	0f be c0             	movsbl %al,%eax
 31f:	01 c8                	add    %ecx,%eax
 321:	83 e8 30             	sub    $0x30,%eax
 324:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 327:	8b 45 08             	mov    0x8(%ebp),%eax
 32a:	0f b6 00             	movzbl (%eax),%eax
 32d:	3c 2f                	cmp    $0x2f,%al
 32f:	7e 0a                	jle    33b <atoi+0x48>
 331:	8b 45 08             	mov    0x8(%ebp),%eax
 334:	0f b6 00             	movzbl (%eax),%eax
 337:	3c 39                	cmp    $0x39,%al
 339:	7e c7                	jle    302 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 33b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 33e:	c9                   	leave  
 33f:	c3                   	ret    

00000340 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 340:	55                   	push   %ebp
 341:	89 e5                	mov    %esp,%ebp
 343:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 346:	8b 45 08             	mov    0x8(%ebp),%eax
 349:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 34c:	8b 45 0c             	mov    0xc(%ebp),%eax
 34f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 352:	eb 17                	jmp    36b <memmove+0x2b>
    *dst++ = *src++;
 354:	8b 45 fc             	mov    -0x4(%ebp),%eax
 357:	8d 50 01             	lea    0x1(%eax),%edx
 35a:	89 55 fc             	mov    %edx,-0x4(%ebp)
 35d:	8b 55 f8             	mov    -0x8(%ebp),%edx
 360:	8d 4a 01             	lea    0x1(%edx),%ecx
 363:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 366:	0f b6 12             	movzbl (%edx),%edx
 369:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 36b:	8b 45 10             	mov    0x10(%ebp),%eax
 36e:	8d 50 ff             	lea    -0x1(%eax),%edx
 371:	89 55 10             	mov    %edx,0x10(%ebp)
 374:	85 c0                	test   %eax,%eax
 376:	7f dc                	jg     354 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 378:	8b 45 08             	mov    0x8(%ebp),%eax
}
 37b:	c9                   	leave  
 37c:	c3                   	ret    

0000037d <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 37d:	b8 01 00 00 00       	mov    $0x1,%eax
 382:	cd 40                	int    $0x40
 384:	c3                   	ret    

00000385 <exit>:
SYSCALL(exit)
 385:	b8 02 00 00 00       	mov    $0x2,%eax
 38a:	cd 40                	int    $0x40
 38c:	c3                   	ret    

0000038d <wait>:
SYSCALL(wait)
 38d:	b8 03 00 00 00       	mov    $0x3,%eax
 392:	cd 40                	int    $0x40
 394:	c3                   	ret    

00000395 <pipe>:
SYSCALL(pipe)
 395:	b8 04 00 00 00       	mov    $0x4,%eax
 39a:	cd 40                	int    $0x40
 39c:	c3                   	ret    

0000039d <read>:
SYSCALL(read)
 39d:	b8 05 00 00 00       	mov    $0x5,%eax
 3a2:	cd 40                	int    $0x40
 3a4:	c3                   	ret    

000003a5 <write>:
SYSCALL(write)
 3a5:	b8 10 00 00 00       	mov    $0x10,%eax
 3aa:	cd 40                	int    $0x40
 3ac:	c3                   	ret    

000003ad <close>:
SYSCALL(close)
 3ad:	b8 15 00 00 00       	mov    $0x15,%eax
 3b2:	cd 40                	int    $0x40
 3b4:	c3                   	ret    

000003b5 <kill>:
SYSCALL(kill)
 3b5:	b8 06 00 00 00       	mov    $0x6,%eax
 3ba:	cd 40                	int    $0x40
 3bc:	c3                   	ret    

000003bd <exec>:
SYSCALL(exec)
 3bd:	b8 07 00 00 00       	mov    $0x7,%eax
 3c2:	cd 40                	int    $0x40
 3c4:	c3                   	ret    

000003c5 <open>:
SYSCALL(open)
 3c5:	b8 0f 00 00 00       	mov    $0xf,%eax
 3ca:	cd 40                	int    $0x40
 3cc:	c3                   	ret    

000003cd <mknod>:
SYSCALL(mknod)
 3cd:	b8 11 00 00 00       	mov    $0x11,%eax
 3d2:	cd 40                	int    $0x40
 3d4:	c3                   	ret    

000003d5 <unlink>:
SYSCALL(unlink)
 3d5:	b8 12 00 00 00       	mov    $0x12,%eax
 3da:	cd 40                	int    $0x40
 3dc:	c3                   	ret    

000003dd <fstat>:
SYSCALL(fstat)
 3dd:	b8 08 00 00 00       	mov    $0x8,%eax
 3e2:	cd 40                	int    $0x40
 3e4:	c3                   	ret    

000003e5 <link>:
SYSCALL(link)
 3e5:	b8 13 00 00 00       	mov    $0x13,%eax
 3ea:	cd 40                	int    $0x40
 3ec:	c3                   	ret    

000003ed <mkdir>:
SYSCALL(mkdir)
 3ed:	b8 14 00 00 00       	mov    $0x14,%eax
 3f2:	cd 40                	int    $0x40
 3f4:	c3                   	ret    

000003f5 <chdir>:
SYSCALL(chdir)
 3f5:	b8 09 00 00 00       	mov    $0x9,%eax
 3fa:	cd 40                	int    $0x40
 3fc:	c3                   	ret    

000003fd <dup>:
SYSCALL(dup)
 3fd:	b8 0a 00 00 00       	mov    $0xa,%eax
 402:	cd 40                	int    $0x40
 404:	c3                   	ret    

00000405 <getpid>:
SYSCALL(getpid)
 405:	b8 0b 00 00 00       	mov    $0xb,%eax
 40a:	cd 40                	int    $0x40
 40c:	c3                   	ret    

0000040d <sbrk>:
SYSCALL(sbrk)
 40d:	b8 0c 00 00 00       	mov    $0xc,%eax
 412:	cd 40                	int    $0x40
 414:	c3                   	ret    

00000415 <sleep>:
SYSCALL(sleep)
 415:	b8 0d 00 00 00       	mov    $0xd,%eax
 41a:	cd 40                	int    $0x40
 41c:	c3                   	ret    

0000041d <uptime>:
SYSCALL(uptime)
 41d:	b8 0e 00 00 00       	mov    $0xe,%eax
 422:	cd 40                	int    $0x40
 424:	c3                   	ret    

00000425 <clone>:
SYSCALL(clone)
 425:	b8 16 00 00 00       	mov    $0x16,%eax
 42a:	cd 40                	int    $0x40
 42c:	c3                   	ret    

0000042d <texit>:
SYSCALL(texit)
 42d:	b8 17 00 00 00       	mov    $0x17,%eax
 432:	cd 40                	int    $0x40
 434:	c3                   	ret    

00000435 <tsleep>:
SYSCALL(tsleep)
 435:	b8 18 00 00 00       	mov    $0x18,%eax
 43a:	cd 40                	int    $0x40
 43c:	c3                   	ret    

0000043d <twakeup>:
SYSCALL(twakeup)
 43d:	b8 19 00 00 00       	mov    $0x19,%eax
 442:	cd 40                	int    $0x40
 444:	c3                   	ret    

00000445 <test>:
SYSCALL(test)
 445:	b8 1a 00 00 00       	mov    $0x1a,%eax
 44a:	cd 40                	int    $0x40
 44c:	c3                   	ret    

0000044d <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 44d:	55                   	push   %ebp
 44e:	89 e5                	mov    %esp,%ebp
 450:	83 ec 18             	sub    $0x18,%esp
 453:	8b 45 0c             	mov    0xc(%ebp),%eax
 456:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 459:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 460:	00 
 461:	8d 45 f4             	lea    -0xc(%ebp),%eax
 464:	89 44 24 04          	mov    %eax,0x4(%esp)
 468:	8b 45 08             	mov    0x8(%ebp),%eax
 46b:	89 04 24             	mov    %eax,(%esp)
 46e:	e8 32 ff ff ff       	call   3a5 <write>
}
 473:	c9                   	leave  
 474:	c3                   	ret    

00000475 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 475:	55                   	push   %ebp
 476:	89 e5                	mov    %esp,%ebp
 478:	56                   	push   %esi
 479:	53                   	push   %ebx
 47a:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 47d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 484:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 488:	74 17                	je     4a1 <printint+0x2c>
 48a:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 48e:	79 11                	jns    4a1 <printint+0x2c>
    neg = 1;
 490:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 497:	8b 45 0c             	mov    0xc(%ebp),%eax
 49a:	f7 d8                	neg    %eax
 49c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 49f:	eb 06                	jmp    4a7 <printint+0x32>
  } else {
    x = xx;
 4a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 4a4:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 4a7:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 4ae:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 4b1:	8d 41 01             	lea    0x1(%ecx),%eax
 4b4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 4b7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 4ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4bd:	ba 00 00 00 00       	mov    $0x0,%edx
 4c2:	f7 f3                	div    %ebx
 4c4:	89 d0                	mov    %edx,%eax
 4c6:	0f b6 80 dc 10 00 00 	movzbl 0x10dc(%eax),%eax
 4cd:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 4d1:	8b 75 10             	mov    0x10(%ebp),%esi
 4d4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 4d7:	ba 00 00 00 00       	mov    $0x0,%edx
 4dc:	f7 f6                	div    %esi
 4de:	89 45 ec             	mov    %eax,-0x14(%ebp)
 4e1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 4e5:	75 c7                	jne    4ae <printint+0x39>
  if(neg)
 4e7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4eb:	74 10                	je     4fd <printint+0x88>
    buf[i++] = '-';
 4ed:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4f0:	8d 50 01             	lea    0x1(%eax),%edx
 4f3:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4f6:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 4fb:	eb 1f                	jmp    51c <printint+0xa7>
 4fd:	eb 1d                	jmp    51c <printint+0xa7>
    putc(fd, buf[i]);
 4ff:	8d 55 dc             	lea    -0x24(%ebp),%edx
 502:	8b 45 f4             	mov    -0xc(%ebp),%eax
 505:	01 d0                	add    %edx,%eax
 507:	0f b6 00             	movzbl (%eax),%eax
 50a:	0f be c0             	movsbl %al,%eax
 50d:	89 44 24 04          	mov    %eax,0x4(%esp)
 511:	8b 45 08             	mov    0x8(%ebp),%eax
 514:	89 04 24             	mov    %eax,(%esp)
 517:	e8 31 ff ff ff       	call   44d <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 51c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 520:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 524:	79 d9                	jns    4ff <printint+0x8a>
    putc(fd, buf[i]);
}
 526:	83 c4 30             	add    $0x30,%esp
 529:	5b                   	pop    %ebx
 52a:	5e                   	pop    %esi
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
 533:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 53a:	8d 45 0c             	lea    0xc(%ebp),%eax
 53d:	83 c0 04             	add    $0x4,%eax
 540:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 543:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 54a:	e9 7c 01 00 00       	jmp    6cb <printf+0x19e>
    c = fmt[i] & 0xff;
 54f:	8b 55 0c             	mov    0xc(%ebp),%edx
 552:	8b 45 f0             	mov    -0x10(%ebp),%eax
 555:	01 d0                	add    %edx,%eax
 557:	0f b6 00             	movzbl (%eax),%eax
 55a:	0f be c0             	movsbl %al,%eax
 55d:	25 ff 00 00 00       	and    $0xff,%eax
 562:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 565:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 569:	75 2c                	jne    597 <printf+0x6a>
      if(c == '%'){
 56b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 56f:	75 0c                	jne    57d <printf+0x50>
        state = '%';
 571:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 578:	e9 4a 01 00 00       	jmp    6c7 <printf+0x19a>
      } else {
        putc(fd, c);
 57d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 580:	0f be c0             	movsbl %al,%eax
 583:	89 44 24 04          	mov    %eax,0x4(%esp)
 587:	8b 45 08             	mov    0x8(%ebp),%eax
 58a:	89 04 24             	mov    %eax,(%esp)
 58d:	e8 bb fe ff ff       	call   44d <putc>
 592:	e9 30 01 00 00       	jmp    6c7 <printf+0x19a>
      }
    } else if(state == '%'){
 597:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 59b:	0f 85 26 01 00 00    	jne    6c7 <printf+0x19a>
      if(c == 'd'){
 5a1:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 5a5:	75 2d                	jne    5d4 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 5a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5aa:	8b 00                	mov    (%eax),%eax
 5ac:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 5b3:	00 
 5b4:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 5bb:	00 
 5bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 5c0:	8b 45 08             	mov    0x8(%ebp),%eax
 5c3:	89 04 24             	mov    %eax,(%esp)
 5c6:	e8 aa fe ff ff       	call   475 <printint>
        ap++;
 5cb:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 5cf:	e9 ec 00 00 00       	jmp    6c0 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 5d4:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 5d8:	74 06                	je     5e0 <printf+0xb3>
 5da:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 5de:	75 2d                	jne    60d <printf+0xe0>
        printint(fd, *ap, 16, 0);
 5e0:	8b 45 e8             	mov    -0x18(%ebp),%eax
 5e3:	8b 00                	mov    (%eax),%eax
 5e5:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 5ec:	00 
 5ed:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 5f4:	00 
 5f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 5f9:	8b 45 08             	mov    0x8(%ebp),%eax
 5fc:	89 04 24             	mov    %eax,(%esp)
 5ff:	e8 71 fe ff ff       	call   475 <printint>
        ap++;
 604:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 608:	e9 b3 00 00 00       	jmp    6c0 <printf+0x193>
      } else if(c == 's'){
 60d:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 611:	75 45                	jne    658 <printf+0x12b>
        s = (char*)*ap;
 613:	8b 45 e8             	mov    -0x18(%ebp),%eax
 616:	8b 00                	mov    (%eax),%eax
 618:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 61b:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 61f:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 623:	75 09                	jne    62e <printf+0x101>
          s = "(null)";
 625:	c7 45 f4 ae 0c 00 00 	movl   $0xcae,-0xc(%ebp)
        while(*s != 0){
 62c:	eb 1e                	jmp    64c <printf+0x11f>
 62e:	eb 1c                	jmp    64c <printf+0x11f>
          putc(fd, *s);
 630:	8b 45 f4             	mov    -0xc(%ebp),%eax
 633:	0f b6 00             	movzbl (%eax),%eax
 636:	0f be c0             	movsbl %al,%eax
 639:	89 44 24 04          	mov    %eax,0x4(%esp)
 63d:	8b 45 08             	mov    0x8(%ebp),%eax
 640:	89 04 24             	mov    %eax,(%esp)
 643:	e8 05 fe ff ff       	call   44d <putc>
          s++;
 648:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 64c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 64f:	0f b6 00             	movzbl (%eax),%eax
 652:	84 c0                	test   %al,%al
 654:	75 da                	jne    630 <printf+0x103>
 656:	eb 68                	jmp    6c0 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 658:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 65c:	75 1d                	jne    67b <printf+0x14e>
        putc(fd, *ap);
 65e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 661:	8b 00                	mov    (%eax),%eax
 663:	0f be c0             	movsbl %al,%eax
 666:	89 44 24 04          	mov    %eax,0x4(%esp)
 66a:	8b 45 08             	mov    0x8(%ebp),%eax
 66d:	89 04 24             	mov    %eax,(%esp)
 670:	e8 d8 fd ff ff       	call   44d <putc>
        ap++;
 675:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 679:	eb 45                	jmp    6c0 <printf+0x193>
      } else if(c == '%'){
 67b:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 67f:	75 17                	jne    698 <printf+0x16b>
        putc(fd, c);
 681:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 684:	0f be c0             	movsbl %al,%eax
 687:	89 44 24 04          	mov    %eax,0x4(%esp)
 68b:	8b 45 08             	mov    0x8(%ebp),%eax
 68e:	89 04 24             	mov    %eax,(%esp)
 691:	e8 b7 fd ff ff       	call   44d <putc>
 696:	eb 28                	jmp    6c0 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 698:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 69f:	00 
 6a0:	8b 45 08             	mov    0x8(%ebp),%eax
 6a3:	89 04 24             	mov    %eax,(%esp)
 6a6:	e8 a2 fd ff ff       	call   44d <putc>
        putc(fd, c);
 6ab:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ae:	0f be c0             	movsbl %al,%eax
 6b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	89 04 24             	mov    %eax,(%esp)
 6bb:	e8 8d fd ff ff       	call   44d <putc>
      }
      state = 0;
 6c0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 6c7:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 6cb:	8b 55 0c             	mov    0xc(%ebp),%edx
 6ce:	8b 45 f0             	mov    -0x10(%ebp),%eax
 6d1:	01 d0                	add    %edx,%eax
 6d3:	0f b6 00             	movzbl (%eax),%eax
 6d6:	84 c0                	test   %al,%al
 6d8:	0f 85 71 fe ff ff    	jne    54f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 6de:	c9                   	leave  
 6df:	c3                   	ret    

000006e0 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 6e0:	55                   	push   %ebp
 6e1:	89 e5                	mov    %esp,%ebp
 6e3:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 6e6:	8b 45 08             	mov    0x8(%ebp),%eax
 6e9:	83 e8 08             	sub    $0x8,%eax
 6ec:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 6ef:	a1 08 11 00 00       	mov    0x1108,%eax
 6f4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 6f7:	eb 24                	jmp    71d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 6f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 6fc:	8b 00                	mov    (%eax),%eax
 6fe:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 701:	77 12                	ja     715 <free+0x35>
 703:	8b 45 f8             	mov    -0x8(%ebp),%eax
 706:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 709:	77 24                	ja     72f <free+0x4f>
 70b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 70e:	8b 00                	mov    (%eax),%eax
 710:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 713:	77 1a                	ja     72f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 715:	8b 45 fc             	mov    -0x4(%ebp),%eax
 718:	8b 00                	mov    (%eax),%eax
 71a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 71d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 720:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 723:	76 d4                	jbe    6f9 <free+0x19>
 725:	8b 45 fc             	mov    -0x4(%ebp),%eax
 728:	8b 00                	mov    (%eax),%eax
 72a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 72d:	76 ca                	jbe    6f9 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 72f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 732:	8b 40 04             	mov    0x4(%eax),%eax
 735:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 73c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 73f:	01 c2                	add    %eax,%edx
 741:	8b 45 fc             	mov    -0x4(%ebp),%eax
 744:	8b 00                	mov    (%eax),%eax
 746:	39 c2                	cmp    %eax,%edx
 748:	75 24                	jne    76e <free+0x8e>
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
 76c:	eb 0a                	jmp    778 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 76e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 771:	8b 10                	mov    (%eax),%edx
 773:	8b 45 f8             	mov    -0x8(%ebp),%eax
 776:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 778:	8b 45 fc             	mov    -0x4(%ebp),%eax
 77b:	8b 40 04             	mov    0x4(%eax),%eax
 77e:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 785:	8b 45 fc             	mov    -0x4(%ebp),%eax
 788:	01 d0                	add    %edx,%eax
 78a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 78d:	75 20                	jne    7af <free+0xcf>
    p->s.size += bp->s.size;
 78f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 792:	8b 50 04             	mov    0x4(%eax),%edx
 795:	8b 45 f8             	mov    -0x8(%ebp),%eax
 798:	8b 40 04             	mov    0x4(%eax),%eax
 79b:	01 c2                	add    %eax,%edx
 79d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7a0:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 7a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a6:	8b 10                	mov    (%eax),%edx
 7a8:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ab:	89 10                	mov    %edx,(%eax)
 7ad:	eb 08                	jmp    7b7 <free+0xd7>
  } else
    p->s.ptr = bp;
 7af:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b2:	8b 55 f8             	mov    -0x8(%ebp),%edx
 7b5:	89 10                	mov    %edx,(%eax)
  freep = p;
 7b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ba:	a3 08 11 00 00       	mov    %eax,0x1108
}
 7bf:	c9                   	leave  
 7c0:	c3                   	ret    

000007c1 <morecore>:

static Header*
morecore(uint nu)
{
 7c1:	55                   	push   %ebp
 7c2:	89 e5                	mov    %esp,%ebp
 7c4:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 7c7:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 7ce:	77 07                	ja     7d7 <morecore+0x16>
    nu = 4096;
 7d0:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 7d7:	8b 45 08             	mov    0x8(%ebp),%eax
 7da:	c1 e0 03             	shl    $0x3,%eax
 7dd:	89 04 24             	mov    %eax,(%esp)
 7e0:	e8 28 fc ff ff       	call   40d <sbrk>
 7e5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 7e8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 7ec:	75 07                	jne    7f5 <morecore+0x34>
    return 0;
 7ee:	b8 00 00 00 00       	mov    $0x0,%eax
 7f3:	eb 22                	jmp    817 <morecore+0x56>
  hp = (Header*)p;
 7f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 7fb:	8b 45 f0             	mov    -0x10(%ebp),%eax
 7fe:	8b 55 08             	mov    0x8(%ebp),%edx
 801:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 804:	8b 45 f0             	mov    -0x10(%ebp),%eax
 807:	83 c0 08             	add    $0x8,%eax
 80a:	89 04 24             	mov    %eax,(%esp)
 80d:	e8 ce fe ff ff       	call   6e0 <free>
  return freep;
 812:	a1 08 11 00 00       	mov    0x1108,%eax
}
 817:	c9                   	leave  
 818:	c3                   	ret    

00000819 <malloc>:

void*
malloc(uint nbytes)
{
 819:	55                   	push   %ebp
 81a:	89 e5                	mov    %esp,%ebp
 81c:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 81f:	8b 45 08             	mov    0x8(%ebp),%eax
 822:	83 c0 07             	add    $0x7,%eax
 825:	c1 e8 03             	shr    $0x3,%eax
 828:	83 c0 01             	add    $0x1,%eax
 82b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 82e:	a1 08 11 00 00       	mov    0x1108,%eax
 833:	89 45 f0             	mov    %eax,-0x10(%ebp)
 836:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 83a:	75 23                	jne    85f <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 83c:	c7 45 f0 00 11 00 00 	movl   $0x1100,-0x10(%ebp)
 843:	8b 45 f0             	mov    -0x10(%ebp),%eax
 846:	a3 08 11 00 00       	mov    %eax,0x1108
 84b:	a1 08 11 00 00       	mov    0x1108,%eax
 850:	a3 00 11 00 00       	mov    %eax,0x1100
    base.s.size = 0;
 855:	c7 05 04 11 00 00 00 	movl   $0x0,0x1104
 85c:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 85f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 862:	8b 00                	mov    (%eax),%eax
 864:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 867:	8b 45 f4             	mov    -0xc(%ebp),%eax
 86a:	8b 40 04             	mov    0x4(%eax),%eax
 86d:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 870:	72 4d                	jb     8bf <malloc+0xa6>
      if(p->s.size == nunits)
 872:	8b 45 f4             	mov    -0xc(%ebp),%eax
 875:	8b 40 04             	mov    0x4(%eax),%eax
 878:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 87b:	75 0c                	jne    889 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 87d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 880:	8b 10                	mov    (%eax),%edx
 882:	8b 45 f0             	mov    -0x10(%ebp),%eax
 885:	89 10                	mov    %edx,(%eax)
 887:	eb 26                	jmp    8af <malloc+0x96>
      else {
        p->s.size -= nunits;
 889:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88c:	8b 40 04             	mov    0x4(%eax),%eax
 88f:	2b 45 ec             	sub    -0x14(%ebp),%eax
 892:	89 c2                	mov    %eax,%edx
 894:	8b 45 f4             	mov    -0xc(%ebp),%eax
 897:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 89a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89d:	8b 40 04             	mov    0x4(%eax),%eax
 8a0:	c1 e0 03             	shl    $0x3,%eax
 8a3:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 8a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a9:	8b 55 ec             	mov    -0x14(%ebp),%edx
 8ac:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 8af:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8b2:	a3 08 11 00 00       	mov    %eax,0x1108
      return (void*)(p + 1);
 8b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ba:	83 c0 08             	add    $0x8,%eax
 8bd:	eb 38                	jmp    8f7 <malloc+0xde>
    }
    if(p == freep)
 8bf:	a1 08 11 00 00       	mov    0x1108,%eax
 8c4:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 8c7:	75 1b                	jne    8e4 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 8c9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8cc:	89 04 24             	mov    %eax,(%esp)
 8cf:	e8 ed fe ff ff       	call   7c1 <morecore>
 8d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
 8d7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 8db:	75 07                	jne    8e4 <malloc+0xcb>
        return 0;
 8dd:	b8 00 00 00 00       	mov    $0x0,%eax
 8e2:	eb 13                	jmp    8f7 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8e4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8e7:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8ea:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ed:	8b 00                	mov    (%eax),%eax
 8ef:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 8f2:	e9 70 ff ff ff       	jmp    867 <malloc+0x4e>
}
 8f7:	c9                   	leave  
 8f8:	c3                   	ret    

000008f9 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 8f9:	55                   	push   %ebp
 8fa:	89 e5                	mov    %esp,%ebp
 8fc:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 8ff:	8b 55 08             	mov    0x8(%ebp),%edx
 902:	8b 45 0c             	mov    0xc(%ebp),%eax
 905:	8b 4d 08             	mov    0x8(%ebp),%ecx
 908:	f0 87 02             	lock xchg %eax,(%edx)
 90b:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 90e:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 911:	c9                   	leave  
 912:	c3                   	ret    

00000913 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 913:	55                   	push   %ebp
 914:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 916:	8b 45 08             	mov    0x8(%ebp),%eax
 919:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 91f:	5d                   	pop    %ebp
 920:	c3                   	ret    

00000921 <lock_acquire>:
void lock_acquire(lock_t *lock){
 921:	55                   	push   %ebp
 922:	89 e5                	mov    %esp,%ebp
 924:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 927:	90                   	nop
 928:	8b 45 08             	mov    0x8(%ebp),%eax
 92b:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 932:	00 
 933:	89 04 24             	mov    %eax,(%esp)
 936:	e8 be ff ff ff       	call   8f9 <xchg>
 93b:	85 c0                	test   %eax,%eax
 93d:	75 e9                	jne    928 <lock_acquire+0x7>
}
 93f:	c9                   	leave  
 940:	c3                   	ret    

00000941 <lock_release>:
void lock_release(lock_t *lock){
 941:	55                   	push   %ebp
 942:	89 e5                	mov    %esp,%ebp
 944:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 947:	8b 45 08             	mov    0x8(%ebp),%eax
 94a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 951:	00 
 952:	89 04 24             	mov    %eax,(%esp)
 955:	e8 9f ff ff ff       	call   8f9 <xchg>
}
 95a:	c9                   	leave  
 95b:	c3                   	ret    

0000095c <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 95c:	55                   	push   %ebp
 95d:	89 e5                	mov    %esp,%ebp
 95f:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 962:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 969:	e8 ab fe ff ff       	call   819 <malloc>
 96e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 971:	8b 45 f4             	mov    -0xc(%ebp),%eax
 974:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 977:	8b 45 f4             	mov    -0xc(%ebp),%eax
 97a:	25 ff 0f 00 00       	and    $0xfff,%eax
 97f:	85 c0                	test   %eax,%eax
 981:	74 14                	je     997 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 983:	8b 45 f4             	mov    -0xc(%ebp),%eax
 986:	25 ff 0f 00 00       	and    $0xfff,%eax
 98b:	89 c2                	mov    %eax,%edx
 98d:	b8 00 10 00 00       	mov    $0x1000,%eax
 992:	29 d0                	sub    %edx,%eax
 994:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 997:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 99b:	75 1b                	jne    9b8 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 99d:	c7 44 24 04 b5 0c 00 	movl   $0xcb5,0x4(%esp)
 9a4:	00 
 9a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9ac:	e8 7c fb ff ff       	call   52d <printf>
        return 0;
 9b1:	b8 00 00 00 00       	mov    $0x0,%eax
 9b6:	eb 6f                	jmp    a27 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 9b8:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 9bb:	8b 55 08             	mov    0x8(%ebp),%edx
 9be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9c1:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 9c5:	89 54 24 08          	mov    %edx,0x8(%esp)
 9c9:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 9d0:	00 
 9d1:	89 04 24             	mov    %eax,(%esp)
 9d4:	e8 4c fa ff ff       	call   425 <clone>
 9d9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 9dc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 9e0:	79 1b                	jns    9fd <thread_create+0xa1>
        printf(1,"clone fails\n");
 9e2:	c7 44 24 04 c3 0c 00 	movl   $0xcc3,0x4(%esp)
 9e9:	00 
 9ea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 9f1:	e8 37 fb ff ff       	call   52d <printf>
        return 0;
 9f6:	b8 00 00 00 00       	mov    $0x0,%eax
 9fb:	eb 2a                	jmp    a27 <thread_create+0xcb>
    }
    if(tid > 0){
 9fd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a01:	7e 05                	jle    a08 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 a03:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a06:	eb 1f                	jmp    a27 <thread_create+0xcb>
    }
    if(tid == 0){
 a08:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a0c:	75 14                	jne    a22 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 a0e:	c7 44 24 04 d0 0c 00 	movl   $0xcd0,0x4(%esp)
 a15:	00 
 a16:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a1d:	e8 0b fb ff ff       	call   52d <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 a22:	b8 00 00 00 00       	mov    $0x0,%eax
}
 a27:	c9                   	leave  
 a28:	c3                   	ret    

00000a29 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 a29:	55                   	push   %ebp
 a2a:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 a2c:	8b 45 08             	mov    0x8(%ebp),%eax
 a2f:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 a35:	8b 45 08             	mov    0x8(%ebp),%eax
 a38:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 a3f:	8b 45 08             	mov    0x8(%ebp),%eax
 a42:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 a49:	5d                   	pop    %ebp
 a4a:	c3                   	ret    

00000a4b <add_q>:

void add_q(struct queue *q, int v){
 a4b:	55                   	push   %ebp
 a4c:	89 e5                	mov    %esp,%ebp
 a4e:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 a51:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 a58:	e8 bc fd ff ff       	call   819 <malloc>
 a5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 a60:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a63:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 a6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a6d:	8b 55 0c             	mov    0xc(%ebp),%edx
 a70:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 a72:	8b 45 08             	mov    0x8(%ebp),%eax
 a75:	8b 40 04             	mov    0x4(%eax),%eax
 a78:	85 c0                	test   %eax,%eax
 a7a:	75 0b                	jne    a87 <add_q+0x3c>
        q->head = n;
 a7c:	8b 45 08             	mov    0x8(%ebp),%eax
 a7f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a82:	89 50 04             	mov    %edx,0x4(%eax)
 a85:	eb 0c                	jmp    a93 <add_q+0x48>
    }else{
        q->tail->next = n;
 a87:	8b 45 08             	mov    0x8(%ebp),%eax
 a8a:	8b 40 08             	mov    0x8(%eax),%eax
 a8d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a90:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 a93:	8b 45 08             	mov    0x8(%ebp),%eax
 a96:	8b 55 f4             	mov    -0xc(%ebp),%edx
 a99:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 a9c:	8b 45 08             	mov    0x8(%ebp),%eax
 a9f:	8b 00                	mov    (%eax),%eax
 aa1:	8d 50 01             	lea    0x1(%eax),%edx
 aa4:	8b 45 08             	mov    0x8(%ebp),%eax
 aa7:	89 10                	mov    %edx,(%eax)
}
 aa9:	c9                   	leave  
 aaa:	c3                   	ret    

00000aab <empty_q>:

int empty_q(struct queue *q){
 aab:	55                   	push   %ebp
 aac:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 aae:	8b 45 08             	mov    0x8(%ebp),%eax
 ab1:	8b 00                	mov    (%eax),%eax
 ab3:	85 c0                	test   %eax,%eax
 ab5:	75 07                	jne    abe <empty_q+0x13>
        return 1;
 ab7:	b8 01 00 00 00       	mov    $0x1,%eax
 abc:	eb 05                	jmp    ac3 <empty_q+0x18>
    else
        return 0;
 abe:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 ac3:	5d                   	pop    %ebp
 ac4:	c3                   	ret    

00000ac5 <pop_q>:
int pop_q(struct queue *q){
 ac5:	55                   	push   %ebp
 ac6:	89 e5                	mov    %esp,%ebp
 ac8:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 acb:	8b 45 08             	mov    0x8(%ebp),%eax
 ace:	89 04 24             	mov    %eax,(%esp)
 ad1:	e8 d5 ff ff ff       	call   aab <empty_q>
 ad6:	85 c0                	test   %eax,%eax
 ad8:	75 5d                	jne    b37 <pop_q+0x72>
       val = q->head->value; 
 ada:	8b 45 08             	mov    0x8(%ebp),%eax
 add:	8b 40 04             	mov    0x4(%eax),%eax
 ae0:	8b 00                	mov    (%eax),%eax
 ae2:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 ae5:	8b 45 08             	mov    0x8(%ebp),%eax
 ae8:	8b 40 04             	mov    0x4(%eax),%eax
 aeb:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 aee:	8b 45 08             	mov    0x8(%ebp),%eax
 af1:	8b 40 04             	mov    0x4(%eax),%eax
 af4:	8b 50 04             	mov    0x4(%eax),%edx
 af7:	8b 45 08             	mov    0x8(%ebp),%eax
 afa:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 afd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b00:	89 04 24             	mov    %eax,(%esp)
 b03:	e8 d8 fb ff ff       	call   6e0 <free>
       q->size--;
 b08:	8b 45 08             	mov    0x8(%ebp),%eax
 b0b:	8b 00                	mov    (%eax),%eax
 b0d:	8d 50 ff             	lea    -0x1(%eax),%edx
 b10:	8b 45 08             	mov    0x8(%ebp),%eax
 b13:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 b15:	8b 45 08             	mov    0x8(%ebp),%eax
 b18:	8b 00                	mov    (%eax),%eax
 b1a:	85 c0                	test   %eax,%eax
 b1c:	75 14                	jne    b32 <pop_q+0x6d>
            q->head = 0;
 b1e:	8b 45 08             	mov    0x8(%ebp),%eax
 b21:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 b28:	8b 45 08             	mov    0x8(%ebp),%eax
 b2b:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 b32:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b35:	eb 05                	jmp    b3c <pop_q+0x77>
    }
    return -1;
 b37:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 b3c:	c9                   	leave  
 b3d:	c3                   	ret    

00000b3e <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 b3e:	55                   	push   %ebp
 b3f:	89 e5                	mov    %esp,%ebp
 b41:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 b44:	8b 45 08             	mov    0x8(%ebp),%eax
 b47:	8b 55 0c             	mov    0xc(%ebp),%edx
 b4a:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 b4d:	8b 45 08             	mov    0x8(%ebp),%eax
 b50:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 b57:	8b 45 08             	mov    0x8(%ebp),%eax
 b5a:	89 04 24             	mov    %eax,(%esp)
 b5d:	e8 b1 fd ff ff       	call   913 <lock_init>
}
 b62:	c9                   	leave  
 b63:	c3                   	ret    

00000b64 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 b64:	55                   	push   %ebp
 b65:	89 e5                	mov    %esp,%ebp
 b67:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 b6a:	8b 45 08             	mov    0x8(%ebp),%eax
 b6d:	89 04 24             	mov    %eax,(%esp)
 b70:	e8 ac fd ff ff       	call   921 <lock_acquire>
	if(s->count  == 0){
 b75:	8b 45 08             	mov    0x8(%ebp),%eax
 b78:	8b 40 04             	mov    0x4(%eax),%eax
 b7b:	85 c0                	test   %eax,%eax
 b7d:	75 43                	jne    bc2 <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 b7f:	c7 44 24 04 e1 0c 00 	movl   $0xce1,0x4(%esp)
 b86:	00 
 b87:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 b8e:	e8 9a f9 ff ff       	call   52d <printf>
		//add proc to waiters list
		int tid = getpid();
 b93:	e8 6d f8 ff ff       	call   405 <getpid>
 b98:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 b9b:	8b 45 08             	mov    0x8(%ebp),%eax
 b9e:	8d 50 0c             	lea    0xc(%eax),%edx
 ba1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ba4:	89 44 24 04          	mov    %eax,0x4(%esp)
 ba8:	89 14 24             	mov    %edx,(%esp)
 bab:	e8 9b fe ff ff       	call   a4b <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 bb0:	8b 45 08             	mov    0x8(%ebp),%eax
 bb3:	89 04 24             	mov    %eax,(%esp)
 bb6:	e8 86 fd ff ff       	call   941 <lock_release>
		tsleep(); 
 bbb:	e8 75 f8 ff ff       	call   435 <tsleep>
 bc0:	eb 2e                	jmp    bf0 <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 bc2:	c7 44 24 04 e8 0c 00 	movl   $0xce8,0x4(%esp)
 bc9:	00 
 bca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bd1:	e8 57 f9 ff ff       	call   52d <printf>
		s->count--;	
 bd6:	8b 45 08             	mov    0x8(%ebp),%eax
 bd9:	8b 40 04             	mov    0x4(%eax),%eax
 bdc:	8d 50 ff             	lea    -0x1(%eax),%edx
 bdf:	8b 45 08             	mov    0x8(%ebp),%eax
 be2:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 be5:	8b 45 08             	mov    0x8(%ebp),%eax
 be8:	89 04 24             	mov    %eax,(%esp)
 beb:	e8 51 fd ff ff       	call   941 <lock_release>
	}
}
 bf0:	c9                   	leave  
 bf1:	c3                   	ret    

00000bf2 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 bf2:	55                   	push   %ebp
 bf3:	89 e5                	mov    %esp,%ebp
 bf5:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 bf8:	c7 44 24 04 ef 0c 00 	movl   $0xcef,0x4(%esp)
 bff:	00 
 c00:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c07:	e8 21 f9 ff ff       	call   52d <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 c0c:	8b 45 08             	mov    0x8(%ebp),%eax
 c0f:	89 04 24             	mov    %eax,(%esp)
 c12:	e8 0a fd ff ff       	call   921 <lock_acquire>
	if(s->count < s->size){
 c17:	8b 45 08             	mov    0x8(%ebp),%eax
 c1a:	8b 50 04             	mov    0x4(%eax),%edx
 c1d:	8b 45 08             	mov    0x8(%ebp),%eax
 c20:	8b 40 08             	mov    0x8(%eax),%eax
 c23:	39 c2                	cmp    %eax,%edx
 c25:	7d 0f                	jge    c36 <sem_signal+0x44>
		s->count++;	
 c27:	8b 45 08             	mov    0x8(%ebp),%eax
 c2a:	8b 40 04             	mov    0x4(%eax),%eax
 c2d:	8d 50 01             	lea    0x1(%eax),%edx
 c30:	8b 45 08             	mov    0x8(%ebp),%eax
 c33:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 c36:	8b 45 08             	mov    0x8(%ebp),%eax
 c39:	83 c0 0c             	add    $0xc,%eax
 c3c:	89 04 24             	mov    %eax,(%esp)
 c3f:	e8 81 fe ff ff       	call   ac5 <pop_q>
 c44:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 c47:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 c4b:	74 2e                	je     c7b <sem_signal+0x89>
		printf(1, "Sem A\n");
 c4d:	c7 44 24 04 e8 0c 00 	movl   $0xce8,0x4(%esp)
 c54:	00 
 c55:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c5c:	e8 cc f8 ff ff       	call   52d <printf>
		twakeup(tid);
 c61:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c64:	89 04 24             	mov    %eax,(%esp)
 c67:	e8 d1 f7 ff ff       	call   43d <twakeup>
		s->count--;
 c6c:	8b 45 08             	mov    0x8(%ebp),%eax
 c6f:	8b 40 04             	mov    0x4(%eax),%eax
 c72:	8d 50 ff             	lea    -0x1(%eax),%edx
 c75:	8b 45 08             	mov    0x8(%ebp),%eax
 c78:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 c7b:	8b 45 08             	mov    0x8(%ebp),%eax
 c7e:	89 04 24             	mov    %eax,(%esp)
 c81:	e8 bb fc ff ff       	call   941 <lock_release>

 c86:	c9                   	leave  
 c87:	c3                   	ret    
