
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
  18:	c7 45 f0 a0 0b 00 00 	movl   $0xba0,-0x10(%ebp)
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
  34:	e8 d1 01 00 00       	call   20a <match>
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
  66:	e8 91 05 00 00       	call   5fc <write>
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
  82:	e8 cb 03 00 00       	call   452 <strchr>
  87:	89 45 f4             	mov    %eax,-0xc(%ebp)
  8a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  8e:	75 91                	jne    21 <grep+0x21>
        *q = '\n';
        write(1, p, q+1 - p);
      }
      p = q+1;
    }
    if(p == buf)
  90:	81 7d f0 a0 0b 00 00 	cmpl   $0xba0,-0x10(%ebp)
  97:	75 07                	jne    a0 <grep+0xa0>
      m = 0;
  99:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    if(m > 0){
  a0:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
  a4:	7e 2b                	jle    d1 <grep+0xd1>
      m -= p - buf;
  a6:	ba a0 0b 00 00       	mov    $0xba0,%edx
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
  c5:	c7 04 24 a0 0b 00 00 	movl   $0xba0,(%esp)
  cc:	e8 bd 04 00 00       	call   58e <memmove>
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
  e2:	81 c2 a0 0b 00 00    	add    $0xba0,%edx
  e8:	89 44 24 08          	mov    %eax,0x8(%esp)
  ec:	89 54 24 04          	mov    %edx,0x4(%esp)
  f0:	8b 45 0c             	mov    0xc(%ebp),%eax
  f3:	89 04 24             	mov    %eax,(%esp)
  f6:	e8 f9 04 00 00       	call   5f4 <read>
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
 117:	7f 20                	jg     139 <main+0x2f>
    printf(2, "usage: grep pattern [file ...]\n");
 119:	c7 44 24 04 2c 0b 00 	movl   $0xb2c,0x4(%esp)
 120:	00 
 121:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 128:	e8 38 06 00 00       	call   765 <printf>
    exit(0);
 12d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 134:	e8 9b 04 00 00       	call   5d4 <exit>
  }
  pattern = argv[1];
 139:	8b 45 0c             	mov    0xc(%ebp),%eax
 13c:	83 c0 04             	add    $0x4,%eax
 13f:	8b 00                	mov    (%eax),%eax
 141:	89 44 24 1c          	mov    %eax,0x1c(%esp)
  
  if(argc <= 2){
 145:	83 7d 08 02          	cmpl   $0x2,0x8(%ebp)
 149:	7f 20                	jg     16b <main+0x61>
    grep(pattern, 0);
 14b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 152:	00 
 153:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 157:	89 04 24             	mov    %eax,(%esp)
 15a:	e8 a1 fe ff ff       	call   0 <grep>
    exit(0);
 15f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 166:	e8 69 04 00 00       	call   5d4 <exit>
  }

  for(i = 2; i < argc; i++){
 16b:	c7 44 24 18 02 00 00 	movl   $0x2,0x18(%esp)
 172:	00 
 173:	eb 7c                	jmp    1f1 <main+0xe7>
    if((fd = open(argv[i], 0)) < 0){
 175:	8b 44 24 18          	mov    0x18(%esp),%eax
 179:	c1 e0 02             	shl    $0x2,%eax
 17c:	03 45 0c             	add    0xc(%ebp),%eax
 17f:	8b 00                	mov    (%eax),%eax
 181:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 188:	00 
 189:	89 04 24             	mov    %eax,(%esp)
 18c:	e8 8b 04 00 00       	call   61c <open>
 191:	89 44 24 14          	mov    %eax,0x14(%esp)
 195:	83 7c 24 14 00       	cmpl   $0x0,0x14(%esp)
 19a:	79 30                	jns    1cc <main+0xc2>
      printf(1, "grep: cannot open %s\n", argv[i]);
 19c:	8b 44 24 18          	mov    0x18(%esp),%eax
 1a0:	c1 e0 02             	shl    $0x2,%eax
 1a3:	03 45 0c             	add    0xc(%ebp),%eax
 1a6:	8b 00                	mov    (%eax),%eax
 1a8:	89 44 24 08          	mov    %eax,0x8(%esp)
 1ac:	c7 44 24 04 4c 0b 00 	movl   $0xb4c,0x4(%esp)
 1b3:	00 
 1b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1bb:	e8 a5 05 00 00       	call   765 <printf>
      exit(1);
 1c0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c7:	e8 08 04 00 00       	call   5d4 <exit>
    }
    grep(pattern, fd);
 1cc:	8b 44 24 14          	mov    0x14(%esp),%eax
 1d0:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d4:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 1d8:	89 04 24             	mov    %eax,(%esp)
 1db:	e8 20 fe ff ff       	call   0 <grep>
    close(fd);
 1e0:	8b 44 24 14          	mov    0x14(%esp),%eax
 1e4:	89 04 24             	mov    %eax,(%esp)
 1e7:	e8 18 04 00 00       	call   604 <close>
  if(argc <= 2){
    grep(pattern, 0);
    exit(0);
  }

  for(i = 2; i < argc; i++){
 1ec:	83 44 24 18 01       	addl   $0x1,0x18(%esp)
 1f1:	8b 44 24 18          	mov    0x18(%esp),%eax
 1f5:	3b 45 08             	cmp    0x8(%ebp),%eax
 1f8:	0f 8c 77 ff ff ff    	jl     175 <main+0x6b>
      exit(1);
    }
    grep(pattern, fd);
    close(fd);
  }
  exit(0);
 1fe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 205:	e8 ca 03 00 00       	call   5d4 <exit>

0000020a <match>:
int matchhere(char*, char*);
int matchstar(int, char*, char*);

