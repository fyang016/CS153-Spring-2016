
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
   d:	e8 dd 03 00 00       	call   3ef <strlen>
  12:	8b 55 08             	mov    0x8(%ebp),%edx
  15:	01 d0                	add    %edx,%eax
  17:	89 45 f4             	mov    %eax,-0xc(%ebp)
  1a:	eb 04                	jmp    20 <fmtname+0x20>
  1c:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
  20:	8b 45 f4             	mov    -0xc(%ebp),%eax
  23:	3b 45 08             	cmp    0x8(%ebp),%eax
  26:	72 0a                	jb     32 <fmtname+0x32>
  28:	8b 45 f4             	mov    -0xc(%ebp),%eax
  2b:	0f b6 00             	movzbl (%eax),%eax
  2e:	3c 2f                	cmp    $0x2f,%al
  30:	75 ea                	jne    1c <fmtname+0x1c>
    ;
  p++;
  32:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  
  // Return blank-padded name.
  if(strlen(p) >= DIRSIZ)
  36:	8b 45 f4             	mov    -0xc(%ebp),%eax
  39:	89 04 24             	mov    %eax,(%esp)
  3c:	e8 ae 03 00 00       	call   3ef <strlen>
  41:	83 f8 0d             	cmp    $0xd,%eax
  44:	76 05                	jbe    4b <fmtname+0x4b>
    return p;
  46:	8b 45 f4             	mov    -0xc(%ebp),%eax
  49:	eb 5f                	jmp    aa <fmtname+0xaa>
  memmove(buf, p, strlen(p));
  4b:	8b 45 f4             	mov    -0xc(%ebp),%eax
  4e:	89 04 24             	mov    %eax,(%esp)
  51:	e8 99 03 00 00       	call   3ef <strlen>
  56:	89 44 24 08          	mov    %eax,0x8(%esp)
  5a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  5d:	89 44 24 04          	mov    %eax,0x4(%esp)
  61:	c7 04 24 3c 13 00 00 	movl   $0x133c,(%esp)
  68:	e8 11 05 00 00       	call   57e <memmove>
  memset(buf+strlen(p), ' ', DIRSIZ-strlen(p));
  6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  70:	89 04 24             	mov    %eax,(%esp)
  73:	e8 77 03 00 00       	call   3ef <strlen>
  78:	ba 0e 00 00 00       	mov    $0xe,%edx
  7d:	89 d3                	mov    %edx,%ebx
  7f:	29 c3                	sub    %eax,%ebx
  81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  84:	89 04 24             	mov    %eax,(%esp)
  87:	e8 63 03 00 00       	call   3ef <strlen>
  8c:	05 3c 13 00 00       	add    $0x133c,%eax
  91:	89 5c 24 08          	mov    %ebx,0x8(%esp)
  95:	c7 44 24 04 20 00 00 	movl   $0x20,0x4(%esp)
  9c:	00 
  9d:	89 04 24             	mov    %eax,(%esp)
  a0:	e8 71 03 00 00       	call   416 <memset>
  return buf;
  a5:	b8 3c 13 00 00       	mov    $0x133c,%eax
}
  aa:	83 c4 24             	add    $0x24,%esp
  ad:	5b                   	pop    %ebx
  ae:	5d                   	pop    %ebp
  af:	c3                   	ret    

000000b0 <ls>:

void
ls(char *path)
{
  b0:	55                   	push   %ebp
  b1:	89 e5                	mov    %esp,%ebp
  b3:	57                   	push   %edi
  b4:	56                   	push   %esi
  b5:	53                   	push   %ebx
  b6:	81 ec 5c 02 00 00    	sub    $0x25c,%esp
  char buf[512], *p;
  int fd;
  struct dirent de;
  struct stat st;
  
  if((fd = open(path, 0)) < 0){
  bc:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  c3:	00 
  c4:	8b 45 08             	mov    0x8(%ebp),%eax
  c7:	89 04 24             	mov    %eax,(%esp)
  ca:	e8 34 05 00 00       	call   603 <open>
  cf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  d2:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  d6:	79 20                	jns    f8 <ls+0x48>
    printf(2, "ls: cannot open %s\n", path);
  d8:	8b 45 08             	mov    0x8(%ebp),%eax
  db:	89 44 24 08          	mov    %eax,0x8(%esp)
  df:	c7 44 24 04 92 0e 00 	movl   $0xe92,0x4(%esp)
  e6:	00 
  e7:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
  ee:	e8 78 06 00 00       	call   76b <printf>
    return;
  f3:	e9 01 02 00 00       	jmp    2f9 <ls+0x249>
  }
  
  if(fstat(fd, &st) < 0){
  f8:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
  fe:	89 44 24 04          	mov    %eax,0x4(%esp)
 102:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 105:	89 04 24             	mov    %eax,(%esp)
 108:	e8 0e 05 00 00       	call   61b <fstat>
 10d:	85 c0                	test   %eax,%eax
 10f:	79 2b                	jns    13c <ls+0x8c>
    printf(2, "ls: cannot stat %s\n", path);
 111:	8b 45 08             	mov    0x8(%ebp),%eax
 114:	89 44 24 08          	mov    %eax,0x8(%esp)
 118:	c7 44 24 04 a6 0e 00 	movl   $0xea6,0x4(%esp)
 11f:	00 
 120:	c7 04 24 02 00 00 00 	movl   $0x2,(%esp)
 127:	e8 3f 06 00 00       	call   76b <printf>
    close(fd);
 12c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 12f:	89 04 24             	mov    %eax,(%esp)
 132:	e8 b4 04 00 00       	call   5eb <close>
    return;
 137:	e9 bd 01 00 00       	jmp    2f9 <ls+0x249>
  }
  
  switch(st.type){
 13c:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 143:	98                   	cwtl   
 144:	83 f8 01             	cmp    $0x1,%eax
 147:	74 53                	je     19c <ls+0xec>
 149:	83 f8 02             	cmp    $0x2,%eax
 14c:	0f 85 9c 01 00 00    	jne    2ee <ls+0x23e>
  case T_FILE:
    printf(1, "%s %d %d %d\n", fmtname(path), st.type, st.ino, st.size);
 152:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 158:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 15e:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 165:	0f bf d8             	movswl %ax,%ebx
 168:	8b 45 08             	mov    0x8(%ebp),%eax
 16b:	89 04 24             	mov    %eax,(%esp)
 16e:	e8 8d fe ff ff       	call   0 <fmtname>
 173:	89 7c 24 14          	mov    %edi,0x14(%esp)
 177:	89 74 24 10          	mov    %esi,0x10(%esp)
 17b:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 17f:	89 44 24 08          	mov    %eax,0x8(%esp)
 183:	c7 44 24 04 ba 0e 00 	movl   $0xeba,0x4(%esp)
 18a:	00 
 18b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 192:	e8 d4 05 00 00       	call   76b <printf>
    break;
 197:	e9 52 01 00 00       	jmp    2ee <ls+0x23e>
  
  case T_DIR:
    if(strlen(path) + 1 + DIRSIZ + 1 > sizeof buf){
 19c:	8b 45 08             	mov    0x8(%ebp),%eax
 19f:	89 04 24             	mov    %eax,(%esp)
 1a2:	e8 48 02 00 00       	call   3ef <strlen>
 1a7:	83 c0 10             	add    $0x10,%eax
 1aa:	3d 00 02 00 00       	cmp    $0x200,%eax
 1af:	76 19                	jbe    1ca <ls+0x11a>
      printf(1, "ls: path too long\n");
 1b1:	c7 44 24 04 c7 0e 00 	movl   $0xec7,0x4(%esp)
 1b8:	00 
 1b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 1c0:	e8 a6 05 00 00       	call   76b <printf>
      break;
 1c5:	e9 24 01 00 00       	jmp    2ee <ls+0x23e>
    }
    strcpy(buf, path);
 1ca:	8b 45 08             	mov    0x8(%ebp),%eax
 1cd:	89 44 24 04          	mov    %eax,0x4(%esp)
 1d1:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1d7:	89 04 24             	mov    %eax,(%esp)
 1da:	e8 a1 01 00 00       	call   380 <strcpy>
    p = buf+strlen(buf);
 1df:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 1e5:	89 04 24             	mov    %eax,(%esp)
 1e8:	e8 02 02 00 00       	call   3ef <strlen>
 1ed:	8d 95 e0 fd ff ff    	lea    -0x220(%ebp),%edx
 1f3:	01 d0                	add    %edx,%eax
 1f5:	89 45 e0             	mov    %eax,-0x20(%ebp)
    *p++ = '/';
 1f8:	8b 45 e0             	mov    -0x20(%ebp),%eax
 1fb:	8d 50 01             	lea    0x1(%eax),%edx
 1fe:	89 55 e0             	mov    %edx,-0x20(%ebp)
 201:	c6 00 2f             	movb   $0x2f,(%eax)
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 204:	e9 be 00 00 00       	jmp    2c7 <ls+0x217>
      if(de.inum == 0)
 209:	0f b7 85 d0 fd ff ff 	movzwl -0x230(%ebp),%eax
 210:	66 85 c0             	test   %ax,%ax
 213:	75 05                	jne    21a <ls+0x16a>
        continue;
 215:	e9 ad 00 00 00       	jmp    2c7 <ls+0x217>
      memmove(p, de.name, DIRSIZ);
 21a:	c7 44 24 08 0e 00 00 	movl   $0xe,0x8(%esp)
 221:	00 
 222:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 228:	83 c0 02             	add    $0x2,%eax
 22b:	89 44 24 04          	mov    %eax,0x4(%esp)
 22f:	8b 45 e0             	mov    -0x20(%ebp),%eax
 232:	89 04 24             	mov    %eax,(%esp)
 235:	e8 44 03 00 00       	call   57e <memmove>
      p[DIRSIZ] = 0;
 23a:	8b 45 e0             	mov    -0x20(%ebp),%eax
 23d:	83 c0 0e             	add    $0xe,%eax
 240:	c6 00 00             	movb   $0x0,(%eax)
      if(stat(buf, &st) < 0){
 243:	8d 85 bc fd ff ff    	lea    -0x244(%ebp),%eax
 249:	89 44 24 04          	mov    %eax,0x4(%esp)
 24d:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 253:	89 04 24             	mov    %eax,(%esp)
 256:	e8 88 02 00 00       	call   4e3 <stat>
 25b:	85 c0                	test   %eax,%eax
 25d:	79 20                	jns    27f <ls+0x1cf>
        printf(1, "ls: cannot stat %s\n", buf);
 25f:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 265:	89 44 24 08          	mov    %eax,0x8(%esp)
 269:	c7 44 24 04 a6 0e 00 	movl   $0xea6,0x4(%esp)
 270:	00 
 271:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 278:	e8 ee 04 00 00       	call   76b <printf>
        continue;
 27d:	eb 48                	jmp    2c7 <ls+0x217>
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
 27f:	8b bd cc fd ff ff    	mov    -0x234(%ebp),%edi
 285:	8b b5 c4 fd ff ff    	mov    -0x23c(%ebp),%esi
 28b:	0f b7 85 bc fd ff ff 	movzwl -0x244(%ebp),%eax
 292:	0f bf d8             	movswl %ax,%ebx
 295:	8d 85 e0 fd ff ff    	lea    -0x220(%ebp),%eax
 29b:	89 04 24             	mov    %eax,(%esp)
 29e:	e8 5d fd ff ff       	call   0 <fmtname>
 2a3:	89 7c 24 14          	mov    %edi,0x14(%esp)
 2a7:	89 74 24 10          	mov    %esi,0x10(%esp)
 2ab:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
 2af:	89 44 24 08          	mov    %eax,0x8(%esp)
 2b3:	c7 44 24 04 ba 0e 00 	movl   $0xeba,0x4(%esp)
 2ba:	00 
 2bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 2c2:	e8 a4 04 00 00       	call   76b <printf>
      break;
    }
    strcpy(buf, path);
    p = buf+strlen(buf);
    *p++ = '/';
    while(read(fd, &de, sizeof(de)) == sizeof(de)){
 2c7:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 2ce:	00 
 2cf:	8d 85 d0 fd ff ff    	lea    -0x230(%ebp),%eax
 2d5:	89 44 24 04          	mov    %eax,0x4(%esp)
 2d9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2dc:	89 04 24             	mov    %eax,(%esp)
 2df:	e8 f7 02 00 00       	call   5db <read>
 2e4:	83 f8 10             	cmp    $0x10,%eax
 2e7:	0f 84 1c ff ff ff    	je     209 <ls+0x159>
        printf(1, "ls: cannot stat %s\n", buf);
        continue;
      }
      printf(1, "%s %d %d %d\n", fmtname(buf), st.type, st.ino, st.size);
    }
    break;
 2ed:	90                   	nop
  }
  close(fd);
 2ee:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 2f1:	89 04 24             	mov    %eax,(%esp)
 2f4:	e8 f2 02 00 00       	call   5eb <close>
}
 2f9:	81 c4 5c 02 00 00    	add    $0x25c,%esp
 2ff:	5b                   	pop    %ebx
 300:	5e                   	pop    %esi
 301:	5f                   	pop    %edi
 302:	5d                   	pop    %ebp
 303:	c3                   	ret    

