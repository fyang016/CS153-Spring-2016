
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
   d:	e8 db 03 00 00       	call   3ed <strlen>
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
  3a:	e8 ae 03 00 00       	call   3ed <strlen>
  3f:	83 f8 0d             	cmp    $0xd,%eax
  42:	76 05                	jbe    49 <fmtname+0x49>
    return p;
  44:	8b 45 f4             	mov    -0xc(%ebp),%eax
  47:	eb 5f                	jmp    a8 <fmtname+0xa8>
  memmove(buf, p, strlen(p));
  49:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4c:	89 04 24             	mov    %eax,(%esp)
  4f:	e8 99 03 00 00       	call   3ed <strlen>
  54:	89 44 24 08          	mov    %eax,0x8(%esp)
  58:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5b:	89 44 24 04          	mov    %eax,0x4(%esp)
  5f:	c7 04 24 58 0f 00 00 	movl   $0xf58,(%esp)
  66:	e8 07 05 00 00       	call   572 <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  6e:	89 04 24             	mov    %eax,(%esp)
  71:	e8 77 03 00 00       	call   3ed <strlen>
  76:	ba 0e 00 00 00       	mov    $0xe,%edx
  7b:	89 d3                	mov    %edx,%ebx
  7d:	29 c3                	sub    %eax,%ebx
  7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  82:	89 04 24             	mov    %eax,(%esp)
  85:	e8 63 03 00 00       	call   3ed <strlen>
  8a:	05 58 0f 00 00       	add    $0xf58,%eax
  8f:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  93:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9a:	00 
  9b:	89 04 24             	mov    %eax,(%esp)
  9e:	e8 6f 03 00 00       	call   412 <memset>
  return buf;
  a3:	b8 58 0f 00 00       	mov    $0xf58,%eax
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
  c8:	e8 2b 05 00 00       	call   5f8 <open>
  cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d0:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d4:	79 20                	jns    f6 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d6:	8b 45 08             	mov    0x8(%ebp),%eax
  d9:	89 44 24 08          	mov    %eax,0x8(%esp)
  dd:	c7 44 24 04 b2 0e 00 	movl   $0xeb2,0x4(%esp)
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
 106:	e8 05 05 00 00       	call   610 <fstat>
 10b:	85 c0                	test   %eax,%eax
 10d:	79 2b                	jns    13a <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 10f:	8b 45 08             	mov    0x8(%ebp),%eax
 112:	89 44 24 08          	mov    %eax,0x8(%esp)
 116:	c7 44 24 04 c6 0e 00 	movl   $0xec6,0x4(%esp)
 11d:	00 
 11e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 125:	e8 2f 06 00 00       	call   759 <printf>
    close(fd);
 12a:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12d:	89 04 24             	mov    %eax,(%esp)
 130:	e8 ab 04 00 00       	call   5e0 <close>
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
 181:	c7 44 24 04 da 0e 00 	movl   $0xeda,0x4(%esp)
 188:	00 
 189:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 190:	e8 c4 05 00 00       	call   759 <printf>
    break;
 195:	e9 52 01 00 00       	jmp    2ec <ls+0x23e>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19a:	8b 45 08             	mov    0x8(%ebp),%eax
 19d:	89 04 24             	mov    %eax,(%esp)
 1a0:	e8 48 02 00 00       	call   3ed <strlen>
 1a5:	83 c0 10             	add    $0x10,%eax
 1a8:	3d 00 02 00 00       	cmp    $0x200,%eax
 1ad:	76 19                	jbe    1c8 <ls+0x11a>
      printf(1, "ls: path too long\n");
 1af:	c7 44 24 04 e7 0e 00 	movl   $0xee7,0x4(%esp)
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
 1d8:	e8 9c 01 00 00       	call   379 <strcpy>
    p = buf+strlen(buf);
 1dd:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e3:	89 04 24             	mov    %eax,(%esp)
 1e6:	e8 02 02 00 00       	call   3ed <strlen>
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
 231:	e8 3c 03 00 00       	call   572 <memmove>
      p[DIRSIZ] = 0;
 236:	8b 45 e0             	mov    -0x20(%ebp),%eax
 239:	83 c0 0e             	add    $0xe,%eax
 23c:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 23f:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 245:	89 44 24 04          	mov    %eax,0x4(%esp)
 249:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 24f:	89 04 24             	mov    %eax,(%esp)
 252:	e8 81 02 00 00       	call   4d8 <stat>
 257:	85 c0                	test   %eax,%eax
 259:	79 20                	jns    27b <ls+0x1cd>
        printf(1, "ls: cannot stat %s\n", buf);
 25b:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 261:	89 44 24 08          	mov    %eax,0x8(%esp)
 265:	c7 44 24 04 c6 0e 00 	movl   $0xec6,0x4(%esp)
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
 2af:	c7 44 24 04 da 0e 00 	movl   $0xeda,0x4(%esp)
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
 2de:	e8 ed 02 00 00       	call   5d0 <read>
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
 2f2:	e8 e9 02 00 00       	call   5e0 <close>
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
 30f:	7f 11                	jg     322 <main+0x20>
    ls(".");
 311:	c7 04 24 fa 0e 00 00 	movl   $0xefa,(%esp)
 318:	e8 91 fd ff ff       	call   ae <ls>
    exit();
 31d:	e8 96 02 00 00       	call   5b8 <exit>
  }
  for(i=1; i<argc; i++)
 322:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 329:	00 
 32a:	eb 19                	jmp    345 <main+0x43>
    ls(argv[i]);
 32c:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 330:	c1 e0 02             	shl    $0x2,%eax
 333:	03 45 0c             	add    0xc(%ebp),%eax
 336:	8b 00                	mov    (%eax),%eax
 338:	89 04 24             	mov    %eax,(%esp)
 33b:	e8 6e fd ff ff       	call   ae <ls>

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 340:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 345:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 349:	3b 45 08             	cmp    0x8(%ebp),%eax
 34c:	7c de                	jl     32c <main+0x2a>
    ls(argv[i]);
  exit();
 34e:	e8 65 02 00 00       	call   5b8 <exit>
 353:	90                   	nop

