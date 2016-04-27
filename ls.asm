
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
  5f:	c7 04 24 cc 0c 00 00 	movl   $0xccc,(%esp)
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
  8a:	05 cc 0c 00 00       	add    $0xccc,%eax
  8f:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  93:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9a:	00 
  9b:	89 04 24             	mov    %eax,(%esp)
  9e:	e8 6f 03 00 00       	call   412 <memset>
  return buf;
  a3:	b8 cc 0c 00 00       	mov    $0xccc,%eax
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
  dd:	c7 44 24 04 39 0c 00 	movl   $0xc39,0x4(%esp)
  e4:	00 
  e5:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ec:	e8 50 06 00 00       	call   741 <printf>
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
 116:	c7 44 24 04 4d 0c 00 	movl   $0xc4d,0x4(%esp)
 11d:	00 
 11e:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 125:	e8 17 06 00 00       	call   741 <printf>
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
 181:	c7 44 24 04 61 0c 00 	movl   $0xc61,0x4(%esp)
 188:	00 
 189:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 190:	e8 ac 05 00 00       	call   741 <printf>
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
 1af:	c7 44 24 04 6e 0c 00 	movl   $0xc6e,0x4(%esp)
 1b6:	00 
 1b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1be:	e8 7e 05 00 00       	call   741 <printf>
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
 265:	c7 44 24 04 4d 0c 00 	movl   $0xc4d,0x4(%esp)
 26c:	00 
 26d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 274:	e8 c8 04 00 00       	call   741 <printf>
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
 2af:	c7 44 24 04 61 0c 00 	movl   $0xc61,0x4(%esp)
 2b6:	00 
 2b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2be:	e8 7e 04 00 00       	call   741 <printf>
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
 311:	c7 04 24 81 0c 00 00 	movl   $0xc81,(%esp)
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

00000668 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 668:	55                   	push   %ebp
 669:	89 e5                	mov    %esp,%ebp
 66b:	83 ec 28             	sub    $0x28,%esp
 66e:	8b 45 0c             	mov    0xc(%ebp),%eax
 671:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 674:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 67b:	00 
 67c:	8d 45 f4             	lea    -0xc(%ebp),%eax
 67f:	89 44 24 04          	mov    %eax,0x4(%esp)
 683:	8b 45 08             	mov    0x8(%ebp),%eax
 686:	89 04 24             	mov    %eax,(%esp)
 689:	e8 4a ff ff ff       	call   5d8 <write>
}
 68e:	c9                   	leave  
 68f:	c3                   	ret    

00000690 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 690:	55                   	push   %ebp
 691:	89 e5                	mov    %esp,%ebp
 693:	53                   	push   %ebx
 694:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 697:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 69e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6a2:	74 17                	je     6bb <printint+0x2b>
 6a4:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6a8:	79 11                	jns    6bb <printint+0x2b>
    neg = 1;
 6aa:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6b1:	8b 45 0c             	mov    0xc(%ebp),%eax
 6b4:	f7 d8                	neg    %eax
 6b6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
 6b9:	eb 06                	jmp    6c1 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
 6bb:	8b 45 0c             	mov    0xc(%ebp),%eax
 6be:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
 6c1:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
 6c8:	8b 4d ec             	mov    -0x14(%ebp),%ecx
 6cb:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6d1:	ba 00 00 00 00       	mov    $0x0,%edx
 6d6:	f7 f3                	div    %ebx
 6d8:	89 d0                	mov    %edx,%eax
 6da:	0f b6 80 b8 0c 00 00 	movzbl 0xcb8(%eax),%eax
 6e1:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
 6e5:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
 6e9:	8b 45 10             	mov    0x10(%ebp),%eax
 6ec:	89 45 d4             	mov    %eax,-0x2c(%ebp)
 6ef:	8b 45 f4             	mov    -0xc(%ebp),%eax
 6f2:	ba 00 00 00 00       	mov    $0x0,%edx
 6f7:	f7 75 d4             	divl   -0x2c(%ebp)
 6fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6fd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 701:	75 c5                	jne    6c8 <printint+0x38>
  if(neg)
 703:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 707:	74 28                	je     731 <printint+0xa1>
    buf[i++] = '-';
 709:	8b 45 ec             	mov    -0x14(%ebp),%eax
 70c:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
 711:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
 715:	eb 1a                	jmp    731 <printint+0xa1>
    putc(fd, buf[i]);
 717:	8b 45 ec             	mov    -0x14(%ebp),%eax
 71a:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
 71f:	0f be c0             	movsbl %al,%eax
 722:	89 44 24 04          	mov    %eax,0x4(%esp)
 726:	8b 45 08             	mov    0x8(%ebp),%eax
 729:	89 04 24             	mov    %eax,(%esp)
 72c:	e8 37 ff ff ff       	call   668 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 731:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
 735:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 739:	79 dc                	jns    717 <printint+0x87>
    putc(fd, buf[i]);
}
 73b:	83 c4 44             	add    $0x44,%esp
 73e:	5b                   	pop    %ebx
 73f:	5d                   	pop    %ebp
 740:	c3                   	ret    

