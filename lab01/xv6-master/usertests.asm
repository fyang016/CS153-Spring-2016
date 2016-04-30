
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
       6:	a1 88 5d 00 00       	mov    0x5d88,%eax
       b:	c7 44 24 04 be 46 00 	movl   $0x46be,0x4(%esp)
      12:	00 
      13:	89 04 24             	mov    %eax,(%esp)
      16:	e8 c6 42 00 00       	call   42e1 <printf>
  fd = open("echo", 0);
      1b:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      22:	00 
      23:	c7 04 24 a8 46 00 00 	movl   $0x46a8,(%esp)
      2a:	e8 69 41 00 00       	call   4198 <open>
      2f:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
      32:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      36:	79 21                	jns    59 <opentest+0x59>
    printf(stdout, "open echo failed!\n");
      38:	a1 88 5d 00 00       	mov    0x5d88,%eax
      3d:	c7 44 24 04 c9 46 00 	movl   $0x46c9,0x4(%esp)
      44:	00 
      45:	89 04 24             	mov    %eax,(%esp)
      48:	e8 94 42 00 00       	call   42e1 <printf>
    exit(1);
      4d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
      54:	e8 f7 40 00 00       	call   4150 <exit>
  }
  close(fd);
      59:	8b 45 f4             	mov    -0xc(%ebp),%eax
      5c:	89 04 24             	mov    %eax,(%esp)
      5f:	e8 1c 41 00 00       	call   4180 <close>
  fd = open("doesnotexist", 0);
      64:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      6b:	00 
      6c:	c7 04 24 dc 46 00 00 	movl   $0x46dc,(%esp)
      73:	e8 20 41 00 00       	call   4198 <open>
      78:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
      7b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
      7f:	78 21                	js     a2 <opentest+0xa2>
    printf(stdout, "open doesnotexist succeeded!\n");
      81:	a1 88 5d 00 00       	mov    0x5d88,%eax
      86:	c7 44 24 04 e9 46 00 	movl   $0x46e9,0x4(%esp)
      8d:	00 
      8e:	89 04 24             	mov    %eax,(%esp)
      91:	e8 4b 42 00 00       	call   42e1 <printf>
    exit(0);
      96:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
      9d:	e8 ae 40 00 00       	call   4150 <exit>
  }
  printf(stdout, "open test ok\n");
      a2:	a1 88 5d 00 00       	mov    0x5d88,%eax
      a7:	c7 44 24 04 07 47 00 	movl   $0x4707,0x4(%esp)
      ae:	00 
      af:	89 04 24             	mov    %eax,(%esp)
      b2:	e8 2a 42 00 00       	call   42e1 <printf>
}
      b7:	c9                   	leave  
      b8:	c3                   	ret    

000000b9 <writetest>:

void
writetest(void)
{
      b9:	55                   	push   %ebp
      ba:	89 e5                	mov    %esp,%ebp
      bc:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int i;

  printf(stdout, "small file test\n");
      bf:	a1 88 5d 00 00       	mov    0x5d88,%eax
      c4:	c7 44 24 04 15 47 00 	movl   $0x4715,0x4(%esp)
      cb:	00 
      cc:	89 04 24             	mov    %eax,(%esp)
      cf:	e8 0d 42 00 00       	call   42e1 <printf>
  fd = open("small", O_CREATE|O_RDWR);
      d4:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
      db:	00 
      dc:	c7 04 24 26 47 00 00 	movl   $0x4726,(%esp)
      e3:	e8 b0 40 00 00       	call   4198 <open>
      e8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
      eb:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
      ef:	78 21                	js     112 <writetest+0x59>
    printf(stdout, "creat small succeeded; ok\n");
      f1:	a1 88 5d 00 00       	mov    0x5d88,%eax
      f6:	c7 44 24 04 2c 47 00 	movl   $0x472c,0x4(%esp)
      fd:	00 
      fe:	89 04 24             	mov    %eax,(%esp)
     101:	e8 db 41 00 00       	call   42e1 <printf>
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(1);
  }
  for(i = 0; i < 100; i++){
     106:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     10d:	e9 b5 00 00 00       	jmp    1c7 <writetest+0x10e>
  printf(stdout, "small file test\n");
  fd = open("small", O_CREATE|O_RDWR);
  if(fd >= 0){
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
     112:	a1 88 5d 00 00       	mov    0x5d88,%eax
     117:	c7 44 24 04 47 47 00 	movl   $0x4747,0x4(%esp)
     11e:	00 
     11f:	89 04 24             	mov    %eax,(%esp)
     122:	e8 ba 41 00 00       	call   42e1 <printf>
    exit(1);
     127:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     12e:	e8 1d 40 00 00       	call   4150 <exit>
  }
  for(i = 0; i < 100; i++){
    if(write(fd, "aaaaaaaaaa", 10) != 10){
     133:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     13a:	00 
     13b:	c7 44 24 04 63 47 00 	movl   $0x4763,0x4(%esp)
     142:	00 
     143:	8b 45 f0             	mov    -0x10(%ebp),%eax
     146:	89 04 24             	mov    %eax,(%esp)
     149:	e8 2a 40 00 00       	call   4178 <write>
     14e:	83 f8 0a             	cmp    $0xa,%eax
     151:	74 28                	je     17b <writetest+0xc2>
      printf(stdout, "error: write aa %d new file failed\n", i);
     153:	a1 88 5d 00 00       	mov    0x5d88,%eax
     158:	8b 55 f4             	mov    -0xc(%ebp),%edx
     15b:	89 54 24 08          	mov    %edx,0x8(%esp)
     15f:	c7 44 24 04 70 47 00 	movl   $0x4770,0x4(%esp)
     166:	00 
     167:	89 04 24             	mov    %eax,(%esp)
     16a:	e8 72 41 00 00       	call   42e1 <printf>
      exit(1);
     16f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     176:	e8 d5 3f 00 00       	call   4150 <exit>
    }
    if(write(fd, "bbbbbbbbbb", 10) != 10){
     17b:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     182:	00 
     183:	c7 44 24 04 94 47 00 	movl   $0x4794,0x4(%esp)
     18a:	00 
     18b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     18e:	89 04 24             	mov    %eax,(%esp)
     191:	e8 e2 3f 00 00       	call   4178 <write>
     196:	83 f8 0a             	cmp    $0xa,%eax
     199:	74 28                	je     1c3 <writetest+0x10a>
      printf(stdout, "error: write bb %d new file failed\n", i);
     19b:	a1 88 5d 00 00       	mov    0x5d88,%eax
     1a0:	8b 55 f4             	mov    -0xc(%ebp),%edx
     1a3:	89 54 24 08          	mov    %edx,0x8(%esp)
     1a7:	c7 44 24 04 a0 47 00 	movl   $0x47a0,0x4(%esp)
     1ae:	00 
     1af:	89 04 24             	mov    %eax,(%esp)
     1b2:	e8 2a 41 00 00       	call   42e1 <printf>
      exit(1);
     1b7:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     1be:	e8 8d 3f 00 00       	call   4150 <exit>
    printf(stdout, "creat small succeeded; ok\n");
  } else {
    printf(stdout, "error: creat small failed!\n");
    exit(1);
  }
  for(i = 0; i < 100; i++){
     1c3:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     1c7:	83 7d f4 63          	cmpl   $0x63,-0xc(%ebp)
     1cb:	0f 8e 62 ff ff ff    	jle    133 <writetest+0x7a>
    if(write(fd, "bbbbbbbbbb", 10) != 10){
      printf(stdout, "error: write bb %d new file failed\n", i);
      exit(1);
    }
  }
  printf(stdout, "writes ok\n");
     1d1:	a1 88 5d 00 00       	mov    0x5d88,%eax
     1d6:	c7 44 24 04 c4 47 00 	movl   $0x47c4,0x4(%esp)
     1dd:	00 
     1de:	89 04 24             	mov    %eax,(%esp)
     1e1:	e8 fb 40 00 00       	call   42e1 <printf>
  close(fd);
     1e6:	8b 45 f0             	mov    -0x10(%ebp),%eax
     1e9:	89 04 24             	mov    %eax,(%esp)
     1ec:	e8 8f 3f 00 00       	call   4180 <close>
  fd = open("small", O_RDONLY);
     1f1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     1f8:	00 
     1f9:	c7 04 24 26 47 00 00 	movl   $0x4726,(%esp)
     200:	e8 93 3f 00 00       	call   4198 <open>
     205:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd >= 0){
     208:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     20c:	78 3e                	js     24c <writetest+0x193>
    printf(stdout, "open small succeeded ok\n");
     20e:	a1 88 5d 00 00       	mov    0x5d88,%eax
     213:	c7 44 24 04 cf 47 00 	movl   $0x47cf,0x4(%esp)
     21a:	00 
     21b:	89 04 24             	mov    %eax,(%esp)
     21e:	e8 be 40 00 00       	call   42e1 <printf>
  } else {
    printf(stdout, "error: open small failed!\n");
    exit(1);
  }
  i = read(fd, buf, 2000);
     223:	c7 44 24 08 d0 07 00 	movl   $0x7d0,0x8(%esp)
     22a:	00 
     22b:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
     232:	00 
     233:	8b 45 f0             	mov    -0x10(%ebp),%eax
     236:	89 04 24             	mov    %eax,(%esp)
     239:	e8 32 3f 00 00       	call   4170 <read>
     23e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(i == 2000){
     241:	81 7d f4 d0 07 00 00 	cmpl   $0x7d0,-0xc(%ebp)
     248:	74 23                	je     26d <writetest+0x1b4>
     24a:	eb 53                	jmp    29f <writetest+0x1e6>
  close(fd);
  fd = open("small", O_RDONLY);
  if(fd >= 0){
    printf(stdout, "open small succeeded ok\n");
  } else {
    printf(stdout, "error: open small failed!\n");
     24c:	a1 88 5d 00 00       	mov    0x5d88,%eax
     251:	c7 44 24 04 e8 47 00 	movl   $0x47e8,0x4(%esp)
     258:	00 
     259:	89 04 24             	mov    %eax,(%esp)
     25c:	e8 80 40 00 00       	call   42e1 <printf>
    exit(1);
     261:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     268:	e8 e3 3e 00 00       	call   4150 <exit>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
     26d:	a1 88 5d 00 00       	mov    0x5d88,%eax
     272:	c7 44 24 04 03 48 00 	movl   $0x4803,0x4(%esp)
     279:	00 
     27a:	89 04 24             	mov    %eax,(%esp)
     27d:	e8 5f 40 00 00       	call   42e1 <printf>
  } else {
    printf(stdout, "read failed\n");
    exit(1);
  }
  close(fd);
     282:	8b 45 f0             	mov    -0x10(%ebp),%eax
     285:	89 04 24             	mov    %eax,(%esp)
     288:	e8 f3 3e 00 00       	call   4180 <close>

  if(unlink("small") < 0){
     28d:	c7 04 24 26 47 00 00 	movl   $0x4726,(%esp)
     294:	e8 0f 3f 00 00       	call   41a8 <unlink>
     299:	85 c0                	test   %eax,%eax
     29b:	78 23                	js     2c0 <writetest+0x207>
     29d:	eb 42                	jmp    2e1 <writetest+0x228>
  }
  i = read(fd, buf, 2000);
  if(i == 2000){
    printf(stdout, "read succeeded ok\n");
  } else {
    printf(stdout, "read failed\n");
     29f:	a1 88 5d 00 00       	mov    0x5d88,%eax
     2a4:	c7 44 24 04 16 48 00 	movl   $0x4816,0x4(%esp)
     2ab:	00 
     2ac:	89 04 24             	mov    %eax,(%esp)
     2af:	e8 2d 40 00 00       	call   42e1 <printf>
    exit(1);
     2b4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2bb:	e8 90 3e 00 00       	call   4150 <exit>
  }
  close(fd);

  if(unlink("small") < 0){
    printf(stdout, "unlink small failed\n");
     2c0:	a1 88 5d 00 00       	mov    0x5d88,%eax
     2c5:	c7 44 24 04 23 48 00 	movl   $0x4823,0x4(%esp)
     2cc:	00 
     2cd:	89 04 24             	mov    %eax,(%esp)
     2d0:	e8 0c 40 00 00       	call   42e1 <printf>
    exit(1);
     2d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2dc:	e8 6f 3e 00 00       	call   4150 <exit>
  }
  printf(stdout, "small file test ok\n");
     2e1:	a1 88 5d 00 00       	mov    0x5d88,%eax
     2e6:	c7 44 24 04 38 48 00 	movl   $0x4838,0x4(%esp)
     2ed:	00 
     2ee:	89 04 24             	mov    %eax,(%esp)
     2f1:	e8 eb 3f 00 00       	call   42e1 <printf>
}
     2f6:	c9                   	leave  
     2f7:	c3                   	ret    

000002f8 <writetest1>:

void
writetest1(void)
{
     2f8:	55                   	push   %ebp
     2f9:	89 e5                	mov    %esp,%ebp
     2fb:	83 ec 28             	sub    $0x28,%esp
  int i, fd, n;

  printf(stdout, "big files test\n");
     2fe:	a1 88 5d 00 00       	mov    0x5d88,%eax
     303:	c7 44 24 04 4c 48 00 	movl   $0x484c,0x4(%esp)
     30a:	00 
     30b:	89 04 24             	mov    %eax,(%esp)
     30e:	e8 ce 3f 00 00       	call   42e1 <printf>

  fd = open("big", O_CREATE|O_RDWR);
     313:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     31a:	00 
     31b:	c7 04 24 5c 48 00 00 	movl   $0x485c,(%esp)
     322:	e8 71 3e 00 00       	call   4198 <open>
     327:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
     32a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     32e:	79 21                	jns    351 <writetest1+0x59>
    printf(stdout, "error: creat big failed!\n");
     330:	a1 88 5d 00 00       	mov    0x5d88,%eax
     335:	c7 44 24 04 60 48 00 	movl   $0x4860,0x4(%esp)
     33c:	00 
     33d:	89 04 24             	mov    %eax,(%esp)
     340:	e8 9c 3f 00 00       	call   42e1 <printf>
    exit(1);
     345:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     34c:	e8 ff 3d 00 00       	call   4150 <exit>
  }

  for(i = 0; i < MAXFILE; i++){
     351:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     358:	eb 58                	jmp    3b2 <writetest1+0xba>
    ((int*)buf)[0] = i;
     35a:	b8 80 85 00 00       	mov    $0x8580,%eax
     35f:	8b 55 ec             	mov    -0x14(%ebp),%edx
     362:	89 10                	mov    %edx,(%eax)
    if(write(fd, buf, 512) != 512){
     364:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     36b:	00 
     36c:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
     373:	00 
     374:	8b 45 f0             	mov    -0x10(%ebp),%eax
     377:	89 04 24             	mov    %eax,(%esp)
     37a:	e8 f9 3d 00 00       	call   4178 <write>
     37f:	3d 00 02 00 00       	cmp    $0x200,%eax
     384:	74 28                	je     3ae <writetest1+0xb6>
      printf(stdout, "error: write big file failed\n", i);
     386:	a1 88 5d 00 00       	mov    0x5d88,%eax
     38b:	8b 55 ec             	mov    -0x14(%ebp),%edx
     38e:	89 54 24 08          	mov    %edx,0x8(%esp)
     392:	c7 44 24 04 7a 48 00 	movl   $0x487a,0x4(%esp)
     399:	00 
     39a:	89 04 24             	mov    %eax,(%esp)
     39d:	e8 3f 3f 00 00       	call   42e1 <printf>
      exit(1);
     3a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3a9:	e8 a2 3d 00 00       	call   4150 <exit>
  if(fd < 0){
    printf(stdout, "error: creat big failed!\n");
    exit(1);
  }

  for(i = 0; i < MAXFILE; i++){
     3ae:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
     3b2:	8b 45 ec             	mov    -0x14(%ebp),%eax
     3b5:	3d 8b 00 00 00       	cmp    $0x8b,%eax
     3ba:	76 9e                	jbe    35a <writetest1+0x62>
      printf(stdout, "error: write big file failed\n", i);
      exit(1);
    }
  }

  close(fd);
     3bc:	8b 45 f0             	mov    -0x10(%ebp),%eax
     3bf:	89 04 24             	mov    %eax,(%esp)
     3c2:	e8 b9 3d 00 00       	call   4180 <close>

  fd = open("big", O_RDONLY);
     3c7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     3ce:	00 
     3cf:	c7 04 24 5c 48 00 00 	movl   $0x485c,(%esp)
     3d6:	e8 bd 3d 00 00       	call   4198 <open>
     3db:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
     3de:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     3e2:	79 21                	jns    405 <writetest1+0x10d>
    printf(stdout, "error: open big failed!\n");
     3e4:	a1 88 5d 00 00       	mov    0x5d88,%eax
     3e9:	c7 44 24 04 98 48 00 	movl   $0x4898,0x4(%esp)
     3f0:	00 
     3f1:	89 04 24             	mov    %eax,(%esp)
     3f4:	e8 e8 3e 00 00       	call   42e1 <printf>
    exit(1);
     3f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     400:	e8 4b 3d 00 00       	call   4150 <exit>
  }

  n = 0;
     405:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  for(;;){
    i = read(fd, buf, 512);
     40c:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     413:	00 
     414:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
     41b:	00 
     41c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     41f:	89 04 24             	mov    %eax,(%esp)
     422:	e8 49 3d 00 00       	call   4170 <read>
     427:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(i == 0){
     42a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     42e:	75 35                	jne    465 <writetest1+0x16d>
      if(n == MAXFILE - 1){
     430:	81 7d f4 8b 00 00 00 	cmpl   $0x8b,-0xc(%ebp)
     437:	0f 85 a1 00 00 00    	jne    4de <writetest1+0x1e6>
        printf(stdout, "read only %d blocks from big", n);
     43d:	a1 88 5d 00 00       	mov    0x5d88,%eax
     442:	8b 55 f4             	mov    -0xc(%ebp),%edx
     445:	89 54 24 08          	mov    %edx,0x8(%esp)
     449:	c7 44 24 04 b1 48 00 	movl   $0x48b1,0x4(%esp)
     450:	00 
     451:	89 04 24             	mov    %eax,(%esp)
     454:	e8 88 3e 00 00       	call   42e1 <printf>
        exit(1);
     459:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     460:	e8 eb 3c 00 00       	call   4150 <exit>
      }
      break;
    } else if(i != 512){
     465:	81 7d ec 00 02 00 00 	cmpl   $0x200,-0x14(%ebp)
     46c:	74 28                	je     496 <writetest1+0x19e>
      printf(stdout, "read failed %d\n", i);
     46e:	a1 88 5d 00 00       	mov    0x5d88,%eax
     473:	8b 55 ec             	mov    -0x14(%ebp),%edx
     476:	89 54 24 08          	mov    %edx,0x8(%esp)
     47a:	c7 44 24 04 ce 48 00 	movl   $0x48ce,0x4(%esp)
     481:	00 
     482:	89 04 24             	mov    %eax,(%esp)
     485:	e8 57 3e 00 00       	call   42e1 <printf>
      exit(1);
     48a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     491:	e8 ba 3c 00 00       	call   4150 <exit>
    }
    if(((int*)buf)[0] != n){
     496:	b8 80 85 00 00       	mov    $0x8580,%eax
     49b:	8b 00                	mov    (%eax),%eax
     49d:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     4a0:	74 33                	je     4d5 <writetest1+0x1dd>
      printf(stdout, "read content of block %d is %d\n",
             n, ((int*)buf)[0]);
     4a2:	b8 80 85 00 00       	mov    $0x8580,%eax
    } else if(i != 512){
      printf(stdout, "read failed %d\n", i);
      exit(1);
    }
    if(((int*)buf)[0] != n){
      printf(stdout, "read content of block %d is %d\n",
     4a7:	8b 10                	mov    (%eax),%edx
     4a9:	a1 88 5d 00 00       	mov    0x5d88,%eax
     4ae:	89 54 24 0c          	mov    %edx,0xc(%esp)
     4b2:	8b 55 f4             	mov    -0xc(%ebp),%edx
     4b5:	89 54 24 08          	mov    %edx,0x8(%esp)
     4b9:	c7 44 24 04 e0 48 00 	movl   $0x48e0,0x4(%esp)
     4c0:	00 
     4c1:	89 04 24             	mov    %eax,(%esp)
     4c4:	e8 18 3e 00 00       	call   42e1 <printf>
             n, ((int*)buf)[0]);
      exit(1);
     4c9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     4d0:	e8 7b 3c 00 00       	call   4150 <exit>
    }
    n++;
     4d5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
  }
     4d9:	e9 2e ff ff ff       	jmp    40c <writetest1+0x114>
    if(i == 0){
      if(n == MAXFILE - 1){
        printf(stdout, "read only %d blocks from big", n);
        exit(1);
      }
      break;
     4de:	90                   	nop
             n, ((int*)buf)[0]);
      exit(1);
    }
    n++;
  }
  close(fd);
     4df:	8b 45 f0             	mov    -0x10(%ebp),%eax
     4e2:	89 04 24             	mov    %eax,(%esp)
     4e5:	e8 96 3c 00 00       	call   4180 <close>
  if(unlink("big") < 0){
     4ea:	c7 04 24 5c 48 00 00 	movl   $0x485c,(%esp)
     4f1:	e8 b2 3c 00 00       	call   41a8 <unlink>
     4f6:	85 c0                	test   %eax,%eax
     4f8:	79 21                	jns    51b <writetest1+0x223>
    printf(stdout, "unlink big failed\n");
     4fa:	a1 88 5d 00 00       	mov    0x5d88,%eax
     4ff:	c7 44 24 04 00 49 00 	movl   $0x4900,0x4(%esp)
     506:	00 
     507:	89 04 24             	mov    %eax,(%esp)
     50a:	e8 d2 3d 00 00       	call   42e1 <printf>
    exit(1);
     50f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     516:	e8 35 3c 00 00       	call   4150 <exit>
  }
  printf(stdout, "big files ok\n");
     51b:	a1 88 5d 00 00       	mov    0x5d88,%eax
     520:	c7 44 24 04 13 49 00 	movl   $0x4913,0x4(%esp)
     527:	00 
     528:	89 04 24             	mov    %eax,(%esp)
     52b:	e8 b1 3d 00 00       	call   42e1 <printf>
}
     530:	c9                   	leave  
     531:	c3                   	ret    

00000532 <createtest>:

void
createtest(void)
{
     532:	55                   	push   %ebp
     533:	89 e5                	mov    %esp,%ebp
     535:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(stdout, "many creates, followed by unlink test\n");
     538:	a1 88 5d 00 00       	mov    0x5d88,%eax
     53d:	c7 44 24 04 24 49 00 	movl   $0x4924,0x4(%esp)
     544:	00 
     545:	89 04 24             	mov    %eax,(%esp)
     548:	e8 94 3d 00 00       	call   42e1 <printf>

  name[0] = 'a';
     54d:	c6 05 80 a5 00 00 61 	movb   $0x61,0xa580
  name[2] = '\0';
     554:	c6 05 82 a5 00 00 00 	movb   $0x0,0xa582
  for(i = 0; i < 52; i++){
     55b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     562:	eb 31                	jmp    595 <createtest+0x63>
    name[1] = '0' + i;
     564:	8b 45 f0             	mov    -0x10(%ebp),%eax
     567:	83 c0 30             	add    $0x30,%eax
     56a:	a2 81 a5 00 00       	mov    %al,0xa581
    fd = open(name, O_CREATE|O_RDWR);
     56f:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     576:	00 
     577:	c7 04 24 80 a5 00 00 	movl   $0xa580,(%esp)
     57e:	e8 15 3c 00 00       	call   4198 <open>
     583:	89 45 f4             	mov    %eax,-0xc(%ebp)
    close(fd);
     586:	8b 45 f4             	mov    -0xc(%ebp),%eax
     589:	89 04 24             	mov    %eax,(%esp)
     58c:	e8 ef 3b 00 00       	call   4180 <close>

  printf(stdout, "many creates, followed by unlink test\n");

  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     591:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     595:	83 7d f0 33          	cmpl   $0x33,-0x10(%ebp)
     599:	7e c9                	jle    564 <createtest+0x32>
    name[1] = '0' + i;
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
     59b:	c6 05 80 a5 00 00 61 	movb   $0x61,0xa580
  name[2] = '\0';
     5a2:	c6 05 82 a5 00 00 00 	movb   $0x0,0xa582
  for(i = 0; i < 52; i++){
     5a9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     5b0:	eb 1b                	jmp    5cd <createtest+0x9b>
    name[1] = '0' + i;
     5b2:	8b 45 f0             	mov    -0x10(%ebp),%eax
     5b5:	83 c0 30             	add    $0x30,%eax
     5b8:	a2 81 a5 00 00       	mov    %al,0xa581
    unlink(name);
     5bd:	c7 04 24 80 a5 00 00 	movl   $0xa580,(%esp)
     5c4:	e8 df 3b 00 00       	call   41a8 <unlink>
    fd = open(name, O_CREATE|O_RDWR);
    close(fd);
  }
  name[0] = 'a';
  name[2] = '\0';
  for(i = 0; i < 52; i++){
     5c9:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     5cd:	83 7d f0 33          	cmpl   $0x33,-0x10(%ebp)
     5d1:	7e df                	jle    5b2 <createtest+0x80>
    name[1] = '0' + i;
    unlink(name);
  }
  printf(stdout, "many creates, followed by unlink; ok\n");
     5d3:	a1 88 5d 00 00       	mov    0x5d88,%eax
     5d8:	c7 44 24 04 4c 49 00 	movl   $0x494c,0x4(%esp)
     5df:	00 
     5e0:	89 04 24             	mov    %eax,(%esp)
     5e3:	e8 f9 3c 00 00       	call   42e1 <printf>
}
     5e8:	c9                   	leave  
     5e9:	c3                   	ret    

000005ea <dirtest>:

void dirtest(void)
{
     5ea:	55                   	push   %ebp
     5eb:	89 e5                	mov    %esp,%ebp
     5ed:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "mkdir test\n");
     5f0:	a1 88 5d 00 00       	mov    0x5d88,%eax
     5f5:	c7 44 24 04 72 49 00 	movl   $0x4972,0x4(%esp)
     5fc:	00 
     5fd:	89 04 24             	mov    %eax,(%esp)
     600:	e8 dc 3c 00 00       	call   42e1 <printf>

  if(mkdir("dir0") < 0){
     605:	c7 04 24 7e 49 00 00 	movl   $0x497e,(%esp)
     60c:	e8 af 3b 00 00       	call   41c0 <mkdir>
     611:	85 c0                	test   %eax,%eax
     613:	79 21                	jns    636 <dirtest+0x4c>
    printf(stdout, "mkdir failed\n");
     615:	a1 88 5d 00 00       	mov    0x5d88,%eax
     61a:	c7 44 24 04 83 49 00 	movl   $0x4983,0x4(%esp)
     621:	00 
     622:	89 04 24             	mov    %eax,(%esp)
     625:	e8 b7 3c 00 00       	call   42e1 <printf>
    exit(1);
     62a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     631:	e8 1a 3b 00 00       	call   4150 <exit>
  }

  if(chdir("dir0") < 0){
     636:	c7 04 24 7e 49 00 00 	movl   $0x497e,(%esp)
     63d:	e8 86 3b 00 00       	call   41c8 <chdir>
     642:	85 c0                	test   %eax,%eax
     644:	79 21                	jns    667 <dirtest+0x7d>
    printf(stdout, "chdir dir0 failed\n");
     646:	a1 88 5d 00 00       	mov    0x5d88,%eax
     64b:	c7 44 24 04 91 49 00 	movl   $0x4991,0x4(%esp)
     652:	00 
     653:	89 04 24             	mov    %eax,(%esp)
     656:	e8 86 3c 00 00       	call   42e1 <printf>
    exit(1);
     65b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     662:	e8 e9 3a 00 00       	call   4150 <exit>
  }

  if(chdir("..") < 0){
     667:	c7 04 24 a4 49 00 00 	movl   $0x49a4,(%esp)
     66e:	e8 55 3b 00 00       	call   41c8 <chdir>
     673:	85 c0                	test   %eax,%eax
     675:	79 21                	jns    698 <dirtest+0xae>
    printf(stdout, "chdir .. failed\n");
     677:	a1 88 5d 00 00       	mov    0x5d88,%eax
     67c:	c7 44 24 04 a7 49 00 	movl   $0x49a7,0x4(%esp)
     683:	00 
     684:	89 04 24             	mov    %eax,(%esp)
     687:	e8 55 3c 00 00       	call   42e1 <printf>
    exit(1);
     68c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     693:	e8 b8 3a 00 00       	call   4150 <exit>
  }

  if(unlink("dir0") < 0){
     698:	c7 04 24 7e 49 00 00 	movl   $0x497e,(%esp)
     69f:	e8 04 3b 00 00       	call   41a8 <unlink>
     6a4:	85 c0                	test   %eax,%eax
     6a6:	79 21                	jns    6c9 <dirtest+0xdf>
    printf(stdout, "unlink dir0 failed\n");
     6a8:	a1 88 5d 00 00       	mov    0x5d88,%eax
     6ad:	c7 44 24 04 b8 49 00 	movl   $0x49b8,0x4(%esp)
     6b4:	00 
     6b5:	89 04 24             	mov    %eax,(%esp)
     6b8:	e8 24 3c 00 00       	call   42e1 <printf>
    exit(1);
     6bd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     6c4:	e8 87 3a 00 00       	call   4150 <exit>
  }
  printf(stdout, "mkdir test\n");
     6c9:	a1 88 5d 00 00       	mov    0x5d88,%eax
     6ce:	c7 44 24 04 72 49 00 	movl   $0x4972,0x4(%esp)
     6d5:	00 
     6d6:	89 04 24             	mov    %eax,(%esp)
     6d9:	e8 03 3c 00 00       	call   42e1 <printf>
}
     6de:	c9                   	leave  
     6df:	c3                   	ret    

000006e0 <exectest>:

void
exectest(void)
{
     6e0:	55                   	push   %ebp
     6e1:	89 e5                	mov    %esp,%ebp
     6e3:	83 ec 18             	sub    $0x18,%esp
  printf(stdout, "exec test\n");
     6e6:	a1 88 5d 00 00       	mov    0x5d88,%eax
     6eb:	c7 44 24 04 cc 49 00 	movl   $0x49cc,0x4(%esp)
     6f2:	00 
     6f3:	89 04 24             	mov    %eax,(%esp)
     6f6:	e8 e6 3b 00 00       	call   42e1 <printf>
  if(exec("echo", echoargv) < 0){
     6fb:	c7 44 24 04 74 5d 00 	movl   $0x5d74,0x4(%esp)
     702:	00 
     703:	c7 04 24 a8 46 00 00 	movl   $0x46a8,(%esp)
     70a:	e8 81 3a 00 00       	call   4190 <exec>
     70f:	85 c0                	test   %eax,%eax
     711:	79 21                	jns    734 <exectest+0x54>
    printf(stdout, "exec echo failed\n");
     713:	a1 88 5d 00 00       	mov    0x5d88,%eax
     718:	c7 44 24 04 d7 49 00 	movl   $0x49d7,0x4(%esp)
     71f:	00 
     720:	89 04 24             	mov    %eax,(%esp)
     723:	e8 b9 3b 00 00       	call   42e1 <printf>
    exit(1);
     728:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     72f:	e8 1c 3a 00 00       	call   4150 <exit>
  }
}
     734:	c9                   	leave  
     735:	c3                   	ret    

00000736 <pipe1>:

// simple fork and pipe read/write

