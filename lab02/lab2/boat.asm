
_boat:     file format elf32-i386


Disassembly of section .text:

00000000 <main>:
void CannibalArrives();
void RowBoat();

int
main(int argc, char *argv[])
{
       0:	55                   	push   %ebp
       1:	89 e5                	mov    %esp,%ebp
       3:	83 e4 f0             	and    $0xfffffff0,%esp
       6:	83 ec 20             	sub    $0x20,%esp
	sem_init(&boat, 3);
       9:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
      10:	00 
      11:	c7 04 24 20 19 00 00 	movl   $0x1920,(%esp)
      18:	e8 c9 10 00 00       	call   10e6 <sem_init>
	
	sem_init(&display, 1);
      1d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
      24:	00 
      25:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
      2c:	e8 b5 10 00 00       	call   10e6 <sem_init>
	sem_init(&cann, 3);
      31:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
      38:	00 
      39:	c7 04 24 e0 18 00 00 	movl   $0x18e0,(%esp)
      40:	e8 a1 10 00 00       	call   10e6 <sem_init>
	sem_init_full(&loading, 3);
      45:	c7 44 24 04 03 00 00 	movl   $0x3,0x4(%esp)
      4c:	00 
      4d:	c7 04 24 20 1a 00 00 	movl   $0x1a20,(%esp)
      54:	e8 b2 10 00 00       	call   110b <sem_init_full>
	
	sem_signal(&loading);
      59:	c7 04 24 20 1a 00 00 	movl   $0x1a20,(%esp)
      60:	e8 32 11 00 00       	call   1197 <sem_signal>
	sem_signal(&loading);
      65:	c7 04 24 20 1a 00 00 	movl   $0x1a20,(%esp)
      6c:	e8 26 11 00 00       	call   1197 <sem_signal>
	sem_signal(&loading);
      71:	c7 04 24 20 1a 00 00 	movl   $0x1a20,(%esp)
      78:	e8 1a 11 00 00       	call   1197 <sem_signal>
	
	sem_init(&mutex, 1);
      7d:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
      84:	00 
      85:	c7 04 24 a0 19 00 00 	movl   $0x19a0,(%esp)
      8c:	e8 55 10 00 00       	call   10e6 <sem_init>
	sem_init(&mutex2, 1);
      91:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
      98:	00 
      99:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
      a0:	e8 41 10 00 00       	call   10e6 <sem_init>
	sem_init_full(&prevention, 1);
      a5:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
      ac:	00 
      ad:	c7 04 24 e0 19 00 00 	movl   $0x19e0,(%esp)
      b4:	e8 52 10 00 00       	call   110b <sem_init_full>

	int i;
	int population = 12;
      b9:	c7 44 24 18 0c 00 00 	movl   $0xc,0x18(%esp)
      c0:	00 
	 
	
	for(i = 0; i < population; i++)
      c1:	c7 44 24 1c 00 00 00 	movl   $0x0,0x1c(%esp)
      c8:	00 
      c9:	eb 3f                	jmp    10a <main+0x10a>
	{
		if(random(3)) thread_create(MissionaryArrives, 0);
      cb:	c7 04 24 03 00 00 00 	movl   $0x3,(%esp)
      d2:	e8 cf 0e 00 00       	call   fa6 <random>
      d7:	85 c0                	test   %eax,%eax
      d9:	74 16                	je     f1 <main+0xf1>
      db:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      e2:	00 
      e3:	c7 04 24 37 01 00 00 	movl   $0x137,(%esp)
      ea:	e8 ea 0d 00 00       	call   ed9 <thread_create>
      ef:	eb 14                	jmp    105 <main+0x105>
		else thread_create(CannibalArrives, 0);
      f1:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
      f8:	00 
      f9:	c7 04 24 59 03 00 00 	movl   $0x359,(%esp)
     100:	e8 d4 0d 00 00       	call   ed9 <thread_create>

	int i;
	int population = 12;
	 
	
	for(i = 0; i < population; i++)
     105:	83 44 24 1c 01       	addl   $0x1,0x1c(%esp)
     10a:	8b 44 24 1c          	mov    0x1c(%esp),%eax
     10e:	3b 44 24 18          	cmp    0x18(%esp),%eax
     112:	7c b7                	jl     cb <main+0xcb>
	
	}
	// for(i = 0; i < 3; i++) thread_create(MissionaryArrives, 0);
	// for(i = 0; i < 4; i++) thread_create(CannibalArrives, 0);
	
	while(wait() > 0);
     114:	90                   	nop
     115:	e8 f0 07 00 00       	call   90a <wait>
     11a:	85 c0                	test   %eax,%eax
     11c:	7f f7                	jg     115 <main+0x115>
	printf(1, "done moving\n");
     11e:	c7 44 24 04 1c 12 00 	movl   $0x121c,0x4(%esp)
     125:	00 
     126:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     12d:	e8 78 09 00 00       	call   aaa <printf>


	exit();
     132:	e8 cb 07 00 00       	call   902 <exit>

00000137 <MissionaryArrives>:
}