00000304 <main>:

int
main(int argc, char *argv[])
{
 304:	55                   	push   %ebp
 305:	89 e5                	mov    %esp,%ebp
 307:	83 e4 f0             	and    $0xfffffff0,%esp
 30a:	83 ec 20             	sub    $0x20,%esp
  int i;

  if(argc < 2){
 30d:	83 7d 08 01          	cmpl   $0x1,0x8(%ebp)
 311:	7f 11                	jg     324 <main+0x20>
    ls(".");
 313:	c7 04 24 da 0e 00 00 	movl   $0xeda,(%esp)
 31a:	e8 91 fd ff ff       	call   b0 <ls>
    exit();
 31f:	e8 9f 02 00 00       	call   5c3 <exit>
  }
  for(i=1; i<argc; i++)
 324:	c7 44 24 1c 01 00 00 	movl   $0x1,0x1c(%esp)
 32b:	00 
 32c:	eb 1f                	jmp    34d <main+0x49>
    ls(argv[i]);
 32e:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 332:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
 339:	8b 45 0c             	mov    0xc(%ebp),%eax
 33c:	01 d0                	add    %edx,%eax
 33e:	8b 00                	mov    (%eax),%eax
 340:	89 04 24             	mov    %eax,(%esp)
 343:	e8 68 fd ff ff       	call   b0 <ls>

  if(argc < 2){
    ls(".");
    exit();
  }
  for(i=1; i<argc; i++)
 348:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
 34d:	8b 44 24 1c          	mov    0x1c(%esp),%eax
 351:	3b 45 08             	cmp    0x8(%ebp),%eax
 354:	7c d8                	jl     32e <main+0x2a>
    ls(argv[i]);
  exit();
 356:	e8 68 02 00 00       	call   5c3 <exit>

0000035b <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
 35b:	55                   	push   %ebp
 35c:	89 e5                	mov    %esp,%ebp
 35e:	57                   	push   %edi
 35f:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
 360:	8b 4d 08             	mov    0x8(%ebp),%ecx
 363:	8b 55 10             	mov    0x10(%ebp),%edx
 366:	8b 45 0c             	mov    0xc(%ebp),%eax
 369:	89 cb                	mov    %ecx,%ebx
 36b:	89 df                	mov    %ebx,%edi
 36d:	89 d1                	mov    %edx,%ecx
 36f:	fc                   	cld    
 370:	f3 aa                	rep stos %al,%es:(%edi)
 372:	89 ca                	mov    %ecx,%edx
 374:	89 fb                	mov    %edi,%ebx
 376:	89 5d 08             	mov    %ebx,0x8(%ebp)
 379:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
 37c:	5b                   	pop    %ebx
 37d:	5f                   	pop    %edi
 37e:	5d                   	pop    %ebp
 37f:	c3                   	ret    

00000380 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
 380:	55                   	push   %ebp
 381:	89 e5                	mov    %esp,%ebp
 383:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
 386:	8b 45 08             	mov    0x8(%ebp),%eax
 389:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
 38c:	90                   	nop
 38d:	8b 45 08             	mov    0x8(%ebp),%eax
 390:	8d 50 01             	lea    0x1(%eax),%edx
 393:	89 55 08             	mov    %edx,0x8(%ebp)
 396:	8b 55 0c             	mov    0xc(%ebp),%edx
 399:	8d 4a 01             	lea    0x1(%edx),%ecx
 39c:	89 4d 0c             	mov    %ecx,0xc(%ebp)
 39f:	0f b6 12             	movzbl (%edx),%edx
 3a2:	88 10                	mov    %dl,(%eax)
 3a4:	0f b6 00             	movzbl (%eax),%eax
 3a7:	84 c0                	test   %al,%al
 3a9:	75 e2                	jne    38d <strcpy+0xd>
    ;
  return os;
 3ab:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 3ae:	c9                   	leave  
 3af:	c3                   	ret    

000003b0 <strcmp>:

int
strcmp(const char *p, const char *q)
{
 3b0:	55                   	push   %ebp
 3b1:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
 3b3:	eb 08                	jmp    3bd <strcmp+0xd>
    p++, q++;
 3b5:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 3b9:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
 3bd:	8b 45 08             	mov    0x8(%ebp),%eax
 3c0:	0f b6 00             	movzbl (%eax),%eax
 3c3:	84 c0                	test   %al,%al
 3c5:	74 10                	je     3d7 <strcmp+0x27>
 3c7:	8b 45 08             	mov    0x8(%ebp),%eax
 3ca:	0f b6 10             	movzbl (%eax),%edx
 3cd:	8b 45 0c             	mov    0xc(%ebp),%eax
 3d0:	0f b6 00             	movzbl (%eax),%eax
 3d3:	38 c2                	cmp    %al,%dl
 3d5:	74 de                	je     3b5 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
 3d7:	8b 45 08             	mov    0x8(%ebp),%eax
 3da:	0f b6 00             	movzbl (%eax),%eax
 3dd:	0f b6 d0             	movzbl %al,%edx
 3e0:	8b 45 0c             	mov    0xc(%ebp),%eax
 3e3:	0f b6 00             	movzbl (%eax),%eax
 3e6:	0f b6 c0             	movzbl %al,%eax
 3e9:	29 c2                	sub    %eax,%edx
 3eb:	89 d0                	mov    %edx,%eax
}
 3ed:	5d                   	pop    %ebp
 3ee:	c3                   	ret    

000003ef <strlen>:

uint
strlen(char *s)
{
 3ef:	55                   	push   %ebp
 3f0:	89 e5                	mov    %esp,%ebp
 3f2:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
 3f5:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
 3fc:	eb 04                	jmp    402 <strlen+0x13>
 3fe:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
 402:	8b 55 fc             	mov    -0x4(%ebp),%edx
 405:	8b 45 08             	mov    0x8(%ebp),%eax
 408:	01 d0                	add    %edx,%eax
 40a:	0f b6 00             	movzbl (%eax),%eax
 40d:	84 c0                	test   %al,%al
 40f:	75 ed                	jne    3fe <strlen+0xf>
    ;
  return n;
 411:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 414:	c9                   	leave  
 415:	c3                   	ret    

00000416 <memset>:

void*
memset(void *dst, int c, uint n)
{
 416:	55                   	push   %ebp
 417:	89 e5                	mov    %esp,%ebp
 419:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
 41c:	8b 45 10             	mov    0x10(%ebp),%eax
 41f:	89 44 24 08          	mov    %eax,0x8(%esp)
 423:	8b 45 0c             	mov    0xc(%ebp),%eax
 426:	89 44 24 04          	mov    %eax,0x4(%esp)
 42a:	8b 45 08             	mov    0x8(%ebp),%eax
 42d:	89 04 24             	mov    %eax,(%esp)
 430:	e8 26 ff ff ff       	call   35b <stosb>
  return dst;
 435:	8b 45 08             	mov    0x8(%ebp),%eax
}
 438:	c9                   	leave  
 439:	c3                   	ret    

0000043a <strchr>:

char*
strchr(const char *s, char c)
{
 43a:	55                   	push   %ebp
 43b:	89 e5                	mov    %esp,%ebp
 43d:	83 ec 04             	sub    $0x4,%esp
 440:	8b 45 0c             	mov    0xc(%ebp),%eax
 443:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
 446:	eb 14                	jmp    45c <strchr+0x22>
    if(*s == c)
 448:	8b 45 08             	mov    0x8(%ebp),%eax
 44b:	0f b6 00             	movzbl (%eax),%eax
 44e:	3a 45 fc             	cmp    -0x4(%ebp),%al
 451:	75 05                	jne    458 <strchr+0x1e>
      return (char*)s;
 453:	8b 45 08             	mov    0x8(%ebp),%eax
 456:	eb 13                	jmp    46b <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
 458:	83 45 08 01          	addl   $0x1,0x8(%ebp)
 45c:	8b 45 08             	mov    0x8(%ebp),%eax
 45f:	0f b6 00             	movzbl (%eax),%eax
 462:	84 c0                	test   %al,%al
 464:	75 e2                	jne    448 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
 466:	b8 00 00 00 00       	mov    $0x0,%eax
}
 46b:	c9                   	leave  
 46c:	c3                   	ret    

0000046d <gets>:

char*
gets(char *buf, int max)
{
 46d:	55                   	push   %ebp
 46e:	89 e5                	mov    %esp,%ebp
 470:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 473:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
 47a:	eb 4c                	jmp    4c8 <gets+0x5b>
    cc = read(0, &c, 1);
 47c:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 483:	00 
 484:	8d 45 ef             	lea    -0x11(%ebp),%eax
 487:	89 44 24 04          	mov    %eax,0x4(%esp)
 48b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
 492:	e8 44 01 00 00       	call   5db <read>
 497:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
 49a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 49e:	7f 02                	jg     4a2 <gets+0x35>
      break;
 4a0:	eb 31                	jmp    4d3 <gets+0x66>
    buf[i++] = c;
 4a2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4a5:	8d 50 01             	lea    0x1(%eax),%edx
 4a8:	89 55 f4             	mov    %edx,-0xc(%ebp)
 4ab:	89 c2                	mov    %eax,%edx
 4ad:	8b 45 08             	mov    0x8(%ebp),%eax
 4b0:	01 c2                	add    %eax,%edx
 4b2:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4b6:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
 4b8:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4bc:	3c 0a                	cmp    $0xa,%al
 4be:	74 13                	je     4d3 <gets+0x66>
 4c0:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
 4c4:	3c 0d                	cmp    $0xd,%al
 4c6:	74 0b                	je     4d3 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
 4c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 4cb:	83 c0 01             	add    $0x1,%eax
 4ce:	3b 45 0c             	cmp    0xc(%ebp),%eax
 4d1:	7c a9                	jl     47c <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
 4d3:	8b 55 f4             	mov    -0xc(%ebp),%edx
 4d6:	8b 45 08             	mov    0x8(%ebp),%eax
 4d9:	01 d0                	add    %edx,%eax
 4db:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
 4de:	8b 45 08             	mov    0x8(%ebp),%eax
}
 4e1:	c9                   	leave  
 4e2:	c3                   	ret    

000004e3 <stat>:

int
stat(char *n, struct stat *st)
{
 4e3:	55                   	push   %ebp
 4e4:	89 e5                	mov    %esp,%ebp
 4e6:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
 4e9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 4f0:	00 
 4f1:	8b 45 08             	mov    0x8(%ebp),%eax
 4f4:	89 04 24             	mov    %eax,(%esp)
 4f7:	e8 07 01 00 00       	call   603 <open>
 4fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
 4ff:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 503:	79 07                	jns    50c <stat+0x29>
    return -1;
 505:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
 50a:	eb 23                	jmp    52f <stat+0x4c>
  r = fstat(fd, st);
 50c:	8b 45 0c             	mov    0xc(%ebp),%eax
 50f:	89 44 24 04          	mov    %eax,0x4(%esp)
 513:	8b 45 f4             	mov    -0xc(%ebp),%eax
 516:	89 04 24             	mov    %eax,(%esp)
 519:	e8 fd 00 00 00       	call   61b <fstat>
 51e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
 521:	8b 45 f4             	mov    -0xc(%ebp),%eax
 524:	89 04 24             	mov    %eax,(%esp)
 527:	e8 bf 00 00 00       	call   5eb <close>
  return r;
 52c:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
 52f:	c9                   	leave  
 530:	c3                   	ret    

00000531 <atoi>:

int
atoi(const char *s)
{
 531:	55                   	push   %ebp
 532:	89 e5                	mov    %esp,%ebp
 534:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
 537:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
 53e:	eb 25                	jmp    565 <atoi+0x34>
    n = n*10 + *s++ - '0';
 540:	8b 55 fc             	mov    -0x4(%ebp),%edx
 543:	89 d0                	mov    %edx,%eax
 545:	c1 e0 02             	shl    $0x2,%eax
 548:	01 d0                	add    %edx,%eax
 54a:	01 c0                	add    %eax,%eax
 54c:	89 c1                	mov    %eax,%ecx
 54e:	8b 45 08             	mov    0x8(%ebp),%eax
 551:	8d 50 01             	lea    0x1(%eax),%edx
 554:	89 55 08             	mov    %edx,0x8(%ebp)
 557:	0f b6 00             	movzbl (%eax),%eax
 55a:	0f be c0             	movsbl %al,%eax
 55d:	01 c8                	add    %ecx,%eax
 55f:	83 e8 30             	sub    $0x30,%eax
 562:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
 565:	8b 45 08             	mov    0x8(%ebp),%eax
 568:	0f b6 00             	movzbl (%eax),%eax
 56b:	3c 2f                	cmp    $0x2f,%al
 56d:	7e 0a                	jle    579 <atoi+0x48>
 56f:	8b 45 08             	mov    0x8(%ebp),%eax
 572:	0f b6 00             	movzbl (%eax),%eax
 575:	3c 39                	cmp    $0x39,%al
 577:	7e c7                	jle    540 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
 579:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 57c:	c9                   	leave  
 57d:	c3                   	ret    

0000057e <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
 57e:	55                   	push   %ebp
 57f:	89 e5                	mov    %esp,%ebp
 581:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
 584:	8b 45 08             	mov    0x8(%ebp),%eax
 587:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
 58a:	8b 45 0c             	mov    0xc(%ebp),%eax
 58d:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
 590:	eb 17                	jmp    5a9 <memmove+0x2b>
    *dst++ = *src++;
 592:	8b 45 fc             	mov    -0x4(%ebp),%eax
 595:	8d 50 01             	lea    0x1(%eax),%edx
 598:	89 55 fc             	mov    %edx,-0x4(%ebp)
 59b:	8b 55 f8             	mov    -0x8(%ebp),%edx
 59e:	8d 4a 01             	lea    0x1(%edx),%ecx
 5a1:	89 4d f8             	mov    %ecx,-0x8(%ebp)
 5a4:	0f b6 12             	movzbl (%edx),%edx
 5a7:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
 5a9:	8b 45 10             	mov    0x10(%ebp),%eax
 5ac:	8d 50 ff             	lea    -0x1(%eax),%edx
 5af:	89 55 10             	mov    %edx,0x10(%ebp)
 5b2:	85 c0                	test   %eax,%eax
 5b4:	7f dc                	jg     592 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
 5b6:	8b 45 08             	mov    0x8(%ebp),%eax
}
 5b9:	c9                   	leave  
 5ba:	c3                   	ret    

000005bb <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
 5bb:	b8 01 00 00 00       	mov    $0x1,%eax
 5c0:	cd 40                	int    $0x40
 5c2:	c3                   	ret    

000005c3 <exit>:
SYSCALL(exit)
 5c3:	b8 02 00 00 00       	mov    $0x2,%eax
 5c8:	cd 40                	int    $0x40
 5ca:	c3                   	ret    

000005cb <wait>:
SYSCALL(wait)
 5cb:	b8 03 00 00 00       	mov    $0x3,%eax
 5d0:	cd 40                	int    $0x40
 5d2:	c3                   	ret    

000005d3 <pipe>:
SYSCALL(pipe)
 5d3:	b8 04 00 00 00       	mov    $0x4,%eax
 5d8:	cd 40                	int    $0x40
 5da:	c3                   	ret    

000005db <read>:
SYSCALL(read)
 5db:	b8 05 00 00 00       	mov    $0x5,%eax
 5e0:	cd 40                	int    $0x40
 5e2:	c3                   	ret    

000005e3 <write>:
SYSCALL(write)
 5e3:	b8 10 00 00 00       	mov    $0x10,%eax
 5e8:	cd 40                	int    $0x40
 5ea:	c3                   	ret    

000005eb <close>:
SYSCALL(close)
 5eb:	b8 15 00 00 00       	mov    $0x15,%eax
 5f0:	cd 40                	int    $0x40
 5f2:	c3                   	ret    

000005f3 <kill>:
SYSCALL(kill)
 5f3:	b8 06 00 00 00       	mov    $0x6,%eax
 5f8:	cd 40                	int    $0x40
 5fa:	c3                   	ret    

000005fb <exec>:
SYSCALL(exec)
 5fb:	b8 07 00 00 00       	mov    $0x7,%eax
 600:	cd 40                	int    $0x40
 602:	c3                   	ret    

00000603 <open>:
SYSCALL(open)
 603:	b8 0f 00 00 00       	mov    $0xf,%eax
 608:	cd 40                	int    $0x40
 60a:	c3                   	ret    

0000060b <mknod>:
SYSCALL(mknod)
 60b:	b8 11 00 00 00       	mov    $0x11,%eax
 610:	cd 40                	int    $0x40
 612:	c3                   	ret    

00000613 <unlink>:
SYSCALL(unlink)
 613:	b8 12 00 00 00       	mov    $0x12,%eax
 618:	cd 40                	int    $0x40
 61a:	c3                   	ret    

0000061b <fstat>:
SYSCALL(fstat)
 61b:	b8 08 00 00 00       	mov    $0x8,%eax
 620:	cd 40                	int    $0x40
 622:	c3                   	ret    

00000623 <link>:
SYSCALL(link)
 623:	b8 13 00 00 00       	mov    $0x13,%eax
 628:	cd 40                	int    $0x40
 62a:	c3                   	ret    

0000062b <mkdir>:
SYSCALL(mkdir)
 62b:	b8 14 00 00 00       	mov    $0x14,%eax
 630:	cd 40                	int    $0x40
 632:	c3                   	ret    

00000633 <chdir>:
SYSCALL(chdir)
 633:	b8 09 00 00 00       	mov    $0x9,%eax
 638:	cd 40                	int    $0x40
 63a:	c3                   	ret    

0000063b <dup>:
SYSCALL(dup)
 63b:	b8 0a 00 00 00       	mov    $0xa,%eax
 640:	cd 40                	int    $0x40
 642:	c3                   	ret    

00000643 <getpid>:
SYSCALL(getpid)
 643:	b8 0b 00 00 00       	mov    $0xb,%eax
 648:	cd 40                	int    $0x40
 64a:	c3                   	ret    

0000064b <sbrk>:
SYSCALL(sbrk)
 64b:	b8 0c 00 00 00       	mov    $0xc,%eax
 650:	cd 40                	int    $0x40
 652:	c3                   	ret    

00000653 <sleep>:
SYSCALL(sleep)
 653:	b8 0d 00 00 00       	mov    $0xd,%eax
 658:	cd 40                	int    $0x40
 65a:	c3                   	ret    

0000065b <uptime>:
SYSCALL(uptime)
 65b:	b8 0e 00 00 00       	mov    $0xe,%eax
 660:	cd 40                	int    $0x40
 662:	c3                   	ret    

00000663 <clone>:
SYSCALL(clone)
 663:	b8 16 00 00 00       	mov    $0x16,%eax
 668:	cd 40                	int    $0x40
 66a:	c3                   	ret    

0000066b <texit>:
SYSCALL(texit)
 66b:	b8 17 00 00 00       	mov    $0x17,%eax
 670:	cd 40                	int    $0x40
 672:	c3                   	ret    

00000673 <tsleep>:
SYSCALL(tsleep)
 673:	b8 18 00 00 00       	mov    $0x18,%eax
 678:	cd 40                	int    $0x40
 67a:	c3                   	ret    

0000067b <twakeup>:
SYSCALL(twakeup)
 67b:	b8 19 00 00 00       	mov    $0x19,%eax
 680:	cd 40                	int    $0x40
 682:	c3                   	ret    

00000683 <test>:
SYSCALL(test)
 683:	b8 1a 00 00 00       	mov    $0x1a,%eax
 688:	cd 40                	int    $0x40
 68a:	c3                   	ret    

0000068b <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
 68b:	55                   	push   %ebp
 68c:	89 e5                	mov    %esp,%ebp
 68e:	83 ec 18             	sub    $0x18,%esp
 691:	8b 45 0c             	mov    0xc(%ebp),%eax
 694:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
 697:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
 69e:	00 
 69f:	8d 45 f4             	lea    -0xc(%ebp),%eax
 6a2:	89 44 24 04          	mov    %eax,0x4(%esp)
 6a6:	8b 45 08             	mov    0x8(%ebp),%eax
 6a9:	89 04 24             	mov    %eax,(%esp)
 6ac:	e8 32 ff ff ff       	call   5e3 <write>
}
 6b1:	c9                   	leave  
 6b2:	c3                   	ret    

000006b3 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
 6b3:	55                   	push   %ebp
 6b4:	89 e5                	mov    %esp,%ebp
 6b6:	56                   	push   %esi
 6b7:	53                   	push   %ebx
 6b8:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
 6bb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
 6c2:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
 6c6:	74 17                	je     6df <printint+0x2c>
 6c8:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
 6cc:	79 11                	jns    6df <printint+0x2c>
    neg = 1;
 6ce:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
 6d5:	8b 45 0c             	mov    0xc(%ebp),%eax
 6d8:	f7 d8                	neg    %eax
 6da:	89 45 ec             	mov    %eax,-0x14(%ebp)
 6dd:	eb 06                	jmp    6e5 <printint+0x32>
  } else {
    x = xx;
 6df:	8b 45 0c             	mov    0xc(%ebp),%eax
 6e2:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
 6e5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
 6ec:	8b 4d f4             	mov    -0xc(%ebp),%ecx
 6ef:	8d 41 01             	lea    0x1(%ecx),%eax
 6f2:	89 45 f4             	mov    %eax,-0xc(%ebp)
 6f5:	8b 5d 10             	mov    0x10(%ebp),%ebx
 6f8:	8b 45 ec             	mov    -0x14(%ebp),%eax
 6fb:	ba 00 00 00 00       	mov    $0x0,%edx
 700:	f7 f3                	div    %ebx
 702:	89 d0                	mov    %edx,%eax
 704:	0f b6 80 28 13 00 00 	movzbl 0x1328(%eax),%eax
 70b:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
 70f:	8b 75 10             	mov    0x10(%ebp),%esi
 712:	8b 45 ec             	mov    -0x14(%ebp),%eax
 715:	ba 00 00 00 00       	mov    $0x0,%edx
 71a:	f7 f6                	div    %esi
 71c:	89 45 ec             	mov    %eax,-0x14(%ebp)
 71f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 723:	75 c7                	jne    6ec <printint+0x39>
  if(neg)
 725:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 729:	74 10                	je     73b <printint+0x88>
    buf[i++] = '-';
 72b:	8b 45 f4             	mov    -0xc(%ebp),%eax
 72e:	8d 50 01             	lea    0x1(%eax),%edx
 731:	89 55 f4             	mov    %edx,-0xc(%ebp)
 734:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
 739:	eb 1f                	jmp    75a <printint+0xa7>
 73b:	eb 1d                	jmp    75a <printint+0xa7>
    putc(fd, buf[i]);
 73d:	8d 55 dc             	lea    -0x24(%ebp),%edx
 740:	8b 45 f4             	mov    -0xc(%ebp),%eax
 743:	01 d0                	add    %edx,%eax
 745:	0f b6 00             	movzbl (%eax),%eax
 748:	0f be c0             	movsbl %al,%eax
 74b:	89 44 24 04          	mov    %eax,0x4(%esp)
 74f:	8b 45 08             	mov    0x8(%ebp),%eax
 752:	89 04 24             	mov    %eax,(%esp)
 755:	e8 31 ff ff ff       	call   68b <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
 75a:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
 75e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 762:	79 d9                	jns    73d <printint+0x8a>
    putc(fd, buf[i]);
}
 764:	83 c4 30             	add    $0x30,%esp
 767:	5b                   	pop    %ebx
 768:	5e                   	pop    %esi
 769:	5d                   	pop    %ebp
 76a:	c3                   	ret    

0000076b <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
 76b:	55                   	push   %ebp
 76c:	89 e5                	mov    %esp,%ebp
 76e:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
 771:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
 778:	8d 45 0c             	lea    0xc(%ebp),%eax
 77b:	83 c0 04             	add    $0x4,%eax
 77e:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
 781:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
 788:	e9 7c 01 00 00       	jmp    909 <printf+0x19e>
    c = fmt[i] & 0xff;
 78d:	8b 55 0c             	mov    0xc(%ebp),%edx
 790:	8b 45 f0             	mov    -0x10(%ebp),%eax
 793:	01 d0                	add    %edx,%eax
 795:	0f b6 00             	movzbl (%eax),%eax
 798:	0f be c0             	movsbl %al,%eax
 79b:	25 ff 00 00 00       	and    $0xff,%eax
 7a0:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
 7a3:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 7a7:	75 2c                	jne    7d5 <printf+0x6a>
      if(c == '%'){
 7a9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 7ad:	75 0c                	jne    7bb <printf+0x50>
        state = '%';
 7af:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
 7b6:	e9 4a 01 00 00       	jmp    905 <printf+0x19a>
      } else {
        putc(fd, c);
 7bb:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 7be:	0f be c0             	movsbl %al,%eax
 7c1:	89 44 24 04          	mov    %eax,0x4(%esp)
 7c5:	8b 45 08             	mov    0x8(%ebp),%eax
 7c8:	89 04 24             	mov    %eax,(%esp)
 7cb:	e8 bb fe ff ff       	call   68b <putc>
 7d0:	e9 30 01 00 00       	jmp    905 <printf+0x19a>
      }
    } else if(state == '%'){
 7d5:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
 7d9:	0f 85 26 01 00 00    	jne    905 <printf+0x19a>
      if(c == 'd'){
 7df:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
 7e3:	75 2d                	jne    812 <printf+0xa7>
        printint(fd, *ap, 10, 1);
 7e5:	8b 45 e8             	mov    -0x18(%ebp),%eax
 7e8:	8b 00                	mov    (%eax),%eax
 7ea:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
 7f1:	00 
 7f2:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
 7f9:	00 
 7fa:	89 44 24 04          	mov    %eax,0x4(%esp)
 7fe:	8b 45 08             	mov    0x8(%ebp),%eax
 801:	89 04 24             	mov    %eax,(%esp)
 804:	e8 aa fe ff ff       	call   6b3 <printint>
        ap++;
 809:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 80d:	e9 ec 00 00 00       	jmp    8fe <printf+0x193>
      } else if(c == 'x' || c == 'p'){
 812:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
 816:	74 06                	je     81e <printf+0xb3>
 818:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
 81c:	75 2d                	jne    84b <printf+0xe0>
        printint(fd, *ap, 16, 0);
 81e:	8b 45 e8             	mov    -0x18(%ebp),%eax
 821:	8b 00                	mov    (%eax),%eax
 823:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
 82a:	00 
 82b:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
 832:	00 
 833:	89 44 24 04          	mov    %eax,0x4(%esp)
 837:	8b 45 08             	mov    0x8(%ebp),%eax
 83a:	89 04 24             	mov    %eax,(%esp)
 83d:	e8 71 fe ff ff       	call   6b3 <printint>
        ap++;
 842:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 846:	e9 b3 00 00 00       	jmp    8fe <printf+0x193>
      } else if(c == 's'){
 84b:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
 84f:	75 45                	jne    896 <printf+0x12b>
        s = (char*)*ap;
 851:	8b 45 e8             	mov    -0x18(%ebp),%eax
 854:	8b 00                	mov    (%eax),%eax
 856:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
 859:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
 85d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 861:	75 09                	jne    86c <printf+0x101>
          s = "(null)";
 863:	c7 45 f4 dc 0e 00 00 	movl   $0xedc,-0xc(%ebp)
        while(*s != 0){
 86a:	eb 1e                	jmp    88a <printf+0x11f>
 86c:	eb 1c                	jmp    88a <printf+0x11f>
          putc(fd, *s);
 86e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 871:	0f b6 00             	movzbl (%eax),%eax
 874:	0f be c0             	movsbl %al,%eax
 877:	89 44 24 04          	mov    %eax,0x4(%esp)
 87b:	8b 45 08             	mov    0x8(%ebp),%eax
 87e:	89 04 24             	mov    %eax,(%esp)
 881:	e8 05 fe ff ff       	call   68b <putc>
          s++;
 886:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
 88a:	8b 45 f4             	mov    -0xc(%ebp),%eax
 88d:	0f b6 00             	movzbl (%eax),%eax
 890:	84 c0                	test   %al,%al
 892:	75 da                	jne    86e <printf+0x103>
 894:	eb 68                	jmp    8fe <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
 896:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
 89a:	75 1d                	jne    8b9 <printf+0x14e>
        putc(fd, *ap);
 89c:	8b 45 e8             	mov    -0x18(%ebp),%eax
 89f:	8b 00                	mov    (%eax),%eax
 8a1:	0f be c0             	movsbl %al,%eax
 8a4:	89 44 24 04          	mov    %eax,0x4(%esp)
 8a8:	8b 45 08             	mov    0x8(%ebp),%eax
 8ab:	89 04 24             	mov    %eax,(%esp)
 8ae:	e8 d8 fd ff ff       	call   68b <putc>
        ap++;
 8b3:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
 8b7:	eb 45                	jmp    8fe <printf+0x193>
      } else if(c == '%'){
 8b9:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
 8bd:	75 17                	jne    8d6 <printf+0x16b>
        putc(fd, c);
 8bf:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8c2:	0f be c0             	movsbl %al,%eax
 8c5:	89 44 24 04          	mov    %eax,0x4(%esp)
 8c9:	8b 45 08             	mov    0x8(%ebp),%eax
 8cc:	89 04 24             	mov    %eax,(%esp)
 8cf:	e8 b7 fd ff ff       	call   68b <putc>
 8d4:	eb 28                	jmp    8fe <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
 8d6:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
 8dd:	00 
 8de:	8b 45 08             	mov    0x8(%ebp),%eax
 8e1:	89 04 24             	mov    %eax,(%esp)
 8e4:	e8 a2 fd ff ff       	call   68b <putc>
        putc(fd, c);
 8e9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
 8ec:	0f be c0             	movsbl %al,%eax
 8ef:	89 44 24 04          	mov    %eax,0x4(%esp)
 8f3:	8b 45 08             	mov    0x8(%ebp),%eax
 8f6:	89 04 24             	mov    %eax,(%esp)
 8f9:	e8 8d fd ff ff       	call   68b <putc>
      }
      state = 0;
 8fe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
 905:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
 909:	8b 55 0c             	mov    0xc(%ebp),%edx
 90c:	8b 45 f0             	mov    -0x10(%ebp),%eax
 90f:	01 d0                	add    %edx,%eax
 911:	0f b6 00             	movzbl (%eax),%eax
 914:	84 c0                	test   %al,%al
 916:	0f 85 71 fe ff ff    	jne    78d <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
 91c:	c9                   	leave  
 91d:	c3                   	ret    

0000091e <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
 91e:	55                   	push   %ebp
 91f:	89 e5                	mov    %esp,%ebp
 921:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
 924:	8b 45 08             	mov    0x8(%ebp),%eax
 927:	83 e8 08             	sub    $0x8,%eax
 92a:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 92d:	a1 54 13 00 00       	mov    0x1354,%eax
 932:	89 45 fc             	mov    %eax,-0x4(%ebp)
 935:	eb 24                	jmp    95b <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
 937:	8b 45 fc             	mov    -0x4(%ebp),%eax
 93a:	8b 00                	mov    (%eax),%eax
 93c:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 93f:	77 12                	ja     953 <free+0x35>
 941:	8b 45 f8             	mov    -0x8(%ebp),%eax
 944:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 947:	77 24                	ja     96d <free+0x4f>
 949:	8b 45 fc             	mov    -0x4(%ebp),%eax
 94c:	8b 00                	mov    (%eax),%eax
 94e:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 951:	77 1a                	ja     96d <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
 953:	8b 45 fc             	mov    -0x4(%ebp),%eax
 956:	8b 00                	mov    (%eax),%eax
 958:	89 45 fc             	mov    %eax,-0x4(%ebp)
 95b:	8b 45 f8             	mov    -0x8(%ebp),%eax
 95e:	3b 45 fc             	cmp    -0x4(%ebp),%eax
 961:	76 d4                	jbe    937 <free+0x19>
 963:	8b 45 fc             	mov    -0x4(%ebp),%eax
 966:	8b 00                	mov    (%eax),%eax
 968:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 96b:	76 ca                	jbe    937 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
 96d:	8b 45 f8             	mov    -0x8(%ebp),%eax
 970:	8b 40 04             	mov    0x4(%eax),%eax
 973:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 97a:	8b 45 f8             	mov    -0x8(%ebp),%eax
 97d:	01 c2                	add    %eax,%edx
 97f:	8b 45 fc             	mov    -0x4(%ebp),%eax
 982:	8b 00                	mov    (%eax),%eax
 984:	39 c2                	cmp    %eax,%edx
 986:	75 24                	jne    9ac <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
 988:	8b 45 f8             	mov    -0x8(%ebp),%eax
 98b:	8b 50 04             	mov    0x4(%eax),%edx
 98e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 991:	8b 00                	mov    (%eax),%eax
 993:	8b 40 04             	mov    0x4(%eax),%eax
 996:	01 c2                	add    %eax,%edx
 998:	8b 45 f8             	mov    -0x8(%ebp),%eax
 99b:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
 99e:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9a1:	8b 00                	mov    (%eax),%eax
 9a3:	8b 10                	mov    (%eax),%edx
 9a5:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9a8:	89 10                	mov    %edx,(%eax)
 9aa:	eb 0a                	jmp    9b6 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
 9ac:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9af:	8b 10                	mov    (%eax),%edx
 9b1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9b4:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
 9b6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9b9:	8b 40 04             	mov    0x4(%eax),%eax
 9bc:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
 9c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9c6:	01 d0                	add    %edx,%eax
 9c8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
 9cb:	75 20                	jne    9ed <free+0xcf>
    p->s.size += bp->s.size;
 9cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9d0:	8b 50 04             	mov    0x4(%eax),%edx
 9d3:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9d6:	8b 40 04             	mov    0x4(%eax),%eax
 9d9:	01 c2                	add    %eax,%edx
 9db:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9de:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
 9e1:	8b 45 f8             	mov    -0x8(%ebp),%eax
 9e4:	8b 10                	mov    (%eax),%edx
 9e6:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9e9:	89 10                	mov    %edx,(%eax)
 9eb:	eb 08                	jmp    9f5 <free+0xd7>
  } else
    p->s.ptr = bp;
 9ed:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9f0:	8b 55 f8             	mov    -0x8(%ebp),%edx
 9f3:	89 10                	mov    %edx,(%eax)
  freep = p;
 9f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
 9f8:	a3 54 13 00 00       	mov    %eax,0x1354
}
 9fd:	c9                   	leave  
 9fe:	c3                   	ret    