void
pipe1(void)
{
     736:	55                   	push   %ebp
     737:	89 e5                	mov    %esp,%ebp
     739:	83 ec 38             	sub    $0x38,%esp
  int fds[2], pid;
  int seq, i, n, cc, total;

  if(pipe(fds) != 0){
     73c:	8d 45 d8             	lea    -0x28(%ebp),%eax
     73f:	89 04 24             	mov    %eax,(%esp)
     742:	e8 21 3a 00 00       	call   4168 <pipe>
     747:	85 c0                	test   %eax,%eax
     749:	74 20                	je     76b <pipe1+0x35>
    printf(1, "pipe() failed\n");
     74b:	c7 44 24 04 e9 49 00 	movl   $0x49e9,0x4(%esp)
     752:	00 
     753:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     75a:	e8 82 3b 00 00       	call   42e1 <printf>
    exit(1);
     75f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     766:	e8 e5 39 00 00       	call   4150 <exit>
  }
  pid = fork();
     76b:	e8 d8 39 00 00       	call   4148 <fork>
     770:	89 45 e0             	mov    %eax,-0x20(%ebp)
  seq = 0;
     773:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  if(pid == 0){
     77a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     77e:	0f 85 92 00 00 00    	jne    816 <pipe1+0xe0>
    close(fds[0]);
     784:	8b 45 d8             	mov    -0x28(%ebp),%eax
     787:	89 04 24             	mov    %eax,(%esp)
     78a:	e8 f1 39 00 00       	call   4180 <close>
    for(n = 0; n < 5; n++){
     78f:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
     796:	eb 6c                	jmp    804 <pipe1+0xce>
      for(i = 0; i < 1033; i++)
     798:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     79f:	eb 14                	jmp    7b5 <pipe1+0x7f>
        buf[i] = seq++;
     7a1:	8b 45 e8             	mov    -0x18(%ebp),%eax
     7a4:	8b 55 e4             	mov    -0x1c(%ebp),%edx
     7a7:	88 90 80 85 00 00    	mov    %dl,0x8580(%eax)
     7ad:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
      for(i = 0; i < 1033; i++)
     7b1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
     7b5:	81 7d e8 08 04 00 00 	cmpl   $0x408,-0x18(%ebp)
     7bc:	7e e3                	jle    7a1 <pipe1+0x6b>
        buf[i] = seq++;
      if(write(fds[1], buf, 1033) != 1033){
     7be:	8b 45 dc             	mov    -0x24(%ebp),%eax
     7c1:	c7 44 24 08 09 04 00 	movl   $0x409,0x8(%esp)
     7c8:	00 
     7c9:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
     7d0:	00 
     7d1:	89 04 24             	mov    %eax,(%esp)
     7d4:	e8 9f 39 00 00       	call   4178 <write>
     7d9:	3d 09 04 00 00       	cmp    $0x409,%eax
     7de:	74 20                	je     800 <pipe1+0xca>
        printf(1, "pipe1 oops 1\n");
     7e0:	c7 44 24 04 f8 49 00 	movl   $0x49f8,0x4(%esp)
     7e7:	00 
     7e8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     7ef:	e8 ed 3a 00 00       	call   42e1 <printf>
        exit(1);
     7f4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     7fb:	e8 50 39 00 00       	call   4150 <exit>
  }
  pid = fork();
  seq = 0;
  if(pid == 0){
    close(fds[0]);
    for(n = 0; n < 5; n++){
     800:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
     804:	83 7d ec 04          	cmpl   $0x4,-0x14(%ebp)
     808:	7e 8e                	jle    798 <pipe1+0x62>
      if(write(fds[1], buf, 1033) != 1033){
        printf(1, "pipe1 oops 1\n");
        exit(1);
      }
    }
    exit(0);
     80a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     811:	e8 3a 39 00 00       	call   4150 <exit>
  } else if(pid > 0){
     816:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     81a:	0f 8e 09 01 00 00    	jle    929 <pipe1+0x1f3>
    close(fds[1]);
     820:	8b 45 dc             	mov    -0x24(%ebp),%eax
     823:	89 04 24             	mov    %eax,(%esp)
     826:	e8 55 39 00 00       	call   4180 <close>
    total = 0;
     82b:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    cc = 1;
     832:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    while((n = read(fds[0], buf, cc)) > 0){
     839:	eb 6a                	jmp    8a5 <pipe1+0x16f>
      for(i = 0; i < n; i++){
     83b:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     842:	eb 3f                	jmp    883 <pipe1+0x14d>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
     844:	8b 45 e8             	mov    -0x18(%ebp),%eax
     847:	0f b6 80 80 85 00 00 	movzbl 0x8580(%eax),%eax
     84e:	0f be c0             	movsbl %al,%eax
     851:	33 45 e4             	xor    -0x1c(%ebp),%eax
     854:	25 ff 00 00 00       	and    $0xff,%eax
     859:	85 c0                	test   %eax,%eax
     85b:	0f 95 c0             	setne  %al
     85e:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
     862:	84 c0                	test   %al,%al
     864:	74 19                	je     87f <pipe1+0x149>
          printf(1, "pipe1 oops 2\n");
     866:	c7 44 24 04 06 4a 00 	movl   $0x4a06,0x4(%esp)
     86d:	00 
     86e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     875:	e8 67 3a 00 00       	call   42e1 <printf>
          return;
     87a:	e9 ca 00 00 00       	jmp    949 <pipe1+0x213>
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
      for(i = 0; i < n; i++){
     87f:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
     883:	8b 45 e8             	mov    -0x18(%ebp),%eax
     886:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     889:	7c b9                	jl     844 <pipe1+0x10e>
        if((buf[i] & 0xff) != (seq++ & 0xff)){
          printf(1, "pipe1 oops 2\n");
          return;
        }
      }
      total += n;
     88b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     88e:	01 45 f4             	add    %eax,-0xc(%ebp)
      cc = cc * 2;
     891:	d1 65 f0             	shll   -0x10(%ebp)
      if(cc > sizeof(buf))
     894:	8b 45 f0             	mov    -0x10(%ebp),%eax
     897:	3d 00 20 00 00       	cmp    $0x2000,%eax
     89c:	76 07                	jbe    8a5 <pipe1+0x16f>
        cc = sizeof(buf);
     89e:	c7 45 f0 00 20 00 00 	movl   $0x2000,-0x10(%ebp)
    exit(0);
  } else if(pid > 0){
    close(fds[1]);
    total = 0;
    cc = 1;
    while((n = read(fds[0], buf, cc)) > 0){
     8a5:	8b 45 d8             	mov    -0x28(%ebp),%eax
     8a8:	8b 55 f0             	mov    -0x10(%ebp),%edx
     8ab:	89 54 24 08          	mov    %edx,0x8(%esp)
     8af:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
     8b6:	00 
     8b7:	89 04 24             	mov    %eax,(%esp)
     8ba:	e8 b1 38 00 00       	call   4170 <read>
     8bf:	89 45 ec             	mov    %eax,-0x14(%ebp)
     8c2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     8c6:	0f 8f 6f ff ff ff    	jg     83b <pipe1+0x105>
      total += n;
      cc = cc * 2;
      if(cc > sizeof(buf))
        cc = sizeof(buf);
    }
    if(total != 5 * 1033){
     8cc:	81 7d f4 2d 14 00 00 	cmpl   $0x142d,-0xc(%ebp)
     8d3:	74 27                	je     8fc <pipe1+0x1c6>
      printf(1, "pipe1 oops 3 total %d\n", total);
     8d5:	8b 45 f4             	mov    -0xc(%ebp),%eax
     8d8:	89 44 24 08          	mov    %eax,0x8(%esp)
     8dc:	c7 44 24 04 14 4a 00 	movl   $0x4a14,0x4(%esp)
     8e3:	00 
     8e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     8eb:	e8 f1 39 00 00       	call   42e1 <printf>
      exit(0);
     8f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     8f7:	e8 54 38 00 00       	call   4150 <exit>
    }
    close(fds[0]);
     8fc:	8b 45 d8             	mov    -0x28(%ebp),%eax
     8ff:	89 04 24             	mov    %eax,(%esp)
     902:	e8 79 38 00 00       	call   4180 <close>
    wait(0);
     907:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     90e:	e8 45 38 00 00       	call   4158 <wait>
  } else {
    printf(1, "fork() failed\n");
    exit(1);
  }
  printf(1, "pipe1 ok\n");
     913:	c7 44 24 04 2b 4a 00 	movl   $0x4a2b,0x4(%esp)
     91a:	00 
     91b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     922:	e8 ba 39 00 00       	call   42e1 <printf>
     927:	eb 20                	jmp    949 <pipe1+0x213>
      exit(0);
    }
    close(fds[0]);
    wait(0);
  } else {
    printf(1, "fork() failed\n");
     929:	c7 44 24 04 35 4a 00 	movl   $0x4a35,0x4(%esp)
     930:	00 
     931:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     938:	e8 a4 39 00 00       	call   42e1 <printf>
    exit(1);
     93d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     944:	e8 07 38 00 00       	call   4150 <exit>
  }
  printf(1, "pipe1 ok\n");
}
     949:	c9                   	leave  
     94a:	c3                   	ret    

0000094b <preempt>:

// meant to be run w/ at most two CPUs
void
preempt(void)
{
     94b:	55                   	push   %ebp
     94c:	89 e5                	mov    %esp,%ebp
     94e:	83 ec 38             	sub    $0x38,%esp
  int pid1, pid2, pid3;
  int pfds[2];

  printf(1, "preempt: ");
     951:	c7 44 24 04 44 4a 00 	movl   $0x4a44,0x4(%esp)
     958:	00 
     959:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     960:	e8 7c 39 00 00       	call   42e1 <printf>
  pid1 = fork();
     965:	e8 de 37 00 00       	call   4148 <fork>
     96a:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid1 == 0)
     96d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     971:	75 02                	jne    975 <preempt+0x2a>
    for(;;)
      ;
     973:	eb fe                	jmp    973 <preempt+0x28>

  pid2 = fork();
     975:	e8 ce 37 00 00       	call   4148 <fork>
     97a:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(pid2 == 0)
     97d:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     981:	75 02                	jne    985 <preempt+0x3a>
    for(;;)
      ;
     983:	eb fe                	jmp    983 <preempt+0x38>

  pipe(pfds);
     985:	8d 45 e4             	lea    -0x1c(%ebp),%eax
     988:	89 04 24             	mov    %eax,(%esp)
     98b:	e8 d8 37 00 00       	call   4168 <pipe>
  pid3 = fork();
     990:	e8 b3 37 00 00       	call   4148 <fork>
     995:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(pid3 == 0){
     998:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     99c:	75 4c                	jne    9ea <preempt+0x9f>
    close(pfds[0]);
     99e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9a1:	89 04 24             	mov    %eax,(%esp)
     9a4:	e8 d7 37 00 00       	call   4180 <close>
    if(write(pfds[1], "x", 1) != 1)
     9a9:	8b 45 e8             	mov    -0x18(%ebp),%eax
     9ac:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     9b3:	00 
     9b4:	c7 44 24 04 4e 4a 00 	movl   $0x4a4e,0x4(%esp)
     9bb:	00 
     9bc:	89 04 24             	mov    %eax,(%esp)
     9bf:	e8 b4 37 00 00       	call   4178 <write>
     9c4:	83 f8 01             	cmp    $0x1,%eax
     9c7:	74 14                	je     9dd <preempt+0x92>
      printf(1, "preempt write error");
     9c9:	c7 44 24 04 50 4a 00 	movl   $0x4a50,0x4(%esp)
     9d0:	00 
     9d1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     9d8:	e8 04 39 00 00       	call   42e1 <printf>
    close(pfds[1]);
     9dd:	8b 45 e8             	mov    -0x18(%ebp),%eax
     9e0:	89 04 24             	mov    %eax,(%esp)
     9e3:	e8 98 37 00 00       	call   4180 <close>
    for(;;)
      ;
     9e8:	eb fe                	jmp    9e8 <preempt+0x9d>
  }

  close(pfds[1]);
     9ea:	8b 45 e8             	mov    -0x18(%ebp),%eax
     9ed:	89 04 24             	mov    %eax,(%esp)
     9f0:	e8 8b 37 00 00       	call   4180 <close>
  if(read(pfds[0], buf, sizeof(buf)) != 1){
     9f5:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     9f8:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
     9ff:	00 
     a00:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
     a07:	00 
     a08:	89 04 24             	mov    %eax,(%esp)
     a0b:	e8 60 37 00 00       	call   4170 <read>
     a10:	83 f8 01             	cmp    $0x1,%eax
     a13:	74 19                	je     a2e <preempt+0xe3>
    printf(1, "preempt read error");
     a15:	c7 44 24 04 64 4a 00 	movl   $0x4a64,0x4(%esp)
     a1c:	00 
     a1d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a24:	e8 b8 38 00 00       	call   42e1 <printf>
    return;
     a29:	e9 8c 00 00 00       	jmp    aba <preempt+0x16f>
  }
  close(pfds[0]);
     a2e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     a31:	89 04 24             	mov    %eax,(%esp)
     a34:	e8 47 37 00 00       	call   4180 <close>
  printf(1, "kill... ");
     a39:	c7 44 24 04 77 4a 00 	movl   $0x4a77,0x4(%esp)
     a40:	00 
     a41:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a48:	e8 94 38 00 00       	call   42e1 <printf>
  kill(pid1);
     a4d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     a50:	89 04 24             	mov    %eax,(%esp)
     a53:	e8 30 37 00 00       	call   4188 <kill>
  kill(pid2);
     a58:	8b 45 f0             	mov    -0x10(%ebp),%eax
     a5b:	89 04 24             	mov    %eax,(%esp)
     a5e:	e8 25 37 00 00       	call   4188 <kill>
  kill(pid3);
     a63:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a66:	89 04 24             	mov    %eax,(%esp)
     a69:	e8 1a 37 00 00       	call   4188 <kill>
  printf(1, "wait... ");
     a6e:	c7 44 24 04 80 4a 00 	movl   $0x4a80,0x4(%esp)
     a75:	00 
     a76:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     a7d:	e8 5f 38 00 00       	call   42e1 <printf>
  wait(0);
     a82:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     a89:	e8 ca 36 00 00       	call   4158 <wait>
  wait(0);
     a8e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     a95:	e8 be 36 00 00       	call   4158 <wait>
  wait(0);
     a9a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     aa1:	e8 b2 36 00 00       	call   4158 <wait>
  printf(1, "preempt ok\n");
     aa6:	c7 44 24 04 89 4a 00 	movl   $0x4a89,0x4(%esp)
     aad:	00 
     aae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ab5:	e8 27 38 00 00       	call   42e1 <printf>
}
     aba:	c9                   	leave  
     abb:	c3                   	ret    

00000abc <exitwait>:

// try to find any races between exit and wait
void
exitwait(void)
{
     abc:	55                   	push   %ebp
     abd:	89 e5                	mov    %esp,%ebp
     abf:	83 ec 28             	sub    $0x28,%esp
  int i, pid;

  for(i = 0; i < 100; i++){
     ac2:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ac9:	eb 61                	jmp    b2c <exitwait+0x70>
    pid = fork();
     acb:	e8 78 36 00 00       	call   4148 <fork>
     ad0:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(pid < 0){
     ad3:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ad7:	79 16                	jns    aef <exitwait+0x33>
      printf(1, "fork failed\n");
     ad9:	c7 44 24 04 95 4a 00 	movl   $0x4a95,0x4(%esp)
     ae0:	00 
     ae1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ae8:	e8 f4 37 00 00       	call   42e1 <printf>
      return;
     aed:	eb 57                	jmp    b46 <exitwait+0x8a>
    }
    if(pid){
     aef:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     af3:	74 27                	je     b1c <exitwait+0x60>
      if(wait(0) != pid){
     af5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     afc:	e8 57 36 00 00       	call   4158 <wait>
     b01:	3b 45 f4             	cmp    -0xc(%ebp),%eax
     b04:	74 22                	je     b28 <exitwait+0x6c>
        printf(1, "wait wrong pid\n");
     b06:	c7 44 24 04 a2 4a 00 	movl   $0x4aa2,0x4(%esp)
     b0d:	00 
     b0e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b15:	e8 c7 37 00 00       	call   42e1 <printf>
        return;
     b1a:	eb 2a                	jmp    b46 <exitwait+0x8a>
      }
    } else {
      exit(0);
     b1c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     b23:	e8 28 36 00 00       	call   4150 <exit>
void
exitwait(void)
{
  int i, pid;

  for(i = 0; i < 100; i++){
     b28:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     b2c:	83 7d f0 63          	cmpl   $0x63,-0x10(%ebp)
     b30:	7e 99                	jle    acb <exitwait+0xf>
      }
    } else {
      exit(0);
    }
  }
  printf(1, "exitwait ok\n");
     b32:	c7 44 24 04 b2 4a 00 	movl   $0x4ab2,0x4(%esp)
     b39:	00 
     b3a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b41:	e8 9b 37 00 00       	call   42e1 <printf>
}
     b46:	c9                   	leave  
     b47:	c3                   	ret    

00000b48 <mem>:

void
mem(void)
{
     b48:	55                   	push   %ebp
     b49:	89 e5                	mov    %esp,%ebp
     b4b:	83 ec 28             	sub    $0x28,%esp
  void *m1, *m2;
  int pid, ppid;

  printf(1, "mem test\n");
     b4e:	c7 44 24 04 bf 4a 00 	movl   $0x4abf,0x4(%esp)
     b55:	00 
     b56:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     b5d:	e8 7f 37 00 00       	call   42e1 <printf>
  ppid = getpid();
     b62:	e8 71 36 00 00       	call   41d8 <getpid>
     b67:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((pid = fork()) == 0){
     b6a:	e8 d9 35 00 00       	call   4148 <fork>
     b6f:	89 45 f0             	mov    %eax,-0x10(%ebp)
     b72:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     b76:	0f 85 b8 00 00 00    	jne    c34 <mem+0xec>
    m1 = 0;
     b7c:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    while((m2 = malloc(10001)) != 0){
     b83:	eb 0e                	jmp    b93 <mem+0x4b>
      *(char**)m2 = m1;
     b85:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b88:	8b 55 e8             	mov    -0x18(%ebp),%edx
     b8b:	89 10                	mov    %edx,(%eax)
      m1 = m2;
     b8d:	8b 45 ec             	mov    -0x14(%ebp),%eax
     b90:	89 45 e8             	mov    %eax,-0x18(%ebp)

  printf(1, "mem test\n");
  ppid = getpid();
  if((pid = fork()) == 0){
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
     b93:	c7 04 24 11 27 00 00 	movl   $0x2711,(%esp)
     b9a:	e8 28 3a 00 00       	call   45c7 <malloc>
     b9f:	89 45 ec             	mov    %eax,-0x14(%ebp)
     ba2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     ba6:	75 dd                	jne    b85 <mem+0x3d>
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     ba8:	eb 19                	jmp    bc3 <mem+0x7b>
      m2 = *(char**)m1;
     baa:	8b 45 e8             	mov    -0x18(%ebp),%eax
     bad:	8b 00                	mov    (%eax),%eax
     baf:	89 45 ec             	mov    %eax,-0x14(%ebp)
      free(m1);
     bb2:	8b 45 e8             	mov    -0x18(%ebp),%eax
     bb5:	89 04 24             	mov    %eax,(%esp)
     bb8:	e8 db 38 00 00       	call   4498 <free>
      m1 = m2;
     bbd:	8b 45 ec             	mov    -0x14(%ebp),%eax
     bc0:	89 45 e8             	mov    %eax,-0x18(%ebp)
    m1 = 0;
    while((m2 = malloc(10001)) != 0){
      *(char**)m2 = m1;
      m1 = m2;
    }
    while(m1){
     bc3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     bc7:	75 e1                	jne    baa <mem+0x62>
      m2 = *(char**)m1;
      free(m1);
      m1 = m2;
    }
    m1 = malloc(1024*20);
     bc9:	c7 04 24 00 50 00 00 	movl   $0x5000,(%esp)
     bd0:	e8 f2 39 00 00       	call   45c7 <malloc>
     bd5:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(m1 == 0){
     bd8:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
     bdc:	75 2b                	jne    c09 <mem+0xc1>
      printf(1, "couldn't allocate mem?!!\n");
     bde:	c7 44 24 04 c9 4a 00 	movl   $0x4ac9,0x4(%esp)
     be5:	00 
     be6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     bed:	e8 ef 36 00 00       	call   42e1 <printf>
      kill(ppid);
     bf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bf5:	89 04 24             	mov    %eax,(%esp)
     bf8:	e8 8b 35 00 00       	call   4188 <kill>
      exit(1);
     bfd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c04:	e8 47 35 00 00       	call   4150 <exit>
    }
    free(m1);
     c09:	8b 45 e8             	mov    -0x18(%ebp),%eax
     c0c:	89 04 24             	mov    %eax,(%esp)
     c0f:	e8 84 38 00 00       	call   4498 <free>
    printf(1, "mem ok\n");
     c14:	c7 44 24 04 e3 4a 00 	movl   $0x4ae3,0x4(%esp)
     c1b:	00 
     c1c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c23:	e8 b9 36 00 00       	call   42e1 <printf>
    exit(0);
     c28:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c2f:	e8 1c 35 00 00       	call   4150 <exit>
  } else {
    wait(0);
     c34:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     c3b:	e8 18 35 00 00       	call   4158 <wait>
  }
}
     c40:	c9                   	leave  
     c41:	c3                   	ret    

00000c42 <sharedfd>:

// two processes write to the same file descriptor
// is the offset shared? does inode locking work?
void
sharedfd(void)
{
     c42:	55                   	push   %ebp
     c43:	89 e5                	mov    %esp,%ebp
     c45:	83 ec 48             	sub    $0x48,%esp
  int fd, pid, i, n, nc, np;
  char buf[10];

  printf(1, "sharedfd test\n");
     c48:	c7 44 24 04 eb 4a 00 	movl   $0x4aeb,0x4(%esp)
     c4f:	00 
     c50:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c57:	e8 85 36 00 00       	call   42e1 <printf>

  unlink("sharedfd");
     c5c:	c7 04 24 fa 4a 00 00 	movl   $0x4afa,(%esp)
     c63:	e8 40 35 00 00       	call   41a8 <unlink>
  fd = open("sharedfd", O_CREATE|O_RDWR);
     c68:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     c6f:	00 
     c70:	c7 04 24 fa 4a 00 00 	movl   $0x4afa,(%esp)
     c77:	e8 1c 35 00 00       	call   4198 <open>
     c7c:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(fd < 0){
     c7f:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     c83:	79 19                	jns    c9e <sharedfd+0x5c>
    printf(1, "fstests: cannot open sharedfd for writing");
     c85:	c7 44 24 04 04 4b 00 	movl   $0x4b04,0x4(%esp)
     c8c:	00 
     c8d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     c94:	e8 48 36 00 00       	call   42e1 <printf>
    return;
     c99:	e9 b0 01 00 00       	jmp    e4e <sharedfd+0x20c>
  }
  pid = fork();
     c9e:	e8 a5 34 00 00       	call   4148 <fork>
     ca3:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  memset(buf, pid==0?'c':'p', sizeof(buf));
     ca6:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     caa:	75 07                	jne    cb3 <sharedfd+0x71>
     cac:	b8 63 00 00 00       	mov    $0x63,%eax
     cb1:	eb 05                	jmp    cb8 <sharedfd+0x76>
     cb3:	b8 70 00 00 00       	mov    $0x70,%eax
     cb8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     cbf:	00 
     cc0:	89 44 24 04          	mov    %eax,0x4(%esp)
     cc4:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     cc7:	89 04 24             	mov    %eax,(%esp)
     cca:	e8 db 32 00 00       	call   3faa <memset>
  for(i = 0; i < 1000; i++){
     ccf:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     cd6:	eb 39                	jmp    d11 <sharedfd+0xcf>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
     cd8:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     cdf:	00 
     ce0:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     ce3:	89 44 24 04          	mov    %eax,0x4(%esp)
     ce7:	8b 45 e0             	mov    -0x20(%ebp),%eax
     cea:	89 04 24             	mov    %eax,(%esp)
     ced:	e8 86 34 00 00       	call   4178 <write>
     cf2:	83 f8 0a             	cmp    $0xa,%eax
     cf5:	74 16                	je     d0d <sharedfd+0xcb>
      printf(1, "fstests: write sharedfd failed\n");
     cf7:	c7 44 24 04 30 4b 00 	movl   $0x4b30,0x4(%esp)
     cfe:	00 
     cff:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d06:	e8 d6 35 00 00       	call   42e1 <printf>
      break;
     d0b:	eb 0d                	jmp    d1a <sharedfd+0xd8>
    printf(1, "fstests: cannot open sharedfd for writing");
    return;
  }
  pid = fork();
  memset(buf, pid==0?'c':'p', sizeof(buf));
  for(i = 0; i < 1000; i++){
     d0d:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
     d11:	81 7d e8 e7 03 00 00 	cmpl   $0x3e7,-0x18(%ebp)
     d18:	7e be                	jle    cd8 <sharedfd+0x96>
    if(write(fd, buf, sizeof(buf)) != sizeof(buf)){
      printf(1, "fstests: write sharedfd failed\n");
      break;
    }
  }
  if(pid == 0)
     d1a:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     d1e:	75 0c                	jne    d2c <sharedfd+0xea>
    exit(0);
     d20:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d27:	e8 24 34 00 00       	call   4150 <exit>
  else
    wait(0);
     d2c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     d33:	e8 20 34 00 00       	call   4158 <wait>
  close(fd);
     d38:	8b 45 e0             	mov    -0x20(%ebp),%eax
     d3b:	89 04 24             	mov    %eax,(%esp)
     d3e:	e8 3d 34 00 00       	call   4180 <close>
  fd = open("sharedfd", 0);
     d43:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     d4a:	00 
     d4b:	c7 04 24 fa 4a 00 00 	movl   $0x4afa,(%esp)
     d52:	e8 41 34 00 00       	call   4198 <open>
     d57:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(fd < 0){
     d5a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     d5e:	79 19                	jns    d79 <sharedfd+0x137>
    printf(1, "fstests: cannot open sharedfd for reading\n");
     d60:	c7 44 24 04 50 4b 00 	movl   $0x4b50,0x4(%esp)
     d67:	00 
     d68:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     d6f:	e8 6d 35 00 00       	call   42e1 <printf>
    return;
     d74:	e9 d5 00 00 00       	jmp    e4e <sharedfd+0x20c>
  }
  nc = np = 0;
     d79:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     d80:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d83:	89 45 f0             	mov    %eax,-0x10(%ebp)
  while((n = read(fd, buf, sizeof(buf))) > 0){
     d86:	eb 35                	jmp    dbd <sharedfd+0x17b>
    for(i = 0; i < sizeof(buf); i++){
     d88:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     d8f:	eb 24                	jmp    db5 <sharedfd+0x173>
      if(buf[i] == 'c')
     d91:	8b 45 e8             	mov    -0x18(%ebp),%eax
     d94:	0f b6 44 05 d6       	movzbl -0x2a(%ebp,%eax,1),%eax
     d99:	3c 63                	cmp    $0x63,%al
     d9b:	75 04                	jne    da1 <sharedfd+0x15f>
        nc++;
     d9d:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
      if(buf[i] == 'p')
     da1:	8b 45 e8             	mov    -0x18(%ebp),%eax
     da4:	0f b6 44 05 d6       	movzbl -0x2a(%ebp,%eax,1),%eax
     da9:	3c 70                	cmp    $0x70,%al
     dab:	75 04                	jne    db1 <sharedfd+0x16f>
        np++;
     dad:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
    for(i = 0; i < sizeof(buf); i++){
     db1:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
     db5:	8b 45 e8             	mov    -0x18(%ebp),%eax
     db8:	83 f8 09             	cmp    $0x9,%eax
     dbb:	76 d4                	jbe    d91 <sharedfd+0x14f>
  if(fd < 0){
    printf(1, "fstests: cannot open sharedfd for reading\n");
    return;
  }
  nc = np = 0;
  while((n = read(fd, buf, sizeof(buf))) > 0){
     dbd:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     dc4:	00 
     dc5:	8d 45 d6             	lea    -0x2a(%ebp),%eax
     dc8:	89 44 24 04          	mov    %eax,0x4(%esp)
     dcc:	8b 45 e0             	mov    -0x20(%ebp),%eax
     dcf:	89 04 24             	mov    %eax,(%esp)
     dd2:	e8 99 33 00 00       	call   4170 <read>
     dd7:	89 45 ec             	mov    %eax,-0x14(%ebp)
     dda:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     dde:	7f a8                	jg     d88 <sharedfd+0x146>
        nc++;
      if(buf[i] == 'p')
        np++;
    }
  }
  close(fd);
     de0:	8b 45 e0             	mov    -0x20(%ebp),%eax
     de3:	89 04 24             	mov    %eax,(%esp)
     de6:	e8 95 33 00 00       	call   4180 <close>
  unlink("sharedfd");
     deb:	c7 04 24 fa 4a 00 00 	movl   $0x4afa,(%esp)
     df2:	e8 b1 33 00 00       	call   41a8 <unlink>
  if(nc == 10000 && np == 10000){
     df7:	81 7d f0 10 27 00 00 	cmpl   $0x2710,-0x10(%ebp)
     dfe:	75 20                	jne    e20 <sharedfd+0x1de>
     e00:	81 7d f4 10 27 00 00 	cmpl   $0x2710,-0xc(%ebp)
     e07:	75 17                	jne    e20 <sharedfd+0x1de>
    printf(1, "sharedfd ok\n");
     e09:	c7 44 24 04 7b 4b 00 	movl   $0x4b7b,0x4(%esp)
     e10:	00 
     e11:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e18:	e8 c4 34 00 00       	call   42e1 <printf>
        np++;
    }
  }
  close(fd);
  unlink("sharedfd");
  if(nc == 10000 && np == 10000){
     e1d:	90                   	nop
     e1e:	eb 2e                	jmp    e4e <sharedfd+0x20c>
    printf(1, "sharedfd ok\n");
  } else {
    printf(1, "sharedfd oops %d %d\n", nc, np);
     e20:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e23:	89 44 24 0c          	mov    %eax,0xc(%esp)
     e27:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e2a:	89 44 24 08          	mov    %eax,0x8(%esp)
     e2e:	c7 44 24 04 88 4b 00 	movl   $0x4b88,0x4(%esp)
     e35:	00 
     e36:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e3d:	e8 9f 34 00 00       	call   42e1 <printf>
    exit(1);
     e42:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e49:	e8 02 33 00 00       	call   4150 <exit>
  }
}
     e4e:	c9                   	leave  
     e4f:	c3                   	ret    

00000e50 <twofiles>:

// two processes write two different files at the same
// time, to test block allocation.
void
twofiles(void)
{
     e50:	55                   	push   %ebp
     e51:	89 e5                	mov    %esp,%ebp
     e53:	83 ec 38             	sub    $0x38,%esp
  int fd, pid, i, j, n, total;
  char *fname;

  printf(1, "twofiles test\n");
     e56:	c7 44 24 04 9d 4b 00 	movl   $0x4b9d,0x4(%esp)
     e5d:	00 
     e5e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e65:	e8 77 34 00 00       	call   42e1 <printf>

  unlink("f1");
     e6a:	c7 04 24 ac 4b 00 00 	movl   $0x4bac,(%esp)
     e71:	e8 32 33 00 00       	call   41a8 <unlink>
  unlink("f2");
     e76:	c7 04 24 af 4b 00 00 	movl   $0x4baf,(%esp)
     e7d:	e8 26 33 00 00       	call   41a8 <unlink>

  pid = fork();
     e82:	e8 c1 32 00 00       	call   4148 <fork>
     e87:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(pid < 0){
     e8a:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     e8e:	79 20                	jns    eb0 <twofiles+0x60>
    printf(1, "fork failed\n");
     e90:	c7 44 24 04 95 4a 00 	movl   $0x4a95,0x4(%esp)
     e97:	00 
     e98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     e9f:	e8 3d 34 00 00       	call   42e1 <printf>
    exit(1);
     ea4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     eab:	e8 a0 32 00 00       	call   4150 <exit>
  }

  fname = pid ? "f1" : "f2";
     eb0:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     eb4:	74 07                	je     ebd <twofiles+0x6d>
     eb6:	b8 ac 4b 00 00       	mov    $0x4bac,%eax
     ebb:	eb 05                	jmp    ec2 <twofiles+0x72>
     ebd:	b8 af 4b 00 00       	mov    $0x4baf,%eax
     ec2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  fd = open(fname, O_CREATE | O_RDWR);
     ec5:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
     ecc:	00 
     ecd:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ed0:	89 04 24             	mov    %eax,(%esp)
     ed3:	e8 c0 32 00 00       	call   4198 <open>
     ed8:	89 45 dc             	mov    %eax,-0x24(%ebp)
  if(fd < 0){
     edb:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
     edf:	79 20                	jns    f01 <twofiles+0xb1>
    printf(1, "create failed\n");
     ee1:	c7 44 24 04 b2 4b 00 	movl   $0x4bb2,0x4(%esp)
     ee8:	00 
     ee9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     ef0:	e8 ec 33 00 00       	call   42e1 <printf>
    exit(1);
     ef5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     efc:	e8 4f 32 00 00       	call   4150 <exit>
  }

  memset(buf, pid?'p':'c', 512);
     f01:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     f05:	74 07                	je     f0e <twofiles+0xbe>
     f07:	b8 70 00 00 00       	mov    $0x70,%eax
     f0c:	eb 05                	jmp    f13 <twofiles+0xc3>
     f0e:	b8 63 00 00 00       	mov    $0x63,%eax
     f13:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
     f1a:	00 
     f1b:	89 44 24 04          	mov    %eax,0x4(%esp)
     f1f:	c7 04 24 80 85 00 00 	movl   $0x8580,(%esp)
     f26:	e8 7f 30 00 00       	call   3faa <memset>
  for(i = 0; i < 12; i++){
     f2b:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     f32:	eb 52                	jmp    f86 <twofiles+0x136>
    if((n = write(fd, buf, 500)) != 500){
     f34:	c7 44 24 08 f4 01 00 	movl   $0x1f4,0x8(%esp)
     f3b:	00 
     f3c:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
     f43:	00 
     f44:	8b 45 dc             	mov    -0x24(%ebp),%eax
     f47:	89 04 24             	mov    %eax,(%esp)
     f4a:	e8 29 32 00 00       	call   4178 <write>
     f4f:	89 45 ec             	mov    %eax,-0x14(%ebp)
     f52:	81 7d ec f4 01 00 00 	cmpl   $0x1f4,-0x14(%ebp)
     f59:	74 27                	je     f82 <twofiles+0x132>
      printf(1, "write failed %d\n", n);
     f5b:	8b 45 ec             	mov    -0x14(%ebp),%eax
     f5e:	89 44 24 08          	mov    %eax,0x8(%esp)
     f62:	c7 44 24 04 c1 4b 00 	movl   $0x4bc1,0x4(%esp)
     f69:	00 
     f6a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f71:	e8 6b 33 00 00       	call   42e1 <printf>
      exit(1);
     f76:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f7d:	e8 ce 31 00 00       	call   4150 <exit>
    printf(1, "create failed\n");
    exit(1);
  }

  memset(buf, pid?'p':'c', 512);
  for(i = 0; i < 12; i++){
     f82:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
     f86:	83 7d e4 0b          	cmpl   $0xb,-0x1c(%ebp)
     f8a:	7e a8                	jle    f34 <twofiles+0xe4>
    if((n = write(fd, buf, 500)) != 500){
      printf(1, "write failed %d\n", n);
      exit(1);
    }
  }
  close(fd);
     f8c:	8b 45 dc             	mov    -0x24(%ebp),%eax
     f8f:	89 04 24             	mov    %eax,(%esp)
     f92:	e8 e9 31 00 00       	call   4180 <close>
  if(pid)
     f97:	83 7d e0 00          	cmpl   $0x0,-0x20(%ebp)
     f9b:	74 18                	je     fb5 <twofiles+0x165>
    wait(0);
     f9d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     fa4:	e8 af 31 00 00       	call   4158 <wait>
  else
    exit(0);

  for(i = 0; i < 2; i++){
     fa9:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
     fb0:	e9 ff 00 00 00       	jmp    10b4 <twofiles+0x264>
  }
  close(fd);
  if(pid)
    wait(0);
  else
    exit(0);
     fb5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     fbc:	e8 8f 31 00 00       	call   4150 <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
     fc1:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
     fc5:	74 07                	je     fce <twofiles+0x17e>
     fc7:	b8 ac 4b 00 00       	mov    $0x4bac,%eax
     fcc:	eb 05                	jmp    fd3 <twofiles+0x183>
     fce:	b8 af 4b 00 00       	mov    $0x4baf,%eax
     fd3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     fda:	00 
     fdb:	89 04 24             	mov    %eax,(%esp)
     fde:	e8 b5 31 00 00       	call   4198 <open>
     fe3:	89 45 dc             	mov    %eax,-0x24(%ebp)
    total = 0;
     fe6:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    while((n = read(fd, buf, sizeof(buf))) > 0){
     fed:	eb 5e                	jmp    104d <twofiles+0x1fd>
      for(j = 0; j < n; j++){
     fef:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
     ff6:	eb 47                	jmp    103f <twofiles+0x1ef>
        if(buf[j] != (i?'p':'c')){
     ff8:	8b 45 e8             	mov    -0x18(%ebp),%eax
     ffb:	0f b6 80 80 85 00 00 	movzbl 0x8580(%eax),%eax
    1002:	0f be d0             	movsbl %al,%edx
    1005:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    1009:	74 07                	je     1012 <twofiles+0x1c2>
    100b:	b8 70 00 00 00       	mov    $0x70,%eax
    1010:	eb 05                	jmp    1017 <twofiles+0x1c7>
    1012:	b8 63 00 00 00       	mov    $0x63,%eax
    1017:	39 c2                	cmp    %eax,%edx
    1019:	74 20                	je     103b <twofiles+0x1eb>
          printf(1, "wrong char\n");
    101b:	c7 44 24 04 d2 4b 00 	movl   $0x4bd2,0x4(%esp)
    1022:	00 
    1023:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    102a:	e8 b2 32 00 00       	call   42e1 <printf>
          exit(1);
    102f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1036:	e8 15 31 00 00       	call   4150 <exit>

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
      for(j = 0; j < n; j++){
    103b:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    103f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1042:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    1045:	7c b1                	jl     ff8 <twofiles+0x1a8>
        if(buf[j] != (i?'p':'c')){
          printf(1, "wrong char\n");
          exit(1);
        }
      }
      total += n;
    1047:	8b 45 ec             	mov    -0x14(%ebp),%eax
    104a:	01 45 f0             	add    %eax,-0x10(%ebp)
    exit(0);

  for(i = 0; i < 2; i++){
    fd = open(i?"f1":"f2", 0);
    total = 0;
    while((n = read(fd, buf, sizeof(buf))) > 0){
    104d:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1054:	00 
    1055:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
    105c:	00 
    105d:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1060:	89 04 24             	mov    %eax,(%esp)
    1063:	e8 08 31 00 00       	call   4170 <read>
    1068:	89 45 ec             	mov    %eax,-0x14(%ebp)
    106b:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    106f:	0f 8f 7a ff ff ff    	jg     fef <twofiles+0x19f>
          exit(1);
        }
      }
      total += n;
    }
    close(fd);
    1075:	8b 45 dc             	mov    -0x24(%ebp),%eax
    1078:	89 04 24             	mov    %eax,(%esp)
    107b:	e8 00 31 00 00       	call   4180 <close>
    if(total != 12*500){
    1080:	81 7d f0 70 17 00 00 	cmpl   $0x1770,-0x10(%ebp)
    1087:	74 27                	je     10b0 <twofiles+0x260>
      printf(1, "wrong length %d\n", total);
    1089:	8b 45 f0             	mov    -0x10(%ebp),%eax
    108c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1090:	c7 44 24 04 de 4b 00 	movl   $0x4bde,0x4(%esp)
    1097:	00 
    1098:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    109f:	e8 3d 32 00 00       	call   42e1 <printf>
      exit(1);
    10a4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10ab:	e8 a0 30 00 00       	call   4150 <exit>
  if(pid)
    wait(0);
  else
    exit(0);

  for(i = 0; i < 2; i++){
    10b0:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    10b4:	83 7d e4 01          	cmpl   $0x1,-0x1c(%ebp)
    10b8:	0f 8e 03 ff ff ff    	jle    fc1 <twofiles+0x171>
      printf(1, "wrong length %d\n", total);
      exit(1);
    }
  }

  unlink("f1");
    10be:	c7 04 24 ac 4b 00 00 	movl   $0x4bac,(%esp)
    10c5:	e8 de 30 00 00       	call   41a8 <unlink>
  unlink("f2");
    10ca:	c7 04 24 af 4b 00 00 	movl   $0x4baf,(%esp)
    10d1:	e8 d2 30 00 00       	call   41a8 <unlink>

  printf(1, "twofiles ok\n");
    10d6:	c7 44 24 04 ef 4b 00 	movl   $0x4bef,0x4(%esp)
    10dd:	00 
    10de:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    10e5:	e8 f7 31 00 00       	call   42e1 <printf>
}
    10ea:	c9                   	leave  
    10eb:	c3                   	ret    

000010ec <createdelete>:

// two processes create and delete different files in same directory
void
createdelete(void)
{
    10ec:	55                   	push   %ebp
    10ed:	89 e5                	mov    %esp,%ebp
    10ef:	83 ec 48             	sub    $0x48,%esp
  enum { N = 20 };
  int pid, i, fd;
  char name[32];

  printf(1, "createdelete test\n");
    10f2:	c7 44 24 04 fc 4b 00 	movl   $0x4bfc,0x4(%esp)
    10f9:	00 
    10fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1101:	e8 db 31 00 00       	call   42e1 <printf>
  pid = fork();
    1106:	e8 3d 30 00 00       	call   4148 <fork>
    110b:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    110e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1112:	79 20                	jns    1134 <createdelete+0x48>
    printf(1, "fork failed\n");
    1114:	c7 44 24 04 95 4a 00 	movl   $0x4a95,0x4(%esp)
    111b:	00 
    111c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1123:	e8 b9 31 00 00       	call   42e1 <printf>
    exit(1);
    1128:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    112f:	e8 1c 30 00 00       	call   4150 <exit>
  }

  name[0] = pid ? 'p' : 'c';
    1134:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1138:	74 07                	je     1141 <createdelete+0x55>
    113a:	b8 70 00 00 00       	mov    $0x70,%eax
    113f:	eb 05                	jmp    1146 <createdelete+0x5a>
    1141:	b8 63 00 00 00       	mov    $0x63,%eax
    1146:	88 45 cc             	mov    %al,-0x34(%ebp)
  name[2] = '\0';
    1149:	c6 45 ce 00          	movb   $0x0,-0x32(%ebp)
  for(i = 0; i < N; i++){
    114d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1154:	e9 a6 00 00 00       	jmp    11ff <createdelete+0x113>
    name[1] = '0' + i;
    1159:	8b 45 f0             	mov    -0x10(%ebp),%eax
    115c:	83 c0 30             	add    $0x30,%eax
    115f:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, O_CREATE | O_RDWR);
    1162:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1169:	00 
    116a:	8d 45 cc             	lea    -0x34(%ebp),%eax
    116d:	89 04 24             	mov    %eax,(%esp)
    1170:	e8 23 30 00 00       	call   4198 <open>
    1175:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(fd < 0){
    1178:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    117c:	79 20                	jns    119e <createdelete+0xb2>
      printf(1, "create failed\n");
    117e:	c7 44 24 04 b2 4b 00 	movl   $0x4bb2,0x4(%esp)
    1185:	00 
    1186:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    118d:	e8 4f 31 00 00       	call   42e1 <printf>
      exit(1);
    1192:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1199:	e8 b2 2f 00 00       	call   4150 <exit>
    }
    close(fd);
    119e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11a1:	89 04 24             	mov    %eax,(%esp)
    11a4:	e8 d7 2f 00 00       	call   4180 <close>
    if(i > 0 && (i % 2 ) == 0){
    11a9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    11ad:	7e 4c                	jle    11fb <createdelete+0x10f>
    11af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11b2:	83 e0 01             	and    $0x1,%eax
    11b5:	85 c0                	test   %eax,%eax
    11b7:	75 42                	jne    11fb <createdelete+0x10f>
      name[1] = '0' + (i / 2);
    11b9:	8b 45 f0             	mov    -0x10(%ebp),%eax
    11bc:	89 c2                	mov    %eax,%edx
    11be:	c1 ea 1f             	shr    $0x1f,%edx
    11c1:	8d 04 02             	lea    (%edx,%eax,1),%eax
    11c4:	d1 f8                	sar    %eax
    11c6:	83 c0 30             	add    $0x30,%eax
    11c9:	88 45 cd             	mov    %al,-0x33(%ebp)
      if(unlink(name) < 0){
    11cc:	8d 45 cc             	lea    -0x34(%ebp),%eax
    11cf:	89 04 24             	mov    %eax,(%esp)
    11d2:	e8 d1 2f 00 00       	call   41a8 <unlink>
    11d7:	85 c0                	test   %eax,%eax
    11d9:	79 20                	jns    11fb <createdelete+0x10f>
        printf(1, "unlink failed\n");
    11db:	c7 44 24 04 0f 4c 00 	movl   $0x4c0f,0x4(%esp)
    11e2:	00 
    11e3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11ea:	e8 f2 30 00 00       	call   42e1 <printf>
        exit(1);
    11ef:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    11f6:	e8 55 2f 00 00       	call   4150 <exit>
    exit(1);
  }

  name[0] = pid ? 'p' : 'c';
  name[2] = '\0';
  for(i = 0; i < N; i++){
    11fb:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    11ff:	83 7d f0 13          	cmpl   $0x13,-0x10(%ebp)
    1203:	0f 8e 50 ff ff ff    	jle    1159 <createdelete+0x6d>
        exit(1);
      }
    }
  }

  if(pid==0)
    1209:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    120d:	75 0c                	jne    121b <createdelete+0x12f>
    exit(0);
    120f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1216:	e8 35 2f 00 00       	call   4150 <exit>
  else
    wait(0);
    121b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1222:	e8 31 2f 00 00       	call   4158 <wait>

  for(i = 0; i < N; i++){
    1227:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    122e:	e9 50 01 00 00       	jmp    1383 <createdelete+0x297>
    name[0] = 'p';
    1233:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    1237:	8b 45 f0             	mov    -0x10(%ebp),%eax
    123a:	83 c0 30             	add    $0x30,%eax
    123d:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    1240:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1247:	00 
    1248:	8d 45 cc             	lea    -0x34(%ebp),%eax
    124b:	89 04 24             	mov    %eax,(%esp)
    124e:	e8 45 2f 00 00       	call   4198 <open>
    1253:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    1256:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    125a:	74 06                	je     1262 <createdelete+0x176>
    125c:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    1260:	7e 2d                	jle    128f <createdelete+0x1a3>
    1262:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1266:	79 27                	jns    128f <createdelete+0x1a3>
      printf(1, "oops createdelete %s didn't exist\n", name);
    1268:	8d 45 cc             	lea    -0x34(%ebp),%eax
    126b:	89 44 24 08          	mov    %eax,0x8(%esp)
    126f:	c7 44 24 04 20 4c 00 	movl   $0x4c20,0x4(%esp)
    1276:	00 
    1277:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    127e:	e8 5e 30 00 00       	call   42e1 <printf>
      exit(1);
    1283:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    128a:	e8 c1 2e 00 00       	call   4150 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    128f:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1293:	7e 33                	jle    12c8 <createdelete+0x1dc>
    1295:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    1299:	7f 2d                	jg     12c8 <createdelete+0x1dc>
    129b:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    129f:	78 27                	js     12c8 <createdelete+0x1dc>
      printf(1, "oops createdelete %s did exist\n", name);
    12a1:	8d 45 cc             	lea    -0x34(%ebp),%eax
    12a4:	89 44 24 08          	mov    %eax,0x8(%esp)
    12a8:	c7 44 24 04 44 4c 00 	movl   $0x4c44,0x4(%esp)
    12af:	00 
    12b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12b7:	e8 25 30 00 00       	call   42e1 <printf>
      exit(1);
    12bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    12c3:	e8 88 2e 00 00       	call   4150 <exit>
    }
    if(fd >= 0)
    12c8:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    12cc:	78 0b                	js     12d9 <createdelete+0x1ed>
      close(fd);
    12ce:	8b 45 f4             	mov    -0xc(%ebp),%eax
    12d1:	89 04 24             	mov    %eax,(%esp)
    12d4:	e8 a7 2e 00 00       	call   4180 <close>

    name[0] = 'c';
    12d9:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    name[1] = '0' + i;
    12dd:	8b 45 f0             	mov    -0x10(%ebp),%eax
    12e0:	83 c0 30             	add    $0x30,%eax
    12e3:	88 45 cd             	mov    %al,-0x33(%ebp)
    fd = open(name, 0);
    12e6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    12ed:	00 
    12ee:	8d 45 cc             	lea    -0x34(%ebp),%eax
    12f1:	89 04 24             	mov    %eax,(%esp)
    12f4:	e8 9f 2e 00 00       	call   4198 <open>
    12f9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if((i == 0 || i >= N/2) && fd < 0){
    12fc:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1300:	74 06                	je     1308 <createdelete+0x21c>
    1302:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    1306:	7e 2d                	jle    1335 <createdelete+0x249>
    1308:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    130c:	79 27                	jns    1335 <createdelete+0x249>
      printf(1, "oops createdelete %s didn't exist\n", name);
    130e:	8d 45 cc             	lea    -0x34(%ebp),%eax
    1311:	89 44 24 08          	mov    %eax,0x8(%esp)
    1315:	c7 44 24 04 20 4c 00 	movl   $0x4c20,0x4(%esp)
    131c:	00 
    131d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1324:	e8 b8 2f 00 00       	call   42e1 <printf>
      exit(1);
    1329:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1330:	e8 1b 2e 00 00       	call   4150 <exit>
    } else if((i >= 1 && i < N/2) && fd >= 0){
    1335:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1339:	7e 33                	jle    136e <createdelete+0x282>
    133b:	83 7d f0 09          	cmpl   $0x9,-0x10(%ebp)
    133f:	7f 2d                	jg     136e <createdelete+0x282>
    1341:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1345:	78 27                	js     136e <createdelete+0x282>
      printf(1, "oops createdelete %s did exist\n", name);
    1347:	8d 45 cc             	lea    -0x34(%ebp),%eax
    134a:	89 44 24 08          	mov    %eax,0x8(%esp)
    134e:	c7 44 24 04 44 4c 00 	movl   $0x4c44,0x4(%esp)
    1355:	00 
    1356:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    135d:	e8 7f 2f 00 00       	call   42e1 <printf>
      exit(1);
    1362:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1369:	e8 e2 2d 00 00       	call   4150 <exit>
    }
    if(fd >= 0)
    136e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1372:	78 0b                	js     137f <createdelete+0x293>
      close(fd);
    1374:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1377:	89 04 24             	mov    %eax,(%esp)
    137a:	e8 01 2e 00 00       	call   4180 <close>
  if(pid==0)
    exit(0);
  else
    wait(0);

  for(i = 0; i < N; i++){
    137f:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1383:	83 7d f0 13          	cmpl   $0x13,-0x10(%ebp)
    1387:	0f 8e a6 fe ff ff    	jle    1233 <createdelete+0x147>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    138d:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1394:	eb 2b                	jmp    13c1 <createdelete+0x2d5>
    name[0] = 'p';
    1396:	c6 45 cc 70          	movb   $0x70,-0x34(%ebp)
    name[1] = '0' + i;
    139a:	8b 45 f0             	mov    -0x10(%ebp),%eax
    139d:	83 c0 30             	add    $0x30,%eax
    13a0:	88 45 cd             	mov    %al,-0x33(%ebp)
    unlink(name);
    13a3:	8d 45 cc             	lea    -0x34(%ebp),%eax
    13a6:	89 04 24             	mov    %eax,(%esp)
    13a9:	e8 fa 2d 00 00       	call   41a8 <unlink>
    name[0] = 'c';
    13ae:	c6 45 cc 63          	movb   $0x63,-0x34(%ebp)
    unlink(name);
    13b2:	8d 45 cc             	lea    -0x34(%ebp),%eax
    13b5:	89 04 24             	mov    %eax,(%esp)
    13b8:	e8 eb 2d 00 00       	call   41a8 <unlink>
    }
    if(fd >= 0)
      close(fd);
  }

  for(i = 0; i < N; i++){
    13bd:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    13c1:	83 7d f0 13          	cmpl   $0x13,-0x10(%ebp)
    13c5:	7e cf                	jle    1396 <createdelete+0x2aa>
    unlink(name);
    name[0] = 'c';
    unlink(name);
  }

  printf(1, "createdelete ok\n");
    13c7:	c7 44 24 04 64 4c 00 	movl   $0x4c64,0x4(%esp)
    13ce:	00 
    13cf:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13d6:	e8 06 2f 00 00       	call   42e1 <printf>
}
    13db:	c9                   	leave  
    13dc:	c3                   	ret    

000013dd <unlinkread>:

// can I unlink a file and still read it?
void
unlinkread(void)
{
    13dd:	55                   	push   %ebp
    13de:	89 e5                	mov    %esp,%ebp
    13e0:	83 ec 28             	sub    $0x28,%esp
  int fd, fd1;

  printf(1, "unlinkread test\n");
    13e3:	c7 44 24 04 75 4c 00 	movl   $0x4c75,0x4(%esp)
    13ea:	00 
    13eb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    13f2:	e8 ea 2e 00 00       	call   42e1 <printf>
  fd = open("unlinkread", O_CREATE | O_RDWR);
    13f7:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    13fe:	00 
    13ff:	c7 04 24 86 4c 00 00 	movl   $0x4c86,(%esp)
    1406:	e8 8d 2d 00 00       	call   4198 <open>
    140b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    140e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1412:	79 20                	jns    1434 <unlinkread+0x57>
    printf(1, "create unlinkread failed\n");
    1414:	c7 44 24 04 91 4c 00 	movl   $0x4c91,0x4(%esp)
    141b:	00 
    141c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1423:	e8 b9 2e 00 00       	call   42e1 <printf>
    exit(1);
    1428:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    142f:	e8 1c 2d 00 00       	call   4150 <exit>
  }
  write(fd, "hello", 5);
    1434:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    143b:	00 
    143c:	c7 44 24 04 ab 4c 00 	movl   $0x4cab,0x4(%esp)
    1443:	00 
    1444:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1447:	89 04 24             	mov    %eax,(%esp)
    144a:	e8 29 2d 00 00       	call   4178 <write>
  close(fd);
    144f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1452:	89 04 24             	mov    %eax,(%esp)
    1455:	e8 26 2d 00 00       	call   4180 <close>

  fd = open("unlinkread", O_RDWR);
    145a:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    1461:	00 
    1462:	c7 04 24 86 4c 00 00 	movl   $0x4c86,(%esp)
    1469:	e8 2a 2d 00 00       	call   4198 <open>
    146e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1471:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1475:	79 20                	jns    1497 <unlinkread+0xba>
    printf(1, "open unlinkread failed\n");
    1477:	c7 44 24 04 b1 4c 00 	movl   $0x4cb1,0x4(%esp)
    147e:	00 
    147f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1486:	e8 56 2e 00 00       	call   42e1 <printf>
    exit(1);
    148b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1492:	e8 b9 2c 00 00       	call   4150 <exit>
  }
  if(unlink("unlinkread") != 0){
    1497:	c7 04 24 86 4c 00 00 	movl   $0x4c86,(%esp)
    149e:	e8 05 2d 00 00       	call   41a8 <unlink>
    14a3:	85 c0                	test   %eax,%eax
    14a5:	74 20                	je     14c7 <unlinkread+0xea>
    printf(1, "unlink unlinkread failed\n");
    14a7:	c7 44 24 04 c9 4c 00 	movl   $0x4cc9,0x4(%esp)
    14ae:	00 
    14af:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14b6:	e8 26 2e 00 00       	call   42e1 <printf>
    exit(1);
    14bb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    14c2:	e8 89 2c 00 00       	call   4150 <exit>
  }

  fd1 = open("unlinkread", O_CREATE | O_RDWR);
    14c7:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    14ce:	00 
    14cf:	c7 04 24 86 4c 00 00 	movl   $0x4c86,(%esp)
    14d6:	e8 bd 2c 00 00       	call   4198 <open>
    14db:	89 45 f4             	mov    %eax,-0xc(%ebp)
  write(fd1, "yyy", 3);
    14de:	c7 44 24 08 03 00 00 	movl   $0x3,0x8(%esp)
    14e5:	00 
    14e6:	c7 44 24 04 e3 4c 00 	movl   $0x4ce3,0x4(%esp)
    14ed:	00 
    14ee:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14f1:	89 04 24             	mov    %eax,(%esp)
    14f4:	e8 7f 2c 00 00       	call   4178 <write>
  close(fd1);
    14f9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    14fc:	89 04 24             	mov    %eax,(%esp)
    14ff:	e8 7c 2c 00 00       	call   4180 <close>

  if(read(fd, buf, sizeof(buf)) != 5){
    1504:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    150b:	00 
    150c:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
    1513:	00 
    1514:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1517:	89 04 24             	mov    %eax,(%esp)
    151a:	e8 51 2c 00 00       	call   4170 <read>
    151f:	83 f8 05             	cmp    $0x5,%eax
    1522:	74 20                	je     1544 <unlinkread+0x167>
    printf(1, "unlinkread read failed");
    1524:	c7 44 24 04 e7 4c 00 	movl   $0x4ce7,0x4(%esp)
    152b:	00 
    152c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1533:	e8 a9 2d 00 00       	call   42e1 <printf>
    exit(1);
    1538:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    153f:	e8 0c 2c 00 00       	call   4150 <exit>
  }
  if(buf[0] != 'h'){
    1544:	0f b6 05 80 85 00 00 	movzbl 0x8580,%eax
    154b:	3c 68                	cmp    $0x68,%al
    154d:	74 20                	je     156f <unlinkread+0x192>
    printf(1, "unlinkread wrong data\n");
    154f:	c7 44 24 04 fe 4c 00 	movl   $0x4cfe,0x4(%esp)
    1556:	00 
    1557:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    155e:	e8 7e 2d 00 00       	call   42e1 <printf>
    exit(1);
    1563:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    156a:	e8 e1 2b 00 00       	call   4150 <exit>
  }
  if(write(fd, buf, 10) != 10){
    156f:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    1576:	00 
    1577:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
    157e:	00 
    157f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1582:	89 04 24             	mov    %eax,(%esp)
    1585:	e8 ee 2b 00 00       	call   4178 <write>
    158a:	83 f8 0a             	cmp    $0xa,%eax
    158d:	74 20                	je     15af <unlinkread+0x1d2>
    printf(1, "unlinkread write failed\n");
    158f:	c7 44 24 04 15 4d 00 	movl   $0x4d15,0x4(%esp)
    1596:	00 
    1597:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    159e:	e8 3e 2d 00 00       	call   42e1 <printf>
    exit(1);
    15a3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15aa:	e8 a1 2b 00 00       	call   4150 <exit>
  }
  close(fd);
    15af:	8b 45 f0             	mov    -0x10(%ebp),%eax
    15b2:	89 04 24             	mov    %eax,(%esp)
    15b5:	e8 c6 2b 00 00       	call   4180 <close>
  unlink("unlinkread");
    15ba:	c7 04 24 86 4c 00 00 	movl   $0x4c86,(%esp)
    15c1:	e8 e2 2b 00 00       	call   41a8 <unlink>
  printf(1, "unlinkread ok\n");
    15c6:	c7 44 24 04 2e 4d 00 	movl   $0x4d2e,0x4(%esp)
    15cd:	00 
    15ce:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15d5:	e8 07 2d 00 00       	call   42e1 <printf>
}
    15da:	c9                   	leave  
    15db:	c3                   	ret    

000015dc <linktest>:

void
linktest(void)
{
    15dc:	55                   	push   %ebp
    15dd:	89 e5                	mov    %esp,%ebp
    15df:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "linktest\n");
    15e2:	c7 44 24 04 3d 4d 00 	movl   $0x4d3d,0x4(%esp)
    15e9:	00 
    15ea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    15f1:	e8 eb 2c 00 00       	call   42e1 <printf>

  unlink("lf1");
    15f6:	c7 04 24 47 4d 00 00 	movl   $0x4d47,(%esp)
    15fd:	e8 a6 2b 00 00       	call   41a8 <unlink>
  unlink("lf2");
    1602:	c7 04 24 4b 4d 00 00 	movl   $0x4d4b,(%esp)
    1609:	e8 9a 2b 00 00       	call   41a8 <unlink>

  fd = open("lf1", O_CREATE|O_RDWR);
    160e:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1615:	00 
    1616:	c7 04 24 47 4d 00 00 	movl   $0x4d47,(%esp)
    161d:	e8 76 2b 00 00       	call   4198 <open>
    1622:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1625:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1629:	79 20                	jns    164b <linktest+0x6f>
    printf(1, "create lf1 failed\n");
    162b:	c7 44 24 04 4f 4d 00 	movl   $0x4d4f,0x4(%esp)
    1632:	00 
    1633:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    163a:	e8 a2 2c 00 00       	call   42e1 <printf>
    exit(1);
    163f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1646:	e8 05 2b 00 00       	call   4150 <exit>
  }
  if(write(fd, "hello", 5) != 5){
    164b:	c7 44 24 08 05 00 00 	movl   $0x5,0x8(%esp)
    1652:	00 
    1653:	c7 44 24 04 ab 4c 00 	movl   $0x4cab,0x4(%esp)
    165a:	00 
    165b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    165e:	89 04 24             	mov    %eax,(%esp)
    1661:	e8 12 2b 00 00       	call   4178 <write>
    1666:	83 f8 05             	cmp    $0x5,%eax
    1669:	74 20                	je     168b <linktest+0xaf>
    printf(1, "write lf1 failed\n");
    166b:	c7 44 24 04 62 4d 00 	movl   $0x4d62,0x4(%esp)
    1672:	00 
    1673:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    167a:	e8 62 2c 00 00       	call   42e1 <printf>
    exit(1);
    167f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1686:	e8 c5 2a 00 00       	call   4150 <exit>
  }
  close(fd);
    168b:	8b 45 f4             	mov    -0xc(%ebp),%eax
    168e:	89 04 24             	mov    %eax,(%esp)
    1691:	e8 ea 2a 00 00       	call   4180 <close>

  if(link("lf1", "lf2") < 0){
    1696:	c7 44 24 04 4b 4d 00 	movl   $0x4d4b,0x4(%esp)
    169d:	00 
    169e:	c7 04 24 47 4d 00 00 	movl   $0x4d47,(%esp)
    16a5:	e8 0e 2b 00 00       	call   41b8 <link>
    16aa:	85 c0                	test   %eax,%eax
    16ac:	79 20                	jns    16ce <linktest+0xf2>
    printf(1, "link lf1 lf2 failed\n");
    16ae:	c7 44 24 04 74 4d 00 	movl   $0x4d74,0x4(%esp)
    16b5:	00 
    16b6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16bd:	e8 1f 2c 00 00       	call   42e1 <printf>
    exit(1);
    16c2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    16c9:	e8 82 2a 00 00       	call   4150 <exit>
  }
  unlink("lf1");
    16ce:	c7 04 24 47 4d 00 00 	movl   $0x4d47,(%esp)
    16d5:	e8 ce 2a 00 00       	call   41a8 <unlink>

  if(open("lf1", 0) >= 0){
    16da:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    16e1:	00 
    16e2:	c7 04 24 47 4d 00 00 	movl   $0x4d47,(%esp)
    16e9:	e8 aa 2a 00 00       	call   4198 <open>
    16ee:	85 c0                	test   %eax,%eax
    16f0:	78 20                	js     1712 <linktest+0x136>
    printf(1, "unlinked lf1 but it is still there!\n");
    16f2:	c7 44 24 04 8c 4d 00 	movl   $0x4d8c,0x4(%esp)
    16f9:	00 
    16fa:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1701:	e8 db 2b 00 00       	call   42e1 <printf>
    exit(1);
    1706:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    170d:	e8 3e 2a 00 00       	call   4150 <exit>
  }

  fd = open("lf2", 0);
    1712:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1719:	00 
    171a:	c7 04 24 4b 4d 00 00 	movl   $0x4d4b,(%esp)
    1721:	e8 72 2a 00 00       	call   4198 <open>
    1726:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1729:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    172d:	79 20                	jns    174f <linktest+0x173>
    printf(1, "open lf2 failed\n");
    172f:	c7 44 24 04 b1 4d 00 	movl   $0x4db1,0x4(%esp)
    1736:	00 
    1737:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    173e:	e8 9e 2b 00 00       	call   42e1 <printf>
    exit(1);
    1743:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    174a:	e8 01 2a 00 00       	call   4150 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 5){
    174f:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    1756:	00 
    1757:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
    175e:	00 
    175f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1762:	89 04 24             	mov    %eax,(%esp)
    1765:	e8 06 2a 00 00       	call   4170 <read>
    176a:	83 f8 05             	cmp    $0x5,%eax
    176d:	74 20                	je     178f <linktest+0x1b3>
    printf(1, "read lf2 failed\n");
    176f:	c7 44 24 04 c2 4d 00 	movl   $0x4dc2,0x4(%esp)
    1776:	00 
    1777:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    177e:	e8 5e 2b 00 00       	call   42e1 <printf>
    exit(1);
    1783:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    178a:	e8 c1 29 00 00       	call   4150 <exit>
  }
  close(fd);
    178f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1792:	89 04 24             	mov    %eax,(%esp)
    1795:	e8 e6 29 00 00       	call   4180 <close>

  if(link("lf2", "lf2") >= 0){
    179a:	c7 44 24 04 4b 4d 00 	movl   $0x4d4b,0x4(%esp)
    17a1:	00 
    17a2:	c7 04 24 4b 4d 00 00 	movl   $0x4d4b,(%esp)
    17a9:	e8 0a 2a 00 00       	call   41b8 <link>
    17ae:	85 c0                	test   %eax,%eax
    17b0:	78 20                	js     17d2 <linktest+0x1f6>
    printf(1, "link lf2 lf2 succeeded! oops\n");
    17b2:	c7 44 24 04 d3 4d 00 	movl   $0x4dd3,0x4(%esp)
    17b9:	00 
    17ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    17c1:	e8 1b 2b 00 00       	call   42e1 <printf>
    exit(1);
    17c6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    17cd:	e8 7e 29 00 00       	call   4150 <exit>
  }

  unlink("lf2");
    17d2:	c7 04 24 4b 4d 00 00 	movl   $0x4d4b,(%esp)
    17d9:	e8 ca 29 00 00       	call   41a8 <unlink>
  if(link("lf2", "lf1") >= 0){
    17de:	c7 44 24 04 47 4d 00 	movl   $0x4d47,0x4(%esp)
    17e5:	00 
    17e6:	c7 04 24 4b 4d 00 00 	movl   $0x4d4b,(%esp)
    17ed:	e8 c6 29 00 00       	call   41b8 <link>
    17f2:	85 c0                	test   %eax,%eax
    17f4:	78 20                	js     1816 <linktest+0x23a>
    printf(1, "link non-existant succeeded! oops\n");
    17f6:	c7 44 24 04 f4 4d 00 	movl   $0x4df4,0x4(%esp)
    17fd:	00 
    17fe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1805:	e8 d7 2a 00 00       	call   42e1 <printf>
    exit(1);
    180a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1811:	e8 3a 29 00 00       	call   4150 <exit>
  }

  if(link(".", "lf1") >= 0){
    1816:	c7 44 24 04 47 4d 00 	movl   $0x4d47,0x4(%esp)
    181d:	00 
    181e:	c7 04 24 17 4e 00 00 	movl   $0x4e17,(%esp)
    1825:	e8 8e 29 00 00       	call   41b8 <link>
    182a:	85 c0                	test   %eax,%eax
    182c:	78 20                	js     184e <linktest+0x272>
    printf(1, "link . lf1 succeeded! oops\n");
    182e:	c7 44 24 04 19 4e 00 	movl   $0x4e19,0x4(%esp)
    1835:	00 
    1836:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    183d:	e8 9f 2a 00 00       	call   42e1 <printf>
    exit(1);
    1842:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1849:	e8 02 29 00 00       	call   4150 <exit>
  }

  printf(1, "linktest ok\n");
    184e:	c7 44 24 04 35 4e 00 	movl   $0x4e35,0x4(%esp)
    1855:	00 
    1856:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    185d:	e8 7f 2a 00 00       	call   42e1 <printf>
}
    1862:	c9                   	leave  
    1863:	c3                   	ret    

