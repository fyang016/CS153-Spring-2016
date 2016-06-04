
_usertests:     file format elf32-i386


Disassembly of section .text:

00000000 <opentest>:

// simple file system tests

void
opentest(void)
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(stdout, "open test\n");
       6:	a1 ec 63 00 00       	mov    0x63ec,%eax
       b:	c7 44 24 04 fe 44 00 	movl   $0x44fe,0x4(%esp)
      12:	00 
      13:	89 04 24             	mov    %eax,(%esp)
      16:	e8 a5 3d 00 00       	call   3dc0 <printf>
  fd = open("echo", 0);
      1b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      22:	00 
      23:	c7 04 24 e8 44 00 00 	movl   $0x44e8,(%esp)
      2a:	e8 29 3c 00 00       	call   3c58 <open>
      2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
      32:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      36:	79 1a                	jns    52 <opentest+0x52>
    printf(stdout, "open echo failed!\n");
      38:	a1 ec 63 00 00       	mov    0x63ec,%eax
      3d:	c7 44 24 04 09 45 00 	movl   $0x4509,0x4(%esp)
      44:	00 
      45:	89 04 24             	mov    %eax,(%esp)
      48:	e8 73 3d 00 00       	call   3dc0 <printf>
    exit();
      4d:	e8 c6 3b 00 00       	call   3c18 <exit>
  }
  close(fd);
      52:	8b 45 f4             	mov    -0xc(%ebp),%eax
      55:	89 04 24             	mov    %eax,(%esp)
      58:	e8 e3 3b 00 00       	call   3c40 <close>
  fd = open("doesnotexist", 0);
      5d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      64:	00 
      65:	c7 04 24 1c 45 00 00 	movl   $0x451c,(%esp)
      6c:	e8 e7 3b 00 00       	call   3c58 <open>
      71:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
      74:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      78:	78 1a                	js     94 <opentest+0x94>
    printf(stdout, "open doesnotexist succeeded!\n");
      7a:	a1 ec 63 00 00       	mov    0x63ec,%eax
      7f:	c7 44 24 04 29 45 00 	movl   $0x4529,0x4(%esp)
      86:	00 
      87:	89 04 24             	mov    %eax,(%esp)
      8a:	e8 31 3d 00 00       	call   3dc0 <printf>
    exit();
      8f:	e8 84 3b 00 00       	call   3c18 <exit>
  }
  printf(stdout, "open test ok\n");
      94:	a1 ec 63 00 00       	mov    0x63ec,%eax
      99:	c7 44 24 04 47 45 00 	movl   $0x4547,0x4(%esp)
      a0:	00 
      a1:	89 04 24             	mov    %eax,(%esp)
      a4:	e8 17 3d 00 00       	call   3dc0 <printf>
}
      a9:	c9                   	leave  
      aa:	c3                   	ret    

000000ab <writetest>:

void
writetest(void)
{
      ab:	55                   	push   %ebp
      ac:	89 e5                	mov    %esp,%ebp
      ae:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
      b1:	a1 ec 63 00 00       	mov    0x63ec,%eax
      b6:	c7 44 24 04 55 45 00 	movl   $0x4555,0x4(%esp)
      bd:	00 
      be:	89 04 24             	mov    %eax,(%esp)
      c1:	e8 fa 3c 00 00       	call   3dc0 <printf>
  fd = open("small", O_CREATE|O_RDWR);
      c6:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
      cd:	00 
      ce:	c7 04 24 66 45 00 00 	movl   $0x4566,(%esp)
      d5:	e8 7e 3b 00 00       	call   3c58 <open>
      da:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
      dd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
      e1:	78 21                	js     104 <writetest+0x59>
    printf(stdout, "creat small succeeded; ok\n");
      e3:	a1 ec 63 00 00       	mov    0x63ec,%eax
      e8:	c7 44 24 04 6c 45 00 	movl   $0x456c,0x4(%esp)
      ef:	00 
      f0:	89 04 24             	mov    %eax,(%esp)
      f3:	e8 c8 3c 00 00       	call   3dc0 <printf>
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
      f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
      ff:	e9 a0 00 00 00       	jmp    1a4 <writetest+0xf9>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     104:	a1 ec 63 00 00       	mov    0x63ec,%eax
     109:	c7 44 24 04 87 45 00 	movl   $0x4587,0x4(%esp)
     110:	00 
     111:	89 04 24             	mov    %eax,(%esp)
     114:	e8 a7 3c 00 00       	call   3dc0 <printf>
    exit();
     119:	e8 fa 3a 00 00       	call   3c18 <exit>
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     11e:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     125:	00 
     126:	c7 44 24 04 a3 45 00 	movl   $0x45a3,0x4(%esp)
     12d:	00 
     12e:	8b 45 f0             	mov    -0x10(%ebp),%eax
     131:	89 04 24             	mov    %eax,(%esp)
     134:	e8 ff 3a 00 00       	call   3c38 <write>
     139:	83 f8 0a             	cmp    $0xa,%eax
     13c:	74 21                	je     15f <writetest+0xb4>
      printf(stdout, "error: write aa %d new file failed\n", i);
     13e:	a1 ec 63 00 00       	mov    0x63ec,%eax
     143:	8b 55 f4             	mov    -0xc(%ebp),%edx
     146:	89 54 24 08          	mov    %edx,0x8(%esp)
     14a:	c7 44 24 04 b0 45 00 	movl   $0x45b0,0x4(%esp)
     151:	00 
     152:	89 04 24             	mov    %eax,(%esp)
     155:	e8 66 3c 00 00       	call   3dc0 <printf>
      exit();
     15a:	e8 b9 3a 00 00       	call   3c18 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     15f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     166:	00 
     167:	c7 44 24 04 d4 45 00 	movl   $0x45d4,0x4(%esp)
     16e:	00 
     16f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     172:	89 04 24             	mov    %eax,(%esp)
     175:	e8 be 3a 00 00       	call   3c38 <write>
     17a:	83 f8 0a             	cmp    $0xa,%eax
     17d:	74 21                	je     1a0 <writetest+0xf5>
      printf(stdout, "error: write bb %d new file failed\n", i);
     17f:	a1 ec 63 00 00       	mov    0x63ec,%eax
     184:	8b 55 f4             	mov    -0xc(%ebp),%edx
     187:	89 54 24 08          	mov    %edx,0x8(%esp)
     18b:	c7 44 24 04 e0 45 00 	movl   $0x45e0,0x4(%esp)
     192:	00 
     193:	89 04 24             	mov    %eax,(%esp)
     196:	e8 25 3c 00 00       	call   3dc0 <printf>
      exit();
     19b:	e8 78 3a 00 00       	call   3c18 <exit>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit();
  }
  for(i = 0; i < 100; i++){
     1a0:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     1a4:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     1a8:	0f 8e 70 ff ff ff    	jle    11e <writetest+0x73>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit();
    }
  }
  printf(stdout, "writes ok\n");
     1ae:	a1 ec 63 00 00       	mov    0x63ec,%eax
     1b3:	c7 44 24 04 04 46 00 	movl   $0x4604,0x4(%esp)
     1ba:	00 
     1bb:	89 04 24             	mov    %eax,(%esp)
     1be:	e8 fd 3b 00 00       	call   3dc0 <printf>
  close(fd);
     1c3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     1c6:	89 04 24             	mov    %eax,(%esp)
     1c9:	e8 72 3a 00 00       	call   3c40 <close>
  fd = open("small", O_RDONLY);
     1ce:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     1d5:	00 
     1d6:	c7 04 24 66 45 00 00 	movl   $0x4566,(%esp)
     1dd:	e8 76 3a 00 00       	call   3c58 <open>
     1e2:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     1e5:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     1e9:	78 3e                	js     229 <writetest+0x17e>
    printf(stdout, "open small succeeded ok\n");
     1eb:	a1 ec 63 00 00       	mov    0x63ec,%eax
     1f0:	c7 44 24 04 0f 46 00 	movl   $0x460f,0x4(%esp)
     1f7:	00 
     1f8:	89 04 24             	mov    %eax,(%esp)
     1fb:	e8 c0 3b 00 00       	call   3dc0 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit();
  }
  i = read(fd, buf, 2000);
     200:	c7 44 24 08 d0 07 00 	movl   $0x7d0,0x8(%esp)
     207:	00 
     208:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     20f:	00 
     210:	8b 45 f0             	mov    -0x10(%ebp),%eax
     213:	89 04 24             	mov    %eax,(%esp)
     216:	e8 15 3a 00 00       	call   3c30 <read>
     21b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(i == 2000){
     21e:	81 7d f4 d0 07 00 00 	cmpl   $0x7d0,-0xc(%ebp)
     225:	75 4e                	jne    275 <writetest+0x1ca>
     227:	eb 1a                	jmp    243 <writetest+0x198>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     229:	a1 ec 63 00 00       	mov    0x63ec,%eax
     22e:	c7 44 24 04 28 46 00 	movl   $0x4628,0x4(%esp)
     235:	00 
     236:	89 04 24             	mov    %eax,(%esp)
     239:	e8 82 3b 00 00       	call   3dc0 <printf>
    exit();
     23e:	e8 d5 39 00 00       	call   3c18 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
     243:	a1 ec 63 00 00       	mov    0x63ec,%eax
     248:	c7 44 24 04 43 46 00 	movl   $0x4643,0x4(%esp)
     24f:	00 
     250:	89 04 24             	mov    %eax,(%esp)
     253:	e8 68 3b 00 00       	call   3dc0 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit();
  }
  close(fd);
     258:	8b 45 f0             	mov    -0x10(%ebp),%eax
     25b:	89 04 24             	mov    %eax,(%esp)
     25e:	e8 dd 39 00 00       	call   3c40 <close>

  if(unlink("small") < 0){
     263:	c7 04 24 66 45 00 00 	movl   $0x4566,(%esp)
     26a:	e8 f9 39 00 00       	call   3c68 <unlink>
     26f:	85 c0                	test   %eax,%eax
     271:	79 36                	jns    2a9 <writetest+0x1fe>
     273:	eb 1a                	jmp    28f <writetest+0x1e4>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     275:	a1 ec 63 00 00       	mov    0x63ec,%eax
     27a:	c7 44 24 04 56 46 00 	movl   $0x4656,0x4(%esp)
     281:	00 
     282:	89 04 24             	mov    %eax,(%esp)
     285:	e8 36 3b 00 00       	call   3dc0 <printf>
    exit();
     28a:	e8 89 39 00 00       	call   3c18 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     28f:	a1 ec 63 00 00       	mov    0x63ec,%eax
     294:	c7 44 24 04 63 46 00 	movl   $0x4663,0x4(%esp)
     29b:	00 
     29c:	89 04 24             	mov    %eax,(%esp)
     29f:	e8 1c 3b 00 00       	call   3dc0 <printf>
    exit();
     2a4:	e8 6f 39 00 00       	call   3c18 <exit>
  }
  printf(stdout, "small file test ok\n");
     2a9:	a1 ec 63 00 00       	mov    0x63ec,%eax
     2ae:	c7 44 24 04 78 46 00 	movl   $0x4678,0x4(%esp)
     2b5:	00 
     2b6:	89 04 24             	mov    %eax,(%esp)
     2b9:	e8 02 3b 00 00       	call   3dc0 <printf>
}
     2be:	c9                   	leave  
     2bf:	c3                   	ret    

000002c0 <writetest1>:

void
writetest1(void)
{
     2c0:	55                   	push   %ebp
     2c1:	89 e5                	mov    %esp,%ebp
     2c3:	83 ec 28             	sub    $0x28,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
     2c6:	a1 ec 63 00 00       	mov    0x63ec,%eax
     2cb:	c7 44 24 04 8c 46 00 	movl   $0x468c,0x4(%esp)
     2d2:	00 
     2d3:	89 04 24             	mov    %eax,(%esp)
     2d6:	e8 e5 3a 00 00       	call   3dc0 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     2db:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     2e2:	00 
     2e3:	c7 04 24 9c 46 00 00 	movl   $0x469c,(%esp)
     2ea:	e8 69 39 00 00       	call   3c58 <open>
     2ef:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     2f2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     2f6:	79 1a                	jns    312 <writetest1+0x52>
    printf(stdout, "error: creat big failed!\n");
     2f8:	a1 ec 63 00 00       	mov    0x63ec,%eax
     2fd:	c7 44 24 04 a0 46 00 	movl   $0x46a0,0x4(%esp)
     304:	00 
     305:	89 04 24             	mov    %eax,(%esp)
     308:	e8 b3 3a 00 00       	call   3dc0 <printf>
    exit();
     30d:	e8 06 39 00 00       	call   3c18 <exit>
  }

  for(i = 0; i < MAXFILE; i++){
     312:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     319:	eb 51                	jmp    36c <writetest1+0xac>
    ((int*)buf)[0] = i;
     31b:	b8 e0 8b 00 00       	mov    $0x8be0,%eax
     320:	8b 55 f4             	mov    -0xc(%ebp),%edx
     323:	89 10                	mov    %edx,(%eax)
    if(write(fd, buf, 512) != 512){
     325:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     32c:	00 
     32d:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     334:	00 
     335:	8b 45 ec             	mov    -0x14(%ebp),%eax
     338:	89 04 24             	mov    %eax,(%esp)
     33b:	e8 f8 38 00 00       	call   3c38 <write>
     340:	3d 00 02 00 00       	cmp    $0x200,%eax
     345:	74 21                	je     368 <writetest1+0xa8>
      printf(stdout, "error: write big file failed\n", i);
     347:	a1 ec 63 00 00       	mov    0x63ec,%eax
     34c:	8b 55 f4             	mov    -0xc(%ebp),%edx
     34f:	89 54 24 08          	mov    %edx,0x8(%esp)
     353:	c7 44 24 04 ba 46 00 	movl   $0x46ba,0x4(%esp)
     35a:	00 
     35b:	89 04 24             	mov    %eax,(%esp)
     35e:	e8 5d 3a 00 00       	call   3dc0 <printf>
      exit();
     363:	e8 b0 38 00 00       	call   3c18 <exit>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit();
  }

  for(i = 0; i < MAXFILE; i++){
     368:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     36c:	8b 45 f4             	mov    -0xc(%ebp),%eax
     36f:	3d 8b 00 00 00       	cmp    $0x8b,%eax
     374:	76 a5                	jbe    31b <writetest1+0x5b>
      printf(stdout, "error: write big file failed\n", i);
      exit();
    }
  }

  close(fd);
     376:	8b 45 ec             	mov    -0x14(%ebp),%eax
     379:	89 04 24             	mov    %eax,(%esp)
     37c:	e8 bf 38 00 00       	call   3c40 <close>

  fd = open("big", O_RDONLY);
     381:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     388:	00 
     389:	c7 04 24 9c 46 00 00 	movl   $0x469c,(%esp)
     390:	e8 c3 38 00 00       	call   3c58 <open>
     395:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
     398:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     39c:	79 1a                	jns    3b8 <writetest1+0xf8>
    printf(stdout, "error: open big failed!\n");
     39e:	a1 ec 63 00 00       	mov    0x63ec,%eax
     3a3:	c7 44 24 04 d8 46 00 	movl   $0x46d8,0x4(%esp)
     3aa:	00 
     3ab:	89 04 24             	mov    %eax,(%esp)
     3ae:	e8 0d 3a 00 00       	call   3dc0 <printf>
    exit();
     3b3:	e8 60 38 00 00       	call   3c18 <exit>
  }

  n = 0;
     3b8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(;;){
    i = read(fd, buf, 512);
     3bf:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     3c6:	00 
     3c7:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     3ce:	00 
     3cf:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3d2:	89 04 24             	mov    %eax,(%esp)
     3d5:	e8 56 38 00 00       	call   3c30 <read>
     3da:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(i == 0){
     3dd:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     3e1:	75 4c                	jne    42f <writetest1+0x16f>
      if(n == MAXFILE - 1){
     3e3:	81 7d f0 8b 00 00 00 	cmpl   $0x8b,-0x10(%ebp)
     3ea:	75 21                	jne    40d <writetest1+0x14d>
        printf(stdout, "read only %d blocks from big", n);
     3ec:	a1 ec 63 00 00       	mov    0x63ec,%eax
     3f1:	8b 55 f0             	mov    -0x10(%ebp),%edx
     3f4:	89 54 24 08          	mov    %edx,0x8(%esp)
     3f8:	c7 44 24 04 f1 46 00 	movl   $0x46f1,0x4(%esp)
     3ff:	00 
     400:	89 04 24             	mov    %eax,(%esp)
     403:	e8 b8 39 00 00       	call   3dc0 <printf>
        exit();
     408:	e8 0b 38 00 00       	call   3c18 <exit>
      }
      break;
     40d:	90                   	nop
             n, ((int*)buf)[0]);
      exit();
    }
    n++;
  }
  close(fd);
     40e:	8b 45 ec             	mov    -0x14(%ebp),%eax
     411:	89 04 24             	mov    %eax,(%esp)
     414:	e8 27 38 00 00       	call   3c40 <close>
  if(unlink("big") < 0){
     419:	c7 04 24 9c 46 00 00 	movl   $0x469c,(%esp)
     420:	e8 43 38 00 00       	call   3c68 <unlink>
     425:	85 c0                	test   %eax,%eax
     427:	0f 89 87 00 00 00    	jns    4b4 <writetest1+0x1f4>
     42d:	eb 6b                	jmp    49a <writetest1+0x1da>
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit();
      }
      break;
    } else if(i != 512){
     42f:	81 7d f4 00 02 00 00 	cmpl   $0x200,-0xc(%ebp)
     436:	74 21                	je     459 <writetest1+0x199>
      printf(stdout, "read failed %d\n", i);
     438:	a1 ec 63 00 00       	mov    0x63ec,%eax
     43d:	8b 55 f4             	mov    -0xc(%ebp),%edx
     440:	89 54 24 08          	mov    %edx,0x8(%esp)
     444:	c7 44 24 04 0e 47 00 	movl   $0x470e,0x4(%esp)
     44b:	00 
     44c:	89 04 24             	mov    %eax,(%esp)
     44f:	e8 6c 39 00 00       	call   3dc0 <printf>
      exit();
     454:	e8 bf 37 00 00       	call   3c18 <exit>
    }
    if(((int*)buf)[0] != n){
     459:	b8 e0 8b 00 00       	mov    $0x8be0,%eax
     45e:	8b 00                	mov    (%eax),%eax
     460:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     463:	74 2c                	je     491 <writetest1+0x1d1>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
     465:	b8 e0 8b 00 00       	mov    $0x8be0,%eax
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit();
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     46a:	8b 10                	mov    (%eax),%edx
     46c:	a1 ec 63 00 00       	mov    0x63ec,%eax
     471:	89 54 24 0c          	mov    %edx,0xc(%esp)
     475:	8b 55 f0             	mov    -0x10(%ebp),%edx
     478:	89 54 24 08          	mov    %edx,0x8(%esp)
     47c:	c7 44 24 04 20 47 00 	movl   $0x4720,0x4(%esp)
     483:	00 
     484:	89 04 24             	mov    %eax,(%esp)
     487:	e8 34 39 00 00       	call   3dc0 <printf>
             n, ((int*)buf)[0]);
      exit();
     48c:	e8 87 37 00 00       	call   3c18 <exit>
    }
    n++;
     491:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }
     495:	e9 25 ff ff ff       	jmp    3bf <writetest1+0xff>
  close(fd);
  if(unlink("big") < 0){
    printf(stdout, "unlink big failed\n");
     49a:	a1 ec 63 00 00       	mov    0x63ec,%eax
     49f:	c7 44 24 04 40 47 00 	movl   $0x4740,0x4(%esp)
     4a6:	00 
     4a7:	89 04 24             	mov    %eax,(%esp)
     4aa:	e8 11 39 00 00       	call   3dc0 <printf>
    exit();
     4af:	e8 64 37 00 00       	call   3c18 <exit>
  }
  printf(stdout, "big files ok\n");
     4b4:	a1 ec 63 00 00       	mov    0x63ec,%eax
     4b9:	c7 44 24 04 53 47 00 	movl   $0x4753,0x4(%esp)
     4c0:	00 
     4c1:	89 04 24             	mov    %eax,(%esp)
     4c4:	e8 f7 38 00 00       	call   3dc0 <printf>
}
     4c9:	c9                   	leave  
     4ca:	c3                   	ret    

000004cb <createtest>:

void
createtest(void)
{
     4cb:	55                   	push   %ebp
     4cc:	89 e5                	mov    %esp,%ebp
     4ce:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     4d1:	a1 ec 63 00 00       	mov    0x63ec,%eax
     4d6:	c7 44 24 04 64 47 00 	movl   $0x4764,0x4(%esp)
     4dd:	00 
     4de:	89 04 24             	mov    %eax,(%esp)
     4e1:	e8 da 38 00 00       	call   3dc0 <printf>

  name[0] = 'a';
     4e6:	c6 05 e0 ab 00 00 61 	movb   $0x61,0xabe0
  name[2] = '\0';
     4ed:	c6 05 e2 ab 00 00 00 	movb   $0x0,0xabe2
  for(i = 0; i < 52; i++){
     4f4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     4fb:	eb 31                	jmp    52e <createtest+0x63>
    name[1] = '0' + i;
     4fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     500:	83 c0 30             	add    $0x30,%eax
     503:	a2 e1 ab 00 00       	mov    %al,0xabe1
    fd = open(name, O_CREATE|O_RDWR);
     508:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     50f:	00 
     510:	c7 04 24 e0 ab 00 00 	movl   $0xabe0,(%esp)
     517:	e8 3c 37 00 00       	call   3c58 <open>
     51c:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(fd);
     51f:	8b 45 f0             	mov    -0x10(%ebp),%eax
     522:	89 04 24             	mov    %eax,(%esp)
     525:	e8 16 37 00 00       	call   3c40 <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     52a:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     52e:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     532:	7e c9                	jle    4fd <createtest+0x32>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     534:	c6 05 e0 ab 00 00 61 	movb   $0x61,0xabe0
  name[2] = '\0';
     53b:	c6 05 e2 ab 00 00 00 	movb   $0x0,0xabe2
  for(i = 0; i < 52; i++){
     542:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     549:	eb 1b                	jmp    566 <createtest+0x9b>
    name[1] = '0' + i;
     54b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     54e:	83 c0 30             	add    $0x30,%eax
     551:	a2 e1 ab 00 00       	mov    %al,0xabe1
    unlink(name);
     556:	c7 04 24 e0 ab 00 00 	movl   $0xabe0,(%esp)
     55d:	e8 06 37 00 00       	call   3c68 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     562:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     566:	83 7d f4 33          	cmpl   $0x33,-0xc(%ebp)
     56a:	7e df                	jle    54b <createtest+0x80>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     56c:	a1 ec 63 00 00       	mov    0x63ec,%eax
     571:	c7 44 24 04 8c 47 00 	movl   $0x478c,0x4(%esp)
     578:	00 
     579:	89 04 24             	mov    %eax,(%esp)
     57c:	e8 3f 38 00 00       	call   3dc0 <printf>
}
     581:	c9                   	leave  
     582:	c3                   	ret    

00000583 <dirtest>:

void dirtest(void)
{
     583:	55                   	push   %ebp
     584:	89 e5                	mov    %esp,%ebp
     586:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "mkdir test\n");
     589:	a1 ec 63 00 00       	mov    0x63ec,%eax
     58e:	c7 44 24 04 b2 47 00 	movl   $0x47b2,0x4(%esp)
     595:	00 
     596:	89 04 24             	mov    %eax,(%esp)
     599:	e8 22 38 00 00       	call   3dc0 <printf>

  if(mkdir("dir0") < 0){
     59e:	c7 04 24 be 47 00 00 	movl   $0x47be,(%esp)
     5a5:	e8 d6 36 00 00       	call   3c80 <mkdir>
     5aa:	85 c0                	test   %eax,%eax
     5ac:	79 1a                	jns    5c8 <dirtest+0x45>
    printf(stdout, "mkdir failed\n");
     5ae:	a1 ec 63 00 00       	mov    0x63ec,%eax
     5b3:	c7 44 24 04 c3 47 00 	movl   $0x47c3,0x4(%esp)
     5ba:	00 
     5bb:	89 04 24             	mov    %eax,(%esp)
     5be:	e8 fd 37 00 00       	call   3dc0 <printf>
    exit();
     5c3:	e8 50 36 00 00       	call   3c18 <exit>
  }

  if(chdir("dir0") < 0){
     5c8:	c7 04 24 be 47 00 00 	movl   $0x47be,(%esp)
     5cf:	e8 b4 36 00 00       	call   3c88 <chdir>
     5d4:	85 c0                	test   %eax,%eax
     5d6:	79 1a                	jns    5f2 <dirtest+0x6f>
    printf(stdout, "chdir dir0 failed\n");
     5d8:	a1 ec 63 00 00       	mov    0x63ec,%eax
     5dd:	c7 44 24 04 d1 47 00 	movl   $0x47d1,0x4(%esp)
     5e4:	00 
     5e5:	89 04 24             	mov    %eax,(%esp)
     5e8:	e8 d3 37 00 00       	call   3dc0 <printf>
    exit();
     5ed:	e8 26 36 00 00       	call   3c18 <exit>
  }

  if(chdir("..") < 0){
     5f2:	c7 04 24 e4 47 00 00 	movl   $0x47e4,(%esp)
     5f9:	e8 8a 36 00 00       	call   3c88 <chdir>
     5fe:	85 c0                	test   %eax,%eax
     600:	79 1a                	jns    61c <dirtest+0x99>
    printf(stdout, "chdir .. failed\n");
     602:	a1 ec 63 00 00       	mov    0x63ec,%eax
     607:	c7 44 24 04 e7 47 00 	movl   $0x47e7,0x4(%esp)
     60e:	00 
     60f:	89 04 24             	mov    %eax,(%esp)
     612:	e8 a9 37 00 00       	call   3dc0 <printf>
    exit();
     617:	e8 fc 35 00 00       	call   3c18 <exit>
  }

  if(unlink("dir0") < 0){
     61c:	c7 04 24 be 47 00 00 	movl   $0x47be,(%esp)
     623:	e8 40 36 00 00       	call   3c68 <unlink>
     628:	85 c0                	test   %eax,%eax
     62a:	79 1a                	jns    646 <dirtest+0xc3>
    printf(stdout, "unlink dir0 failed\n");
     62c:	a1 ec 63 00 00       	mov    0x63ec,%eax
     631:	c7 44 24 04 f8 47 00 	movl   $0x47f8,0x4(%esp)
     638:	00 
     639:	89 04 24             	mov    %eax,(%esp)
     63c:	e8 7f 37 00 00       	call   3dc0 <printf>
    exit();
     641:	e8 d2 35 00 00       	call   3c18 <exit>
  }
  printf(stdout, "mkdir test\n");
     646:	a1 ec 63 00 00       	mov    0x63ec,%eax
     64b:	c7 44 24 04 b2 47 00 	movl   $0x47b2,0x4(%esp)
     652:	00 
     653:	89 04 24             	mov    %eax,(%esp)
     656:	e8 65 37 00 00       	call   3dc0 <printf>
}
     65b:	c9                   	leave  
     65c:	c3                   	ret    

0000065d <exectest>:

void
exectest(void)
{
     65d:	55                   	push   %ebp
     65e:	89 e5                	mov    %esp,%ebp
     660:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "exec test\n");
     663:	a1 ec 63 00 00       	mov    0x63ec,%eax
     668:	c7 44 24 04 0c 48 00 	movl   $0x480c,0x4(%esp)
     66f:	00 
     670:	89 04 24             	mov    %eax,(%esp)
     673:	e8 48 37 00 00       	call   3dc0 <printf>
  if(exec("echo", echoargv) < 0){
     678:	c7 44 24 04 d8 63 00 	movl   $0x63d8,0x4(%esp)
     67f:	00 
     680:	c7 04 24 e8 44 00 00 	movl   $0x44e8,(%esp)
     687:	e8 c4 35 00 00       	call   3c50 <exec>
     68c:	85 c0                	test   %eax,%eax
     68e:	79 1a                	jns    6aa <exectest+0x4d>
    printf(stdout, "exec echo failed\n");
     690:	a1 ec 63 00 00       	mov    0x63ec,%eax
     695:	c7 44 24 04 17 48 00 	movl   $0x4817,0x4(%esp)
     69c:	00 
     69d:	89 04 24             	mov    %eax,(%esp)
     6a0:	e8 1b 37 00 00       	call   3dc0 <printf>
    exit();
     6a5:	e8 6e 35 00 00       	call   3c18 <exit>
  }
}
     6aa:	c9                   	leave  
     6ab:	c3                   	ret    

000006ac <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     6ac:	55                   	push   %ebp
     6ad:	89 e5                	mov    %esp,%ebp
     6af:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     6b2:	8d 45 d8             	lea    -0x28(%ebp),%eax
     6b5:	89 04 24             	mov    %eax,(%esp)
     6b8:	e8 6b 35 00 00       	call   3c28 <pipe>
     6bd:	85 c0                	test   %eax,%eax
     6bf:	74 19                	je     6da <pipe1+0x2e>
    printf(1, "pipe() failed\n");
     6c1:	c7 44 24 04 29 48 00 	movl   $0x4829,0x4(%esp)
     6c8:	00 
     6c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6d0:	e8 eb 36 00 00       	call   3dc0 <printf>
    exit();
     6d5:	e8 3e 35 00 00       	call   3c18 <exit>
  }
  pid = fork();
     6da:	e8 31 35 00 00       	call   3c10 <fork>
     6df:	89 45 e0             	mov    %eax,-0x20(%ebp)
  seq = 0;
     6e2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  if(pid == 0){
     6e9:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     6ed:	0f 85 88 00 00 00    	jne    77b <pipe1+0xcf>
    close(fds[0]);
     6f3:	8b 45 d8             	mov    -0x28(%ebp),%eax
     6f6:	89 04 24             	mov    %eax,(%esp)
     6f9:	e8 42 35 00 00       	call   3c40 <close>
    for(n = 0; n < 5; n++){
     6fe:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     705:	eb 69                	jmp    770 <pipe1+0xc4>
      for(i = 0; i < 1033; i++)
     707:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     70e:	eb 18                	jmp    728 <pipe1+0x7c>
        buf[i] = seq++;
     710:	8b 45 f4             	mov    -0xc(%ebp),%eax
     713:	8d 50 01             	lea    0x1(%eax),%edx
     716:	89 55 f4             	mov    %edx,-0xc(%ebp)
     719:	8b 55 f0             	mov    -0x10(%ebp),%edx
     71c:	81 c2 e0 8b 00 00    	add    $0x8be0,%edx
     722:	88 02                	mov    %al,(%edx)
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     724:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     728:	81 7d f0 08 04 00 00 	cmpl   $0x408,-0x10(%ebp)
     72f:	7e df                	jle    710 <pipe1+0x64>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     731:	8b 45 dc             	mov    -0x24(%ebp),%eax
     734:	c7 44 24 08 09 04 00 	movl   $0x409,0x8(%esp)
     73b:	00 
     73c:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     743:	00 
     744:	89 04 24             	mov    %eax,(%esp)
     747:	e8 ec 34 00 00       	call   3c38 <write>
     74c:	3d 09 04 00 00       	cmp    $0x409,%eax
     751:	74 19                	je     76c <pipe1+0xc0>
        printf(1, "pipe1 oops 1\n");
     753:	c7 44 24 04 38 48 00 	movl   $0x4838,0x4(%esp)
     75a:	00 
     75b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     762:	e8 59 36 00 00       	call   3dc0 <printf>
        exit();
     767:	e8 ac 34 00 00       	call   3c18 <exit>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     76c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
     770:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
     774:	7e 91                	jle    707 <pipe1+0x5b>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit();
      }
    }
    exit();
     776:	e8 9d 34 00 00       	call   3c18 <exit>
  } else if(pid > 0){
     77b:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     77f:	0f 8e f9 00 00 00    	jle    87e <pipe1+0x1d2>
    close(fds[1]);
     785:	8b 45 dc             	mov    -0x24(%ebp),%eax
     788:	89 04 24             	mov    %eax,(%esp)
     78b:	e8 b0 34 00 00       	call   3c40 <close>
    total = 0;
     790:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    cc = 1;
     797:	c7 45 e8 01 00 00 00 	movl   $0x1,-0x18(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     79e:	eb 68                	jmp    808 <pipe1+0x15c>
      for(i = 0; i < n; i++){
     7a0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     7a7:	eb 3d                	jmp    7e6 <pipe1+0x13a>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     7a9:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7ac:	05 e0 8b 00 00       	add    $0x8be0,%eax
     7b1:	0f b6 00             	movzbl (%eax),%eax
     7b4:	0f be c8             	movsbl %al,%ecx
     7b7:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7ba:	8d 50 01             	lea    0x1(%eax),%edx
     7bd:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7c0:	31 c8                	xor    %ecx,%eax
     7c2:	0f b6 c0             	movzbl %al,%eax
     7c5:	85 c0                	test   %eax,%eax
     7c7:	74 19                	je     7e2 <pipe1+0x136>
          printf(1, "pipe1 oops 2\n");
     7c9:	c7 44 24 04 46 48 00 	movl   $0x4846,0x4(%esp)
     7d0:	00 
     7d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     7d8:	e8 e3 35 00 00       	call   3dc0 <printf>
     7dd:	e9 b5 00 00 00       	jmp    897 <pipe1+0x1eb>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     7e2:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     7e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     7e9:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     7ec:	7c bb                	jl     7a9 <pipe1+0xfd>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     7ee:	8b 45 ec             	mov    -0x14(%ebp),%eax
     7f1:	01 45 e4             	add    %eax,-0x1c(%ebp)
      cc = cc * 2;
     7f4:	d1 65 e8             	shll   -0x18(%ebp)
      if(cc > sizeof(buf))
     7f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
     7fa:	3d 00 20 00 00       	cmp    $0x2000,%eax
     7ff:	76 07                	jbe    808 <pipe1+0x15c>
        cc = sizeof(buf);
     801:	c7 45 e8 00 20 00 00 	movl   $0x2000,-0x18(%ebp)
    exit();
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     808:	8b 45 d8             	mov    -0x28(%ebp),%eax
     80b:	8b 55 e8             	mov    -0x18(%ebp),%edx
     80e:	89 54 24 08          	mov    %edx,0x8(%esp)
     812:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     819:	00 
     81a:	89 04 24             	mov    %eax,(%esp)
     81d:	e8 0e 34 00 00       	call   3c30 <read>
     822:	89 45 ec             	mov    %eax,-0x14(%ebp)
     825:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     829:	0f 8f 71 ff ff ff    	jg     7a0 <pipe1+0xf4>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     82f:	81 7d e4 2d 14 00 00 	cmpl   $0x142d,-0x1c(%ebp)
     836:	74 20                	je     858 <pipe1+0x1ac>
      printf(1, "pipe1 oops 3 total %d\n", total);
     838:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     83b:	89 44 24 08          	mov    %eax,0x8(%esp)
     83f:	c7 44 24 04 54 48 00 	movl   $0x4854,0x4(%esp)
     846:	00 
     847:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     84e:	e8 6d 35 00 00       	call   3dc0 <printf>
      exit();
     853:	e8 c0 33 00 00       	call   3c18 <exit>
    }
    close(fds[0]);
     858:	8b 45 d8             	mov    -0x28(%ebp),%eax
     85b:	89 04 24             	mov    %eax,(%esp)
     85e:	e8 dd 33 00 00       	call   3c40 <close>
    wait();
     863:	e8 b8 33 00 00       	call   3c20 <wait>
  } else {
    printf(1, "fork() failed\n");
    exit();
  }
  printf(1, "pipe1 ok\n");
     868:	c7 44 24 04 7a 48 00 	movl   $0x487a,0x4(%esp)
     86f:	00 
     870:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     877:	e8 44 35 00 00       	call   3dc0 <printf>
     87c:	eb 19                	jmp    897 <pipe1+0x1eb>
      exit();
    }
    close(fds[0]);
    wait();
  } else {
    printf(1, "fork() failed\n");
     87e:	c7 44 24 04 6b 48 00 	movl   $0x486b,0x4(%esp)
     885:	00 
     886:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     88d:	e8 2e 35 00 00       	call   3dc0 <printf>
    exit();
     892:	e8 81 33 00 00       	call   3c18 <exit>
  }
  printf(1, "pipe1 ok\n");
}
     897:	c9                   	leave  
     898:	c3                   	ret    