000009ff <morecore>:

static Header*
morecore(uint nu)
{
 9ff:	55                   	push   %ebp
 a00:	89 e5                	mov    %esp,%ebp
 a02:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
 a05:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
 a0c:	77 07                	ja     a15 <morecore+0x16>
    nu = 4096;
 a0e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
 a15:	8b 45 08             	mov    0x8(%ebp),%eax
 a18:	c1 e0 03             	shl    $0x3,%eax
 a1b:	89 04 24             	mov    %eax,(%esp)
 a1e:	e8 28 fc ff ff       	call   64b <sbrk>
 a23:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
 a26:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 a2a:	75 07                	jne    a33 <morecore+0x34>
    return 0;
 a2c:	b8 00 00 00 00       	mov    $0x0,%eax
 a31:	eb 22                	jmp    a55 <morecore+0x56>
  hp = (Header*)p;
 a33:	8b 45 f4             	mov    -0xc(%ebp),%eax
 a36:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
 a39:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a3c:	8b 55 08             	mov    0x8(%ebp),%edx
 a3f:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
 a42:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a45:	83 c0 08             	add    $0x8,%eax
 a48:	89 04 24             	mov    %eax,(%esp)
 a4b:	e8 ce fe ff ff       	call   91e <free>
  return freep;
 a50:	a1 54 13 00 00       	mov    0x1354,%eax
}
 a55:	c9                   	leave  
 a56:	c3                   	ret    

