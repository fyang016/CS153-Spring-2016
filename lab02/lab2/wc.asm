
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
  32:	0f b6 80 e0 0d 00 00 	movzbl 0xde0(%eax),%eax
  39:	3c 0a                	cmp    $0xa,%al
  3b:	75 04                	jne    41 <wc+0x41>
        l++;
  3d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
      if(strchr(" \r\t\n\v", buf[i]))
  41:	8b 45 e0             	mov    -0x20(%ebp),%eax
  44:	0f b6 80 e0 0d 00 00 	movzbl 0xde0(%eax),%eax
  4b:	0f be c0             	movsbl %al,%eax
  4e:	89 44 24 04          	mov    %eax,0x4(%esp)
  52:	c7 04 24 22 0d 00 00 	movl   $0xd22,(%esp)
  59:	e8 48 02 00 00       	call   2a6 <strchr>
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
  90:	c7 44 24 04 e0 0d 00 	movl   $0xde0,0x4(%esp)
  97:	00 
  98:	8b 45 08             	mov    0x8(%ebp),%eax
  9b:	89 04 24             	mov    %eax,(%esp)
  9e:	e8 9d 03 00 00       	call   440 <read>
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
  b4:	79 19                	jns    cf <wc+0xcf>
    printf(1, "wc: read error\n");
  b6:	c7 44 24 04 28 0d 00 	movl   $0xd28,0x4(%esp)
  bd:	00 
  be:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  c5:	e8 ff 04 00 00       	call   5c9 <printf>
    exit();
  ca:	e8 59 03 00 00       	call   428 <exit>
  }
  printf(1, "%d %d %d %s\n", l, w, c, name);
  cf:	8b 45 0c             	mov    0xc(%ebp),%eax
  d2:	89 44 24 14          	mov    %eax,0x14(%esp)
  d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
  d9:	89 44 24 10          	mov    %eax,0x10(%esp)
  dd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  e0:	89 44 24 0c          	mov    %eax,0xc(%esp)
  e4:	8b 45 e8             	mov    -0x18(%ebp),%eax
  e7:	89 44 24 08          	mov    %eax,0x8(%esp)
  eb:	c7 44 24 04 38 0d 00 	movl   $0xd38,0x4(%esp)
  f2:	00 
  f3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  fa:	e8 ca 04 00 00       	call   5c9 <printf>
}
  ff:	c9                   	leave  
 100:	c3                   	ret    

00000101 <main>:

int
main(int argc, char *argv[])
{
 101:	55                   	push   %ebp
 102:	89 e5                	mov    %esp,%ebp
 104:	83 e4 f0             	and    $0xfffffff0,%esp
 107:	83 ec 20             	sub    $0x20,%esp
  int fd, i;

  if(argc <= 1){
 10a:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 10e:	7f 19                	jg     129 <main+0x28>
    wc(0, "");
 110:	c7 44 24 04 45 0d 00 	movl   $0xd45,0x4(%esp)
 117:	00 
 118:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 11f:	e8 dc fe ff ff       	call   0 <wc>
    exit();
 124:	e8 ff 02 00 00       	call   428 <exit>
  }

  for(i = 1; i < argc; i++){
 129:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 130:	00 
 131:	eb 7d                	jmp    1b0 <main+0xaf>
    if((fd = open(argv[i], 0)) < 0){
 133:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 137:	c1 e0 02             	shl    $0x2,%eax
 13a:	03 45 0c             	add    0xc(%ebp),%eax
 13d:	8b 00                	mov    (%eax),%eax
 13f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 146:	00 
 147:	89 04 24             	mov    %eax,(%esp)
 14a:	e8 19 03 00 00       	call   468 <open>
 14f:	89 44 24 18          	mov    %eax,0x18(%esp)
 153:	83 7c 24 18 00       	cmpl   $0x0,0x18(%esp)
 158:	79 29                	jns    183 <main+0x82>
      printf(1, "wc: cannot open %s\n", argv[i]);
 15a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 15e:	c1 e0 02             	shl    $0x2,%eax
 161:	03 45 0c             	add    0xc(%ebp),%eax
 164:	8b 00                	mov    (%eax),%eax
 166:	89 44 24 08          	mov    %eax,0x8(%esp)
 16a:	c7 44 24 04 46 0d 00 	movl   $0xd46,0x4(%esp)
 171:	00 
 172:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 179:	e8 4b 04 00 00       	call   5c9 <printf>
      exit();
 17e:	e8 a5 02 00 00       	call   428 <exit>
    }
    wc(fd, argv[i]);
 183:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 187:	c1 e0 02             	shl    $0x2,%eax
 18a:	03 45 0c             	add    0xc(%ebp),%eax
 18d:	8b 00                	mov    (%eax),%eax
 18f:	89 44 24 04          	mov    %eax,0x4(%esp)
 193:	8b 44 24 18          	mov    0x18(%esp),%eax
 197:	89 04 24             	mov    %eax,(%esp)
 19a:	e8 61 fe ff ff       	call   0 <wc>
    close(fd);
 19f:	8b 44 24 18          	mov    0x18(%esp),%eax
 1a3:	89 04 24             	mov    %eax,(%esp)
 1a6:	e8 a5 02 00 00       	call   450 <close>
  if(argc <= 1){
    wc(0, "");
    exit();
  }

  for(i = 1; i < argc; i++){
 1ab:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 1b0:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1b4:	3b 45 08             	cmp    0x8(%ebp),%eax
 1b7:	0f 8c 76 ff ff ff    	jl     133 <main+0x32>
      exit();
    }
    wc(fd, argv[i]);
    close(fd);
  }
  exit();
 1bd:	e8 66 02 00 00       	call   428 <exit>
 1c2:	90                   	nop
 1c3:	90                   	nop

000001c4 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 1c4:	55                   	push   %ebp
 1c5:	89 e5                	mov    %esp,%ebp
 1c7:	57                   	push   %edi
 1c8:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 1c9:	8b 4d 08             	mov    0x8(%ebp),%ecx
 1cc:	8b 55 10             	mov    0x10(%ebp),%edx
 1cf:	8b 45 0c             	mov    0xc(%ebp),%eax
 1d2:	89 cb                	mov    %ecx,%ebx
 1d4:	89 df                	mov    %ebx,%edi
 1d6:	89 d1                	mov    %edx,%ecx
 1d8:	fc                   	cld    
 1d9:	f3 aa                	rep stos %al,%es:(%edi)
 1db:	89 ca                	mov    %ecx,%edx
 1dd:	89 fb                	mov    %edi,%ebx
 1df:	89 5d 08             	mov    %ebx,0x8(%ebp)
 1e2:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 1e5:	5b                   	pop    %ebx
 1e6:	5f                   	pop    %edi
 1e7:	5d                   	pop    %ebp
 1e8:	c3                   	ret    

000001e9 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 1e9:	55                   	push   %ebp
 1ea:	89 e5                	mov    %esp,%ebp
 1ec:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 1ef:	8b 45 08             	mov    0x8(%ebp),%eax
 1f2:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 1f5:	8b 45 0c             	mov    0xc(%ebp),%eax
 1f8:	0f b6 10             	movzbl (%eax),%edx
 1fb:	8b 45 08             	mov    0x8(%ebp),%eax
 1fe:	88 10                	mov    %dl,(%eax)
 200:	8b 45 08             	mov    0x8(%ebp),%eax
 203:	0f b6 00             	movzbl (%eax),%eax
 206:	84 c0                	test   %al,%al
 208:	0f 95 c0             	setne  %al
 20b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 20f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 213:	84 c0                	test   %al,%al
 215:	75 de                	jne    1f5 <strcpy+0xc>
    ;
  return os;
 217:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 21a:	c9                   	leave  
 21b:	c3                   	ret    

0000021c <strcmp>:

int
strcmp(const char *p, const char *q)
{
 21c:	55                   	push   %ebp
 21d:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 21f:	eb 08                	jmp    229 <strcmp+0xd>
    p++, q++;
 221:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 225:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 229:	8b 45 08             	mov    0x8(%ebp),%eax
 22c:	0f b6 00             	movzbl (%eax),%eax
 22f:	84 c0                	test   %al,%al
 231:	74 10                	je     243 <strcmp+0x27>
 233:	8b 45 08             	mov    0x8(%ebp),%eax
 236:	0f b6 10             	movzbl (%eax),%edx
 239:	8b 45 0c             	mov    0xc(%ebp),%eax
 23c:	0f b6 00             	movzbl (%eax),%eax
 23f:	38 c2                	cmp    %al,%dl
 241:	74 de                	je     221 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 243:	8b 45 08             	mov    0x8(%ebp),%eax
 246:	0f b6 00             	movzbl (%eax),%eax
 249:	0f b6 d0             	movzbl %al,%edx
 24c:	8b 45 0c             	mov    0xc(%ebp),%eax
 24f:	0f b6 00             	movzbl (%eax),%eax
 252:	0f b6 c0             	movzbl %al,%eax
 255:	89 d1                	mov    %edx,%ecx
 257:	29 c1                	sub    %eax,%ecx
 259:	89 c8                	mov    %ecx,%eax
}
 25b:	5d                   	pop    %ebp
 25c:	c3                   	ret    

0000025d <strlen>:

uint
strlen(char *s)
{
 25d:	55                   	push   %ebp
 25e:	89 e5                	mov    %esp,%ebp
 260:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 263:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 26a:	eb 04                	jmp    270 <strlen+0x13>
 26c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 270:	8b 45 fc             	mov    -0x4(%ebp),%eax
 273:	03 45 08             	add    0x8(%ebp),%eax
 276:	0f b6 00             	movzbl (%eax),%eax
 279:	84 c0                	test   %al,%al
 27b:	75 ef                	jne    26c <strlen+0xf>
    ;
  return n;
 27d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 280:	c9                   	leave  
 281:	c3                   	ret    

00000282 <memset>:

void*
memset(void *dst, int c, uint n)
{
 282:	55                   	push   %ebp
 283:	89 e5                	mov    %esp,%ebp
 285:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 288:	8b 45 10             	mov    0x10(%ebp),%eax
 28b:	89 44 24 08          	mov    %eax,0x8(%esp)
 28f:	8b 45 0c             	mov    0xc(%ebp),%eax
 292:	89 44 24 04          	mov    %eax,0x4(%esp)
 296:	8b 45 08             	mov    0x8(%ebp),%eax
 299:	89 04 24             	mov    %eax,(%esp)
 29c:	e8 23 ff ff ff       	call   1c4 <stosb>
  return dst;
 2a1:	8b 45 08             	mov    0x8(%ebp),%eax
}
 2a4:	c9                   	leave  
 2a5:	c3                   	ret    

000002a6 <strchr>:

char*
strchr(const char *s, char c)
{
 2a6:	55                   	push   %ebp
 2a7:	89 e5                	mov    %esp,%ebp
 2a9:	83 ec 04             	sub    $0x4,%esp
 2ac:	8b 45 0c             	mov    0xc(%ebp),%eax
 2af:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 2b2:	eb 14                	jmp    2c8 <strchr+0x22>
    if(*s == c)
 2b4:	8b 45 08             	mov    0x8(%ebp),%eax
 2b7:	0f b6 00             	movzbl (%eax),%eax
 2ba:	3a 45 fc             	cmp    -0x4(%ebp),%al
 2bd:	75 05                	jne    2c4 <strchr+0x1e>
      return (char*)s;
 2bf:	8b 45 08             	mov    0x8(%ebp),%eax
 2c2:	eb 13                	jmp    2d7 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 2c4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 2c8:	8b 45 08             	mov    0x8(%ebp),%eax
 2cb:	0f b6 00             	movzbl (%eax),%eax
 2ce:	84 c0                	test   %al,%al
 2d0:	75 e2                	jne    2b4 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 2d2:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2d7:	c9                   	leave  
 2d8:	c3                   	ret    

000002d9 <gets>:

char*
gets(char *buf, int max)
{
 2d9:	55                   	push   %ebp
 2da:	89 e5                	mov    %esp,%ebp
 2dc:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 2df:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 2e6:	eb 44                	jmp    32c <gets+0x53>
    cc = read(0, &c, 1);
 2e8:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 2ef:	00 
 2f0:	8d 45 ef             	lea    -0x11(%ebp),%eax
 2f3:	89 44 24 04          	mov    %eax,0x4(%esp)
 2f7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 2fe:	e8 3d 01 00 00       	call   440 <read>
 303:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 306:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 30a:	7e 2d                	jle    339 <gets+0x60>
      break;
    buf[i++] = c;
 30c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 30f:	03 45 08             	add    0x8(%ebp),%eax
 312:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 316:	88 10                	mov    %dl,(%eax)
 318:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 31c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 320:	3c 0a                	cmp    $0xa,%al
 322:	74 16                	je     33a <gets+0x61>
 324:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 328:	3c 0d                	cmp    $0xd,%al
 32a:	74 0e                	je     33a <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 32c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 32f:	83 c0 01             	add    $0x1,%eax
 332:	3b 45 0c             	cmp    0xc(%ebp),%eax
 335:	7c b1                	jl     2e8 <gets+0xf>
 337:	eb 01                	jmp    33a <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 339:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 33a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 33d:	03 45 08             	add    0x8(%ebp),%eax
 340:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 343:	8b 45 08             	mov    0x8(%ebp),%eax
}
 346:	c9                   	leave  
 347:	c3                   	ret    

00000348 <stat>:

int
stat(char *n, struct stat *st)
{
 348:	55                   	push   %ebp
 349:	89 e5                	mov    %esp,%ebp
 34b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 34e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 355:	00 
 356:	8b 45 08             	mov    0x8(%ebp),%eax
 359:	89 04 24             	mov    %eax,(%esp)
 35c:	e8 07 01 00 00       	call   468 <open>
 361:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 364:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 368:	79 07                	jns    371 <stat+0x29>
    return -1;
 36a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 36f:	eb 23                	jmp    394 <stat+0x4c>
  r = fstat(fd, st);
 371:	8b 45 0c             	mov    0xc(%ebp),%eax
 374:	89 44 24 04          	mov    %eax,0x4(%esp)
 378:	8b 45 f0             	mov    -0x10(%ebp),%eax
 37b:	89 04 24             	mov    %eax,(%esp)
 37e:	e8 fd 00 00 00       	call   480 <fstat>
 383:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 386:	8b 45 f0             	mov    -0x10(%ebp),%eax
 389:	89 04 24             	mov    %eax,(%esp)
 38c:	e8 bf 00 00 00       	call   450 <close>
  return r;
 391:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 394:	c9                   	leave  
 395:	c3                   	ret    

00000396 <atoi>:

int
atoi(const char *s)
{
 396:	55                   	push   %ebp
 397:	89 e5                	mov    %esp,%ebp
 399:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 39c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 3a3:	eb 24                	jmp    3c9 <atoi+0x33>
    n = n*10 + *s++ - '0';
 3a5:	8b 55 fc             	mov    -0x4(%ebp),%edx
 3a8:	89 d0                	mov    %edx,%eax
 3aa:	c1 e0 02             	shl    $0x2,%eax
 3ad:	01 d0                	add    %edx,%eax
 3af:	01 c0                	add    %eax,%eax
 3b1:	89 c2                	mov    %eax,%edx
 3b3:	8b 45 08             	mov    0x8(%ebp),%eax
 3b6:	0f b6 00             	movzbl (%eax),%eax
 3b9:	0f be c0             	movsbl %al,%eax
 3bc:	8d 04 02             	lea    (%edx,%eax,1),%eax
 3bf:	83 e8 30             	sub    $0x30,%eax
 3c2:	89 45 fc             	mov    %eax,-0x4(%ebp)
 3c5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 3c9:	8b 45 08             	mov    0x8(%ebp),%eax
 3cc:	0f b6 00             	movzbl (%eax),%eax
 3cf:	3c 2f                	cmp    $0x2f,%al
 3d1:	7e 0a                	jle    3dd <atoi+0x47>
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	0f b6 00             	movzbl (%eax),%eax
 3d9:	3c 39                	cmp    $0x39,%al
 3db:	7e c8                	jle    3a5 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 3dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3e0:	c9                   	leave  
 3e1:	c3                   	ret    

000003e2 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 3e2:	55                   	push   %ebp
 3e3:	89 e5                	mov    %esp,%ebp
 3e5:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 3e8:	8b 45 08             	mov    0x8(%ebp),%eax
 3eb:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 3ee:	8b 45 0c             	mov    0xc(%ebp),%eax
 3f1:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 3f4:	eb 13                	jmp    409 <memmove+0x27>
    *dst++ = *src++;
 3f6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3f9:	0f b6 10             	movzbl (%eax),%edx
 3fc:	8b 45 f8             	mov    -0x8(%ebp),%eax
 3ff:	88 10                	mov    %dl,(%eax)
 401:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 405:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 409:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 40d:	0f 9f c0             	setg   %al
 410:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 414:	84 c0                	test   %al,%al
 416:	75 de                	jne    3f6 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 418:	8b 45 08             	mov    0x8(%ebp),%eax
}
 41b:	c9                   	leave  
 41c:	c3                   	ret    
 41d:	90                   	nop
 41e:	90                   	nop
 41f:	90                   	nop

00000420 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 420:	b8 01 00 00 00       	mov    $0x1,%eax
 425:	cd 40                	int    $0x40
 427:	c3                   	ret    

00000428 <exit>:
SYSCALL(exit)
 428:	b8 02 00 00 00       	mov    $0x2,%eax
 42d:	cd 40                	int    $0x40
 42f:	c3                   	ret    

00000430 <wait>:
SYSCALL(wait)
 430:	b8 03 00 00 00       	mov    $0x3,%eax
 435:	cd 40                	int    $0x40
 437:	c3                   	ret    

00000438 <pipe>:
SYSCALL(pipe)
 438:	b8 04 00 00 00       	mov    $0x4,%eax
 43d:	cd 40                	int    $0x40
 43f:	c3                   	ret    

00000440 <read>:
SYSCALL(read)
 440:	b8 05 00 00 00       	mov    $0x5,%eax
 445:	cd 40                	int    $0x40
 447:	c3                   	ret    

00000448 <write>:
SYSCALL(write)
 448:	b8 10 00 00 00       	mov    $0x10,%eax
 44d:	cd 40                	int    $0x40
 44f:	c3                   	ret    

00000450 <close>:
SYSCALL(close)
 450:	b8 15 00 00 00       	mov    $0x15,%eax
 455:	cd 40                	int    $0x40
 457:	c3                   	ret    

00000458 <kill>:
SYSCALL(kill)
 458:	b8 06 00 00 00       	mov    $0x6,%eax
 45d:	cd 40                	int    $0x40
 45f:	c3                   	ret    

00000460 <exec>:
SYSCALL(exec)
 460:	b8 07 00 00 00       	mov    $0x7,%eax
 465:	cd 40                	int    $0x40
 467:	c3                   	ret    

00000468 <open>:
SYSCALL(open)
 468:	b8 0f 00 00 00       	mov    $0xf,%eax
 46d:	cd 40                	int    $0x40
 46f:	c3                   	ret    

00000470 <mknod>:
SYSCALL(mknod)
 470:	b8 11 00 00 00       	mov    $0x11,%eax
 475:	cd 40                	int    $0x40
 477:	c3                   	ret    

00000478 <unlink>:
SYSCALL(unlink)
 478:	b8 12 00 00 00       	mov    $0x12,%eax
 47d:	cd 40                	int    $0x40
 47f:	c3                   	ret    

00000480 <fstat>:
SYSCALL(fstat)
 480:	b8 08 00 00 00       	mov    $0x8,%eax
 485:	cd 40                	int    $0x40
 487:	c3                   	ret    

00000488 <link>:
SYSCALL(link)
 488:	b8 13 00 00 00       	mov    $0x13,%eax
 48d:	cd 40                	int    $0x40
 48f:	c3                   	ret    

00000490 <mkdir>:
SYSCALL(mkdir)
 490:	b8 14 00 00 00       	mov    $0x14,%eax
 495:	cd 40                	int    $0x40
 497:	c3                   	ret    

00000498 <chdir>:
SYSCALL(chdir)
 498:	b8 09 00 00 00       	mov    $0x9,%eax
 49d:	cd 40                	int    $0x40
 49f:	c3                   	ret    

000004a0 <dup>:
SYSCALL(dup)
 4a0:	b8 0a 00 00 00       	mov    $0xa,%eax
 4a5:	cd 40                	int    $0x40
 4a7:	c3                   	ret    

000004a8 <getpid>:
SYSCALL(getpid)
 4a8:	b8 0b 00 00 00       	mov    $0xb,%eax
 4ad:	cd 40                	int    $0x40
 4af:	c3                   	ret    

000004b0 <sbrk>:
SYSCALL(sbrk)
 4b0:	b8 0c 00 00 00       	mov    $0xc,%eax
 4b5:	cd 40                	int    $0x40
 4b7:	c3                   	ret    

000004b8 <sleep>:
SYSCALL(sleep)
 4b8:	b8 0d 00 00 00       	mov    $0xd,%eax
 4bd:	cd 40                	int    $0x40
 4bf:	c3                   	ret    

000004c0 <uptime>:
SYSCALL(uptime)
 4c0:	b8 0e 00 00 00       	mov    $0xe,%eax
 4c5:	cd 40                	int    $0x40
 4c7:	c3                   	ret    

000004c8 <clone>:
SYSCALL(clone)
 4c8:	b8 16 00 00 00       	mov    $0x16,%eax
 4cd:	cd 40                	int    $0x40
 4cf:	c3                   	ret    

000004d0 <texit>:
SYSCALL(texit)
 4d0:	b8 17 00 00 00       	mov    $0x17,%eax
 4d5:	cd 40                	int    $0x40
 4d7:	c3                   	ret    

000004d8 <tsleep>:
SYSCALL(tsleep)
 4d8:	b8 18 00 00 00       	mov    $0x18,%eax
 4dd:	cd 40                	int    $0x40
 4df:	c3                   	ret    

000004e0 <twakeup>:
SYSCALL(twakeup)
 4e0:	b8 19 00 00 00       	mov    $0x19,%eax
 4e5:	cd 40                	int    $0x40
 4e7:	c3                   	ret    

000004e8 <test>:
SYSCALL(test)
 4e8:	b8 1a 00 00 00       	mov    $0x1a,%eax
 4ed:	cd 40                	int    $0x40
 4ef:	c3                   	ret    

000004f0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 4f0:	55                   	push   %ebp
 4f1:	89 e5                	mov    %esp,%ebp
 4f3:	83 ec 28             	sub    $0x28,%esp
 4f6:	8b 45 0c             	mov    0xc(%ebp),%eax
 4f9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 4fc:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 503:	00 
 504:	8d 45 f4             	lea    -0xc(%ebp),%eax
 507:	89 44 24 04          	mov    %eax,0x4(%esp)
 50b:	8b 45 08             	mov    0x8(%ebp),%eax
 50e:	89 04 24             	mov    %eax,(%esp)
 511:	e8 32 ff ff ff       	call   448 <write>
}
 516:	c9                   	leave  
 517:	c3                   	ret    

00000518 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 518:	55                   	push   %ebp
 519:	89 e5                	mov    %esp,%ebp
 51b:	53                   	push   %ebx
 51c:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 51f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 526:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 52a:	74 17                	je     543 <printint+0x2b>
 52c:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 530:	79 11                	jns    543 <printint+0x2b>
    neg = 1;
 532:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 539:	8b 45 0c             	mov    0xc(%ebp),%eax
 53c:	f7 d8                	neg    %eax
 53e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 541:	eb 06                	jmp    549 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 543:	8b 45 0c             	mov    0xc(%ebp),%eax
 546:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 549:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 550:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 553:	8b 5d 10             	mov    0x10(%ebp),%ebx
 556:	8b 45 f4             	mov    -0xc(%ebp),%eax
 559:	ba 00 00 00 00       	mov    $0x0,%edx
 55e:	f7 f3                	div    %ebx
 560:	89 d0                	mov    %edx,%eax
 562:	0f b6 80 a4 0d 00 00 	movzbl 0xda4(%eax),%eax
 569:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 56d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 571:	8b 45 10             	mov    0x10(%ebp),%eax
 574:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 577:	8b 45 f4             	mov    -0xc(%ebp),%eax
 57a:	ba 00 00 00 00       	mov    $0x0,%edx
 57f:	f7 75 d4             	divl   -0x2c(%ebp)
 582:	89 45 f4             	mov    %eax,-0xc(%ebp)
 585:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 589:	75 c5                	jne    550 <printint+0x38>
  if(neg)
 58b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 58f:	74 28                	je     5b9 <printint+0xa1>
    buf[i++] = '-';
 591:	8b 45 ec             	mov    -0x14(%ebp),%eax
 594:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 599:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 59d:	eb 1a                	jmp    5b9 <printint+0xa1>
    putc(fd, buf[i]);
 59f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5a2:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 5a7:	0f be c0             	movsbl %al,%eax
 5aa:	89 44 24 04          	mov    %eax,0x4(%esp)
 5ae:	8b 45 08             	mov    0x8(%ebp),%eax
 5b1:	89 04 24             	mov    %eax,(%esp)
 5b4:	e8 37 ff ff ff       	call   4f0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 5b9:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 5bd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 5c1:	79 dc                	jns    59f <printint+0x87>
    putc(fd, buf[i]);
}
 5c3:	83 c4 44             	add    $0x44,%esp
 5c6:	5b                   	pop    %ebx
 5c7:	5d                   	pop    %ebp
 5c8:	c3                   	ret    

000005c9 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 5c9:	55                   	push   %ebp
 5ca:	89 e5                	mov    %esp,%ebp
 5cc:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 5cf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 5d6:	8d 45 0c             	lea    0xc(%ebp),%eax
 5d9:	83 c0 04             	add    $0x4,%eax
 5dc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 5df:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 5e6:	e9 7e 01 00 00       	jmp    769 <printf+0x1a0>
    c = fmt[i] & 0xff;
 5eb:	8b 55 0c             	mov    0xc(%ebp),%edx
 5ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
 5f1:	8d 04 02             	lea    (%edx,%eax,1),%eax
 5f4:	0f b6 00             	movzbl (%eax),%eax
 5f7:	0f be c0             	movsbl %al,%eax
 5fa:	25 ff 00 00 00       	and    $0xff,%eax
 5ff:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 602:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 606:	75 2c                	jne    634 <printf+0x6b>
      if(c == '%'){
 608:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 60c:	75 0c                	jne    61a <printf+0x51>
        state = '%';
 60e:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 615:	e9 4b 01 00 00       	jmp    765 <printf+0x19c>
      } else {
        putc(fd, c);
 61a:	8b 45 e8             	mov    -0x18(%ebp),%eax
 61d:	0f be c0             	movsbl %al,%eax
 620:	89 44 24 04          	mov    %eax,0x4(%esp)
 624:	8b 45 08             	mov    0x8(%ebp),%eax
 627:	89 04 24             	mov    %eax,(%esp)
 62a:	e8 c1 fe ff ff       	call   4f0 <putc>
 62f:	e9 31 01 00 00       	jmp    765 <printf+0x19c>
      }
    } else if(state == '%'){
 634:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 638:	0f 85 27 01 00 00    	jne    765 <printf+0x19c>
      if(c == 'd'){
 63e:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 642:	75 2d                	jne    671 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 644:	8b 45 f4             	mov    -0xc(%ebp),%eax
 647:	8b 00                	mov    (%eax),%eax
 649:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 650:	00 
 651:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 658:	00 
 659:	89 44 24 04          	mov    %eax,0x4(%esp)
 65d:	8b 45 08             	mov    0x8(%ebp),%eax
 660:	89 04 24             	mov    %eax,(%esp)
 663:	e8 b0 fe ff ff       	call   518 <printint>
        ap++;
 668:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 66c:	e9 ed 00 00 00       	jmp    75e <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 671:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 675:	74 06                	je     67d <printf+0xb4>
 677:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 67b:	75 2d                	jne    6aa <printf+0xe1>
        printint(fd, *ap, 16, 0);
 67d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 680:	8b 00                	mov    (%eax),%eax
 682:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 689:	00 
 68a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 691:	00 
 692:	89 44 24 04          	mov    %eax,0x4(%esp)
 696:	8b 45 08             	mov    0x8(%ebp),%eax
 699:	89 04 24             	mov    %eax,(%esp)
 69c:	e8 77 fe ff ff       	call   518 <printint>
        ap++;
 6a1:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 6a5:	e9 b4 00 00 00       	jmp    75e <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 6aa:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 6ae:	75 46                	jne    6f6 <printf+0x12d>
        s = (char*)*ap;
 6b0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6b3:	8b 00                	mov    (%eax),%eax
 6b5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 6b8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 6bc:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 6c0:	75 27                	jne    6e9 <printf+0x120>
          s = "(null)";
 6c2:	c7 45 e4 5a 0d 00 00 	movl   $0xd5a,-0x1c(%ebp)
        while(*s != 0){
 6c9:	eb 1f                	jmp    6ea <printf+0x121>
          putc(fd, *s);
 6cb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ce:	0f b6 00             	movzbl (%eax),%eax
 6d1:	0f be c0             	movsbl %al,%eax
 6d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 6d8:	8b 45 08             	mov    0x8(%ebp),%eax
 6db:	89 04 24             	mov    %eax,(%esp)
 6de:	e8 0d fe ff ff       	call   4f0 <putc>
          s++;
 6e3:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 6e7:	eb 01                	jmp    6ea <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 6e9:	90                   	nop
 6ea:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 6ed:	0f b6 00             	movzbl (%eax),%eax
 6f0:	84 c0                	test   %al,%al
 6f2:	75 d7                	jne    6cb <printf+0x102>
 6f4:	eb 68                	jmp    75e <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 6f6:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 6fa:	75 1d                	jne    719 <printf+0x150>
        putc(fd, *ap);
 6fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ff:	8b 00                	mov    (%eax),%eax
 701:	0f be c0             	movsbl %al,%eax
 704:	89 44 24 04          	mov    %eax,0x4(%esp)
 708:	8b 45 08             	mov    0x8(%ebp),%eax
 70b:	89 04 24             	mov    %eax,(%esp)
 70e:	e8 dd fd ff ff       	call   4f0 <putc>
        ap++;
 713:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 717:	eb 45                	jmp    75e <printf+0x195>
      } else if(c == '%'){
 719:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 71d:	75 17                	jne    736 <printf+0x16d>
        putc(fd, c);
 71f:	8b 45 e8             	mov    -0x18(%ebp),%eax
 722:	0f be c0             	movsbl %al,%eax
 725:	89 44 24 04          	mov    %eax,0x4(%esp)
 729:	8b 45 08             	mov    0x8(%ebp),%eax
 72c:	89 04 24             	mov    %eax,(%esp)
 72f:	e8 bc fd ff ff       	call   4f0 <putc>
 734:	eb 28                	jmp    75e <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 736:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 73d:	00 
 73e:	8b 45 08             	mov    0x8(%ebp),%eax
 741:	89 04 24             	mov    %eax,(%esp)
 744:	e8 a7 fd ff ff       	call   4f0 <putc>
        putc(fd, c);
 749:	8b 45 e8             	mov    -0x18(%ebp),%eax
 74c:	0f be c0             	movsbl %al,%eax
 74f:	89 44 24 04          	mov    %eax,0x4(%esp)
 753:	8b 45 08             	mov    0x8(%ebp),%eax
 756:	89 04 24             	mov    %eax,(%esp)
 759:	e8 92 fd ff ff       	call   4f0 <putc>
      }
      state = 0;
 75e:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 765:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 769:	8b 55 0c             	mov    0xc(%ebp),%edx
 76c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 76f:	8d 04 02             	lea    (%edx,%eax,1),%eax
 772:	0f b6 00             	movzbl (%eax),%eax
 775:	84 c0                	test   %al,%al
 777:	0f 85 6e fe ff ff    	jne    5eb <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 77d:	c9                   	leave  
 77e:	c3                   	ret    
 77f:	90                   	nop

00000780 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 780:	55                   	push   %ebp
 781:	89 e5                	mov    %esp,%ebp
 783:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 786:	8b 45 08             	mov    0x8(%ebp),%eax
 789:	83 e8 08             	sub    $0x8,%eax
 78c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 78f:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 794:	89 45 fc             	mov    %eax,-0x4(%ebp)
 797:	eb 24                	jmp    7bd <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 799:	8b 45 fc             	mov    -0x4(%ebp),%eax
 79c:	8b 00                	mov    (%eax),%eax
 79e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a1:	77 12                	ja     7b5 <free+0x35>
 7a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7a6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7a9:	77 24                	ja     7cf <free+0x4f>
 7ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ae:	8b 00                	mov    (%eax),%eax
 7b0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7b3:	77 1a                	ja     7cf <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 7b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7b8:	8b 00                	mov    (%eax),%eax
 7ba:	89 45 fc             	mov    %eax,-0x4(%ebp)
 7bd:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7c0:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 7c3:	76 d4                	jbe    799 <free+0x19>
 7c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7c8:	8b 00                	mov    (%eax),%eax
 7ca:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 7cd:	76 ca                	jbe    799 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 7cf:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7d2:	8b 40 04             	mov    0x4(%eax),%eax
 7d5:	c1 e0 03             	shl    $0x3,%eax
 7d8:	89 c2                	mov    %eax,%edx
 7da:	03 55 f8             	add    -0x8(%ebp),%edx
 7dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7e0:	8b 00                	mov    (%eax),%eax
 7e2:	39 c2                	cmp    %eax,%edx
 7e4:	75 24                	jne    80a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 7e6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7e9:	8b 50 04             	mov    0x4(%eax),%edx
 7ec:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ef:	8b 00                	mov    (%eax),%eax
 7f1:	8b 40 04             	mov    0x4(%eax),%eax
 7f4:	01 c2                	add    %eax,%edx
 7f6:	8b 45 f8             	mov    -0x8(%ebp),%eax
 7f9:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 7fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 7ff:	8b 00                	mov    (%eax),%eax
 801:	8b 10                	mov    (%eax),%edx
 803:	8b 45 f8             	mov    -0x8(%ebp),%eax
 806:	89 10                	mov    %edx,(%eax)
 808:	eb 0a                	jmp    814 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 80a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 80d:	8b 10                	mov    (%eax),%edx
 80f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 812:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 814:	8b 45 fc             	mov    -0x4(%ebp),%eax
 817:	8b 40 04             	mov    0x4(%eax),%eax
 81a:	c1 e0 03             	shl    $0x3,%eax
 81d:	03 45 fc             	add    -0x4(%ebp),%eax
 820:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 823:	75 20                	jne    845 <free+0xc5>
    p->s.size += bp->s.size;
 825:	8b 45 fc             	mov    -0x4(%ebp),%eax
 828:	8b 50 04             	mov    0x4(%eax),%edx
 82b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 82e:	8b 40 04             	mov    0x4(%eax),%eax
 831:	01 c2                	add    %eax,%edx
 833:	8b 45 fc             	mov    -0x4(%ebp),%eax
 836:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 839:	8b 45 f8             	mov    -0x8(%ebp),%eax
 83c:	8b 10                	mov    (%eax),%edx
 83e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 841:	89 10                	mov    %edx,(%eax)
 843:	eb 08                	jmp    84d <free+0xcd>
  } else
    p->s.ptr = bp;
 845:	8b 45 fc             	mov    -0x4(%ebp),%eax
 848:	8b 55 f8             	mov    -0x8(%ebp),%edx
 84b:	89 10                	mov    %edx,(%eax)
  freep = p;
 84d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 850:	a3 c8 0d 00 00       	mov    %eax,0xdc8
}
 855:	c9                   	leave  
 856:	c3                   	ret    

00000857 <morecore>:

static Header*
morecore(uint nu)
{
 857:	55                   	push   %ebp
 858:	89 e5                	mov    %esp,%ebp
 85a:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 85d:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 864:	77 07                	ja     86d <morecore+0x16>
    nu = 4096;
 866:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 86d:	8b 45 08             	mov    0x8(%ebp),%eax
 870:	c1 e0 03             	shl    $0x3,%eax
 873:	89 04 24             	mov    %eax,(%esp)
 876:	e8 35 fc ff ff       	call   4b0 <sbrk>
 87b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 87e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 882:	75 07                	jne    88b <morecore+0x34>
    return 0;
 884:	b8 00 00 00 00       	mov    $0x0,%eax
 889:	eb 22                	jmp    8ad <morecore+0x56>
  hp = (Header*)p;
 88b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 88e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 891:	8b 45 f4             	mov    -0xc(%ebp),%eax
 894:	8b 55 08             	mov    0x8(%ebp),%edx
 897:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 89a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89d:	83 c0 08             	add    $0x8,%eax
 8a0:	89 04 24             	mov    %eax,(%esp)
 8a3:	e8 d8 fe ff ff       	call   780 <free>
  return freep;
 8a8:	a1 c8 0d 00 00       	mov    0xdc8,%eax
}
 8ad:	c9                   	leave  
 8ae:	c3                   	ret    

000008af <malloc>:

void*
malloc(uint nbytes)
{
 8af:	55                   	push   %ebp
 8b0:	89 e5                	mov    %esp,%ebp
 8b2:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 8b5:	8b 45 08             	mov    0x8(%ebp),%eax
 8b8:	83 c0 07             	add    $0x7,%eax
 8bb:	c1 e8 03             	shr    $0x3,%eax
 8be:	83 c0 01             	add    $0x1,%eax
 8c1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 8c4:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 8c9:	89 45 f0             	mov    %eax,-0x10(%ebp)
 8cc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 8d0:	75 23                	jne    8f5 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 8d2:	c7 45 f0 c0 0d 00 00 	movl   $0xdc0,-0x10(%ebp)
 8d9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8dc:	a3 c8 0d 00 00       	mov    %eax,0xdc8
 8e1:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 8e6:	a3 c0 0d 00 00       	mov    %eax,0xdc0
    base.s.size = 0;
 8eb:	c7 05 c4 0d 00 00 00 	movl   $0x0,0xdc4
 8f2:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 8f5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 8f8:	8b 00                	mov    (%eax),%eax
 8fa:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 8fd:	8b 45 ec             	mov    -0x14(%ebp),%eax
 900:	8b 40 04             	mov    0x4(%eax),%eax
 903:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 906:	72 4d                	jb     955 <malloc+0xa6>
      if(p->s.size == nunits)
 908:	8b 45 ec             	mov    -0x14(%ebp),%eax
 90b:	8b 40 04             	mov    0x4(%eax),%eax
 90e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 911:	75 0c                	jne    91f <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 913:	8b 45 ec             	mov    -0x14(%ebp),%eax
 916:	8b 10                	mov    (%eax),%edx
 918:	8b 45 f0             	mov    -0x10(%ebp),%eax
 91b:	89 10                	mov    %edx,(%eax)
 91d:	eb 26                	jmp    945 <malloc+0x96>
      else {
        p->s.size -= nunits;
 91f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 922:	8b 40 04             	mov    0x4(%eax),%eax
 925:	89 c2                	mov    %eax,%edx
 927:	2b 55 f4             	sub    -0xc(%ebp),%edx
 92a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 92d:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 930:	8b 45 ec             	mov    -0x14(%ebp),%eax
 933:	8b 40 04             	mov    0x4(%eax),%eax
 936:	c1 e0 03             	shl    $0x3,%eax
 939:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 93c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 93f:	8b 55 f4             	mov    -0xc(%ebp),%edx
 942:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 945:	8b 45 f0             	mov    -0x10(%ebp),%eax
 948:	a3 c8 0d 00 00       	mov    %eax,0xdc8
      return (void*)(p + 1);
 94d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 950:	83 c0 08             	add    $0x8,%eax
 953:	eb 38                	jmp    98d <malloc+0xde>
    }
    if(p == freep)
 955:	a1 c8 0d 00 00       	mov    0xdc8,%eax
 95a:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 95d:	75 1b                	jne    97a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 95f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 962:	89 04 24             	mov    %eax,(%esp)
 965:	e8 ed fe ff ff       	call   857 <morecore>
 96a:	89 45 ec             	mov    %eax,-0x14(%ebp)
 96d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 971:	75 07                	jne    97a <malloc+0xcb>
        return 0;
 973:	b8 00 00 00 00       	mov    $0x0,%eax
 978:	eb 13                	jmp    98d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 97a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 97d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 980:	8b 45 ec             	mov    -0x14(%ebp),%eax
 983:	8b 00                	mov    (%eax),%eax
 985:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 988:	e9 70 ff ff ff       	jmp    8fd <malloc+0x4e>
}
 98d:	c9                   	leave  
 98e:	c3                   	ret    
 98f:	90                   	nop

00000990 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 990:	55                   	push   %ebp
 991:	89 e5                	mov    %esp,%ebp
 993:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 996:	8b 55 08             	mov    0x8(%ebp),%edx
 999:	8b 45 0c             	mov    0xc(%ebp),%eax
 99c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 99f:	f0 87 02             	lock xchg %eax,(%edx)
 9a2:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 9a5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 9a8:	c9                   	leave  
 9a9:	c3                   	ret    

000009aa <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 9aa:	55                   	push   %ebp
 9ab:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 9ad:	8b 45 08             	mov    0x8(%ebp),%eax
 9b0:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 9b6:	5d                   	pop    %ebp
 9b7:	c3                   	ret    

000009b8 <lock_acquire>:
void lock_acquire(lock_t *lock){
 9b8:	55                   	push   %ebp
 9b9:	89 e5                	mov    %esp,%ebp
 9bb:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 9be:	8b 45 08             	mov    0x8(%ebp),%eax
 9c1:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 9c8:	00 
 9c9:	89 04 24             	mov    %eax,(%esp)
 9cc:	e8 bf ff ff ff       	call   990 <xchg>
 9d1:	85 c0                	test   %eax,%eax
 9d3:	75 e9                	jne    9be <lock_acquire+0x6>
}
 9d5:	c9                   	leave  
 9d6:	c3                   	ret    

000009d7 <lock_release>:
void lock_release(lock_t *lock){
 9d7:	55                   	push   %ebp
 9d8:	89 e5                	mov    %esp,%ebp
 9da:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 9dd:	8b 45 08             	mov    0x8(%ebp),%eax
 9e0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 9e7:	00 
 9e8:	89 04 24             	mov    %eax,(%esp)
 9eb:	e8 a0 ff ff ff       	call   990 <xchg>
}
 9f0:	c9                   	leave  
 9f1:	c3                   	ret    

000009f2 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 9f2:	55                   	push   %ebp
 9f3:	89 e5                	mov    %esp,%ebp
 9f5:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 9f8:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 9ff:	e8 ab fe ff ff       	call   8af <malloc>
 a04:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 a07:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a0a:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 a0d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a10:	25 ff 0f 00 00       	and    $0xfff,%eax
 a15:	85 c0                	test   %eax,%eax
 a17:	74 15                	je     a2e <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 a19:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a1c:	89 c2                	mov    %eax,%edx
 a1e:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 a24:	b8 00 10 00 00       	mov    $0x1000,%eax
 a29:	29 d0                	sub    %edx,%eax
 a2b:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 a2e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a32:	75 1b                	jne    a4f <thread_create+0x5d>

        printf(1,"malloc fail \n");
 a34:	c7 44 24 04 61 0d 00 	movl   $0xd61,0x4(%esp)
 a3b:	00 
 a3c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a43:	e8 81 fb ff ff       	call   5c9 <printf>
        return 0;
 a48:	b8 00 00 00 00       	mov    $0x0,%eax
 a4d:	eb 6f                	jmp    abe <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 a4f:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 a52:	8b 55 08             	mov    0x8(%ebp),%edx
 a55:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a58:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 a5c:	89 54 24 08          	mov    %edx,0x8(%esp)
 a60:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 a67:	00 
 a68:	89 04 24             	mov    %eax,(%esp)
 a6b:	e8 58 fa ff ff       	call   4c8 <clone>
 a70:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 a73:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a77:	79 1b                	jns    a94 <thread_create+0xa2>
        printf(1,"clone fails\n");
 a79:	c7 44 24 04 6f 0d 00 	movl   $0xd6f,0x4(%esp)
 a80:	00 
 a81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 a88:	e8 3c fb ff ff       	call   5c9 <printf>
        return 0;
 a8d:	b8 00 00 00 00       	mov    $0x0,%eax
 a92:	eb 2a                	jmp    abe <thread_create+0xcc>
    }
    if(tid > 0){
 a94:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 a98:	7e 05                	jle    a9f <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 a9a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a9d:	eb 1f                	jmp    abe <thread_create+0xcc>
    }
    if(tid == 0){
 a9f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 aa3:	75 14                	jne    ab9 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 aa5:	c7 44 24 04 7c 0d 00 	movl   $0xd7c,0x4(%esp)
 aac:	00 
 aad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ab4:	e8 10 fb ff ff       	call   5c9 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 ab9:	b8 00 00 00 00       	mov    $0x0,%eax
}
 abe:	c9                   	leave  
 abf:	c3                   	ret    

