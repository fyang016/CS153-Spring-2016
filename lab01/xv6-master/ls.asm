
_ls:     file format elf32-i386


Disassembly of section .text:

00000000 <fmtname>:
#include "user.h"
#include "fs.h"

char*
fmtname(char *path)
{
   0:	55                   	push   %ebp
   1:	89 e5                	mov    %esp,%ebp
   3:	53                   	push   %ebx
   4:	83 ec 24             	sub    $0x24,%esp
  static char buf[DIRSIZ+1];
  char *p;
  
  // Find first character after last slash.
  for(p=path+strlen(path); p >= path && *p != '/'; p--)
   7:	8b 45 08             	mov    0x8(%ebp),%eax
   a:	89 04 24             	mov    %eax,(%esp)
   d:	e8 eb 03 00 00       	call   3fd <strlen>
  12:	03 45 08             	add    0x8(%ebp),%eax
  15:	89 45 f4             	mov    %eax,-0xc(%ebp)
  18:	eb 04                	jmp    1e <fmtname+0x1e>
  1a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  1e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  21:	3b 45 08             	cmp    0x8(%ebp),%eax
  24:	72 0a                	jb     30 <fmtname+0x30>
  26:	8b 45 f4             	mov    -0xc(%ebp),%eax
  29:	0f b6 00             	movzbl (%eax),%eax
  2c:	3c 2f                	cmp    $0x2f,%al
  2e:	75 ea                	jne    1a <fmtname+0x1a>
    ;
  p++;
  30:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  34:	8b 45 f4             	mov    -0xc(%ebp),%eax
  37:	89 04 24             	mov    %eax,(%esp)
  3a:	e8 be 03 00 00       	call   3fd <strlen>
  3f:	83 f8 0d             	cmp    $0xd,%eax
  42:	76 05                	jbe    49 <fmtname+0x49>
    return p;
  44:	8b 45 f4             	mov    -0xc(%ebp),%eax
  47:	eb 5f                	jmp    a8 <fmtname+0xa8>
  memmove(buf, p, strlen(p));
  49:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 a9 03 00 00       	call   3fd <strlen>
  54:	89 44 24 08          	mov    %eax,0x8(%esp)
  58:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5b:	89 44 24 04          	mov    %eax,0x4(%esp)
  5f:	c7 04 24 84 0b 00 00 	movl   $0xb84,(%esp)
  66:	e8 17 05 00 00       	call   582 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  6e:	89 04 24             	mov    %eax,(%esp)
  71:	e8 87 03 00 00       	call   3fd <strlen>
  76:	ba 0e 00 00 00       	mov    $0xe,%edx
  7b:	89 d3                	mov    %edx,%ebx
  7d:	29 c3                	sub    %eax,%ebx
  7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  82:	89 04 24             	mov    %eax,(%esp)
  85:	e8 73 03 00 00       	call   3fd <strlen>
  8a:	05 84 0b 00 00       	add    $0xb84,%eax
  8f:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  93:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9a:	00 
  9b:	89 04 24             	mov    %eax,(%esp)
  9e:	e8 7f 03 00 00       	call   422 <memset>
  return buf;
  a3:	b8 84 0b 00 00       	mov    $0xb84,%eax
}
  a8:	83 c4 24             	add    $0x24,%esp
  ab:	5b                   	pop    %ebx
  ac:	5d                   	pop    %ebp
  ad:	c3                   	ret    

000000ae <ls>:

void
ls(char *path)
{
  ae:	55                   	push   %ebp
  af:	89 e5                	mov    %esp,%ebp
  b1:	57                   	push   %edi
  b2:	56                   	push   %esi
  b3:	53                   	push   %ebx
  b4:	81 ec 5c 02 00 00    	sub    $0x25c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
  ba:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c1:	00 
  c2:	8b 45 08             	mov    0x8(%ebp),%eax
  c5:	89 04 24             	mov    %eax,(%esp)
  c8:	e8 43 05 00 00       	call   610 <open>
  cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d4:	79 20                	jns    f6 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d6:	8b 45 08             	mov    0x8(%ebp),%eax
  d9:	89 44 24 08          	mov    %eax,0x8(%esp)
  dd:	c7 44 24 04 1f 0b 00 	movl   $0xb1f,0x4(%esp)
  e4:	00 
  e5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ec:	e8 68 06 00 00       	call   759 <printf>
    return;
  f1:	e9 01 02 00 00       	jmp    2f7 <ls+0x249>
  }
  
  if(fstat(fd, &st) < 0){
  f6:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fc:	89 44 24 04          	mov    %eax,0x4(%esp)
 100:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 103:	89 04 24             	mov    %eax,(%esp)
 106:	e8 1d 05 00 00       	call   628 <fstat>
 10b:	85 c0                	test   %eax,%eax
 10d:	79 2b                	jns    13a <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 10f:	8b 45 08             	mov    0x8(%ebp),%eax
 112:	89 44 24 08          	mov    %eax,0x8(%esp)
 116:	c7 44 24 04 33 0b 00 	movl   $0xb33,0x4(%esp)
 11d:	00 
 11e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 125:	e8 2f 06 00 00       	call   759 <printf>
    close(fd);
 12a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12d:	89 04 24             	mov    %eax,(%esp)
 130:	e8 c3 04 00 00       	call   5f8 <close>
    return;
 135:	e9 bd 01 00 00       	jmp    2f7 <ls+0x249>
  }
  
  switch(st.type){
 13a:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 141:	98                   	cwtl   
 142:	83 f8 01             	cmp    $0x1,%eax
 145:	74 53                	je     19a <ls+0xec>
 147:	83 f8 02             	cmp    $0x2,%eax
 14a:	0f 85 9c 01 00 00    	jne    2ec <ls+0x23e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 150:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 156:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15c:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 163:	0f bf d8             	movswl %ax,%ebx
 166:	8b 45 08             	mov    0x8(%ebp),%eax
 169:	89 04 24             	mov    %eax,(%esp)
 16c:	e8 8f fe ff ff       	call   0 <fmtname>
 171:	89 7c 24 14          	mov    %edi,0x14(%esp)
 175:	89 74 24 10          	mov    %esi,0x10(%esp)
 179:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 17d:	89 44 24 08          	mov    %eax,0x8(%esp)
 181:	c7 44 24 04 47 0b 00 	movl   $0xb47,0x4(%esp)
 188:	00 
 189:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 190:	e8 c4 05 00 00       	call   759 <printf>
    break;
 195:	e9 52 01 00 00       	jmp    2ec <ls+0x23e>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	89 04 24             	mov    %eax,(%esp)
 1a0:	e8 58 02 00 00       	call   3fd <strlen>
 1a5:	83 c0 10             	add    $0x10,%eax
 1a8:	3d 00 02 00 00       	cmp    $0x200,%eax
 1ad:	76 19                	jbe    1c8 <ls+0x11a>
      printf(1, "ls: path too long\n");
 1af:	c7 44 24 04 54 0b 00 	movl   $0xb54,0x4(%esp)
 1b6:	00 
 1b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1be:	e8 96 05 00 00       	call   759 <printf>
      break;
 1c3:	e9 24 01 00 00       	jmp    2ec <ls+0x23e>
    }
    strcpy(buf, path);
 1c8:	8b 45 08             	mov    0x8(%ebp),%eax
 1cb:	89 44 24 04          	mov    %eax,0x4(%esp)
 1cf:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d5:	89 04 24             	mov    %eax,(%esp)
 1d8:	e8 ac 01 00 00       	call   389 <strcpy>
    p = buf+strlen(buf);
 1dd:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e3:	89 04 24             	mov    %eax,(%esp)
 1e6:	e8 12 02 00 00       	call   3fd <strlen>
 1eb:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
 1f1:	8d 04 02             	lea    (%edx,%eax,1),%eax
 1f4:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f7:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1fa:	c6 00 2f             	movb   $0x2f,(%eax)
 1fd:	83 45 e0 01          	addl   $0x1,-0x20(%ebp)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 201:	e9 c0 00 00 00       	jmp    2c6 <ls+0x218>
      if(de.inum == 0)
 206:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 20d:	66 85 c0             	test   %ax,%ax
 210:	0f 84 af 00 00 00    	je     2c5 <ls+0x217>
        continue;
      memmove(p, de.name, DIRSIZ);
 216:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 21d:	00 
 21e:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 224:	83 c0 02             	add    $0x2,%eax
 227:	89 44 24 04          	mov    %eax,0x4(%esp)
 22b:	8b 45 e0             	mov    -0x20(%ebp),%eax
 22e:	89 04 24             	mov    %eax,(%esp)
 231:	e8 4c 03 00 00       	call   582 <memmove>
      p[DIRSIZ] = 0;
 236:	8b 45 e0             	mov    -0x20(%ebp),%eax
 239:	83 c0 0e             	add    $0xe,%eax
 23c:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 23f:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 245:	89 44 24 04          	mov    %eax,0x4(%esp)
 249:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 24f:	89 04 24             	mov    %eax,(%esp)
 252:	e8 91 02 00 00       	call   4e8 <stat>
 257:	85 c0                	test   %eax,%eax
 259:	79 20                	jns    27b <ls+0x1cd>
        printf(1, "ls: cannot stat %s\n", buf);
 25b:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 261:	89 44 24 08          	mov    %eax,0x8(%esp)
 265:	c7 44 24 04 33 0b 00 	movl   $0xb33,0x4(%esp)
 26c:	00 
 26d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 274:	e8 e0 04 00 00       	call   759 <printf>
        continue;
 279:	eb 4b                	jmp    2c6 <ls+0x218>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 27b:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 281:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 287:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 28e:	0f bf d8             	movswl %ax,%ebx
 291:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 297:	89 04 24             	mov    %eax,(%esp)
 29a:	e8 61 fd ff ff       	call   0 <fmtname>
 29f:	89 7c 24 14          	mov    %edi,0x14(%esp)
 2a3:	89 74 24 10          	mov    %esi,0x10(%esp)
 2a7:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 2ab:	89 44 24 08          	mov    %eax,0x8(%esp)
 2af:	c7 44 24 04 47 0b 00 	movl   $0xb47,0x4(%esp)
 2b6:	00 
 2b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2be:	e8 96 04 00 00       	call   759 <printf>
 2c3:	eb 01                	jmp    2c6 <ls+0x218>
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
      if(de.inum == 0)
        continue;
 2c5:	90                   	nop
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c6:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 2cd:	00 
 2ce:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2d4:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d8:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2db:	89 04 24             	mov    %eax,(%esp)
 2de:	e8 05 03 00 00       	call   5e8 <read>
 2e3:	83 f8 10             	cmp    $0x10,%eax
 2e6:	0f 84 1a ff ff ff    	je     206 <ls+0x158>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
  }
  close(fd);
 2ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2ef:	89 04 24             	mov    %eax,(%esp)
 2f2:	e8 01 03 00 00       	call   5f8 <close>
}
 2f7:	81 c4 5c 02 00 00    	add    $0x25c,%esp
 2fd:	5b                   	pop    %ebx
 2fe:	5e                   	pop    %esi
 2ff:	5f                   	pop    %edi
 300:	5d                   	pop    %ebp
 301:	c3                   	ret    