00000899 <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     899:	55                   	push   %ebp
     89a:	89 e5                	mov    %esp,%ebp
     89c:	83 ec 38             	sub    $0x38,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     89f:	c7 44 24 04 84 48 00 	movl   $0x4884,0x4(%esp)
     8a6:	00 
     8a7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     8ae:	e8 0d 35 00 00       	call   3dc0 <printf>
  pid1 = fork();
     8b3:	e8 58 33 00 00       	call   3c10 <fork>
     8b8:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid1 == 0)
     8bb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     8bf:	75 02                	jne    8c3 <preempt+0x2a>
    for(;;)
      ;
     8c1:	eb fe                	jmp    8c1 <preempt+0x28>

  pid2 = fork();
     8c3:	e8 48 33 00 00       	call   3c10 <fork>
     8c8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid2 == 0)
     8cb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     8cf:	75 02                	jne    8d3 <preempt+0x3a>
    for(;;)
      ;
     8d1:	eb fe                	jmp    8d1 <preempt+0x38>

  pipe(pfds);
     8d3:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     8d6:	89 04 24             	mov    %eax,(%esp)
     8d9:	e8 4a 33 00 00       	call   3c28 <pipe>
  pid3 = fork();
     8de:	e8 2d 33 00 00       	call   3c10 <fork>
     8e3:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid3 == 0){
     8e6:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     8ea:	75 4c                	jne    938 <preempt+0x9f>
    close(pfds[0]);
     8ec:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     8ef:	89 04 24             	mov    %eax,(%esp)
     8f2:	e8 49 33 00 00       	call   3c40 <close>
    if(write(pfds[1], "x", 1) != 1)
     8f7:	8b 45 e8             	mov    -0x18(%ebp),%eax
     8fa:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     901:	00 
     902:	c7 44 24 04 8e 48 00 	movl   $0x488e,0x4(%esp)
     909:	00 
     90a:	89 04 24             	mov    %eax,(%esp)
     90d:	e8 26 33 00 00       	call   3c38 <write>
     912:	83 f8 01             	cmp    $0x1,%eax
     915:	74 14                	je     92b <preempt+0x92>
      printf(1, "preempt write error");
     917:	c7 44 24 04 90 48 00 	movl   $0x4890,0x4(%esp)
     91e:	00 
     91f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     926:	e8 95 34 00 00       	call   3dc0 <printf>
    close(pfds[1]);
     92b:	8b 45 e8             	mov    -0x18(%ebp),%eax
     92e:	89 04 24             	mov    %eax,(%esp)
     931:	e8 0a 33 00 00       	call   3c40 <close>
    for(;;)
      ;
     936:	eb fe                	jmp    936 <preempt+0x9d>
  }

  close(pfds[1]);
     938:	8b 45 e8             	mov    -0x18(%ebp),%eax
     93b:	89 04 24             	mov    %eax,(%esp)
     93e:	e8 fd 32 00 00       	call   3c40 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     943:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     946:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
     94d:	00 
     94e:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     955:	00 
     956:	89 04 24             	mov    %eax,(%esp)
     959:	e8 d2 32 00 00       	call   3c30 <read>
     95e:	83 f8 01             	cmp    $0x1,%eax
     961:	74 16                	je     979 <preempt+0xe0>
    printf(1, "preempt read error");
     963:	c7 44 24 04 a4 48 00 	movl   $0x48a4,0x4(%esp)
     96a:	00 
     96b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     972:	e8 49 34 00 00       	call   3dc0 <printf>
     977:	eb 77                	jmp    9f0 <preempt+0x157>
    return;
  }
  close(pfds[0]);
     979:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     97c:	89 04 24             	mov    %eax,(%esp)
     97f:	e8 bc 32 00 00       	call   3c40 <close>
  printf(1, "kill... ");
     984:	c7 44 24 04 b7 48 00 	movl   $0x48b7,0x4(%esp)
     98b:	00 
     98c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     993:	e8 28 34 00 00       	call   3dc0 <printf>
  kill(pid1);
     998:	8b 45 f4             	mov    -0xc(%ebp),%eax
     99b:	89 04 24             	mov    %eax,(%esp)
     99e:	e8 a5 32 00 00       	call   3c48 <kill>
  kill(pid2);
     9a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
     9a6:	89 04 24             	mov    %eax,(%esp)
     9a9:	e8 9a 32 00 00       	call   3c48 <kill>
  kill(pid3);
     9ae:	8b 45 ec             	mov    -0x14(%ebp),%eax
     9b1:	89 04 24             	mov    %eax,(%esp)
     9b4:	e8 8f 32 00 00       	call   3c48 <kill>
  printf(1, "wait... ");
     9b9:	c7 44 24 04 c0 48 00 	movl   $0x48c0,0x4(%esp)
     9c0:	00 
     9c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9c8:	e8 f3 33 00 00       	call   3dc0 <printf>
  wait();
     9cd:	e8 4e 32 00 00       	call   3c20 <wait>
  wait();
     9d2:	e8 49 32 00 00       	call   3c20 <wait>
  wait();
     9d7:	e8 44 32 00 00       	call   3c20 <wait>
  printf(1, "preempt ok\n");
     9dc:	c7 44 24 04 c9 48 00 	movl   $0x48c9,0x4(%esp)
     9e3:	00 
     9e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9eb:	e8 d0 33 00 00       	call   3dc0 <printf>
}
     9f0:	c9                   	leave  
     9f1:	c3                   	ret    

000009f2 <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     9f2:	55                   	push   %ebp
     9f3:	89 e5                	mov    %esp,%ebp
     9f5:	83 ec 28             	sub    $0x28,%esp
  int i, pid;

  for(i = 0; i < 100; i++){
     9f8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     9ff:	eb 53                	jmp    a54 <exitwait+0x62>
    pid = fork();
     a01:	e8 0a 32 00 00       	call   3c10 <fork>
     a06:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0){
     a09:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a0d:	79 16                	jns    a25 <exitwait+0x33>
      printf(1, "fork failed\n");
     a0f:	c7 44 24 04 d5 48 00 	movl   $0x48d5,0x4(%esp)
     a16:	00 
     a17:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a1e:	e8 9d 33 00 00       	call   3dc0 <printf>
      return;
     a23:	eb 49                	jmp    a6e <exitwait+0x7c>
    }
    if(pid){
     a25:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a29:	74 20                	je     a4b <exitwait+0x59>
      if(wait() != pid){
     a2b:	e8 f0 31 00 00       	call   3c20 <wait>
     a30:	3b 45 f0             	cmp    -0x10(%ebp),%eax
     a33:	74 1b                	je     a50 <exitwait+0x5e>
        printf(1, "wait wrong pid\n");
     a35:	c7 44 24 04 e2 48 00 	movl   $0x48e2,0x4(%esp)
     a3c:	00 
     a3d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a44:	e8 77 33 00 00       	call   3dc0 <printf>
        return;
     a49:	eb 23                	jmp    a6e <exitwait+0x7c>
      }
    } else {
      exit();
     a4b:	e8 c8 31 00 00       	call   3c18 <exit>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     a50:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     a54:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     a58:	7e a7                	jle    a01 <exitwait+0xf>
      }
    } else {
      exit();
    }
  }
  printf(1, "exitwait ok\n");
     a5a:	c7 44 24 04 f2 48 00 	movl   $0x48f2,0x4(%esp)
     a61:	00 
     a62:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a69:	e8 52 33 00 00       	call   3dc0 <printf>
}
     a6e:	c9                   	leave  
     a6f:	c3                   	ret    

00000a70 <mem>:

void
mem(void)
{
     a70:	55                   	push   %ebp
     a71:	89 e5                	mov    %esp,%ebp
     a73:	83 ec 28             	sub    $0x28,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     a76:	c7 44 24 04 ff 48 00 	movl   $0x48ff,0x4(%esp)
     a7d:	00 
     a7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a85:	e8 36 33 00 00       	call   3dc0 <printf>
  ppid = getpid();
     a8a:	e8 09 32 00 00       	call   3c98 <getpid>
     a8f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if((pid = fork()) == 0){
     a92:	e8 79 31 00 00       	call   3c10 <fork>
     a97:	89 45 ec             	mov    %eax,-0x14(%ebp)
     a9a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     a9e:	0f 85 aa 00 00 00    	jne    b4e <mem+0xde>
    m1 = 0;
     aa4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while((m2 = malloc(10001)) != 0){
     aab:	eb 0e                	jmp    abb <mem+0x4b>
      *(char**)m2 = m1;
     aad:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ab0:	8b 55 f4             	mov    -0xc(%ebp),%edx
     ab3:	89 10                	mov    %edx,(%eax)
      m1 = m2;
     ab5:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ab8:	89 45 f4             	mov    %eax,-0xc(%ebp)

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     abb:	c7 04 24 11 27 00 00 	movl   $0x2711,(%esp)
     ac2:	e8 e5 35 00 00       	call   40ac <malloc>
     ac7:	89 45 e8             	mov    %eax,-0x18(%ebp)
     aca:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     ace:	75 dd                	jne    aad <mem+0x3d>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     ad0:	eb 19                	jmp    aeb <mem+0x7b>
      m2 = *(char**)m1;
     ad2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ad5:	8b 00                	mov    (%eax),%eax
     ad7:	89 45 e8             	mov    %eax,-0x18(%ebp)
      free(m1);
     ada:	8b 45 f4             	mov    -0xc(%ebp),%eax
     add:	89 04 24             	mov    %eax,(%esp)
     ae0:	e8 8e 34 00 00       	call   3f73 <free>
      m1 = m2;
     ae5:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ae8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     aeb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     aef:	75 e1                	jne    ad2 <mem+0x62>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     af1:	c7 04 24 00 50 00 00 	movl   $0x5000,(%esp)
     af8:	e8 af 35 00 00       	call   40ac <malloc>
     afd:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(m1 == 0){
     b00:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     b04:	75 24                	jne    b2a <mem+0xba>
      printf(1, "couldn't allocate mem?!!\n");
     b06:	c7 44 24 04 09 49 00 	movl   $0x4909,0x4(%esp)
     b0d:	00 
     b0e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b15:	e8 a6 32 00 00       	call   3dc0 <printf>
      kill(ppid);
     b1a:	8b 45 f0             	mov    -0x10(%ebp),%eax
     b1d:	89 04 24             	mov    %eax,(%esp)
     b20:	e8 23 31 00 00       	call   3c48 <kill>
      exit();
     b25:	e8 ee 30 00 00       	call   3c18 <exit>
    }
    free(m1);
     b2a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     b2d:	89 04 24             	mov    %eax,(%esp)
     b30:	e8 3e 34 00 00       	call   3f73 <free>
    printf(1, "mem ok\n");
     b35:	c7 44 24 04 23 49 00 	movl   $0x4923,0x4(%esp)
     b3c:	00 
     b3d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b44:	e8 77 32 00 00       	call   3dc0 <printf>
    exit();
     b49:	e8 ca 30 00 00       	call   3c18 <exit>
  } else {
    wait();
     b4e:	e8 cd 30 00 00       	call   3c20 <wait>
  }
}
     b53:	c9                   	leave  
     b54:	c3                   	ret    

00000b55 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     b55:	55                   	push   %ebp
     b56:	89 e5                	mov    %esp,%ebp
     b58:	83 ec 48             	sub    $0x48,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     b5b:	c7 44 24 04 2b 49 00 	movl   $0x492b,0x4(%esp)
     b62:	00 
     b63:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b6a:	e8 51 32 00 00       	call   3dc0 <printf>

  unlink("sharedfd");
     b6f:	c7 04 24 3a 49 00 00 	movl   $0x493a,(%esp)
     b76:	e8 ed 30 00 00       	call   3c68 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     b7b:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     b82:	00 
     b83:	c7 04 24 3a 49 00 00 	movl   $0x493a,(%esp)
     b8a:	e8 c9 30 00 00       	call   3c58 <open>
     b8f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     b92:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     b96:	79 19                	jns    bb1 <sharedfd+0x5c>
    printf(1, "fstests: cannot open sharedfd for writing");
     b98:	c7 44 24 04 44 49 00 	movl   $0x4944,0x4(%esp)
     b9f:	00 
     ba0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ba7:	e8 14 32 00 00       	call   3dc0 <printf>
    return;
     bac:	e9 a0 01 00 00       	jmp    d51 <sharedfd+0x1fc>
  }
  pid = fork();
     bb1:	e8 5a 30 00 00       	call   3c10 <fork>
     bb6:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     bb9:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     bbd:	75 07                	jne    bc6 <sharedfd+0x71>
     bbf:	b8 63 00 00 00       	mov    $0x63,%eax
     bc4:	eb 05                	jmp    bcb <sharedfd+0x76>
     bc6:	b8 70 00 00 00       	mov    $0x70,%eax
     bcb:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     bd2:	00 
     bd3:	89 44 24 04          	mov    %eax,0x4(%esp)
     bd7:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     bda:	89 04 24             	mov    %eax,(%esp)
     bdd:	e8 89 2e 00 00       	call   3a6b <memset>
  for(i = 0; i < 1000; i++){
     be2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     be9:	eb 39                	jmp    c24 <sharedfd+0xcf>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     beb:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     bf2:	00 
     bf3:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     bf6:	89 44 24 04          	mov    %eax,0x4(%esp)
     bfa:	8b 45 e8             	mov    -0x18(%ebp),%eax
     bfd:	89 04 24             	mov    %eax,(%esp)
     c00:	e8 33 30 00 00       	call   3c38 <write>
     c05:	83 f8 0a             	cmp    $0xa,%eax
     c08:	74 16                	je     c20 <sharedfd+0xcb>
      printf(1, "fstests: write sharedfd failed\n");
     c0a:	c7 44 24 04 70 49 00 	movl   $0x4970,0x4(%esp)
     c11:	00 
     c12:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c19:	e8 a2 31 00 00       	call   3dc0 <printf>
      break;
     c1e:	eb 0d                	jmp    c2d <sharedfd+0xd8>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
  for(i = 0; i < 1000; i++){
     c20:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     c24:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
     c2b:	7e be                	jle    beb <sharedfd+0x96>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
     c2d:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     c31:	75 05                	jne    c38 <sharedfd+0xe3>
    exit();
     c33:	e8 e0 2f 00 00       	call   3c18 <exit>
  else
    wait();
     c38:	e8 e3 2f 00 00       	call   3c20 <wait>
  close(fd);
     c3d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c40:	89 04 24             	mov    %eax,(%esp)
     c43:	e8 f8 2f 00 00       	call   3c40 <close>
  fd = open("sharedfd", 0);
     c48:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     c4f:	00 
     c50:	c7 04 24 3a 49 00 00 	movl   $0x493a,(%esp)
     c57:	e8 fc 2f 00 00       	call   3c58 <open>
     c5c:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
     c5f:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     c63:	79 19                	jns    c7e <sharedfd+0x129>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     c65:	c7 44 24 04 90 49 00 	movl   $0x4990,0x4(%esp)
     c6c:	00 
     c6d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c74:	e8 47 31 00 00       	call   3dc0 <printf>
    return;
     c79:	e9 d3 00 00 00       	jmp    d51 <sharedfd+0x1fc>
  }
  nc = np = 0;
     c7e:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     c85:	8b 45 ec             	mov    -0x14(%ebp),%eax
     c88:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
     c8b:	eb 3b                	jmp    cc8 <sharedfd+0x173>
    for(i = 0; i < sizeof(buf); i++){
     c8d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     c94:	eb 2a                	jmp    cc0 <sharedfd+0x16b>
      if(buf[i] == 'c')
     c96:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     c99:	8b 45 f4             	mov    -0xc(%ebp),%eax
     c9c:	01 d0                	add    %edx,%eax
     c9e:	0f b6 00             	movzbl (%eax),%eax
     ca1:	3c 63                	cmp    $0x63,%al
     ca3:	75 04                	jne    ca9 <sharedfd+0x154>
        nc++;
     ca5:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == 'p')
     ca9:	8d 55 d6             	lea    -0x2a(%ebp),%edx
     cac:	8b 45 f4             	mov    -0xc(%ebp),%eax
     caf:	01 d0                	add    %edx,%eax
     cb1:	0f b6 00             	movzbl (%eax),%eax
     cb4:	3c 70                	cmp    $0x70,%al
     cb6:	75 04                	jne    cbc <sharedfd+0x167>
        np++;
     cb8:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     cbc:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     cc0:	8b 45 f4             	mov    -0xc(%ebp),%eax
     cc3:	83 f8 09             	cmp    $0x9,%eax
     cc6:	76 ce                	jbe    c96 <sharedfd+0x141>
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     cc8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     ccf:	00 
     cd0:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     cd3:	89 44 24 04          	mov    %eax,0x4(%esp)
     cd7:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cda:	89 04 24             	mov    %eax,(%esp)
     cdd:	e8 4e 2f 00 00       	call   3c30 <read>
     ce2:	89 45 e0             	mov    %eax,-0x20(%ebp)
     ce5:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     ce9:	7f a2                	jg     c8d <sharedfd+0x138>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     ceb:	8b 45 e8             	mov    -0x18(%ebp),%eax
     cee:	89 04 24             	mov    %eax,(%esp)
     cf1:	e8 4a 2f 00 00       	call   3c40 <close>
  unlink("sharedfd");
     cf6:	c7 04 24 3a 49 00 00 	movl   $0x493a,(%esp)
     cfd:	e8 66 2f 00 00       	call   3c68 <unlink>
  if(nc == 10000 && np == 10000){
     d02:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
     d09:	75 1f                	jne    d2a <sharedfd+0x1d5>
     d0b:	81 7d ec 10 27 00 00 	cmpl   $0x2710,-0x14(%ebp)
     d12:	75 16                	jne    d2a <sharedfd+0x1d5>
    printf(1, "sharedfd ok\n");
     d14:	c7 44 24 04 bb 49 00 	movl   $0x49bb,0x4(%esp)
     d1b:	00 
     d1c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d23:	e8 98 30 00 00       	call   3dc0 <printf>
     d28:	eb 27                	jmp    d51 <sharedfd+0x1fc>
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     d2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
     d2d:	89 44 24 0c          	mov    %eax,0xc(%esp)
     d31:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d34:	89 44 24 08          	mov    %eax,0x8(%esp)
     d38:	c7 44 24 04 c8 49 00 	movl   $0x49c8,0x4(%esp)
     d3f:	00 
     d40:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d47:	e8 74 30 00 00       	call   3dc0 <printf>
    exit();
     d4c:	e8 c7 2e 00 00       	call   3c18 <exit>
  }
}
     d51:	c9                   	leave  
     d52:	c3                   	ret    

00000d53 <twofiles>:

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
     d53:	55                   	push   %ebp
     d54:	89 e5                	mov    %esp,%ebp
     d56:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
     d59:	c7 44 24 04 dd 49 00 	movl   $0x49dd,0x4(%esp)
     d60:	00 
     d61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d68:	e8 53 30 00 00       	call   3dc0 <printf>

  unlink("f1");
     d6d:	c7 04 24 ec 49 00 00 	movl   $0x49ec,(%esp)
     d74:	e8 ef 2e 00 00       	call   3c68 <unlink>
  unlink("f2");
     d79:	c7 04 24 ef 49 00 00 	movl   $0x49ef,(%esp)
     d80:	e8 e3 2e 00 00       	call   3c68 <unlink>

  pid = fork();
     d85:	e8 86 2e 00 00       	call   3c10 <fork>
     d8a:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(pid < 0){
     d8d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     d91:	79 19                	jns    dac <twofiles+0x59>
    printf(1, "fork failed\n");
     d93:	c7 44 24 04 d5 48 00 	movl   $0x48d5,0x4(%esp)
     d9a:	00 
     d9b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     da2:	e8 19 30 00 00       	call   3dc0 <printf>
    exit();
     da7:	e8 6c 2e 00 00       	call   3c18 <exit>
  }

  fname = pid ? "f1" : "f2";
     dac:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     db0:	74 07                	je     db9 <twofiles+0x66>
     db2:	b8 ec 49 00 00       	mov    $0x49ec,%eax
     db7:	eb 05                	jmp    dbe <twofiles+0x6b>
     db9:	b8 ef 49 00 00       	mov    $0x49ef,%eax
     dbe:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  fd = open(fname, O_CREATE | O_RDWR);
     dc1:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     dc8:	00 
     dc9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     dcc:	89 04 24             	mov    %eax,(%esp)
     dcf:	e8 84 2e 00 00       	call   3c58 <open>
     dd4:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(fd < 0){
     dd7:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     ddb:	79 19                	jns    df6 <twofiles+0xa3>
    printf(1, "create failed\n");
     ddd:	c7 44 24 04 f2 49 00 	movl   $0x49f2,0x4(%esp)
     de4:	00 
     de5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     dec:	e8 cf 2f 00 00       	call   3dc0 <printf>
    exit();
     df1:	e8 22 2e 00 00       	call   3c18 <exit>
  }

  memset(buf, pid?'p':'c', 512);
     df6:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     dfa:	74 07                	je     e03 <twofiles+0xb0>
     dfc:	b8 70 00 00 00       	mov    $0x70,%eax
     e01:	eb 05                	jmp    e08 <twofiles+0xb5>
     e03:	b8 63 00 00 00       	mov    $0x63,%eax
     e08:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     e0f:	00 
     e10:	89 44 24 04          	mov    %eax,0x4(%esp)
     e14:	c7 04 24 e0 8b 00 00 	movl   $0x8be0,(%esp)
     e1b:	e8 4b 2c 00 00       	call   3a6b <memset>
  for(i = 0; i < 12; i++){
     e20:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e27:	eb 4b                	jmp    e74 <twofiles+0x121>
    if((n = write(fd, buf, 500)) != 500){
     e29:	c7 44 24 08 f4 01 00 	movl   $0x1f4,0x8(%esp)
     e30:	00 
     e31:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     e38:	00 
     e39:	8b 45 e0             	mov    -0x20(%ebp),%eax
     e3c:	89 04 24             	mov    %eax,(%esp)
     e3f:	e8 f4 2d 00 00       	call   3c38 <write>
     e44:	89 45 dc             	mov    %eax,-0x24(%ebp)
     e47:	81 7d dc f4 01 00 00 	cmpl   $0x1f4,-0x24(%ebp)
     e4e:	74 20                	je     e70 <twofiles+0x11d>
      printf(1, "write failed %d\n", n);
     e50:	8b 45 dc             	mov    -0x24(%ebp),%eax
     e53:	89 44 24 08          	mov    %eax,0x8(%esp)
     e57:	c7 44 24 04 01 4a 00 	movl   $0x4a01,0x4(%esp)
     e5e:	00 
     e5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e66:	e8 55 2f 00 00       	call   3dc0 <printf>
      exit();
     e6b:	e8 a8 2d 00 00       	call   3c18 <exit>
    printf(1, "create failed\n");
    exit();
  }

  memset(buf, pid?'p':'c', 512);
  for(i = 0; i < 12; i++){
     e70:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     e74:	83 7d f4 0b          	cmpl   $0xb,-0xc(%ebp)
     e78:	7e af                	jle    e29 <twofiles+0xd6>
    if((n = write(fd, buf, 500)) != 500){
      printf(1, "write failed %d\n", n);
      exit();
    }
  }
  close(fd);
     e7a:	8b 45 e0             	mov    -0x20(%ebp),%eax
     e7d:	89 04 24             	mov    %eax,(%esp)
     e80:	e8 bb 2d 00 00       	call   3c40 <close>
  if(pid)
     e85:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     e89:	74 11                	je     e9c <twofiles+0x149>
    wait();
     e8b:	e8 90 2d 00 00       	call   3c20 <wait>
  else
    exit();

  for(i = 0; i < 2; i++){
     e90:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     e97:	e9 e7 00 00 00       	jmp    f83 <twofiles+0x230>
  }
  close(fd);
  if(pid)
    wait();
  else
    exit();
     e9c:	e8 77 2d 00 00       	call   3c18 <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
     ea1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ea5:	74 07                	je     eae <twofiles+0x15b>
     ea7:	b8 ec 49 00 00       	mov    $0x49ec,%eax
     eac:	eb 05                	jmp    eb3 <twofiles+0x160>
     eae:	b8 ef 49 00 00       	mov    $0x49ef,%eax
     eb3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     eba:	00 
     ebb:	89 04 24             	mov    %eax,(%esp)
     ebe:	e8 95 2d 00 00       	call   3c58 <open>
     ec3:	89 45 e0             	mov    %eax,-0x20(%ebp)
    total = 0;
     ec6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     ecd:	eb 58                	jmp    f27 <twofiles+0x1d4>
      for(j = 0; j < n; j++){
     ecf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ed6:	eb 41                	jmp    f19 <twofiles+0x1c6>
        if(buf[j] != (i?'p':'c')){
     ed8:	8b 45 f0             	mov    -0x10(%ebp),%eax
     edb:	05 e0 8b 00 00       	add    $0x8be0,%eax
     ee0:	0f b6 00             	movzbl (%eax),%eax
     ee3:	0f be d0             	movsbl %al,%edx
     ee6:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     eea:	74 07                	je     ef3 <twofiles+0x1a0>
     eec:	b8 70 00 00 00       	mov    $0x70,%eax
     ef1:	eb 05                	jmp    ef8 <twofiles+0x1a5>
     ef3:	b8 63 00 00 00       	mov    $0x63,%eax
     ef8:	39 c2                	cmp    %eax,%edx
     efa:	74 19                	je     f15 <twofiles+0x1c2>
          printf(1, "wrong char\n");
     efc:	c7 44 24 04 12 4a 00 	movl   $0x4a12,0x4(%esp)
     f03:	00 
     f04:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f0b:	e8 b0 2e 00 00       	call   3dc0 <printf>
          exit();
     f10:	e8 03 2d 00 00       	call   3c18 <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
     f15:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     f19:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f1c:	3b 45 dc             	cmp    -0x24(%ebp),%eax
     f1f:	7c b7                	jl     ed8 <twofiles+0x185>
        if(buf[j] != (i?'p':'c')){
          printf(1, "wrong char\n");
          exit();
        }
      }
      total += n;
     f21:	8b 45 dc             	mov    -0x24(%ebp),%eax
     f24:	01 45 ec             	add    %eax,-0x14(%ebp)
    exit();

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
     f27:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
     f2e:	00 
     f2f:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
     f36:	00 
     f37:	8b 45 e0             	mov    -0x20(%ebp),%eax
     f3a:	89 04 24             	mov    %eax,(%esp)
     f3d:	e8 ee 2c 00 00       	call   3c30 <read>
     f42:	89 45 dc             	mov    %eax,-0x24(%ebp)
     f45:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
     f49:	7f 84                	jg     ecf <twofiles+0x17c>
          exit();
        }
      }
      total += n;
    }
    close(fd);
     f4b:	8b 45 e0             	mov    -0x20(%ebp),%eax
     f4e:	89 04 24             	mov    %eax,(%esp)
     f51:	e8 ea 2c 00 00       	call   3c40 <close>
    if(total != 12*500){
     f56:	81 7d ec 70 17 00 00 	cmpl   $0x1770,-0x14(%ebp)
     f5d:	74 20                	je     f7f <twofiles+0x22c>
      printf(1, "wrong length %d\n", total);
     f5f:	8b 45 ec             	mov    -0x14(%ebp),%eax
     f62:	89 44 24 08          	mov    %eax,0x8(%esp)
     f66:	c7 44 24 04 1e 4a 00 	movl   $0x4a1e,0x4(%esp)
     f6d:	00 
     f6e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f75:	e8 46 2e 00 00       	call   3dc0 <printf>
      exit();
     f7a:	e8 99 2c 00 00       	call   3c18 <exit>
  if(pid)
    wait();
  else
    exit();

  for(i = 0; i < 2; i++){
     f7f:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     f83:	83 7d f4 01          	cmpl   $0x1,-0xc(%ebp)
     f87:	0f 8e 14 ff ff ff    	jle    ea1 <twofiles+0x14e>
      printf(1, "wrong length %d\n", total);
      exit();
    }
  }

  unlink("f1");
     f8d:	c7 04 24 ec 49 00 00 	movl   $0x49ec,(%esp)
     f94:	e8 cf 2c 00 00       	call   3c68 <unlink>
  unlink("f2");
     f99:	c7 04 24 ef 49 00 00 	movl   $0x49ef,(%esp)
     fa0:	e8 c3 2c 00 00       	call   3c68 <unlink>

  printf(1, "twofiles ok\n");
     fa5:	c7 44 24 04 2f 4a 00 	movl   $0x4a2f,0x4(%esp)
     fac:	00 
     fad:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     fb4:	e8 07 2e 00 00       	call   3dc0 <printf>
}
     fb9:	c9                   	leave  
     fba:	c3                   	ret    

00000fbb <createdelete>:

// two processes create and delete different files in same directory
void
createdelete(void)
{
     fbb:	55                   	push   %ebp
     fbc:	89 e5                	mov    %esp,%ebp
     fbe:	83 ec 48             	sub    $0x48,%esp
  enum { N = 20 };
  int pid, i, fd;
  char name[32];

  printf(1, "createdelete test\n");
     fc1:	c7 44 24 04 3c 4a 00 	movl   $0x4a3c,0x4(%esp)
     fc8:	00 
     fc9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     fd0:	e8 eb 2d 00 00       	call   3dc0 <printf>
  pid = fork();
     fd5:	e8 36 2c 00 00       	call   3c10 <fork>
     fda:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid < 0){
     fdd:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     fe1:	79 19                	jns    ffc <createdelete+0x41>
    printf(1, "fork failed\n");
     fe3:	c7 44 24 04 d5 48 00 	movl   $0x48d5,0x4(%esp)
     fea:	00 
     feb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ff2:	e8 c9 2d 00 00       	call   3dc0 <printf>
    exit();
     ff7:	e8 1c 2c 00 00       	call   3c18 <exit>
  }

  name[0] = pid ? 'p' : 'c';
     ffc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1000:	74 07                	je     1009 <createdelete+0x4e>
    1002:	b8 70 00 00 00       	mov    $0x70,%eax
    1007:	eb 05                	jmp    100e <createdelete+0x53>
    1009:	b8 63 00 00 00       	mov    $0x63,%eax
    100e:	88 45 cc             	mov    %al,-0x34(%ebp)
  name[2] = '\0';
    1011:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
  for(i = 0; i < N; i++){
    1015:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    101c:	e9 97 00 00 00       	jmp    10b8 <createdelete+0xfd>
    name[1] = '0' + i;
    1021:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1024:	83 c0 30             	add    $0x30,%eax
    1027:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, O_CREATE | O_RDWR);
    102a:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1031:	00 
    1032:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1035:	89 04 24             	mov    %eax,(%esp)
    1038:	e8 1b 2c 00 00       	call   3c58 <open>
    103d:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    1040:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1044:	79 19                	jns    105f <createdelete+0xa4>
      printf(1, "create failed\n");
    1046:	c7 44 24 04 f2 49 00 	movl   $0x49f2,0x4(%esp)
    104d:	00 
    104e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1055:	e8 66 2d 00 00       	call   3dc0 <printf>
      exit();
    105a:	e8 b9 2b 00 00       	call   3c18 <exit>
    }
    close(fd);
    105f:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1062:	89 04 24             	mov    %eax,(%esp)
    1065:	e8 d6 2b 00 00       	call   3c40 <close>
    if(i > 0 && (i % 2 ) == 0){
    106a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    106e:	7e 44                	jle    10b4 <createdelete+0xf9>
    1070:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1073:	83 e0 01             	and    $0x1,%eax
    1076:	85 c0                	test   %eax,%eax
    1078:	75 3a                	jne    10b4 <createdelete+0xf9>
      name[1] = '0' + (i / 2);
    107a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    107d:	89 c2                	mov    %eax,%edx
    107f:	c1 ea 1f             	shr    $0x1f,%edx
    1082:	01 d0                	add    %edx,%eax
    1084:	d1 f8                	sar    %eax
    1086:	83 c0 30             	add    $0x30,%eax
    1089:	88 45 cd             	mov    %al,-0x33(%ebp)
      if(unlink(name) < 0){
    108c:	8d 45 cc             	lea    -0x34(%ebp),%eax
    108f:	89 04 24             	mov    %eax,(%esp)
    1092:	e8 d1 2b 00 00       	call   3c68 <unlink>
    1097:	85 c0                	test   %eax,%eax
    1099:	79 19                	jns    10b4 <createdelete+0xf9>
        printf(1, "unlink failed\n");
    109b:	c7 44 24 04 4f 4a 00 	movl   $0x4a4f,0x4(%esp)
    10a2:	00 
    10a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10aa:	e8 11 2d 00 00       	call   3dc0 <printf>
        exit();
    10af:	e8 64 2b 00 00       	call   3c18 <exit>
    exit();
  }

  name[0] = pid ? 'p' : 'c';
  name[2] = '\0';
  for(i = 0; i < N; i++){
    10b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    10b8:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    10bc:	0f 8e 5f ff ff ff    	jle    1021 <createdelete+0x66>
        exit();
      }
    }
  }

  if(pid==0)
    10c2:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    10c6:	75 05                	jne    10cd <createdelete+0x112>
    exit();
    10c8:	e8 4b 2b 00 00       	call   3c18 <exit>
  else
    wait();
    10cd:	e8 4e 2b 00 00       	call   3c20 <wait>

  for(i = 0; i < N; i++){
    10d2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    10d9:	e9 34 01 00 00       	jmp    1212 <createdelete+0x257>
    name[0] = 'p';
    10de:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    10e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10e5:	83 c0 30             	add    $0x30,%eax
    10e8:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    10eb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    10f2:	00 
    10f3:	8d 45 cc             	lea    -0x34(%ebp),%eax
    10f6:	89 04 24             	mov    %eax,(%esp)
    10f9:	e8 5a 2b 00 00       	call   3c58 <open>
    10fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    1101:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1105:	74 06                	je     110d <createdelete+0x152>
    1107:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    110b:	7e 26                	jle    1133 <createdelete+0x178>
    110d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1111:	79 20                	jns    1133 <createdelete+0x178>
      printf(1, "oops createdelete %s didn't exist\n", name);
    1113:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1116:	89 44 24 08          	mov    %eax,0x8(%esp)
    111a:	c7 44 24 04 60 4a 00 	movl   $0x4a60,0x4(%esp)
    1121:	00 
    1122:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1129:	e8 92 2c 00 00       	call   3dc0 <printf>
      exit();
    112e:	e8 e5 2a 00 00       	call   3c18 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    1133:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1137:	7e 2c                	jle    1165 <createdelete+0x1aa>
    1139:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    113d:	7f 26                	jg     1165 <createdelete+0x1aa>
    113f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1143:	78 20                	js     1165 <createdelete+0x1aa>
      printf(1, "oops createdelete %s did exist\n", name);
    1145:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1148:	89 44 24 08          	mov    %eax,0x8(%esp)
    114c:	c7 44 24 04 84 4a 00 	movl   $0x4a84,0x4(%esp)
    1153:	00 
    1154:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    115b:	e8 60 2c 00 00       	call   3dc0 <printf>
      exit();
    1160:	e8 b3 2a 00 00       	call   3c18 <exit>
    }
    if(fd >= 0)
    1165:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1169:	78 0b                	js     1176 <createdelete+0x1bb>
      close(fd);
    116b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    116e:	89 04 24             	mov    %eax,(%esp)
    1171:	e8 ca 2a 00 00       	call   3c40 <close>

    name[0] = 'c';
    1176:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    name[1] = '0' + i;
    117a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    117d:	83 c0 30             	add    $0x30,%eax
    1180:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    1183:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    118a:	00 
    118b:	8d 45 cc             	lea    -0x34(%ebp),%eax
    118e:	89 04 24             	mov    %eax,(%esp)
    1191:	e8 c2 2a 00 00       	call   3c58 <open>
    1196:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    1199:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    119d:	74 06                	je     11a5 <createdelete+0x1ea>
    119f:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    11a3:	7e 26                	jle    11cb <createdelete+0x210>
    11a5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    11a9:	79 20                	jns    11cb <createdelete+0x210>
      printf(1, "oops createdelete %s didn't exist\n", name);
    11ab:	8d 45 cc             	lea    -0x34(%ebp),%eax
    11ae:	89 44 24 08          	mov    %eax,0x8(%esp)
    11b2:	c7 44 24 04 60 4a 00 	movl   $0x4a60,0x4(%esp)
    11b9:	00 
    11ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11c1:	e8 fa 2b 00 00       	call   3dc0 <printf>
      exit();
    11c6:	e8 4d 2a 00 00       	call   3c18 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    11cb:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    11cf:	7e 2c                	jle    11fd <createdelete+0x242>
    11d1:	83 7d f4 09          	cmpl   $0x9,-0xc(%ebp)
    11d5:	7f 26                	jg     11fd <createdelete+0x242>
    11d7:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    11db:	78 20                	js     11fd <createdelete+0x242>
      printf(1, "oops createdelete %s did exist\n", name);
    11dd:	8d 45 cc             	lea    -0x34(%ebp),%eax
    11e0:	89 44 24 08          	mov    %eax,0x8(%esp)
    11e4:	c7 44 24 04 84 4a 00 	movl   $0x4a84,0x4(%esp)
    11eb:	00 
    11ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11f3:	e8 c8 2b 00 00       	call   3dc0 <printf>
      exit();
    11f8:	e8 1b 2a 00 00       	call   3c18 <exit>
    }
    if(fd >= 0)
    11fd:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1201:	78 0b                	js     120e <createdelete+0x253>
      close(fd);
    1203:	8b 45 ec             	mov    -0x14(%ebp),%eax
    1206:	89 04 24             	mov    %eax,(%esp)
    1209:	e8 32 2a 00 00       	call   3c40 <close>
  if(pid==0)
    exit();
  else
    wait();

  for(i = 0; i < N; i++){
    120e:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1212:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1216:	0f 8e c2 fe ff ff    	jle    10de <createdelete+0x123>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    121c:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1223:	eb 2b                	jmp    1250 <createdelete+0x295>
    name[0] = 'p';
    1225:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    1229:	8b 45 f4             	mov    -0xc(%ebp),%eax
    122c:	83 c0 30             	add    $0x30,%eax
    122f:	88 45 cd             	mov    %al,-0x33(%ebp)
    unlink(name);
    1232:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1235:	89 04 24             	mov    %eax,(%esp)
    1238:	e8 2b 2a 00 00       	call   3c68 <unlink>
    name[0] = 'c';
    123d:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    unlink(name);
    1241:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1244:	89 04 24             	mov    %eax,(%esp)
    1247:	e8 1c 2a 00 00       	call   3c68 <unlink>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    124c:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1250:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    1254:	7e cf                	jle    1225 <createdelete+0x26a>
    unlink(name);
    name[0] = 'c';
    unlink(name);
  }

  printf(1, "createdelete ok\n");
    1256:	c7 44 24 04 a4 4a 00 	movl   $0x4aa4,0x4(%esp)
    125d:	00 
    125e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1265:	e8 56 2b 00 00       	call   3dc0 <printf>
}
    126a:	c9                   	leave  
    126b:	c3                   	ret    