00000a57 <malloc>:

void*
malloc(uint nbytes)
{
 a57:	55                   	push   %ebp
 a58:	89 e5                	mov    %esp,%ebp
 a5a:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
 a5d:	8b 45 08             	mov    0x8(%ebp),%eax
 a60:	83 c0 07             	add    $0x7,%eax
 a63:	c1 e8 03             	shr    $0x3,%eax
 a66:	83 c0 01             	add    $0x1,%eax
 a69:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
 a6c:	a1 54 13 00 00       	mov    0x1354,%eax
 a71:	89 45 f0             	mov    %eax,-0x10(%ebp)
 a74:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
 a78:	75 23                	jne    a9d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
 a7a:	c7 45 f0 4c 13 00 00 	movl   $0x134c,-0x10(%ebp)
 a81:	8b 45 f0             	mov    -0x10(%ebp),%eax
 a84:	a3 54 13 00 00       	mov    %eax,0x1354
 a89:	a1 54 13 00 00       	mov    0x1354,%eax
 a8e:	a3 4c 13 00 00       	mov    %eax,0x134c
    base.s.size = 0;
 a93:	c7 05 50 13 00 00 00 	movl   $0x0,0x1350
 a9a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 a9d:	8b 45 f0             	mov    -0x10(%ebp),%eax
 aa0:	8b 00                	mov    (%eax),%eax
 aa2:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
 aa5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aa8:	8b 40 04             	mov    0x4(%eax),%eax
 aab:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 aae:	72 4d                	jb     afd <malloc+0xa6>
      if(p->s.size == nunits)
 ab0:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ab3:	8b 40 04             	mov    0x4(%eax),%eax
 ab6:	3b 45 ec             	cmp    -0x14(%ebp),%eax
 ab9:	75 0c                	jne    ac7 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
 abb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 abe:	8b 10                	mov    (%eax),%edx
 ac0:	8b 45 f0             	mov    -0x10(%ebp),%eax
 ac3:	89 10                	mov    %edx,(%eax)
 ac5:	eb 26                	jmp    aed <malloc+0x96>
      else {
        p->s.size -= nunits;
 ac7:	8b 45 f4             	mov    -0xc(%ebp),%eax
 aca:	8b 40 04             	mov    0x4(%eax),%eax
 acd:	2b 45 ec             	sub    -0x14(%ebp),%eax
 ad0:	89 c2                	mov    %eax,%edx
 ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ad5:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
 ad8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 adb:	8b 40 04             	mov    0x4(%eax),%eax
 ade:	c1 e0 03             	shl    $0x3,%eax
 ae1:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
 ae4:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ae7:	8b 55 ec             	mov    -0x14(%ebp),%edx
 aea:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
 aed:	8b 45 f0             	mov    -0x10(%ebp),%eax
 af0:	a3 54 13 00 00       	mov    %eax,0x1354
      return (void*)(p + 1);
 af5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 af8:	83 c0 08             	add    $0x8,%eax
 afb:	eb 38                	jmp    b35 <malloc+0xde>
    }
    if(p == freep)
 afd:	a1 54 13 00 00       	mov    0x1354,%eax
 b02:	39 45 f4             	cmp    %eax,-0xc(%ebp)
 b05:	75 1b                	jne    b22 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
 b07:	8b 45 ec             	mov    -0x14(%ebp),%eax
 b0a:	89 04 24             	mov    %eax,(%esp)
 b0d:	e8 ed fe ff ff       	call   9ff <morecore>
 b12:	89 45 f4             	mov    %eax,-0xc(%ebp)
 b15:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 b19:	75 07                	jne    b22 <malloc+0xcb>
        return 0;
 b1b:	b8 00 00 00 00       	mov    $0x0,%eax
 b20:	eb 13                	jmp    b35 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
 b22:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b25:	89 45 f0             	mov    %eax,-0x10(%ebp)
 b28:	8b 45 f4             	mov    -0xc(%ebp),%eax
 b2b:	8b 00                	mov    (%eax),%eax
 b2d:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
 b30:	e9 70 ff ff ff       	jmp    aa5 <malloc+0x4e>
}
 b35:	c9                   	leave  
 b36:	c3                   	ret    