00000ac0 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 ac0:	55                   	push   %ebp
 ac1:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 ac3:	8b 45 08             	mov    0x8(%ebp),%eax
 ac6:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 acc:	8b 45 08             	mov    0x8(%ebp),%eax
 acf:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 ad6:	8b 45 08             	mov    0x8(%ebp),%eax
 ad9:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 ae0:	5d                   	pop    %ebp
 ae1:	c3                   	ret    

00000ae2 <add_q>:

void add_q(struct queue *q, int v){
 ae2:	55                   	push   %ebp
 ae3:	89 e5                	mov    %esp,%ebp
 ae5:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 ae8:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 aef:	e8 bb fd ff ff       	call   8af <malloc>
 af4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 afa:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 b01:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b04:	8b 55 0c             	mov    0xc(%ebp),%edx
 b07:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 b09:	8b 45 08             	mov    0x8(%ebp),%eax
 b0c:	8b 40 04             	mov    0x4(%eax),%eax
 b0f:	85 c0                	test   %eax,%eax
 b11:	75 0b                	jne    b1e <add_q+0x3c>
        q->head = n;
 b13:	8b 45 08             	mov    0x8(%ebp),%eax
 b16:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b19:	89 50 04             	mov    %edx,0x4(%eax)
 b1c:	eb 0c                	jmp    b2a <add_q+0x48>
    }else{
        q->tail->next = n;
 b1e:	8b 45 08             	mov    0x8(%ebp),%eax
 b21:	8b 40 08             	mov    0x8(%eax),%eax
 b24:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b27:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 b2a:	8b 45 08             	mov    0x8(%ebp),%eax
 b2d:	8b 55 f4             	mov    -0xc(%ebp),%edx
 b30:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 b33:	8b 45 08             	mov    0x8(%ebp),%eax
 b36:	8b 00                	mov    (%eax),%eax
 b38:	8d 50 01             	lea    0x1(%eax),%edx
 b3b:	8b 45 08             	mov    0x8(%ebp),%eax
 b3e:	89 10                	mov    %edx,(%eax)
}
 b40:	c9                   	leave  
 b41:	c3                   	ret    