0000126c <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    126c:	55                   	push   %ebp
    126d:	89 e5                	mov    %esp,%ebp
    126f:	83 ec 28             	sub    $0x28,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    1272:	c7 44 24 04 b5 4a 00 	movl   $0x4ab5,0x4(%esp)
    1279:	00 
    127a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1281:	e8 3a 2b 00 00       	call   3dc0 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    1286:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    128d:	00 
    128e:	c7 04 24 c6 4a 00 00 	movl   $0x4ac6,(%esp)
    1295:	e8 be 29 00 00       	call   3c58 <open>
    129a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    129d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12a1:	79 19                	jns    12bc <unlinkread+0x50>
    printf(1, "create unlinkread failed\n");
    12a3:	c7 44 24 04 d1 4a 00 	movl   $0x4ad1,0x4(%esp)
    12aa:	00 
    12ab:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12b2:	e8 09 2b 00 00       	call   3dc0 <printf>
    exit();
    12b7:	e8 5c 29 00 00       	call   3c18 <exit>
  }
  write(fd, "hello", 5);
    12bc:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    12c3:	00 
    12c4:	c7 44 24 04 eb 4a 00 	movl   $0x4aeb,0x4(%esp)
    12cb:	00 
    12cc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12cf:	89 04 24             	mov    %eax,(%esp)
    12d2:	e8 61 29 00 00       	call   3c38 <write>
  close(fd);
    12d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12da:	89 04 24             	mov    %eax,(%esp)
    12dd:	e8 5e 29 00 00       	call   3c40 <close>

  fd = open("unlinkread", O_RDWR);
    12e2:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    12e9:	00 
    12ea:	c7 04 24 c6 4a 00 00 	movl   $0x4ac6,(%esp)
    12f1:	e8 62 29 00 00       	call   3c58 <open>
    12f6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    12f9:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12fd:	79 19                	jns    1318 <unlinkread+0xac>
    printf(1, "open unlinkread failed\n");
    12ff:	c7 44 24 04 f1 4a 00 	movl   $0x4af1,0x4(%esp)
    1306:	00 
    1307:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    130e:	e8 ad 2a 00 00       	call   3dc0 <printf>
    exit();
    1313:	e8 00 29 00 00       	call   3c18 <exit>
  }
  if(unlink("unlinkread") != 0){
    1318:	c7 04 24 c6 4a 00 00 	movl   $0x4ac6,(%esp)
    131f:	e8 44 29 00 00       	call   3c68 <unlink>
    1324:	85 c0                	test   %eax,%eax
    1326:	74 19                	je     1341 <unlinkread+0xd5>
    printf(1, "unlink unlinkread failed\n");
    1328:	c7 44 24 04 09 4b 00 	movl   $0x4b09,0x4(%esp)
    132f:	00 
    1330:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1337:	e8 84 2a 00 00       	call   3dc0 <printf>
    exit();
    133c:	e8 d7 28 00 00       	call   3c18 <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    1341:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1348:	00 
    1349:	c7 04 24 c6 4a 00 00 	movl   $0x4ac6,(%esp)
    1350:	e8 03 29 00 00       	call   3c58 <open>
    1355:	89 45 f0             	mov    %eax,-0x10(%ebp)
  write(fd1, "yyy", 3);
    1358:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    135f:	00 
    1360:	c7 44 24 04 23 4b 00 	movl   $0x4b23,0x4(%esp)
    1367:	00 
    1368:	8b 45 f0             	mov    -0x10(%ebp),%eax
    136b:	89 04 24             	mov    %eax,(%esp)
    136e:	e8 c5 28 00 00       	call   3c38 <write>
  close(fd1);
    1373:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1376:	89 04 24             	mov    %eax,(%esp)
    1379:	e8 c2 28 00 00       	call   3c40 <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    137e:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1385:	00 
    1386:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    138d:	00 
    138e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1391:	89 04 24             	mov    %eax,(%esp)
    1394:	e8 97 28 00 00       	call   3c30 <read>
    1399:	83 f8 05             	cmp    $0x5,%eax
    139c:	74 19                	je     13b7 <unlinkread+0x14b>
    printf(1, "unlinkread read failed");
    139e:	c7 44 24 04 27 4b 00 	movl   $0x4b27,0x4(%esp)
    13a5:	00 
    13a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13ad:	e8 0e 2a 00 00       	call   3dc0 <printf>
    exit();
    13b2:	e8 61 28 00 00       	call   3c18 <exit>
  }
  if(buf[0] != 'h'){
    13b7:	0f b6 05 e0 8b 00 00 	movzbl 0x8be0,%eax
    13be:	3c 68                	cmp    $0x68,%al
    13c0:	74 19                	je     13db <unlinkread+0x16f>
    printf(1, "unlinkread wrong data\n");
    13c2:	c7 44 24 04 3e 4b 00 	movl   $0x4b3e,0x4(%esp)
    13c9:	00 
    13ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13d1:	e8 ea 29 00 00       	call   3dc0 <printf>
    exit();
    13d6:	e8 3d 28 00 00       	call   3c18 <exit>
  }
  if(write(fd, buf, 10) != 10){
    13db:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    13e2:	00 
    13e3:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    13ea:	00 
    13eb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    13ee:	89 04 24             	mov    %eax,(%esp)
    13f1:	e8 42 28 00 00       	call   3c38 <write>
    13f6:	83 f8 0a             	cmp    $0xa,%eax
    13f9:	74 19                	je     1414 <unlinkread+0x1a8>
    printf(1, "unlinkread write failed\n");
    13fb:	c7 44 24 04 55 4b 00 	movl   $0x4b55,0x4(%esp)
    1402:	00 
    1403:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    140a:	e8 b1 29 00 00       	call   3dc0 <printf>
    exit();
    140f:	e8 04 28 00 00       	call   3c18 <exit>
  }
  close(fd);
    1414:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1417:	89 04 24             	mov    %eax,(%esp)
    141a:	e8 21 28 00 00       	call   3c40 <close>
  unlink("unlinkread");
    141f:	c7 04 24 c6 4a 00 00 	movl   $0x4ac6,(%esp)
    1426:	e8 3d 28 00 00       	call   3c68 <unlink>
  printf(1, "unlinkread ok\n");
    142b:	c7 44 24 04 6e 4b 00 	movl   $0x4b6e,0x4(%esp)
    1432:	00 
    1433:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    143a:	e8 81 29 00 00       	call   3dc0 <printf>
}
    143f:	c9                   	leave  
    1440:	c3                   	ret    

00001441 <linktest>:

void
linktest(void)
{
    1441:	55                   	push   %ebp
    1442:	89 e5                	mov    %esp,%ebp
    1444:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "linktest\n");
    1447:	c7 44 24 04 7d 4b 00 	movl   $0x4b7d,0x4(%esp)
    144e:	00 
    144f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1456:	e8 65 29 00 00       	call   3dc0 <printf>

  unlink("lf1");
    145b:	c7 04 24 87 4b 00 00 	movl   $0x4b87,(%esp)
    1462:	e8 01 28 00 00       	call   3c68 <unlink>
  unlink("lf2");
    1467:	c7 04 24 8b 4b 00 00 	movl   $0x4b8b,(%esp)
    146e:	e8 f5 27 00 00       	call   3c68 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    1473:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    147a:	00 
    147b:	c7 04 24 87 4b 00 00 	movl   $0x4b87,(%esp)
    1482:	e8 d1 27 00 00       	call   3c58 <open>
    1487:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    148a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    148e:	79 19                	jns    14a9 <linktest+0x68>
    printf(1, "create lf1 failed\n");
    1490:	c7 44 24 04 8f 4b 00 	movl   $0x4b8f,0x4(%esp)
    1497:	00 
    1498:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    149f:	e8 1c 29 00 00       	call   3dc0 <printf>
    exit();
    14a4:	e8 6f 27 00 00       	call   3c18 <exit>
  }
  if(write(fd, "hello", 5) != 5){
    14a9:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    14b0:	00 
    14b1:	c7 44 24 04 eb 4a 00 	movl   $0x4aeb,0x4(%esp)
    14b8:	00 
    14b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14bc:	89 04 24             	mov    %eax,(%esp)
    14bf:	e8 74 27 00 00       	call   3c38 <write>
    14c4:	83 f8 05             	cmp    $0x5,%eax
    14c7:	74 19                	je     14e2 <linktest+0xa1>
    printf(1, "write lf1 failed\n");
    14c9:	c7 44 24 04 a2 4b 00 	movl   $0x4ba2,0x4(%esp)
    14d0:	00 
    14d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14d8:	e8 e3 28 00 00       	call   3dc0 <printf>
    exit();
    14dd:	e8 36 27 00 00       	call   3c18 <exit>
  }
  close(fd);
    14e2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14e5:	89 04 24             	mov    %eax,(%esp)
    14e8:	e8 53 27 00 00       	call   3c40 <close>

  if(link("lf1", "lf2") < 0){
    14ed:	c7 44 24 04 8b 4b 00 	movl   $0x4b8b,0x4(%esp)
    14f4:	00 
    14f5:	c7 04 24 87 4b 00 00 	movl   $0x4b87,(%esp)
    14fc:	e8 77 27 00 00       	call   3c78 <link>
    1501:	85 c0                	test   %eax,%eax
    1503:	79 19                	jns    151e <linktest+0xdd>
    printf(1, "link lf1 lf2 failed\n");
    1505:	c7 44 24 04 b4 4b 00 	movl   $0x4bb4,0x4(%esp)
    150c:	00 
    150d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1514:	e8 a7 28 00 00       	call   3dc0 <printf>
    exit();
    1519:	e8 fa 26 00 00       	call   3c18 <exit>
  }
  unlink("lf1");
    151e:	c7 04 24 87 4b 00 00 	movl   $0x4b87,(%esp)
    1525:	e8 3e 27 00 00       	call   3c68 <unlink>

  if(open("lf1", 0) >= 0){
    152a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1531:	00 
    1532:	c7 04 24 87 4b 00 00 	movl   $0x4b87,(%esp)
    1539:	e8 1a 27 00 00       	call   3c58 <open>
    153e:	85 c0                	test   %eax,%eax
    1540:	78 19                	js     155b <linktest+0x11a>
    printf(1, "unlinked lf1 but it is still there!\n");
    1542:	c7 44 24 04 cc 4b 00 	movl   $0x4bcc,0x4(%esp)
    1549:	00 
    154a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1551:	e8 6a 28 00 00       	call   3dc0 <printf>
    exit();
    1556:	e8 bd 26 00 00       	call   3c18 <exit>
  }

  fd = open("lf2", 0);
    155b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1562:	00 
    1563:	c7 04 24 8b 4b 00 00 	movl   $0x4b8b,(%esp)
    156a:	e8 e9 26 00 00       	call   3c58 <open>
    156f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1572:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1576:	79 19                	jns    1591 <linktest+0x150>
    printf(1, "open lf2 failed\n");
    1578:	c7 44 24 04 f1 4b 00 	movl   $0x4bf1,0x4(%esp)
    157f:	00 
    1580:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1587:	e8 34 28 00 00       	call   3dc0 <printf>
    exit();
    158c:	e8 87 26 00 00       	call   3c18 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    1591:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1598:	00 
    1599:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    15a0:	00 
    15a1:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15a4:	89 04 24             	mov    %eax,(%esp)
    15a7:	e8 84 26 00 00       	call   3c30 <read>
    15ac:	83 f8 05             	cmp    $0x5,%eax
    15af:	74 19                	je     15ca <linktest+0x189>
    printf(1, "read lf2 failed\n");
    15b1:	c7 44 24 04 02 4c 00 	movl   $0x4c02,0x4(%esp)
    15b8:	00 
    15b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15c0:	e8 fb 27 00 00       	call   3dc0 <printf>
    exit();
    15c5:	e8 4e 26 00 00       	call   3c18 <exit>
  }
  close(fd);
    15ca:	8b 45 f4             	mov    -0xc(%ebp),%eax
    15cd:	89 04 24             	mov    %eax,(%esp)
    15d0:	e8 6b 26 00 00       	call   3c40 <close>

  if(link("lf2", "lf2") >= 0){
    15d5:	c7 44 24 04 8b 4b 00 	movl   $0x4b8b,0x4(%esp)
    15dc:	00 
    15dd:	c7 04 24 8b 4b 00 00 	movl   $0x4b8b,(%esp)
    15e4:	e8 8f 26 00 00       	call   3c78 <link>
    15e9:	85 c0                	test   %eax,%eax
    15eb:	78 19                	js     1606 <linktest+0x1c5>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    15ed:	c7 44 24 04 13 4c 00 	movl   $0x4c13,0x4(%esp)
    15f4:	00 
    15f5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15fc:	e8 bf 27 00 00       	call   3dc0 <printf>
    exit();
    1601:	e8 12 26 00 00       	call   3c18 <exit>
  }

  unlink("lf2");
    1606:	c7 04 24 8b 4b 00 00 	movl   $0x4b8b,(%esp)
    160d:	e8 56 26 00 00       	call   3c68 <unlink>
  if(link("lf2", "lf1") >= 0){
    1612:	c7 44 24 04 87 4b 00 	movl   $0x4b87,0x4(%esp)
    1619:	00 
    161a:	c7 04 24 8b 4b 00 00 	movl   $0x4b8b,(%esp)
    1621:	e8 52 26 00 00       	call   3c78 <link>
    1626:	85 c0                	test   %eax,%eax
    1628:	78 19                	js     1643 <linktest+0x202>
    printf(1, "link non-existant succeeded! oops\n");
    162a:	c7 44 24 04 34 4c 00 	movl   $0x4c34,0x4(%esp)
    1631:	00 
    1632:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1639:	e8 82 27 00 00       	call   3dc0 <printf>
    exit();
    163e:	e8 d5 25 00 00       	call   3c18 <exit>
  }

  if(link(".", "lf1") >= 0){
    1643:	c7 44 24 04 87 4b 00 	movl   $0x4b87,0x4(%esp)
    164a:	00 
    164b:	c7 04 24 57 4c 00 00 	movl   $0x4c57,(%esp)
    1652:	e8 21 26 00 00       	call   3c78 <link>
    1657:	85 c0                	test   %eax,%eax
    1659:	78 19                	js     1674 <linktest+0x233>
    printf(1, "link . lf1 succeeded! oops\n");
    165b:	c7 44 24 04 59 4c 00 	movl   $0x4c59,0x4(%esp)
    1662:	00 
    1663:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    166a:	e8 51 27 00 00       	call   3dc0 <printf>
    exit();
    166f:	e8 a4 25 00 00       	call   3c18 <exit>
  }

  printf(1, "linktest ok\n");
    1674:	c7 44 24 04 75 4c 00 	movl   $0x4c75,0x4(%esp)
    167b:	00 
    167c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1683:	e8 38 27 00 00       	call   3dc0 <printf>
}
    1688:	c9                   	leave  
    1689:	c3                   	ret    

0000168a <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    168a:	55                   	push   %ebp
    168b:	89 e5                	mov    %esp,%ebp
    168d:	83 ec 68             	sub    $0x68,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    1690:	c7 44 24 04 82 4c 00 	movl   $0x4c82,0x4(%esp)
    1697:	00 
    1698:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    169f:	e8 1c 27 00 00       	call   3dc0 <printf>
  file[0] = 'C';
    16a4:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    16a8:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    16ac:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    16b3:	e9 f7 00 00 00       	jmp    17af <concreate+0x125>
    file[1] = '0' + i;
    16b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    16bb:	83 c0 30             	add    $0x30,%eax
    16be:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    16c1:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16c4:	89 04 24             	mov    %eax,(%esp)
    16c7:	e8 9c 25 00 00       	call   3c68 <unlink>
    pid = fork();
    16cc:	e8 3f 25 00 00       	call   3c10 <fork>
    16d1:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid && (i % 3) == 1){
    16d4:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    16d8:	74 3a                	je     1714 <concreate+0x8a>
    16da:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    16dd:	ba 56 55 55 55       	mov    $0x55555556,%edx
    16e2:	89 c8                	mov    %ecx,%eax
    16e4:	f7 ea                	imul   %edx
    16e6:	89 c8                	mov    %ecx,%eax
    16e8:	c1 f8 1f             	sar    $0x1f,%eax
    16eb:	29 c2                	sub    %eax,%edx
    16ed:	89 d0                	mov    %edx,%eax
    16ef:	01 c0                	add    %eax,%eax
    16f1:	01 d0                	add    %edx,%eax
    16f3:	29 c1                	sub    %eax,%ecx
    16f5:	89 ca                	mov    %ecx,%edx
    16f7:	83 fa 01             	cmp    $0x1,%edx
    16fa:	75 18                	jne    1714 <concreate+0x8a>
      link("C0", file);
    16fc:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    16ff:	89 44 24 04          	mov    %eax,0x4(%esp)
    1703:	c7 04 24 92 4c 00 00 	movl   $0x4c92,(%esp)
    170a:	e8 69 25 00 00       	call   3c78 <link>
    170f:	e9 87 00 00 00       	jmp    179b <concreate+0x111>
    } else if(pid == 0 && (i % 5) == 1){
    1714:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1718:	75 3a                	jne    1754 <concreate+0xca>
    171a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    171d:	ba 67 66 66 66       	mov    $0x66666667,%edx
    1722:	89 c8                	mov    %ecx,%eax
    1724:	f7 ea                	imul   %edx
    1726:	d1 fa                	sar    %edx
    1728:	89 c8                	mov    %ecx,%eax
    172a:	c1 f8 1f             	sar    $0x1f,%eax
    172d:	29 c2                	sub    %eax,%edx
    172f:	89 d0                	mov    %edx,%eax
    1731:	c1 e0 02             	shl    $0x2,%eax
    1734:	01 d0                	add    %edx,%eax
    1736:	29 c1                	sub    %eax,%ecx
    1738:	89 ca                	mov    %ecx,%edx
    173a:	83 fa 01             	cmp    $0x1,%edx
    173d:	75 15                	jne    1754 <concreate+0xca>
      link("C0", file);
    173f:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1742:	89 44 24 04          	mov    %eax,0x4(%esp)
    1746:	c7 04 24 92 4c 00 00 	movl   $0x4c92,(%esp)
    174d:	e8 26 25 00 00       	call   3c78 <link>
    1752:	eb 47                	jmp    179b <concreate+0x111>
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    1754:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    175b:	00 
    175c:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    175f:	89 04 24             	mov    %eax,(%esp)
    1762:	e8 f1 24 00 00       	call   3c58 <open>
    1767:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(fd < 0){
    176a:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    176e:	79 20                	jns    1790 <concreate+0x106>
        printf(1, "concreate create %s failed\n", file);
    1770:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1773:	89 44 24 08          	mov    %eax,0x8(%esp)
    1777:	c7 44 24 04 95 4c 00 	movl   $0x4c95,0x4(%esp)
    177e:	00 
    177f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1786:	e8 35 26 00 00       	call   3dc0 <printf>
        exit();
    178b:	e8 88 24 00 00       	call   3c18 <exit>
      }
      close(fd);
    1790:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1793:	89 04 24             	mov    %eax,(%esp)
    1796:	e8 a5 24 00 00       	call   3c40 <close>
    }
    if(pid == 0)
    179b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    179f:	75 05                	jne    17a6 <concreate+0x11c>
      exit();
    17a1:	e8 72 24 00 00       	call   3c18 <exit>
    else
      wait();
    17a6:	e8 75 24 00 00       	call   3c20 <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    17ab:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    17af:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    17b3:	0f 8e ff fe ff ff    	jle    16b8 <concreate+0x2e>
      exit();
    else
      wait();
  }

  memset(fa, 0, sizeof(fa));
    17b9:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    17c0:	00 
    17c1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    17c8:	00 
    17c9:	8d 45 bd             	lea    -0x43(%ebp),%eax
    17cc:	89 04 24             	mov    %eax,(%esp)
    17cf:	e8 97 22 00 00       	call   3a6b <memset>
  fd = open(".", 0);
    17d4:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    17db:	00 
    17dc:	c7 04 24 57 4c 00 00 	movl   $0x4c57,(%esp)
    17e3:	e8 70 24 00 00       	call   3c58 <open>
    17e8:	89 45 e8             	mov    %eax,-0x18(%ebp)
  n = 0;
    17eb:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    17f2:	e9 a1 00 00 00       	jmp    1898 <concreate+0x20e>
    if(de.inum == 0)
    17f7:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    17fb:	66 85 c0             	test   %ax,%ax
    17fe:	75 05                	jne    1805 <concreate+0x17b>
      continue;
    1800:	e9 93 00 00 00       	jmp    1898 <concreate+0x20e>
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    1805:	0f b6 45 ae          	movzbl -0x52(%ebp),%eax
    1809:	3c 43                	cmp    $0x43,%al
    180b:	0f 85 87 00 00 00    	jne    1898 <concreate+0x20e>
    1811:	0f b6 45 b0          	movzbl -0x50(%ebp),%eax
    1815:	84 c0                	test   %al,%al
    1817:	75 7f                	jne    1898 <concreate+0x20e>
      i = de.name[1] - '0';
    1819:	0f b6 45 af          	movzbl -0x51(%ebp),%eax
    181d:	0f be c0             	movsbl %al,%eax
    1820:	83 e8 30             	sub    $0x30,%eax
    1823:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(i < 0 || i >= sizeof(fa)){
    1826:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    182a:	78 08                	js     1834 <concreate+0x1aa>
    182c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    182f:	83 f8 27             	cmp    $0x27,%eax
    1832:	76 23                	jbe    1857 <concreate+0x1cd>
        printf(1, "concreate weird file %s\n", de.name);
    1834:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1837:	83 c0 02             	add    $0x2,%eax
    183a:	89 44 24 08          	mov    %eax,0x8(%esp)
    183e:	c7 44 24 04 b1 4c 00 	movl   $0x4cb1,0x4(%esp)
    1845:	00 
    1846:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    184d:	e8 6e 25 00 00       	call   3dc0 <printf>
        exit();
    1852:	e8 c1 23 00 00       	call   3c18 <exit>
      }
      if(fa[i]){
    1857:	8d 55 bd             	lea    -0x43(%ebp),%edx
    185a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    185d:	01 d0                	add    %edx,%eax
    185f:	0f b6 00             	movzbl (%eax),%eax
    1862:	84 c0                	test   %al,%al
    1864:	74 23                	je     1889 <concreate+0x1ff>
        printf(1, "concreate duplicate file %s\n", de.name);
    1866:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1869:	83 c0 02             	add    $0x2,%eax
    186c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1870:	c7 44 24 04 ca 4c 00 	movl   $0x4cca,0x4(%esp)
    1877:	00 
    1878:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    187f:	e8 3c 25 00 00       	call   3dc0 <printf>
        exit();
    1884:	e8 8f 23 00 00       	call   3c18 <exit>
      }
      fa[i] = 1;
    1889:	8d 55 bd             	lea    -0x43(%ebp),%edx
    188c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    188f:	01 d0                	add    %edx,%eax
    1891:	c6 00 01             	movb   $0x1,(%eax)
      n++;
    1894:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1898:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    189f:	00 
    18a0:	8d 45 ac             	lea    -0x54(%ebp),%eax
    18a3:	89 44 24 04          	mov    %eax,0x4(%esp)
    18a7:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18aa:	89 04 24             	mov    %eax,(%esp)
    18ad:	e8 7e 23 00 00       	call   3c30 <read>
    18b2:	85 c0                	test   %eax,%eax
    18b4:	0f 8f 3d ff ff ff    	jg     17f7 <concreate+0x16d>
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    18ba:	8b 45 e8             	mov    -0x18(%ebp),%eax
    18bd:	89 04 24             	mov    %eax,(%esp)
    18c0:	e8 7b 23 00 00       	call   3c40 <close>

  if(n != 40){
    18c5:	83 7d f0 28          	cmpl   $0x28,-0x10(%ebp)
    18c9:	74 19                	je     18e4 <concreate+0x25a>
    printf(1, "concreate not enough files in directory listing\n");
    18cb:	c7 44 24 04 e8 4c 00 	movl   $0x4ce8,0x4(%esp)
    18d2:	00 
    18d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    18da:	e8 e1 24 00 00       	call   3dc0 <printf>
    exit();
    18df:	e8 34 23 00 00       	call   3c18 <exit>
  }

  for(i = 0; i < 40; i++){
    18e4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    18eb:	e9 2d 01 00 00       	jmp    1a1d <concreate+0x393>
    file[1] = '0' + i;
    18f0:	8b 45 f4             	mov    -0xc(%ebp),%eax
    18f3:	83 c0 30             	add    $0x30,%eax
    18f6:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    18f9:	e8 12 23 00 00       	call   3c10 <fork>
    18fe:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    1901:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1905:	79 19                	jns    1920 <concreate+0x296>
      printf(1, "fork failed\n");
    1907:	c7 44 24 04 d5 48 00 	movl   $0x48d5,0x4(%esp)
    190e:	00 
    190f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1916:	e8 a5 24 00 00       	call   3dc0 <printf>
      exit();
    191b:	e8 f8 22 00 00       	call   3c18 <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    1920:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1923:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1928:	89 c8                	mov    %ecx,%eax
    192a:	f7 ea                	imul   %edx
    192c:	89 c8                	mov    %ecx,%eax
    192e:	c1 f8 1f             	sar    $0x1f,%eax
    1931:	29 c2                	sub    %eax,%edx
    1933:	89 d0                	mov    %edx,%eax
    1935:	01 c0                	add    %eax,%eax
    1937:	01 d0                	add    %edx,%eax
    1939:	29 c1                	sub    %eax,%ecx
    193b:	89 ca                	mov    %ecx,%edx
    193d:	85 d2                	test   %edx,%edx
    193f:	75 06                	jne    1947 <concreate+0x2bd>
    1941:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1945:	74 28                	je     196f <concreate+0x2e5>
       ((i % 3) == 1 && pid != 0)){
    1947:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    194a:	ba 56 55 55 55       	mov    $0x55555556,%edx
    194f:	89 c8                	mov    %ecx,%eax
    1951:	f7 ea                	imul   %edx
    1953:	89 c8                	mov    %ecx,%eax
    1955:	c1 f8 1f             	sar    $0x1f,%eax
    1958:	29 c2                	sub    %eax,%edx
    195a:	89 d0                	mov    %edx,%eax
    195c:	01 c0                	add    %eax,%eax
    195e:	01 d0                	add    %edx,%eax
    1960:	29 c1                	sub    %eax,%ecx
    1962:	89 ca                	mov    %ecx,%edx
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit();
    }
    if(((i % 3) == 0 && pid == 0) ||
    1964:	83 fa 01             	cmp    $0x1,%edx
    1967:	75 74                	jne    19dd <concreate+0x353>
       ((i % 3) == 1 && pid != 0)){
    1969:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    196d:	74 6e                	je     19dd <concreate+0x353>
      close(open(file, 0));
    196f:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1976:	00 
    1977:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    197a:	89 04 24             	mov    %eax,(%esp)
    197d:	e8 d6 22 00 00       	call   3c58 <open>
    1982:	89 04 24             	mov    %eax,(%esp)
    1985:	e8 b6 22 00 00       	call   3c40 <close>
      close(open(file, 0));
    198a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1991:	00 
    1992:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1995:	89 04 24             	mov    %eax,(%esp)
    1998:	e8 bb 22 00 00       	call   3c58 <open>
    199d:	89 04 24             	mov    %eax,(%esp)
    19a0:	e8 9b 22 00 00       	call   3c40 <close>
      close(open(file, 0));
    19a5:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19ac:	00 
    19ad:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19b0:	89 04 24             	mov    %eax,(%esp)
    19b3:	e8 a0 22 00 00       	call   3c58 <open>
    19b8:	89 04 24             	mov    %eax,(%esp)
    19bb:	e8 80 22 00 00       	call   3c40 <close>
      close(open(file, 0));
    19c0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19c7:	00 
    19c8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19cb:	89 04 24             	mov    %eax,(%esp)
    19ce:	e8 85 22 00 00       	call   3c58 <open>
    19d3:	89 04 24             	mov    %eax,(%esp)
    19d6:	e8 65 22 00 00       	call   3c40 <close>
    19db:	eb 2c                	jmp    1a09 <concreate+0x37f>
    } else {
      unlink(file);
    19dd:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19e0:	89 04 24             	mov    %eax,(%esp)
    19e3:	e8 80 22 00 00       	call   3c68 <unlink>
      unlink(file);
    19e8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19eb:	89 04 24             	mov    %eax,(%esp)
    19ee:	e8 75 22 00 00       	call   3c68 <unlink>
      unlink(file);
    19f3:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    19f6:	89 04 24             	mov    %eax,(%esp)
    19f9:	e8 6a 22 00 00       	call   3c68 <unlink>
      unlink(file);
    19fe:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1a01:	89 04 24             	mov    %eax,(%esp)
    1a04:	e8 5f 22 00 00       	call   3c68 <unlink>
    }
    if(pid == 0)
    1a09:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a0d:	75 05                	jne    1a14 <concreate+0x38a>
      exit();
    1a0f:	e8 04 22 00 00       	call   3c18 <exit>
    else
      wait();
    1a14:	e8 07 22 00 00       	call   3c20 <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit();
  }

  for(i = 0; i < 40; i++){
    1a19:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1a1d:	83 7d f4 27          	cmpl   $0x27,-0xc(%ebp)
    1a21:	0f 8e c9 fe ff ff    	jle    18f0 <concreate+0x266>
      exit();
    else
      wait();
  }

  printf(1, "concreate ok\n");
    1a27:	c7 44 24 04 19 4d 00 	movl   $0x4d19,0x4(%esp)
    1a2e:	00 
    1a2f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a36:	e8 85 23 00 00       	call   3dc0 <printf>
}
    1a3b:	c9                   	leave  
    1a3c:	c3                   	ret    