00001864 <concreate>:

// test concurrent create/link/unlink of the same file
void
concreate(void)
{
    1864:	55                   	push   %ebp
    1865:	89 e5                	mov    %esp,%ebp
    1867:	83 ec 68             	sub    $0x68,%esp
  struct {
    ushort inum;
    char name[14];
  } de;

  printf(1, "concreate test\n");
    186a:	c7 44 24 04 42 4e 00 	movl   $0x4e42,0x4(%esp)
    1871:	00 
    1872:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1879:	e8 63 2a 00 00       	call   42e1 <printf>
  file[0] = 'C';
    187e:	c6 45 e5 43          	movb   $0x43,-0x1b(%ebp)
  file[2] = '\0';
    1882:	c6 45 e7 00          	movb   $0x0,-0x19(%ebp)
  for(i = 0; i < 40; i++){
    1886:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    188d:	e9 0c 01 00 00       	jmp    199e <concreate+0x13a>
    file[1] = '0' + i;
    1892:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1895:	83 c0 30             	add    $0x30,%eax
    1898:	88 45 e6             	mov    %al,-0x1a(%ebp)
    unlink(file);
    189b:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    189e:	89 04 24             	mov    %eax,(%esp)
    18a1:	e8 02 29 00 00       	call   41a8 <unlink>
    pid = fork();
    18a6:	e8 9d 28 00 00       	call   4148 <fork>
    18ab:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid && (i % 3) == 1){
    18ae:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18b2:	74 3a                	je     18ee <concreate+0x8a>
    18b4:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    18b7:	ba 56 55 55 55       	mov    $0x55555556,%edx
    18bc:	89 c8                	mov    %ecx,%eax
    18be:	f7 ea                	imul   %edx
    18c0:	89 c8                	mov    %ecx,%eax
    18c2:	c1 f8 1f             	sar    $0x1f,%eax
    18c5:	29 c2                	sub    %eax,%edx
    18c7:	89 d0                	mov    %edx,%eax
    18c9:	01 c0                	add    %eax,%eax
    18cb:	01 d0                	add    %edx,%eax
    18cd:	89 ca                	mov    %ecx,%edx
    18cf:	29 c2                	sub    %eax,%edx
    18d1:	83 fa 01             	cmp    $0x1,%edx
    18d4:	75 18                	jne    18ee <concreate+0x8a>
      link("C0", file);
    18d6:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    18d9:	89 44 24 04          	mov    %eax,0x4(%esp)
    18dd:	c7 04 24 52 4e 00 00 	movl   $0x4e52,(%esp)
    18e4:	e8 cf 28 00 00       	call   41b8 <link>
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
    18e9:	e9 8e 00 00 00       	jmp    197c <concreate+0x118>
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    18ee:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    18f2:	75 3a                	jne    192e <concreate+0xca>
    18f4:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    18f7:	ba 67 66 66 66       	mov    $0x66666667,%edx
    18fc:	89 c8                	mov    %ecx,%eax
    18fe:	f7 ea                	imul   %edx
    1900:	d1 fa                	sar    %edx
    1902:	89 c8                	mov    %ecx,%eax
    1904:	c1 f8 1f             	sar    $0x1f,%eax
    1907:	29 c2                	sub    %eax,%edx
    1909:	89 d0                	mov    %edx,%eax
    190b:	c1 e0 02             	shl    $0x2,%eax
    190e:	01 d0                	add    %edx,%eax
    1910:	89 ca                	mov    %ecx,%edx
    1912:	29 c2                	sub    %eax,%edx
    1914:	83 fa 01             	cmp    $0x1,%edx
    1917:	75 15                	jne    192e <concreate+0xca>
      link("C0", file);
    1919:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    191c:	89 44 24 04          	mov    %eax,0x4(%esp)
    1920:	c7 04 24 52 4e 00 00 	movl   $0x4e52,(%esp)
    1927:	e8 8c 28 00 00       	call   41b8 <link>
    file[1] = '0' + i;
    unlink(file);
    pid = fork();
    if(pid && (i % 3) == 1){
      link("C0", file);
    } else if(pid == 0 && (i % 5) == 1){
    192c:	eb 4e                	jmp    197c <concreate+0x118>
      link("C0", file);
    } else {
      fd = open(file, O_CREATE | O_RDWR);
    192e:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1935:	00 
    1936:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1939:	89 04 24             	mov    %eax,(%esp)
    193c:	e8 57 28 00 00       	call   4198 <open>
    1941:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(fd < 0){
    1944:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1948:	79 27                	jns    1971 <concreate+0x10d>
        printf(1, "concreate create %s failed\n", file);
    194a:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    194d:	89 44 24 08          	mov    %eax,0x8(%esp)
    1951:	c7 44 24 04 55 4e 00 	movl   $0x4e55,0x4(%esp)
    1958:	00 
    1959:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1960:	e8 7c 29 00 00       	call   42e1 <printf>
        exit(1);
    1965:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    196c:	e8 df 27 00 00       	call   4150 <exit>
      }
      close(fd);
    1971:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1974:	89 04 24             	mov    %eax,(%esp)
    1977:	e8 04 28 00 00       	call   4180 <close>
    }
    if(pid == 0)
    197c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1980:	75 0c                	jne    198e <concreate+0x12a>
      exit(0);
    1982:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1989:	e8 c2 27 00 00       	call   4150 <exit>
    else
      wait(0);
    198e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1995:	e8 be 27 00 00       	call   4158 <wait>
  } de;

  printf(1, "concreate test\n");
  file[0] = 'C';
  file[2] = '\0';
  for(i = 0; i < 40; i++){
    199a:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    199e:	83 7d e8 27          	cmpl   $0x27,-0x18(%ebp)
    19a2:	0f 8e ea fe ff ff    	jle    1892 <concreate+0x2e>
      exit(0);
    else
      wait(0);
  }

  memset(fa, 0, sizeof(fa));
    19a8:	c7 44 24 08 28 00 00 	movl   $0x28,0x8(%esp)
    19af:	00 
    19b0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19b7:	00 
    19b8:	8d 45 bd             	lea    -0x43(%ebp),%eax
    19bb:	89 04 24             	mov    %eax,(%esp)
    19be:	e8 e7 25 00 00       	call   3faa <memset>
  fd = open(".", 0);
    19c3:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    19ca:	00 
    19cb:	c7 04 24 17 4e 00 00 	movl   $0x4e17,(%esp)
    19d2:	e8 c1 27 00 00       	call   4198 <open>
    19d7:	89 45 f4             	mov    %eax,-0xc(%ebp)
  n = 0;
    19da:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  while(read(fd, &de, sizeof(de)) > 0){
    19e1:	e9 af 00 00 00       	jmp    1a95 <concreate+0x231>
    if(de.inum == 0)
    19e6:	0f b7 45 ac          	movzwl -0x54(%ebp),%eax
    19ea:	66 85 c0             	test   %ax,%ax
    19ed:	0f 84 a1 00 00 00    	je     1a94 <concreate+0x230>
      continue;
    if(de.name[0] == 'C' && de.name[2] == '\0'){
    19f3:	0f b6 45 ae          	movzbl -0x52(%ebp),%eax
    19f7:	3c 43                	cmp    $0x43,%al
    19f9:	0f 85 96 00 00 00    	jne    1a95 <concreate+0x231>
    19ff:	0f b6 45 b0          	movzbl -0x50(%ebp),%eax
    1a03:	84 c0                	test   %al,%al
    1a05:	0f 85 8a 00 00 00    	jne    1a95 <concreate+0x231>
      i = de.name[1] - '0';
    1a0b:	0f b6 45 af          	movzbl -0x51(%ebp),%eax
    1a0f:	0f be c0             	movsbl %al,%eax
    1a12:	83 e8 30             	sub    $0x30,%eax
    1a15:	89 45 e8             	mov    %eax,-0x18(%ebp)
      if(i < 0 || i >= sizeof(fa)){
    1a18:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    1a1c:	78 08                	js     1a26 <concreate+0x1c2>
    1a1e:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a21:	83 f8 27             	cmp    $0x27,%eax
    1a24:	76 2a                	jbe    1a50 <concreate+0x1ec>
        printf(1, "concreate weird file %s\n", de.name);
    1a26:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1a29:	83 c0 02             	add    $0x2,%eax
    1a2c:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a30:	c7 44 24 04 71 4e 00 	movl   $0x4e71,0x4(%esp)
    1a37:	00 
    1a38:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a3f:	e8 9d 28 00 00       	call   42e1 <printf>
        exit(1);
    1a44:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a4b:	e8 00 27 00 00       	call   4150 <exit>
      }
      if(fa[i]){
    1a50:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a53:	0f b6 44 05 bd       	movzbl -0x43(%ebp,%eax,1),%eax
    1a58:	84 c0                	test   %al,%al
    1a5a:	74 2a                	je     1a86 <concreate+0x222>
        printf(1, "concreate duplicate file %s\n", de.name);
    1a5c:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1a5f:	83 c0 02             	add    $0x2,%eax
    1a62:	89 44 24 08          	mov    %eax,0x8(%esp)
    1a66:	c7 44 24 04 8a 4e 00 	movl   $0x4e8a,0x4(%esp)
    1a6d:	00 
    1a6e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a75:	e8 67 28 00 00       	call   42e1 <printf>
        exit(1);
    1a7a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1a81:	e8 ca 26 00 00       	call   4150 <exit>
      }
      fa[i] = 1;
    1a86:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1a89:	c6 44 05 bd 01       	movb   $0x1,-0x43(%ebp,%eax,1)
      n++;
    1a8e:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1a92:	eb 01                	jmp    1a95 <concreate+0x231>
  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    if(de.inum == 0)
      continue;
    1a94:	90                   	nop
  }

  memset(fa, 0, sizeof(fa));
  fd = open(".", 0);
  n = 0;
  while(read(fd, &de, sizeof(de)) > 0){
    1a95:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    1a9c:	00 
    1a9d:	8d 45 ac             	lea    -0x54(%ebp),%eax
    1aa0:	89 44 24 04          	mov    %eax,0x4(%esp)
    1aa4:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aa7:	89 04 24             	mov    %eax,(%esp)
    1aaa:	e8 c1 26 00 00       	call   4170 <read>
    1aaf:	85 c0                	test   %eax,%eax
    1ab1:	0f 8f 2f ff ff ff    	jg     19e6 <concreate+0x182>
      }
      fa[i] = 1;
      n++;
    }
  }
  close(fd);
    1ab7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1aba:	89 04 24             	mov    %eax,(%esp)
    1abd:	e8 be 26 00 00       	call   4180 <close>

  if(n != 40){
    1ac2:	83 7d f0 28          	cmpl   $0x28,-0x10(%ebp)
    1ac6:	74 20                	je     1ae8 <concreate+0x284>
    printf(1, "concreate not enough files in directory listing\n");
    1ac8:	c7 44 24 04 a8 4e 00 	movl   $0x4ea8,0x4(%esp)
    1acf:	00 
    1ad0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ad7:	e8 05 28 00 00       	call   42e1 <printf>
    exit(1);
    1adc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ae3:	e8 68 26 00 00       	call   4150 <exit>
  }

  for(i = 0; i < 40; i++){
    1ae8:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
    1aef:	e9 42 01 00 00       	jmp    1c36 <concreate+0x3d2>
    file[1] = '0' + i;
    1af4:	8b 45 e8             	mov    -0x18(%ebp),%eax
    1af7:	83 c0 30             	add    $0x30,%eax
    1afa:	88 45 e6             	mov    %al,-0x1a(%ebp)
    pid = fork();
    1afd:	e8 46 26 00 00       	call   4148 <fork>
    1b02:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(pid < 0){
    1b05:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b09:	79 20                	jns    1b2b <concreate+0x2c7>
      printf(1, "fork failed\n");
    1b0b:	c7 44 24 04 95 4a 00 	movl   $0x4a95,0x4(%esp)
    1b12:	00 
    1b13:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b1a:	e8 c2 27 00 00       	call   42e1 <printf>
      exit(1);
    1b1f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1b26:	e8 25 26 00 00       	call   4150 <exit>
    }
    if(((i % 3) == 0 && pid == 0) ||
    1b2b:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    1b2e:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1b33:	89 c8                	mov    %ecx,%eax
    1b35:	f7 ea                	imul   %edx
    1b37:	89 c8                	mov    %ecx,%eax
    1b39:	c1 f8 1f             	sar    $0x1f,%eax
    1b3c:	29 c2                	sub    %eax,%edx
    1b3e:	89 d0                	mov    %edx,%eax
    1b40:	01 c0                	add    %eax,%eax
    1b42:	01 d0                	add    %edx,%eax
    1b44:	89 ca                	mov    %ecx,%edx
    1b46:	29 c2                	sub    %eax,%edx
    1b48:	85 d2                	test   %edx,%edx
    1b4a:	75 06                	jne    1b52 <concreate+0x2ee>
    1b4c:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b50:	74 28                	je     1b7a <concreate+0x316>
       ((i % 3) == 1 && pid != 0)){
    1b52:	8b 4d e8             	mov    -0x18(%ebp),%ecx
    1b55:	ba 56 55 55 55       	mov    $0x55555556,%edx
    1b5a:	89 c8                	mov    %ecx,%eax
    1b5c:	f7 ea                	imul   %edx
    1b5e:	89 c8                	mov    %ecx,%eax
    1b60:	c1 f8 1f             	sar    $0x1f,%eax
    1b63:	29 c2                	sub    %eax,%edx
    1b65:	89 d0                	mov    %edx,%eax
    1b67:	01 c0                	add    %eax,%eax
    1b69:	01 d0                	add    %edx,%eax
    1b6b:	89 ca                	mov    %ecx,%edx
    1b6d:	29 c2                	sub    %eax,%edx
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit(1);
    }
    if(((i % 3) == 0 && pid == 0) ||
    1b6f:	83 fa 01             	cmp    $0x1,%edx
    1b72:	75 74                	jne    1be8 <concreate+0x384>
    1b74:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1b78:	74 6e                	je     1be8 <concreate+0x384>
       ((i % 3) == 1 && pid != 0)){
      close(open(file, 0));
    1b7a:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b81:	00 
    1b82:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1b85:	89 04 24             	mov    %eax,(%esp)
    1b88:	e8 0b 26 00 00       	call   4198 <open>
    1b8d:	89 04 24             	mov    %eax,(%esp)
    1b90:	e8 eb 25 00 00       	call   4180 <close>
      close(open(file, 0));
    1b95:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1b9c:	00 
    1b9d:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1ba0:	89 04 24             	mov    %eax,(%esp)
    1ba3:	e8 f0 25 00 00       	call   4198 <open>
    1ba8:	89 04 24             	mov    %eax,(%esp)
    1bab:	e8 d0 25 00 00       	call   4180 <close>
      close(open(file, 0));
    1bb0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1bb7:	00 
    1bb8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1bbb:	89 04 24             	mov    %eax,(%esp)
    1bbe:	e8 d5 25 00 00       	call   4198 <open>
    1bc3:	89 04 24             	mov    %eax,(%esp)
    1bc6:	e8 b5 25 00 00       	call   4180 <close>
      close(open(file, 0));
    1bcb:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    1bd2:	00 
    1bd3:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1bd6:	89 04 24             	mov    %eax,(%esp)
    1bd9:	e8 ba 25 00 00       	call   4198 <open>
    1bde:	89 04 24             	mov    %eax,(%esp)
    1be1:	e8 9a 25 00 00       	call   4180 <close>
    pid = fork();
    if(pid < 0){
      printf(1, "fork failed\n");
      exit(1);
    }
    if(((i % 3) == 0 && pid == 0) ||
    1be6:	eb 2c                	jmp    1c14 <concreate+0x3b0>
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
      close(open(file, 0));
    } else {
      unlink(file);
    1be8:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1beb:	89 04 24             	mov    %eax,(%esp)
    1bee:	e8 b5 25 00 00       	call   41a8 <unlink>
      unlink(file);
    1bf3:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1bf6:	89 04 24             	mov    %eax,(%esp)
    1bf9:	e8 aa 25 00 00       	call   41a8 <unlink>
      unlink(file);
    1bfe:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c01:	89 04 24             	mov    %eax,(%esp)
    1c04:	e8 9f 25 00 00       	call   41a8 <unlink>
      unlink(file);
    1c09:	8d 45 e5             	lea    -0x1b(%ebp),%eax
    1c0c:	89 04 24             	mov    %eax,(%esp)
    1c0f:	e8 94 25 00 00       	call   41a8 <unlink>
    }
    if(pid == 0)
    1c14:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c18:	75 0c                	jne    1c26 <concreate+0x3c2>
      exit(0);
    1c1a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c21:	e8 2a 25 00 00       	call   4150 <exit>
    else
      wait(0);
    1c26:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1c2d:	e8 26 25 00 00       	call   4158 <wait>
  if(n != 40){
    printf(1, "concreate not enough files in directory listing\n");
    exit(1);
  }

  for(i = 0; i < 40; i++){
    1c32:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    1c36:	83 7d e8 27          	cmpl   $0x27,-0x18(%ebp)
    1c3a:	0f 8e b4 fe ff ff    	jle    1af4 <concreate+0x290>
      exit(0);
    else
      wait(0);
  }

  printf(1, "concreate ok\n");
    1c40:	c7 44 24 04 d9 4e 00 	movl   $0x4ed9,0x4(%esp)
    1c47:	00 
    1c48:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c4f:	e8 8d 26 00 00       	call   42e1 <printf>
}
    1c54:	c9                   	leave  
    1c55:	c3                   	ret    

00001c56 <linkunlink>:

// another concurrent link/unlink/create test,
// to look for deadlocks.
void
linkunlink()
{
    1c56:	55                   	push   %ebp
    1c57:	89 e5                	mov    %esp,%ebp
    1c59:	83 ec 28             	sub    $0x28,%esp
  int pid, i;

  printf(1, "linkunlink test\n");
    1c5c:	c7 44 24 04 e7 4e 00 	movl   $0x4ee7,0x4(%esp)
    1c63:	00 
    1c64:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c6b:	e8 71 26 00 00       	call   42e1 <printf>

  unlink("x");
    1c70:	c7 04 24 4e 4a 00 00 	movl   $0x4a4e,(%esp)
    1c77:	e8 2c 25 00 00       	call   41a8 <unlink>
  pid = fork();
    1c7c:	e8 c7 24 00 00       	call   4148 <fork>
    1c81:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid < 0){
    1c84:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1c88:	79 20                	jns    1caa <linkunlink+0x54>
    printf(1, "fork failed\n");
    1c8a:	c7 44 24 04 95 4a 00 	movl   $0x4a95,0x4(%esp)
    1c91:	00 
    1c92:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1c99:	e8 43 26 00 00       	call   42e1 <printf>
    exit(1);
    1c9e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ca5:	e8 a6 24 00 00       	call   4150 <exit>
  }

  unsigned int x = (pid ? 1 : 97);
    1caa:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1cae:	74 07                	je     1cb7 <linkunlink+0x61>
    1cb0:	b8 01 00 00 00       	mov    $0x1,%eax
    1cb5:	eb 05                	jmp    1cbc <linkunlink+0x66>
    1cb7:	b8 61 00 00 00       	mov    $0x61,%eax
    1cbc:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; i < 100; i++){
    1cbf:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1cc6:	e9 8e 00 00 00       	jmp    1d59 <linkunlink+0x103>
    x = x * 1103515245 + 12345;
    1ccb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1cce:	69 c0 6d 4e c6 41    	imul   $0x41c64e6d,%eax,%eax
    1cd4:	05 39 30 00 00       	add    $0x3039,%eax
    1cd9:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if((x % 3) == 0){
    1cdc:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1cdf:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1ce4:	89 c8                	mov    %ecx,%eax
    1ce6:	f7 e2                	mul    %edx
    1ce8:	d1 ea                	shr    %edx
    1cea:	89 d0                	mov    %edx,%eax
    1cec:	01 c0                	add    %eax,%eax
    1cee:	01 d0                	add    %edx,%eax
    1cf0:	89 ca                	mov    %ecx,%edx
    1cf2:	29 c2                	sub    %eax,%edx
    1cf4:	85 d2                	test   %edx,%edx
    1cf6:	75 1e                	jne    1d16 <linkunlink+0xc0>
      close(open("x", O_RDWR | O_CREATE));
    1cf8:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1cff:	00 
    1d00:	c7 04 24 4e 4a 00 00 	movl   $0x4a4e,(%esp)
    1d07:	e8 8c 24 00 00       	call   4198 <open>
    1d0c:	89 04 24             	mov    %eax,(%esp)
    1d0f:	e8 6c 24 00 00       	call   4180 <close>
    1d14:	eb 3f                	jmp    1d55 <linkunlink+0xff>
    } else if((x % 3) == 1){
    1d16:	8b 4d f4             	mov    -0xc(%ebp),%ecx
    1d19:	ba ab aa aa aa       	mov    $0xaaaaaaab,%edx
    1d1e:	89 c8                	mov    %ecx,%eax
    1d20:	f7 e2                	mul    %edx
    1d22:	d1 ea                	shr    %edx
    1d24:	89 d0                	mov    %edx,%eax
    1d26:	01 c0                	add    %eax,%eax
    1d28:	01 d0                	add    %edx,%eax
    1d2a:	89 ca                	mov    %ecx,%edx
    1d2c:	29 c2                	sub    %eax,%edx
    1d2e:	83 fa 01             	cmp    $0x1,%edx
    1d31:	75 16                	jne    1d49 <linkunlink+0xf3>
      link("cat", "x");
    1d33:	c7 44 24 04 4e 4a 00 	movl   $0x4a4e,0x4(%esp)
    1d3a:	00 
    1d3b:	c7 04 24 f8 4e 00 00 	movl   $0x4ef8,(%esp)
    1d42:	e8 71 24 00 00       	call   41b8 <link>
    1d47:	eb 0c                	jmp    1d55 <linkunlink+0xff>
    } else {
      unlink("x");
    1d49:	c7 04 24 4e 4a 00 00 	movl   $0x4a4e,(%esp)
    1d50:	e8 53 24 00 00       	call   41a8 <unlink>
    printf(1, "fork failed\n");
    exit(1);
  }

  unsigned int x = (pid ? 1 : 97);
  for(i = 0; i < 100; i++){
    1d55:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1d59:	83 7d f0 63          	cmpl   $0x63,-0x10(%ebp)
    1d5d:	0f 8e 68 ff ff ff    	jle    1ccb <linkunlink+0x75>
    } else {
      unlink("x");
    }
  }

  if(pid)
    1d63:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    1d67:	74 22                	je     1d8b <linkunlink+0x135>
    wait(0);
    1d69:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d70:	e8 e3 23 00 00       	call   4158 <wait>
  else 
    exit(0);

  printf(1, "linkunlink ok\n");
    1d75:	c7 44 24 04 fc 4e 00 	movl   $0x4efc,0x4(%esp)
    1d7c:	00 
    1d7d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1d84:	e8 58 25 00 00       	call   42e1 <printf>
}
    1d89:	c9                   	leave  
    1d8a:	c3                   	ret    
  }

  if(pid)
    wait(0);
  else 
    exit(0);
    1d8b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    1d92:	e8 b9 23 00 00       	call   4150 <exit>