00000741 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 741:	55                   	push   %ebp
 742:	89 e5                	mov    %esp,%ebp
 744:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 747:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 74e:	8d 45 0c             	lea    0xc(%ebp),%eax
 751:	83 c0 04             	add    $0x4,%eax
 754:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
 757:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
 75e:	e9 7e 01 00 00       	jmp    8e1 <printf+0x1a0>
    c = fmt[i] & 0xff;
 763:	8b 55 0c             	mov    0xc(%ebp),%edx
 766:	8b 45 ec             	mov    -0x14(%ebp),%eax
 769:	8d 04 02             	lea    (%edx,%eax,1),%eax
 76c:	0f b6 00             	movzbl (%eax),%eax
 76f:	0f be c0             	movsbl %al,%eax
 772:	25 ff 00 00 00       	and    $0xff,%eax
 777:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
 77a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 77e:	75 2c                	jne    7ac <printf+0x6b>
      if(c == '%'){
 780:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 784:	75 0c                	jne    792 <printf+0x51>
        state = '%';
 786:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
 78d:	e9 4b 01 00 00       	jmp    8dd <printf+0x19c>
      } else {
        putc(fd, c);
 792:	8b 45 e8             	mov    -0x18(%ebp),%eax
 795:	0f be c0             	movsbl %al,%eax
 798:	89 44 24 04          	mov    %eax,0x4(%esp)
 79c:	8b 45 08             	mov    0x8(%ebp),%eax
 79f:	89 04 24             	mov    %eax,(%esp)
 7a2:	e8 c1 fe ff ff       	call   668 <putc>
 7a7:	e9 31 01 00 00       	jmp    8dd <printf+0x19c>
      }
    } else if(state == '%'){
 7ac:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
 7b0:	0f 85 27 01 00 00    	jne    8dd <printf+0x19c>
      if(c == 'd'){
 7b6:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
 7ba:	75 2d                	jne    7e9 <printf+0xa8>
        printint(fd, *ap, 10, 1);
 7bc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7bf:	8b 00                	mov    (%eax),%eax
 7c1:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7c8:	00 
 7c9:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7d0:	00 
 7d1:	89 44 24 04          	mov    %eax,0x4(%esp)
 7d5:	8b 45 08             	mov    0x8(%ebp),%eax
 7d8:	89 04 24             	mov    %eax,(%esp)
 7db:	e8 b0 fe ff ff       	call   690 <printint>
        ap++;
 7e0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 7e4:	e9 ed 00 00 00       	jmp    8d6 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
 7e9:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
 7ed:	74 06                	je     7f5 <printf+0xb4>
 7ef:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
 7f3:	75 2d                	jne    822 <printf+0xe1>
        printint(fd, *ap, 16, 0);
 7f5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 7f8:	8b 00                	mov    (%eax),%eax
 7fa:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 801:	00 
 802:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 809:	00 
 80a:	89 44 24 04          	mov    %eax,0x4(%esp)
 80e:	8b 45 08             	mov    0x8(%ebp),%eax
 811:	89 04 24             	mov    %eax,(%esp)
 814:	e8 77 fe ff ff       	call   690 <printint>
        ap++;
 819:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
 81d:	e9 b4 00 00 00       	jmp    8d6 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
 822:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
 826:	75 46                	jne    86e <printf+0x12d>
        s = (char*)*ap;
 828:	8b 45 f4             	mov    -0xc(%ebp),%eax
 82b:	8b 00                	mov    (%eax),%eax
 82d:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
 830:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
 834:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
 838:	75 27                	jne    861 <printf+0x120>
          s = "(null)";
 83a:	c7 45 e4 83 0c 00 00 	movl   $0xc83,-0x1c(%ebp)
        while(*s != 0){
 841:	eb 1f                	jmp    862 <printf+0x121>
          putc(fd, *s);
 843:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 846:	0f b6 00             	movzbl (%eax),%eax
 849:	0f be c0             	movsbl %al,%eax
 84c:	89 44 24 04          	mov    %eax,0x4(%esp)
 850:	8b 45 08             	mov    0x8(%ebp),%eax
 853:	89 04 24             	mov    %eax,(%esp)
 856:	e8 0d fe ff ff       	call   668 <putc>
          s++;
 85b:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
 85f:	eb 01                	jmp    862 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 861:	90                   	nop
 862:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 865:	0f b6 00             	movzbl (%eax),%eax
 868:	84 c0                	test   %al,%al
 86a:	75 d7                	jne    843 <printf+0x102>
 86c:	eb 68                	jmp    8d6 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 86e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
 872:	75 1d                	jne    891 <printf+0x150>
        putc(fd, *ap);
 874:	8b 45 f4             	mov    -0xc(%ebp),%eax
 877:	8b 00                	mov    (%eax),%eax
 879:	0f be c0             	movsbl %al,%eax
 87c:	89 44 24 04          	mov    %eax,0x4(%esp)
 880:	8b 45 08             	mov    0x8(%ebp),%eax
 883:	89 04 24             	mov    %eax,(%esp)
 886:	e8 dd fd ff ff       	call   668 <putc>
        ap++;
 88b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
 88f:	eb 45                	jmp    8d6 <printf+0x195>
      } else if(c == '%'){
 891:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
 895:	75 17                	jne    8ae <printf+0x16d>
        putc(fd, c);
 897:	8b 45 e8             	mov    -0x18(%ebp),%eax
 89a:	0f be c0             	movsbl %al,%eax
 89d:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a1:	8b 45 08             	mov    0x8(%ebp),%eax
 8a4:	89 04 24             	mov    %eax,(%esp)
 8a7:	e8 bc fd ff ff       	call   668 <putc>
 8ac:	eb 28                	jmp    8d6 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8ae:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8b5:	00 
 8b6:	8b 45 08             	mov    0x8(%ebp),%eax
 8b9:	89 04 24             	mov    %eax,(%esp)
 8bc:	e8 a7 fd ff ff       	call   668 <putc>
        putc(fd, c);
 8c1:	8b 45 e8             	mov    -0x18(%ebp),%eax
 8c4:	0f be c0             	movsbl %al,%eax
 8c7:	89 44 24 04          	mov    %eax,0x4(%esp)
 8cb:	8b 45 08             	mov    0x8(%ebp),%eax
 8ce:	89 04 24             	mov    %eax,(%esp)
 8d1:	e8 92 fd ff ff       	call   668 <putc>
      }
      state = 0;
 8d6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 8dd:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
 8e1:	8b 55 0c             	mov    0xc(%ebp),%edx
 8e4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 8e7:	8d 04 02             	lea    (%edx,%eax,1),%eax
 8ea:	0f b6 00             	movzbl (%eax),%eax
 8ed:	84 c0                	test   %al,%al
 8ef:	0f 85 6e fe ff ff    	jne    763 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 8f5:	c9                   	leave  
 8f6:	c3                   	ret    
 8f7:	90                   	nop

000008f8 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 8f8:	55                   	push   %ebp
 8f9:	89 e5                	mov    %esp,%ebp
 8fb:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 8fe:	8b 45 08             	mov    0x8(%ebp),%eax
 901:	83 e8 08             	sub    $0x8,%eax
 904:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 907:	a1 e4 0c 00 00       	mov    0xce4,%eax
 90c:	89 45 fc             	mov    %eax,-0x4(%ebp)
 90f:	eb 24                	jmp    935 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 911:	8b 45 fc             	mov    -0x4(%ebp),%eax
 914:	8b 00                	mov    (%eax),%eax
 916:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 919:	77 12                	ja     92d <free+0x35>
 91b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 91e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 921:	77 24                	ja     947 <free+0x4f>
 923:	8b 45 fc             	mov    -0x4(%ebp),%eax
 926:	8b 00                	mov    (%eax),%eax
 928:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 92b:	77 1a                	ja     947 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 930:	8b 00                	mov    (%eax),%eax
 932:	89 45 fc             	mov    %eax,-0x4(%ebp)
 935:	8b 45 f8             	mov    -0x8(%ebp),%eax
 938:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 93b:	76 d4                	jbe    911 <free+0x19>
 93d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 940:	8b 00                	mov    (%eax),%eax
 942:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 945:	76 ca                	jbe    911 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 947:	8b 45 f8             	mov    -0x8(%ebp),%eax
 94a:	8b 40 04             	mov    0x4(%eax),%eax
 94d:	c1 e0 03             	shl    $0x3,%eax
 950:	89 c2                	mov    %eax,%edx
 952:	03 55 f8             	add    -0x8(%ebp),%edx
 955:	8b 45 fc             	mov    -0x4(%ebp),%eax
 958:	8b 00                	mov    (%eax),%eax
 95a:	39 c2                	cmp    %eax,%edx
 95c:	75 24                	jne    982 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
 95e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 961:	8b 50 04             	mov    0x4(%eax),%edx
 964:	8b 45 fc             	mov    -0x4(%ebp),%eax
 967:	8b 00                	mov    (%eax),%eax
 969:	8b 40 04             	mov    0x4(%eax),%eax
 96c:	01 c2                	add    %eax,%edx
 96e:	8b 45 f8             	mov    -0x8(%ebp),%eax
 971:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 974:	8b 45 fc             	mov    -0x4(%ebp),%eax
 977:	8b 00                	mov    (%eax),%eax
 979:	8b 10                	mov    (%eax),%edx
 97b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97e:	89 10                	mov    %edx,(%eax)
 980:	eb 0a                	jmp    98c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
 982:	8b 45 fc             	mov    -0x4(%ebp),%eax
 985:	8b 10                	mov    (%eax),%edx
 987:	8b 45 f8             	mov    -0x8(%ebp),%eax
 98a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 98c:	8b 45 fc             	mov    -0x4(%ebp),%eax
 98f:	8b 40 04             	mov    0x4(%eax),%eax
 992:	c1 e0 03             	shl    $0x3,%eax
 995:	03 45 fc             	add    -0x4(%ebp),%eax
 998:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 99b:	75 20                	jne    9bd <free+0xc5>
    p->s.size += bp->s.size;
 99d:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a0:	8b 50 04             	mov    0x4(%eax),%edx
 9a3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9a6:	8b 40 04             	mov    0x4(%eax),%eax
 9a9:	01 c2                	add    %eax,%edx
 9ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9ae:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9b4:	8b 10                	mov    (%eax),%edx
 9b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b9:	89 10                	mov    %edx,(%eax)
 9bb:	eb 08                	jmp    9c5 <free+0xcd>
  } else
    p->s.ptr = bp;
 9bd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9c3:	89 10                	mov    %edx,(%eax)
  freep = p;
 9c5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c8:	a3 e4 0c 00 00       	mov    %eax,0xce4
}
 9cd:	c9                   	leave  
 9ce:	c3                   	ret    