00001a3d <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1a3d:	55                   	push   %ebp
    1a3e:	89 e5                	mov    %esp,%ebp
    1a40:	83 ec 28             	sub    $0x28,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1a43:	c7 44 24 04 27 4d 00 	movl   $0x4d27,0x4(%esp)
    1a4a:	00 
    1a4b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a52:	e8 69 23 00 00       	call   3dc0 <printf>

  unlink("x");
    1a57:	c7 04 24 8e 48 00 00 	movl   $0x488e,(%esp)
    1a5e:	e8 05 22 00 00       	call   3c68 <unlink>
  pid = fork();
    1a63:	e8 a8 21 00 00       	call   3c10 <fork>
    1a68:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    1a6b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a6f:	79 19                	jns    1a8a <linkunlink+0x4d>
    printf(1, "fork failed\n");
    1a71:	c7 44 24 04 d5 48 00 	movl   $0x48d5,0x4(%esp)
    1a78:	00 
    1a79:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a80:	e8 3b 23 00 00       	call   3dc0 <printf>
    exit();
    1a85:	e8 8e 21 00 00       	call   3c18 <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    1a8a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1a8e:	74 07                	je     1a97 <linkunlink+0x5a>
    1a90:	b8 01 00 00 00       	mov    $0x1,%eax
    1a95:	eb 05                	jmp    1a9c <linkunlink+0x5f>
    1a97:	b8 61 00 00 00       	mov    $0x61,%eax
    1a9c:	89 45 f0             	mov    %eax,-0x10(%ebp)
  for(i = 0; i < 100; i++){
    1a9f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1aa6:	e9 8e 00 00 00       	jmp    1b39 <linkunlink+0xfc>
    x = x * 1103515245 + 12345;
    1aab:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1aae:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
    1ab4:	05 39 30 00 00       	add    $0x3039,%eax
    1ab9:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if((x % 3) == 0){
    1abc:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1abf:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1ac4:	89 c8                	mov    %ecx,%eax
    1ac6:	f7 e2                	mul    %edx
    1ac8:	d1 ea                	shr    %edx
    1aca:	89 d0                	mov    %edx,%eax
    1acc:	01 c0                	add    %eax,%eax
    1ace:	01 d0                	add    %edx,%eax
    1ad0:	29 c1                	sub    %eax,%ecx
    1ad2:	89 ca                	mov    %ecx,%edx
    1ad4:	85 d2                	test   %edx,%edx
    1ad6:	75 1e                	jne    1af6 <linkunlink+0xb9>
      close(open("x", O_RDWR | O_CREATE));
    1ad8:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1adf:	00 
    1ae0:	c7 04 24 8e 48 00 00 	movl   $0x488e,(%esp)
    1ae7:	e8 6c 21 00 00       	call   3c58 <open>
    1aec:	89 04 24             	mov    %eax,(%esp)
    1aef:	e8 4c 21 00 00       	call   3c40 <close>
    1af4:	eb 3f                	jmp    1b35 <linkunlink+0xf8>
    } else if((x % 3) == 1){
    1af6:	8b 4d f0             	mov    -0x10(%ebp),%ecx
    1af9:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1afe:	89 c8                	mov    %ecx,%eax
    1b00:	f7 e2                	mul    %edx
    1b02:	d1 ea                	shr    %edx
    1b04:	89 d0                	mov    %edx,%eax
    1b06:	01 c0                	add    %eax,%eax
    1b08:	01 d0                	add    %edx,%eax
    1b0a:	29 c1                	sub    %eax,%ecx
    1b0c:	89 ca                	mov    %ecx,%edx
    1b0e:	83 fa 01             	cmp    $0x1,%edx
    1b11:	75 16                	jne    1b29 <linkunlink+0xec>
      link("cat", "x");
    1b13:	c7 44 24 04 8e 48 00 	movl   $0x488e,0x4(%esp)
    1b1a:	00 
    1b1b:	c7 04 24 38 4d 00 00 	movl   $0x4d38,(%esp)
    1b22:	e8 51 21 00 00       	call   3c78 <link>
    1b27:	eb 0c                	jmp    1b35 <linkunlink+0xf8>
    } else {
      unlink("x");
    1b29:	c7 04 24 8e 48 00 00 	movl   $0x488e,(%esp)
    1b30:	e8 33 21 00 00       	call   3c68 <unlink>
    printf(1, "fork failed\n");
    exit();
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1b35:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1b39:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
    1b3d:	0f 8e 68 ff ff ff    	jle    1aab <linkunlink+0x6e>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1b43:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b47:	74 07                	je     1b50 <linkunlink+0x113>
    wait();
    1b49:	e8 d2 20 00 00       	call   3c20 <wait>
    1b4e:	eb 05                	jmp    1b55 <linkunlink+0x118>
  else 
    exit();
    1b50:	e8 c3 20 00 00       	call   3c18 <exit>

  printf(1, "linkunlink ok\n");
    1b55:	c7 44 24 04 3c 4d 00 	movl   $0x4d3c,0x4(%esp)
    1b5c:	00 
    1b5d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b64:	e8 57 22 00 00       	call   3dc0 <printf>
}
    1b69:	c9                   	leave  
    1b6a:	c3                   	ret    

00001b6b <bigdir>:

// directory that uses indirect blocks
void
bigdir(void)
{
    1b6b:	55                   	push   %ebp
    1b6c:	89 e5                	mov    %esp,%ebp
    1b6e:	83 ec 38             	sub    $0x38,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1b71:	c7 44 24 04 4b 4d 00 	movl   $0x4d4b,0x4(%esp)
    1b78:	00 
    1b79:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b80:	e8 3b 22 00 00       	call   3dc0 <printf>
  unlink("bd");
    1b85:	c7 04 24 58 4d 00 00 	movl   $0x4d58,(%esp)
    1b8c:	e8 d7 20 00 00       	call   3c68 <unlink>

  fd = open("bd", O_CREATE);
    1b91:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1b98:	00 
    1b99:	c7 04 24 58 4d 00 00 	movl   $0x4d58,(%esp)
    1ba0:	e8 b3 20 00 00       	call   3c58 <open>
    1ba5:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1ba8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1bac:	79 19                	jns    1bc7 <bigdir+0x5c>
    printf(1, "bigdir create failed\n");
    1bae:	c7 44 24 04 5b 4d 00 	movl   $0x4d5b,0x4(%esp)
    1bb5:	00 
    1bb6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1bbd:	e8 fe 21 00 00       	call   3dc0 <printf>
    exit();
    1bc2:	e8 51 20 00 00       	call   3c18 <exit>
  }
  close(fd);
    1bc7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1bca:	89 04 24             	mov    %eax,(%esp)
    1bcd:	e8 6e 20 00 00       	call   3c40 <close>

  for(i = 0; i < 500; i++){
    1bd2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1bd9:	eb 64                	jmp    1c3f <bigdir+0xd4>
    name[0] = 'x';
    1bdb:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1bdf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1be2:	8d 50 3f             	lea    0x3f(%eax),%edx
    1be5:	85 c0                	test   %eax,%eax
    1be7:	0f 48 c2             	cmovs  %edx,%eax
    1bea:	c1 f8 06             	sar    $0x6,%eax
    1bed:	83 c0 30             	add    $0x30,%eax
    1bf0:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1bf3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1bf6:	99                   	cltd   
    1bf7:	c1 ea 1a             	shr    $0x1a,%edx
    1bfa:	01 d0                	add    %edx,%eax
    1bfc:	83 e0 3f             	and    $0x3f,%eax
    1bff:	29 d0                	sub    %edx,%eax
    1c01:	83 c0 30             	add    $0x30,%eax
    1c04:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1c07:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(link("bd", name) != 0){
    1c0b:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1c0e:	89 44 24 04          	mov    %eax,0x4(%esp)
    1c12:	c7 04 24 58 4d 00 00 	movl   $0x4d58,(%esp)
    1c19:	e8 5a 20 00 00       	call   3c78 <link>
    1c1e:	85 c0                	test   %eax,%eax
    1c20:	74 19                	je     1c3b <bigdir+0xd0>
      printf(1, "bigdir link failed\n");
    1c22:	c7 44 24 04 71 4d 00 	movl   $0x4d71,0x4(%esp)
    1c29:	00 
    1c2a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c31:	e8 8a 21 00 00       	call   3dc0 <printf>
      exit();
    1c36:	e8 dd 1f 00 00       	call   3c18 <exit>
    printf(1, "bigdir create failed\n");
    exit();
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1c3b:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1c3f:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1c46:	7e 93                	jle    1bdb <bigdir+0x70>
      printf(1, "bigdir link failed\n");
      exit();
    }
  }

  unlink("bd");
    1c48:	c7 04 24 58 4d 00 00 	movl   $0x4d58,(%esp)
    1c4f:	e8 14 20 00 00       	call   3c68 <unlink>
  for(i = 0; i < 500; i++){
    1c54:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    1c5b:	eb 5c                	jmp    1cb9 <bigdir+0x14e>
    name[0] = 'x';
    1c5d:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1c61:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c64:	8d 50 3f             	lea    0x3f(%eax),%edx
    1c67:	85 c0                	test   %eax,%eax
    1c69:	0f 48 c2             	cmovs  %edx,%eax
    1c6c:	c1 f8 06             	sar    $0x6,%eax
    1c6f:	83 c0 30             	add    $0x30,%eax
    1c72:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1c75:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1c78:	99                   	cltd   
    1c79:	c1 ea 1a             	shr    $0x1a,%edx
    1c7c:	01 d0                	add    %edx,%eax
    1c7e:	83 e0 3f             	and    $0x3f,%eax
    1c81:	29 d0                	sub    %edx,%eax
    1c83:	83 c0 30             	add    $0x30,%eax
    1c86:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1c89:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(unlink(name) != 0){
    1c8d:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1c90:	89 04 24             	mov    %eax,(%esp)
    1c93:	e8 d0 1f 00 00       	call   3c68 <unlink>
    1c98:	85 c0                	test   %eax,%eax
    1c9a:	74 19                	je     1cb5 <bigdir+0x14a>
      printf(1, "bigdir unlink failed");
    1c9c:	c7 44 24 04 85 4d 00 	movl   $0x4d85,0x4(%esp)
    1ca3:	00 
    1ca4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1cab:	e8 10 21 00 00       	call   3dc0 <printf>
      exit();
    1cb0:	e8 63 1f 00 00       	call   3c18 <exit>
      exit();
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1cb5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    1cb9:	81 7d f4 f3 01 00 00 	cmpl   $0x1f3,-0xc(%ebp)
    1cc0:	7e 9b                	jle    1c5d <bigdir+0xf2>
      printf(1, "bigdir unlink failed");
      exit();
    }
  }

  printf(1, "bigdir ok\n");
    1cc2:	c7 44 24 04 9a 4d 00 	movl   $0x4d9a,0x4(%esp)
    1cc9:	00 
    1cca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1cd1:	e8 ea 20 00 00       	call   3dc0 <printf>
}
    1cd6:	c9                   	leave  
    1cd7:	c3                   	ret    

00001cd8 <subdir>:

void
subdir(void)
{
    1cd8:	55                   	push   %ebp
    1cd9:	89 e5                	mov    %esp,%ebp
    1cdb:	83 ec 28             	sub    $0x28,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1cde:	c7 44 24 04 a5 4d 00 	movl   $0x4da5,0x4(%esp)
    1ce5:	00 
    1ce6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ced:	e8 ce 20 00 00       	call   3dc0 <printf>

  unlink("ff");
    1cf2:	c7 04 24 b2 4d 00 00 	movl   $0x4db2,(%esp)
    1cf9:	e8 6a 1f 00 00       	call   3c68 <unlink>
  if(mkdir("dd") != 0){
    1cfe:	c7 04 24 b5 4d 00 00 	movl   $0x4db5,(%esp)
    1d05:	e8 76 1f 00 00       	call   3c80 <mkdir>
    1d0a:	85 c0                	test   %eax,%eax
    1d0c:	74 19                	je     1d27 <subdir+0x4f>
    printf(1, "subdir mkdir dd failed\n");
    1d0e:	c7 44 24 04 b8 4d 00 	movl   $0x4db8,0x4(%esp)
    1d15:	00 
    1d16:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d1d:	e8 9e 20 00 00       	call   3dc0 <printf>
    exit();
    1d22:	e8 f1 1e 00 00       	call   3c18 <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1d27:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1d2e:	00 
    1d2f:	c7 04 24 d0 4d 00 00 	movl   $0x4dd0,(%esp)
    1d36:	e8 1d 1f 00 00       	call   3c58 <open>
    1d3b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1d3e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1d42:	79 19                	jns    1d5d <subdir+0x85>
    printf(1, "create dd/ff failed\n");
    1d44:	c7 44 24 04 d6 4d 00 	movl   $0x4dd6,0x4(%esp)
    1d4b:	00 
    1d4c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d53:	e8 68 20 00 00       	call   3dc0 <printf>
    exit();
    1d58:	e8 bb 1e 00 00       	call   3c18 <exit>
  }
  write(fd, "ff", 2);
    1d5d:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    1d64:	00 
    1d65:	c7 44 24 04 b2 4d 00 	movl   $0x4db2,0x4(%esp)
    1d6c:	00 
    1d6d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d70:	89 04 24             	mov    %eax,(%esp)
    1d73:	e8 c0 1e 00 00       	call   3c38 <write>
  close(fd);
    1d78:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1d7b:	89 04 24             	mov    %eax,(%esp)
    1d7e:	e8 bd 1e 00 00       	call   3c40 <close>
  
  if(unlink("dd") >= 0){
    1d83:	c7 04 24 b5 4d 00 00 	movl   $0x4db5,(%esp)
    1d8a:	e8 d9 1e 00 00       	call   3c68 <unlink>
    1d8f:	85 c0                	test   %eax,%eax
    1d91:	78 19                	js     1dac <subdir+0xd4>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1d93:	c7 44 24 04 ec 4d 00 	movl   $0x4dec,0x4(%esp)
    1d9a:	00 
    1d9b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1da2:	e8 19 20 00 00       	call   3dc0 <printf>
    exit();
    1da7:	e8 6c 1e 00 00       	call   3c18 <exit>
  }

  if(mkdir("/dd/dd") != 0){
    1dac:	c7 04 24 12 4e 00 00 	movl   $0x4e12,(%esp)
    1db3:	e8 c8 1e 00 00       	call   3c80 <mkdir>
    1db8:	85 c0                	test   %eax,%eax
    1dba:	74 19                	je     1dd5 <subdir+0xfd>
    printf(1, "subdir mkdir dd/dd failed\n");
    1dbc:	c7 44 24 04 19 4e 00 	movl   $0x4e19,0x4(%esp)
    1dc3:	00 
    1dc4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1dcb:	e8 f0 1f 00 00       	call   3dc0 <printf>
    exit();
    1dd0:	e8 43 1e 00 00       	call   3c18 <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    1dd5:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1ddc:	00 
    1ddd:	c7 04 24 34 4e 00 00 	movl   $0x4e34,(%esp)
    1de4:	e8 6f 1e 00 00       	call   3c58 <open>
    1de9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1dec:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1df0:	79 19                	jns    1e0b <subdir+0x133>
    printf(1, "create dd/dd/ff failed\n");
    1df2:	c7 44 24 04 3d 4e 00 	movl   $0x4e3d,0x4(%esp)
    1df9:	00 
    1dfa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e01:	e8 ba 1f 00 00       	call   3dc0 <printf>
    exit();
    1e06:	e8 0d 1e 00 00       	call   3c18 <exit>
  }
  write(fd, "FF", 2);
    1e0b:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    1e12:	00 
    1e13:	c7 44 24 04 55 4e 00 	movl   $0x4e55,0x4(%esp)
    1e1a:	00 
    1e1b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e1e:	89 04 24             	mov    %eax,(%esp)
    1e21:	e8 12 1e 00 00       	call   3c38 <write>
  close(fd);
    1e26:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e29:	89 04 24             	mov    %eax,(%esp)
    1e2c:	e8 0f 1e 00 00       	call   3c40 <close>

  fd = open("dd/dd/../ff", 0);
    1e31:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1e38:	00 
    1e39:	c7 04 24 58 4e 00 00 	movl   $0x4e58,(%esp)
    1e40:	e8 13 1e 00 00       	call   3c58 <open>
    1e45:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1e48:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1e4c:	79 19                	jns    1e67 <subdir+0x18f>
    printf(1, "open dd/dd/../ff failed\n");
    1e4e:	c7 44 24 04 64 4e 00 	movl   $0x4e64,0x4(%esp)
    1e55:	00 
    1e56:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e5d:	e8 5e 1f 00 00       	call   3dc0 <printf>
    exit();
    1e62:	e8 b1 1d 00 00       	call   3c18 <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    1e67:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1e6e:	00 
    1e6f:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    1e76:	00 
    1e77:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1e7a:	89 04 24             	mov    %eax,(%esp)
    1e7d:	e8 ae 1d 00 00       	call   3c30 <read>
    1e82:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(cc != 2 || buf[0] != 'f'){
    1e85:	83 7d f0 02          	cmpl   $0x2,-0x10(%ebp)
    1e89:	75 0b                	jne    1e96 <subdir+0x1be>
    1e8b:	0f b6 05 e0 8b 00 00 	movzbl 0x8be0,%eax
    1e92:	3c 66                	cmp    $0x66,%al
    1e94:	74 19                	je     1eaf <subdir+0x1d7>
    printf(1, "dd/dd/../ff wrong content\n");
    1e96:	c7 44 24 04 7d 4e 00 	movl   $0x4e7d,0x4(%esp)
    1e9d:	00 
    1e9e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ea5:	e8 16 1f 00 00       	call   3dc0 <printf>
    exit();
    1eaa:	e8 69 1d 00 00       	call   3c18 <exit>
  }
  close(fd);
    1eaf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1eb2:	89 04 24             	mov    %eax,(%esp)
    1eb5:	e8 86 1d 00 00       	call   3c40 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    1eba:	c7 44 24 04 98 4e 00 	movl   $0x4e98,0x4(%esp)
    1ec1:	00 
    1ec2:	c7 04 24 34 4e 00 00 	movl   $0x4e34,(%esp)
    1ec9:	e8 aa 1d 00 00       	call   3c78 <link>
    1ece:	85 c0                	test   %eax,%eax
    1ed0:	74 19                	je     1eeb <subdir+0x213>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    1ed2:	c7 44 24 04 a4 4e 00 	movl   $0x4ea4,0x4(%esp)
    1ed9:	00 
    1eda:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ee1:	e8 da 1e 00 00       	call   3dc0 <printf>
    exit();
    1ee6:	e8 2d 1d 00 00       	call   3c18 <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    1eeb:	c7 04 24 34 4e 00 00 	movl   $0x4e34,(%esp)
    1ef2:	e8 71 1d 00 00       	call   3c68 <unlink>
    1ef7:	85 c0                	test   %eax,%eax
    1ef9:	74 19                	je     1f14 <subdir+0x23c>
    printf(1, "unlink dd/dd/ff failed\n");
    1efb:	c7 44 24 04 c5 4e 00 	movl   $0x4ec5,0x4(%esp)
    1f02:	00 
    1f03:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f0a:	e8 b1 1e 00 00       	call   3dc0 <printf>
    exit();
    1f0f:	e8 04 1d 00 00       	call   3c18 <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    1f14:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1f1b:	00 
    1f1c:	c7 04 24 34 4e 00 00 	movl   $0x4e34,(%esp)
    1f23:	e8 30 1d 00 00       	call   3c58 <open>
    1f28:	85 c0                	test   %eax,%eax
    1f2a:	78 19                	js     1f45 <subdir+0x26d>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    1f2c:	c7 44 24 04 e0 4e 00 	movl   $0x4ee0,0x4(%esp)
    1f33:	00 
    1f34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f3b:	e8 80 1e 00 00       	call   3dc0 <printf>
    exit();
    1f40:	e8 d3 1c 00 00       	call   3c18 <exit>
  }

  if(chdir("dd") != 0){
    1f45:	c7 04 24 b5 4d 00 00 	movl   $0x4db5,(%esp)
    1f4c:	e8 37 1d 00 00       	call   3c88 <chdir>
    1f51:	85 c0                	test   %eax,%eax
    1f53:	74 19                	je     1f6e <subdir+0x296>
    printf(1, "chdir dd failed\n");
    1f55:	c7 44 24 04 04 4f 00 	movl   $0x4f04,0x4(%esp)
    1f5c:	00 
    1f5d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f64:	e8 57 1e 00 00       	call   3dc0 <printf>
    exit();
    1f69:	e8 aa 1c 00 00       	call   3c18 <exit>
  }
  if(chdir("dd/../../dd") != 0){
    1f6e:	c7 04 24 15 4f 00 00 	movl   $0x4f15,(%esp)
    1f75:	e8 0e 1d 00 00       	call   3c88 <chdir>
    1f7a:	85 c0                	test   %eax,%eax
    1f7c:	74 19                	je     1f97 <subdir+0x2bf>
    printf(1, "chdir dd/../../dd failed\n");
    1f7e:	c7 44 24 04 21 4f 00 	movl   $0x4f21,0x4(%esp)
    1f85:	00 
    1f86:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f8d:	e8 2e 1e 00 00       	call   3dc0 <printf>
    exit();
    1f92:	e8 81 1c 00 00       	call   3c18 <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    1f97:	c7 04 24 3b 4f 00 00 	movl   $0x4f3b,(%esp)
    1f9e:	e8 e5 1c 00 00       	call   3c88 <chdir>
    1fa3:	85 c0                	test   %eax,%eax
    1fa5:	74 19                	je     1fc0 <subdir+0x2e8>
    printf(1, "chdir dd/../../dd failed\n");
    1fa7:	c7 44 24 04 21 4f 00 	movl   $0x4f21,0x4(%esp)
    1fae:	00 
    1faf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1fb6:	e8 05 1e 00 00       	call   3dc0 <printf>
    exit();
    1fbb:	e8 58 1c 00 00       	call   3c18 <exit>
  }
  if(chdir("./..") != 0){
    1fc0:	c7 04 24 4a 4f 00 00 	movl   $0x4f4a,(%esp)
    1fc7:	e8 bc 1c 00 00       	call   3c88 <chdir>
    1fcc:	85 c0                	test   %eax,%eax
    1fce:	74 19                	je     1fe9 <subdir+0x311>
    printf(1, "chdir ./.. failed\n");
    1fd0:	c7 44 24 04 4f 4f 00 	movl   $0x4f4f,0x4(%esp)
    1fd7:	00 
    1fd8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1fdf:	e8 dc 1d 00 00       	call   3dc0 <printf>
    exit();
    1fe4:	e8 2f 1c 00 00       	call   3c18 <exit>
  }

  fd = open("dd/dd/ffff", 0);
    1fe9:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1ff0:	00 
    1ff1:	c7 04 24 98 4e 00 00 	movl   $0x4e98,(%esp)
    1ff8:	e8 5b 1c 00 00       	call   3c58 <open>
    1ffd:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2000:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2004:	79 19                	jns    201f <subdir+0x347>
    printf(1, "open dd/dd/ffff failed\n");
    2006:	c7 44 24 04 62 4f 00 	movl   $0x4f62,0x4(%esp)
    200d:	00 
    200e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2015:	e8 a6 1d 00 00       	call   3dc0 <printf>
    exit();
    201a:	e8 f9 1b 00 00       	call   3c18 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    201f:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    2026:	00 
    2027:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    202e:	00 
    202f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2032:	89 04 24             	mov    %eax,(%esp)
    2035:	e8 f6 1b 00 00       	call   3c30 <read>
    203a:	83 f8 02             	cmp    $0x2,%eax
    203d:	74 19                	je     2058 <subdir+0x380>
    printf(1, "read dd/dd/ffff wrong len\n");
    203f:	c7 44 24 04 7a 4f 00 	movl   $0x4f7a,0x4(%esp)
    2046:	00 
    2047:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    204e:	e8 6d 1d 00 00       	call   3dc0 <printf>
    exit();
    2053:	e8 c0 1b 00 00       	call   3c18 <exit>
  }
  close(fd);
    2058:	8b 45 f4             	mov    -0xc(%ebp),%eax
    205b:	89 04 24             	mov    %eax,(%esp)
    205e:	e8 dd 1b 00 00       	call   3c40 <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    2063:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    206a:	00 
    206b:	c7 04 24 34 4e 00 00 	movl   $0x4e34,(%esp)
    2072:	e8 e1 1b 00 00       	call   3c58 <open>
    2077:	85 c0                	test   %eax,%eax
    2079:	78 19                	js     2094 <subdir+0x3bc>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    207b:	c7 44 24 04 98 4f 00 	movl   $0x4f98,0x4(%esp)
    2082:	00 
    2083:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    208a:	e8 31 1d 00 00       	call   3dc0 <printf>
    exit();
    208f:	e8 84 1b 00 00       	call   3c18 <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2094:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    209b:	00 
    209c:	c7 04 24 bd 4f 00 00 	movl   $0x4fbd,(%esp)
    20a3:	e8 b0 1b 00 00       	call   3c58 <open>
    20a8:	85 c0                	test   %eax,%eax
    20aa:	78 19                	js     20c5 <subdir+0x3ed>
    printf(1, "create dd/ff/ff succeeded!\n");
    20ac:	c7 44 24 04 c6 4f 00 	movl   $0x4fc6,0x4(%esp)
    20b3:	00 
    20b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20bb:	e8 00 1d 00 00       	call   3dc0 <printf>
    exit();
    20c0:	e8 53 1b 00 00       	call   3c18 <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    20c5:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    20cc:	00 
    20cd:	c7 04 24 e2 4f 00 00 	movl   $0x4fe2,(%esp)
    20d4:	e8 7f 1b 00 00       	call   3c58 <open>
    20d9:	85 c0                	test   %eax,%eax
    20db:	78 19                	js     20f6 <subdir+0x41e>
    printf(1, "create dd/xx/ff succeeded!\n");
    20dd:	c7 44 24 04 eb 4f 00 	movl   $0x4feb,0x4(%esp)
    20e4:	00 
    20e5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20ec:	e8 cf 1c 00 00       	call   3dc0 <printf>
    exit();
    20f1:	e8 22 1b 00 00       	call   3c18 <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    20f6:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    20fd:	00 
    20fe:	c7 04 24 b5 4d 00 00 	movl   $0x4db5,(%esp)
    2105:	e8 4e 1b 00 00       	call   3c58 <open>
    210a:	85 c0                	test   %eax,%eax
    210c:	78 19                	js     2127 <subdir+0x44f>
    printf(1, "create dd succeeded!\n");
    210e:	c7 44 24 04 07 50 00 	movl   $0x5007,0x4(%esp)
    2115:	00 
    2116:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    211d:	e8 9e 1c 00 00       	call   3dc0 <printf>
    exit();
    2122:	e8 f1 1a 00 00       	call   3c18 <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    2127:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    212e:	00 
    212f:	c7 04 24 b5 4d 00 00 	movl   $0x4db5,(%esp)
    2136:	e8 1d 1b 00 00       	call   3c58 <open>
    213b:	85 c0                	test   %eax,%eax
    213d:	78 19                	js     2158 <subdir+0x480>
    printf(1, "open dd rdwr succeeded!\n");
    213f:	c7 44 24 04 1d 50 00 	movl   $0x501d,0x4(%esp)
    2146:	00 
    2147:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    214e:	e8 6d 1c 00 00       	call   3dc0 <printf>
    exit();
    2153:	e8 c0 1a 00 00       	call   3c18 <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    2158:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    215f:	00 
    2160:	c7 04 24 b5 4d 00 00 	movl   $0x4db5,(%esp)
    2167:	e8 ec 1a 00 00       	call   3c58 <open>
    216c:	85 c0                	test   %eax,%eax
    216e:	78 19                	js     2189 <subdir+0x4b1>
    printf(1, "open dd wronly succeeded!\n");
    2170:	c7 44 24 04 36 50 00 	movl   $0x5036,0x4(%esp)
    2177:	00 
    2178:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    217f:	e8 3c 1c 00 00       	call   3dc0 <printf>
    exit();
    2184:	e8 8f 1a 00 00       	call   3c18 <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    2189:	c7 44 24 04 51 50 00 	movl   $0x5051,0x4(%esp)
    2190:	00 
    2191:	c7 04 24 bd 4f 00 00 	movl   $0x4fbd,(%esp)
    2198:	e8 db 1a 00 00       	call   3c78 <link>
    219d:	85 c0                	test   %eax,%eax
    219f:	75 19                	jne    21ba <subdir+0x4e2>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    21a1:	c7 44 24 04 5c 50 00 	movl   $0x505c,0x4(%esp)
    21a8:	00 
    21a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21b0:	e8 0b 1c 00 00       	call   3dc0 <printf>
    exit();
    21b5:	e8 5e 1a 00 00       	call   3c18 <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    21ba:	c7 44 24 04 51 50 00 	movl   $0x5051,0x4(%esp)
    21c1:	00 
    21c2:	c7 04 24 e2 4f 00 00 	movl   $0x4fe2,(%esp)
    21c9:	e8 aa 1a 00 00       	call   3c78 <link>
    21ce:	85 c0                	test   %eax,%eax
    21d0:	75 19                	jne    21eb <subdir+0x513>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    21d2:	c7 44 24 04 80 50 00 	movl   $0x5080,0x4(%esp)
    21d9:	00 
    21da:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21e1:	e8 da 1b 00 00       	call   3dc0 <printf>
    exit();
    21e6:	e8 2d 1a 00 00       	call   3c18 <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    21eb:	c7 44 24 04 98 4e 00 	movl   $0x4e98,0x4(%esp)
    21f2:	00 
    21f3:	c7 04 24 d0 4d 00 00 	movl   $0x4dd0,(%esp)
    21fa:	e8 79 1a 00 00       	call   3c78 <link>
    21ff:	85 c0                	test   %eax,%eax
    2201:	75 19                	jne    221c <subdir+0x544>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    2203:	c7 44 24 04 a4 50 00 	movl   $0x50a4,0x4(%esp)
    220a:	00 
    220b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2212:	e8 a9 1b 00 00       	call   3dc0 <printf>
    exit();
    2217:	e8 fc 19 00 00       	call   3c18 <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    221c:	c7 04 24 bd 4f 00 00 	movl   $0x4fbd,(%esp)
    2223:	e8 58 1a 00 00       	call   3c80 <mkdir>
    2228:	85 c0                	test   %eax,%eax
    222a:	75 19                	jne    2245 <subdir+0x56d>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    222c:	c7 44 24 04 c6 50 00 	movl   $0x50c6,0x4(%esp)
    2233:	00 
    2234:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    223b:	e8 80 1b 00 00       	call   3dc0 <printf>
    exit();
    2240:	e8 d3 19 00 00       	call   3c18 <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    2245:	c7 04 24 e2 4f 00 00 	movl   $0x4fe2,(%esp)
    224c:	e8 2f 1a 00 00       	call   3c80 <mkdir>
    2251:	85 c0                	test   %eax,%eax
    2253:	75 19                	jne    226e <subdir+0x596>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2255:	c7 44 24 04 e1 50 00 	movl   $0x50e1,0x4(%esp)
    225c:	00 
    225d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2264:	e8 57 1b 00 00       	call   3dc0 <printf>
    exit();
    2269:	e8 aa 19 00 00       	call   3c18 <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    226e:	c7 04 24 98 4e 00 00 	movl   $0x4e98,(%esp)
    2275:	e8 06 1a 00 00       	call   3c80 <mkdir>
    227a:	85 c0                	test   %eax,%eax
    227c:	75 19                	jne    2297 <subdir+0x5bf>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    227e:	c7 44 24 04 fc 50 00 	movl   $0x50fc,0x4(%esp)
    2285:	00 
    2286:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    228d:	e8 2e 1b 00 00       	call   3dc0 <printf>
    exit();
    2292:	e8 81 19 00 00       	call   3c18 <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    2297:	c7 04 24 e2 4f 00 00 	movl   $0x4fe2,(%esp)
    229e:	e8 c5 19 00 00       	call   3c68 <unlink>
    22a3:	85 c0                	test   %eax,%eax
    22a5:	75 19                	jne    22c0 <subdir+0x5e8>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    22a7:	c7 44 24 04 19 51 00 	movl   $0x5119,0x4(%esp)
    22ae:	00 
    22af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22b6:	e8 05 1b 00 00       	call   3dc0 <printf>
    exit();
    22bb:	e8 58 19 00 00       	call   3c18 <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    22c0:	c7 04 24 bd 4f 00 00 	movl   $0x4fbd,(%esp)
    22c7:	e8 9c 19 00 00       	call   3c68 <unlink>
    22cc:	85 c0                	test   %eax,%eax
    22ce:	75 19                	jne    22e9 <subdir+0x611>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    22d0:	c7 44 24 04 35 51 00 	movl   $0x5135,0x4(%esp)
    22d7:	00 
    22d8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22df:	e8 dc 1a 00 00       	call   3dc0 <printf>
    exit();
    22e4:	e8 2f 19 00 00       	call   3c18 <exit>
  }
  if(chdir("dd/ff") == 0){
    22e9:	c7 04 24 d0 4d 00 00 	movl   $0x4dd0,(%esp)
    22f0:	e8 93 19 00 00       	call   3c88 <chdir>
    22f5:	85 c0                	test   %eax,%eax
    22f7:	75 19                	jne    2312 <subdir+0x63a>
    printf(1, "chdir dd/ff succeeded!\n");
    22f9:	c7 44 24 04 51 51 00 	movl   $0x5151,0x4(%esp)
    2300:	00 
    2301:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2308:	e8 b3 1a 00 00       	call   3dc0 <printf>
    exit();
    230d:	e8 06 19 00 00       	call   3c18 <exit>
  }
  if(chdir("dd/xx") == 0){
    2312:	c7 04 24 69 51 00 00 	movl   $0x5169,(%esp)
    2319:	e8 6a 19 00 00       	call   3c88 <chdir>
    231e:	85 c0                	test   %eax,%eax
    2320:	75 19                	jne    233b <subdir+0x663>
    printf(1, "chdir dd/xx succeeded!\n");
    2322:	c7 44 24 04 6f 51 00 	movl   $0x516f,0x4(%esp)
    2329:	00 
    232a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2331:	e8 8a 1a 00 00       	call   3dc0 <printf>
    exit();
    2336:	e8 dd 18 00 00       	call   3c18 <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    233b:	c7 04 24 98 4e 00 00 	movl   $0x4e98,(%esp)
    2342:	e8 21 19 00 00       	call   3c68 <unlink>
    2347:	85 c0                	test   %eax,%eax
    2349:	74 19                	je     2364 <subdir+0x68c>
    printf(1, "unlink dd/dd/ff failed\n");
    234b:	c7 44 24 04 c5 4e 00 	movl   $0x4ec5,0x4(%esp)
    2352:	00 
    2353:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    235a:	e8 61 1a 00 00       	call   3dc0 <printf>
    exit();
    235f:	e8 b4 18 00 00       	call   3c18 <exit>
  }
  if(unlink("dd/ff") != 0){
    2364:	c7 04 24 d0 4d 00 00 	movl   $0x4dd0,(%esp)
    236b:	e8 f8 18 00 00       	call   3c68 <unlink>
    2370:	85 c0                	test   %eax,%eax
    2372:	74 19                	je     238d <subdir+0x6b5>
    printf(1, "unlink dd/ff failed\n");
    2374:	c7 44 24 04 87 51 00 	movl   $0x5187,0x4(%esp)
    237b:	00 
    237c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2383:	e8 38 1a 00 00       	call   3dc0 <printf>
    exit();
    2388:	e8 8b 18 00 00       	call   3c18 <exit>
  }
  if(unlink("dd") == 0){
    238d:	c7 04 24 b5 4d 00 00 	movl   $0x4db5,(%esp)
    2394:	e8 cf 18 00 00       	call   3c68 <unlink>
    2399:	85 c0                	test   %eax,%eax
    239b:	75 19                	jne    23b6 <subdir+0x6de>
    printf(1, "unlink non-empty dd succeeded!\n");
    239d:	c7 44 24 04 9c 51 00 	movl   $0x519c,0x4(%esp)
    23a4:	00 
    23a5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23ac:	e8 0f 1a 00 00       	call   3dc0 <printf>
    exit();
    23b1:	e8 62 18 00 00       	call   3c18 <exit>
  }
  if(unlink("dd/dd") < 0){
    23b6:	c7 04 24 bc 51 00 00 	movl   $0x51bc,(%esp)
    23bd:	e8 a6 18 00 00       	call   3c68 <unlink>
    23c2:	85 c0                	test   %eax,%eax
    23c4:	79 19                	jns    23df <subdir+0x707>
    printf(1, "unlink dd/dd failed\n");
    23c6:	c7 44 24 04 c2 51 00 	movl   $0x51c2,0x4(%esp)
    23cd:	00 
    23ce:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23d5:	e8 e6 19 00 00       	call   3dc0 <printf>
    exit();
    23da:	e8 39 18 00 00       	call   3c18 <exit>
  }
  if(unlink("dd") < 0){
    23df:	c7 04 24 b5 4d 00 00 	movl   $0x4db5,(%esp)
    23e6:	e8 7d 18 00 00       	call   3c68 <unlink>
    23eb:	85 c0                	test   %eax,%eax
    23ed:	79 19                	jns    2408 <subdir+0x730>
    printf(1, "unlink dd failed\n");
    23ef:	c7 44 24 04 d7 51 00 	movl   $0x51d7,0x4(%esp)
    23f6:	00 
    23f7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23fe:	e8 bd 19 00 00       	call   3dc0 <printf>
    exit();
    2403:	e8 10 18 00 00       	call   3c18 <exit>
  }

  printf(1, "subdir ok\n");
    2408:	c7 44 24 04 e9 51 00 	movl   $0x51e9,0x4(%esp)
    240f:	00 
    2410:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2417:	e8 a4 19 00 00       	call   3dc0 <printf>
}
    241c:	c9                   	leave  
    241d:	c3                   	ret    