00001d97 <bigdir>:
}

// directory that uses indirect blocks
void
bigdir(void)
{
    1d97:	55                   	push   %ebp
    1d98:	89 e5                	mov    %esp,%ebp
    1d9a:	83 ec 38             	sub    $0x38,%esp
  int i, fd;
  char name[10];

  printf(1, "bigdir test\n");
    1d9d:	c7 44 24 04 0b 4f 00 	movl   $0x4f0b,0x4(%esp)
    1da4:	00 
    1da5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1dac:	e8 30 25 00 00       	call   42e1 <printf>
  unlink("bd");
    1db1:	c7 04 24 18 4f 00 00 	movl   $0x4f18,(%esp)
    1db8:	e8 eb 23 00 00       	call   41a8 <unlink>

  fd = open("bd", O_CREATE);
    1dbd:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    1dc4:	00 
    1dc5:	c7 04 24 18 4f 00 00 	movl   $0x4f18,(%esp)
    1dcc:	e8 c7 23 00 00       	call   4198 <open>
    1dd1:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    1dd4:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    1dd8:	79 20                	jns    1dfa <bigdir+0x63>
    printf(1, "bigdir create failed\n");
    1dda:	c7 44 24 04 1b 4f 00 	movl   $0x4f1b,0x4(%esp)
    1de1:	00 
    1de2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1de9:	e8 f3 24 00 00       	call   42e1 <printf>
    exit(1);
    1dee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1df5:	e8 56 23 00 00       	call   4150 <exit>
  }
  close(fd);
    1dfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1dfd:	89 04 24             	mov    %eax,(%esp)
    1e00:	e8 7b 23 00 00       	call   4180 <close>

  for(i = 0; i < 500; i++){
    1e05:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1e0c:	eb 6f                	jmp    1e7d <bigdir+0xe6>
    name[0] = 'x';
    1e0e:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1e12:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e15:	8d 50 3f             	lea    0x3f(%eax),%edx
    1e18:	85 c0                	test   %eax,%eax
    1e1a:	0f 48 c2             	cmovs  %edx,%eax
    1e1d:	c1 f8 06             	sar    $0x6,%eax
    1e20:	83 c0 30             	add    $0x30,%eax
    1e23:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1e26:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1e29:	89 c2                	mov    %eax,%edx
    1e2b:	c1 fa 1f             	sar    $0x1f,%edx
    1e2e:	c1 ea 1a             	shr    $0x1a,%edx
    1e31:	01 d0                	add    %edx,%eax
    1e33:	83 e0 3f             	and    $0x3f,%eax
    1e36:	29 d0                	sub    %edx,%eax
    1e38:	83 c0 30             	add    $0x30,%eax
    1e3b:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1e3e:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(link("bd", name) != 0){
    1e42:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1e45:	89 44 24 04          	mov    %eax,0x4(%esp)
    1e49:	c7 04 24 18 4f 00 00 	movl   $0x4f18,(%esp)
    1e50:	e8 63 23 00 00       	call   41b8 <link>
    1e55:	85 c0                	test   %eax,%eax
    1e57:	74 20                	je     1e79 <bigdir+0xe2>
      printf(1, "bigdir link failed\n");
    1e59:	c7 44 24 04 31 4f 00 	movl   $0x4f31,0x4(%esp)
    1e60:	00 
    1e61:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e68:	e8 74 24 00 00       	call   42e1 <printf>
      exit(1);
    1e6d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1e74:	e8 d7 22 00 00       	call   4150 <exit>
    printf(1, "bigdir create failed\n");
    exit(1);
  }
  close(fd);

  for(i = 0; i < 500; i++){
    1e79:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1e7d:	81 7d f0 f3 01 00 00 	cmpl   $0x1f3,-0x10(%ebp)
    1e84:	7e 88                	jle    1e0e <bigdir+0x77>
      printf(1, "bigdir link failed\n");
      exit(1);
    }
  }

  unlink("bd");
    1e86:	c7 04 24 18 4f 00 00 	movl   $0x4f18,(%esp)
    1e8d:	e8 16 23 00 00       	call   41a8 <unlink>
  for(i = 0; i < 500; i++){
    1e92:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    1e99:	eb 67                	jmp    1f02 <bigdir+0x16b>
    name[0] = 'x';
    1e9b:	c6 45 e6 78          	movb   $0x78,-0x1a(%ebp)
    name[1] = '0' + (i / 64);
    1e9f:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1ea2:	8d 50 3f             	lea    0x3f(%eax),%edx
    1ea5:	85 c0                	test   %eax,%eax
    1ea7:	0f 48 c2             	cmovs  %edx,%eax
    1eaa:	c1 f8 06             	sar    $0x6,%eax
    1ead:	83 c0 30             	add    $0x30,%eax
    1eb0:	88 45 e7             	mov    %al,-0x19(%ebp)
    name[2] = '0' + (i % 64);
    1eb3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1eb6:	89 c2                	mov    %eax,%edx
    1eb8:	c1 fa 1f             	sar    $0x1f,%edx
    1ebb:	c1 ea 1a             	shr    $0x1a,%edx
    1ebe:	01 d0                	add    %edx,%eax
    1ec0:	83 e0 3f             	and    $0x3f,%eax
    1ec3:	29 d0                	sub    %edx,%eax
    1ec5:	83 c0 30             	add    $0x30,%eax
    1ec8:	88 45 e8             	mov    %al,-0x18(%ebp)
    name[3] = '\0';
    1ecb:	c6 45 e9 00          	movb   $0x0,-0x17(%ebp)
    if(unlink(name) != 0){
    1ecf:	8d 45 e6             	lea    -0x1a(%ebp),%eax
    1ed2:	89 04 24             	mov    %eax,(%esp)
    1ed5:	e8 ce 22 00 00       	call   41a8 <unlink>
    1eda:	85 c0                	test   %eax,%eax
    1edc:	74 20                	je     1efe <bigdir+0x167>
      printf(1, "bigdir unlink failed");
    1ede:	c7 44 24 04 45 4f 00 	movl   $0x4f45,0x4(%esp)
    1ee5:	00 
    1ee6:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1eed:	e8 ef 23 00 00       	call   42e1 <printf>
      exit(1);
    1ef2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ef9:	e8 52 22 00 00       	call   4150 <exit>
      exit(1);
    }
  }

  unlink("bd");
  for(i = 0; i < 500; i++){
    1efe:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    1f02:	81 7d f0 f3 01 00 00 	cmpl   $0x1f3,-0x10(%ebp)
    1f09:	7e 90                	jle    1e9b <bigdir+0x104>
      printf(1, "bigdir unlink failed");
      exit(1);
    }
  }

  printf(1, "bigdir ok\n");
    1f0b:	c7 44 24 04 5a 4f 00 	movl   $0x4f5a,0x4(%esp)
    1f12:	00 
    1f13:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f1a:	e8 c2 23 00 00       	call   42e1 <printf>
}
    1f1f:	c9                   	leave  
    1f20:	c3                   	ret    

00001f21 <subdir>:

void
subdir(void)
{
    1f21:	55                   	push   %ebp
    1f22:	89 e5                	mov    %esp,%ebp
    1f24:	83 ec 28             	sub    $0x28,%esp
  int fd, cc;

  printf(1, "subdir test\n");
    1f27:	c7 44 24 04 65 4f 00 	movl   $0x4f65,0x4(%esp)
    1f2e:	00 
    1f2f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f36:	e8 a6 23 00 00       	call   42e1 <printf>

  unlink("ff");
    1f3b:	c7 04 24 72 4f 00 00 	movl   $0x4f72,(%esp)
    1f42:	e8 61 22 00 00       	call   41a8 <unlink>
  if(mkdir("dd") != 0){
    1f47:	c7 04 24 75 4f 00 00 	movl   $0x4f75,(%esp)
    1f4e:	e8 6d 22 00 00       	call   41c0 <mkdir>
    1f53:	85 c0                	test   %eax,%eax
    1f55:	74 20                	je     1f77 <subdir+0x56>
    printf(1, "subdir mkdir dd failed\n");
    1f57:	c7 44 24 04 78 4f 00 	movl   $0x4f78,0x4(%esp)
    1f5e:	00 
    1f5f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f66:	e8 76 23 00 00       	call   42e1 <printf>
    exit(1);
    1f6b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1f72:	e8 d9 21 00 00       	call   4150 <exit>
  }

  fd = open("dd/ff", O_CREATE | O_RDWR);
    1f77:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    1f7e:	00 
    1f7f:	c7 04 24 90 4f 00 00 	movl   $0x4f90,(%esp)
    1f86:	e8 0d 22 00 00       	call   4198 <open>
    1f8b:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    1f8e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    1f92:	79 20                	jns    1fb4 <subdir+0x93>
    printf(1, "create dd/ff failed\n");
    1f94:	c7 44 24 04 96 4f 00 	movl   $0x4f96,0x4(%esp)
    1f9b:	00 
    1f9c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1fa3:	e8 39 23 00 00       	call   42e1 <printf>
    exit(1);
    1fa8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1faf:	e8 9c 21 00 00       	call   4150 <exit>
  }
  write(fd, "ff", 2);
    1fb4:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    1fbb:	00 
    1fbc:	c7 44 24 04 72 4f 00 	movl   $0x4f72,0x4(%esp)
    1fc3:	00 
    1fc4:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1fc7:	89 04 24             	mov    %eax,(%esp)
    1fca:	e8 a9 21 00 00       	call   4178 <write>
  close(fd);
    1fcf:	8b 45 f0             	mov    -0x10(%ebp),%eax
    1fd2:	89 04 24             	mov    %eax,(%esp)
    1fd5:	e8 a6 21 00 00       	call   4180 <close>
  
  if(unlink("dd") >= 0){
    1fda:	c7 04 24 75 4f 00 00 	movl   $0x4f75,(%esp)
    1fe1:	e8 c2 21 00 00       	call   41a8 <unlink>
    1fe6:	85 c0                	test   %eax,%eax
    1fe8:	78 20                	js     200a <subdir+0xe9>
    printf(1, "unlink dd (non-empty dir) succeeded!\n");
    1fea:	c7 44 24 04 ac 4f 00 	movl   $0x4fac,0x4(%esp)
    1ff1:	00 
    1ff2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    1ff9:	e8 e3 22 00 00       	call   42e1 <printf>
    exit(0);
    1ffe:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2005:	e8 46 21 00 00       	call   4150 <exit>
  }

  if(mkdir("/dd/dd") != 0){
    200a:	c7 04 24 d2 4f 00 00 	movl   $0x4fd2,(%esp)
    2011:	e8 aa 21 00 00       	call   41c0 <mkdir>
    2016:	85 c0                	test   %eax,%eax
    2018:	74 20                	je     203a <subdir+0x119>
    printf(1, "subdir mkdir dd/dd failed\n");
    201a:	c7 44 24 04 d9 4f 00 	movl   $0x4fd9,0x4(%esp)
    2021:	00 
    2022:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2029:	e8 b3 22 00 00       	call   42e1 <printf>
    exit(0);
    202e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2035:	e8 16 21 00 00       	call   4150 <exit>
  }

  fd = open("dd/dd/ff", O_CREATE | O_RDWR);
    203a:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2041:	00 
    2042:	c7 04 24 f4 4f 00 00 	movl   $0x4ff4,(%esp)
    2049:	e8 4a 21 00 00       	call   4198 <open>
    204e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    2051:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    2055:	79 20                	jns    2077 <subdir+0x156>
    printf(1, "create dd/dd/ff failed\n");
    2057:	c7 44 24 04 fd 4f 00 	movl   $0x4ffd,0x4(%esp)
    205e:	00 
    205f:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2066:	e8 76 22 00 00       	call   42e1 <printf>
    exit(0);
    206b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2072:	e8 d9 20 00 00       	call   4150 <exit>
  }
  write(fd, "FF", 2);
    2077:	c7 44 24 08 02 00 00 	movl   $0x2,0x8(%esp)
    207e:	00 
    207f:	c7 44 24 04 15 50 00 	movl   $0x5015,0x4(%esp)
    2086:	00 
    2087:	8b 45 f0             	mov    -0x10(%ebp),%eax
    208a:	89 04 24             	mov    %eax,(%esp)
    208d:	e8 e6 20 00 00       	call   4178 <write>
  close(fd);
    2092:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2095:	89 04 24             	mov    %eax,(%esp)
    2098:	e8 e3 20 00 00       	call   4180 <close>

  fd = open("dd/dd/../ff", 0);
    209d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    20a4:	00 
    20a5:	c7 04 24 18 50 00 00 	movl   $0x5018,(%esp)
    20ac:	e8 e7 20 00 00       	call   4198 <open>
    20b1:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    20b4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    20b8:	79 20                	jns    20da <subdir+0x1b9>
    printf(1, "open dd/dd/../ff failed\n");
    20ba:	c7 44 24 04 24 50 00 	movl   $0x5024,0x4(%esp)
    20c1:	00 
    20c2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    20c9:	e8 13 22 00 00       	call   42e1 <printf>
    exit(0);
    20ce:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    20d5:	e8 76 20 00 00       	call   4150 <exit>
  }
  cc = read(fd, buf, sizeof(buf));
    20da:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    20e1:	00 
    20e2:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
    20e9:	00 
    20ea:	8b 45 f0             	mov    -0x10(%ebp),%eax
    20ed:	89 04 24             	mov    %eax,(%esp)
    20f0:	e8 7b 20 00 00       	call   4170 <read>
    20f5:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(cc != 2 || buf[0] != 'f'){
    20f8:	83 7d f4 02          	cmpl   $0x2,-0xc(%ebp)
    20fc:	75 0b                	jne    2109 <subdir+0x1e8>
    20fe:	0f b6 05 80 85 00 00 	movzbl 0x8580,%eax
    2105:	3c 66                	cmp    $0x66,%al
    2107:	74 20                	je     2129 <subdir+0x208>
    printf(1, "dd/dd/../ff wrong content\n");
    2109:	c7 44 24 04 3d 50 00 	movl   $0x503d,0x4(%esp)
    2110:	00 
    2111:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2118:	e8 c4 21 00 00       	call   42e1 <printf>
    exit(0);
    211d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2124:	e8 27 20 00 00       	call   4150 <exit>
  }
  close(fd);
    2129:	8b 45 f0             	mov    -0x10(%ebp),%eax
    212c:	89 04 24             	mov    %eax,(%esp)
    212f:	e8 4c 20 00 00       	call   4180 <close>

  if(link("dd/dd/ff", "dd/dd/ffff") != 0){
    2134:	c7 44 24 04 58 50 00 	movl   $0x5058,0x4(%esp)
    213b:	00 
    213c:	c7 04 24 f4 4f 00 00 	movl   $0x4ff4,(%esp)
    2143:	e8 70 20 00 00       	call   41b8 <link>
    2148:	85 c0                	test   %eax,%eax
    214a:	74 20                	je     216c <subdir+0x24b>
    printf(1, "link dd/dd/ff dd/dd/ffff failed\n");
    214c:	c7 44 24 04 64 50 00 	movl   $0x5064,0x4(%esp)
    2153:	00 
    2154:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    215b:	e8 81 21 00 00       	call   42e1 <printf>
    exit(0);
    2160:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2167:	e8 e4 1f 00 00       	call   4150 <exit>
  }

  if(unlink("dd/dd/ff") != 0){
    216c:	c7 04 24 f4 4f 00 00 	movl   $0x4ff4,(%esp)
    2173:	e8 30 20 00 00       	call   41a8 <unlink>
    2178:	85 c0                	test   %eax,%eax
    217a:	74 20                	je     219c <subdir+0x27b>
    printf(1, "unlink dd/dd/ff failed\n");
    217c:	c7 44 24 04 85 50 00 	movl   $0x5085,0x4(%esp)
    2183:	00 
    2184:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    218b:	e8 51 21 00 00       	call   42e1 <printf>
    exit(0);
    2190:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2197:	e8 b4 1f 00 00       	call   4150 <exit>
  }
  if(open("dd/dd/ff", O_RDONLY) >= 0){
    219c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    21a3:	00 
    21a4:	c7 04 24 f4 4f 00 00 	movl   $0x4ff4,(%esp)
    21ab:	e8 e8 1f 00 00       	call   4198 <open>
    21b0:	85 c0                	test   %eax,%eax
    21b2:	78 20                	js     21d4 <subdir+0x2b3>
    printf(1, "open (unlinked) dd/dd/ff succeeded\n");
    21b4:	c7 44 24 04 a0 50 00 	movl   $0x50a0,0x4(%esp)
    21bb:	00 
    21bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21c3:	e8 19 21 00 00       	call   42e1 <printf>
    exit(0);
    21c8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    21cf:	e8 7c 1f 00 00       	call   4150 <exit>
  }

  if(chdir("dd") != 0){
    21d4:	c7 04 24 75 4f 00 00 	movl   $0x4f75,(%esp)
    21db:	e8 e8 1f 00 00       	call   41c8 <chdir>
    21e0:	85 c0                	test   %eax,%eax
    21e2:	74 20                	je     2204 <subdir+0x2e3>
    printf(1, "chdir dd failed\n");
    21e4:	c7 44 24 04 c4 50 00 	movl   $0x50c4,0x4(%esp)
    21eb:	00 
    21ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    21f3:	e8 e9 20 00 00       	call   42e1 <printf>
    exit(0);
    21f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    21ff:	e8 4c 1f 00 00       	call   4150 <exit>
  }
  if(chdir("dd/../../dd") != 0){
    2204:	c7 04 24 d5 50 00 00 	movl   $0x50d5,(%esp)
    220b:	e8 b8 1f 00 00       	call   41c8 <chdir>
    2210:	85 c0                	test   %eax,%eax
    2212:	74 20                	je     2234 <subdir+0x313>
    printf(1, "chdir dd/../../dd failed\n");
    2214:	c7 44 24 04 e1 50 00 	movl   $0x50e1,0x4(%esp)
    221b:	00 
    221c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2223:	e8 b9 20 00 00       	call   42e1 <printf>
    exit(0);
    2228:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    222f:	e8 1c 1f 00 00       	call   4150 <exit>
  }
  if(chdir("dd/../../../dd") != 0){
    2234:	c7 04 24 fb 50 00 00 	movl   $0x50fb,(%esp)
    223b:	e8 88 1f 00 00       	call   41c8 <chdir>
    2240:	85 c0                	test   %eax,%eax
    2242:	74 20                	je     2264 <subdir+0x343>
    printf(1, "chdir dd/../../dd failed\n");
    2244:	c7 44 24 04 e1 50 00 	movl   $0x50e1,0x4(%esp)
    224b:	00 
    224c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2253:	e8 89 20 00 00       	call   42e1 <printf>
    exit(0);
    2258:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    225f:	e8 ec 1e 00 00       	call   4150 <exit>
  }
  if(chdir("./..") != 0){
    2264:	c7 04 24 0a 51 00 00 	movl   $0x510a,(%esp)
    226b:	e8 58 1f 00 00       	call   41c8 <chdir>
    2270:	85 c0                	test   %eax,%eax
    2272:	74 20                	je     2294 <subdir+0x373>
    printf(1, "chdir ./.. failed\n");
    2274:	c7 44 24 04 0f 51 00 	movl   $0x510f,0x4(%esp)
    227b:	00 
    227c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2283:	e8 59 20 00 00       	call   42e1 <printf>
    exit(0);
    2288:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    228f:	e8 bc 1e 00 00       	call   4150 <exit>
  }

  fd = open("dd/dd/ffff", 0);
    2294:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    229b:	00 
    229c:	c7 04 24 58 50 00 00 	movl   $0x5058,(%esp)
    22a3:	e8 f0 1e 00 00       	call   4198 <open>
    22a8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    22ab:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    22af:	79 20                	jns    22d1 <subdir+0x3b0>
    printf(1, "open dd/dd/ffff failed\n");
    22b1:	c7 44 24 04 22 51 00 	movl   $0x5122,0x4(%esp)
    22b8:	00 
    22b9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    22c0:	e8 1c 20 00 00       	call   42e1 <printf>
    exit(0);
    22c5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    22cc:	e8 7f 1e 00 00       	call   4150 <exit>
  }
  if(read(fd, buf, sizeof(buf)) != 2){
    22d1:	c7 44 24 08 00 20 00 	movl   $0x2000,0x8(%esp)
    22d8:	00 
    22d9:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
    22e0:	00 
    22e1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    22e4:	89 04 24             	mov    %eax,(%esp)
    22e7:	e8 84 1e 00 00       	call   4170 <read>
    22ec:	83 f8 02             	cmp    $0x2,%eax
    22ef:	74 20                	je     2311 <subdir+0x3f0>
    printf(1, "read dd/dd/ffff wrong len\n");
    22f1:	c7 44 24 04 3a 51 00 	movl   $0x513a,0x4(%esp)
    22f8:	00 
    22f9:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2300:	e8 dc 1f 00 00       	call   42e1 <printf>
    exit(0);
    2305:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    230c:	e8 3f 1e 00 00       	call   4150 <exit>
  }
  close(fd);
    2311:	8b 45 f0             	mov    -0x10(%ebp),%eax
    2314:	89 04 24             	mov    %eax,(%esp)
    2317:	e8 64 1e 00 00       	call   4180 <close>

  if(open("dd/dd/ff", O_RDONLY) >= 0){
    231c:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2323:	00 
    2324:	c7 04 24 f4 4f 00 00 	movl   $0x4ff4,(%esp)
    232b:	e8 68 1e 00 00       	call   4198 <open>
    2330:	85 c0                	test   %eax,%eax
    2332:	78 20                	js     2354 <subdir+0x433>
    printf(1, "open (unlinked) dd/dd/ff succeeded!\n");
    2334:	c7 44 24 04 58 51 00 	movl   $0x5158,0x4(%esp)
    233b:	00 
    233c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2343:	e8 99 1f 00 00       	call   42e1 <printf>
    exit(0);
    2348:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    234f:	e8 fc 1d 00 00       	call   4150 <exit>
  }

  if(open("dd/ff/ff", O_CREATE|O_RDWR) >= 0){
    2354:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    235b:	00 
    235c:	c7 04 24 7d 51 00 00 	movl   $0x517d,(%esp)
    2363:	e8 30 1e 00 00       	call   4198 <open>
    2368:	85 c0                	test   %eax,%eax
    236a:	78 20                	js     238c <subdir+0x46b>
    printf(1, "create dd/ff/ff succeeded!\n");
    236c:	c7 44 24 04 86 51 00 	movl   $0x5186,0x4(%esp)
    2373:	00 
    2374:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    237b:	e8 61 1f 00 00       	call   42e1 <printf>
    exit(0);
    2380:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2387:	e8 c4 1d 00 00       	call   4150 <exit>
  }
  if(open("dd/xx/ff", O_CREATE|O_RDWR) >= 0){
    238c:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    2393:	00 
    2394:	c7 04 24 a2 51 00 00 	movl   $0x51a2,(%esp)
    239b:	e8 f8 1d 00 00       	call   4198 <open>
    23a0:	85 c0                	test   %eax,%eax
    23a2:	78 20                	js     23c4 <subdir+0x4a3>
    printf(1, "create dd/xx/ff succeeded!\n");
    23a4:	c7 44 24 04 ab 51 00 	movl   $0x51ab,0x4(%esp)
    23ab:	00 
    23ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23b3:	e8 29 1f 00 00       	call   42e1 <printf>
    exit(0);
    23b8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23bf:	e8 8c 1d 00 00       	call   4150 <exit>
  }
  if(open("dd", O_CREATE) >= 0){
    23c4:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    23cb:	00 
    23cc:	c7 04 24 75 4f 00 00 	movl   $0x4f75,(%esp)
    23d3:	e8 c0 1d 00 00       	call   4198 <open>
    23d8:	85 c0                	test   %eax,%eax
    23da:	78 20                	js     23fc <subdir+0x4db>
    printf(1, "create dd succeeded!\n");
    23dc:	c7 44 24 04 c7 51 00 	movl   $0x51c7,0x4(%esp)
    23e3:	00 
    23e4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    23eb:	e8 f1 1e 00 00       	call   42e1 <printf>
    exit(0);
    23f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    23f7:	e8 54 1d 00 00       	call   4150 <exit>
  }
  if(open("dd", O_RDWR) >= 0){
    23fc:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    2403:	00 
    2404:	c7 04 24 75 4f 00 00 	movl   $0x4f75,(%esp)
    240b:	e8 88 1d 00 00       	call   4198 <open>
    2410:	85 c0                	test   %eax,%eax
    2412:	78 20                	js     2434 <subdir+0x513>
    printf(1, "open dd rdwr succeeded!\n");
    2414:	c7 44 24 04 dd 51 00 	movl   $0x51dd,0x4(%esp)
    241b:	00 
    241c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2423:	e8 b9 1e 00 00       	call   42e1 <printf>
    exit(0);
    2428:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    242f:	e8 1c 1d 00 00       	call   4150 <exit>
  }
  if(open("dd", O_WRONLY) >= 0){
    2434:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
    243b:	00 
    243c:	c7 04 24 75 4f 00 00 	movl   $0x4f75,(%esp)
    2443:	e8 50 1d 00 00       	call   4198 <open>
    2448:	85 c0                	test   %eax,%eax
    244a:	78 20                	js     246c <subdir+0x54b>
    printf(1, "open dd wronly succeeded!\n");
    244c:	c7 44 24 04 f6 51 00 	movl   $0x51f6,0x4(%esp)
    2453:	00 
    2454:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    245b:	e8 81 1e 00 00       	call   42e1 <printf>
    exit(0);
    2460:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2467:	e8 e4 1c 00 00       	call   4150 <exit>
  }
  if(link("dd/ff/ff", "dd/dd/xx") == 0){
    246c:	c7 44 24 04 11 52 00 	movl   $0x5211,0x4(%esp)
    2473:	00 
    2474:	c7 04 24 7d 51 00 00 	movl   $0x517d,(%esp)
    247b:	e8 38 1d 00 00       	call   41b8 <link>
    2480:	85 c0                	test   %eax,%eax
    2482:	75 20                	jne    24a4 <subdir+0x583>
    printf(1, "link dd/ff/ff dd/dd/xx succeeded!\n");
    2484:	c7 44 24 04 1c 52 00 	movl   $0x521c,0x4(%esp)
    248b:	00 
    248c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2493:	e8 49 1e 00 00       	call   42e1 <printf>
    exit(0);
    2498:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    249f:	e8 ac 1c 00 00       	call   4150 <exit>
  }
  if(link("dd/xx/ff", "dd/dd/xx") == 0){
    24a4:	c7 44 24 04 11 52 00 	movl   $0x5211,0x4(%esp)
    24ab:	00 
    24ac:	c7 04 24 a2 51 00 00 	movl   $0x51a2,(%esp)
    24b3:	e8 00 1d 00 00       	call   41b8 <link>
    24b8:	85 c0                	test   %eax,%eax
    24ba:	75 20                	jne    24dc <subdir+0x5bb>
    printf(1, "link dd/xx/ff dd/dd/xx succeeded!\n");
    24bc:	c7 44 24 04 40 52 00 	movl   $0x5240,0x4(%esp)
    24c3:	00 
    24c4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    24cb:	e8 11 1e 00 00       	call   42e1 <printf>
    exit(0);
    24d0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    24d7:	e8 74 1c 00 00       	call   4150 <exit>
  }
  if(link("dd/ff", "dd/dd/ffff") == 0){
    24dc:	c7 44 24 04 58 50 00 	movl   $0x5058,0x4(%esp)
    24e3:	00 
    24e4:	c7 04 24 90 4f 00 00 	movl   $0x4f90,(%esp)
    24eb:	e8 c8 1c 00 00       	call   41b8 <link>
    24f0:	85 c0                	test   %eax,%eax
    24f2:	75 20                	jne    2514 <subdir+0x5f3>
    printf(1, "link dd/ff dd/dd/ffff succeeded!\n");
    24f4:	c7 44 24 04 64 52 00 	movl   $0x5264,0x4(%esp)
    24fb:	00 
    24fc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2503:	e8 d9 1d 00 00       	call   42e1 <printf>
    exit(0);
    2508:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    250f:	e8 3c 1c 00 00       	call   4150 <exit>
  }
  if(mkdir("dd/ff/ff") == 0){
    2514:	c7 04 24 7d 51 00 00 	movl   $0x517d,(%esp)
    251b:	e8 a0 1c 00 00       	call   41c0 <mkdir>
    2520:	85 c0                	test   %eax,%eax
    2522:	75 20                	jne    2544 <subdir+0x623>
    printf(1, "mkdir dd/ff/ff succeeded!\n");
    2524:	c7 44 24 04 86 52 00 	movl   $0x5286,0x4(%esp)
    252b:	00 
    252c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2533:	e8 a9 1d 00 00       	call   42e1 <printf>
    exit(0);
    2538:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    253f:	e8 0c 1c 00 00       	call   4150 <exit>
  }
  if(mkdir("dd/xx/ff") == 0){
    2544:	c7 04 24 a2 51 00 00 	movl   $0x51a2,(%esp)
    254b:	e8 70 1c 00 00       	call   41c0 <mkdir>
    2550:	85 c0                	test   %eax,%eax
    2552:	75 20                	jne    2574 <subdir+0x653>
    printf(1, "mkdir dd/xx/ff succeeded!\n");
    2554:	c7 44 24 04 a1 52 00 	movl   $0x52a1,0x4(%esp)
    255b:	00 
    255c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2563:	e8 79 1d 00 00       	call   42e1 <printf>
    exit(0);
    2568:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    256f:	e8 dc 1b 00 00       	call   4150 <exit>
  }
  if(mkdir("dd/dd/ffff") == 0){
    2574:	c7 04 24 58 50 00 00 	movl   $0x5058,(%esp)
    257b:	e8 40 1c 00 00       	call   41c0 <mkdir>
    2580:	85 c0                	test   %eax,%eax
    2582:	75 20                	jne    25a4 <subdir+0x683>
    printf(1, "mkdir dd/dd/ffff succeeded!\n");
    2584:	c7 44 24 04 bc 52 00 	movl   $0x52bc,0x4(%esp)
    258b:	00 
    258c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2593:	e8 49 1d 00 00       	call   42e1 <printf>
    exit(0);
    2598:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    259f:	e8 ac 1b 00 00       	call   4150 <exit>
  }
  if(unlink("dd/xx/ff") == 0){
    25a4:	c7 04 24 a2 51 00 00 	movl   $0x51a2,(%esp)
    25ab:	e8 f8 1b 00 00       	call   41a8 <unlink>
    25b0:	85 c0                	test   %eax,%eax
    25b2:	75 20                	jne    25d4 <subdir+0x6b3>
    printf(1, "unlink dd/xx/ff succeeded!\n");
    25b4:	c7 44 24 04 d9 52 00 	movl   $0x52d9,0x4(%esp)
    25bb:	00 
    25bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25c3:	e8 19 1d 00 00       	call   42e1 <printf>
    exit(0);
    25c8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25cf:	e8 7c 1b 00 00       	call   4150 <exit>
  }
  if(unlink("dd/ff/ff") == 0){
    25d4:	c7 04 24 7d 51 00 00 	movl   $0x517d,(%esp)
    25db:	e8 c8 1b 00 00       	call   41a8 <unlink>
    25e0:	85 c0                	test   %eax,%eax
    25e2:	75 20                	jne    2604 <subdir+0x6e3>
    printf(1, "unlink dd/ff/ff succeeded!\n");
    25e4:	c7 44 24 04 f5 52 00 	movl   $0x52f5,0x4(%esp)
    25eb:	00 
    25ec:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    25f3:	e8 e9 1c 00 00       	call   42e1 <printf>
    exit(0);
    25f8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    25ff:	e8 4c 1b 00 00       	call   4150 <exit>
  }
  if(chdir("dd/ff") == 0){
    2604:	c7 04 24 90 4f 00 00 	movl   $0x4f90,(%esp)
    260b:	e8 b8 1b 00 00       	call   41c8 <chdir>
    2610:	85 c0                	test   %eax,%eax
    2612:	75 20                	jne    2634 <subdir+0x713>
    printf(1, "chdir dd/ff succeeded!\n");
    2614:	c7 44 24 04 11 53 00 	movl   $0x5311,0x4(%esp)
    261b:	00 
    261c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2623:	e8 b9 1c 00 00       	call   42e1 <printf>
    exit(0);
    2628:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    262f:	e8 1c 1b 00 00       	call   4150 <exit>
  }
  if(chdir("dd/xx") == 0){
    2634:	c7 04 24 29 53 00 00 	movl   $0x5329,(%esp)
    263b:	e8 88 1b 00 00       	call   41c8 <chdir>
    2640:	85 c0                	test   %eax,%eax
    2642:	75 20                	jne    2664 <subdir+0x743>
    printf(1, "chdir dd/xx succeeded!\n");
    2644:	c7 44 24 04 2f 53 00 	movl   $0x532f,0x4(%esp)
    264b:	00 
    264c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2653:	e8 89 1c 00 00       	call   42e1 <printf>
    exit(0);
    2658:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    265f:	e8 ec 1a 00 00       	call   4150 <exit>
  }

  if(unlink("dd/dd/ffff") != 0){
    2664:	c7 04 24 58 50 00 00 	movl   $0x5058,(%esp)
    266b:	e8 38 1b 00 00       	call   41a8 <unlink>
    2670:	85 c0                	test   %eax,%eax
    2672:	74 20                	je     2694 <subdir+0x773>
    printf(1, "unlink dd/dd/ff failed\n");
    2674:	c7 44 24 04 85 50 00 	movl   $0x5085,0x4(%esp)
    267b:	00 
    267c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2683:	e8 59 1c 00 00       	call   42e1 <printf>
    exit(0);
    2688:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    268f:	e8 bc 1a 00 00       	call   4150 <exit>
  }
  if(unlink("dd/ff") != 0){
    2694:	c7 04 24 90 4f 00 00 	movl   $0x4f90,(%esp)
    269b:	e8 08 1b 00 00       	call   41a8 <unlink>
    26a0:	85 c0                	test   %eax,%eax
    26a2:	74 20                	je     26c4 <subdir+0x7a3>
    printf(1, "unlink dd/ff failed\n");
    26a4:	c7 44 24 04 47 53 00 	movl   $0x5347,0x4(%esp)
    26ab:	00 
    26ac:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26b3:	e8 29 1c 00 00       	call   42e1 <printf>
    exit(0);
    26b8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26bf:	e8 8c 1a 00 00       	call   4150 <exit>
  }
  if(unlink("dd") == 0){
    26c4:	c7 04 24 75 4f 00 00 	movl   $0x4f75,(%esp)
    26cb:	e8 d8 1a 00 00       	call   41a8 <unlink>
    26d0:	85 c0                	test   %eax,%eax
    26d2:	75 20                	jne    26f4 <subdir+0x7d3>
    printf(1, "unlink non-empty dd succeeded!\n");
    26d4:	c7 44 24 04 5c 53 00 	movl   $0x535c,0x4(%esp)
    26db:	00 
    26dc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    26e3:	e8 f9 1b 00 00       	call   42e1 <printf>
    exit(0);
    26e8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    26ef:	e8 5c 1a 00 00       	call   4150 <exit>
  }
  if(unlink("dd/dd") < 0){
    26f4:	c7 04 24 7c 53 00 00 	movl   $0x537c,(%esp)
    26fb:	e8 a8 1a 00 00       	call   41a8 <unlink>
    2700:	85 c0                	test   %eax,%eax
    2702:	79 20                	jns    2724 <subdir+0x803>
    printf(1, "unlink dd/dd failed\n");
    2704:	c7 44 24 04 82 53 00 	movl   $0x5382,0x4(%esp)
    270b:	00 
    270c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2713:	e8 c9 1b 00 00       	call   42e1 <printf>
    exit(0);
    2718:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    271f:	e8 2c 1a 00 00       	call   4150 <exit>
  }
  if(unlink("dd") < 0){
    2724:	c7 04 24 75 4f 00 00 	movl   $0x4f75,(%esp)
    272b:	e8 78 1a 00 00       	call   41a8 <unlink>
    2730:	85 c0                	test   %eax,%eax
    2732:	79 20                	jns    2754 <subdir+0x833>
    printf(1, "unlink dd failed\n");
    2734:	c7 44 24 04 97 53 00 	movl   $0x5397,0x4(%esp)
    273b:	00 
    273c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2743:	e8 99 1b 00 00       	call   42e1 <printf>
    exit(0);
    2748:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    274f:	e8 fc 19 00 00       	call   4150 <exit>
  }

  printf(1, "subdir ok\n");
    2754:	c7 44 24 04 a9 53 00 	movl   $0x53a9,0x4(%esp)
    275b:	00 
    275c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2763:	e8 79 1b 00 00       	call   42e1 <printf>
}
    2768:	c9                   	leave  
    2769:	c3                   	ret    

