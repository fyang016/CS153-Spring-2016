
_grep:     file format elf32-i386


Disassembly of section .text:

00000000 <grep>:
char buf[1024];
int match(char*, char*);

void
grep(char *pattern, int fd)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	83 ec 28             	sub    $0x28,%esp
  int n, m;
  char *p, *q;
  
  m = 0;
   6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
   d:	e9 bf 00 00 00       	jmp    d1 <grep+0xd1>
    m += n;
  12:	8b 45 e8             	mov    -0x18(%ebp),%eax
  15:	01 45 ec             	add    %eax,-0x14(%ebp)
    p = buf;
  18:	c7 45 f0 e0 0c 00 00 	movl   $0xce0,-0x10(%ebp)
    while((q = strchr(p, '\n')) != 0){
  1f:	eb 53                	jmp    74 <grep+0x74>
      *q = 0;
  21:	8b 45 f4             	mov    -0xc(%ebp),%eax
  24:	c6 00 00             	movb   $0x0,(%eax)
      if(match(pattern, p)){
  27:	8b 45 f0             	mov    -0x10(%ebp),%eax
  2a:	89 44 24 04          	mov    %eax,0x4(%esp)
  2e:	8b 45 08             	mov    0x8(%ebp),%eax
  31:	89 04 24             	mov    %eax,(%esp)
  34:	e8 b1 01 00 00       	call   1ea <match>
  39:	85 c0                	test   %eax,%eax
  3b:	74 2e                	je     6b <grep+0x6b>
        *q = '\n';
  3d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  40:	c6 00 0a             	movb   $0xa,(%eax)
        write(1, p, q+1 - p);
  43:	8b 45 f4             	mov    -0xc(%ebp),%eax
  46:	83 c0 01             	add    $0x1,%eax
  49:	89 c2                	mov    %eax,%edx
  4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  4e:	89 d1                	mov    %edx,%ecx
  50:	29 c1                	sub    %eax,%ecx
  52:	89 c8                	mov    %ecx,%eax
  54:	89 44 24 08          	mov    %eax,0x8(%esp)
  58:	8b 45 f0             	mov    -0x10(%ebp),%eax
  5b:	89 44 24 04          	mov    %eax,0x4(%esp)
  5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  66:	e8 69 05 00 00       	call   5d4 <write>
      }
      p = q+1;
  6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  6e:	83 c0 01             	add    $0x1,%eax
  71:	89 45 f0             	mov    %eax,-0x10(%ebp)
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
    m += n;
    p = buf;
    while((q = strchr(p, '\n')) != 0){
  74:	c7 44 24 04 0a 00 00 	movl   $0xa,0x4(%esp)
  7b:	00 
  7c:	8b 45 f0             	mov    -0x10(%ebp),%eax
  7f:	89 04 24             	mov    %eax,(%esp)
  82:	e8 ab 03 00 00       	call   432 <strchr>
  87:	89 45 f4             	mov    %eax,-0xc(%ebp)
  8a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  8e:	75 91                	jne    21 <grep+0x21>
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
  90:	81 7d f0 e0 0c 00 00 	cmpl   $0xce0,-0x10(%ebp)
  97:	75 07                	jne    a0 <grep+0xa0>
      m = 0;
  99:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    if(m > 0){
  a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  a4:	7e 2b                	jle    d1 <grep+0xd1>
      m -= p - buf;
  a6:	ba e0 0c 00 00       	mov    $0xce0,%edx
  ab:	8b 45 f0             	mov    -0x10(%ebp),%eax
  ae:	89 d1                	mov    %edx,%ecx
  b0:	29 c1                	sub    %eax,%ecx
  b2:	89 c8                	mov    %ecx,%eax
  b4:	01 45 ec             	add    %eax,-0x14(%ebp)
      memmove(buf, p, m);
  b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
  ba:	89 44 24 08          	mov    %eax,0x8(%esp)
  be:	8b 45 f0             	mov    -0x10(%ebp),%eax
  c1:	89 44 24 04          	mov    %eax,0x4(%esp)
  c5:	c7 04 24 e0 0c 00 00 	movl   $0xce0,(%esp)
  cc:	e8 9d 04 00 00       	call   56e <memmove>
{
  int n, m;
  char *p, *q;
  
  m = 0;
  while((n = read(fd, buf+m, sizeof(buf)-m)) > 0){
  d1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  d4:	ba 00 04 00 00       	mov    $0x400,%edx
  d9:	89 d1                	mov    %edx,%ecx
  db:	29 c1                	sub    %eax,%ecx
  dd:	89 c8                	mov    %ecx,%eax
  df:	8b 55 ec             	mov    -0x14(%ebp),%edx
  e2:	81 c2 e0 0c 00 00    	add    $0xce0,%edx
  e8:	89 44 24 08          	mov    %eax,0x8(%esp)
  ec:	89 54 24 04          	mov    %edx,0x4(%esp)
  f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  f3:	89 04 24             	mov    %eax,(%esp)
  f6:	e8 d1 04 00 00       	call   5cc <read>
  fb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  fe:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
 102:	0f 8f 0a ff ff ff    	jg     12 <grep+0x12>
    if(m > 0){
      m -= p - buf;
      memmove(buf, p, m);
    }
  }
}
 108:	c9                   	leave  
 109:	c3                   	ret    

0000010a <main>:

int
main(int argc, char *argv[])
{
 10a:	55                   	push   %ebp
 10b:	89 e5                	mov    %esp,%ebp
 10d:	83 e4 f0             	and    $0xfffffff0,%esp
 110:	83 ec 20             	sub    $0x20,%esp
  int fd, i;
  char *pattern;
  
  if(argc <= 1){
 113:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 117:	7f 19                	jg     132 <main+0x28>
    printf(2, "usage: grep pattern [file ...]\n");
 119:	c7 44 24 04 38 0c 00 	movl   $0xc38,0x4(%esp)
 120:	00 
 121:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 128:	e8 10 06 00 00       	call   73d <printf>
    exit();
 12d:	e8 82 04 00 00       	call   5b4 <exit>
  }
  pattern = argv[1];
 132:	8b 45 0c             	mov    0xc(%ebp),%eax
 135:	83 c0 04             	add    $0x4,%eax
 138:	8b 00                	mov    (%eax),%eax
 13a:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  
  if(argc <= 2){
 13e:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 142:	7f 19                	jg     15d <main+0x53>
    grep(pattern, 0);
 144:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 14b:	00 
 14c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 150:	89 04 24             	mov    %eax,(%esp)
 153:	e8 a8 fe ff ff       	call   0 <grep>
    exit();
 158:	e8 57 04 00 00       	call   5b4 <exit>
  }

  for(i = 2; i < argc; i++){
 15d:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
 164:	00 
 165:	eb 75                	jmp    1dc <main+0xd2>
    if((fd = open(argv[i], 0)) < 0){
 167:	8b 44 24 18          	mov    0x18(%esp),%eax
 16b:	c1 e0 02             	shl    $0x2,%eax
 16e:	03 45 0c             	add    0xc(%ebp),%eax
 171:	8b 00                	mov    (%eax),%eax
 173:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 17a:	00 
 17b:	89 04 24             	mov    %eax,(%esp)
 17e:	e8 71 04 00 00       	call   5f4 <open>
 183:	89 44 24 14          	mov    %eax,0x14(%esp)
 187:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 18c:	79 29                	jns    1b7 <main+0xad>
      printf(1, "grep: cannot open %s\n", argv[i]);
 18e:	8b 44 24 18          	mov    0x18(%esp),%eax
 192:	c1 e0 02             	shl    $0x2,%eax
 195:	03 45 0c             	add    0xc(%ebp),%eax
 198:	8b 00                	mov    (%eax),%eax
 19a:	89 44 24 08          	mov    %eax,0x8(%esp)
 19e:	c7 44 24 04 58 0c 00 	movl   $0xc58,0x4(%esp)
 1a5:	00 
 1a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1ad:	e8 8b 05 00 00       	call   73d <printf>
      exit();
 1b2:	e8 fd 03 00 00       	call   5b4 <exit>
    }
    grep(pattern, fd);
 1b7:	8b 44 24 14          	mov    0x14(%esp),%eax
 1bb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1bf:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1c3:	89 04 24             	mov    %eax,(%esp)
 1c6:	e8 35 fe ff ff       	call   0 <grep>
    close(fd);
 1cb:	8b 44 24 14          	mov    0x14(%esp),%eax
 1cf:	89 04 24             	mov    %eax,(%esp)
 1d2:	e8 05 04 00 00       	call   5dc <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit();
  }

  for(i = 2; i < argc; i++){
 1d7:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
 1dc:	8b 44 24 18          	mov    0x18(%esp),%eax
 1e0:	3b 45 08             	cmp    0x8(%ebp),%eax
 1e3:	7c 82                	jl     167 <main+0x5d>
      exit();
    }
    grep(pattern, fd);
    close(fd);
  }
  exit();
 1e5:	e8 ca 03 00 00       	call   5b4 <exit>

000001ea <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 1ea:	55                   	push   %ebp
 1eb:	89 e5                	mov    %esp,%ebp
 1ed:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '^')
 1f0:	8b 45 08             	mov    0x8(%ebp),%eax
 1f3:	0f b6 00             	movzbl (%eax),%eax
 1f6:	3c 5e                	cmp    $0x5e,%al
 1f8:	75 17                	jne    211 <match+0x27>
    return matchhere(re+1, text);
 1fa:	8b 45 08             	mov    0x8(%ebp),%eax
 1fd:	8d 50 01             	lea    0x1(%eax),%edx
 200:	8b 45 0c             	mov    0xc(%ebp),%eax
 203:	89 44 24 04          	mov    %eax,0x4(%esp)
 207:	89 14 24             	mov    %edx,(%esp)
 20a:	e8 39 00 00 00       	call   248 <matchhere>
 20f:	eb 35                	jmp    246 <match+0x5c>
  do{  // must look at empty string
    if(matchhere(re, text))
 211:	8b 45 0c             	mov    0xc(%ebp),%eax
 214:	89 44 24 04          	mov    %eax,0x4(%esp)
 218:	8b 45 08             	mov    0x8(%ebp),%eax
 21b:	89 04 24             	mov    %eax,(%esp)
 21e:	e8 25 00 00 00       	call   248 <matchhere>
 223:	85 c0                	test   %eax,%eax
 225:	74 07                	je     22e <match+0x44>
      return 1;
 227:	b8 01 00 00 00       	mov    $0x1,%eax
 22c:	eb 18                	jmp    246 <match+0x5c>
  }while(*text++ != '\0');
 22e:	8b 45 0c             	mov    0xc(%ebp),%eax
 231:	0f b6 00             	movzbl (%eax),%eax
 234:	84 c0                	test   %al,%al
 236:	0f 95 c0             	setne  %al
 239:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 23d:	84 c0                	test   %al,%al
 23f:	75 d0                	jne    211 <match+0x27>
  return 0;
 241:	b8 00 00 00 00       	mov    $0x0,%eax
}
 246:	c9                   	leave  
 247:	c3                   	ret    

00000248 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 248:	55                   	push   %ebp
 249:	89 e5                	mov    %esp,%ebp
 24b:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '\0')
 24e:	8b 45 08             	mov    0x8(%ebp),%eax
 251:	0f b6 00             	movzbl (%eax),%eax
 254:	84 c0                	test   %al,%al
 256:	75 0a                	jne    262 <matchhere+0x1a>
    return 1;
 258:	b8 01 00 00 00       	mov    $0x1,%eax
 25d:	e9 9b 00 00 00       	jmp    2fd <matchhere+0xb5>
  if(re[1] == '*')
 262:	8b 45 08             	mov    0x8(%ebp),%eax
 265:	83 c0 01             	add    $0x1,%eax
 268:	0f b6 00             	movzbl (%eax),%eax
 26b:	3c 2a                	cmp    $0x2a,%al
 26d:	75 24                	jne    293 <matchhere+0x4b>
    return matchstar(re[0], re+2, text);
 26f:	8b 45 08             	mov    0x8(%ebp),%eax
 272:	8d 48 02             	lea    0x2(%eax),%ecx
 275:	8b 45 08             	mov    0x8(%ebp),%eax
 278:	0f b6 00             	movzbl (%eax),%eax
 27b:	0f be c0             	movsbl %al,%eax
 27e:	8b 55 0c             	mov    0xc(%ebp),%edx
 281:	89 54 24 08          	mov    %edx,0x8(%esp)
 285:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 289:	89 04 24             	mov    %eax,(%esp)
 28c:	e8 6e 00 00 00       	call   2ff <matchstar>
 291:	eb 6a                	jmp    2fd <matchhere+0xb5>
  if(re[0] == '$' && re[1] == '\0')
 293:	8b 45 08             	mov    0x8(%ebp),%eax
 296:	0f b6 00             	movzbl (%eax),%eax
 299:	3c 24                	cmp    $0x24,%al
 29b:	75 1d                	jne    2ba <matchhere+0x72>
 29d:	8b 45 08             	mov    0x8(%ebp),%eax
 2a0:	83 c0 01             	add    $0x1,%eax
 2a3:	0f b6 00             	movzbl (%eax),%eax
 2a6:	84 c0                	test   %al,%al
 2a8:	75 10                	jne    2ba <matchhere+0x72>
    return *text == '\0';
 2aa:	8b 45 0c             	mov    0xc(%ebp),%eax
 2ad:	0f b6 00             	movzbl (%eax),%eax
 2b0:	84 c0                	test   %al,%al
 2b2:	0f 94 c0             	sete   %al
 2b5:	0f b6 c0             	movzbl %al,%eax
 2b8:	eb 43                	jmp    2fd <matchhere+0xb5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 2ba:	8b 45 0c             	mov    0xc(%ebp),%eax
 2bd:	0f b6 00             	movzbl (%eax),%eax
 2c0:	84 c0                	test   %al,%al
 2c2:	74 34                	je     2f8 <matchhere+0xb0>
 2c4:	8b 45 08             	mov    0x8(%ebp),%eax
 2c7:	0f b6 00             	movzbl (%eax),%eax
 2ca:	3c 2e                	cmp    $0x2e,%al
 2cc:	74 10                	je     2de <matchhere+0x96>
 2ce:	8b 45 08             	mov    0x8(%ebp),%eax
 2d1:	0f b6 10             	movzbl (%eax),%edx
 2d4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2d7:	0f b6 00             	movzbl (%eax),%eax
 2da:	38 c2                	cmp    %al,%dl
 2dc:	75 1a                	jne    2f8 <matchhere+0xb0>
    return matchhere(re+1, text+1);
 2de:	8b 45 0c             	mov    0xc(%ebp),%eax
 2e1:	8d 50 01             	lea    0x1(%eax),%edx
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	83 c0 01             	add    $0x1,%eax
 2ea:	89 54 24 04          	mov    %edx,0x4(%esp)
 2ee:	89 04 24             	mov    %eax,(%esp)
 2f1:	e8 52 ff ff ff       	call   248 <matchhere>
 2f6:	eb 05                	jmp    2fd <matchhere+0xb5>
  return 0;
 2f8:	b8 00 00 00 00       	mov    $0x0,%eax
}
 2fd:	c9                   	leave  
 2fe:	c3                   	ret    