0000241e <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    241e:	55                   	push   %ebp
    241f:	89 e5                	mov    %esp,%ebp
    2421:	83 ec 28             	sub    $0x28,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    2424:	c7 44 24 04 f4 51 00 	movl   $0x51f4,0x4(%esp)
    242b:	00 
    242c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2433:	e8 88 19 00 00       	call   3dc0 <printf>

  unlink("bigwrite");
    2438:	c7 04 24 03 52 00 00 	movl   $0x5203,(%esp)
    243f:	e8 24 18 00 00       	call   3c68 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2444:	c7 45 f4 f3 01 00 00 	movl   $0x1f3,-0xc(%ebp)
    244b:	e9 b3 00 00 00       	jmp    2503 <bigwrite+0xe5>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    2450:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2457:	00 
    2458:	c7 04 24 03 52 00 00 	movl   $0x5203,(%esp)
    245f:	e8 f4 17 00 00       	call   3c58 <open>
    2464:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    2467:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    246b:	79 19                	jns    2486 <bigwrite+0x68>
      printf(1, "cannot create bigwrite\n");
    246d:	c7 44 24 04 0c 52 00 	movl   $0x520c,0x4(%esp)
    2474:	00 
    2475:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    247c:	e8 3f 19 00 00       	call   3dc0 <printf>
      exit();
    2481:	e8 92 17 00 00       	call   3c18 <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    2486:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    248d:	eb 50                	jmp    24df <bigwrite+0xc1>
      int cc = write(fd, buf, sz);
    248f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2492:	89 44 24 08          	mov    %eax,0x8(%esp)
    2496:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    249d:	00 
    249e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24a1:	89 04 24             	mov    %eax,(%esp)
    24a4:	e8 8f 17 00 00       	call   3c38 <write>
    24a9:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(cc != sz){
    24ac:	8b 45 e8             	mov    -0x18(%ebp),%eax
    24af:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    24b2:	74 27                	je     24db <bigwrite+0xbd>
        printf(1, "write(%d) ret %d\n", sz, cc);
    24b4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    24b7:	89 44 24 0c          	mov    %eax,0xc(%esp)
    24bb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    24be:	89 44 24 08          	mov    %eax,0x8(%esp)
    24c2:	c7 44 24 04 24 52 00 	movl   $0x5224,0x4(%esp)
    24c9:	00 
    24ca:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24d1:	e8 ea 18 00 00       	call   3dc0 <printf>
        exit();
    24d6:	e8 3d 17 00 00       	call   3c18 <exit>
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
      exit();
    }
    int i;
    for(i = 0; i < 2; i++){
    24db:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    24df:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    24e3:	7e aa                	jle    248f <bigwrite+0x71>
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit();
      }
    }
    close(fd);
    24e5:	8b 45 ec             	mov    -0x14(%ebp),%eax
    24e8:	89 04 24             	mov    %eax,(%esp)
    24eb:	e8 50 17 00 00       	call   3c40 <close>
    unlink("bigwrite");
    24f0:	c7 04 24 03 52 00 00 	movl   $0x5203,(%esp)
    24f7:	e8 6c 17 00 00       	call   3c68 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    24fc:	81 45 f4 d7 01 00 00 	addl   $0x1d7,-0xc(%ebp)
    2503:	81 7d f4 ff 17 00 00 	cmpl   $0x17ff,-0xc(%ebp)
    250a:	0f 8e 40 ff ff ff    	jle    2450 <bigwrite+0x32>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    2510:	c7 44 24 04 36 52 00 	movl   $0x5236,0x4(%esp)
    2517:	00 
    2518:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    251f:	e8 9c 18 00 00       	call   3dc0 <printf>
}
    2524:	c9                   	leave  
    2525:	c3                   	ret    

00002526 <bigfile>:

void
bigfile(void)
{
    2526:	55                   	push   %ebp
    2527:	89 e5                	mov    %esp,%ebp
    2529:	83 ec 28             	sub    $0x28,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    252c:	c7 44 24 04 43 52 00 	movl   $0x5243,0x4(%esp)
    2533:	00 
    2534:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    253b:	e8 80 18 00 00       	call   3dc0 <printf>

  unlink("bigfile");
    2540:	c7 04 24 51 52 00 00 	movl   $0x5251,(%esp)
    2547:	e8 1c 17 00 00       	call   3c68 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    254c:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2553:	00 
    2554:	c7 04 24 51 52 00 00 	movl   $0x5251,(%esp)
    255b:	e8 f8 16 00 00       	call   3c58 <open>
    2560:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    2563:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2567:	79 19                	jns    2582 <bigfile+0x5c>
    printf(1, "cannot create bigfile");
    2569:	c7 44 24 04 59 52 00 	movl   $0x5259,0x4(%esp)
    2570:	00 
    2571:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2578:	e8 43 18 00 00       	call   3dc0 <printf>
    exit();
    257d:	e8 96 16 00 00       	call   3c18 <exit>
  }
  for(i = 0; i < 20; i++){
    2582:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2589:	eb 5a                	jmp    25e5 <bigfile+0xbf>
    memset(buf, i, 600);
    258b:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    2592:	00 
    2593:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2596:	89 44 24 04          	mov    %eax,0x4(%esp)
    259a:	c7 04 24 e0 8b 00 00 	movl   $0x8be0,(%esp)
    25a1:	e8 c5 14 00 00       	call   3a6b <memset>
    if(write(fd, buf, 600) != 600){
    25a6:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    25ad:	00 
    25ae:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    25b5:	00 
    25b6:	8b 45 ec             	mov    -0x14(%ebp),%eax
    25b9:	89 04 24             	mov    %eax,(%esp)
    25bc:	e8 77 16 00 00       	call   3c38 <write>
    25c1:	3d 58 02 00 00       	cmp    $0x258,%eax
    25c6:	74 19                	je     25e1 <bigfile+0xbb>
      printf(1, "write bigfile failed\n");
    25c8:	c7 44 24 04 6f 52 00 	movl   $0x526f,0x4(%esp)
    25cf:	00 
    25d0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25d7:	e8 e4 17 00 00       	call   3dc0 <printf>
      exit();
    25dc:	e8 37 16 00 00       	call   3c18 <exit>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit();
  }
  for(i = 0; i < 20; i++){
    25e1:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    25e5:	83 7d f4 13          	cmpl   $0x13,-0xc(%ebp)
    25e9:	7e a0                	jle    258b <bigfile+0x65>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit();
    }
  }
  close(fd);
    25eb:	8b 45 ec             	mov    -0x14(%ebp),%eax
    25ee:	89 04 24             	mov    %eax,(%esp)
    25f1:	e8 4a 16 00 00       	call   3c40 <close>

  fd = open("bigfile", 0);
    25f6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    25fd:	00 
    25fe:	c7 04 24 51 52 00 00 	movl   $0x5251,(%esp)
    2605:	e8 4e 16 00 00       	call   3c58 <open>
    260a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    260d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    2611:	79 19                	jns    262c <bigfile+0x106>
    printf(1, "cannot open bigfile\n");
    2613:	c7 44 24 04 85 52 00 	movl   $0x5285,0x4(%esp)
    261a:	00 
    261b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2622:	e8 99 17 00 00       	call   3dc0 <printf>
    exit();
    2627:	e8 ec 15 00 00       	call   3c18 <exit>
  }
  total = 0;
    262c:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(i = 0; ; i++){
    2633:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cc = read(fd, buf, 300);
    263a:	c7 44 24 08 2c 01 00 	movl   $0x12c,0x8(%esp)
    2641:	00 
    2642:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    2649:	00 
    264a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    264d:	89 04 24             	mov    %eax,(%esp)
    2650:	e8 db 15 00 00       	call   3c30 <read>
    2655:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(cc < 0){
    2658:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    265c:	79 19                	jns    2677 <bigfile+0x151>
      printf(1, "read bigfile failed\n");
    265e:	c7 44 24 04 9a 52 00 	movl   $0x529a,0x4(%esp)
    2665:	00 
    2666:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    266d:	e8 4e 17 00 00       	call   3dc0 <printf>
      exit();
    2672:	e8 a1 15 00 00       	call   3c18 <exit>
    }
    if(cc == 0)
    2677:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    267b:	75 1b                	jne    2698 <bigfile+0x172>
      break;
    267d:	90                   	nop
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
  close(fd);
    267e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2681:	89 04 24             	mov    %eax,(%esp)
    2684:	e8 b7 15 00 00       	call   3c40 <close>
  if(total != 20*600){
    2689:	81 7d f0 e0 2e 00 00 	cmpl   $0x2ee0,-0x10(%ebp)
    2690:	0f 84 99 00 00 00    	je     272f <bigfile+0x209>
    2696:	eb 7e                	jmp    2716 <bigfile+0x1f0>
      printf(1, "read bigfile failed\n");
      exit();
    }
    if(cc == 0)
      break;
    if(cc != 300){
    2698:	81 7d e8 2c 01 00 00 	cmpl   $0x12c,-0x18(%ebp)
    269f:	74 19                	je     26ba <bigfile+0x194>
      printf(1, "short read bigfile\n");
    26a1:	c7 44 24 04 af 52 00 	movl   $0x52af,0x4(%esp)
    26a8:	00 
    26a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26b0:	e8 0b 17 00 00       	call   3dc0 <printf>
      exit();
    26b5:	e8 5e 15 00 00       	call   3c18 <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    26ba:	0f b6 05 e0 8b 00 00 	movzbl 0x8be0,%eax
    26c1:	0f be d0             	movsbl %al,%edx
    26c4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26c7:	89 c1                	mov    %eax,%ecx
    26c9:	c1 e9 1f             	shr    $0x1f,%ecx
    26cc:	01 c8                	add    %ecx,%eax
    26ce:	d1 f8                	sar    %eax
    26d0:	39 c2                	cmp    %eax,%edx
    26d2:	75 1a                	jne    26ee <bigfile+0x1c8>
    26d4:	0f b6 05 0b 8d 00 00 	movzbl 0x8d0b,%eax
    26db:	0f be d0             	movsbl %al,%edx
    26de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    26e1:	89 c1                	mov    %eax,%ecx
    26e3:	c1 e9 1f             	shr    $0x1f,%ecx
    26e6:	01 c8                	add    %ecx,%eax
    26e8:	d1 f8                	sar    %eax
    26ea:	39 c2                	cmp    %eax,%edx
    26ec:	74 19                	je     2707 <bigfile+0x1e1>
      printf(1, "read bigfile wrong data\n");
    26ee:	c7 44 24 04 c3 52 00 	movl   $0x52c3,0x4(%esp)
    26f5:	00 
    26f6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26fd:	e8 be 16 00 00       	call   3dc0 <printf>
      exit();
    2702:	e8 11 15 00 00       	call   3c18 <exit>
    }
    total += cc;
    2707:	8b 45 e8             	mov    -0x18(%ebp),%eax
    270a:	01 45 f0             	add    %eax,-0x10(%ebp)
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit();
  }
  total = 0;
  for(i = 0; ; i++){
    270d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
      exit();
    }
    total += cc;
  }
    2711:	e9 24 ff ff ff       	jmp    263a <bigfile+0x114>
  close(fd);
  if(total != 20*600){
    printf(1, "read bigfile wrong total\n");
    2716:	c7 44 24 04 dc 52 00 	movl   $0x52dc,0x4(%esp)
    271d:	00 
    271e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2725:	e8 96 16 00 00       	call   3dc0 <printf>
    exit();
    272a:	e8 e9 14 00 00       	call   3c18 <exit>
  }
  unlink("bigfile");
    272f:	c7 04 24 51 52 00 00 	movl   $0x5251,(%esp)
    2736:	e8 2d 15 00 00       	call   3c68 <unlink>

  printf(1, "bigfile test ok\n");
    273b:	c7 44 24 04 f6 52 00 	movl   $0x52f6,0x4(%esp)
    2742:	00 
    2743:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    274a:	e8 71 16 00 00       	call   3dc0 <printf>
}
    274f:	c9                   	leave  
    2750:	c3                   	ret    

00002751 <fourteen>:

void
fourteen(void)
{
    2751:	55                   	push   %ebp
    2752:	89 e5                	mov    %esp,%ebp
    2754:	83 ec 28             	sub    $0x28,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2757:	c7 44 24 04 07 53 00 	movl   $0x5307,0x4(%esp)
    275e:	00 
    275f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2766:	e8 55 16 00 00       	call   3dc0 <printf>

  if(mkdir("12345678901234") != 0){
    276b:	c7 04 24 16 53 00 00 	movl   $0x5316,(%esp)
    2772:	e8 09 15 00 00       	call   3c80 <mkdir>
    2777:	85 c0                	test   %eax,%eax
    2779:	74 19                	je     2794 <fourteen+0x43>
    printf(1, "mkdir 12345678901234 failed\n");
    277b:	c7 44 24 04 25 53 00 	movl   $0x5325,0x4(%esp)
    2782:	00 
    2783:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    278a:	e8 31 16 00 00       	call   3dc0 <printf>
    exit();
    278f:	e8 84 14 00 00       	call   3c18 <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2794:	c7 04 24 44 53 00 00 	movl   $0x5344,(%esp)
    279b:	e8 e0 14 00 00       	call   3c80 <mkdir>
    27a0:	85 c0                	test   %eax,%eax
    27a2:	74 19                	je     27bd <fourteen+0x6c>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    27a4:	c7 44 24 04 64 53 00 	movl   $0x5364,0x4(%esp)
    27ab:	00 
    27ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    27b3:	e8 08 16 00 00       	call   3dc0 <printf>
    exit();
    27b8:	e8 5b 14 00 00       	call   3c18 <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    27bd:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    27c4:	00 
    27c5:	c7 04 24 94 53 00 00 	movl   $0x5394,(%esp)
    27cc:	e8 87 14 00 00       	call   3c58 <open>
    27d1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    27d4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    27d8:	79 19                	jns    27f3 <fourteen+0xa2>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    27da:	c7 44 24 04 c4 53 00 	movl   $0x53c4,0x4(%esp)
    27e1:	00 
    27e2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    27e9:	e8 d2 15 00 00       	call   3dc0 <printf>
    exit();
    27ee:	e8 25 14 00 00       	call   3c18 <exit>
  }
  close(fd);
    27f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    27f6:	89 04 24             	mov    %eax,(%esp)
    27f9:	e8 42 14 00 00       	call   3c40 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    27fe:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2805:	00 
    2806:	c7 04 24 04 54 00 00 	movl   $0x5404,(%esp)
    280d:	e8 46 14 00 00       	call   3c58 <open>
    2812:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2815:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2819:	79 19                	jns    2834 <fourteen+0xe3>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    281b:	c7 44 24 04 34 54 00 	movl   $0x5434,0x4(%esp)
    2822:	00 
    2823:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    282a:	e8 91 15 00 00       	call   3dc0 <printf>
    exit();
    282f:	e8 e4 13 00 00       	call   3c18 <exit>
  }
  close(fd);
    2834:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2837:	89 04 24             	mov    %eax,(%esp)
    283a:	e8 01 14 00 00       	call   3c40 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    283f:	c7 04 24 6e 54 00 00 	movl   $0x546e,(%esp)
    2846:	e8 35 14 00 00       	call   3c80 <mkdir>
    284b:	85 c0                	test   %eax,%eax
    284d:	75 19                	jne    2868 <fourteen+0x117>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    284f:	c7 44 24 04 8c 54 00 	movl   $0x548c,0x4(%esp)
    2856:	00 
    2857:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    285e:	e8 5d 15 00 00       	call   3dc0 <printf>
    exit();
    2863:	e8 b0 13 00 00       	call   3c18 <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2868:	c7 04 24 bc 54 00 00 	movl   $0x54bc,(%esp)
    286f:	e8 0c 14 00 00       	call   3c80 <mkdir>
    2874:	85 c0                	test   %eax,%eax
    2876:	75 19                	jne    2891 <fourteen+0x140>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2878:	c7 44 24 04 dc 54 00 	movl   $0x54dc,0x4(%esp)
    287f:	00 
    2880:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2887:	e8 34 15 00 00       	call   3dc0 <printf>
    exit();
    288c:	e8 87 13 00 00       	call   3c18 <exit>
  }

  printf(1, "fourteen ok\n");
    2891:	c7 44 24 04 0d 55 00 	movl   $0x550d,0x4(%esp)
    2898:	00 
    2899:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28a0:	e8 1b 15 00 00       	call   3dc0 <printf>
}
    28a5:	c9                   	leave  
    28a6:	c3                   	ret    

000028a7 <rmdot>:

void
rmdot(void)
{
    28a7:	55                   	push   %ebp
    28a8:	89 e5                	mov    %esp,%ebp
    28aa:	83 ec 18             	sub    $0x18,%esp
  printf(1, "rmdot test\n");
    28ad:	c7 44 24 04 1a 55 00 	movl   $0x551a,0x4(%esp)
    28b4:	00 
    28b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28bc:	e8 ff 14 00 00       	call   3dc0 <printf>
  if(mkdir("dots") != 0){
    28c1:	c7 04 24 26 55 00 00 	movl   $0x5526,(%esp)
    28c8:	e8 b3 13 00 00       	call   3c80 <mkdir>
    28cd:	85 c0                	test   %eax,%eax
    28cf:	74 19                	je     28ea <rmdot+0x43>
    printf(1, "mkdir dots failed\n");
    28d1:	c7 44 24 04 2b 55 00 	movl   $0x552b,0x4(%esp)
    28d8:	00 
    28d9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28e0:	e8 db 14 00 00       	call   3dc0 <printf>
    exit();
    28e5:	e8 2e 13 00 00       	call   3c18 <exit>
  }
  if(chdir("dots") != 0){
    28ea:	c7 04 24 26 55 00 00 	movl   $0x5526,(%esp)
    28f1:	e8 92 13 00 00       	call   3c88 <chdir>
    28f6:	85 c0                	test   %eax,%eax
    28f8:	74 19                	je     2913 <rmdot+0x6c>
    printf(1, "chdir dots failed\n");
    28fa:	c7 44 24 04 3e 55 00 	movl   $0x553e,0x4(%esp)
    2901:	00 
    2902:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2909:	e8 b2 14 00 00       	call   3dc0 <printf>
    exit();
    290e:	e8 05 13 00 00       	call   3c18 <exit>
  }
  if(unlink(".") == 0){
    2913:	c7 04 24 57 4c 00 00 	movl   $0x4c57,(%esp)
    291a:	e8 49 13 00 00       	call   3c68 <unlink>
    291f:	85 c0                	test   %eax,%eax
    2921:	75 19                	jne    293c <rmdot+0x95>
    printf(1, "rm . worked!\n");
    2923:	c7 44 24 04 51 55 00 	movl   $0x5551,0x4(%esp)
    292a:	00 
    292b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2932:	e8 89 14 00 00       	call   3dc0 <printf>
    exit();
    2937:	e8 dc 12 00 00       	call   3c18 <exit>
  }
  if(unlink("..") == 0){
    293c:	c7 04 24 e4 47 00 00 	movl   $0x47e4,(%esp)
    2943:	e8 20 13 00 00       	call   3c68 <unlink>
    2948:	85 c0                	test   %eax,%eax
    294a:	75 19                	jne    2965 <rmdot+0xbe>
    printf(1, "rm .. worked!\n");
    294c:	c7 44 24 04 5f 55 00 	movl   $0x555f,0x4(%esp)
    2953:	00 
    2954:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    295b:	e8 60 14 00 00       	call   3dc0 <printf>
    exit();
    2960:	e8 b3 12 00 00       	call   3c18 <exit>
  }
  if(chdir("/") != 0){
    2965:	c7 04 24 6e 55 00 00 	movl   $0x556e,(%esp)
    296c:	e8 17 13 00 00       	call   3c88 <chdir>
    2971:	85 c0                	test   %eax,%eax
    2973:	74 19                	je     298e <rmdot+0xe7>
    printf(1, "chdir / failed\n");
    2975:	c7 44 24 04 70 55 00 	movl   $0x5570,0x4(%esp)
    297c:	00 
    297d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2984:	e8 37 14 00 00       	call   3dc0 <printf>
    exit();
    2989:	e8 8a 12 00 00       	call   3c18 <exit>
  }
  if(unlink("dots/.") == 0){
    298e:	c7 04 24 80 55 00 00 	movl   $0x5580,(%esp)
    2995:	e8 ce 12 00 00       	call   3c68 <unlink>
    299a:	85 c0                	test   %eax,%eax
    299c:	75 19                	jne    29b7 <rmdot+0x110>
    printf(1, "unlink dots/. worked!\n");
    299e:	c7 44 24 04 87 55 00 	movl   $0x5587,0x4(%esp)
    29a5:	00 
    29a6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29ad:	e8 0e 14 00 00       	call   3dc0 <printf>
    exit();
    29b2:	e8 61 12 00 00       	call   3c18 <exit>
  }
  if(unlink("dots/..") == 0){
    29b7:	c7 04 24 9e 55 00 00 	movl   $0x559e,(%esp)
    29be:	e8 a5 12 00 00       	call   3c68 <unlink>
    29c3:	85 c0                	test   %eax,%eax
    29c5:	75 19                	jne    29e0 <rmdot+0x139>
    printf(1, "unlink dots/.. worked!\n");
    29c7:	c7 44 24 04 a6 55 00 	movl   $0x55a6,0x4(%esp)
    29ce:	00 
    29cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29d6:	e8 e5 13 00 00       	call   3dc0 <printf>
    exit();
    29db:	e8 38 12 00 00       	call   3c18 <exit>
  }
  if(unlink("dots") != 0){
    29e0:	c7 04 24 26 55 00 00 	movl   $0x5526,(%esp)
    29e7:	e8 7c 12 00 00       	call   3c68 <unlink>
    29ec:	85 c0                	test   %eax,%eax
    29ee:	74 19                	je     2a09 <rmdot+0x162>
    printf(1, "unlink dots failed!\n");
    29f0:	c7 44 24 04 be 55 00 	movl   $0x55be,0x4(%esp)
    29f7:	00 
    29f8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29ff:	e8 bc 13 00 00       	call   3dc0 <printf>
    exit();
    2a04:	e8 0f 12 00 00       	call   3c18 <exit>
  }
  printf(1, "rmdot ok\n");
    2a09:	c7 44 24 04 d3 55 00 	movl   $0x55d3,0x4(%esp)
    2a10:	00 
    2a11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a18:	e8 a3 13 00 00       	call   3dc0 <printf>
}
    2a1d:	c9                   	leave  
    2a1e:	c3                   	ret    

00002a1f <dirfile>:

void
dirfile(void)
{
    2a1f:	55                   	push   %ebp
    2a20:	89 e5                	mov    %esp,%ebp
    2a22:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "dir vs file\n");
    2a25:	c7 44 24 04 dd 55 00 	movl   $0x55dd,0x4(%esp)
    2a2c:	00 
    2a2d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a34:	e8 87 13 00 00       	call   3dc0 <printf>

  fd = open("dirfile", O_CREATE);
    2a39:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2a40:	00 
    2a41:	c7 04 24 ea 55 00 00 	movl   $0x55ea,(%esp)
    2a48:	e8 0b 12 00 00       	call   3c58 <open>
    2a4d:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2a50:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2a54:	79 19                	jns    2a6f <dirfile+0x50>
    printf(1, "create dirfile failed\n");
    2a56:	c7 44 24 04 f2 55 00 	movl   $0x55f2,0x4(%esp)
    2a5d:	00 
    2a5e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a65:	e8 56 13 00 00       	call   3dc0 <printf>
    exit();
    2a6a:	e8 a9 11 00 00       	call   3c18 <exit>
  }
  close(fd);
    2a6f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a72:	89 04 24             	mov    %eax,(%esp)
    2a75:	e8 c6 11 00 00       	call   3c40 <close>
  if(chdir("dirfile") == 0){
    2a7a:	c7 04 24 ea 55 00 00 	movl   $0x55ea,(%esp)
    2a81:	e8 02 12 00 00       	call   3c88 <chdir>
    2a86:	85 c0                	test   %eax,%eax
    2a88:	75 19                	jne    2aa3 <dirfile+0x84>
    printf(1, "chdir dirfile succeeded!\n");
    2a8a:	c7 44 24 04 09 56 00 	movl   $0x5609,0x4(%esp)
    2a91:	00 
    2a92:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a99:	e8 22 13 00 00       	call   3dc0 <printf>
    exit();
    2a9e:	e8 75 11 00 00       	call   3c18 <exit>
  }
  fd = open("dirfile/xx", 0);
    2aa3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2aaa:	00 
    2aab:	c7 04 24 23 56 00 00 	movl   $0x5623,(%esp)
    2ab2:	e8 a1 11 00 00       	call   3c58 <open>
    2ab7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2aba:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2abe:	78 19                	js     2ad9 <dirfile+0xba>
    printf(1, "create dirfile/xx succeeded!\n");
    2ac0:	c7 44 24 04 2e 56 00 	movl   $0x562e,0x4(%esp)
    2ac7:	00 
    2ac8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2acf:	e8 ec 12 00 00       	call   3dc0 <printf>
    exit();
    2ad4:	e8 3f 11 00 00       	call   3c18 <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    2ad9:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2ae0:	00 
    2ae1:	c7 04 24 23 56 00 00 	movl   $0x5623,(%esp)
    2ae8:	e8 6b 11 00 00       	call   3c58 <open>
    2aed:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2af0:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2af4:	78 19                	js     2b0f <dirfile+0xf0>
    printf(1, "create dirfile/xx succeeded!\n");
    2af6:	c7 44 24 04 2e 56 00 	movl   $0x562e,0x4(%esp)
    2afd:	00 
    2afe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b05:	e8 b6 12 00 00       	call   3dc0 <printf>
    exit();
    2b0a:	e8 09 11 00 00       	call   3c18 <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    2b0f:	c7 04 24 23 56 00 00 	movl   $0x5623,(%esp)
    2b16:	e8 65 11 00 00       	call   3c80 <mkdir>
    2b1b:	85 c0                	test   %eax,%eax
    2b1d:	75 19                	jne    2b38 <dirfile+0x119>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2b1f:	c7 44 24 04 4c 56 00 	movl   $0x564c,0x4(%esp)
    2b26:	00 
    2b27:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b2e:	e8 8d 12 00 00       	call   3dc0 <printf>
    exit();
    2b33:	e8 e0 10 00 00       	call   3c18 <exit>
  }
  if(unlink("dirfile/xx") == 0){
    2b38:	c7 04 24 23 56 00 00 	movl   $0x5623,(%esp)
    2b3f:	e8 24 11 00 00       	call   3c68 <unlink>
    2b44:	85 c0                	test   %eax,%eax
    2b46:	75 19                	jne    2b61 <dirfile+0x142>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2b48:	c7 44 24 04 69 56 00 	movl   $0x5669,0x4(%esp)
    2b4f:	00 
    2b50:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b57:	e8 64 12 00 00       	call   3dc0 <printf>
    exit();
    2b5c:	e8 b7 10 00 00       	call   3c18 <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    2b61:	c7 44 24 04 23 56 00 	movl   $0x5623,0x4(%esp)
    2b68:	00 
    2b69:	c7 04 24 87 56 00 00 	movl   $0x5687,(%esp)
    2b70:	e8 03 11 00 00       	call   3c78 <link>
    2b75:	85 c0                	test   %eax,%eax
    2b77:	75 19                	jne    2b92 <dirfile+0x173>
    printf(1, "link to dirfile/xx succeeded!\n");
    2b79:	c7 44 24 04 90 56 00 	movl   $0x5690,0x4(%esp)
    2b80:	00 
    2b81:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b88:	e8 33 12 00 00       	call   3dc0 <printf>
    exit();
    2b8d:	e8 86 10 00 00       	call   3c18 <exit>
  }
  if(unlink("dirfile") != 0){
    2b92:	c7 04 24 ea 55 00 00 	movl   $0x55ea,(%esp)
    2b99:	e8 ca 10 00 00       	call   3c68 <unlink>
    2b9e:	85 c0                	test   %eax,%eax
    2ba0:	74 19                	je     2bbb <dirfile+0x19c>
    printf(1, "unlink dirfile failed!\n");
    2ba2:	c7 44 24 04 af 56 00 	movl   $0x56af,0x4(%esp)
    2ba9:	00 
    2baa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bb1:	e8 0a 12 00 00       	call   3dc0 <printf>
    exit();
    2bb6:	e8 5d 10 00 00       	call   3c18 <exit>
  }

  fd = open(".", O_RDWR);
    2bbb:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    2bc2:	00 
    2bc3:	c7 04 24 57 4c 00 00 	movl   $0x4c57,(%esp)
    2bca:	e8 89 10 00 00       	call   3c58 <open>
    2bcf:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2bd2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2bd6:	78 19                	js     2bf1 <dirfile+0x1d2>
    printf(1, "open . for writing succeeded!\n");
    2bd8:	c7 44 24 04 c8 56 00 	movl   $0x56c8,0x4(%esp)
    2bdf:	00 
    2be0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2be7:	e8 d4 11 00 00       	call   3dc0 <printf>
    exit();
    2bec:	e8 27 10 00 00       	call   3c18 <exit>
  }
  fd = open(".", 0);
    2bf1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2bf8:	00 
    2bf9:	c7 04 24 57 4c 00 00 	movl   $0x4c57,(%esp)
    2c00:	e8 53 10 00 00       	call   3c58 <open>
    2c05:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(write(fd, "x", 1) > 0){
    2c08:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    2c0f:	00 
    2c10:	c7 44 24 04 8e 48 00 	movl   $0x488e,0x4(%esp)
    2c17:	00 
    2c18:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c1b:	89 04 24             	mov    %eax,(%esp)
    2c1e:	e8 15 10 00 00       	call   3c38 <write>
    2c23:	85 c0                	test   %eax,%eax
    2c25:	7e 19                	jle    2c40 <dirfile+0x221>
    printf(1, "write . succeeded!\n");
    2c27:	c7 44 24 04 e7 56 00 	movl   $0x56e7,0x4(%esp)
    2c2e:	00 
    2c2f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c36:	e8 85 11 00 00       	call   3dc0 <printf>
    exit();
    2c3b:	e8 d8 0f 00 00       	call   3c18 <exit>
  }
  close(fd);
    2c40:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2c43:	89 04 24             	mov    %eax,(%esp)
    2c46:	e8 f5 0f 00 00       	call   3c40 <close>

  printf(1, "dir vs file OK\n");
    2c4b:	c7 44 24 04 fb 56 00 	movl   $0x56fb,0x4(%esp)
    2c52:	00 
    2c53:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c5a:	e8 61 11 00 00       	call   3dc0 <printf>
}
    2c5f:	c9                   	leave  
    2c60:	c3                   	ret    

00002c61 <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    2c61:	55                   	push   %ebp
    2c62:	89 e5                	mov    %esp,%ebp
    2c64:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(1, "empty file name\n");
    2c67:	c7 44 24 04 0b 57 00 	movl   $0x570b,0x4(%esp)
    2c6e:	00 
    2c6f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c76:	e8 45 11 00 00       	call   3dc0 <printf>

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2c7b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2c82:	e9 d2 00 00 00       	jmp    2d59 <iref+0xf8>
    if(mkdir("irefd") != 0){
    2c87:	c7 04 24 1c 57 00 00 	movl   $0x571c,(%esp)
    2c8e:	e8 ed 0f 00 00       	call   3c80 <mkdir>
    2c93:	85 c0                	test   %eax,%eax
    2c95:	74 19                	je     2cb0 <iref+0x4f>
      printf(1, "mkdir irefd failed\n");
    2c97:	c7 44 24 04 22 57 00 	movl   $0x5722,0x4(%esp)
    2c9e:	00 
    2c9f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ca6:	e8 15 11 00 00       	call   3dc0 <printf>
      exit();
    2cab:	e8 68 0f 00 00       	call   3c18 <exit>
    }
    if(chdir("irefd") != 0){
    2cb0:	c7 04 24 1c 57 00 00 	movl   $0x571c,(%esp)
    2cb7:	e8 cc 0f 00 00       	call   3c88 <chdir>
    2cbc:	85 c0                	test   %eax,%eax
    2cbe:	74 19                	je     2cd9 <iref+0x78>
      printf(1, "chdir irefd failed\n");
    2cc0:	c7 44 24 04 36 57 00 	movl   $0x5736,0x4(%esp)
    2cc7:	00 
    2cc8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ccf:	e8 ec 10 00 00       	call   3dc0 <printf>
      exit();
    2cd4:	e8 3f 0f 00 00       	call   3c18 <exit>
    }

    mkdir("");
    2cd9:	c7 04 24 4a 57 00 00 	movl   $0x574a,(%esp)
    2ce0:	e8 9b 0f 00 00       	call   3c80 <mkdir>
    link("README", "");
    2ce5:	c7 44 24 04 4a 57 00 	movl   $0x574a,0x4(%esp)
    2cec:	00 
    2ced:	c7 04 24 87 56 00 00 	movl   $0x5687,(%esp)
    2cf4:	e8 7f 0f 00 00       	call   3c78 <link>
    fd = open("", O_CREATE);
    2cf9:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2d00:	00 
    2d01:	c7 04 24 4a 57 00 00 	movl   $0x574a,(%esp)
    2d08:	e8 4b 0f 00 00       	call   3c58 <open>
    2d0d:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2d10:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2d14:	78 0b                	js     2d21 <iref+0xc0>
      close(fd);
    2d16:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d19:	89 04 24             	mov    %eax,(%esp)
    2d1c:	e8 1f 0f 00 00       	call   3c40 <close>
    fd = open("xx", O_CREATE);
    2d21:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2d28:	00 
    2d29:	c7 04 24 4b 57 00 00 	movl   $0x574b,(%esp)
    2d30:	e8 23 0f 00 00       	call   3c58 <open>
    2d35:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(fd >= 0)
    2d38:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2d3c:	78 0b                	js     2d49 <iref+0xe8>
      close(fd);
    2d3e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2d41:	89 04 24             	mov    %eax,(%esp)
    2d44:	e8 f7 0e 00 00       	call   3c40 <close>
    unlink("xx");
    2d49:	c7 04 24 4b 57 00 00 	movl   $0x574b,(%esp)
    2d50:	e8 13 0f 00 00       	call   3c68 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    2d55:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2d59:	83 7d f4 32          	cmpl   $0x32,-0xc(%ebp)
    2d5d:	0f 8e 24 ff ff ff    	jle    2c87 <iref+0x26>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    2d63:	c7 04 24 6e 55 00 00 	movl   $0x556e,(%esp)
    2d6a:	e8 19 0f 00 00       	call   3c88 <chdir>
  printf(1, "empty file name OK\n");
    2d6f:	c7 44 24 04 4e 57 00 	movl   $0x574e,0x4(%esp)
    2d76:	00 
    2d77:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d7e:	e8 3d 10 00 00       	call   3dc0 <printf>
}
    2d83:	c9                   	leave  
    2d84:	c3                   	ret    