int
match(char *re, char *text)
{
 20a:	55                   	push   %ebp
 20b:	89 e5                	mov    %esp,%ebp
 20d:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '^')
 210:	8b 45 08             	mov    0x8(%ebp),%eax
 213:	0f b6 00             	movzbl (%eax),%eax
 216:	3c 5e                	cmp    $0x5e,%al
 218:	75 17                	jne    231 <match+0x27>
    return matchhere(re+1, text);
 21a:	8b 45 08             	mov    0x8(%ebp),%eax
 21d:	8d 50 01             	lea    0x1(%eax),%edx
 220:	8b 45 0c             	mov    0xc(%ebp),%eax
 223:	89 44 24 04          	mov    %eax,0x4(%esp)
 227:	89 14 24             	mov    %edx,(%esp)
 22a:	e8 39 00 00 00       	call   268 <matchhere>
 22f:	eb 35                	jmp    266 <match+0x5c>
  do{  // must look at empty string
    if(matchhere(re, text))
 231:	8b 45 0c             	mov    0xc(%ebp),%eax
 234:	89 44 24 04          	mov    %eax,0x4(%esp)
 238:	8b 45 08             	mov    0x8(%ebp),%eax
 23b:	89 04 24             	mov    %eax,(%esp)
 23e:	e8 25 00 00 00       	call   268 <matchhere>
 243:	85 c0                	test   %eax,%eax
 245:	74 07                	je     24e <match+0x44>
      return 1;
 247:	b8 01 00 00 00       	mov    $0x1,%eax
 24c:	eb 18                	jmp    266 <match+0x5c>
  }while(*text++ != '\0');
 24e:	8b 45 0c             	mov    0xc(%ebp),%eax
 251:	0f b6 00             	movzbl (%eax),%eax
 254:	84 c0                	test   %al,%al
 256:	0f 95 c0             	setne  %al
 259:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 25d:	84 c0                	test   %al,%al
 25f:	75 d0                	jne    231 <match+0x27>
  return 0;
 261:	b8 00 00 00 00       	mov    $0x0,%eax
}
 266:	c9                   	leave  
 267:	c3                   	ret    

00000268 <matchhere>:

// matchhere: search for re at beginning of text
int matchhere(char *re, char *text)
{
 268:	55                   	push   %ebp
 269:	89 e5                	mov    %esp,%ebp
 26b:	83 ec 18             	sub    $0x18,%esp
  if(re[0] == '\0')
 26e:	8b 45 08             	mov    0x8(%ebp),%eax
 271:	0f b6 00             	movzbl (%eax),%eax
 274:	84 c0                	test   %al,%al
 276:	75 0a                	jne    282 <matchhere+0x1a>
    return 1;
 278:	b8 01 00 00 00       	mov    $0x1,%eax
 27d:	e9 9b 00 00 00       	jmp    31d <matchhere+0xb5>
  if(re[1] == '*')
 282:	8b 45 08             	mov    0x8(%ebp),%eax
 285:	83 c0 01             	add    $0x1,%eax
 288:	0f b6 00             	movzbl (%eax),%eax
 28b:	3c 2a                	cmp    $0x2a,%al
 28d:	75 24                	jne    2b3 <matchhere+0x4b>
    return matchstar(re[0], re+2, text);
 28f:	8b 45 08             	mov    0x8(%ebp),%eax
 292:	8d 48 02             	lea    0x2(%eax),%ecx
 295:	8b 45 08             	mov    0x8(%ebp),%eax
 298:	0f b6 00             	movzbl (%eax),%eax
 29b:	0f be c0             	movsbl %al,%eax
 29e:	8b 55 0c             	mov    0xc(%ebp),%edx
 2a1:	89 54 24 08          	mov    %edx,0x8(%esp)
 2a5:	89 4c 24 04          	mov    %ecx,0x4(%esp)
 2a9:	89 04 24             	mov    %eax,(%esp)
 2ac:	e8 6e 00 00 00       	call   31f <matchstar>
 2b1:	eb 6a                	jmp    31d <matchhere+0xb5>
  if(re[0] == '$' && re[1] == '\0')
 2b3:	8b 45 08             	mov    0x8(%ebp),%eax
 2b6:	0f b6 00             	movzbl (%eax),%eax
 2b9:	3c 24                	cmp    $0x24,%al
 2bb:	75 1d                	jne    2da <matchhere+0x72>
 2bd:	8b 45 08             	mov    0x8(%ebp),%eax
 2c0:	83 c0 01             	add    $0x1,%eax
 2c3:	0f b6 00             	movzbl (%eax),%eax
 2c6:	84 c0                	test   %al,%al
 2c8:	75 10                	jne    2da <matchhere+0x72>
    return *text == '\0';
 2ca:	8b 45 0c             	mov    0xc(%ebp),%eax
 2cd:	0f b6 00             	movzbl (%eax),%eax
 2d0:	84 c0                	test   %al,%al
 2d2:	0f 94 c0             	sete   %al
 2d5:	0f b6 c0             	movzbl %al,%eax
 2d8:	eb 43                	jmp    31d <matchhere+0xb5>
  if(*text!='\0' && (re[0]=='.' || re[0]==*text))
 2da:	8b 45 0c             	mov    0xc(%ebp),%eax
 2dd:	0f b6 00             	movzbl (%eax),%eax
 2e0:	84 c0                	test   %al,%al
 2e2:	74 34                	je     318 <matchhere+0xb0>
 2e4:	8b 45 08             	mov    0x8(%ebp),%eax
 2e7:	0f b6 00             	movzbl (%eax),%eax
 2ea:	3c 2e                	cmp    $0x2e,%al
 2ec:	74 10                	je     2fe <matchhere+0x96>
 2ee:	8b 45 08             	mov    0x8(%ebp),%eax
 2f1:	0f b6 10             	movzbl (%eax),%edx
 2f4:	8b 45 0c             	mov    0xc(%ebp),%eax
 2f7:	0f b6 00             	movzbl (%eax),%eax
 2fa:	38 c2                	cmp    %al,%dl
 2fc:	75 1a                	jne    318 <matchhere+0xb0>
    return matchhere(re+1, text+1);
 2fe:	8b 45 0c             	mov    0xc(%ebp),%eax
 301:	8d 50 01             	lea    0x1(%eax),%edx
 304:	8b 45 08             	mov    0x8(%ebp),%eax
 307:	83 c0 01             	add    $0x1,%eax
 30a:	89 54 24 04          	mov    %edx,0x4(%esp)
 30e:	89 04 24             	mov    %eax,(%esp)
 311:	e8 52 ff ff ff       	call   268 <matchhere>
 316:	eb 05                	jmp    31d <matchhere+0xb5>
  return 0;
 318:	b8 00 00 00 00       	mov    $0x0,%eax
}
 31d:	c9                   	leave  
 31e:	c3                   	ret    