void MissionaryArrives()
{
     137:	55                   	push   %ebp
     138:	89 e5                	mov    %esp,%ebp
     13a:	56                   	push   %esi
     13b:	53                   	push   %ebx
     13c:	83 ec 20             	sub    $0x20,%esp
	sem_aquire(&boat);
     13f:	c7 04 24 20 19 00 00 	movl   $0x1920,(%esp)
     146:	e8 e6 0f 00 00       	call   1131 <sem_aquire>
	
	sem_aquire(&display);
     14b:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     152:	e8 da 0f 00 00       	call   1131 <sem_aquire>
	printf(1, "1: (%d) missionary arrived, %d, %d\n", getpid(), total, con);
     157:	8b 35 88 18 00 00    	mov    0x1888,%esi
     15d:	8b 1d 84 18 00 00    	mov    0x1884,%ebx
     163:	e8 1a 08 00 00       	call   982 <getpid>
     168:	89 74 24 10          	mov    %esi,0x10(%esp)
     16c:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     170:	89 44 24 08          	mov    %eax,0x8(%esp)
     174:	c7 44 24 04 2c 12 00 	movl   $0x122c,0x4(%esp)
     17b:	00 
     17c:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     183:	e8 22 09 00 00       	call   aaa <printf>
	sem_signal(&display);
     188:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     18f:	e8 03 10 00 00       	call   1197 <sem_signal>


	sem_aquire(&mutex2);	
     194:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     19b:	e8 91 0f 00 00       	call   1131 <sem_aquire>
	while(total + 1 == 5){ con++;
     1a0:	e9 db 00 00 00       	jmp    280 <MissionaryArrives+0x149>
     1a5:	a1 88 18 00 00       	mov    0x1888,%eax
     1aa:	83 c0 01             	add    $0x1,%eax
     1ad:	a3 88 18 00 00       	mov    %eax,0x1888
	sem_signal(&mutex2);
     1b2:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     1b9:	e8 d9 0f 00 00       	call   1197 <sem_signal>
	sem_signal(&boat);
     1be:	c7 04 24 20 19 00 00 	movl   $0x1920,(%esp)
     1c5:	e8 cd 0f 00 00       	call   1197 <sem_signal>

	sem_aquire(&display);
     1ca:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     1d1:	e8 5b 0f 00 00       	call   1131 <sem_aquire>
	printf(1, "1: (%d) missionary denied boarding, %d, %d\n", getpid(), total, con);
     1d6:	8b 35 88 18 00 00    	mov    0x1888,%esi
     1dc:	8b 1d 84 18 00 00    	mov    0x1884,%ebx
     1e2:	e8 9b 07 00 00       	call   982 <getpid>
     1e7:	89 74 24 10          	mov    %esi,0x10(%esp)
     1eb:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     1ef:	89 44 24 08          	mov    %eax,0x8(%esp)
     1f3:	c7 44 24 04 50 12 00 	movl   $0x1250,0x4(%esp)
     1fa:	00 
     1fb:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     202:	e8 a3 08 00 00       	call   aaa <printf>
	sem_signal(&display);
     207:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     20e:	e8 84 0f 00 00       	call   1197 <sem_signal>

	sem_aquire(&prevention);
     213:	c7 04 24 e0 19 00 00 	movl   $0x19e0,(%esp)
     21a:	e8 12 0f 00 00       	call   1131 <sem_aquire>

	sem_aquire(&display);
     21f:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     226:	e8 06 0f 00 00       	call   1131 <sem_aquire>
	printf(1, "1: (%d) missionary prevented death, %d, %d\n", getpid(), total, con);
     22b:	8b 35 88 18 00 00    	mov    0x1888,%esi
     231:	8b 1d 84 18 00 00    	mov    0x1884,%ebx
     237:	e8 46 07 00 00       	call   982 <getpid>
     23c:	89 74 24 10          	mov    %esi,0x10(%esp)
     240:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     244:	89 44 24 08          	mov    %eax,0x8(%esp)
     248:	c7 44 24 04 7c 12 00 	movl   $0x127c,0x4(%esp)
     24f:	00 
     250:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     257:	e8 4e 08 00 00       	call   aaa <printf>
	sem_signal(&display);
     25c:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     263:	e8 2f 0f 00 00       	call   1197 <sem_signal>
	
	sem_aquire(&boat);
     268:	c7 04 24 20 19 00 00 	movl   $0x1920,(%esp)
     26f:	e8 bd 0e 00 00       	call   1131 <sem_aquire>
	sem_aquire(&mutex2);
     274:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     27b:	e8 b1 0e 00 00       	call   1131 <sem_aquire>
	printf(1, "1: (%d) missionary arrived, %d, %d\n", getpid(), total, con);
	sem_signal(&display);


	sem_aquire(&mutex2);	
	while(total + 1 == 5){ con++;
     280:	a1 84 18 00 00       	mov    0x1884,%eax
     285:	83 f8 04             	cmp    $0x4,%eax
     288:	0f 84 17 ff ff ff    	je     1a5 <MissionaryArrives+0x6e>
	sem_signal(&display);
	
	sem_aquire(&boat);
	sem_aquire(&mutex2);
	}
	sem_signal(&mutex2);
     28e:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     295:	e8 fd 0e 00 00       	call   1197 <sem_signal>
	sem_aquire(&mutex2);
     29a:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     2a1:	e8 8b 0e 00 00       	call   1131 <sem_aquire>
	total += 1;
     2a6:	a1 84 18 00 00       	mov    0x1884,%eax
     2ab:	83 c0 01             	add    $0x1,%eax
     2ae:	a3 84 18 00 00       	mov    %eax,0x1884
	sem_signal(&mutex2);
     2b3:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     2ba:	e8 d8 0e 00 00       	call   1197 <sem_signal>
	
	sem_aquire(&display);
     2bf:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     2c6:	e8 66 0e 00 00       	call   1131 <sem_aquire>
	printf(1, "2: (%d) missionary enters boat, %d, %d\n", getpid(), total, con);
     2cb:	8b 35 88 18 00 00    	mov    0x1888,%esi
     2d1:	8b 1d 84 18 00 00    	mov    0x1884,%ebx
     2d7:	e8 a6 06 00 00       	call   982 <getpid>
     2dc:	89 74 24 10          	mov    %esi,0x10(%esp)
     2e0:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     2e4:	89 44 24 08          	mov    %eax,0x8(%esp)
     2e8:	c7 44 24 04 a8 12 00 	movl   $0x12a8,0x4(%esp)
     2ef:	00 
     2f0:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     2f7:	e8 ae 07 00 00       	call   aaa <printf>
	sem_signal(&display);
     2fc:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     303:	e8 8f 0e 00 00       	call   1197 <sem_signal>

	sem_aquire(&mutex);
     308:	c7 04 24 a0 19 00 00 	movl   $0x19a0,(%esp)
     30f:	e8 1d 0e 00 00       	call   1131 <sem_aquire>
	bp++;
     314:	a1 80 18 00 00       	mov    0x1880,%eax
     319:	83 c0 01             	add    $0x1,%eax
     31c:	a3 80 18 00 00       	mov    %eax,0x1880
	sem_signal(&mutex);
     321:	c7 04 24 a0 19 00 00 	movl   $0x19a0,(%esp)
     328:	e8 6a 0e 00 00       	call   1197 <sem_signal>
	if (bp < 3)	sem_aquire(&loading);
     32d:	a1 80 18 00 00       	mov    0x1880,%eax
     332:	83 f8 02             	cmp    $0x2,%eax
     335:	7f 0c                	jg     343 <MissionaryArrives+0x20c>
     337:	c7 04 24 20 1a 00 00 	movl   $0x1a20,(%esp)
     33e:	e8 ee 0d 00 00       	call   1131 <sem_aquire>

	// sem_aquire(&display);
	// printf(1, "bp missionary: %d\n", bp);
	// sem_signal(&display);
	
	RowBoat();
     343:	e8 33 02 00 00       	call   57b <RowBoat>
	sem_signal(&loading);
     348:	c7 04 24 20 1a 00 00 	movl   $0x1a20,(%esp)
     34f:	e8 43 0e 00 00       	call   1197 <sem_signal>
	
	
	texit();
     354:	e8 51 06 00 00       	call   9aa <texit>

00000359 <CannibalArrives>:
}

void CannibalArrives()
{
     359:	55                   	push   %ebp
     35a:	89 e5                	mov    %esp,%ebp
     35c:	56                   	push   %esi
     35d:	53                   	push   %ebx
     35e:	83 ec 20             	sub    $0x20,%esp
	sem_aquire(&boat);
     361:	c7 04 24 20 19 00 00 	movl   $0x1920,(%esp)
     368:	e8 c4 0d 00 00       	call   1131 <sem_aquire>
	
	sem_aquire(&display);
     36d:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     374:	e8 b8 0d 00 00       	call   1131 <sem_aquire>
	printf(1, "1: (%d) cannibal arrived, %d, %d\n", getpid(), total, con);
     379:	8b 35 88 18 00 00    	mov    0x1888,%esi
     37f:	8b 1d 84 18 00 00    	mov    0x1884,%ebx
     385:	e8 f8 05 00 00       	call   982 <getpid>
     38a:	89 74 24 10          	mov    %esi,0x10(%esp)
     38e:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     392:	89 44 24 08          	mov    %eax,0x8(%esp)
     396:	c7 44 24 04 d0 12 00 	movl   $0x12d0,0x4(%esp)
     39d:	00 
     39e:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     3a5:	e8 00 07 00 00       	call   aaa <printf>
	sem_signal(&display);	
     3aa:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     3b1:	e8 e1 0d 00 00       	call   1197 <sem_signal>


	sem_aquire(&mutex2);
     3b6:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     3bd:	e8 6f 0d 00 00       	call   1131 <sem_aquire>
	while(total + 2 == 5) { con++;
     3c2:	e9 db 00 00 00       	jmp    4a2 <CannibalArrives+0x149>
     3c7:	a1 88 18 00 00       	mov    0x1888,%eax
     3cc:	83 c0 01             	add    $0x1,%eax
     3cf:	a3 88 18 00 00       	mov    %eax,0x1888
	sem_signal(&mutex2);
     3d4:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     3db:	e8 b7 0d 00 00       	call   1197 <sem_signal>
	sem_signal(&boat);
     3e0:	c7 04 24 20 19 00 00 	movl   $0x1920,(%esp)
     3e7:	e8 ab 0d 00 00       	call   1197 <sem_signal>
	
	sem_aquire(&display);
     3ec:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     3f3:	e8 39 0d 00 00       	call   1131 <sem_aquire>
	printf(1, "1: (%d) cannibal denied boarding, %d, %d\n", getpid(), total, con);
     3f8:	8b 35 88 18 00 00    	mov    0x1888,%esi
     3fe:	8b 1d 84 18 00 00    	mov    0x1884,%ebx
     404:	e8 79 05 00 00       	call   982 <getpid>
     409:	89 74 24 10          	mov    %esi,0x10(%esp)
     40d:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     411:	89 44 24 08          	mov    %eax,0x8(%esp)
     415:	c7 44 24 04 f4 12 00 	movl   $0x12f4,0x4(%esp)
     41c:	00 
     41d:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     424:	e8 81 06 00 00       	call   aaa <printf>
	sem_signal(&display);
     429:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     430:	e8 62 0d 00 00       	call   1197 <sem_signal>

	sem_aquire(&prevention);
     435:	c7 04 24 e0 19 00 00 	movl   $0x19e0,(%esp)
     43c:	e8 f0 0c 00 00       	call   1131 <sem_aquire>

	sem_aquire(&display);
     441:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     448:	e8 e4 0c 00 00       	call   1131 <sem_aquire>
	printf(1, "1: (%d) cannibal prevented meal, %d, %d\n", getpid(), total, con);
     44d:	8b 35 88 18 00 00    	mov    0x1888,%esi
     453:	8b 1d 84 18 00 00    	mov    0x1884,%ebx
     459:	e8 24 05 00 00       	call   982 <getpid>
     45e:	89 74 24 10          	mov    %esi,0x10(%esp)
     462:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     466:	89 44 24 08          	mov    %eax,0x8(%esp)
     46a:	c7 44 24 04 20 13 00 	movl   $0x1320,0x4(%esp)
     471:	00 
     472:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     479:	e8 2c 06 00 00       	call   aaa <printf>
	sem_signal(&display);
     47e:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     485:	e8 0d 0d 00 00       	call   1197 <sem_signal>

	
	sem_aquire(&boat);
     48a:	c7 04 24 20 19 00 00 	movl   $0x1920,(%esp)
     491:	e8 9b 0c 00 00       	call   1131 <sem_aquire>
	sem_aquire(&mutex2);
     496:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     49d:	e8 8f 0c 00 00       	call   1131 <sem_aquire>
	printf(1, "1: (%d) cannibal arrived, %d, %d\n", getpid(), total, con);
	sem_signal(&display);	


	sem_aquire(&mutex2);
	while(total + 2 == 5) { con++;
     4a2:	a1 84 18 00 00       	mov    0x1884,%eax
     4a7:	83 f8 03             	cmp    $0x3,%eax
     4aa:	0f 84 17 ff ff ff    	je     3c7 <CannibalArrives+0x6e>

	
	sem_aquire(&boat);
	sem_aquire(&mutex2);
	}
	sem_signal(&mutex2);
     4b0:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     4b7:	e8 db 0c 00 00       	call   1197 <sem_signal>
	sem_aquire(&mutex2);
     4bc:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     4c3:	e8 69 0c 00 00       	call   1131 <sem_aquire>
	total += 2;
     4c8:	a1 84 18 00 00       	mov    0x1884,%eax
     4cd:	83 c0 02             	add    $0x2,%eax
     4d0:	a3 84 18 00 00       	mov    %eax,0x1884
	sem_signal(&mutex2);
     4d5:	c7 04 24 a0 18 00 00 	movl   $0x18a0,(%esp)
     4dc:	e8 b6 0c 00 00       	call   1197 <sem_signal>
	
	sem_aquire(&display);
     4e1:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     4e8:	e8 44 0c 00 00       	call   1131 <sem_aquire>
	printf(1, "2: (%d) cannibal enters boat, %d, %d\n", getpid(), total, con);
     4ed:	8b 35 88 18 00 00    	mov    0x1888,%esi
     4f3:	8b 1d 84 18 00 00    	mov    0x1884,%ebx
     4f9:	e8 84 04 00 00       	call   982 <getpid>
     4fe:	89 74 24 10          	mov    %esi,0x10(%esp)
     502:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     506:	89 44 24 08          	mov    %eax,0x8(%esp)
     50a:	c7 44 24 04 4c 13 00 	movl   $0x134c,0x4(%esp)
     511:	00 
     512:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     519:	e8 8c 05 00 00       	call   aaa <printf>
	sem_signal(&display);	
     51e:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     525:	e8 6d 0c 00 00       	call   1197 <sem_signal>
	
	sem_aquire(&mutex);
     52a:	c7 04 24 a0 19 00 00 	movl   $0x19a0,(%esp)
     531:	e8 fb 0b 00 00       	call   1131 <sem_aquire>
	bp++;
     536:	a1 80 18 00 00       	mov    0x1880,%eax
     53b:	83 c0 01             	add    $0x1,%eax
     53e:	a3 80 18 00 00       	mov    %eax,0x1880
	sem_signal(&mutex);
     543:	c7 04 24 a0 19 00 00 	movl   $0x19a0,(%esp)
     54a:	e8 48 0c 00 00       	call   1197 <sem_signal>
	if (bp < 3)	sem_aquire(&loading);
     54f:	a1 80 18 00 00       	mov    0x1880,%eax
     554:	83 f8 02             	cmp    $0x2,%eax
     557:	7f 0c                	jg     565 <CannibalArrives+0x20c>
     559:	c7 04 24 20 1a 00 00 	movl   $0x1a20,(%esp)
     560:	e8 cc 0b 00 00       	call   1131 <sem_aquire>
	
	// sem_aquire(&display);
	// printf(1, "bp cannibal: %d\n", bp);
	// sem_signal(&display);
	
	RowBoat();
     565:	e8 11 00 00 00       	call   57b <RowBoat>
	sem_signal(&loading);
     56a:	c7 04 24 20 1a 00 00 	movl   $0x1a20,(%esp)
     571:	e8 21 0c 00 00       	call   1197 <sem_signal>

	
	texit();
     576:	e8 2f 04 00 00       	call   9aa <texit>

0000057b <RowBoat>:
}

void RowBoat()
{
     57b:	55                   	push   %ebp
     57c:	89 e5                	mov    %esp,%ebp
     57e:	56                   	push   %esi
     57f:	53                   	push   %ebx
     580:	83 ec 30             	sub    $0x30,%esp

	// sending boat off
	sem_aquire(&mutex);
     583:	c7 04 24 a0 19 00 00 	movl   $0x19a0,(%esp)
     58a:	e8 a2 0b 00 00       	call   1131 <sem_aquire>
	
	if(bp == 3){
     58f:	a1 80 18 00 00       	mov    0x1880,%eax
     594:	83 f8 03             	cmp    $0x3,%eax
     597:	0f 85 ea 00 00 00    	jne    687 <RowBoat+0x10c>
	sem_aquire(&display);
     59d:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     5a4:	e8 88 0b 00 00       	call   1131 <sem_aquire>
	printf(1, "(%d) RowBoat\n", getpid());
     5a9:	e8 d4 03 00 00       	call   982 <getpid>
     5ae:	89 44 24 08          	mov    %eax,0x8(%esp)
     5b2:	c7 44 24 04 72 13 00 	movl   $0x1372,0x4(%esp)
     5b9:	00 
     5ba:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     5c1:	e8 e4 04 00 00       	call   aaa <printf>
	sem_signal(&display);
     5c6:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     5cd:	e8 c5 0b 00 00       	call   1197 <sem_signal>
	sem_signal(&boat);
     5d2:	c7 04 24 20 19 00 00 	movl   $0x1920,(%esp)
     5d9:	e8 b9 0b 00 00       	call   1197 <sem_signal>
	sem_signal(&boat);
     5de:	c7 04 24 20 19 00 00 	movl   $0x1920,(%esp)
     5e5:	e8 ad 0b 00 00       	call   1197 <sem_signal>
	sem_signal(&boat);
     5ea:	c7 04 24 20 19 00 00 	movl   $0x1920,(%esp)
     5f1:	e8 a1 0b 00 00       	call   1197 <sem_signal>
	bp = 0;
     5f6:	c7 05 80 18 00 00 00 	movl   $0x0,0x1880
     5fd:	00 00 00 
	sem_aquire(&display);
     600:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     607:	e8 25 0b 00 00       	call   1131 <sem_aquire>
	printf(1, "(%d) sending boat off. bon voyage! %d, %d\n", getpid(), total, con);	
     60c:	8b 35 88 18 00 00    	mov    0x1888,%esi
     612:	8b 1d 84 18 00 00    	mov    0x1884,%ebx
     618:	e8 65 03 00 00       	call   982 <getpid>
     61d:	89 74 24 10          	mov    %esi,0x10(%esp)
     621:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
     625:	89 44 24 08          	mov    %eax,0x8(%esp)
     629:	c7 44 24 04 80 13 00 	movl   $0x1380,0x4(%esp)
     630:	00 
     631:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     638:	e8 6d 04 00 00       	call   aaa <printf>
	sem_signal(&display);
     63d:	c7 04 24 60 19 00 00 	movl   $0x1960,(%esp)
     644:	e8 4e 0b 00 00       	call   1197 <sem_signal>
	int j = 0;
     649:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
	for (j = 0; j < con; ++j) sem_signal(&prevention);
     650:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     657:	eb 10                	jmp    669 <RowBoat+0xee>
     659:	c7 04 24 e0 19 00 00 	movl   $0x19e0,(%esp)
     660:	e8 32 0b 00 00       	call   1197 <sem_signal>
     665:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
     669:	a1 88 18 00 00       	mov    0x1888,%eax
     66e:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     671:	7c e6                	jl     659 <RowBoat+0xde>
	con = 0;
     673:	c7 05 88 18 00 00 00 	movl   $0x0,0x1888
     67a:	00 00 00 
	total = 0;
     67d:	c7 05 84 18 00 00 00 	movl   $0x0,0x1884
     684:	00 00 00 
	}
	sem_signal(&mutex);
     687:	c7 04 24 a0 19 00 00 	movl   $0x19a0,(%esp)
     68e:	e8 04 0b 00 00       	call   1197 <sem_signal>
     693:	83 c4 30             	add    $0x30,%esp
     696:	5b                   	pop    %ebx
     697:	5e                   	pop    %esi
     698:	5d                   	pop    %ebp
     699:	c3                   	ret    

0000069a <stosb>:
               "cc");
}

static inline void
stosb(void *addr, int data, int cnt)
{
     69a:	55                   	push   %ebp
     69b:	89 e5                	mov    %esp,%ebp
     69d:	57                   	push   %edi
     69e:	53                   	push   %ebx
  asm volatile("cld; rep stosb" :
     69f:	8b 4d 08             	mov    0x8(%ebp),%ecx
     6a2:	8b 55 10             	mov    0x10(%ebp),%edx
     6a5:	8b 45 0c             	mov    0xc(%ebp),%eax
     6a8:	89 cb                	mov    %ecx,%ebx
     6aa:	89 df                	mov    %ebx,%edi
     6ac:	89 d1                	mov    %edx,%ecx
     6ae:	fc                   	cld    
     6af:	f3 aa                	rep stos %al,%es:(%edi)
     6b1:	89 ca                	mov    %ecx,%edx
     6b3:	89 fb                	mov    %edi,%ebx
     6b5:	89 5d 08             	mov    %ebx,0x8(%ebp)
     6b8:	89 55 10             	mov    %edx,0x10(%ebp)
               "=D" (addr), "=c" (cnt) :
               "0" (addr), "1" (cnt), "a" (data) :
               "memory", "cc");
}
     6bb:	5b                   	pop    %ebx
     6bc:	5f                   	pop    %edi
     6bd:	5d                   	pop    %ebp
     6be:	c3                   	ret    

000006bf <strcpy>:
#include "user.h"
#include "x86.h"

char*
strcpy(char *s, char *t)
{
     6bf:	55                   	push   %ebp
     6c0:	89 e5                	mov    %esp,%ebp
     6c2:	83 ec 10             	sub    $0x10,%esp
  char *os;

  os = s;
     6c5:	8b 45 08             	mov    0x8(%ebp),%eax
     6c8:	89 45 fc             	mov    %eax,-0x4(%ebp)
  while((*s++ = *t++) != 0)
     6cb:	90                   	nop
     6cc:	8b 45 08             	mov    0x8(%ebp),%eax
     6cf:	8d 50 01             	lea    0x1(%eax),%edx
     6d2:	89 55 08             	mov    %edx,0x8(%ebp)
     6d5:	8b 55 0c             	mov    0xc(%ebp),%edx
     6d8:	8d 4a 01             	lea    0x1(%edx),%ecx
     6db:	89 4d 0c             	mov    %ecx,0xc(%ebp)
     6de:	0f b6 12             	movzbl (%edx),%edx
     6e1:	88 10                	mov    %dl,(%eax)
     6e3:	0f b6 00             	movzbl (%eax),%eax
     6e6:	84 c0                	test   %al,%al
     6e8:	75 e2                	jne    6cc <strcpy+0xd>
    ;
  return os;
     6ea:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     6ed:	c9                   	leave  
     6ee:	c3                   	ret    

000006ef <strcmp>:

int
strcmp(const char *p, const char *q)
{
     6ef:	55                   	push   %ebp
     6f0:	89 e5                	mov    %esp,%ebp
  while(*p && *p == *q)
     6f2:	eb 08                	jmp    6fc <strcmp+0xd>
    p++, q++;
     6f4:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     6f8:	83 45 0c 01          	addl   $0x1,0xc(%ebp)
}

int
strcmp(const char *p, const char *q)
{
  while(*p && *p == *q)
     6fc:	8b 45 08             	mov    0x8(%ebp),%eax
     6ff:	0f b6 00             	movzbl (%eax),%eax
     702:	84 c0                	test   %al,%al
     704:	74 10                	je     716 <strcmp+0x27>
     706:	8b 45 08             	mov    0x8(%ebp),%eax
     709:	0f b6 10             	movzbl (%eax),%edx
     70c:	8b 45 0c             	mov    0xc(%ebp),%eax
     70f:	0f b6 00             	movzbl (%eax),%eax
     712:	38 c2                	cmp    %al,%dl
     714:	74 de                	je     6f4 <strcmp+0x5>
    p++, q++;
  return (uchar)*p - (uchar)*q;
     716:	8b 45 08             	mov    0x8(%ebp),%eax
     719:	0f b6 00             	movzbl (%eax),%eax
     71c:	0f b6 d0             	movzbl %al,%edx
     71f:	8b 45 0c             	mov    0xc(%ebp),%eax
     722:	0f b6 00             	movzbl (%eax),%eax
     725:	0f b6 c0             	movzbl %al,%eax
     728:	29 c2                	sub    %eax,%edx
     72a:	89 d0                	mov    %edx,%eax
}
     72c:	5d                   	pop    %ebp
     72d:	c3                   	ret    

0000072e <strlen>:

uint
strlen(char *s)
{
     72e:	55                   	push   %ebp
     72f:	89 e5                	mov    %esp,%ebp
     731:	83 ec 10             	sub    $0x10,%esp
  int n;

  for(n = 0; s[n]; n++)
     734:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
     73b:	eb 04                	jmp    741 <strlen+0x13>
     73d:	83 45 fc 01          	addl   $0x1,-0x4(%ebp)
     741:	8b 55 fc             	mov    -0x4(%ebp),%edx
     744:	8b 45 08             	mov    0x8(%ebp),%eax
     747:	01 d0                	add    %edx,%eax
     749:	0f b6 00             	movzbl (%eax),%eax
     74c:	84 c0                	test   %al,%al
     74e:	75 ed                	jne    73d <strlen+0xf>
    ;
  return n;
     750:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     753:	c9                   	leave  
     754:	c3                   	ret    

00000755 <memset>:

void*
memset(void *dst, int c, uint n)
{
     755:	55                   	push   %ebp
     756:	89 e5                	mov    %esp,%ebp
     758:	83 ec 0c             	sub    $0xc,%esp
  stosb(dst, c, n);
     75b:	8b 45 10             	mov    0x10(%ebp),%eax
     75e:	89 44 24 08          	mov    %eax,0x8(%esp)
     762:	8b 45 0c             	mov    0xc(%ebp),%eax
     765:	89 44 24 04          	mov    %eax,0x4(%esp)
     769:	8b 45 08             	mov    0x8(%ebp),%eax
     76c:	89 04 24             	mov    %eax,(%esp)
     76f:	e8 26 ff ff ff       	call   69a <stosb>
  return dst;
     774:	8b 45 08             	mov    0x8(%ebp),%eax
}
     777:	c9                   	leave  
     778:	c3                   	ret    

00000779 <strchr>:

char*
strchr(const char *s, char c)
{
     779:	55                   	push   %ebp
     77a:	89 e5                	mov    %esp,%ebp
     77c:	83 ec 04             	sub    $0x4,%esp
     77f:	8b 45 0c             	mov    0xc(%ebp),%eax
     782:	88 45 fc             	mov    %al,-0x4(%ebp)
  for(; *s; s++)
     785:	eb 14                	jmp    79b <strchr+0x22>
    if(*s == c)
     787:	8b 45 08             	mov    0x8(%ebp),%eax
     78a:	0f b6 00             	movzbl (%eax),%eax
     78d:	3a 45 fc             	cmp    -0x4(%ebp),%al
     790:	75 05                	jne    797 <strchr+0x1e>
      return (char*)s;
     792:	8b 45 08             	mov    0x8(%ebp),%eax
     795:	eb 13                	jmp    7aa <strchr+0x31>
}

char*
strchr(const char *s, char c)
{
  for(; *s; s++)
     797:	83 45 08 01          	addl   $0x1,0x8(%ebp)
     79b:	8b 45 08             	mov    0x8(%ebp),%eax
     79e:	0f b6 00             	movzbl (%eax),%eax
     7a1:	84 c0                	test   %al,%al
     7a3:	75 e2                	jne    787 <strchr+0xe>
    if(*s == c)
      return (char*)s;
  return 0;
     7a5:	b8 00 00 00 00       	mov    $0x0,%eax
}
     7aa:	c9                   	leave  
     7ab:	c3                   	ret    

000007ac <gets>:

char*
gets(char *buf, int max)
{
     7ac:	55                   	push   %ebp
     7ad:	89 e5                	mov    %esp,%ebp
     7af:	83 ec 28             	sub    $0x28,%esp
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     7b2:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
     7b9:	eb 4c                	jmp    807 <gets+0x5b>
    cc = read(0, &c, 1);
     7bb:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     7c2:	00 
     7c3:	8d 45 ef             	lea    -0x11(%ebp),%eax
     7c6:	89 44 24 04          	mov    %eax,0x4(%esp)
     7ca:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
     7d1:	e8 44 01 00 00       	call   91a <read>
     7d6:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if(cc < 1)
     7d9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     7dd:	7f 02                	jg     7e1 <gets+0x35>
      break;
     7df:	eb 31                	jmp    812 <gets+0x66>
    buf[i++] = c;
     7e1:	8b 45 f4             	mov    -0xc(%ebp),%eax
     7e4:	8d 50 01             	lea    0x1(%eax),%edx
     7e7:	89 55 f4             	mov    %edx,-0xc(%ebp)
     7ea:	89 c2                	mov    %eax,%edx
     7ec:	8b 45 08             	mov    0x8(%ebp),%eax
     7ef:	01 c2                	add    %eax,%edx
     7f1:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     7f5:	88 02                	mov    %al,(%edx)
    if(c == '\n' || c == '\r')
     7f7:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     7fb:	3c 0a                	cmp    $0xa,%al
     7fd:	74 13                	je     812 <gets+0x66>
     7ff:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
     803:	3c 0d                	cmp    $0xd,%al
     805:	74 0b                	je     812 <gets+0x66>
gets(char *buf, int max)
{
  int i, cc;
  char c;

  for(i=0; i+1 < max; ){
     807:	8b 45 f4             	mov    -0xc(%ebp),%eax
     80a:	83 c0 01             	add    $0x1,%eax
     80d:	3b 45 0c             	cmp    0xc(%ebp),%eax
     810:	7c a9                	jl     7bb <gets+0xf>
      break;
    buf[i++] = c;
    if(c == '\n' || c == '\r')
      break;
  }
  buf[i] = '\0';
     812:	8b 55 f4             	mov    -0xc(%ebp),%edx
     815:	8b 45 08             	mov    0x8(%ebp),%eax
     818:	01 d0                	add    %edx,%eax
     81a:	c6 00 00             	movb   $0x0,(%eax)
  return buf;
     81d:	8b 45 08             	mov    0x8(%ebp),%eax
}
     820:	c9                   	leave  
     821:	c3                   	ret    

00000822 <stat>:

int
stat(char *n, struct stat *st)
{
     822:	55                   	push   %ebp
     823:	89 e5                	mov    %esp,%ebp
     825:	83 ec 28             	sub    $0x28,%esp
  int fd;
  int r;

  fd = open(n, O_RDONLY);
     828:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     82f:	00 
     830:	8b 45 08             	mov    0x8(%ebp),%eax
     833:	89 04 24             	mov    %eax,(%esp)
     836:	e8 07 01 00 00       	call   942 <open>
     83b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(fd < 0)
     83e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     842:	79 07                	jns    84b <stat+0x29>
    return -1;
     844:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
     849:	eb 23                	jmp    86e <stat+0x4c>
  r = fstat(fd, st);
     84b:	8b 45 0c             	mov    0xc(%ebp),%eax
     84e:	89 44 24 04          	mov    %eax,0x4(%esp)
     852:	8b 45 f4             	mov    -0xc(%ebp),%eax
     855:	89 04 24             	mov    %eax,(%esp)
     858:	e8 fd 00 00 00       	call   95a <fstat>
     85d:	89 45 f0             	mov    %eax,-0x10(%ebp)
  close(fd);
     860:	8b 45 f4             	mov    -0xc(%ebp),%eax
     863:	89 04 24             	mov    %eax,(%esp)
     866:	e8 bf 00 00 00       	call   92a <close>
  return r;
     86b:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
     86e:	c9                   	leave  
     86f:	c3                   	ret    

00000870 <atoi>:

int
atoi(const char *s)
{
     870:	55                   	push   %ebp
     871:	89 e5                	mov    %esp,%ebp
     873:	83 ec 10             	sub    $0x10,%esp
  int n;

  n = 0;
     876:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  while('0' <= *s && *s <= '9')
     87d:	eb 25                	jmp    8a4 <atoi+0x34>
    n = n*10 + *s++ - '0';
     87f:	8b 55 fc             	mov    -0x4(%ebp),%edx
     882:	89 d0                	mov    %edx,%eax
     884:	c1 e0 02             	shl    $0x2,%eax
     887:	01 d0                	add    %edx,%eax
     889:	01 c0                	add    %eax,%eax
     88b:	89 c1                	mov    %eax,%ecx
     88d:	8b 45 08             	mov    0x8(%ebp),%eax
     890:	8d 50 01             	lea    0x1(%eax),%edx
     893:	89 55 08             	mov    %edx,0x8(%ebp)
     896:	0f b6 00             	movzbl (%eax),%eax
     899:	0f be c0             	movsbl %al,%eax
     89c:	01 c8                	add    %ecx,%eax
     89e:	83 e8 30             	sub    $0x30,%eax
     8a1:	89 45 fc             	mov    %eax,-0x4(%ebp)
atoi(const char *s)
{
  int n;

  n = 0;
  while('0' <= *s && *s <= '9')
     8a4:	8b 45 08             	mov    0x8(%ebp),%eax
     8a7:	0f b6 00             	movzbl (%eax),%eax
     8aa:	3c 2f                	cmp    $0x2f,%al
     8ac:	7e 0a                	jle    8b8 <atoi+0x48>
     8ae:	8b 45 08             	mov    0x8(%ebp),%eax
     8b1:	0f b6 00             	movzbl (%eax),%eax
     8b4:	3c 39                	cmp    $0x39,%al
     8b6:	7e c7                	jle    87f <atoi+0xf>
    n = n*10 + *s++ - '0';
  return n;
     8b8:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     8bb:	c9                   	leave  
     8bc:	c3                   	ret    

000008bd <memmove>:

void*
memmove(void *vdst, void *vsrc, int n)
{
     8bd:	55                   	push   %ebp
     8be:	89 e5                	mov    %esp,%ebp
     8c0:	83 ec 10             	sub    $0x10,%esp
  char *dst, *src;
  
  dst = vdst;
     8c3:	8b 45 08             	mov    0x8(%ebp),%eax
     8c6:	89 45 fc             	mov    %eax,-0x4(%ebp)
  src = vsrc;
     8c9:	8b 45 0c             	mov    0xc(%ebp),%eax
     8cc:	89 45 f8             	mov    %eax,-0x8(%ebp)
  while(n-- > 0)
     8cf:	eb 17                	jmp    8e8 <memmove+0x2b>
    *dst++ = *src++;
     8d1:	8b 45 fc             	mov    -0x4(%ebp),%eax
     8d4:	8d 50 01             	lea    0x1(%eax),%edx
     8d7:	89 55 fc             	mov    %edx,-0x4(%ebp)
     8da:	8b 55 f8             	mov    -0x8(%ebp),%edx
     8dd:	8d 4a 01             	lea    0x1(%edx),%ecx
     8e0:	89 4d f8             	mov    %ecx,-0x8(%ebp)
     8e3:	0f b6 12             	movzbl (%edx),%edx
     8e6:	88 10                	mov    %dl,(%eax)
{
  char *dst, *src;
  
  dst = vdst;
  src = vsrc;
  while(n-- > 0)
     8e8:	8b 45 10             	mov    0x10(%ebp),%eax
     8eb:	8d 50 ff             	lea    -0x1(%eax),%edx
     8ee:	89 55 10             	mov    %edx,0x10(%ebp)
     8f1:	85 c0                	test   %eax,%eax
     8f3:	7f dc                	jg     8d1 <memmove+0x14>
    *dst++ = *src++;
  return vdst;
     8f5:	8b 45 08             	mov    0x8(%ebp),%eax
}
     8f8:	c9                   	leave  
     8f9:	c3                   	ret    

000008fa <fork>:
  name: \
    movl $SYS_ ## name, %eax; \
    int $T_SYSCALL; \
    ret

SYSCALL(fork)
     8fa:	b8 01 00 00 00       	mov    $0x1,%eax
     8ff:	cd 40                	int    $0x40
     901:	c3                   	ret    

00000902 <exit>:
SYSCALL(exit)
     902:	b8 02 00 00 00       	mov    $0x2,%eax
     907:	cd 40                	int    $0x40
     909:	c3                   	ret    

0000090a <wait>:
SYSCALL(wait)
     90a:	b8 03 00 00 00       	mov    $0x3,%eax
     90f:	cd 40                	int    $0x40
     911:	c3                   	ret    

00000912 <pipe>:
SYSCALL(pipe)
     912:	b8 04 00 00 00       	mov    $0x4,%eax
     917:	cd 40                	int    $0x40
     919:	c3                   	ret    

0000091a <read>:
SYSCALL(read)
     91a:	b8 05 00 00 00       	mov    $0x5,%eax
     91f:	cd 40                	int    $0x40
     921:	c3                   	ret    

00000922 <write>:
SYSCALL(write)
     922:	b8 10 00 00 00       	mov    $0x10,%eax
     927:	cd 40                	int    $0x40
     929:	c3                   	ret    

0000092a <close>:
SYSCALL(close)
     92a:	b8 15 00 00 00       	mov    $0x15,%eax
     92f:	cd 40                	int    $0x40
     931:	c3                   	ret    

00000932 <kill>:
SYSCALL(kill)
     932:	b8 06 00 00 00       	mov    $0x6,%eax
     937:	cd 40                	int    $0x40
     939:	c3                   	ret    

0000093a <exec>:
SYSCALL(exec)
     93a:	b8 07 00 00 00       	mov    $0x7,%eax
     93f:	cd 40                	int    $0x40
     941:	c3                   	ret    

00000942 <open>:
SYSCALL(open)
     942:	b8 0f 00 00 00       	mov    $0xf,%eax
     947:	cd 40                	int    $0x40
     949:	c3                   	ret    

0000094a <mknod>:
SYSCALL(mknod)
     94a:	b8 11 00 00 00       	mov    $0x11,%eax
     94f:	cd 40                	int    $0x40
     951:	c3                   	ret    

00000952 <unlink>:
SYSCALL(unlink)
     952:	b8 12 00 00 00       	mov    $0x12,%eax
     957:	cd 40                	int    $0x40
     959:	c3                   	ret    

0000095a <fstat>:
SYSCALL(fstat)
     95a:	b8 08 00 00 00       	mov    $0x8,%eax
     95f:	cd 40                	int    $0x40
     961:	c3                   	ret    

00000962 <link>:
SYSCALL(link)
     962:	b8 13 00 00 00       	mov    $0x13,%eax
     967:	cd 40                	int    $0x40
     969:	c3                   	ret    

0000096a <mkdir>:
SYSCALL(mkdir)
     96a:	b8 14 00 00 00       	mov    $0x14,%eax
     96f:	cd 40                	int    $0x40
     971:	c3                   	ret    

00000972 <chdir>:
SYSCALL(chdir)
     972:	b8 09 00 00 00       	mov    $0x9,%eax
     977:	cd 40                	int    $0x40
     979:	c3                   	ret    

0000097a <dup>:
SYSCALL(dup)
     97a:	b8 0a 00 00 00       	mov    $0xa,%eax
     97f:	cd 40                	int    $0x40
     981:	c3                   	ret    

00000982 <getpid>:
SYSCALL(getpid)
     982:	b8 0b 00 00 00       	mov    $0xb,%eax
     987:	cd 40                	int    $0x40
     989:	c3                   	ret    

0000098a <sbrk>:
SYSCALL(sbrk)
     98a:	b8 0c 00 00 00       	mov    $0xc,%eax
     98f:	cd 40                	int    $0x40
     991:	c3                   	ret    

00000992 <sleep>:
SYSCALL(sleep)
     992:	b8 0d 00 00 00       	mov    $0xd,%eax
     997:	cd 40                	int    $0x40
     999:	c3                   	ret    

0000099a <uptime>:
SYSCALL(uptime)
     99a:	b8 0e 00 00 00       	mov    $0xe,%eax
     99f:	cd 40                	int    $0x40
     9a1:	c3                   	ret    

000009a2 <clone>:
SYSCALL(clone)
     9a2:	b8 16 00 00 00       	mov    $0x16,%eax
     9a7:	cd 40                	int    $0x40
     9a9:	c3                   	ret    

000009aa <texit>:
SYSCALL(texit)
     9aa:	b8 17 00 00 00       	mov    $0x17,%eax
     9af:	cd 40                	int    $0x40
     9b1:	c3                   	ret    

000009b2 <tsleep>:
SYSCALL(tsleep)
     9b2:	b8 18 00 00 00       	mov    $0x18,%eax
     9b7:	cd 40                	int    $0x40
     9b9:	c3                   	ret    

000009ba <twakeup>:
SYSCALL(twakeup)
     9ba:	b8 19 00 00 00       	mov    $0x19,%eax
     9bf:	cd 40                	int    $0x40
     9c1:	c3                   	ret    

000009c2 <test>:
SYSCALL(test)
     9c2:	b8 1a 00 00 00       	mov    $0x1a,%eax
     9c7:	cd 40                	int    $0x40
     9c9:	c3                   	ret    

000009ca <putc>:
#include "stat.h"
#include "user.h"

static void
putc(int fd, char c)
{
     9ca:	55                   	push   %ebp
     9cb:	89 e5                	mov    %esp,%ebp
     9cd:	83 ec 18             	sub    $0x18,%esp
     9d0:	8b 45 0c             	mov    0xc(%ebp),%eax
     9d3:	88 45 f4             	mov    %al,-0xc(%ebp)
  write(fd, &c, 1);
     9d6:	c7 44 24 08 01 00 00 	movl   $0x1,0x8(%esp)
     9dd:	00 
     9de:	8d 45 f4             	lea    -0xc(%ebp),%eax
     9e1:	89 44 24 04          	mov    %eax,0x4(%esp)
     9e5:	8b 45 08             	mov    0x8(%ebp),%eax
     9e8:	89 04 24             	mov    %eax,(%esp)
     9eb:	e8 32 ff ff ff       	call   922 <write>
}
     9f0:	c9                   	leave  
     9f1:	c3                   	ret    

000009f2 <printint>:

static void
printint(int fd, int xx, int base, int sgn)
{
     9f2:	55                   	push   %ebp
     9f3:	89 e5                	mov    %esp,%ebp
     9f5:	56                   	push   %esi
     9f6:	53                   	push   %ebx
     9f7:	83 ec 30             	sub    $0x30,%esp
  static char digits[] = "0123456789ABCDEF";
  char buf[16];
  int i, neg;
  uint x;

  neg = 0;
     9fa:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
  if(sgn && xx < 0){
     a01:	83 7d 14 00          	cmpl   $0x0,0x14(%ebp)
     a05:	74 17                	je     a1e <printint+0x2c>
     a07:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
     a0b:	79 11                	jns    a1e <printint+0x2c>
    neg = 1;
     a0d:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
    x = -xx;
     a14:	8b 45 0c             	mov    0xc(%ebp),%eax
     a17:	f7 d8                	neg    %eax
     a19:	89 45 ec             	mov    %eax,-0x14(%ebp)
     a1c:	eb 06                	jmp    a24 <printint+0x32>
  } else {
    x = xx;
     a1e:	8b 45 0c             	mov    0xc(%ebp),%eax
     a21:	89 45 ec             	mov    %eax,-0x14(%ebp)
  }

  i = 0;
     a24:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  do{
    buf[i++] = digits[x % base];
     a2b:	8b 4d f4             	mov    -0xc(%ebp),%ecx
     a2e:	8d 41 01             	lea    0x1(%ecx),%eax
     a31:	89 45 f4             	mov    %eax,-0xc(%ebp)
     a34:	8b 5d 10             	mov    0x10(%ebp),%ebx
     a37:	8b 45 ec             	mov    -0x14(%ebp),%eax
     a3a:	ba 00 00 00 00       	mov    $0x0,%edx
     a3f:	f7 f3                	div    %ebx
     a41:	89 d0                	mov    %edx,%eax
     a43:	0f b6 80 58 18 00 00 	movzbl 0x1858(%eax),%eax
     a4a:	88 44 0d dc          	mov    %al,-0x24(%ebp,%ecx,1)
  }while((x /= base) != 0);
     a4e:	8b 75 10             	mov    0x10(%ebp),%esi
     a51:	8b 45 ec             	mov    -0x14(%ebp),%eax
     a54:	ba 00 00 00 00       	mov    $0x0,%edx
     a59:	f7 f6                	div    %esi
     a5b:	89 45 ec             	mov    %eax,-0x14(%ebp)
     a5e:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     a62:	75 c7                	jne    a2b <printint+0x39>
  if(neg)
     a64:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     a68:	74 10                	je     a7a <printint+0x88>
    buf[i++] = '-';
     a6a:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a6d:	8d 50 01             	lea    0x1(%eax),%edx
     a70:	89 55 f4             	mov    %edx,-0xc(%ebp)
     a73:	c6 44 05 dc 2d       	movb   $0x2d,-0x24(%ebp,%eax,1)

  while(--i >= 0)
     a78:	eb 1f                	jmp    a99 <printint+0xa7>
     a7a:	eb 1d                	jmp    a99 <printint+0xa7>
    putc(fd, buf[i]);
     a7c:	8d 55 dc             	lea    -0x24(%ebp),%edx
     a7f:	8b 45 f4             	mov    -0xc(%ebp),%eax
     a82:	01 d0                	add    %edx,%eax
     a84:	0f b6 00             	movzbl (%eax),%eax
     a87:	0f be c0             	movsbl %al,%eax
     a8a:	89 44 24 04          	mov    %eax,0x4(%esp)
     a8e:	8b 45 08             	mov    0x8(%ebp),%eax
     a91:	89 04 24             	mov    %eax,(%esp)
     a94:	e8 31 ff ff ff       	call   9ca <putc>
    buf[i++] = digits[x % base];
  }while((x /= base) != 0);
  if(neg)
    buf[i++] = '-';

  while(--i >= 0)
     a99:	83 6d f4 01          	subl   $0x1,-0xc(%ebp)
     a9d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     aa1:	79 d9                	jns    a7c <printint+0x8a>
    putc(fd, buf[i]);
}
     aa3:	83 c4 30             	add    $0x30,%esp
     aa6:	5b                   	pop    %ebx
     aa7:	5e                   	pop    %esi
     aa8:	5d                   	pop    %ebp
     aa9:	c3                   	ret    

00000aaa <printf>:

// Print to the given fd. Only understands %d, %x, %p, %s.
void
printf(int fd, char *fmt, ...)
{
     aaa:	55                   	push   %ebp
     aab:	89 e5                	mov    %esp,%ebp
     aad:	83 ec 38             	sub    $0x38,%esp
  char *s;
  int c, i, state;
  uint *ap;

  state = 0;
     ab0:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  ap = (uint*)(void*)&fmt + 1;
     ab7:	8d 45 0c             	lea    0xc(%ebp),%eax
     aba:	83 c0 04             	add    $0x4,%eax
     abd:	89 45 e8             	mov    %eax,-0x18(%ebp)
  for(i = 0; fmt[i]; i++){
     ac0:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
     ac7:	e9 7c 01 00 00       	jmp    c48 <printf+0x19e>
    c = fmt[i] & 0xff;
     acc:	8b 55 0c             	mov    0xc(%ebp),%edx
     acf:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ad2:	01 d0                	add    %edx,%eax
     ad4:	0f b6 00             	movzbl (%eax),%eax
     ad7:	0f be c0             	movsbl %al,%eax
     ada:	25 ff 00 00 00       	and    $0xff,%eax
     adf:	89 45 e4             	mov    %eax,-0x1c(%ebp)
    if(state == 0){
     ae2:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     ae6:	75 2c                	jne    b14 <printf+0x6a>
      if(c == '%'){
     ae8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     aec:	75 0c                	jne    afa <printf+0x50>
        state = '%';
     aee:	c7 45 ec 25 00 00 00 	movl   $0x25,-0x14(%ebp)
     af5:	e9 4a 01 00 00       	jmp    c44 <printf+0x19a>
      } else {
        putc(fd, c);
     afa:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     afd:	0f be c0             	movsbl %al,%eax
     b00:	89 44 24 04          	mov    %eax,0x4(%esp)
     b04:	8b 45 08             	mov    0x8(%ebp),%eax
     b07:	89 04 24             	mov    %eax,(%esp)
     b0a:	e8 bb fe ff ff       	call   9ca <putc>
     b0f:	e9 30 01 00 00       	jmp    c44 <printf+0x19a>
      }
    } else if(state == '%'){
     b14:	83 7d ec 25          	cmpl   $0x25,-0x14(%ebp)
     b18:	0f 85 26 01 00 00    	jne    c44 <printf+0x19a>
      if(c == 'd'){
     b1e:	83 7d e4 64          	cmpl   $0x64,-0x1c(%ebp)
     b22:	75 2d                	jne    b51 <printf+0xa7>
        printint(fd, *ap, 10, 1);
     b24:	8b 45 e8             	mov    -0x18(%ebp),%eax
     b27:	8b 00                	mov    (%eax),%eax
     b29:	c7 44 24 0c 01 00 00 	movl   $0x1,0xc(%esp)
     b30:	00 
     b31:	c7 44 24 08 0a 00 00 	movl   $0xa,0x8(%esp)
     b38:	00 
     b39:	89 44 24 04          	mov    %eax,0x4(%esp)
     b3d:	8b 45 08             	mov    0x8(%ebp),%eax
     b40:	89 04 24             	mov    %eax,(%esp)
     b43:	e8 aa fe ff ff       	call   9f2 <printint>
        ap++;
     b48:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     b4c:	e9 ec 00 00 00       	jmp    c3d <printf+0x193>
      } else if(c == 'x' || c == 'p'){
     b51:	83 7d e4 78          	cmpl   $0x78,-0x1c(%ebp)
     b55:	74 06                	je     b5d <printf+0xb3>
     b57:	83 7d e4 70          	cmpl   $0x70,-0x1c(%ebp)
     b5b:	75 2d                	jne    b8a <printf+0xe0>
        printint(fd, *ap, 16, 0);
     b5d:	8b 45 e8             	mov    -0x18(%ebp),%eax
     b60:	8b 00                	mov    (%eax),%eax
     b62:	c7 44 24 0c 00 00 00 	movl   $0x0,0xc(%esp)
     b69:	00 
     b6a:	c7 44 24 08 10 00 00 	movl   $0x10,0x8(%esp)
     b71:	00 
     b72:	89 44 24 04          	mov    %eax,0x4(%esp)
     b76:	8b 45 08             	mov    0x8(%ebp),%eax
     b79:	89 04 24             	mov    %eax,(%esp)
     b7c:	e8 71 fe ff ff       	call   9f2 <printint>
        ap++;
     b81:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     b85:	e9 b3 00 00 00       	jmp    c3d <printf+0x193>
      } else if(c == 's'){
     b8a:	83 7d e4 73          	cmpl   $0x73,-0x1c(%ebp)
     b8e:	75 45                	jne    bd5 <printf+0x12b>
        s = (char*)*ap;
     b90:	8b 45 e8             	mov    -0x18(%ebp),%eax
     b93:	8b 00                	mov    (%eax),%eax
     b95:	89 45 f4             	mov    %eax,-0xc(%ebp)
        ap++;
     b98:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
        if(s == 0)
     b9c:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     ba0:	75 09                	jne    bab <printf+0x101>
          s = "(null)";
     ba2:	c7 45 f4 ab 13 00 00 	movl   $0x13ab,-0xc(%ebp)
        while(*s != 0){
     ba9:	eb 1e                	jmp    bc9 <printf+0x11f>
     bab:	eb 1c                	jmp    bc9 <printf+0x11f>
          putc(fd, *s);
     bad:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bb0:	0f b6 00             	movzbl (%eax),%eax
     bb3:	0f be c0             	movsbl %al,%eax
     bb6:	89 44 24 04          	mov    %eax,0x4(%esp)
     bba:	8b 45 08             	mov    0x8(%ebp),%eax
     bbd:	89 04 24             	mov    %eax,(%esp)
     bc0:	e8 05 fe ff ff       	call   9ca <putc>
          s++;
     bc5:	83 45 f4 01          	addl   $0x1,-0xc(%ebp)
      } else if(c == 's'){
        s = (char*)*ap;
        ap++;
        if(s == 0)
          s = "(null)";
        while(*s != 0){
     bc9:	8b 45 f4             	mov    -0xc(%ebp),%eax
     bcc:	0f b6 00             	movzbl (%eax),%eax
     bcf:	84 c0                	test   %al,%al
     bd1:	75 da                	jne    bad <printf+0x103>
     bd3:	eb 68                	jmp    c3d <printf+0x193>
          putc(fd, *s);
          s++;
        }
      } else if(c == 'c'){
     bd5:	83 7d e4 63          	cmpl   $0x63,-0x1c(%ebp)
     bd9:	75 1d                	jne    bf8 <printf+0x14e>
        putc(fd, *ap);
     bdb:	8b 45 e8             	mov    -0x18(%ebp),%eax
     bde:	8b 00                	mov    (%eax),%eax
     be0:	0f be c0             	movsbl %al,%eax
     be3:	89 44 24 04          	mov    %eax,0x4(%esp)
     be7:	8b 45 08             	mov    0x8(%ebp),%eax
     bea:	89 04 24             	mov    %eax,(%esp)
     bed:	e8 d8 fd ff ff       	call   9ca <putc>
        ap++;
     bf2:	83 45 e8 04          	addl   $0x4,-0x18(%ebp)
     bf6:	eb 45                	jmp    c3d <printf+0x193>
      } else if(c == '%'){
     bf8:	83 7d e4 25          	cmpl   $0x25,-0x1c(%ebp)
     bfc:	75 17                	jne    c15 <printf+0x16b>
        putc(fd, c);
     bfe:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c01:	0f be c0             	movsbl %al,%eax
     c04:	89 44 24 04          	mov    %eax,0x4(%esp)
     c08:	8b 45 08             	mov    0x8(%ebp),%eax
     c0b:	89 04 24             	mov    %eax,(%esp)
     c0e:	e8 b7 fd ff ff       	call   9ca <putc>
     c13:	eb 28                	jmp    c3d <printf+0x193>
      } else {
        // Unknown % sequence.  Print it to draw attention.
        putc(fd, '%');
     c15:	c7 44 24 04 25 00 00 	movl   $0x25,0x4(%esp)
     c1c:	00 
     c1d:	8b 45 08             	mov    0x8(%ebp),%eax
     c20:	89 04 24             	mov    %eax,(%esp)
     c23:	e8 a2 fd ff ff       	call   9ca <putc>
        putc(fd, c);
     c28:	8b 45 e4             	mov    -0x1c(%ebp),%eax
     c2b:	0f be c0             	movsbl %al,%eax
     c2e:	89 44 24 04          	mov    %eax,0x4(%esp)
     c32:	8b 45 08             	mov    0x8(%ebp),%eax
     c35:	89 04 24             	mov    %eax,(%esp)
     c38:	e8 8d fd ff ff       	call   9ca <putc>
      }
      state = 0;
     c3d:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  int c, i, state;
  uint *ap;

  state = 0;
  ap = (uint*)(void*)&fmt + 1;
  for(i = 0; fmt[i]; i++){
     c44:	83 45 f0 01          	addl   $0x1,-0x10(%ebp)
     c48:	8b 55 0c             	mov    0xc(%ebp),%edx
     c4b:	8b 45 f0             	mov    -0x10(%ebp),%eax
     c4e:	01 d0                	add    %edx,%eax
     c50:	0f b6 00             	movzbl (%eax),%eax
     c53:	84 c0                	test   %al,%al
     c55:	0f 85 71 fe ff ff    	jne    acc <printf+0x22>
        putc(fd, c);
      }
      state = 0;
    }
  }
}
     c5b:	c9                   	leave  
     c5c:	c3                   	ret    

00000c5d <free>:
static Header base;
static Header *freep;

void
free(void *ap)
{
     c5d:	55                   	push   %ebp
     c5e:	89 e5                	mov    %esp,%ebp
     c60:	83 ec 10             	sub    $0x10,%esp
  Header *bp, *p;

  bp = (Header*)ap - 1;
     c63:	8b 45 08             	mov    0x8(%ebp),%eax
     c66:	83 e8 08             	sub    $0x8,%eax
     c69:	89 45 f8             	mov    %eax,-0x8(%ebp)
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c6c:	a1 94 18 00 00       	mov    0x1894,%eax
     c71:	89 45 fc             	mov    %eax,-0x4(%ebp)
     c74:	eb 24                	jmp    c9a <free+0x3d>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
     c76:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c79:	8b 00                	mov    (%eax),%eax
     c7b:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     c7e:	77 12                	ja     c92 <free+0x35>
     c80:	8b 45 f8             	mov    -0x8(%ebp),%eax
     c83:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     c86:	77 24                	ja     cac <free+0x4f>
     c88:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c8b:	8b 00                	mov    (%eax),%eax
     c8d:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     c90:	77 1a                	ja     cac <free+0x4f>
free(void *ap)
{
  Header *bp, *p;

  bp = (Header*)ap - 1;
  for(p = freep; !(bp > p && bp < p->s.ptr); p = p->s.ptr)
     c92:	8b 45 fc             	mov    -0x4(%ebp),%eax
     c95:	8b 00                	mov    (%eax),%eax
     c97:	89 45 fc             	mov    %eax,-0x4(%ebp)
     c9a:	8b 45 f8             	mov    -0x8(%ebp),%eax
     c9d:	3b 45 fc             	cmp    -0x4(%ebp),%eax
     ca0:	76 d4                	jbe    c76 <free+0x19>
     ca2:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ca5:	8b 00                	mov    (%eax),%eax
     ca7:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     caa:	76 ca                	jbe    c76 <free+0x19>
    if(p >= p->s.ptr && (bp > p || bp < p->s.ptr))
      break;
  if(bp + bp->s.size == p->s.ptr){
     cac:	8b 45 f8             	mov    -0x8(%ebp),%eax
     caf:	8b 40 04             	mov    0x4(%eax),%eax
     cb2:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     cb9:	8b 45 f8             	mov    -0x8(%ebp),%eax
     cbc:	01 c2                	add    %eax,%edx
     cbe:	8b 45 fc             	mov    -0x4(%ebp),%eax
     cc1:	8b 00                	mov    (%eax),%eax
     cc3:	39 c2                	cmp    %eax,%edx
     cc5:	75 24                	jne    ceb <free+0x8e>
    bp->s.size += p->s.ptr->s.size;
     cc7:	8b 45 f8             	mov    -0x8(%ebp),%eax
     cca:	8b 50 04             	mov    0x4(%eax),%edx
     ccd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     cd0:	8b 00                	mov    (%eax),%eax
     cd2:	8b 40 04             	mov    0x4(%eax),%eax
     cd5:	01 c2                	add    %eax,%edx
     cd7:	8b 45 f8             	mov    -0x8(%ebp),%eax
     cda:	89 50 04             	mov    %edx,0x4(%eax)
    bp->s.ptr = p->s.ptr->s.ptr;
     cdd:	8b 45 fc             	mov    -0x4(%ebp),%eax
     ce0:	8b 00                	mov    (%eax),%eax
     ce2:	8b 10                	mov    (%eax),%edx
     ce4:	8b 45 f8             	mov    -0x8(%ebp),%eax
     ce7:	89 10                	mov    %edx,(%eax)
     ce9:	eb 0a                	jmp    cf5 <free+0x98>
  } else
    bp->s.ptr = p->s.ptr;
     ceb:	8b 45 fc             	mov    -0x4(%ebp),%eax
     cee:	8b 10                	mov    (%eax),%edx
     cf0:	8b 45 f8             	mov    -0x8(%ebp),%eax
     cf3:	89 10                	mov    %edx,(%eax)
  if(p + p->s.size == bp){
     cf5:	8b 45 fc             	mov    -0x4(%ebp),%eax
     cf8:	8b 40 04             	mov    0x4(%eax),%eax
     cfb:	8d 14 c5 00 00 00 00 	lea    0x0(,%eax,8),%edx
     d02:	8b 45 fc             	mov    -0x4(%ebp),%eax
     d05:	01 d0                	add    %edx,%eax
     d07:	3b 45 f8             	cmp    -0x8(%ebp),%eax
     d0a:	75 20                	jne    d2c <free+0xcf>
    p->s.size += bp->s.size;
     d0c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     d0f:	8b 50 04             	mov    0x4(%eax),%edx
     d12:	8b 45 f8             	mov    -0x8(%ebp),%eax
     d15:	8b 40 04             	mov    0x4(%eax),%eax
     d18:	01 c2                	add    %eax,%edx
     d1a:	8b 45 fc             	mov    -0x4(%ebp),%eax
     d1d:	89 50 04             	mov    %edx,0x4(%eax)
    p->s.ptr = bp->s.ptr;
     d20:	8b 45 f8             	mov    -0x8(%ebp),%eax
     d23:	8b 10                	mov    (%eax),%edx
     d25:	8b 45 fc             	mov    -0x4(%ebp),%eax
     d28:	89 10                	mov    %edx,(%eax)
     d2a:	eb 08                	jmp    d34 <free+0xd7>
  } else
    p->s.ptr = bp;
     d2c:	8b 45 fc             	mov    -0x4(%ebp),%eax
     d2f:	8b 55 f8             	mov    -0x8(%ebp),%edx
     d32:	89 10                	mov    %edx,(%eax)
  freep = p;
     d34:	8b 45 fc             	mov    -0x4(%ebp),%eax
     d37:	a3 94 18 00 00       	mov    %eax,0x1894
}
     d3c:	c9                   	leave  
     d3d:	c3                   	ret    

00000d3e <morecore>:

static Header*
morecore(uint nu)
{
     d3e:	55                   	push   %ebp
     d3f:	89 e5                	mov    %esp,%ebp
     d41:	83 ec 28             	sub    $0x28,%esp
  char *p;
  Header *hp;

  if(nu < 4096)
     d44:	81 7d 08 ff 0f 00 00 	cmpl   $0xfff,0x8(%ebp)
     d4b:	77 07                	ja     d54 <morecore+0x16>
    nu = 4096;
     d4d:	c7 45 08 00 10 00 00 	movl   $0x1000,0x8(%ebp)
  p = sbrk(nu * sizeof(Header));
     d54:	8b 45 08             	mov    0x8(%ebp),%eax
     d57:	c1 e0 03             	shl    $0x3,%eax
     d5a:	89 04 24             	mov    %eax,(%esp)
     d5d:	e8 28 fc ff ff       	call   98a <sbrk>
     d62:	89 45 f4             	mov    %eax,-0xc(%ebp)
  if(p == (char*)-1)
     d65:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
     d69:	75 07                	jne    d72 <morecore+0x34>
    return 0;
     d6b:	b8 00 00 00 00       	mov    $0x0,%eax
     d70:	eb 22                	jmp    d94 <morecore+0x56>
  hp = (Header*)p;
     d72:	8b 45 f4             	mov    -0xc(%ebp),%eax
     d75:	89 45 f0             	mov    %eax,-0x10(%ebp)
  hp->s.size = nu;
     d78:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d7b:	8b 55 08             	mov    0x8(%ebp),%edx
     d7e:	89 50 04             	mov    %edx,0x4(%eax)
  free((void*)(hp + 1));
     d81:	8b 45 f0             	mov    -0x10(%ebp),%eax
     d84:	83 c0 08             	add    $0x8,%eax
     d87:	89 04 24             	mov    %eax,(%esp)
     d8a:	e8 ce fe ff ff       	call   c5d <free>
  return freep;
     d8f:	a1 94 18 00 00       	mov    0x1894,%eax
}
     d94:	c9                   	leave  
     d95:	c3                   	ret    

00000d96 <malloc>:

void*
malloc(uint nbytes)
{
     d96:	55                   	push   %ebp
     d97:	89 e5                	mov    %esp,%ebp
     d99:	83 ec 28             	sub    $0x28,%esp
  Header *p, *prevp;
  uint nunits;

  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
     d9c:	8b 45 08             	mov    0x8(%ebp),%eax
     d9f:	83 c0 07             	add    $0x7,%eax
     da2:	c1 e8 03             	shr    $0x3,%eax
     da5:	83 c0 01             	add    $0x1,%eax
     da8:	89 45 ec             	mov    %eax,-0x14(%ebp)
  if((prevp = freep) == 0){
     dab:	a1 94 18 00 00       	mov    0x1894,%eax
     db0:	89 45 f0             	mov    %eax,-0x10(%ebp)
     db3:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
     db7:	75 23                	jne    ddc <malloc+0x46>
    base.s.ptr = freep = prevp = &base;
     db9:	c7 45 f0 8c 18 00 00 	movl   $0x188c,-0x10(%ebp)
     dc0:	8b 45 f0             	mov    -0x10(%ebp),%eax
     dc3:	a3 94 18 00 00       	mov    %eax,0x1894
     dc8:	a1 94 18 00 00       	mov    0x1894,%eax
     dcd:	a3 8c 18 00 00       	mov    %eax,0x188c
    base.s.size = 0;
     dd2:	c7 05 90 18 00 00 00 	movl   $0x0,0x1890
     dd9:	00 00 00 
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     ddc:	8b 45 f0             	mov    -0x10(%ebp),%eax
     ddf:	8b 00                	mov    (%eax),%eax
     de1:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if(p->s.size >= nunits){
     de4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     de7:	8b 40 04             	mov    0x4(%eax),%eax
     dea:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     ded:	72 4d                	jb     e3c <malloc+0xa6>
      if(p->s.size == nunits)
     def:	8b 45 f4             	mov    -0xc(%ebp),%eax
     df2:	8b 40 04             	mov    0x4(%eax),%eax
     df5:	3b 45 ec             	cmp    -0x14(%ebp),%eax
     df8:	75 0c                	jne    e06 <malloc+0x70>
        prevp->s.ptr = p->s.ptr;
     dfa:	8b 45 f4             	mov    -0xc(%ebp),%eax
     dfd:	8b 10                	mov    (%eax),%edx
     dff:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e02:	89 10                	mov    %edx,(%eax)
     e04:	eb 26                	jmp    e2c <malloc+0x96>
      else {
        p->s.size -= nunits;
     e06:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e09:	8b 40 04             	mov    0x4(%eax),%eax
     e0c:	2b 45 ec             	sub    -0x14(%ebp),%eax
     e0f:	89 c2                	mov    %eax,%edx
     e11:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e14:	89 50 04             	mov    %edx,0x4(%eax)
        p += p->s.size;
     e17:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e1a:	8b 40 04             	mov    0x4(%eax),%eax
     e1d:	c1 e0 03             	shl    $0x3,%eax
     e20:	01 45 f4             	add    %eax,-0xc(%ebp)
        p->s.size = nunits;
     e23:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e26:	8b 55 ec             	mov    -0x14(%ebp),%edx
     e29:	89 50 04             	mov    %edx,0x4(%eax)
      }
      freep = prevp;
     e2c:	8b 45 f0             	mov    -0x10(%ebp),%eax
     e2f:	a3 94 18 00 00       	mov    %eax,0x1894
      return (void*)(p + 1);
     e34:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e37:	83 c0 08             	add    $0x8,%eax
     e3a:	eb 38                	jmp    e74 <malloc+0xde>
    }
    if(p == freep)
     e3c:	a1 94 18 00 00       	mov    0x1894,%eax
     e41:	39 45 f4             	cmp    %eax,-0xc(%ebp)
     e44:	75 1b                	jne    e61 <malloc+0xcb>
      if((p = morecore(nunits)) == 0)
     e46:	8b 45 ec             	mov    -0x14(%ebp),%eax
     e49:	89 04 24             	mov    %eax,(%esp)
     e4c:	e8 ed fe ff ff       	call   d3e <morecore>
     e51:	89 45 f4             	mov    %eax,-0xc(%ebp)
     e54:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     e58:	75 07                	jne    e61 <malloc+0xcb>
        return 0;
     e5a:	b8 00 00 00 00       	mov    $0x0,%eax
     e5f:	eb 13                	jmp    e74 <malloc+0xde>
  nunits = (nbytes + sizeof(Header) - 1)/sizeof(Header) + 1;
  if((prevp = freep) == 0){
    base.s.ptr = freep = prevp = &base;
    base.s.size = 0;
  }
  for(p = prevp->s.ptr; ; prevp = p, p = p->s.ptr){
     e61:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e64:	89 45 f0             	mov    %eax,-0x10(%ebp)
     e67:	8b 45 f4             	mov    -0xc(%ebp),%eax
     e6a:	8b 00                	mov    (%eax),%eax
     e6c:	89 45 f4             	mov    %eax,-0xc(%ebp)
      return (void*)(p + 1);
    }
    if(p == freep)
      if((p = morecore(nunits)) == 0)
        return 0;
  }
     e6f:	e9 70 ff ff ff       	jmp    de4 <malloc+0x4e>
}
     e74:	c9                   	leave  
     e75:	c3                   	ret    

00000e76 <xchg>:
  asm volatile("sti");
}

static inline uint
xchg(volatile uint *addr, uint newval)
{
     e76:	55                   	push   %ebp
     e77:	89 e5                	mov    %esp,%ebp
     e79:	83 ec 10             	sub    $0x10,%esp
  uint result;
  
  // The + in "+m" denotes a read-modify-write operand.
  asm volatile("lock; xchgl %0, %1" :
     e7c:	8b 55 08             	mov    0x8(%ebp),%edx
     e7f:	8b 45 0c             	mov    0xc(%ebp),%eax
     e82:	8b 4d 08             	mov    0x8(%ebp),%ecx
     e85:	f0 87 02             	lock xchg %eax,(%edx)
     e88:	89 45 fc             	mov    %eax,-0x4(%ebp)
               "+m" (*addr), "=a" (result) :
               "1" (newval) :
               "cc");
  return result;
     e8b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
     e8e:	c9                   	leave  
     e8f:	c3                   	ret    

00000e90 <lock_init>:
#include "mmu.h"
#include "spinlock.h"
#include "x86.h"
#include "proc.h"

void lock_init(lock_t *lock){
     e90:	55                   	push   %ebp
     e91:	89 e5                	mov    %esp,%ebp
    lock->locked = 0;
     e93:	8b 45 08             	mov    0x8(%ebp),%eax
     e96:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
}
     e9c:	5d                   	pop    %ebp
     e9d:	c3                   	ret    

00000e9e <lock_acquire>:
void lock_acquire(lock_t *lock){
     e9e:	55                   	push   %ebp
     e9f:	89 e5                	mov    %esp,%ebp
     ea1:	83 ec 08             	sub    $0x8,%esp
    while(xchg(&lock->locked,1) != 0);
     ea4:	90                   	nop
     ea5:	8b 45 08             	mov    0x8(%ebp),%eax
     ea8:	c7 44 24 04 01 00 00 	movl   $0x1,0x4(%esp)
     eaf:	00 
     eb0:	89 04 24             	mov    %eax,(%esp)
     eb3:	e8 be ff ff ff       	call   e76 <xchg>
     eb8:	85 c0                	test   %eax,%eax
     eba:	75 e9                	jne    ea5 <lock_acquire+0x7>
}
     ebc:	c9                   	leave  
     ebd:	c3                   	ret    

00000ebe <lock_release>:
void lock_release(lock_t *lock){
     ebe:	55                   	push   %ebp
     ebf:	89 e5                	mov    %esp,%ebp
     ec1:	83 ec 08             	sub    $0x8,%esp
    xchg(&lock->locked,0);
     ec4:	8b 45 08             	mov    0x8(%ebp),%eax
     ec7:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
     ece:	00 
     ecf:	89 04 24             	mov    %eax,(%esp)
     ed2:	e8 9f ff ff ff       	call   e76 <xchg>
}
     ed7:	c9                   	leave  
     ed8:	c3                   	ret    

00000ed9 <thread_create>:


void *thread_create(void(*start_routine)(void*), void *arg){
     ed9:	55                   	push   %ebp
     eda:	89 e5                	mov    %esp,%ebp
     edc:	83 ec 28             	sub    $0x28,%esp
    int tid;
    void * stack = malloc(2 * 4096);
     edf:	c7 04 24 00 20 00 00 	movl   $0x2000,(%esp)
     ee6:	e8 ab fe ff ff       	call   d96 <malloc>
     eeb:	89 45 f4             	mov    %eax,-0xc(%ebp)
    void *garbage_stack = stack; 
     eee:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ef1:	89 45 f0             	mov    %eax,-0x10(%ebp)
   // printf(1,"start routine addr : %d\n",(uint)start_routine);


    if((uint)stack % 4096){
     ef4:	8b 45 f4             	mov    -0xc(%ebp),%eax
     ef7:	25 ff 0f 00 00       	and    $0xfff,%eax
     efc:	85 c0                	test   %eax,%eax
     efe:	74 14                	je     f14 <thread_create+0x3b>
        stack = stack + (4096 - (uint)stack % 4096);
     f00:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f03:	25 ff 0f 00 00       	and    $0xfff,%eax
     f08:	89 c2                	mov    %eax,%edx
     f0a:	b8 00 10 00 00       	mov    $0x1000,%eax
     f0f:	29 d0                	sub    %edx,%eax
     f11:	01 45 f4             	add    %eax,-0xc(%ebp)
    }
    if (stack == 0){
     f14:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
     f18:	75 1b                	jne    f35 <thread_create+0x5c>

        printf(1,"malloc fail \n");
     f1a:	c7 44 24 04 b2 13 00 	movl   $0x13b2,0x4(%esp)
     f21:	00 
     f22:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f29:	e8 7c fb ff ff       	call   aaa <printf>
        return 0;
     f2e:	b8 00 00 00 00       	mov    $0x0,%eax
     f33:	eb 6f                	jmp    fa4 <thread_create+0xcb>
    }

    tid = clone((uint)stack,PSIZE,(uint)start_routine,(int)arg);
     f35:	8b 4d 0c             	mov    0xc(%ebp),%ecx
     f38:	8b 55 08             	mov    0x8(%ebp),%edx
     f3b:	8b 45 f4             	mov    -0xc(%ebp),%eax
     f3e:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
     f42:	89 54 24 08          	mov    %edx,0x8(%esp)
     f46:	c7 44 24 04 00 10 00 	movl   $0x1000,0x4(%esp)
     f4d:	00 
     f4e:	89 04 24             	mov    %eax,(%esp)
     f51:	e8 4c fa ff ff       	call   9a2 <clone>
     f56:	89 45 ec             	mov    %eax,-0x14(%ebp)
    if(tid < 0){
     f59:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     f5d:	79 1b                	jns    f7a <thread_create+0xa1>
        printf(1,"clone fails\n");
     f5f:	c7 44 24 04 c0 13 00 	movl   $0x13c0,0x4(%esp)
     f66:	00 
     f67:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f6e:	e8 37 fb ff ff       	call   aaa <printf>
        return 0;
     f73:	b8 00 00 00 00       	mov    $0x0,%eax
     f78:	eb 2a                	jmp    fa4 <thread_create+0xcb>
    }
    if(tid > 0){
     f7a:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     f7e:	7e 05                	jle    f85 <thread_create+0xac>
        //store threads on thread table
        return garbage_stack;
     f80:	8b 45 f0             	mov    -0x10(%ebp),%eax
     f83:	eb 1f                	jmp    fa4 <thread_create+0xcb>
    }
    if(tid == 0){
     f85:	83 7d ec 00          	cmpl   $0x0,-0x14(%ebp)
     f89:	75 14                	jne    f9f <thread_create+0xc6>
        printf(1,"tid = 0 return \n");
     f8b:	c7 44 24 04 cd 13 00 	movl   $0x13cd,0x4(%esp)
     f92:	00 
     f93:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
     f9a:	e8 0b fb ff ff       	call   aaa <printf>
    }
//    wait();
//    free(garbage_stack);

    return 0;
     f9f:	b8 00 00 00 00       	mov    $0x0,%eax
}
     fa4:	c9                   	leave  
     fa5:	c3                   	ret    

00000fa6 <random>:

unsigned long rands = 1;
// generate 0 -> max random number exclude max.
int random(int max){
     fa6:	55                   	push   %ebp
     fa7:	89 e5                	mov    %esp,%ebp
    rands = rands * 1664525 + 1013904233;
     fa9:	a1 6c 18 00 00       	mov    0x186c,%eax
     fae:	69 c0 0d 66 19 00    	imul   $0x19660d,%eax,%eax
     fb4:	05 69 f3 6e 3c       	add    $0x3c6ef369,%eax
     fb9:	a3 6c 18 00 00       	mov    %eax,0x186c
    return (int)(rands % max);
     fbe:	a1 6c 18 00 00       	mov    0x186c,%eax
     fc3:	8b 4d 08             	mov    0x8(%ebp),%ecx
     fc6:	ba 00 00 00 00       	mov    $0x0,%edx
     fcb:	f7 f1                	div    %ecx
     fcd:	89 d0                	mov    %edx,%eax
     fcf:	5d                   	pop    %ebp
     fd0:	c3                   	ret    

00000fd1 <init_q>:
#include "queue.h"
#include "types.h"
#include "user.h"

void init_q(struct queue *q){
     fd1:	55                   	push   %ebp
     fd2:	89 e5                	mov    %esp,%ebp
    q->size = 0;
     fd4:	8b 45 08             	mov    0x8(%ebp),%eax
     fd7:	c7 00 00 00 00 00    	movl   $0x0,(%eax)
    q->head = 0;
     fdd:	8b 45 08             	mov    0x8(%ebp),%eax
     fe0:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    q->tail = 0;
     fe7:	8b 45 08             	mov    0x8(%ebp),%eax
     fea:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
}
     ff1:	5d                   	pop    %ebp
     ff2:	c3                   	ret    

00000ff3 <add_q>:

void add_q(struct queue *q, int v){
     ff3:	55                   	push   %ebp
     ff4:	89 e5                	mov    %esp,%ebp
     ff6:	83 ec 28             	sub    $0x28,%esp
    struct node * n = malloc(sizeof(struct node));
     ff9:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
    1000:	e8 91 fd ff ff       	call   d96 <malloc>
    1005:	89 45 f4             	mov    %eax,-0xc(%ebp)
    n->next = 0;
    1008:	8b 45 f4             	mov    -0xc(%ebp),%eax
    100b:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    n->value = v;
    1012:	8b 45 f4             	mov    -0xc(%ebp),%eax
    1015:	8b 55 0c             	mov    0xc(%ebp),%edx
    1018:	89 10                	mov    %edx,(%eax)
    if(q->head == 0){
    101a:	8b 45 08             	mov    0x8(%ebp),%eax
    101d:	8b 40 04             	mov    0x4(%eax),%eax
    1020:	85 c0                	test   %eax,%eax
    1022:	75 0b                	jne    102f <add_q+0x3c>
        q->head = n;
    1024:	8b 45 08             	mov    0x8(%ebp),%eax
    1027:	8b 55 f4             	mov    -0xc(%ebp),%edx
    102a:	89 50 04             	mov    %edx,0x4(%eax)
    102d:	eb 0c                	jmp    103b <add_q+0x48>
    }else{
        q->tail->next = n;
    102f:	8b 45 08             	mov    0x8(%ebp),%eax
    1032:	8b 40 08             	mov    0x8(%eax),%eax
    1035:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1038:	89 50 04             	mov    %edx,0x4(%eax)
    }
    q->tail = n;
    103b:	8b 45 08             	mov    0x8(%ebp),%eax
    103e:	8b 55 f4             	mov    -0xc(%ebp),%edx
    1041:	89 50 08             	mov    %edx,0x8(%eax)
    q->size++;
    1044:	8b 45 08             	mov    0x8(%ebp),%eax
    1047:	8b 00                	mov    (%eax),%eax
    1049:	8d 50 01             	lea    0x1(%eax),%edx
    104c:	8b 45 08             	mov    0x8(%ebp),%eax
    104f:	89 10                	mov    %edx,(%eax)
}
    1051:	c9                   	leave  
    1052:	c3                   	ret    

00001053 <empty_q>:

int empty_q(struct queue *q){
    1053:	55                   	push   %ebp
    1054:	89 e5                	mov    %esp,%ebp
    if(q->size == 0)
    1056:	8b 45 08             	mov    0x8(%ebp),%eax
    1059:	8b 00                	mov    (%eax),%eax
    105b:	85 c0                	test   %eax,%eax
    105d:	75 07                	jne    1066 <empty_q+0x13>
        return 1;
    105f:	b8 01 00 00 00       	mov    $0x1,%eax
    1064:	eb 05                	jmp    106b <empty_q+0x18>
    else
        return 0;
    1066:	b8 00 00 00 00       	mov    $0x0,%eax
} 
    106b:	5d                   	pop    %ebp
    106c:	c3                   	ret    

0000106d <pop_q>:
int pop_q(struct queue *q){
    106d:	55                   	push   %ebp
    106e:	89 e5                	mov    %esp,%ebp
    1070:	83 ec 28             	sub    $0x28,%esp
    int val;
    struct node *destroy;
    if(!empty_q(q)){
    1073:	8b 45 08             	mov    0x8(%ebp),%eax
    1076:	89 04 24             	mov    %eax,(%esp)
    1079:	e8 d5 ff ff ff       	call   1053 <empty_q>
    107e:	85 c0                	test   %eax,%eax
    1080:	75 5d                	jne    10df <pop_q+0x72>
       val = q->head->value; 
    1082:	8b 45 08             	mov    0x8(%ebp),%eax
    1085:	8b 40 04             	mov    0x4(%eax),%eax
    1088:	8b 00                	mov    (%eax),%eax
    108a:	89 45 f4             	mov    %eax,-0xc(%ebp)
       destroy = q->head;
    108d:	8b 45 08             	mov    0x8(%ebp),%eax
    1090:	8b 40 04             	mov    0x4(%eax),%eax
    1093:	89 45 f0             	mov    %eax,-0x10(%ebp)
       q->head = q->head->next;
    1096:	8b 45 08             	mov    0x8(%ebp),%eax
    1099:	8b 40 04             	mov    0x4(%eax),%eax
    109c:	8b 50 04             	mov    0x4(%eax),%edx
    109f:	8b 45 08             	mov    0x8(%ebp),%eax
    10a2:	89 50 04             	mov    %edx,0x4(%eax)
       free(destroy);
    10a5:	8b 45 f0             	mov    -0x10(%ebp),%eax
    10a8:	89 04 24             	mov    %eax,(%esp)
    10ab:	e8 ad fb ff ff       	call   c5d <free>
       q->size--;
    10b0:	8b 45 08             	mov    0x8(%ebp),%eax
    10b3:	8b 00                	mov    (%eax),%eax
    10b5:	8d 50 ff             	lea    -0x1(%eax),%edx
    10b8:	8b 45 08             	mov    0x8(%ebp),%eax
    10bb:	89 10                	mov    %edx,(%eax)
       if(q->size == 0){
    10bd:	8b 45 08             	mov    0x8(%ebp),%eax
    10c0:	8b 00                	mov    (%eax),%eax
    10c2:	85 c0                	test   %eax,%eax
    10c4:	75 14                	jne    10da <pop_q+0x6d>
            q->head = 0;
    10c6:	8b 45 08             	mov    0x8(%ebp),%eax
    10c9:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
            q->tail = 0;
    10d0:	8b 45 08             	mov    0x8(%ebp),%eax
    10d3:	c7 40 08 00 00 00 00 	movl   $0x0,0x8(%eax)
       }
       return val;
    10da:	8b 45 f4             	mov    -0xc(%ebp),%eax
    10dd:	eb 05                	jmp    10e4 <pop_q+0x77>
    }
    return -1;
    10df:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
}
    10e4:	c9                   	leave  
    10e5:	c3                   	ret    

000010e6 <sem_init>:
#include "types.h"
#include "user.h"
#include "semaphore.h"

void 
sem_init(struct semaphore *s, int size){
    10e6:	55                   	push   %ebp
    10e7:	89 e5                	mov    %esp,%ebp
    10e9:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
    10ec:	8b 45 08             	mov    0x8(%ebp),%eax
    10ef:	8b 55 0c             	mov    0xc(%ebp),%edx
    10f2:	89 50 08             	mov    %edx,0x8(%eax)
	s->count = size;
    10f5:	8b 45 08             	mov    0x8(%ebp),%eax
    10f8:	8b 55 0c             	mov    0xc(%ebp),%edx
    10fb:	89 50 04             	mov    %edx,0x4(%eax)
	lock_init(&s->lock);
    10fe:	8b 45 08             	mov    0x8(%ebp),%eax
    1101:	89 04 24             	mov    %eax,(%esp)
    1104:	e8 87 fd ff ff       	call   e90 <lock_init>
}
    1109:	c9                   	leave  
    110a:	c3                   	ret    

0000110b <sem_init_full>:

void 
sem_init_full(struct semaphore *s, int size){
    110b:	55                   	push   %ebp
    110c:	89 e5                	mov    %esp,%ebp
    110e:	83 ec 18             	sub    $0x18,%esp
	s->size = size;
    1111:	8b 45 08             	mov    0x8(%ebp),%eax
    1114:	8b 55 0c             	mov    0xc(%ebp),%edx
    1117:	89 50 08             	mov    %edx,0x8(%eax)
	s->count= 0;
    111a:	8b 45 08             	mov    0x8(%ebp),%eax
    111d:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	lock_init(&s->lock);
    1124:	8b 45 08             	mov    0x8(%ebp),%eax
    1127:	89 04 24             	mov    %eax,(%esp)
    112a:	e8 61 fd ff ff       	call   e90 <lock_init>
}
    112f:	c9                   	leave  
    1130:	c3                   	ret    

00001131 <sem_aquire>:
//Attempts to aquire a lock. If count is not
//full then we will add the process to the list of
//processes holding the lock.

void
sem_aquire(struct semaphore * s){
    1131:	55                   	push   %ebp
    1132:	89 e5                	mov    %esp,%ebp
    1134:	83 ec 28             	sub    $0x28,%esp
	//Disable interrupts? nah
	//We need to only get a hold of waiters?
	//If count is full then place proccess on waiters list
	//Else add to the holding list
	lock_acquire(&s->lock);
    1137:	8b 45 08             	mov    0x8(%ebp),%eax
    113a:	89 04 24             	mov    %eax,(%esp)
    113d:	e8 5c fd ff ff       	call   e9e <lock_acquire>
	if(s->count  == 0){
    1142:	8b 45 08             	mov    0x8(%ebp),%eax
    1145:	8b 40 04             	mov    0x4(%eax),%eax
    1148:	85 c0                	test   %eax,%eax
    114a:	75 2f                	jne    117b <sem_aquire+0x4a>
  		//printf(1, "Sem F\n");
		//add proc to waiters list
		int tid = getpid();
    114c:	e8 31 f8 ff ff       	call   982 <getpid>
    1151:	89 45 f4             	mov    %eax,-0xc(%ebp)
		//place requesting process to sleep
		add_q(&s->waiters, tid); //Add process to queue
    1154:	8b 45 08             	mov    0x8(%ebp),%eax
    1157:	8d 50 0c             	lea    0xc(%eax),%edx
    115a:	8b 45 f4             	mov    -0xc(%ebp),%eax
    115d:	89 44 24 04          	mov    %eax,0x4(%esp)
    1161:	89 14 24             	mov    %edx,(%esp)
    1164:	e8 8a fe ff ff       	call   ff3 <add_q>
		//printf(1, "		Added to waiters semaphore with size: %d\n", s->size);
		lock_release(&s->lock);
    1169:	8b 45 08             	mov    0x8(%ebp),%eax
    116c:	89 04 24             	mov    %eax,(%esp)
    116f:	e8 4a fd ff ff       	call   ebe <lock_release>
		tsleep(); 
    1174:	e8 39 f8 ff ff       	call   9b2 <tsleep>
    1179:	eb 1a                	jmp    1195 <sem_aquire+0x64>
	}
	else{
  		//printf(1, "Sem A\n");
		s->count--;	
    117b:	8b 45 08             	mov    0x8(%ebp),%eax
    117e:	8b 40 04             	mov    0x4(%eax),%eax
    1181:	8d 50 ff             	lea    -0x1(%eax),%edx
    1184:	8b 45 08             	mov    0x8(%ebp),%eax
    1187:	89 50 04             	mov    %edx,0x4(%eax)
		lock_release(&s->lock);
    118a:	8b 45 08             	mov    0x8(%ebp),%eax
    118d:	89 04 24             	mov    %eax,(%esp)
    1190:	e8 29 fd ff ff       	call   ebe <lock_release>
	}
}
    1195:	c9                   	leave  
    1196:	c3                   	ret    

00001197 <sem_signal>:

//Removes a process from a lock and decreases count
//to indicate that more process can hold the lock.
void
sem_signal(struct semaphore * s){
    1197:	55                   	push   %ebp
    1198:	89 e5                	mov    %esp,%ebp
    119a:	83 ec 28             	sub    $0x28,%esp
	//printf(1, "Sem R\n");
	//If count is full then place proccess on waiters list
	lock_acquire(&s->lock);
    119d:	8b 45 08             	mov    0x8(%ebp),%eax
    11a0:	89 04 24             	mov    %eax,(%esp)
    11a3:	e8 f6 fc ff ff       	call   e9e <lock_acquire>
	if(s->count < s->size){
    11a8:	8b 45 08             	mov    0x8(%ebp),%eax
    11ab:	8b 50 04             	mov    0x4(%eax),%edx
    11ae:	8b 45 08             	mov    0x8(%ebp),%eax
    11b1:	8b 40 08             	mov    0x8(%eax),%eax
    11b4:	39 c2                	cmp    %eax,%edx
    11b6:	7d 0f                	jge    11c7 <sem_signal+0x30>
		s->count++;	
    11b8:	8b 45 08             	mov    0x8(%ebp),%eax
    11bb:	8b 40 04             	mov    0x4(%eax),%eax
    11be:	8d 50 01             	lea    0x1(%eax),%edx
    11c1:	8b 45 08             	mov    0x8(%ebp),%eax
    11c4:	89 50 04             	mov    %edx,0x4(%eax)
	}

	int tid;
	tid = pop_q(&s->waiters);
    11c7:	8b 45 08             	mov    0x8(%ebp),%eax
    11ca:	83 c0 0c             	add    $0xc,%eax
    11cd:	89 04 24             	mov    %eax,(%esp)
    11d0:	e8 98 fe ff ff       	call   106d <pop_q>
    11d5:	89 45 f4             	mov    %eax,-0xc(%ebp)
	if(tid != -1){
    11d8:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
    11dc:	74 2e                	je     120c <sem_signal+0x75>
		//printf(1, "Sem A\n");
		twakeup(tid);
    11de:	8b 45 f4             	mov    -0xc(%ebp),%eax
    11e1:	89 04 24             	mov    %eax,(%esp)
    11e4:	e8 d1 f7 ff ff       	call   9ba <twakeup>
		s->count--;
    11e9:	8b 45 08             	mov    0x8(%ebp),%eax
    11ec:	8b 40 04             	mov    0x4(%eax),%eax
    11ef:	8d 50 ff             	lea    -0x1(%eax),%edx
    11f2:	8b 45 08             	mov    0x8(%ebp),%eax
    11f5:	89 50 04             	mov    %edx,0x4(%eax)
		if(s->count < 0) s->count = 0;
    11f8:	8b 45 08             	mov    0x8(%ebp),%eax
    11fb:	8b 40 04             	mov    0x4(%eax),%eax
    11fe:	85 c0                	test   %eax,%eax
    1200:	79 0a                	jns    120c <sem_signal+0x75>
    1202:	8b 45 08             	mov    0x8(%ebp),%eax
    1205:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
	}
	lock_release(&s->lock);
    120c:	8b 45 08             	mov    0x8(%ebp),%eax
    120f:	89 04 24             	mov    %eax,(%esp)
    1212:	e8 a7 fc ff ff       	call   ebe <lock_release>

    1217:	c9                   	leave  
    1218:	c3                   	ret    