00002d85 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    2d85:	55                   	push   %ebp
    2d86:	89 e5                	mov    %esp,%ebp
    2d88:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
    2d8b:	c7 44 24 04 62 57 00 	movl   $0x5762,0x4(%esp)
    2d92:	00 
    2d93:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d9a:	e8 21 10 00 00       	call   3dc0 <printf>

  for(n=0; n<1000; n++){
    2d9f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    2da6:	eb 1f                	jmp    2dc7 <forktest+0x42>
    pid = fork();
    2da8:	e8 63 0e 00 00       	call   3c10 <fork>
    2dad:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(pid < 0)
    2db0:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2db4:	79 02                	jns    2db8 <forktest+0x33>
      break;
    2db6:	eb 18                	jmp    2dd0 <forktest+0x4b>
    if(pid == 0)
    2db8:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2dbc:	75 05                	jne    2dc3 <forktest+0x3e>
      exit();
    2dbe:	e8 55 0e 00 00       	call   3c18 <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    2dc3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    2dc7:	81 7d f4 e7 03 00 00 	cmpl   $0x3e7,-0xc(%ebp)
    2dce:	7e d8                	jle    2da8 <forktest+0x23>
      break;
    if(pid == 0)
      exit();
  }
  
  if(n == 1000){
    2dd0:	81 7d f4 e8 03 00 00 	cmpl   $0x3e8,-0xc(%ebp)
    2dd7:	75 19                	jne    2df2 <forktest+0x6d>
    printf(1, "fork claimed to work 1000 times!\n");
    2dd9:	c7 44 24 04 70 57 00 	movl   $0x5770,0x4(%esp)
    2de0:	00 
    2de1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2de8:	e8 d3 0f 00 00       	call   3dc0 <printf>
    exit();
    2ded:	e8 26 0e 00 00       	call   3c18 <exit>
  }
  
  for(; n > 0; n--){
    2df2:	eb 26                	jmp    2e1a <forktest+0x95>
    if(wait() < 0){
    2df4:	e8 27 0e 00 00       	call   3c20 <wait>
    2df9:	85 c0                	test   %eax,%eax
    2dfb:	79 19                	jns    2e16 <forktest+0x91>
      printf(1, "wait stopped early\n");
    2dfd:	c7 44 24 04 92 57 00 	movl   $0x5792,0x4(%esp)
    2e04:	00 
    2e05:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e0c:	e8 af 0f 00 00       	call   3dc0 <printf>
      exit();
    2e11:	e8 02 0e 00 00       	call   3c18 <exit>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit();
  }
  
  for(; n > 0; n--){
    2e16:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    2e1a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e1e:	7f d4                	jg     2df4 <forktest+0x6f>
      printf(1, "wait stopped early\n");
      exit();
    }
  }
  
  if(wait() != -1){
    2e20:	e8 fb 0d 00 00       	call   3c20 <wait>
    2e25:	83 f8 ff             	cmp    $0xffffffff,%eax
    2e28:	74 19                	je     2e43 <forktest+0xbe>
    printf(1, "wait got too many\n");
    2e2a:	c7 44 24 04 a6 57 00 	movl   $0x57a6,0x4(%esp)
    2e31:	00 
    2e32:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e39:	e8 82 0f 00 00       	call   3dc0 <printf>
    exit();
    2e3e:	e8 d5 0d 00 00       	call   3c18 <exit>
  }
  
  printf(1, "fork test OK\n");
    2e43:	c7 44 24 04 b9 57 00 	movl   $0x57b9,0x4(%esp)
    2e4a:	00 
    2e4b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e52:	e8 69 0f 00 00       	call   3dc0 <printf>
}
    2e57:	c9                   	leave  
    2e58:	c3                   	ret    

00002e59 <sbrktest>:

void
sbrktest(void)
{
    2e59:	55                   	push   %ebp
    2e5a:	89 e5                	mov    %esp,%ebp
    2e5c:	53                   	push   %ebx
    2e5d:	81 ec 84 00 00 00    	sub    $0x84,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    2e63:	a1 ec 63 00 00       	mov    0x63ec,%eax
    2e68:	c7 44 24 04 c7 57 00 	movl   $0x57c7,0x4(%esp)
    2e6f:	00 
    2e70:	89 04 24             	mov    %eax,(%esp)
    2e73:	e8 48 0f 00 00       	call   3dc0 <printf>
  oldbrk = sbrk(0);
    2e78:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e7f:	e8 1c 0e 00 00       	call   3ca0 <sbrk>
    2e84:	89 45 ec             	mov    %eax,-0x14(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    2e87:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e8e:	e8 0d 0e 00 00       	call   3ca0 <sbrk>
    2e93:	89 45 f4             	mov    %eax,-0xc(%ebp)
  int i;
  for(i = 0; i < 5000; i++){ 
    2e96:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    2e9d:	eb 59                	jmp    2ef8 <sbrktest+0x9f>
    b = sbrk(1);
    2e9f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ea6:	e8 f5 0d 00 00       	call   3ca0 <sbrk>
    2eab:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(b != a){
    2eae:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2eb1:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2eb4:	74 2f                	je     2ee5 <sbrktest+0x8c>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    2eb6:	a1 ec 63 00 00       	mov    0x63ec,%eax
    2ebb:	8b 55 e8             	mov    -0x18(%ebp),%edx
    2ebe:	89 54 24 10          	mov    %edx,0x10(%esp)
    2ec2:	8b 55 f4             	mov    -0xc(%ebp),%edx
    2ec5:	89 54 24 0c          	mov    %edx,0xc(%esp)
    2ec9:	8b 55 f0             	mov    -0x10(%ebp),%edx
    2ecc:	89 54 24 08          	mov    %edx,0x8(%esp)
    2ed0:	c7 44 24 04 d2 57 00 	movl   $0x57d2,0x4(%esp)
    2ed7:	00 
    2ed8:	89 04 24             	mov    %eax,(%esp)
    2edb:	e8 e0 0e 00 00       	call   3dc0 <printf>
      exit();
    2ee0:	e8 33 0d 00 00       	call   3c18 <exit>
    }
    *b = 1;
    2ee5:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2ee8:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    2eeb:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2eee:	83 c0 01             	add    $0x1,%eax
    2ef1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    2ef4:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2ef8:	81 7d f0 87 13 00 00 	cmpl   $0x1387,-0x10(%ebp)
    2eff:	7e 9e                	jle    2e9f <sbrktest+0x46>
      exit();
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    2f01:	e8 0a 0d 00 00       	call   3c10 <fork>
    2f06:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  if(pid < 0){
    2f09:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2f0d:	79 1a                	jns    2f29 <sbrktest+0xd0>
    printf(stdout, "sbrk test fork failed\n");
    2f0f:	a1 ec 63 00 00       	mov    0x63ec,%eax
    2f14:	c7 44 24 04 ed 57 00 	movl   $0x57ed,0x4(%esp)
    2f1b:	00 
    2f1c:	89 04 24             	mov    %eax,(%esp)
    2f1f:	e8 9c 0e 00 00       	call   3dc0 <printf>
    exit();
    2f24:	e8 ef 0c 00 00       	call   3c18 <exit>
  }
  c = sbrk(1);
    2f29:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f30:	e8 6b 0d 00 00       	call   3ca0 <sbrk>
    2f35:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c = sbrk(1);
    2f38:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f3f:	e8 5c 0d 00 00       	call   3ca0 <sbrk>
    2f44:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a + 1){
    2f47:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f4a:	83 c0 01             	add    $0x1,%eax
    2f4d:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    2f50:	74 1a                	je     2f6c <sbrktest+0x113>
    printf(stdout, "sbrk test failed post-fork\n");
    2f52:	a1 ec 63 00 00       	mov    0x63ec,%eax
    2f57:	c7 44 24 04 04 58 00 	movl   $0x5804,0x4(%esp)
    2f5e:	00 
    2f5f:	89 04 24             	mov    %eax,(%esp)
    2f62:	e8 59 0e 00 00       	call   3dc0 <printf>
    exit();
    2f67:	e8 ac 0c 00 00       	call   3c18 <exit>
  }
  if(pid == 0)
    2f6c:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    2f70:	75 05                	jne    2f77 <sbrktest+0x11e>
    exit();
    2f72:	e8 a1 0c 00 00       	call   3c18 <exit>
  wait();
    2f77:	e8 a4 0c 00 00       	call   3c20 <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    2f7c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f83:	e8 18 0d 00 00       	call   3ca0 <sbrk>
    2f88:	89 45 f4             	mov    %eax,-0xc(%ebp)
  amt = (BIG) - (uint)a;
    2f8b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2f8e:	ba 00 00 40 06       	mov    $0x6400000,%edx
    2f93:	29 c2                	sub    %eax,%edx
    2f95:	89 d0                	mov    %edx,%eax
    2f97:	89 45 dc             	mov    %eax,-0x24(%ebp)
  p = sbrk(amt);
    2f9a:	8b 45 dc             	mov    -0x24(%ebp),%eax
    2f9d:	89 04 24             	mov    %eax,(%esp)
    2fa0:	e8 fb 0c 00 00       	call   3ca0 <sbrk>
    2fa5:	89 45 d8             	mov    %eax,-0x28(%ebp)
  if (p != a) { 
    2fa8:	8b 45 d8             	mov    -0x28(%ebp),%eax
    2fab:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    2fae:	74 1a                	je     2fca <sbrktest+0x171>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    2fb0:	a1 ec 63 00 00       	mov    0x63ec,%eax
    2fb5:	c7 44 24 04 20 58 00 	movl   $0x5820,0x4(%esp)
    2fbc:	00 
    2fbd:	89 04 24             	mov    %eax,(%esp)
    2fc0:	e8 fb 0d 00 00       	call   3dc0 <printf>
    exit();
    2fc5:	e8 4e 0c 00 00       	call   3c18 <exit>
  }
  lastaddr = (char*) (BIG-1);
    2fca:	c7 45 d4 ff ff 3f 06 	movl   $0x63fffff,-0x2c(%ebp)
  *lastaddr = 99;
    2fd1:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    2fd4:	c6 00 63             	movb   $0x63,(%eax)

  // can one de-allocate?
  a = sbrk(0);
    2fd7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fde:	e8 bd 0c 00 00       	call   3ca0 <sbrk>
    2fe3:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-4096);
    2fe6:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    2fed:	e8 ae 0c 00 00       	call   3ca0 <sbrk>
    2ff2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c == (char*)0xffffffff){
    2ff5:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    2ff9:	75 1a                	jne    3015 <sbrktest+0x1bc>
    printf(stdout, "sbrk could not deallocate\n");
    2ffb:	a1 ec 63 00 00       	mov    0x63ec,%eax
    3000:	c7 44 24 04 5e 58 00 	movl   $0x585e,0x4(%esp)
    3007:	00 
    3008:	89 04 24             	mov    %eax,(%esp)
    300b:	e8 b0 0d 00 00       	call   3dc0 <printf>
    exit();
    3010:	e8 03 0c 00 00       	call   3c18 <exit>
  }
  c = sbrk(0);
    3015:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    301c:	e8 7f 0c 00 00       	call   3ca0 <sbrk>
    3021:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a - 4096){
    3024:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3027:	2d 00 10 00 00       	sub    $0x1000,%eax
    302c:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    302f:	74 28                	je     3059 <sbrktest+0x200>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    3031:	a1 ec 63 00 00       	mov    0x63ec,%eax
    3036:	8b 55 e0             	mov    -0x20(%ebp),%edx
    3039:	89 54 24 0c          	mov    %edx,0xc(%esp)
    303d:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3040:	89 54 24 08          	mov    %edx,0x8(%esp)
    3044:	c7 44 24 04 7c 58 00 	movl   $0x587c,0x4(%esp)
    304b:	00 
    304c:	89 04 24             	mov    %eax,(%esp)
    304f:	e8 6c 0d 00 00       	call   3dc0 <printf>
    exit();
    3054:	e8 bf 0b 00 00       	call   3c18 <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    3059:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3060:	e8 3b 0c 00 00       	call   3ca0 <sbrk>
    3065:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(4096);
    3068:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    306f:	e8 2c 0c 00 00       	call   3ca0 <sbrk>
    3074:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a || sbrk(0) != a + 4096){
    3077:	8b 45 e0             	mov    -0x20(%ebp),%eax
    307a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    307d:	75 19                	jne    3098 <sbrktest+0x23f>
    307f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3086:	e8 15 0c 00 00       	call   3ca0 <sbrk>
    308b:	8b 55 f4             	mov    -0xc(%ebp),%edx
    308e:	81 c2 00 10 00 00    	add    $0x1000,%edx
    3094:	39 d0                	cmp    %edx,%eax
    3096:	74 28                	je     30c0 <sbrktest+0x267>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    3098:	a1 ec 63 00 00       	mov    0x63ec,%eax
    309d:	8b 55 e0             	mov    -0x20(%ebp),%edx
    30a0:	89 54 24 0c          	mov    %edx,0xc(%esp)
    30a4:	8b 55 f4             	mov    -0xc(%ebp),%edx
    30a7:	89 54 24 08          	mov    %edx,0x8(%esp)
    30ab:	c7 44 24 04 b4 58 00 	movl   $0x58b4,0x4(%esp)
    30b2:	00 
    30b3:	89 04 24             	mov    %eax,(%esp)
    30b6:	e8 05 0d 00 00       	call   3dc0 <printf>
    exit();
    30bb:	e8 58 0b 00 00       	call   3c18 <exit>
  }
  if(*lastaddr == 99){
    30c0:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    30c3:	0f b6 00             	movzbl (%eax),%eax
    30c6:	3c 63                	cmp    $0x63,%al
    30c8:	75 1a                	jne    30e4 <sbrktest+0x28b>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    30ca:	a1 ec 63 00 00       	mov    0x63ec,%eax
    30cf:	c7 44 24 04 dc 58 00 	movl   $0x58dc,0x4(%esp)
    30d6:	00 
    30d7:	89 04 24             	mov    %eax,(%esp)
    30da:	e8 e1 0c 00 00       	call   3dc0 <printf>
    exit();
    30df:	e8 34 0b 00 00       	call   3c18 <exit>
  }

  a = sbrk(0);
    30e4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30eb:	e8 b0 0b 00 00       	call   3ca0 <sbrk>
    30f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  c = sbrk(-(sbrk(0) - oldbrk));
    30f3:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    30f6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30fd:	e8 9e 0b 00 00       	call   3ca0 <sbrk>
    3102:	29 c3                	sub    %eax,%ebx
    3104:	89 d8                	mov    %ebx,%eax
    3106:	89 04 24             	mov    %eax,(%esp)
    3109:	e8 92 0b 00 00       	call   3ca0 <sbrk>
    310e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a){
    3111:	8b 45 e0             	mov    -0x20(%ebp),%eax
    3114:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    3117:	74 28                	je     3141 <sbrktest+0x2e8>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    3119:	a1 ec 63 00 00       	mov    0x63ec,%eax
    311e:	8b 55 e0             	mov    -0x20(%ebp),%edx
    3121:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3125:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3128:	89 54 24 08          	mov    %edx,0x8(%esp)
    312c:	c7 44 24 04 0c 59 00 	movl   $0x590c,0x4(%esp)
    3133:	00 
    3134:	89 04 24             	mov    %eax,(%esp)
    3137:	e8 84 0c 00 00       	call   3dc0 <printf>
    exit();
    313c:	e8 d7 0a 00 00       	call   3c18 <exit>
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3141:	c7 45 f4 00 00 00 80 	movl   $0x80000000,-0xc(%ebp)
    3148:	eb 7b                	jmp    31c5 <sbrktest+0x36c>
    ppid = getpid();
    314a:	e8 49 0b 00 00       	call   3c98 <getpid>
    314f:	89 45 d0             	mov    %eax,-0x30(%ebp)
    pid = fork();
    3152:	e8 b9 0a 00 00       	call   3c10 <fork>
    3157:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(pid < 0){
    315a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    315e:	79 1a                	jns    317a <sbrktest+0x321>
      printf(stdout, "fork failed\n");
    3160:	a1 ec 63 00 00       	mov    0x63ec,%eax
    3165:	c7 44 24 04 d5 48 00 	movl   $0x48d5,0x4(%esp)
    316c:	00 
    316d:	89 04 24             	mov    %eax,(%esp)
    3170:	e8 4b 0c 00 00       	call   3dc0 <printf>
      exit();
    3175:	e8 9e 0a 00 00       	call   3c18 <exit>
    }
    if(pid == 0){
    317a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    317e:	75 39                	jne    31b9 <sbrktest+0x360>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3180:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3183:	0f b6 00             	movzbl (%eax),%eax
    3186:	0f be d0             	movsbl %al,%edx
    3189:	a1 ec 63 00 00       	mov    0x63ec,%eax
    318e:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3192:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3195:	89 54 24 08          	mov    %edx,0x8(%esp)
    3199:	c7 44 24 04 2d 59 00 	movl   $0x592d,0x4(%esp)
    31a0:	00 
    31a1:	89 04 24             	mov    %eax,(%esp)
    31a4:	e8 17 0c 00 00       	call   3dc0 <printf>
      kill(ppid);
    31a9:	8b 45 d0             	mov    -0x30(%ebp),%eax
    31ac:	89 04 24             	mov    %eax,(%esp)
    31af:	e8 94 0a 00 00       	call   3c48 <kill>
      exit();
    31b4:	e8 5f 0a 00 00       	call   3c18 <exit>
    }
    wait();
    31b9:	e8 62 0a 00 00       	call   3c20 <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit();
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    31be:	81 45 f4 50 c3 00 00 	addl   $0xc350,-0xc(%ebp)
    31c5:	81 7d f4 7f 84 1e 80 	cmpl   $0x801e847f,-0xc(%ebp)
    31cc:	0f 86 78 ff ff ff    	jbe    314a <sbrktest+0x2f1>
    wait();
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    31d2:	8d 45 c8             	lea    -0x38(%ebp),%eax
    31d5:	89 04 24             	mov    %eax,(%esp)
    31d8:	e8 4b 0a 00 00       	call   3c28 <pipe>
    31dd:	85 c0                	test   %eax,%eax
    31df:	74 19                	je     31fa <sbrktest+0x3a1>
    printf(1, "pipe() failed\n");
    31e1:	c7 44 24 04 29 48 00 	movl   $0x4829,0x4(%esp)
    31e8:	00 
    31e9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31f0:	e8 cb 0b 00 00       	call   3dc0 <printf>
    exit();
    31f5:	e8 1e 0a 00 00       	call   3c18 <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    31fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3201:	e9 87 00 00 00       	jmp    328d <sbrktest+0x434>
    if((pids[i] = fork()) == 0){
    3206:	e8 05 0a 00 00       	call   3c10 <fork>
    320b:	8b 55 f0             	mov    -0x10(%ebp),%edx
    320e:	89 44 95 a0          	mov    %eax,-0x60(%ebp,%edx,4)
    3212:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3215:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3219:	85 c0                	test   %eax,%eax
    321b:	75 46                	jne    3263 <sbrktest+0x40a>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    321d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3224:	e8 77 0a 00 00       	call   3ca0 <sbrk>
    3229:	ba 00 00 40 06       	mov    $0x6400000,%edx
    322e:	29 c2                	sub    %eax,%edx
    3230:	89 d0                	mov    %edx,%eax
    3232:	89 04 24             	mov    %eax,(%esp)
    3235:	e8 66 0a 00 00       	call   3ca0 <sbrk>
      write(fds[1], "x", 1);
    323a:	8b 45 cc             	mov    -0x34(%ebp),%eax
    323d:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3244:	00 
    3245:	c7 44 24 04 8e 48 00 	movl   $0x488e,0x4(%esp)
    324c:	00 
    324d:	89 04 24             	mov    %eax,(%esp)
    3250:	e8 e3 09 00 00       	call   3c38 <write>
      // sit around until killed
      for(;;) sleep(1000);
    3255:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
    325c:	e8 47 0a 00 00       	call   3ca8 <sleep>
    3261:	eb f2                	jmp    3255 <sbrktest+0x3fc>
    }
    if(pids[i] != -1)
    3263:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3266:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    326a:	83 f8 ff             	cmp    $0xffffffff,%eax
    326d:	74 1a                	je     3289 <sbrktest+0x430>
      read(fds[0], &scratch, 1);
    326f:	8b 45 c8             	mov    -0x38(%ebp),%eax
    3272:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3279:	00 
    327a:	8d 55 9f             	lea    -0x61(%ebp),%edx
    327d:	89 54 24 04          	mov    %edx,0x4(%esp)
    3281:	89 04 24             	mov    %eax,(%esp)
    3284:	e8 a7 09 00 00       	call   3c30 <read>
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit();
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3289:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    328d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3290:	83 f8 09             	cmp    $0x9,%eax
    3293:	0f 86 6d ff ff ff    	jbe    3206 <sbrktest+0x3ad>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    3299:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    32a0:	e8 fb 09 00 00       	call   3ca0 <sbrk>
    32a5:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    32a8:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    32af:	eb 26                	jmp    32d7 <sbrktest+0x47e>
    if(pids[i] == -1)
    32b1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32b4:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    32b8:	83 f8 ff             	cmp    $0xffffffff,%eax
    32bb:	75 02                	jne    32bf <sbrktest+0x466>
      continue;
    32bd:	eb 14                	jmp    32d3 <sbrktest+0x47a>
    kill(pids[i]);
    32bf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32c2:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    32c6:	89 04 24             	mov    %eax,(%esp)
    32c9:	e8 7a 09 00 00       	call   3c48 <kill>
    wait();
    32ce:	e8 4d 09 00 00       	call   3c20 <wait>
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    32d3:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    32d7:	8b 45 f0             	mov    -0x10(%ebp),%eax
    32da:	83 f8 09             	cmp    $0x9,%eax
    32dd:	76 d2                	jbe    32b1 <sbrktest+0x458>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait();
  }
  if(c == (char*)0xffffffff){
    32df:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    32e3:	75 1a                	jne    32ff <sbrktest+0x4a6>
    printf(stdout, "failed sbrk leaked memory\n");
    32e5:	a1 ec 63 00 00       	mov    0x63ec,%eax
    32ea:	c7 44 24 04 46 59 00 	movl   $0x5946,0x4(%esp)
    32f1:	00 
    32f2:	89 04 24             	mov    %eax,(%esp)
    32f5:	e8 c6 0a 00 00       	call   3dc0 <printf>
    exit();
    32fa:	e8 19 09 00 00       	call   3c18 <exit>
  }

  if(sbrk(0) > oldbrk)
    32ff:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3306:	e8 95 09 00 00       	call   3ca0 <sbrk>
    330b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    330e:	76 1b                	jbe    332b <sbrktest+0x4d2>
    sbrk(-(sbrk(0) - oldbrk));
    3310:	8b 5d ec             	mov    -0x14(%ebp),%ebx
    3313:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    331a:	e8 81 09 00 00       	call   3ca0 <sbrk>
    331f:	29 c3                	sub    %eax,%ebx
    3321:	89 d8                	mov    %ebx,%eax
    3323:	89 04 24             	mov    %eax,(%esp)
    3326:	e8 75 09 00 00       	call   3ca0 <sbrk>

  printf(stdout, "sbrk test OK\n");
    332b:	a1 ec 63 00 00       	mov    0x63ec,%eax
    3330:	c7 44 24 04 61 59 00 	movl   $0x5961,0x4(%esp)
    3337:	00 
    3338:	89 04 24             	mov    %eax,(%esp)
    333b:	e8 80 0a 00 00       	call   3dc0 <printf>
}
    3340:	81 c4 84 00 00 00    	add    $0x84,%esp
    3346:	5b                   	pop    %ebx
    3347:	5d                   	pop    %ebp
    3348:	c3                   	ret    

00003349 <validateint>:

void
validateint(int *p)
{
    3349:	55                   	push   %ebp
    334a:	89 e5                	mov    %esp,%ebp
    334c:	53                   	push   %ebx
    334d:	83 ec 10             	sub    $0x10,%esp
  int res;
  asm("mov %%esp, %%ebx\n\t"
    3350:	b8 0d 00 00 00       	mov    $0xd,%eax
    3355:	8b 55 08             	mov    0x8(%ebp),%edx
    3358:	89 d1                	mov    %edx,%ecx
    335a:	89 e3                	mov    %esp,%ebx
    335c:	89 cc                	mov    %ecx,%esp
    335e:	cd 40                	int    $0x40
    3360:	89 dc                	mov    %ebx,%esp
    3362:	89 45 f8             	mov    %eax,-0x8(%ebp)
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    3365:	83 c4 10             	add    $0x10,%esp
    3368:	5b                   	pop    %ebx
    3369:	5d                   	pop    %ebp
    336a:	c3                   	ret    

0000336b <validatetest>:

void
validatetest(void)
{
    336b:	55                   	push   %ebp
    336c:	89 e5                	mov    %esp,%ebp
    336e:	83 ec 28             	sub    $0x28,%esp
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    3371:	a1 ec 63 00 00       	mov    0x63ec,%eax
    3376:	c7 44 24 04 6f 59 00 	movl   $0x596f,0x4(%esp)
    337d:	00 
    337e:	89 04 24             	mov    %eax,(%esp)
    3381:	e8 3a 0a 00 00       	call   3dc0 <printf>
  hi = 1100*1024;
    3386:	c7 45 f0 00 30 11 00 	movl   $0x113000,-0x10(%ebp)

  for(p = 0; p <= (uint)hi; p += 4096){
    338d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3394:	eb 7f                	jmp    3415 <validatetest+0xaa>
    if((pid = fork()) == 0){
    3396:	e8 75 08 00 00       	call   3c10 <fork>
    339b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    339e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    33a2:	75 10                	jne    33b4 <validatetest+0x49>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    33a4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33a7:	89 04 24             	mov    %eax,(%esp)
    33aa:	e8 9a ff ff ff       	call   3349 <validateint>
      exit();
    33af:	e8 64 08 00 00       	call   3c18 <exit>
    }
    sleep(0);
    33b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    33bb:	e8 e8 08 00 00       	call   3ca8 <sleep>
    sleep(0);
    33c0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    33c7:	e8 dc 08 00 00       	call   3ca8 <sleep>
    kill(pid);
    33cc:	8b 45 ec             	mov    -0x14(%ebp),%eax
    33cf:	89 04 24             	mov    %eax,(%esp)
    33d2:	e8 71 08 00 00       	call   3c48 <kill>
    wait();
    33d7:	e8 44 08 00 00       	call   3c20 <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    33dc:	8b 45 f4             	mov    -0xc(%ebp),%eax
    33df:	89 44 24 04          	mov    %eax,0x4(%esp)
    33e3:	c7 04 24 7e 59 00 00 	movl   $0x597e,(%esp)
    33ea:	e8 89 08 00 00       	call   3c78 <link>
    33ef:	83 f8 ff             	cmp    $0xffffffff,%eax
    33f2:	74 1a                	je     340e <validatetest+0xa3>
      printf(stdout, "link should not succeed\n");
    33f4:	a1 ec 63 00 00       	mov    0x63ec,%eax
    33f9:	c7 44 24 04 89 59 00 	movl   $0x5989,0x4(%esp)
    3400:	00 
    3401:	89 04 24             	mov    %eax,(%esp)
    3404:	e8 b7 09 00 00       	call   3dc0 <printf>
      exit();
    3409:	e8 0a 08 00 00       	call   3c18 <exit>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    340e:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    3415:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3418:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    341b:	0f 83 75 ff ff ff    	jae    3396 <validatetest+0x2b>
      printf(stdout, "link should not succeed\n");
      exit();
    }
  }

  printf(stdout, "validate ok\n");
    3421:	a1 ec 63 00 00       	mov    0x63ec,%eax
    3426:	c7 44 24 04 a2 59 00 	movl   $0x59a2,0x4(%esp)
    342d:	00 
    342e:	89 04 24             	mov    %eax,(%esp)
    3431:	e8 8a 09 00 00       	call   3dc0 <printf>
}
    3436:	c9                   	leave  
    3437:	c3                   	ret    

00003438 <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    3438:	55                   	push   %ebp
    3439:	89 e5                	mov    %esp,%ebp
    343b:	83 ec 28             	sub    $0x28,%esp
  int i;

  printf(stdout, "bss test\n");
    343e:	a1 ec 63 00 00       	mov    0x63ec,%eax
    3443:	c7 44 24 04 af 59 00 	movl   $0x59af,0x4(%esp)
    344a:	00 
    344b:	89 04 24             	mov    %eax,(%esp)
    344e:	e8 6d 09 00 00       	call   3dc0 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    3453:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    345a:	eb 2d                	jmp    3489 <bsstest+0x51>
    if(uninit[i] != '\0'){
    345c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    345f:	05 c0 64 00 00       	add    $0x64c0,%eax
    3464:	0f b6 00             	movzbl (%eax),%eax
    3467:	84 c0                	test   %al,%al
    3469:	74 1a                	je     3485 <bsstest+0x4d>
      printf(stdout, "bss test failed\n");
    346b:	a1 ec 63 00 00       	mov    0x63ec,%eax
    3470:	c7 44 24 04 b9 59 00 	movl   $0x59b9,0x4(%esp)
    3477:	00 
    3478:	89 04 24             	mov    %eax,(%esp)
    347b:	e8 40 09 00 00       	call   3dc0 <printf>
      exit();
    3480:	e8 93 07 00 00       	call   3c18 <exit>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    3485:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3489:	8b 45 f4             	mov    -0xc(%ebp),%eax
    348c:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    3491:	76 c9                	jbe    345c <bsstest+0x24>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit();
    }
  }
  printf(stdout, "bss test ok\n");
    3493:	a1 ec 63 00 00       	mov    0x63ec,%eax
    3498:	c7 44 24 04 ca 59 00 	movl   $0x59ca,0x4(%esp)
    349f:	00 
    34a0:	89 04 24             	mov    %eax,(%esp)
    34a3:	e8 18 09 00 00       	call   3dc0 <printf>
}
    34a8:	c9                   	leave  
    34a9:	c3                   	ret    

000034aa <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    34aa:	55                   	push   %ebp
    34ab:	89 e5                	mov    %esp,%ebp
    34ad:	83 ec 28             	sub    $0x28,%esp
  int pid, fd;

  unlink("bigarg-ok");
    34b0:	c7 04 24 d7 59 00 00 	movl   $0x59d7,(%esp)
    34b7:	e8 ac 07 00 00       	call   3c68 <unlink>
  pid = fork();
    34bc:	e8 4f 07 00 00       	call   3c10 <fork>
    34c1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid == 0){
    34c4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    34c8:	0f 85 90 00 00 00    	jne    355e <bigargtest+0xb4>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    34ce:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    34d5:	eb 12                	jmp    34e9 <bigargtest+0x3f>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    34d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    34da:	c7 04 85 20 64 00 00 	movl   $0x59e4,0x6420(,%eax,4)
    34e1:	e4 59 00 00 
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    34e5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    34e9:	83 7d f4 1e          	cmpl   $0x1e,-0xc(%ebp)
    34ed:	7e e8                	jle    34d7 <bigargtest+0x2d>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    34ef:	c7 05 9c 64 00 00 00 	movl   $0x0,0x649c
    34f6:	00 00 00 
    printf(stdout, "bigarg test\n");
    34f9:	a1 ec 63 00 00       	mov    0x63ec,%eax
    34fe:	c7 44 24 04 c1 5a 00 	movl   $0x5ac1,0x4(%esp)
    3505:	00 
    3506:	89 04 24             	mov    %eax,(%esp)
    3509:	e8 b2 08 00 00       	call   3dc0 <printf>
    exec("echo", args);
    350e:	c7 44 24 04 20 64 00 	movl   $0x6420,0x4(%esp)
    3515:	00 
    3516:	c7 04 24 e8 44 00 00 	movl   $0x44e8,(%esp)
    351d:	e8 2e 07 00 00       	call   3c50 <exec>
    printf(stdout, "bigarg test ok\n");
    3522:	a1 ec 63 00 00       	mov    0x63ec,%eax
    3527:	c7 44 24 04 ce 5a 00 	movl   $0x5ace,0x4(%esp)
    352e:	00 
    352f:	89 04 24             	mov    %eax,(%esp)
    3532:	e8 89 08 00 00       	call   3dc0 <printf>
    fd = open("bigarg-ok", O_CREATE);
    3537:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    353e:	00 
    353f:	c7 04 24 d7 59 00 00 	movl   $0x59d7,(%esp)
    3546:	e8 0d 07 00 00       	call   3c58 <open>
    354b:	89 45 ec             	mov    %eax,-0x14(%ebp)
    close(fd);
    354e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3551:	89 04 24             	mov    %eax,(%esp)
    3554:	e8 e7 06 00 00       	call   3c40 <close>
    exit();
    3559:	e8 ba 06 00 00       	call   3c18 <exit>
  } else if(pid < 0){
    355e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3562:	79 1a                	jns    357e <bigargtest+0xd4>
    printf(stdout, "bigargtest: fork failed\n");
    3564:	a1 ec 63 00 00       	mov    0x63ec,%eax
    3569:	c7 44 24 04 de 5a 00 	movl   $0x5ade,0x4(%esp)
    3570:	00 
    3571:	89 04 24             	mov    %eax,(%esp)
    3574:	e8 47 08 00 00       	call   3dc0 <printf>
    exit();
    3579:	e8 9a 06 00 00       	call   3c18 <exit>
  }
  wait();
    357e:	e8 9d 06 00 00       	call   3c20 <wait>
  fd = open("bigarg-ok", 0);
    3583:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    358a:	00 
    358b:	c7 04 24 d7 59 00 00 	movl   $0x59d7,(%esp)
    3592:	e8 c1 06 00 00       	call   3c58 <open>
    3597:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(fd < 0){
    359a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    359e:	79 1a                	jns    35ba <bigargtest+0x110>
    printf(stdout, "bigarg test failed!\n");
    35a0:	a1 ec 63 00 00       	mov    0x63ec,%eax
    35a5:	c7 44 24 04 f7 5a 00 	movl   $0x5af7,0x4(%esp)
    35ac:	00 
    35ad:	89 04 24             	mov    %eax,(%esp)
    35b0:	e8 0b 08 00 00       	call   3dc0 <printf>
    exit();
    35b5:	e8 5e 06 00 00       	call   3c18 <exit>
  }
  close(fd);
    35ba:	8b 45 ec             	mov    -0x14(%ebp),%eax
    35bd:	89 04 24             	mov    %eax,(%esp)
    35c0:	e8 7b 06 00 00       	call   3c40 <close>
  unlink("bigarg-ok");
    35c5:	c7 04 24 d7 59 00 00 	movl   $0x59d7,(%esp)
    35cc:	e8 97 06 00 00       	call   3c68 <unlink>
}
    35d1:	c9                   	leave  
    35d2:	c3                   	ret    