00000354 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 354:	55                   	push   %ebp
 355:	89 e5                	mov    %esp,%ebp
 357:	57                   	push   %edi
 358:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 359:	8b 4d 08             	mov    0x8(%ebp),%ecx
 35c:	8b 55 10             	mov    0x10(%ebp),%edx
 35f:	8b 45 0c             	mov    0xc(%ebp),%eax
 362:	89 cb                	mov    %ecx,%ebx
 364:	89 df                	mov    %ebx,%edi
 366:	89 d1                	mov    %edx,%ecx
 368:	fc                   	cld    
 369:	f3 aa                	rep stos %al,%es:(%edi)
 36b:	89 ca                	mov    %ecx,%edx
 36d:	89 fb                	mov    %edi,%ebx
 36f:	89 5d 08             	mov    %ebx,0x8(%ebp)
 372:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 375:	5b                   	pop    %ebx
 376:	5f                   	pop    %edi
 377:	5d                   	pop    %ebp
 378:	c3                   	ret    

00000379 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 379:	55                   	push   %ebp
 37a:	89 e5                	mov    %esp,%ebp
 37c:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 37f:	8b 45 08             	mov    0x8(%ebp),%eax
 382:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 385:	8b 45 0c             	mov    0xc(%ebp),%eax
 388:	0f b6 10             	movzbl (%eax),%edx
 38b:	8b 45 08             	mov    0x8(%ebp),%eax
 38e:	88 10                	mov    %dl,(%eax)
 390:	8b 45 08             	mov    0x8(%ebp),%eax
 393:	0f b6 00             	movzbl (%eax),%eax
 396:	84 c0                	test   %al,%al
 398:	0f 95 c0             	setne  %al
 39b:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 39f:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
 3a3:	84 c0                	test   %al,%al
 3a5:	75 de                	jne    385 <strcpy+0xc>
    ;
  return os;
 3a7:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3aa:	c9                   	leave  
 3ab:	c3                   	ret    

000003ac <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3ac:	55                   	push   %ebp
 3ad:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3af:	eb 08                	jmp    3b9 <strcmp+0xd>
    p++, q++;
 3b1:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b5:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3b9:	8b 45 08             	mov    0x8(%ebp),%eax
 3bc:	0f b6 00             	movzbl (%eax),%eax
 3bf:	84 c0                	test   %al,%al
 3c1:	74 10                	je     3d3 <strcmp+0x27>
 3c3:	8b 45 08             	mov    0x8(%ebp),%eax
 3c6:	0f b6 10             	movzbl (%eax),%edx
 3c9:	8b 45 0c             	mov    0xc(%ebp),%eax
 3cc:	0f b6 00             	movzbl (%eax),%eax
 3cf:	38 c2                	cmp    %al,%dl
 3d1:	74 de                	je     3b1 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3d3:	8b 45 08             	mov    0x8(%ebp),%eax
 3d6:	0f b6 00             	movzbl (%eax),%eax
 3d9:	0f b6 d0             	movzbl %al,%edx
 3dc:	8b 45 0c             	mov    0xc(%ebp),%eax
 3df:	0f b6 00             	movzbl (%eax),%eax
 3e2:	0f b6 c0             	movzbl %al,%eax
 3e5:	89 d1                	mov    %edx,%ecx
 3e7:	29 c1                	sub    %eax,%ecx
 3e9:	89 c8                	mov    %ecx,%eax
}
 3eb:	5d                   	pop    %ebp
 3ec:	c3                   	ret    

000003ed <strlen>:

uint
strlen(char *s)
{
 3ed:	55                   	push   %ebp
 3ee:	89 e5                	mov    %esp,%ebp
 3f0:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3f3:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3fa:	eb 04                	jmp    400 <strlen+0x13>
 3fc:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 400:	8b 45 fc             	mov    -0x4(%ebp),%eax
 403:	03 45 08             	add    0x8(%ebp),%eax
 406:	0f b6 00             	movzbl (%eax),%eax
 409:	84 c0                	test   %al,%al
 40b:	75 ef                	jne    3fc <strlen+0xf>
    ;
  return n;
 40d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 410:	c9                   	leave  
 411:	c3                   	ret    

00000412 <memset>:

void*
memset(void *dst, int c, uint n)
{
 412:	55                   	push   %ebp
 413:	89 e5                	mov    %esp,%ebp
 415:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 418:	8b 45 10             	mov    0x10(%ebp),%eax
 41b:	89 44 24 08          	mov    %eax,0x8(%esp)
 41f:	8b 45 0c             	mov    0xc(%ebp),%eax
 422:	89 44 24 04          	mov    %eax,0x4(%esp)
 426:	8b 45 08             	mov    0x8(%ebp),%eax
 429:	89 04 24             	mov    %eax,(%esp)
 42c:	e8 23 ff ff ff       	call   354 <stosb>
  return dst;
 431:	8b 45 08             	mov    0x8(%ebp),%eax
}
 434:	c9                   	leave  
 435:	c3                   	ret    

00000436 <strchr>:

char*
strchr(const char *s, char c)
{
 436:	55                   	push   %ebp
 437:	89 e5                	mov    %esp,%ebp
 439:	83 ec 04             	sub    $0x4,%esp
 43c:	8b 45 0c             	mov    0xc(%ebp),%eax
 43f:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 442:	eb 14                	jmp    458 <strchr+0x22>
    if(*s == c)
 444:	8b 45 08             	mov    0x8(%ebp),%eax
 447:	0f b6 00             	movzbl (%eax),%eax
 44a:	3a 45 fc             	cmp    -0x4(%ebp),%al
 44d:	75 05                	jne    454 <strchr+0x1e>
      return (char*)s;
 44f:	8b 45 08             	mov    0x8(%ebp),%eax
 452:	eb 13                	jmp    467 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 454:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 458:	8b 45 08             	mov    0x8(%ebp),%eax
 45b:	0f b6 00             	movzbl (%eax),%eax
 45e:	84 c0                	test   %al,%al
 460:	75 e2                	jne    444 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 462:	b8 00 00 00 00       	mov    $0x0,%eax
}
 467:	c9                   	leave  
 468:	c3                   	ret    

00000469 <gets>:

char*
gets(char *buf, int max)
{
 469:	55                   	push   %ebp
 46a:	89 e5                	mov    %esp,%ebp
 46c:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 46f:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 476:	eb 44                	jmp    4bc <gets+0x53>
    cc = read(0, &c, 1);
 478:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 47f:	00 
 480:	8d 45 ef             	lea    -0x11(%ebp),%eax
 483:	89 44 24 04          	mov    %eax,0x4(%esp)
 487:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 48e:	e8 3d 01 00 00       	call   5d0 <read>
 493:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
 496:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 49a:	7e 2d                	jle    4c9 <gets+0x60>
      break;
    buf[i++] = c;
 49c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 49f:	03 45 08             	add    0x8(%ebp),%eax
 4a2:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
 4a6:	88 10                	mov    %dl,(%eax)
 4a8:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
 4ac:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b0:	3c 0a                	cmp    $0xa,%al
 4b2:	74 16                	je     4ca <gets+0x61>
 4b4:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b8:	3c 0d                	cmp    $0xd,%al
 4ba:	74 0e                	je     4ca <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4bf:	83 c0 01             	add    $0x1,%eax
 4c2:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4c5:	7c b1                	jl     478 <gets+0xf>
 4c7:	eb 01                	jmp    4ca <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
 4c9:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4ca:	8b 45 f0             	mov    -0x10(%ebp),%eax
 4cd:	03 45 08             	add    0x8(%ebp),%eax
 4d0:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4d3:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4d6:	c9                   	leave  
 4d7:	c3                   	ret    

000004d8 <stat>:

int
stat(char *n, struct stat *st)
{
 4d8:	55                   	push   %ebp
 4d9:	89 e5                	mov    %esp,%ebp
 4db:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4de:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4e5:	00 
 4e6:	8b 45 08             	mov    0x8(%ebp),%eax
 4e9:	89 04 24             	mov    %eax,(%esp)
 4ec:	e8 07 01 00 00       	call   5f8 <open>
 4f1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
 4f4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 4f8:	79 07                	jns    501 <stat+0x29>
    return -1;
 4fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 4ff:	eb 23                	jmp    524 <stat+0x4c>
  r = fstat(fd, st);
 501:	8b 45 0c             	mov    0xc(%ebp),%eax
 504:	89 44 24 04          	mov    %eax,0x4(%esp)
 508:	8b 45 f0             	mov    -0x10(%ebp),%eax
 50b:	89 04 24             	mov    %eax,(%esp)
 50e:	e8 fd 00 00 00       	call   610 <fstat>
 513:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
 516:	8b 45 f0             	mov    -0x10(%ebp),%eax
 519:	89 04 24             	mov    %eax,(%esp)
 51c:	e8 bf 00 00 00       	call   5e0 <close>
  return r;
 521:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
 524:	c9                   	leave  
 525:	c3                   	ret    

00000526 <atoi>:

int
atoi(const char *s)
{
 526:	55                   	push   %ebp
 527:	89 e5                	mov    %esp,%ebp
 529:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 52c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 533:	eb 24                	jmp    559 <atoi+0x33>
    n = n*10 + *s++ - '0';
 535:	8b 55 fc             	mov    -0x4(%ebp),%edx
 538:	89 d0                	mov    %edx,%eax
 53a:	c1 e0 02             	shl    $0x2,%eax
 53d:	01 d0                	add    %edx,%eax
 53f:	01 c0                	add    %eax,%eax
 541:	89 c2                	mov    %eax,%edx
 543:	8b 45 08             	mov    0x8(%ebp),%eax
 546:	0f b6 00             	movzbl (%eax),%eax
 549:	0f be c0             	movsbl %al,%eax
 54c:	8d 04 02             	lea    (%edx,%eax,1),%eax
 54f:	83 e8 30             	sub    $0x30,%eax
 552:	89 45 fc             	mov    %eax,-0x4(%ebp)
 555:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 559:	8b 45 08             	mov    0x8(%ebp),%eax
 55c:	0f b6 00             	movzbl (%eax),%eax
 55f:	3c 2f                	cmp    $0x2f,%al
 561:	7e 0a                	jle    56d <atoi+0x47>
 563:	8b 45 08             	mov    0x8(%ebp),%eax
 566:	0f b6 00             	movzbl (%eax),%eax
 569:	3c 39                	cmp    $0x39,%al
 56b:	7e c8                	jle    535 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 56d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 570:	c9                   	leave  
 571:	c3                   	ret    

00000572 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 572:	55                   	push   %ebp
 573:	89 e5                	mov    %esp,%ebp
 575:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 578:	8b 45 08             	mov    0x8(%ebp),%eax
 57b:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
 57e:	8b 45 0c             	mov    0xc(%ebp),%eax
 581:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
 584:	eb 13                	jmp    599 <memmove+0x27>
    *dst++ = *src++;
 586:	8b 45 fc             	mov    -0x4(%ebp),%eax
 589:	0f b6 10             	movzbl (%eax),%edx
 58c:	8b 45 f8             	mov    -0x8(%ebp),%eax
 58f:	88 10                	mov    %dl,(%eax)
 591:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
 595:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 599:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
 59d:	0f 9f c0             	setg   %al
 5a0:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
 5a4:	84 c0                	test   %al,%al
 5a6:	75 de                	jne    586 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5a8:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5ab:	c9                   	leave  
 5ac:	c3                   	ret    
 5ad:	90                   	nop
 5ae:	90                   	nop
 5af:	90                   	nop

000005b0 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5b0:	b8 01 00 00 00       	mov    $0x1,%eax
 5b5:	cd 40                	int    $0x40
 5b7:	c3                   	ret    

000005b8 <exit>:
SYSCALL(exit)
 5b8:	b8 02 00 00 00       	mov    $0x2,%eax
 5bd:	cd 40                	int    $0x40
 5bf:	c3                   	ret    

000005c0 <wait>:
SYSCALL(wait)
 5c0:	b8 03 00 00 00       	mov    $0x3,%eax
 5c5:	cd 40                	int    $0x40
 5c7:	c3                   	ret    

000005c8 <pipe>:
SYSCALL(pipe)
 5c8:	b8 04 00 00 00       	mov    $0x4,%eax
 5cd:	cd 40                	int    $0x40
 5cf:	c3                   	ret    

000005d0 <read>:
SYSCALL(read)
 5d0:	b8 05 00 00 00       	mov    $0x5,%eax
 5d5:	cd 40                	int    $0x40
 5d7:	c3                   	ret    

000005d8 <write>:
SYSCALL(write)
 5d8:	b8 10 00 00 00       	mov    $0x10,%eax
 5dd:	cd 40                	int    $0x40
 5df:	c3                   	ret    

000005e0 <close>:
SYSCALL(close)
 5e0:	b8 15 00 00 00       	mov    $0x15,%eax
 5e5:	cd 40                	int    $0x40
 5e7:	c3                   	ret    

000005e8 <kill>:
SYSCALL(kill)
 5e8:	b8 06 00 00 00       	mov    $0x6,%eax
 5ed:	cd 40                	int    $0x40
 5ef:	c3                   	ret    

000005f0 <exec>:
SYSCALL(exec)
 5f0:	b8 07 00 00 00       	mov    $0x7,%eax
 5f5:	cd 40                	int    $0x40
 5f7:	c3                   	ret    

000005f8 <open>:
SYSCALL(open)
 5f8:	b8 0f 00 00 00       	mov    $0xf,%eax
 5fd:	cd 40                	int    $0x40
 5ff:	c3                   	ret    

00000600 <mknod>:
SYSCALL(mknod)
 600:	b8 11 00 00 00       	mov    $0x11,%eax
 605:	cd 40                	int    $0x40
 607:	c3                   	ret    

00000608 <unlink>:
SYSCALL(unlink)
 608:	b8 12 00 00 00       	mov    $0x12,%eax
 60d:	cd 40                	int    $0x40
 60f:	c3                   	ret    

00000610 <fstat>:
SYSCALL(fstat)
 610:	b8 08 00 00 00       	mov    $0x8,%eax
 615:	cd 40                	int    $0x40
 617:	c3                   	ret    

00000618 <link>:
SYSCALL(link)
 618:	b8 13 00 00 00       	mov    $0x13,%eax
 61d:	cd 40                	int    $0x40
 61f:	c3                   	ret    

00000620 <mkdir>:
SYSCALL(mkdir)
 620:	b8 14 00 00 00       	mov    $0x14,%eax
 625:	cd 40                	int    $0x40
 627:	c3                   	ret    

00000628 <chdir>:
SYSCALL(chdir)
 628:	b8 09 00 00 00       	mov    $0x9,%eax
 62d:	cd 40                	int    $0x40
 62f:	c3                   	ret    

00000630 <dup>:
SYSCALL(dup)
 630:	b8 0a 00 00 00       	mov    $0xa,%eax
 635:	cd 40                	int    $0x40
 637:	c3                   	ret    

00000638 <getpid>:
SYSCALL(getpid)
 638:	b8 0b 00 00 00       	mov    $0xb,%eax
 63d:	cd 40                	int    $0x40
 63f:	c3                   	ret    

00000640 <sbrk>:
SYSCALL(sbrk)
 640:	b8 0c 00 00 00       	mov    $0xc,%eax
 645:	cd 40                	int    $0x40
 647:	c3                   	ret    

00000648 <sleep>:
SYSCALL(sleep)
 648:	b8 0d 00 00 00       	mov    $0xd,%eax
 64d:	cd 40                	int    $0x40
 64f:	c3                   	ret    

00000650 <uptime>:
SYSCALL(uptime)
 650:	b8 0e 00 00 00       	mov    $0xe,%eax
 655:	cd 40                	int    $0x40
 657:	c3                   	ret    

00000658 <clone>:
SYSCALL(clone)
 658:	b8 16 00 00 00       	mov    $0x16,%eax
 65d:	cd 40                	int    $0x40
 65f:	c3                   	ret    

00000660 <texit>:
SYSCALL(texit)
 660:	b8 17 00 00 00       	mov    $0x17,%eax
 665:	cd 40                	int    $0x40
 667:	c3                   	ret    

00000668 <tsleep>:
SYSCALL(tsleep)
 668:	b8 18 00 00 00       	mov    $0x18,%eax
 66d:	cd 40                	int    $0x40
 66f:	c3                   	ret    

00000670 <twakeup>:
SYSCALL(twakeup)
 670:	b8 19 00 00 00       	mov    $0x19,%eax
 675:	cd 40                	int    $0x40
 677:	c3                   	ret    

00000678 <test>:
SYSCALL(test)
 678:	b8 1a 00 00 00       	mov    $0x1a,%eax
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
 6a1:	e8 32 ff ff ff       	call   5d8 <write>
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
 6f2:	0f b6 80 44 0f 00 00 	movzbl 0xf44(%eax),%eax
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
 852:	c7 45 e4 fc 0e 00 00 	movl   $0xefc,-0x1c(%ebp)
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
 91f:	a1 70 0f 00 00       	mov    0xf70,%eax
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
 9e0:	a3 70 0f 00 00       	mov    %eax,0xf70
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
 a06:	e8 35 fc ff ff       	call   640 <sbrk>
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
 a38:	a1 70 0f 00 00       	mov    0xf70,%eax
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
 a54:	a1 70 0f 00 00       	mov    0xf70,%eax
 a59:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a5c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a60:	75 23                	jne    a85 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a62:	c7 45 f0 68 0f 00 00 	movl   $0xf68,-0x10(%ebp)
 a69:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a6c:	a3 70 0f 00 00       	mov    %eax,0xf70
 a71:	a1 70 0f 00 00       	mov    0xf70,%eax
 a76:	a3 68 0f 00 00       	mov    %eax,0xf68
    base.s.size = 0;
 a7b:	c7 05 6c 0f 00 00 00 	movl   $0x0,0xf6c
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
 ad8:	a3 70 0f 00 00       	mov    %eax,0xf70
      return (void*)(p + 1);
 add:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ae0:	83 c0 08             	add    $0x8,%eax
 ae3:	eb 38                	jmp    b1d <malloc+0xde>
    }
    if(p == freep)
 ae5:	a1 70 0f 00 00       	mov    0xf70,%eax
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
 b1f:	90                   	nop

00000b20 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 b20:	55                   	push   %ebp
 b21:	89 e5                	mov    %esp,%ebp
 b23:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 b26:	8b 55 08             	mov    0x8(%ebp),%edx
 b29:	8b 45 0c             	mov    0xc(%ebp),%eax
 b2c:	8b 4d 08             	mov    0x8(%ebp),%ecx
 b2f:	f0 87 02             	lock xchg %eax,(%edx)
 b32:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 b35:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 b38:	c9                   	leave  
 b39:	c3                   	ret    

00000b3a <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 b3a:	55                   	push   %ebp
 b3b:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 b3d:	8b 45 08             	mov    0x8(%ebp),%eax
 b40:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 b46:	5d                   	pop    %ebp
 b47:	c3                   	ret    

00000b48 <lock_acquire>:
void lock_acquire(lock_t *lock){
 b48:	55                   	push   %ebp
 b49:	89 e5                	mov    %esp,%ebp
 b4b:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 b4e:	8b 45 08             	mov    0x8(%ebp),%eax
 b51:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 b58:	00 
 b59:	89 04 24             	mov    %eax,(%esp)
 b5c:	e8 bf ff ff ff       	call   b20 <xchg>
 b61:	85 c0                	test   %eax,%eax
 b63:	75 e9                	jne    b4e <lock_acquire+0x6>
}
 b65:	c9                   	leave  
 b66:	c3                   	ret    

00000b67 <lock_release>:
void lock_release(lock_t *lock){
 b67:	55                   	push   %ebp
 b68:	89 e5                	mov    %esp,%ebp
 b6a:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 b6d:	8b 45 08             	mov    0x8(%ebp),%eax
 b70:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 b77:	00 
 b78:	89 04 24             	mov    %eax,(%esp)
 b7b:	e8 a0 ff ff ff       	call   b20 <xchg>
}
 b80:	c9                   	leave  
 b81:	c3                   	ret    

00000b82 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 b82:	55                   	push   %ebp
 b83:	89 e5                	mov    %esp,%ebp
 b85:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 b88:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 b8f:	e8 ab fe ff ff       	call   a3f <malloc>
 b94:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 b97:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b9a:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 b9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ba0:	25 ff 0f 00 00       	and    $0xfff,%eax
 ba5:	85 c0                	test   %eax,%eax
 ba7:	74 15                	je     bbe <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 ba9:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bac:	89 c2                	mov    %eax,%edx
 bae:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 bb4:	b8 00 10 00 00       	mov    $0x1000,%eax
 bb9:	29 d0                	sub    %edx,%eax
 bbb:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 bbe:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 bc2:	75 1b                	jne    bdf <thread_create+0x5d>

        printf(1,"malloc fail \n");
 bc4:	c7 44 24 04 03 0f 00 	movl   $0xf03,0x4(%esp)
 bcb:	00 
 bcc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bd3:	e8 81 fb ff ff       	call   759 <printf>
        return 0;
 bd8:	b8 00 00 00 00       	mov    $0x0,%eax
 bdd:	eb 6f                	jmp    c4e <thread_create+0xcc>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 bdf:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 be2:	8b 55 08             	mov    0x8(%ebp),%edx
 be5:	8b 45 f0             	mov    -0x10(%ebp),%eax
 be8:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 bec:	89 54 24 08          	mov    %edx,0x8(%esp)
 bf0:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 bf7:	00 
 bf8:	89 04 24             	mov    %eax,(%esp)
 bfb:	e8 58 fa ff ff       	call   658 <clone>
 c00:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 c03:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c07:	79 1b                	jns    c24 <thread_create+0xa2>
        printf(1,"clone fails\n");
 c09:	c7 44 24 04 11 0f 00 	movl   $0xf11,0x4(%esp)
 c10:	00 
 c11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c18:	e8 3c fb ff ff       	call   759 <printf>
        return 0;
 c1d:	b8 00 00 00 00       	mov    $0x0,%eax
 c22:	eb 2a                	jmp    c4e <thread_create+0xcc>
    }
    if(tid > 0){
 c24:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c28:	7e 05                	jle    c2f <thread_create+0xad>
        //store threads on thread table
        return garbage_stack;
 c2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c2d:	eb 1f                	jmp    c4e <thread_create+0xcc>
    }
    if(tid == 0){
 c2f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c33:	75 14                	jne    c49 <thread_create+0xc7>
        printf(1,"tid = 0 return \n");
 c35:	c7 44 24 04 1e 0f 00 	movl   $0xf1e,0x4(%esp)
 c3c:	00 
 c3d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c44:	e8 10 fb ff ff       	call   759 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 c49:	b8 00 00 00 00       	mov    $0x0,%eax
}
 c4e:	c9                   	leave  
 c4f:	c3                   	ret    

00000c50 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 c50:	55                   	push   %ebp
 c51:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 c53:	8b 45 08             	mov    0x8(%ebp),%eax
 c56:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 c5c:	8b 45 08             	mov    0x8(%ebp),%eax
 c5f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 c66:	8b 45 08             	mov    0x8(%ebp),%eax
 c69:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 c70:	5d                   	pop    %ebp
 c71:	c3                   	ret    

00000c72 <add_q>:

void add_q(struct queue *q, int v){
 c72:	55                   	push   %ebp
 c73:	89 e5                	mov    %esp,%ebp
 c75:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 c78:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 c7f:	e8 bb fd ff ff       	call   a3f <malloc>
 c84:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 c87:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c8a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 c91:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c94:	8b 55 0c             	mov    0xc(%ebp),%edx
 c97:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 c99:	8b 45 08             	mov    0x8(%ebp),%eax
 c9c:	8b 40 04             	mov    0x4(%eax),%eax
 c9f:	85 c0                	test   %eax,%eax
 ca1:	75 0b                	jne    cae <add_q+0x3c>
        q->head = n;
 ca3:	8b 45 08             	mov    0x8(%ebp),%eax
 ca6:	8b 55 f4             	mov    -0xc(%ebp),%edx
 ca9:	89 50 04             	mov    %edx,0x4(%eax)
 cac:	eb 0c                	jmp    cba <add_q+0x48>
    }else{
        q->tail->next = n;
 cae:	8b 45 08             	mov    0x8(%ebp),%eax
 cb1:	8b 40 08             	mov    0x8(%eax),%eax
 cb4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 cb7:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 cba:	8b 45 08             	mov    0x8(%ebp),%eax
 cbd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 cc0:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 cc3:	8b 45 08             	mov    0x8(%ebp),%eax
 cc6:	8b 00                	mov    (%eax),%eax
 cc8:	8d 50 01             	lea    0x1(%eax),%edx
 ccb:	8b 45 08             	mov    0x8(%ebp),%eax
 cce:	89 10                	mov    %edx,(%eax)
}
 cd0:	c9                   	leave  
 cd1:	c3                   	ret    

00000cd2 <empty_q>:

int empty_q(struct queue *q){
 cd2:	55                   	push   %ebp
 cd3:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 cd5:	8b 45 08             	mov    0x8(%ebp),%eax
 cd8:	8b 00                	mov    (%eax),%eax
 cda:	85 c0                	test   %eax,%eax
 cdc:	75 07                	jne    ce5 <empty_q+0x13>
        return 1;
 cde:	b8 01 00 00 00       	mov    $0x1,%eax
 ce3:	eb 05                	jmp    cea <empty_q+0x18>
    else
        return 0;
 ce5:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 cea:	5d                   	pop    %ebp
 ceb:	c3                   	ret    

00000cec <pop_q>:
int pop_q(struct queue *q){
 cec:	55                   	push   %ebp
 ced:	89 e5                	mov    %esp,%ebp
 cef:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 cf2:	8b 45 08             	mov    0x8(%ebp),%eax
 cf5:	89 04 24             	mov    %eax,(%esp)
 cf8:	e8 d5 ff ff ff       	call   cd2 <empty_q>
 cfd:	85 c0                	test   %eax,%eax
 cff:	75 5d                	jne    d5e <pop_q+0x72>
       val = q->head->value; 
 d01:	8b 45 08             	mov    0x8(%ebp),%eax
 d04:	8b 40 04             	mov    0x4(%eax),%eax
 d07:	8b 00                	mov    (%eax),%eax
 d09:	89 45 f0             	mov    %eax,-0x10(%ebp)
       destroy = q->head;
 d0c:	8b 45 08             	mov    0x8(%ebp),%eax
 d0f:	8b 40 04             	mov    0x4(%eax),%eax
 d12:	89 45 f4             	mov    %eax,-0xc(%ebp)
       q->head = q->head->next;
 d15:	8b 45 08             	mov    0x8(%ebp),%eax
 d18:	8b 40 04             	mov    0x4(%eax),%eax
 d1b:	8b 50 04             	mov    0x4(%eax),%edx
 d1e:	8b 45 08             	mov    0x8(%ebp),%eax
 d21:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 d24:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d27:	89 04 24             	mov    %eax,(%esp)
 d2a:	e8 e1 fb ff ff       	call   910 <free>
       q->size--;
 d2f:	8b 45 08             	mov    0x8(%ebp),%eax
 d32:	8b 00                	mov    (%eax),%eax
 d34:	8d 50 ff             	lea    -0x1(%eax),%edx
 d37:	8b 45 08             	mov    0x8(%ebp),%eax
 d3a:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 d3c:	8b 45 08             	mov    0x8(%ebp),%eax
 d3f:	8b 00                	mov    (%eax),%eax
 d41:	85 c0                	test   %eax,%eax
 d43:	75 14                	jne    d59 <pop_q+0x6d>
            q->head = 0;
 d45:	8b 45 08             	mov    0x8(%ebp),%eax
 d48:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 d4f:	8b 45 08             	mov    0x8(%ebp),%eax
 d52:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 d59:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d5c:	eb 05                	jmp    d63 <pop_q+0x77>
    }
    return -1;
 d5e:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 d63:	c9                   	leave  
 d64:	c3                   	ret    
 d65:	90                   	nop
 d66:	90                   	nop
 d67:	90                   	nop

00000d68 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 d68:	55                   	push   %ebp
 d69:	89 e5                	mov    %esp,%ebp
 d6b:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 d6e:	8b 45 08             	mov    0x8(%ebp),%eax
 d71:	8b 55 0c             	mov    0xc(%ebp),%edx
 d74:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 d77:	8b 45 08             	mov    0x8(%ebp),%eax
 d7a:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 d81:	8b 45 08             	mov    0x8(%ebp),%eax
 d84:	89 04 24             	mov    %eax,(%esp)
 d87:	e8 ae fd ff ff       	call   b3a <lock_init>
}
 d8c:	c9                   	leave  
 d8d:	c3                   	ret    

00000d8e <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 d8e:	55                   	push   %ebp
 d8f:	89 e5                	mov    %esp,%ebp
 d91:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 d94:	8b 45 08             	mov    0x8(%ebp),%eax
 d97:	89 04 24             	mov    %eax,(%esp)
 d9a:	e8 a9 fd ff ff       	call   b48 <lock_acquire>
	if(s->count  == 0){
 d9f:	8b 45 08             	mov    0x8(%ebp),%eax
 da2:	8b 40 04             	mov    0x4(%eax),%eax
 da5:	85 c0                	test   %eax,%eax
 da7:	75 43                	jne    dec <sem_aquire+0x5e>
  		printf(1, "Sem F\n");
 da9:	c7 44 24 04 2f 0f 00 	movl   $0xf2f,0x4(%esp)
 db0:	00 
 db1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 db8:	e8 9c f9 ff ff       	call   759 <printf>
		//add proc to waiters list
		int tid = getpid();
 dbd:	e8 76 f8 ff ff       	call   638 <getpid>
 dc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 dc5:	8b 45 08             	mov    0x8(%ebp),%eax
 dc8:	8d 50 0c             	lea    0xc(%eax),%edx
 dcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dce:	89 44 24 04          	mov    %eax,0x4(%esp)
 dd2:	89 14 24             	mov    %edx,(%esp)
 dd5:	e8 98 fe ff ff       	call   c72 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 dda:	8b 45 08             	mov    0x8(%ebp),%eax
 ddd:	89 04 24             	mov    %eax,(%esp)
 de0:	e8 82 fd ff ff       	call   b67 <lock_release>
		tsleep(); 
 de5:	e8 7e f8 ff ff       	call   668 <tsleep>
 dea:	eb 2e                	jmp    e1a <sem_aquire+0x8c>
	}
	else{
  		printf(1, "Sem A\n");
 dec:	c7 44 24 04 36 0f 00 	movl   $0xf36,0x4(%esp)
 df3:	00 
 df4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 dfb:	e8 59 f9 ff ff       	call   759 <printf>
		s->count--;	
 e00:	8b 45 08             	mov    0x8(%ebp),%eax
 e03:	8b 40 04             	mov    0x4(%eax),%eax
 e06:	8d 50 ff             	lea    -0x1(%eax),%edx
 e09:	8b 45 08             	mov    0x8(%ebp),%eax
 e0c:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 e0f:	8b 45 08             	mov    0x8(%ebp),%eax
 e12:	89 04 24             	mov    %eax,(%esp)
 e15:	e8 4d fd ff ff       	call   b67 <lock_release>
	}
}
 e1a:	c9                   	leave  
 e1b:	c3                   	ret    

00000e1c <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 e1c:	55                   	push   %ebp
 e1d:	89 e5                	mov    %esp,%ebp
 e1f:	83 ec 28             	sub    $0x28,%esp
	printf(1, "Sem R\n");
 e22:	c7 44 24 04 3d 0f 00 	movl   $0xf3d,0x4(%esp)
 e29:	00 
 e2a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 e31:	e8 23 f9 ff ff       	call   759 <printf>
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 e36:	8b 45 08             	mov    0x8(%ebp),%eax
 e39:	89 04 24             	mov    %eax,(%esp)
 e3c:	e8 07 fd ff ff       	call   b48 <lock_acquire>
	if(s->count < s->size){
 e41:	8b 45 08             	mov    0x8(%ebp),%eax
 e44:	8b 50 04             	mov    0x4(%eax),%edx
 e47:	8b 45 08             	mov    0x8(%ebp),%eax
 e4a:	8b 40 08             	mov    0x8(%eax),%eax
 e4d:	39 c2                	cmp    %eax,%edx
 e4f:	7d 0f                	jge    e60 <sem_signal+0x44>
		s->count++;	
 e51:	8b 45 08             	mov    0x8(%ebp),%eax
 e54:	8b 40 04             	mov    0x4(%eax),%eax
 e57:	8d 50 01             	lea    0x1(%eax),%edx
 e5a:	8b 45 08             	mov    0x8(%ebp),%eax
 e5d:	89 50 04             	mov    %edx,0x4(%eax)
	}
	
	int tid;
	tid = pop_q(&s->waiters);
 e60:	8b 45 08             	mov    0x8(%ebp),%eax
 e63:	83 c0 0c             	add    $0xc,%eax
 e66:	89 04 24             	mov    %eax,(%esp)
 e69:	e8 7e fe ff ff       	call   cec <pop_q>
 e6e:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
 e71:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 e75:	74 2e                	je     ea5 <sem_signal+0x89>
		printf(1, "Sem A\n");
 e77:	c7 44 24 04 36 0f 00 	movl   $0xf36,0x4(%esp)
 e7e:	00 
 e7f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 e86:	e8 ce f8 ff ff       	call   759 <printf>
		twakeup(tid);
 e8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e8e:	89 04 24             	mov    %eax,(%esp)
 e91:	e8 da f7 ff ff       	call   670 <twakeup>
		s->count--;
 e96:	8b 45 08             	mov    0x8(%ebp),%eax
 e99:	8b 40 04             	mov    0x4(%eax),%eax
 e9c:	8d 50 ff             	lea    -0x1(%eax),%edx
 e9f:	8b 45 08             	mov    0x8(%ebp),%eax
 ea2:	89 50 04             	mov    %edx,0x4(%eax)
	}
	lock_release(&s->lock);
 ea5:	8b 45 08             	mov    0x8(%ebp),%eax
 ea8:	89 04 24             	mov    %eax,(%esp)
 eab:	e8 b7 fc ff ff       	call   b67 <lock_release>

 eb0:	c9                   	leave  
 eb1:	c3                   	ret    