00000b37 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
 b37:	55                   	push   %ebp
 b38:	89 e5                	mov    %esp,%ebp
 b3a:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
 b3d:	8b 55 08             	mov    0x8(%ebp),%edx
 b40:	8b 45 0c             	mov    0xc(%ebp),%eax
 b43:	8b 4d 08             	mov    0x8(%ebp),%ecx
 b46:	f0 87 02             	lock xchg %eax,(%edx)
 b49:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
 b4c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
 b4f:	c9                   	leave  
 b50:	c3                   	ret    

00000b51 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
 b51:	55                   	push   %ebp
 b52:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
 b54:	8b 45 08             	mov    0x8(%ebp),%eax
 b57:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
 b5d:	5d                   	pop    %ebp
 b5e:	c3                   	ret    

00000b5f <lock_acquire>:
void lock_acquire(lock_t *lock){
 b5f:	55                   	push   %ebp
 b60:	89 e5                	mov    %esp,%ebp
 b62:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
 b65:	90                   	nop
 b66:	8b 45 08             	mov    0x8(%ebp),%eax
 b69:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
 b70:	00 
 b71:	89 04 24             	mov    %eax,(%esp)
 b74:	e8 be ff ff ff       	call   b37 <xchg>
 b79:	85 c0                	test   %eax,%eax
 b7b:	75 e9                	jne    b66 <lock_acquire+0x7>
}
 b7d:	c9                   	leave  
 b7e:	c3                   	ret    