000035d3 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    35d3:	55                   	push   %ebp
    35d4:	89 e5                	mov    %esp,%ebp
    35d6:	53                   	push   %ebx
    35d7:	83 ec 74             	sub    $0x74,%esp
  int nfiles;
  int fsblocks = 0;
    35da:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)

  printf(1, "fsfull test\n");
    35e1:	c7 44 24 04 0c 5b 00 	movl   $0x5b0c,0x4(%esp)
    35e8:	00 
    35e9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    35f0:	e8 cb 07 00 00       	call   3dc0 <printf>

  for(nfiles = 0; ; nfiles++){
    35f5:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    char name[64];
    name[0] = 'f';
    35fc:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3600:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3603:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3608:	89 c8                	mov    %ecx,%eax
    360a:	f7 ea                	imul   %edx
    360c:	c1 fa 06             	sar    $0x6,%edx
    360f:	89 c8                	mov    %ecx,%eax
    3611:	c1 f8 1f             	sar    $0x1f,%eax
    3614:	29 c2                	sub    %eax,%edx
    3616:	89 d0                	mov    %edx,%eax
    3618:	83 c0 30             	add    $0x30,%eax
    361b:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    361e:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    3621:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3626:	89 d8                	mov    %ebx,%eax
    3628:	f7 ea                	imul   %edx
    362a:	c1 fa 06             	sar    $0x6,%edx
    362d:	89 d8                	mov    %ebx,%eax
    362f:	c1 f8 1f             	sar    $0x1f,%eax
    3632:	89 d1                	mov    %edx,%ecx
    3634:	29 c1                	sub    %eax,%ecx
    3636:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    363c:	29 c3                	sub    %eax,%ebx
    363e:	89 d9                	mov    %ebx,%ecx
    3640:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3645:	89 c8                	mov    %ecx,%eax
    3647:	f7 ea                	imul   %edx
    3649:	c1 fa 05             	sar    $0x5,%edx
    364c:	89 c8                	mov    %ecx,%eax
    364e:	c1 f8 1f             	sar    $0x1f,%eax
    3651:	29 c2                	sub    %eax,%edx
    3653:	89 d0                	mov    %edx,%eax
    3655:	83 c0 30             	add    $0x30,%eax
    3658:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    365b:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    365e:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3663:	89 d8                	mov    %ebx,%eax
    3665:	f7 ea                	imul   %edx
    3667:	c1 fa 05             	sar    $0x5,%edx
    366a:	89 d8                	mov    %ebx,%eax
    366c:	c1 f8 1f             	sar    $0x1f,%eax
    366f:	89 d1                	mov    %edx,%ecx
    3671:	29 c1                	sub    %eax,%ecx
    3673:	6b c1 64             	imul   $0x64,%ecx,%eax
    3676:	29 c3                	sub    %eax,%ebx
    3678:	89 d9                	mov    %ebx,%ecx
    367a:	ba 67 66 66 66       	mov    $0x66666667,%edx
    367f:	89 c8                	mov    %ecx,%eax
    3681:	f7 ea                	imul   %edx
    3683:	c1 fa 02             	sar    $0x2,%edx
    3686:	89 c8                	mov    %ecx,%eax
    3688:	c1 f8 1f             	sar    $0x1f,%eax
    368b:	29 c2                	sub    %eax,%edx
    368d:	89 d0                	mov    %edx,%eax
    368f:	83 c0 30             	add    $0x30,%eax
    3692:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3695:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3698:	ba 67 66 66 66       	mov    $0x66666667,%edx
    369d:	89 c8                	mov    %ecx,%eax
    369f:	f7 ea                	imul   %edx
    36a1:	c1 fa 02             	sar    $0x2,%edx
    36a4:	89 c8                	mov    %ecx,%eax
    36a6:	c1 f8 1f             	sar    $0x1f,%eax
    36a9:	29 c2                	sub    %eax,%edx
    36ab:	89 d0                	mov    %edx,%eax
    36ad:	c1 e0 02             	shl    $0x2,%eax
    36b0:	01 d0                	add    %edx,%eax
    36b2:	01 c0                	add    %eax,%eax
    36b4:	29 c1                	sub    %eax,%ecx
    36b6:	89 ca                	mov    %ecx,%edx
    36b8:	89 d0                	mov    %edx,%eax
    36ba:	83 c0 30             	add    $0x30,%eax
    36bd:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    36c0:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    printf(1, "writing %s\n", name);
    36c4:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    36c7:	89 44 24 08          	mov    %eax,0x8(%esp)
    36cb:	c7 44 24 04 19 5b 00 	movl   $0x5b19,0x4(%esp)
    36d2:	00 
    36d3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    36da:	e8 e1 06 00 00       	call   3dc0 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    36df:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    36e6:	00 
    36e7:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    36ea:	89 04 24             	mov    %eax,(%esp)
    36ed:	e8 66 05 00 00       	call   3c58 <open>
    36f2:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fd < 0){
    36f5:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    36f9:	79 1d                	jns    3718 <fsfull+0x145>
      printf(1, "open %s failed\n", name);
    36fb:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    36fe:	89 44 24 08          	mov    %eax,0x8(%esp)
    3702:	c7 44 24 04 25 5b 00 	movl   $0x5b25,0x4(%esp)
    3709:	00 
    370a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3711:	e8 aa 06 00 00       	call   3dc0 <printf>
      break;
    3716:	eb 74                	jmp    378c <fsfull+0x1b9>
    }
    int total = 0;
    3718:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    while(1){
      int cc = write(fd, buf, 512);
    371f:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    3726:	00 
    3727:	c7 44 24 04 e0 8b 00 	movl   $0x8be0,0x4(%esp)
    372e:	00 
    372f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3732:	89 04 24             	mov    %eax,(%esp)
    3735:	e8 fe 04 00 00       	call   3c38 <write>
    373a:	89 45 e4             	mov    %eax,-0x1c(%ebp)
      if(cc < 512)
    373d:	81 7d e4 ff 01 00 00 	cmpl   $0x1ff,-0x1c(%ebp)
    3744:	7f 2f                	jg     3775 <fsfull+0x1a2>
        break;
    3746:	90                   	nop
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3747:	8b 45 ec             	mov    -0x14(%ebp),%eax
    374a:	89 44 24 08          	mov    %eax,0x8(%esp)
    374e:	c7 44 24 04 35 5b 00 	movl   $0x5b35,0x4(%esp)
    3755:	00 
    3756:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    375d:	e8 5e 06 00 00       	call   3dc0 <printf>
    close(fd);
    3762:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3765:	89 04 24             	mov    %eax,(%esp)
    3768:	e8 d3 04 00 00       	call   3c40 <close>
    if(total == 0)
    376d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3771:	75 10                	jne    3783 <fsfull+0x1b0>
    3773:	eb 0c                	jmp    3781 <fsfull+0x1ae>
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
      total += cc;
    3775:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3778:	01 45 ec             	add    %eax,-0x14(%ebp)
      fsblocks++;
    377b:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    }
    377f:	eb 9e                	jmp    371f <fsfull+0x14c>
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
    3781:	eb 09                	jmp    378c <fsfull+0x1b9>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3783:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3787:	e9 70 fe ff ff       	jmp    35fc <fsfull+0x29>

  while(nfiles >= 0){
    378c:	e9 d7 00 00 00       	jmp    3868 <fsfull+0x295>
    char name[64];
    name[0] = 'f';
    3791:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3795:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3798:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    379d:	89 c8                	mov    %ecx,%eax
    379f:	f7 ea                	imul   %edx
    37a1:	c1 fa 06             	sar    $0x6,%edx
    37a4:	89 c8                	mov    %ecx,%eax
    37a6:	c1 f8 1f             	sar    $0x1f,%eax
    37a9:	29 c2                	sub    %eax,%edx
    37ab:	89 d0                	mov    %edx,%eax
    37ad:	83 c0 30             	add    $0x30,%eax
    37b0:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    37b3:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    37b6:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    37bb:	89 d8                	mov    %ebx,%eax
    37bd:	f7 ea                	imul   %edx
    37bf:	c1 fa 06             	sar    $0x6,%edx
    37c2:	89 d8                	mov    %ebx,%eax
    37c4:	c1 f8 1f             	sar    $0x1f,%eax
    37c7:	89 d1                	mov    %edx,%ecx
    37c9:	29 c1                	sub    %eax,%ecx
    37cb:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    37d1:	29 c3                	sub    %eax,%ebx
    37d3:	89 d9                	mov    %ebx,%ecx
    37d5:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    37da:	89 c8                	mov    %ecx,%eax
    37dc:	f7 ea                	imul   %edx
    37de:	c1 fa 05             	sar    $0x5,%edx
    37e1:	89 c8                	mov    %ecx,%eax
    37e3:	c1 f8 1f             	sar    $0x1f,%eax
    37e6:	29 c2                	sub    %eax,%edx
    37e8:	89 d0                	mov    %edx,%eax
    37ea:	83 c0 30             	add    $0x30,%eax
    37ed:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    37f0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    37f3:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    37f8:	89 d8                	mov    %ebx,%eax
    37fa:	f7 ea                	imul   %edx
    37fc:	c1 fa 05             	sar    $0x5,%edx
    37ff:	89 d8                	mov    %ebx,%eax
    3801:	c1 f8 1f             	sar    $0x1f,%eax
    3804:	89 d1                	mov    %edx,%ecx
    3806:	29 c1                	sub    %eax,%ecx
    3808:	6b c1 64             	imul   $0x64,%ecx,%eax
    380b:	29 c3                	sub    %eax,%ebx
    380d:	89 d9                	mov    %ebx,%ecx
    380f:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3814:	89 c8                	mov    %ecx,%eax
    3816:	f7 ea                	imul   %edx
    3818:	c1 fa 02             	sar    $0x2,%edx
    381b:	89 c8                	mov    %ecx,%eax
    381d:	c1 f8 1f             	sar    $0x1f,%eax
    3820:	29 c2                	sub    %eax,%edx
    3822:	89 d0                	mov    %edx,%eax
    3824:	83 c0 30             	add    $0x30,%eax
    3827:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    382a:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    382d:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3832:	89 c8                	mov    %ecx,%eax
    3834:	f7 ea                	imul   %edx
    3836:	c1 fa 02             	sar    $0x2,%edx
    3839:	89 c8                	mov    %ecx,%eax
    383b:	c1 f8 1f             	sar    $0x1f,%eax
    383e:	29 c2                	sub    %eax,%edx
    3840:	89 d0                	mov    %edx,%eax
    3842:	c1 e0 02             	shl    $0x2,%eax
    3845:	01 d0                	add    %edx,%eax
    3847:	01 c0                	add    %eax,%eax
    3849:	29 c1                	sub    %eax,%ecx
    384b:	89 ca                	mov    %ecx,%edx
    384d:	89 d0                	mov    %edx,%eax
    384f:	83 c0 30             	add    $0x30,%eax
    3852:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3855:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    unlink(name);
    3859:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    385c:	89 04 24             	mov    %eax,(%esp)
    385f:	e8 04 04 00 00       	call   3c68 <unlink>
    nfiles--;
    3864:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3868:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    386c:	0f 89 1f ff ff ff    	jns    3791 <fsfull+0x1be>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3872:	c7 44 24 04 45 5b 00 	movl   $0x5b45,0x4(%esp)
    3879:	00 
    387a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3881:	e8 3a 05 00 00       	call   3dc0 <printf>
}
    3886:	83 c4 74             	add    $0x74,%esp
    3889:	5b                   	pop    %ebx
    388a:	5d                   	pop    %ebp
    388b:	c3                   	ret    

0000388c <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    388c:	55                   	push   %ebp
    388d:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
    388f:	a1 f0 63 00 00       	mov    0x63f0,%eax
    3894:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    389a:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    389f:	a3 f0 63 00 00       	mov    %eax,0x63f0
  return randstate;
    38a4:	a1 f0 63 00 00       	mov    0x63f0,%eax
}
    38a9:	5d                   	pop    %ebp
    38aa:	c3                   	ret    

000038ab <main>:

int
main(int argc, char *argv[])
{
    38ab:	55                   	push   %ebp
    38ac:	89 e5                	mov    %esp,%ebp
    38ae:	83 e4 f0             	and    $0xfffffff0,%esp
    38b1:	83 ec 10             	sub    $0x10,%esp
  printf(1, "usertests starting\n");
    38b4:	c7 44 24 04 5b 5b 00 	movl   $0x5b5b,0x4(%esp)
    38bb:	00 
    38bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    38c3:	e8 f8 04 00 00       	call   3dc0 <printf>

  if(open("usertests.ran", 0) >= 0){
    38c8:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    38cf:	00 
    38d0:	c7 04 24 6f 5b 00 00 	movl   $0x5b6f,(%esp)
    38d7:	e8 7c 03 00 00       	call   3c58 <open>
    38dc:	85 c0                	test   %eax,%eax
    38de:	78 19                	js     38f9 <main+0x4e>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    38e0:	c7 44 24 04 80 5b 00 	movl   $0x5b80,0x4(%esp)
    38e7:	00 
    38e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    38ef:	e8 cc 04 00 00       	call   3dc0 <printf>
    exit();
    38f4:	e8 1f 03 00 00       	call   3c18 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    38f9:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3900:	00 
    3901:	c7 04 24 6f 5b 00 00 	movl   $0x5b6f,(%esp)
    3908:	e8 4b 03 00 00       	call   3c58 <open>
    390d:	89 04 24             	mov    %eax,(%esp)
    3910:	e8 2b 03 00 00       	call   3c40 <close>

  bigargtest();
    3915:	e8 90 fb ff ff       	call   34aa <bigargtest>
  bigwrite();
    391a:	e8 ff ea ff ff       	call   241e <bigwrite>
  bigargtest();
    391f:	e8 86 fb ff ff       	call   34aa <bigargtest>
  bsstest();
    3924:	e8 0f fb ff ff       	call   3438 <bsstest>
  sbrktest();
    3929:	e8 2b f5 ff ff       	call   2e59 <sbrktest>
  validatetest();
    392e:	e8 38 fa ff ff       	call   336b <validatetest>

  opentest();
    3933:	e8 c8 c6 ff ff       	call   0 <opentest>
  writetest();
    3938:	e8 6e c7 ff ff       	call   ab <writetest>
  writetest1();
    393d:	e8 7e c9 ff ff       	call   2c0 <writetest1>
  createtest();
    3942:	e8 84 cb ff ff       	call   4cb <createtest>

  mem();
    3947:	e8 24 d1 ff ff       	call   a70 <mem>
  pipe1();
    394c:	e8 5b cd ff ff       	call   6ac <pipe1>
  preempt();
    3951:	e8 43 cf ff ff       	call   899 <preempt>
  exitwait();
    3956:	e8 97 d0 ff ff       	call   9f2 <exitwait>

  rmdot();
    395b:	e8 47 ef ff ff       	call   28a7 <rmdot>
  fourteen();
    3960:	e8 ec ed ff ff       	call   2751 <fourteen>
  bigfile();
    3965:	e8 bc eb ff ff       	call   2526 <bigfile>
  subdir();
    396a:	e8 69 e3 ff ff       	call   1cd8 <subdir>
  concreate();
    396f:	e8 16 dd ff ff       	call   168a <concreate>
  linkunlink();
    3974:	e8 c4 e0 ff ff       	call   1a3d <linkunlink>
  linktest();
    3979:	e8 c3 da ff ff       	call   1441 <linktest>
  unlinkread();
    397e:	e8 e9 d8 ff ff       	call   126c <unlinkread>
  createdelete();
    3983:	e8 33 d6 ff ff       	call   fbb <createdelete>
  twofiles();
    3988:	e8 c6 d3 ff ff       	call   d53 <twofiles>
  sharedfd();
    398d:	e8 c3 d1 ff ff       	call   b55 <sharedfd>
  dirfile();
    3992:	e8 88 f0 ff ff       	call   2a1f <dirfile>
  iref();
    3997:	e8 c5 f2 ff ff       	call   2c61 <iref>
  forktest();
    399c:	e8 e4 f3 ff ff       	call   2d85 <forktest>
  bigdir(); // slow
    39a1:	e8 c5 e1 ff ff       	call   1b6b <bigdir>

  exectest();
    39a6:	e8 b2 cc ff ff       	call   65d <exectest>

  exit();
    39ab:	e8 68 02 00 00       	call   3c18 <exit>

000039b0 <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    39b0:	55                   	push   %ebp
    39b1:	89 e5                	mov    %esp,%ebp
    39b3:	57                   	push   %edi
    39b4:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    39b5:	8b 4d 08             	mov    0x8(%ebp),%ecx
    39b8:	8b 55 10             	mov    0x10(%ebp),%edx
    39bb:	8b 45 0c             	mov    0xc(%ebp),%eax
    39be:	89 cb                	mov    %ecx,%ebx
    39c0:	89 df                	mov    %ebx,%edi
    39c2:	89 d1                	mov    %edx,%ecx
    39c4:	fc                   	cld    
    39c5:	f3 aa                	rep stos %al,%es:(%edi)
    39c7:	89 ca                	mov    %ecx,%edx
    39c9:	89 fb                	mov    %edi,%ebx
    39cb:	89 5d 08             	mov    %ebx,0x8(%ebp)
    39ce:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    39d1:	5b                   	pop    %ebx
    39d2:	5f                   	pop    %edi
    39d3:	5d                   	pop    %ebp
    39d4:	c3                   	ret    

000039d5 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    39d5:	55                   	push   %ebp
    39d6:	89 e5                	mov    %esp,%ebp
    39d8:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    39db:	8b 45 08             	mov    0x8(%ebp),%eax
    39de:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    39e1:	90                   	nop
    39e2:	8b 45 08             	mov    0x8(%ebp),%eax
    39e5:	8d 50 01             	lea    0x1(%eax),%edx
    39e8:	89 55 08             	mov    %edx,0x8(%ebp)
    39eb:	8b 55 0c             	mov    0xc(%ebp),%edx
    39ee:	8d 4a 01             	lea    0x1(%edx),%ecx
    39f1:	89 4d 0c             	mov    %ecx,0xc(%ebp)
    39f4:	0f b6 12             	movzbl (%edx),%edx
    39f7:	88 10                	mov    %dl,(%eax)
    39f9:	0f b6 00             	movzbl (%eax),%eax
    39fc:	84 c0                	test   %al,%al
    39fe:	75 e2                	jne    39e2 <strcpy+0xd>
    ;
  return os;
    3a00:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3a03:	c9                   	leave  
    3a04:	c3                   	ret    

00003a05 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3a05:	55                   	push   %ebp
    3a06:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3a08:	eb 08                	jmp    3a12 <strcmp+0xd>
    p++, q++;
    3a0a:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3a0e:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3a12:	8b 45 08             	mov    0x8(%ebp),%eax
    3a15:	0f b6 00             	movzbl (%eax),%eax
    3a18:	84 c0                	test   %al,%al
    3a1a:	74 10                	je     3a2c <strcmp+0x27>
    3a1c:	8b 45 08             	mov    0x8(%ebp),%eax
    3a1f:	0f b6 10             	movzbl (%eax),%edx
    3a22:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a25:	0f b6 00             	movzbl (%eax),%eax
    3a28:	38 c2                	cmp    %al,%dl
    3a2a:	74 de                	je     3a0a <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3a2c:	8b 45 08             	mov    0x8(%ebp),%eax
    3a2f:	0f b6 00             	movzbl (%eax),%eax
    3a32:	0f b6 d0             	movzbl %al,%edx
    3a35:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a38:	0f b6 00             	movzbl (%eax),%eax
    3a3b:	0f b6 c0             	movzbl %al,%eax
    3a3e:	29 c2                	sub    %eax,%edx
    3a40:	89 d0                	mov    %edx,%eax
}
    3a42:	5d                   	pop    %ebp
    3a43:	c3                   	ret    

00003a44 <strlen>:

uint
strlen(char *s)
{
    3a44:	55                   	push   %ebp
    3a45:	89 e5                	mov    %esp,%ebp
    3a47:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3a4a:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3a51:	eb 04                	jmp    3a57 <strlen+0x13>
    3a53:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3a57:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3a5a:	8b 45 08             	mov    0x8(%ebp),%eax
    3a5d:	01 d0                	add    %edx,%eax
    3a5f:	0f b6 00             	movzbl (%eax),%eax
    3a62:	84 c0                	test   %al,%al
    3a64:	75 ed                	jne    3a53 <strlen+0xf>
    ;
  return n;
    3a66:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3a69:	c9                   	leave  
    3a6a:	c3                   	ret    

00003a6b <memset>:

void*
memset(void *dst, int c, uint n)
{
    3a6b:	55                   	push   %ebp
    3a6c:	89 e5                	mov    %esp,%ebp
    3a6e:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    3a71:	8b 45 10             	mov    0x10(%ebp),%eax
    3a74:	89 44 24 08          	mov    %eax,0x8(%esp)
    3a78:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a7b:	89 44 24 04          	mov    %eax,0x4(%esp)
    3a7f:	8b 45 08             	mov    0x8(%ebp),%eax
    3a82:	89 04 24             	mov    %eax,(%esp)
    3a85:	e8 26 ff ff ff       	call   39b0 <stosb>
  return dst;
    3a8a:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3a8d:	c9                   	leave  
    3a8e:	c3                   	ret    

00003a8f <strchr>:

char*
strchr(const char *s, char c)
{
    3a8f:	55                   	push   %ebp
    3a90:	89 e5                	mov    %esp,%ebp
    3a92:	83 ec 04             	sub    $0x4,%esp
    3a95:	8b 45 0c             	mov    0xc(%ebp),%eax
    3a98:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3a9b:	eb 14                	jmp    3ab1 <strchr+0x22>
    if(*s == c)
    3a9d:	8b 45 08             	mov    0x8(%ebp),%eax
    3aa0:	0f b6 00             	movzbl (%eax),%eax
    3aa3:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3aa6:	75 05                	jne    3aad <strchr+0x1e>
      return (char*)s;
    3aa8:	8b 45 08             	mov    0x8(%ebp),%eax
    3aab:	eb 13                	jmp    3ac0 <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3aad:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3ab1:	8b 45 08             	mov    0x8(%ebp),%eax
    3ab4:	0f b6 00             	movzbl (%eax),%eax
    3ab7:	84 c0                	test   %al,%al
    3ab9:	75 e2                	jne    3a9d <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3abb:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3ac0:	c9                   	leave  
    3ac1:	c3                   	ret    

00003ac2 <gets>:

char*
gets(char *buf, int max)
{
    3ac2:	55                   	push   %ebp
    3ac3:	89 e5                	mov    %esp,%ebp
    3ac5:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3ac8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3acf:	eb 4c                	jmp    3b1d <gets+0x5b>
    cc = read(0, &c, 1);
    3ad1:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3ad8:	00 
    3ad9:	8d 45 ef             	lea    -0x11(%ebp),%eax
    3adc:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ae0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ae7:	e8 44 01 00 00       	call   3c30 <read>
    3aec:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
    3aef:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3af3:	7f 02                	jg     3af7 <gets+0x35>
      break;
    3af5:	eb 31                	jmp    3b28 <gets+0x66>
    buf[i++] = c;
    3af7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3afa:	8d 50 01             	lea    0x1(%eax),%edx
    3afd:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3b00:	89 c2                	mov    %eax,%edx
    3b02:	8b 45 08             	mov    0x8(%ebp),%eax
    3b05:	01 c2                	add    %eax,%edx
    3b07:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b0b:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
    3b0d:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b11:	3c 0a                	cmp    $0xa,%al
    3b13:	74 13                	je     3b28 <gets+0x66>
    3b15:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    3b19:	3c 0d                	cmp    $0xd,%al
    3b1b:	74 0b                	je     3b28 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    3b1d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b20:	83 c0 01             	add    $0x1,%eax
    3b23:	3b 45 0c             	cmp    0xc(%ebp),%eax
    3b26:	7c a9                	jl     3ad1 <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    3b28:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3b2b:	8b 45 08             	mov    0x8(%ebp),%eax
    3b2e:	01 d0                	add    %edx,%eax
    3b30:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    3b33:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3b36:	c9                   	leave  
    3b37:	c3                   	ret    

00003b38 <stat>:

int
stat(char *n, struct stat *st)
{
    3b38:	55                   	push   %ebp
    3b39:	89 e5                	mov    %esp,%ebp
    3b3b:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    3b3e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3b45:	00 
    3b46:	8b 45 08             	mov    0x8(%ebp),%eax
    3b49:	89 04 24             	mov    %eax,(%esp)
    3b4c:	e8 07 01 00 00       	call   3c58 <open>
    3b51:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
    3b54:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3b58:	79 07                	jns    3b61 <stat+0x29>
    return -1;
    3b5a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    3b5f:	eb 23                	jmp    3b84 <stat+0x4c>
  r = fstat(fd, st);
    3b61:	8b 45 0c             	mov    0xc(%ebp),%eax
    3b64:	89 44 24 04          	mov    %eax,0x4(%esp)
    3b68:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b6b:	89 04 24             	mov    %eax,(%esp)
    3b6e:	e8 fd 00 00 00       	call   3c70 <fstat>
    3b73:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
    3b76:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3b79:	89 04 24             	mov    %eax,(%esp)
    3b7c:	e8 bf 00 00 00       	call   3c40 <close>
  return r;
    3b81:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
    3b84:	c9                   	leave  
    3b85:	c3                   	ret    

00003b86 <atoi>:

int
atoi(const char *s)
{
    3b86:	55                   	push   %ebp
    3b87:	89 e5                	mov    %esp,%ebp
    3b89:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    3b8c:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    3b93:	eb 25                	jmp    3bba <atoi+0x34>
    n = n*10 + *s++ - '0';
    3b95:	8b 55 fc             	mov    -0x4(%ebp),%edx
    3b98:	89 d0                	mov    %edx,%eax
    3b9a:	c1 e0 02             	shl    $0x2,%eax
    3b9d:	01 d0                	add    %edx,%eax
    3b9f:	01 c0                	add    %eax,%eax
    3ba1:	89 c1                	mov    %eax,%ecx
    3ba3:	8b 45 08             	mov    0x8(%ebp),%eax
    3ba6:	8d 50 01             	lea    0x1(%eax),%edx
    3ba9:	89 55 08             	mov    %edx,0x8(%ebp)
    3bac:	0f b6 00             	movzbl (%eax),%eax
    3baf:	0f be c0             	movsbl %al,%eax
    3bb2:	01 c8                	add    %ecx,%eax
    3bb4:	83 e8 30             	sub    $0x30,%eax
    3bb7:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    3bba:	8b 45 08             	mov    0x8(%ebp),%eax
    3bbd:	0f b6 00             	movzbl (%eax),%eax
    3bc0:	3c 2f                	cmp    $0x2f,%al
    3bc2:	7e 0a                	jle    3bce <atoi+0x48>
    3bc4:	8b 45 08             	mov    0x8(%ebp),%eax
    3bc7:	0f b6 00             	movzbl (%eax),%eax
    3bca:	3c 39                	cmp    $0x39,%al
    3bcc:	7e c7                	jle    3b95 <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    3bce:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3bd1:	c9                   	leave  
    3bd2:	c3                   	ret    

00003bd3 <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    3bd3:	55                   	push   %ebp
    3bd4:	89 e5                	mov    %esp,%ebp
    3bd6:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    3bd9:	8b 45 08             	mov    0x8(%ebp),%eax
    3bdc:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
    3bdf:	8b 45 0c             	mov    0xc(%ebp),%eax
    3be2:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
    3be5:	eb 17                	jmp    3bfe <memmove+0x2b>
    *dst++ = *src++;
    3be7:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3bea:	8d 50 01             	lea    0x1(%eax),%edx
    3bed:	89 55 fc             	mov    %edx,-0x4(%ebp)
    3bf0:	8b 55 f8             	mov    -0x8(%ebp),%edx
    3bf3:	8d 4a 01             	lea    0x1(%edx),%ecx
    3bf6:	89 4d f8             	mov    %ecx,-0x8(%ebp)
    3bf9:	0f b6 12             	movzbl (%edx),%edx
    3bfc:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    3bfe:	8b 45 10             	mov    0x10(%ebp),%eax
    3c01:	8d 50 ff             	lea    -0x1(%eax),%edx
    3c04:	89 55 10             	mov    %edx,0x10(%ebp)
    3c07:	85 c0                	test   %eax,%eax
    3c09:	7f dc                	jg     3be7 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    3c0b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3c0e:	c9                   	leave  
    3c0f:	c3                   	ret    

00003c10 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    3c10:	b8 01 00 00 00       	mov    $0x1,%eax
    3c15:	cd 40                	int    $0x40
    3c17:	c3                   	ret    

00003c18 <exit>:
SYSCALL(exit)
    3c18:	b8 02 00 00 00       	mov    $0x2,%eax
    3c1d:	cd 40                	int    $0x40
    3c1f:	c3                   	ret    

00003c20 <wait>:
SYSCALL(wait)
    3c20:	b8 03 00 00 00       	mov    $0x3,%eax
    3c25:	cd 40                	int    $0x40
    3c27:	c3                   	ret    

00003c28 <pipe>:
SYSCALL(pipe)
    3c28:	b8 04 00 00 00       	mov    $0x4,%eax
    3c2d:	cd 40                	int    $0x40
    3c2f:	c3                   	ret    

00003c30 <read>:
SYSCALL(read)
    3c30:	b8 05 00 00 00       	mov    $0x5,%eax
    3c35:	cd 40                	int    $0x40
    3c37:	c3                   	ret    

00003c38 <write>:
SYSCALL(write)
    3c38:	b8 10 00 00 00       	mov    $0x10,%eax
    3c3d:	cd 40                	int    $0x40
    3c3f:	c3                   	ret    

00003c40 <close>:
SYSCALL(close)
    3c40:	b8 15 00 00 00       	mov    $0x15,%eax
    3c45:	cd 40                	int    $0x40
    3c47:	c3                   	ret    

00003c48 <kill>:
SYSCALL(kill)
    3c48:	b8 06 00 00 00       	mov    $0x6,%eax
    3c4d:	cd 40                	int    $0x40
    3c4f:	c3                   	ret    

00003c50 <exec>:
SYSCALL(exec)
    3c50:	b8 07 00 00 00       	mov    $0x7,%eax
    3c55:	cd 40                	int    $0x40
    3c57:	c3                   	ret    

00003c58 <open>:
SYSCALL(open)
    3c58:	b8 0f 00 00 00       	mov    $0xf,%eax
    3c5d:	cd 40                	int    $0x40
    3c5f:	c3                   	ret    

00003c60 <mknod>:
SYSCALL(mknod)
    3c60:	b8 11 00 00 00       	mov    $0x11,%eax
    3c65:	cd 40                	int    $0x40
    3c67:	c3                   	ret    

00003c68 <unlink>:
SYSCALL(unlink)
    3c68:	b8 12 00 00 00       	mov    $0x12,%eax
    3c6d:	cd 40                	int    $0x40
    3c6f:	c3                   	ret    

00003c70 <fstat>:
SYSCALL(fstat)
    3c70:	b8 08 00 00 00       	mov    $0x8,%eax
    3c75:	cd 40                	int    $0x40
    3c77:	c3                   	ret    

00003c78 <link>:
SYSCALL(link)
    3c78:	b8 13 00 00 00       	mov    $0x13,%eax
    3c7d:	cd 40                	int    $0x40
    3c7f:	c3                   	ret    

00003c80 <mkdir>:
SYSCALL(mkdir)
    3c80:	b8 14 00 00 00       	mov    $0x14,%eax
    3c85:	cd 40                	int    $0x40
    3c87:	c3                   	ret    

00003c88 <chdir>:
SYSCALL(chdir)
    3c88:	b8 09 00 00 00       	mov    $0x9,%eax
    3c8d:	cd 40                	int    $0x40
    3c8f:	c3                   	ret    

00003c90 <dup>:
SYSCALL(dup)
    3c90:	b8 0a 00 00 00       	mov    $0xa,%eax
    3c95:	cd 40                	int    $0x40
    3c97:	c3                   	ret    

00003c98 <getpid>:
SYSCALL(getpid)
    3c98:	b8 0b 00 00 00       	mov    $0xb,%eax
    3c9d:	cd 40                	int    $0x40
    3c9f:	c3                   	ret    

00003ca0 <sbrk>:
SYSCALL(sbrk)
    3ca0:	b8 0c 00 00 00       	mov    $0xc,%eax
    3ca5:	cd 40                	int    $0x40
    3ca7:	c3                   	ret    

00003ca8 <sleep>:
SYSCALL(sleep)
    3ca8:	b8 0d 00 00 00       	mov    $0xd,%eax
    3cad:	cd 40                	int    $0x40
    3caf:	c3                   	ret    

00003cb0 <uptime>:
SYSCALL(uptime)
    3cb0:	b8 0e 00 00 00       	mov    $0xe,%eax
    3cb5:	cd 40                	int    $0x40
    3cb7:	c3                   	ret    

00003cb8 <clone>:
SYSCALL(clone)
    3cb8:	b8 16 00 00 00       	mov    $0x16,%eax
    3cbd:	cd 40                	int    $0x40
    3cbf:	c3                   	ret    

00003cc0 <texit>:
SYSCALL(texit)
    3cc0:	b8 17 00 00 00       	mov    $0x17,%eax
    3cc5:	cd 40                	int    $0x40
    3cc7:	c3                   	ret    

00003cc8 <tsleep>:
SYSCALL(tsleep)
    3cc8:	b8 18 00 00 00       	mov    $0x18,%eax
    3ccd:	cd 40                	int    $0x40
    3ccf:	c3                   	ret    

00003cd0 <twakeup>:
SYSCALL(twakeup)
    3cd0:	b8 19 00 00 00       	mov    $0x19,%eax
    3cd5:	cd 40                	int    $0x40
    3cd7:	c3                   	ret    

00003cd8 <test>:
SYSCALL(test)
    3cd8:	b8 1a 00 00 00       	mov    $0x1a,%eax
    3cdd:	cd 40                	int    $0x40
    3cdf:	c3                   	ret    

00003ce0 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    3ce0:	55                   	push   %ebp
    3ce1:	89 e5                	mov    %esp,%ebp
    3ce3:	83 ec 18             	sub    $0x18,%esp
    3ce6:	8b 45 0c             	mov    0xc(%ebp),%eax
    3ce9:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    3cec:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3cf3:	00 
    3cf4:	8d 45 f4             	lea    -0xc(%ebp),%eax
    3cf7:	89 44 24 04          	mov    %eax,0x4(%esp)
    3cfb:	8b 45 08             	mov    0x8(%ebp),%eax
    3cfe:	89 04 24             	mov    %eax,(%esp)
    3d01:	e8 32 ff ff ff       	call   3c38 <write>
}
    3d06:	c9                   	leave  
    3d07:	c3                   	ret    

00003d08 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    3d08:	55                   	push   %ebp
    3d09:	89 e5                	mov    %esp,%ebp
    3d0b:	56                   	push   %esi
    3d0c:	53                   	push   %ebx
    3d0d:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    3d10:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    3d17:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    3d1b:	74 17                	je     3d34 <printint+0x2c>
    3d1d:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    3d21:	79 11                	jns    3d34 <printint+0x2c>
    neg = 1;
    3d23:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    3d2a:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d2d:	f7 d8                	neg    %eax
    3d2f:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3d32:	eb 06                	jmp    3d3a <printint+0x32>
  } else {
    x = xx;
    3d34:	8b 45 0c             	mov    0xc(%ebp),%eax
    3d37:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
    3d3a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
    3d41:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    3d44:	8d 41 01             	lea    0x1(%ecx),%eax
    3d47:	89 45 f4             	mov    %eax,-0xc(%ebp)
    3d4a:	8b 5d 10             	mov    0x10(%ebp),%ebx
    3d4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d50:	ba 00 00 00 00       	mov    $0x0,%edx
    3d55:	f7 f3                	div    %ebx
    3d57:	89 d0                	mov    %edx,%eax
    3d59:	0f b6 80 f4 63 00 00 	movzbl 0x63f4(%eax),%eax
    3d60:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
    3d64:	8b 75 10             	mov    0x10(%ebp),%esi
    3d67:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3d6a:	ba 00 00 00 00       	mov    $0x0,%edx
    3d6f:	f7 f6                	div    %esi
    3d71:	89 45 ec             	mov    %eax,-0x14(%ebp)
    3d74:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3d78:	75 c7                	jne    3d41 <printint+0x39>
  if(neg)
    3d7a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3d7e:	74 10                	je     3d90 <printint+0x88>
    buf[i++] = '-';
    3d80:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d83:	8d 50 01             	lea    0x1(%eax),%edx
    3d86:	89 55 f4             	mov    %edx,-0xc(%ebp)
    3d89:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
    3d8e:	eb 1f                	jmp    3daf <printint+0xa7>
    3d90:	eb 1d                	jmp    3daf <printint+0xa7>
    putc(fd, buf[i]);
    3d92:	8d 55 dc             	lea    -0x24(%ebp),%edx
    3d95:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3d98:	01 d0                	add    %edx,%eax
    3d9a:	0f b6 00             	movzbl (%eax),%eax
    3d9d:	0f be c0             	movsbl %al,%eax
    3da0:	89 44 24 04          	mov    %eax,0x4(%esp)
    3da4:	8b 45 08             	mov    0x8(%ebp),%eax
    3da7:	89 04 24             	mov    %eax,(%esp)
    3daa:	e8 31 ff ff ff       	call   3ce0 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    3daf:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
    3db3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3db7:	79 d9                	jns    3d92 <printint+0x8a>
    putc(fd, buf[i]);
}
    3db9:	83 c4 30             	add    $0x30,%esp
    3dbc:	5b                   	pop    %ebx
    3dbd:	5e                   	pop    %esi
    3dbe:	5d                   	pop    %ebp
    3dbf:	c3                   	ret    

00003dc0 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    3dc0:	55                   	push   %ebp
    3dc1:	89 e5                	mov    %esp,%ebp
    3dc3:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    3dc6:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    3dcd:	8d 45 0c             	lea    0xc(%ebp),%eax
    3dd0:	83 c0 04             	add    $0x4,%eax
    3dd3:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
    3dd6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    3ddd:	e9 7c 01 00 00       	jmp    3f5e <printf+0x19e>
    c = fmt[i] & 0xff;
    3de2:	8b 55 0c             	mov    0xc(%ebp),%edx
    3de5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3de8:	01 d0                	add    %edx,%eax
    3dea:	0f b6 00             	movzbl (%eax),%eax
    3ded:	0f be c0             	movsbl %al,%eax
    3df0:	25 ff 00 00 00       	and    $0xff,%eax
    3df5:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
    3df8:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3dfc:	75 2c                	jne    3e2a <printf+0x6a>
      if(c == '%'){
    3dfe:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3e02:	75 0c                	jne    3e10 <printf+0x50>
        state = '%';
    3e04:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
    3e0b:	e9 4a 01 00 00       	jmp    3f5a <printf+0x19a>
      } else {
        putc(fd, c);
    3e10:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3e13:	0f be c0             	movsbl %al,%eax
    3e16:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e1a:	8b 45 08             	mov    0x8(%ebp),%eax
    3e1d:	89 04 24             	mov    %eax,(%esp)
    3e20:	e8 bb fe ff ff       	call   3ce0 <putc>
    3e25:	e9 30 01 00 00       	jmp    3f5a <printf+0x19a>
      }
    } else if(state == '%'){
    3e2a:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
    3e2e:	0f 85 26 01 00 00    	jne    3f5a <printf+0x19a>
      if(c == 'd'){
    3e34:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
    3e38:	75 2d                	jne    3e67 <printf+0xa7>
        printint(fd, *ap, 10, 1);
    3e3a:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e3d:	8b 00                	mov    (%eax),%eax
    3e3f:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    3e46:	00 
    3e47:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    3e4e:	00 
    3e4f:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e53:	8b 45 08             	mov    0x8(%ebp),%eax
    3e56:	89 04 24             	mov    %eax,(%esp)
    3e59:	e8 aa fe ff ff       	call   3d08 <printint>
        ap++;
    3e5e:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3e62:	e9 ec 00 00 00       	jmp    3f53 <printf+0x193>
      } else if(c == 'x' || c == 'p'){
    3e67:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
    3e6b:	74 06                	je     3e73 <printf+0xb3>
    3e6d:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
    3e71:	75 2d                	jne    3ea0 <printf+0xe0>
        printint(fd, *ap, 16, 0);
    3e73:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3e76:	8b 00                	mov    (%eax),%eax
    3e78:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    3e7f:	00 
    3e80:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    3e87:	00 
    3e88:	89 44 24 04          	mov    %eax,0x4(%esp)
    3e8c:	8b 45 08             	mov    0x8(%ebp),%eax
    3e8f:	89 04 24             	mov    %eax,(%esp)
    3e92:	e8 71 fe ff ff       	call   3d08 <printint>
        ap++;
    3e97:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3e9b:	e9 b3 00 00 00       	jmp    3f53 <printf+0x193>
      } else if(c == 's'){
    3ea0:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
    3ea4:	75 45                	jne    3eeb <printf+0x12b>
        s = (char*)*ap;
    3ea6:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3ea9:	8b 00                	mov    (%eax),%eax
    3eab:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
    3eae:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
    3eb2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3eb6:	75 09                	jne    3ec1 <printf+0x101>
          s = "(null)";
    3eb8:	c7 45 f4 aa 5b 00 00 	movl   $0x5baa,-0xc(%ebp)
        while(*s != 0){
    3ebf:	eb 1e                	jmp    3edf <printf+0x11f>
    3ec1:	eb 1c                	jmp    3edf <printf+0x11f>
          putc(fd, *s);
    3ec3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ec6:	0f b6 00             	movzbl (%eax),%eax
    3ec9:	0f be c0             	movsbl %al,%eax
    3ecc:	89 44 24 04          	mov    %eax,0x4(%esp)
    3ed0:	8b 45 08             	mov    0x8(%ebp),%eax
    3ed3:	89 04 24             	mov    %eax,(%esp)
    3ed6:	e8 05 fe ff ff       	call   3ce0 <putc>
          s++;
    3edb:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    3edf:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3ee2:	0f b6 00             	movzbl (%eax),%eax
    3ee5:	84 c0                	test   %al,%al
    3ee7:	75 da                	jne    3ec3 <printf+0x103>
    3ee9:	eb 68                	jmp    3f53 <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    3eeb:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
    3eef:	75 1d                	jne    3f0e <printf+0x14e>
        putc(fd, *ap);
    3ef1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    3ef4:	8b 00                	mov    (%eax),%eax
    3ef6:	0f be c0             	movsbl %al,%eax
    3ef9:	89 44 24 04          	mov    %eax,0x4(%esp)
    3efd:	8b 45 08             	mov    0x8(%ebp),%eax
    3f00:	89 04 24             	mov    %eax,(%esp)
    3f03:	e8 d8 fd ff ff       	call   3ce0 <putc>
        ap++;
    3f08:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
    3f0c:	eb 45                	jmp    3f53 <printf+0x193>
      } else if(c == '%'){
    3f0e:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
    3f12:	75 17                	jne    3f2b <printf+0x16b>
        putc(fd, c);
    3f14:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f17:	0f be c0             	movsbl %al,%eax
    3f1a:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f1e:	8b 45 08             	mov    0x8(%ebp),%eax
    3f21:	89 04 24             	mov    %eax,(%esp)
    3f24:	e8 b7 fd ff ff       	call   3ce0 <putc>
    3f29:	eb 28                	jmp    3f53 <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    3f2b:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    3f32:	00 
    3f33:	8b 45 08             	mov    0x8(%ebp),%eax
    3f36:	89 04 24             	mov    %eax,(%esp)
    3f39:	e8 a2 fd ff ff       	call   3ce0 <putc>
        putc(fd, c);
    3f3e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    3f41:	0f be c0             	movsbl %al,%eax
    3f44:	89 44 24 04          	mov    %eax,0x4(%esp)
    3f48:	8b 45 08             	mov    0x8(%ebp),%eax
    3f4b:	89 04 24             	mov    %eax,(%esp)
    3f4e:	e8 8d fd ff ff       	call   3ce0 <putc>
      }
      state = 0;
    3f53:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    3f5a:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    3f5e:	8b 55 0c             	mov    0xc(%ebp),%edx
    3f61:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3f64:	01 d0                	add    %edx,%eax
    3f66:	0f b6 00             	movzbl (%eax),%eax
    3f69:	84 c0                	test   %al,%al
    3f6b:	0f 85 71 fe ff ff    	jne    3de2 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    3f71:	c9                   	leave  
    3f72:	c3                   	ret    

00003f73 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    3f73:	55                   	push   %ebp
    3f74:	89 e5                	mov    %esp,%ebp
    3f76:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    3f79:	8b 45 08             	mov    0x8(%ebp),%eax
    3f7c:	83 e8 08             	sub    $0x8,%eax
    3f7f:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3f82:	a1 a8 64 00 00       	mov    0x64a8,%eax
    3f87:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3f8a:	eb 24                	jmp    3fb0 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    3f8c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f8f:	8b 00                	mov    (%eax),%eax
    3f91:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3f94:	77 12                	ja     3fa8 <free+0x35>
    3f96:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3f99:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3f9c:	77 24                	ja     3fc2 <free+0x4f>
    3f9e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fa1:	8b 00                	mov    (%eax),%eax
    3fa3:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3fa6:	77 1a                	ja     3fc2 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    3fa8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fab:	8b 00                	mov    (%eax),%eax
    3fad:	89 45 fc             	mov    %eax,-0x4(%ebp)
    3fb0:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fb3:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    3fb6:	76 d4                	jbe    3f8c <free+0x19>
    3fb8:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fbb:	8b 00                	mov    (%eax),%eax
    3fbd:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    3fc0:	76 ca                	jbe    3f8c <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    3fc2:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fc5:	8b 40 04             	mov    0x4(%eax),%eax
    3fc8:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    3fcf:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fd2:	01 c2                	add    %eax,%edx
    3fd4:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fd7:	8b 00                	mov    (%eax),%eax
    3fd9:	39 c2                	cmp    %eax,%edx
    3fdb:	75 24                	jne    4001 <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
    3fdd:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3fe0:	8b 50 04             	mov    0x4(%eax),%edx
    3fe3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3fe6:	8b 00                	mov    (%eax),%eax
    3fe8:	8b 40 04             	mov    0x4(%eax),%eax
    3feb:	01 c2                	add    %eax,%edx
    3fed:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3ff0:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    3ff3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3ff6:	8b 00                	mov    (%eax),%eax
    3ff8:	8b 10                	mov    (%eax),%edx
    3ffa:	8b 45 f8             	mov    -0x8(%ebp),%eax
    3ffd:	89 10                	mov    %edx,(%eax)
    3fff:	eb 0a                	jmp    400b <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
    4001:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4004:	8b 10                	mov    (%eax),%edx
    4006:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4009:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    400b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    400e:	8b 40 04             	mov    0x4(%eax),%eax
    4011:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
    4018:	8b 45 fc             	mov    -0x4(%ebp),%eax
    401b:	01 d0                	add    %edx,%eax
    401d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    4020:	75 20                	jne    4042 <free+0xcf>
    p->s.size += bp->s.size;
    4022:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4025:	8b 50 04             	mov    0x4(%eax),%edx
    4028:	8b 45 f8             	mov    -0x8(%ebp),%eax
    402b:	8b 40 04             	mov    0x4(%eax),%eax
    402e:	01 c2                	add    %eax,%edx
    4030:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4033:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4036:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4039:	8b 10                	mov    (%eax),%edx
    403b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    403e:	89 10                	mov    %edx,(%eax)
    4040:	eb 08                	jmp    404a <free+0xd7>
  } else
    p->s.ptr = bp;
    4042:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4045:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4048:	89 10                	mov    %edx,(%eax)
  freep = p;
    404a:	8b 45 fc             	mov    -0x4(%ebp),%eax
    404d:	a3 a8 64 00 00       	mov    %eax,0x64a8
}
    4052:	c9                   	leave  
    4053:	c3                   	ret    

00004054 <morecore>:

static Header*
morecore(uint nu)
{
    4054:	55                   	push   %ebp
    4055:	89 e5                	mov    %esp,%ebp
    4057:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    405a:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    4061:	77 07                	ja     406a <morecore+0x16>
    nu = 4096;
    4063:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    406a:	8b 45 08             	mov    0x8(%ebp),%eax
    406d:	c1 e0 03             	shl    $0x3,%eax
    4070:	89 04 24             	mov    %eax,(%esp)
    4073:	e8 28 fc ff ff       	call   3ca0 <sbrk>
    4078:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
    407b:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    407f:	75 07                	jne    4088 <morecore+0x34>
    return 0;
    4081:	b8 00 00 00 00       	mov    $0x0,%eax
    4086:	eb 22                	jmp    40aa <morecore+0x56>
  hp = (Header*)p;
    4088:	8b 45 f4             	mov    -0xc(%ebp),%eax
    408b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
    408e:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4091:	8b 55 08             	mov    0x8(%ebp),%edx
    4094:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    4097:	8b 45 f0             	mov    -0x10(%ebp),%eax
    409a:	83 c0 08             	add    $0x8,%eax
    409d:	89 04 24             	mov    %eax,(%esp)
    40a0:	e8 ce fe ff ff       	call   3f73 <free>
  return freep;
    40a5:	a1 a8 64 00 00       	mov    0x64a8,%eax
}
    40aa:	c9                   	leave  
    40ab:	c3                   	ret    

000040ac <malloc>:

void*
malloc(uint nbytes)
{
    40ac:	55                   	push   %ebp
    40ad:	89 e5                	mov    %esp,%ebp
    40af:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    40b2:	8b 45 08             	mov    0x8(%ebp),%eax
    40b5:	83 c0 07             	add    $0x7,%eax
    40b8:	c1 e8 03             	shr    $0x3,%eax
    40bb:	83 c0 01             	add    $0x1,%eax
    40be:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
    40c1:	a1 a8 64 00 00       	mov    0x64a8,%eax
    40c6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    40c9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    40cd:	75 23                	jne    40f2 <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    40cf:	c7 45 f0 a0 64 00 00 	movl   $0x64a0,-0x10(%ebp)
    40d6:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40d9:	a3 a8 64 00 00       	mov    %eax,0x64a8
    40de:	a1 a8 64 00 00       	mov    0x64a8,%eax
    40e3:	a3 a0 64 00 00       	mov    %eax,0x64a0
    base.s.size = 0;
    40e8:	c7 05 a4 64 00 00 00 	movl   $0x0,0x64a4
    40ef:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    40f2:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40f5:	8b 00                	mov    (%eax),%eax
    40f7:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
    40fa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    40fd:	8b 40 04             	mov    0x4(%eax),%eax
    4100:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    4103:	72 4d                	jb     4152 <malloc+0xa6>
      if(p->s.size == nunits)
    4105:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4108:	8b 40 04             	mov    0x4(%eax),%eax
    410b:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    410e:	75 0c                	jne    411c <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    4110:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4113:	8b 10                	mov    (%eax),%edx
    4115:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4118:	89 10                	mov    %edx,(%eax)
    411a:	eb 26                	jmp    4142 <malloc+0x96>
      else {
        p->s.size -= nunits;
    411c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    411f:	8b 40 04             	mov    0x4(%eax),%eax
    4122:	2b 45 ec             	sub    -0x14(%ebp),%eax
    4125:	89 c2                	mov    %eax,%edx
    4127:	8b 45 f4             	mov    -0xc(%ebp),%eax
    412a:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    412d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4130:	8b 40 04             	mov    0x4(%eax),%eax
    4133:	c1 e0 03             	shl    $0x3,%eax
    4136:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
    4139:	8b 45 f4             	mov    -0xc(%ebp),%eax
    413c:	8b 55 ec             	mov    -0x14(%ebp),%edx
    413f:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    4142:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4145:	a3 a8 64 00 00       	mov    %eax,0x64a8
      return (void*)(p + 1);
    414a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    414d:	83 c0 08             	add    $0x8,%eax
    4150:	eb 38                	jmp    418a <malloc+0xde>
    }
    if(p == freep)
    4152:	a1 a8 64 00 00       	mov    0x64a8,%eax
    4157:	39 45 f4             	cmp    %eax,-0xc(%ebp)
    415a:	75 1b                	jne    4177 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    415c:	8b 45 ec             	mov    -0x14(%ebp),%eax
    415f:	89 04 24             	mov    %eax,(%esp)
    4162:	e8 ed fe ff ff       	call   4054 <morecore>
    4167:	89 45 f4             	mov    %eax,-0xc(%ebp)
    416a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    416e:	75 07                	jne    4177 <malloc+0xcb>
        return 0;
    4170:	b8 00 00 00 00       	mov    $0x0,%eax
    4175:	eb 13                	jmp    418a <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4177:	8b 45 f4             	mov    -0xc(%ebp),%eax
    417a:	89 45 f0             	mov    %eax,-0x10(%ebp)
    417d:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4180:	8b 00                	mov    (%eax),%eax
    4182:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    4185:	e9 70 ff ff ff       	jmp    40fa <malloc+0x4e>
}
    418a:	c9                   	leave  
    418b:	c3                   	ret    

0000418c <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
    418c:	55                   	push   %ebp
    418d:	89 e5                	mov    %esp,%ebp
    418f:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
    4192:	8b 55 08             	mov    0x8(%ebp),%edx
    4195:	8b 45 0c             	mov    0xc(%ebp),%eax
    4198:	8b 4d 08             	mov    0x8(%ebp),%ecx
    419b:	f0 87 02             	lock xchg %eax,(%edx)
    419e:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
    41a1:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    41a4:	c9                   	leave  
    41a5:	c3                   	ret    

000041a6 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
    41a6:	55                   	push   %ebp
    41a7:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
    41a9:	8b 45 08             	mov    0x8(%ebp),%eax
    41ac:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
    41b2:	5d                   	pop    %ebp
    41b3:	c3                   	ret    

000041b4 <lock_acquire>:
void lock_acquire(lock_t *lock){
    41b4:	55                   	push   %ebp
    41b5:	89 e5                	mov    %esp,%ebp
    41b7:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
    41ba:	90                   	nop
    41bb:	8b 45 08             	mov    0x8(%ebp),%eax
    41be:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    41c5:	00 
    41c6:	89 04 24             	mov    %eax,(%esp)
    41c9:	e8 be ff ff ff       	call   418c <xchg>
    41ce:	85 c0                	test   %eax,%eax
    41d0:	75 e9                	jne    41bb <lock_acquire+0x7>
}
    41d2:	c9                   	leave  
    41d3:	c3                   	ret    

000041d4 <lock_release>:
void lock_release(lock_t *lock){
    41d4:	55                   	push   %ebp
    41d5:	89 e5                	mov    %esp,%ebp
    41d7:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
    41da:	8b 45 08             	mov    0x8(%ebp),%eax
    41dd:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    41e4:	00 
    41e5:	89 04 24             	mov    %eax,(%esp)
    41e8:	e8 9f ff ff ff       	call   418c <xchg>
}
    41ed:	c9                   	leave  
    41ee:	c3                   	ret    

000041ef <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
    41ef:	55                   	push   %ebp
    41f0:	89 e5                	mov    %esp,%ebp
    41f2:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
    41f5:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
    41fc:	e8 ab fe ff ff       	call   40ac <malloc>
    4201:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
    4204:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4207:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
    420a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    420d:	25 ff 0f 00 00       	and    $0xfff,%eax
    4212:	85 c0                	test   %eax,%eax
    4214:	74 14                	je     422a <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
    4216:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4219:	25 ff 0f 00 00       	and    $0xfff,%eax
    421e:	89 c2                	mov    %eax,%edx
    4220:	b8 00 10 00 00       	mov    $0x1000,%eax
    4225:	29 d0                	sub    %edx,%eax
    4227:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
    422a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    422e:	75 1b                	jne    424b <thread_create+0x5c>

        printf(1,"malloc fail \n");
    4230:	c7 44 24 04 b1 5b 00 	movl   $0x5bb1,0x4(%esp)
    4237:	00 
    4238:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    423f:	e8 7c fb ff ff       	call   3dc0 <printf>
        return 0;
    4244:	b8 00 00 00 00       	mov    $0x0,%eax
    4249:	eb 6f                	jmp    42ba <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
    424b:	8b 4d 0c             	mov    0xc(%ebp),%ecx
    424e:	8b 55 08             	mov    0x8(%ebp),%edx
    4251:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4254:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
    4258:	89 54 24 08          	mov    %edx,0x8(%esp)
    425c:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
    4263:	00 
    4264:	89 04 24             	mov    %eax,(%esp)
    4267:	e8 4c fa ff ff       	call   3cb8 <clone>
    426c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
    426f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4273:	79 1b                	jns    4290 <thread_create+0xa1>
        printf(1,"clone fails\n");
    4275:	c7 44 24 04 bf 5b 00 	movl   $0x5bbf,0x4(%esp)
    427c:	00 
    427d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    4284:	e8 37 fb ff ff       	call   3dc0 <printf>
        return 0;
    4289:	b8 00 00 00 00       	mov    $0x0,%eax
    428e:	eb 2a                	jmp    42ba <thread_create+0xcb>
    }
    if(tid > 0){
    4290:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4294:	7e 05                	jle    429b <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
    4296:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4299:	eb 1f                	jmp    42ba <thread_create+0xcb>
    }
    if(tid == 0){
    429b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    429f:	75 14                	jne    42b5 <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
    42a1:	c7 44 24 04 cc 5b 00 	movl   $0x5bcc,0x4(%esp)
    42a8:	00 
    42a9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    42b0:	e8 0b fb ff ff       	call   3dc0 <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
    42b5:	b8 00 00 00 00       	mov    $0x0,%eax
}
    42ba:	c9                   	leave  
    42bb:	c3                   	ret    

000042bc <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
    42bc:	55                   	push   %ebp
    42bd:	89 e5                	mov    %esp,%ebp
    q->size = 0;
    42bf:	8b 45 08             	mov    0x8(%ebp),%eax
    42c2:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
    42c8:	8b 45 08             	mov    0x8(%ebp),%eax
    42cb:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
    42d2:	8b 45 08             	mov    0x8(%ebp),%eax
    42d5:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
    42dc:	5d                   	pop    %ebp
    42dd:	c3                   	ret    

000042de <add_q>:

void add_q(struct queue *q, int v){
    42de:	55                   	push   %ebp
    42df:	89 e5                	mov    %esp,%ebp
    42e1:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
    42e4:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    42eb:	e8 bc fd ff ff       	call   40ac <malloc>
    42f0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    42f3:	8b 45 f4             	mov    -0xc(%ebp),%eax
    42f6:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    42fd:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4300:	8b 55 0c             	mov    0xc(%ebp),%edx
    4303:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    4305:	8b 45 08             	mov    0x8(%ebp),%eax
    4308:	8b 40 04             	mov    0x4(%eax),%eax
    430b:	85 c0                	test   %eax,%eax
    430d:	75 0b                	jne    431a <add_q+0x3c>
        q->head = n;
    430f:	8b 45 08             	mov    0x8(%ebp),%eax
    4312:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4315:	89 50 04             	mov    %edx,0x4(%eax)
    4318:	eb 0c                	jmp    4326 <add_q+0x48>
    }else{
        q->tail->next = n;
    431a:	8b 45 08             	mov    0x8(%ebp),%eax
    431d:	8b 40 08             	mov    0x8(%eax),%eax
    4320:	8b 55 f4             	mov    -0xc(%ebp),%edx
    4323:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    4326:	8b 45 08             	mov    0x8(%ebp),%eax
    4329:	8b 55 f4             	mov    -0xc(%ebp),%edx
    432c:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    432f:	8b 45 08             	mov    0x8(%ebp),%eax
    4332:	8b 00                	mov    (%eax),%eax
    4334:	8d 50 01             	lea    0x1(%eax),%edx
    4337:	8b 45 08             	mov    0x8(%ebp),%eax
    433a:	89 10                	mov    %edx,(%eax)
}
    433c:	c9                   	leave  
    433d:	c3                   	ret    

0000433e <empty_q>:

int empty_q(struct queue *q){
    433e:	55                   	push   %ebp
    433f:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    4341:	8b 45 08             	mov    0x8(%ebp),%eax
    4344:	8b 00                	mov    (%eax),%eax
    4346:	85 c0                	test   %eax,%eax
    4348:	75 07                	jne    4351 <empty_q+0x13>
        return 1;
    434a:	b8 01 00 00 00       	mov    $0x1,%eax
    434f:	eb 05                	jmp    4356 <empty_q+0x18>
    else
        return 0;
    4351:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    4356:	5d                   	pop    %ebp
    4357:	c3                   	ret    

00004358 <pop_q>:
int pop_q(struct queue *q){
    4358:	55                   	push   %ebp
    4359:	89 e5                	mov    %esp,%ebp
    435b:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    435e:	8b 45 08             	mov    0x8(%ebp),%eax
    4361:	89 04 24             	mov    %eax,(%esp)
    4364:	e8 d5 ff ff ff       	call   433e <empty_q>
    4369:	85 c0                	test   %eax,%eax
    436b:	75 5d                	jne    43ca <pop_q+0x72>
       val = q->head->value; 
    436d:	8b 45 08             	mov    0x8(%ebp),%eax
    4370:	8b 40 04             	mov    0x4(%eax),%eax
    4373:	8b 00                	mov    (%eax),%eax
    4375:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    4378:	8b 45 08             	mov    0x8(%ebp),%eax
    437b:	8b 40 04             	mov    0x4(%eax),%eax
    437e:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    4381:	8b 45 08             	mov    0x8(%ebp),%eax
    4384:	8b 40 04             	mov    0x4(%eax),%eax
    4387:	8b 50 04             	mov    0x4(%eax),%edx
    438a:	8b 45 08             	mov    0x8(%ebp),%eax
    438d:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    4390:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4393:	89 04 24             	mov    %eax,(%esp)
    4396:	e8 d8 fb ff ff       	call   3f73 <free>
       q->size--;
    439b:	8b 45 08             	mov    0x8(%ebp),%eax
    439e:	8b 00                	mov    (%eax),%eax
    43a0:	8d 50 ff             	lea    -0x1(%eax),%edx
    43a3:	8b 45 08             	mov    0x8(%ebp),%eax
    43a6:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    43a8:	8b 45 08             	mov    0x8(%ebp),%eax
    43ab:	8b 00                	mov    (%eax),%eax
    43ad:	85 c0                	test   %eax,%eax
    43af:	75 14                	jne    43c5 <pop_q+0x6d>
            q->head = 0;
    43b1:	8b 45 08             	mov    0x8(%ebp),%eax
    43b4:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    43bb:	8b 45 08             	mov    0x8(%ebp),%eax
    43be:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    43c5:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43c8:	eb 05                	jmp    43cf <pop_q+0x77>
    }
    return -1;
    43ca:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    43cf:	c9                   	leave  
    43d0:	c3                   	ret    

000043d1 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
    43d1:	55                   	push   %ebp
    43d2:	89 e5                	mov    %esp,%ebp
    43d4:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
    43d7:	8b 45 08             	mov    0x8(%ebp),%eax
    43da:	8b 55 0c             	mov    0xc(%ebp),%edx
    43dd:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
    43e0:	8b 45 08             	mov    0x8(%ebp),%eax
    43e3:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock); //implicid declaration???
    43ea:	8b 45 08             	mov    0x8(%ebp),%eax
    43ed:	89 04 24             	mov    %eax,(%esp)
    43f0:	e8 b1 fd ff ff       	call   41a6 <lock_init>
}
    43f5:	c9                   	leave  
    43f6:	c3                   	ret    

000043f7 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
    43f7:	55                   	push   %ebp
    43f8:	89 e5                	mov    %esp,%ebp
    43fa:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
    43fd:	8b 45 08             	mov    0x8(%ebp),%eax
    4400:	89 04 24             	mov    %eax,(%esp)
    4403:	e8 ac fd ff ff       	call   41b4 <lock_acquire>
	if(s->count  == 0){
    4408:	8b 45 08             	mov    0x8(%ebp),%eax
    440b:	8b 40 04             	mov    0x4(%eax),%eax
    440e:	85 c0                	test   %eax,%eax
    4410:	75 2f                	jne    4441 <sem_aquire+0x4a>
		//add proc to waiters list
		int tid = getpid();
    4412:	e8 81 f8 ff ff       	call   3c98 <getpid>
    4417:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
    441a:	8b 45 08             	mov    0x8(%ebp),%eax
    441d:	8d 50 0c             	lea    0xc(%eax),%edx
    4420:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4423:	89 44 24 04          	mov    %eax,0x4(%esp)
    4427:	89 14 24             	mov    %edx,(%esp)
    442a:	e8 af fe ff ff       	call   42de <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
    442f:	8b 45 08             	mov    0x8(%ebp),%eax
    4432:	89 04 24             	mov    %eax,(%esp)
    4435:	e8 9a fd ff ff       	call   41d4 <lock_release>
		tsleep(); 
    443a:	e8 89 f8 ff ff       	call   3cc8 <tsleep>
    443f:	eb 1a                	jmp    445b <sem_aquire+0x64>
	}
	else{
		s->count--;	
    4441:	8b 45 08             	mov    0x8(%ebp),%eax
    4444:	8b 40 04             	mov    0x4(%eax),%eax
    4447:	8d 50 ff             	lea    -0x1(%eax),%edx
    444a:	8b 45 08             	mov    0x8(%ebp),%eax
    444d:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
    4450:	8b 45 08             	mov    0x8(%ebp),%eax
    4453:	89 04 24             	mov    %eax,(%esp)
    4456:	e8 79 fd ff ff       	call   41d4 <lock_release>
	}
}
    445b:	c9                   	leave  
    445c:	c3                   	ret    

0000445d <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
    445d:	55                   	push   %ebp
    445e:	89 e5                	mov    %esp,%ebp
    4460:	83 ec 28             	sub    $0x28,%esp
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
    4463:	8b 45 08             	mov    0x8(%ebp),%eax
    4466:	89 04 24             	mov    %eax,(%esp)
    4469:	e8 46 fd ff ff       	call   41b4 <lock_acquire>
	if(s->count < s->size){
    446e:	8b 45 08             	mov    0x8(%ebp),%eax
    4471:	8b 50 04             	mov    0x4(%eax),%edx
    4474:	8b 45 08             	mov    0x8(%ebp),%eax
    4477:	8b 40 08             	mov    0x8(%eax),%eax
    447a:	39 c2                	cmp    %eax,%edx
    447c:	7d 40                	jge    44be <sem_signal+0x61>
		int tid;
		tid = pop_q(&s->waiters);
    447e:	8b 45 08             	mov    0x8(%ebp),%eax
    4481:	83 c0 0c             	add    $0xc,%eax
    4484:	89 04 24             	mov    %eax,(%esp)
    4487:	e8 cc fe ff ff       	call   4358 <pop_q>
    448c:	89 45 f4             	mov    %eax,-0xc(%ebp)
		if(tid != -1) twakeup(tid);
    448f:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    4493:	74 0d                	je     44a2 <sem_signal+0x45>
    4495:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4498:	89 04 24             	mov    %eax,(%esp)
    449b:	e8 30 f8 ff ff       	call   3cd0 <twakeup>
    44a0:	eb 0f                	jmp    44b1 <sem_signal+0x54>
		else s->count++;	
    44a2:	8b 45 08             	mov    0x8(%ebp),%eax
    44a5:	8b 40 04             	mov    0x4(%eax),%eax
    44a8:	8d 50 01             	lea    0x1(%eax),%edx
    44ab:	8b 45 08             	mov    0x8(%ebp),%eax
    44ae:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
    44b1:	8b 45 08             	mov    0x8(%ebp),%eax
    44b4:	89 04 24             	mov    %eax,(%esp)
    44b7:	e8 18 fd ff ff       	call   41d4 <lock_release>
    44bc:	eb 27                	jmp    44e5 <sem_signal+0x88>
	}
	else{
		int tid;
		tid = pop_q(&s->waiters);
    44be:	8b 45 08             	mov    0x8(%ebp),%eax
    44c1:	83 c0 0c             	add    $0xc,%eax
    44c4:	89 04 24             	mov    %eax,(%esp)
    44c7:	e8 8c fe ff ff       	call   4358 <pop_q>
    44cc:	89 45 f0             	mov    %eax,-0x10(%ebp)
		twakeup(tid);
    44cf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    44d2:	89 04 24             	mov    %eax,(%esp)
    44d5:	e8 f6 f7 ff ff       	call   3cd0 <twakeup>
		lock_release(&s->lock);
    44da:	8b 45 08             	mov    0x8(%ebp),%eax
    44dd:	89 04 24             	mov    %eax,(%esp)
    44e0:	e8 ef fc ff ff       	call   41d4 <lock_release>
	}

    44e5:	c9                   	leave  
    44e6:	c3                   	ret    