000002ff <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
 2ff:	55                   	push   %ebp
 300:	89 e5                	mov    %esp,%ebp
 302:	83 ec 18             	sub    $0x18,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 305:	8b 45 10             	mov    0x10(%ebp),%eax
 308:	89 44 24 04          	mov    %eax,0x4(%esp)
 30c:	8b 45 0c             	mov    0xc(%ebp),%eax
 30f:	89 04 24             	mov    %eax,(%esp)
 312:	e8 31 ff ff ff       	call   248 <matchhere>
 317:	85 c0                	test   %eax,%eax
 319:	74 07                	je     322 <matchstar+0x23>
      return 1;
 31b:	b8 01 00 00 00       	mov    $0x1,%eax
 320:	eb 2c                	jmp    34e <matchstar+0x4f>
  }while(*text!='\0' && (*text++==c || c=='.'));
 322:	8b 45 10             	mov    0x10(%ebp),%eax
 325:	0f b6 00             	movzbl (%eax),%eax
 328:	84 c0                	test   %al,%al
 32a:	74 1d                	je     349 <matchstar+0x4a>
 32c:	8b 45 10             	mov    0x10(%ebp),%eax
 32f:	0f b6 00             	movzbl (%eax),%eax
 332:	0f be c0             	movsbl %al,%eax
 335:	3b 45 08             	cmp    0x8(%ebp),%eax
 338:	0f 94 c0             	sete   %al
 33b:	83 45 10 01          	addl   $0x1,0x10(%ebp)
 33f:	84 c0                	test   %al,%al
 341:	75 c2                	jne    305 <matchstar+0x6>
 343:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
 347:	74 bc                	je     305 <matchstar+0x6>
  return 0;
 349:	b8 00 00 00 00       	mov    $0x0,%eax
}
 34e:	c9                   	leave  
 34f:	c3                   	ret    