0000276a <bigwrite>:

// test writes that are larger than the log.
void
bigwrite(void)
{
    276a:	55                   	push   %ebp
    276b:	89 e5                	mov    %esp,%ebp
    276d:	83 ec 28             	sub    $0x28,%esp
  int fd, sz;

  printf(1, "bigwrite test\n");
    2770:	c7 44 24 04 b4 53 00 	movl   $0x53b4,0x4(%esp)
    2777:	00 
    2778:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    277f:	e8 5d 1b 00 00       	call   42e1 <printf>

  unlink("bigwrite");
    2784:	c7 04 24 c3 53 00 00 	movl   $0x53c3,(%esp)
    278b:	e8 18 1a 00 00       	call   41a8 <unlink>
  for(sz = 499; sz < 12*512; sz += 471){
    2790:	c7 45 ec f3 01 00 00 	movl   $0x1f3,-0x14(%ebp)
    2797:	e9 c1 00 00 00       	jmp    285d <bigwrite+0xf3>
    fd = open("bigwrite", O_CREATE | O_RDWR);
    279c:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    27a3:	00 
    27a4:	c7 04 24 c3 53 00 00 	movl   $0x53c3,(%esp)
    27ab:	e8 e8 19 00 00       	call   4198 <open>
    27b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(fd < 0){
    27b3:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    27b7:	79 20                	jns    27d9 <bigwrite+0x6f>
      printf(1, "cannot create bigwrite\n");
    27b9:	c7 44 24 04 cc 53 00 	movl   $0x53cc,0x4(%esp)
    27c0:	00 
    27c1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    27c8:	e8 14 1b 00 00       	call   42e1 <printf>
      exit(0);
    27cd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    27d4:	e8 77 19 00 00       	call   4150 <exit>
    }
    int i;
    for(i = 0; i < 2; i++){
    27d9:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    27e0:	eb 57                	jmp    2839 <bigwrite+0xcf>
      int cc = write(fd, buf, sz);
    27e2:	8b 45 ec             	mov    -0x14(%ebp),%eax
    27e5:	89 44 24 08          	mov    %eax,0x8(%esp)
    27e9:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
    27f0:	00 
    27f1:	8b 45 e8             	mov    -0x18(%ebp),%eax
    27f4:	89 04 24             	mov    %eax,(%esp)
    27f7:	e8 7c 19 00 00       	call   4178 <write>
    27fc:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(cc != sz){
    27ff:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2802:	3b 45 ec             	cmp    -0x14(%ebp),%eax
    2805:	74 2e                	je     2835 <bigwrite+0xcb>
        printf(1, "write(%d) ret %d\n", sz, cc);
    2807:	8b 45 f4             	mov    -0xc(%ebp),%eax
    280a:	89 44 24 0c          	mov    %eax,0xc(%esp)
    280e:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2811:	89 44 24 08          	mov    %eax,0x8(%esp)
    2815:	c7 44 24 04 e4 53 00 	movl   $0x53e4,0x4(%esp)
    281c:	00 
    281d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2824:	e8 b8 1a 00 00       	call   42e1 <printf>
        exit(0);
    2829:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2830:	e8 1b 19 00 00       	call   4150 <exit>
    if(fd < 0){
      printf(1, "cannot create bigwrite\n");
      exit(0);
    }
    int i;
    for(i = 0; i < 2; i++){
    2835:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    2839:	83 7d f0 01          	cmpl   $0x1,-0x10(%ebp)
    283d:	7e a3                	jle    27e2 <bigwrite+0x78>
      if(cc != sz){
        printf(1, "write(%d) ret %d\n", sz, cc);
        exit(0);
      }
    }
    close(fd);
    283f:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2842:	89 04 24             	mov    %eax,(%esp)
    2845:	e8 36 19 00 00       	call   4180 <close>
    unlink("bigwrite");
    284a:	c7 04 24 c3 53 00 00 	movl   $0x53c3,(%esp)
    2851:	e8 52 19 00 00       	call   41a8 <unlink>
  int fd, sz;

  printf(1, "bigwrite test\n");

  unlink("bigwrite");
  for(sz = 499; sz < 12*512; sz += 471){
    2856:	81 45 ec d7 01 00 00 	addl   $0x1d7,-0x14(%ebp)
    285d:	81 7d ec ff 17 00 00 	cmpl   $0x17ff,-0x14(%ebp)
    2864:	0f 8e 32 ff ff ff    	jle    279c <bigwrite+0x32>
    }
    close(fd);
    unlink("bigwrite");
  }

  printf(1, "bigwrite ok\n");
    286a:	c7 44 24 04 f6 53 00 	movl   $0x53f6,0x4(%esp)
    2871:	00 
    2872:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2879:	e8 63 1a 00 00       	call   42e1 <printf>
}
    287e:	c9                   	leave  
    287f:	c3                   	ret    

00002880 <bigfile>:

void
bigfile(void)
{
    2880:	55                   	push   %ebp
    2881:	89 e5                	mov    %esp,%ebp
    2883:	83 ec 28             	sub    $0x28,%esp
  int fd, i, total, cc;

  printf(1, "bigfile test\n");
    2886:	c7 44 24 04 03 54 00 	movl   $0x5403,0x4(%esp)
    288d:	00 
    288e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2895:	e8 47 1a 00 00       	call   42e1 <printf>

  unlink("bigfile");
    289a:	c7 04 24 11 54 00 00 	movl   $0x5411,(%esp)
    28a1:	e8 02 19 00 00       	call   41a8 <unlink>
  fd = open("bigfile", O_CREATE | O_RDWR);
    28a6:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    28ad:	00 
    28ae:	c7 04 24 11 54 00 00 	movl   $0x5411,(%esp)
    28b5:	e8 de 18 00 00       	call   4198 <open>
    28ba:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
    28bd:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    28c1:	79 20                	jns    28e3 <bigfile+0x63>
    printf(1, "cannot create bigfile");
    28c3:	c7 44 24 04 19 54 00 	movl   $0x5419,0x4(%esp)
    28ca:	00 
    28cb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    28d2:	e8 0a 1a 00 00       	call   42e1 <printf>
    exit(0);
    28d7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    28de:	e8 6d 18 00 00       	call   4150 <exit>
  }
  for(i = 0; i < 20; i++){
    28e3:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    28ea:	eb 61                	jmp    294d <bigfile+0xcd>
    memset(buf, i, 600);
    28ec:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    28f3:	00 
    28f4:	8b 45 ec             	mov    -0x14(%ebp),%eax
    28f7:	89 44 24 04          	mov    %eax,0x4(%esp)
    28fb:	c7 04 24 80 85 00 00 	movl   $0x8580,(%esp)
    2902:	e8 a3 16 00 00       	call   3faa <memset>
    if(write(fd, buf, 600) != 600){
    2907:	c7 44 24 08 58 02 00 	movl   $0x258,0x8(%esp)
    290e:	00 
    290f:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
    2916:	00 
    2917:	8b 45 e8             	mov    -0x18(%ebp),%eax
    291a:	89 04 24             	mov    %eax,(%esp)
    291d:	e8 56 18 00 00       	call   4178 <write>
    2922:	3d 58 02 00 00       	cmp    $0x258,%eax
    2927:	74 20                	je     2949 <bigfile+0xc9>
      printf(1, "write bigfile failed\n");
    2929:	c7 44 24 04 2f 54 00 	movl   $0x542f,0x4(%esp)
    2930:	00 
    2931:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2938:	e8 a4 19 00 00       	call   42e1 <printf>
      exit(0);
    293d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2944:	e8 07 18 00 00       	call   4150 <exit>
  fd = open("bigfile", O_CREATE | O_RDWR);
  if(fd < 0){
    printf(1, "cannot create bigfile");
    exit(0);
  }
  for(i = 0; i < 20; i++){
    2949:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    294d:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
    2951:	7e 99                	jle    28ec <bigfile+0x6c>
    if(write(fd, buf, 600) != 600){
      printf(1, "write bigfile failed\n");
      exit(0);
    }
  }
  close(fd);
    2953:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2956:	89 04 24             	mov    %eax,(%esp)
    2959:	e8 22 18 00 00       	call   4180 <close>

  fd = open("bigfile", 0);
    295e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2965:	00 
    2966:	c7 04 24 11 54 00 00 	movl   $0x5411,(%esp)
    296d:	e8 26 18 00 00       	call   4198 <open>
    2972:	89 45 e8             	mov    %eax,-0x18(%ebp)
  if(fd < 0){
    2975:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
    2979:	79 20                	jns    299b <bigfile+0x11b>
    printf(1, "cannot open bigfile\n");
    297b:	c7 44 24 04 45 54 00 	movl   $0x5445,0x4(%esp)
    2982:	00 
    2983:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    298a:	e8 52 19 00 00       	call   42e1 <printf>
    exit(0);
    298f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2996:	e8 b5 17 00 00       	call   4150 <exit>
  }
  total = 0;
    299b:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  for(i = 0; ; i++){
    29a2:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    cc = read(fd, buf, 300);
    29a9:	c7 44 24 08 2c 01 00 	movl   $0x12c,0x8(%esp)
    29b0:	00 
    29b1:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
    29b8:	00 
    29b9:	8b 45 e8             	mov    -0x18(%ebp),%eax
    29bc:	89 04 24             	mov    %eax,(%esp)
    29bf:	e8 ac 17 00 00       	call   4170 <read>
    29c4:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 0){
    29c7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    29cb:	79 20                	jns    29ed <bigfile+0x16d>
      printf(1, "read bigfile failed\n");
    29cd:	c7 44 24 04 5a 54 00 	movl   $0x545a,0x4(%esp)
    29d4:	00 
    29d5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    29dc:	e8 00 19 00 00       	call   42e1 <printf>
      exit(0);
    29e1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    29e8:	e8 63 17 00 00       	call   4150 <exit>
    }
    if(cc == 0)
    29ed:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    29f1:	0f 84 8e 00 00 00    	je     2a85 <bigfile+0x205>
      break;
    if(cc != 300){
    29f7:	81 7d f4 2c 01 00 00 	cmpl   $0x12c,-0xc(%ebp)
    29fe:	74 20                	je     2a20 <bigfile+0x1a0>
      printf(1, "short read bigfile\n");
    2a00:	c7 44 24 04 6f 54 00 	movl   $0x546f,0x4(%esp)
    2a07:	00 
    2a08:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a0f:	e8 cd 18 00 00       	call   42e1 <printf>
      exit(0);
    2a14:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a1b:	e8 30 17 00 00       	call   4150 <exit>
    }
    if(buf[0] != i/2 || buf[299] != i/2){
    2a20:	0f b6 05 80 85 00 00 	movzbl 0x8580,%eax
    2a27:	0f be d0             	movsbl %al,%edx
    2a2a:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a2d:	89 c1                	mov    %eax,%ecx
    2a2f:	c1 e9 1f             	shr    $0x1f,%ecx
    2a32:	8d 04 01             	lea    (%ecx,%eax,1),%eax
    2a35:	d1 f8                	sar    %eax
    2a37:	39 c2                	cmp    %eax,%edx
    2a39:	75 1b                	jne    2a56 <bigfile+0x1d6>
    2a3b:	0f b6 05 ab 86 00 00 	movzbl 0x86ab,%eax
    2a42:	0f be d0             	movsbl %al,%edx
    2a45:	8b 45 ec             	mov    -0x14(%ebp),%eax
    2a48:	89 c1                	mov    %eax,%ecx
    2a4a:	c1 e9 1f             	shr    $0x1f,%ecx
    2a4d:	8d 04 01             	lea    (%ecx,%eax,1),%eax
    2a50:	d1 f8                	sar    %eax
    2a52:	39 c2                	cmp    %eax,%edx
    2a54:	74 20                	je     2a76 <bigfile+0x1f6>
      printf(1, "read bigfile wrong data\n");
    2a56:	c7 44 24 04 83 54 00 	movl   $0x5483,0x4(%esp)
    2a5d:	00 
    2a5e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2a65:	e8 77 18 00 00       	call   42e1 <printf>
      exit(0);
    2a6a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2a71:	e8 da 16 00 00       	call   4150 <exit>
    }
    total += cc;
    2a76:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2a79:	01 45 f0             	add    %eax,-0x10(%ebp)
  if(fd < 0){
    printf(1, "cannot open bigfile\n");
    exit(0);
  }
  total = 0;
  for(i = 0; ; i++){
    2a7c:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    if(buf[0] != i/2 || buf[299] != i/2){
      printf(1, "read bigfile wrong data\n");
      exit(0);
    }
    total += cc;
  }
    2a80:	e9 24 ff ff ff       	jmp    29a9 <bigfile+0x129>
    if(cc < 0){
      printf(1, "read bigfile failed\n");
      exit(0);
    }
    if(cc == 0)
      break;
    2a85:	90                   	nop
      printf(1, "read bigfile wrong data\n");
      exit(0);
    }
    total += cc;
  }
  close(fd);
    2a86:	8b 45 e8             	mov    -0x18(%ebp),%eax
    2a89:	89 04 24             	mov    %eax,(%esp)
    2a8c:	e8 ef 16 00 00       	call   4180 <close>
  if(total != 20*600){
    2a91:	81 7d f0 e0 2e 00 00 	cmpl   $0x2ee0,-0x10(%ebp)
    2a98:	74 20                	je     2aba <bigfile+0x23a>
    printf(1, "read bigfile wrong total\n");
    2a9a:	c7 44 24 04 9c 54 00 	movl   $0x549c,0x4(%esp)
    2aa1:	00 
    2aa2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2aa9:	e8 33 18 00 00       	call   42e1 <printf>
    exit(0);
    2aae:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ab5:	e8 96 16 00 00       	call   4150 <exit>
  }
  unlink("bigfile");
    2aba:	c7 04 24 11 54 00 00 	movl   $0x5411,(%esp)
    2ac1:	e8 e2 16 00 00       	call   41a8 <unlink>

  printf(1, "bigfile test ok\n");
    2ac6:	c7 44 24 04 b6 54 00 	movl   $0x54b6,0x4(%esp)
    2acd:	00 
    2ace:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2ad5:	e8 07 18 00 00       	call   42e1 <printf>
}
    2ada:	c9                   	leave  
    2adb:	c3                   	ret    

00002adc <fourteen>:

void
fourteen(void)
{
    2adc:	55                   	push   %ebp
    2add:	89 e5                	mov    %esp,%ebp
    2adf:	83 ec 28             	sub    $0x28,%esp
  int fd;

  // DIRSIZ is 14.
  printf(1, "fourteen test\n");
    2ae2:	c7 44 24 04 c7 54 00 	movl   $0x54c7,0x4(%esp)
    2ae9:	00 
    2aea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2af1:	e8 eb 17 00 00       	call   42e1 <printf>

  if(mkdir("12345678901234") != 0){
    2af6:	c7 04 24 d6 54 00 00 	movl   $0x54d6,(%esp)
    2afd:	e8 be 16 00 00       	call   41c0 <mkdir>
    2b02:	85 c0                	test   %eax,%eax
    2b04:	74 20                	je     2b26 <fourteen+0x4a>
    printf(1, "mkdir 12345678901234 failed\n");
    2b06:	c7 44 24 04 e5 54 00 	movl   $0x54e5,0x4(%esp)
    2b0d:	00 
    2b0e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b15:	e8 c7 17 00 00       	call   42e1 <printf>
    exit(0);
    2b1a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b21:	e8 2a 16 00 00       	call   4150 <exit>
  }
  if(mkdir("12345678901234/123456789012345") != 0){
    2b26:	c7 04 24 04 55 00 00 	movl   $0x5504,(%esp)
    2b2d:	e8 8e 16 00 00       	call   41c0 <mkdir>
    2b32:	85 c0                	test   %eax,%eax
    2b34:	74 20                	je     2b56 <fourteen+0x7a>
    printf(1, "mkdir 12345678901234/123456789012345 failed\n");
    2b36:	c7 44 24 04 24 55 00 	movl   $0x5524,0x4(%esp)
    2b3d:	00 
    2b3e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b45:	e8 97 17 00 00       	call   42e1 <printf>
    exit(0);
    2b4a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b51:	e8 fa 15 00 00       	call   4150 <exit>
  }
  fd = open("123456789012345/123456789012345/123456789012345", O_CREATE);
    2b56:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2b5d:	00 
    2b5e:	c7 04 24 54 55 00 00 	movl   $0x5554,(%esp)
    2b65:	e8 2e 16 00 00       	call   4198 <open>
    2b6a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2b6d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2b71:	79 20                	jns    2b93 <fourteen+0xb7>
    printf(1, "create 123456789012345/123456789012345/123456789012345 failed\n");
    2b73:	c7 44 24 04 84 55 00 	movl   $0x5584,0x4(%esp)
    2b7a:	00 
    2b7b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2b82:	e8 5a 17 00 00       	call   42e1 <printf>
    exit(0);
    2b87:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2b8e:	e8 bd 15 00 00       	call   4150 <exit>
  }
  close(fd);
    2b93:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2b96:	89 04 24             	mov    %eax,(%esp)
    2b99:	e8 e2 15 00 00       	call   4180 <close>
  fd = open("12345678901234/12345678901234/12345678901234", 0);
    2b9e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2ba5:	00 
    2ba6:	c7 04 24 c4 55 00 00 	movl   $0x55c4,(%esp)
    2bad:	e8 e6 15 00 00       	call   4198 <open>
    2bb2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2bb5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2bb9:	79 20                	jns    2bdb <fourteen+0xff>
    printf(1, "open 12345678901234/12345678901234/12345678901234 failed\n");
    2bbb:	c7 44 24 04 f4 55 00 	movl   $0x55f4,0x4(%esp)
    2bc2:	00 
    2bc3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2bca:	e8 12 17 00 00       	call   42e1 <printf>
    exit(0);
    2bcf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2bd6:	e8 75 15 00 00       	call   4150 <exit>
  }
  close(fd);
    2bdb:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2bde:	89 04 24             	mov    %eax,(%esp)
    2be1:	e8 9a 15 00 00       	call   4180 <close>

  if(mkdir("12345678901234/12345678901234") == 0){
    2be6:	c7 04 24 2e 56 00 00 	movl   $0x562e,(%esp)
    2bed:	e8 ce 15 00 00       	call   41c0 <mkdir>
    2bf2:	85 c0                	test   %eax,%eax
    2bf4:	75 20                	jne    2c16 <fourteen+0x13a>
    printf(1, "mkdir 12345678901234/12345678901234 succeeded!\n");
    2bf6:	c7 44 24 04 4c 56 00 	movl   $0x564c,0x4(%esp)
    2bfd:	00 
    2bfe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c05:	e8 d7 16 00 00       	call   42e1 <printf>
    exit(0);
    2c0a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c11:	e8 3a 15 00 00       	call   4150 <exit>
  }
  if(mkdir("123456789012345/12345678901234") == 0){
    2c16:	c7 04 24 7c 56 00 00 	movl   $0x567c,(%esp)
    2c1d:	e8 9e 15 00 00       	call   41c0 <mkdir>
    2c22:	85 c0                	test   %eax,%eax
    2c24:	75 20                	jne    2c46 <fourteen+0x16a>
    printf(1, "mkdir 12345678901234/123456789012345 succeeded!\n");
    2c26:	c7 44 24 04 9c 56 00 	movl   $0x569c,0x4(%esp)
    2c2d:	00 
    2c2e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c35:	e8 a7 16 00 00       	call   42e1 <printf>
    exit(0);
    2c3a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2c41:	e8 0a 15 00 00       	call   4150 <exit>
  }

  printf(1, "fourteen ok\n");
    2c46:	c7 44 24 04 cd 56 00 	movl   $0x56cd,0x4(%esp)
    2c4d:	00 
    2c4e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c55:	e8 87 16 00 00       	call   42e1 <printf>
}
    2c5a:	c9                   	leave  
    2c5b:	c3                   	ret    

00002c5c <rmdot>:

void
rmdot(void)
{
    2c5c:	55                   	push   %ebp
    2c5d:	89 e5                	mov    %esp,%ebp
    2c5f:	83 ec 18             	sub    $0x18,%esp
  printf(1, "rmdot test\n");
    2c62:	c7 44 24 04 da 56 00 	movl   $0x56da,0x4(%esp)
    2c69:	00 
    2c6a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c71:	e8 6b 16 00 00       	call   42e1 <printf>
  if(mkdir("dots") != 0){
    2c76:	c7 04 24 e6 56 00 00 	movl   $0x56e6,(%esp)
    2c7d:	e8 3e 15 00 00       	call   41c0 <mkdir>
    2c82:	85 c0                	test   %eax,%eax
    2c84:	74 20                	je     2ca6 <rmdot+0x4a>
    printf(1, "mkdir dots failed\n");
    2c86:	c7 44 24 04 eb 56 00 	movl   $0x56eb,0x4(%esp)
    2c8d:	00 
    2c8e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2c95:	e8 47 16 00 00       	call   42e1 <printf>
    exit(0);
    2c9a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ca1:	e8 aa 14 00 00       	call   4150 <exit>
  }
  if(chdir("dots") != 0){
    2ca6:	c7 04 24 e6 56 00 00 	movl   $0x56e6,(%esp)
    2cad:	e8 16 15 00 00       	call   41c8 <chdir>
    2cb2:	85 c0                	test   %eax,%eax
    2cb4:	74 20                	je     2cd6 <rmdot+0x7a>
    printf(1, "chdir dots failed\n");
    2cb6:	c7 44 24 04 fe 56 00 	movl   $0x56fe,0x4(%esp)
    2cbd:	00 
    2cbe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2cc5:	e8 17 16 00 00       	call   42e1 <printf>
    exit(0);
    2cca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2cd1:	e8 7a 14 00 00       	call   4150 <exit>
  }
  if(unlink(".") == 0){
    2cd6:	c7 04 24 17 4e 00 00 	movl   $0x4e17,(%esp)
    2cdd:	e8 c6 14 00 00       	call   41a8 <unlink>
    2ce2:	85 c0                	test   %eax,%eax
    2ce4:	75 20                	jne    2d06 <rmdot+0xaa>
    printf(1, "rm . worked!\n");
    2ce6:	c7 44 24 04 11 57 00 	movl   $0x5711,0x4(%esp)
    2ced:	00 
    2cee:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2cf5:	e8 e7 15 00 00       	call   42e1 <printf>
    exit(0);
    2cfa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d01:	e8 4a 14 00 00       	call   4150 <exit>
  }
  if(unlink("..") == 0){
    2d06:	c7 04 24 a4 49 00 00 	movl   $0x49a4,(%esp)
    2d0d:	e8 96 14 00 00       	call   41a8 <unlink>
    2d12:	85 c0                	test   %eax,%eax
    2d14:	75 20                	jne    2d36 <rmdot+0xda>
    printf(1, "rm .. worked!\n");
    2d16:	c7 44 24 04 1f 57 00 	movl   $0x571f,0x4(%esp)
    2d1d:	00 
    2d1e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d25:	e8 b7 15 00 00       	call   42e1 <printf>
    exit(0);
    2d2a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d31:	e8 1a 14 00 00       	call   4150 <exit>
  }
  if(chdir("/") != 0){
    2d36:	c7 04 24 2e 57 00 00 	movl   $0x572e,(%esp)
    2d3d:	e8 86 14 00 00       	call   41c8 <chdir>
    2d42:	85 c0                	test   %eax,%eax
    2d44:	74 20                	je     2d66 <rmdot+0x10a>
    printf(1, "chdir / failed\n");
    2d46:	c7 44 24 04 30 57 00 	movl   $0x5730,0x4(%esp)
    2d4d:	00 
    2d4e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d55:	e8 87 15 00 00       	call   42e1 <printf>
    exit(0);
    2d5a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d61:	e8 ea 13 00 00       	call   4150 <exit>
  }
  if(unlink("dots/.") == 0){
    2d66:	c7 04 24 40 57 00 00 	movl   $0x5740,(%esp)
    2d6d:	e8 36 14 00 00       	call   41a8 <unlink>
    2d72:	85 c0                	test   %eax,%eax
    2d74:	75 20                	jne    2d96 <rmdot+0x13a>
    printf(1, "unlink dots/. worked!\n");
    2d76:	c7 44 24 04 47 57 00 	movl   $0x5747,0x4(%esp)
    2d7d:	00 
    2d7e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2d85:	e8 57 15 00 00       	call   42e1 <printf>
    exit(0);
    2d8a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2d91:	e8 ba 13 00 00       	call   4150 <exit>
  }
  if(unlink("dots/..") == 0){
    2d96:	c7 04 24 5e 57 00 00 	movl   $0x575e,(%esp)
    2d9d:	e8 06 14 00 00       	call   41a8 <unlink>
    2da2:	85 c0                	test   %eax,%eax
    2da4:	75 20                	jne    2dc6 <rmdot+0x16a>
    printf(1, "unlink dots/.. worked!\n");
    2da6:	c7 44 24 04 66 57 00 	movl   $0x5766,0x4(%esp)
    2dad:	00 
    2dae:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2db5:	e8 27 15 00 00       	call   42e1 <printf>
    exit(0);
    2dba:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2dc1:	e8 8a 13 00 00       	call   4150 <exit>
  }
  if(unlink("dots") != 0){
    2dc6:	c7 04 24 e6 56 00 00 	movl   $0x56e6,(%esp)
    2dcd:	e8 d6 13 00 00       	call   41a8 <unlink>
    2dd2:	85 c0                	test   %eax,%eax
    2dd4:	74 20                	je     2df6 <rmdot+0x19a>
    printf(1, "unlink dots failed!\n");
    2dd6:	c7 44 24 04 7e 57 00 	movl   $0x577e,0x4(%esp)
    2ddd:	00 
    2dde:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2de5:	e8 f7 14 00 00       	call   42e1 <printf>
    exit(0);
    2dea:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2df1:	e8 5a 13 00 00       	call   4150 <exit>
  }
  printf(1, "rmdot ok\n");
    2df6:	c7 44 24 04 93 57 00 	movl   $0x5793,0x4(%esp)
    2dfd:	00 
    2dfe:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e05:	e8 d7 14 00 00       	call   42e1 <printf>
}
    2e0a:	c9                   	leave  
    2e0b:	c3                   	ret    

00002e0c <dirfile>:

void
dirfile(void)
{
    2e0c:	55                   	push   %ebp
    2e0d:	89 e5                	mov    %esp,%ebp
    2e0f:	83 ec 28             	sub    $0x28,%esp
  int fd;

  printf(1, "dir vs file\n");
    2e12:	c7 44 24 04 9d 57 00 	movl   $0x579d,0x4(%esp)
    2e19:	00 
    2e1a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e21:	e8 bb 14 00 00       	call   42e1 <printf>

  fd = open("dirfile", O_CREATE);
    2e26:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2e2d:	00 
    2e2e:	c7 04 24 aa 57 00 00 	movl   $0x57aa,(%esp)
    2e35:	e8 5e 13 00 00       	call   4198 <open>
    2e3a:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0){
    2e3d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2e41:	79 20                	jns    2e63 <dirfile+0x57>
    printf(1, "create dirfile failed\n");
    2e43:	c7 44 24 04 b2 57 00 	movl   $0x57b2,0x4(%esp)
    2e4a:	00 
    2e4b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e52:	e8 8a 14 00 00       	call   42e1 <printf>
    exit(0);
    2e57:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e5e:	e8 ed 12 00 00       	call   4150 <exit>
  }
  close(fd);
    2e63:	8b 45 f4             	mov    -0xc(%ebp),%eax
    2e66:	89 04 24             	mov    %eax,(%esp)
    2e69:	e8 12 13 00 00       	call   4180 <close>
  if(chdir("dirfile") == 0){
    2e6e:	c7 04 24 aa 57 00 00 	movl   $0x57aa,(%esp)
    2e75:	e8 4e 13 00 00       	call   41c8 <chdir>
    2e7a:	85 c0                	test   %eax,%eax
    2e7c:	75 20                	jne    2e9e <dirfile+0x92>
    printf(1, "chdir dirfile succeeded!\n");
    2e7e:	c7 44 24 04 c9 57 00 	movl   $0x57c9,0x4(%esp)
    2e85:	00 
    2e86:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2e8d:	e8 4f 14 00 00       	call   42e1 <printf>
    exit(0);
    2e92:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2e99:	e8 b2 12 00 00       	call   4150 <exit>
  }
  fd = open("dirfile/xx", 0);
    2e9e:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    2ea5:	00 
    2ea6:	c7 04 24 e3 57 00 00 	movl   $0x57e3,(%esp)
    2ead:	e8 e6 12 00 00       	call   4198 <open>
    2eb2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2eb5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2eb9:	78 20                	js     2edb <dirfile+0xcf>
    printf(1, "create dirfile/xx succeeded!\n");
    2ebb:	c7 44 24 04 ee 57 00 	movl   $0x57ee,0x4(%esp)
    2ec2:	00 
    2ec3:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2eca:	e8 12 14 00 00       	call   42e1 <printf>
    exit(0);
    2ecf:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2ed6:	e8 75 12 00 00       	call   4150 <exit>
  }
  fd = open("dirfile/xx", O_CREATE);
    2edb:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    2ee2:	00 
    2ee3:	c7 04 24 e3 57 00 00 	movl   $0x57e3,(%esp)
    2eea:	e8 a9 12 00 00       	call   4198 <open>
    2eef:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2ef2:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2ef6:	78 20                	js     2f18 <dirfile+0x10c>
    printf(1, "create dirfile/xx succeeded!\n");
    2ef8:	c7 44 24 04 ee 57 00 	movl   $0x57ee,0x4(%esp)
    2eff:	00 
    2f00:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f07:	e8 d5 13 00 00       	call   42e1 <printf>
    exit(0);
    2f0c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f13:	e8 38 12 00 00       	call   4150 <exit>
  }
  if(mkdir("dirfile/xx") == 0){
    2f18:	c7 04 24 e3 57 00 00 	movl   $0x57e3,(%esp)
    2f1f:	e8 9c 12 00 00       	call   41c0 <mkdir>
    2f24:	85 c0                	test   %eax,%eax
    2f26:	75 20                	jne    2f48 <dirfile+0x13c>
    printf(1, "mkdir dirfile/xx succeeded!\n");
    2f28:	c7 44 24 04 0c 58 00 	movl   $0x580c,0x4(%esp)
    2f2f:	00 
    2f30:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f37:	e8 a5 13 00 00       	call   42e1 <printf>
    exit(0);
    2f3c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f43:	e8 08 12 00 00       	call   4150 <exit>
  }
  if(unlink("dirfile/xx") == 0){
    2f48:	c7 04 24 e3 57 00 00 	movl   $0x57e3,(%esp)
    2f4f:	e8 54 12 00 00       	call   41a8 <unlink>
    2f54:	85 c0                	test   %eax,%eax
    2f56:	75 20                	jne    2f78 <dirfile+0x16c>
    printf(1, "unlink dirfile/xx succeeded!\n");
    2f58:	c7 44 24 04 29 58 00 	movl   $0x5829,0x4(%esp)
    2f5f:	00 
    2f60:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f67:	e8 75 13 00 00       	call   42e1 <printf>
    exit(0);
    2f6c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2f73:	e8 d8 11 00 00       	call   4150 <exit>
  }
  if(link("README", "dirfile/xx") == 0){
    2f78:	c7 44 24 04 e3 57 00 	movl   $0x57e3,0x4(%esp)
    2f7f:	00 
    2f80:	c7 04 24 47 58 00 00 	movl   $0x5847,(%esp)
    2f87:	e8 2c 12 00 00       	call   41b8 <link>
    2f8c:	85 c0                	test   %eax,%eax
    2f8e:	75 20                	jne    2fb0 <dirfile+0x1a4>
    printf(1, "link to dirfile/xx succeeded!\n");
    2f90:	c7 44 24 04 50 58 00 	movl   $0x5850,0x4(%esp)
    2f97:	00 
    2f98:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2f9f:	e8 3d 13 00 00       	call   42e1 <printf>
    exit(0);
    2fa4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fab:	e8 a0 11 00 00       	call   4150 <exit>
  }
  if(unlink("dirfile") != 0){
    2fb0:	c7 04 24 aa 57 00 00 	movl   $0x57aa,(%esp)
    2fb7:	e8 ec 11 00 00       	call   41a8 <unlink>
    2fbc:	85 c0                	test   %eax,%eax
    2fbe:	74 20                	je     2fe0 <dirfile+0x1d4>
    printf(1, "unlink dirfile failed!\n");
    2fc0:	c7 44 24 04 6f 58 00 	movl   $0x586f,0x4(%esp)
    2fc7:	00 
    2fc8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    2fcf:	e8 0d 13 00 00       	call   42e1 <printf>
    exit(0);
    2fd4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    2fdb:	e8 70 11 00 00       	call   4150 <exit>
  }

  fd = open(".", O_RDWR);
    2fe0:	c7 44 24 04 02 00 00 	movl   $0x2,0x4(%esp)
    2fe7:	00 
    2fe8:	c7 04 24 17 4e 00 00 	movl   $0x4e17,(%esp)
    2fef:	e8 a4 11 00 00       	call   4198 <open>
    2ff4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd >= 0){
    2ff7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    2ffb:	78 20                	js     301d <dirfile+0x211>
    printf(1, "open . for writing succeeded!\n");
    2ffd:	c7 44 24 04 88 58 00 	movl   $0x5888,0x4(%esp)
    3004:	00 
    3005:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    300c:	e8 d0 12 00 00       	call   42e1 <printf>
    exit(0);
    3011:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3018:	e8 33 11 00 00       	call   4150 <exit>
  }
  fd = open(".", 0);
    301d:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3024:	00 
    3025:	c7 04 24 17 4e 00 00 	movl   $0x4e17,(%esp)
    302c:	e8 67 11 00 00       	call   4198 <open>
    3031:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(write(fd, "x", 1) > 0){
    3034:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    303b:	00 
    303c:	c7 44 24 04 4e 4a 00 	movl   $0x4a4e,0x4(%esp)
    3043:	00 
    3044:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3047:	89 04 24             	mov    %eax,(%esp)
    304a:	e8 29 11 00 00       	call   4178 <write>
    304f:	85 c0                	test   %eax,%eax
    3051:	7e 20                	jle    3073 <dirfile+0x267>
    printf(1, "write . succeeded!\n");
    3053:	c7 44 24 04 a7 58 00 	movl   $0x58a7,0x4(%esp)
    305a:	00 
    305b:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3062:	e8 7a 12 00 00       	call   42e1 <printf>
    exit(0);
    3067:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    306e:	e8 dd 10 00 00       	call   4150 <exit>
  }
  close(fd);
    3073:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3076:	89 04 24             	mov    %eax,(%esp)
    3079:	e8 02 11 00 00       	call   4180 <close>

  printf(1, "dir vs file OK\n");
    307e:	c7 44 24 04 bb 58 00 	movl   $0x58bb,0x4(%esp)
    3085:	00 
    3086:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    308d:	e8 4f 12 00 00       	call   42e1 <printf>
}
    3092:	c9                   	leave  
    3093:	c3                   	ret    

00003094 <iref>:

// test that iput() is called at the end of _namei()
void
iref(void)
{
    3094:	55                   	push   %ebp
    3095:	89 e5                	mov    %esp,%ebp
    3097:	83 ec 28             	sub    $0x28,%esp
  int i, fd;

  printf(1, "empty file name\n");
    309a:	c7 44 24 04 cb 58 00 	movl   $0x58cb,0x4(%esp)
    30a1:	00 
    30a2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30a9:	e8 33 12 00 00       	call   42e1 <printf>

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    30ae:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    30b5:	e9 e0 00 00 00       	jmp    319a <iref+0x106>
    if(mkdir("irefd") != 0){
    30ba:	c7 04 24 dc 58 00 00 	movl   $0x58dc,(%esp)
    30c1:	e8 fa 10 00 00       	call   41c0 <mkdir>
    30c6:	85 c0                	test   %eax,%eax
    30c8:	74 20                	je     30ea <iref+0x56>
      printf(1, "mkdir irefd failed\n");
    30ca:	c7 44 24 04 e2 58 00 	movl   $0x58e2,0x4(%esp)
    30d1:	00 
    30d2:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    30d9:	e8 03 12 00 00       	call   42e1 <printf>
      exit(0);
    30de:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    30e5:	e8 66 10 00 00       	call   4150 <exit>
    }
    if(chdir("irefd") != 0){
    30ea:	c7 04 24 dc 58 00 00 	movl   $0x58dc,(%esp)
    30f1:	e8 d2 10 00 00       	call   41c8 <chdir>
    30f6:	85 c0                	test   %eax,%eax
    30f8:	74 20                	je     311a <iref+0x86>
      printf(1, "chdir irefd failed\n");
    30fa:	c7 44 24 04 f6 58 00 	movl   $0x58f6,0x4(%esp)
    3101:	00 
    3102:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3109:	e8 d3 11 00 00       	call   42e1 <printf>
      exit(0);
    310e:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3115:	e8 36 10 00 00       	call   4150 <exit>
    }

    mkdir("");
    311a:	c7 04 24 0a 59 00 00 	movl   $0x590a,(%esp)
    3121:	e8 9a 10 00 00       	call   41c0 <mkdir>
    link("README", "");
    3126:	c7 44 24 04 0a 59 00 	movl   $0x590a,0x4(%esp)
    312d:	00 
    312e:	c7 04 24 47 58 00 00 	movl   $0x5847,(%esp)
    3135:	e8 7e 10 00 00       	call   41b8 <link>
    fd = open("", O_CREATE);
    313a:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3141:	00 
    3142:	c7 04 24 0a 59 00 00 	movl   $0x590a,(%esp)
    3149:	e8 4a 10 00 00       	call   4198 <open>
    314e:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(fd >= 0)
    3151:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    3155:	78 0b                	js     3162 <iref+0xce>
      close(fd);
    3157:	8b 45 f4             	mov    -0xc(%ebp),%eax
    315a:	89 04 24             	mov    %eax,(%esp)
    315d:	e8 1e 10 00 00       	call   4180 <close>
    fd = open("xx", O_CREATE);
    3162:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3169:	00 
    316a:	c7 04 24 0b 59 00 00 	movl   $0x590b,(%esp)
    3171:	e8 22 10 00 00       	call   4198 <open>
    3176:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(fd >= 0)
    3179:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    317d:	78 0b                	js     318a <iref+0xf6>
      close(fd);
    317f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3182:	89 04 24             	mov    %eax,(%esp)
    3185:	e8 f6 0f 00 00       	call   4180 <close>
    unlink("xx");
    318a:	c7 04 24 0b 59 00 00 	movl   $0x590b,(%esp)
    3191:	e8 12 10 00 00       	call   41a8 <unlink>
  int i, fd;

  printf(1, "empty file name\n");

  // the 50 is NINODE
  for(i = 0; i < 50 + 1; i++){
    3196:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    319a:	83 7d f0 32          	cmpl   $0x32,-0x10(%ebp)
    319e:	0f 8e 16 ff ff ff    	jle    30ba <iref+0x26>
    if(fd >= 0)
      close(fd);
    unlink("xx");
  }

  chdir("/");
    31a4:	c7 04 24 2e 57 00 00 	movl   $0x572e,(%esp)
    31ab:	e8 18 10 00 00       	call   41c8 <chdir>
  printf(1, "empty file name OK\n");
    31b0:	c7 44 24 04 0e 59 00 	movl   $0x590e,0x4(%esp)
    31b7:	00 
    31b8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31bf:	e8 1d 11 00 00       	call   42e1 <printf>
}
    31c4:	c9                   	leave  
    31c5:	c3                   	ret    

000031c6 <forktest>:
// test that fork fails gracefully
// the forktest binary also does this, but it runs out of proc entries first.
// inside the bigger usertests binary, we run out of memory first.
void
forktest(void)
{
    31c6:	55                   	push   %ebp
    31c7:	89 e5                	mov    %esp,%ebp
    31c9:	83 ec 28             	sub    $0x28,%esp
  int n, pid;

  printf(1, "fork test\n");
    31cc:	c7 44 24 04 22 59 00 	movl   $0x5922,0x4(%esp)
    31d3:	00 
    31d4:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    31db:	e8 01 11 00 00       	call   42e1 <printf>

  for(n=0; n<1000; n++){
    31e0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    31e7:	eb 24                	jmp    320d <forktest+0x47>
    pid = fork();
    31e9:	e8 5a 0f 00 00       	call   4148 <fork>
    31ee:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(pid < 0)
    31f1:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    31f5:	78 21                	js     3218 <forktest+0x52>
      break;
    if(pid == 0)
    31f7:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    31fb:	75 0c                	jne    3209 <forktest+0x43>
      exit(0);
    31fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3204:	e8 47 0f 00 00       	call   4150 <exit>
{
  int n, pid;

  printf(1, "fork test\n");

  for(n=0; n<1000; n++){
    3209:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    320d:	81 7d f0 e7 03 00 00 	cmpl   $0x3e7,-0x10(%ebp)
    3214:	7e d3                	jle    31e9 <forktest+0x23>
    3216:	eb 01                	jmp    3219 <forktest+0x53>
    pid = fork();
    if(pid < 0)
      break;
    3218:	90                   	nop
    if(pid == 0)
      exit(0);
  }
  
  if(n == 1000){
    3219:	81 7d f0 e8 03 00 00 	cmpl   $0x3e8,-0x10(%ebp)
    3220:	75 54                	jne    3276 <forktest+0xb0>
    printf(1, "fork claimed to work 1000 times!\n");
    3222:	c7 44 24 04 30 59 00 	movl   $0x5930,0x4(%esp)
    3229:	00 
    322a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3231:	e8 ab 10 00 00       	call   42e1 <printf>
    exit(0);
    3236:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    323d:	e8 0e 0f 00 00       	call   4150 <exit>
  }
  
  for(; n > 0; n--){
    if(wait(0) < 0){
    3242:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3249:	e8 0a 0f 00 00       	call   4158 <wait>
    324e:	85 c0                	test   %eax,%eax
    3250:	79 20                	jns    3272 <forktest+0xac>
      printf(1, "wait stopped early\n");
    3252:	c7 44 24 04 52 59 00 	movl   $0x5952,0x4(%esp)
    3259:	00 
    325a:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3261:	e8 7b 10 00 00       	call   42e1 <printf>
      exit(0);
    3266:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    326d:	e8 de 0e 00 00       	call   4150 <exit>
  if(n == 1000){
    printf(1, "fork claimed to work 1000 times!\n");
    exit(0);
  }
  
  for(; n > 0; n--){
    3272:	83 6d f0 01          	subl   $0x1,-0x10(%ebp)
    3276:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    327a:	7f c6                	jg     3242 <forktest+0x7c>
      printf(1, "wait stopped early\n");
      exit(0);
    }
  }
  
  if(wait(0) != -1){
    327c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3283:	e8 d0 0e 00 00       	call   4158 <wait>
    3288:	83 f8 ff             	cmp    $0xffffffff,%eax
    328b:	74 20                	je     32ad <forktest+0xe7>
    printf(1, "wait got too many\n");
    328d:	c7 44 24 04 66 59 00 	movl   $0x5966,0x4(%esp)
    3294:	00 
    3295:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    329c:	e8 40 10 00 00       	call   42e1 <printf>
    exit(0);
    32a1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32a8:	e8 a3 0e 00 00       	call   4150 <exit>
  }
  
  printf(1, "fork test OK\n");
    32ad:	c7 44 24 04 79 59 00 	movl   $0x5979,0x4(%esp)
    32b4:	00 
    32b5:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    32bc:	e8 20 10 00 00       	call   42e1 <printf>
}
    32c1:	c9                   	leave  
    32c2:	c3                   	ret    

000032c3 <sbrktest>:

void
sbrktest(void)
{
    32c3:	55                   	push   %ebp
    32c4:	89 e5                	mov    %esp,%ebp
    32c6:	53                   	push   %ebx
    32c7:	81 ec 84 00 00 00    	sub    $0x84,%esp
  int fds[2], pid, pids[10], ppid;
  char *a, *b, *c, *lastaddr, *oldbrk, *p, scratch;
  uint amt;

  printf(stdout, "sbrk test\n");
    32cd:	a1 88 5d 00 00       	mov    0x5d88,%eax
    32d2:	c7 44 24 04 87 59 00 	movl   $0x5987,0x4(%esp)
    32d9:	00 
    32da:	89 04 24             	mov    %eax,(%esp)
    32dd:	e8 ff 0f 00 00       	call   42e1 <printf>
  oldbrk = sbrk(0);
    32e2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32e9:	e8 f2 0e 00 00       	call   41e0 <sbrk>
    32ee:	89 45 e8             	mov    %eax,-0x18(%ebp)

  // can one sbrk() less than a page?
  a = sbrk(0);
    32f1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    32f8:	e8 e3 0e 00 00       	call   41e0 <sbrk>
    32fd:	89 45 d8             	mov    %eax,-0x28(%ebp)
  int i;
  for(i = 0; i < 5000; i++){ 
    3300:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3307:	eb 60                	jmp    3369 <sbrktest+0xa6>
    b = sbrk(1);
    3309:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3310:	e8 cb 0e 00 00       	call   41e0 <sbrk>
    3315:	89 45 dc             	mov    %eax,-0x24(%ebp)
    if(b != a){
    3318:	8b 45 dc             	mov    -0x24(%ebp),%eax
    331b:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    331e:	74 36                	je     3356 <sbrktest+0x93>
      printf(stdout, "sbrk test failed %d %x %x\n", i, a, b);
    3320:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3325:	8b 55 dc             	mov    -0x24(%ebp),%edx
    3328:	89 54 24 10          	mov    %edx,0x10(%esp)
    332c:	8b 55 d8             	mov    -0x28(%ebp),%edx
    332f:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3333:	8b 55 f4             	mov    -0xc(%ebp),%edx
    3336:	89 54 24 08          	mov    %edx,0x8(%esp)
    333a:	c7 44 24 04 92 59 00 	movl   $0x5992,0x4(%esp)
    3341:	00 
    3342:	89 04 24             	mov    %eax,(%esp)
    3345:	e8 97 0f 00 00       	call   42e1 <printf>
      exit(0);
    334a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3351:	e8 fa 0d 00 00       	call   4150 <exit>
    }
    *b = 1;
    3356:	8b 45 dc             	mov    -0x24(%ebp),%eax
    3359:	c6 00 01             	movb   $0x1,(%eax)
    a = b + 1;
    335c:	8b 45 dc             	mov    -0x24(%ebp),%eax
    335f:	83 c0 01             	add    $0x1,%eax
    3362:	89 45 d8             	mov    %eax,-0x28(%ebp)
  oldbrk = sbrk(0);

  // can one sbrk() less than a page?
  a = sbrk(0);
  int i;
  for(i = 0; i < 5000; i++){ 
    3365:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3369:	81 7d f4 87 13 00 00 	cmpl   $0x1387,-0xc(%ebp)
    3370:	7e 97                	jle    3309 <sbrktest+0x46>
      exit(0);
    }
    *b = 1;
    a = b + 1;
  }
  pid = fork();
    3372:	e8 d1 0d 00 00       	call   4148 <fork>
    3377:	89 45 d0             	mov    %eax,-0x30(%ebp)
  if(pid < 0){
    337a:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
    337e:	79 21                	jns    33a1 <sbrktest+0xde>
    printf(stdout, "sbrk test fork failed\n");
    3380:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3385:	c7 44 24 04 ad 59 00 	movl   $0x59ad,0x4(%esp)
    338c:	00 
    338d:	89 04 24             	mov    %eax,(%esp)
    3390:	e8 4c 0f 00 00       	call   42e1 <printf>
    exit(0);
    3395:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    339c:	e8 af 0d 00 00       	call   4150 <exit>
  }
  c = sbrk(1);
    33a1:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33a8:	e8 33 0e 00 00       	call   41e0 <sbrk>
    33ad:	89 45 e0             	mov    %eax,-0x20(%ebp)
  c = sbrk(1);
    33b0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    33b7:	e8 24 0e 00 00       	call   41e0 <sbrk>
    33bc:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a + 1){
    33bf:	8b 45 d8             	mov    -0x28(%ebp),%eax
    33c2:	83 c0 01             	add    $0x1,%eax
    33c5:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    33c8:	74 21                	je     33eb <sbrktest+0x128>
    printf(stdout, "sbrk test failed post-fork\n");
    33ca:	a1 88 5d 00 00       	mov    0x5d88,%eax
    33cf:	c7 44 24 04 c4 59 00 	movl   $0x59c4,0x4(%esp)
    33d6:	00 
    33d7:	89 04 24             	mov    %eax,(%esp)
    33da:	e8 02 0f 00 00       	call   42e1 <printf>
    exit(0);
    33df:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    33e6:	e8 65 0d 00 00       	call   4150 <exit>
  }
  if(pid == 0)
    33eb:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
    33ef:	75 0c                	jne    33fd <sbrktest+0x13a>
    exit(0);
    33f1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    33f8:	e8 53 0d 00 00       	call   4150 <exit>
  wait(0);
    33fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3404:	e8 4f 0d 00 00       	call   4158 <wait>

  // can one grow address space to something big?
#define BIG (100*1024*1024)
  a = sbrk(0);
    3409:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3410:	e8 cb 0d 00 00       	call   41e0 <sbrk>
    3415:	89 45 d8             	mov    %eax,-0x28(%ebp)
  amt = (BIG) - (uint)a;
    3418:	8b 45 d8             	mov    -0x28(%ebp),%eax
    341b:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3420:	89 d1                	mov    %edx,%ecx
    3422:	29 c1                	sub    %eax,%ecx
    3424:	89 c8                	mov    %ecx,%eax
    3426:	89 45 f0             	mov    %eax,-0x10(%ebp)
  p = sbrk(amt);
    3429:	8b 45 f0             	mov    -0x10(%ebp),%eax
    342c:	89 04 24             	mov    %eax,(%esp)
    342f:	e8 ac 0d 00 00       	call   41e0 <sbrk>
    3434:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if (p != a) { 
    3437:	8b 45 ec             	mov    -0x14(%ebp),%eax
    343a:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    343d:	74 21                	je     3460 <sbrktest+0x19d>
    printf(stdout, "sbrk test failed to grow big address space; enough phys mem?\n");
    343f:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3444:	c7 44 24 04 e0 59 00 	movl   $0x59e0,0x4(%esp)
    344b:	00 
    344c:	89 04 24             	mov    %eax,(%esp)
    344f:	e8 8d 0e 00 00       	call   42e1 <printf>
    exit(0);
    3454:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    345b:	e8 f0 0c 00 00       	call   4150 <exit>
  }
  lastaddr = (char*) (BIG-1);
    3460:	c7 45 e4 ff ff 3f 06 	movl   $0x63fffff,-0x1c(%ebp)
  *lastaddr = 99;
    3467:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    346a:	c6 00 63             	movb   $0x63,(%eax)

  // can one de-allocate?
  a = sbrk(0);
    346d:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3474:	e8 67 0d 00 00       	call   41e0 <sbrk>
    3479:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c = sbrk(-4096);
    347c:	c7 04 24 00 f0 ff ff 	movl   $0xfffff000,(%esp)
    3483:	e8 58 0d 00 00       	call   41e0 <sbrk>
    3488:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c == (char*)0xffffffff){
    348b:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    348f:	75 21                	jne    34b2 <sbrktest+0x1ef>
    printf(stdout, "sbrk could not deallocate\n");
    3491:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3496:	c7 44 24 04 1e 5a 00 	movl   $0x5a1e,0x4(%esp)
    349d:	00 
    349e:	89 04 24             	mov    %eax,(%esp)
    34a1:	e8 3b 0e 00 00       	call   42e1 <printf>
    exit(0);
    34a6:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34ad:	e8 9e 0c 00 00       	call   4150 <exit>
  }
  c = sbrk(0);
    34b2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34b9:	e8 22 0d 00 00       	call   41e0 <sbrk>
    34be:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a - 4096){
    34c1:	8b 45 d8             	mov    -0x28(%ebp),%eax
    34c4:	2d 00 10 00 00       	sub    $0x1000,%eax
    34c9:	3b 45 e0             	cmp    -0x20(%ebp),%eax
    34cc:	74 2f                	je     34fd <sbrktest+0x23a>
    printf(stdout, "sbrk deallocation produced wrong address, a %x c %x\n", a, c);
    34ce:	a1 88 5d 00 00       	mov    0x5d88,%eax
    34d3:	8b 55 e0             	mov    -0x20(%ebp),%edx
    34d6:	89 54 24 0c          	mov    %edx,0xc(%esp)
    34da:	8b 55 d8             	mov    -0x28(%ebp),%edx
    34dd:	89 54 24 08          	mov    %edx,0x8(%esp)
    34e1:	c7 44 24 04 3c 5a 00 	movl   $0x5a3c,0x4(%esp)
    34e8:	00 
    34e9:	89 04 24             	mov    %eax,(%esp)
    34ec:	e8 f0 0d 00 00       	call   42e1 <printf>
    exit(0);
    34f1:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    34f8:	e8 53 0c 00 00       	call   4150 <exit>
  }

  // can one re-allocate that page?
  a = sbrk(0);
    34fd:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3504:	e8 d7 0c 00 00       	call   41e0 <sbrk>
    3509:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c = sbrk(4096);
    350c:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3513:	e8 c8 0c 00 00       	call   41e0 <sbrk>
    3518:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a || sbrk(0) != a + 4096){
    351b:	8b 45 e0             	mov    -0x20(%ebp),%eax
    351e:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    3521:	75 19                	jne    353c <sbrktest+0x279>
    3523:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    352a:	e8 b1 0c 00 00       	call   41e0 <sbrk>
    352f:	8b 55 d8             	mov    -0x28(%ebp),%edx
    3532:	81 c2 00 10 00 00    	add    $0x1000,%edx
    3538:	39 d0                	cmp    %edx,%eax
    353a:	74 2f                	je     356b <sbrktest+0x2a8>
    printf(stdout, "sbrk re-allocation failed, a %x c %x\n", a, c);
    353c:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3541:	8b 55 e0             	mov    -0x20(%ebp),%edx
    3544:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3548:	8b 55 d8             	mov    -0x28(%ebp),%edx
    354b:	89 54 24 08          	mov    %edx,0x8(%esp)
    354f:	c7 44 24 04 74 5a 00 	movl   $0x5a74,0x4(%esp)
    3556:	00 
    3557:	89 04 24             	mov    %eax,(%esp)
    355a:	e8 82 0d 00 00       	call   42e1 <printf>
    exit(0);
    355f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3566:	e8 e5 0b 00 00       	call   4150 <exit>
  }
  if(*lastaddr == 99){
    356b:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    356e:	0f b6 00             	movzbl (%eax),%eax
    3571:	3c 63                	cmp    $0x63,%al
    3573:	75 21                	jne    3596 <sbrktest+0x2d3>
    // should be zero
    printf(stdout, "sbrk de-allocation didn't really deallocate\n");
    3575:	a1 88 5d 00 00       	mov    0x5d88,%eax
    357a:	c7 44 24 04 9c 5a 00 	movl   $0x5a9c,0x4(%esp)
    3581:	00 
    3582:	89 04 24             	mov    %eax,(%esp)
    3585:	e8 57 0d 00 00       	call   42e1 <printf>
    exit(0);
    358a:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3591:	e8 ba 0b 00 00       	call   4150 <exit>
  }

  a = sbrk(0);
    3596:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    359d:	e8 3e 0c 00 00       	call   41e0 <sbrk>
    35a2:	89 45 d8             	mov    %eax,-0x28(%ebp)
  c = sbrk(-(sbrk(0) - oldbrk));
    35a5:	8b 5d e8             	mov    -0x18(%ebp),%ebx
    35a8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35af:	e8 2c 0c 00 00       	call   41e0 <sbrk>
    35b4:	89 da                	mov    %ebx,%edx
    35b6:	29 c2                	sub    %eax,%edx
    35b8:	89 d0                	mov    %edx,%eax
    35ba:	89 04 24             	mov    %eax,(%esp)
    35bd:	e8 1e 0c 00 00       	call   41e0 <sbrk>
    35c2:	89 45 e0             	mov    %eax,-0x20(%ebp)
  if(c != a){
    35c5:	8b 45 e0             	mov    -0x20(%ebp),%eax
    35c8:	3b 45 d8             	cmp    -0x28(%ebp),%eax
    35cb:	74 2f                	je     35fc <sbrktest+0x339>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    35cd:	a1 88 5d 00 00       	mov    0x5d88,%eax
    35d2:	8b 55 e0             	mov    -0x20(%ebp),%edx
    35d5:	89 54 24 0c          	mov    %edx,0xc(%esp)
    35d9:	8b 55 d8             	mov    -0x28(%ebp),%edx
    35dc:	89 54 24 08          	mov    %edx,0x8(%esp)
    35e0:	c7 44 24 04 cc 5a 00 	movl   $0x5acc,0x4(%esp)
    35e7:	00 
    35e8:	89 04 24             	mov    %eax,(%esp)
    35eb:	e8 f1 0c 00 00       	call   42e1 <printf>
    exit(0);
    35f0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    35f7:	e8 54 0b 00 00       	call   4150 <exit>
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    35fc:	c7 45 d8 00 00 00 80 	movl   $0x80000000,-0x28(%ebp)
    3603:	e9 90 00 00 00       	jmp    3698 <sbrktest+0x3d5>
    ppid = getpid();
    3608:	e8 cb 0b 00 00       	call   41d8 <getpid>
    360d:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    pid = fork();
    3610:	e8 33 0b 00 00       	call   4148 <fork>
    3615:	89 45 d0             	mov    %eax,-0x30(%ebp)
    if(pid < 0){
    3618:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
    361c:	79 21                	jns    363f <sbrktest+0x37c>
      printf(stdout, "fork failed\n");
    361e:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3623:	c7 44 24 04 95 4a 00 	movl   $0x4a95,0x4(%esp)
    362a:	00 
    362b:	89 04 24             	mov    %eax,(%esp)
    362e:	e8 ae 0c 00 00       	call   42e1 <printf>
      exit(0);
    3633:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    363a:	e8 11 0b 00 00       	call   4150 <exit>
    }
    if(pid == 0){
    363f:	83 7d d0 00          	cmpl   $0x0,-0x30(%ebp)
    3643:	75 40                	jne    3685 <sbrktest+0x3c2>
      printf(stdout, "oops could read %x = %x\n", a, *a);
    3645:	8b 45 d8             	mov    -0x28(%ebp),%eax
    3648:	0f b6 00             	movzbl (%eax),%eax
    364b:	0f be d0             	movsbl %al,%edx
    364e:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3653:	89 54 24 0c          	mov    %edx,0xc(%esp)
    3657:	8b 55 d8             	mov    -0x28(%ebp),%edx
    365a:	89 54 24 08          	mov    %edx,0x8(%esp)
    365e:	c7 44 24 04 ed 5a 00 	movl   $0x5aed,0x4(%esp)
    3665:	00 
    3666:	89 04 24             	mov    %eax,(%esp)
    3669:	e8 73 0c 00 00       	call   42e1 <printf>
      kill(ppid);
    366e:	8b 45 d4             	mov    -0x2c(%ebp),%eax
    3671:	89 04 24             	mov    %eax,(%esp)
    3674:	e8 0f 0b 00 00       	call   4188 <kill>
      exit(0);
    3679:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3680:	e8 cb 0a 00 00       	call   4150 <exit>
    }
    wait(0);
    3685:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    368c:	e8 c7 0a 00 00       	call   4158 <wait>
    printf(stdout, "sbrk downsize failed, a %x c %x\n", a, c);
    exit(0);
  }
  
  // can we read the kernel's memory?
  for(a = (char*)(KERNBASE); a < (char*) (KERNBASE+2000000); a += 50000){
    3691:	81 45 d8 50 c3 00 00 	addl   $0xc350,-0x28(%ebp)
    3698:	81 7d d8 7f 84 1e 80 	cmpl   $0x801e847f,-0x28(%ebp)
    369f:	0f 86 63 ff ff ff    	jbe    3608 <sbrktest+0x345>
    wait(0);
  }

  // if we run the system out of memory, does it clean up the last
  // failed allocation?
  if(pipe(fds) != 0){
    36a5:	8d 45 c8             	lea    -0x38(%ebp),%eax
    36a8:	89 04 24             	mov    %eax,(%esp)
    36ab:	e8 b8 0a 00 00       	call   4168 <pipe>
    36b0:	85 c0                	test   %eax,%eax
    36b2:	74 20                	je     36d4 <sbrktest+0x411>
    printf(1, "pipe() failed\n");
    36b4:	c7 44 24 04 e9 49 00 	movl   $0x49e9,0x4(%esp)
    36bb:	00 
    36bc:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    36c3:	e8 19 0c 00 00       	call   42e1 <printf>
    exit(0);
    36c8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36cf:	e8 7c 0a 00 00       	call   4150 <exit>
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    36d4:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    36db:	e9 86 00 00 00       	jmp    3766 <sbrktest+0x4a3>
    if((pids[i] = fork()) == 0){
    36e0:	8b 5d f4             	mov    -0xc(%ebp),%ebx
    36e3:	e8 60 0a 00 00       	call   4148 <fork>
    36e8:	89 44 9d a0          	mov    %eax,-0x60(%ebp,%ebx,4)
    36ec:	8b 44 9d a0          	mov    -0x60(%ebp,%ebx,4),%eax
    36f0:	85 c0                	test   %eax,%eax
    36f2:	75 48                	jne    373c <sbrktest+0x479>
      // allocate a lot of memory
      sbrk(BIG - (uint)sbrk(0));
    36f4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    36fb:	e8 e0 0a 00 00       	call   41e0 <sbrk>
    3700:	ba 00 00 40 06       	mov    $0x6400000,%edx
    3705:	89 d1                	mov    %edx,%ecx
    3707:	29 c1                	sub    %eax,%ecx
    3709:	89 c8                	mov    %ecx,%eax
    370b:	89 04 24             	mov    %eax,(%esp)
    370e:	e8 cd 0a 00 00       	call   41e0 <sbrk>
      write(fds[1], "x", 1);
    3713:	8b 45 cc             	mov    -0x34(%ebp),%eax
    3716:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    371d:	00 
    371e:	c7 44 24 04 4e 4a 00 	movl   $0x4a4e,0x4(%esp)
    3725:	00 
    3726:	89 04 24             	mov    %eax,(%esp)
    3729:	e8 4a 0a 00 00       	call   4178 <write>
      // sit around until killed
      for(;;) sleep(1000);
    372e:	c7 04 24 e8 03 00 00 	movl   $0x3e8,(%esp)
    3735:	e8 ae 0a 00 00       	call   41e8 <sleep>
    373a:	eb f2                	jmp    372e <sbrktest+0x46b>
    }
    if(pids[i] != -1)
    373c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    373f:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3743:	83 f8 ff             	cmp    $0xffffffff,%eax
    3746:	74 1a                	je     3762 <sbrktest+0x49f>
      read(fds[0], &scratch, 1);
    3748:	8b 45 c8             	mov    -0x38(%ebp),%eax
    374b:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    3752:	00 
    3753:	8d 55 9f             	lea    -0x61(%ebp),%edx
    3756:	89 54 24 04          	mov    %edx,0x4(%esp)
    375a:	89 04 24             	mov    %eax,(%esp)
    375d:	e8 0e 0a 00 00       	call   4170 <read>
  // failed allocation?
  if(pipe(fds) != 0){
    printf(1, "pipe() failed\n");
    exit(0);
  }
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3762:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3766:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3769:	83 f8 09             	cmp    $0x9,%eax
    376c:	0f 86 6e ff ff ff    	jbe    36e0 <sbrktest+0x41d>
    if(pids[i] != -1)
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
    3772:	c7 04 24 00 10 00 00 	movl   $0x1000,(%esp)
    3779:	e8 62 0a 00 00       	call   41e0 <sbrk>
    377e:	89 45 e0             	mov    %eax,-0x20(%ebp)
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    3781:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    3788:	eb 2e                	jmp    37b8 <sbrktest+0x4f5>
    if(pids[i] == -1)
    378a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    378d:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    3791:	83 f8 ff             	cmp    $0xffffffff,%eax
    3794:	74 1d                	je     37b3 <sbrktest+0x4f0>
      continue;
    kill(pids[i]);
    3796:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3799:	8b 44 85 a0          	mov    -0x60(%ebp,%eax,4),%eax
    379d:	89 04 24             	mov    %eax,(%esp)
    37a0:	e8 e3 09 00 00       	call   4188 <kill>
    wait(0);
    37a5:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37ac:	e8 a7 09 00 00       	call   4158 <wait>
    37b1:	eb 01                	jmp    37b4 <sbrktest+0x4f1>
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    if(pids[i] == -1)
      continue;
    37b3:	90                   	nop
      read(fds[0], &scratch, 1);
  }
  // if those failed allocations freed up the pages they did allocate,
  // we'll be able to allocate here
  c = sbrk(4096);
  for(i = 0; i < sizeof(pids)/sizeof(pids[0]); i++){
    37b4:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    37b8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    37bb:	83 f8 09             	cmp    $0x9,%eax
    37be:	76 ca                	jbe    378a <sbrktest+0x4c7>
    if(pids[i] == -1)
      continue;
    kill(pids[i]);
    wait(0);
  }
  if(c == (char*)0xffffffff){
    37c0:	83 7d e0 ff          	cmpl   $0xffffffff,-0x20(%ebp)
    37c4:	75 21                	jne    37e7 <sbrktest+0x524>
    printf(stdout, "failed sbrk leaked memory\n");
    37c6:	a1 88 5d 00 00       	mov    0x5d88,%eax
    37cb:	c7 44 24 04 06 5b 00 	movl   $0x5b06,0x4(%esp)
    37d2:	00 
    37d3:	89 04 24             	mov    %eax,(%esp)
    37d6:	e8 06 0b 00 00       	call   42e1 <printf>
    exit(0);
    37db:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37e2:	e8 69 09 00 00       	call   4150 <exit>
  }

  if(sbrk(0) > oldbrk)
    37e7:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    37ee:	e8 ed 09 00 00       	call   41e0 <sbrk>
    37f3:	3b 45 e8             	cmp    -0x18(%ebp),%eax
    37f6:	76 1d                	jbe    3815 <sbrktest+0x552>
    sbrk(-(sbrk(0) - oldbrk));
    37f8:	8b 5d e8             	mov    -0x18(%ebp),%ebx
    37fb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3802:	e8 d9 09 00 00       	call   41e0 <sbrk>
    3807:	89 da                	mov    %ebx,%edx
    3809:	29 c2                	sub    %eax,%edx
    380b:	89 d0                	mov    %edx,%eax
    380d:	89 04 24             	mov    %eax,(%esp)
    3810:	e8 cb 09 00 00       	call   41e0 <sbrk>

  printf(stdout, "sbrk test OK\n");
    3815:	a1 88 5d 00 00       	mov    0x5d88,%eax
    381a:	c7 44 24 04 21 5b 00 	movl   $0x5b21,0x4(%esp)
    3821:	00 
    3822:	89 04 24             	mov    %eax,(%esp)
    3825:	e8 b7 0a 00 00       	call   42e1 <printf>
}
    382a:	81 c4 84 00 00 00    	add    $0x84,%esp
    3830:	5b                   	pop    %ebx
    3831:	5d                   	pop    %ebp
    3832:	c3                   	ret    