00000b42 <empty_q>:

int empty_q(struct queue *q){
 b42:	55                   	push   %ebp
 b43:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 b45:	8b 45 08             	mov    0x8(%ebp),%eax
 b48:	8b 00                	mov    (%eax),%eax
 b4a:	85 c0                	test   %eax,%eax
 b4c:	75 07                	jne    b55 <empty_q+0x13>
        return 1;
 b4e:	b8 01 00 00 00       	mov    $0x1,%eax
 b53:	eb 05                	jmp    b5a <empty_q+0x18>
    else
        return 0;
 b55:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 b5a:	5d                   	pop    %ebp
 b5b:	c3                   	ret    

00000b5c <pop_q>:
int pop_q(struct queue *q){
 b5c:	55                   	push   %ebp
 b5d:	89 e5                	mov    %esp,%ebp
 b5f:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 b62:	8b 45 08             	mov    0x8(%ebp),%eax
 b65:	89 04 24             	mov    %eax,(%esp)
 b68:	e8 d5 ff ff ff       	call   b42 <empty_q>
 b6d:	85 c0                	test   %eax,%eax
 b6f:	75 5d                	jne    bce <pop_q+0x72>
       val = q->head->value; 
 b71:	8b 45 08             	mov    0x8(%ebp),%eax
 b74:	8b 40 04             	mov    0x4(%eax),%eax
 b77:	8b 00                	mov    (%eax),%eax
 b79:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 b7c:	8b 45 08             	mov    0x8(%ebp),%eax
 b7f:	8b 40 04             	mov    0x4(%eax),%eax
 b82:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 b85:	8b 45 08             	mov    0x8(%ebp),%eax
 b88:	8b 40 04             	mov    0x4(%eax),%eax
 b8b:	8b 50 04             	mov    0x4(%eax),%edx
 b8e:	8b 45 08             	mov    0x8(%ebp),%eax
 b91:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 b94:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b97:	89 04 24             	mov    %eax,(%esp)
 b9a:	e8 e1 fb ff ff       	call   780 <free>
       q->size--;
 b9f:	8b 45 08             	mov    0x8(%ebp),%eax
 ba2:	8b 00                	mov    (%eax),%eax
 ba4:	8d 50 ff             	lea    -0x1(%eax),%edx
 ba7:	8b 45 08             	mov    0x8(%ebp),%eax
 baa:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 bac:	8b 45 08             	mov    0x8(%ebp),%eax
 baf:	8b 00                	mov    (%eax),%eax
 bb1:	85 c0                	test   %eax,%eax
 bb3:	75 14                	jne    bc9 <pop_q+0x6d>
            q->head = 0;
 bb5:	8b 45 08             	mov    0x8(%ebp),%eax
 bb8:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 bbf:	8b 45 08             	mov    0x8(%ebp),%eax
 bc2:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 bc9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bcc:	eb 05                	jmp    bd3 <pop_q+0x77>
    }
    return -1;
 bce:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 bd3:	c9                   	leave  
 bd4:	c3                   	ret    
 bd5:	90                   	nop
 bd6:	90                   	nop
 bd7:	90                   	nop

00000bd8 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 bd8:	55                   	push   %ebp
 bd9:	89 e5                	mov    %esp,%ebp
 bdb:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 bde:	8b 45 08             	mov    0x8(%ebp),%eax
 be1:	8b 55 0c             	mov    0xc(%ebp),%edx
 be4:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 be7:	8b 45 08             	mov    0x8(%ebp),%eax
 bea:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 bf1:	8b 45 08             	mov    0x8(%ebp),%eax
 bf4:	89 04 24             	mov    %eax,(%esp)
 bf7:	e8 ae fd ff ff       	call   9aa <lock_init>
}
 bfc:	c9                   	leave  
 bfd:	c3                   	ret    

