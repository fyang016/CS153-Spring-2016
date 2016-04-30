
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
   6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
   d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10:	89 45 ec             	mov    %eax,-0x14(%ebp)
  13:	8b 45 ec             	mov    -0x14(%ebp),%eax
  16:	89 45 e8             	mov    %eax,-0x18(%ebp)
  inword = 0;
  19:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
  20:	eb 66                	jmp    88 <wc+0x88>
    for(i=0; i<n; i++){
  22:	c7 45 e0 00 00 00 00 	movl   $0x0,-0x20(%ebp)
  29:	eb 55                	jmp    80 <wc+0x80>
      c++;
  2b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == '\n')
  2f:	8b 45 e0             	mov    -0x20(%ebp),%eax
  32:	0f b6 80 20 0a 00 00 	movzbl 0xa20(%eax),%eax
  39:	3c 0a                	cmp    $0xa,%al
  3b:	75 04                	jne    41 <wc+0x41>
        l++;
  3d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  41:	8b 45 e0             	mov    -0x20(%ebp),%eax
  44:	0f b6 80 20 0a 00 00 	movzbl 0xa20(%eax),%eax
  4b:	0f be c0             	movsbl %al,%eax
  4e:	89 44 24 04          	mov    %eax,0x4(%esp)
  52:	c7 04 24 9f 09 00 00 	movl   $0x99f,(%esp)
  59:	e8 68 02 00 00       	call   2c6 <strchr>
  5e:	85 c0                	test   %eax,%eax
  60:	74 09                	je     6b <wc+0x6b>
        inword = 0;
  62:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  69:	eb 11                	jmp    7c <wc+0x7c>
      else if(!inword){
  6b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  6f:	75 0b                	jne    7c <wc+0x7c>
        w++;
  71:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
        inword = 1;
  75:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i=0; i<n; i++){
  7c:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
  80:	8b 45 e0             	mov    -0x20(%ebp),%eax
  83:	3b 45 e4             	cmp    -0x1c(%ebp),%eax
  86:	7c a3                	jl     2b <wc+0x2b>
  int i, n;
  int l, w, c, inword;

  l = w = c = 0;
  inword = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
  88:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
  8f:	00 
  90:	c7 44 24 04 20 0a 00 	movl   $0xa20,0x4(%esp)
  97:	00 
  98:	8b 45 08             	mov    0x8(%ebp),%eax
  9b:	89 04 24             	mov    %eax,(%esp)
  9e:	e8 c5 03 00 00       	call   468 <read>
  a3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  a6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  aa:	0f 8f 72 ff ff ff    	jg     22 <wc+0x22>
        w++;
        inword = 1;
      }
    }
  }
  if(n < 0){
  b0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  b4:	79 20                	jns    d6 <wc+0xd6>
    printf(1, "wc: read error\n");
  b6:	c7 44 24 04 a5 09 00 	movl   $0x9a5,0x4(%esp)
  bd:	00 
  be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c5:	e8 0f 05 00 00       	call   5d9 <printf>
    exit(0);
  ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  d1:	e8 72 03 00 00       	call   448 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  d6:	8b 45 0c             	mov    0xc(%ebp),%eax
  d9:	89 44 24 14          	mov    %eax,0x14(%esp)
  dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
  e0:	89 44 24 10          	mov    %eax,0x10(%esp)
  e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e7:	89 44 24 0c          	mov    %eax,0xc(%esp)
  eb:	8b 45 e8             	mov    -0x18(%ebp),%eax
  ee:	89 44 24 08          	mov    %eax,0x8(%esp)
  f2:	c7 44 24 04 b5 09 00 	movl   $0x9b5,0x4(%esp)
  f9:	00 
  fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 101:	e8 d3 04 00 00       	call   5d9 <printf>
}
 106:	c9                   	leave  
 107:	c3                   	ret    

00000108 <main>:

int
main(int argc, char *argv[])
{
 108:	55                   	push   %ebp
 109:	89 e5                	mov    %esp,%ebp
 10b:	83 e4 f0             	and    $0xfffffff0,%esp
 10e:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 111:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 115:	7f 20                	jg     137 <main+0x2f>
    wc(0, "");
 117:	c7 44 24 04 c2 09 00 	movl   $0x9c2,0x4(%esp)
 11e:	00 
 11f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 126:	e8 d5 fe ff ff       	call   0 <wc>
    exit(0);
 12b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 132:	e8 11 03 00 00       	call   448 <exit>
  }

  for(i = 1; i < argc; i++){
 137:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 13e:	00 
 13f:	e9 84 00 00 00       	jmp    1c8 <main+0xc0>
    if((fd = open(argv[i], 0)) < 0){
 144:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 148:	c1 e0 02             	shl    $0x2,%eax
 14b:	03 45 0c             	add    0xc(%ebp),%eax
 14e:	8b 00                	mov    (%eax),%eax
 150:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 157:	00 
 158:	89 04 24             	mov    %eax,(%esp)
 15b:	e8 30 03 00 00       	call   490 <open>
 160:	89 44 24 18          	mov    %eax,0x18(%esp)
 164:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 169:	79 30                	jns    19b <main+0x93>
      printf(1, "wc: cannot open %s\n", argv[i]);
 16b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 16f:	c1 e0 02             	shl    $0x2,%eax
 172:	03 45 0c             	add    0xc(%ebp),%eax
 175:	8b 00                	mov    (%eax),%eax
 177:	89 44 24 08          	mov    %eax,0x8(%esp)
 17b:	c7 44 24 04 c3 09 00 	movl   $0x9c3,0x4(%esp)
 182:	00 
 183:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 18a:	e8 4a 04 00 00       	call   5d9 <printf>
      exit(0);
 18f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 196:	e8 ad 02 00 00       	call   448 <exit>
    }
    wc(fd, argv[i]);
 19b:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 19f:	c1 e0 02             	shl    $0x2,%eax
 1a2:	03 45 0c             	add    0xc(%ebp),%eax
 1a5:	8b 00                	mov    (%eax),%eax
 1a7:	89 44 24 04          	mov    %eax,0x4(%esp)
 1ab:	8b 44 24 18          	mov    0x18(%esp),%eax
 1af:	89 04 24             	mov    %eax,(%esp)
 1b2:	e8 49 fe ff ff       	call   0 <wc>
    close(fd);
 1b7:	8b 44 24 18          	mov    0x18(%esp),%eax
 1bb:	89 04 24             	mov    %eax,(%esp)
 1be:	e8 b5 02 00 00       	call   478 <close>
  if(argc <= 1){
    wc(0, "");
    exit(0);
  }

  for(i = 1; i < argc; i++){
 1c3:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1c8:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1cc:	3b 45 08             	cmp    0x8(%ebp),%eax
 1cf:	0f 8c 6f ff ff ff    	jl     144 <main+0x3c>
      exit(0);
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit(0);
 1d5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 1dc:	e8 67 02 00 00       	call   448 <exit>
 1e1:	90                   	nop
 1e2:	90                   	nop
 1e3:	90                   	nop

000001e4 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1e4:	55                   	push   %ebp
 1e5:	89 e5                	mov    %esp,%ebp
 1e7:	57                   	push   %edi
 1e8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1e9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1ec:	8b 55 10             	mov    0x10(%ebp),%edx
 1ef:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f2:	89 cb                	mov    %ecx,%ebx
 1f4:	89 df                	mov    %ebx,%edi
 1f6:	89 d1                	mov    %edx,%ecx
 1f8:	fc                   	cld    
 1f9:	f3 aa                	rep stos %al,%es:(%edi)
 1fb:	89 ca                	mov    %ecx,%edx
 1fd:	89 fb                	mov    %edi,%ebx
 1ff:	89 5d 08             	mov    %ebx,0x8(%ebp)
 202:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 205:	5b                   	pop    %ebx
 206:	5f                   	pop    %edi
 207:	5d                   	pop    %ebp
 208:	c3                   	ret    

00000209 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 209:	55                   	push   %ebp
 20a:	89 e5                	mov    %esp,%ebp
 20c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 20f:	8b 45 08             	mov    0x8(%ebp),%eax
 212:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 215:	8b 45 0c             	mov    0xc(%ebp),%eax
 218:	0f b6 10             	movzbl (%eax),%edx
 21b:	8b 45 08             	mov    0x8(%ebp),%eax
 21e:	88 10                	mov    %dl,(%eax)
 220:	8b 45 08             	mov    0x8(%ebp),%eax
 223:	0f b6 00             	movzbl (%eax),%eax
 226:	84 c0                	test   %al,%al
 228:	0f 95 c0             	setne  %al
 22b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 22f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 233:	84 c0                	test   %al,%al
 235:	75 de                	jne    215 <strcpy+0xc>
    ;
  return os;
 237:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 23a:	c9                   	leave  
 23b:	c3                   	ret    

0000023c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 23c:	55                   	push   %ebp
 23d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 23f:	eb 08                	jmp    249 <strcmp+0xd>
    p++, q++;
 241:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 245:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 249:	8b 45 08             	mov    0x8(%ebp),%eax
 24c:	0f b6 00             	movzbl (%eax),%eax
 24f:	84 c0                	test   %al,%al
 251:	74 10                	je     263 <strcmp+0x27>
 253:	8b 45 08             	mov    0x8(%ebp),%eax
 256:	0f b6 10             	movzbl (%eax),%edx
 259:	8b 45 0c             	mov    0xc(%ebp),%eax
 25c:	0f b6 00             	movzbl (%eax),%eax
 25f:	38 c2                	cmp    %al,%dl
 261:	74 de                	je     241 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 263:	8b 45 08             	mov    0x8(%ebp),%eax
 266:	0f b6 00             	movzbl (%eax),%eax
 269:	0f b6 d0             	movzbl %al,%edx
 26c:	8b 45 0c             	mov    0xc(%ebp),%eax
 26f:	0f b6 00             	movzbl (%eax),%eax
 272:	0f b6 c0             	movzbl %al,%eax
 275:	89 d1                	mov    %edx,%ecx
 277:	29 c1                	sub    %eax,%ecx
 279:	89 c8                	mov    %ecx,%eax
}
 27b:	5d                   	pop    %ebp
 27c:	c3                   	ret    

0000027d <strlen>:

uint
strlen(char *s)
{
 27d:	55                   	push   %ebp
 27e:	89 e5                	mov    %esp,%ebp
 280:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 283:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 28a:	eb 04                	jmp    290 <strlen+0x13>
 28c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 290:	8b 45 fc             	mov    -0x4(%ebp),%eax
 293:	03 45 08             	add    0x8(%ebp),%eax
 296:	0f b6 00             	movzbl (%eax),%eax
 299:	84 c0                	test   %al,%al
 29b:	75 ef                	jne    28c <strlen+0xf>
    ;
  return n;
 29d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 2a0:	c9                   	leave  
 2a1:	c3                   	ret    

000002a2 <memset>:

void*
memset(void *dst, int c, uint n)
{
 2a2:	55                   	push   %ebp
 2a3:	89 e5                	mov    %esp,%ebp
 2a5:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 2a8:	8b 45 10             	mov    0x10(%ebp),%eax
 2ab:	89 44 24 08          	mov    %eax,0x8(%esp)
 2af:	8b 45 0c             	mov    0xc(%ebp),%eax
 2b2:	89 44 24 04          	mov    %eax,0x4(%esp)
 2b6:	8b 45 08             	mov    0x8(%ebp),%eax
 2b9:	89 04 24             	mov    %eax,(%esp)
 2bc:	e8 23 ff ff ff       	call   1e4 <stosb>
  return dst;
 2c1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2c4:	c9                   	leave  
 2c5:	c3                   	ret    

000002c6 <strchr>:

char*
strchr(const char *s, char c)
{
 2c6:	55                   	push   %ebp
 2c7:	89 e5                	mov    %esp,%ebp
 2c9:	83 ec 04             	sub    $0x4,%esp
 2cc:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cf:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2d2:	eb 14                	jmp    2e8 <strchr+0x22>
    if(*s == c)
 2d4:	8b 45 08             	mov    0x8(%ebp),%eax
 2d7:	0f b6 00             	movzbl (%eax),%eax
 2da:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2dd:	75 05                	jne    2e4 <strchr+0x1e>
      return (char*)s;
 2df:	8b 45 08             	mov    0x8(%ebp),%eax
 2e2:	eb 13                	jmp    2f7 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2e4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2e8:	8b 45 08             	mov    0x8(%ebp),%eax
 2eb:	0f b6 00             	movzbl (%eax),%eax
 2ee:	84 c0                	test   %al,%al
 2f0:	75 e2                	jne    2d4 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2f2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2f7:	c9                   	leave  
 2f8:	c3                   	ret    

000002f9 <gets>:

char*
gets(char *buf, int max)
{
 2f9:	55                   	push   %ebp
 2fa:	89 e5                	mov    %esp,%ebp
 2fc:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2ff:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 306:	eb 44                	jmp    34c <gets+0x53>
    cc = read(0, &c, 1);
 308:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 30f:	00 
 310:	8d 45 ef             	lea    -0x11(%ebp),%eax
 313:	89 44 24 04          	mov    %eax,0x4(%esp)
 317:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 31e:	e8 45 01 00 00       	call   468 <read>
 323:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 326:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 32a:	7e 2d                	jle    359 <gets+0x60>
      break;
    buf[i++] = c;
 32c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 32f:	03 45 08             	add    0x8(%ebp),%eax
 332:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 336:	88 10                	mov    %dl,(%eax)
 338:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 33c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 340:	3c 0a                	cmp    $0xa,%al
 342:	74 16                	je     35a <gets+0x61>
 344:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 348:	3c 0d                	cmp    $0xd,%al
 34a:	74 0e                	je     35a <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 34c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 34f:	83 c0 01             	add    $0x1,%eax
 352:	3b 45 0c             	cmp    0xc(%ebp),%eax
 355:	7c b1                	jl     308 <gets+0xf>
 357:	eb 01                	jmp    35a <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 359:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 35a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 35d:	03 45 08             	add    0x8(%ebp),%eax
 360:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 363:	8b 45 08             	mov    0x8(%ebp),%eax
}
 366:	c9                   	leave  
 367:	c3                   	ret    

00000368 <stat>:

int
stat(char *n, struct stat *st)
{
 368:	55                   	push   %ebp
 369:	89 e5                	mov    %esp,%ebp
 36b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 36e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 375:	00 
 376:	8b 45 08             	mov    0x8(%ebp),%eax
 379:	89 04 24             	mov    %eax,(%esp)
 37c:	e8 0f 01 00 00       	call   490 <open>
 381:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 384:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 388:	79 07                	jns    391 <stat+0x29>
    return -1;
 38a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 38f:	eb 23                	jmp    3b4 <stat+0x4c>
  r = fstat(fd, st);
 391:	8b 45 0c             	mov    0xc(%ebp),%eax
 394:	89 44 24 04          	mov    %eax,0x4(%esp)
 398:	8b 45 f0             	mov    -0x10(%ebp),%eax
 39b:	89 04 24             	mov    %eax,(%esp)
 39e:	e8 05 01 00 00       	call   4a8 <fstat>
 3a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 3a6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 3a9:	89 04 24             	mov    %eax,(%esp)
 3ac:	e8 c7 00 00 00       	call   478 <close>
  return r;
 3b1:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 3b4:	c9                   	leave  
 3b5:	c3                   	ret    

000003b6 <atoi>:

int
atoi(const char *s)
{
 3b6:	55                   	push   %ebp
 3b7:	89 e5                	mov    %esp,%ebp
 3b9:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 3bc:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3c3:	eb 24                	jmp    3e9 <atoi+0x33>
    n = n*10 + *s++ - '0';
 3c5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3c8:	89 d0                	mov    %edx,%eax
 3ca:	c1 e0 02             	shl    $0x2,%eax
 3cd:	01 d0                	add    %edx,%eax
 3cf:	01 c0                	add    %eax,%eax
 3d1:	89 c2                	mov    %eax,%edx
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	0f b6 00             	movzbl (%eax),%eax
 3d9:	0f be c0             	movsbl %al,%eax
 3dc:	8d 04 02             	lea    (%edx,%eax,1),%eax
 3df:	83 e8 30             	sub    $0x30,%eax
 3e2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 3e5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3e9:	8b 45 08             	mov    0x8(%ebp),%eax
 3ec:	0f b6 00             	movzbl (%eax),%eax
 3ef:	3c 2f                	cmp    $0x2f,%al
 3f1:	7e 0a                	jle    3fd <atoi+0x47>
 3f3:	8b 45 08             	mov    0x8(%ebp),%eax
 3f6:	0f b6 00             	movzbl (%eax),%eax
 3f9:	3c 39                	cmp    $0x39,%al
 3fb:	7e c8                	jle    3c5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3fd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 400:	c9                   	leave  
 401:	c3                   	ret    

00000402 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 402:	55                   	push   %ebp
 403:	89 e5                	mov    %esp,%ebp
 405:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 408:	8b 45 08             	mov    0x8(%ebp),%eax
 40b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 40e:	8b 45 0c             	mov    0xc(%ebp),%eax
 411:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 414:	eb 13                	jmp    429 <memmove+0x27>
    *dst++ = *src++;
 416:	8b 45 fc             	mov    -0x4(%ebp),%eax
 419:	0f b6 10             	movzbl (%eax),%edx
 41c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 41f:	88 10                	mov    %dl,(%eax)
 421:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 425:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 429:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 42d:	0f 9f c0             	setg   %al
 430:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 434:	84 c0                	test   %al,%al
 436:	75 de                	jne    416 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 438:	8b 45 08             	mov    0x8(%ebp),%eax
}
 43b:	c9                   	leave  
 43c:	c3                   	ret    
 43d:	90                   	nop
 43e:	90                   	nop
 43f:	90                   	nop

00000440 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 440:	b8 01 00 00 00       	mov    $0x1,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <exit>:
SYSCALL(exit)
 448:	b8 02 00 00 00       	mov    $0x2,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <wait>:
SYSCALL(wait)
 450:	b8 03 00 00 00       	mov    $0x3,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <waitpid>:
SYSCALL(waitpid)
 458:	b8 17 00 00 00       	mov    $0x17,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <pipe>:
SYSCALL(pipe)
 460:	b8 04 00 00 00       	mov    $0x4,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <read>:
SYSCALL(read)
 468:	b8 05 00 00 00       	mov    $0x5,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <write>:
SYSCALL(write)
 470:	b8 10 00 00 00       	mov    $0x10,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <close>:
SYSCALL(close)
 478:	b8 15 00 00 00       	mov    $0x15,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <kill>:
SYSCALL(kill)
 480:	b8 06 00 00 00       	mov    $0x6,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <exec>:
SYSCALL(exec)
 488:	b8 07 00 00 00       	mov    $0x7,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <open>:
SYSCALL(open)
 490:	b8 0f 00 00 00       	mov    $0xf,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <mknod>:
SYSCALL(mknod)
 498:	b8 11 00 00 00       	mov    $0x11,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <unlink>:
SYSCALL(unlink)
 4a0:	b8 12 00 00 00       	mov    $0x12,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <fstat>:
SYSCALL(fstat)
 4a8:	b8 08 00 00 00       	mov    $0x8,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <link>:
SYSCALL(link)
 4b0:	b8 13 00 00 00       	mov    $0x13,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <mkdir>:
SYSCALL(mkdir)
 4b8:	b8 14 00 00 00       	mov    $0x14,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <chdir>:
SYSCALL(chdir)
 4c0:	b8 09 00 00 00       	mov    $0x9,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <dup>:
SYSCALL(dup)
 4c8:	b8 0a 00 00 00       	mov    $0xa,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <getpid>:
SYSCALL(getpid)
 4d0:	b8 0b 00 00 00       	mov    $0xb,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <sbrk>:
SYSCALL(sbrk)
 4d8:	b8 0c 00 00 00       	mov    $0xc,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <sleep>:
SYSCALL(sleep)
 4e0:	b8 0d 00 00 00       	mov    $0xd,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <uptime>:
SYSCALL(uptime)
 4e8:	b8 0e 00 00 00       	mov    $0xe,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <count>:
SYSCALL(count)
 4f0:	b8 16 00 00 00       	mov    $0x16,%eax
 4f5:	cd 40                	int    $0x40
 4f7:	c3                   	ret    

000004f8 <change_priority>:
SYSCALL(change_priority)
 4f8:	b8 18 00 00 00       	mov    $0x18,%eax
 4fd:	cd 40                	int    $0x40
 4ff:	c3                   	ret    

00000500 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 500:	55                   	push   %ebp
 501:	89 e5                	mov    %esp,%ebp
 503:	83 ec 28             	sub    $0x28,%esp
 506:	8b 45 0c             	mov    0xc(%ebp),%eax
 509:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 50c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 513:	00 
 514:	8d 45 f4             	lea    -0xc(%ebp),%eax
 517:	89 44 24 04          	mov    %eax,0x4(%esp)
 51b:	8b 45 08             	mov    0x8(%ebp),%eax
 51e:	89 04 24             	mov    %eax,(%esp)
 521:	e8 4a ff ff ff       	call   470 <write>
}
 526:	c9                   	leave  
 527:	c3                   	ret    

00000528 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 528:	55                   	push   %ebp
 529:	89 e5                	mov    %esp,%ebp
 52b:	53                   	push   %ebx
 52c:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 52f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 536:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 53a:	74 17                	je     553 <printint+0x2b>
 53c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 540:	79 11                	jns    553 <printint+0x2b>
    neg = 1;
 542:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 549:	8b 45 0c             	mov    0xc(%ebp),%eax
 54c:	f7 d8                	neg    %eax
 54e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 551:	eb 06                	jmp    559 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 553:	8b 45 0c             	mov    0xc(%ebp),%eax
 556:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 559:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 560:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 563:	8b 5d 10             	mov    0x10(%ebp),%ebx
 566:	8b 45 f4             	mov    -0xc(%ebp),%eax
 569:	ba 00 00 00 00       	mov    $0x0,%edx
 56e:	f7 f3                	div    %ebx
 570:	89 d0                	mov    %edx,%eax
 572:	0f b6 80 e0 09 00 00 	movzbl 0x9e0(%eax),%eax
 579:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 57d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 581:	8b 45 10             	mov    0x10(%ebp),%eax
 584:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 587:	8b 45 f4             	mov    -0xc(%ebp),%eax
 58a:	ba 00 00 00 00       	mov    $0x0,%edx
 58f:	f7 75 d4             	divl   -0x2c(%ebp)
 592:	89 45 f4             	mov    %eax,-0xc(%ebp)
 595:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 599:	75 c5                	jne    560 <printint+0x38>
  if(neg)
 59b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 59f:	74 28                	je     5c9 <printint+0xa1>
    buf[i++] = '-';
 5a1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5a4:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 5a9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 5ad:	eb 1a                	jmp    5c9 <printint+0xa1>
    putc(fd, buf[i]);
 5af:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5b2:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 5b7:	0f be c0             	movsbl %al,%eax
 5ba:	89 44 24 04          	mov    %eax,0x4(%esp)
 5be:	8b 45 08             	mov    0x8(%ebp),%eax
 5c1:	89 04 24             	mov    %eax,(%esp)
 5c4:	e8 37 ff ff ff       	call   500 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5c9:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 5cd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5d1:	79 dc                	jns    5af <printint+0x87>
    putc(fd, buf[i]);
}
 5d3:	83 c4 44             	add    $0x44,%esp
 5d6:	5b                   	pop    %ebx
 5d7:	5d                   	pop    %ebp
 5d8:	c3                   	ret    

000005d9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5d9:	55                   	push   %ebp
 5da:	89 e5                	mov    %esp,%ebp
 5dc:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5e6:	8d 45 0c             	lea    0xc(%ebp),%eax
 5e9:	83 c0 04             	add    $0x4,%eax
 5ec:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 5ef:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 5f6:	e9 7e 01 00 00       	jmp    779 <printf+0x1a0>
    c = fmt[i] & 0xff;
 5fb:	8b 55 0c             	mov    0xc(%ebp),%edx
 5fe:	8b 45 ec             	mov    -0x14(%ebp),%eax
 601:	8d 04 02             	lea    (%edx,%eax,1),%eax
 604:	0f b6 00             	movzbl (%eax),%eax
 607:	0f be c0             	movsbl %al,%eax
 60a:	25 ff 00 00 00       	and    $0xff,%eax
 60f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 612:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 616:	75 2c                	jne    644 <printf+0x6b>
      if(c == '%'){
 618:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 61c:	75 0c                	jne    62a <printf+0x51>
        state = '%';
 61e:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 625:	e9 4b 01 00 00       	jmp    775 <printf+0x19c>
      } else {
        putc(fd, c);
 62a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 62d:	0f be c0             	movsbl %al,%eax
 630:	89 44 24 04          	mov    %eax,0x4(%esp)
 634:	8b 45 08             	mov    0x8(%ebp),%eax
 637:	89 04 24             	mov    %eax,(%esp)
 63a:	e8 c1 fe ff ff       	call   500 <putc>
 63f:	e9 31 01 00 00       	jmp    775 <printf+0x19c>
      }
    } else if(state == '%'){
 644:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 648:	0f 85 27 01 00 00    	jne    775 <printf+0x19c>
      if(c == 'd'){
 64e:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 652:	75 2d                	jne    681 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 654:	8b 45 f4             	mov    -0xc(%ebp),%eax
 657:	8b 00                	mov    (%eax),%eax
 659:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 660:	00 
 661:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 668:	00 
 669:	89 44 24 04          	mov    %eax,0x4(%esp)
 66d:	8b 45 08             	mov    0x8(%ebp),%eax
 670:	89 04 24             	mov    %eax,(%esp)
 673:	e8 b0 fe ff ff       	call   528 <printint>
        ap++;
 678:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 67c:	e9 ed 00 00 00       	jmp    76e <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 681:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 685:	74 06                	je     68d <printf+0xb4>
 687:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 68b:	75 2d                	jne    6ba <printf+0xe1>
        printint(fd, *ap, 16, 0);
 68d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 690:	8b 00                	mov    (%eax),%eax
 692:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 699:	00 
 69a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 6a1:	00 
 6a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a6:	8b 45 08             	mov    0x8(%ebp),%eax
 6a9:	89 04 24             	mov    %eax,(%esp)
 6ac:	e8 77 fe ff ff       	call   528 <printint>
        ap++;
 6b1:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6b5:	e9 b4 00 00 00       	jmp    76e <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6ba:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 6be:	75 46                	jne    706 <printf+0x12d>
        s = (char*)*ap;
 6c0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6c3:	8b 00                	mov    (%eax),%eax
 6c5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 6c8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 6cc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 6d0:	75 27                	jne    6f9 <printf+0x120>
          s = "(null)";
 6d2:	c7 45 e4 d7 09 00 00 	movl   $0x9d7,-0x1c(%ebp)
        while(*s != 0){
 6d9:	eb 1f                	jmp    6fa <printf+0x121>
          putc(fd, *s);
 6db:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6de:	0f b6 00             	movzbl (%eax),%eax
 6e1:	0f be c0             	movsbl %al,%eax
 6e4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6e8:	8b 45 08             	mov    0x8(%ebp),%eax
 6eb:	89 04 24             	mov    %eax,(%esp)
 6ee:	e8 0d fe ff ff       	call   500 <putc>
          s++;
 6f3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 6f7:	eb 01                	jmp    6fa <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6f9:	90                   	nop
 6fa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6fd:	0f b6 00             	movzbl (%eax),%eax
 700:	84 c0                	test   %al,%al
 702:	75 d7                	jne    6db <printf+0x102>
 704:	eb 68                	jmp    76e <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 706:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 70a:	75 1d                	jne    729 <printf+0x150>
        putc(fd, *ap);
 70c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70f:	8b 00                	mov    (%eax),%eax
 711:	0f be c0             	movsbl %al,%eax
 714:	89 44 24 04          	mov    %eax,0x4(%esp)
 718:	8b 45 08             	mov    0x8(%ebp),%eax
 71b:	89 04 24             	mov    %eax,(%esp)
 71e:	e8 dd fd ff ff       	call   500 <putc>
        ap++;
 723:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 727:	eb 45                	jmp    76e <printf+0x195>
      } else if(c == '%'){
 729:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 72d:	75 17                	jne    746 <printf+0x16d>
        putc(fd, c);
 72f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 732:	0f be c0             	movsbl %al,%eax
 735:	89 44 24 04          	mov    %eax,0x4(%esp)
 739:	8b 45 08             	mov    0x8(%ebp),%eax
 73c:	89 04 24             	mov    %eax,(%esp)
 73f:	e8 bc fd ff ff       	call   500 <putc>
 744:	eb 28                	jmp    76e <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 746:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 74d:	00 
 74e:	8b 45 08             	mov    0x8(%ebp),%eax
 751:	89 04 24             	mov    %eax,(%esp)
 754:	e8 a7 fd ff ff       	call   500 <putc>
        putc(fd, c);
 759:	8b 45 e8             	mov    -0x18(%ebp),%eax
 75c:	0f be c0             	movsbl %al,%eax
 75f:	89 44 24 04          	mov    %eax,0x4(%esp)
 763:	8b 45 08             	mov    0x8(%ebp),%eax
 766:	89 04 24             	mov    %eax,(%esp)
 769:	e8 92 fd ff ff       	call   500 <putc>
      }
      state = 0;
 76e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 775:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 779:	8b 55 0c             	mov    0xc(%ebp),%edx
 77c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 77f:	8d 04 02             	lea    (%edx,%eax,1),%eax
 782:	0f b6 00             	movzbl (%eax),%eax
 785:	84 c0                	test   %al,%al
 787:	0f 85 6e fe ff ff    	jne    5fb <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 78d:	c9                   	leave  
 78e:	c3                   	ret    
 78f:	90                   	nop

00000790 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 790:	55                   	push   %ebp
 791:	89 e5                	mov    %esp,%ebp
 793:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 796:	8b 45 08             	mov    0x8(%ebp),%eax
 799:	83 e8 08             	sub    $0x8,%eax
 79c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 79f:	a1 08 0a 00 00       	mov    0xa08,%eax
 7a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7a7:	eb 24                	jmp    7cd <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 7a9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ac:	8b 00                	mov    (%eax),%eax
 7ae:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b1:	77 12                	ja     7c5 <free+0x35>
 7b3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7b6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7b9:	77 24                	ja     7df <free+0x4f>
 7bb:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7be:	8b 00                	mov    (%eax),%eax
 7c0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7c3:	77 1a                	ja     7df <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c8:	8b 00                	mov    (%eax),%eax
 7ca:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7cd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7d3:	76 d4                	jbe    7a9 <free+0x19>
 7d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7d8:	8b 00                	mov    (%eax),%eax
 7da:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7dd:	76 ca                	jbe    7a9 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7df:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e2:	8b 40 04             	mov    0x4(%eax),%eax
 7e5:	c1 e0 03             	shl    $0x3,%eax
 7e8:	89 c2                	mov    %eax,%edx
 7ea:	03 55 f8             	add    -0x8(%ebp),%edx
 7ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7f0:	8b 00                	mov    (%eax),%eax
 7f2:	39 c2                	cmp    %eax,%edx
 7f4:	75 24                	jne    81a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 7f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f9:	8b 50 04             	mov    0x4(%eax),%edx
 7fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ff:	8b 00                	mov    (%eax),%eax
 801:	8b 40 04             	mov    0x4(%eax),%eax
 804:	01 c2                	add    %eax,%edx
 806:	8b 45 f8             	mov    -0x8(%ebp),%eax
 809:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 80c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80f:	8b 00                	mov    (%eax),%eax
 811:	8b 10                	mov    (%eax),%edx
 813:	8b 45 f8             	mov    -0x8(%ebp),%eax
 816:	89 10                	mov    %edx,(%eax)
 818:	eb 0a                	jmp    824 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 81a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 81d:	8b 10                	mov    (%eax),%edx
 81f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 822:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 824:	8b 45 fc             	mov    -0x4(%ebp),%eax
 827:	8b 40 04             	mov    0x4(%eax),%eax
 82a:	c1 e0 03             	shl    $0x3,%eax
 82d:	03 45 fc             	add    -0x4(%ebp),%eax
 830:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 833:	75 20                	jne    855 <free+0xc5>
    p->s.size += bp->s.size;
 835:	8b 45 fc             	mov    -0x4(%ebp),%eax
 838:	8b 50 04             	mov    0x4(%eax),%edx
 83b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83e:	8b 40 04             	mov    0x4(%eax),%eax
 841:	01 c2                	add    %eax,%edx
 843:	8b 45 fc             	mov    -0x4(%ebp),%eax
 846:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 849:	8b 45 f8             	mov    -0x8(%ebp),%eax
 84c:	8b 10                	mov    (%eax),%edx
 84e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 851:	89 10                	mov    %edx,(%eax)
 853:	eb 08                	jmp    85d <free+0xcd>
  } else
    p->s.ptr = bp;
 855:	8b 45 fc             	mov    -0x4(%ebp),%eax
 858:	8b 55 f8             	mov    -0x8(%ebp),%edx
 85b:	89 10                	mov    %edx,(%eax)
  freep = p;
 85d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 860:	a3 08 0a 00 00       	mov    %eax,0xa08
}
 865:	c9                   	leave  
 866:	c3                   	ret    

00000867 <morecore>:

static Header*
morecore(uint nu)
{
 867:	55                   	push   %ebp
 868:	89 e5                	mov    %esp,%ebp
 86a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 86d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 874:	77 07                	ja     87d <morecore+0x16>
    nu = 4096;
 876:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 87d:	8b 45 08             	mov    0x8(%ebp),%eax
 880:	c1 e0 03             	shl    $0x3,%eax
 883:	89 04 24             	mov    %eax,(%esp)
 886:	e8 4d fc ff ff       	call   4d8 <sbrk>
 88b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 88e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 892:	75 07                	jne    89b <morecore+0x34>
    return 0;
 894:	b8 00 00 00 00       	mov    $0x0,%eax
 899:	eb 22                	jmp    8bd <morecore+0x56>
  hp = (Header*)p;
 89b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 89e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 8a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8a4:	8b 55 08             	mov    0x8(%ebp),%edx
 8a7:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 8aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
 8ad:	83 c0 08             	add    $0x8,%eax
 8b0:	89 04 24             	mov    %eax,(%esp)
 8b3:	e8 d8 fe ff ff       	call   790 <free>
  return freep;
 8b8:	a1 08 0a 00 00       	mov    0xa08,%eax
}
 8bd:	c9                   	leave  
 8be:	c3                   	ret    

000008bf <malloc>:

void*
malloc(uint nbytes)
{
 8bf:	55                   	push   %ebp
 8c0:	89 e5                	mov    %esp,%ebp
 8c2:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8c5:	8b 45 08             	mov    0x8(%ebp),%eax
 8c8:	83 c0 07             	add    $0x7,%eax
 8cb:	c1 e8 03             	shr    $0x3,%eax
 8ce:	83 c0 01             	add    $0x1,%eax
 8d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 8d4:	a1 08 0a 00 00       	mov    0xa08,%eax
 8d9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8dc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8e0:	75 23                	jne    905 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8e2:	c7 45 f0 00 0a 00 00 	movl   $0xa00,-0x10(%ebp)
 8e9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8ec:	a3 08 0a 00 00       	mov    %eax,0xa08
 8f1:	a1 08 0a 00 00       	mov    0xa08,%eax
 8f6:	a3 00 0a 00 00       	mov    %eax,0xa00
    base.s.size = 0;
 8fb:	c7 05 04 0a 00 00 00 	movl   $0x0,0xa04
 902:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 905:	8b 45 f0             	mov    -0x10(%ebp),%eax
 908:	8b 00                	mov    (%eax),%eax
 90a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 90d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 910:	8b 40 04             	mov    0x4(%eax),%eax
 913:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 916:	72 4d                	jb     965 <malloc+0xa6>
      if(p->s.size == nunits)
 918:	8b 45 ec             	mov    -0x14(%ebp),%eax
 91b:	8b 40 04             	mov    0x4(%eax),%eax
 91e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 921:	75 0c                	jne    92f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 923:	8b 45 ec             	mov    -0x14(%ebp),%eax
 926:	8b 10                	mov    (%eax),%edx
 928:	8b 45 f0             	mov    -0x10(%ebp),%eax
 92b:	89 10                	mov    %edx,(%eax)
 92d:	eb 26                	jmp    955 <malloc+0x96>
      else {
        p->s.size -= nunits;
 92f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 932:	8b 40 04             	mov    0x4(%eax),%eax
 935:	89 c2                	mov    %eax,%edx
 937:	2b 55 f4             	sub    -0xc(%ebp),%edx
 93a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 93d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 940:	8b 45 ec             	mov    -0x14(%ebp),%eax
 943:	8b 40 04             	mov    0x4(%eax),%eax
 946:	c1 e0 03             	shl    $0x3,%eax
 949:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 94c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 94f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 952:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 955:	8b 45 f0             	mov    -0x10(%ebp),%eax
 958:	a3 08 0a 00 00       	mov    %eax,0xa08
      return (void*)(p + 1);
 95d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 960:	83 c0 08             	add    $0x8,%eax
 963:	eb 38                	jmp    99d <malloc+0xde>
    }
    if(p == freep)
 965:	a1 08 0a 00 00       	mov    0xa08,%eax
 96a:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 96d:	75 1b                	jne    98a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 96f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 972:	89 04 24             	mov    %eax,(%esp)
 975:	e8 ed fe ff ff       	call   867 <morecore>
 97a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 97d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 981:	75 07                	jne    98a <malloc+0xcb>
        return 0;
 983:	b8 00 00 00 00       	mov    $0x0,%eax
 988:	eb 13                	jmp    99d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 98a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 98d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 990:	8b 45 ec             	mov    -0x14(%ebp),%eax
 993:	8b 00                	mov    (%eax),%eax
 995:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 998:	e9 70 ff ff ff       	jmp    90d <malloc+0x4e>
}
 99d:	c9                   	leave  
 99e:	c3                   	ret    