00003833 <validateint>:

void
validateint(int *p)
{
    3833:	55                   	push   %ebp
    3834:	89 e5                	mov    %esp,%ebp
    3836:	53                   	push   %ebx
    3837:	83 ec 10             	sub    $0x10,%esp
  int res;
  asm("mov %%esp, %%ebx\n\t"
    383a:	b8 0d 00 00 00       	mov    $0xd,%eax
    383f:	8b 55 08             	mov    0x8(%ebp),%edx
    3842:	89 d1                	mov    %edx,%ecx
    3844:	89 e3                	mov    %esp,%ebx
    3846:	89 cc                	mov    %ecx,%esp
    3848:	cd 40                	int    $0x40
    384a:	89 dc                	mov    %ebx,%esp
    384c:	89 45 f8             	mov    %eax,-0x8(%ebp)
      "int %2\n\t"
      "mov %%ebx, %%esp" :
      "=a" (res) :
      "a" (SYS_sleep), "n" (T_SYSCALL), "c" (p) :
      "ebx");
}
    384f:	83 c4 10             	add    $0x10,%esp
    3852:	5b                   	pop    %ebx
    3853:	5d                   	pop    %ebp
    3854:	c3                   	ret    

00003855 <validatetest>:

void
validatetest(void)
{
    3855:	55                   	push   %ebp
    3856:	89 e5                	mov    %esp,%ebp
    3858:	83 ec 28             	sub    $0x28,%esp
  int hi, pid;
  uint p;

  printf(stdout, "validate test\n");
    385b:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3860:	c7 44 24 04 2f 5b 00 	movl   $0x5b2f,0x4(%esp)
    3867:	00 
    3868:	89 04 24             	mov    %eax,(%esp)
    386b:	e8 71 0a 00 00       	call   42e1 <printf>
  hi = 1100*1024;
    3870:	c7 45 ec 00 30 11 00 	movl   $0x113000,-0x14(%ebp)

  for(p = 0; p <= (uint)hi; p += 4096){
    3877:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    387e:	e9 94 00 00 00       	jmp    3917 <validatetest+0xc2>
    if((pid = fork()) == 0){
    3883:	e8 c0 08 00 00       	call   4148 <fork>
    3888:	89 45 f0             	mov    %eax,-0x10(%ebp)
    388b:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    388f:	75 17                	jne    38a8 <validatetest+0x53>
      // try to crash the kernel by passing in a badly placed integer
      validateint((int*)p);
    3891:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3894:	89 04 24             	mov    %eax,(%esp)
    3897:	e8 97 ff ff ff       	call   3833 <validateint>
      exit(0);
    389c:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38a3:	e8 a8 08 00 00       	call   4150 <exit>
    }
    sleep(0);
    38a8:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38af:	e8 34 09 00 00       	call   41e8 <sleep>
    sleep(0);
    38b4:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38bb:	e8 28 09 00 00       	call   41e8 <sleep>
    kill(pid);
    38c0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    38c3:	89 04 24             	mov    %eax,(%esp)
    38c6:	e8 bd 08 00 00       	call   4188 <kill>
    wait(0);
    38cb:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    38d2:	e8 81 08 00 00       	call   4158 <wait>

    // try to crash the kernel by passing in a bad string pointer
    if(link("nosuchfile", (char*)p) != -1){
    38d7:	8b 45 f4             	mov    -0xc(%ebp),%eax
    38da:	89 44 24 04          	mov    %eax,0x4(%esp)
    38de:	c7 04 24 3e 5b 00 00 	movl   $0x5b3e,(%esp)
    38e5:	e8 ce 08 00 00       	call   41b8 <link>
    38ea:	83 f8 ff             	cmp    $0xffffffff,%eax
    38ed:	74 21                	je     3910 <validatetest+0xbb>
      printf(stdout, "link should not succeed\n");
    38ef:	a1 88 5d 00 00       	mov    0x5d88,%eax
    38f4:	c7 44 24 04 49 5b 00 	movl   $0x5b49,0x4(%esp)
    38fb:	00 
    38fc:	89 04 24             	mov    %eax,(%esp)
    38ff:	e8 dd 09 00 00       	call   42e1 <printf>
      exit(0);
    3904:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    390b:	e8 40 08 00 00       	call   4150 <exit>
  uint p;

  printf(stdout, "validate test\n");
  hi = 1100*1024;

  for(p = 0; p <= (uint)hi; p += 4096){
    3910:	81 45 f4 00 10 00 00 	addl   $0x1000,-0xc(%ebp)
    3917:	8b 45 ec             	mov    -0x14(%ebp),%eax
    391a:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    391d:	0f 83 60 ff ff ff    	jae    3883 <validatetest+0x2e>
      printf(stdout, "link should not succeed\n");
      exit(0);
    }
  }

  printf(stdout, "validate ok\n");
    3923:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3928:	c7 44 24 04 62 5b 00 	movl   $0x5b62,0x4(%esp)
    392f:	00 
    3930:	89 04 24             	mov    %eax,(%esp)
    3933:	e8 a9 09 00 00       	call   42e1 <printf>
}
    3938:	c9                   	leave  
    3939:	c3                   	ret    

0000393a <bsstest>:

// does unintialized data start out zero?
char uninit[10000];
void
bsstest(void)
{
    393a:	55                   	push   %ebp
    393b:	89 e5                	mov    %esp,%ebp
    393d:	83 ec 28             	sub    $0x28,%esp
  int i;

  printf(stdout, "bss test\n");
    3940:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3945:	c7 44 24 04 6f 5b 00 	movl   $0x5b6f,0x4(%esp)
    394c:	00 
    394d:	89 04 24             	mov    %eax,(%esp)
    3950:	e8 8c 09 00 00       	call   42e1 <printf>
  for(i = 0; i < sizeof(uninit); i++){
    3955:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    395c:	eb 33                	jmp    3991 <bsstest+0x57>
    if(uninit[i] != '\0'){
    395e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3961:	0f b6 80 60 5e 00 00 	movzbl 0x5e60(%eax),%eax
    3968:	84 c0                	test   %al,%al
    396a:	74 21                	je     398d <bsstest+0x53>
      printf(stdout, "bss test failed\n");
    396c:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3971:	c7 44 24 04 79 5b 00 	movl   $0x5b79,0x4(%esp)
    3978:	00 
    3979:	89 04 24             	mov    %eax,(%esp)
    397c:	e8 60 09 00 00       	call   42e1 <printf>
      exit(0);
    3981:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3988:	e8 c3 07 00 00       	call   4150 <exit>
bsstest(void)
{
  int i;

  printf(stdout, "bss test\n");
  for(i = 0; i < sizeof(uninit); i++){
    398d:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    3991:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3994:	3d 0f 27 00 00       	cmp    $0x270f,%eax
    3999:	76 c3                	jbe    395e <bsstest+0x24>
    if(uninit[i] != '\0'){
      printf(stdout, "bss test failed\n");
      exit(0);
    }
  }
  printf(stdout, "bss test ok\n");
    399b:	a1 88 5d 00 00       	mov    0x5d88,%eax
    39a0:	c7 44 24 04 8a 5b 00 	movl   $0x5b8a,0x4(%esp)
    39a7:	00 
    39a8:	89 04 24             	mov    %eax,(%esp)
    39ab:	e8 31 09 00 00       	call   42e1 <printf>
}
    39b0:	c9                   	leave  
    39b1:	c3                   	ret    

000039b2 <bigargtest>:
// does exec return an error if the arguments
// are larger than a page? or does it write
// below the stack and wreck the instructions/data?
void
bigargtest(void)
{
    39b2:	55                   	push   %ebp
    39b3:	89 e5                	mov    %esp,%ebp
    39b5:	83 ec 28             	sub    $0x28,%esp
  int pid, fd;

  unlink("bigarg-ok");
    39b8:	c7 04 24 97 5b 00 00 	movl   $0x5b97,(%esp)
    39bf:	e8 e4 07 00 00       	call   41a8 <unlink>
  pid = fork();
    39c4:	e8 7f 07 00 00       	call   4148 <fork>
    39c9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if(pid == 0){
    39cc:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    39d0:	0f 85 97 00 00 00    	jne    3a6d <bigargtest+0xbb>
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    39d6:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    39dd:	eb 12                	jmp    39f1 <bigargtest+0x3f>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    39df:	8b 45 f4             	mov    -0xc(%ebp),%eax
    39e2:	c7 04 85 c0 5d 00 00 	movl   $0x5ba4,0x5dc0(,%eax,4)
    39e9:	a4 5b 00 00 
  unlink("bigarg-ok");
  pid = fork();
  if(pid == 0){
    static char *args[MAXARG];
    int i;
    for(i = 0; i < MAXARG-1; i++)
    39ed:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
    39f1:	83 7d f4 1e          	cmpl   $0x1e,-0xc(%ebp)
    39f5:	7e e8                	jle    39df <bigargtest+0x2d>
      args[i] = "bigargs test: failed\n                                                                                                                                                                                                       ";
    args[MAXARG-1] = 0;
    39f7:	c7 05 3c 5e 00 00 00 	movl   $0x0,0x5e3c
    39fe:	00 00 00 
    printf(stdout, "bigarg test\n");
    3a01:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3a06:	c7 44 24 04 81 5c 00 	movl   $0x5c81,0x4(%esp)
    3a0d:	00 
    3a0e:	89 04 24             	mov    %eax,(%esp)
    3a11:	e8 cb 08 00 00       	call   42e1 <printf>
    exec("echo", args);
    3a16:	c7 44 24 04 c0 5d 00 	movl   $0x5dc0,0x4(%esp)
    3a1d:	00 
    3a1e:	c7 04 24 a8 46 00 00 	movl   $0x46a8,(%esp)
    3a25:	e8 66 07 00 00       	call   4190 <exec>
    printf(stdout, "bigarg test ok\n");
    3a2a:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3a2f:	c7 44 24 04 8e 5c 00 	movl   $0x5c8e,0x4(%esp)
    3a36:	00 
    3a37:	89 04 24             	mov    %eax,(%esp)
    3a3a:	e8 a2 08 00 00       	call   42e1 <printf>
    fd = open("bigarg-ok", O_CREATE);
    3a3f:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3a46:	00 
    3a47:	c7 04 24 97 5b 00 00 	movl   $0x5b97,(%esp)
    3a4e:	e8 45 07 00 00       	call   4198 <open>
    3a53:	89 45 f0             	mov    %eax,-0x10(%ebp)
    close(fd);
    3a56:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3a59:	89 04 24             	mov    %eax,(%esp)
    3a5c:	e8 1f 07 00 00       	call   4180 <close>
    exit(0);
    3a61:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a68:	e8 e3 06 00 00       	call   4150 <exit>
  } else if(pid < 0){
    3a6d:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3a71:	79 21                	jns    3a94 <bigargtest+0xe2>
    printf(stdout, "bigargtest: fork failed\n");
    3a73:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3a78:	c7 44 24 04 9e 5c 00 	movl   $0x5c9e,0x4(%esp)
    3a7f:	00 
    3a80:	89 04 24             	mov    %eax,(%esp)
    3a83:	e8 59 08 00 00       	call   42e1 <printf>
    exit(0);
    3a88:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a8f:	e8 bc 06 00 00       	call   4150 <exit>
  }
  wait(0);
    3a94:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3a9b:	e8 b8 06 00 00       	call   4158 <wait>
  fd = open("bigarg-ok", 0);
    3aa0:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3aa7:	00 
    3aa8:	c7 04 24 97 5b 00 00 	movl   $0x5b97,(%esp)
    3aaf:	e8 e4 06 00 00       	call   4198 <open>
    3ab4:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0){
    3ab7:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3abb:	79 21                	jns    3ade <bigargtest+0x12c>
    printf(stdout, "bigarg test failed!\n");
    3abd:	a1 88 5d 00 00       	mov    0x5d88,%eax
    3ac2:	c7 44 24 04 b7 5c 00 	movl   $0x5cb7,0x4(%esp)
    3ac9:	00 
    3aca:	89 04 24             	mov    %eax,(%esp)
    3acd:	e8 0f 08 00 00       	call   42e1 <printf>
    exit(0);
    3ad2:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ad9:	e8 72 06 00 00       	call   4150 <exit>
  }
  close(fd);
    3ade:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3ae1:	89 04 24             	mov    %eax,(%esp)
    3ae4:	e8 97 06 00 00       	call   4180 <close>
  unlink("bigarg-ok");
    3ae9:	c7 04 24 97 5b 00 00 	movl   $0x5b97,(%esp)
    3af0:	e8 b3 06 00 00       	call   41a8 <unlink>
}
    3af5:	c9                   	leave  
    3af6:	c3                   	ret    

00003af7 <fsfull>:

// what happens when the file system runs out of blocks?
// answer: balloc panics, so this test is not useful.
void
fsfull()
{
    3af7:	55                   	push   %ebp
    3af8:	89 e5                	mov    %esp,%ebp
    3afa:	53                   	push   %ebx
    3afb:	83 ec 74             	sub    $0x74,%esp
  int nfiles;
  int fsblocks = 0;
    3afe:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)

  printf(1, "fsfull test\n");
    3b05:	c7 44 24 04 cc 5c 00 	movl   $0x5ccc,0x4(%esp)
    3b0c:	00 
    3b0d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3b14:	e8 c8 07 00 00       	call   42e1 <printf>

  for(nfiles = 0; ; nfiles++){
    3b19:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
    char name[64];
    name[0] = 'f';
    3b20:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3b24:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3b27:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3b2c:	89 c8                	mov    %ecx,%eax
    3b2e:	f7 ea                	imul   %edx
    3b30:	c1 fa 06             	sar    $0x6,%edx
    3b33:	89 c8                	mov    %ecx,%eax
    3b35:	c1 f8 1f             	sar    $0x1f,%eax
    3b38:	89 d1                	mov    %edx,%ecx
    3b3a:	29 c1                	sub    %eax,%ecx
    3b3c:	89 c8                	mov    %ecx,%eax
    3b3e:	83 c0 30             	add    $0x30,%eax
    3b41:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3b44:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    3b47:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3b4c:	89 d8                	mov    %ebx,%eax
    3b4e:	f7 ea                	imul   %edx
    3b50:	c1 fa 06             	sar    $0x6,%edx
    3b53:	89 d8                	mov    %ebx,%eax
    3b55:	c1 f8 1f             	sar    $0x1f,%eax
    3b58:	89 d1                	mov    %edx,%ecx
    3b5a:	29 c1                	sub    %eax,%ecx
    3b5c:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    3b62:	89 d9                	mov    %ebx,%ecx
    3b64:	29 c1                	sub    %eax,%ecx
    3b66:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3b6b:	89 c8                	mov    %ecx,%eax
    3b6d:	f7 ea                	imul   %edx
    3b6f:	c1 fa 05             	sar    $0x5,%edx
    3b72:	89 c8                	mov    %ecx,%eax
    3b74:	c1 f8 1f             	sar    $0x1f,%eax
    3b77:	89 d1                	mov    %edx,%ecx
    3b79:	29 c1                	sub    %eax,%ecx
    3b7b:	89 c8                	mov    %ecx,%eax
    3b7d:	83 c0 30             	add    $0x30,%eax
    3b80:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3b83:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    3b86:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3b8b:	89 d8                	mov    %ebx,%eax
    3b8d:	f7 ea                	imul   %edx
    3b8f:	c1 fa 05             	sar    $0x5,%edx
    3b92:	89 d8                	mov    %ebx,%eax
    3b94:	c1 f8 1f             	sar    $0x1f,%eax
    3b97:	89 d1                	mov    %edx,%ecx
    3b99:	29 c1                	sub    %eax,%ecx
    3b9b:	6b c1 64             	imul   $0x64,%ecx,%eax
    3b9e:	89 d9                	mov    %ebx,%ecx
    3ba0:	29 c1                	sub    %eax,%ecx
    3ba2:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3ba7:	89 c8                	mov    %ecx,%eax
    3ba9:	f7 ea                	imul   %edx
    3bab:	c1 fa 02             	sar    $0x2,%edx
    3bae:	89 c8                	mov    %ecx,%eax
    3bb0:	c1 f8 1f             	sar    $0x1f,%eax
    3bb3:	89 d1                	mov    %edx,%ecx
    3bb5:	29 c1                	sub    %eax,%ecx
    3bb7:	89 c8                	mov    %ecx,%eax
    3bb9:	83 c0 30             	add    $0x30,%eax
    3bbc:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3bbf:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3bc2:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3bc7:	89 c8                	mov    %ecx,%eax
    3bc9:	f7 ea                	imul   %edx
    3bcb:	c1 fa 02             	sar    $0x2,%edx
    3bce:	89 c8                	mov    %ecx,%eax
    3bd0:	c1 f8 1f             	sar    $0x1f,%eax
    3bd3:	29 c2                	sub    %eax,%edx
    3bd5:	89 d0                	mov    %edx,%eax
    3bd7:	c1 e0 02             	shl    $0x2,%eax
    3bda:	01 d0                	add    %edx,%eax
    3bdc:	01 c0                	add    %eax,%eax
    3bde:	89 ca                	mov    %ecx,%edx
    3be0:	29 c2                	sub    %eax,%edx
    3be2:	89 d0                	mov    %edx,%eax
    3be4:	83 c0 30             	add    $0x30,%eax
    3be7:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3bea:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    printf(1, "writing %s\n", name);
    3bee:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3bf1:	89 44 24 08          	mov    %eax,0x8(%esp)
    3bf5:	c7 44 24 04 d9 5c 00 	movl   $0x5cd9,0x4(%esp)
    3bfc:	00 
    3bfd:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c04:	e8 d8 06 00 00       	call   42e1 <printf>
    int fd = open(name, O_CREATE|O_RDWR);
    3c09:	c7 44 24 04 02 02 00 	movl   $0x202,0x4(%esp)
    3c10:	00 
    3c11:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3c14:	89 04 24             	mov    %eax,(%esp)
    3c17:	e8 7c 05 00 00       	call   4198 <open>
    3c1c:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(fd < 0){
    3c1f:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    3c23:	79 1d                	jns    3c42 <fsfull+0x14b>
      printf(1, "open %s failed\n", name);
    3c25:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3c28:	89 44 24 08          	mov    %eax,0x8(%esp)
    3c2c:	c7 44 24 04 e5 5c 00 	movl   $0x5ce5,0x4(%esp)
    3c33:	00 
    3c34:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c3b:	e8 a1 06 00 00       	call   42e1 <printf>
      break;
    3c40:	eb 72                	jmp    3cb4 <fsfull+0x1bd>
    }
    int total = 0;
    3c42:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    while(1){
      int cc = write(fd, buf, 512);
    3c49:	c7 44 24 08 00 02 00 	movl   $0x200,0x8(%esp)
    3c50:	00 
    3c51:	c7 44 24 04 80 85 00 	movl   $0x8580,0x4(%esp)
    3c58:	00 
    3c59:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c5c:	89 04 24             	mov    %eax,(%esp)
    3c5f:	e8 14 05 00 00       	call   4178 <write>
    3c64:	89 45 f4             	mov    %eax,-0xc(%ebp)
      if(cc < 512)
    3c67:	81 7d f4 ff 01 00 00 	cmpl   $0x1ff,-0xc(%ebp)
    3c6e:	7e 0c                	jle    3c7c <fsfull+0x185>
        break;
      total += cc;
    3c70:	8b 45 f4             	mov    -0xc(%ebp),%eax
    3c73:	01 45 f0             	add    %eax,-0x10(%ebp)
      fsblocks++;
    3c76:	83 45 e8 01          	addl   $0x1,-0x18(%ebp)
    }
    3c7a:	eb cd                	jmp    3c49 <fsfull+0x152>
    }
    int total = 0;
    while(1){
      int cc = write(fd, buf, 512);
      if(cc < 512)
        break;
    3c7c:	90                   	nop
      total += cc;
      fsblocks++;
    }
    printf(1, "wrote %d bytes\n", total);
    3c7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    3c80:	89 44 24 08          	mov    %eax,0x8(%esp)
    3c84:	c7 44 24 04 f5 5c 00 	movl   $0x5cf5,0x4(%esp)
    3c8b:	00 
    3c8c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3c93:	e8 49 06 00 00       	call   42e1 <printf>
    close(fd);
    3c98:	8b 45 ec             	mov    -0x14(%ebp),%eax
    3c9b:	89 04 24             	mov    %eax,(%esp)
    3c9e:	e8 dd 04 00 00       	call   4180 <close>
    if(total == 0)
    3ca3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    3ca7:	75 02                	jne    3cab <fsfull+0x1b4>
      break;
    3ca9:	eb 09                	jmp    3cb4 <fsfull+0x1bd>
  int nfiles;
  int fsblocks = 0;

  printf(1, "fsfull test\n");

  for(nfiles = 0; ; nfiles++){
    3cab:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    }
    printf(1, "wrote %d bytes\n", total);
    close(fd);
    if(total == 0)
      break;
  }
    3caf:	e9 6c fe ff ff       	jmp    3b20 <fsfull+0x29>

  while(nfiles >= 0){
    3cb4:	e9 dd 00 00 00       	jmp    3d96 <fsfull+0x29f>
    char name[64];
    name[0] = 'f';
    3cb9:	c6 45 a4 66          	movb   $0x66,-0x5c(%ebp)
    name[1] = '0' + nfiles / 1000;
    3cbd:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3cc0:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3cc5:	89 c8                	mov    %ecx,%eax
    3cc7:	f7 ea                	imul   %edx
    3cc9:	c1 fa 06             	sar    $0x6,%edx
    3ccc:	89 c8                	mov    %ecx,%eax
    3cce:	c1 f8 1f             	sar    $0x1f,%eax
    3cd1:	89 d1                	mov    %edx,%ecx
    3cd3:	29 c1                	sub    %eax,%ecx
    3cd5:	89 c8                	mov    %ecx,%eax
    3cd7:	83 c0 30             	add    $0x30,%eax
    3cda:	88 45 a5             	mov    %al,-0x5b(%ebp)
    name[2] = '0' + (nfiles % 1000) / 100;
    3cdd:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    3ce0:	ba d3 4d 62 10       	mov    $0x10624dd3,%edx
    3ce5:	89 d8                	mov    %ebx,%eax
    3ce7:	f7 ea                	imul   %edx
    3ce9:	c1 fa 06             	sar    $0x6,%edx
    3cec:	89 d8                	mov    %ebx,%eax
    3cee:	c1 f8 1f             	sar    $0x1f,%eax
    3cf1:	89 d1                	mov    %edx,%ecx
    3cf3:	29 c1                	sub    %eax,%ecx
    3cf5:	69 c1 e8 03 00 00    	imul   $0x3e8,%ecx,%eax
    3cfb:	89 d9                	mov    %ebx,%ecx
    3cfd:	29 c1                	sub    %eax,%ecx
    3cff:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3d04:	89 c8                	mov    %ecx,%eax
    3d06:	f7 ea                	imul   %edx
    3d08:	c1 fa 05             	sar    $0x5,%edx
    3d0b:	89 c8                	mov    %ecx,%eax
    3d0d:	c1 f8 1f             	sar    $0x1f,%eax
    3d10:	89 d1                	mov    %edx,%ecx
    3d12:	29 c1                	sub    %eax,%ecx
    3d14:	89 c8                	mov    %ecx,%eax
    3d16:	83 c0 30             	add    $0x30,%eax
    3d19:	88 45 a6             	mov    %al,-0x5a(%ebp)
    name[3] = '0' + (nfiles % 100) / 10;
    3d1c:	8b 5d e4             	mov    -0x1c(%ebp),%ebx
    3d1f:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
    3d24:	89 d8                	mov    %ebx,%eax
    3d26:	f7 ea                	imul   %edx
    3d28:	c1 fa 05             	sar    $0x5,%edx
    3d2b:	89 d8                	mov    %ebx,%eax
    3d2d:	c1 f8 1f             	sar    $0x1f,%eax
    3d30:	89 d1                	mov    %edx,%ecx
    3d32:	29 c1                	sub    %eax,%ecx
    3d34:	6b c1 64             	imul   $0x64,%ecx,%eax
    3d37:	89 d9                	mov    %ebx,%ecx
    3d39:	29 c1                	sub    %eax,%ecx
    3d3b:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3d40:	89 c8                	mov    %ecx,%eax
    3d42:	f7 ea                	imul   %edx
    3d44:	c1 fa 02             	sar    $0x2,%edx
    3d47:	89 c8                	mov    %ecx,%eax
    3d49:	c1 f8 1f             	sar    $0x1f,%eax
    3d4c:	89 d1                	mov    %edx,%ecx
    3d4e:	29 c1                	sub    %eax,%ecx
    3d50:	89 c8                	mov    %ecx,%eax
    3d52:	83 c0 30             	add    $0x30,%eax
    3d55:	88 45 a7             	mov    %al,-0x59(%ebp)
    name[4] = '0' + (nfiles % 10);
    3d58:	8b 4d e4             	mov    -0x1c(%ebp),%ecx
    3d5b:	ba 67 66 66 66       	mov    $0x66666667,%edx
    3d60:	89 c8                	mov    %ecx,%eax
    3d62:	f7 ea                	imul   %edx
    3d64:	c1 fa 02             	sar    $0x2,%edx
    3d67:	89 c8                	mov    %ecx,%eax
    3d69:	c1 f8 1f             	sar    $0x1f,%eax
    3d6c:	29 c2                	sub    %eax,%edx
    3d6e:	89 d0                	mov    %edx,%eax
    3d70:	c1 e0 02             	shl    $0x2,%eax
    3d73:	01 d0                	add    %edx,%eax
    3d75:	01 c0                	add    %eax,%eax
    3d77:	89 ca                	mov    %ecx,%edx
    3d79:	29 c2                	sub    %eax,%edx
    3d7b:	89 d0                	mov    %edx,%eax
    3d7d:	83 c0 30             	add    $0x30,%eax
    3d80:	88 45 a8             	mov    %al,-0x58(%ebp)
    name[5] = '\0';
    3d83:	c6 45 a9 00          	movb   $0x0,-0x57(%ebp)
    unlink(name);
    3d87:	8d 45 a4             	lea    -0x5c(%ebp),%eax
    3d8a:	89 04 24             	mov    %eax,(%esp)
    3d8d:	e8 16 04 00 00       	call   41a8 <unlink>
    nfiles--;
    3d92:	83 6d e4 01          	subl   $0x1,-0x1c(%ebp)
    close(fd);
    if(total == 0)
      break;
  }

  while(nfiles >= 0){
    3d96:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    3d9a:	0f 89 19 ff ff ff    	jns    3cb9 <fsfull+0x1c2>
    name[5] = '\0';
    unlink(name);
    nfiles--;
  }

  printf(1, "fsfull test finished\n");
    3da0:	c7 44 24 04 05 5d 00 	movl   $0x5d05,0x4(%esp)
    3da7:	00 
    3da8:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3daf:	e8 2d 05 00 00       	call   42e1 <printf>
}
    3db4:	83 c4 74             	add    $0x74,%esp
    3db7:	5b                   	pop    %ebx
    3db8:	5d                   	pop    %ebp
    3db9:	c3                   	ret    

00003dba <rand>:

unsigned long randstate = 1;
unsigned int
rand()
{
    3dba:	55                   	push   %ebp
    3dbb:	89 e5                	mov    %esp,%ebp
  randstate = randstate * 1664525 + 1013904223;
    3dbd:	a1 8c 5d 00 00       	mov    0x5d8c,%eax
    3dc2:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
    3dc8:	05 5f f3 6e 3c       	add    $0x3c6ef35f,%eax
    3dcd:	a3 8c 5d 00 00       	mov    %eax,0x5d8c
  return randstate;
    3dd2:	a1 8c 5d 00 00       	mov    0x5d8c,%eax
}
    3dd7:	5d                   	pop    %ebp
    3dd8:	c3                   	ret    

00003dd9 <main>:

int
main(int argc, char *argv[])
{
    3dd9:	55                   	push   %ebp
    3dda:	89 e5                	mov    %esp,%ebp
    3ddc:	83 e4 f0             	and    $0xfffffff0,%esp
    3ddf:	83 ec 10             	sub    $0x10,%esp
  printf(1, "usertests starting\n");
    3de2:	c7 44 24 04 1b 5d 00 	movl   $0x5d1b,0x4(%esp)
    3de9:	00 
    3dea:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3df1:	e8 eb 04 00 00       	call   42e1 <printf>

  if(open("usertests.ran", 0) >= 0){
    3df6:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    3dfd:	00 
    3dfe:	c7 04 24 2f 5d 00 00 	movl   $0x5d2f,(%esp)
    3e05:	e8 8e 03 00 00       	call   4198 <open>
    3e0a:	85 c0                	test   %eax,%eax
    3e0c:	78 20                	js     3e2e <main+0x55>
    printf(1, "already ran user tests -- rebuild fs.img\n");
    3e0e:	c7 44 24 04 40 5d 00 	movl   $0x5d40,0x4(%esp)
    3e15:	00 
    3e16:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
    3e1d:	e8 bf 04 00 00       	call   42e1 <printf>
    exit(0);
    3e22:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3e29:	e8 22 03 00 00       	call   4150 <exit>
  }
  close(open("usertests.ran", O_CREATE));
    3e2e:	c7 44 24 04 00 02 00 	movl   $0x200,0x4(%esp)
    3e35:	00 
    3e36:	c7 04 24 2f 5d 00 00 	movl   $0x5d2f,(%esp)
    3e3d:	e8 56 03 00 00       	call   4198 <open>
    3e42:	89 04 24             	mov    %eax,(%esp)
    3e45:	e8 36 03 00 00       	call   4180 <close>

  bigargtest();
    3e4a:	e8 63 fb ff ff       	call   39b2 <bigargtest>
  bigwrite();
    3e4f:	e8 16 e9 ff ff       	call   276a <bigwrite>
  bigargtest();
    3e54:	e8 59 fb ff ff       	call   39b2 <bigargtest>
  bsstest();
    3e59:	e8 dc fa ff ff       	call   393a <bsstest>
  sbrktest();
    3e5e:	e8 60 f4 ff ff       	call   32c3 <sbrktest>
  validatetest();
    3e63:	e8 ed f9 ff ff       	call   3855 <validatetest>

  opentest();
    3e68:	e8 93 c1 ff ff       	call   0 <opentest>
  writetest();
    3e6d:	e8 47 c2 ff ff       	call   b9 <writetest>
  writetest1();
    3e72:	e8 81 c4 ff ff       	call   2f8 <writetest1>
  createtest();
    3e77:	e8 b6 c6 ff ff       	call   532 <createtest>

  mem();
    3e7c:	e8 c7 cc ff ff       	call   b48 <mem>
  pipe1();
    3e81:	e8 b0 c8 ff ff       	call   736 <pipe1>
  preempt();
    3e86:	e8 c0 ca ff ff       	call   94b <preempt>
  exitwait();
    3e8b:	e8 2c cc ff ff       	call   abc <exitwait>

  rmdot();
    3e90:	e8 c7 ed ff ff       	call   2c5c <rmdot>
  fourteen();
    3e95:	e8 42 ec ff ff       	call   2adc <fourteen>
  bigfile();
    3e9a:	e8 e1 e9 ff ff       	call   2880 <bigfile>
  subdir();
    3e9f:	e8 7d e0 ff ff       	call   1f21 <subdir>
  concreate();
    3ea4:	e8 bb d9 ff ff       	call   1864 <concreate>
  linkunlink();
    3ea9:	e8 a8 dd ff ff       	call   1c56 <linkunlink>
  linktest();
    3eae:	e8 29 d7 ff ff       	call   15dc <linktest>
  unlinkread();
    3eb3:	e8 25 d5 ff ff       	call   13dd <unlinkread>
  createdelete();
    3eb8:	e8 2f d2 ff ff       	call   10ec <createdelete>
  twofiles();
    3ebd:	e8 8e cf ff ff       	call   e50 <twofiles>
  sharedfd();
    3ec2:	e8 7b cd ff ff       	call   c42 <sharedfd>
  dirfile();
    3ec7:	e8 40 ef ff ff       	call   2e0c <dirfile>
  iref();
    3ecc:	e8 c3 f1 ff ff       	call   3094 <iref>
  forktest();
    3ed1:	e8 f0 f2 ff ff       	call   31c6 <forktest>
  bigdir(); // slow
    3ed6:	e8 bc de ff ff       	call   1d97 <bigdir>

  exectest();
    3edb:	e8 00 c8 ff ff       	call   6e0 <exectest>

  exit(0);
    3ee0:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    3ee7:	e8 64 02 00 00       	call   4150 <exit>

00003eec <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
    3eec:	55                   	push   %ebp
    3eed:	89 e5                	mov    %esp,%ebp
    3eef:	57                   	push   %edi
    3ef0:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
    3ef1:	8b 4d 08             	mov    0x8(%ebp),%ecx
    3ef4:	8b 55 10             	mov    0x10(%ebp),%edx
    3ef7:	8b 45 0c             	mov    0xc(%ebp),%eax
    3efa:	89 cb                	mov    %ecx,%ebx
    3efc:	89 df                	mov    %ebx,%edi
    3efe:	89 d1                	mov    %edx,%ecx
    3f00:	fc                   	cld    
    3f01:	f3 aa                	rep stos %al,%es:(%edi)
    3f03:	89 ca                	mov    %ecx,%edx
    3f05:	89 fb                	mov    %edi,%ebx
    3f07:	89 5d 08             	mov    %ebx,0x8(%ebp)
    3f0a:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
    3f0d:	5b                   	pop    %ebx
    3f0e:	5f                   	pop    %edi
    3f0f:	5d                   	pop    %ebp
    3f10:	c3                   	ret    

00003f11 <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
    3f11:	55                   	push   %ebp
    3f12:	89 e5                	mov    %esp,%ebp
    3f14:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
    3f17:	8b 45 08             	mov    0x8(%ebp),%eax
    3f1a:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
    3f1d:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f20:	0f b6 10             	movzbl (%eax),%edx
    3f23:	8b 45 08             	mov    0x8(%ebp),%eax
    3f26:	88 10                	mov    %dl,(%eax)
    3f28:	8b 45 08             	mov    0x8(%ebp),%eax
    3f2b:	0f b6 00             	movzbl (%eax),%eax
    3f2e:	84 c0                	test   %al,%al
    3f30:	0f 95 c0             	setne  %al
    3f33:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3f37:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
    3f3b:	84 c0                	test   %al,%al
    3f3d:	75 de                	jne    3f1d <strcpy+0xc>
    ;
  return os;
    3f3f:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3f42:	c9                   	leave  
    3f43:	c3                   	ret    

00003f44 <strcmp>:

int
strcmp(const char *p, const char *q)
{
    3f44:	55                   	push   %ebp
    3f45:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
    3f47:	eb 08                	jmp    3f51 <strcmp+0xd>
    p++, q++;
    3f49:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3f4d:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
    3f51:	8b 45 08             	mov    0x8(%ebp),%eax
    3f54:	0f b6 00             	movzbl (%eax),%eax
    3f57:	84 c0                	test   %al,%al
    3f59:	74 10                	je     3f6b <strcmp+0x27>
    3f5b:	8b 45 08             	mov    0x8(%ebp),%eax
    3f5e:	0f b6 10             	movzbl (%eax),%edx
    3f61:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f64:	0f b6 00             	movzbl (%eax),%eax
    3f67:	38 c2                	cmp    %al,%dl
    3f69:	74 de                	je     3f49 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
    3f6b:	8b 45 08             	mov    0x8(%ebp),%eax
    3f6e:	0f b6 00             	movzbl (%eax),%eax
    3f71:	0f b6 d0             	movzbl %al,%edx
    3f74:	8b 45 0c             	mov    0xc(%ebp),%eax
    3f77:	0f b6 00             	movzbl (%eax),%eax
    3f7a:	0f b6 c0             	movzbl %al,%eax
    3f7d:	89 d1                	mov    %edx,%ecx
    3f7f:	29 c1                	sub    %eax,%ecx
    3f81:	89 c8                	mov    %ecx,%eax
}
    3f83:	5d                   	pop    %ebp
    3f84:	c3                   	ret    

00003f85 <strlen>:

uint
strlen(char *s)
{
    3f85:	55                   	push   %ebp
    3f86:	89 e5                	mov    %esp,%ebp
    3f88:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
    3f8b:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    3f92:	eb 04                	jmp    3f98 <strlen+0x13>
    3f94:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
    3f98:	8b 45 fc             	mov    -0x4(%ebp),%eax
    3f9b:	03 45 08             	add    0x8(%ebp),%eax
    3f9e:	0f b6 00             	movzbl (%eax),%eax
    3fa1:	84 c0                	test   %al,%al
    3fa3:	75 ef                	jne    3f94 <strlen+0xf>
    ;
  return n;
    3fa5:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    3fa8:	c9                   	leave  
    3fa9:	c3                   	ret    

00003faa <memset>:

void*
memset(void *dst, int c, uint n)
{
    3faa:	55                   	push   %ebp
    3fab:	89 e5                	mov    %esp,%ebp
    3fad:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
    3fb0:	8b 45 10             	mov    0x10(%ebp),%eax
    3fb3:	89 44 24 08          	mov    %eax,0x8(%esp)
    3fb7:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fba:	89 44 24 04          	mov    %eax,0x4(%esp)
    3fbe:	8b 45 08             	mov    0x8(%ebp),%eax
    3fc1:	89 04 24             	mov    %eax,(%esp)
    3fc4:	e8 23 ff ff ff       	call   3eec <stosb>
  return dst;
    3fc9:	8b 45 08             	mov    0x8(%ebp),%eax
}
    3fcc:	c9                   	leave  
    3fcd:	c3                   	ret    

00003fce <strchr>:

char*
strchr(const char *s, char c)
{
    3fce:	55                   	push   %ebp
    3fcf:	89 e5                	mov    %esp,%ebp
    3fd1:	83 ec 04             	sub    $0x4,%esp
    3fd4:	8b 45 0c             	mov    0xc(%ebp),%eax
    3fd7:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
    3fda:	eb 14                	jmp    3ff0 <strchr+0x22>
    if(*s == c)
    3fdc:	8b 45 08             	mov    0x8(%ebp),%eax
    3fdf:	0f b6 00             	movzbl (%eax),%eax
    3fe2:	3a 45 fc             	cmp    -0x4(%ebp),%al
    3fe5:	75 05                	jne    3fec <strchr+0x1e>
      return (char*)s;
    3fe7:	8b 45 08             	mov    0x8(%ebp),%eax
    3fea:	eb 13                	jmp    3fff <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
    3fec:	83 45 08 01          	addl   $0x1,0x8(%ebp)
    3ff0:	8b 45 08             	mov    0x8(%ebp),%eax
    3ff3:	0f b6 00             	movzbl (%eax),%eax
    3ff6:	84 c0                	test   %al,%al
    3ff8:	75 e2                	jne    3fdc <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
    3ffa:	b8 00 00 00 00       	mov    $0x0,%eax
}
    3fff:	c9                   	leave  
    4000:	c3                   	ret    

00004001 <gets>:

char*
gets(char *buf, int max)
{
    4001:	55                   	push   %ebp
    4002:	89 e5                	mov    %esp,%ebp
    4004:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4007:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    400e:	eb 44                	jmp    4054 <gets+0x53>
    cc = read(0, &c, 1);
    4010:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    4017:	00 
    4018:	8d 45 ef             	lea    -0x11(%ebp),%eax
    401b:	89 44 24 04          	mov    %eax,0x4(%esp)
    401f:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
    4026:	e8 45 01 00 00       	call   4170 <read>
    402b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(cc < 1)
    402e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    4032:	7e 2d                	jle    4061 <gets+0x60>
      break;
    buf[i++] = c;
    4034:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4037:	03 45 08             	add    0x8(%ebp),%eax
    403a:	0f b6 55 ef          	movzbl -0x11(%ebp),%edx
    403e:	88 10                	mov    %dl,(%eax)
    4040:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
    if(c == '\n' || c == '\r')
    4044:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4048:	3c 0a                	cmp    $0xa,%al
    404a:	74 16                	je     4062 <gets+0x61>
    404c:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
    4050:	3c 0d                	cmp    $0xd,%al
    4052:	74 0e                	je     4062 <gets+0x61>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
    4054:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4057:	83 c0 01             	add    $0x1,%eax
    405a:	3b 45 0c             	cmp    0xc(%ebp),%eax
    405d:	7c b1                	jl     4010 <gets+0xf>
    405f:	eb 01                	jmp    4062 <gets+0x61>
    cc = read(0, &c, 1);
    if(cc < 1)
      break;
    4061:	90                   	nop
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
    4062:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4065:	03 45 08             	add    0x8(%ebp),%eax
    4068:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
    406b:	8b 45 08             	mov    0x8(%ebp),%eax
}
    406e:	c9                   	leave  
    406f:	c3                   	ret    

00004070 <stat>:

int
stat(char *n, struct stat *st)
{
    4070:	55                   	push   %ebp
    4071:	89 e5                	mov    %esp,%ebp
    4073:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
    4076:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
    407d:	00 
    407e:	8b 45 08             	mov    0x8(%ebp),%eax
    4081:	89 04 24             	mov    %eax,(%esp)
    4084:	e8 0f 01 00 00       	call   4198 <open>
    4089:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(fd < 0)
    408c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    4090:	79 07                	jns    4099 <stat+0x29>
    return -1;
    4092:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
    4097:	eb 23                	jmp    40bc <stat+0x4c>
  r = fstat(fd, st);
    4099:	8b 45 0c             	mov    0xc(%ebp),%eax
    409c:	89 44 24 04          	mov    %eax,0x4(%esp)
    40a0:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40a3:	89 04 24             	mov    %eax,(%esp)
    40a6:	e8 05 01 00 00       	call   41b0 <fstat>
    40ab:	89 45 f4             	mov    %eax,-0xc(%ebp)
  close(fd);
    40ae:	8b 45 f0             	mov    -0x10(%ebp),%eax
    40b1:	89 04 24             	mov    %eax,(%esp)
    40b4:	e8 c7 00 00 00       	call   4180 <close>
  return r;
    40b9:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
    40bc:	c9                   	leave  
    40bd:	c3                   	ret    

000040be <atoi>:

int
atoi(const char *s)
{
    40be:	55                   	push   %ebp
    40bf:	89 e5                	mov    %esp,%ebp
    40c1:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
    40c4:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
    40cb:	eb 24                	jmp    40f1 <atoi+0x33>
    n = n*10 + *s++ - '0';
    40cd:	8b 55 fc             	mov    -0x4(%ebp),%edx
    40d0:	89 d0                	mov    %edx,%eax
    40d2:	c1 e0 02             	shl    $0x2,%eax
    40d5:	01 d0                	add    %edx,%eax
    40d7:	01 c0                	add    %eax,%eax
    40d9:	89 c2                	mov    %eax,%edx
    40db:	8b 45 08             	mov    0x8(%ebp),%eax
    40de:	0f b6 00             	movzbl (%eax),%eax
    40e1:	0f be c0             	movsbl %al,%eax
    40e4:	8d 04 02             	lea    (%edx,%eax,1),%eax
    40e7:	83 e8 30             	sub    $0x30,%eax
    40ea:	89 45 fc             	mov    %eax,-0x4(%ebp)
    40ed:	83 45 08 01          	addl   $0x1,0x8(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
    40f1:	8b 45 08             	mov    0x8(%ebp),%eax
    40f4:	0f b6 00             	movzbl (%eax),%eax
    40f7:	3c 2f                	cmp    $0x2f,%al
    40f9:	7e 0a                	jle    4105 <atoi+0x47>
    40fb:	8b 45 08             	mov    0x8(%ebp),%eax
    40fe:	0f b6 00             	movzbl (%eax),%eax
    4101:	3c 39                	cmp    $0x39,%al
    4103:	7e c8                	jle    40cd <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
    4105:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
    4108:	c9                   	leave  
    4109:	c3                   	ret    

0000410a <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
    410a:	55                   	push   %ebp
    410b:	89 e5                	mov    %esp,%ebp
    410d:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
    4110:	8b 45 08             	mov    0x8(%ebp),%eax
    4113:	89 45 f8             	mov    %eax,-0x8(%ebp)
  src = vsrc;
    4116:	8b 45 0c             	mov    0xc(%ebp),%eax
    4119:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while(n-- > 0)
    411c:	eb 13                	jmp    4131 <memmove+0x27>
    *dst++ = *src++;
    411e:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4121:	0f b6 10             	movzbl (%eax),%edx
    4124:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4127:	88 10                	mov    %dl,(%eax)
    4129:	83 45 f8 01          	addl   $0x1,-0x8(%ebp)
    412d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
    4131:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
    4135:	0f 9f c0             	setg   %al
    4138:	83 6d 10 01          	subl   $0x1,0x10(%ebp)
    413c:	84 c0                	test   %al,%al
    413e:	75 de                	jne    411e <memmove+0x14>
    *dst++ = *src++;
  return vdst;
    4140:	8b 45 08             	mov    0x8(%ebp),%eax
}
    4143:	c9                   	leave  
    4144:	c3                   	ret    
    4145:	90                   	nop
    4146:	90                   	nop
    4147:	90                   	nop

00004148 <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
    4148:	b8 01 00 00 00       	mov    $0x1,%eax
    414d:	cd 40                	int    $0x40
    414f:	c3                   	ret    

00004150 <exit>:
SYSCALL(exit)
    4150:	b8 02 00 00 00       	mov    $0x2,%eax
    4155:	cd 40                	int    $0x40
    4157:	c3                   	ret    

00004158 <wait>:
SYSCALL(wait)
    4158:	b8 03 00 00 00       	mov    $0x3,%eax
    415d:	cd 40                	int    $0x40
    415f:	c3                   	ret    

00004160 <waitpid>:
SYSCALL(waitpid)
    4160:	b8 17 00 00 00       	mov    $0x17,%eax
    4165:	cd 40                	int    $0x40
    4167:	c3                   	ret    

00004168 <pipe>:
SYSCALL(pipe)
    4168:	b8 04 00 00 00       	mov    $0x4,%eax
    416d:	cd 40                	int    $0x40
    416f:	c3                   	ret    

00004170 <read>:
SYSCALL(read)
    4170:	b8 05 00 00 00       	mov    $0x5,%eax
    4175:	cd 40                	int    $0x40
    4177:	c3                   	ret    

00004178 <write>:
SYSCALL(write)
    4178:	b8 10 00 00 00       	mov    $0x10,%eax
    417d:	cd 40                	int    $0x40
    417f:	c3                   	ret    

00004180 <close>:
SYSCALL(close)
    4180:	b8 15 00 00 00       	mov    $0x15,%eax
    4185:	cd 40                	int    $0x40
    4187:	c3                   	ret    

00004188 <kill>:
SYSCALL(kill)
    4188:	b8 06 00 00 00       	mov    $0x6,%eax
    418d:	cd 40                	int    $0x40
    418f:	c3                   	ret    

00004190 <exec>:
SYSCALL(exec)
    4190:	b8 07 00 00 00       	mov    $0x7,%eax
    4195:	cd 40                	int    $0x40
    4197:	c3                   	ret    

00004198 <open>:
SYSCALL(open)
    4198:	b8 0f 00 00 00       	mov    $0xf,%eax
    419d:	cd 40                	int    $0x40
    419f:	c3                   	ret    

000041a0 <mknod>:
SYSCALL(mknod)
    41a0:	b8 11 00 00 00       	mov    $0x11,%eax
    41a5:	cd 40                	int    $0x40
    41a7:	c3                   	ret    

000041a8 <unlink>:
SYSCALL(unlink)
    41a8:	b8 12 00 00 00       	mov    $0x12,%eax
    41ad:	cd 40                	int    $0x40
    41af:	c3                   	ret    

000041b0 <fstat>:
SYSCALL(fstat)
    41b0:	b8 08 00 00 00       	mov    $0x8,%eax
    41b5:	cd 40                	int    $0x40
    41b7:	c3                   	ret    

000041b8 <link>:
SYSCALL(link)
    41b8:	b8 13 00 00 00       	mov    $0x13,%eax
    41bd:	cd 40                	int    $0x40
    41bf:	c3                   	ret    

000041c0 <mkdir>:
SYSCALL(mkdir)
    41c0:	b8 14 00 00 00       	mov    $0x14,%eax
    41c5:	cd 40                	int    $0x40
    41c7:	c3                   	ret    

000041c8 <chdir>:
SYSCALL(chdir)
    41c8:	b8 09 00 00 00       	mov    $0x9,%eax
    41cd:	cd 40                	int    $0x40
    41cf:	c3                   	ret    

000041d0 <dup>:
SYSCALL(dup)
    41d0:	b8 0a 00 00 00       	mov    $0xa,%eax
    41d5:	cd 40                	int    $0x40
    41d7:	c3                   	ret    

000041d8 <getpid>:
SYSCALL(getpid)
    41d8:	b8 0b 00 00 00       	mov    $0xb,%eax
    41dd:	cd 40                	int    $0x40
    41df:	c3                   	ret    

000041e0 <sbrk>:
SYSCALL(sbrk)
    41e0:	b8 0c 00 00 00       	mov    $0xc,%eax
    41e5:	cd 40                	int    $0x40
    41e7:	c3                   	ret    

000041e8 <sleep>:
SYSCALL(sleep)
    41e8:	b8 0d 00 00 00       	mov    $0xd,%eax
    41ed:	cd 40                	int    $0x40
    41ef:	c3                   	ret    

000041f0 <uptime>:
SYSCALL(uptime)
    41f0:	b8 0e 00 00 00       	mov    $0xe,%eax
    41f5:	cd 40                	int    $0x40
    41f7:	c3                   	ret    

000041f8 <count>:
SYSCALL(count)
    41f8:	b8 16 00 00 00       	mov    $0x16,%eax
    41fd:	cd 40                	int    $0x40
    41ff:	c3                   	ret    

00004200 <change_priority>:
SYSCALL(change_priority)
    4200:	b8 18 00 00 00       	mov    $0x18,%eax
    4205:	cd 40                	int    $0x40
    4207:	c3                   	ret    

00004208 <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
    4208:	55                   	push   %ebp
    4209:	89 e5                	mov    %esp,%ebp
    420b:	83 ec 28             	sub    $0x28,%esp
    420e:	8b 45 0c             	mov    0xc(%ebp),%eax
    4211:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
    4214:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
    421b:	00 
    421c:	8d 45 f4             	lea    -0xc(%ebp),%eax
    421f:	89 44 24 04          	mov    %eax,0x4(%esp)
    4223:	8b 45 08             	mov    0x8(%ebp),%eax
    4226:	89 04 24             	mov    %eax,(%esp)
    4229:	e8 4a ff ff ff       	call   4178 <write>
}
    422e:	c9                   	leave  
    422f:	c3                   	ret    

00004230 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
    4230:	55                   	push   %ebp
    4231:	89 e5                	mov    %esp,%ebp
    4233:	53                   	push   %ebx
    4234:	83 ec 44             	sub    $0x44,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
    4237:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
    423e:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
    4242:	74 17                	je     425b <printint+0x2b>
    4244:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
    4248:	79 11                	jns    425b <printint+0x2b>
    neg = 1;
    424a:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
    4251:	8b 45 0c             	mov    0xc(%ebp),%eax
    4254:	f7 d8                	neg    %eax
    4256:	89 45 f4             	mov    %eax,-0xc(%ebp)
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
  if(sgn && xx < 0){
    4259:	eb 06                	jmp    4261 <printint+0x31>
    neg = 1;
    x = -xx;
  } else {
    x = xx;
    425b:	8b 45 0c             	mov    0xc(%ebp),%eax
    425e:	89 45 f4             	mov    %eax,-0xc(%ebp)
  }

  i = 0;
    4261:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  do{
    buf[i++] = digits[x % base];
    4268:	8b 4d ec             	mov    -0x14(%ebp),%ecx
    426b:	8b 5d 10             	mov    0x10(%ebp),%ebx
    426e:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4271:	ba 00 00 00 00       	mov    $0x0,%edx
    4276:	f7 f3                	div    %ebx
    4278:	89 d0                	mov    %edx,%eax
    427a:	0f b6 80 90 5d 00 00 	movzbl 0x5d90(%eax),%eax
    4281:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
    4285:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
  }while((x /= base) != 0);
    4289:	8b 45 10             	mov    0x10(%ebp),%eax
    428c:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    428f:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4292:	ba 00 00 00 00       	mov    $0x0,%edx
    4297:	f7 75 d4             	divl   -0x2c(%ebp)
    429a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    429d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
    42a1:	75 c5                	jne    4268 <printint+0x38>
  if(neg)
    42a3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    42a7:	74 28                	je     42d1 <printint+0xa1>
    buf[i++] = '-';
    42a9:	8b 45 ec             	mov    -0x14(%ebp),%eax
    42ac:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)
    42b1:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)

  while(--i >= 0)
    42b5:	eb 1a                	jmp    42d1 <printint+0xa1>
    putc(fd, buf[i]);
    42b7:	8b 45 ec             	mov    -0x14(%ebp),%eax
    42ba:	0f b6 44 05 dc       	movzbl -0x24(%ebp,%eax,1),%eax
    42bf:	0f be c0             	movsbl %al,%eax
    42c2:	89 44 24 04          	mov    %eax,0x4(%esp)
    42c6:	8b 45 08             	mov    0x8(%ebp),%eax
    42c9:	89 04 24             	mov    %eax,(%esp)
    42cc:	e8 37 ff ff ff       	call   4208 <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
    42d1:	83 6d ec 01          	subl   $0x1,-0x14(%ebp)
    42d5:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    42d9:	79 dc                	jns    42b7 <printint+0x87>
    putc(fd, buf[i]);
}
    42db:	83 c4 44             	add    $0x44,%esp
    42de:	5b                   	pop    %ebx
    42df:	5d                   	pop    %ebp
    42e0:	c3                   	ret    

000042e1 <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
    42e1:	55                   	push   %ebp
    42e2:	89 e5                	mov    %esp,%ebp
    42e4:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
    42e7:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  ap = (uint*)(void*)&fmt + 1;
    42ee:	8d 45 0c             	lea    0xc(%ebp),%eax
    42f1:	83 c0 04             	add    $0x4,%eax
    42f4:	89 45 f4             	mov    %eax,-0xc(%ebp)
  for(i = 0; fmt[i]; i++){
    42f7:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
    42fe:	e9 7e 01 00 00       	jmp    4481 <printf+0x1a0>
    c = fmt[i] & 0xff;
    4303:	8b 55 0c             	mov    0xc(%ebp),%edx
    4306:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4309:	8d 04 02             	lea    (%edx,%eax,1),%eax
    430c:	0f b6 00             	movzbl (%eax),%eax
    430f:	0f be c0             	movsbl %al,%eax
    4312:	25 ff 00 00 00       	and    $0xff,%eax
    4317:	89 45 e8             	mov    %eax,-0x18(%ebp)
    if(state == 0){
    431a:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    431e:	75 2c                	jne    434c <printf+0x6b>
      if(c == '%'){
    4320:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    4324:	75 0c                	jne    4332 <printf+0x51>
        state = '%';
    4326:	c7 45 f0 25 00 00 00 	movl   $0x25,-0x10(%ebp)
    432d:	e9 4b 01 00 00       	jmp    447d <printf+0x19c>
      } else {
        putc(fd, c);
    4332:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4335:	0f be c0             	movsbl %al,%eax
    4338:	89 44 24 04          	mov    %eax,0x4(%esp)
    433c:	8b 45 08             	mov    0x8(%ebp),%eax
    433f:	89 04 24             	mov    %eax,(%esp)
    4342:	e8 c1 fe ff ff       	call   4208 <putc>
    4347:	e9 31 01 00 00       	jmp    447d <printf+0x19c>
      }
    } else if(state == '%'){
    434c:	83 7d f0 25          	cmpl   $0x25,-0x10(%ebp)
    4350:	0f 85 27 01 00 00    	jne    447d <printf+0x19c>
      if(c == 'd'){
    4356:	83 7d e8 64          	cmpl   $0x64,-0x18(%ebp)
    435a:	75 2d                	jne    4389 <printf+0xa8>
        printint(fd, *ap, 10, 1);
    435c:	8b 45 f4             	mov    -0xc(%ebp),%eax
    435f:	8b 00                	mov    (%eax),%eax
    4361:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
    4368:	00 
    4369:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
    4370:	00 
    4371:	89 44 24 04          	mov    %eax,0x4(%esp)
    4375:	8b 45 08             	mov    0x8(%ebp),%eax
    4378:	89 04 24             	mov    %eax,(%esp)
    437b:	e8 b0 fe ff ff       	call   4230 <printint>
        ap++;
    4380:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    4384:	e9 ed 00 00 00       	jmp    4476 <printf+0x195>
      } else if(c == 'x' || c == 'p'){
    4389:	83 7d e8 78          	cmpl   $0x78,-0x18(%ebp)
    438d:	74 06                	je     4395 <printf+0xb4>
    438f:	83 7d e8 70          	cmpl   $0x70,-0x18(%ebp)
    4393:	75 2d                	jne    43c2 <printf+0xe1>
        printint(fd, *ap, 16, 0);
    4395:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4398:	8b 00                	mov    (%eax),%eax
    439a:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
    43a1:	00 
    43a2:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
    43a9:	00 
    43aa:	89 44 24 04          	mov    %eax,0x4(%esp)
    43ae:	8b 45 08             	mov    0x8(%ebp),%eax
    43b1:	89 04 24             	mov    %eax,(%esp)
    43b4:	e8 77 fe ff ff       	call   4230 <printint>
        ap++;
    43b9:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
      }
    } else if(state == '%'){
      if(c == 'd'){
        printint(fd, *ap, 10, 1);
        ap++;
      } else if(c == 'x' || c == 'p'){
    43bd:	e9 b4 00 00 00       	jmp    4476 <printf+0x195>
        printint(fd, *ap, 16, 0);
        ap++;
      } else if(c == 's'){
    43c2:	83 7d e8 73          	cmpl   $0x73,-0x18(%ebp)
    43c6:	75 46                	jne    440e <printf+0x12d>
        s = (char*)*ap;
    43c8:	8b 45 f4             	mov    -0xc(%ebp),%eax
    43cb:	8b 00                	mov    (%eax),%eax
    43cd:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        ap++;
    43d0:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
        if(s == 0)
    43d4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
    43d8:	75 27                	jne    4401 <printf+0x120>
          s = "(null)";
    43da:	c7 45 e4 6a 5d 00 00 	movl   $0x5d6a,-0x1c(%ebp)
        while(*s != 0){
    43e1:	eb 1f                	jmp    4402 <printf+0x121>
          putc(fd, *s);
    43e3:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    43e6:	0f b6 00             	movzbl (%eax),%eax
    43e9:	0f be c0             	movsbl %al,%eax
    43ec:	89 44 24 04          	mov    %eax,0x4(%esp)
    43f0:	8b 45 08             	mov    0x8(%ebp),%eax
    43f3:	89 04 24             	mov    %eax,(%esp)
    43f6:	e8 0d fe ff ff       	call   4208 <putc>
          s++;
    43fb:	83 45 e4 01          	addl   $0x1,-0x1c(%ebp)
    43ff:	eb 01                	jmp    4402 <printf+0x121>
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
    4401:	90                   	nop
    4402:	8b 45 e4             	mov    -0x1c(%ebp),%eax
    4405:	0f b6 00             	movzbl (%eax),%eax
    4408:	84 c0                	test   %al,%al
    440a:	75 d7                	jne    43e3 <printf+0x102>
    440c:	eb 68                	jmp    4476 <printf+0x195>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
    440e:	83 7d e8 63          	cmpl   $0x63,-0x18(%ebp)
    4412:	75 1d                	jne    4431 <printf+0x150>
        putc(fd, *ap);
    4414:	8b 45 f4             	mov    -0xc(%ebp),%eax
    4417:	8b 00                	mov    (%eax),%eax
    4419:	0f be c0             	movsbl %al,%eax
    441c:	89 44 24 04          	mov    %eax,0x4(%esp)
    4420:	8b 45 08             	mov    0x8(%ebp),%eax
    4423:	89 04 24             	mov    %eax,(%esp)
    4426:	e8 dd fd ff ff       	call   4208 <putc>
        ap++;
    442b:	83 45 f4 04          	addl   $0x4,-0xc(%ebp)
    442f:	eb 45                	jmp    4476 <printf+0x195>
      } else if(c == '%'){
    4431:	83 7d e8 25          	cmpl   $0x25,-0x18(%ebp)
    4435:	75 17                	jne    444e <printf+0x16d>
        putc(fd, c);
    4437:	8b 45 e8             	mov    -0x18(%ebp),%eax
    443a:	0f be c0             	movsbl %al,%eax
    443d:	89 44 24 04          	mov    %eax,0x4(%esp)
    4441:	8b 45 08             	mov    0x8(%ebp),%eax
    4444:	89 04 24             	mov    %eax,(%esp)
    4447:	e8 bc fd ff ff       	call   4208 <putc>
    444c:	eb 28                	jmp    4476 <printf+0x195>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
    444e:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
    4455:	00 
    4456:	8b 45 08             	mov    0x8(%ebp),%eax
    4459:	89 04 24             	mov    %eax,(%esp)
    445c:	e8 a7 fd ff ff       	call   4208 <putc>
        putc(fd, c);
    4461:	8b 45 e8             	mov    -0x18(%ebp),%eax
    4464:	0f be c0             	movsbl %al,%eax
    4467:	89 44 24 04          	mov    %eax,0x4(%esp)
    446b:	8b 45 08             	mov    0x8(%ebp),%eax
    446e:	89 04 24             	mov    %eax,(%esp)
    4471:	e8 92 fd ff ff       	call   4208 <putc>
      }
      state = 0;
    4476:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
    447d:	83 45 ec 01          	addl   $0x1,-0x14(%ebp)
    4481:	8b 55 0c             	mov    0xc(%ebp),%edx
    4484:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4487:	8d 04 02             	lea    (%edx,%eax,1),%eax
    448a:	0f b6 00             	movzbl (%eax),%eax
    448d:	84 c0                	test   %al,%al
    448f:	0f 85 6e fe ff ff    	jne    4303 <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
    4495:	c9                   	leave  
    4496:	c3                   	ret    
    4497:	90                   	nop

00004498 <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
    4498:	55                   	push   %ebp
    4499:	89 e5                	mov    %esp,%ebp
    449b:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
    449e:	8b 45 08             	mov    0x8(%ebp),%eax
    44a1:	83 e8 08             	sub    $0x8,%eax
    44a4:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    44a7:	a1 48 5e 00 00       	mov    0x5e48,%eax
    44ac:	89 45 fc             	mov    %eax,-0x4(%ebp)
    44af:	eb 24                	jmp    44d5 <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
    44b1:	8b 45 fc             	mov    -0x4(%ebp),%eax
    44b4:	8b 00                	mov    (%eax),%eax
    44b6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    44b9:	77 12                	ja     44cd <free+0x35>
    44bb:	8b 45 f8             	mov    -0x8(%ebp),%eax
    44be:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    44c1:	77 24                	ja     44e7 <free+0x4f>
    44c3:	8b 45 fc             	mov    -0x4(%ebp),%eax
    44c6:	8b 00                	mov    (%eax),%eax
    44c8:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    44cb:	77 1a                	ja     44e7 <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
    44cd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    44d0:	8b 00                	mov    (%eax),%eax
    44d2:	89 45 fc             	mov    %eax,-0x4(%ebp)
    44d5:	8b 45 f8             	mov    -0x8(%ebp),%eax
    44d8:	3b 45 fc             	cmp    -0x4(%ebp),%eax
    44db:	76 d4                	jbe    44b1 <free+0x19>
    44dd:	8b 45 fc             	mov    -0x4(%ebp),%eax
    44e0:	8b 00                	mov    (%eax),%eax
    44e2:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    44e5:	76 ca                	jbe    44b1 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
    44e7:	8b 45 f8             	mov    -0x8(%ebp),%eax
    44ea:	8b 40 04             	mov    0x4(%eax),%eax
    44ed:	c1 e0 03             	shl    $0x3,%eax
    44f0:	89 c2                	mov    %eax,%edx
    44f2:	03 55 f8             	add    -0x8(%ebp),%edx
    44f5:	8b 45 fc             	mov    -0x4(%ebp),%eax
    44f8:	8b 00                	mov    (%eax),%eax
    44fa:	39 c2                	cmp    %eax,%edx
    44fc:	75 24                	jne    4522 <free+0x8a>
    bp->s.size += p->s.ptr->s.size;
    44fe:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4501:	8b 50 04             	mov    0x4(%eax),%edx
    4504:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4507:	8b 00                	mov    (%eax),%eax
    4509:	8b 40 04             	mov    0x4(%eax),%eax
    450c:	01 c2                	add    %eax,%edx
    450e:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4511:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
    4514:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4517:	8b 00                	mov    (%eax),%eax
    4519:	8b 10                	mov    (%eax),%edx
    451b:	8b 45 f8             	mov    -0x8(%ebp),%eax
    451e:	89 10                	mov    %edx,(%eax)
    4520:	eb 0a                	jmp    452c <free+0x94>
  } else
    bp->s.ptr = p->s.ptr;
    4522:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4525:	8b 10                	mov    (%eax),%edx
    4527:	8b 45 f8             	mov    -0x8(%ebp),%eax
    452a:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
    452c:	8b 45 fc             	mov    -0x4(%ebp),%eax
    452f:	8b 40 04             	mov    0x4(%eax),%eax
    4532:	c1 e0 03             	shl    $0x3,%eax
    4535:	03 45 fc             	add    -0x4(%ebp),%eax
    4538:	3b 45 f8             	cmp    -0x8(%ebp),%eax
    453b:	75 20                	jne    455d <free+0xc5>
    p->s.size += bp->s.size;
    453d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4540:	8b 50 04             	mov    0x4(%eax),%edx
    4543:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4546:	8b 40 04             	mov    0x4(%eax),%eax
    4549:	01 c2                	add    %eax,%edx
    454b:	8b 45 fc             	mov    -0x4(%ebp),%eax
    454e:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
    4551:	8b 45 f8             	mov    -0x8(%ebp),%eax
    4554:	8b 10                	mov    (%eax),%edx
    4556:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4559:	89 10                	mov    %edx,(%eax)
    455b:	eb 08                	jmp    4565 <free+0xcd>
  } else
    p->s.ptr = bp;
    455d:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4560:	8b 55 f8             	mov    -0x8(%ebp),%edx
    4563:	89 10                	mov    %edx,(%eax)
  freep = p;
    4565:	8b 45 fc             	mov    -0x4(%ebp),%eax
    4568:	a3 48 5e 00 00       	mov    %eax,0x5e48
}
    456d:	c9                   	leave  
    456e:	c3                   	ret    

0000456f <morecore>:

static Header*
morecore(uint nu)
{
    456f:	55                   	push   %ebp
    4570:	89 e5                	mov    %esp,%ebp
    4572:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
    4575:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
    457c:	77 07                	ja     4585 <morecore+0x16>
    nu = 4096;
    457e:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
    4585:	8b 45 08             	mov    0x8(%ebp),%eax
    4588:	c1 e0 03             	shl    $0x3,%eax
    458b:	89 04 24             	mov    %eax,(%esp)
    458e:	e8 4d fc ff ff       	call   41e0 <sbrk>
    4593:	89 45 f0             	mov    %eax,-0x10(%ebp)
  if(p == (char*)-1)
    4596:	83 7d f0 ff          	cmpl   $0xffffffff,-0x10(%ebp)
    459a:	75 07                	jne    45a3 <morecore+0x34>
    return 0;
    459c:	b8 00 00 00 00       	mov    $0x0,%eax
    45a1:	eb 22                	jmp    45c5 <morecore+0x56>
  hp = (Header*)p;
    45a3:	8b 45 f0             	mov    -0x10(%ebp),%eax
    45a6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  hp->s.size = nu;
    45a9:	8b 45 f4             	mov    -0xc(%ebp),%eax
    45ac:	8b 55 08             	mov    0x8(%ebp),%edx
    45af:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
    45b2:	8b 45 f4             	mov    -0xc(%ebp),%eax
    45b5:	83 c0 08             	add    $0x8,%eax
    45b8:	89 04 24             	mov    %eax,(%esp)
    45bb:	e8 d8 fe ff ff       	call   4498 <free>
  return freep;
    45c0:	a1 48 5e 00 00       	mov    0x5e48,%eax
}
    45c5:	c9                   	leave  
    45c6:	c3                   	ret    

000045c7 <malloc>:

void*
malloc(uint nbytes)
{
    45c7:	55                   	push   %ebp
    45c8:	89 e5                	mov    %esp,%ebp
    45ca:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
    45cd:	8b 45 08             	mov    0x8(%ebp),%eax
    45d0:	83 c0 07             	add    $0x7,%eax
    45d3:	c1 e8 03             	shr    $0x3,%eax
    45d6:	83 c0 01             	add    $0x1,%eax
    45d9:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if((prevp = freep) == 0){
    45dc:	a1 48 5e 00 00       	mov    0x5e48,%eax
    45e1:	89 45 f0             	mov    %eax,-0x10(%ebp)
    45e4:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
    45e8:	75 23                	jne    460d <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
    45ea:	c7 45 f0 40 5e 00 00 	movl   $0x5e40,-0x10(%ebp)
    45f1:	8b 45 f0             	mov    -0x10(%ebp),%eax
    45f4:	a3 48 5e 00 00       	mov    %eax,0x5e48
    45f9:	a1 48 5e 00 00       	mov    0x5e48,%eax
    45fe:	a3 40 5e 00 00       	mov    %eax,0x5e40
    base.s.size = 0;
    4603:	c7 05 44 5e 00 00 00 	movl   $0x0,0x5e44
    460a:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    460d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4610:	8b 00                	mov    (%eax),%eax
    4612:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(p->s.size >= nunits){
    4615:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4618:	8b 40 04             	mov    0x4(%eax),%eax
    461b:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    461e:	72 4d                	jb     466d <malloc+0xa6>
      if(p->s.size == nunits)
    4620:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4623:	8b 40 04             	mov    0x4(%eax),%eax
    4626:	3b 45 f4             	cmp    -0xc(%ebp),%eax
    4629:	75 0c                	jne    4637 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
    462b:	8b 45 ec             	mov    -0x14(%ebp),%eax
    462e:	8b 10                	mov    (%eax),%edx
    4630:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4633:	89 10                	mov    %edx,(%eax)
    4635:	eb 26                	jmp    465d <malloc+0x96>
      else {
        p->s.size -= nunits;
    4637:	8b 45 ec             	mov    -0x14(%ebp),%eax
    463a:	8b 40 04             	mov    0x4(%eax),%eax
    463d:	89 c2                	mov    %eax,%edx
    463f:	2b 55 f4             	sub    -0xc(%ebp),%edx
    4642:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4645:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
    4648:	8b 45 ec             	mov    -0x14(%ebp),%eax
    464b:	8b 40 04             	mov    0x4(%eax),%eax
    464e:	c1 e0 03             	shl    $0x3,%eax
    4651:	01 45 ec             	add    %eax,-0x14(%ebp)
        p->s.size = nunits;
    4654:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4657:	8b 55 f4             	mov    -0xc(%ebp),%edx
    465a:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
    465d:	8b 45 f0             	mov    -0x10(%ebp),%eax
    4660:	a3 48 5e 00 00       	mov    %eax,0x5e48
      return (void*)(p + 1);
    4665:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4668:	83 c0 08             	add    $0x8,%eax
    466b:	eb 38                	jmp    46a5 <malloc+0xde>
    }
    if(p == freep)
    466d:	a1 48 5e 00 00       	mov    0x5e48,%eax
    4672:	39 45 ec             	cmp    %eax,-0x14(%ebp)
    4675:	75 1b                	jne    4692 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
    4677:	8b 45 f4             	mov    -0xc(%ebp),%eax
    467a:	89 04 24             	mov    %eax,(%esp)
    467d:	e8 ed fe ff ff       	call   456f <morecore>
    4682:	89 45 ec             	mov    %eax,-0x14(%ebp)
    4685:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
    4689:	75 07                	jne    4692 <malloc+0xcb>
        return 0;
    468b:	b8 00 00 00 00       	mov    $0x0,%eax
    4690:	eb 13                	jmp    46a5 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
    4692:	8b 45 ec             	mov    -0x14(%ebp),%eax
    4695:	89 45 f0             	mov    %eax,-0x10(%ebp)
    4698:	8b 45 ec             	mov    -0x14(%ebp),%eax
    469b:	8b 00                	mov    (%eax),%eax
    469d:	89 45 ec             	mov    %eax,-0x14(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
    46a0:	e9 70 ff ff ff       	jmp    4615 <malloc+0x4e>
}
    46a5:	c9                   	leave  
    46a6:	c3                   	ret    