00000bfe <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 bfe:	55                   	push   %ebp
 bff:	89 e5                	mov    %esp,%ebp
 c01:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 c04:	8b 45 08             	mov    0x8(%ebp),%eax
 c07:	89 04 24             	mov    %eax,(%esp)
 c0a:	e8 a9 fd ff ff       	call   9b8 <lock_acquire>
	if(s->count  == 0){
 c0f:	8b 45 08             	mov    0x8(%ebp),%eax
 c12:	8b 40 04             	mov    0x4(%eax),%eax
 c15:	85 c0                	test   %eax,%eax
 c17:	75 43                	jne    c5c <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 c19:	c7 44 24 04 8d 0d 00 	movl   $0xd8d,0x4(%esp)
 c20:	00 
 c21:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c28:	e8 9c f9 ff ff       	call   5c9 <printf>
		//add proc to waiters list
		int tid = getpid();
 c2d:	e8 76 f8 ff ff       	call   4a8 <getpid>
 c32:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 c35:	8b 45 08             	mov    0x8(%ebp),%eax
 c38:	8d 50 0c             	lea    0xc(%eax),%edx
 c3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c3e:	89 44 24 04          	mov    %eax,0x4(%esp)
 c42:	89 14 24             	mov    %edx,(%esp)
 c45:	e8 98 fe ff ff       	call   ae2 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 c4a:	8b 45 08             	mov    0x8(%ebp),%eax
 c4d:	89 04 24             	mov    %eax,(%esp)
 c50:	e8 82 fd ff ff       	call   9d7 <lock_release>
		tsleep(); 
 c55:	e8 7e f8 ff ff       	call   4d8 <tsleep>
 c5a:	eb 2e                	jmp    c8a <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 c5c:	c7 44 24 04 94 0d 00 	movl   $0xd94,0x4(%esp)
 c63:	00 
 c64:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c6b:	e8 59 f9 ff ff       	call   5c9 <printf>
		s->count--;	
 c70:	8b 45 08             	mov    0x8(%ebp),%eax
 c73:	8b 40 04             	mov    0x4(%eax),%eax
 c76:	8d 50 ff             	lea    -0x1(%eax),%edx
 c79:	8b 45 08             	mov    0x8(%ebp),%eax
 c7c:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 c7f:	8b 45 08             	mov    0x8(%ebp),%eax
 c82:	89 04 24             	mov    %eax,(%esp)
 c85:	e8 4d fd ff ff       	call   9d7 <lock_release>
	}
}
 c8a:	c9                   	leave  
 c8b:	c3                   	ret    