000009cf <morecore>:

static Header*
morecore(uint nu)
{
 9cf:	55                   	push   %ebp
 9d0:	89 e5                	mov    %esp,%ebp
 9d2:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 9d5:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 9dc:	77 07                	ja     9e5 <morecore+0x16>
    nu = 4096;
 9de:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 9e5:	8b 45 08             	mov    0x8(%ebp),%eax
 9e8:	c1 e0 03             	shl    $0x3,%eax
 9eb:	89 04 24             	mov    %eax,(%esp)
 9ee:	e8 4d fc ff ff       	call   640 <sbrk>
 9f3:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
 9f6:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
 9fa:	75 07                	jne    a03 <morecore+0x34>
    return 0;
 9fc:	b8 00 00 00 00       	mov    $0x0,%eax
 a01:	eb 22                	jmp    a25 <morecore+0x56>
  hp = (Header*)p;
 a03:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a06:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
 a09:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a0c:	8b 55 08             	mov    0x8(%ebp),%edx
 a0f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a12:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a15:	83 c0 08             	add    $0x8,%eax
 a18:	89 04 24             	mov    %eax,(%esp)
 a1b:	e8 d8 fe ff ff       	call   8f8 <free>
  return freep;
 a20:	a1 e4 0c 00 00       	mov    0xce4,%eax
}
 a25:	c9                   	leave  
 a26:	c3                   	ret    