00000302 <main>:

int
main(int argc, char *argv[])
{
 302:	55                   	push   %ebp
 303:	89 e5                	mov    %esp,%ebp
 305:	83 e4 f0             	and    $0xfffffff0,%esp
 308:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
 30b:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 30f:	7f 18                	jg     329 <main+0x27>
    ls(".");
 311:	c7 04 24 67 0b 00 00 	movl   $0xb67,(%esp)
 318:	e8 91 fd ff ff       	call   ae <ls>
    exit(0);
 31d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 324:	e8 9f 02 00 00       	call   5c8 <exit>
  }
  for(i=1; i<argc; i++)
 329:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 330:	00 
 331:	eb 19                	jmp    34c <main+0x4a>
    ls(argv[i]);
 333:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 337:	c1 e0 02             	shl    $0x2,%eax
 33a:	03 45 0c             	add    0xc(%ebp),%eax
 33d:	8b 00                	mov    (%eax),%eax
 33f:	89 04 24             	mov    %eax,(%esp)
 342:	e8 67 fd ff ff       	call   ae <ls>

  if(argc < 2){
    ls(".");
    exit(0);
  }
  for(i=1; i<argc; i++)
 347:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 34c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 350:	3b 45 08             	cmp    0x8(%ebp),%eax
 353:	7c de                	jl     333 <main+0x31>
    ls(argv[i]);
  exit(0);
 355:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 35c:	e8 67 02 00 00       	call   5c8 <exit>
 361:	90                   	nop
 362:	90                   	nop
 363:	90                   	nop

00000364 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 364:	55                   	push   %ebp
 365:	89 e5                	mov    %esp,%ebp
 367:	57                   	push   %edi
 368:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 369:	8b 4d 08             	mov    0x8(%ebp),%ecx
 36c:	8b 55 10             	mov    0x10(%ebp),%edx
 36f:	8b 45 0c             	mov    0xc(%ebp),%eax
 372:	89 cb                	mov    %ecx,%ebx
 374:	89 df                	mov    %ebx,%edi
 376:	89 d1                	mov    %edx,%ecx
 378:	fc                   	cld    
 379:	f3 aa                	rep stos %al,%es:(%edi)
 37b:	89 ca                	mov    %ecx,%edx
 37d:	89 fb                	mov    %edi,%ebx
 37f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 382:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 385:	5b                   	pop    %ebx
 386:	5f                   	pop    %edi
 387:	5d                   	pop    %ebp
 388:	c3                   	ret    

00000389 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 389:	55                   	push   %ebp
 38a:	89 e5                	mov    %esp,%ebp
 38c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 38f:	8b 45 08             	mov    0x8(%ebp),%eax
 392:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 395:	8b 45 0c             	mov    0xc(%ebp),%eax
 398:	0f b6 10             	movzbl (%eax),%edx
 39b:	8b 45 08             	mov    0x8(%ebp),%eax
 39e:	88 10                	mov    %dl,(%eax)
 3a0:	8b 45 08             	mov    0x8(%ebp),%eax
 3a3:	0f b6 00             	movzbl (%eax),%eax
 3a6:	84 c0                	test   %al,%al
 3a8:	0f 95 c0             	setne  %al
 3ab:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3af:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 3b3:	84 c0                	test   %al,%al
 3b5:	75 de                	jne    395 <strcpy+0xc>
    ;
  return os;
 3b7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ba:	c9                   	leave  
 3bb:	c3                   	ret    

000003bc <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3bc:	55                   	push   %ebp
 3bd:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3bf:	eb 08                	jmp    3c9 <strcmp+0xd>
    p++, q++;
 3c1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3c5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3c9:	8b 45 08             	mov    0x8(%ebp),%eax
 3cc:	0f b6 00             	movzbl (%eax),%eax
 3cf:	84 c0                	test   %al,%al
 3d1:	74 10                	je     3e3 <strcmp+0x27>
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	0f b6 10             	movzbl (%eax),%edx
 3d9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3dc:	0f b6 00             	movzbl (%eax),%eax
 3df:	38 c2                	cmp    %al,%dl
 3e1:	74 de                	je     3c1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3e3:	8b 45 08             	mov    0x8(%ebp),%eax
 3e6:	0f b6 00             	movzbl (%eax),%eax
 3e9:	0f b6 d0             	movzbl %al,%edx
 3ec:	8b 45 0c             	mov    0xc(%ebp),%eax
 3ef:	0f b6 00             	movzbl (%eax),%eax
 3f2:	0f b6 c0             	movzbl %al,%eax
 3f5:	89 d1                	mov    %edx,%ecx
 3f7:	29 c1                	sub    %eax,%ecx
 3f9:	89 c8                	mov    %ecx,%eax
}
 3fb:	5d                   	pop    %ebp
 3fc:	c3                   	ret    

000003fd <strlen>:

uint
strlen(char *s)
{
 3fd:	55                   	push   %ebp
 3fe:	89 e5                	mov    %esp,%ebp
 400:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 403:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 40a:	eb 04                	jmp    410 <strlen+0x13>
 40c:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 410:	8b 45 fc             	mov    -0x4(%ebp),%eax
 413:	03 45 08             	add    0x8(%ebp),%eax
 416:	0f b6 00             	movzbl (%eax),%eax
 419:	84 c0                	test   %al,%al
 41b:	75 ef                	jne    40c <strlen+0xf>
    ;
  return n;
 41d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 420:	c9                   	leave  
 421:	c3                   	ret    

00000422 <memset>:

void*
memset(void *dst, int c, uint n)
{
 422:	55                   	push   %ebp
 423:	89 e5                	mov    %esp,%ebp
 425:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 428:	8b 45 10             	mov    0x10(%ebp),%eax
 42b:	89 44 24 08          	mov    %eax,0x8(%esp)
 42f:	8b 45 0c             	mov    0xc(%ebp),%eax
 432:	89 44 24 04          	mov    %eax,0x4(%esp)
 436:	8b 45 08             	mov    0x8(%ebp),%eax
 439:	89 04 24             	mov    %eax,(%esp)
 43c:	e8 23 ff ff ff       	call   364 <stosb>
  return dst;
 441:	8b 45 08             	mov    0x8(%ebp),%eax
}
 444:	c9                   	leave  
 445:	c3                   	ret    

00000446 <strchr>:

char*
strchr(const char *s, char c)
{
 446:	55                   	push   %ebp
 447:	89 e5                	mov    %esp,%ebp
 449:	83 ec 04             	sub    $0x4,%esp
 44c:	8b 45 0c             	mov    0xc(%ebp),%eax
 44f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 452:	eb 14                	jmp    468 <strchr+0x22>
    if(*s == c)
 454:	8b 45 08             	mov    0x8(%ebp),%eax
 457:	0f b6 00             	movzbl (%eax),%eax
 45a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 45d:	75 05                	jne    464 <strchr+0x1e>
      return (char*)s;
 45f:	8b 45 08             	mov    0x8(%ebp),%eax
 462:	eb 13                	jmp    477 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 464:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 468:	8b 45 08             	mov    0x8(%ebp),%eax
 46b:	0f b6 00             	movzbl (%eax),%eax
 46e:	84 c0                	test   %al,%al
 470:	75 e2                	jne    454 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 472:	b8 00 00 00 00       	mov    $0x0,%eax
}
 477:	c9                   	leave  
 478:	c3                   	ret    

00000479 <gets>:

char*
gets(char *buf, int max)
{
 479:	55                   	push   %ebp
 47a:	89 e5                	mov    %esp,%ebp
 47c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 47f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 486:	eb 44                	jmp    4cc <gets+0x53>
    cc = read(0, &c, 1);
 488:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 48f:	00 
 490:	8d 45 ef             	lea    -0x11(%ebp),%eax
 493:	89 44 24 04          	mov    %eax,0x4(%esp)
 497:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 49e:	e8 45 01 00 00       	call   5e8 <read>
 4a3:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 4a6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 4aa:	7e 2d                	jle    4d9 <gets+0x60>
      break;
    buf[i++] = c;
 4ac:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4af:	03 45 08             	add    0x8(%ebp),%eax
 4b2:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 4b6:	88 10                	mov    %dl,(%eax)
 4b8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 4bc:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c0:	3c 0a                	cmp    $0xa,%al
 4c2:	74 16                	je     4da <gets+0x61>
 4c4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c8:	3c 0d                	cmp    $0xd,%al
 4ca:	74 0e                	je     4da <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4cc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4cf:	83 c0 01             	add    $0x1,%eax
 4d2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d5:	7c b1                	jl     488 <gets+0xf>
 4d7:	eb 01                	jmp    4da <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 4d9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4da:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4dd:	03 45 08             	add    0x8(%ebp),%eax
 4e0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4e3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e6:	c9                   	leave  
 4e7:	c3                   	ret    

000004e8 <stat>:

int
stat(char *n, struct stat *st)
{
 4e8:	55                   	push   %ebp
 4e9:	89 e5                	mov    %esp,%ebp
 4eb:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4ee:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f5:	00 
 4f6:	8b 45 08             	mov    0x8(%ebp),%eax
 4f9:	89 04 24             	mov    %eax,(%esp)
 4fc:	e8 0f 01 00 00       	call   610 <open>
 501:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 504:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 508:	79 07                	jns    511 <stat+0x29>
    return -1;
 50a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50f:	eb 23                	jmp    534 <stat+0x4c>
  r = fstat(fd, st);
 511:	8b 45 0c             	mov    0xc(%ebp),%eax
 514:	89 44 24 04          	mov    %eax,0x4(%esp)
 518:	8b 45 f0             	mov    -0x10(%ebp),%eax
 51b:	89 04 24             	mov    %eax,(%esp)
 51e:	e8 05 01 00 00       	call   628 <fstat>
 523:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 526:	8b 45 f0             	mov    -0x10(%ebp),%eax
 529:	89 04 24             	mov    %eax,(%esp)
 52c:	e8 c7 00 00 00       	call   5f8 <close>
  return r;
 531:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 534:	c9                   	leave  
 535:	c3                   	ret    

00000536 <atoi>:

int
atoi(const char *s)
{
 536:	55                   	push   %ebp
 537:	89 e5                	mov    %esp,%ebp
 539:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 53c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 543:	eb 24                	jmp    569 <atoi+0x33>
    n = n*10 + *s++ - '0';
 545:	8b 55 fc             	mov    -0x4(%ebp),%edx
 548:	89 d0                	mov    %edx,%eax
 54a:	c1 e0 02             	shl    $0x2,%eax
 54d:	01 d0                	add    %edx,%eax
 54f:	01 c0                	add    %eax,%eax
 551:	89 c2                	mov    %eax,%edx
 553:	8b 45 08             	mov    0x8(%ebp),%eax
 556:	0f b6 00             	movzbl (%eax),%eax
 559:	0f be c0             	movsbl %al,%eax
 55c:	8d 04 02             	lea    (%edx,%eax,1),%eax
 55f:	83 e8 30             	sub    $0x30,%eax
 562:	89 45 fc             	mov    %eax,-0x4(%ebp)
 565:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 569:	8b 45 08             	mov    0x8(%ebp),%eax
 56c:	0f b6 00             	movzbl (%eax),%eax
 56f:	3c 2f                	cmp    $0x2f,%al
 571:	7e 0a                	jle    57d <atoi+0x47>
 573:	8b 45 08             	mov    0x8(%ebp),%eax
 576:	0f b6 00             	movzbl (%eax),%eax
 579:	3c 39                	cmp    $0x39,%al
 57b:	7e c8                	jle    545 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 57d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 580:	c9                   	leave  
 581:	c3                   	ret    

00000582 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 582:	55                   	push   %ebp
 583:	89 e5                	mov    %esp,%ebp
 585:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 588:	8b 45 08             	mov    0x8(%ebp),%eax
 58b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 58e:	8b 45 0c             	mov    0xc(%ebp),%eax
 591:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 594:	eb 13                	jmp    5a9 <memmove+0x27>
    *dst++ = *src++;
 596:	8b 45 fc             	mov    -0x4(%ebp),%eax
 599:	0f b6 10             	movzbl (%eax),%edx
 59c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 59f:	88 10                	mov    %dl,(%eax)
 5a1:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 5a5:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5a9:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 5ad:	0f 9f c0             	setg   %al
 5b0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 5b4:	84 c0                	test   %al,%al
 5b6:	75 de                	jne    596 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5b8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5bb:	c9                   	leave  
 5bc:	c3                   	ret    
 5bd:	90                   	nop
 5be:	90                   	nop
 5bf:	90                   	nop

000005c0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5c0:	b8 01 00 00 00       	mov    $0x1,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <exit>:
SYSCALL(exit)
 5c8:	b8 02 00 00 00       	mov    $0x2,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <wait>:
SYSCALL(wait)
 5d0:	b8 03 00 00 00       	mov    $0x3,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <waitpid>:
SYSCALL(waitpid)
 5d8:	b8 17 00 00 00       	mov    $0x17,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <pipe>:
SYSCALL(pipe)
 5e0:	b8 04 00 00 00       	mov    $0x4,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <read>:
SYSCALL(read)
 5e8:	b8 05 00 00 00       	mov    $0x5,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <write>:
SYSCALL(write)
 5f0:	b8 10 00 00 00       	mov    $0x10,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <close>:
SYSCALL(close)
 5f8:	b8 15 00 00 00       	mov    $0x15,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <kill>:
SYSCALL(kill)
 600:	b8 06 00 00 00       	mov    $0x6,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <exec>:
SYSCALL(exec)
 608:	b8 07 00 00 00       	mov    $0x7,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <open>:
SYSCALL(open)
 610:	b8 0f 00 00 00       	mov    $0xf,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <mknod>:
SYSCALL(mknod)
 618:	b8 11 00 00 00       	mov    $0x11,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <unlink>:
SYSCALL(unlink)
 620:	b8 12 00 00 00       	mov    $0x12,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <fstat>:
SYSCALL(fstat)
 628:	b8 08 00 00 00       	mov    $0x8,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <link>:
SYSCALL(link)
 630:	b8 13 00 00 00       	mov    $0x13,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <mkdir>:
SYSCALL(mkdir)
 638:	b8 14 00 00 00       	mov    $0x14,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <chdir>:
SYSCALL(chdir)
 640:	b8 09 00 00 00       	mov    $0x9,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <dup>:
SYSCALL(dup)
 648:	b8 0a 00 00 00       	mov    $0xa,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <getpid>:
SYSCALL(getpid)
 650:	b8 0b 00 00 00       	mov    $0xb,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <sbrk>:
SYSCALL(sbrk)
 658:	b8 0c 00 00 00       	mov    $0xc,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <sleep>:
SYSCALL(sleep)
 660:	b8 0d 00 00 00       	mov    $0xd,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <uptime>:
SYSCALL(uptime)
 668:	b8 0e 00 00 00       	mov    $0xe,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <count>:
SYSCALL(count)
 670:	b8 16 00 00 00       	mov    $0x16,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <change_priority>:
SYSCALL(change_priority)
 678:	b8 18 00 00 00       	mov    $0x18,%eax
 67d:	cd 40                	int    $0x40
 67f:	c3                   	ret    

00000680 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 680:	55                   	push   %ebp
 681:	89 e5                	mov    %esp,%ebp
 683:	83 ec 28             	sub    $0x28,%esp
 686:	8b 45 0c             	mov    0xc(%ebp),%eax
 689:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 68c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 693:	00 
 694:	8d 45 f4             	lea    -0xc(%ebp),%eax
 697:	89 44 24 04          	mov    %eax,0x4(%esp)
 69b:	8b 45 08             	mov    0x8(%ebp),%eax
 69e:	89 04 24             	mov    %eax,(%esp)
 6a1:	e8 4a ff ff ff       	call   5f0 <write>
}
 6a6:	c9                   	leave  
 6a7:	c3                   	ret    

000006a8 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6a8:	55                   	push   %ebp
 6a9:	89 e5                	mov    %esp,%ebp
 6ab:	53                   	push   %ebx
 6ac:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6af:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6b6:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6ba:	74 17                	je     6d3 <printint+0x2b>
 6bc:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6c0:	79 11                	jns    6d3 <printint+0x2b>
    neg = 1;
 6c2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 6cc:	f7 d8                	neg    %eax
 6ce:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6d1:	eb 06                	jmp    6d9 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6d3:	8b 45 0c             	mov    0xc(%ebp),%eax
 6d6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 6d9:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 6e0:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 6e3:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6e6:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6e9:	ba 00 00 00 00       	mov    $0x0,%edx
 6ee:	f7 f3                	div    %ebx
 6f0:	89 d0                	mov    %edx,%eax
 6f2:	0f b6 80 70 0b 00 00 	movzbl 0xb70(%eax),%eax
 6f9:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 6fd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 701:	8b 45 10             	mov    0x10(%ebp),%eax
 704:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 707:	8b 45 f4             	mov    -0xc(%ebp),%eax
 70a:	ba 00 00 00 00       	mov    $0x0,%edx
 70f:	f7 75 d4             	divl   -0x2c(%ebp)
 712:	89 45 f4             	mov    %eax,-0xc(%ebp)
 715:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 719:	75 c5                	jne    6e0 <printint+0x38>
  if(neg)
 71b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 71f:	74 28                	je     749 <printint+0xa1>
    buf[i++] = '-';
 721:	8b 45 ec             	mov    -0x14(%ebp),%eax
 724:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 729:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 72d:	eb 1a                	jmp    749 <printint+0xa1>
    putc(fd, buf[i]);
 72f:	8b 45 ec             	mov    -0x14(%ebp),%eax
 732:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 737:	0f be c0             	movsbl %al,%eax
 73a:	89 44 24 04          	mov    %eax,0x4(%esp)
 73e:	8b 45 08             	mov    0x8(%ebp),%eax
 741:	89 04 24             	mov    %eax,(%esp)
 744:	e8 37 ff ff ff       	call   680 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 749:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 74d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 751:	79 dc                	jns    72f <printint+0x87>
    putc(fd, buf[i]);
}
 753:	83 c4 44             	add    $0x44,%esp
 756:	5b                   	pop    %ebx
 757:	5d                   	pop    %ebp
 758:	c3                   	ret    

00000759 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 759:	55                   	push   %ebp
 75a:	89 e5                	mov    %esp,%ebp
 75c:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 75f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 766:	8d 45 0c             	lea    0xc(%ebp),%eax
 769:	83 c0 04             	add    $0x4,%eax
 76c:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 76f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 776:	e9 7e 01 00 00       	jmp    8f9 <printf+0x1a0>
    c = fmt[i] & 0xff;
 77b:	8b 55 0c             	mov    0xc(%ebp),%edx
 77e:	8b 45 ec             	mov    -0x14(%ebp),%eax
 781:	8d 04 02             	lea    (%edx,%eax,1),%eax
 784:	0f b6 00             	movzbl (%eax),%eax
 787:	0f be c0             	movsbl %al,%eax
 78a:	25 ff 00 00 00       	and    $0xff,%eax
 78f:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 792:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 796:	75 2c                	jne    7c4 <printf+0x6b>
      if(c == '%'){
 798:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 79c:	75 0c                	jne    7aa <printf+0x51>
        state = '%';
 79e:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 7a5:	e9 4b 01 00 00       	jmp    8f5 <printf+0x19c>
      } else {
        putc(fd, c);
 7aa:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7ad:	0f be c0             	movsbl %al,%eax
 7b0:	89 44 24 04          	mov    %eax,0x4(%esp)
 7b4:	8b 45 08             	mov    0x8(%ebp),%eax
 7b7:	89 04 24             	mov    %eax,(%esp)
 7ba:	e8 c1 fe ff ff       	call   680 <putc>
 7bf:	e9 31 01 00 00       	jmp    8f5 <printf+0x19c>
      }
    } else if(state == '%'){
 7c4:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 7c8:	0f 85 27 01 00 00    	jne    8f5 <printf+0x19c>
      if(c == 'd'){
 7ce:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 7d2:	75 2d                	jne    801 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 7d4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7d7:	8b 00                	mov    (%eax),%eax
 7d9:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7e0:	00 
 7e1:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7e8:	00 
 7e9:	89 44 24 04          	mov    %eax,0x4(%esp)
 7ed:	8b 45 08             	mov    0x8(%ebp),%eax
 7f0:	89 04 24             	mov    %eax,(%esp)
 7f3:	e8 b0 fe ff ff       	call   6a8 <printint>
        ap++;
 7f8:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 7fc:	e9 ed 00 00 00       	jmp    8ee <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 801:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 805:	74 06                	je     80d <printf+0xb4>
 807:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 80b:	75 2d                	jne    83a <printf+0xe1>
        printint(fd, *ap, 16, 0);
 80d:	8b 45 f4             	mov    -0xc(%ebp),%eax
 810:	8b 00                	mov    (%eax),%eax
 812:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 819:	00 
 81a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 821:	00 
 822:	89 44 24 04          	mov    %eax,0x4(%esp)
 826:	8b 45 08             	mov    0x8(%ebp),%eax
 829:	89 04 24             	mov    %eax,(%esp)
 82c:	e8 77 fe ff ff       	call   6a8 <printint>
        ap++;
 831:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 835:	e9 b4 00 00 00       	jmp    8ee <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 83a:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 83e:	75 46                	jne    886 <printf+0x12d>
        s = (char*)*ap;
 840:	8b 45 f4             	mov    -0xc(%ebp),%eax
 843:	8b 00                	mov    (%eax),%eax
 845:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 848:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 84c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 850:	75 27                	jne    879 <printf+0x120>
          s = "(null)";
 852:	c7 45 e4 69 0b 00 00 	movl   $0xb69,-0x1c(%ebp)
        while(*s != 0){
 859:	eb 1f                	jmp    87a <printf+0x121>
          putc(fd, *s);
 85b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 85e:	0f b6 00             	movzbl (%eax),%eax
 861:	0f be c0             	movsbl %al,%eax
 864:	89 44 24 04          	mov    %eax,0x4(%esp)
 868:	8b 45 08             	mov    0x8(%ebp),%eax
 86b:	89 04 24             	mov    %eax,(%esp)
 86e:	e8 0d fe ff ff       	call   680 <putc>
          s++;
 873:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 877:	eb 01                	jmp    87a <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 879:	90                   	nop
 87a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 87d:	0f b6 00             	movzbl (%eax),%eax
 880:	84 c0                	test   %al,%al
 882:	75 d7                	jne    85b <printf+0x102>
 884:	eb 68                	jmp    8ee <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 886:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 88a:	75 1d                	jne    8a9 <printf+0x150>
        putc(fd, *ap);
 88c:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88f:	8b 00                	mov    (%eax),%eax
 891:	0f be c0             	movsbl %al,%eax
 894:	89 44 24 04          	mov    %eax,0x4(%esp)
 898:	8b 45 08             	mov    0x8(%ebp),%eax
 89b:	89 04 24             	mov    %eax,(%esp)
 89e:	e8 dd fd ff ff       	call   680 <putc>
        ap++;
 8a3:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 8a7:	eb 45                	jmp    8ee <printf+0x195>
      } else if(c == '%'){
 8a9:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 8ad:	75 17                	jne    8c6 <printf+0x16d>
        putc(fd, c);
 8af:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8b2:	0f be c0             	movsbl %al,%eax
 8b5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8b9:	8b 45 08             	mov    0x8(%ebp),%eax
 8bc:	89 04 24             	mov    %eax,(%esp)
 8bf:	e8 bc fd ff ff       	call   680 <putc>
 8c4:	eb 28                	jmp    8ee <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8c6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8cd:	00 
 8ce:	8b 45 08             	mov    0x8(%ebp),%eax
 8d1:	89 04 24             	mov    %eax,(%esp)
 8d4:	e8 a7 fd ff ff       	call   680 <putc>
        putc(fd, c);
 8d9:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8dc:	0f be c0             	movsbl %al,%eax
 8df:	89 44 24 04          	mov    %eax,0x4(%esp)
 8e3:	8b 45 08             	mov    0x8(%ebp),%eax
 8e6:	89 04 24             	mov    %eax,(%esp)
 8e9:	e8 92 fd ff ff       	call   680 <putc>
      }
      state = 0;
 8ee:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8f5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 8f9:	8b 55 0c             	mov    0xc(%ebp),%edx
 8fc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8ff:	8d 04 02             	lea    (%edx,%eax,1),%eax
 902:	0f b6 00             	movzbl (%eax),%eax
 905:	84 c0                	test   %al,%al
 907:	0f 85 6e fe ff ff    	jne    77b <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 90d:	c9                   	leave  
 90e:	c3                   	ret    
 90f:	90                   	nop

00000910 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 910:	55                   	push   %ebp
 911:	89 e5                	mov    %esp,%ebp
 913:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 916:	8b 45 08             	mov    0x8(%ebp),%eax
 919:	83 e8 08             	sub    $0x8,%eax
 91c:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 91f:	a1 9c 0b 00 00       	mov    0xb9c,%eax
 924:	89 45 fc             	mov    %eax,-0x4(%ebp)
 927:	eb 24                	jmp    94d <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 929:	8b 45 fc             	mov    -0x4(%ebp),%eax
 92c:	8b 00                	mov    (%eax),%eax
 92e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 931:	77 12                	ja     945 <free+0x35>
 933:	8b 45 f8             	mov    -0x8(%ebp),%eax
 936:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 939:	77 24                	ja     95f <free+0x4f>
 93b:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93e:	8b 00                	mov    (%eax),%eax
 940:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 943:	77 1a                	ja     95f <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 945:	8b 45 fc             	mov    -0x4(%ebp),%eax
 948:	8b 00                	mov    (%eax),%eax
 94a:	89 45 fc             	mov    %eax,-0x4(%ebp)
 94d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 950:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 953:	76 d4                	jbe    929 <free+0x19>
 955:	8b 45 fc             	mov    -0x4(%ebp),%eax
 958:	8b 00                	mov    (%eax),%eax
 95a:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 95d:	76 ca                	jbe    929 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 95f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 962:	8b 40 04             	mov    0x4(%eax),%eax
 965:	c1 e0 03             	shl    $0x3,%eax
 968:	89 c2                	mov    %eax,%edx
 96a:	03 55 f8             	add    -0x8(%ebp),%edx
 96d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 970:	8b 00                	mov    (%eax),%eax
 972:	39 c2                	cmp    %eax,%edx
 974:	75 24                	jne    99a <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 976:	8b 45 f8             	mov    -0x8(%ebp),%eax
 979:	8b 50 04             	mov    0x4(%eax),%edx
 97c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 97f:	8b 00                	mov    (%eax),%eax
 981:	8b 40 04             	mov    0x4(%eax),%eax
 984:	01 c2                	add    %eax,%edx
 986:	8b 45 f8             	mov    -0x8(%ebp),%eax
 989:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 98c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98f:	8b 00                	mov    (%eax),%eax
 991:	8b 10                	mov    (%eax),%edx
 993:	8b 45 f8             	mov    -0x8(%ebp),%eax
 996:	89 10                	mov    %edx,(%eax)
 998:	eb 0a                	jmp    9a4 <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 99a:	8b 45 fc             	mov    -0x4(%ebp),%eax
 99d:	8b 10                	mov    (%eax),%edx
 99f:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9a2:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9a4:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a7:	8b 40 04             	mov    0x4(%eax),%eax
 9aa:	c1 e0 03             	shl    $0x3,%eax
 9ad:	03 45 fc             	add    -0x4(%ebp),%eax
 9b0:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9b3:	75 20                	jne    9d5 <free+0xc5>
    p->s.size += bp->s.size;
 9b5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b8:	8b 50 04             	mov    0x4(%eax),%edx
 9bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9be:	8b 40 04             	mov    0x4(%eax),%eax
 9c1:	01 c2                	add    %eax,%edx
 9c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c6:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9c9:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9cc:	8b 10                	mov    (%eax),%edx
 9ce:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d1:	89 10                	mov    %edx,(%eax)
 9d3:	eb 08                	jmp    9dd <free+0xcd>
  } else
    p->s.ptr = bp;
 9d5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d8:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9db:	89 10                	mov    %edx,(%eax)
  freep = p;
 9dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e0:	a3 9c 0b 00 00       	mov    %eax,0xb9c
}
 9e5:	c9                   	leave  
 9e6:	c3                   	ret    

000009e7 <morecore>:

static Header*
morecore(uint nu)
{
 9e7:	55                   	push   %ebp
 9e8:	89 e5                	mov    %esp,%ebp
 9ea:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9ed:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9f4:	77 07                	ja     9fd <morecore+0x16>
    nu = 4096;
 9f6:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9fd:	8b 45 08             	mov    0x8(%ebp),%eax
 a00:	c1 e0 03             	shl    $0x3,%eax
 a03:	89 04 24             	mov    %eax,(%esp)
 a06:	e8 4d fc ff ff       	call   658 <sbrk>
 a0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 a0e:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 a12:	75 07                	jne    a1b <morecore+0x34>
    return 0;
 a14:	b8 00 00 00 00       	mov    $0x0,%eax
 a19:	eb 22                	jmp    a3d <morecore+0x56>
  hp = (Header*)p;
 a1b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a1e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 a21:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a24:	8b 55 08             	mov    0x8(%ebp),%edx
 a27:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a2d:	83 c0 08             	add    $0x8,%eax
 a30:	89 04 24             	mov    %eax,(%esp)
 a33:	e8 d8 fe ff ff       	call   910 <free>
  return freep;
 a38:	a1 9c 0b 00 00       	mov    0xb9c,%eax
}
 a3d:	c9                   	leave  
 a3e:	c3                   	ret    

00000a3f <malloc>:

void*
malloc(uint nbytes)
{
 a3f:	55                   	push   %ebp
 a40:	89 e5                	mov    %esp,%ebp
 a42:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a45:	8b 45 08             	mov    0x8(%ebp),%eax
 a48:	83 c0 07             	add    $0x7,%eax
 a4b:	c1 e8 03             	shr    $0x3,%eax
 a4e:	83 c0 01             	add    $0x1,%eax
 a51:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 a54:	a1 9c 0b 00 00       	mov    0xb9c,%eax
 a59:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a5c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a60:	75 23                	jne    a85 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a62:	c7 45 f0 94 0b 00 00 	movl   $0xb94,-0x10(%ebp)
 a69:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a6c:	a3 9c 0b 00 00       	mov    %eax,0xb9c
 a71:	a1 9c 0b 00 00       	mov    0xb9c,%eax
 a76:	a3 94 0b 00 00       	mov    %eax,0xb94
    base.s.size = 0;
 a7b:	c7 05 98 0b 00 00 00 	movl   $0x0,0xb98
 a82:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a85:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a88:	8b 00                	mov    (%eax),%eax
 a8a:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 a8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a90:	8b 40 04             	mov    0x4(%eax),%eax
 a93:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 a96:	72 4d                	jb     ae5 <malloc+0xa6>
      if(p->s.size == nunits)
 a98:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a9b:	8b 40 04             	mov    0x4(%eax),%eax
 a9e:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 aa1:	75 0c                	jne    aaf <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 aa3:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aa6:	8b 10                	mov    (%eax),%edx
 aa8:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aab:	89 10                	mov    %edx,(%eax)
 aad:	eb 26                	jmp    ad5 <malloc+0x96>
      else {
        p->s.size -= nunits;
 aaf:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ab2:	8b 40 04             	mov    0x4(%eax),%eax
 ab5:	89 c2                	mov    %eax,%edx
 ab7:	2b 55 f4             	sub    -0xc(%ebp),%edx
 aba:	8b 45 ec             	mov    -0x14(%ebp),%eax
 abd:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ac0:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ac3:	8b 40 04             	mov    0x4(%eax),%eax
 ac6:	c1 e0 03             	shl    $0x3,%eax
 ac9:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 acc:	8b 45 ec             	mov    -0x14(%ebp),%eax
 acf:	8b 55 f4             	mov    -0xc(%ebp),%edx
 ad2:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 ad5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ad8:	a3 9c 0b 00 00       	mov    %eax,0xb9c
      return (void*)(p + 1);
 add:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ae0:	83 c0 08             	add    $0x8,%eax
 ae3:	eb 38                	jmp    b1d <malloc+0xde>
    }
    if(p == freep)
 ae5:	a1 9c 0b 00 00       	mov    0xb9c,%eax
 aea:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 aed:	75 1b                	jne    b0a <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 aef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af2:	89 04 24             	mov    %eax,(%esp)
 af5:	e8 ed fe ff ff       	call   9e7 <morecore>
 afa:	89 45 ec             	mov    %eax,-0x14(%ebp)
 afd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 b01:	75 07                	jne    b0a <malloc+0xcb>
        return 0;
 b03:	b8 00 00 00 00       	mov    $0x0,%eax
 b08:	eb 13                	jmp    b1d <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b0a:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b10:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b13:	8b 00                	mov    (%eax),%eax
 b15:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b18:	e9 70 ff ff ff       	jmp    a8d <malloc+0x4e>
}
 b1d:	c9                   	leave  
 b1e:	c3                   	ret    