00000350 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 350:	55                   	push   %ebp
 351:	89 e5                	mov    %esp,%ebp
 353:	57                   	push   %edi
 354:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 355:	8b 4d 08             	mov    0x8(%ebp),%ecx
 358:	8b 55 10             	mov    0x10(%ebp),%edx
 35b:	8b 45 0c             	mov    0xc(%ebp),%eax
 35e:	89 cb                	mov    %ecx,%ebx
 360:	89 df                	mov    %ebx,%edi
 362:	89 d1                	mov    %edx,%ecx
 364:	fc                   	cld    
 365:	f3 aa                	rep stos %al,%es:(%edi)
 367:	89 ca                	mov    %ecx,%edx
 369:	89 fb                	mov    %edi,%ebx
 36b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 36e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 371:	5b                   	pop    %ebx
 372:	5f                   	pop    %edi
 373:	5d                   	pop    %ebp
 374:	c3                   	ret    

00000375 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 375:	55                   	push   %ebp
 376:	89 e5                	mov    %esp,%ebp
 378:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 37b:	8b 45 08             	mov    0x8(%ebp),%eax
 37e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 381:	8b 45 0c             	mov    0xc(%ebp),%eax
 384:	0f b6 10             	movzbl (%eax),%edx
 387:	8b 45 08             	mov    0x8(%ebp),%eax
 38a:	88 10                	mov    %dl,(%eax)
 38c:	8b 45 08             	mov    0x8(%ebp),%eax
 38f:	0f b6 00             	movzbl (%eax),%eax
 392:	84 c0                	test   %al,%al
 394:	0f 95 c0             	setne  %al
 397:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 39b:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 39f:	84 c0                	test   %al,%al
 3a1:	75 de                	jne    381 <strcpy+0xc>
    ;
  return os;
 3a3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3a6:	c9                   	leave  
 3a7:	c3                   	ret    

000003a8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3a8:	55                   	push   %ebp
 3a9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3ab:	eb 08                	jmp    3b5 <strcmp+0xd>
    p++, q++;
 3ad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3b5:	8b 45 08             	mov    0x8(%ebp),%eax
 3b8:	0f b6 00             	movzbl (%eax),%eax
 3bb:	84 c0                	test   %al,%al
 3bd:	74 10                	je     3cf <strcmp+0x27>
 3bf:	8b 45 08             	mov    0x8(%ebp),%eax
 3c2:	0f b6 10             	movzbl (%eax),%edx
 3c5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3c8:	0f b6 00             	movzbl (%eax),%eax
 3cb:	38 c2                	cmp    %al,%dl
 3cd:	74 de                	je     3ad <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3cf:	8b 45 08             	mov    0x8(%ebp),%eax
 3d2:	0f b6 00             	movzbl (%eax),%eax
 3d5:	0f b6 d0             	movzbl %al,%edx
 3d8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3db:	0f b6 00             	movzbl (%eax),%eax
 3de:	0f b6 c0             	movzbl %al,%eax
 3e1:	89 d1                	mov    %edx,%ecx
 3e3:	29 c1                	sub    %eax,%ecx
 3e5:	89 c8                	mov    %ecx,%eax
}
 3e7:	5d                   	pop    %ebp
 3e8:	c3                   	ret    