00000a27 <malloc>:

void*
malloc(uint nbytes)
{
 a27:	55                   	push   %ebp
 a28:	89 e5                	mov    %esp,%ebp
 a2a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a2d:	8b 45 08             	mov    0x8(%ebp),%eax
 a30:	83 c0 07             	add    $0x7,%eax
 a33:	c1 e8 03             	shr    $0x3,%eax
 a36:	83 c0 01             	add    $0x1,%eax
 a39:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
 a3c:	a1 e4 0c 00 00       	mov    0xce4,%eax
 a41:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a44:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a48:	75 23                	jne    a6d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a4a:	c7 45 f0 dc 0c 00 00 	movl   $0xcdc,-0x10(%ebp)
 a51:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a54:	a3 e4 0c 00 00       	mov    %eax,0xce4
 a59:	a1 e4 0c 00 00       	mov    0xce4,%eax
 a5e:	a3 dc 0c 00 00       	mov    %eax,0xcdc
    base.s.size = 0;
 a63:	c7 05 e0 0c 00 00 00 	movl   $0x0,0xce0
 a6a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a6d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a70:	8b 00                	mov    (%eax),%eax
 a72:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
 a75:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a78:	8b 40 04             	mov    0x4(%eax),%eax
 a7b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 a7e:	72 4d                	jb     acd <malloc+0xa6>
      if(p->s.size == nunits)
 a80:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a83:	8b 40 04             	mov    0x4(%eax),%eax
 a86:	3b 45 f4             	cmp    -0xc(%ebp),%eax
 a89:	75 0c                	jne    a97 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 a8b:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a8e:	8b 10                	mov    (%eax),%edx
 a90:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a93:	89 10                	mov    %edx,(%eax)
 a95:	eb 26                	jmp    abd <malloc+0x96>
      else {
        p->s.size -= nunits;
 a97:	8b 45 ec             	mov    -0x14(%ebp),%eax
 a9a:	8b 40 04             	mov    0x4(%eax),%eax
 a9d:	89 c2                	mov    %eax,%edx
 a9f:	2b 55 f4             	sub    -0xc(%ebp),%edx
 aa2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aa5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 aa8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 aab:	8b 40 04             	mov    0x4(%eax),%eax
 aae:	c1 e0 03             	shl    $0x3,%eax
 ab1:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
 ab4:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ab7:	8b 55 f4             	mov    -0xc(%ebp),%edx
 aba:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 abd:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac0:	a3 e4 0c 00 00       	mov    %eax,0xce4
      return (void*)(p + 1);
 ac5:	8b 45 ec             	mov    -0x14(%ebp),%eax
 ac8:	83 c0 08             	add    $0x8,%eax
 acb:	eb 38                	jmp    b05 <malloc+0xde>
    }
    if(p == freep)
 acd:	a1 e4 0c 00 00       	mov    0xce4,%eax
 ad2:	39 45 ec             	cmp    %eax,-0x14(%ebp)
 ad5:	75 1b                	jne    af2 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 ad7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ada:	89 04 24             	mov    %eax,(%esp)
 add:	e8 ed fe ff ff       	call   9cf <morecore>
 ae2:	89 45 ec             	mov    %eax,-0x14(%ebp)
 ae5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 ae9:	75 07                	jne    af2 <malloc+0xcb>
        return 0;
 aeb:	b8 00 00 00 00       	mov    $0x0,%eax
 af0:	eb 13                	jmp    b05 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 af2:	8b 45 ec             	mov    -0x14(%ebp),%eax
 af5:	89 45 f0             	mov    %eax,-0x10(%ebp)
 af8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 afb:	8b 00                	mov    (%eax),%eax
 afd:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b00:	e9 70 ff ff ff       	jmp    a75 <malloc+0x4e>
}
 b05:	c9                   	leave  
 b06:	c3                   	ret    
 b07:	90                   	nop