00000b7f <lock_release>:
void lock_release(lock_t *lock){
 b7f:	55                   	push   %ebp
 b80:	89 e5                	mov    %esp,%ebp
 b82:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
 b85:	8b 45 08             	mov    0x8(%ebp),%eax
 b88:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
 b8f:	00 
 b90:	89 04 24             	mov    %eax,(%esp)
 b93:	e8 9f ff ff ff       	call   b37 <xchg>
}
 b98:	c9                   	leave  
 b99:	c3                   	ret    

00000b9a <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
 b9a:	55                   	push   %ebp
 b9b:	89 e5                	mov    %esp,%ebp
 b9d:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
 ba0:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
 ba7:	e8 ab fe ff ff       	call   a57 <malloc>
 bac:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
 baf:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb2:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
 bb5:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bb8:	25 ff 0f 00 00       	and    $0xfff,%eax
 bbd:	85 c0                	test   %eax,%eax
 bbf:	74 14                	je     bd5 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
 bc1:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bc4:	25 ff 0f 00 00       	and    $0xfff,%eax
 bc9:	89 c2                	mov    %eax,%edx
 bcb:	b8 00 10 00 00       	mov    $0x1000,%eax
 bd0:	29 d0                	sub    %edx,%eax
 bd2:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
 bd5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
 bd9:	75 1b                	jne    bf6 <thread_create+0x5c>

        printf(1,"malloc fail \n");
 bdb:	c7 44 24 04 e3 0e 00 	movl   $0xee3,0x4(%esp)
 be2:	00 
 be3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 bea:	e8 7c fb ff ff       	call   76b <printf>
        return 0;
 bef:	b8 00 00 00 00       	mov    $0x0,%eax
 bf4:	eb 6f                	jmp    c65 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
 bf6:	8b 4d 0c             	mov    0xc(%ebp),%ecx
 bf9:	8b 55 08             	mov    0x8(%ebp),%edx
 bfc:	8b 45 f4             	mov    -0xc(%ebp),%eax
 bff:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
 c03:	89 54 24 08          	mov    %edx,0x8(%esp)
 c07:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
 c0e:	00 
 c0f:	89 04 24             	mov    %eax,(%esp)
 c12:	e8 4c fa ff ff       	call   663 <clone>
 c17:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
 c1a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c1e:	79 1b                	jns    c3b <thread_create+0xa1>
        printf(1,"clone fails\n");
 c20:	c7 44 24 04 f1 0e 00 	movl   $0xef1,0x4(%esp)
 c27:	00 
 c28:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c2f:	e8 37 fb ff ff       	call   76b <printf>
        return 0;
 c34:	b8 00 00 00 00       	mov    $0x0,%eax
 c39:	eb 2a                	jmp    c65 <thread_create+0xcb>
    }
    if(tid > 0){
 c3b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c3f:	7e 05                	jle    c46 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
 c41:	8b 45 f0             	mov    -0x10(%ebp),%eax
 c44:	eb 1f                	jmp    c65 <thread_create+0xcb>
    }
    if(tid == 0){
 c46:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
 c4a:	75 14                	jne    c60 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
 c4c:	c7 44 24 04 fe 0e 00 	movl   $0xefe,0x4(%esp)
 c53:	00 
 c54:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
 c5b:	e8 0b fb ff ff       	call   76b <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
 c60:	b8 00 00 00 00       	mov    $0x0,%eax
}
 c65:	c9                   	leave  
 c66:	c3                   	ret    