0000031f <matchstar>:

// matchstar: search for c*re at beginning of text
int matchstar(int c, char *re, char *text)
{
 31f:	55                   	push   %ebp
 320:	89 e5                	mov    %esp,%ebp
 322:	83 ec 18             	sub    $0x18,%esp
  do{  // a * matches zero or more instances
    if(matchhere(re, text))
 325:	8b 45 10             	mov    0x10(%ebp),%eax
 328:	89 44 24 04          	mov    %eax,0x4(%esp)
 32c:	8b 45 0c             	mov    0xc(%ebp),%eax
 32f:	89 04 24             	mov    %eax,(%esp)
 332:	e8 31 ff ff ff       	call   268 <matchhere>
 337:	85 c0                	test   %eax,%eax
 339:	74 07                	je     342 <matchstar+0x23>
      return 1;
 33b:	b8 01 00 00 00       	mov    $0x1,%eax
 340:	eb 2c                	jmp    36e <matchstar+0x4f>
  }while(*text!='\0' && (*text++==c || c=='.'));
 342:	8b 45 10             	mov    0x10(%ebp),%eax
 345:	0f b6 00             	movzbl (%eax),%eax
 348:	84 c0                	test   %al,%al
 34a:	74 1d                	je     369 <matchstar+0x4a>
 34c:	8b 45 10             	mov    0x10(%ebp),%eax
 34f:	0f b6 00             	movzbl (%eax),%eax
 352:	0f be c0             	movsbl %al,%eax
 355:	3b 45 08             	cmp    0x8(%ebp),%eax
 358:	0f 94 c0             	sete   %al
 35b:	83 45 10 01          	addl   $0x1,0x10(%ebp)
 35f:	84 c0                	test   %al,%al
 361:	75 c2                	jne    325 <matchstar+0x6>
 363:	83 7d 08 2e          	cmpl   $0x2e,0x8(%ebp)
 367:	74 bc                	je     325 <matchstar+0x6>
  return 0;
 369:	b8 00 00 00 00       	mov    $0x0,%eax
}
 36e:	c9                   	leave  
 36f:	c3                   	ret    

00000370 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 370:	55                   	push   %ebp
 371:	89 e5                	mov    %esp,%ebp
 373:	57                   	push   %edi
 374:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 375:	8b 4d 08             	mov    0x8(%ebp),%ecx
 378:	8b 55 10             	mov    0x10(%ebp),%edx
 37b:	8b 45 0c             	mov    0xc(%ebp),%eax
 37e:	89 cb                	mov    %ecx,%ebx
 380:	89 df                	mov    %ebx,%edi
 382:	89 d1                	mov    %edx,%ecx
 384:	fc                   	cld    
 385:	f3 aa                	rep stos %al,%es:(%edi)
 387:	89 ca                	mov    %ecx,%edx
 389:	89 fb                	mov    %edi,%ebx
 38b:	89 5d 08             	mov    %ebx,0x8(%ebp)
 38e:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 391:	5b                   	pop    %ebx
 392:	5f                   	pop    %edi
 393:	5d                   	pop    %ebp
 394:	c3                   	ret    

00000395 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 395:	55                   	push   %ebp
 396:	89 e5                	mov    %esp,%ebp
 398:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 39b:	8b 45 08             	mov    0x8(%ebp),%eax
 39e:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 3a1:	8b 45 0c             	mov    0xc(%ebp),%eax
 3a4:	0f b6 10             	movzbl (%eax),%edx
 3a7:	8b 45 08             	mov    0x8(%ebp),%eax
 3aa:	88 10                	mov    %dl,(%eax)
 3ac:	8b 45 08             	mov    0x8(%ebp),%eax
 3af:	0f b6 00             	movzbl (%eax),%eax
 3b2:	84 c0                	test   %al,%al
 3b4:	0f 95 c0             	setne  %al
 3b7:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3bb:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 3bf:	84 c0                	test   %al,%al
 3c1:	75 de                	jne    3a1 <strcpy+0xc>
    ;
  return os;
 3c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3c6:	c9                   	leave  
 3c7:	c3                   	ret    

000003c8 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3c8:	55                   	push   %ebp
 3c9:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3cb:	eb 08                	jmp    3d5 <strcmp+0xd>
    p++, q++;
 3cd:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3d1:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3d5:	8b 45 08             	mov    0x8(%ebp),%eax
 3d8:	0f b6 00             	movzbl (%eax),%eax
 3db:	84 c0                	test   %al,%al
 3dd:	74 10                	je     3ef <strcmp+0x27>
 3df:	8b 45 08             	mov    0x8(%ebp),%eax
 3e2:	0f b6 10             	movzbl (%eax),%edx
 3e5:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e8:	0f b6 00             	movzbl (%eax),%eax
 3eb:	38 c2                	cmp    %al,%dl
 3ed:	74 de                	je     3cd <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3ef:	8b 45 08             	mov    0x8(%ebp),%eax
 3f2:	0f b6 00             	movzbl (%eax),%eax
 3f5:	0f b6 d0             	movzbl %al,%edx
 3f8:	8b 45 0c             	mov    0xc(%ebp),%eax
 3fb:	0f b6 00             	movzbl (%eax),%eax
 3fe:	0f b6 c0             	movzbl %al,%eax
 401:	89 d1                	mov    %edx,%ecx
 403:	29 c1                	sub    %eax,%ecx
 405:	89 c8                	mov    %ecx,%eax
}
 407:	5d                   	pop    %ebp
 408:	c3                   	ret    

00000409 <strlen>:

uint
strlen(char *s)
{
 409:	55                   	push   %ebp
 40a:	89 e5                	mov    %esp,%ebp
 40c:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 40f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 416:	eb 04                	jmp    41c <strlen+0x13>
 418:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 41c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 41f:	03 45 08             	add    0x8(%ebp),%eax
 422:	0f b6 00             	movzbl (%eax),%eax
 425:	84 c0                	test   %al,%al
 427:	75 ef                	jne    418 <strlen+0xf>
    ;
  return n;
 429:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 42c:	c9                   	leave  
 42d:	c3                   	ret    

0000042e <memset>:

void*
memset(void *dst, int c, uint n)
{
 42e:	55                   	push   %ebp
 42f:	89 e5                	mov    %esp,%ebp
 431:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 434:	8b 45 10             	mov    0x10(%ebp),%eax
 437:	89 44 24 08          	mov    %eax,0x8(%esp)
 43b:	8b 45 0c             	mov    0xc(%ebp),%eax
 43e:	89 44 24 04          	mov    %eax,0x4(%esp)
 442:	8b 45 08             	mov    0x8(%ebp),%eax
 445:	89 04 24             	mov    %eax,(%esp)
 448:	e8 23 ff ff ff       	call   370 <stosb>
  return dst;
 44d:	8b 45 08             	mov    0x8(%ebp),%eax
}
 450:	c9                   	leave  
 451:	c3                   	ret    

00000452 <strchr>:

char*
strchr(const char *s, char c)
{
 452:	55                   	push   %ebp
 453:	89 e5                	mov    %esp,%ebp
 455:	83 ec 04             	sub    $0x4,%esp
 458:	8b 45 0c             	mov    0xc(%ebp),%eax
 45b:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 45e:	eb 14                	jmp    474 <strchr+0x22>
    if(*s == c)
 460:	8b 45 08             	mov    0x8(%ebp),%eax
 463:	0f b6 00             	movzbl (%eax),%eax
 466:	3a 45 fc             	cmp    -0x4(%ebp),%al
 469:	75 05                	jne    470 <strchr+0x1e>
      return (char*)s;
 46b:	8b 45 08             	mov    0x8(%ebp),%eax
 46e:	eb 13                	jmp    483 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 470:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 474:	8b 45 08             	mov    0x8(%ebp),%eax
 477:	0f b6 00             	movzbl (%eax),%eax
 47a:	84 c0                	test   %al,%al
 47c:	75 e2                	jne    460 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 47e:	b8 00 00 00 00       	mov    $0x0,%eax
}
 483:	c9                   	leave  
 484:	c3                   	ret    

00000485 <gets>:

char*
gets(char *buf, int max)
{
 485:	55                   	push   %ebp
 486:	89 e5                	mov    %esp,%ebp
 488:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 48b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 492:	eb 44                	jmp    4d8 <gets+0x53>
    cc = read(0, &c, 1);
 494:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 49b:	00 
 49c:	8d 45 ef             	lea    -0x11(%ebp),%eax
 49f:	89 44 24 04          	mov    %eax,0x4(%esp)
 4a3:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 4aa:	e8 45 01 00 00       	call   5f4 <read>
 4af:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 4b2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4b6:	7e 2d                	jle    4e5 <gets+0x60>
      break;
    buf[i++] = c;
 4b8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4bb:	03 45 08             	add    0x8(%ebp),%eax
 4be:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 4c2:	88 10                	mov    %dl,(%eax)
 4c4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 4c8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4cc:	3c 0a                	cmp    $0xa,%al
 4ce:	74 16                	je     4e6 <gets+0x61>
 4d0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4d4:	3c 0d                	cmp    $0xd,%al
 4d6:	74 0e                	je     4e6 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4d8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4db:	83 c0 01             	add    $0x1,%eax
 4de:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4e1:	7c b1                	jl     494 <gets+0xf>
 4e3:	eb 01                	jmp    4e6 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 4e5:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4e9:	03 45 08             	add    0x8(%ebp),%eax
 4ec:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4ef:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4f2:	c9                   	leave  
 4f3:	c3                   	ret    

000004f4 <stat>:

int
stat(char *n, struct stat *st)
{
 4f4:	55                   	push   %ebp
 4f5:	89 e5                	mov    %esp,%ebp
 4f7:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4fa:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 501:	00 
 502:	8b 45 08             	mov    0x8(%ebp),%eax
 505:	89 04 24             	mov    %eax,(%esp)
 508:	e8 0f 01 00 00       	call   61c <open>
 50d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 510:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 514:	79 07                	jns    51d <stat+0x29>
    return -1;
 516:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 51b:	eb 23                	jmp    540 <stat+0x4c>
  r = fstat(fd, st);
 51d:	8b 45 0c             	mov    0xc(%ebp),%eax
 520:	89 44 24 04          	mov    %eax,0x4(%esp)
 524:	8b 45 f0             	mov    -0x10(%ebp),%eax
 527:	89 04 24             	mov    %eax,(%esp)
 52a:	e8 05 01 00 00       	call   634 <fstat>
 52f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 532:	8b 45 f0             	mov    -0x10(%ebp),%eax
 535:	89 04 24             	mov    %eax,(%esp)
 538:	e8 c7 00 00 00       	call   604 <close>
  return r;
 53d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 540:	c9                   	leave  
 541:	c3                   	ret    

00000542 <atoi>:

int
atoi(const char *s)
{
 542:	55                   	push   %ebp
 543:	89 e5                	mov    %esp,%ebp
 545:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 548:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 54f:	eb 24                	jmp    575 <atoi+0x33>
    n = n*10 + *s++ - '0';
 551:	8b 55 fc             	mov    -0x4(%ebp),%edx
 554:	89 d0                	mov    %edx,%eax
 556:	c1 e0 02             	shl    $0x2,%eax
 559:	01 d0                	add    %edx,%eax
 55b:	01 c0                	add    %eax,%eax
 55d:	89 c2                	mov    %eax,%edx
 55f:	8b 45 08             	mov    0x8(%ebp),%eax
 562:	0f b6 00             	movzbl (%eax),%eax
 565:	0f be c0             	movsbl %al,%eax
 568:	8d 04 02             	lea    (%edx,%eax,1),%eax
 56b:	83 e8 30             	sub    $0x30,%eax
 56e:	89 45 fc             	mov    %eax,-0x4(%ebp)
 571:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 575:	8b 45 08             	mov    0x8(%ebp),%eax
 578:	0f b6 00             	movzbl (%eax),%eax
 57b:	3c 2f                	cmp    $0x2f,%al
 57d:	7e 0a                	jle    589 <atoi+0x47>
 57f:	8b 45 08             	mov    0x8(%ebp),%eax
 582:	0f b6 00             	movzbl (%eax),%eax
 585:	3c 39                	cmp    $0x39,%al
 587:	7e c8                	jle    551 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 589:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 58c:	c9                   	leave  
 58d:	c3                   	ret    

0000058e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 58e:	55                   	push   %ebp
 58f:	89 e5                	mov    %esp,%ebp
 591:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 594:	8b 45 08             	mov    0x8(%ebp),%eax
 597:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 59a:	8b 45 0c             	mov    0xc(%ebp),%eax
 59d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 5a0:	eb 13                	jmp    5b5 <memmove+0x27>
    *dst++ = *src++;
 5a2:	8b 45 fc             	mov    -0x4(%ebp),%eax
 5a5:	0f b6 10             	movzbl (%eax),%edx
 5a8:	8b 45 f8             	mov    -0x8(%ebp),%eax
 5ab:	88 10                	mov    %dl,(%eax)
 5ad:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 5b1:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5b5:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 5b9:	0f 9f c0             	setg   %al
 5bc:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 5c0:	84 c0                	test   %al,%al
 5c2:	75 de                	jne    5a2 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5c4:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5c7:	c9                   	leave  
 5c8:	c3                   	ret    
 5c9:	90                   	nop
 5ca:	90                   	nop
 5cb:	90                   	nop

000005cc <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5cc:	b8 01 00 00 00       	mov    $0x1,%eax
 5d1:	cd 40                	int    $0x40
 5d3:	c3                   	ret    

000005d4 <exit>:
SYSCALL(exit)
 5d4:	b8 02 00 00 00       	mov    $0x2,%eax
 5d9:	cd 40                	int    $0x40
 5db:	c3                   	ret    

000005dc <wait>:
SYSCALL(wait)
 5dc:	b8 03 00 00 00       	mov    $0x3,%eax
 5e1:	cd 40                	int    $0x40
 5e3:	c3                   	ret    

000005e4 <waitpid>:
SYSCALL(waitpid)
 5e4:	b8 17 00 00 00       	mov    $0x17,%eax
 5e9:	cd 40                	int    $0x40
 5eb:	c3                   	ret    

000005ec <pipe>:
SYSCALL(pipe)
 5ec:	b8 04 00 00 00       	mov    $0x4,%eax
 5f1:	cd 40                	int    $0x40
 5f3:	c3                   	ret    

000005f4 <read>:
SYSCALL(read)
 5f4:	b8 05 00 00 00       	mov    $0x5,%eax
 5f9:	cd 40                	int    $0x40
 5fb:	c3                   	ret    

000005fc <write>:
SYSCALL(write)
 5fc:	b8 10 00 00 00       	mov    $0x10,%eax
 601:	cd 40                	int    $0x40
 603:	c3                   	ret    

00000604 <close>:
SYSCALL(close)
 604:	b8 15 00 00 00       	mov    $0x15,%eax
 609:	cd 40                	int    $0x40
 60b:	c3                   	ret    

0000060c <kill>:
SYSCALL(kill)
 60c:	b8 06 00 00 00       	mov    $0x6,%eax
 611:	cd 40                	int    $0x40
 613:	c3                   	ret    

00000614 <exec>:
SYSCALL(exec)
 614:	b8 07 00 00 00       	mov    $0x7,%eax
 619:	cd 40                	int    $0x40
 61b:	c3                   	ret    

0000061c <open>:
SYSCALL(open)
 61c:	b8 0f 00 00 00       	mov    $0xf,%eax
 621:	cd 40                	int    $0x40
 623:	c3                   	ret    

00000624 <mknod>:
SYSCALL(mknod)
 624:	b8 11 00 00 00       	mov    $0x11,%eax
 629:	cd 40                	int    $0x40
 62b:	c3                   	ret    

0000062c <unlink>:
SYSCALL(unlink)
 62c:	b8 12 00 00 00       	mov    $0x12,%eax
 631:	cd 40                	int    $0x40
 633:	c3                   	ret    

00000634 <fstat>:
SYSCALL(fstat)
 634:	b8 08 00 00 00       	mov    $0x8,%eax
 639:	cd 40                	int    $0x40
 63b:	c3                   	ret    

0000063c <link>:
SYSCALL(link)
 63c:	b8 13 00 00 00       	mov    $0x13,%eax
 641:	cd 40                	int    $0x40
 643:	c3                   	ret    

00000644 <mkdir>:
SYSCALL(mkdir)
 644:	b8 14 00 00 00       	mov    $0x14,%eax
 649:	cd 40                	int    $0x40
 64b:	c3                   	ret    

0000064c <chdir>:
SYSCALL(chdir)
 64c:	b8 09 00 00 00       	mov    $0x9,%eax
 651:	cd 40                	int    $0x40
 653:	c3                   	ret    

00000654 <dup>:
SYSCALL(dup)
 654:	b8 0a 00 00 00       	mov    $0xa,%eax
 659:	cd 40                	int    $0x40
 65b:	c3                   	ret    

0000065c <getpid>:
SYSCALL(getpid)
 65c:	b8 0b 00 00 00       	mov    $0xb,%eax
 661:	cd 40                	int    $0x40
 663:	c3                   	ret    

00000664 <sbrk>:
SYSCALL(sbrk)
 664:	b8 0c 00 00 00       	mov    $0xc,%eax
 669:	cd 40                	int    $0x40
 66b:	c3                   	ret    

0000066c <sleep>:
SYSCALL(sleep)
 66c:	b8 0d 00 00 00       	mov    $0xd,%eax
 671:	cd 40                	int    $0x40
 673:	c3                   	ret    

00000674 <uptime>:
SYSCALL(uptime)
 674:	b8 0e 00 00 00       	mov    $0xe,%eax
 679:	cd 40                	int    $0x40
 67b:	c3                   	ret    

0000067c <count>:
SYSCALL(count)
 67c:	b8 16 00 00 00       	mov    $0x16,%eax
 681:	cd 40                	int    $0x40
 683:	c3                   	ret    

00000684 <change_priority>:
SYSCALL(change_priority)
 684:	b8 18 00 00 00       	mov    $0x18,%eax
 689:	cd 40                	int    $0x40
 68b:	c3                   	ret    

0000068c <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 68c:	55                   	push   %ebp
 68d:	89 e5                	mov    %esp,%ebp
 68f:	83 ec 28             	sub    $0x28,%esp
 692:	8b 45 0c             	mov    0xc(%ebp),%eax
 695:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 698:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 69f:	00 
 6a0:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6a3:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a7:	8b 45 08             	mov    0x8(%ebp),%eax
 6aa:	89 04 24             	mov    %eax,(%esp)
 6ad:	e8 4a ff ff ff       	call   5fc <write>
}
 6b2:	c9                   	leave  
 6b3:	c3                   	ret    

000006b4 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6b4:	55                   	push   %ebp
 6b5:	89 e5                	mov    %esp,%ebp
 6b7:	53                   	push   %ebx
 6b8:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6c2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6c6:	74 17                	je     6df <printint+0x2b>
 6c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6cc:	79 11                	jns    6df <printint+0x2b>
    neg = 1;
 6ce:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6d8:	f7 d8                	neg    %eax
 6da:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6dd:	eb 06                	jmp    6e5 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6df:	8b 45 0c             	mov    0xc(%ebp),%eax
 6e2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 6e5:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 6ec:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 6ef:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6f2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f5:	ba 00 00 00 00       	mov    $0x0,%edx
 6fa:	f7 f3                	div    %ebx
 6fc:	89 d0                	mov    %edx,%eax
 6fe:	0f b6 80 6c 0b 00 00 	movzbl 0xb6c(%eax),%eax
 705:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 709:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 70d:	8b 45 10             	mov    0x10(%ebp),%eax
 710:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 713:	8b 45 f4             	mov    -0xc(%ebp),%eax
 716:	ba 00 00 00 00       	mov    $0x0,%edx
 71b:	f7 75 d4             	divl   -0x2c(%ebp)
 71e:	89 45 f4             	mov    %eax,-0xc(%ebp)
 721:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 725:	75 c5                	jne    6ec <printint+0x38>
  if(neg)
 727:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 72b:	74 28                	je     755 <printint+0xa1>
    buf[i++] = '-';
 72d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 730:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 735:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 739:	eb 1a                	jmp    755 <printint+0xa1>
    putc(fd, buf[i]);
 73b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 73e:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 743:	0f be c0             	movsbl %al,%eax
 746:	89 44 24 04          	mov    %eax,0x4(%esp)
 74a:	8b 45 08             	mov    0x8(%ebp),%eax
 74d:	89 04 24             	mov    %eax,(%esp)
 750:	e8 37 ff ff ff       	call   68c <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 755:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 759:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 75d:	79 dc                	jns    73b <printint+0x87>
    putc(fd, buf[i]);
}
 75f:	83 c4 44             	add    $0x44,%esp
 762:	5b                   	pop    %ebx
 763:	5d                   	pop    %ebp
 764:	c3                   	ret    

00000765 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 765:	55                   	push   %ebp
 766:	89 e5                	mov    %esp,%ebp
 768:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 76b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 772:	8d 45 0c             	lea    0xc(%ebp),%eax
 775:	83 c0 04             	add    $0x4,%eax
 778:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 77b:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 782:	e9 7e 01 00 00       	jmp    905 <printf+0x1a0>
    c = fmt[i] & 0xff;
 787:	8b 55 0c             	mov    0xc(%ebp),%edx
 78a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 78d:	8d 04 02             	lea    (%edx,%eax,1),%eax
 790:	0f b6 00             	movzbl (%eax),%eax
 793:	0f be c0             	movsbl %al,%eax
 796:	25 ff 00 00 00       	and    $0xff,%eax
 79b:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 79e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 7a2:	75 2c                	jne    7d0 <printf+0x6b>
      if(c == '%'){
 7a4:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 7a8:	75 0c                	jne    7b6 <printf+0x51>
        state = '%';
 7aa:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 7b1:	e9 4b 01 00 00       	jmp    901 <printf+0x19c>
      } else {
        putc(fd, c);
 7b6:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7b9:	0f be c0             	movsbl %al,%eax
 7bc:	89 44 24 04          	mov    %eax,0x4(%esp)
 7c0:	8b 45 08             	mov    0x8(%ebp),%eax
 7c3:	89 04 24             	mov    %eax,(%esp)
 7c6:	e8 c1 fe ff ff       	call   68c <putc>
 7cb:	e9 31 01 00 00       	jmp    901 <printf+0x19c>
      }
    } else if(state == '%'){
 7d0:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 7d4:	0f 85 27 01 00 00    	jne    901 <printf+0x19c>
      if(c == 'd'){
 7da:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 7de:	75 2d                	jne    80d <printf+0xa8>
        printint(fd, *ap, 10, 1);
 7e0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7e3:	8b 00                	mov    (%eax),%eax
 7e5:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7ec:	00 
 7ed:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7f4:	00 
 7f5:	89 44 24 04          	mov    %eax,0x4(%esp)
 7f9:	8b 45 08             	mov    0x8(%ebp),%eax
 7fc:	89 04 24             	mov    %eax,(%esp)
 7ff:	e8 b0 fe ff ff       	call   6b4 <printint>
        ap++;
 804:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 808:	e9 ed 00 00 00       	jmp    8fa <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 80d:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 811:	74 06                	je     819 <printf+0xb4>
 813:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 817:	75 2d                	jne    846 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 819:	8b 45 f4             	mov    -0xc(%ebp),%eax
 81c:	8b 00                	mov    (%eax),%eax
 81e:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 825:	00 
 826:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 82d:	00 
 82e:	89 44 24 04          	mov    %eax,0x4(%esp)
 832:	8b 45 08             	mov    0x8(%ebp),%eax
 835:	89 04 24             	mov    %eax,(%esp)
 838:	e8 77 fe ff ff       	call   6b4 <printint>
        ap++;
 83d:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 841:	e9 b4 00 00 00       	jmp    8fa <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 846:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 84a:	75 46                	jne    892 <printf+0x12d>
        s = (char*)*ap;
 84c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 84f:	8b 00                	mov    (%eax),%eax
 851:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 854:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 858:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 85c:	75 27                	jne    885 <printf+0x120>
          s = "(null)";
 85e:	c7 45 e4 62 0b 00 00 	movl   $0xb62,-0x1c(%ebp)
        while(*s != 0){
 865:	eb 1f                	jmp    886 <printf+0x121>
          putc(fd, *s);
 867:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 86a:	0f b6 00             	movzbl (%eax),%eax
 86d:	0f be c0             	movsbl %al,%eax
 870:	89 44 24 04          	mov    %eax,0x4(%esp)
 874:	8b 45 08             	mov    0x8(%ebp),%eax
 877:	89 04 24             	mov    %eax,(%esp)
 87a:	e8 0d fe ff ff       	call   68c <putc>
          s++;
 87f:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 883:	eb 01                	jmp    886 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 885:	90                   	nop
 886:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 889:	0f b6 00             	movzbl (%eax),%eax
 88c:	84 c0                	test   %al,%al
 88e:	75 d7                	jne    867 <printf+0x102>
 890:	eb 68                	jmp    8fa <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 892:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 896:	75 1d                	jne    8b5 <printf+0x150>
        putc(fd, *ap);
 898:	8b 45 f4             	mov    -0xc(%ebp),%eax
 89b:	8b 00                	mov    (%eax),%eax
 89d:	0f be c0             	movsbl %al,%eax
 8a0:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a4:	8b 45 08             	mov    0x8(%ebp),%eax
 8a7:	89 04 24             	mov    %eax,(%esp)
 8aa:	e8 dd fd ff ff       	call   68c <putc>
        ap++;
 8af:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 8b3:	eb 45                	jmp    8fa <printf+0x195>
      } else if(c == '%'){
 8b5:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 8b9:	75 17                	jne    8d2 <printf+0x16d>
        putc(fd, c);
 8bb:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8be:	0f be c0             	movsbl %al,%eax
 8c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 8c5:	8b 45 08             	mov    0x8(%ebp),%eax
 8c8:	89 04 24             	mov    %eax,(%esp)
 8cb:	e8 bc fd ff ff       	call   68c <putc>
 8d0:	eb 28                	jmp    8fa <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8d2:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8d9:	00 
 8da:	8b 45 08             	mov    0x8(%ebp),%eax
 8dd:	89 04 24             	mov    %eax,(%esp)
 8e0:	e8 a7 fd ff ff       	call   68c <putc>
        putc(fd, c);
 8e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8e8:	0f be c0             	movsbl %al,%eax
 8eb:	89 44 24 04          	mov    %eax,0x4(%esp)
 8ef:	8b 45 08             	mov    0x8(%ebp),%eax
 8f2:	89 04 24             	mov    %eax,(%esp)
 8f5:	e8 92 fd ff ff       	call   68c <putc>
      }
      state = 0;
 8fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 901:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 905:	8b 55 0c             	mov    0xc(%ebp),%edx
 908:	8b 45 ec             	mov    -0x14(%ebp),%eax
 90b:	8d 04 02             	lea    (%edx,%eax,1),%eax
 90e:	0f b6 00             	movzbl (%eax),%eax
 911:	84 c0                	test   %al,%al
 913:	0f 85 6e fe ff ff    	jne    787 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 919:	c9                   	leave  
 91a:	c3                   	ret    
 91b:	90                   	nop

0000091c <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 91c:	55                   	push   %ebp
 91d:	89 e5                	mov    %esp,%ebp
 91f:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 922:	8b 45 08             	mov    0x8(%ebp),%eax
 925:	83 e8 08             	sub    $0x8,%eax
 928:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92b:	a1 88 0b 00 00       	mov    0xb88,%eax
 930:	89 45 fc             	mov    %eax,-0x4(%ebp)
 933:	eb 24                	jmp    959 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 935:	8b 45 fc             	mov    -0x4(%ebp),%eax
 938:	8b 00                	mov    (%eax),%eax
 93a:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 93d:	77 12                	ja     951 <free+0x35>
 93f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 942:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 945:	77 24                	ja     96b <free+0x4f>
 947:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94a:	8b 00                	mov    (%eax),%eax
 94c:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 94f:	77 1a                	ja     96b <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 951:	8b 45 fc             	mov    -0x4(%ebp),%eax
 954:	8b 00                	mov    (%eax),%eax
 956:	89 45 fc             	mov    %eax,-0x4(%ebp)
 959:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 95f:	76 d4                	jbe    935 <free+0x19>
 961:	8b 45 fc             	mov    -0x4(%ebp),%eax
 964:	8b 00                	mov    (%eax),%eax
 966:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 969:	76 ca                	jbe    935 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 96b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 96e:	8b 40 04             	mov    0x4(%eax),%eax
 971:	c1 e0 03             	shl    $0x3,%eax
 974:	89 c2                	mov    %eax,%edx
 976:	03 55 f8             	add    -0x8(%ebp),%edx
 979:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97c:	8b 00                	mov    (%eax),%eax
 97e:	39 c2                	cmp    %eax,%edx
 980:	75 24                	jne    9a6 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 982:	8b 45 f8             	mov    -0x8(%ebp),%eax
 985:	8b 50 04             	mov    0x4(%eax),%edx
 988:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98b:	8b 00                	mov    (%eax),%eax
 98d:	8b 40 04             	mov    0x4(%eax),%eax
 990:	01 c2                	add    %eax,%edx
 992:	8b 45 f8             	mov    -0x8(%ebp),%eax
 995:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 998:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99b:	8b 00                	mov    (%eax),%eax
 99d:	8b 10                	mov    (%eax),%edx
 99f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9a2:	89 10                	mov    %edx,(%eax)
 9a4:	eb 0a                	jmp    9b0 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 9a6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a9:	8b 10                	mov    (%eax),%edx
 9ab:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ae:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9b0:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b3:	8b 40 04             	mov    0x4(%eax),%eax
 9b6:	c1 e0 03             	shl    $0x3,%eax
 9b9:	03 45 fc             	add    -0x4(%ebp),%eax
 9bc:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9bf:	75 20                	jne    9e1 <free+0xc5>
    p->s.size += bp->s.size;
 9c1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c4:	8b 50 04             	mov    0x4(%eax),%edx
 9c7:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9ca:	8b 40 04             	mov    0x4(%eax),%eax
 9cd:	01 c2                	add    %eax,%edx
 9cf:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d2:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9d8:	8b 10                	mov    (%eax),%edx
 9da:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9dd:	89 10                	mov    %edx,(%eax)
 9df:	eb 08                	jmp    9e9 <free+0xcd>
  } else
    p->s.ptr = bp;
 9e1:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e4:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9e7:	89 10                	mov    %edx,(%eax)
  freep = p;
 9e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ec:	a3 88 0b 00 00       	mov    %eax,0xb88
}
 9f1:	c9                   	leave  
 9f2:	c3                   	ret    

000009f3 <morecore>:

static Header*
morecore(uint nu)
{
 9f3:	55                   	push   %ebp
 9f4:	89 e5                	mov    %esp,%ebp
 9f6:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9f9:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 a00:	77 07                	ja     a09 <morecore+0x16>
    nu = 4096;
 a02:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a09:	8b 45 08             	mov    0x8(%ebp),%eax
 a0c:	c1 e0 03             	shl    $0x3,%eax
 a0f:	89 04 24             	mov    %eax,(%esp)
 a12:	e8 4d fc ff ff       	call   664 <sbrk>
 a17:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 a1a:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 a1e:	75 07                	jne    a27 <morecore+0x34>
    return 0;
 a20:	b8 00 00 00 00       	mov    $0x0,%eax
 a25:	eb 22                	jmp    a49 <morecore+0x56>
  hp = (Header*)p;
 a27:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a2a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 a2d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a30:	8b 55 08             	mov    0x8(%ebp),%edx
 a33:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a36:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a39:	83 c0 08             	add    $0x8,%eax
 a3c:	89 04 24             	mov    %eax,(%esp)
 a3f:	e8 d8 fe ff ff       	call   91c <free>
  return freep;
 a44:	a1 88 0b 00 00       	mov    0xb88,%eax
}
 a49:	c9                   	leave  
 a4a:	c3                   	ret    

00000a4b <malloc>:

void*
malloc(uint nbytes)
{
 a4b:	55                   	push   %ebp
 a4c:	89 e5                	mov    %esp,%ebp
 a4e:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a51:	8b 45 08             	mov    0x8(%ebp),%eax
 a54:	83 c0 07             	add    $0x7,%eax
 a57:	c1 e8 03             	shr    $0x3,%eax
 a5a:	83 c0 01             	add    $0x1,%eax
 a5d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 a60:	a1 88 0b 00 00       	mov    0xb88,%eax
 a65:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a68:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a6c:	75 23                	jne    a91 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a6e:	c7 45 f0 80 0b 00 00 	movl   $0xb80,-0x10(%ebp)
 a75:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a78:	a3 88 0b 00 00       	mov    %eax,0xb88
 a7d:	a1 88 0b 00 00       	mov    0xb88,%eax
 a82:	a3 80 0b 00 00       	mov    %eax,0xb80
    base.s.size = 0;
 a87:	c7 05 84 0b 00 00 00 	movl   $0x0,0xb84
 a8e:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a91:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a94:	8b 00                	mov    (%eax),%eax
 a96:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 a99:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a9c:	8b 40 04             	mov    0x4(%eax),%eax
 a9f:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 aa2:	72 4d                	jb     af1 <malloc+0xa6>
      if(p->s.size == nunits)
 aa4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aa7:	8b 40 04             	mov    0x4(%eax),%eax
 aaa:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 aad:	75 0c                	jne    abb <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 aaf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ab2:	8b 10                	mov    (%eax),%edx
 ab4:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ab7:	89 10                	mov    %edx,(%eax)
 ab9:	eb 26                	jmp    ae1 <malloc+0x96>
      else {
        p->s.size -= nunits;
 abb:	8b 45 ec             	mov    -0x14(%ebp),%eax
 abe:	8b 40 04             	mov    0x4(%eax),%eax
 ac1:	89 c2                	mov    %eax,%edx
 ac3:	2b 55 f4             	sub    -0xc(%ebp),%edx
 ac6:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ac9:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 acc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 acf:	8b 40 04             	mov    0x4(%eax),%eax
 ad2:	c1 e0 03             	shl    $0x3,%eax
 ad5:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 ad8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 adb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 ade:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ae1:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ae4:	a3 88 0b 00 00       	mov    %eax,0xb88
      return (void*)(p + 1);
 ae9:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aec:	83 c0 08             	add    $0x8,%eax
 aef:	eb 38                	jmp    b29 <malloc+0xde>
    }
    if(p == freep)
 af1:	a1 88 0b 00 00       	mov    0xb88,%eax
 af6:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 af9:	75 1b                	jne    b16 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 afb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 afe:	89 04 24             	mov    %eax,(%esp)
 b01:	e8 ed fe ff ff       	call   9f3 <morecore>
 b06:	89 45 ec             	mov    %eax,-0x14(%ebp)
 b09:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b0d:	75 07                	jne    b16 <malloc+0xcb>
        return 0;
 b0f:	b8 00 00 00 00       	mov    $0x0,%eax
 b14:	eb 13                	jmp    b29 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b16:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b19:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b1c:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b1f:	8b 00                	mov    (%eax),%eax
 b21:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b24:	e9 70 ff ff ff       	jmp    a99 <malloc+0x4e>
}
 b29:	c9                   	leave  
 b2a:	c3                   	ret    