00000b08 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 b08:	55                   	push   %ebp
 b09:	89 e5                	mov    %esp,%ebp
 b0b:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 b0e:	8b 55 08             	mov    0x8(%ebp),%edx
 b11:	8b 45 0c             	mov    0xc(%ebp),%eax
 b14:	8b 4d 08             	mov    0x8(%ebp),%ecx
 b17:	f0 87 02             	lock xchg %eax,(%edx)
 b1a:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 b1d:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 b20:	c9                   	leave  
 b21:	c3                   	ret    

00000b22 <lock_init>:
#include "spinlock.h"
#include "x86.h"
#include "proc.h"


void lock_init(lock_t *lock){
 b22:	55                   	push   %ebp
 b23:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 b25:	8b 45 08             	mov    0x8(%ebp),%eax
 b28:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 b2e:	5d                   	pop    %ebp
 b2f:	c3                   	ret    

00000b30 <lock_acquire>:
void lock_acquire(lock_t *lock){
 b30:	55                   	push   %ebp
 b31:	89 e5                	mov    %esp,%ebp
 b33:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 b36:	8b 45 08             	mov    0x8(%ebp),%eax
 b39:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 b40:	00 
 b41:	89 04 24             	mov    %eax,(%esp)
 b44:	e8 bf ff ff ff       	call   b08 <xchg>
 b49:	85 c0                	test   %eax,%eax
 b4b:	75 e9                	jne    b36 <lock_acquire+0x6>
}
 b4d:	c9                   	leave  
 b4e:	c3                   	ret    

00000b4f <lock_release>:
void lock_release(lock_t *lock){
 b4f:	55                   	push   %ebp
 b50:	89 e5                	mov    %esp,%ebp
 b52:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 b55:	8b 45 08             	mov    0x8(%ebp),%eax
 b58:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 b5f:	00 
 b60:	89 04 24             	mov    %eax,(%esp)
 b63:	e8 a0 ff ff ff       	call   b08 <xchg>
}
 b68:	c9                   	leave  
 b69:	c3                   	ret    

00000b6a <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 b6a:	55                   	push   %ebp
 b6b:	89 e5                	mov    %esp,%ebp
 b6d:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 b70:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 b77:	e8 ab fe ff ff       	call   a27 <malloc>
 b7c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    void *garbage_stack = stack; 
 b7f:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b82:	89 45 f4             	mov    %eax,-0xc(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 b85:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b88:	25 ff 0f 00 00       	and    $0xfff,%eax
 b8d:	85 c0                	test   %eax,%eax
 b8f:	74 15                	je     ba6 <thread_create+0x3c>
        stack = stack + (4096 - (uint)stack % 4096);
 b91:	8b 45 f0             	mov    -0x10(%ebp),%eax
 b94:	89 c2                	mov    %eax,%edx
 b96:	81 e2 ff 0f 00 00    	and    $0xfff,%edx
 b9c:	b8 00 10 00 00       	mov    $0x1000,%eax
 ba1:	29 d0                	sub    %edx,%eax
 ba3:	01 45 f0             	add    %eax,-0x10(%ebp)
    }
    if (stack == 0){
 ba6:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 baa:	75 1b                	jne    bc7 <thread_create+0x5d>

        printf(1,"malloc fail \n");
 bac:	c7 44 24 04 8a 0c 00 	movl   $0xc8a,0x4(%esp)
 bb3:	00 
 bb4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bbb:	e8 81 fb ff ff       	call   741 <printf>
        return 0;
 bc0:	b8 00 00 00 00       	mov    $0x0,%eax
 bc5:	eb 70                	jmp    c37 <thread_create+0xcd>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,0);
 bc7:	8b 55 08             	mov    0x8(%ebp),%edx
 bca:	8b 45 f0             	mov    -0x10(%ebp),%eax
 bcd:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 bd4:	00 
 bd5:	89 54 24 08          	mov    %edx,0x8(%esp)
 bd9:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 be0:	00 
 be1:	89 04 24             	mov    %eax,(%esp)
 be4:	e8 6f fa ff ff       	call   658 <clone>
 be9:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 bec:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 bf0:	79 1b                	jns    c0d <thread_create+0xa3>
        printf(1,"clone fails\n");
 bf2:	c7 44 24 04 98 0c 00 	movl   $0xc98,0x4(%esp)
 bf9:	00 
 bfa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c01:	e8 3b fb ff ff       	call   741 <printf>
        return 0;
 c06:	b8 00 00 00 00       	mov    $0x0,%eax
 c0b:	eb 2a                	jmp    c37 <thread_create+0xcd>
    }
    if(tid > 0){
 c0d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c11:	7e 05                	jle    c18 <thread_create+0xae>
        return garbage_stack;
 c13:	8b 45 f4             	mov    -0xc(%ebp),%eax
 c16:	eb 1f                	jmp    c37 <thread_create+0xcd>
    }
    if(tid == 0){
 c18:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c1c:	75 14                	jne    c32 <thread_create+0xc8>
        printf(1,"tid = 0 return \n");
 c1e:	c7 44 24 04 a5 0c 00 	movl   $0xca5,0x4(%esp)
 c25:	00 
 c26:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c2d:	e8 0f fb ff ff       	call   741 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 c32:	b8 00 00 00 00       	mov    $0x0,%eax
}
 c37:	c9                   	leave  
 c38:	c3                   	ret    