00000c67 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
 c67:	55                   	push   %ebp
 c68:	89 e5                	mov    %esp,%ebp
    q->size = 0;
 c6a:	8b 45 08             	mov    0x8(%ebp),%eax
 c6d:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
 c73:	8b 45 08             	mov    0x8(%ebp),%eax
 c76:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
 c7d:	8b 45 08             	mov    0x8(%ebp),%eax
 c80:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
 c87:	5d                   	pop    %ebp
 c88:	c3                   	ret    

00000c89 <add_q>:

void add_q(struct queue *q, int v){
 c89:	55                   	push   %ebp
 c8a:	89 e5                	mov    %esp,%ebp
 c8c:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
 c8f:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
 c96:	e8 bc fd ff ff       	call   a57 <malloc>
 c9b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
 c9e:	8b 45 f4             	mov    -0xc(%ebp),%eax
 ca1:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
 ca8:	8b 45 f4             	mov    -0xc(%ebp),%eax
 cab:	8b 55 0c             	mov    0xc(%ebp),%edx
 cae:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
 cb0:	8b 45 08             	mov    0x8(%ebp),%eax
 cb3:	8b 40 04             	mov    0x4(%eax),%eax
 cb6:	85 c0                	test   %eax,%eax
 cb8:	75 0b                	jne    cc5 <add_q+0x3c>
        q->head = n;
 cba:	8b 45 08             	mov    0x8(%ebp),%eax
 cbd:	8b 55 f4             	mov    -0xc(%ebp),%edx
 cc0:	89 50 04             	mov    %edx,0x4(%eax)
 cc3:	eb 0c                	jmp    cd1 <add_q+0x48>
    }else{
        q->tail->next = n;
 cc5:	8b 45 08             	mov    0x8(%ebp),%eax
 cc8:	8b 40 08             	mov    0x8(%eax),%eax
 ccb:	8b 55 f4             	mov    -0xc(%ebp),%edx
 cce:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
 cd1:	8b 45 08             	mov    0x8(%ebp),%eax
 cd4:	8b 55 f4             	mov    -0xc(%ebp),%edx
 cd7:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
 cda:	8b 45 08             	mov    0x8(%ebp),%eax
 cdd:	8b 00                	mov    (%eax),%eax
 cdf:	8d 50 01             	lea    0x1(%eax),%edx
 ce2:	8b 45 08             	mov    0x8(%ebp),%eax
 ce5:	89 10                	mov    %edx,(%eax)
}
 ce7:	c9                   	leave  
 ce8:	c3                   	ret    

00000ce9 <empty_q>:

int empty_q(struct queue *q){
 ce9:	55                   	push   %ebp
 cea:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
 cec:	8b 45 08             	mov    0x8(%ebp),%eax
 cef:	8b 00                	mov    (%eax),%eax
 cf1:	85 c0                	test   %eax,%eax
 cf3:	75 07                	jne    cfc <empty_q+0x13>
        return 1;
 cf5:	b8 01 00 00 00       	mov    $0x1,%eax
 cfa:	eb 05                	jmp    d01 <empty_q+0x18>
    else
        return 0;
 cfc:	b8 00 00 00 00       	mov    $0x0,%eax
} 
 d01:	5d                   	pop    %ebp
 d02:	c3                   	ret    