000003e9 <strlen>:

uint
strlen(char *s)
{
 3e9:	55                   	push   %ebp
 3ea:	89 e5                	mov    %esp,%ebp
 3ec:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3ef:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3f6:	eb 04                	jmp    3fc <strlen+0x13>
 3f8:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 3fc:	8b 45 fc             	mov    -0x4(%ebp),%eax
 3ff:	03 45 08             	add    0x8(%ebp),%eax
 402:	0f b6 00             	movzbl (%eax),%eax
 405:	84 c0                	test   %al,%al
 407:	75 ef                	jne    3f8 <strlen+0xf>
    ;
  return n;
 409:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 40c:	c9                   	leave  
 40d:	c3                   	ret    

0000040e <memset>:

void*
memset(void *dst, int c, uint n)
{
 40e:	55                   	push   %ebp
 40f:	89 e5                	mov    %esp,%ebp
 411:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 414:	8b 45 10             	mov    0x10(%ebp),%eax
 417:	89 44 24 08          	mov    %eax,0x8(%esp)
 41b:	8b 45 0c             	mov    0xc(%ebp),%eax
 41e:	89 44 24 04          	mov    %eax,0x4(%esp)
 422:	8b 45 08             	mov    0x8(%ebp),%eax
 425:	89 04 24             	mov    %eax,(%esp)
 428:	e8 23 ff ff ff       	call   350 <stosb>
  return dst;
 42d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 430:	c9                   	leave  
 431:	c3                   	ret    

00000432 <strchr>:

char*
strchr(const char *s, char c)
{
 432:	55                   	push   %ebp
 433:	89 e5                	mov    %esp,%ebp
 435:	83 ec 04             	sub    $0x4,%esp
 438:	8b 45 0c             	mov    0xc(%ebp),%eax
 43b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 43e:	eb 14                	jmp    454 <strchr+0x22>
    if(*s == c)
 440:	8b 45 08             	mov    0x8(%ebp),%eax
 443:	0f b6 00             	movzbl (%eax),%eax
 446:	3a 45 fc             	cmp    -0x4(%ebp),%al
 449:	75 05                	jne    450 <strchr+0x1e>
      return (char*)s;
 44b:	8b 45 08             	mov    0x8(%ebp),%eax
 44e:	eb 13                	jmp    463 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 450:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 454:	8b 45 08             	mov    0x8(%ebp),%eax
 457:	0f b6 00             	movzbl (%eax),%eax
 45a:	84 c0                	test   %al,%al
 45c:	75 e2                	jne    440 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 45e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 463:	c9                   	leave  
 464:	c3                   	ret    

00000465 <gets>:

char*
gets(char *buf, int max)
{
 465:	55                   	push   %ebp
 466:	89 e5                	mov    %esp,%ebp
 468:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 46b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 472:	eb 44                	jmp    4b8 <gets+0x53>
    cc = read(0, &c, 1);
 474:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 47b:	00 
 47c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 47f:	89 44 24 04          	mov    %eax,0x4(%esp)
 483:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 48a:	e8 3d 01 00 00       	call   5cc <read>
 48f:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 492:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 496:	7e 2d                	jle    4c5 <gets+0x60>
      break;
    buf[i++] = c;
 498:	8b 45 f0             	mov    -0x10(%ebp),%eax
 49b:	03 45 08             	add    0x8(%ebp),%eax
 49e:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 4a2:	88 10                	mov    %dl,(%eax)
 4a4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 4a8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4ac:	3c 0a                	cmp    $0xa,%al
 4ae:	74 16                	je     4c6 <gets+0x61>
 4b0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b4:	3c 0d                	cmp    $0xd,%al
 4b6:	74 0e                	je     4c6 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4bb:	83 c0 01             	add    $0x1,%eax
 4be:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4c1:	7c b1                	jl     474 <gets+0xf>
 4c3:	eb 01                	jmp    4c6 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 4c5:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4c6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4c9:	03 45 08             	add    0x8(%ebp),%eax
 4cc:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4cf:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4d2:	c9                   	leave  
 4d3:	c3                   	ret    

000004d4 <stat>:

int
stat(char *n, struct stat *st)
{
 4d4:	55                   	push   %ebp
 4d5:	89 e5                	mov    %esp,%ebp
 4d7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4da:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4e1:	00 
 4e2:	8b 45 08             	mov    0x8(%ebp),%eax
 4e5:	89 04 24             	mov    %eax,(%esp)
 4e8:	e8 07 01 00 00       	call   5f4 <open>
 4ed:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 4f0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4f4:	79 07                	jns    4fd <stat+0x29>
    return -1;
 4f6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4fb:	eb 23                	jmp    520 <stat+0x4c>
  r = fstat(fd, st);
 4fd:	8b 45 0c             	mov    0xc(%ebp),%eax
 500:	89 44 24 04          	mov    %eax,0x4(%esp)
 504:	8b 45 f0             	mov    -0x10(%ebp),%eax
 507:	89 04 24             	mov    %eax,(%esp)
 50a:	e8 fd 00 00 00       	call   60c <fstat>
 50f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 512:	8b 45 f0             	mov    -0x10(%ebp),%eax
 515:	89 04 24             	mov    %eax,(%esp)
 518:	e8 bf 00 00 00       	call   5dc <close>
  return r;
 51d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 520:	c9                   	leave  
 521:	c3                   	ret    

00000522 <atoi>:

int
atoi(const char *s)
{
 522:	55                   	push   %ebp
 523:	89 e5                	mov    %esp,%ebp
 525:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 528:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 52f:	eb 24                	jmp    555 <atoi+0x33>
    n = n*10 + *s++ - '0';
 531:	8b 55 fc             	mov    -0x4(%ebp),%edx
 534:	89 d0                	mov    %edx,%eax
 536:	c1 e0 02             	shl    $0x2,%eax
 539:	01 d0                	add    %edx,%eax
 53b:	01 c0                	add    %eax,%eax
 53d:	89 c2                	mov    %eax,%edx
 53f:	8b 45 08             	mov    0x8(%ebp),%eax
 542:	0f b6 00             	movzbl (%eax),%eax
 545:	0f be c0             	movsbl %al,%eax
 548:	8d 04 02             	lea    (%edx,%eax,1),%eax
 54b:	83 e8 30             	sub    $0x30,%eax
 54e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 551:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 555:	8b 45 08             	mov    0x8(%ebp),%eax
 558:	0f b6 00             	movzbl (%eax),%eax
 55b:	3c 2f                	cmp    $0x2f,%al
 55d:	7e 0a                	jle    569 <atoi+0x47>
 55f:	8b 45 08             	mov    0x8(%ebp),%eax
 562:	0f b6 00             	movzbl (%eax),%eax
 565:	3c 39                	cmp    $0x39,%al
 567:	7e c8                	jle    531 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 569:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 56c:	c9                   	leave  
 56d:	c3                   	ret    

0000056e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 56e:	55                   	push   %ebp
 56f:	89 e5                	mov    %esp,%ebp
 571:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 574:	8b 45 08             	mov    0x8(%ebp),%eax
 577:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 57a:	8b 45 0c             	mov    0xc(%ebp),%eax
 57d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 580:	eb 13                	jmp    595 <memmove+0x27>
    *dst++ = *src++;
 582:	8b 45 fc             	mov    -0x4(%ebp),%eax
 585:	0f b6 10             	movzbl (%eax),%edx
 588:	8b 45 f8             	mov    -0x8(%ebp),%eax
 58b:	88 10                	mov    %dl,(%eax)
 58d:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 591:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 595:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 599:	0f 9f c0             	setg   %al
 59c:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 5a0:	84 c0                	test   %al,%al
 5a2:	75 de                	jne    582 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5a4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5a7:	c9                   	leave  
 5a8:	c3                   	ret    
 5a9:	90                   	nop
 5aa:	90                   	nop
 5ab:	90                   	nop

000005ac <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5ac:	b8 01 00 00 00       	mov    $0x1,%eax
 5b1:	cd 40                	int    $0x40
 5b3:	c3                   	ret    

000005b4 <exit>:
SYSCALL(exit)
 5b4:	b8 02 00 00 00       	mov    $0x2,%eax
 5b9:	cd 40                	int    $0x40
 5bb:	c3                   	ret    

000005bc <wait>:
SYSCALL(wait)
 5bc:	b8 03 00 00 00       	mov    $0x3,%eax
 5c1:	cd 40                	int    $0x40
 5c3:	c3                   	ret    

000005c4 <pipe>:
SYSCALL(pipe)
 5c4:	b8 04 00 00 00       	mov    $0x4,%eax
 5c9:	cd 40                	int    $0x40
 5cb:	c3                   	ret    

000005cc <read>:
SYSCALL(read)
 5cc:	b8 05 00 00 00       	mov    $0x5,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <write>:
SYSCALL(write)
 5d4:	b8 10 00 00 00       	mov    $0x10,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <close>:
SYSCALL(close)
 5dc:	b8 15 00 00 00       	mov    $0x15,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <kill>:
SYSCALL(kill)
 5e4:	b8 06 00 00 00       	mov    $0x6,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <exec>:
SYSCALL(exec)
 5ec:	b8 07 00 00 00       	mov    $0x7,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <open>:
SYSCALL(open)
 5f4:	b8 0f 00 00 00       	mov    $0xf,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <mknod>:
SYSCALL(mknod)
 5fc:	b8 11 00 00 00       	mov    $0x11,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <unlink>:
SYSCALL(unlink)
 604:	b8 12 00 00 00       	mov    $0x12,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <fstat>:
SYSCALL(fstat)
 60c:	b8 08 00 00 00       	mov    $0x8,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <link>:
SYSCALL(link)
 614:	b8 13 00 00 00       	mov    $0x13,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <mkdir>:
SYSCALL(mkdir)
 61c:	b8 14 00 00 00       	mov    $0x14,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <chdir>:
SYSCALL(chdir)
 624:	b8 09 00 00 00       	mov    $0x9,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <dup>:
SYSCALL(dup)
 62c:	b8 0a 00 00 00       	mov    $0xa,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <getpid>:
SYSCALL(getpid)
 634:	b8 0b 00 00 00       	mov    $0xb,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <sbrk>:
SYSCALL(sbrk)
 63c:	b8 0c 00 00 00       	mov    $0xc,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <sleep>:
SYSCALL(sleep)
 644:	b8 0d 00 00 00       	mov    $0xd,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <uptime>:
SYSCALL(uptime)
 64c:	b8 0e 00 00 00       	mov    $0xe,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <clone>:
SYSCALL(clone)
 654:	b8 16 00 00 00       	mov    $0x16,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <texit>:
SYSCALL(texit)
 65c:	b8 17 00 00 00       	mov    $0x17,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 664:	55                   	push   %ebp
 665:	89 e5                	mov    %esp,%ebp
 667:	83 ec 28             	sub    $0x28,%esp
 66a:	8b 45 0c             	mov    0xc(%ebp),%eax
 66d:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 670:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 677:	00 
 678:	8d 45 f4             	lea    -0xc(%ebp),%eax
 67b:	89 44 24 04          	mov    %eax,0x4(%esp)
 67f:	8b 45 08             	mov    0x8(%ebp),%eax
 682:	89 04 24             	mov    %eax,(%esp)
 685:	e8 4a ff ff ff       	call   5d4 <write>
}
 68a:	c9                   	leave  
 68b:	c3                   	ret    

0000068c <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 68c:	55                   	push   %ebp
 68d:	89 e5                	mov    %esp,%ebp
 68f:	53                   	push   %ebx
 690:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 693:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 69a:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 69e:	74 17                	je     6b7 <printint+0x2b>
 6a0:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6a4:	79 11                	jns    6b7 <printint+0x2b>
    neg = 1;
 6a6:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6ad:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b0:	f7 d8                	neg    %eax
 6b2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6b5:	eb 06                	jmp    6bd <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6b7:	8b 45 0c             	mov    0xc(%ebp),%eax
 6ba:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 6bd:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 6c4:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 6c7:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6cd:	ba 00 00 00 00       	mov    $0x0,%edx
 6d2:	f7 f3                	div    %ebx
 6d4:	89 d0                	mov    %edx,%eax
 6d6:	0f b6 80 a4 0c 00 00 	movzbl 0xca4(%eax),%eax
 6dd:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 6e1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 6e5:	8b 45 10             	mov    0x10(%ebp),%eax
 6e8:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6ee:	ba 00 00 00 00       	mov    $0x0,%edx
 6f3:	f7 75 d4             	divl   -0x2c(%ebp)
 6f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 6fd:	75 c5                	jne    6c4 <printint+0x38>
  if(neg)
 6ff:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 703:	74 28                	je     72d <printint+0xa1>
    buf[i++] = '-';
 705:	8b 45 ec             	mov    -0x14(%ebp),%eax
 708:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 70d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 711:	eb 1a                	jmp    72d <printint+0xa1>
    putc(fd, buf[i]);
 713:	8b 45 ec             	mov    -0x14(%ebp),%eax
 716:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 71b:	0f be c0             	movsbl %al,%eax
 71e:	89 44 24 04          	mov    %eax,0x4(%esp)
 722:	8b 45 08             	mov    0x8(%ebp),%eax
 725:	89 04 24             	mov    %eax,(%esp)
 728:	e8 37 ff ff ff       	call   664 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 72d:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 731:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 735:	79 dc                	jns    713 <printint+0x87>
    putc(fd, buf[i]);
}
 737:	83 c4 44             	add    $0x44,%esp
 73a:	5b                   	pop    %ebx
 73b:	5d                   	pop    %ebp
 73c:	c3                   	ret    

0000073d <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 73d:	55                   	push   %ebp
 73e:	89 e5                	mov    %esp,%ebp
 740:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 743:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 74a:	8d 45 0c             	lea    0xc(%ebp),%eax
 74d:	83 c0 04             	add    $0x4,%eax
 750:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 753:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 75a:	e9 7e 01 00 00       	jmp    8dd <printf+0x1a0>
    c = fmt[i] & 0xff;
 75f:	8b 55 0c             	mov    0xc(%ebp),%edx
 762:	8b 45 ec             	mov    -0x14(%ebp),%eax
 765:	8d 04 02             	lea    (%edx,%eax,1),%eax
 768:	0f b6 00             	movzbl (%eax),%eax
 76b:	0f be c0             	movsbl %al,%eax
 76e:	25 ff 00 00 00       	and    $0xff,%eax
 773:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 776:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 77a:	75 2c                	jne    7a8 <printf+0x6b>
      if(c == '%'){
 77c:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 780:	75 0c                	jne    78e <printf+0x51>
        state = '%';
 782:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 789:	e9 4b 01 00 00       	jmp    8d9 <printf+0x19c>
      } else {
        putc(fd, c);
 78e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 791:	0f be c0             	movsbl %al,%eax
 794:	89 44 24 04          	mov    %eax,0x4(%esp)
 798:	8b 45 08             	mov    0x8(%ebp),%eax
 79b:	89 04 24             	mov    %eax,(%esp)
 79e:	e8 c1 fe ff ff       	call   664 <putc>
 7a3:	e9 31 01 00 00       	jmp    8d9 <printf+0x19c>
      }
    } else if(state == '%'){
 7a8:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 7ac:	0f 85 27 01 00 00    	jne    8d9 <printf+0x19c>
      if(c == 'd'){
 7b2:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 7b6:	75 2d                	jne    7e5 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 7b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bb:	8b 00                	mov    (%eax),%eax
 7bd:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7c4:	00 
 7c5:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7cc:	00 
 7cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d1:	8b 45 08             	mov    0x8(%ebp),%eax
 7d4:	89 04 24             	mov    %eax,(%esp)
 7d7:	e8 b0 fe ff ff       	call   68c <printint>
        ap++;
 7dc:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 7e0:	e9 ed 00 00 00       	jmp    8d2 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 7e5:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 7e9:	74 06                	je     7f1 <printf+0xb4>
 7eb:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 7ef:	75 2d                	jne    81e <printf+0xe1>
        printint(fd, *ap, 16, 0);
 7f1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f4:	8b 00                	mov    (%eax),%eax
 7f6:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 7fd:	00 
 7fe:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 805:	00 
 806:	89 44 24 04          	mov    %eax,0x4(%esp)
 80a:	8b 45 08             	mov    0x8(%ebp),%eax
 80d:	89 04 24             	mov    %eax,(%esp)
 810:	e8 77 fe ff ff       	call   68c <printint>
        ap++;
 815:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 819:	e9 b4 00 00 00       	jmp    8d2 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 81e:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 822:	75 46                	jne    86a <printf+0x12d>
        s = (char*)*ap;
 824:	8b 45 f4             	mov    -0xc(%ebp),%eax
 827:	8b 00                	mov    (%eax),%eax
 829:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 82c:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 830:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 834:	75 27                	jne    85d <printf+0x120>
          s = "(null)";
 836:	c7 45 e4 6e 0c 00 00 	movl   $0xc6e,-0x1c(%ebp)
        while(*s != 0){
 83d:	eb 1f                	jmp    85e <printf+0x121>
          putc(fd, *s);
 83f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 842:	0f b6 00             	movzbl (%eax),%eax
 845:	0f be c0             	movsbl %al,%eax
 848:	89 44 24 04          	mov    %eax,0x4(%esp)
 84c:	8b 45 08             	mov    0x8(%ebp),%eax
 84f:	89 04 24             	mov    %eax,(%esp)
 852:	e8 0d fe ff ff       	call   664 <putc>
          s++;
 857:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 85b:	eb 01                	jmp    85e <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 85d:	90                   	nop
 85e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 861:	0f b6 00             	movzbl (%eax),%eax
 864:	84 c0                	test   %al,%al
 866:	75 d7                	jne    83f <printf+0x102>
 868:	eb 68                	jmp    8d2 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 86a:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 86e:	75 1d                	jne    88d <printf+0x150>
        putc(fd, *ap);
 870:	8b 45 f4             	mov    -0xc(%ebp),%eax
 873:	8b 00                	mov    (%eax),%eax
 875:	0f be c0             	movsbl %al,%eax
 878:	89 44 24 04          	mov    %eax,0x4(%esp)
 87c:	8b 45 08             	mov    0x8(%ebp),%eax
 87f:	89 04 24             	mov    %eax,(%esp)
 882:	e8 dd fd ff ff       	call   664 <putc>
        ap++;
 887:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 88b:	eb 45                	jmp    8d2 <printf+0x195>
      } else if(c == '%'){
 88d:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 891:	75 17                	jne    8aa <printf+0x16d>
        putc(fd, c);
 893:	8b 45 e8             	mov    -0x18(%ebp),%eax
 896:	0f be c0             	movsbl %al,%eax
 899:	89 44 24 04          	mov    %eax,0x4(%esp)
 89d:	8b 45 08             	mov    0x8(%ebp),%eax
 8a0:	89 04 24             	mov    %eax,(%esp)
 8a3:	e8 bc fd ff ff       	call   664 <putc>
 8a8:	eb 28                	jmp    8d2 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8aa:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8b1:	00 
 8b2:	8b 45 08             	mov    0x8(%ebp),%eax
 8b5:	89 04 24             	mov    %eax,(%esp)
 8b8:	e8 a7 fd ff ff       	call   664 <putc>
        putc(fd, c);
 8bd:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8c0:	0f be c0             	movsbl %al,%eax
 8c3:	89 44 24 04          	mov    %eax,0x4(%esp)
 8c7:	8b 45 08             	mov    0x8(%ebp),%eax
 8ca:	89 04 24             	mov    %eax,(%esp)
 8cd:	e8 92 fd ff ff       	call   664 <putc>
      }
      state = 0;
 8d2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8d9:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 8dd:	8b 55 0c             	mov    0xc(%ebp),%edx
 8e0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8e3:	8d 04 02             	lea    (%edx,%eax,1),%eax
 8e6:	0f b6 00             	movzbl (%eax),%eax
 8e9:	84 c0                	test   %al,%al
 8eb:	0f 85 6e fe ff ff    	jne    75f <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8f1:	c9                   	leave  
 8f2:	c3                   	ret    
 8f3:	90                   	nop

000008f4 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f4:	55                   	push   %ebp
 8f5:	89 e5                	mov    %esp,%ebp
 8f7:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8fa:	8b 45 08             	mov    0x8(%ebp),%eax
 8fd:	83 e8 08             	sub    $0x8,%eax
 900:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 903:	a1 c8 0c 00 00       	mov    0xcc8,%eax
 908:	89 45 fc             	mov    %eax,-0x4(%ebp)
 90b:	eb 24                	jmp    931 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 90d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 910:	8b 00                	mov    (%eax),%eax
 912:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 915:	77 12                	ja     929 <free+0x35>
 917:	8b 45 f8             	mov    -0x8(%ebp),%eax
 91a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 91d:	77 24                	ja     943 <free+0x4f>
 91f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 922:	8b 00                	mov    (%eax),%eax
 924:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 927:	77 1a                	ja     943 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 929:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92c:	8b 00                	mov    (%eax),%eax
 92e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 931:	8b 45 f8             	mov    -0x8(%ebp),%eax
 934:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 937:	76 d4                	jbe    90d <free+0x19>
 939:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93c:	8b 00                	mov    (%eax),%eax
 93e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 941:	76 ca                	jbe    90d <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 943:	8b 45 f8             	mov    -0x8(%ebp),%eax
 946:	8b 40 04             	mov    0x4(%eax),%eax
 949:	c1 e0 03             	shl    $0x3,%eax
 94c:	89 c2                	mov    %eax,%edx
 94e:	03 55 f8             	add    -0x8(%ebp),%edx
 951:	8b 45 fc             	mov    -0x4(%ebp),%eax
 954:	8b 00                	mov    (%eax),%eax
 956:	39 c2                	cmp    %eax,%edx
 958:	75 24                	jne    97e <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 95a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95d:	8b 50 04             	mov    0x4(%eax),%edx
 960:	8b 45 fc             	mov    -0x4(%ebp),%eax
 963:	8b 00                	mov    (%eax),%eax
 965:	8b 40 04             	mov    0x4(%eax),%eax
 968:	01 c2                	add    %eax,%edx
 96a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 96d:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 970:	8b 45 fc             	mov    -0x4(%ebp),%eax
 973:	8b 00                	mov    (%eax),%eax
 975:	8b 10                	mov    (%eax),%edx
 977:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97a:	89 10                	mov    %edx,(%eax)
 97c:	eb 0a                	jmp    988 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 97e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 981:	8b 10                	mov    (%eax),%edx
 983:	8b 45 f8             	mov    -0x8(%ebp),%eax
 986:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 988:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98b:	8b 40 04             	mov    0x4(%eax),%eax
 98e:	c1 e0 03             	shl    $0x3,%eax
 991:	03 45 fc             	add    -0x4(%ebp),%eax
 994:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 997:	75 20                	jne    9b9 <free+0xc5>
    p->s.size += bp->s.size;
 999:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99c:	8b 50 04             	mov    0x4(%eax),%edx
 99f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9a2:	8b 40 04             	mov    0x4(%eax),%eax
 9a5:	01 c2                	add    %eax,%edx
 9a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9aa:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9ad:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9b0:	8b 10                	mov    (%eax),%edx
 9b2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b5:	89 10                	mov    %edx,(%eax)
 9b7:	eb 08                	jmp    9c1 <free+0xcd>
  } else
    p->s.ptr = bp;
 9b9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9bc:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9bf:	89 10                	mov    %edx,(%eax)
  freep = p;
 9c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c4:	a3 c8 0c 00 00       	mov    %eax,0xcc8
}
 9c9:	c9                   	leave  
 9ca:	c3                   	ret    

000009cb <morecore>:

static Header*
morecore(uint nu)
{
 9cb:	55                   	push   %ebp
 9cc:	89 e5                	mov    %esp,%ebp
 9ce:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9d1:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9d8:	77 07                	ja     9e1 <morecore+0x16>
    nu = 4096;
 9da:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9e1:	8b 45 08             	mov    0x8(%ebp),%eax
 9e4:	c1 e0 03             	shl    $0x3,%eax
 9e7:	89 04 24             	mov    %eax,(%esp)
 9ea:	e8 4d fc ff ff       	call   63c <sbrk>
 9ef:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 9f2:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 9f6:	75 07                	jne    9ff <morecore+0x34>
    return 0;
 9f8:	b8 00 00 00 00       	mov    $0x0,%eax
 9fd:	eb 22                	jmp    a21 <morecore+0x56>
  hp = (Header*)p;
 9ff:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a02:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 a05:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a08:	8b 55 08             	mov    0x8(%ebp),%edx
 a0b:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a0e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a11:	83 c0 08             	add    $0x8,%eax
 a14:	89 04 24             	mov    %eax,(%esp)
 a17:	e8 d8 fe ff ff       	call   8f4 <free>
  return freep;
 a1c:	a1 c8 0c 00 00       	mov    0xcc8,%eax
}
 a21:	c9                   	leave  
 a22:	c3                   	ret    

00000a23 <malloc>:

void*
malloc(uint nbytes)
{
 a23:	55                   	push   %ebp
 a24:	89 e5                	mov    %esp,%ebp
 a26:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a29:	8b 45 08             	mov    0x8(%ebp),%eax
 a2c:	83 c0 07             	add    $0x7,%eax
 a2f:	c1 e8 03             	shr    $0x3,%eax
 a32:	83 c0 01             	add    $0x1,%eax
 a35:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 a38:	a1 c8 0c 00 00       	mov    0xcc8,%eax
 a3d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a40:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a44:	75 23                	jne    a69 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a46:	c7 45 f0 c0 0c 00 00 	movl   $0xcc0,-0x10(%ebp)
 a4d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a50:	a3 c8 0c 00 00       	mov    %eax,0xcc8
 a55:	a1 c8 0c 00 00       	mov    0xcc8,%eax
 a5a:	a3 c0 0c 00 00       	mov    %eax,0xcc0
    base.s.size = 0;
 a5f:	c7 05 c4 0c 00 00 00 	movl   $0x0,0xcc4
 a66:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a69:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a6c:	8b 00                	mov    (%eax),%eax
 a6e:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 a71:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a74:	8b 40 04             	mov    0x4(%eax),%eax
 a77:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 a7a:	72 4d                	jb     ac9 <malloc+0xa6>
      if(p->s.size == nunits)
 a7c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a7f:	8b 40 04             	mov    0x4(%eax),%eax
 a82:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 a85:	75 0c                	jne    a93 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a87:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a8a:	8b 10                	mov    (%eax),%edx
 a8c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a8f:	89 10                	mov    %edx,(%eax)
 a91:	eb 26                	jmp    ab9 <malloc+0x96>
      else {
        p->s.size -= nunits;
 a93:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a96:	8b 40 04             	mov    0x4(%eax),%eax
 a99:	89 c2                	mov    %eax,%edx
 a9b:	2b 55 f4             	sub    -0xc(%ebp),%edx
 a9e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aa1:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 aa4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aa7:	8b 40 04             	mov    0x4(%eax),%eax
 aaa:	c1 e0 03             	shl    $0x3,%eax
 aad:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 ab0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ab3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 ab6:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ab9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 abc:	a3 c8 0c 00 00       	mov    %eax,0xcc8
      return (void*)(p + 1);
 ac1:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ac4:	83 c0 08             	add    $0x8,%eax
 ac7:	eb 38                	jmp    b01 <malloc+0xde>
    }
    if(p == freep)
 ac9:	a1 c8 0c 00 00       	mov    0xcc8,%eax
 ace:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 ad1:	75 1b                	jne    aee <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 ad3:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad6:	89 04 24             	mov    %eax,(%esp)
 ad9:	e8 ed fe ff ff       	call   9cb <morecore>
 ade:	89 45 ec             	mov    %eax,-0x14(%ebp)
 ae1:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 ae5:	75 07                	jne    aee <malloc+0xcb>
        return 0;
 ae7:	b8 00 00 00 00       	mov    $0x0,%eax
 aec:	eb 13                	jmp    b01 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 aee:	8b 45 ec             	mov    -0x14(%ebp),%eax
 af1:	89 45 f0             	mov    %eax,-0x10(%ebp)
 af4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 af7:	8b 00                	mov    (%eax),%eax
 af9:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 afc:	e9 70 ff ff ff       	jmp    a71 <malloc+0x4e>
}
 b01:	c9                   	leave  
 b02:	c3                   	ret    
 b03:	90                   	nop

00000b04 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 b04:	55                   	push   %ebp
 b05:	89 e5                	mov    %esp,%ebp
 b07:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 b0a:	8b 55 08             	mov    0x8(%ebp),%edx
 b0d:	8b 45 0c             	mov    0xc(%ebp),%eax
 b10:	8b 4d 08             	mov    0x8(%ebp),%ecx
 b13:	f0 87 02             	lock xchg %eax,(%edx)
 b16:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 b19:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 b1c:	c9                   	leave  
 b1d:	c3                   	ret    

00000b1e <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 b1e:	55                   	push   %ebp
 b1f:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 b21:	8b 45 08             	mov    0x8(%ebp),%eax
 b24:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 b2a:	5d                   	pop    %ebp
 b2b:	c3                   	ret    

00000b2c <lock_acquire>:
void lock_acquire(lock_t *lock){
 b2c:	55                   	push   %ebp
 b2d:	89 e5                	mov    %esp,%ebp
 b2f:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 b32:	8b 45 08             	mov    0x8(%ebp),%eax
 b35:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 b3c:	00 
 b3d:	89 04 24             	mov    %eax,(%esp)
 b40:	e8 bf ff ff ff       	call   b04 <xchg>
 b45:	85 c0                	test   %eax,%eax
 b47:	75 e9                	jne    b32 <lock_acquire+0x6>
}
 b49:	c9                   	leave  
 b4a:	c3                   	ret    

00000b4b <lock_release>:
void lock_release(lock_t *lock){
 b4b:	55                   	push   %ebp
 b4c:	89 e5                	mov    %esp,%ebp
 b4e:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 b51:	8b 45 08             	mov    0x8(%ebp),%eax
 b54:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 b5b:	00 
 b5c:	89 04 24             	mov    %eax,(%esp)
 b5f:	e8 a0 ff ff ff       	call   b04 <xchg>
}
 b64:	c9                   	leave  
 b65:	c3                   	ret    

00000b66 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 b66:	55                   	push   %ebp
 b67:	89 e5                	mov    %esp,%ebp
 b69:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 b6c:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 b73:	e8 ab fe ff ff       	call   a23 <malloc>
 b78:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 b7b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b7e:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 b81:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b84:	25 ff 0f 00 00       	and    $0xfff,%eax
 b89:	85 c0                	test   %eax,%eax
 b8b:	74 15                	je     ba2 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 b8d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b90:	89 c2                	mov    %eax,%edx
 b92:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 b98:	b8 00 10 00 00       	mov    $0x1000,%eax
 b9d:	29 d0                	sub    %edx,%eax
 b9f:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 ba2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 ba6:	75 1b                	jne    bc3 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 ba8:	c7 44 24 04 75 0c 00 	movl   $0xc75,0x4(%esp)
 baf:	00 
 bb0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bb7:	e8 81 fb ff ff       	call   73d <printf>
        return 0;
 bbc:	b8 00 00 00 00       	mov    $0x0,%eax
 bc1:	eb 70                	jmp    c33 <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 bc3:	8b 55 08             	mov    0x8(%ebp),%edx
 bc6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bc9:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 bd0:	00 
 bd1:	89 54 24 08          	mov    %edx,0x8(%esp)
 bd5:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 bdc:	00 
 bdd:	89 04 24             	mov    %eax,(%esp)
 be0:	e8 6f fa ff ff       	call   654 <clone>
 be5:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 be8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bec:	79 1b                	jns    c09 <thread_create+0xa3>
        printf(1,"clone fails\n");
 bee:	c7 44 24 04 83 0c 00 	movl   $0xc83,0x4(%esp)
 bf5:	00 
 bf6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bfd:	e8 3b fb ff ff       	call   73d <printf>
        return 0;
 c02:	b8 00 00 00 00       	mov    $0x0,%eax
 c07:	eb 2a                	jmp    c33 <thread_create+0xcd>
    }
    if(tid > 0){
 c09:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c0d:	7e 05                	jle    c14 <thread_create+0xae>
        return garbage_stack;
 c0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c12:	eb 1f                	jmp    c33 <thread_create+0xcd>
    }
    if(tid == 0){
 c14:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c18:	75 14                	jne    c2e <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 c1a:	c7 44 24 04 90 0c 00 	movl   $0xc90,0x4(%esp)
 c21:	00 
 c22:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c29:	e8 0f fb ff ff       	call   73d <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 c2e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 c33:	c9                   	leave  
 c34:	c3                   	ret    