00000c8c <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 c8c:	55                   	push   %ebp
 c8d:	89 e5                	mov    %esp,%ebp
 c8f:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 c92:	c7 44 24 04 9b 0d 00 	movl   $0xd9b,0x4(%esp)
 c99:	00 
 c9a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 ca1:	e8 23 f9 ff ff       	call   5c9 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 ca6:	8b 45 08             	mov    0x8(%ebp),%eax
 ca9:	89 04 24             	mov    %eax,(%esp)
 cac:	e8 07 fd ff ff       	call   9b8 <lock_acquire>
	if(s->count < s->size){
 cb1:	8b 45 08             	mov    0x8(%ebp),%eax
 cb4:	8b 50 04             	mov    0x4(%eax),%edx
 cb7:	8b 45 08             	mov    0x8(%ebp),%eax
 cba:	8b 40 08             	mov    0x8(%eax),%eax
 cbd:	39 c2                	cmp    %eax,%edx
 cbf:	7d 0f                	jge    cd0 <sem_signal+0x44>
		s->count++;	
 cc1:	8b 45 08             	mov    0x8(%ebp),%eax
 cc4:	8b 40 04             	mov    0x4(%eax),%eax
 cc7:	8d 50 01             	lea    0x1(%eax),%edx
 cca:	8b 45 08             	mov    0x8(%ebp),%eax
 ccd:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 cd0:	8b 45 08             	mov    0x8(%ebp),%eax
 cd3:	83 c0 0c             	add    $0xc,%eax
 cd6:	89 04 24             	mov    %eax,(%esp)
 cd9:	e8 7e fe ff ff       	call   b5c <pop_q>
 cde:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 ce1:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 ce5:	74 2e                	je     d15 <sem_signal+0x89>
		printf(1, "Sem A\n");
 ce7:	c7 44 24 04 94 0d 00 	movl   $0xd94,0x4(%esp)
 cee:	00 
 cef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 cf6:	e8 ce f8 ff ff       	call   5c9 <printf>
		twakeup(tid);
 cfb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cfe:	89 04 24             	mov    %eax,(%esp)
 d01:	e8 da f7 ff ff       	call   4e0 <twakeup>
		s->count--;
 d06:	8b 45 08             	mov    0x8(%ebp),%eax
 d09:	8b 40 04             	mov    0x4(%eax),%eax
 d0c:	8d 50 ff             	lea    -0x1(%eax),%edx
 d0f:	8b 45 08             	mov    0x8(%ebp),%eax
 d12:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 d15:	8b 45 08             	mov    0x8(%ebp),%eax
 d18:	89 04 24             	mov    %eax,(%esp)
 d1b:	e8 b7 fc ff ff       	call   9d7 <lock_release>

 d20:	c9                   	leave  
 d21:	c3                   	ret    
