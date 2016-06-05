
_wc:     file format elf32-i386


Disassembly of section .text:

00000000 <wc>:

char buf[512];

void
wc(int fd, char *name)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 48             	sub    $0x48,%esp
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
   6:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
   d:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 f0             	mov    %eax,-0x10(%ebp)
  inword = 0;
  19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 68                	jmp    8a <wc+0x8a>
    for(i=0; i<n; i++){
  22:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  29:	eb 57                	jmp    82 <wc+0x82>
      c++;
  2b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  32:	05 e0 11 00 00       	add    $0x11e0,%eax
  37:	0f b6 00             	movzbl (%eax),%eax
  3a:	3c 0a                	cmp    $0xa,%al
  3c:	75 04                	jne    42 <wc+0x42>
        l++;
  3e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  42:	8b 45 f4             	mov    -0xc(%ebp),%eax
  45:	05 e0 11 00 00       	add    $0x11e0,%eax
  4a:	0f b6 00             	movzbl (%eax),%eax
  4d:	0f be c0             	movsbl %al,%eax
  50:	89 44 24 04          	mov    %eax,0x4(%esp)
  54:	c7 04 24 44 0d 00 00 	movl   $0xd44,(%esp)
  5b:	e8 58 02 00 00       	call   2b8 <strchr>
  60:	85 c0                	test   %eax,%eax
  62:	74 09                	je     6d <wc+0x6d>
        inword = 0;
  64:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  6b:	eb 11                	jmp    7e <wc+0x7e>
      else if(!inword){
  6d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  71:	75 0b                	jne    7e <wc+0x7e>
        w++;
  73:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  77:	c7 45 e4 01 00 00 00 	movl   $0x1,-0x1c(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  85:	3b 45 e0             	cmp    -0x20(%ebp),%eax
  88:	7c a1                	jl     2b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  8a:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  91:	00 
  92:	c7 44 24 04 e0 11 00 	movl   $0x11e0,0x4(%esp)
  99:	00 
  9a:	8b 45 08             	mov    0x8(%ebp),%eax
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 b4 03 00 00       	call   459 <read>
  a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  a8:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  ac:	0f 8f 70 ff ff ff    	jg     22 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  b2:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
  b6:	79 19                	jns    d1 <wc+0xd1>
    printf(1, "wc: read error\n");
  b8:	c7 44 24 04 4a 0d 00 	movl   $0xd4a,0x4(%esp)
  bf:	00 
  c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c7:	e8 1d 05 00 00       	call   5e9 <printf>
    exit();
  cc:	e8 70 03 00 00       	call   441 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  d1:	8b 45 0c             	mov    0xc(%ebp),%eax
  d4:	89 44 24 14          	mov    %eax,0x14(%esp)
  d8:	8b 45 e8             	mov    -0x18(%ebp),%eax
  db:	89 44 24 10          	mov    %eax,0x10(%esp)
  df:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e2:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  e9:	89 44 24 08          	mov    %eax,0x8(%esp)
  ed:	c7 44 24 04 5a 0d 00 	movl   $0xd5a,0x4(%esp)
  f4:	00 
  f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fc:	e8 e8 04 00 00       	call   5e9 <printf>
}
 101:	c9                   	leave  
 102:	c3                   	ret    

00000103 <main>:

int
main(int argc, char *argv[])
{
 103:	55                   	push   %ebp
 104:	89 e5                	mov    %esp,%ebp
 106:	83 e4 f0             	and    $0xfffffff0,%esp
 109:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 10c:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 110:	7f 19                	jg     12b <main+0x28>
    wc(0, "");
 112:	c7 44 24 04 67 0d 00 	movl   $0xd67,0x4(%esp)
 119:	00 
 11a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 121:	e8 da fe ff ff       	call   0 <wc>
    exit();
 126:	e8 16 03 00 00       	call   441 <exit>
  }

  for(i = 1; i < argc; i++){
 12b:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 132:	00 
 133:	e9 8f 00 00 00       	jmp    1c7 <main+0xc4>
    if((fd = open(argv[i], 0)) < 0){
 138:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 13c:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 143:	8b 45 0c             	mov    0xc(%ebp),%eax
 146:	01 d0                	add    %edx,%eax
 148:	8b 00                	mov    (%eax),%eax
 14a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 151:	00 
 152:	89 04 24             	mov    %eax,(%esp)
 155:	e8 27 03 00 00       	call   481 <open>
 15a:	89 44 24 18          	mov    %eax,0x18(%esp)
 15e:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 163:	79 2f                	jns    194 <main+0x91>
      printf(1, "wc: cannot open %s\n", argv[i]);
 165:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 169:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 170:	8b 45 0c             	mov    0xc(%ebp),%eax
 173:	01 d0                	add    %edx,%eax
 175:	8b 00                	mov    (%eax),%eax
 177:	89 44 24 08          	mov    %eax,0x8(%esp)
 17b:	c7 44 24 04 68 0d 00 	movl   $0xd68,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 5a 04 00 00       	call   5e9 <printf>
      exit();
 18f:	e8 ad 02 00 00       	call   441 <exit>
    }
    wc(fd, argv[i]);
 194:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 198:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 19f:	8b 45 0c             	mov    0xc(%ebp),%eax
 1a2:	01 d0                	add    %edx,%eax
 1a4:	8b 00                	mov    (%eax),%eax
 1a6:	89 44 24 04          	mov    %eax,0x4(%esp)
 1aa:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ae:	89 04 24             	mov    %eax,(%esp)
 1b1:	e8 4a fe ff ff       	call   0 <wc>
    close(fd);
 1b6:	8b 44 24 18          	mov    0x18(%esp),%eax
 1ba:	89 04 24             	mov    %eax,(%esp)
 1bd:	e8 a7 02 00 00       	call   469 <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 1c2:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1c7:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1cb:	3b 45 08             	cmp    0x8(%ebp),%eax
 1ce:	0f 8c 64 ff ff ff    	jl     138 <main+0x35>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
 1d4:	e8 68 02 00 00       	call   441 <exit>

000001d9 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1d9:	55                   	push   %ebp
 1da:	89 e5                	mov    %esp,%ebp
 1dc:	57                   	push   %edi
 1dd:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1de:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1e1:	8b 55 10             	mov    0x10(%ebp),%edx
 1e4:	8b 45 0c             	mov    0xc(%ebp),%eax
 1e7:	89 cb                	mov    %ecx,%ebx
 1e9:	89 df                	mov    %ebx,%edi
 1eb:	89 d1                	mov    %edx,%ecx
 1ed:	fc                   	cld    
 1ee:	f3 aa                	rep stos %al,%es:(%edi)
 1f0:	89 ca                	mov    %ecx,%edx
 1f2:	89 fb                	mov    %edi,%ebx
 1f4:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1f7:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1fa:	5b                   	pop    %ebx
 1fb:	5f                   	pop    %edi
 1fc:	5d                   	pop    %ebp
 1fd:	c3                   	ret    

000001fe <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1fe:	55                   	push   %ebp
 1ff:	89 e5                	mov    %esp,%ebp
 201:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 204:	8b 45 08             	mov    0x8(%ebp),%eax
 207:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 20a:	90                   	nop
 20b:	8b 45 08             	mov    0x8(%ebp),%eax
 20e:	8d 50 01             	lea    0x1(%eax),%edx
 211:	89 55 08             	mov    %edx,0x8(%ebp)
 214:	8b 55 0c             	mov    0xc(%ebp),%edx
 217:	8d 4a 01             	lea    0x1(%edx),%ecx
 21a:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 21d:	0f b6 12             	movzbl (%edx),%edx
 220:	88 10                	mov    %dl,(%eax)
 222:	0f b6 00             	movzbl (%eax),%eax
 225:	84 c0                	test   %al,%al
 227:	75 e2                	jne    20b <strcpy+0xd>
    ;
  return os;
 229:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 22c:	c9                   	leave  
 22d:	c3                   	ret    

0000022e <strcmp>:

int
strcmp(const char *p, const char *q)
{
 22e:	55                   	push   %ebp
 22f:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 231:	eb 08                	jmp    23b <strcmp+0xd>
    p++, q++;
 233:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 237:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 23b:	8b 45 08             	mov    0x8(%ebp),%eax
 23e:	0f b6 00             	movzbl (%eax),%eax
 241:	84 c0                	test   %al,%al
 243:	74 10                	je     255 <strcmp+0x27>
 245:	8b 45 08             	mov    0x8(%ebp),%eax
 248:	0f b6 10             	movzbl (%eax),%edx
 24b:	8b 45 0c             	mov    0xc(%ebp),%eax
 24e:	0f b6 00             	movzbl (%eax),%eax
 251:	38 c2                	cmp    %al,%dl
 253:	74 de                	je     233 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 255:	8b 45 08             	mov    0x8(%ebp),%eax
 258:	0f b6 00             	movzbl (%eax),%eax
 25b:	0f b6 d0             	movzbl %al,%edx
 25e:	8b 45 0c             	mov    0xc(%ebp),%eax
 261:	0f b6 00             	movzbl (%eax),%eax
 264:	0f b6 c0             	movzbl %al,%eax
 267:	29 c2                	sub    %eax,%edx
 269:	89 d0                	mov    %edx,%eax
}
 26b:	5d                   	pop    %ebp
 26c:	c3                   	ret    

0000026d <strlen>:

uint
strlen(char *s)
{
 26d:	55                   	push   %ebp
 26e:	89 e5                	mov    %esp,%ebp
 270:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 273:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 27a:	eb 04                	jmp    280 <strlen+0x13>
 27c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 280:	8b 55 fc             	mov    -0x4(%ebp),%edx
 283:	8b 45 08             	mov    0x8(%ebp),%eax
 286:	01 d0                	add    %edx,%eax
 288:	0f b6 00             	movzbl (%eax),%eax
 28b:	84 c0                	test   %al,%al
 28d:	75 ed                	jne    27c <strlen+0xf>
    ;
  return n;
 28f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 292:	c9                   	leave  
 293:	c3                   	ret    

00000294 <memset>:

void*
memset(void *dst, int c, uint n)
{
 294:	55                   	push   %ebp
 295:	89 e5                	mov    %esp,%ebp
 297:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 29a:	8b 45 10             	mov    0x10(%ebp),%eax
 29d:	89 44 24 08          	mov    %eax,0x8(%esp)
 2a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 2a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2a8:	8b 45 08             	mov    0x8(%ebp),%eax
 2ab:	89 04 24             	mov    %eax,(%esp)
 2ae:	e8 26 ff ff ff       	call   1d9 <stosb>
  return dst;
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2b6:	c9                   	leave  
 2b7:	c3                   	ret    

000002b8 <strchr>:

char*
strchr(const char *s, char c)
{
 2b8:	55                   	push   %ebp
 2b9:	89 e5                	mov    %esp,%ebp
 2bb:	83 ec 04             	sub    $0x4,%esp
 2be:	8b 45 0c             	mov    0xc(%ebp),%eax
 2c1:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2c4:	eb 14                	jmp    2da <strchr+0x22>
    if(*s == c)
 2c6:	8b 45 08             	mov    0x8(%ebp),%eax
 2c9:	0f b6 00             	movzbl (%eax),%eax
 2cc:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2cf:	75 05                	jne    2d6 <strchr+0x1e>
      return (char*)s;
 2d1:	8b 45 08             	mov    0x8(%ebp),%eax
 2d4:	eb 13                	jmp    2e9 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2d6:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2da:	8b 45 08             	mov    0x8(%ebp),%eax
 2dd:	0f b6 00             	movzbl (%eax),%eax
 2e0:	84 c0                	test   %al,%al
 2e2:	75 e2                	jne    2c6 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2e4:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2e9:	c9                   	leave  
 2ea:	c3                   	ret    

000002eb <gets>:

char*
gets(char *buf, int max)
{
 2eb:	55                   	push   %ebp
 2ec:	89 e5                	mov    %esp,%ebp
 2ee:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2f1:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 2f8:	eb 4c                	jmp    346 <gets+0x5b>
    cc = read(0, &c, 1);
 2fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 301:	00 
 302:	8d 45 ef             	lea    -0x11(%ebp),%eax
 305:	89 44 24 04          	mov    %eax,0x4(%esp)
 309:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 310:	e8 44 01 00 00       	call   459 <read>
 315:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 318:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 31c:	7f 02                	jg     320 <gets+0x35>
      break;
 31e:	eb 31                	jmp    351 <gets+0x66>
    buf[i++] = c;
 320:	8b 45 f4             	mov    -0xc(%ebp),%eax
 323:	8d 50 01             	lea    0x1(%eax),%edx
 326:	89 55 f4             	mov    %edx,-0xc(%ebp)
 329:	89 c2                	mov    %eax,%edx
 32b:	8b 45 08             	mov    0x8(%ebp),%eax
 32e:	01 c2                	add    %eax,%edx
 330:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 334:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 336:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 33a:	3c 0a                	cmp    $0xa,%al
 33c:	74 13                	je     351 <gets+0x66>
 33e:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 342:	3c 0d                	cmp    $0xd,%al
 344:	74 0b                	je     351 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 346:	8b 45 f4             	mov    -0xc(%ebp),%eax
 349:	83 c0 01             	add    $0x1,%eax
 34c:	3b 45 0c             	cmp    0xc(%ebp),%eax
 34f:	7c a9                	jl     2fa <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 351:	8b 55 f4             	mov    -0xc(%ebp),%edx
 354:	8b 45 08             	mov    0x8(%ebp),%eax
 357:	01 d0                	add    %edx,%eax
 359:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 35c:	8b 45 08             	mov    0x8(%ebp),%eax
}
 35f:	c9                   	leave  
 360:	c3                   	ret    

00000361 <stat>:

int
stat(char *n, struct stat *st)
{
 361:	55                   	push   %ebp
 362:	89 e5                	mov    %esp,%ebp
 364:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 367:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 36e:	00 
 36f:	8b 45 08             	mov    0x8(%ebp),%eax
 372:	89 04 24             	mov    %eax,(%esp)
 375:	e8 07 01 00 00       	call   481 <open>
 37a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 37d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 381:	79 07                	jns    38a <stat+0x29>
    return -1;
 383:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 388:	eb 23                	jmp    3ad <stat+0x4c>
  r = fstat(fd, st);
 38a:	8b 45 0c             	mov    0xc(%ebp),%eax
 38d:	89 44 24 04          	mov    %eax,0x4(%esp)
 391:	8b 45 f4             	mov    -0xc(%ebp),%eax
 394:	89 04 24             	mov    %eax,(%esp)
 397:	e8 fd 00 00 00       	call   499 <fstat>
 39c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 39f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 3a2:	89 04 24             	mov    %eax,(%esp)
 3a5:	e8 bf 00 00 00       	call   469 <close>
  return r;
 3aa:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 3ad:	c9                   	leave  
 3ae:	c3                   	ret    

000003af <atoi>:

int
atoi(const char *s)
{
 3af:	55                   	push   %ebp
 3b0:	89 e5                	mov    %esp,%ebp
 3b2:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3b5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3bc:	eb 25                	jmp    3e3 <atoi+0x34>
    n = n*10 + *s++ - '0';
 3be:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3c1:	89 d0                	mov    %edx,%eax
 3c3:	c1 e0 02             	shl    $0x2,%eax
 3c6:	01 d0                	add    %edx,%eax
 3c8:	01 c0                	add    %eax,%eax
 3ca:	89 c1                	mov    %eax,%ecx
 3cc:	8b 45 08             	mov    0x8(%ebp),%eax
 3cf:	8d 50 01             	lea    0x1(%eax),%edx
 3d2:	89 55 08             	mov    %edx,0x8(%ebp)
 3d5:	0f b6 00             	movzbl (%eax),%eax
 3d8:	0f be c0             	movsbl %al,%eax
 3db:	01 c8                	add    %ecx,%eax
 3dd:	83 e8 30             	sub    $0x30,%eax
 3e0:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	3c 2f                	cmp    $0x2f,%al
 3eb:	7e 0a                	jle    3f7 <atoi+0x48>
 3ed:	8b 45 08             	mov    0x8(%ebp),%eax
 3f0:	0f b6 00             	movzbl (%eax),%eax
 3f3:	3c 39                	cmp    $0x39,%al
 3f5:	7e c7                	jle    3be <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3f7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3fa:	c9                   	leave  
 3fb:	c3                   	ret    

000003fc <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3fc:	55                   	push   %ebp
 3fd:	89 e5                	mov    %esp,%ebp
 3ff:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 402:	8b 45 08             	mov    0x8(%ebp),%eax
 405:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 408:	8b 45 0c             	mov    0xc(%ebp),%eax
 40b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 40e:	eb 17                	jmp    427 <memmove+0x2b>
    *dst++ = *src++;
 410:	8b 45 fc             	mov    -0x4(%ebp),%eax
 413:	8d 50 01             	lea    0x1(%eax),%edx
 416:	89 55 fc             	mov    %edx,-0x4(%ebp)
 419:	8b 55 f8             	mov    -0x8(%ebp),%edx
 41c:	8d 4a 01             	lea    0x1(%edx),%ecx
 41f:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 422:	0f b6 12             	movzbl (%edx),%edx
 425:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 427:	8b 45 10             	mov    0x10(%ebp),%eax
 42a:	8d 50 ff             	lea    -0x1(%eax),%edx
 42d:	89 55 10             	mov    %edx,0x10(%ebp)
 430:	85 c0                	test   %eax,%eax
 432:	7f dc                	jg     410 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 434:	8b 45 08             	mov    0x8(%ebp),%eax
}
 437:	c9                   	leave  
 438:	c3                   	ret    

00000439 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 439:	b8 01 00 00 00       	mov    $0x1,%eax
 43e:	cd 40                	int    $0x40
 440:	c3                   	ret    

00000441 <exit>:
SYSCALL(exit)
 441:	b8 02 00 00 00       	mov    $0x2,%eax
 446:	cd 40                	int    $0x40
 448:	c3                   	ret    

00000449 <wait>:
SYSCALL(wait)
 449:	b8 03 00 00 00       	mov    $0x3,%eax
 44e:	cd 40                	int    $0x40
 450:	c3                   	ret    

00000451 <pipe>:
SYSCALL(pipe)
 451:	b8 04 00 00 00       	mov    $0x4,%eax
 456:	cd 40                	int    $0x40
 458:	c3                   	ret    

00000459 <read>:
SYSCALL(read)
 459:	b8 05 00 00 00       	mov    $0x5,%eax
 45e:	cd 40                	int    $0x40
 460:	c3                   	ret    

00000461 <write>:
SYSCALL(write)
 461:	b8 10 00 00 00       	mov    $0x10,%eax
 466:	cd 40                	int    $0x40
 468:	c3                   	ret    

00000469 <close>:
SYSCALL(close)
 469:	b8 15 00 00 00       	mov    $0x15,%eax
 46e:	cd 40                	int    $0x40
 470:	c3                   	ret    

00000471 <kill>:
SYSCALL(kill)
 471:	b8 06 00 00 00       	mov    $0x6,%eax
 476:	cd 40                	int    $0x40
 478:	c3                   	ret    

00000479 <exec>:
SYSCALL(exec)
 479:	b8 07 00 00 00       	mov    $0x7,%eax
 47e:	cd 40                	int    $0x40
 480:	c3                   	ret    

00000481 <open>:
SYSCALL(open)
 481:	b8 0f 00 00 00       	mov    $0xf,%eax
 486:	cd 40                	int    $0x40
 488:	c3                   	ret    

00000489 <mknod>:
SYSCALL(mknod)
 489:	b8 11 00 00 00       	mov    $0x11,%eax
 48e:	cd 40                	int    $0x40
 490:	c3                   	ret    

00000491 <unlink>:
SYSCALL(unlink)
 491:	b8 12 00 00 00       	mov    $0x12,%eax
 496:	cd 40                	int    $0x40
 498:	c3                   	ret    

00000499 <fstat>:
SYSCALL(fstat)
 499:	b8 08 00 00 00       	mov    $0x8,%eax
 49e:	cd 40                	int    $0x40
 4a0:	c3                   	ret    

000004a1 <link>:
SYSCALL(link)
 4a1:	b8 13 00 00 00       	mov    $0x13,%eax
 4a6:	cd 40                	int    $0x40
 4a8:	c3                   	ret    

000004a9 <mkdir>:
SYSCALL(mkdir)
 4a9:	b8 14 00 00 00       	mov    $0x14,%eax
 4ae:	cd 40                	int    $0x40
 4b0:	c3                   	ret    

000004b1 <chdir>:
SYSCALL(chdir)
 4b1:	b8 09 00 00 00       	mov    $0x9,%eax
 4b6:	cd 40                	int    $0x40
 4b8:	c3                   	ret    

000004b9 <dup>:
SYSCALL(dup)
 4b9:	b8 0a 00 00 00       	mov    $0xa,%eax
 4be:	cd 40                	int    $0x40
 4c0:	c3                   	ret    

000004c1 <getpid>:
SYSCALL(getpid)
 4c1:	b8 0b 00 00 00       	mov    $0xb,%eax
 4c6:	cd 40                	int    $0x40
 4c8:	c3                   	ret    

000004c9 <sbrk>:
SYSCALL(sbrk)
 4c9:	b8 0c 00 00 00       	mov    $0xc,%eax
 4ce:	cd 40                	int    $0x40
 4d0:	c3                   	ret    

000004d1 <sleep>:
SYSCALL(sleep)
 4d1:	b8 0d 00 00 00       	mov    $0xd,%eax
 4d6:	cd 40                	int    $0x40
 4d8:	c3                   	ret    

000004d9 <uptime>:
SYSCALL(uptime)
 4d9:	b8 0e 00 00 00       	mov    $0xe,%eax
 4de:	cd 40                	int    $0x40
 4e0:	c3                   	ret    

000004e1 <clone>:
SYSCALL(clone)
 4e1:	b8 16 00 00 00       	mov    $0x16,%eax
 4e6:	cd 40                	int    $0x40
 4e8:	c3                   	ret    

000004e9 <texit>:
SYSCALL(texit)
 4e9:	b8 17 00 00 00       	mov    $0x17,%eax
 4ee:	cd 40                	int    $0x40
 4f0:	c3                   	ret    

000004f1 <tsleep>:
SYSCALL(tsleep)
 4f1:	b8 18 00 00 00       	mov    $0x18,%eax
 4f6:	cd 40                	int    $0x40
 4f8:	c3                   	ret    

000004f9 <twakeup>:
SYSCALL(twakeup)
 4f9:	b8 19 00 00 00       	mov    $0x19,%eax
 4fe:	cd 40                	int    $0x40
 500:	c3                   	ret    

00000501 <test>:
SYSCALL(test)
 501:	b8 1a 00 00 00       	mov    $0x1a,%eax
 506:	cd 40                	int    $0x40
 508:	c3                   	ret    

00000509 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 509:	55                   	push   %ebp
 50a:	89 e5                	mov    %esp,%ebp
 50c:	83 ec 18             	sub    $0x18,%esp
 50f:	8b 45 0c             	mov    0xc(%ebp),%eax
 512:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 515:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 51c:	00 
 51d:	8d 45 f4             	lea    -0xc(%ebp),%eax
 520:	89 44 24 04          	mov    %eax,0x4(%esp)
 524:	8b 45 08             	mov    0x8(%ebp),%eax
 527:	89 04 24             	mov    %eax,(%esp)
 52a:	e8 32 ff ff ff       	call   461 <write>
}
 52f:	c9                   	leave  
 530:	c3                   	ret    

00000531 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 531:	55                   	push   %ebp
 532:	89 e5                	mov    %esp,%ebp
 534:	56                   	push   %esi
 535:	53                   	push   %ebx
 536:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 539:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 540:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 544:	74 17                	je     55d <printint+0x2c>
 546:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 54a:	79 11                	jns    55d <printint+0x2c>
    neg = 1;
 54c:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 553:	8b 45 0c             	mov    0xc(%ebp),%eax
 556:	f7 d8                	neg    %eax
 558:	89 45 ec             	mov    %eax,-0x14(%ebp)
 55b:	eb 06                	jmp    563 <printint+0x32>
  } else {
    x = xx;
 55d:	8b 45 0c             	mov    0xc(%ebp),%eax
 560:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 563:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 56a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 56d:	8d 41 01             	lea    0x1(%ecx),%eax
 570:	89 45 f4             	mov    %eax,-0xc(%ebp)
 573:	8b 5d 10             	mov    0x10(%ebp),%ebx
 576:	8b 45 ec             	mov    -0x14(%ebp),%eax
 579:	ba 00 00 00 00       	mov    $0x0,%edx
 57e:	f7 f3                	div    %ebx
 580:	89 d0                	mov    %edx,%eax
 582:	0f b6 80 a8 11 00 00 	movzbl 0x11a8(%eax),%eax
 589:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 58d:	8b 75 10             	mov    0x10(%ebp),%esi
 590:	8b 45 ec             	mov    -0x14(%ebp),%eax
 593:	ba 00 00 00 00       	mov    $0x0,%edx
 598:	f7 f6                	div    %esi
 59a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 59d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5a1:	75 c7                	jne    56a <printint+0x39>
  if(neg)
 5a3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 5a7:	74 10                	je     5b9 <printint+0x88>
    buf[i++] = '-';
 5a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5ac:	8d 50 01             	lea    0x1(%eax),%edx
 5af:	89 55 f4             	mov    %edx,-0xc(%ebp)
 5b2:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 5b7:	eb 1f                	jmp    5d8 <printint+0xa7>
 5b9:	eb 1d                	jmp    5d8 <printint+0xa7>
    putc(fd, buf[i]);
 5bb:	8d 55 dc             	lea    -0x24(%ebp),%edx
 5be:	8b 45 f4             	mov    -0xc(%ebp),%eax
 5c1:	01 d0                	add    %edx,%eax
 5c3:	0f b6 00             	movzbl (%eax),%eax
 5c6:	0f be c0             	movsbl %al,%eax
 5c9:	89 44 24 04          	mov    %eax,0x4(%esp)
 5cd:	8b 45 08             	mov    0x8(%ebp),%eax
 5d0:	89 04 24             	mov    %eax,(%esp)
 5d3:	e8 31 ff ff ff       	call   509 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5d8:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 5dc:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 5e0:	79 d9                	jns    5bb <printint+0x8a>
    putc(fd, buf[i]);
}
 5e2:	83 c4 30             	add    $0x30,%esp
 5e5:	5b                   	pop    %ebx
 5e6:	5e                   	pop    %esi
 5e7:	5d                   	pop    %ebp
 5e8:	c3                   	ret    

000005e9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5e9:	55                   	push   %ebp
 5ea:	89 e5                	mov    %esp,%ebp
 5ec:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5ef:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5f6:	8d 45 0c             	lea    0xc(%ebp),%eax
 5f9:	83 c0 04             	add    $0x4,%eax
 5fc:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 5ff:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 606:	e9 7c 01 00 00       	jmp    787 <printf+0x19e>
    c = fmt[i] & 0xff;
 60b:	8b 55 0c             	mov    0xc(%ebp),%edx
 60e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 611:	01 d0                	add    %edx,%eax
 613:	0f b6 00             	movzbl (%eax),%eax
 616:	0f be c0             	movsbl %al,%eax
 619:	25 ff 00 00 00       	and    $0xff,%eax
 61e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 621:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 625:	75 2c                	jne    653 <printf+0x6a>
      if(c == '%'){
 627:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 62b:	75 0c                	jne    639 <printf+0x50>
        state = '%';
 62d:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 634:	e9 4a 01 00 00       	jmp    783 <printf+0x19a>
      } else {
        putc(fd, c);
 639:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 63c:	0f be c0             	movsbl %al,%eax
 63f:	89 44 24 04          	mov    %eax,0x4(%esp)
 643:	8b 45 08             	mov    0x8(%ebp),%eax
 646:	89 04 24             	mov    %eax,(%esp)
 649:	e8 bb fe ff ff       	call   509 <putc>
 64e:	e9 30 01 00 00       	jmp    783 <printf+0x19a>
      }
    } else if(state == '%'){
 653:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 657:	0f 85 26 01 00 00    	jne    783 <printf+0x19a>
      if(c == 'd'){
 65d:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 661:	75 2d                	jne    690 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 663:	8b 45 e8             	mov    -0x18(%ebp),%eax
 666:	8b 00                	mov    (%eax),%eax
 668:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 66f:	00 
 670:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 677:	00 
 678:	89 44 24 04          	mov    %eax,0x4(%esp)
 67c:	8b 45 08             	mov    0x8(%ebp),%eax
 67f:	89 04 24             	mov    %eax,(%esp)
 682:	e8 aa fe ff ff       	call   531 <printint>
        ap++;
 687:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 68b:	e9 ec 00 00 00       	jmp    77c <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 690:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 694:	74 06                	je     69c <printf+0xb3>
 696:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 69a:	75 2d                	jne    6c9 <printf+0xe0>
        printint(fd, *ap, 16, 0);
 69c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 69f:	8b 00                	mov    (%eax),%eax
 6a1:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 6a8:	00 
 6a9:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6b0:	00 
 6b1:	89 44 24 04          	mov    %eax,0x4(%esp)
 6b5:	8b 45 08             	mov    0x8(%ebp),%eax
 6b8:	89 04 24             	mov    %eax,(%esp)
 6bb:	e8 71 fe ff ff       	call   531 <printint>
        ap++;
 6c0:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 6c4:	e9 b3 00 00 00       	jmp    77c <printf+0x193>
      } else if(c == 's'){
 6c9:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 6cd:	75 45                	jne    714 <printf+0x12b>
        s = (char*)*ap;
 6cf:	8b 45 e8             	mov    -0x18(%ebp),%eax
 6d2:	8b 00                	mov    (%eax),%eax
 6d4:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 6d7:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 6db:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6df:	75 09                	jne    6ea <printf+0x101>
          s = "(null)";
 6e1:	c7 45 f4 7c 0d 00 00 	movl   $0xd7c,-0xc(%ebp)
        while(*s != 0){
 6e8:	eb 1e                	jmp    708 <printf+0x11f>
 6ea:	eb 1c                	jmp    708 <printf+0x11f>
          putc(fd, *s);
 6ec:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ef:	0f b6 00             	movzbl (%eax),%eax
 6f2:	0f be c0             	movsbl %al,%eax
 6f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 6f9:	8b 45 08             	mov    0x8(%ebp),%eax
 6fc:	89 04 24             	mov    %eax,(%esp)
 6ff:	e8 05 fe ff ff       	call   509 <putc>
          s++;
 704:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 708:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70b:	0f b6 00             	movzbl (%eax),%eax
 70e:	84 c0                	test   %al,%al
 710:	75 da                	jne    6ec <printf+0x103>
 712:	eb 68                	jmp    77c <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 714:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 718:	75 1d                	jne    737 <printf+0x14e>
        putc(fd, *ap);
 71a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 71d:	8b 00                	mov    (%eax),%eax
 71f:	0f be c0             	movsbl %al,%eax
 722:	89 44 24 04          	mov    %eax,0x4(%esp)
 726:	8b 45 08             	mov    0x8(%ebp),%eax
 729:	89 04 24             	mov    %eax,(%esp)
 72c:	e8 d8 fd ff ff       	call   509 <putc>
        ap++;
 731:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 735:	eb 45                	jmp    77c <printf+0x193>
      } else if(c == '%'){
 737:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 73b:	75 17                	jne    754 <printf+0x16b>
        putc(fd, c);
 73d:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 740:	0f be c0             	movsbl %al,%eax
 743:	89 44 24 04          	mov    %eax,0x4(%esp)
 747:	8b 45 08             	mov    0x8(%ebp),%eax
 74a:	89 04 24             	mov    %eax,(%esp)
 74d:	e8 b7 fd ff ff       	call   509 <putc>
 752:	eb 28                	jmp    77c <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 754:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 75b:	00 
 75c:	8b 45 08             	mov    0x8(%ebp),%eax
 75f:	89 04 24             	mov    %eax,(%esp)
 762:	e8 a2 fd ff ff       	call   509 <putc>
        putc(fd, c);
 767:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 76a:	0f be c0             	movsbl %al,%eax
 76d:	89 44 24 04          	mov    %eax,0x4(%esp)
 771:	8b 45 08             	mov    0x8(%ebp),%eax
 774:	89 04 24             	mov    %eax,(%esp)
 777:	e8 8d fd ff ff       	call   509 <putc>
      }
      state = 0;
 77c:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 783:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 787:	8b 55 0c             	mov    0xc(%ebp),%edx
 78a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 78d:	01 d0                	add    %edx,%eax
 78f:	0f b6 00             	movzbl (%eax),%eax
 792:	84 c0                	test   %al,%al
 794:	0f 85 71 fe ff ff    	jne    60b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 79a:	c9                   	leave  
 79b:	c3                   	ret    

0000079c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 79c:	55                   	push   %ebp
 79d:	89 e5                	mov    %esp,%ebp
 79f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 7a2:	8b 45 08             	mov    0x8(%ebp),%eax
 7a5:	83 e8 08             	sub    $0x8,%eax
 7a8:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7ab:	a1 c8 11 00 00       	mov    0x11c8,%eax
 7b0:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7b3:	eb 24                	jmp    7d9 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b8:	8b 00                	mov    (%eax),%eax
 7ba:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7bd:	77 12                	ja     7d1 <free+0x35>
 7bf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c2:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c5:	77 24                	ja     7eb <free+0x4f>
 7c7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ca:	8b 00                	mov    (%eax),%eax
 7cc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cf:	77 1a                	ja     7eb <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d4:	8b 00                	mov    (%eax),%eax
 7d6:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7d9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7dc:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7df:	76 d4                	jbe    7b5 <free+0x19>
 7e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e4:	8b 00                	mov    (%eax),%eax
 7e6:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7e9:	76 ca                	jbe    7b5 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7eb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7ee:	8b 40 04             	mov    0x4(%eax),%eax
 7f1:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 7f8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7fb:	01 c2                	add    %eax,%edx
 7fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 800:	8b 00                	mov    (%eax),%eax
 802:	39 c2                	cmp    %eax,%edx
 804:	75 24                	jne    82a <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 806:	8b 45 f8             	mov    -0x8(%ebp),%eax
 809:	8b 50 04             	mov    0x4(%eax),%edx
 80c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80f:	8b 00                	mov    (%eax),%eax
 811:	8b 40 04             	mov    0x4(%eax),%eax
 814:	01 c2                	add    %eax,%edx
 816:	8b 45 f8             	mov    -0x8(%ebp),%eax
 819:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 81c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81f:	8b 00                	mov    (%eax),%eax
 821:	8b 10                	mov    (%eax),%edx
 823:	8b 45 f8             	mov    -0x8(%ebp),%eax
 826:	89 10                	mov    %edx,(%eax)
 828:	eb 0a                	jmp    834 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 82a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 82d:	8b 10                	mov    (%eax),%edx
 82f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 832:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 834:	8b 45 fc             	mov    -0x4(%ebp),%eax
 837:	8b 40 04             	mov    0x4(%eax),%eax
 83a:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 841:	8b 45 fc             	mov    -0x4(%ebp),%eax
 844:	01 d0                	add    %edx,%eax
 846:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 849:	75 20                	jne    86b <free+0xcf>
    p->s.size += bp->s.size;
 84b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 84e:	8b 50 04             	mov    0x4(%eax),%edx
 851:	8b 45 f8             	mov    -0x8(%ebp),%eax
 854:	8b 40 04             	mov    0x4(%eax),%eax
 857:	01 c2                	add    %eax,%edx
 859:	8b 45 fc             	mov    -0x4(%ebp),%eax
 85c:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 85f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 862:	8b 10                	mov    (%eax),%edx
 864:	8b 45 fc             	mov    -0x4(%ebp),%eax
 867:	89 10                	mov    %edx,(%eax)
 869:	eb 08                	jmp    873 <free+0xd7>
  } else
    p->s.ptr = bp;
 86b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 86e:	8b 55 f8             	mov    -0x8(%ebp),%edx
 871:	89 10                	mov    %edx,(%eax)
  freep = p;
 873:	8b 45 fc             	mov    -0x4(%ebp),%eax
 876:	a3 c8 11 00 00       	mov    %eax,0x11c8
}
 87b:	c9                   	leave  
 87c:	c3                   	ret    

0000087d <morecore>:

static Header*
morecore(uint nu)
{
 87d:	55                   	push   %ebp
 87e:	89 e5                	mov    %esp,%ebp
 880:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 883:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 88a:	77 07                	ja     893 <morecore+0x16>
    nu = 4096;
 88c:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 893:	8b 45 08             	mov    0x8(%ebp),%eax
 896:	c1 e0 03             	shl    $0x3,%eax
 899:	89 04 24             	mov    %eax,(%esp)
 89c:	e8 28 fc ff ff       	call   4c9 <sbrk>
 8a1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 8a4:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 8a8:	75 07                	jne    8b1 <morecore+0x34>
    return 0;
 8aa:	b8 00 00 00 00       	mov    $0x0,%eax
 8af:	eb 22                	jmp    8d3 <morecore+0x56>
  hp = (Header*)p;
 8b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8b4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 8b7:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ba:	8b 55 08             	mov    0x8(%ebp),%edx
 8bd:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8c3:	83 c0 08             	add    $0x8,%eax
 8c6:	89 04 24             	mov    %eax,(%esp)
 8c9:	e8 ce fe ff ff       	call   79c <free>
  return freep;
 8ce:	a1 c8 11 00 00       	mov    0x11c8,%eax
}
 8d3:	c9                   	leave  
 8d4:	c3                   	ret    

000008d5 <malloc>:

void*
malloc(uint nbytes)
{
 8d5:	55                   	push   %ebp
 8d6:	89 e5                	mov    %esp,%ebp
 8d8:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8db:	8b 45 08             	mov    0x8(%ebp),%eax
 8de:	83 c0 07             	add    $0x7,%eax
 8e1:	c1 e8 03             	shr    $0x3,%eax
 8e4:	83 c0 01             	add    $0x1,%eax
 8e7:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 8ea:	a1 c8 11 00 00       	mov    0x11c8,%eax
 8ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8f2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8f6:	75 23                	jne    91b <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8f8:	c7 45 f0 c0 11 00 00 	movl   $0x11c0,-0x10(%ebp)
 8ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
 902:	a3 c8 11 00 00       	mov    %eax,0x11c8
 907:	a1 c8 11 00 00       	mov    0x11c8,%eax
 90c:	a3 c0 11 00 00       	mov    %eax,0x11c0
    base.s.size = 0;
 911:	c7 05 c4 11 00 00 00 	movl   $0x0,0x11c4
 918:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 91b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91e:	8b 00                	mov    (%eax),%eax
 920:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 923:	8b 45 f4             	mov    -0xc(%ebp),%eax
 926:	8b 40 04             	mov    0x4(%eax),%eax
 929:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 92c:	72 4d                	jb     97b <malloc+0xa6>
      if(p->s.size == nunits)
 92e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 931:	8b 40 04             	mov    0x4(%eax),%eax
 934:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 937:	75 0c                	jne    945 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 939:	8b 45 f4             	mov    -0xc(%ebp),%eax
 93c:	8b 10                	mov    (%eax),%edx
 93e:	8b 45 f0             	mov    -0x10(%ebp),%eax
 941:	89 10                	mov    %edx,(%eax)
 943:	eb 26                	jmp    96b <malloc+0x96>
      else {
        p->s.size -= nunits;
 945:	8b 45 f4             	mov    -0xc(%ebp),%eax
 948:	8b 40 04             	mov    0x4(%eax),%eax
 94b:	2b 45 ec             	sub    -0x14(%ebp),%eax
 94e:	89 c2                	mov    %eax,%edx
 950:	8b 45 f4             	mov    -0xc(%ebp),%eax
 953:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 956:	8b 45 f4             	mov    -0xc(%ebp),%eax
 959:	8b 40 04             	mov    0x4(%eax),%eax
 95c:	c1 e0 03             	shl    $0x3,%eax
 95f:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 962:	8b 45 f4             	mov    -0xc(%ebp),%eax
 965:	8b 55 ec             	mov    -0x14(%ebp),%edx
 968:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 96b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 96e:	a3 c8 11 00 00       	mov    %eax,0x11c8
      return (void*)(p + 1);
 973:	8b 45 f4             	mov    -0xc(%ebp),%eax
 976:	83 c0 08             	add    $0x8,%eax
 979:	eb 38                	jmp    9b3 <malloc+0xde>
    }
    if(p == freep)
 97b:	a1 c8 11 00 00       	mov    0x11c8,%eax
 980:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 983:	75 1b                	jne    9a0 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 985:	8b 45 ec             	mov    -0x14(%ebp),%eax
 988:	89 04 24             	mov    %eax,(%esp)
 98b:	e8 ed fe ff ff       	call   87d <morecore>
 990:	89 45 f4             	mov    %eax,-0xc(%ebp)
 993:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 997:	75 07                	jne    9a0 <malloc+0xcb>
        return 0;
 999:	b8 00 00 00 00       	mov    $0x0,%eax
 99e:	eb 13                	jmp    9b3 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 9a0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a3:	89 45 f0             	mov    %eax,-0x10(%ebp)
 9a6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 9a9:	8b 00                	mov    (%eax),%eax
 9ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 9ae:	e9 70 ff ff ff       	jmp    923 <malloc+0x4e>
}
 9b3:	c9                   	leave  
 9b4:	c3                   	ret    

000009b5 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 9b5:	55                   	push   %ebp
 9b6:	89 e5                	mov    %esp,%ebp
 9b8:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 9bb:	8b 55 08             	mov    0x8(%ebp),%edx
 9be:	8b 45 0c             	mov    0xc(%ebp),%eax
 9c1:	8b 4d 08             	mov    0x8(%ebp),%ecx
 9c4:	f0 87 02             	lock xchg %eax,(%edx)
 9c7:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 9ca:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 9cd:	c9                   	leave  
 9ce:	c3                   	ret    

000009cf <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 9cf:	55                   	push   %ebp
 9d0:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 9d2:	8b 45 08             	mov    0x8(%ebp),%eax
 9d5:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 9db:	5d                   	pop    %ebp
 9dc:	c3                   	ret    

000009dd <lock_acquire>:
void lock_acquire(lock_t *lock){
 9dd:	55                   	push   %ebp
 9de:	89 e5                	mov    %esp,%ebp
 9e0:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 9e3:	90                   	nop
 9e4:	8b 45 08             	mov    0x8(%ebp),%eax
 9e7:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 9ee:	00 
 9ef:	89 04 24             	mov    %eax,(%esp)
 9f2:	e8 be ff ff ff       	call   9b5 <xchg>
 9f7:	85 c0                	test   %eax,%eax
 9f9:	75 e9                	jne    9e4 <lock_acquire+0x7>
}
 9fb:	c9                   	leave  
 9fc:	c3                   	ret    

000009fd <lock_release>:
void lock_release(lock_t *lock){
 9fd:	55                   	push   %ebp
 9fe:	89 e5                	mov    %esp,%ebp
 a00:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 a03:	8b 45 08             	mov    0x8(%ebp),%eax
 a06:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 a0d:	00 
 a0e:	89 04 24             	mov    %eax,(%esp)
 a11:	e8 9f ff ff ff       	call   9b5 <xchg>
}
 a16:	c9                   	leave  
 a17:	c3                   	ret    

00000a18 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 a18:	55                   	push   %ebp
 a19:	89 e5                	mov    %esp,%ebp
 a1b:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 a1e:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 a25:	e8 ab fe ff ff       	call   8d5 <malloc>
 a2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 a2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a30:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 a33:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a36:	25 ff 0f 00 00       	and    $0xfff,%eax
 a3b:	85 c0                	test   %eax,%eax
 a3d:	74 14                	je     a53 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 a3f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a42:	25 ff 0f 00 00       	and    $0xfff,%eax
 a47:	89 c2                	mov    %eax,%edx
 a49:	b8 00 10 00 00       	mov    $0x1000,%eax
 a4e:	29 d0                	sub    %edx,%eax
 a50:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 a53:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 a57:	75 1b                	jne    a74 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 a59:	c7 44 24 04 83 0d 00 	movl   $0xd83,0x4(%esp)
 a60:	00 
 a61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a68:	e8 7c fb ff ff       	call   5e9 <printf>
        return 0;
 a6d:	b8 00 00 00 00       	mov    $0x0,%eax
 a72:	eb 6f                	jmp    ae3 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 a74:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 a77:	8b 55 08             	mov    0x8(%ebp),%edx
 a7a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a7d:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 a81:	89 54 24 08          	mov    %edx,0x8(%esp)
 a85:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 a8c:	00 
 a8d:	89 04 24             	mov    %eax,(%esp)
 a90:	e8 4c fa ff ff       	call   4e1 <clone>
 a95:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 a98:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a9c:	79 1b                	jns    ab9 <thread_create+0xa1>
        printf(1,"clone fails\n");
 a9e:	c7 44 24 04 91 0d 00 	movl   $0xd91,0x4(%esp)
 aa5:	00 
 aa6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 aad:	e8 37 fb ff ff       	call   5e9 <printf>
        return 0;
 ab2:	b8 00 00 00 00       	mov    $0x0,%eax
 ab7:	eb 2a                	jmp    ae3 <thread_create+0xcb>
    }
    if(tid > 0){
 ab9:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 abd:	7e 05                	jle    ac4 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 abf:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac2:	eb 1f                	jmp    ae3 <thread_create+0xcb>
    }
    if(tid == 0){
 ac4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 ac8:	75 14                	jne    ade <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 aca:	c7 44 24 04 9e 0d 00 	movl   $0xd9e,0x4(%esp)
 ad1:	00 
 ad2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ad9:	e8 0b fb ff ff       	call   5e9 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 ade:	b8 00 00 00 00       	mov    $0x0,%eax
}
 ae3:	c9                   	leave  
 ae4:	c3                   	ret    

00000ae5 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 ae5:	55                   	push   %ebp
 ae6:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 ae8:	8b 45 08             	mov    0x8(%ebp),%eax
 aeb:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 af1:	8b 45 08             	mov    0x8(%ebp),%eax
 af4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 afb:	8b 45 08             	mov    0x8(%ebp),%eax
 afe:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 b05:	5d                   	pop    %ebp
 b06:	c3                   	ret    

00000b07 <add_q>:

void add_q(struct queue *q, int v){
 b07:	55                   	push   %ebp
 b08:	89 e5                	mov    %esp,%ebp
 b0a:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 b0d:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 b14:	e8 bc fd ff ff       	call   8d5 <malloc>
 b19:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 b1c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b1f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 b26:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b29:	8b 55 0c             	mov    0xc(%ebp),%edx
 b2c:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 b2e:	8b 45 08             	mov    0x8(%ebp),%eax
 b31:	8b 40 04             	mov    0x4(%eax),%eax
 b34:	85 c0                	test   %eax,%eax
 b36:	75 0b                	jne    b43 <add_q+0x3c>
        q->head = n;
 b38:	8b 45 08             	mov    0x8(%ebp),%eax
 b3b:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b3e:	89 50 04             	mov    %edx,0x4(%eax)
 b41:	eb 0c                	jmp    b4f <add_q+0x48>
    }else{
        q->tail->next = n;
 b43:	8b 45 08             	mov    0x8(%ebp),%eax
 b46:	8b 40 08             	mov    0x8(%eax),%eax
 b49:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b4c:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 b4f:	8b 45 08             	mov    0x8(%ebp),%eax
 b52:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b55:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 b58:	8b 45 08             	mov    0x8(%ebp),%eax
 b5b:	8b 00                	mov    (%eax),%eax
 b5d:	8d 50 01             	lea    0x1(%eax),%edx
 b60:	8b 45 08             	mov    0x8(%ebp),%eax
 b63:	89 10                	mov    %edx,(%eax)
}
 b65:	c9                   	leave  
 b66:	c3                   	ret    

00000b67 <empty_q>:

int empty_q(struct queue *q){
 b67:	55                   	push   %ebp
 b68:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 b6a:	8b 45 08             	mov    0x8(%ebp),%eax
 b6d:	8b 00                	mov    (%eax),%eax
 b6f:	85 c0                	test   %eax,%eax
 b71:	75 07                	jne    b7a <empty_q+0x13>
        return 1;
 b73:	b8 01 00 00 00       	mov    $0x1,%eax
 b78:	eb 05                	jmp    b7f <empty_q+0x18>
    else
        return 0;
 b7a:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 b7f:	5d                   	pop    %ebp
 b80:	c3                   	ret    

00000b81 <pop_q>:
int pop_q(struct queue *q){
 b81:	55                   	push   %ebp
 b82:	89 e5                	mov    %esp,%ebp
 b84:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 b87:	8b 45 08             	mov    0x8(%ebp),%eax
 b8a:	89 04 24             	mov    %eax,(%esp)
 b8d:	e8 d5 ff ff ff       	call   b67 <empty_q>
 b92:	85 c0                	test   %eax,%eax
 b94:	75 5d                	jne    bf3 <pop_q+0x72>
       val = q->head->value; 
 b96:	8b 45 08             	mov    0x8(%ebp),%eax
 b99:	8b 40 04             	mov    0x4(%eax),%eax
 b9c:	8b 00                	mov    (%eax),%eax
 b9e:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 ba1:	8b 45 08             	mov    0x8(%ebp),%eax
 ba4:	8b 40 04             	mov    0x4(%eax),%eax
 ba7:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 baa:	8b 45 08             	mov    0x8(%ebp),%eax
 bad:	8b 40 04             	mov    0x4(%eax),%eax
 bb0:	8b 50 04             	mov    0x4(%eax),%edx
 bb3:	8b 45 08             	mov    0x8(%ebp),%eax
 bb6:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 bb9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bbc:	89 04 24             	mov    %eax,(%esp)
 bbf:	e8 d8 fb ff ff       	call   79c <free>
       q->size--;
 bc4:	8b 45 08             	mov    0x8(%ebp),%eax
 bc7:	8b 00                	mov    (%eax),%eax
 bc9:	8d 50 ff             	lea    -0x1(%eax),%edx
 bcc:	8b 45 08             	mov    0x8(%ebp),%eax
 bcf:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 bd1:	8b 45 08             	mov    0x8(%ebp),%eax
 bd4:	8b 00                	mov    (%eax),%eax
 bd6:	85 c0                	test   %eax,%eax
 bd8:	75 14                	jne    bee <pop_q+0x6d>
            q->head = 0;
 bda:	8b 45 08             	mov    0x8(%ebp),%eax
 bdd:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 be4:	8b 45 08             	mov    0x8(%ebp),%eax
 be7:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 bee:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bf1:	eb 05                	jmp    bf8 <pop_q+0x77>
    }
    return -1;
 bf3:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 bf8:	c9                   	leave  
 bf9:	c3                   	ret    

00000bfa <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 bfa:	55                   	push   %ebp
 bfb:	89 e5                	mov    %esp,%ebp
 bfd:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 c00:	8b 45 08             	mov    0x8(%ebp),%eax
 c03:	8b 55 0c             	mov    0xc(%ebp),%edx
 c06:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 c09:	8b 45 08             	mov    0x8(%ebp),%eax
 c0c:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 c13:	8b 45 08             	mov    0x8(%ebp),%eax
 c16:	89 04 24             	mov    %eax,(%esp)
 c19:	e8 b1 fd ff ff       	call   9cf <lock_init>
}
 c1e:	c9                   	leave  
 c1f:	c3                   	ret    

00000c20 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 c20:	55                   	push   %ebp
 c21:	89 e5                	mov    %esp,%ebp
 c23:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 c26:	8b 45 08             	mov    0x8(%ebp),%eax
 c29:	89 04 24             	mov    %eax,(%esp)
 c2c:	e8 ac fd ff ff       	call   9dd <lock_acquire>
	if(s->count  == 0){
 c31:	8b 45 08             	mov    0x8(%ebp),%eax
 c34:	8b 40 04             	mov    0x4(%eax),%eax
 c37:	85 c0                	test   %eax,%eax
 c39:	75 43                	jne    c7e <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 c3b:	c7 44 24 04 af 0d 00 	movl   $0xdaf,0x4(%esp)
 c42:	00 
 c43:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c4a:	e8 9a f9 ff ff       	call   5e9 <printf>
		//add proc to waiters list
		int tid = getpid();
 c4f:	e8 6d f8 ff ff       	call   4c1 <getpid>
 c54:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 c57:	8b 45 08             	mov    0x8(%ebp),%eax
 c5a:	8d 50 0c             	lea    0xc(%eax),%edx
 c5d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c60:	89 44 24 04          	mov    %eax,0x4(%esp)
 c64:	89 14 24             	mov    %edx,(%esp)
 c67:	e8 9b fe ff ff       	call   b07 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 c6c:	8b 45 08             	mov    0x8(%ebp),%eax
 c6f:	89 04 24             	mov    %eax,(%esp)
 c72:	e8 86 fd ff ff       	call   9fd <lock_release>
		tsleep(); 
 c77:	e8 75 f8 ff ff       	call   4f1 <tsleep>
 c7c:	eb 2e                	jmp    cac <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 c7e:	c7 44 24 04 b6 0d 00 	movl   $0xdb6,0x4(%esp)
 c85:	00 
 c86:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c8d:	e8 57 f9 ff ff       	call   5e9 <printf>
		s->count--;	
 c92:	8b 45 08             	mov    0x8(%ebp),%eax
 c95:	8b 40 04             	mov    0x4(%eax),%eax
 c98:	8d 50 ff             	lea    -0x1(%eax),%edx
 c9b:	8b 45 08             	mov    0x8(%ebp),%eax
 c9e:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 ca1:	8b 45 08             	mov    0x8(%ebp),%eax
 ca4:	89 04 24             	mov    %eax,(%esp)
 ca7:	e8 51 fd ff ff       	call   9fd <lock_release>
	}
}
 cac:	c9                   	leave  
 cad:	c3                   	ret    

00000cae <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 cae:	55                   	push   %ebp
 caf:	89 e5                	mov    %esp,%ebp
 cb1:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 cb4:	c7 44 24 04 bd 0d 00 	movl   $0xdbd,0x4(%esp)
 cbb:	00 
 cbc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 cc3:	e8 21 f9 ff ff       	call   5e9 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 cc8:	8b 45 08             	mov    0x8(%ebp),%eax
 ccb:	89 04 24             	mov    %eax,(%esp)
 cce:	e8 0a fd ff ff       	call   9dd <lock_acquire>
	if(s->count < s->size){
 cd3:	8b 45 08             	mov    0x8(%ebp),%eax
 cd6:	8b 50 04             	mov    0x4(%eax),%edx
 cd9:	8b 45 08             	mov    0x8(%ebp),%eax
 cdc:	8b 40 08             	mov    0x8(%eax),%eax
 cdf:	39 c2                	cmp    %eax,%edx
 ce1:	7d 0f                	jge    cf2 <sem_signal+0x44>
		s->count++;	
 ce3:	8b 45 08             	mov    0x8(%ebp),%eax
 ce6:	8b 40 04             	mov    0x4(%eax),%eax
 ce9:	8d 50 01             	lea    0x1(%eax),%edx
 cec:	8b 45 08             	mov    0x8(%ebp),%eax
 cef:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 cf2:	8b 45 08             	mov    0x8(%ebp),%eax
 cf5:	83 c0 0c             	add    $0xc,%eax
 cf8:	89 04 24             	mov    %eax,(%esp)
 cfb:	e8 81 fe ff ff       	call   b81 <pop_q>
 d00:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 d03:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 d07:	74 2e                	je     d37 <sem_signal+0x89>
		printf(1, "Sem A\n");
 d09:	c7 44 24 04 b6 0d 00 	movl   $0xdb6,0x4(%esp)
 d10:	00 
 d11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 d18:	e8 cc f8 ff ff       	call   5e9 <printf>
		twakeup(tid);
 d1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d20:	89 04 24             	mov    %eax,(%esp)
 d23:	e8 d1 f7 ff ff       	call   4f9 <twakeup>
		s->count--;
 d28:	8b 45 08             	mov    0x8(%ebp),%eax
 d2b:	8b 40 04             	mov    0x4(%eax),%eax
 d2e:	8d 50 ff             	lea    -0x1(%eax),%edx
 d31:	8b 45 08             	mov    0x8(%ebp),%eax
 d34:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 d37:	8b 45 08             	mov    0x8(%ebp),%eax
 d3a:	89 04 24             	mov    %eax,(%esp)
 d3d:	e8 bb fc ff ff       	call   9fd <lock_release>

 d42:	c9                   	leave  
 d43:	c3                   	ret    