00000d03 <pop_q>:
int pop_q(struct queue *q){
 d03:	55                   	push   %ebp
 d04:	89 e5                	mov    %esp,%ebp
 d06:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
 d09:	8b 45 08             	mov    0x8(%ebp),%eax
 d0c:	89 04 24             	mov    %eax,(%esp)
 d0f:	e8 d5 ff ff ff       	call   ce9 <empty_q>
 d14:	85 c0                	test   %eax,%eax
 d16:	75 5d                	jne    d75 <pop_q+0x72>
       val = q->head->value; 
 d18:	8b 45 08             	mov    0x8(%ebp),%eax
 d1b:	8b 40 04             	mov    0x4(%eax),%eax
 d1e:	8b 00                	mov    (%eax),%eax
 d20:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
 d23:	8b 45 08             	mov    0x8(%ebp),%eax
 d26:	8b 40 04             	mov    0x4(%eax),%eax
 d29:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
 d2c:	8b 45 08             	mov    0x8(%ebp),%eax
 d2f:	8b 40 04             	mov    0x4(%eax),%eax
 d32:	8b 50 04             	mov    0x4(%eax),%edx
 d35:	8b 45 08             	mov    0x8(%ebp),%eax
 d38:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
 d3b:	8b 45 f0             	mov    -0x10(%ebp),%eax
 d3e:	89 04 24             	mov    %eax,(%esp)
 d41:	e8 d8 fb ff ff       	call   91e <free>
       q->size--;
 d46:	8b 45 08             	mov    0x8(%ebp),%eax
 d49:	8b 00                	mov    (%eax),%eax
 d4b:	8d 50 ff             	lea    -0x1(%eax),%edx
 d4e:	8b 45 08             	mov    0x8(%ebp),%eax
 d51:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
 d53:	8b 45 08             	mov    0x8(%ebp),%eax
 d56:	8b 00                	mov    (%eax),%eax
 d58:	85 c0                	test   %eax,%eax
 d5a:	75 14                	jne    d70 <pop_q+0x6d>
            q->head = 0;
 d5c:	8b 45 08             	mov    0x8(%ebp),%eax
 d5f:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
 d66:	8b 45 08             	mov    0x8(%ebp),%eax
 d69:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
 d70:	8b 45 f4             	mov    -0xc(%ebp),%eax
 d73:	eb 05                	jmp    d7a <pop_q+0x77>
    }
    return -1;
 d75:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
 d7a:	c9                   	leave  
 d7b:	c3                   	ret    

00000d7c <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
 d7c:	55                   	push   %ebp
 d7d:	89 e5                	mov    %esp,%ebp
 d7f:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
 d82:	8b 45 08             	mov    0x8(%ebp),%eax
 d85:	8b 55 0c             	mov    0xc(%ebp),%edx
 d88:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
 d8b:	8b 45 08             	mov    0x8(%ebp),%eax
 d8e:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
 d95:	8b 45 08             	mov    0x8(%ebp),%eax
 d98:	89 04 24             	mov    %eax,(%esp)
 d9b:	e8 b1 fd ff ff       	call   b51 <lock_init>
}
 da0:	c9                   	leave  
 da1:	c3                   	ret    

00000da2 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
 da2:	55                   	push   %ebp
 da3:	89 e5                	mov    %esp,%ebp
 da5:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
 da8:	8b 45 08             	mov    0x8(%ebp),%eax
 dab:	89 04 24             	mov    %eax,(%esp)
 dae:	e8 ac fd ff ff       	call   b5f <lock_acquire>
	if(s->count  == 0){
 db3:	8b 45 08             	mov    0x8(%ebp),%eax
 db6:	8b 40 04             	mov    0x4(%eax),%eax
 db9:	85 c0                	test   %eax,%eax
 dbb:	75 2f                	jne    dec <sem_aquire+0x4a>
		//add proc to waiters list
		int tid = getpid();
 dbd:	e8 81 f8 ff ff       	call   643 <getpid>
 dc2:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
 dc5:	8b 45 08             	mov    0x8(%ebp),%eax
 dc8:	8d 50 0c             	lea    0xc(%eax),%edx
 dcb:	8b 45 f4             	mov    -0xc(%ebp),%eax
 dce:	89 44 24 04          	mov    %eax,0x4(%esp)
 dd2:	89 14 24             	mov    %edx,(%esp)
 dd5:	e8 af fe ff ff       	call   c89 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
 dda:	8b 45 08             	mov    0x8(%ebp),%eax
 ddd:	89 04 24             	mov    %eax,(%esp)
 de0:	e8 9a fd ff ff       	call   b7f <lock_release>
		tsleep(); 
 de5:	e8 89 f8 ff ff       	call   673 <tsleep>
 dea:	eb 1a                	jmp    e06 <sem_aquire+0x64>
	}
	else{
		s->count--;	
 dec:	8b 45 08             	mov    0x8(%ebp),%eax
 def:	8b 40 04             	mov    0x4(%eax),%eax
 df2:	8d 50 ff             	lea    -0x1(%eax),%edx
 df5:	8b 45 08             	mov    0x8(%ebp),%eax
 df8:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 dfb:	8b 45 08             	mov    0x8(%ebp),%eax
 dfe:	89 04 24             	mov    %eax,(%esp)
 e01:	e8 79 fd ff ff       	call   b7f <lock_release>
	}
}
 e06:	c9                   	leave  
 e07:	c3                   	ret    

00000e08 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
 e08:	55                   	push   %ebp
 e09:	89 e5                	mov    %esp,%ebp
 e0b:	83 ec 28             	sub    $0x28,%esp
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
 e0e:	8b 45 08             	mov    0x8(%ebp),%eax
 e11:	89 04 24             	mov    %eax,(%esp)
 e14:	e8 46 fd ff ff       	call   b5f <lock_acquire>
	if(s->count < s->size){
 e19:	8b 45 08             	mov    0x8(%ebp),%eax
 e1c:	8b 50 04             	mov    0x4(%eax),%edx
 e1f:	8b 45 08             	mov    0x8(%ebp),%eax
 e22:	8b 40 08             	mov    0x8(%eax),%eax
 e25:	39 c2                	cmp    %eax,%edx
 e27:	7d 40                	jge    e69 <sem_signal+0x61>
		int tid;
		tid = pop_q(&s->waiters);
 e29:	8b 45 08             	mov    0x8(%ebp),%eax
 e2c:	83 c0 0c             	add    $0xc,%eax
 e2f:	89 04 24             	mov    %eax,(%esp)
 e32:	e8 cc fe ff ff       	call   d03 <pop_q>
 e37:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if(tid != -1) twakeup(tid);
 e3a:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
 e3e:	74 0d                	je     e4d <sem_signal+0x45>
 e40:	8b 45 f4             	mov    -0xc(%ebp),%eax
 e43:	89 04 24             	mov    %eax,(%esp)
 e46:	e8 30 f8 ff ff       	call   67b <twakeup>
 e4b:	eb 0f                	jmp    e5c <sem_signal+0x54>
		else s->count++;	
 e4d:	8b 45 08             	mov    0x8(%ebp),%eax
 e50:	8b 40 04             	mov    0x4(%eax),%eax
 e53:	8d 50 01             	lea    0x1(%eax),%edx
 e56:	8b 45 08             	mov    0x8(%ebp),%eax
 e59:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
 e5c:	8b 45 08             	mov    0x8(%ebp),%eax
 e5f:	89 04 24             	mov    %eax,(%esp)
 e62:	e8 18 fd ff ff       	call   b7f <lock_release>
 e67:	eb 27                	jmp    e90 <sem_signal+0x88>
	}
	else{
		int tid;
		tid = pop_q(&s->waiters);
 e69:	8b 45 08             	mov    0x8(%ebp),%eax
 e6c:	83 c0 0c             	add    $0xc,%eax
 e6f:	89 04 24             	mov    %eax,(%esp)
 e72:	e8 8c fe ff ff       	call   d03 <pop_q>
 e77:	89 45 f0             	mov    %eax,-0x10(%ebp)
		twakeup(tid);
 e7a:	8b 45 f0             	mov    -0x10(%ebp),%eax
 e7d:	89 04 24             	mov    %eax,(%esp)
 e80:	e8 f6 f7 ff ff       	call   67b <twakeup>
		lock_release(&s->lock);
 e85:	8b 45 08             	mov    0x8(%ebp),%eax
 e88:	89 04 24             	mov    %eax,(%esp)
 e8b:	e8 ef fc ff ff       	call   b7f <lock_release>
	}

 e90:	c9                   	leave  
 e91:	c3                   	ret    
